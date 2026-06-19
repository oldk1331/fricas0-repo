
(SDEFUN |KAFILE;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT % 11))) 

(SDEFUN |KAFILE;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |f| 0) (QREFELT % 14))) 

(SDEFUN |KAFILE;open;Fn%;3| ((|fname| (|FileName|)) (% (%)))
        (SPADCALL |fname| "either" (QREFELT % 17))) 

(SDEFUN |KAFILE;openIfCan;FnSU;4|
        ((|fname| (|FileName|)) (|mode| (|String|))
         (% (|Union| % #1="failed")))
        (SPROG
         ((|res1| (|Union| % #1#))
          (|res0| (|Union| (|BasicKeyedAccessFile|) "failed")))
         (SEQ
          (COND
           ((EQUAL |mode| "either")
            (SEQ (LETT |res1| (SPADCALL |fname| "input" (QREFELT % 20)))
                 (EXIT
                  (COND ((QEQCAR |res1| 0) |res1|)
                        (#2='T
                         (SEQ
                          (LETT |res1|
                                (SPADCALL |fname| "output" (QREFELT % 20)))
                          (EXIT
                           (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                                 (#2#
                                  (CONS 0
                                        (SPADCALL (QCDR |res1|) "input"
                                                  (QREFELT % 21))))))))))))
           (#2#
            (SEQ (LETT |res0| (SPADCALL |fname| |mode| (QREFELT % 23)))
                 (EXIT
                  (COND ((QEQCAR |res0| 1) (CONS 1 "failed"))
                        (#2#
                         (CONS 0
                               (VECTOR |fname| (QCDR |res0|) |mode| 0))))))))))) 

(SDEFUN |KAFILE;open;FnS%;5|
        ((|fname| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|res1| (|Union| % "failed")))
               (SEQ (LETT |res1| (SPADCALL |fname| |mode| (QREFELT % 20)))
                    (EXIT
                     (COND
                      ((QEQCAR |res1| 1)
                       (|error|
                        (LIST '|mathprint|
                              (LIST 'CONCAT
                                    (SPADCALL "Can not open: " (QREFELT % 24))
                                    (SPADCALL |mode| (QREFELT % 24))))))
                      ('T (QCDR |res1|))))))) 

(SDEFUN |KAFILE;reopen!;%S%;6| ((|f| (%)) (|mode| (|String|)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 25))
             (COND
              ((SPADCALL |mode| "closed" (QREFELT % 26))
               (SEQ
                (QSETVELT |f| 1 (SPADCALL (QVELT |f| 0) |mode| (QREFELT % 27)))
                (EXIT (QSETVELT |f| 2 |mode|)))))
             (EXIT |f|))) 

(SDEFUN |KAFILE;close!;2%;7| ((|f| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "closed" (QREFELT % 26))
           (SEQ (SPADCALL (QVELT |f| 1) (QREFELT % 29))
                (EXIT (QSETVELT |f| 2 "closed")))))
         (EXIT |f|))) 

(SDEFUN |KAFILE;read!;%R;8|
        ((|f| (%)) (% (|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|))))
        (SPROG ((|ks| (|List| (|String|))) (|k| (|String|)))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 26))
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "File not in read state"
                                         (QREFELT % 24))
                               (SPADCALL |f| (QREFELT % 15))))))
                 (#1='T
                  (SEQ (LETT |ks| (SPADCALL (QVELT |f| 1) (QREFELT % 31)))
                       (EXIT
                        (COND
                         ((< (LENGTH |ks|) (QVELT |f| 3))
                          (|error|
                           (LIST '|mathprint|
                                 (LIST 'CONCAT
                                       (SPADCALL
                                        "Attempt to read beyond end of file"
                                        (QREFELT % 24))
                                       (SPADCALL |f| (QREFELT % 15))))))
                         (#1#
                          (SEQ
                           (LETT |k|
                                 (SPADCALL |ks| (QVELT |f| 3) (QREFELT % 33)))
                           (QSETVELT |f| 3 (+ (QVELT |f| 3) 1))
                           (EXIT
                            (CONS |k|
                                  (SPADCALL (QVELT |f| 1) |k|
                                            (QREFELT % 35)))))))))))))) 

