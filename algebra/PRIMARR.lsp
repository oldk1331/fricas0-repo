
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
  (PROG (#1=#:G1726 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|PRIMARR;fill!;$S$;9|))
           (LETT #1# (QVMAXINDEX |x|) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |x| |i| |s|))) (LETT |i| (|inc_SI| |i|) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |PRIMARR;hashUpdate!;Hs$Hs;10| (|s| |x| $)
  (PROG (#1=#:G1730 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|PRIMARR;hashUpdate!;Hs$Hs;10|))
           (LETT #1# (QVMAXINDEX |x|) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (LETT |s| (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT $ 19)) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DECLAIM (NOTINLINE |PrimitiveArray;|)) 

(DEFUN |PrimitiveArray| (#1=#:G1743)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1744)
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
  (PROG (#1=#:G1742 |pv$| #2=#:G1738 #3=#:G1739 #4=#:G1740 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|PrimitiveArray|))
      (LETT |dv$| (LIST '|PrimitiveArray| DV$1) . #5#)
      (LETT $ (GETREFV 38) . #5#)
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
      (|haddProp| |$ConstructorCache| '|PrimitiveArray| (LIST DV$1) (CONS 1 $))
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
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |PRIMARR;hashUpdate!;Hs$Hs;10|)
                        $))))
      $)))) 

(MAKEPROP '|PrimitiveArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |PRIMARR;#;$Nni;1| (|Integer|) |PRIMARR;minIndex;$I;2|
              |PRIMARR;empty;$;3| |PRIMARR;new;NniS$;4| |PRIMARR;qelt;$IS;5|
              |PRIMARR;elt;$IS;6| |PRIMARR;qsetelt!;$I2S;7|
              |PRIMARR;setelt;$I2S;8| |PRIMARR;fill!;$S$;9| (|HashState|)
              (0 . |hashUpdate!|) (6 . |hashUpdate!|) (|Mapping| 6 6 6)
              (|Boolean|) (|List| 6) (|Equation| 6) (|List| 24)
              (|Mapping| 22 6) (|Mapping| 22 6 6) (|UniversalSegment| 9)
              (|Void|) (|Mapping| 6 6) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|String|) (|List| $) (|Union| 6 '"failed")
              (|List| 9))
           '#(~= 12 |swap!| 18 |sorted?| 25 |sort!| 36 |sort| 47 |smaller?| 58
              |size?| 64 |setelt| 70 |select| 84 |sample| 90 |reverse!| 94
              |reverse| 99 |removeDuplicates| 104 |remove| 109 |reduce| 121
              |qsetelt!| 142 |qelt| 149 |position| 155 |parts| 174 |new| 179
              |more?| 185 |minIndex| 191 |min| 196 |merge| 202 |members| 215
              |member?| 220 |maxIndex| 226 |max| 231 |map!| 237 |map| 243
              |less?| 256 |latex| 262 |insert| 267 |indices| 281 |index?| 286
              |hashUpdate!| 292 |hash| 298 |first| 303 |find| 308 |fill!| 314
              |every?| 320 |eval| 326 |eq?| 352 |entry?| 358 |entries| 364
              |empty?| 369 |empty| 374 |elt| 378 |delete| 397 |count| 409
              |copyInto!| 421 |copy| 428 |convert| 433 |construct| 438 |concat|
              443 |coerce| 466 |any?| 471 >= 477 > 483 = 489 <= 495 < 501 |#|
              507)
           'NIL
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
                 (|LinearAggregate| 6) (|IndexedAggregate| 9 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 9 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 9 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 32) (|BasicType|)
                 (|CoercibleTo| 31) (|PartialOrder|))
              (|makeByteWordVec2| 37
                                  '(2 6 18 18 0 19 2 0 18 18 0 20 2 17 22 0 0 1
                                    3 15 29 0 9 9 1 1 2 22 0 1 2 0 22 27 0 1 1
                                    16 0 0 1 2 15 0 27 0 1 1 2 0 0 1 2 0 0 27 0
                                    1 2 2 22 0 0 1 2 0 22 0 7 1 3 15 6 0 28 6 1
                                    3 15 6 0 9 6 16 2 12 0 26 0 1 0 0 0 1 1 15
                                    0 0 1 1 0 0 0 1 1 14 0 0 1 2 14 0 6 0 1 2
                                    12 0 26 0 1 4 14 6 21 0 6 6 1 2 12 6 21 0 1
                                    3 12 6 21 0 6 1 3 15 6 0 9 6 15 2 0 6 0 9
                                    13 3 8 9 6 0 9 1 2 8 9 6 0 1 2 0 9 26 0 1 1
                                    12 23 0 1 2 0 0 7 6 12 2 0 22 0 7 1 1 7 9 0
                                    10 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 27 0 0 1 1
                                    12 23 0 1 2 14 22 6 0 1 1 7 9 0 1 2 2 0 0 0
                                    1 2 15 0 30 0 1 3 0 0 21 0 0 1 2 0 0 30 0 1
                                    2 0 22 0 7 1 1 3 34 0 1 3 0 0 0 0 9 1 3 0 0
                                    6 0 9 1 1 0 37 0 1 2 0 22 9 0 1 2 3 18 18 0
                                    20 1 3 33 0 1 1 7 6 0 1 2 0 36 26 0 1 2 15
                                    0 0 6 17 2 12 22 26 0 1 3 5 0 0 6 6 1 3 5 0
                                    0 23 23 1 2 5 0 0 24 1 2 5 0 0 25 1 2 0 22
                                    0 0 1 2 13 22 6 0 1 1 0 23 0 1 1 0 22 0 1 0
                                    0 0 11 2 0 0 0 28 1 3 0 6 0 9 6 1 2 0 6 0 9
                                    14 2 0 0 0 28 1 2 0 0 0 9 1 2 14 7 6 0 1 2
                                    12 7 26 0 1 3 15 0 0 0 9 1 1 0 0 0 1 1 1 32
                                    0 1 1 0 0 23 1 2 0 0 0 0 1 1 0 0 35 1 2 0 0
                                    6 0 1 2 0 0 0 6 1 1 10 31 0 1 2 12 22 26 0
                                    1 2 2 22 0 0 1 2 2 22 0 0 1 2 17 22 0 0 1 2
                                    2 22 0 0 1 2 2 22 0 0 1 1 12 7 0 8)))))
           '|lookupComplete|)) 
