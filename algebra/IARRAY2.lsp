
(/VERSIONCHECK 2) 

(DEFUN |IndexedTwoDimensionalArray| (&REST #1=#:G130)
  (PROG ()
    (RETURN
     (PROG (#2=#:G131)
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
              (HREM |$ConstructorCache| '|IndexedTwoDimensionalArray|))))))))))) 

(DEFUN |IndexedTwoDimensionalArray;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G128 #2=#:G129 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|IndexedTwoDimensionalArray|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT DV$3 (|devaluate| |#3|) . #3#)
      (LETT |dv$| (LIST '|IndexedTwoDimensionalArray| DV$1 DV$2 DV$3) . #3#)
      (LETT $ (GETREFV 24) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|IndexedTwoDimensionalArray|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IndexedTwoDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 7 8 22 23) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|Boolean|) (|NonNegativeInteger|)
              (|List| 6) (|Equation| 6) (|List| 12) (|Mapping| 9 6)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Mapping| 6 6 6) (|Mapping| 6 6) (|Integer|)
              (|IndexedOneDimensionalArray| 6 8)
              (|IndexedOneDimensionalArray| 6 7))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 2 1 0 0 0 2 1 4))
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
