
(/VERSIONCHECK 2) 

(PUT '|VECTOR;qelt;$IR;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(DEFUN |VECTOR;qelt;$IR;1| (|x| |i| $) (QAREF1O |x| |i| 1)) 

(PUT '|VECTOR;qsetelt!;$I2R;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(DEFUN |VECTOR;qsetelt!;$I2R;2| (|x| |i| |s| $) (QSETAREF1O |x| |i| |s| 1)) 

(DEFUN |VECTOR;vector;L$;3| (|l| $) (SPADCALL |l| (QREFELT $ 11))) 

(DEFUN |VECTOR;convert;$If;4| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|vector| (QREFELT $ 15))
         (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 17)))
   (QREFELT $ 19))) 

(DEFUN |Vector| (#1=#:G2058)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2059)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Vector|)
                                           '|domainEqualList|)
                . #3=(|Vector|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Vector;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Vector|))))))))))) 

(DEFUN |Vector;| (|#1|)
  (PROG (#1=#:G2057 |pv$| #2=#:G2054 #3=#:G2055 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Vector|))
      (LETT |dv$| (LIST '|Vector| DV$1) . #4#)
      (LETT $ (GETREFV 37) . #4#)
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
      (|haddProp| |$ConstructorCache| '|Vector| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 32768))
      (AND #3# #1# (|augmentPredVector| $ 65536))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 131072))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 262144))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 20 (CONS (|dispatchFunction| |VECTOR;convert;$If;4|) $))))
      $)))) 

(MAKEPROP '|Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedVector| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |VECTOR;qelt;$IR;1|
              |VECTOR;qsetelt!;$I2R;2| (|List| 6) (0 . |construct|)
              |VECTOR;vector;L$;3| (|Symbol|) (|InputForm|) (5 . |convert|)
              (10 . |parts|) (15 . |convert|) (|List| $) (20 . |convert|)
              (25 . |convert|) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|Equation| 6) (|List| 24)
              (|Mapping| 22 6) (|Mapping| 22 6 6) (|UniversalSegment| 7)
              (|Void|) (|Mapping| 6 6) (|OutputForm|) (|Matrix| 6) (|String|)
              (|SingleInteger|) (|Union| 6 '"failed") (|List| 7))
           '#(|vector| 30 |qsetelt!| 35 |qelt| 42 |parts| 48 |convert| 53
              |construct| 58)
           'NIL
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
                 (|IndexedAggregate| 7 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 7 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 7 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 14)
                 (|BasicType|) (|CoercibleTo| 31) (|PartialOrder|))
              (|makeByteWordVec2| 20
                                  '(1 0 0 10 11 1 14 0 13 15 1 0 10 0 16 1 10
                                    14 0 17 1 14 0 18 19 1 0 14 0 20 1 0 0 10
                                    12 3 18 6 0 7 6 9 2 0 6 0 7 8 1 16 10 0 16
                                    1 1 14 0 20 1 0 0 10 11)))))
           '|lookupIncomplete|)) 
