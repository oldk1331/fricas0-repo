
(DECLAIM (NOTINLINE |SortedExponentVector;|)) 

(DEFUN |SortedExponentVector| ()
  (SPROG NIL
         (PROG (#1=#:G2596)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SortedExponentVector|)
                    . #2=(|SortedExponentVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SortedExponentVector|
                             (LIST
                              (CONS NIL (CONS 1 (|SortedExponentVector;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SortedExponentVector|)))))))))) 

(DEFUN |SortedExponentVector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2593 NIL) (#2=#:G2592 NIL) (#3=#:G2591 NIL)
    (|pv$| NIL) (#4=#:G2594 NIL))
   (PROGN
    (LETT |dv$| '(|SortedExponentVector|) . #5=(|SortedExponentVector|))
    (LETT $ (GETREFV 25) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Evalable|
                                                          (|Integer|)))
                                         #1#)
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|Comparable|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         #2#
                                         (|HasCategory| (|Integer|)
                                                        '(|OrderedSet|))
                                         #1#)
                                        (OR #2#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #1#)
                                        (OR #2#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #3# #2#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #1#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|SortedExponentVector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 2048))
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 4096))
    (AND #4# #1# (|augmentPredVector| $ 8192))
    (AND #4# (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| $ 16384))
    (AND #4# (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 32768))
    (AND #4# (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| $ 65536))
    (AND #4# (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| $ 131072))
    (AND
     (OR (AND #4# #2#) (AND #4# (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| $ 262144))
    (AND
     (OR (AND #4# #2#) (AND #4# (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #1#)
     (|augmentPredVector| $ 524288))
    (AND
     (OR (AND #4# #2#) (AND #4# (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| $ 1048576))
    (AND
     (OR (AND #4# (|HasCategory| (|Integer|) '(|BasicType|))) (AND #4# #2#)
         (AND #4# (|HasCategory| (|Integer|) '(|OrderedSet|))) #1#)
     (|augmentPredVector| $ 2097152))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|SortedExponentVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|U32Vector|) (|Integer|) (|List| 6)
              (|Equation| 6) (|List| 8) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 11 6 6) (|OutputForm|)
              (|HashState|) (|SingleInteger|) (|String|) (|InputForm|)
              (|Mapping| 11 6) (|UniversalSegment| 6) (|Void|) (|Mapping| 6 6)
              (|List| $) (|Union| 6 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 1 0 9 0 0 4 8 0 0 0 0 4 7 11 1 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 6 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 6 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 6 6)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 14)
                 (|PartialOrder|) (|ConvertibleTo| 18))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|SortedExponentVector| 'NILADIC T) 
