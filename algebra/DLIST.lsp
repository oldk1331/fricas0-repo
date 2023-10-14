
(/VERSIONCHECK 2) 

(DEFUN |DLIST;elt;$unique$;1| (|x| T3 $) (SPADCALL |x| (QREFELT $ 7))) 

(DEFUN |DLIST;elt;$sort$;2| (|x| T4 $) (SPADCALL |x| (QREFELT $ 10))) 

(DEFUN |DLIST;elt;$countNni;3| (|x| T5 $) (SPADCALL |x| (QREFELT $ 14))) 

(PUT '|DLIST;coerce;L$;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |DLIST;coerce;L$;4| (|x| $) |x|) 

(PUT '|DLIST;coerce;$L;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |DLIST;coerce;$L;5| (|x| $) |x|) 

(DEFUN |DLIST;coerce;$Of;6| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 20))) 

(DEFUN |DLIST;datalist;L$;7| (|x| $) (SPADCALL |x| (QREFELT $ 17))) 

(DEFUN |DataList| (#1=#:G142)
  (PROG ()
    (RETURN
     (PROG (#2=#:G143)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|DataList|))))))))))) 

(DEFUN |DataList;| (|#1|)
  (PROG (#1=#:G141 |pv$| #2=#:G139 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|DataList|))
      (LETT |dv$| (LIST '|DataList| DV$1) . #3#)
      (LETT $ (GETREFV 44) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (|HasCategory| |#1|
                                                         '(|CoercibleTo|
                                                           (|OutputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1| '(|OrderedSet|))
                                           #2#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
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
                                            #2#))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CoercibleTo|
                                                            (|OutputForm|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 512))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 1024))
      (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #3#)
           (|augmentPredVector| $ 2048))
      (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
           (|augmentPredVector| $ 4096))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;$unique$;1|
              (5 . |sort|) '"sort" |DLIST;elt;$sort$;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;$countNni;3| |DLIST;coerce;L$;4|
              |DLIST;coerce;$L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;$Of;6| |DLIST;datalist;L$;7| (|Boolean|)
              (|Mapping| 6 6 6) (|List| 26) (|Equation| 6) (|Integer|)
              (|Mapping| 23 6) (|Mapping| 23 6 6) (|Void|)
              (|UniversalSegment| 27) '"last" '"rest" '"first" '"value"
              (|List| $) (|Mapping| 6 6) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|List| 27) (|Union| 6 '"failed"))
           '#(~= 20 |value| 26 |third| 31 |tail| 36 |swap!| 41 |split!| 48
              |sorted?| 54 |sort!| 65 |sort| 76 |smaller?| 87 |size?| 93
              |setvalue!| 99 |setrest!| 105 |setlast!| 111 |setfirst!| 117
              |setelt| 123 |setchildren!| 165 |select!| 171 |select| 177
              |second| 183 |sample| 188 |reverse!| 192 |reverse| 197 |rest| 202
              |removeDuplicates!| 213 |removeDuplicates| 218 |remove!| 223
              |remove| 235 |reduce| 247 |qsetelt!| 268 |qelt| 275
              |possiblyInfinite?| 281 |position| 286 |parts| 305 |nodes| 310
              |node?| 315 |new| 321 |more?| 327 |minIndex| 333 |min| 338
              |merge!| 344 |merge| 357 |members| 370 |member?| 375 |maxIndex|
              381 |max| 386 |map!| 392 |map| 398 |list| 411 |less?| 416
              |leaves| 422 |leaf?| 427 |latex| 432 |last| 437 |insert!| 448
              |insert| 462 |indices| 476 |index?| 481 |hashUpdate!| 487 |hash|
              493 |first| 498 |find| 509 |fill!| 515 |explicitlyFinite?| 521
              |every?| 526 |eval| 532 |eq?| 558 |entry?| 564 |entries| 570
              |empty?| 575 |empty| 580 |elt| 584 |distance| 645 |delete!| 651
              |delete| 663 |datalist| 675 |cyclic?| 680 |cycleTail| 685
              |cycleSplit!| 690 |cycleLength| 695 |cycleEntry| 700 |count| 705
              |copyInto!| 717 |copy| 724 |convert| 729 |construct| 734
              |concat!| 739 |concat| 751 |coerce| 774 |children| 789 |child?|
              794 |any?| 800 >= 806 > 812 = 818 <= 824 < 830 |#| 836)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 0 0 0 2 0 2 0 0 8 6 0 0 0 0 8 9 1
                                  6 2))
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
                                    20 2 5 23 0 0 1 1 0 6 0 1 1 0 6 0 1 1 0 0 0
                                    1 3 12 30 0 27 27 1 2 12 0 0 27 1 1 2 23 0
                                    1 2 0 23 29 0 1 1 13 0 0 1 2 12 0 29 0 1 1
                                    2 0 0 10 2 0 0 29 0 1 2 2 23 0 0 1 2 0 23 0
                                    13 1 2 12 6 0 6 1 2 12 0 0 0 1 2 12 6 0 6 1
                                    2 12 6 0 6 1 3 12 6 0 27 6 1 3 12 6 0 31 6
                                    1 3 12 6 0 32 6 1 3 12 0 0 33 0 1 3 12 6 0
                                    34 6 1 3 12 6 0 35 6 1 2 12 0 0 36 1 2 0 0
                                    28 0 1 2 10 0 28 0 1 1 0 6 0 1 0 0 0 1 1 12
                                    0 0 1 1 0 0 0 1 2 0 0 0 13 1 1 0 0 0 1 1 5
                                    0 0 1 1 11 0 0 7 2 5 0 6 0 1 2 0 0 28 0 1 2
                                    11 0 6 0 1 2 10 0 28 0 1 4 11 6 24 0 6 6 1
                                    2 10 6 24 0 1 3 10 6 24 0 6 1 3 12 6 0 27 6
                                    1 2 0 6 0 27 1 1 0 23 0 1 3 5 27 6 0 27 1 2
                                    5 27 6 0 1 2 0 27 28 0 1 1 10 5 0 1 1 0 36
                                    0 1 2 5 23 0 0 1 2 0 0 13 6 1 2 0 23 0 13 1
                                    1 4 27 0 1 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 29
                                    0 0 1 2 2 0 0 0 1 3 0 0 29 0 0 1 1 10 5 0 1
                                    2 11 23 6 0 1 1 4 27 0 1 2 2 0 0 0 1 2 12 0
                                    37 0 1 3 0 0 24 0 0 1 2 0 0 37 0 1 1 0 0 6
                                    1 2 0 23 0 13 1 1 0 5 0 1 1 0 23 0 1 1 5 41
                                    0 1 2 0 0 0 13 1 1 0 6 0 1 3 0 0 0 0 27 1 3
                                    0 0 6 0 27 1 3 0 0 0 0 27 1 3 0 0 6 0 27 1
                                    1 0 42 0 1 2 0 23 27 0 1 2 5 39 39 0 1 1 5
                                    40 0 1 2 0 0 0 13 1 1 0 6 0 1 2 0 43 28 0 1
                                    2 12 0 0 6 1 1 0 23 0 1 2 10 23 28 0 1 3 7
                                    0 0 5 5 1 3 7 0 0 6 6 1 2 7 0 0 25 1 2 7 0
                                    0 26 1 2 0 23 0 0 1 2 11 23 6 0 1 1 0 5 0 1
                                    1 0 23 0 1 0 0 0 1 2 0 0 0 11 12 2 0 13 0
                                    15 16 2 0 0 0 8 9 2 0 6 0 27 1 3 0 6 0 27 6
                                    1 2 0 0 0 31 1 2 0 6 0 32 1 2 0 0 0 33 1 2
                                    0 6 0 34 1 2 0 6 0 35 1 2 0 27 0 0 1 2 0 0
                                    0 27 1 2 0 0 0 31 1 2 0 0 0 31 1 2 0 0 0 27
                                    1 1 0 0 5 22 1 0 23 0 1 1 0 0 0 1 1 12 0 0
                                    1 1 0 13 0 1 1 0 0 0 1 2 11 13 6 0 1 2 10
                                    13 28 0 1 3 12 0 0 0 27 1 1 0 0 0 1 1 1 38
                                    0 1 1 0 0 5 1 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0
                                    0 6 1 1 0 0 36 1 2 0 0 0 0 1 2 0 0 6 0 1 1
                                    3 19 0 21 1 0 0 5 17 1 0 5 0 18 1 0 36 0 1
                                    2 5 23 0 0 1 2 10 23 28 0 1 2 2 23 0 0 1 2
                                    2 23 0 0 1 2 5 23 0 0 1 2 2 23 0 0 1 2 2 23
                                    0 0 1 1 10 13 0 14)))))
           '|lookupComplete|)) 
