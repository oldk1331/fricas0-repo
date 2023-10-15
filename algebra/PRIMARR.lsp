
(PUT '|PRIMARR;#;$Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |PRIMARR;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (QVSIZE |x|)) 

(PUT '|PRIMARR;minIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |PRIMARR;minIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|PRIMARR;empty;$;3| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |PRIMARR;empty;$;3| (($ $)) (MAKE-ARRAY 0)) 

(PUT '|PRIMARR;new;NniS$;4| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |PRIMARR;new;NniS$;4| ((|n| |NonNegativeInteger|) (|x| S) ($ $))
        (MAKEARR1 |n| |x|)) 

(PUT '|PRIMARR;qelt;$IS;5| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;qelt;$IS;5| ((|x| $) (|i| |Integer|) ($ S)) (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;elt;$IS;6| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;elt;$IS;6| ((|x| $) (|i| |Integer|) ($ S)) (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;qsetelt!;$I2S;7| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;qsetelt!;$I2S;7| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (QSETAREF1 |x| |i| |s|)) 

(PUT '|PRIMARR;setelt!;$I2S;8| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;setelt!;$I2S;8| ((|x| $) (|i| |Integer|) (|s| S) ($ S))
        (QSETAREF1 |x| |i| |s|)) 

(SDEFUN |PRIMARR;fill!;$S$;9| ((|x| $) (|s| S) ($ $))
        (SPROG ((#1=#:G1760 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|PRIMARR;fill!;$S$;9|))
                     (LETT #1# (QVMAXINDEX |x|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |PRIMARR;hashUpdate!;Hs$Hs;10|
        ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SPROG ((#1=#:G1764 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|PRIMARR;hashUpdate!;Hs$Hs;10|))
                     (LETT #1# (QVMAXINDEX |x|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s| (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT $ 19))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(DECLAIM (NOTINLINE |PrimitiveArray;|)) 

(DEFUN |PrimitiveArray| (#1=#:G1776)
  (SPROG NIL
         (PROG (#2=#:G1777)
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
              (UNWIND-PROTECT
                  (PROG1 (|PrimitiveArray;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveArray|)))))))))) 

(DEFUN |PrimitiveArray;| (|#1|)
  (SPROG
   ((#1=#:G1775 NIL) (|pv$| NIL) (#2=#:G1772 NIL) (#3=#:G1773 NIL)
    (#4=#:G1774 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|PrimitiveArray|))
    (LETT |dv$| (LIST '|PrimitiveArray| DV$1) . #5#)
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
                                            #4#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|PrimitiveArray| (LIST DV$1) (CONS 1 $))
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
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 20
                (CONS (|dispatchFunction| |PRIMARR;hashUpdate!;Hs$Hs;10|) $))))
    $))) 

(MAKEPROP '|PrimitiveArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |PRIMARR;#;$Nni;1| (|Integer|) |PRIMARR;minIndex;$I;2|
              |PRIMARR;empty;$;3| |PRIMARR;new;NniS$;4| |PRIMARR;qelt;$IS;5|
              |PRIMARR;elt;$IS;6| |PRIMARR;qsetelt!;$I2S;7|
              |PRIMARR;setelt!;$I2S;8| |PRIMARR;fill!;$S$;9| (|HashState|)
              (0 . |hashUpdate!|) (6 . |hashUpdate!|) (|Mapping| 23 6 6)
              (|Mapping| 6 6 6) (|Boolean|) (|List| 6) (|Equation| 6)
              (|List| 25) (|OutputForm|) (|SingleInteger|) (|String|)
              (|Mapping| 23 6) (|UniversalSegment| 9) (|Void|) (|Mapping| 6 6)
              (|InputForm|) (|List| $) (|Union| 6 '"failed") (|List| 9))
           '#(~= 12 |swap!| 18 |sorted?| 25 |sort!| 36 |sort| 47 |smaller?| 58
              |size?| 64 |setelt!| 70 |select| 84 |sample| 90 |reverse!| 94
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
                 (|LinearAggregate| 6) (|IndexedAggregate| 9 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 9 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 9 6)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 27)
                 (|PartialOrder|) (|ConvertibleTo| 34))
              (|makeByteWordVec2| 37
                                  '(2 6 18 18 0 19 2 0 18 18 0 20 2 23 23 0 0 1
                                    3 13 32 0 9 9 1 1 19 23 0 1 2 14 23 21 0 1
                                    1 18 0 0 1 2 17 0 21 0 1 1 19 0 0 1 2 14 0
                                    21 0 1 2 20 23 0 0 1 2 0 23 0 7 1 3 13 6 0
                                    31 6 1 3 13 6 0 9 6 16 2 14 0 30 0 1 0 0 0
                                    1 1 17 0 0 1 1 14 0 0 1 1 16 0 0 1 2 16 0 6
                                    0 1 2 14 0 30 0 1 4 16 6 22 0 6 6 1 2 14 6
                                    22 0 1 3 14 6 22 0 6 1 3 13 6 0 9 6 15 2 0
                                    6 0 9 13 3 16 9 6 0 9 1 2 16 9 6 0 1 2 14 9
                                    30 0 1 1 14 24 0 1 2 0 0 7 6 12 2 0 23 0 7
                                    1 1 5 9 0 10 2 19 0 0 0 1 2 19 0 0 0 1 3 14
                                    0 21 0 0 1 1 14 24 0 1 2 16 23 6 0 1 1 5 9
                                    0 1 2 19 0 0 0 1 2 13 0 33 0 1 3 0 0 22 0 0
                                    1 2 0 0 33 0 1 2 0 23 0 7 1 1 21 29 0 1 3 0
                                    0 0 0 9 1 3 0 0 6 0 9 1 1 0 37 0 1 2 0 23 9
                                    0 1 2 21 18 18 0 20 1 21 28 0 1 1 5 6 0 1 2
                                    0 36 30 0 1 2 13 0 0 6 17 2 14 23 30 0 1 3
                                    4 0 0 6 6 1 3 4 0 0 24 24 1 2 4 0 0 25 1 2
                                    4 0 0 26 1 2 0 23 0 0 1 2 15 23 6 0 1 1 0
                                    24 0 1 1 0 23 0 1 0 0 0 11 2 0 0 0 31 1 3 0
                                    6 0 9 6 1 2 0 6 0 9 14 2 0 0 0 31 1 2 0 0 0
                                    9 1 2 16 7 6 0 1 2 14 7 30 0 1 3 17 0 0 0 9
                                    1 1 0 0 0 1 1 2 34 0 1 1 0 0 24 1 2 0 0 0 0
                                    1 1 0 0 35 1 2 0 0 6 0 1 2 0 0 0 6 1 1 22
                                    27 0 1 2 14 23 30 0 1 2 19 23 0 0 1 2 19 23
                                    0 0 1 2 23 23 0 0 1 2 19 23 0 0 1 2 19 23 0
                                    0 1 1 14 7 0 8)))))
           '|lookupComplete|)) 
