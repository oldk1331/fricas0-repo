
(/VERSIONCHECK 2) 

(DEFUN |EqTable| (&REST #1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|EqTable|)
                                           '|domainEqualList|)
                . #3=(|EqTable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |EqTable;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|EqTable|))))))))))) 

(DEFUN |EqTable;| (|#1| |#2|)
  (PROG (#1=#:G173 |pv$| #2=#:G171 #3=#:G172 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|EqTable|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|EqTable| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 32) . #4#)
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
      (|haddProp| |$ConstructorCache| '|EqTable| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #1# #3# (|augmentPredVector| $ 1024))
      (AND #2# #1# (|augmentPredVector| $ 2048))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|EqTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|HashTable| 6 7 '"EQ") (|local| |#1|)
              (|local| |#2|) (|Record| (|:| |key| 6) (|:| |entry| 7))
              (|List| 8) (|Equation| 8) (|List| 10) (|Mapping| 8 8 8)
              (|NonNegativeInteger|) (|Boolean|) (|Equation| 7) (|List| 15)
              (|List| 7) (|OutputForm|) (|String|) (|SingleInteger|)
              (|HashState|) (|InputForm|) (|Mapping| 14 7) (|Mapping| 14 8)
              (|Mapping| 7 7) (|Void|) (|Mapping| 8 8) (|Mapping| 7 7 7)
              (|List| 6) (|Union| 7 '"failed") (|Union| 8 '"failed"))
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
                 (|Evalable| 7) (|SetCategory|) (|finiteAggregate|)
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 22) (|InnerEvalable| 7 7) (|BasicType|)
                 (|CoercibleTo| 18))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
