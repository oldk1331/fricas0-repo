
(PUT '|U8VEC;#;$Nni;1| '|SPADreplace| 'QV_LEN_U8) 

(SDEFUN |U8VEC;#;$Nni;1| ((|x| $) ($ |NonNegativeInteger|)) (QV_LEN_U8 |x|)) 

(PUT '|U8VEC;minIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U8VEC;minIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|U8VEC;empty;$;3| '|SPADreplace| '(XLAM NIL (GETREFV_U8 0 0))) 

(SDEFUN |U8VEC;empty;$;3| (($ $)) (GETREFV_U8 0 0)) 

(PUT '|U8VEC;new;NniI$;4| '|SPADreplace| 'GETREFV_U8) 

(SDEFUN |U8VEC;new;NniI$;4| ((|n| |NonNegativeInteger|) (|x| |Integer|) ($ $))
        (GETREFV_U8 |n| |x|)) 

(PUT '|U8VEC;qelt;$2I;5| '|SPADreplace| 'ELT_U8) 

(SDEFUN |U8VEC;qelt;$2I;5| ((|x| $) (|i| |Integer|) ($ |Integer|))
        (ELT_U8 |x| |i|)) 

(PUT '|U8VEC;elt;$2I;6| '|SPADreplace| 'ELT_U8) 

(SDEFUN |U8VEC;elt;$2I;6| ((|x| $) (|i| |Integer|) ($ |Integer|))
        (ELT_U8 |x| |i|)) 

(PUT '|U8VEC;qsetelt!;$3I;7| '|SPADreplace| 'SETELT_U8) 

(SDEFUN |U8VEC;qsetelt!;$3I;7|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Integer|)) ($ . #1#))
        (SETELT_U8 |x| |i| |s|)) 

(PUT '|U8VEC;setelt!;$3I;8| '|SPADreplace| 'SETELT_U8) 

(SDEFUN |U8VEC;setelt!;$3I;8|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Integer|)) ($ . #1#))
        (SETELT_U8 |x| |i| |s|)) 

(SDEFUN |U8VEC;fill!;$I$;9| ((|x| $) (|s| |Integer|) ($ $))
        (SPROG ((#1=#:G2316 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|U8VEC;fill!;$I$;9|))
                     (LETT #1# (|sub_SI| (QV_LEN_U8 |x|) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SETELT_U8 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |U8Vector;|)) 

(DEFUN |U8Vector| ()
  (SPROG NIL
         (PROG (#1=#:G2328)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|U8Vector|)
                    . #2=(|U8Vector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|U8Vector|
                             (LIST (CONS NIL (CONS 1 (|U8Vector;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|U8Vector|)))))))))) 

(DEFUN |U8Vector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2326 NIL) (#2=#:G2325 NIL) (#3=#:G2324 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|U8Vector|) . #4=(|U8Vector|))
    (LETT $ (GETREFV 34) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|Comparable|))
                                              . #4#)
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Evalable|
                                                          (|Integer|)))
                                         #2#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|Integer|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #3# #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|U8Vector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 2048))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| $ 8192))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16384))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| $ 65536))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| $ 131072))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| $ 262144))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| $ 524288))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| $ 1048576))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|U8Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |U8VEC;#;$Nni;1|
              (|Integer|) |U8VEC;minIndex;$I;2| |U8VEC;empty;$;3|
              |U8VEC;new;NniI$;4| |U8VEC;qelt;$2I;5| |U8VEC;elt;$2I;6|
              |U8VEC;qsetelt!;$3I;7| |U8VEC;setelt!;$3I;8| |U8VEC;fill!;$I$;9|
              (|List| 8) (|Equation| 8) (|List| 18) (|Mapping| 8 8 8)
              (|Boolean|) (|Mapping| 21 8 8) (|OutputForm|) (|HashState|)
              (|SingleInteger|) (|String|) (|InputForm|) (|Mapping| 21 8)
              (|UniversalSegment| 8) (|Void|) (|Mapping| 8 8) (|List| $)
              (|Union| 8 '"failed"))
           '#(~= 0 |trim| 6 |swap!| 12 |sorted?| 19 |sort!| 30 |sort| 41
              |smaller?| 52 |size?| 58 |setelt!| 64 |select| 78 |sample| 84
              |rightTrim| 88 |reverse!| 94 |reverse| 99 |removeDuplicates| 104
              |remove| 109 |reduce| 121 |qsetelt!| 142 |qelt| 149 |position|
              155 |parts| 174 |new| 179 |more?| 185 |minIndex| 191 |min| 196
              |merge| 202 |members| 215 |member?| 220 |maxIndex| 226 |max| 231
              |map!| 237 |map| 243 |less?| 256 |leftTrim| 262 |latex| 268
              |insert| 273 |indices| 287 |index?| 292 |hashUpdate!| 298 |hash|
              304 |first| 309 |find| 314 |fill!| 320 |every?| 326 |eval| 332
              |eq?| 358 |entry?| 364 |entries| 370 |empty?| 375 |empty| 380
              |elt| 384 |delete| 403 |count| 415 |copyInto!| 427 |copy| 434
              |convert| 439 |construct| 444 |concat| 449 |coerce| 472 |any?|
              477 >= 483 > 489 = 495 <= 501 < 507 |#| 513)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 1 0 5 0 0 7 9 0 0 0 0 0 7 8 11 1
                                  2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|IndexedAggregate| 8 8)
                 (|Collection| 8) (|OrderedSet|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 8)
                 (|Evalable| 8) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Eltable| 29 $$) (|Type|) (|Eltable| 8 8)
                 (|InnerEvalable| 8 8) (|BasicType|) (|CoercibleTo| 23)
                 (|PartialOrder|) (|ConvertibleTo| 27))
              (|makeByteWordVec2| 33
                                  '(2 21 21 0 0 1 2 14 0 0 8 1 3 12 30 0 8 8 1
                                    1 17 21 0 1 2 13 21 22 0 1 1 16 0 0 1 2 15
                                    0 22 0 1 1 17 0 0 1 2 13 0 22 0 1 2 18 21 0
                                    0 1 2 0 21 0 6 1 3 12 8 0 29 8 1 3 12 8 0 8
                                    8 15 2 13 0 28 0 1 0 0 0 1 2 14 0 0 8 1 1
                                    15 0 0 1 1 13 0 0 1 1 14 0 0 1 2 14 0 8 0 1
                                    2 13 0 28 0 1 4 14 8 20 0 8 8 1 3 13 8 20 0
                                    8 1 2 13 8 20 0 1 3 12 8 0 8 8 14 2 0 8 0 8
                                    12 3 14 8 8 0 8 1 2 14 8 8 0 1 2 13 8 28 0
                                    1 1 13 17 0 1 2 0 0 6 8 11 2 0 21 0 6 1 1 1
                                    8 0 9 2 17 0 0 0 1 2 17 0 0 0 1 3 13 0 22 0
                                    0 1 1 13 17 0 1 2 14 21 8 0 1 1 1 8 0 1 2
                                    17 0 0 0 1 2 12 0 31 0 1 3 0 0 20 0 0 1 2 0
                                    0 31 0 1 2 0 21 0 6 1 2 14 0 0 8 1 1 19 26
                                    0 1 3 0 0 8 0 8 1 3 0 0 0 0 8 1 1 0 17 0 1
                                    2 0 21 8 0 1 2 19 24 24 0 1 1 19 25 0 1 1 1
                                    8 0 1 2 0 33 28 0 1 2 12 0 0 8 16 2 13 21
                                    28 0 1 3 7 0 0 8 8 1 3 7 0 0 17 17 1 2 7 0
                                    0 18 1 2 7 0 0 19 1 2 0 21 0 0 1 2 14 21 8
                                    0 1 1 0 17 0 1 1 0 21 0 1 0 0 0 10 2 0 0 0
                                    29 1 3 0 8 0 8 8 1 2 0 8 0 8 13 2 0 0 0 8 1
                                    2 0 0 0 29 1 2 14 6 8 0 1 2 13 6 28 0 1 3
                                    15 0 0 0 8 1 1 0 0 0 1 1 2 27 0 1 1 0 0 17
                                    1 2 0 0 0 0 1 1 0 0 32 1 2 0 0 8 0 1 2 0 0
                                    0 8 1 1 20 23 0 1 2 13 21 28 0 1 2 17 21 0
                                    0 1 2 17 21 0 0 1 2 21 21 0 0 1 2 17 21 0 0
                                    1 2 17 21 0 0 1 1 13 6 0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|U8Vector| 'NILADIC T) 
