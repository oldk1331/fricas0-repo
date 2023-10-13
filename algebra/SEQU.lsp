
(/VERSIONCHECK 2) 

(PUT '|SEQU;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |SEQU;rep| (|x| $) |x|) 

(PUT '|SEQU;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(DEFUN |SEQU;per| (|r| $) |r|) 

(DEFUN |SEQU;Zero;$;3| ($)
  (|SEQU;per| (SPADCALL (LIST (|spadConstant| $ 8)) (QREFELT $ 10)) $)) 

(DEFUN |SEQU;elt;$IR;4| (|mm| |n| $)
  (COND ((< |n| 1) (|error| "no such element"))
        ('T (SPADCALL (|SEQU;rep| |mm| $) |n| (QREFELT $ 14))))) 

(DEFUN |SEQU;apply;$PR;5| (|mm| |pi| $)
  (PROG (#1=#:G139 |k| #2=#:G138 |pil|)
    (RETURN
     (SEQ (LETT |pil| (SPADCALL |pi| (QREFELT $ 18)) . #3=(|SEQU;apply;$PR;5|))
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
                     (QREFELT $ 21))))))) 

(DEFUN |SEQU;cons;R2$;6| (|r| |s| $)
  (|SEQU;per| (SPADCALL |r| (|SEQU;rep| |s| $) (QREFELT $ 23)) $)) 

(DEFUN |SEQU;+;3$;7| (|x| |y| $)
  (|SEQU;per|
   (SPADCALL (ELT $ 25) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $) (QREFELT $ 26))
   $)) 

(DEFUN |SEQU;-;2$;8| (|x| $)
  (|SEQU;per| (SPADCALL (ELT $ 28) (|SEQU;rep| |x| $) (QREFELT $ 30)) $)) 

(DEFUN |SEQU;multiply| (|x| |y| $)
  (|SEQU;per|
   (SPADCALL (ELT $ 19) (|SEQU;rep| |x| $) (|SEQU;rep| |y| $) (QREFELT $ 26))
   $)) 

(DEFUN |SEQU;*;R2$;10| (|x| |y| $)
  (PROG ()
    (RETURN
     (|SEQU;per|
      (SPADCALL (CONS #'|SEQU;*;R2$;10!0| (VECTOR $ |x|)) (|SEQU;rep| |y| $)
                (QREFELT $ 30))
      $)))) 

(DEFUN |SEQU;*;R2$;10!0| (|t| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|SEQU;*;R2$;10|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 19)))))) 

(DEFUN |SEQU;=;2$B;11| (|x| |y| $)
  (SPADCALL (|SEQU;rep| |x| $) (|SEQU;rep| |y| $) (QREFELT $ 34))) 

(DEFUN |SEQU;coerce;S$;12| (|x| $) (|SEQU;per| |x| $)) 

(DEFUN |SEQU;sequence;S$;13| (|x| $) (|SEQU;per| |x| $)) 

(DEFUN |SEQU;stream;$S;14| (|x| $) (|SEQU;rep| |x| $)) 

(DEFUN |SEQU;first;$Nni$;15| (|x| |n| $)
  (|SEQU;per| (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39)) $)) 

(DEFUN |SEQU;firstn;$NniL;16| (|x| |n| $)
  (SPADCALL
   (SPADCALL (SPADCALL (|SEQU;rep| |x| $) |n| (QREFELT $ 39)) (QREFELT $ 41))
   (QREFELT $ 42))) 

(DEFUN |SEQU;generate;MR$;17| (|f| |r| $)
  (|SEQU;per| (SPADCALL |f| |r| (QREFELT $ 44)) $)) 

(DEFUN |SEQU;coerce;$Of;18| (|mm| $)
  (SPADCALL (|SEQU;rep| |mm| $) (QREFELT $ 47))) 

