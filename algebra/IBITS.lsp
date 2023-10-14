
(SDEFUN |IBITS;minIndex;$I;1| ((|u| $) ($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |IBITS;range| ((|v| $) (|i| |Integer|) ($ |Integer|))
        (SEQ
         (COND
          ((>= |i| 0)
           (COND ((< |i| (SPADCALL |v| (QREFELT $ 10))) (EXIT |i|)))))
         (EXIT (|error| "Index out of range")))) 

(SDEFUN |IBITS;coerce;$Of;3| ((|v| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G119 NIL) (|i| NIL) (|j| NIL) (|s| (|String|))
          (|f| #2=(|Character|)) (|t| #2#))
         (SEQ (LETT |t| (|STR_to_CHAR| "1") . #3=(|IBITS;coerce;$Of;3|))
              (LETT |f| (|STR_to_CHAR| "0") . #3#)
              (LETT |s|
                    (|make_full_CVEC| (SPADCALL |v| (QREFELT $ 10))
                                      (STR_ELT "   " 0))
                    . #3#)
              (SEQ (LETT |j| (QREFELT $ 6) . #3#)
                   (LETT |i| (SPADCALL |s| (QREFELT $ 12)) . #3#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 13)) . #3#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |s| |i|
                               (COND ((SPADCALL |v| |j| (QREFELT $ 15)) |t|)
                                     ('T |f|))
                               (QREFELT $ 17))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT $ 19)))))) 

(SDEFUN |IBITS;new;NniB$;4| ((|n| |NonNegativeInteger|) (|b| |Boolean|) ($ $))
        (|make_BVEC| |n| (|bool_to_bit| |b|))) 

(PUT '|IBITS;empty;$;5| '|SPADreplace| '(XLAM NIL (|make_BVEC| 0 0))) 

(SDEFUN |IBITS;empty;$;5| (($ $)) (|make_BVEC| 0 0)) 

(PUT '|IBITS;copy;2$;6| '|SPADreplace| '|copy_BVEC|) 

(SDEFUN |IBITS;copy;2$;6| ((|v| $) ($ $)) (|copy_BVEC| |v|)) 

(PUT '|IBITS;#;$Nni;7| '|SPADreplace| '|size_BVEC|) 

(SDEFUN |IBITS;#;$Nni;7| ((|v| $) ($ |NonNegativeInteger|)) (|size_BVEC| |v|)) 

(PUT '|IBITS;=;2$B;8| '|SPADreplace| '|equal_BVEC|) 

(SDEFUN |IBITS;=;2$B;8| ((|v| $) (|u| $) ($ |Boolean|)) (|equal_BVEC| |v| |u|)) 

(PUT '|IBITS;<;2$B;9| '|SPADreplace| '(XLAM (|v| |u|) (|greater_BVEC| |u| |v|))) 

(SDEFUN |IBITS;<;2$B;9| ((|v| $) (|u| $) ($ |Boolean|))
        (|greater_BVEC| |u| |v|)) 

(SDEFUN |IBITS;and;3$;10| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 26) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;or;3$;11| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 30) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;xor;3$;12| ((|v| $) (|u| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|xor_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 32) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;setelt!;$I2B;13|
        ((|v| $) (|i| |Integer|) (|f| . #1=(|Boolean|)) ($ . #1#))
        (SETELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT $ 6)) $)
                     (|bool_to_bit| |f|))) 

(SDEFUN |IBITS;elt;$IB;14| ((|v| $) (|i| |Integer|) ($ |Boolean|))
        (|bit_to_bool|
         (ELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT $ 6)) $)))) 

(PUT '|IBITS;Not;2$;15| '|SPADreplace| '|not_BVEC|) 

(SDEFUN |IBITS;Not;2$;15| ((|v| $) ($ $)) (|not_BVEC| |v|)) 

(SDEFUN |IBITS;And;3$;16| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 26) |v| |u| (QREFELT $ 28))))) 

(SDEFUN |IBITS;Or;3$;17| ((|u| $) (|v| $) ($ $))
        (COND
         ((EQL (SPADCALL |v| (QREFELT $ 10)) (SPADCALL |u| (QREFELT $ 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT $ 30) |v| |u| (QREFELT $ 28))))) 

(DECLAIM (NOTINLINE |IndexedBits;|)) 

(DEFUN |IndexedBits| (#1=#:G156)
  (SPROG NIL
         (PROG (#2=#:G157)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedBits|)
                                               '|domainEqualList|)
                    . #3=(|IndexedBits|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedBits;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedBits|)))))))))) 

(DEFUN |IndexedBits;| (|#1|)
  (SPROG
   ((#1=#:G154 NIL) (#2=#:G155 NIL) (|pv$| NIL) (#3=#:G153 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|IndexedBits|))
    (LETT |dv$| (LIST '|IndexedBits| DV$1) . #4#)
    (LETT $ (GETREFV 50) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Boolean|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Boolean|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Boolean|)
                                                       '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| (|Boolean|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| (|Boolean|)
                                                        '(|Evalable|
                                                          (|Boolean|)))
                                         #3#)))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|IndexedBits| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #2# (|HasCategory| $ '(|shallowlyMutable|)) . #4#)
         (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| (|Boolean|) '(|OrderedSet|))
         (|augmentPredVector| $ 128))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
         (|augmentPredVector| $ 256))
    (AND #1# #3# (|augmentPredVector| $ 512))
    (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
         (|augmentPredVector| $ 1024))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedBits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |IBITS;minIndex;$I;1| (|NonNegativeInteger|) |IBITS;#;$Nni;7|
              (|String|) (0 . |minIndex|) (5 . |maxIndex|) (|Boolean|)
              |IBITS;elt;$IB;14| (|Character|) (10 . |setelt!|) (|OutputForm|)
              (17 . |coerce|) |IBITS;coerce;$Of;3| |IBITS;new;NniB$;4|
              |IBITS;empty;$;5| |IBITS;copy;2$;6| |IBITS;=;2$B;8|
              |IBITS;<;2$B;9| (22 . |and|) (|Mapping| 14 14 14) (28 . |map|)
              |IBITS;and;3$;10| (35 . |or|) |IBITS;or;3$;11| (41 . |xor|)
              |IBITS;xor;3$;12| |IBITS;setelt!;$I2B;13| |IBITS;Not;2$;15|
              |IBITS;And;3$;16| |IBITS;Or;3$;17| (|List| 39) (|Equation| 14)
              (|List| 14) (|InputForm|) (|Mapping| 14 14) (|Void|)
              (|UniversalSegment| 7) (|List| 7) (|Union| 14 '"failed")
              (|List| $) (|HashState|) (|SingleInteger|))
           '#(~= 47 ~ 53 |xor| 58 |swap!| 64 |sorted?| 71 |sort!| 82 |sort| 93
              |smaller?| 104 |size?| 110 |setelt!| 116 |select| 130 |sample|
              136 |reverse!| 140 |reverse| 145 |removeDuplicates| 150 |remove|
              155 |reduce| 167 |qsetelt!| 188 |qelt| 195 |position| 201 |parts|
              220 |or| 225 |not| 231 |nor| 236 |new| 242 |nand| 248 |more?| 254
              |minIndex| 260 |min| 265 |merge| 271 |members| 284 |member?| 289
              |maxIndex| 295 |max| 300 |map!| 306 |map| 312 |less?| 325 |latex|
              331 |insert| 336 |indices| 350 |index?| 355 |hashUpdate!| 361
              |hash| 367 |first| 372 |find| 377 |fill!| 383 |every?| 389 |eval|
              395 |eq?| 421 |entry?| 427 |entries| 433 |empty?| 438 |empty| 443
              |elt| 447 |delete| 466 |count| 478 |copyInto!| 490 |copy| 497
              |convert| 502 |construct| 507 |concat| 512 |coerce| 535 |any?|
              540 |and| 546 |\\/| 552 |Or| 558 |Not| 564 |And| 569 >= 575 > 581
              = 587 <= 593 < 599 |/\\| 605 |#| 611)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 6
                                  1))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |OrderedSet&|
                |Collection&| |IndexedAggregate&| NIL |HomogeneousAggregate&|
                |SetCategory&| |EltableAggregate&| |Aggregate&| |Logic&|
                |Evalable&| NIL NIL NIL NIL |BasicType&| |PartialOrder&| NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 14)
                 (|FiniteLinearAggregate| 14) (|LinearAggregate| 14)
                 (|OrderedSet|) (|Collection| 14) (|IndexedAggregate| 7 14)
                 (|Comparable|) (|HomogeneousAggregate| 14) (|SetCategory|)
                 (|EltableAggregate| 7 14) (|Aggregate|) (|Logic|)
                 (|Evalable| 14) (|shallowlyMutable|) (|finiteAggregate|)
                 (|Eltable| 7 14) (|Type|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 18) (|InnerEvalable| 14 14)
                 (|ConvertibleTo| 41))
              (|makeByteWordVec2| 49
                                  '(1 11 7 0 12 1 11 7 0 13 3 11 16 0 7 16 17 1
                                    11 18 0 19 2 14 0 0 0 26 3 0 0 27 0 0 28 2
                                    14 0 0 0 30 2 14 0 0 0 32 2 0 14 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 33 3 7 43 0 7 7 1 1 2 14 0
                                    1 2 0 14 27 0 1 1 8 0 0 1 2 7 0 27 0 1 1 2
                                    0 0 1 2 0 0 27 0 1 2 0 14 0 0 1 2 0 14 0 9
                                    1 3 7 14 0 7 14 34 3 7 14 0 44 14 1 2 9 0
                                    42 0 1 0 0 0 1 1 7 0 0 1 1 0 0 0 1 1 11 0 0
                                    1 2 11 0 14 0 1 2 9 0 42 0 1 4 11 14 27 0
                                    14 14 1 3 9 14 27 0 14 1 2 9 14 27 0 1 3 7
                                    14 0 7 14 1 2 0 14 0 7 1 2 3 7 14 0 1 3 3 7
                                    14 0 7 1 2 0 7 42 0 1 1 9 40 0 1 2 0 0 0 0
                                    31 1 0 0 0 1 2 0 0 0 0 1 2 0 0 9 14 21 2 0
                                    0 0 0 1 2 0 14 0 9 1 1 4 7 0 8 2 0 0 0 0 1
                                    2 2 0 0 0 1 3 0 0 27 0 0 1 1 9 40 0 1 2 11
                                    14 14 0 1 1 4 7 0 1 2 0 0 0 0 1 2 7 0 42 0
                                    1 2 0 0 42 0 1 3 0 0 27 0 0 28 2 0 14 0 9 1
                                    1 0 11 0 1 3 0 0 0 0 7 1 3 0 0 14 0 7 1 1 0
                                    45 0 1 2 0 14 7 0 1 2 0 48 48 0 1 1 0 49 0
                                    1 1 4 14 0 1 2 0 46 42 0 1 2 7 0 0 14 1 2 9
                                    14 42 0 1 2 6 0 0 38 1 3 6 0 0 14 14 1 2 6
                                    0 0 39 1 3 6 0 0 40 40 1 2 0 14 0 0 1 2 10
                                    14 14 0 1 1 0 40 0 1 1 0 14 0 1 0 0 0 22 2
                                    0 14 0 7 15 3 0 14 0 7 14 1 2 0 0 0 44 1 2
                                    0 0 0 7 1 2 0 0 0 44 1 2 11 9 14 0 1 2 9 9
                                    42 0 1 3 7 0 0 0 7 1 1 0 0 0 23 1 1 41 0 1
                                    1 0 0 40 1 2 0 0 0 14 1 2 0 0 14 0 1 1 0 0
                                    47 1 2 0 0 0 0 1 1 0 18 0 20 2 9 14 42 0 1
                                    2 0 0 0 0 29 2 0 0 0 0 1 2 0 0 0 0 37 1 0 0
                                    0 35 2 0 0 0 0 36 2 0 14 0 0 1 2 0 14 0 0 1
                                    2 0 14 0 0 24 2 0 14 0 0 1 2 0 14 0 0 25 2
                                    0 0 0 0 1 1 9 9 0 10)))))
           '|lookupComplete|)) 
