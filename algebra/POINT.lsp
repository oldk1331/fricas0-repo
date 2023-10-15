
(SDEFUN |POINT;point;L$;1| ((|l| |List| R) ($ $))
        (SPROG ((#1=#:G109 NIL) (|x| NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (SPADCALL (LENGTH |l|) 'R (QREFELT $ 8))
                      . #2=(|POINT;point;L$;1|))
                (SEQ (LETT |i| (SPADCALL |pt| (QREFELT $ 10)) . #2#)
                     (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (SPADCALL |pt| |i| |x| (QREFELT $ 11))))
                     (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |pt|)))) 

(SDEFUN |POINT;dimension;$Pi;2| ((|p| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G110 NIL))
               (PROG1
                   (LETT #1# (SPADCALL |p| (QREFELT $ 14))
                         |POINT;dimension;$Pi;2|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |POINT;convert;L$;3| ((|l| |List| R) ($ $))
        (SPADCALL |l| (QREFELT $ 13))) 

(SDEFUN |POINT;cross;3$;4| ((|p0| $) (|p1| $) ($ $))
        (COND
         ((OR (SPADCALL (SPADCALL |p0| (QREFELT $ 14)) 3 (QREFELT $ 19))
              (SPADCALL (SPADCALL |p1| (QREFELT $ 14)) 3 (QREFELT $ 19)))
          (|error| "Arguments to cross must be three dimensional"))
         ('T
          (SPADCALL
           (LIST
            (SPADCALL
             (SPADCALL (SPADCALL |p0| 2 (QREFELT $ 20))
                       (SPADCALL |p1| 3 (QREFELT $ 20)) (QREFELT $ 21))
             (SPADCALL (SPADCALL |p1| 2 (QREFELT $ 20))
                       (SPADCALL |p0| 3 (QREFELT $ 20)) (QREFELT $ 21))
             (QREFELT $ 22))
            (SPADCALL
             (SPADCALL (SPADCALL |p1| 1 (QREFELT $ 20))
                       (SPADCALL |p0| 3 (QREFELT $ 20)) (QREFELT $ 21))
             (SPADCALL (SPADCALL |p0| 1 (QREFELT $ 20))
                       (SPADCALL |p1| 3 (QREFELT $ 20)) (QREFELT $ 21))
             (QREFELT $ 22))
            (SPADCALL
             (SPADCALL (SPADCALL |p0| 1 (QREFELT $ 20))
                       (SPADCALL |p1| 2 (QREFELT $ 20)) (QREFELT $ 21))
             (SPADCALL (SPADCALL |p1| 1 (QREFELT $ 20))
                       (SPADCALL |p0| 2 (QREFELT $ 20)) (QREFELT $ 21))
             (QREFELT $ 22)))
           (QREFELT $ 13))))) 

(SDEFUN |POINT;extend;$L$;5| ((|p| $) (|l| |List| R) ($ $))
        (SPADCALL |p| (SPADCALL |l| (QREFELT $ 13)) (QREFELT $ 25))) 

(DECLAIM (NOTINLINE |Point;|)) 

(DEFUN |Point| (#1=#:G130)
  (SPROG NIL
         (PROG (#2=#:G131)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Point|)
                                               '|domainEqualList|)
                    . #3=(|Point|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Point;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Point|)))))))))) 

(DEFUN |Point;| (|#1|)
  (SPROG
   ((#1=#:G129 NIL) (|pv$| NIL) (#2=#:G125 NIL) (#3=#:G126 NIL) (#4=#:G127 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Point|))
    (LETT |dv$| (LIST '|Point| DV$1) . #5#)
    (LETT $ (GETREFV 44) . #5#)
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
                                          (|HasCategory| |#1| '(|OrderedSet|)))
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
                                             #4#))
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
    (|haddProp| |$ConstructorCache| '|Point| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 262144))
    (AND #4# #1# (|augmentPredVector| $ 524288))
    (AND #3# #1# (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 2097152))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 4194304))
    (AND (OR (AND #3# #1#) #4#) (|augmentPredVector| $ 8388608))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|Point| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 6) (|local| |#1|)
              (|NonNegativeInteger|) (0 . |new|) (|Integer|) (6 . |minIndex|)
              (11 . |setelt!|) (|List| 6) |POINT;point;L$;1| (18 . |#|)
              (|PositiveInteger|) |POINT;dimension;$Pi;2| |POINT;convert;L$;3|
              (|Boolean|) (23 . ~=) (29 . |elt|) (35 . *) (41 . -) (47 . |One|)
              |POINT;cross;3$;4| (51 . |concat|) |POINT;extend;$L$;5|
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 28) (|Mapping| 18 6)
              (|Mapping| 18 6 6) (|UniversalSegment| 9) (|Void|)
              (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|Matrix| 6)
              (|SingleInteger|) (|String|) (|HashState|) (|List| $)
              (|Union| 6 '"failed") (|List| 9))
           '#(~= 57 |zero?| 63 |zero| 68 |swap!| 73 |sorted?| 80 |sort!| 91
              |sort| 102 |smaller?| 113 |size?| 119 |setelt!| 125 |select| 139
              |sample| 145 |reverse!| 149 |reverse| 154 |removeDuplicates| 159
              |remove| 164 |reduce| 176 |qsetelt!| 197 |qelt| 204 |position|
              210 |point| 229 |parts| 234 |outerProduct| 239 |new| 245 |more?|
              251 |minIndex| 257 |min| 262 |merge| 268 |members| 281 |member?|
              286 |maxIndex| 292 |max| 297 |map!| 303 |map| 309 |magnitude| 322
              |less?| 327 |length| 333 |latex| 338 |insert| 343 |indices| 357
              |index?| 362 |hashUpdate!| 368 |hash| 374 |first| 379 |find| 384
              |fill!| 390 |extend| 396 |every?| 402 |eval| 408 |eq?| 434
              |entry?| 440 |entries| 446 |empty?| 451 |empty| 456 |elt| 460
              |dot| 479 |dimension| 485 |delete| 490 |cross| 502 |count| 508
              |copyInto!| 520 |copy| 527 |convert| 532 |construct| 542 |concat|
              547 |coerce| 570 |any?| 575 >= 581 > 587 = 593 <= 599 < 605 - 611
              + 622 * 628 |#| 646)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11
                                  2))
            (CONS
             '#(NIL |VectorCategory&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL |InnerEvalable&| NIL |BasicType&| NIL
                |PartialOrder&|)
             (CONS
              '#((|PointCategory| 6) (|VectorCategory| 6)
                 (|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 9 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 9 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 9 6)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 36) (|BasicType|)
                 (|CoercibleTo| 35) (|PartialOrder|))
              (|makeByteWordVec2| 43
                                  '(2 0 0 7 6 8 1 0 9 0 10 3 0 6 0 9 6 11 1 0 7
                                    0 14 2 7 18 0 0 19 2 0 6 0 9 20 2 6 0 0 0
                                    21 2 6 0 0 0 22 0 6 0 23 2 0 0 0 0 25 2 24
                                    18 0 0 1 1 13 18 0 1 1 13 0 7 1 3 22 33 0 9
                                    9 1 1 2 18 0 1 2 0 18 31 0 1 1 23 0 0 1 2
                                    22 0 31 0 1 1 2 0 0 1 2 0 0 31 0 1 2 2 18 0
                                    0 1 2 0 18 0 7 1 3 22 6 0 32 6 1 3 22 6 0 9
                                    6 11 2 19 0 30 0 1 0 0 0 1 1 22 0 0 1 1 0 0
                                    0 1 1 21 0 0 1 2 21 0 6 0 1 2 19 0 30 0 1 4
                                    21 6 27 0 6 6 1 3 19 6 27 0 6 1 2 19 6 27 0
                                    1 3 22 6 0 9 6 1 2 0 6 0 9 1 3 8 9 6 0 9 1
                                    2 8 9 6 0 1 2 0 9 30 0 1 1 0 0 12 13 1 19
                                    12 0 1 2 17 37 0 0 1 2 0 0 7 6 8 2 0 18 0 7
                                    1 1 7 9 0 10 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0
                                    31 0 0 1 1 19 12 0 1 2 21 18 6 0 1 1 7 9 0
                                    1 2 2 0 0 0 1 2 22 0 34 0 1 3 0 0 27 0 0 1
                                    2 0 0 34 0 1 1 18 6 0 1 2 0 18 0 7 1 1 18 6
                                    0 1 1 3 39 0 1 3 0 0 6 0 9 1 3 0 0 0 0 9 1
                                    1 0 43 0 1 2 0 18 9 0 1 2 3 40 40 0 1 1 3
                                    38 0 1 1 7 6 0 1 2 0 42 30 0 1 2 22 0 0 6 1
                                    2 0 0 0 12 26 2 19 18 30 0 1 3 5 0 0 6 6 1
                                    3 5 0 0 12 12 1 2 5 0 0 28 1 2 5 0 0 29 1 2
                                    0 18 0 0 1 2 20 18 6 0 1 1 0 12 0 1 1 0 18
                                    0 1 0 0 0 1 2 0 0 0 32 1 2 0 6 0 9 20 3 0 6
                                    0 9 6 1 2 16 6 0 0 1 1 0 15 0 16 2 0 0 0 9
                                    1 2 0 0 0 32 1 2 0 0 0 0 24 2 21 7 6 0 1 2
                                    19 7 30 0 1 3 22 0 0 0 9 1 1 0 0 0 1 1 1 36
                                    0 1 1 0 0 12 17 1 0 0 12 1 1 0 0 41 1 2 0 0
                                    6 0 1 2 0 0 0 0 25 2 0 0 0 6 1 1 10 35 0 1
                                    2 19 18 30 0 1 2 2 18 0 0 1 2 2 18 0 0 1 2
                                    24 18 0 0 1 2 2 18 0 0 1 2 2 18 0 0 1 2 14
                                    0 0 0 1 1 14 0 0 1 2 12 0 0 0 1 2 14 0 9 0
                                    1 2 15 0 0 6 1 2 15 0 6 0 1 1 19 7 0
                                    14)))))
           '|lookupComplete|)) 
