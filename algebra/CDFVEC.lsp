
(PUT '|CDFVEC;qelt;$IC;1| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;qelt;$IC;1|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;2| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;qsetelt!;$I2C;2|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;#;$Nni;3| '|SPADreplace| 'CDLEN) 

(SDEFUN |CDFVEC;#;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (CDLEN |x|)) 

(PUT '|CDFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFVEC;minIndex;$I;4| ((|x| $) ($ |Integer|)) 0) 

(PUT '|CDFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-CDOUBLE-VECTOR 0))) 

(SDEFUN |CDFVEC;empty;$;5| (($ $)) (MAKE-CDOUBLE-VECTOR 0)) 

(PUT '|CDFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-CDOUBLE-VECTOR) 

(SDEFUN |CDFVEC;qnew;I$;6| ((|n| |Integer|) ($ $)) (MAKE-CDOUBLE-VECTOR |n|)) 

(SDEFUN |CDFVEC;new;NniC$;7|
        ((|n| |NonNegativeInteger|) (|x| |Complex| (|DoubleFloat|)) ($ $))
        (SPROG ((|res| NIL))
               (SEQ (LETT |res| (MAKE-CDOUBLE-VECTOR |n|) |CDFVEC;new;NniC$;7|)
                    (EXIT (SPADCALL |res| |x| (QREFELT $ 15)))))) 

(PUT '|CDFVEC;qelt;$IC;8| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;qelt;$IC;8|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;elt;$IC;9| '|SPADreplace| 'CDELT) 

(SDEFUN |CDFVEC;elt;$IC;9|
        ((|x| $) (|i| |Integer|) ($ |Complex| (|DoubleFloat|))) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;10| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;qsetelt!;$I2C;10|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;setelt;$I2C;11| '|SPADreplace| 'CDSETELT) 

(SDEFUN |CDFVEC;setelt;$I2C;11|
        ((|x| $) (|i| |Integer|) (|s| . #1=(|Complex| (|DoubleFloat|)))
         ($ . #1#))
        (CDSETELT |x| |i| |s|)) 

(SDEFUN |CDFVEC;fill!;$C$;12| ((|x| $) (|s| |Complex| (|DoubleFloat|)) ($ $))
        (SPROG ((#1=#:G2553 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0 . #2=(|CDFVEC;fill!;$C$;12|))
                     (LETT #1# (|sub_SI| (CDLEN |x|) 1) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (CDSETELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ComplexDoubleFloatVector;|)) 

(DEFUN |ComplexDoubleFloatVector| ()
  (SPROG NIL
         (PROG (#1=#:G2567)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ComplexDoubleFloatVector|)
                    . #2=(|ComplexDoubleFloatVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ComplexDoubleFloatVector|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ComplexDoubleFloatVector;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ComplexDoubleFloatVector|)))))))))) 

(DEFUN |ComplexDoubleFloatVector;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2563 NIL) (#2=#:G2564 NIL) (#3=#:G2562 NIL)
    (#4=#:G2561 NIL) (|pv$| NIL) (#5=#:G2565 NIL))
   (PROGN
    (LETT |dv$| '(|ComplexDoubleFloatVector|)
          . #6=(|ComplexDoubleFloatVector|))
    (LETT $ (GETREFV 38) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|OrderedSet|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|SetCategory|))
                                              . #6#)
                                        (OR
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|OrderedSet|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory|
                                                (|Complex| (|DoubleFloat|))
                                                '(|Evalable|
                                                  (|Complex| (|DoubleFloat|))))
                                               (|HasCategory|
                                                (|Complex| (|DoubleFloat|))
                                                '(|SetCategory|)))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|Evalable|
                                             (|Complex| (|DoubleFloat|))))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|OrderedSet|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|BasicType|))
                                              . #6#)
                                        (OR #3#
                                            (|HasCategory|
                                             (|Complex| (|DoubleFloat|))
                                             '(|OrderedSet|))
                                            #1#)
                                        (LETT #4#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|CoercibleTo| (|OutputForm|)))
                                              . #6#)
                                        (OR #4# #2#)
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianSemiGroup|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianMonoid|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|AbelianGroup|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|))
                                         '(|Monoid|))
                                        (|HasCategory|
                                         (|Complex| (|DoubleFloat|)) '(|Ring|))
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|RadicalCategory|))
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Ring|)))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatVector| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (LETT #5# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
         (|augmentPredVector| $ 131072))
    (AND #5# #1# (|augmentPredVector| $ 262144))
    (AND #5# #3# (|augmentPredVector| $ 524288))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1048576))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))
         (|augmentPredVector| $ 2097152))
    (AND (OR (AND #5# #3#) #1#) (|augmentPredVector| $ 4194304))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|ComplexDoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| (|DoubleFloat|)) (|Integer|)
              |CDFVEC;qelt;$IC;8| |CDFVEC;qsetelt!;$I2C;10|
              (|NonNegativeInteger|) |CDFVEC;#;$Nni;3| |CDFVEC;minIndex;$I;4|
              |CDFVEC;empty;$;5| |CDFVEC;qnew;I$;6| |CDFVEC;fill!;$C$;12|
              |CDFVEC;new;NniC$;7| |CDFVEC;elt;$IC;9| |CDFVEC;setelt;$I2C;11|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|OutputForm|) (|InputForm|) (|Matrix| 6)
              (|SingleInteger|) (|String|) (|HashState|) (|Mapping| 23 6)
              (|Mapping| 23 6 6) (|UniversalSegment| 7) (|Void|)
              (|Mapping| 6 6) (|List| $) (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero?| 6 |zero| 11 |vector| 16 |swap!| 21 |sorted?| 28
              |sort!| 39 |sort| 50 |smaller?| 61 |size?| 67 |setelt| 73
              |select| 87 |sample| 93 |reverse!| 97 |reverse| 102
              |removeDuplicates| 107 |remove| 112 |reduce| 124 |qsetelt!| 145
              |qnew| 152 |qelt| 157 |position| 163 |parts| 182 |outerProduct|
              187 |new| 193 |more?| 199 |minIndex| 205 |min| 210 |merge| 216
              |members| 229 |member?| 234 |maxIndex| 240 |max| 245 |map!| 251
              |map| 257 |magnitude| 270 |less?| 275 |length| 281 |latex| 286
              |insert| 291 |indices| 305 |index?| 310 |hashUpdate!| 316 |hash|
              322 |first| 327 |find| 332 |fill!| 338 |every?| 344 |eval| 350
              |eq?| 376 |entry?| 382 |entries| 388 |empty?| 393 |empty| 398
              |elt| 402 |dot| 421 |delete| 427 |cross| 439 |count| 445
              |copyInto!| 457 |copy| 464 |convert| 469 |construct| 474 |concat|
              479 |coerce| 502 |any?| 507 >= 513 > 519 = 525 <= 531 < 537 - 543
              + 554 * 560 |#| 578)
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
                                  '(2 23 23 0 0 1 1 13 23 0 1 1 13 0 10 1 1 0 0
                                    19 1 3 21 33 0 7 7 1 1 2 23 0 1 2 0 23 31 0
                                    1 1 22 0 0 1 2 21 0 31 0 1 1 2 0 0 1 2 0 0
                                    31 0 1 2 2 23 0 0 1 2 0 23 0 10 1 3 21 6 0
                                    32 6 1 3 21 6 0 7 6 18 2 18 0 30 0 1 0 0 0
                                    1 1 21 0 0 1 1 0 0 0 1 1 20 0 0 1 2 20 0 6
                                    0 1 2 18 0 30 0 1 4 20 6 22 0 6 6 1 2 18 6
                                    22 0 1 3 18 6 22 0 6 1 3 21 6 0 7 6 9 1 0 0
                                    7 14 2 0 6 0 7 8 2 8 7 6 0 1 3 8 7 6 0 7 1
                                    2 0 7 30 0 1 1 18 19 0 1 2 16 26 0 0 1 2 0
                                    0 10 6 16 2 0 23 0 10 1 1 7 7 0 12 2 2 0 0
                                    0 1 2 2 0 0 0 1 3 0 0 31 0 0 1 1 18 19 0 1
                                    2 20 23 6 0 1 1 7 7 0 1 2 2 0 0 0 1 2 21 0
                                    34 0 1 3 0 0 22 0 0 1 2 0 0 34 0 1 1 17 6 0
                                    1 2 0 23 0 10 1 1 17 6 0 1 1 3 28 0 1 3 0 0
                                    0 0 7 1 3 0 0 6 0 7 1 1 0 37 0 1 2 0 23 7 0
                                    1 2 3 29 29 0 1 1 3 27 0 1 1 7 6 0 1 2 0 36
                                    30 0 1 2 21 0 0 6 15 2 18 23 30 0 1 3 5 0 0
                                    19 19 1 2 5 0 0 20 1 3 5 0 0 6 6 1 2 5 0 0
                                    21 1 2 0 23 0 0 1 2 19 23 6 0 1 1 0 19 0 1
                                    1 0 23 0 1 0 0 0 13 2 0 0 0 32 1 3 0 6 0 7
                                    6 1 2 0 6 0 7 17 2 16 6 0 0 1 2 0 0 0 32 1
                                    2 0 0 0 7 1 2 16 0 0 0 1 2 20 10 6 0 1 2 18
                                    10 30 0 1 3 21 0 0 0 7 1 1 0 0 0 1 1 1 25 0
                                    1 1 0 0 19 1 1 0 0 35 1 2 0 0 0 0 1 2 0 0 0
                                    6 1 2 0 0 6 0 1 1 10 24 0 1 2 18 23 30 0 1
                                    2 2 23 0 0 1 2 2 23 0 0 1 2 23 23 0 0 1 2 2
                                    23 0 0 1 2 2 23 0 0 1 1 14 0 0 1 2 14 0 0 0
                                    1 2 12 0 0 0 1 2 14 0 7 0 1 2 15 0 6 0 1 2
                                    15 0 0 6 1 1 18 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|ComplexDoubleFloatVector| 'NILADIC T) 
