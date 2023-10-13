
(/VERSIONCHECK 2) 

(DEFUN |StringTable| (#1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
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
  (PROG (#1=#:G173 |pv$| #2=#:G171 #3=#:G172 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|StringTable|))
      (LETT |dv$| (LIST '|StringTable| DV$1) . #4#)
      (LETT $ (GETREFV 30) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Record| (|:| |key| (|String|))
                                                     (|:| |entry| |#1|))
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Record|
                                                  (|:| |key| (|String|))
                                                  (|:| |entry| |#1|))
                                                 '(|SetCategory|))
                                                . #4#)
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
                                          (|HasCategory| (|String|)
                                                         '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| |#1|))
                                            '(|CoercibleTo| (|OutputForm|))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (OR #2# #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           #2#
                                           (|HasCategory|
                                            (|Record| (|:| |key| (|String|))
                                                      (|:| |entry| |#1|))
                                            '(|CoercibleTo| (|OutputForm|)))
                                           #3#)))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|StringTable| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #1# #3# (|augmentPredVector| $ 1024))
      (AND #2# #1# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|StringTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|HashTable| 18 6 '"CVEC") (|local| |#1|)
              (|Record| (|:| |key| 18) (|:| |entry| 6)) (|List| 7) (|List| 10)
              (|Equation| 7) (|Mapping| 7 7 7) (|Boolean|)
              (|NonNegativeInteger|) (|Equation| 6) (|List| 14) (|List| 6)
              (|OutputForm|) (|String|) (|SingleInteger|) (|InputForm|)
              (|Mapping| 12 6) (|Mapping| 12 7) (|Mapping| 6 6) (|Void|)
              (|Mapping| 7 7) (|Mapping| 6 6 6) (|List| 18)
              (|Union| 6 '"failed") (|Union| 7 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 0 0 3 7 8 0 0 0 0 3 1 7 8
                                  9))
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
                 (|ConvertibleTo| 20) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
