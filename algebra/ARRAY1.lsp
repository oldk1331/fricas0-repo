
(PUT '|ARRAY1;qelt;$IS;1| '|SPADreplace| '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(DEFUN |ARRAY1;qelt;$IS;1| (|x| |i| $) (QAREF1O |x| |i| 1)) 

(PUT '|ARRAY1;qsetelt!;$I2S;2| '|SPADreplace|
     '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(DEFUN |ARRAY1;qsetelt!;$I2S;2| (|x| |i| |s| $) (QSETAREF1O |x| |i| |s| 1)) 

(DEFUN |ARRAY1;oneDimensionalArray;L$;3| (|u| $)
  (PROG (|i| #1=#:G2135 |x| |a| |n|)
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

(DECLAIM (NOTINLINE |OneDimensionalArray;|)) 

(DEFUN |OneDimensionalArray| (#1=#:G2149)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2150)
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
  (PROG (#1=#:G2148 |pv$| #2=#:G2144 #3=#:G2145 #4=#:G2146 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|OneDimensionalArray|))
      (LETT |dv$| (LIST '|OneDimensionalArray| DV$1) . #5#)
      (LETT $ (GETREFV 32) . #5#)
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
      (|haddProp| |$ConstructorCache| '|OneDimensionalArray| (LIST DV$1)
                  (CONS 1 $))
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
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11 2))
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
              (|makeByteWordVec2| 15
                                  '(3 0 6 0 7 6 10 3 15 6 0 7 6 10 3 15 6 0 7 6
                                    9 2 0 6 0 7 8 1 0 0 11 12 2 0 0 13 6
                                    14)))))
           '|lookupIncomplete|)) 
