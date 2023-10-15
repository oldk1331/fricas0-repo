
(DECLAIM (NOTINLINE |FlexibleArray;|)) 

(DEFUN |FlexibleArray| (#1=#:G115)
  (SPROG NIL
         (PROG (#2=#:G116)
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
                 ((NOT #2#) (HREM |$ConstructorCache| '|FlexibleArray|)))))))))) 

(DEFUN |FlexibleArray;| (|#1|)
  (SPROG
   ((#1=#:G114 NIL) (|pv$| NIL) (#2=#:G111 NIL) (#3=#:G112 NIL) (#4=#:G113 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|FlexibleArray|))
    (LETT |dv$| (LIST '|FlexibleArray| DV$1) . #5#)
    (LETT $ (GETREFV 27) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
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
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|FlexibleArray| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 4096))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 8192))
    (AND #4# #1# (|augmentPredVector| $ 16384))
    (AND (|HasCategory| |#1| '(|BasicType|)) #1# (|augmentPredVector| $ 32768))
    (AND #1# (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 131072))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 262144))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 524288))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
         (|augmentPredVector| $ 1048576))
    (AND (OR #2# (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 2097152))
    (AND
     (OR (AND (|HasCategory| |#1| '(|BasicType|)) #1#) (AND #3# #1#)
         (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
     (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FlexibleArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedFlexibleArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Mapping| 11 6 6) (|Integer|) (|Mapping| 6 6 6)
              (|NonNegativeInteger|) (|Boolean|) (|List| 6) (|List| 14)
              (|Equation| 6) (|OutputForm|) (|HashState|) (|SingleInteger|)
              (|String|) (|Mapping| 11 6) (|UniversalSegment| 8) (|Void|)
              (|Mapping| 6 6) (|InputForm|) (|List| $) (|Union| 6 '"failed")
              (|List| 8))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 10 0 0 4 9 0 0 0 0 4 8 12 1
                                  2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL
                |ExtensibleLinearAggregate&| |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 8 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 8 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 8 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 15) (|PartialOrder|) (|ConvertibleTo| 23))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
