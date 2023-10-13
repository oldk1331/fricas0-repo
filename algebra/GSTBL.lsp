
(/VERSIONCHECK 2) 

(DEFUN |GSTBL;elt;$KeyEntry;1| (|t| |k| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |k| |t| (QREFELT $ 12)) |GSTBL;elt;$KeyEntry;1|)
          (EXIT (COND ((QEQCAR |u| 1) (QREFELT $ 9)) ('T (QCDR |u|)))))))) 

(DEFUN |GSTBL;setelt;$Key2Entry;2| (|t| |k| |e| $)
  (SEQ
   (COND
    ((SPADCALL |e| (QREFELT $ 9) (QREFELT $ 15))
     (SEQ (SPADCALL |k| |t| (QREFELT $ 16)) (EXIT |e|)))
    ('T (SPADCALL |t| |k| |e| (QREFELT $ 17)))))) 

(DEFUN |GSTBL;search;Key$U;3| (|k| |t| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |k| |t| (QREFELT $ 12)) |GSTBL;search;Key$U;3|)
          (EXIT (COND ((QEQCAR |u| 1) (CONS 0 (QREFELT $ 9))) ('T |u|))))))) 

(DEFUN |GeneralSparseTable| (&REST #1=#:G183)
  (PROG ()
    (RETURN
     (PROG (#2=#:G184)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralSparseTable|)
                                           '|domainEqualList|)
                . #3=(|GeneralSparseTable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GeneralSparseTable;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GeneralSparseTable|))))))))))) 

(DEFUN |GeneralSparseTable;| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G182 |pv$| #2=#:G180 #3=#:G181 $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|GeneralSparseTable|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT DV$3 (|devaluate| |#3|) . #4#)
      (LETT DV$4 (|devaluate| |#4|) . #4#)
      (LETT |dv$| (LIST '|GeneralSparseTable| DV$1 DV$2 DV$3 DV$4) . #4#)
      (LETT $ (GETREFV 41) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| |#1|)
                                                     (|:| |entry| |#2|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Record| (|:| |key| |#1|)
                                                           (|:| |entry| |#2|))
                                                 '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            (LIST '|Evalable|
                                                  (LIST '|Record|
                                                        (LIST '|:| '|key|
                                                              (|devaluate|
                                                               |#1|))
                                                        (LIST '|:| '|entry|
                                                              (|devaluate|
                                                               |#2|)))))
                                           #3#)
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| |#2|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                           #2#)
                                          (OR #2# #3#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #2#
                                           (|HasCategory|
                                            (|Record| (|:| |key| |#1|)
                                                      (|:| |entry| |#2|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #3#)))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|GeneralSparseTable|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 5 |#3|)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #1# #3# (|augmentPredVector| $ 1024))
      (AND #2# #1# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 |#3|)
      $)))) 

(MAKEPROP '|GeneralSparseTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#3|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|Union| 7 '"failed")
              (0 . |search|) |GSTBL;elt;$KeyEntry;1| (|Boolean|) (6 . =)
              (12 . |remove!|) (18 . |setelt|) |GSTBL;setelt;$Key2Entry;2|
              |GSTBL;search;Key$U;3| (|Record| (|:| |key| 6) (|:| |entry| 7))
              (|List| 20) (|List| 23) (|Equation| 20) (|Mapping| 20 20 20)
              (|NonNegativeInteger|) (|Equation| 7) (|List| 26) (|List| 7)
              (|OutputForm|) (|String|) (|SingleInteger|) (|InputForm|)
              (|Mapping| 14 7) (|Mapping| 14 20) (|Mapping| 7 7) (|Void|)
              (|Mapping| 20 20) (|Mapping| 7 7 7) (|List| 6)
              (|Union| 20 '"failed"))
           '#(~= 25 |table| 31 |swap!| 40 |size?| 47 |setelt| 53 |select!| 60
              |select| 66 |search| 72 |sample| 78 |removeDuplicates| 82
              |remove!| 87 |remove| 105 |reduce| 117 |qsetelt!| 138 |qelt| 145
              |parts| 151 |more?| 161 |minIndex| 167 |members| 172 |member?|
              182 |maxIndex| 194 |map!| 199 |map| 211 |less?| 230 |latex| 236
              |keys| 241 |key?| 246 |inspect| 252 |insert!| 257 |indices| 263
              |index?| 268 |hash| 274 |first| 279 |find| 284 |fill!| 290
              |extract!| 296 |every?| 301 |eval| 313 |eq?| 365 |entry?| 371
              |entries| 377 |empty?| 382 |empty| 387 |elt| 391 |dictionary| 404
              |count| 413 |copy| 437 |convert| 442 |construct| 447 |coerce| 452
              |bag| 457 |any?| 462 = 474 |#| 480)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 0 0 3 7 8 0 0 0 3 1 7 8 9))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |EltableAggregate&| |Aggregate&| |Evalable&| |Evalable&|
                |SetCategory&| NIL NIL NIL |InnerEvalable&| NIL
                |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|EltableAggregate| 6 7) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|Eltable| 6 7) (|Type|)
                 (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 32) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 29))
              (|makeByteWordVec2| 40
                                  '(2 10 11 6 0 12 2 7 14 0 0 15 2 0 11 6 0 16
                                    3 10 7 0 6 7 17 2 8 14 0 0 1 1 0 0 21 1 0 0
                                    0 1 3 13 36 0 6 6 1 2 0 14 0 25 1 3 0 7 0 6
                                    7 18 2 10 0 34 0 1 2 10 0 34 0 1 2 0 11 6 0
                                    19 0 0 0 1 1 11 0 0 1 2 10 0 20 0 1 2 10 0
                                    34 0 1 2 0 11 6 0 16 2 11 0 20 0 1 2 10 0
                                    34 0 1 4 11 20 24 0 20 20 1 2 10 20 24 0 1
                                    3 10 20 24 0 20 1 3 13 7 0 6 7 1 2 0 7 0 6
                                    1 1 10 28 0 1 1 10 21 0 1 2 0 14 0 25 1 1 4
                                    6 0 1 1 10 28 0 1 1 10 21 0 1 2 11 14 20 0
                                    1 2 12 14 7 0 1 1 4 6 0 1 2 13 0 35 0 1 2
                                    13 0 37 0 1 3 0 0 38 0 0 1 2 0 0 35 0 1 2 0
                                    0 37 0 1 2 0 14 0 25 1 1 8 30 0 1 1 0 39 0
                                    1 2 0 14 6 0 1 1 0 20 0 1 2 0 0 20 0 1 1 0
                                    39 0 1 2 0 14 6 0 1 1 8 31 0 1 1 4 7 0 1 2
                                    0 40 34 0 1 2 13 0 0 7 1 1 0 20 0 1 2 10 14
                                    33 0 1 2 10 14 34 0 1 3 3 0 0 20 20 1 3 3 0
                                    0 21 21 1 2 3 0 0 22 1 2 3 0 0 23 1 2 7 0 0
                                    26 1 2 7 0 0 27 1 3 7 0 0 28 28 1 3 7 0 0 7
                                    7 1 2 0 14 0 0 1 2 12 14 7 0 1 1 0 28 0 1 1
                                    0 14 0 1 0 0 0 1 3 0 7 0 6 7 1 2 0 7 0 6 13
                                    1 0 0 21 1 0 0 0 1 2 11 25 20 0 1 2 12 25 7
                                    0 1 2 10 25 33 0 1 2 10 25 34 0 1 1 0 0 0 1
                                    1 1 32 0 1 1 0 0 21 1 1 5 29 0 1 1 0 0 21 1
                                    2 10 14 33 0 1 2 10 14 34 0 1 2 8 14 0 0 1
                                    1 10 25 0 1)))))
           '|lookupComplete|)) 
