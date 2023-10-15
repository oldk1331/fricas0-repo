
(SDEFUN |BITS;bits;NniB$;1| ((|n| |NonNegativeInteger|) (|b| |Boolean|) ($ $))
        (SPADCALL |n| |b| (QREFELT $ 8))) 

(DECLAIM (NOTINLINE |Bits;|)) 

(DEFUN |Bits| ()
  (SPROG NIL
         (PROG (#1=#:G113)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Bits|) . #2=(|Bits|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Bits|
                             (LIST (CONS NIL (CONS 1 (|Bits;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Bits|)))))))))) 

(DEFUN |Bits;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (#1=#:G110 NIL) (|pv$| NIL) (#2=#:G111 NIL))
         (PROGN
          (LETT |dv$| '(|Bits|) . #3=(|Bits|))
          (LETT $ (GETREFV 26) . #3#)
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
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (LETT #1#
                                                    (|HasCategory| (|Boolean|)
                                                                   '(|SetCategory|))
                                                    . #3#)
                                              (AND
                                               (|HasCategory| (|Boolean|)
                                                              '(|Evalable|
                                                                (|Boolean|)))
                                               #1#)
                                              (|HasCategory| (|Boolean|)
                                                             '(|BasicType|))))
                          . #3#))
          (|haddProp| |$ConstructorCache| '|Bits| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 64))
          (AND (LETT #2# (|HasCategory| $ '(|finiteAggregate|)) . #3#)
               (|augmentPredVector| $ 128))
          (AND #2# (|HasCategory| $ '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| $ 256))
          (AND #2# (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 512))
          (AND #2# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| $ 1024))
          (AND #2# #1# (|augmentPredVector| $ 2048))
          (AND #2# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| $ 4096))
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB$;1| (|List| 11) (|Equation| 7) (|List| 7)
              (|Mapping| 7 7 7) (|Integer|) (|InputForm|) (|Mapping| 7 7)
              (|Void|) (|UniversalSegment| 14) (|List| 14)
              (|Union| 7 '"failed") (|List| $) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 6 ~ 12 |xor| 17 |swap!| 23 |sorted?| 30 |sort!| 41 |sort| 52
              |smaller?| 63 |size?| 69 |setelt!| 75 |select| 89 |sample| 95
              |reverse!| 99 |reverse| 104 |removeDuplicates| 109 |remove| 114
              |reduce| 126 |qsetelt!| 147 |qelt| 154 |position| 160 |parts| 179
              |or| 184 |not| 190 |nor| 195 |new| 201 |nand| 207 |more?| 213
              |minIndex| 219 |min| 224 |merge| 230 |members| 243 |member?| 248
              |maxIndex| 254 |max| 259 |map!| 265 |map| 271 |less?| 284 |latex|
              290 |insert| 295 |indices| 309 |index?| 314 |hashUpdate!| 320
              |hash| 326 |first| 331 |find| 336 |fill!| 342 |every?| 348 |eval|
              354 |eq?| 380 |entry?| 386 |entries| 392 |empty?| 397 |empty| 402
              |elt| 406 |delete| 425 |count| 437 |copyInto!| 449 |copy| 456
              |convert| 461 |construct| 466 |concat| 471 |coerce| 494 |bits|
              499 |any?| 505 |and| 511 |\\/| 517 >= 523 > 529 = 535 <= 541 <
              547 |/\\| 553 |#| 559)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 5
                                  1))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&| |SetCategory&|
                |EltableAggregate&| |Aggregate&| |Logic&| |Evalable&| NIL NIL
                NIL NIL |BasicType&| |PartialOrder&| NIL |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7)
                 (|FiniteLinearAggregate| 7) (|LinearAggregate| 7)
                 (|OrderedSet|) (|Collection| 7) (|IndexedAggregate| 14 7)
                 (|Comparable|) (|HomogeneousAggregate| 7) (|SetCategory|)
                 (|EltableAggregate| 14 7) (|Aggregate|) (|Logic|)
                 (|Evalable| 7) (|shallowlyMutable|) (|finiteAggregate|)
                 (|Eltable| 14 7) (|Type|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 25) (|InnerEvalable| 7 7) (|ConvertibleTo| 15))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 3 7 17 0 14 14 1 1 11 7 0 1 2 8 7 13 0 1
                                    1 9 0 0 1 2 10 0 13 0 1 1 11 0 0 1 2 8 0 13
                                    0 1 2 0 7 0 0 1 2 0 7 0 6 1 3 7 7 0 14 7 1
                                    3 7 7 0 18 7 1 2 8 0 16 0 1 0 0 0 1 1 10 0
                                    0 1 1 8 0 0 1 1 13 0 0 1 2 13 0 7 0 1 2 8 0
                                    16 0 1 4 13 7 13 0 7 7 1 3 8 7 13 0 7 1 2 8
                                    7 13 0 1 3 7 7 0 14 7 1 2 0 7 0 14 1 2 13
                                    14 7 0 1 3 13 14 7 0 14 1 2 8 14 16 0 1 1 8
                                    12 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 6 7 8 2 0 0 0 0 1 2 0 7 0 6 1 1 3 14 0
                                    1 2 0 0 0 0 1 2 11 0 0 0 1 3 8 0 13 0 0 1 1
                                    8 12 0 1 2 13 7 7 0 1 1 3 14 0 1 2 0 0 0 0
                                    1 2 7 0 16 0 1 2 0 0 16 0 1 3 0 0 13 0 0 1
                                    2 0 7 0 6 1 1 0 22 0 1 3 0 0 7 0 14 1 3 0 0
                                    0 0 14 1 1 0 19 0 1 2 0 7 14 0 1 2 0 24 24
                                    0 1 1 0 23 0 1 1 3 7 0 1 2 0 20 16 0 1 2 7
                                    0 0 7 1 2 8 7 16 0 1 2 5 0 0 10 1 2 5 0 0
                                    11 1 3 5 0 0 12 12 1 3 5 0 0 7 7 1 2 0 7 0
                                    0 1 2 12 7 7 0 1 1 0 12 0 1 1 0 7 0 1 0 0 0
                                    1 3 0 7 0 14 7 1 2 0 7 0 14 1 2 0 0 0 18 1
                                    2 0 0 0 18 1 2 0 0 0 14 1 2 13 6 7 0 1 2 8
                                    6 16 0 1 3 10 0 0 0 14 1 1 0 0 0 1 1 1 15 0
                                    1 1 0 0 12 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0
                                    0 0 1 1 0 0 21 1 1 0 25 0 1 2 0 0 6 7 9 2 8
                                    7 16 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 7 0 0
                                    1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7
                                    0 0 1 2 0 0 0 0 1 1 8 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Bits| 'NILADIC T) 
