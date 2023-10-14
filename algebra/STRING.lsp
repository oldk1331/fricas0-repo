
(PUT '|STRING;ucodeToString;I$;1| '|SPADreplace| 'NUM2USTR) 

(DEFUN |STRING;ucodeToString;I$;1| (|n| $) (NUM2USTR |n|)) 

(PUT '|STRING;string;I$;2| '|SPADreplace| 'STRINGIMAGE) 

(DEFUN |STRING;string;I$;2| (|n| $) (STRINGIMAGE |n|)) 

(DEFUN |STRING;OMwrite;2$;3| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|STRING;OMwrite;2$;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 10)) (QREFELT $ 13))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 15)) (SPADCALL |dev| |x| (QREFELT $ 16))
          (SPADCALL |dev| (QREFELT $ 17)) (SPADCALL |dev| (QREFELT $ 18))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |STRING;OMwrite;$B$;4| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|STRING;OMwrite;$B$;4|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 10)) (QREFELT $ 13))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))
          (SPADCALL |dev| |x| (QREFELT $ 16))
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
          (SPADCALL |dev| (QREFELT $ 18))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |STRING;OMwrite;Omd$V;5| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 15)) (SPADCALL |dev| |x| (QREFELT $ 16))
       (EXIT (SPADCALL |dev| (QREFELT $ 17))))) 

(DEFUN |STRING;OMwrite;Omd$BV;6| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))
       (SPADCALL |dev| |x| (QREFELT $ 16))
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))))) 

(PUT '|STRING;convert;$If;7| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |STRING;convert;$If;7| (|x| $) |x|) 

(PUT '|STRING;qelt;$IC;8| '|SPADreplace| 'STR_ELT1) 

(DEFUN |STRING;qelt;$IC;8| (|s| |i| $) (STR_ELT1 |s| |i|)) 

(PUT '|STRING;qsetelt!;$I2C;9| '|SPADreplace| 'STR_SETELT1) 

(DEFUN |STRING;qsetelt!;$I2C;9| (|s| |i| |c| $) (STR_SETELT1 |s| |i| |c|)) 

(DECLAIM (NOTINLINE |String;|)) 

(DEFUN |String| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1883)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|String|))))))))))) 

(DEFUN |String;| ()
  (PROG (|dv$| $ #1=#:G1879 #2=#:G1880 |pv$| #3=#:G1881)
    (RETURN
     (PROGN
      (LETT |dv$| '(|String|) . #4=(|String|))
      (LETT $ (GETREFV 45) . #4#)
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
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Character|) '(|OrderedSet|))
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|String| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedString| (NRTEVAL 1)) (|Integer|)
              |STRING;ucodeToString;I$;1| |STRING;string;I$;2|
              (|OpenMathEncoding|) (0 . |OMencodingXML|) (|String|)
              (|OpenMathDevice|) (4 . |OMopenString|) (|Void|)
              (10 . |OMputObject|) (15 . |OMputString|) (21 . |OMputEndObject|)
              (26 . |OMclose|) |STRING;OMwrite;2$;3| (|Boolean|)
              |STRING;OMwrite;$B$;4| |STRING;OMwrite;Omd$V;5|
              |STRING;OMwrite;Omd$BV;6| (|InputForm|) |STRING;convert;$If;7|
              (|Character|) |STRING;qelt;$IC;8| |STRING;qsetelt!;$I2C;9|
              (|List| 26) (|Equation| 26) (|List| 30) (|Mapping| 26 26 26)
              (|NonNegativeInteger|) (|Mapping| 20 26) (|Mapping| 20 26 26)
              (|UniversalSegment| 6) (|Mapping| 26 26) (|SingleInteger|)
              (|OutputForm|) (|HashState|) (|CharacterClass|) (|List| $)
              (|Union| 26 '"failed") (|List| 6))
           '#(|ucodeToString| 31 |string| 36 |qsetelt!| 41 |qelt| 48 |convert|
              54 |OMwrite| 59)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 2 0 2 0 0 0 5 0 0 0 0 0 0 0 5 1
                                  2))
            (CONS
             '#(NIL |StringAggregate&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |SetCategory&| |Aggregate&| |EltableAggregate&| |Evalable&| NIL
                NIL |BasicType&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&|)
             (CONS
              '#((|StringCategory|) (|StringAggregate|)
                 (|OneDimensionalArrayAggregate| 26)
                 (|FiniteLinearAggregate| 26) (|LinearAggregate| 26)
                 (|IndexedAggregate| 6 26) (|Collection| 26) (|OrderedSet|)
                 (|HomogeneousAggregate| 26) (|Comparable|) (|SetCategory|)
                 (|Aggregate|) (|EltableAggregate| 6 26) (|Evalable| 26)
                 (|OpenMath|) (|CoercibleTo| 39) (|BasicType|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 6 26) (|InnerEvalable| 26 26) (|ConvertibleTo| 24)
                 (|PartialOrder|))
              (|makeByteWordVec2| 28
                                  '(0 9 0 10 2 12 0 11 9 13 1 12 14 0 15 2 12
                                    14 0 11 16 1 12 14 0 17 1 12 14 0 18 1 0 0
                                    6 7 1 0 0 6 8 3 11 26 0 6 26 28 2 0 26 0 6
                                    27 1 1 24 0 25 3 0 14 12 0 20 23 2 0 11 0
                                    20 21 2 0 14 12 0 22 1 0 11 0 19)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|String| 'NILADIC T) 
