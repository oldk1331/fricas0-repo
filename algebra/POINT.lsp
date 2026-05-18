
(SDEFUN |POINT;point;L%;1| ((|l| (|List| R)) (% (%)))
        (SPADCALL |l| (QREFELT % 8))) 

(SDEFUN |POINT;dimension;%Pi;2| ((|p| (%)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G1 NIL))
               (PROG1 (LETT #1# (SPADCALL |p| (QREFELT % 11)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |POINT;convert;L%;3| ((|l| (|List| R)) (% (%)))
        (SPADCALL |l| (QREFELT % 9))) 

(SDEFUN |POINT;extend;%L%;4| ((|p| (%)) (|l| (|List| R)) (% (%)))
        (SPADCALL |p| (SPADCALL |l| (QREFELT % 9)) (QREFELT % 15))) 

(DECLAIM (NOTINLINE |Point;|)) 

(DEFUN |Point;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G12 NIL) (#2=#:G13 NIL) (#3=#:G14 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Point| DV$1))
    (LETT % (GETREFV 36))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
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
                                         (|HasCategory| |#1| '(|Ring|)))))))
    (|haddProp| |$ConstructorCache| '|Point| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4194304))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 8388608))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 16777216))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 67108864))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 134217728))
    (AND
     (OR #1# (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 268435456))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND #3# (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|Hashable|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 1073741824))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |Point| (#1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Point|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Point;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Point|)))))))))) 

(MAKEPROP '|Point| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 6) (|local| |#1|) (|List| 6)
              (0 . |construct|) |POINT;point;L%;1| (|NonNegativeInteger|)
              (5 . |#|) (|PositiveInteger|) |POINT;dimension;%Pi;2|
              |POINT;convert;L%;3| (10 . |concat|) |POINT;extend;%L%;4|
              (|Boolean|) (|Mapping| 6 6) (|Integer|) (|List| 19)
              (|Union| 6 '"failed") (|Mapping| 17 6) (|UniversalSegment| 19)
              (|Mapping| 6 6 6) (|List| %) (|Mapping| 17 6 6) (|SingleInteger|)
              (|HashState|) (|Equation| 6) (|List| 29) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|) (|Matrix| 6))
           '#(~= 16 |zero?| 22 |zero| 27 |trim| 32 |swap!| 38 |sorted?| 45
              |sort!| 56 |sort| 67 |smaller?| 78 |size?| 84 |setelt!| 90
              |select| 104 |sample| 110 |rightTrim| 114 |reverse!| 120
              |reverse| 125 |removeDuplicates| 130 |remove| 135 |reduce| 147
              |qsetelt!| 168 |qelt| 175 |position| 181 |point| 200 |parts| 205
              |outerProduct| 210 |new| 216 |more?| 222 |minIndex| 228 |min| 233
              |merge| 244 |members| 257 |member?| 262 |maxIndex| 268 |max| 273
              |map!| 290 |map| 296 |less?| 309 |length| 315 |leftTrim| 320
              |latex| 326 |insert| 331 |indices| 345 |index?| 350 |hashUpdate!|
              356 |hash| 362 |first| 367 |find| 378 |fill!| 384 |extend| 390
              |every?| 396 |eval| 402 |eq?| 428 |entry?| 434 |entries| 440
              |empty?| 445 |empty| 450 |elt| 454 |dot| 473 |dimension| 479
              |delete| 484 |cross| 496 |count| 502 |copyInto!| 514 |copy| 521
              |convert| 526 |construct| 536 |concat| 541 |coerce| 564 |any?|
              569 >= 575 > 581 = 587 <= 593 < 599 - 605 + 616 * 622 |#| 640)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0
                                  0 0 0 0))
            (CONS
             '#(NIL |VectorCategory&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |Hashable&|
                |SetCategory&| |Evalable&| |EltableAggregate&| |Aggregate&| NIL
                |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|PointCategory| 6) (|VectorCategory| 6)
                 (|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Collection| 6)
                 (|IndexedAggregate| 19 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 19 6) (|Aggregate|)
                 (|ConvertibleTo| 34) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 31) (|InnerEvalable| 6 6) (|Eltable| 19 6)
                 (|Type|) (|Eltable| 23 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 35
                                  '(1 0 0 7 8 1 0 10 0 11 2 0 0 0 0 15 2 31 17
                                    0 0 1 1 15 17 0 1 1 15 0 10 1 2 23 0 0 6 1
                                    3 21 33 0 19 19 1 1 26 17 0 1 2 22 17 26 0
                                    1 2 24 0 26 0 1 1 25 0 0 1 1 26 0 0 1 2 22
                                    0 26 0 1 2 27 17 0 0 1 2 0 17 0 10 1 3 21 6
                                    0 19 6 1 3 21 6 0 23 6 1 2 22 0 22 0 1 0 0
                                    0 1 2 23 0 0 6 1 1 24 0 0 1 1 22 0 0 1 1 23
                                    0 0 1 2 23 0 6 0 1 2 22 0 22 0 1 4 23 6 24
                                    0 6 6 1 2 22 6 24 0 1 3 22 6 24 0 6 1 3 21
                                    6 0 19 6 1 2 0 6 0 19 1 2 23 19 6 0 1 3 23
                                    19 6 0 19 1 2 22 19 22 0 1 1 0 0 7 9 1 22 7
                                    0 1 2 19 35 0 0 1 2 0 0 10 6 1 2 0 17 0 10
                                    1 1 4 19 0 1 1 26 6 0 1 2 26 0 0 0 1 2 26 0
                                    0 0 1 3 22 0 26 0 0 1 1 22 7 0 1 2 23 17 6
                                    0 1 1 4 19 0 1 1 26 6 0 1 2 26 0 0 0 1 2 22
                                    6 26 0 1 2 21 0 18 0 1 2 0 0 18 0 1 3 0 0
                                    24 0 0 1 2 0 17 0 10 1 1 20 6 0 1 2 23 0 0
                                    6 1 1 28 32 0 1 3 0 0 6 0 19 1 3 0 0 0 0 19
                                    1 1 0 20 0 1 2 0 17 19 0 1 2 30 28 28 0 1 1
                                    30 27 0 1 2 0 0 0 10 1 1 4 6 0 1 2 0 21 22
                                    0 1 2 21 0 0 6 1 2 0 0 0 7 16 2 22 17 22 0
                                    1 2 9 0 0 29 1 2 9 0 0 30 1 3 9 0 0 6 6 1 3
                                    9 0 0 7 7 1 2 0 17 0 0 1 2 23 17 6 0 1 1 0
                                    7 0 1 1 0 17 0 1 0 0 0 1 3 0 6 0 19 6 1 2 0
                                    6 0 19 1 2 0 0 0 23 1 2 18 6 0 0 1 1 0 12 0
                                    13 2 0 0 0 23 1 2 0 0 0 19 1 2 19 0 0 0 1 2
                                    23 10 6 0 1 2 22 10 22 0 1 3 24 0 0 0 19 1
                                    1 0 0 0 1 1 0 0 7 14 1 3 34 0 1 1 0 0 7 8 2
                                    0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0 15 1 0 0 25
                                    1 1 29 31 0 1 2 22 17 22 0 1 2 26 17 0 0 1
                                    2 26 17 0 0 1 2 31 17 0 0 1 2 26 17 0 0 1 2
                                    26 17 0 0 1 2 16 0 0 0 1 1 16 0 0 1 2 14 0
                                    0 0 1 2 16 0 19 0 1 2 17 0 6 0 1 2 17 0 0 6
                                    1 1 22 10 0 11)))))
           '|lookupComplete|)) 
