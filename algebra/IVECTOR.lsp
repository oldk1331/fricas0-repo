
(/VERSIONCHECK 2) 

(DEFUN |IndexedVector| (&REST #1=#:G1362)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1363)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IndexedVector|)
                                           '|domainEqualList|)
                . #3=(|IndexedVector|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IndexedVector;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|IndexedVector|))))))))))) 

(DEFUN |IndexedVector;| (|#1| |#2|)
  (PROG (#1=#:G1361 |pv$| #2=#:G1358 #3=#:G1359 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|IndexedVector|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|IndexedVector| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 28) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#1| '(|OrderedSet|))
                                           #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #3#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #3#))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #3#))
                                          (|HasCategory| |#1|
                                                         '(|AbelianSemiGroup|))
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1| '(|Monoid|))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|RadicalCategory|))
                                           (|HasCategory| |#1| '(|Ring|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|IndexedVector| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 32768))
      (AND #3# #1# (|augmentPredVector| $ 65536))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 131072))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 262144))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IndexedVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedOneDimensionalArray| 6 7)
              (|local| |#1|) (|local| |#2|) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|List| 6) (|List| 13) (|Equation| 6)
              (|Integer|) (|Mapping| 9 6) (|Mapping| 9 6 6)
              (|UniversalSegment| 14) (|Void|) (|Mapping| 6 6) (|OutputForm|)
              (|InputForm|) (|Matrix| 6) (|SingleInteger|) (|String|)
              (|List| $) (|Union| 6 '"failed") (|List| 14))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 2 0 2 0 0 7 5 0 0 0 0 7 1 5 9 2))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL |InnerEvalable&| NIL |BasicType&| NIL
                |PartialOrder&|)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 14 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 14 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 14 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 21)
                 (|BasicType|) (|CoercibleTo| 20) (|PartialOrder|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
