
(PUT '|SEQU;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SEQU;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|SEQU;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |SEQU;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |SEQU;Zero;$;3| (($ $))
        (|SEQU;per| (SPADCALL (LIST (|spadConstant| $ 8)) (QREFELT $ 10)) $)) 

(SDEFUN |SEQU;elt;$IR;4| ((|mm| $) (|n| |Integer|) ($ R))
        (COND ((< |n| 1) (|error| "no such element"))
              ('T (SPADCALL (|SEQU;rep| |mm| $) |n| (QREFELT $ 14))))) 

(SDEFUN |SEQU;apply;$PR;5| ((|mm| $) (|pi| |Partition|) ($ R))
        (SPROG
         ((#1=#:G118 NIL) (|k| NIL) (#2=#:G117 NIL)
          (|pil| (|List| (|Integer|))))
         (SEQ
          (LETT |pil| (SPADCALL |pi| (QREFELT $ 18)) . #3=(|SEQU;apply;$PR;5|))
          (EXIT
           (SPADCALL (ELT $ 19)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |pil| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |mm| |k| (QREFELT $ 15))
                                         #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 21)))))) 

(SDEFUN |SEQU;cons;R2$;6| ((|r| R) (|s| $) ($ $))
        (|SEQU;per| (SPADCALL |r| (|SEQU;rep| |s| $) (QREFELT $ 23)) $)) 

(SDEFUN |SEQU;+;3$;7| ((|x| $) (|y| $) ($ $))
        (|SEQU;per|
         (SPADCALL (ELT $ 25) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $)
                   (QREFELT $ 26))
         $)) 

(SDEFUN |SEQU;-;2$;8| ((|x| $) ($ $))
        (|SEQU;per| (SPADCALL (ELT $ 28) (|SEQU;rep| |x| $) (QREFELT $ 30)) $)) 

(SDEFUN |SEQU;multiply| ((|x| $) (|y| $) ($ $))
        (|SEQU;per|
         (SPADCALL (ELT $ 19) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $)
                   (QREFELT $ 26))
         $)) 

(SDEFUN |SEQU;*;R2$;10| ((|x| R) (|y| $) ($ $))
        (SPROG NIL
               (|SEQU;per|
                (SPADCALL (CONS #'|SEQU;*;R2$;10!0| (VECTOR $ |x|))
                          (|SEQU;rep| |y| $) (QREFELT $ 30))
                $))) 

(SDEFUN |SEQU;*;R2$;10!0| ((|t| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|SEQU;*;R2$;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 19)))))) 

(SDEFUN |SEQU;=;2$B;11| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (|SEQU;rep| |x| $) (|SEQU;rep| |y| $) (QREFELT $ 34))) 

(SDEFUN |SEQU;coerce;S$;12| ((|x| |Stream| R) ($ $)) (|SEQU;per| |x| $)) 

(SDEFUN |SEQU;sequence;S$;13| ((|x| |Stream| R) ($ $)) (|SEQU;per| |x| $)) 

(SDEFUN |SEQU;stream;$S;14| ((|x| $) ($ |Stream| R)) (|SEQU;rep| |x| $)) 

(SDEFUN |SEQU;first;$Nni$;15| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (|SEQU;per| (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39)) $)) 

(SDEFUN |SEQU;firstn;$NniL;16|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |List| R))
        (SPADCALL
         (SPADCALL (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39))
                   (QREFELT $ 41))
         (QREFELT $ 42))) 

(SDEFUN |SEQU;sequence;MR$;17| ((|f| |Mapping| R R) (|r| R) ($ $))
        (|SEQU;per| (SPADCALL |f| |r| (QREFELT $ 44)) $)) 

(SDEFUN |SEQU;coerce;$Of;18| ((|mm| $) ($ |OutputForm|))
        (SPADCALL (|SEQU;rep| |mm| $) (QREFELT $ 47))) 

(SDEFUN |SEQU;dilate;R2$;19| ((|a| R) (|mm| $) ($ $))
        (SPROG ((|apow| ($)))
               (SEQ
                (LETT |apow|
                      (SPADCALL (CONS #'|SEQU;dilate;R2$;19!0| (VECTOR $ |a|))
                                |a| (QREFELT $ 45))
                      |SEQU;dilate;R2$;19|)
                (EXIT (|SEQU;multiply| |apow| |mm| $))))) 

(SDEFUN |SEQU;dilate;R2$;19!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SEQU;dilate;R2$;19|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |a| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |Sequence;|)) 

