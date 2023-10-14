
(SDEFUN |KAFILE;defstream|
        ((|fn| |FileName|) (|mode| |String|) ($ |SExpression|))
        (COND
         ((EQUAL |mode| "input") (|rMkIstream| (SPADCALL |fn| (QREFELT $ 11))))
         ((EQUAL |mode| "output")
          (|rMkOstream| (SPADCALL |fn| (QREFELT $ 11))))
         ('T
          (|error|
           (LIST "IO mode must be input or output"
                 (SPADCALL |mode| (QREFELT $ 13))))))) 

(SDEFUN |KAFILE;=;2$B;2| ((|f1| $) (|f2| $) ($ |Boolean|))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT $ 15))) 

(SDEFUN |KAFILE;coerce;$Of;3| ((|f| $) ($ |OutputForm|))
        (SPADCALL (QVELT |f| 0) (QREFELT $ 17))) 

(SDEFUN |KAFILE;open;Fn$;4| ((|fname| |FileName|) ($ $))
        (SPADCALL |fname| "either" (QREFELT $ 19))) 

(SDEFUN |KAFILE;open;FnS$;5| ((|fname| |FileName|) (|mode| |String|) ($ $))
        (COND
         ((EQUAL |mode| "either")
          (COND
           ((SPADCALL |fname| (QREFELT $ 21))
            (SPADCALL |fname| "input" (QREFELT $ 19)))
           (#1='T
            (SPADCALL (SPADCALL |fname| "output" (QREFELT $ 19)) "input"
                      (QREFELT $ 22)))))
         (#1# (VECTOR |fname| (|KAFILE;defstream| |fname| |mode| $) |mode|)))) 

(SDEFUN |KAFILE;reopen!;$S$;6| ((|f| $) (|mode| |String|) ($ $))
        (SEQ (SPADCALL |f| (QREFELT $ 23))
             (COND
              ((SPADCALL |mode| "closed" (QREFELT $ 24))
               (SEQ
                (QSETVELT |f| 1 (|KAFILE;defstream| (QVELT |f| 0) |mode| $))
                (EXIT (QSETVELT |f| 2 |mode|)))))
             (EXIT |f|))) 

(SDEFUN |KAFILE;close!;2$;7| ((|f| $) ($ $))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "closed" (QREFELT $ 24))
           (SEQ (RSHUT (QVELT |f| 1)) (EXIT (QSETVELT |f| 2 "closed")))))
         (EXIT |f|))) 

(SDEFUN |KAFILE;read!;$R;8|
        ((|f| $) ($ |Record| (|:| |key| (|String|)) (|:| |entry| |Entry|)))
        (SPROG ((|k| (|String|)) (|ix| (|Integer|)) (|ks| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT $ 24))
                  (|error|
                   (LIST "File not in read state"
                         (SPADCALL |f| (QREFELT $ 18)))))
                 (#1='T
                  (SEQ
                   (LETT |ks| (RKEYIDS (QVELT |f| 0))
                         . #2=(|KAFILE;read!;$R;8|))
                   (EXIT
                    (COND
                     ((NULL |ks|)
                      (|error|
                       (LIST "Attempt to read empty file"
                             (SPADCALL |f| (QREFELT $ 18)))))
                     (#1#
                      (SEQ (LETT |ix| (RANDOM (LENGTH |ks|)) . #2#)
                           (LETT |k|
                                 (PNAME (SPADCALL |ks| |ix| (QREFELT $ 28)))
                                 . #2#)
                           (EXIT
                            (CONS |k| (SPADRREAD |k| (QVELT |f| 1)))))))))))))) 

(SDEFUN |KAFILE;write!;$2R;9|
        ((|f| $)
         (|pr| . #1=(|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|)))
         ($ . #1#))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT $ 24))
           (|error|
            (LIST "File not in write state" (SPADCALL |f| (QREFELT $ 18)))))
          ('T
           (SEQ (SPADRWRITE (QCAR |pr|) (QCDR |pr|) (QVELT |f| 1))
                (EXIT |pr|)))))) 

