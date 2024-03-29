
(DECLAIM (NOTINLINE |InnerTable;|)) 

(DEFUN |InnerTable| (&REST #1=#:G61)
  (SPROG NIL
         (PROG (#2=#:G62)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerTable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerTable;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerTable|)))))))))) 

(DEFUN |InnerTable;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G60 NIL) (#2=#:G59 NIL) (|pv$| NIL) (#3=#:G57 NIL) (#4=#:G58 NIL)
    (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|InnerTable| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 33))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|BasicType|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|))))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      (LIST '|:| '|key|
                                                            (|devaluate| |#1|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#2|)))))
                                         #3#)
                                        (OR (|HasCategory| |#2| '(|BasicType|))
                                            #4#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|BasicType|))
                                            #3#)
                                        (OR #4# #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #4#
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|CoercibleTo| (|OutputForm|)))
                                         #3#)
                                        (|HasCategory| |#2|
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|InnerTable| (LIST DV$1 DV$2 DV$3)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 5 |#3|)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (LETT #2# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 16384))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 32768))
    (AND #2#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|BasicType|))
         (|augmentPredVector| % 65536))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 131072))
    (AND
     (OR #1# #4#
         (AND #2#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|BasicType|)))
         #3#)
     (|augmentPredVector| % 262144))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #2#
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|InnerTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|local| |#3|) (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Record| (|:| |key| 6) (|:| |entry| 7))
              (|List| 9) (|List| 12) (|Equation| 9) (|Mapping| 9 9 9)
              (|NonNegativeInteger|) (|Boolean|) (|Equation| 7) (|List| 16)
              (|List| 7) (|OutputForm|) (|String|) (|InputForm|)
              (|Mapping| 15 7) (|Mapping| 15 7 7) (|Mapping| 15 9)
              (|Mapping| 15 9 9) (|Mapping| 7 7) (|Void|) (|Mapping| 9 9)
              (|Mapping| 7 7 7) (|List| 6) (|Union| 7 '"failed")
              (|Union| 9 '"failed"))
           '#(~= 0 |table| 6 |swap!| 15 |size?| 22 |setelt!| 28 |select!| 35
              |select| 41 |search| 47 |sample| 53 |removeDuplicates| 57
              |remove!| 62 |remove| 80 |reduce| 92 |qsetelt!| 113 |qelt| 120
              |parts| 126 |more?| 136 |minIndex| 142 |min| 147 |members| 157
              |member?| 167 |maxIndex| 179 |max| 184 |map!| 206 |map| 218
              |less?| 237 |latex| 243 |keys| 248 |key?| 253 |inspect| 259
              |insert!| 264 |indices| 270 |index?| 275 |first| 281 |find| 286
              |fill!| 292 |extract!| 298 |every?| 303 |eval| 315 |eq?| 367
              |entry?| 373 |entries| 379 |empty?| 384 |empty| 389 |elt| 393
              |dictionary| 406 |count| 415 |copy| 439 |convert| 444 |construct|
              449 |coerce| 454 |any?| 459 = 471 |#| 477)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 10 8 12 0 0 0 0 10 1 8
                                  11 13))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 6 7) (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7) (|EltableAggregate| 6 7)
                 (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 21) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 19))
              (|makeByteWordVec2| 32
                                  '(2 19 15 0 0 1 1 0 0 10 1 0 0 0 1 3 21 27 0
                                    6 6 1 2 0 15 0 14 1 3 0 7 0 6 7 1 2 15 0 24
                                    0 1 2 15 0 24 0 1 2 0 31 6 0 1 0 0 0 1 1 17
                                    0 0 1 2 17 0 9 0 1 2 15 0 24 0 1 2 0 31 6 0
                                    1 2 17 0 9 0 1 2 15 0 24 0 1 4 17 9 13 0 9
                                    9 1 2 15 9 13 0 1 3 15 9 13 0 9 1 3 21 7 0
                                    6 7 1 2 0 7 0 6 1 1 15 18 0 1 1 15 10 0 1 2
                                    0 15 0 14 1 1 4 6 0 1 1 16 9 0 1 1 20 7 0 1
                                    1 15 18 0 1 1 15 10 0 1 2 17 15 9 0 1 2 18
                                    15 7 0 1 1 4 6 0 1 1 16 9 0 1 1 20 7 0 1 2
                                    15 7 23 0 1 2 15 9 25 0 1 2 21 0 26 0 1 2
                                    21 0 28 0 1 3 0 0 29 0 0 1 2 0 0 26 0 1 2 0
                                    0 28 0 1 2 0 15 0 14 1 1 12 20 0 1 1 0 30 0
                                    1 2 0 15 6 0 1 1 0 9 0 1 2 0 0 9 0 1 1 0 30
                                    0 1 2 0 15 6 0 1 1 4 7 0 1 2 0 32 24 0 1 2
                                    21 0 0 7 1 1 0 9 0 1 2 15 15 22 0 1 2 15 15
                                    24 0 1 3 10 0 0 10 10 1 3 10 0 0 9 9 1 2 10
                                    0 0 11 1 2 10 0 0 12 1 2 8 0 0 16 1 2 8 0 0
                                    17 1 3 8 0 0 7 7 1 3 8 0 0 18 18 1 2 0 15 0
                                    0 1 2 18 15 7 0 1 1 0 18 0 1 1 0 15 0 1 0 0
                                    0 1 2 0 7 0 6 1 3 0 7 0 6 7 1 1 0 0 10 1 0
                                    0 0 1 2 17 14 9 0 1 2 18 14 7 0 1 2 15 14
                                    22 0 1 2 15 14 24 0 1 1 0 0 0 1 1 1 21 0 1
                                    1 0 0 10 1 1 5 19 0 1 2 15 15 22 0 1 2 15
                                    15 24 0 1 2 19 15 0 0 1 1 15 14 0 1)))))
           '|lookupComplete|)) 
