
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
              (|Union| 7 '"failed") (|List| $) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(~= 6 ~ 12 |xor| 17 |trim| 23 |swap!| 29 |sorted?| 36 |sort!| 47
              |sort| 58 |smaller?| 69 |size?| 75 |setelt!| 81 |select| 95
              |sample| 101 |rightTrim| 105 |reverse!| 111 |reverse| 116
              |removeDuplicates| 121 |remove| 126 |reduce| 138 |qsetelt!| 159
              |qelt| 166 |position| 172 |parts| 191 |or| 196 |not| 202 |nor|
              207 |new| 213 |nand| 219 |more?| 225 |minIndex| 231 |min| 236
              |merge| 242 |members| 255 |member?| 260 |maxIndex| 266 |max| 271
              |map!| 277 |map| 283 |less?| 296 |leftTrim| 302 |latex| 308
              |insert| 313 |indices| 327 |index?| 332 |hashUpdate!| 338 |hash|
              344 |first| 349 |find| 354 |fill!| 360 |every?| 366 |eval| 372
              |eq?| 398 |entry?| 404 |entries| 410 |empty?| 415 |empty| 420
              |elt| 424 |delete| 443 |count| 455 |copyInto!| 467 |copy| 474
              |convert| 479 |construct| 484 |concat| 489 |coerce| 512 |bits|
              517 |any?| 523 |and| 529 |_\|_| 535 |\\/| 539 T$ 545 >= 549 > 555
              = 561 <= 567 < 573 |/\\| 579 |#| 585)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0
                                  0 0 0 0 0 0 5 1))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&| NIL NIL NIL
                |LinearAggregate&| NIL NIL |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL NIL NIL NIL |HomogeneousAggregate&| NIL
                NIL |EltableAggregate&| |Aggregate&| |SetCategory&| |Evalable&|
                NIL NIL NIL NIL |BasicType&| |PartialOrder&| NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7) (|Logic|)
                 (|FiniteLinearAggregate| 7) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 7) (|DistributiveLattice|)
                 (|BoundedLattice|) (|OrderedSet|) (|Collection| 7)
                 (|IndexedAggregate| 14 7) (|Lattice|)
                 (|BoundedJoinSemilattice|) (|BoundedMeetSemilattice|)
                 (|Comparable|) (|HomogeneousAggregate| 7) (|JoinSemilattice|)
                 (|MeetSemilattice|) (|EltableAggregate| 14 7) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 7) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 14 7) (|Type|) (|BasicType|)
                 (|PartialOrder|) (|CoercibleTo| 24) (|InnerEvalable| 7 7)
                 (|ConvertibleTo| 15))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 13 0 0 7 1 3 7 17 0 14 14 1 1 11 7 0 1
                                    2 8 7 13 0 1 1 9 0 0 1 2 10 0 13 0 1 1 11 0
                                    0 1 2 8 0 13 0 1 2 0 7 0 0 1 2 0 7 0 6 1 3
                                    7 7 0 14 7 1 3 7 7 0 18 7 1 2 8 0 16 0 1 0
                                    0 0 1 2 13 0 0 7 1 1 10 0 0 1 1 8 0 0 1 1
                                    13 0 0 1 2 13 0 7 0 1 2 8 0 16 0 1 4 13 7
                                    13 0 7 7 1 3 8 7 13 0 7 1 2 8 7 13 0 1 3 7
                                    7 0 14 7 1 2 0 7 0 14 1 2 13 14 7 0 1 3 13
                                    14 7 0 14 1 2 8 14 16 0 1 1 8 12 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 6 7 8 2 0
                                    0 0 0 1 2 0 7 0 6 1 1 3 14 0 1 2 0 0 0 0 1
                                    2 11 0 0 0 1 3 8 0 13 0 0 1 1 8 12 0 1 2 13
                                    7 7 0 1 1 3 14 0 1 2 0 0 0 0 1 2 7 0 16 0 1
                                    2 0 0 16 0 1 3 0 0 13 0 0 1 2 0 7 0 6 1 2
                                    13 0 0 7 1 1 0 23 0 1 3 0 0 7 0 14 1 3 0 0
                                    0 0 14 1 1 0 19 0 1 2 0 7 14 0 1 2 0 22 22
                                    0 1 1 0 25 0 1 1 3 7 0 1 2 0 20 16 0 1 2 7
                                    0 0 7 1 2 8 7 16 0 1 2 5 0 0 10 1 3 5 0 0 7
                                    7 1 2 5 0 0 11 1 3 5 0 0 12 12 1 2 0 7 0 0
                                    1 2 12 7 7 0 1 1 0 12 0 1 1 0 7 0 1 0 0 0 1
                                    2 0 7 0 14 1 3 0 7 0 14 7 1 2 0 0 0 18 1 2
                                    0 0 0 18 1 2 0 0 0 14 1 2 13 6 7 0 1 2 8 6
                                    16 0 1 3 10 0 0 0 14 1 1 0 0 0 1 1 1 15 0 1
                                    1 0 0 12 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0 0
                                    0 1 1 0 0 21 1 1 0 24 0 1 2 0 0 6 7 9 2 8 7
                                    16 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 0 0
                                    0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0
                                    7 0 0 1 2 0 7 0 0 1 2 0 0 0 0 1 1 8 6 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Bits| 'NILADIC T) 
