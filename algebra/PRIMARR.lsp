
(/VERSIONCHECK 2) 

(PUT '|PRIMARR;#;$Nni;1| '|SPADreplace| 'QVSIZE) 

(DEFUN |PRIMARR;#;$Nni;1| (|x| $) (QVSIZE |x|)) 

(PUT '|PRIMARR;minIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |PRIMARR;minIndex;$I;2| (|x| $) 0) 

(PUT '|PRIMARR;empty;$;3| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(DEFUN |PRIMARR;empty;$;3| ($) (MAKE-ARRAY 0)) 

(PUT '|PRIMARR;new;NniS$;4| '|SPADreplace| 'MAKEARR1) 

(DEFUN |PRIMARR;new;NniS$;4| (|n| |x| $) (MAKEARR1 |n| |x|)) 

(PUT '|PRIMARR;qelt;$IS;5| '|SPADreplace| 'QAREF1) 

(DEFUN |PRIMARR;qelt;$IS;5| (|x| |i| $) (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;elt;$IS;6| '|SPADreplace| 'QAREF1) 

(DEFUN |PRIMARR;elt;$IS;6| (|x| |i| $) (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;qsetelt!;$I2S;7| '|SPADreplace| 'QSETAREF1) 

(DEFUN |PRIMARR;qsetelt!;$I2S;7| (|x| |i| |s| $) (QSETAREF1 |x| |i| |s|)) 

(PUT '|PRIMARR;setelt;$I2S;8| '|SPADreplace| 'QSETAREF1) 

(DEFUN |PRIMARR;setelt;$I2S;8| (|x| |i| |s| $) (QSETAREF1 |x| |i| |s|)) 

(DEFUN |PRIMARR;fill!;$S$;9| (|x| |s| $)
  (PROG (#1=#:G1730 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|PRIMARR;fill!;$S$;9|))
           (LETT #1# (QVMAXINDEX |x|) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |x| |i| |s|))) (LETT |i| (|inc_SI| |i|) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |PrimitiveArray| (#1=#:G1742)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1743)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PrimitiveArray|)
                                           '|domainEqualList|)
                . #3=(|PrimitiveArray|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PrimitiveArray;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PrimitiveArray|))))))))))) 

(DEFUN |PrimitiveArray;| (|#1|)
  (PROG (#1=#:G1741 |pv$| #2=#:G1738 #3=#:G1739 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|PrimitiveArray|))
      (LETT |dv$| (LIST '|PrimitiveArray| DV$1) . #4#)
      (LETT $ (GETREFV 35) . #4#)
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
      (|haddProp| |$ConstructorCache| '|PrimitiveArray| (LIST DV$1) (CONS 1 $))
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

(MAKEPROP '|PrimitiveArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |PRIMARR;#;$Nni;1| (|Integer|) |PRIMARR;minIndex;$I;2|
              |PRIMARR;empty;$;3| |PRIMARR;new;NniS$;4| |PRIMARR;qelt;$IS;5|
              |PRIMARR;elt;$IS;6| |PRIMARR;qsetelt!;$I2S;7|
              |PRIMARR;setelt;$I2S;8| |PRIMARR;fill!;$S$;9| (|Mapping| 6 6 6)
              (|Boolean|) (|List| 6) (|Equation| 6) (|List| 21)
              (|Mapping| 19 6) (|Mapping| 19 6 6) (|UniversalSegment| 9)
              (|Void|) (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|String|)
              (|SingleInteger|) (|List| $) (|Union| 6 '"failed") (|List| 9))
           '#(~= 0 |swap!| 6 |sorted?| 13 |sort!| 24 |sort| 35 |smaller?| 46
              |size?| 52 |setelt| 58 |select| 72 |sample| 78 |reverse!| 82
              |reverse| 87 |removeDuplicates| 92 |remove| 97 |reduce| 109
              |qsetelt!| 130 |qelt| 137 |position| 143 |parts| 162 |new| 167
              |more?| 173 |minIndex| 179 |min| 184 |merge| 190 |members| 203
              |member?| 208 |maxIndex| 214 |max| 219 |map!| 225 |map| 231
              |less?| 244 |latex| 250 |insert| 255 |indices| 269 |index?| 274
              |hash| 280 |first| 285 |find| 290 |fill!| 296 |every?| 302 |eval|
              308 |eq?| 334 |entry?| 340 |entries| 346 |empty?| 351 |empty| 356
              |elt| 360 |delete| 379 |count| 391 |copyInto!| 403 |copy| 410
              |convert| 415 |construct| 420 |concat| 425 |coerce| 448 |any?|
              453 >= 459 > 465 = 471 <= 477 < 483 |#| 489)
           'NIL
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
                 (|LinearAggregate| 6) (|IndexedAggregate| 9 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 9 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 9 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 29) (|BasicType|)
                 (|CoercibleTo| 28) (|PartialOrder|))
              (|makeByteWordVec2| 34
                                  '(2 4 19 0 0 1 3 12 26 0 9 9 1 1 2 19 0 1 2 0
                                    19 24 0 1 1 13 0 0 1 2 12 0 24 0 1 1 2 0 0
                                    1 2 0 0 24 0 1 2 2 19 0 0 1 2 0 19 0 7 1 3
                                    12 6 0 25 6 1 3 12 6 0 9 6 16 2 10 0 23 0 1
                                    0 0 0 1 1 12 0 0 1 1 0 0 0 1 1 11 0 0 1 2
                                    11 0 6 0 1 2 10 0 23 0 1 4 11 6 18 0 6 6 1
                                    3 10 6 18 0 6 1 2 10 6 18 0 1 3 12 6 0 9 6
                                    15 2 0 6 0 9 13 2 4 9 6 0 1 3 4 9 6 0 9 1 2
                                    0 9 23 0 1 1 10 20 0 1 2 0 0 7 6 12 2 0 19
                                    0 7 1 1 3 9 0 10 2 2 0 0 0 1 2 2 0 0 0 1 3
                                    0 0 24 0 0 1 1 10 20 0 1 2 11 19 6 0 1 1 3
                                    9 0 1 2 2 0 0 0 1 2 12 0 27 0 1 3 0 0 18 0
                                    0 1 2 0 0 27 0 1 2 0 19 0 7 1 1 4 30 0 1 3
                                    0 0 0 0 9 1 3 0 0 6 0 9 1 1 0 34 0 1 2 0 19
                                    9 0 1 1 4 31 0 1 1 3 6 0 1 2 0 33 23 0 1 2
                                    12 0 0 6 17 2 10 19 23 0 1 3 6 0 0 20 20 1
                                    2 6 0 0 21 1 3 6 0 0 6 6 1 2 6 0 0 22 1 2 0
                                    19 0 0 1 2 11 19 6 0 1 1 0 20 0 1 1 0 19 0
                                    1 0 0 0 11 2 0 0 0 25 1 2 0 6 0 9 14 3 0 6
                                    0 9 6 1 2 0 0 0 9 1 2 0 0 0 25 1 2 11 7 6 0
                                    1 2 10 7 23 0 1 3 12 0 0 0 9 1 1 0 0 0 1 1
                                    1 29 0 1 1 0 0 20 1 1 0 0 32 1 2 0 0 6 0 1
                                    2 0 0 0 0 1 2 0 0 0 6 1 1 8 28 0 1 2 10 19
                                    23 0 1 2 2 19 0 0 1 2 2 19 0 0 1 2 4 19 0 0
                                    1 2 2 19 0 0 1 2 2 19 0 0 1 1 10 7 0 8)))))
           '|lookupComplete|)) 
