
(PUT '|ARRAY1;qelt;$IS;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(SDEFUN |ARRAY1;qelt;$IS;1| ((|x| $) (|i| |Integer|) ($ S)) (QAREF1O |x| |i| 1)) 

(PUT '|ARRAY1;qsetelt!;$I2S;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(SDEFUN |ARRAY1;qsetelt!;$I2S;2| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (QSETAREF1O |x| |i| |s| 1)) 

(SDEFUN |ARRAY1;oneDimensionalArray;L$;3| ((|u| |List| S) ($ $))
        (SPROG
         ((#1=#:G2154 NIL) (|i| NIL) (#2=#:G2155 NIL) (|x| NIL) (|a| ($))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |u|) . #3=(|ARRAY1;oneDimensionalArray;L$;3|))
              (EXIT
               (COND ((EQL |n| 0) (MAKE-ARRAY 0))
                     ('T
                      (SEQ (LETT |a| (MAKEARR1 |n| (|SPADfirst| |u|)) . #3#)
                           (SEQ (LETT |x| NIL . #3#) (LETT #2# (CDR |u|) . #3#)
                                (LETT |i| 2 . #3#) (LETT #1# |n| . #3#) G190
                                (COND
                                 ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                                      (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 10))))
                                (LETT |i|
                                      (PROG1 (|inc_SI| |i|)
                                        (LETT #2# (CDR #2#) . #3#))
                                      . #3#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |a|)))))))) 

(PUT '|ARRAY1;oneDimensionalArray;NniS$;4| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |ARRAY1;oneDimensionalArray;NniS$;4|
        ((|n| |NonNegativeInteger|) (|s| S) ($ $)) (MAKEARR1 |n| |s|)) 

(DECLAIM (NOTINLINE |OneDimensionalArray;|)) 

(DEFUN |OneDimensionalArray| (#1=#:G2168)
  (SPROG NIL
         (PROG (#2=#:G2169)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OneDimensionalArray|)
                                               '|domainEqualList|)
                    . #3=(|OneDimensionalArray|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OneDimensionalArray;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OneDimensionalArray|)))))))))) 

(DEFUN |OneDimensionalArray;| (|#1|)
  (SPROG
   ((#1=#:G2167 NIL) (|pv$| NIL) (#2=#:G2164 NIL) (#3=#:G2165 NIL)
    (#4=#:G2166 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|OneDimensionalArray|))
    (LETT |dv$| (LIST '|OneDimensionalArray| DV$1) . #5#)
    (LETT $ (GETREFV 32) . #5#)
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
    (|haddProp| |$ConstructorCache| '|OneDimensionalArray| (LIST DV$1)
                (CONS 1 $))
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

(MAKEPROP '|OneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedOneDimensionalArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |ARRAY1;qelt;$IS;1|
              |ARRAY1;qsetelt!;$I2S;2| (0 . |setelt!|) (|List| 6)
              |ARRAY1;oneDimensionalArray;L$;3| (|NonNegativeInteger|)
              |ARRAY1;oneDimensionalArray;NniS$;4| (|Mapping| 17 6 6)
              (|Mapping| 6 6 6) (|Boolean|) (|Equation| 6) (|List| 18)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Mapping| 17 6) (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6)
              (|InputForm|) (|List| $) (|Union| 6 '"failed") (|List| 7))
           '#(|setelt!| 7 |qsetelt!| 14 |qelt| 21 |oneDimensionalArray| 27)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 1 0 10 0 0 4 9 0 0 0 0 4 8 12 1 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 7 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 7 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 7 6)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 20)
                 (|PartialOrder|) (|ConvertibleTo| 28))
              (|makeByteWordVec2| 14
                                  '(3 0 6 0 7 6 10 3 13 6 0 7 6 10 3 13 6 0 7 6
                                    9 2 0 6 0 7 8 1 0 0 11 12 2 0 0 13 6
                                    14)))))
           '|lookupIncomplete|)) 
