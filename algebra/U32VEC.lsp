
(/VERSIONCHECK 2) 

(PUT '|U32VEC;#;$Nni;1| '|SPADreplace| 'QV_LEN_U32) 

(DEFUN |U32VEC;#;$Nni;1| (|x| $) (QV_LEN_U32 |x|)) 

(PUT '|U32VEC;minIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U32VEC;minIndex;$I;2| (|x| $) 0) 

(PUT '|U32VEC;empty;$;3| '|SPADreplace| '(XLAM NIL (GETREFV_U32 0 0))) 

(DEFUN |U32VEC;empty;$;3| ($) (GETREFV_U32 0 0)) 

(PUT '|U32VEC;new;NniI$;4| '|SPADreplace| 'GETREFV_U32) 

(DEFUN |U32VEC;new;NniI$;4| (|n| |x| $) (GETREFV_U32 |n| |x|)) 

(PUT '|U32VEC;qelt;$2I;5| '|SPADreplace| 'ELT_U32) 

(DEFUN |U32VEC;qelt;$2I;5| (|x| |i| $) (ELT_U32 |x| |i|)) 

(PUT '|U32VEC;elt;$2I;6| '|SPADreplace| 'ELT_U32) 

(DEFUN |U32VEC;elt;$2I;6| (|x| |i| $) (ELT_U32 |x| |i|)) 

(PUT '|U32VEC;qsetelt!;$3I;7| '|SPADreplace| 'SETELT_U32) 

(DEFUN |U32VEC;qsetelt!;$3I;7| (|x| |i| |s| $) (SETELT_U32 |x| |i| |s|)) 

(PUT '|U32VEC;setelt;$3I;8| '|SPADreplace| 'SETELT_U32) 

(DEFUN |U32VEC;setelt;$3I;8| (|x| |i| |s| $) (SETELT_U32 |x| |i| |s|)) 

(DEFUN |U32VEC;fill!;$I$;9| (|x| |s| $)
  (PROG (#1=#:G2210 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|U32VEC;fill!;$I$;9|))
           (LETT #1# (|sub_SI| (QV_LEN_U32 |x|) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (SETELT_U32 |x| |i| |s|)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |U32Vector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2223)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|U32Vector|) . #2=(|U32Vector|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|U32Vector|
                         (LIST (CONS NIL (CONS 1 (|U32Vector;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|U32Vector|))))))))))) 

(DEFUN |U32Vector;| ()
  (PROG (|dv$| $ #1=#:G2219 #2=#:G2220 #3=#:G2218 |pv$| #4=#:G2221)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U32Vector|) . #5=(|U32Vector|))
      (LETT $ (GETREFV 33) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|SetCategory|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedSet|))
                                           #1#)
                                          (LETT #2#
                                                (AND
                                                 (|HasCategory| (|Integer|)
                                                                '(|Evalable|
                                                                  (|Integer|)))
                                                 (|HasCategory| (|Integer|)
                                                                '(|SetCategory|)))
                                                . #5#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|Evalable|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                           #2#)
                                          (LETT #3#
                                                (|HasCategory| (|Integer|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #5#)
                                          (OR #3# #2#)))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|U32Vector| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 256))
      (AND #4# #1# (|augmentPredVector| $ 512))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Integer|) '(|OrderedSet|))
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|U32Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |U32VEC;#;$Nni;1|
              (|Integer|) |U32VEC;minIndex;$I;2| |U32VEC;empty;$;3|
              |U32VEC;new;NniI$;4| |U32VEC;qelt;$2I;5| |U32VEC;elt;$2I;6|
              |U32VEC;qsetelt!;$3I;7| |U32VEC;setelt;$3I;8|
              |U32VEC;fill!;$I$;9| (|List| 8) (|Equation| 8) (|List| 18)
              (|Mapping| 8 8 8) (|Boolean|) (|OutputForm|) (|InputForm|)
              (|String|) (|SingleInteger|) (|Mapping| 21 8) (|Mapping| 21 8 8)
              (|UniversalSegment| 8) (|Void|) (|Mapping| 8 8) (|List| $)
              (|Union| 8 '"failed"))
           '#(~= 0 |swap!| 6 |sorted?| 13 |sort!| 24 |sort| 35 |smaller?| 46
              |size?| 52 |setelt| 58 |select| 72 |sample| 78 |reverse!| 82
              |reverse| 87 |removeDuplicates| 92 |remove| 97 |reduce| 109
              |qsetelt!| 130 |qelt| 137 |position| 143 |parts| 162 |new| 167
              |more?| 173 |minIndex| 179 |min| 184 |merge| 190 |members| 203
              |member?| 208 |maxIndex| 214 |max| 219 |map!| 225 |map| 231
              |less?| 244 |latex| 250 |insert| 255 |indices| 269 |index?| 274
              |hash| 280 |first| 285 |find| 290 |fill!| 296 |every?| 302 |eval|
              308 |eq?| 334 |entry?| 340 |entries| 346 |empty?| 351 |empty| 356
              |elt| 360 |delete| 379 |count| 391 |copyInto!| 403 |copy| 410
              |convert| 415 |construct| 420 |concat| 425 |coerce| 448 |any?|
              453 >= 459 > 465 = 471 <= 477 < 483 |#| 489)
           'NIL
           (CONS
            (|makeByteWordVec2| 8 '(0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 4 8 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|IndexedAggregate| 8 8)
                 (|Collection| 8) (|OrderedSet|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 8)
                 (|Evalable| 8) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 8 8)
                 (|InnerEvalable| 8 8) (|ConvertibleTo| 23) (|BasicType|)
                 (|CoercibleTo| 22) (|PartialOrder|))
              (|makeByteWordVec2| 32
                                  '(2 3 21 0 0 1 3 11 29 0 8 8 1 1 2 21 0 1 2 0
                                    21 27 0 1 1 12 0 0 1 2 11 0 27 0 1 1 2 0 0
                                    1 2 0 0 27 0 1 2 2 21 0 0 1 2 0 21 0 6 1 3
                                    11 8 0 28 8 1 3 11 8 0 8 8 15 2 9 0 26 0 1
                                    0 0 0 1 1 11 0 0 1 1 0 0 0 1 1 10 0 0 1 2
                                    10 0 8 0 1 2 9 0 26 0 1 4 10 8 20 0 8 8 1 3
                                    9 8 20 0 8 1 2 9 8 20 0 1 3 11 8 0 8 8 14 2
                                    0 8 0 8 12 2 3 8 8 0 1 3 3 8 8 0 8 1 2 0 8
                                    26 0 1 1 9 17 0 1 2 0 0 6 8 11 2 0 21 0 6 1
                                    1 2 8 0 9 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 27
                                    0 0 1 1 9 17 0 1 2 10 21 8 0 1 1 2 8 0 1 2
                                    2 0 0 0 1 2 11 0 30 0 1 3 0 0 20 0 0 1 2 0
                                    0 30 0 1 2 0 21 0 6 1 1 3 24 0 1 3 0 0 0 0
                                    8 1 3 0 0 8 0 8 1 1 0 17 0 1 2 0 21 8 0 1 1
                                    3 25 0 1 1 2 8 0 1 2 0 32 26 0 1 2 11 0 0 8
                                    16 2 9 21 26 0 1 3 5 0 0 17 17 1 2 5 0 0 18
                                    1 3 5 0 0 8 8 1 2 5 0 0 19 1 2 0 21 0 0 1 2
                                    10 21 8 0 1 1 0 17 0 1 1 0 21 0 1 0 0 0 10
                                    2 0 0 0 28 1 2 0 8 0 8 13 3 0 8 0 8 8 1 2 0
                                    0 0 8 1 2 0 0 0 28 1 2 10 6 8 0 1 2 9 6 26
                                    0 1 3 11 0 0 0 8 1 1 0 0 0 1 1 1 23 0 1 1 0
                                    0 17 1 1 0 0 31 1 2 0 0 8 0 1 2 0 0 0 0 1 2
                                    0 0 0 8 1 1 7 22 0 1 2 9 21 26 0 1 2 2 21 0
                                    0 1 2 2 21 0 0 1 2 3 21 0 0 1 2 2 21 0 0 1
                                    2 2 21 0 0 1 1 9 6 0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32Vector| 'NILADIC T) 