(DEFUN |Sequence| (#1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Sequence|)
                                               '|domainEqualList|)
                    . #3=(|Sequence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Sequence;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Sequence|)))))))))) 

(DEFUN |Sequence;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G144 NIL) (#2=#:G145 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|Sequence|))
    (LETT |dv$| (LIST '|Sequence| DV$1) . #3#)
    (LETT $ (GETREFV 67) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #3#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|Sequence| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 512))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 1024))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Stream| |#1|))
    $))) 

(MAKEPROP '|Sequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stream| 6) (|local| |#1|) '|Rep|
              (0 . |Zero|) (|List| 6) (4 . |repeating|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SEQU;Zero;$;3|) $))
              (9 . |One|) (|Integer|) (13 . |elt|) |SEQU;elt;$IR;4| (|List| 13)
              (|Partition|) (19 . |convert|) (24 . *) (|Mapping| 6 6 6)
              (30 . |reduce|) |SEQU;apply;$PR;5| (36 . |cons|)
              |SEQU;cons;R2$;6| (42 . +) (48 . |map|) |SEQU;+;3$;7| (55 . -)
              (|Mapping| 6 6) (60 . |map|) |SEQU;-;2$;8| |SEQU;*;R2$;10|
              (|Boolean|) |SEQU;=;2$B;11| |SEQU;coerce;S$;12|
              |SEQU;sequence;S$;13| |SEQU;stream;$S;14| (|NonNegativeInteger|)
              (66 . |first|) |SEQU;first;$Nni$;15| (72 . |complete|)
              (77 . |entries|) |SEQU;firstn;$NniL;16| (82 . |stream|)
              |SEQU;sequence;MR$;17| (|OutputForm|) (88 . |coerce|)
              |SEQU;coerce;$Of;18| |SEQU;dilate;R2$;19| (|Equation| 6)
              (|List| 50) (|Mapping| 33 6) (|Void|) (|UniversalSegment| 13)
              '"last" '"rest" '"first" (|List| $) '"value"
              (|Union| $ '"failed") (|InputForm|) (|SingleInteger|) (|String|)
              (|HashState|) (|PositiveInteger|) (|Union| 6 '"failed"))
           '#(~= 93 |zero?| 99 |value| 104 |third| 109 |tail| 114 |swap!| 119
              |subtractIfCan| 126 |stream| 132 |split!| 137 |size?| 143
              |setvalue!| 149 |setrest!| 155 |setlast!| 161 |setfirst!| 167
              |setelt| 173 |setchildren!| 215 |sequence| 221 |select| 232
              |second| 238 |sample| 243 |rst| 247 |rest| 252 |removeDuplicates|
              263 |remove| 268 |reduce| 280 |qsetrest!| 301 |qsetfirst!| 307
              |qsetelt!| 313 |qelt| 320 |possiblyInfinite?| 326 |parts| 331
              |opposite?| 336 |numberOfComputedEntries| 342 |nodes| 347 |node?|
              352 |new| 358 |more?| 364 |minIndex| 370 |members| 375 |member?|
              380 |maxIndex| 386 |map!| 391 |map| 397 |less?| 410 |leaves| 416
              |leaf?| 421 |lazyEvaluate| 426 |lazy?| 431 |latex| 436 |last| 441
              |insert| 452 |indices| 466 |index?| 471 |hashUpdate!| 477 |hash|
              483 |frst| 488 |firstn| 493 |first| 499 |find| 510 |fill!| 516
              |extend| 522 |explicitlyFinite?| 528 |explicitlyEmpty?| 533
              |explicitEntries?| 538 |every?| 543 |eval| 549 |eq?| 575 |entry?|
              581 |entries| 587 |empty?| 592 |empty| 597 |elt| 601 |distance|
              644 |dilate| 650 |delete| 656 |cyclic?| 668 |cycleTail| 673
              |cycleSplit!| 678 |cycleLength| 683 |cycleEntry| 688 |count| 693
              |copy| 705 |convert| 710 |construct| 715 |cons| 720 |concat!| 726
              |concat| 738 |complete| 761 |coerce| 766 |children| 776 |child?|
              781 |apply| 787 |any?| 793 |Zero| 799 = 803 - 809 + 820 * 826 |#|
              856)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 0 0 0 0 0 0 2 0 0 2 0 0 0 8 0 0 0 0 0 4 0 0
                                  0 0 4 1))
            (CONS
             '#(NIL |Module&| NIL |LazyStreamAggregate&| NIL NIL
                |StreamAggregate&| |AbelianGroup&| |UnaryRecursiveAggregate&|
                |LinearAggregate&| NIL |RecursiveAggregate&| |Collection&|
                |IndexedAggregate&| |AbelianMonoid&| |AbelianSemiGroup&|
                |HomogeneousAggregate&| |SetCategory&| |EltableAggregate&|
                |Aggregate&| |Evalable&| NIL |BasicType&| NIL NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|SequenceCategory| 6) (|Module| 6) (|BiModule| 6 6)
                 (|LazyStreamAggregate| 6) (|RightModule| 6) (|LeftModule| 6)
                 (|StreamAggregate| 6) (|AbelianGroup|)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|CancellationAbelianMonoid|) (|RecursiveAggregate| 6)
                 (|Collection| 6) (|IndexedAggregate| 13 6) (|AbelianMonoid|)
                 (|AbelianSemiGroup|) (|HomogeneousAggregate| 6)
                 (|SetCategory|) (|EltableAggregate| 13 6) (|Aggregate|)
                 (|Evalable| 6) (|CoercibleTo| 46) (|BasicType|)
                 (|Eltable| 13 6) (|Type|) (|InnerEvalable| 6 6)
                 (|ConvertibleTo| 61))
              (|makeByteWordVec2| 66
                                  '(0 6 0 8 1 7 0 9 10 0 6 0 12 2 7 6 0 13 14 1
                                    17 16 0 18 2 6 0 0 0 19 2 9 6 20 0 21 2 7 0
                                    6 0 23 2 6 0 0 0 25 3 0 0 20 0 0 26 1 6 0 0
                                    28 2 0 0 29 0 30 2 7 0 0 38 39 1 0 0 0 41 1
                                    0 9 0 42 2 7 0 29 6 44 1 7 46 0 47 2 0 33 0
                                    0 1 1 7 33 0 1 1 0 6 0 1 1 0 6 0 1 1 0 0 0
                                    1 3 12 53 0 13 13 1 2 2 60 0 0 1 1 0 5 0 37
                                    2 12 0 0 13 1 2 0 33 0 38 1 2 12 6 0 6 1 2
                                    12 0 0 0 1 2 12 6 0 6 1 2 12 6 0 6 1 3 12 6
                                    0 13 6 1 3 12 6 0 54 6 1 3 12 6 0 55 6 1 3
                                    12 0 0 56 0 1 3 12 6 0 57 6 1 3 12 6 0 59 6
                                    1 2 12 0 0 58 1 2 0 0 29 6 45 1 0 0 5 36 2
                                    0 0 52 0 1 1 0 6 0 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 38 1 1 0 0 0 1 1 10 0 0 1 2 10 0 6 0 1
                                    2 0 0 52 0 1 4 10 6 20 0 6 6 1 2 9 6 20 0 1
                                    3 9 6 20 0 6 1 2 12 0 0 0 1 2 12 6 0 6 1 3
                                    12 6 0 13 6 1 2 0 6 0 13 1 1 0 33 0 1 1 9 9
                                    0 1 2 7 33 0 0 1 1 0 38 0 1 1 0 58 0 1 2 3
                                    33 0 0 1 2 0 0 38 6 1 2 0 33 0 38 1 1 6 13
                                    0 1 1 9 9 0 1 2 10 33 6 0 1 1 6 13 0 1 2 12
                                    0 29 0 1 3 0 0 20 0 0 26 2 0 0 29 0 30 2 0
                                    33 0 38 1 1 0 9 0 1 1 0 33 0 1 1 0 0 0 1 1
                                    0 33 0 1 1 0 63 0 1 2 0 0 0 38 1 1 0 6 0 1
                                    3 0 0 0 0 13 1 3 0 0 6 0 13 1 1 0 16 0 1 2
                                    0 33 13 0 1 2 0 64 64 0 1 1 0 62 0 1 1 0 6
                                    0 1 2 0 9 0 38 43 2 0 0 0 38 40 1 0 6 0 1 2
                                    0 66 52 0 1 2 12 0 0 6 1 2 0 0 0 13 1 1 0
                                    33 0 1 1 0 33 0 1 1 0 33 0 1 2 9 33 52 0 1
                                    3 4 0 0 6 6 1 3 4 0 0 9 9 1 2 4 0 0 50 1 2
                                    4 0 0 51 1 2 0 33 0 0 1 2 11 33 6 0 1 1 0 9
                                    0 42 1 0 33 0 1 0 0 0 1 3 0 6 0 13 6 1 2 0
                                    6 0 13 15 2 0 0 0 54 1 2 0 6 0 55 1 2 0 0 0
                                    56 1 2 0 6 0 57 1 2 0 6 0 59 1 2 0 13 0 0 1
                                    2 0 0 6 0 49 2 0 0 0 54 1 2 0 0 0 13 1 1 0
                                    33 0 1 1 0 0 0 1 1 12 0 0 1 1 0 38 0 1 1 0
                                    0 0 1 2 10 38 6 0 1 2 9 38 52 0 1 1 0 0 0 1
                                    1 1 61 0 1 1 0 0 9 1 2 0 0 6 0 24 2 12 0 0
                                    6 1 2 12 0 0 0 1 2 0 0 0 6 1 1 0 0 58 1 2 0
                                    0 6 0 1 2 0 0 0 0 1 1 0 0 0 41 1 0 0 5 35 1
                                    0 46 0 48 1 0 58 0 1 2 3 33 0 0 1 2 0 6 0
                                    17 22 2 9 33 52 0 1 0 7 0 11 2 0 33 0 0 34
                                    2 2 0 0 0 1 1 2 0 0 31 2 0 0 0 0 27 2 2 0
                                    13 0 1 2 7 0 38 0 1 2 0 0 65 0 1 2 0 0 6 0
                                    32 2 0 0 0 6 1 1 9 38 0 1)))))
           '|lookupComplete|)) 
