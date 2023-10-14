
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |StringTable;|)) 

(DEFUN |StringTable| (#1=#:G156)
  (PROG ()
    (RETURN
     (PROG (#2=#:G157)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StringTable|)
                                           '|domainEqualList|)
                . #3=(|StringTable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|StringTable;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|StringTable|))))))))))) 

(DEFUN |StringTable;| (|#1|)
  (PROG (#1=#:G155 #2=#:G154 |pv$| #3=#:G152 #4=#:G153 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|StringTable|))
      (LETT |dv$| (LIST '|StringTable| DV$1) . #5#)
      (LETT $ (GETREFV 31) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| (|String|))
                                                     (|:| |entry| |#1|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (|HasCategory|
                                           (|Record| (|:| |key| (|String|))
                                                     (|:| |entry| |#1|))
                                           '(|BasicType|))
                                          (|HasCategory| (|String|)
                                                         '(|OrderedSet|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #5#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #4#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| |#1|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (|HasCategory| |#1| '(|BasicType|))
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Record|
                                                  (|:| |key| (|String|))
                                                  (|:| |entry| |#1|))
                                                 '(|SetCategory|))
                                                . #5#)
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
                                           #3#)
                                          (OR
                                           (|HasCategory| |#1| '(|BasicType|))
                                           #4#
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| |#1|))
                                            '(|BasicType|))
                                           #3#)
                                          (OR #4# #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #4#
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| |#1|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #3#)))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|StringTable| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 4096))
      (AND #2#
           (|HasCategory| (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                          '(|BasicType|))
           (|augmentPredVector| $ 8192))
      (AND #4# #2# (|augmentPredVector| $ 16384))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|BasicType|))
                  (|HasCategory| $ '(|finiteAggregate|)))
             . #5#)
       (|augmentPredVector| $ 32768))
      (AND
       (OR #1# #4#
           (AND #2#
                (|HasCategory|
                 (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                 '(|BasicType|)))
           #3#)
       (|augmentPredVector| $ 65536))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 131072))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|StringTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|HashTable| 18 6 '"CVEC") (|local| |#1|)
              (|Record| (|:| |key| 18) (|:| |entry| 6)) (|List| 7)
              (|Equation| 7) (|List| 9) (|Mapping| 7 7 7)
              (|NonNegativeInteger|) (|Boolean|) (|Equation| 6) (|List| 14)
              (|List| 6) (|OutputForm|) (|String|) (|SingleInteger|)
              (|HashState|) (|InputForm|) (|Mapping| 13 6) (|Mapping| 13 7)
              (|Mapping| 6 6) (|Void|) (|Mapping| 7 7) (|Mapping| 6 6 6)
              (|List| 18) (|Union| 6 '"failed") (|Union| 7 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 0 0 9 5 11 0 0 0 0 9 1 5 10
                                  12))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |IndexedAggregate&|
                |Collection&| |HomogeneousAggregate&| |HomogeneousAggregate&|
                |EltableAggregate&| |Aggregate&| |Evalable&| |Evalable&|
                |SetCategory&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |InnerEvalable&| |BasicType&| NIL)
             (CONS
              '#((|TableAggregate| 18 6) (|KeyedDictionary| 18 6)
                 (|Dictionary| (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|IndexedAggregate| 18 6)
                 (|Collection| (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|EltableAggregate| 18 6) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|Evalable| 6) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 18 6) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 18) (|:| |entry| 6))
                                  (|Record| (|:| |key| 18) (|:| |entry| 6)))
                 (|ConvertibleTo| 21) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
