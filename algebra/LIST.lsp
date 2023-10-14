
(PUT '|LIST;nil;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LIST;nil;$;1| (($ $)) NIL) 

(PUT '|LIST;null;$B;2| '|SPADreplace| 'NULL) 

(SDEFUN |LIST;null;$B;2| ((|l| $) ($ |Boolean|)) (NULL |l|)) 

(PUT '|LIST;cons;S2$;3| '|SPADreplace| 'CONS) 

(SDEFUN |LIST;cons;S2$;3| ((|s| S) (|l| $) ($ $)) (CONS |s| |l|)) 

(PUT '|LIST;append;3$;4| '|SPADreplace| 'APPEND) 

(SDEFUN |LIST;append;3$;4| ((|l| $) (|t| $) ($ $)) (APPEND |l| |t|)) 

(SDEFUN |LIST;writeOMList| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 14))
             (SPADCALL |dev| "list1" "list" (QREFELT $ 16))
             (SEQ G190
                  (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ (SPADCALL |dev| (|SPADfirst| |x|) 'NIL (QREFELT $ 17))
                       (EXIT (LETT |x| (CDR |x|) |LIST;writeOMList|)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 18))))) 

(SDEFUN |LIST;OMwrite;$S;6| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|LIST;OMwrite;$S;6|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 20))
                                    (QREFELT $ 21))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 22))
                    (|LIST;writeOMList| |dev| |x| $)
                    (SPADCALL |dev| (QREFELT $ 23))
                    (SPADCALL |dev| (QREFELT $ 24))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |LIST;OMwrite;$BS;7| ((|x| $) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|LIST;OMwrite;$BS;7|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 20))
                                    (QREFELT $ 21))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 22))))
                    (|LIST;writeOMList| |dev| |x| $)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 23))))
                    (SPADCALL |dev| (QREFELT $ 24))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |LIST;OMwrite;Omd$V;8| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 22)) (|LIST;writeOMList| |dev| |x| $)
             (EXIT (SPADCALL |dev| (QREFELT $ 23))))) 

(SDEFUN |LIST;OMwrite;Omd$BV;9|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 22))))
             (|LIST;writeOMList| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 23))))))) 

(SDEFUN |LIST;setUnion;3$;10| ((|l1| $) (|l2| $) ($ $))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 29)) (QREFELT $ 30))) 

(SDEFUN |LIST;setIntersection;3$;11| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|u| ($)))
               (SEQ (LETT |u| NIL . #1=(|LIST;setIntersection;3$;11|))
                    (LETT |l1| (SPADCALL |l1| (QREFELT $ 30)) . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |l1|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL (|SPADfirst| |l1|) |l2| (QREFELT $ 32))
                            (LETT |u| (CONS (|SPADfirst| |l1|) |u|) . #1#)))
                          (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |u|)))) 

