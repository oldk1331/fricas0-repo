
(PUT '|PRIMARR;#;%Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |PRIMARR;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|))) (QVSIZE |x|)) 

(PUT '|PRIMARR;minIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |PRIMARR;minIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|PRIMARR;empty;%;3| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |PRIMARR;empty;%;3| ((% (%))) (MAKE-ARRAY 0)) 

(PUT '|PRIMARR;new;NniS%;4| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |PRIMARR;new;NniS%;4| ((|n| (|NonNegativeInteger|)) (|x| (S)) (% (%)))
        (MAKEARR1 |n| |x|)) 

(PUT '|PRIMARR;qelt;%IS;5| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;qelt;%IS;5| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;elt;%IS;6| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;elt;%IS;6| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(PUT '|PRIMARR;qsetelt!;%I2S;7| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;qsetelt!;%I2S;7|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETAREF1 |x| |i| |s|)) 

(PUT '|PRIMARR;setelt!;%I2S;8| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;setelt!;%I2S;8|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETAREF1 |x| |i| |s|)) 

(SDEFUN |PRIMARR;fill!;%S%;9| ((|x| (%)) (|s| (S)) (% (%)))
        (SPROG ((#1=#:G1744 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |PRIMARR;hashUpdate!;Hs%Hs;10|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG ((#1=#:G1749 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT % 19)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(DECLAIM (NOTINLINE |PrimitiveArray;|)) 

(DEFUN |PrimitiveArray| (#1=#:G1760)
  (SPROG NIL
         (PROG (#2=#:G1761)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimitiveArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveArray|)))))))))) 

(DEFUN |PrimitiveArray;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1757 NIL) (#2=#:G1758 NIL) (#3=#:G1759 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|PrimitiveArray| DV$1))
    (LETT % (GETREFV 38))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #3#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|PrimitiveArray| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 1048576))
    (AND
     (OR #1# (AND #3# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4194304))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND #3# (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|Hashable|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 20
                (CONS (|dispatchFunction| |PRIMARR;hashUpdate!;Hs%Hs;10|) %))))
    %))) 

(MAKEPROP '|PrimitiveArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |PRIMARR;#;%Nni;1| (|Integer|) |PRIMARR;minIndex;%I;2|
              |PRIMARR;empty;%;3| |PRIMARR;new;NniS%;4| |PRIMARR;qelt;%IS;5|
              |PRIMARR;elt;%IS;6| |PRIMARR;qsetelt!;%I2S;7|
              |PRIMARR;setelt!;%I2S;8| |PRIMARR;fill!;%S%;9| (|HashState|)
              (0 . |hashUpdate!|) (6 . |hashUpdate!|) (|Boolean|)
              (|Mapping| 6 6) (|List| 6) (|List| 9) (|Union| 6 '"failed")
              (|Mapping| 21 6) (|UniversalSegment| 9) (|List| %)
              (|Mapping| 6 6 6) (|Mapping| 21 6 6) (|SingleInteger|)
              (|Equation| 6) (|List| 32) (|OutputForm|) (|String|) (|Void|)
              (|InputForm|))
           '#(~= 12 |trim| 18 |swap!| 24 |sorted?| 31 |sort!| 42 |sort| 53
              |smaller?| 64 |size?| 70 |setelt!| 76 |select| 90 |sample| 96
              |rightTrim| 100 |reverse!| 106 |reverse| 111 |removeDuplicates|
              116 |remove| 121 |reduce| 133 |qsetelt!| 154 |qelt| 161
              |position| 167 |parts| 186 |new| 191 |more?| 197 |minIndex| 203
              |min| 208 |merge| 219 |members| 232 |member?| 237 |maxIndex| 243
              |max| 248 |map!| 265 |map| 271 |less?| 284 |leftTrim| 290 |latex|
              296 |insert| 301 |indices| 315 |index?| 320 |hashUpdate!| 326
              |hash| 332 |first| 337 |find| 348 |fill!| 354 |every?| 360 |eval|
              366 |eq?| 392 |entry?| 398 |entries| 404 |empty?| 409 |empty| 414
              |elt| 418 |delete| 437 |count| 449 |copyInto!| 461 |copy| 468
              |convert| 473 |construct| 478 |concat| 483 |coerce| 506 |any?|
              511 >= 517 > 523 = 529 <= 535 < 541 |#| 547)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 1 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0 0
                                  0 0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Collection| 6)
                 (|IndexedAggregate| 9 6) (|Comparable|)
                 (|HomogeneousAggregate| 6) (|Hashable|) (|SetCategory|)
                 (|Evalable| 6) (|EltableAggregate| 9 6) (|Aggregate|)
                 (|ConvertibleTo| 37) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 34) (|InnerEvalable| 6 6) (|Eltable| 9 6)
                 (|Type|) (|Eltable| 27 $$) (|finiteAggregate|)
                 (|shallowlyMutable|))
              (|makeByteWordVec2| 37
                                  '(2 6 18 18 0 19 2 0 18 18 0 20 2 24 21 0 0 1
                                    2 16 0 0 6 1 3 14 36 0 9 9 1 1 19 21 0 1 2
                                    15 21 30 0 1 2 17 0 30 0 1 1 18 0 0 1 1 19
                                    0 0 1 2 15 0 30 0 1 2 20 21 0 0 1 2 0 21 0
                                    7 1 3 14 6 0 9 6 16 3 14 6 0 27 6 1 2 15 0
                                    26 0 1 0 0 0 1 2 16 0 0 6 1 1 17 0 0 1 1 15
                                    0 0 1 1 16 0 0 1 2 16 0 6 0 1 2 15 0 26 0 1
                                    4 16 6 29 0 6 6 1 3 15 6 29 0 6 1 2 15 6 29
                                    0 1 3 14 6 0 9 6 15 2 0 6 0 9 13 3 16 9 6 0
                                    9 1 2 16 9 6 0 1 2 15 9 26 0 1 1 15 23 0 1
                                    2 0 0 7 6 12 2 0 21 0 7 1 1 4 9 0 10 1 19 6
                                    0 1 2 19 0 0 0 1 2 19 0 0 0 1 3 15 0 30 0 0
                                    1 1 15 23 0 1 2 16 21 6 0 1 1 4 9 0 1 1 19
                                    6 0 1 2 19 0 0 0 1 2 15 6 30 0 1 2 14 0 22
                                    0 1 2 0 0 22 0 1 3 0 0 29 0 0 1 2 0 21 0 7
                                    1 2 16 0 0 6 1 1 21 35 0 1 3 0 0 6 0 9 1 3
                                    0 0 0 0 9 1 1 0 24 0 1 2 0 21 9 0 1 2 23 18
                                    18 0 20 1 23 31 0 1 2 0 0 0 7 1 1 4 6 0 1 2
                                    0 25 26 0 1 2 14 0 0 6 17 2 15 21 26 0 1 2
                                    9 0 0 32 1 2 9 0 0 33 1 3 9 0 0 23 23 1 3 9
                                    0 0 6 6 1 2 0 21 0 0 1 2 16 21 6 0 1 1 0 23
                                    0 1 1 0 21 0 1 0 0 0 11 3 0 6 0 9 6 1 2 0 6
                                    0 9 14 2 0 0 0 27 1 2 0 0 0 9 1 2 0 0 0 27
                                    1 2 16 7 6 0 1 2 15 7 26 0 1 3 17 0 0 0 9 1
                                    1 0 0 0 1 1 3 37 0 1 1 0 0 23 1 2 0 0 0 6 1
                                    2 0 0 0 0 1 2 0 0 6 0 1 1 0 0 28 1 1 22 34
                                    0 1 2 15 21 26 0 1 2 19 21 0 0 1 2 19 21 0
                                    0 1 2 24 21 0 0 1 2 19 21 0 0 1 2 19 21 0 0
                                    1 1 15 7 0 8)))))
           '|lookupComplete|)) 
