
(SDEFUN |DLIST;elt;$unique$;1| ((|x| $) (T3 "unique") ($ $))
        (SPADCALL |x| (QREFELT $ 7))) 

(SDEFUN |DLIST;elt;$sort$;2| ((|x| $) (T4 "sort") ($ $))
        (SPADCALL |x| (QREFELT $ 10))) 

(SDEFUN |DLIST;elt;$countNni;3| ((|x| $) (T5 "count") ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 14))) 

(PUT '|DLIST;coerce;L$;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;L$;4| ((|x| |List| S) ($ $)) |x|) 

(PUT '|DLIST;coerce;$L;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;$L;5| ((|x| $) ($ |List| S)) |x|) 

(SDEFUN |DLIST;coerce;$Of;6| ((|x| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 20))) 

(SDEFUN |DLIST;datalist;L$;7| ((|x| |List| S) ($ $))
        (SPADCALL |x| (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |DataList;|)) 

(DEFUN |DataList| (#1=#:G122)
  (SPROG NIL
         (PROG (#2=#:G123)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DataList|)
                                               '|domainEqualList|)
                    . #3=(|DataList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DataList;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|DataList|)))))))))) 

(DEFUN |DataList;| (|#1|)
  (SPROG
   ((#1=#:G120 NIL) (#2=#:G121 NIL) (|pv$| NIL) (#3=#:G117 NIL) (#4=#:G118 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|DataList|))
    (LETT |dv$| (LIST '|DataList| DV$1) . #5#)
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
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
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
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 2048))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 4096))
    (AND (OR #2# #4#) (|augmentPredVector| $ 8192))
    (AND #4# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 16384))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #5#)
         (|augmentPredVector| $ 32768))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;$unique$;1|
              (5 . |sort|) '"sort" |DLIST;elt;$sort$;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;$countNni;3| |DLIST;coerce;L$;4|
              |DLIST;coerce;$L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;$Of;6| |DLIST;datalist;L$;7| (|Mapping| 6 6 6)
              (|Boolean|) (|List| 26) (|Equation| 6) (|Integer|)
              (|Mapping| 24 6) (|Mapping| 24 6 6) (|Void|)
              (|UniversalSegment| 27) '"last" '"rest" '"first" '"value"
              (|List| $) (|Mapping| 6 6) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|List| 27) (|Union| 6 '"failed"))
           '#(~= 20 |value| 26 |third| 31 |tail| 36 |swap!| 41 |split!| 48
              |sorted?| 54 |sort!| 65 |sort| 76 |smaller?| 87 |size?| 93
              |setvalue!| 99 |setrest!| 105 |setlast!| 111 |setfirst!| 117
              |setelt| 123 |setchildren!| 165 |select!| 171 |select| 177
              |second| 183 |sample| 188 |reverse!| 192 |reverse| 197 |rest| 202
              |removeDuplicates!| 213 |removeDuplicates| 218 |remove!| 223
              |remove| 235 |reduce| 247 |qsetrest!| 268 |qsetfirst!| 274
              |qsetelt!| 280 |qelt| 287 |possiblyInfinite?| 293 |position| 298
              |parts| 317 |nodes| 322 |node?| 327 |new| 333 |more?| 339
              |minIndex| 345 |min| 350 |merge!| 356 |merge| 369 |members| 382
              |member?| 387 |maxIndex| 393 |max| 398 |map!| 404 |map| 410
              |list| 423 |less?| 428 |leaves| 434 |leaf?| 439 |latex| 444
              |last| 449 |insert!| 460 |insert| 474 |indices| 488 |index?| 493
              |hashUpdate!| 499 |hash| 505 |first| 510 |find| 521 |fill!| 527
              |explicitlyFinite?| 533 |every?| 538 |eval| 544 |eq?| 570
              |entry?| 576 |entries| 582 |empty?| 587 |empty| 592 |elt| 596
              |distance| 657 |delete!| 663 |delete| 675 |datalist| 687
              |cyclic?| 692 |cycleTail| 697 |cycleSplit!| 702 |cycleLength| 707
              |cycleEntry| 712 |count| 717 |copyInto!| 729 |copy| 736 |convert|
              741 |construct| 746 |concat!| 751 |concat| 763 |coerce| 786
              |children| 801 |child?| 806 |any?| 812 >= 818 > 824 = 830 <= 836
              < 842 |#| 848)
           'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 0 0 0 0 0 0 0 0 2 0 2 0 0 8 6 0 0 0 0 8 10
                                  1 5 2))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| |FiniteLinearAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL |BasicType&| |PartialOrder&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 27 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 27 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 27 6)
                 (|InnerEvalable| 6 6) (|CoercibleTo| 19) (|ConvertibleTo| 38)
                 (|BasicType|) (|PartialOrder|))
              (|makeByteWordVec2| 43
                                  '(1 0 0 0 7 1 0 0 0 10 1 0 13 0 14 1 5 19 0
                                    20 2 14 24 0 0 1 1 0 6 0 1 1 0 6 0 1 1 0 0
                                    0 1 3 16 30 0 27 27 1 2 16 0 0 27 1 1 2 24
                                    0 1 2 0 24 29 0 1 1 17 0 0 1 2 16 0 29 0 1
                                    1 2 0 0 10 2 0 0 29 0 1 2 2 24 0 0 1 2 0 24
                                    0 13 1 2 16 6 0 6 1 2 16 0 0 0 1 2 16 6 0 6
                                    1 2 16 6 0 6 1 3 16 6 0 27 6 1 3 16 6 0 31
                                    6 1 3 16 6 0 32 6 1 3 16 0 0 33 0 1 3 16 6
                                    0 34 6 1 3 16 6 0 35 6 1 2 16 0 0 36 1 2 0
                                    0 28 0 1 2 12 0 28 0 1 1 0 6 0 1 0 0 0 1 1
                                    16 0 0 1 1 0 0 0 1 2 0 0 0 13 1 1 0 0 0 1 1
                                    4 0 0 1 1 13 0 0 7 2 4 0 6 0 1 2 0 0 28 0 1
                                    2 13 0 6 0 1 2 12 0 28 0 1 4 13 6 23 0 6 6
                                    1 3 12 6 23 0 6 1 2 12 6 23 0 1 2 16 0 0 0
                                    1 2 16 6 0 6 1 3 16 6 0 27 6 1 2 0 6 0 27 1
                                    1 0 24 0 1 3 3 27 6 0 27 1 2 3 27 6 0 1 2 0
                                    27 28 0 1 1 12 5 0 1 1 0 36 0 1 2 4 24 0 0
                                    1 2 0 0 13 6 1 2 0 24 0 13 1 1 11 27 0 1 2
                                    2 0 0 0 1 2 2 0 0 0 1 3 0 0 29 0 0 1 2 2 0
                                    0 0 1 3 0 0 29 0 0 1 1 12 5 0 1 2 13 24 6 0
                                    1 1 11 27 0 1 2 2 0 0 0 1 2 16 0 37 0 1 3 0
                                    0 23 0 0 1 2 0 0 37 0 1 1 0 0 6 1 2 0 24 0
                                    13 1 1 0 5 0 1 1 0 24 0 1 1 4 41 0 1 2 0 0
                                    0 13 1 1 0 6 0 1 3 0 0 0 0 27 1 3 0 0 6 0
                                    27 1 3 0 0 6 0 27 1 3 0 0 0 0 27 1 1 0 42 0
                                    1 2 0 24 27 0 1 2 4 39 39 0 1 1 4 40 0 1 2
                                    0 0 0 13 1 1 0 6 0 1 2 0 43 28 0 1 2 16 0 0
                                    6 1 1 0 24 0 1 2 12 24 28 0 1 3 7 0 0 5 5 1
                                    3 7 0 0 6 6 1 2 7 0 0 25 1 2 7 0 0 26 1 2 0
                                    24 0 0 1 2 15 24 6 0 1 1 0 5 0 1 1 0 24 0 1
                                    0 0 0 1 2 0 0 0 11 12 2 0 13 0 15 16 2 0 0
                                    0 8 9 3 0 6 0 27 6 1 2 0 6 0 27 1 2 0 0 0
                                    31 1 2 0 6 0 32 1 2 0 0 0 33 1 2 0 6 0 34 1
                                    2 0 6 0 35 1 2 0 27 0 0 1 2 0 0 0 27 1 2 0
                                    0 0 31 1 2 0 0 0 27 1 2 0 0 0 31 1 1 0 0 5
                                    22 1 0 24 0 1 1 0 0 0 1 1 16 0 0 1 1 0 13 0
                                    1 1 0 0 0 1 2 13 13 6 0 1 2 12 13 28 0 1 3
                                    16 0 0 0 27 1 1 0 0 0 1 1 1 38 0 1 1 0 0 5
                                    1 2 0 0 0 6 1 2 0 0 0 0 1 1 0 0 36 1 2 0 0
                                    0 6 1 2 0 0 0 0 1 2 0 0 6 0 1 1 9 19 0 21 1
                                    0 0 5 17 1 0 5 0 18 1 0 36 0 1 2 4 24 0 0 1
                                    2 12 24 28 0 1 2 2 24 0 0 1 2 2 24 0 0 1 2
                                    14 24 0 0 1 2 2 24 0 0 1 2 2 24 0 0 1 1 12
                                    13 0 14)))))
           '|lookupComplete|)) 