(PUT '|KAFILE;name;$Fn;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |KAFILE;name;$Fn;10| ((|f| $) ($ |FileName|)) (QVELT |f| 0)) 

(PUT '|KAFILE;iomode;$S;11| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |KAFILE;iomode;$S;11| ((|f| $) ($ |String|)) (QVELT |f| 2)) 

(SDEFUN |KAFILE;empty;$;12| (($ $))
        (SPROG ((|fn| (|FileName|)))
               (SEQ
                (LETT |fn| (SPADCALL "" "kaf" "sdata" (QREFELT $ 34))
                      |KAFILE;empty;$;12|)
                (EXIT (SPADCALL |fn| (QREFELT $ 20)))))) 

(SDEFUN |KAFILE;keys;$L;13| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G162 NIL) (|n| NIL) (#2=#:G161 NIL)
          (|l| (|List| (|SExpression|))))
         (SEQ (SPADCALL |f| (QREFELT $ 23))
              (LETT |l| (RKEYIDS (QVELT |f| 0)) . #3=(|KAFILE;keys;$L;13|))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |n| NIL . #3#) (LETT #1# |l| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #2# (CONS (PNAME |n|) #2#) . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |KAFILE;#;$Nni;14| ((|f| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |f| (QREFELT $ 37)))) 

(SDEFUN |KAFILE;elt;$SEntry;15| ((|f| $) (|k| |String|) ($ |Entry|))
        (SEQ (SPADCALL |f| "input" (QREFELT $ 22))
             (EXIT (SPADRREAD |k| (QVELT |f| 1))))) 

(SDEFUN |KAFILE;setelt;$S2Entry;16|
        ((|f| $) (|k| |String|) (|e| |Entry|) ($ |Entry|))
        (SEQ (SPADCALL |f| "output" (QREFELT $ 22))
             (UNWIND-PROTECT (SPADCALL |f| (CONS |k| |e|) (QREFELT $ 31))
               (SPADCALL |f| (QREFELT $ 23)))
             (SPADCALL |f| (QREFELT $ 23)) (EXIT |e|))) 

(SDEFUN |KAFILE;search;S$U;17|
        ((|k| |String|) (|f| $) ($ |Union| |Entry| "failed"))
        (SEQ
         (COND
          ((NULL (SPADCALL |k| (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 42)))
           (CONS 1 "failed"))
          ('T
           (SEQ (SPADCALL |f| "input" (QREFELT $ 22))
                (EXIT (CONS 0 (SPADRREAD |k| (QVELT |f| 1))))))))) 

(SDEFUN |KAFILE;remove!;S$U;18|
        ((|k| |String|) (|f| $) ($ |Union| |Entry| #1="failed"))
        (SPROG ((|result| (|Union| |Entry| #1#)))
               (SEQ
                (LETT |result| (SPADCALL |k| |f| (QREFELT $ 44))
                      |KAFILE;remove!;S$U;18|)
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       ('T
                        (SEQ (SPADCALL |f| (QREFELT $ 23))
                             (RDROPITEMS (NAMESTRING (QVELT |f| 0)) (LIST |k|))
                             (EXIT |result|)))))))) 

(SDEFUN |KAFILE;pack!;2$;19| ((|f| $) ($ $))
        (SEQ (SPADCALL |f| (QREFELT $ 23)) (EXIT |f|))) 

(DECLAIM (NOTINLINE |KeyedAccessFile;|)) 

(DEFUN |KeyedAccessFile| (#1=#:G223)
  (SPROG NIL
         (PROG (#2=#:G224)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|KeyedAccessFile|)
                                               '|domainEqualList|)
                    . #3=(|KeyedAccessFile|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|KeyedAccessFile;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|KeyedAccessFile|)))))))))) 

(DEFUN |KeyedAccessFile;| (|#1|)
  (SPROG
   ((#1=#:G222 NIL) (|pv$| NIL) (#2=#:G221 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|KeyedAccessFile|))
    (LETT |dv$| (LIST '|KeyedAccessFile| DV$1) . #3#)
    (LETT $ (GETREFV 64) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| |#1|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      '(|:| |key| (|String|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#1|)))))
                                         (|HasCategory|
                                          (|Record| (|:| |key| (|String|))
                                                    (|:| |entry| |#1|))
                                          '(|SetCategory|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| |#1|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #3#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (|HasCategory| (|String|)
                                                       '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| (|String|))
                                                   (|:| |entry| |#1|))
                                         '(|BasicType|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|KeyedAccessFile| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 128))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #3#)
         (|augmentPredVector| $ 256))
    (AND (|HasCategory| |#1| '(|BasicType|)) #1# (|augmentPredVector| $ 512))
    (AND #2# #1# (|augmentPredVector| $ 1024))
    (AND #1#
         (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                        '(|BasicType|))
         (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|Record| (|:| |car| (|SExpression|))
                        (|:| |cdr| (|SExpression|))))
    (QSETREFV $ 8
              (|Record| (|:| |fileName| (|FileName|))
                        (|:| |fileState| (|SExpression|))
                        (|:| |fileIOmode| (|String|))))
    $))) 

(MAKEPROP '|KeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Cons| '|Rep| (|String|)
              (|FileName|) (0 . |coerce|) (|OutputForm|) (5 . |coerce|)
              (|Boolean|) (10 . =) |KAFILE;=;2$B;2| (16 . |coerce|)
              |KAFILE;coerce;$Of;3| |KAFILE;open;FnS$;5| |KAFILE;open;Fn$;4|
              (21 . |exists?|) |KAFILE;reopen!;$S$;6| |KAFILE;close!;2$;7|
              (26 . ~=) (|Symbol|) (|Integer|) (|List| 25) (32 . |elt|)
              (|Record| (|:| |key| 9) (|:| |entry| 6)) |KAFILE;read!;$R;8|
              |KAFILE;write!;$2R;9| |KAFILE;name;$Fn;10| |KAFILE;iomode;$S;11|
              (38 . |new|) |KAFILE;empty;$;12| (|List| 9) |KAFILE;keys;$L;13|
              (|NonNegativeInteger|) |KAFILE;#;$Nni;14| |KAFILE;elt;$SEntry;15|
              |KAFILE;setelt;$S2Entry;16| (45 . |member?|)
              (|Union| 6 '"failed") |KAFILE;search;S$U;17|
              |KAFILE;remove!;S$U;18| |KAFILE;pack!;2$;19| (|List| 48)
              (|Equation| 29) (|List| 29) (|Mapping| 29 29 29) (|List| 6)
              (|Equation| 6) (|List| 52) (|InputForm|) (|Mapping| 14 29)
              (|Mapping| 14 6) (|Mapping| 29 29) (|Void|) (|Mapping| 6 6)
              (|Union| 29 '"failed") (|Mapping| 6 6 6) (|SingleInteger|)
              (|HashState|))
           '#(~= 51 |write!| 57 |table| 63 |swap!| 72 |size?| 79 |setelt| 85
              |select!| 92 |select| 98 |search| 104 |sample| 110 |reopen!| 114
              |removeDuplicates| 120 |remove!| 125 |remove| 143 |reduce| 155
              |read!| 176 |qsetelt!| 181 |qelt| 188 |parts| 194 |pack!| 204
              |open| 209 |name| 220 |more?| 225 |minIndex| 231 |members| 236
              |member?| 246 |maxIndex| 258 |map!| 263 |map| 275 |less?| 294
              |latex| 300 |keys| 305 |key?| 310 |iomode| 316 |inspect| 321
              |insert!| 326 |indices| 332 |index?| 337 |hashUpdate!| 343 |hash|
              349 |flush| 354 |first| 359 |find| 364 |fill!| 370 |extract!| 376
              |every?| 381 |eval| 393 |eq?| 445 |entry?| 451 |entries| 457
              |empty?| 462 |empty| 467 |elt| 471 |dictionary| 484 |count| 493
              |copy| 517 |convert| 522 |construct| 527 |coerce| 532 |close!|
              537 |any?| 542 = 554 |#| 560)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 1 2
                                  5))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| NIL |HomogeneousAggregate&|
                |HomogeneousAggregate&| |SetCategory&| |EltableAggregate&|
                |Aggregate&| |Evalable&| |Evalable&| |BasicType&| NIL NIL NIL
                NIL NIL |InnerEvalable&| NIL |InnerEvalable&|)
             (CONS
              '#((|TableAggregate| 9 6) (|KeyedDictionary| 9 6)
                 (|Dictionary| (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|IndexedAggregate| 9 6)
                 (|Collection| (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|FileCategory| 10 (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|SetCategory|) (|EltableAggregate| 9 6) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|Evalable| 6) (|BasicType|) (|finiteAggregate|)
                 (|Eltable| 9 6) (|shallowlyMutable|) (|Type|)
                 (|CoercibleTo| 12)
                 (|InnerEvalable| (|Record| (|:| |key| 9) (|:| |entry| 6))
                                  (|Record| (|:| |key| 9) (|:| |entry| 6)))
                 (|ConvertibleTo| 54) (|InnerEvalable| 6 6))
              (|makeByteWordVec2| 63
                                  '(1 10 9 0 11 1 9 12 0 13 2 10 14 0 0 15 1 10
                                    12 0 17 1 10 14 0 21 2 9 14 0 0 24 2 27 25
                                    0 26 28 3 10 0 9 9 9 34 2 36 14 9 0 42 2 0
                                    14 0 0 1 2 0 29 0 29 31 0 0 0 1 1 0 0 49 1
                                    3 8 58 0 9 9 1 2 0 14 0 38 1 3 0 6 0 9 6 41
                                    2 9 0 55 0 1 2 9 0 55 0 1 2 0 43 9 0 44 0 0
                                    0 1 2 0 0 0 9 22 1 12 0 0 1 2 12 0 29 0 1 2
                                    9 0 55 0 1 2 0 43 9 0 45 2 12 0 29 0 1 2 9
                                    0 55 0 1 4 12 29 50 0 29 29 1 3 9 29 50 0
                                    29 1 2 9 29 50 0 1 1 0 29 0 30 3 8 6 0 9 6
                                    1 2 0 6 0 9 1 1 9 49 0 1 1 9 51 0 1 1 0 0 0
                                    46 1 0 0 10 20 2 0 0 10 9 19 1 0 10 0 32 2
                                    0 14 0 38 1 1 6 9 0 1 1 9 49 0 1 1 9 51 0 1
                                    2 12 14 29 0 1 2 10 14 6 0 1 1 6 9 0 1 2 8
                                    0 57 0 1 2 8 0 59 0 1 2 0 0 57 0 1 2 0 0 59
                                    0 1 3 0 0 61 0 0 1 2 0 14 0 38 1 1 0 9 0 1
                                    1 0 36 0 37 2 0 14 9 0 1 1 0 9 0 33 1 0 29
                                    0 1 2 0 0 29 0 1 1 0 36 0 1 2 0 14 9 0 1 2
                                    0 63 63 0 1 1 0 62 0 1 1 0 58 0 1 1 6 6 0 1
                                    2 0 60 55 0 1 2 8 0 0 6 1 1 0 29 0 1 2 9 14
                                    55 0 1 2 9 14 56 0 1 2 1 0 0 47 1 3 1 0 0
                                    29 29 1 2 1 0 0 48 1 3 1 0 0 49 49 1 3 5 0
                                    0 51 51 1 2 5 0 0 52 1 3 5 0 0 6 6 1 2 5 0
                                    0 53 1 2 0 14 0 0 1 2 11 14 6 0 1 1 0 51 0
                                    1 1 0 14 0 1 0 0 0 35 3 0 6 0 9 6 1 2 0 6 0
                                    9 40 0 0 0 1 1 0 0 49 1 2 12 38 29 0 1 2 10
                                    38 6 0 1 2 9 38 55 0 1 2 9 38 56 0 1 1 0 0
                                    0 1 1 2 54 0 1 1 0 0 49 1 1 0 12 0 18 1 0 0
                                    0 23 2 9 14 55 0 1 2 9 14 56 0 1 2 0 14 0 0
                                    16 1 9 38 0 39)))))
           '|lookupComplete|)) 
