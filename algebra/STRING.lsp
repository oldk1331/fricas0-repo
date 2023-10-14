
(PUT '|STRING;ucodeToString;I$;1| '|SPADreplace| 'NUM2USTR) 

(SDEFUN |STRING;ucodeToString;I$;1| ((|n| |Integer|) ($ $)) (NUM2USTR |n|)) 

(PUT '|STRING;string;I$;2| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |STRING;string;I$;2| ((|n| |Integer|) ($ $)) (STRINGIMAGE |n|)) 

(SDEFUN |STRING;OMwrite;Omd$BV;3|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 11))))
             (SPADCALL |dev| |x| (QREFELT $ 13))
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))))) 

(PUT '|STRING;convert;$If;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |STRING;convert;$If;4| ((|x| $) ($ |InputForm|)) |x|) 

(PUT '|STRING;qelt;$IC;5| '|SPADreplace| 'STR_ELT1) 

(SDEFUN |STRING;qelt;$IC;5| ((|s| $) (|i| |Integer|) ($ |Character|))
        (STR_ELT1 |s| |i|)) 

(PUT '|STRING;qsetelt!;$I2C;6| '|SPADreplace| 'STR_SETELT1) 

(SDEFUN |STRING;qsetelt!;$I2C;6|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (STR_SETELT1 |s| |i| |c|)) 

(DECLAIM (NOTINLINE |String;|)) 

(DEFUN |String| ()
  (SPROG NIL
         (PROG (#1=#:G1862)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|String|) . #2=(|String|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|String|
                             (LIST (CONS NIL (CONS 1 (|String;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|String|)))))))))) 

(DEFUN |String;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G1858 NIL) (#2=#:G1859 NIL) (|pv$| NIL)
    (#3=#:G1860 NIL))
   (PROGN
    (LETT |dv$| '(|String|) . #4=(|String|))
    (LETT $ (GETREFV 38) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (LETT #1#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Character|)
                                                              '(|Evalable|
                                                                (|Character|)))
                                               (|HasCategory| (|Character|)
                                                              '(|SetCategory|)))
                                              . #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Character|)
                                                         '(|Evalable|
                                                           (|Character|)))
                                          (|HasCategory| (|Character|)
                                                         '(|OrderedSet|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|BasicType|))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|String| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (LETT #3# (|HasCategory| $ '(|finiteAggregate|)) . #4#)
         (|augmentPredVector| $ 128))
    (AND #3# #1# (|augmentPredVector| $ 256))
    (AND #3# (|HasCategory| (|Character|) '(|BasicType|))
         (|augmentPredVector| $ 512))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 1024))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|String| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedString| (NRTEVAL 1)) (|Integer|)
              |STRING;ucodeToString;I$;1| |STRING;string;I$;2| (|Void|)
              (|OpenMathDevice|) (0 . |OMputObject|) (|String|)
              (5 . |OMputString|) (11 . |OMputEndObject|) (|Boolean|)
              |STRING;OMwrite;Omd$BV;3| (|InputForm|) |STRING;convert;$If;4|
              (|Character|) |STRING;qelt;$IC;5| |STRING;qsetelt!;$I2C;6|
              (|List| 19) (|Equation| 19) (|List| 23) (|Mapping| 19 19 19)
              (|NonNegativeInteger|) (|Mapping| 15 19) (|Mapping| 15 19 19)
              (|UniversalSegment| 6) (|Mapping| 19 19) (|SingleInteger|)
              (|OutputForm|) (|HashState|) (|CharacterClass|) (|List| $)
              (|Union| 19 '"failed") (|List| 6))
           '#(|ucodeToString| 16 |string| 21 |qsetelt!| 26 |qelt| 33 |convert|
              39 |OMwrite| 44)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 2 0 2 0 0 0 5 0 0 0 0 0 0 0 5 1
                                  2))
            (CONS
             '#(NIL |StringAggregate&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |SetCategory&| |Aggregate&| |EltableAggregate&| |Evalable&|
                |OpenMath&| NIL |BasicType&| NIL NIL NIL NIL |InnerEvalable&|
                NIL |PartialOrder&|)
             (CONS
              '#((|StringCategory|) (|StringAggregate|)
                 (|OneDimensionalArrayAggregate| 19)
                 (|FiniteLinearAggregate| 19) (|LinearAggregate| 19)
                 (|IndexedAggregate| 6 19) (|Collection| 19) (|OrderedSet|)
                 (|HomogeneousAggregate| 19) (|Comparable|) (|SetCategory|)
                 (|Aggregate|) (|EltableAggregate| 6 19) (|Evalable| 19)
                 (|OpenMath|) (|CoercibleTo| 32) (|BasicType|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 6 19) (|InnerEvalable| 19 19) (|ConvertibleTo| 17)
                 (|PartialOrder|))
              (|makeByteWordVec2| 21
                                  '(1 10 9 0 11 2 10 9 0 12 13 1 10 9 0 14 1 0
                                    0 6 7 1 0 0 6 8 3 11 19 0 6 19 21 2 0 19 0
                                    6 20 1 1 17 0 18 3 0 9 10 0 15 16)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|String| 'NILADIC T) 
