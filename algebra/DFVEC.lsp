
(PUT '|DFVEC;qelt;$IDf;1| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;$IDf;1| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;2| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;$I2Df;2|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;#;$Nni;3| '|SPADreplace| 'DLEN) 

(SDEFUN |DFVEC;#;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (DLEN |x|)) 

(PUT '|DFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFVEC;minIndex;$I;4| ((|x| $) ($ |Integer|)) 0) 

(PUT '|DFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-DOUBLE-VECTOR 0))) 

(SDEFUN |DFVEC;empty;$;5| (($ $)) (MAKE-DOUBLE-VECTOR 0)) 

(PUT '|DFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-DOUBLE-VECTOR) 

(SDEFUN |DFVEC;qnew;I$;6| ((|n| |Integer|) ($ $)) (MAKE-DOUBLE-VECTOR |n|)) 

(PUT '|DFVEC;new;NniDf$;7| '|SPADreplace| 'MAKE-DOUBLE-VECTOR1) 

(SDEFUN |DFVEC;new;NniDf$;7|
        ((|n| |NonNegativeInteger|) (|x| |DoubleFloat|) ($ $))
        (MAKE-DOUBLE-VECTOR1 |n| |x|)) 

(PUT '|DFVEC;qelt;$IDf;8| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;qelt;$IDf;8| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;elt;$IDf;9| '|SPADreplace| 'DELT) 

(SDEFUN |DFVEC;elt;$IDf;9| ((|x| $) (|i| |Integer|) ($ |DoubleFloat|))
        (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;10| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;qsetelt!;$I2Df;10|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;setelt!;$I2Df;11| '|SPADreplace| 'DSETELT) 

(SDEFUN |DFVEC;setelt!;$I2Df;11|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|DoubleFloat|)) ($ . #1#))
        (DSETELT |x| |i| |s|)) 

(SDEFUN |DFVEC;fill!;$Df$;12| ((|x| $) (|s| |DoubleFloat|) ($ $))
        (SPROG ((#1=#:G2407 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|DFVEC;fill!;$Df$;12|))
                     (LETT #1# (|sub_SI| (DLEN |x|) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (DSETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |DoubleFloatVector;|)) 

(DEFUN |DoubleFloatVector| ()
  (SPROG NIL
         (PROG (#1=#:G2421)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatVector|)
                    . #2=(|DoubleFloatVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatVector|
                             (LIST
                              (CONS NIL (CONS 1 (|DoubleFloatVector;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DoubleFloatVector|)))))))))) 

(DEFUN |DoubleFloatVector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2417 NIL) (#2=#:G2418 NIL) (#3=#:G2416 NIL)
    (#4=#:G2415 NIL) (|pv$| NIL) (#5=#:G2419 NIL))
   (PROGN
    (LETT |dv$| '(|DoubleFloatVector|) . #6=(|DoubleFloatVector|))
    (LETT $ (GETREFV 38) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|OrderedSet|))
                                        (LETT #1#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|SetCategory|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|OrderedSet|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|DoubleFloat|)
                                                              '(|Evalable|
                                                                (|DoubleFloat|)))
                                               (|HasCategory| (|DoubleFloat|)
                                                              '(|SetCategory|)))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|Evalable|
                                                           (|DoubleFloat|)))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|OrderedSet|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|BasicType|))
                                              . #6#)
                                        (OR #3#
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|))
                                            #1#)
                                        (LETT #4#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #6#)
                                        (OR #4# #2#)
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Monoid|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Ring|))
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|RadicalCategory|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Ring|)))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|DoubleFloatVector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (LETT #5# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
         (|augmentPredVector| $ 131072))
    (AND #5# #1# (|augmentPredVector| $ 262144))
    (AND #5# #3# (|augmentPredVector| $ 524288))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| $ 2097152))
    (AND (OR (AND #5# #3#) #1#) (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|DoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|DoubleFloat|) (|Integer|)
              |DFVEC;qelt;$IDf;8| |DFVEC;qsetelt!;$I2Df;10|
              (|NonNegativeInteger|) |DFVEC;#;$Nni;3| |DFVEC;minIndex;$I;4|
              |DFVEC;empty;$;5| |DFVEC;qnew;I$;6| |DFVEC;new;NniDf$;7|
              |DFVEC;elt;$IDf;9| |DFVEC;setelt!;$I2Df;11| |DFVEC;fill!;$Df$;12|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|OutputForm|) (|InputForm|) (|Matrix| 6)
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 23 6)
              (|Mapping| 23 6 6) (|UniversalSegment| 7) (|Void|)
              (|Mapping| 6 6) (|List| $) (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero?| 6 |zero| 11 |swap!| 16 |sorted?| 23 |sort!| 34
              |sort| 45 |smaller?| 56 |size?| 62 |setelt!| 68 |select| 82
              |sample| 88 |reverse!| 92 |reverse| 97 |removeDuplicates| 102
              |remove| 107 |reduce| 119 |qsetelt!| 140 |qnew| 147 |qelt| 152
              |position| 158 |parts| 177 |outerProduct| 182 |new| 188 |more?|
              194 |minIndex| 200 |min| 205 |merge| 211 |members| 224 |member?|
              229 |maxIndex| 235 |max| 240 |map!| 246 |map| 252 |magnitude| 265
              |less?| 270 |length| 276 |latex| 281 |insert| 286 |indices| 300
              |index?| 305 |hashUpdate!| 311 |hash| 317 |first| 322 |find| 327
              |fill!| 333 |every?| 339 |eval| 345 |eq?| 371 |entry?| 377
              |entries| 383 |empty?| 388 |empty| 393 |elt| 397 |dot| 416
              |delete| 422 |cross| 434 |count| 440 |copyInto!| 452 |copy| 459
              |convert| 464 |construct| 469 |concat| 474 |coerce| 497 |any?|
              502 >= 508 > 514 = 520 <= 526 < 532 - 538 + 549 * 555 |#| 573)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11
                                  2))
            (CONS
             '#(|VectorCategory&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL |InnerEvalable&| NIL |BasicType&| NIL
                |PartialOrder&|)
             (CONS
              '#((|VectorCategory| 6) (|OneDimensionalArrayAggregate| 6)
                 (|FiniteLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 7 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 7 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 7 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 25)
                 (|BasicType|) (|CoercibleTo| 24) (|PartialOrder|))
              (|makeByteWordVec2| 37
                                  '(2 23 23 0 0 1 1 13 23 0 1 1 13 0 10 1 3 21
                                    33 0 7 7 1 1 2 23 0 1 2 0 23 31 0 1 1 22 0
                                    0 1 2 21 0 31 0 1 1 2 0 0 1 2 0 0 31 0 1 2
                                    2 23 0 0 1 2 0 23 0 10 1 3 21 6 0 32 6 1 3
                                    21 6 0 7 6 17 2 18 0 30 0 1 0 0 0 1 1 21 0
                                    0 1 1 0 0 0 1 1 20 0 0 1 2 20 0 6 0 1 2 18
                                    0 30 0 1 4 20 6 22 0 6 6 1 2 18 6 22 0 1 3
                                    18 6 22 0 6 1 3 21 6 0 7 6 9 1 0 0 7 14 2 0
                                    6 0 7 8 2 8 7 6 0 1 3 8 7 6 0 7 1 2 0 7 30
                                    0 1 1 18 19 0 1 2 16 26 0 0 1 2 0 0 10 6 15
                                    2 0 23 0 10 1 1 7 7 0 12 2 2 0 0 0 1 2 2 0
                                    0 0 1 3 0 0 31 0 0 1 1 18 19 0 1 2 20 23 6
                                    0 1 1 7 7 0 1 2 2 0 0 0 1 2 21 0 34 0 1 3 0
                                    0 22 0 0 1 2 0 0 34 0 1 1 17 6 0 1 2 0 23 0
                                    10 1 1 17 6 0 1 1 3 29 0 1 3 0 0 0 0 7 1 3
                                    0 0 6 0 7 1 1 0 37 0 1 2 0 23 7 0 1 2 3 28
                                    28 0 1 1 3 27 0 1 1 7 6 0 1 2 0 36 30 0 1 2
                                    21 0 0 6 18 2 18 23 30 0 1 3 5 0 0 19 19 1
                                    2 5 0 0 20 1 3 5 0 0 6 6 1 2 5 0 0 21 1 2 0
                                    23 0 0 1 2 19 23 6 0 1 1 0 19 0 1 1 0 23 0
                                    1 0 0 0 13 2 0 0 0 32 1 3 0 6 0 7 6 1 2 0 6
                                    0 7 16 2 16 6 0 0 1 2 0 0 0 32 1 2 0 0 0 7
                                    1 2 16 0 0 0 1 2 20 10 6 0 1 2 18 10 30 0 1
                                    3 21 0 0 0 7 1 1 0 0 0 1 1 1 25 0 1 1 0 0
                                    19 1 1 0 0 35 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0
                                    0 6 0 1 1 10 24 0 1 2 18 23 30 0 1 2 2 23 0
                                    0 1 2 2 23 0 0 1 2 23 23 0 0 1 2 2 23 0 0 1
                                    2 2 23 0 0 1 2 14 0 0 0 1 1 14 0 0 1 2 12 0
                                    0 0 1 2 14 0 7 0 1 2 15 0 0 6 1 2 15 0 6 0
                                    1 1 18 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatVector| 'NILADIC T) 
