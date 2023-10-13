
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

(DEFUN |Point| (#1=#:G150)
  (PROG ()
    (RETURN
     (PROG (#2=#:G151)
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
  (PROG (#1=#:G149 |pv$| #2=#:G146 #3=#:G147 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Point|))
      (LETT |dv$| (LIST '|Point| DV$1) . #4#)
      (LETT $ (GETREFV 43) . #4#)
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
      (|haddProp| |$ConstructorCache| '|Point| (LIST DV$1) (CONS 1 $))
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
              (|String|) (|SingleInteger|) (|List| $) (|Union| 6 '"failed")
              (|List| 9))
           '#(~= 57 |zero| 63 |swap!| 68 |sorted?| 75 |sort!| 86 |sort| 97
              |smaller?| 108 |size?| 114 |setelt| 120 |select| 134 |sample| 140
              |reverse!| 144 |reverse| 149 |removeDuplicates| 154 |remove| 159
              |reduce| 171 |qsetelt!| 192 |qelt| 199 |position| 205 |point| 224
              |parts| 229 |outerProduct| 234 |new| 240 |more?| 246 |minIndex|
              252 |min| 257 |merge| 263 |members| 276 |member?| 281 |maxIndex|
              287 |max| 292 |map!| 298 |map| 304 |magnitude| 317 |less?| 322
              |length| 328 |latex| 333 |insert| 338 |indices| 352 |index?| 357
              |hash| 363 |first| 368 |find| 373 |fill!| 379 |extend| 385
              |every?| 391 |eval| 397 |eq?| 423 |entry?| 429 |entries| 435
              |empty?| 440 |empty| 445 |elt| 449 |dot| 468 |dimension| 474
              |delete| 479 |cross| 491 |count| 497 |copyInto!| 509 |copy| 516
              |convert| 521 |construct| 531 |concat| 536 |coerce| 559 |any?|
              564 >= 570 > 576 = 582 <= 588 < 594 - 600 + 611 * 617 |#| 635)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 2 0 2 0 0 7 5 0 0 0 0 7 1 5 9
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
              (|makeByteWordVec2| 42
                                  '(2 0 0 7 6 8 1 0 9 0 10 3 0 6 0 9 6 11 1 0 7
                                    0 14 2 7 18 0 0 19 2 0 6 0 9 20 2 6 0 0 0
                                    21 2 6 0 0 0 22 0 6 0 23 2 0 0 0 0 25 2 4
                                    18 0 0 1 1 11 0 7 1 3 18 33 0 9 9 1 1 2 18
                                    0 1 2 0 18 31 0 1 1 19 0 0 1 2 18 0 31 0 1
                                    1 2 0 0 1 2 0 0 31 0 1 2 2 18 0 0 1 2 0 18
                                    0 7 1 3 18 6 0 32 6 1 3 18 6 0 9 6 11 2 16
                                    0 30 0 1 0 0 0 1 1 18 0 0 1 1 0 0 0 1 1 17
                                    0 0 1 2 17 0 6 0 1 2 16 0 30 0 1 4 17 6 27
                                    0 6 6 1 2 16 6 27 0 1 3 16 6 27 0 6 1 3 18
                                    6 0 9 6 1 2 0 6 0 9 1 2 4 9 6 0 1 3 4 9 6 0
                                    9 1 2 0 9 30 0 1 1 0 0 12 13 1 16 12 0 1 2
                                    14 37 0 0 1 2 0 0 7 6 8 2 0 18 0 7 1 1 3 9
                                    0 10 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 31 0 0 1
                                    1 16 12 0 1 2 17 18 6 0 1 1 3 9 0 1 2 2 0 0
                                    0 1 2 18 0 34 0 1 3 0 0 27 0 0 1 2 0 0 34 0
                                    1 1 15 6 0 1 2 0 18 0 7 1 1 15 6 0 1 1 4 38
                                    0 1 3 0 0 0 0 9 1 3 0 0 6 0 9 1 1 0 42 0 1
                                    2 0 18 9 0 1 1 4 39 0 1 1 3 6 0 1 2 0 41 30
                                    0 1 2 18 0 0 6 1 2 0 0 0 12 26 2 16 18 30 0
                                    1 3 6 0 0 12 12 1 2 6 0 0 28 1 3 6 0 0 6 6
                                    1 2 6 0 0 29 1 2 0 18 0 0 1 2 17 18 6 0 1 1
                                    0 12 0 1 1 0 18 0 1 0 0 0 1 2 0 0 0 32 1 3
                                    0 6 0 9 6 1 2 0 6 0 9 20 2 14 6 0 0 1 1 0
                                    15 0 16 2 0 0 0 32 1 2 0 0 0 9 1 2 0 0 0 0
                                    24 2 17 7 6 0 1 2 16 7 30 0 1 3 18 0 0 0 9
                                    1 1 0 0 0 1 1 1 36 0 1 1 0 0 12 17 1 0 0 12
                                    1 1 0 0 40 1 2 0 0 0 0 25 2 0 0 0 6 1 2 0 0
                                    6 0 1 1 8 35 0 1 2 16 18 30 0 1 2 2 18 0 0
                                    1 2 2 18 0 0 1 2 4 18 0 0 1 2 2 18 0 0 1 2
                                    2 18 0 0 1 2 12 0 0 0 1 1 12 0 0 1 2 10 0 0
                                    0 1 2 12 0 9 0 1 2 13 0 0 6 1 2 13 0 6 0 1
                                    1 16 7 0 14)))))
           '|lookupComplete|)) 
