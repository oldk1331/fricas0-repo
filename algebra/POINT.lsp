
(/VERSIONCHECK 2) 

(DEFUN |POINT;point;L$;1| (|l| $)
  (PROG (#1=#:G130 |x| |i| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (SPADCALL (LENGTH |l|) 'R (QREFELT $ 8))
            . #2=(|POINT;point;L$;1|))
      (SEQ (LETT |i| (SPADCALL |pt| (QREFELT $ 10)) . #2#) (LETT |x| NIL . #2#)
           (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (SPADCALL |pt| |i| |x| (QREFELT $ 11))))
           (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |pt|))))) 

(DEFUN |POINT;dimension;$Pi;2| (|p| $)
  (PROG (#1=#:G131)
    (RETURN
     (PROG1 (LETT #1# (SPADCALL |p| (QREFELT $ 14)) |POINT;dimension;$Pi;2|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |POINT;convert;L$;3| (|l| $) (SPADCALL |l| (QREFELT $ 13))) 

(DEFUN |POINT;cross;3$;4| (|p0| |p1| $)
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

(DEFUN |POINT;extend;$L$;5| (|p| |l| $)
  (SPADCALL |p| (SPADCALL |l| (QREFELT $ 13)) (QREFELT $ 25))) 

(DEFUN |Point| (#1=#:G151)
  (PROG ()
    (RETURN
     (PROG (#2=#:G152)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Point|)
                                           '|domainEqualList|)
                . #3=(|Point|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Point;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Point|))))))))))) 

(DEFUN |Point;| (|#1|)
  (PROG (#1=#:G150 |pv$| #2=#:G146 #3=#:G147 #4=#:G148 $ |dv$| DV$1)
    (RETURN
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
                                               #4#))
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
                      . #5#))
      (|haddProp| |$ConstructorCache| '|Point| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 131072))
      (AND #4# #1# (|augmentPredVector| $ 262144))
      (AND #3# #1# (|augmentPredVector| $ 524288))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 1048576))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 2097152))
      (AND (OR (AND #3# #1#) #4#) (|augmentPredVector| $ 4194304))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Point| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 6) (|local| |#1|)
              (|NonNegativeInteger|) (0 . |new|) (|Integer|) (6 . |minIndex|)
              (11 . |setelt|) (|List| 6) |POINT;point;L$;1| (18 . |#|)
              (|PositiveInteger|) |POINT;dimension;$Pi;2| |POINT;convert;L$;3|
              (|Boolean|) (23 . ~=) (29 . |elt|) (35 . *) (41 . -) (47 . |One|)
              |POINT;cross;3$;4| (51 . |concat|) |POINT;extend;$L$;5|
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 28) (|Mapping| 18 6)
              (|Mapping| 18 6 6) (|UniversalSegment| 9) (|Void|)
              (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|Matrix| 6)
              (|HashState|) (|SingleInteger|) (|String|) (|List| $)
              (|Union| 6 '"failed") (|List| 9))
           '#(~= 57 |zero| 63 |swap!| 68 |sorted?| 75 |sort!| 86 |sort| 97
              |smaller?| 108 |size?| 114 |setelt| 120 |select| 134 |sample| 140
              |reverse!| 144 |reverse| 149 |removeDuplicates| 154 |remove| 159
              |reduce| 171 |qsetelt!| 192 |qelt| 199 |position| 205 |point| 224
              |parts| 229 |outerProduct| 234 |new| 240 |more?| 246 |minIndex|
              252 |min| 257 |merge| 263 |members| 276 |member?| 281 |maxIndex|
              287 |max| 292 |map!| 298 |map| 304 |magnitude| 317 |less?| 322
              |length| 328 |latex| 333 |insert| 338 |indices| 352 |index?| 357
              |hashUpdate!| 363 |hash| 369 |first| 374 |find| 379 |fill!| 385
              |extend| 391 |every?| 397 |eval| 403 |eq?| 429 |entry?| 435
              |entries| 441 |empty?| 446 |empty| 451 |elt| 455 |dot| 474
              |dimension| 480 |delete| 485 |cross| 497 |count| 503 |copyInto!|
              515 |copy| 522 |convert| 527 |construct| 537 |concat| 542
              |coerce| 565 |any?| 570 >= 576 > 582 = 588 <= 594 < 600 - 606 +
              617 * 623 |#| 641)
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
                                    21 2 6 0 0 0 22 0 6 0 23 2 0 0 0 0 25 2 23
                                    18 0 0 1 1 13 0 7 1 3 21 33 0 9 9 1 1 2 18
                                    0 1 2 0 18 31 0 1 1 22 0 0 1 2 21 0 31 0 1
                                    1 2 0 0 1 2 0 0 31 0 1 2 2 18 0 0 1 2 0 18
                                    0 7 1 3 21 6 0 32 6 1 3 21 6 0 9 6 11 2 18
                                    0 30 0 1 0 0 0 1 1 21 0 0 1 1 0 0 0 1 1 20
                                    0 0 1 2 20 0 6 0 1 2 18 0 30 0 1 4 20 6 27
                                    0 6 6 1 3 18 6 27 0 6 1 2 18 6 27 0 1 3 21
                                    6 0 9 6 1 2 0 6 0 9 1 3 8 9 6 0 9 1 2 8 9 6
                                    0 1 2 0 9 30 0 1 1 0 0 12 13 1 18 12 0 1 2
                                    16 37 0 0 1 2 0 0 7 6 8 2 0 18 0 7 1 1 7 9
                                    0 10 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 31 0 0 1
                                    1 18 12 0 1 2 20 18 6 0 1 1 7 9 0 1 2 2 0 0
                                    0 1 2 21 0 34 0 1 3 0 0 27 0 0 1 2 0 0 34 0
                                    1 1 17 6 0 1 2 0 18 0 7 1 1 17 6 0 1 1 3 40
                                    0 1 3 0 0 6 0 9 1 3 0 0 0 0 9 1 1 0 43 0 1
                                    2 0 18 9 0 1 2 3 38 38 0 1 1 3 39 0 1 1 7 6
                                    0 1 2 0 42 30 0 1 2 21 0 0 6 1 2 0 0 0 12
                                    26 2 18 18 30 0 1 3 5 0 0 6 6 1 3 5 0 0 12
                                    12 1 2 5 0 0 28 1 2 5 0 0 29 1 2 0 18 0 0 1
                                    2 19 18 6 0 1 1 0 12 0 1 1 0 18 0 1 0 0 0 1
                                    2 0 0 0 32 1 2 0 6 0 9 20 3 0 6 0 9 6 1 2
                                    16 6 0 0 1 1 0 15 0 16 2 0 0 0 9 1 2 0 0 0
                                    32 1 2 0 0 0 0 24 2 20 7 6 0 1 2 18 7 30 0
                                    1 3 21 0 0 0 9 1 1 0 0 0 1 1 1 36 0 1 1 0 0
                                    12 17 1 0 0 12 1 1 0 0 41 1 2 0 0 6 0 1 2 0
                                    0 0 0 25 2 0 0 0 6 1 1 10 35 0 1 2 18 18 30
                                    0 1 2 2 18 0 0 1 2 2 18 0 0 1 2 23 18 0 0 1
                                    2 2 18 0 0 1 2 2 18 0 0 1 2 14 0 0 0 1 1 14
                                    0 0 1 2 12 0 0 0 1 2 14 0 9 0 1 2 15 0 0 6
                                    1 2 15 0 6 0 1 1 18 7 0 14)))))
           '|lookupComplete|)) 