(SDEFUN |KAFILE;write!;%2R;9|
        ((|f| (%))
         (|pr| #1=(|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|)))
         (% #1#))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 26))
           (|error|
            (LIST '|mathprint|
                  (LIST 'CONCAT
                        (SPADCALL "File not in write state" (QREFELT % 24))
                        (SPADCALL |f| (QREFELT % 15))))))
          ('T
           (SEQ (SPADCALL (QVELT |f| 1) (QCAR |pr|) (QCDR |pr|) (QREFELT % 38))
                (EXIT |pr|)))))) 

(MAKEPROP '|KAFILE;name;%Fn;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |KAFILE;name;%Fn;10| ((|f| (%)) (% (|FileName|))) (QVELT |f| 0)) 

(MAKEPROP '|KAFILE;iomode;%S;11| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |KAFILE;iomode;%S;11| ((|f| (%)) (% (|String|))) (QVELT |f| 2)) 

(SDEFUN |KAFILE;empty;%;12| ((% (%)))
        (SPROG ((|fn| (|FileName|)))
               (SEQ (LETT |fn| (SPADCALL "" "kaf" "sdata" (QREFELT % 42)))
                    (EXIT (SPADCALL |fn| (QREFELT % 18)))))) 

(SDEFUN |KAFILE;keys;%L;13| ((|f| (%)) (% (|List| (|String|))))
        (SEQ (SPADCALL |f| "input" (QREFELT % 21))
             (EXIT (SPADCALL (QVELT |f| 1) (QREFELT % 31))))) 

(SDEFUN |KAFILE;#;%Nni;14| ((|f| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |f| (QREFELT % 44)))) 

(SDEFUN |KAFILE;elt;%SEntry;15| ((|f| (%)) (|k| (|String|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "input" (QREFELT % 21))
             (EXIT (SPADCALL (QVELT |f| 1) |k| (QREFELT % 35))))) 

(SDEFUN |KAFILE;setelt!;%S2Entry;16|
        ((|f| (%)) (|k| (|String|)) (|e| (|Entry|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "output" (QREFELT % 21))
             (UNWIND-PROTECT (SPADCALL |f| (CONS |k| |e|) (QREFELT % 39))
               (SPADCALL |f| (QREFELT % 25)))
             (SPADCALL |f| (QREFELT % 25)) (EXIT |e|))) 

(SDEFUN |KAFILE;search;S%U;17|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| "failed")))
        (SEQ
         (COND
          ((NULL (SPADCALL |k| (SPADCALL |f| (QREFELT % 44)) (QREFELT % 49)))
           (CONS 1 "failed"))
          ('T
           (SEQ (SPADCALL |f| "input" (QREFELT % 21))
                (EXIT (CONS 0 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 35))))))))) 

(SDEFUN |KAFILE;remove!;S%U;18|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| #1="failed")))
        (SPROG ((|result| (|Union| |Entry| #1#)))
               (SEQ (LETT |result| (SPADCALL |k| |f| (QREFELT % 51)))
                    (EXIT
                     (COND ((QEQCAR |result| 1) |result|)
                           ('T
                            (SEQ (SPADCALL |f| "output" (QREFELT % 21))
                                 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 52))
                                 (SPADCALL |f| (QREFELT % 25))
                                 (EXIT |result|)))))))) 

(SDEFUN |KAFILE;pack!;2%;19| ((|f| (%)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 25)) (EXIT |f|))) 

(DECLAIM (NOTINLINE |KeyedAccessFile;|)) 

(DEFUN |KeyedAccessFile;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G128 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|KeyedAccessFile| DV$1))
          (LETT % (GETREFV 71))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                (LIST '|Evalable|
                                                      (LIST '|Record|
                                                            '(|:| |key|
                                                                  (|String|))
                                                            (LIST '|:| '|entry|
                                                                  (|devaluate|
                                                                   |#1|)))))
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                '(|SetCategory|)))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              (|HasCategory| (|String|)
                                                             '(|OrderedSet|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|BasicType|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|OrderedSet|))))))
          (|haddProp| |$ConstructorCache| '|KeyedAccessFile| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 256))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 512))
          (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
               (|augmentPredVector| % 1024))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| % 2048))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|BasicType|))
               (|augmentPredVector| % 4096))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|OrderedSet|))
               (|augmentPredVector| % 8192))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |car| (|SExpression|))
                              (|:| |cdr| (|SExpression|))))
          (QSETREFV % 8
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|BasicKeyedAccessFile|))
                              (|:| |fileIOmode| (|String|))
                              (|:| |rpos| (|Integer|))))
          %))) 

