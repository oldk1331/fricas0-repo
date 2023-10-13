
(/VERSIONCHECK 2) 

(DEFUN |BITS;bits;NniB$;1| (|n| |b| $) (SPADCALL |n| |b| (QREFELT $ 8))) 

(DEFUN |Bits| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G135)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Bits|))))))))))) 

(DEFUN |Bits;| ()
  (PROG (|dv$| $ #1=#:G131 |pv$| #2=#:G133 #3=#:G132)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Bits|) . #4=(|Bits|))
      (LETT $ (GETREFV 25) . #4#)
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
                                          (LETT #1#
                                                (|HasCategory| (|Boolean|)
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| (|Boolean|)
                                                          '(|Evalable|
                                                            (|Boolean|)))
                                           #1#)
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|Bits| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #2# (|HasCategory| $ '(|shallowlyMutable|)) . #4#)
           (|augmentPredVector| $ 32))
      (AND #2# (|HasCategory| (|Boolean|) '(|OrderedSet|))
           (|augmentPredVector| $ 64))
      (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
           (|augmentPredVector| $ 128))
      (AND #3# #1# (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB$;1| (|List| 11) (|Equation| 7) (|List| 7)
              (|Mapping| 7 7 7) (|InputForm|) (|Integer|) (|Mapping| 7 7)
              (|Void|) (|UniversalSegment| 15) (|List| 15)
              (|Union| 7 '"failed") (|List| $) (|SingleInteger|) (|String|)
              (|OutputForm|))
           '#(~= 6 ~ 12 |xor| 17 |swap!| 23 |sorted?| 30 |sort!| 41 |sort| 52
              |smaller?| 63 |size?| 69 |setelt| 75 |select| 89 |sample| 95
              |reverse!| 99 |reverse| 104 |removeDuplicates| 109 |remove| 114
              |reduce| 126 |qsetelt!| 147 |qelt| 154 |position| 160 |parts| 179
              |or| 184 |not| 190 |nor| 195 |new| 201 |nand| 207 |more?| 213
              |minIndex| 219 |min| 224 |merge| 230 |members| 243 |member?| 248
              |maxIndex| 254 |max| 259 |map!| 265 |map| 271 |less?| 284 |latex|
              290 |insert| 295 |indices| 309 |index?| 314 |hash| 320 |first|
              325 |find| 330 |fill!| 336 |every?| 342 |eval| 348 |eq?| 374
              |entry?| 380 |entries| 386 |empty?| 391 |empty| 396 |elt| 400
              |delete| 419 |count| 431 |copyInto!| 443 |copy| 450 |convert| 455
              |construct| 460 |concat| 465 |coerce| 488 |bits| 493 |any?| 499
              |and| 505 |\\/| 511 >= 517 > 523 = 529 <= 535 < 541 |/\\| 547 |#|
              553)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 4
                                  1))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |OrderedSet&|
                |Collection&| |IndexedAggregate&| NIL |HomogeneousAggregate&|
                |SetCategory&| |EltableAggregate&| |Aggregate&| |Logic&|
                |Evalable&| NIL NIL NIL NIL |BasicType&| |PartialOrder&| NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7)
                 (|FiniteLinearAggregate| 7) (|LinearAggregate| 7)
                 (|OrderedSet|) (|Collection| 7) (|IndexedAggregate| 15 7)
                 (|Comparable|) (|HomogeneousAggregate| 7) (|SetCategory|)
                 (|EltableAggregate| 15 7) (|Aggregate|) (|Logic|)
                 (|Evalable| 7) (|shallowlyMutable|) (|finiteAggregate|)
                 (|Eltable| 15 7) (|Type|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 24) (|InnerEvalable| 7 7) (|ConvertibleTo| 14))
              (|makeByteWordVec2| 24
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 3 6 17 0 15 15 1 1 2 7 0 1 2 0 7 13 0 1 1
                                    7 0 0 1 2 6 0 13 0 1 1 2 0 0 1 2 0 0 13 0 1
                                    2 0 7 0 0 1 2 0 7 0 6 1 3 6 7 0 15 7 1 3 6
                                    7 0 18 7 1 2 8 0 16 0 1 0 0 0 1 1 6 0 0 1 1
                                    0 0 0 1 1 9 0 0 1 2 9 0 7 0 1 2 8 0 16 0 1
                                    4 9 7 13 0 7 7 1 3 8 7 13 0 7 1 2 8 7 13 0
                                    1 3 6 7 0 15 7 1 2 0 7 0 15 1 2 3 15 7 0 1
                                    3 3 15 7 0 15 1 2 0 15 16 0 1 1 8 12 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 6 7 8
                                    2 0 0 0 0 1 2 0 7 0 6 1 1 5 15 0 1 2 0 0 0
                                    0 1 2 2 0 0 0 1 3 0 0 13 0 0 1 1 8 12 0 1 2
                                    9 7 7 0 1 1 5 15 0 1 2 0 0 0 0 1 2 6 0 16 0
                                    1 2 0 0 16 0 1 3 0 0 13 0 0 1 2 0 7 0 6 1 1
                                    0 23 0 1 3 0 0 0 0 15 1 3 0 0 7 0 15 1 1 0
                                    19 0 1 2 0 7 15 0 1 1 0 22 0 1 1 5 7 0 1 2
                                    0 20 16 0 1 2 6 0 0 7 1 2 8 7 16 0 1 2 4 0
                                    0 10 1 2 4 0 0 11 1 3 4 0 0 12 12 1 3 4 0 0
                                    7 7 1 2 0 7 0 0 1 2 9 7 7 0 1 1 0 12 0 1 1
                                    0 7 0 1 0 0 0 1 3 0 7 0 15 7 1 2 0 7 0 15 1
                                    2 0 0 0 18 1 2 0 0 0 15 1 2 0 0 0 18 1 2 9
                                    6 7 0 1 2 8 6 16 0 1 3 6 0 0 0 15 1 1 0 0 0
                                    1 1 1 14 0 1 1 0 0 12 1 2 0 0 0 7 1 2 0 0 7
                                    0 1 1 0 0 21 1 2 0 0 0 0 1 1 0 24 0 1 2 0 0
                                    6 7 9 2 8 7 16 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0
                                    0 1 2 0 7 0 0 1 2 0 0 0 0 1 1 8 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Bits| 'NILADIC T) 
