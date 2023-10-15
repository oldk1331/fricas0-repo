
(DECLAIM (NOTINLINE |IndexedVector;|)) 

(DEFUN |IndexedVector| (&REST #1=#:G1391)
  (SPROG NIL
         (PROG (#2=#:G1392)
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
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedVector|)))))))))) 

(DEFUN |IndexedVector;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1390 NIL) (|pv$| NIL) (#2=#:G1387 NIL) (#3=#:G1388 NIL)
    (#4=#:G1389 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedVector|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|IndexedVector| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 29) . #5#)
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
                                            #4#)
                                        (|HasCategory| |#1|
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1| '(|SemiRng|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|IndexedVector| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 1048576))
    (AND #4# #1# (|augmentPredVector| $ 2097152))
    (AND (|HasCategory| |#1| '(|BasicType|)) #1#
         (|augmentPredVector| $ 4194304))
    (AND #1# (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 8388608))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 16777216))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 33554432))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 67108864))
    (AND (OR (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
         (|augmentPredVector| $ 134217728))
    (AND (OR #2# (AND #3# #1#) (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#))
         (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND (|HasCategory| |#1| '(|BasicType|)) #1#) (AND #3# #1#)
         (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#) #4#)
     (|augmentPredVector| $ 536870912))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedOneDimensionalArray| 6 7)
              (|local| |#1|) (|local| |#2|) (|Mapping| 12 6 6) (|Integer|)
              (|Mapping| 6 6 6) (|NonNegativeInteger|) (|Boolean|) (|List| 6)
              (|Equation| 6) (|List| 14) (|OutputForm|) (|SingleInteger|)
              (|String|) (|HashState|) (|Mapping| 12 6) (|UniversalSegment| 9)
              (|Void|) (|Mapping| 6 6) (|InputForm|) (|Matrix| 6) (|List| $)
              (|Union| 6 '"failed") (|List| 9))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 10 0 0 4 9 0 0 0 0 4 8 12 1
                                  2))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 9 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 9 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 9 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 16) (|PartialOrder|) (|ConvertibleTo| 24))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