(DEFUN |KeyedAccessFile| (#1=#:G129)
  (SPROG NIL
         (PROG (#2=#:G130)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|KeyedAccessFile|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|KeyedAccessFile;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|KeyedAccessFile|)))))))))) 

(MAKEPROP '|KeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Cons| '|Rep| (|Boolean|)
              (|FileName|) (0 . =) |KAFILE;=;2%B;1| (|OutputForm|)
              (6 . |coerce|) |KAFILE;coerce;%Of;2| (|String|)
              |KAFILE;open;FnS%;5| |KAFILE;open;Fn%;3| (|Union| % '"failed")
              |KAFILE;openIfCan;FnSU;4| |KAFILE;reopen!;%S%;6|
              (|BasicKeyedAccessFile|) (11 . |openIfCan|) (17 . |coerce|)
              |KAFILE;close!;2%;7| (22 . ~=) (28 . |open|) (|Void|)
              (34 . |close!|) (|List| 16) (39 . |keys|) (|Integer|)
              (44 . |elt|) (|None|) (50 . |read|)
              (|Record| (|:| |key| 16) (|:| |entry| 6)) |KAFILE;read!;%R;8|
              (56 . |write!|) |KAFILE;write!;%2R;9| |KAFILE;name;%Fn;10|
              |KAFILE;iomode;%S;11| (63 . |new|) |KAFILE;empty;%;12|
              |KAFILE;keys;%L;13| (|NonNegativeInteger|) |KAFILE;#;%Nni;14|
              |KAFILE;elt;%SEntry;15| |KAFILE;setelt!;%S2Entry;16|
              (70 . |member?|) (|Union| 6 '"failed") |KAFILE;search;S%U;17|
              (76 . |remove!|) |KAFILE;remove!;S%U;18| |KAFILE;pack!;2%;19|
              (|List| 36) (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 6)
              (|Union| 36 '"failed") (|Mapping| 9 36) (|Mapping| 36 36)
              (|Mapping| 36 36 36) (|List| 64) (|Equation| 6) (|List| 66)
              (|Equation| 36) (|Mapping| 9 6) (|Mapping| 9 6 6)
              (|Mapping| 9 36 36) (|InputForm|))
           '#(~= 82 |write!| 88 |table| 94 |swap!| 103 |size?| 110 |setelt!|
              116 |select!| 123 |select| 129 |search| 135 |sample| 141
              |reopen!| 145 |removeDuplicates| 151 |remove!| 156 |remove| 174
              |reduce| 186 |read!| 207 |qsetelt!| 212 |qelt| 219 |parts| 225
              |pack!| 235 |openIfCan| 240 |open| 251 |name| 262 |more?| 267
              |minIndex| 273 |min| 278 |members| 288 |member?| 298 |maxIndex|
              310 |max| 315 |map!| 337 |map| 349 |less?| 368 |latex| 374 |keys|
              379 |key?| 384 |iomode| 390 |inspect| 395 |insert!| 400 |indices|
              406 |index?| 411 |flush| 417 |first| 422 |find| 427 |fill!| 433
              |extract!| 439 |every?| 444 |eval| 456 |eq?| 508 |entry?| 514
              |entries| 520 |empty?| 525 |empty| 530 |elt| 534 |dictionary| 547
              |count| 556 |copy| 580 |convert| 585 |construct| 590 |coerce| 595
              |close!| 600 |any?| 605 = 617 |#| 623)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 3 2 1 0 0 0 0 0
                                  0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| NIL |Evalable&| |Evalable&|
                |Aggregate&| |EltableAggregate&| |SetCategory&|
                |InnerEvalable&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL
                |BasicType&|)
             (CONS
              '#((|TableAggregate| 16 6) (|KeyedDictionary| 16 6)
                 (|Dictionary| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Collection| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|IndexedAggregate| 16 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|FileCategory| 10 (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Evalable| 6)
                 (|Evalable| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Aggregate|) (|EltableAggregate| 16 6) (|SetCategory|)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 70)
                 (|InnerEvalable| (|Record| (|:| |key| 16) (|:| |entry| 6))
                                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|CoercibleTo| 13) (|Type|) (|shallowlyMutable|)
                 (|Eltable| 16 6) (|finiteAggregate|) (|BasicType|))
              (|makeByteWordVec2| 70
                                  '(2 10 9 0 0 11 1 10 13 0 14 2 22 19 10 16 23
                                    1 16 13 0 24 2 16 9 0 0 26 2 22 0 10 16 27
                                    1 22 28 0 29 1 22 30 0 31 2 30 16 0 32 33 2
                                    22 34 0 16 35 3 22 28 0 16 34 38 3 10 0 16
                                    16 16 42 2 30 9 16 0 49 2 22 28 0 16 52 2 0
                                    9 0 0 1 2 0 36 0 36 39 1 0 0 55 1 0 0 0 1 3
                                    9 28 0 16 16 1 2 0 9 0 45 1 3 0 6 0 16 6 48
                                    2 10 0 60 0 1 2 10 0 60 0 1 2 0 50 16 0 51
                                    0 0 0 1 2 0 0 0 16 21 1 13 0 0 1 2 0 50 16
                                    0 53 2 13 0 36 0 1 2 10 0 60 0 1 2 13 0 36
                                    0 1 2 10 0 60 0 1 4 13 36 62 0 36 36 1 2 10
                                    36 62 0 1 3 10 36 62 0 36 1 1 0 36 0 37 3 9
                                    6 0 16 6 1 2 0 6 0 16 1 1 10 58 0 1 1 10 55
                                    0 1 1 0 0 0 54 1 0 19 10 1 2 0 19 10 16 20
                                    1 0 0 10 18 2 0 0 10 16 17 1 0 10 0 40 2 0
                                    9 0 45 1 1 6 16 0 1 1 11 6 0 1 1 14 36 0 1
                                    1 10 58 0 1 1 10 55 0 1 2 12 9 6 0 1 2 13 9
                                    36 0 1 1 6 16 0 1 1 11 6 0 1 1 14 36 0 1 2
                                    10 6 68 0 1 2 10 36 69 0 1 2 9 0 57 0 1 2 9
                                    0 61 0 1 3 0 0 56 0 0 1 2 0 0 57 0 1 2 0 0
                                    61 0 1 2 0 9 0 45 1 1 0 16 0 1 1 0 30 0 44
                                    2 0 9 16 0 1 1 0 16 0 41 1 0 36 0 1 2 0 0
                                    36 0 1 1 0 30 0 1 2 0 9 16 0 1 1 0 28 0 1 1
                                    6 6 0 1 2 0 59 60 0 1 2 9 0 0 6 1 1 0 36 0
                                    1 2 10 9 67 0 1 2 10 9 60 0 1 2 3 0 0 63 1
                                    2 3 0 0 64 1 3 3 0 0 58 58 1 3 3 0 0 6 6 1
                                    3 1 0 0 55 55 1 3 1 0 0 36 36 1 2 1 0 0 65
                                    1 2 1 0 0 66 1 2 0 9 0 0 1 2 12 9 6 0 1 1 0
                                    58 0 1 1 0 9 0 1 0 0 0 43 3 0 6 0 16 6 1 2
                                    0 6 0 16 47 1 0 0 55 1 0 0 0 1 2 12 45 6 0
                                    1 2 13 45 36 0 1 2 10 45 67 0 1 2 10 45 60
                                    0 1 1 0 0 0 1 1 2 70 0 1 1 0 0 55 1 1 0 13
                                    0 15 1 0 0 0 25 2 10 9 67 0 1 2 10 9 60 0 1
                                    2 0 9 0 0 12 1 10 45 0 46)))))
           '|lookupComplete|)) 
