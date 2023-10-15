
(PUT '|VECTOR;qelt;$IR;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(SDEFUN |VECTOR;qelt;$IR;1| ((|x| $) (|i| |Integer|) ($ R)) (QAREF1O |x| |i| 1)) 

(PUT '|VECTOR;qsetelt!;$I2R;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(SDEFUN |VECTOR;qsetelt!;$I2R;2| ((|x| $) (|i| |Integer|) (|s| R) ($ R))
        (QSETAREF1O |x| |i| |s| 1)) 

(SDEFUN |VECTOR;vector;L$;3| ((|l| |List| R) ($ $))
        (SPADCALL |l| (QREFELT $ 11))) 

(SDEFUN |VECTOR;convert;$If;4| ((|x| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|vector| (QREFELT $ 15))
               (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 17)))
         (QREFELT $ 19))) 

(DECLAIM (NOTINLINE |Vector;|)) 

(DEFUN |Vector| (#1=#:G2083)
  (SPROG NIL
         (PROG (#2=#:G2084)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Vector|)
                                               '|domainEqualList|)
                    . #3=(|Vector|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Vector;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Vector|)))))))))) 

(DEFUN |Vector;| (|#1|)
  (SPROG
   ((#1=#:G2082 NIL) (|pv$| NIL) (#2=#:G2079 NIL) (#3=#:G2080 NIL)
    (#4=#:G2081 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Vector|))
    (LETT |dv$| (LIST '|Vector| DV$1) . #5#)
    (LETT $ (GETREFV 38) . #5#)
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
    (|haddProp| |$ConstructorCache| '|Vector| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
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
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 20 (CONS (|dispatchFunction| |VECTOR;convert;$If;4|) $))))
    $))) 

(MAKEPROP '|Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedVector| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |VECTOR;qelt;$IR;1|
              |VECTOR;qsetelt!;$I2R;2| (|List| 6) (0 . |construct|)
              |VECTOR;vector;L$;3| (|Symbol|) (|InputForm|) (5 . |convert|)
              (10 . |parts|) (15 . |convert|) (|List| $) (20 . |convert|)
              (25 . |convert|) (|Mapping| 24 6 6) (|Mapping| 6 6 6)
              (|NonNegativeInteger|) (|Boolean|) (|Equation| 6) (|List| 25)
              (|OutputForm|) (|HashState|) (|SingleInteger|) (|String|)
              (|Mapping| 24 6) (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6)
              (|Matrix| 6) (|Union| 6 '"failed") (|List| 7))
           '#(|vector| 30 |qsetelt!| 35 |qelt| 42 |parts| 48 |convert| 53
              |construct| 58)
           'NIL
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
                 (|IndexedAggregate| 7 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 7 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 7 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 27) (|PartialOrder|) (|ConvertibleTo| 14))
              (|makeByteWordVec2| 21
                                  '(1 0 0 10 11 1 14 0 13 15 1 0 10 0 16 1 10
                                    14 0 17 1 14 0 18 19 1 0 14 0 20 1 0 0 10
                                    12 3 20 6 0 7 6 9 2 0 6 0 7 8 1 21 10 0 16
                                    1 2 14 0 20 1 0 0 10 11)))))
           '|lookupIncomplete|)) 
