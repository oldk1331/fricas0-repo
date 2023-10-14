
(DECLAIM (NOTINLINE |IndexedTwoDimensionalArray;|)) 

(DEFUN |IndexedTwoDimensionalArray| (&REST #1=#:G110)
  (SPROG NIL
         (PROG (#2=#:G111)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedTwoDimensionalArray|)
                                               '|domainEqualList|)
                    . #3=(|IndexedTwoDimensionalArray|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedTwoDimensionalArray;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IndexedTwoDimensionalArray|)))))))))) 

(DEFUN |IndexedTwoDimensionalArray;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G107 NIL) (#2=#:G108 NIL) (#3=#:G109 NIL) ($ NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|IndexedTwoDimensionalArray|))
    (LETT DV$2 (|devaluate| |#2|) . #4#)
    (LETT DV$3 (|devaluate| |#3|) . #4#)
    (LETT |dv$| (LIST '|IndexedTwoDimensionalArray| DV$1 DV$2 DV$3) . #4#)
    (LETT $ (GETREFV 32) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #4#)
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|IndexedTwoDimensionalArray|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 128))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 256))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 7 8 29 30) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|Boolean|) (|NonNegativeInteger|)
              (|List| 6) (|Equation| 6) (|List| 12) (|Mapping| 9 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 24) (|PositiveInteger|)
              (|List| 22) (|List| $) (|Integer|) (|List| 27) (|Segment| 25)
              (|List| 25) (|IndexedOneDimensionalArray| 6 8)
              (|IndexedOneDimensionalArray| 6 7) (|List| 11))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|TwoDimensionalArrayCategory&| |HomogeneousAggregate&|
                     |Aggregate&| |Evalable&| |SetCategory&| NIL NIL NIL
                     |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|TwoDimensionalArrayCategory| 6
                                                     (|IndexedOneDimensionalArray|
                                                      6 8)
                                                     (|IndexedOneDimensionalArray|
                                                      6 7))
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 15))
                   (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