(SDEFUN |LIST;setDifference;3$;12| ((|l1| $) (|l2| $) ($ $))
        (SPROG ((|lu| ($)) (|l11| (S)))
               (SEQ
                (LETT |l1| (SPADCALL |l1| (QREFELT $ 30))
                      . #1=(|LIST;setDifference;3$;12|))
                (LETT |lu| NIL . #1#)
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |l1|) 'NIL) ('T 'T))) (GO G191)))
                     (SEQ (LETT |l11| (SPADCALL |l1| 1 (QREFELT $ 35)) . #1#)
                          (COND
                           ((NULL (SPADCALL |l11| |l2| (QREFELT $ 32)))
                            (LETT |lu| (CONS |l11| |lu|) . #1#)))
                          (EXIT (LETT |l1| (CDR |l1|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |lu|)))) 

(SDEFUN |LIST;convert;$If;13| ((|x| $) ($ |InputForm|))
        (SPROG ((#1=#:G1553 NIL) (|a| NIL) (#2=#:G1552 NIL))
               (SEQ
                (SPADCALL
                 (CONS (SPADCALL '|construct| (QREFELT $ 39))
                       (PROGN
                        (LETT #2# NIL . #3=(|LIST;convert;$If;13|))
                        (SEQ (LETT |a| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |a| (QREFELT $ 40)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 42))))) 

(DECLAIM (NOTINLINE |List;|)) 

(DEFUN |List| (#1=#:G1566)
  (SPROG NIL
         (PROG (#2=#:G1567)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|List|)
                                               '|domainEqualList|)
                    . #3=(|List|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|List;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|List|)))))))))) 

(DEFUN |List;| (|#1|)
  (SPROG
   ((#1=#:G1564 NIL) (#2=#:G1565 NIL) (|pv$| NIL) (#3=#:G1561 NIL)
    (#4=#:G1562 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|List|))
    (LETT |dv$| (LIST '|List| DV$1) . #5#)
    (LETT $ (GETREFV 62) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (OR
                                         (|HasCategory| |#1| '(|OrderedSet|))
                                         #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #4#))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|List| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 8192))
    (AND (OR #2# #4#) (|augmentPredVector| $ 16384))
    (AND #4# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 32768))
    (AND (LETT #1# (|HasCategory| $ '(|shallowlyMutable|)) . #5#)
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
         (|augmentPredVector| $ 131072))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 25 (CONS (|dispatchFunction| |LIST;OMwrite;$S;6|) $))
       (QSETREFV $ 26 (CONS (|dispatchFunction| |LIST;OMwrite;$BS;7|) $))
       (QSETREFV $ 27 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$V;8|) $))
       (QSETREFV $ 28 (CONS (|dispatchFunction| |LIST;OMwrite;Omd$BV;9|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |LIST;setUnion;3$;10|) $))
       (QSETREFV $ 33
                 (CONS (|dispatchFunction| |LIST;setIntersection;3$;11|) $))
       (QSETREFV $ 36
                 (CONS (|dispatchFunction| |LIST;setDifference;3$;12|) $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 43 (CONS (|dispatchFunction| |LIST;convert;$If;13|) $))))
    $))) 

(MAKEPROP '|List| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedList| 6 (NRTEVAL 1)) (|local| |#1|)
              |LIST;nil;$;1| (|Boolean|) |LIST;null;$B;2| |LIST;cons;S2$;3|
              |LIST;append;3$;4| (|Void|) (|OpenMathDevice|) (0 . |OMputApp|)
              (|String|) (5 . |OMputSymbol|) (12 . |OMwrite|)
              (19 . |OMputEndApp|) (|OpenMathEncoding|) (24 . |OMencodingXML|)
              (28 . |OMopenString|) (34 . |OMputObject|)
              (39 . |OMputEndObject|) (44 . |OMclose|) (49 . |OMwrite|)
              (54 . |OMwrite|) (60 . |OMwrite|) (66 . |OMwrite|)
              (73 . |concat|) (79 . |removeDuplicates|) (84 . |setUnion|)
              (90 . |member?|) (96 . |setIntersection|) (|Integer|)
              (102 . |elt|) (108 . |setDifference|) (|Symbol|) (|InputForm|)
              (114 . |convert|) (119 . |convert|) (|List| $) (124 . |convert|)
              (129 . |convert|) (|Mapping| 6 6 6) (|NonNegativeInteger|)
              (|List| 6) (|Equation| 6) (|List| 47) (|Mapping| 8 6)
              (|Mapping| 8 6 6) (|UniversalSegment| 34) '"last" '"rest"
              '"first" '"value" (|Mapping| 6 6) (|OutputForm|)
              (|SingleInteger|) (|HashState|) (|List| 34)
              (|Union| 6 '"failed"))
           '#(|setUnion| 134 |setIntersection| 140 |setDifference| 146
              |removeDuplicates| 152 |null| 157 |nil| 162 |member?| 166 |elt|
              172 |convert| 178 |cons| 183 |concat| 189 |append| 195 |OMwrite|
              201)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 0 0 0 2 0 2 0 0 9 7 0 0 0 0 9 11
                                  1 6 2 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| |FiniteLinearAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL |BasicType&| |PartialOrder&| NIL)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 34 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 34 6)
                 (|Evalable| 6) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 34 6)
                 (|InnerEvalable| 6 6) (|CoercibleTo| 57) (|ConvertibleTo| 38)
                 (|BasicType|) (|PartialOrder|) (|OpenMath|))
              (|makeByteWordVec2| 43
                                  '(1 13 12 0 14 3 13 12 0 15 15 16 3 6 12 13 0
                                    8 17 1 13 12 0 18 0 19 0 20 2 13 0 15 19 21
                                    1 13 12 0 22 1 13 12 0 23 1 13 12 0 24 1 0
                                    15 0 25 2 0 15 0 8 26 2 0 12 13 0 27 3 0 12
                                    13 0 8 28 2 0 0 0 0 29 1 0 0 0 30 2 0 0 0 0
                                    31 2 0 8 6 0 32 2 0 0 0 0 33 2 0 6 0 34 35
                                    2 0 0 0 0 36 1 38 0 37 39 1 6 38 0 40 1 38
                                    0 41 42 1 0 38 0 43 2 4 0 0 0 31 2 4 0 0 0
                                    33 2 4 0 0 0 36 1 14 0 0 30 1 0 8 0 9 0 0 0
                                    7 2 14 8 6 0 32 2 0 6 0 34 35 1 1 38 0 43 2
                                    0 0 6 0 10 2 0 0 0 0 29 2 0 0 0 0 11 2 3 15
                                    0 8 26 1 3 15 0 25 3 3 12 13 0 8 28 2 3 12
                                    13 0 27)))))
           '|lookupIncomplete|)) 
