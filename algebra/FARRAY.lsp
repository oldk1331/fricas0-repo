
(/VERSIONCHECK 2) 

(DEFUN |FlexibleArray| (#1=#:G137)
  (PROG ()
    (RETURN
     (PROG (#2=#:G138)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FlexibleArray|)
                                           '|domainEqualList|)
                . #3=(|FlexibleArray|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|FlexibleArray;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|FlexibleArray|))))))))))) 

(DEFUN |FlexibleArray;| (|#1|)
  (PROG (#1=#:G136 |pv$| #2=#:G132 #3=#:G133 #4=#:G134 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|FlexibleArray|))
      (LETT |dv$| (LIST '|FlexibleArray| DV$1) . #5#)
      (LETT $ (GETREFV 27) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1| '(|OrderedSet|))
                                           #4#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #4#)
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
                                            #4#))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|BasicType|))
                                                . #5#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              #4#)
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #5#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #4#))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|FlexibleArray| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 2048))
      (AND #4# #1# (|augmentPredVector| $ 4096))
      (AND #3# #1# (|augmentPredVector| $ 8192))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 16384))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 32768))
      (AND (OR (AND #3# #1#) #4#) (|augmentPredVector| $ 65536))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FlexibleArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|List| 6) (|Equation| 6) (|List| 11)
              (|Integer|) (|Mapping| 8 6) (|Mapping| 8 6 6)
              (|UniversalSegment| 13) (|Void|) (|Mapping| 6 6) (|OutputForm|)
              (|InputForm|) (|SingleInteger|) (|String|) (|HashState|)
              (|List| $) (|Union| 6 '"failed") (|List| 13))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11
                                  2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |ExtensibleLinearAggregate&| |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 13 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 13 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 13 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 20)
                 (|BasicType|) (|CoercibleTo| 19) (|PartialOrder|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
