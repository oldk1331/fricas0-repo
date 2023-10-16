
(PUT '|LIST;cons;S2$;1| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;1| ((|s| S) (|l| $) ($ $)) (CONS |s| |l|)) 

(SDEFUN |LIST;append;3$;2| ((|l| $) (|t| $) ($ $))
        (SPADCALL |l| |t| (QREFELT $ 8))) 

(SDEFUN |LIST;tails;$L;3| ((|x| $) ($ |List| $))
        (SPROG ((#1=#:G1512 NIL) (|i| NIL) (#2=#:G1511 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# (- (LENGTH |x|) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 11)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 16))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 18))
             (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) NIL (QREFELT $ 20))
                       (EXIT (LETT |x| (CDR |x|))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 21))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;5|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 22))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 23))))))) 

(SDEFUN |LIST;setUnion;3$;6| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 8)) (QREFELT $ 25))) 

(SDEFUN |LIST;setIntersection;3$;7| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL) (LETT |l1| (SPADCALL |l1| (QREFELT $ 25)))
                    (SEQ G190 (COND ((NULL (NULL (NULL |l1|))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 27))
                            (LETT |u|
                                  (SPADCALL (|SPADfirst| |l1|) |u|
                                            (QREFELT $ 7)))))
                          (EXIT (LETT |l1| (CDR |l1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;8| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ (LETT |l1| (SPADCALL |l1| (QREFELT $ 25)))
                    (EXIT
                     (COND ((NULL |l2|) |l1|)
                           ('T
                            (SEQ (LETT |lu| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l1|))) (GO G191)))
                                      (SEQ
                                       (LETT |l11|
                                             (SPADCALL |l1| 1 (QREFELT $ 30)))
                                       (COND
                                        ((NULL
                                          (SPADCALL |l11| |l2| (QREFELT $ 27)))
                                         (LETT |lu| (CONS |l11| |lu|))))
                                       (EXIT (LETT |l1| (CDR |l1|))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT |lu|)))))))) 

(SDEFUN |LIST;map!;M2$;9| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| |l|)
                    (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                         (SEQ
                          (SPADCALL |l| (SPADCALL (|SPADfirst| |l|) |f|)
                                    (QREFELT $ 32))
                          (EXIT (LETT |l| (CDR |l|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |y|)))) 

(SDEFUN |LIST;convert;$If;10| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G1553 NIL) (|a| NIL) (#2=#:G1552 NIL))
               (SEQ
                (SPADCALL
                 (CONS (SPADCALL '|construct| (QREFELT $ 37))
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |a| NIL) (LETT #1# |x|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |a| (QREFELT $ 38))
                                           #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 39))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G1567)
  (SPROG NIL
         (PROG (#2=#:G1568)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((#1=#:G1563 NIL) (#2=#:G1564 NIL) (#3=#:G1566 NIL) (#4=#:G1565 NIL)
    (|pv$| NIL) (#5=#:G1560 NIL) (#6=#:G1561 NIL) (#7=#:G1562 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|List| DV$1))
    (LETT $ (GETREFV 57))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
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
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)))
         (|augmentPredVector| $ 8192))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 16384))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| $ 32768))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 65536))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| $ 131072))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|))))
     (|augmentPredVector| $ 262144))
    (AND (OR #2# (AND #7# #4#) #3# #6#) (|augmentPredVector| $ 524288))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| $ 2097152))
    (AND #4# #1# (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 24 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;5|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 26 (CONS (|dispatchFunction| |LIST;setUnion;3$;6|) $))
       (QSETREFV $ 28
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;7|) $))
       (QSETREFV $ 31
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;8|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 40 (CONS (|dispatchFunction| |LIST;convert;$If;10|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedList| 6 (NRTEVAL 1)) (|local| |#1|)
              |LIST;cons;S2$;1| (0 . |concat|) |LIST;append;3$;2|
              (|NonNegativeInteger|) (6 . |rest|) (|List| $) |LIST;tails;$L;3|
              (|Void|) (|OpenMathDevice|) (12 . |OMputApp|) (|String|)
              (17 . |OMputSymbol|) (|Boolean|) (24 . |OMwrite|)
              (31 . |OMputEndApp|) (36 . |OMputObject|) (41 . |OMputEndObject|)
              (46 . |OMwrite|) (53 . |removeDuplicates|) (58 . |setUnion|)
              (64 . |member?|) (70 . |setIntersection|) (|Integer|)
              (76 . |elt|) (82 . |setDifference|) (88 . |setfirst!|)
              (|Mapping| 6 6) |LIST;map!;M2$;9| (|Symbol|) (|InputForm|)
              (94 . |convert|) (99 . |convert|) (104 . |convert|)
              (109 . |convert|) (|Mapping| 19 6 6) (|Mapping| 6 6 6) (|List| 6)
              (|Equation| 6) (|List| 44) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|Mapping| 19 6) (|UniversalSegment| 29)
              '"last" '"rest" '"first" '"value" (|List| 29)
              (|Union| 6 '"failed"))
           '#(|tails| 114 |setfirst!| 119 |setUnion| 125 |setIntersection| 131
              |setDifference| 137 |rest| 143 |removeDuplicates| 149 |member?|
              154 |map!| 160 |elt| 166 |convert| 172 |cons| 177 |concat| 183
              |append| 189 |OMwrite| 195)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8
                                  9 12 1 2 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL NIL |InnerEvalable&| |BasicType&| NIL
                |PartialOrder&| NIL |OpenMath&|)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 29 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 29 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 50 $$) (|Type|)
                 (|Eltable| 29 6) (|InnerEvalable| 6 6) (|BasicType|)
                 (|CoercibleTo| 46) (|PartialOrder|) (|ConvertibleTo| 36)
                 (|OpenMath|))
              (|makeByteWordVec2| 40
                                  '(2 0 0 0 0 8 2 0 0 0 10 11 1 15 14 0 16 3 15
                                    14 0 17 17 18 3 6 14 15 0 19 20 1 15 14 0
                                    21 1 15 14 0 22 1 15 14 0 23 3 0 14 15 0 19
                                    24 1 0 0 0 25 2 0 0 0 0 26 2 0 19 6 0 27 2
                                    0 0 0 0 28 2 0 6 0 29 30 2 0 0 0 0 31 2 0 6
                                    0 6 32 1 36 0 35 37 1 6 36 0 38 1 36 0 12
                                    39 1 0 36 0 40 1 0 12 0 13 2 21 6 0 6 32 2
                                    4 0 0 0 26 2 4 0 0 0 28 2 4 0 0 0 31 2 0 0
                                    0 10 11 1 19 0 0 25 2 19 19 6 0 27 2 21 0
                                    33 0 34 2 0 6 0 29 30 1 2 36 0 40 2 0 0 6 0
                                    7 2 0 0 0 0 8 2 0 0 0 0 9 3 3 14 15 0 19
                                    24)))))
           '|lookupIncomplete|)) 
