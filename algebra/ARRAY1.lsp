
(/VERSIONCHECK 2) 

(PUT '|ARRAY1;qelt;$IS;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(DEFUN |ARRAY1;qelt;$IS;1| (|x| |i| $) (QAREF1O |x| |i| 1)) 

(PUT '|ARRAY1;qsetelt!;$I2S;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(DEFUN |ARRAY1;qsetelt!;$I2S;2| (|x| |i| |s| $) (QSETAREF1O |x| |i| |s| 1)) 

(DEFUN |ARRAY1;oneDimensionalArray;L$;3| (|u| $)
  (PROG (|i| #1=#:G2141 |x| |a| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |u|) . #2=(|ARRAY1;oneDimensionalArray;L$;3|))
          (EXIT
           (COND ((EQL |n| 0) (MAKE-ARRAY 0))
                 ('T
                  (SEQ (LETT |a| (MAKEARR1 |n| (|SPADfirst| |u|)) . #2#)
                       (SEQ (LETT |x| NIL . #2#) (LETT #1# (CDR |u|) . #2#)
                            (LETT |i| 2 . #2#) G190
                            (COND
                             ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                                  (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 10))))
                            (LETT |i|
                                  (PROG1 (|inc_SI| |i|)
                                    (LETT #1# (CDR #1#) . #2#))
                                  . #2#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |a|))))))))) 

(PUT '|ARRAY1;oneDimensionalArray;NniS$;4| '|SPADreplace| 'MAKEARR1) 

(DEFUN |ARRAY1;oneDimensionalArray;NniS$;4| (|n| |s| $) (MAKEARR1 |n| |s|)) 

(DEFUN |OneDimensionalArray| (#1=#:G2154)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2155)
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
              (HREM |$ConstructorCache| '|OneDimensionalArray|))))))))))) 

(DEFUN |OneDimensionalArray;| (|#1|)
  (PROG (#1=#:G2153 |pv$| #2=#:G2150 #3=#:G2151 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|OneDimensionalArray|))
      (LETT |dv$| (LIST '|OneDimensionalArray| DV$1) . #4#)
      (LETT $ (GETREFV 32) . #4#)
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
                                               #3#))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|OneDimensionalArray| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 512))
      (AND #3# #1# (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 2048))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedOneDimensionalArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |ARRAY1;qelt;$IS;1|
              |ARRAY1;qsetelt!;$I2S;2| (0 . |setelt|) (|List| 6)
              |ARRAY1;oneDimensionalArray;L$;3| (|NonNegativeInteger|)
              |ARRAY1;oneDimensionalArray;NniS$;4| (|Mapping| 6 6 6)
              (|Boolean|) (|Equation| 6) (|List| 17) (|Mapping| 16 6)
              (|Mapping| 16 6 6) (|UniversalSegment| 7) (|Void|)
              (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|List| $) (|Union| 6 '"failed")
              (|List| 7))
           '#(|setelt| 7 |qsetelt!| 14 |qelt| 21 |oneDimensionalArray| 27) 'NIL
           (CONS
            (|makeByteWordVec2| 9 '(0 0 0 0 0 2 0 2 0 0 7 5 0 0 0 0 7 1 5 9 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 7 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 7 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 7 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 25) (|BasicType|)
                 (|CoercibleTo| 24) (|PartialOrder|))
              (|makeByteWordVec2| 14
                                  '(3 0 6 0 7 6 10 3 12 6 0 7 6 10 3 12 6 0 7 6
                                    9 2 0 6 0 7 8 1 0 0 11 12 2 0 0 13 6
                                    14)))))
           '|lookupIncomplete|)) 
