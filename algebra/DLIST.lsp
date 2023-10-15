
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

(DEFUN |DataList| (#1=#:G125)
  (SPROG NIL
         (PROG (#2=#:G126)
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
   ((#1=#:G121 NIL) (#2=#:G122 NIL) (#3=#:G124 NIL) (#4=#:G123 NIL) (|pv$| NIL)
    (#5=#:G118 NIL) (#6=#:G119 NIL) (#7=#:G120 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|DataList|))
    (LETT |dv$| (LIST '|DataList| DV$1) . #8#)
    (LETT $ (GETREFV 44) . #8#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #8#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #8#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #8#)
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #8#)
         (|augmentPredVector| $ 4096))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #8#)
     (|augmentPredVector| $ 8192))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 16384))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 65536))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #8#)
     (|augmentPredVector| $ 131072))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 262144))
    (AND #6# #4# (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #8#)
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 2097152))
    (AND #4# #1# (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;$unique$;1|
              (5 . |sort|) '"sort" |DLIST;elt;$sort$;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;$countNni;3| |DLIST;coerce;L$;4|
              |DLIST;coerce;$L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;$Of;6| |DLIST;datalist;L$;7| (|Integer|)
              (|Mapping| 26 6 6) (|Mapping| 6 6 6) (|Boolean|) (|List| 28)
              (|Equation| 6) (|HashState|) (|String|) (|SingleInteger|)
              (|Mapping| 26 6) (|Void|) (|UniversalSegment| 23) '"last" '"rest"
              '"first" (|List| $) '"value" (|Mapping| 6 6) (|InputForm|)
              (|List| 23) (|Union| 6 '"failed"))
           '#(~= 20 |value| 26 |third| 31 |tail| 36 |swap!| 41 |split!| 48
              |sorted?| 54 |sort!| 65 |sort| 76 |smaller?| 87 |size?| 93
              |setvalue!| 99 |setrest!| 105 |setlast!| 111 |setfirst!| 117
              |setelt!| 123 |setchildren!| 165 |select!| 171 |select| 177
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
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 0 0 0 1 0 5 0 0 7 9 0 0 0 0 7 8
                                  11 1 2))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL |InnerEvalable&| |BasicType&| NIL |PartialOrder&|
                NIL)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 23 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 23 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 23 6)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 19)
                 (|PartialOrder|) (|ConvertibleTo| 41))
              (|makeByteWordVec2| 43
                                  '(1 0 0 0 7 1 0 0 0 10 1 0 13 0 14 1 5 19 0
                                    20 2 19 26 0 0 1 1 0 6 0 1 1 0 6 0 1 1 0 0
                                    0 1 3 21 33 0 23 23 1 2 21 0 0 23 1 1 14 26
                                    0 1 2 13 26 24 0 1 1 22 0 0 1 2 23 0 24 0 1
                                    1 14 0 0 10 2 13 0 24 0 1 2 17 26 0 0 1 2 0
                                    26 0 13 1 2 21 6 0 6 1 2 21 0 0 0 1 2 21 6
                                    0 6 1 2 21 6 0 6 1 3 21 6 0 23 6 1 3 21 6 0
                                    34 6 1 3 21 6 0 35 6 1 3 21 0 0 36 0 1 3 21
                                    6 0 37 6 1 3 21 6 0 39 6 1 2 21 0 0 38 1 2
                                    0 0 32 0 1 2 13 0 32 0 1 1 0 6 0 1 0 0 0 1
                                    1 23 0 0 1 1 13 0 0 1 2 0 0 0 13 1 1 0 0 0
                                    1 1 6 0 0 1 1 18 0 0 7 2 6 0 6 0 1 2 0 0 32
                                    0 1 2 18 0 6 0 1 2 13 0 32 0 1 4 18 6 25 0
                                    6 6 1 3 13 6 25 0 6 1 2 13 6 25 0 1 2 21 0
                                    0 0 1 2 21 6 0 6 1 3 21 6 0 23 6 1 2 0 6 0
                                    23 1 1 0 26 0 1 2 18 23 6 0 1 3 18 23 6 0
                                    23 1 2 13 23 32 0 1 1 13 5 0 1 1 0 38 0 1 2
                                    3 26 0 0 1 2 0 0 13 6 1 2 0 26 0 13 1 1 12
                                    23 0 1 2 14 0 0 0 1 2 1 0 0 0 1 3 0 0 24 0
                                    0 1 2 14 0 0 0 1 3 13 0 24 0 0 1 1 13 5 0 1
                                    2 18 26 6 0 1 1 12 23 0 1 2 14 0 0 0 1 2 21
                                    0 40 0 1 3 0 0 25 0 0 1 2 0 0 40 0 1 1 0 0
                                    6 1 2 0 26 0 13 1 1 0 5 0 1 1 0 26 0 1 1 16
                                    30 0 1 2 0 0 0 13 1 1 0 6 0 1 3 0 0 0 0 23
                                    1 3 0 0 6 0 23 1 3 0 0 0 0 23 1 3 0 0 6 0
                                    23 1 1 0 42 0 1 2 0 26 23 0 1 2 16 29 29 0
                                    1 1 16 31 0 1 2 0 0 0 13 1 1 0 6 0 1 2 0 43
                                    32 0 1 2 21 0 0 6 1 1 0 26 0 1 2 13 26 32 0
                                    1 3 7 0 0 5 5 1 3 7 0 0 6 6 1 2 7 0 0 27 1
                                    2 7 0 0 28 1 2 0 26 0 0 1 2 20 26 6 0 1 1 0
                                    5 0 1 1 0 26 0 1 0 0 0 1 2 0 0 0 11 12 2 0
                                    13 0 15 16 2 0 0 0 8 9 2 0 6 0 23 1 3 0 6 0
                                    23 6 1 2 0 0 0 34 1 2 0 6 0 35 1 2 0 0 0 36
                                    1 2 0 6 0 37 1 2 0 6 0 39 1 2 0 23 0 0 1 2
                                    0 0 0 23 1 2 0 0 0 34 1 2 0 0 0 23 1 2 0 0
                                    0 34 1 1 0 0 5 22 1 0 26 0 1 1 0 0 0 1 1 21
                                    0 0 1 1 0 13 0 1 1 0 0 0 1 2 18 13 6 0 1 2
                                    13 13 32 0 1 3 23 0 0 0 23 1 1 0 0 0 1 1 2
                                    41 0 1 1 0 0 5 1 2 0 0 0 6 1 2 0 0 0 0 1 2
                                    0 0 0 6 1 1 0 0 38 1 2 0 0 6 0 1 2 0 0 0 0
                                    1 1 15 19 0 21 1 0 0 5 17 1 0 5 0 18 1 0 38
                                    0 1 2 3 26 0 0 1 2 13 26 32 0 1 2 14 26 0 0
                                    1 2 14 26 0 0 1 2 19 26 0 0 1 2 14 26 0 0 1
                                    2 14 26 0 0 1 1 13 13 0 14)))))
           '|lookupComplete|)) 