(DEFUN |SEQU;dilate;R2$;19| (|a| |mm| $)
  (PROG (|apow|)
    (RETURN
     (SEQ
      (LETT |apow|
            (SPADCALL (CONS #'|SEQU;dilate;R2$;19!0| (VECTOR $ |a|)) |a|
                      (QREFELT $ 45))
            |SEQU;dilate;R2$;19|)
      (EXIT (|SEQU;multiply| |apow| |mm| $)))))) 

(DEFUN |SEQU;dilate;R2$;19!0| (|x| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|SEQU;dilate;R2$;19|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |a| (QREFELT $ 19)))))) 

(DEFUN |Sequence| (#1=#:G167)
  (PROG ()
    (RETURN
     (PROG (#2=#:G168)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Sequence|))))))))))) 

(DEFUN |Sequence;| (|#1|)
  (PROG (|pv$| #1=#:G165 #2=#:G166 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Sequence|))
      (LETT |dv$| (LIST '|Sequence| DV$1) . #3#)
      (LETT $ (GETREFV 66) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
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
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           #1#)))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|Sequence| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 256))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 512))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Stream| |#1|))
      $)))) 

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
              (77 . |entries|) |SEQU;firstn;$NniL;16| (82 . |generate|)
              |SEQU;generate;MR$;17| (|OutputForm|) (88 . |coerce|)
              |SEQU;coerce;$Of;18| |SEQU;dilate;R2$;19| (|Equation| 6)
              (|List| 50) (|Mapping| 33 6) (|Void|) (|UniversalSegment| 13)
              '"last" '"rest" '"first" '"value" (|List| $)
              (|Union| $ '"failed") (|InputForm|) (|SingleInteger|) (|String|)
              (|PositiveInteger|) (|Union| 6 '"failed"))
           '#(~= 93 |zero?| 99 |value| 104 |third| 109 |tail| 114 |swap!| 119
              |subtractIfCan| 126 |stream| 132 |split!| 137 |size?| 143
              |setvalue!| 149 |setrest!| 155 |setlast!| 161 |setfirst!| 167
              |setelt| 173 |setchildren!| 215 |sequence| 221 |select| 226
              |second| 232 |sample| 237 |rst| 241 |rest| 246 |removeDuplicates|
              257 |remove| 262 |reduce| 274 |qsetelt!| 295 |qelt| 302
              |possiblyInfinite?| 308 |parts| 313 |numberOfComputedEntries| 318
              |nodes| 323 |node?| 328 |new| 334 |more?| 340 |minIndex| 346
              |members| 351 |member?| 356 |maxIndex| 362 |map!| 367 |map| 373
              |less?| 386 |leaves| 392 |leaf?| 397 |lazyEvaluate| 402 |lazy?|
              407 |latex| 412 |last| 417 |insert| 428 |indices| 442 |index?|
              447 |hash| 453 |generate| 458 |frst| 464 |firstn| 469 |first| 475
              |find| 486 |fill!| 492 |extend| 498 |explicitlyFinite?| 504
              |explicitlyEmpty?| 509 |explicitEntries?| 514 |every?| 519 |eval|
              525 |eq?| 551 |entry?| 557 |entries| 563 |empty?| 568 |empty| 573
              |elt| 577 |distance| 620 |dilate| 626 |delete| 632 |cyclic?| 644
              |cycleTail| 649 |cycleSplit!| 654 |cycleLength| 659 |cycleEntry|
              664 |count| 669 |copy| 681 |convert| 686 |construct| 691 |cons|
              696 |concat!| 702 |concat| 714 |complete| 737 |coerce| 742
              |children| 752 |child?| 757 |apply| 763 |any?| 769 |Zero| 775 =
              779 - 785 + 796 * 802 |#| 832)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 0 2 0 0 2 0 0 0 7 0 0 0 0 0 4 0 0
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
              (|makeByteWordVec2| 65
                                  '(0 6 0 8 1 7 0 9 10 0 6 0 12 2 7 6 0 13 14 1
                                    17 16 0 18 2 6 0 0 0 19 2 9 6 20 0 21 2 7 0
                                    6 0 23 2 6 0 0 0 25 3 0 0 20 0 0 26 1 6 0 0
                                    28 2 0 0 29 0 30 2 7 0 0 38 39 1 0 0 0 41 1
                                    0 9 0 42 2 7 0 29 6 44 1 7 46 0 47 2 0 33 0
                                    0 1 1 6 33 0 1 1 0 6 0 1 1 0 6 0 1 1 0 0 0
                                    1 3 10 53 0 13 13 1 2 2 60 0 0 1 1 0 5 0 37
                                    2 10 0 0 13 1 2 0 33 0 38 1 2 10 6 0 6 1 2
                                    10 0 0 0 1 2 10 6 0 6 1 2 10 6 0 6 1 3 10 6
                                    0 13 6 1 3 10 6 0 54 6 1 3 10 6 0 55 6 1 3
                                    10 0 0 56 0 1 3 10 6 0 57 6 1 3 10 6 0 58 6
                                    1 2 10 0 0 59 1 1 0 0 5 36 2 0 0 52 0 1 1 0
                                    6 0 1 0 0 0 1 1 0 0 0 1 2 0 0 0 38 1 1 0 0
                                    0 1 1 9 0 0 1 2 9 0 6 0 1 2 0 0 52 0 1 4 9
                                    6 20 0 6 6 1 2 8 6 20 0 1 3 8 6 20 0 6 1 3
                                    10 6 0 13 6 1 2 0 6 0 13 1 1 0 33 0 1 1 8 9
                                    0 1 1 0 38 0 1 1 0 59 0 1 2 3 33 0 0 1 2 0
                                    0 38 6 1 2 0 33 0 38 1 1 5 13 0 1 1 8 9 0 1
                                    2 9 33 6 0 1 1 5 13 0 1 2 10 0 29 0 1 3 0 0
                                    20 0 0 26 2 0 0 29 0 30 2 0 33 0 38 1 1 0 9
                                    0 1 1 0 33 0 1 1 0 0 0 1 1 0 33 0 1 1 0 63
                                    0 1 2 0 0 0 38 1 1 0 6 0 1 3 0 0 0 0 13 1 3
                                    0 0 6 0 13 1 1 0 16 0 1 2 0 33 13 0 1 1 0
                                    62 0 1 2 0 0 29 6 45 1 0 6 0 1 2 0 9 0 38
                                    43 2 0 0 0 38 40 1 0 6 0 1 2 0 65 52 0 1 2
                                    10 0 0 6 1 2 0 0 0 13 1 1 0 33 0 1 1 0 33 0
                                    1 1 0 33 0 1 2 8 33 52 0 1 3 4 0 0 9 9 1 2
                                    4 0 0 50 1 3 4 0 0 6 6 1 2 4 0 0 51 1 2 0
                                    33 0 0 1 2 9 33 6 0 1 1 0 9 0 42 1 0 33 0 1
                                    0 0 0 1 2 0 6 0 13 15 3 0 6 0 13 6 1 2 0 0
                                    0 54 1 2 0 6 0 55 1 2 0 0 0 56 1 2 0 6 0 57
                                    1 2 0 6 0 58 1 2 0 13 0 0 1 2 0 0 6 0 49 2
                                    0 0 0 54 1 2 0 0 0 13 1 1 0 33 0 1 1 0 0 0
                                    1 1 10 0 0 1 1 0 38 0 1 1 0 0 0 1 2 9 38 6
                                    0 1 2 8 38 52 0 1 1 0 0 0 1 1 1 61 0 1 1 0
                                    0 9 1 2 0 0 6 0 24 2 10 0 0 6 1 2 10 0 0 0
                                    1 2 0 0 0 6 1 1 0 0 59 1 2 0 0 0 0 1 2 0 0
                                    6 0 1 1 0 0 0 41 1 0 0 5 35 1 0 46 0 48 1 0
                                    59 0 1 2 3 33 0 0 1 2 0 6 0 17 22 2 8 33 52
                                    0 1 0 6 0 11 2 0 33 0 0 34 2 2 0 0 0 1 1 2
                                    0 0 31 2 0 0 0 0 27 2 2 0 13 0 1 2 6 0 38 0
                                    1 2 0 0 6 0 32 2 0 0 64 0 1 2 0 0 0 6 1 1 8
                                    38 0 1)))))
           '|lookupComplete|)) 
