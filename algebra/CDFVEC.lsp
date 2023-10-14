
(/VERSIONCHECK 2) 

(PUT '|CDFVEC;qelt;$IC;1| '|SPADreplace| 'CDELT) 

(DEFUN |CDFVEC;qelt;$IC;1| (|x| |i| $) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;2| '|SPADreplace| 'CDSETELT) 

(DEFUN |CDFVEC;qsetelt!;$I2C;2| (|x| |i| |s| $) (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;#;$Nni;3| '|SPADreplace| 'CDLEN) 

(DEFUN |CDFVEC;#;$Nni;3| (|x| $) (CDLEN |x|)) 

(PUT '|CDFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |CDFVEC;minIndex;$I;4| (|x| $) 0) 

(PUT '|CDFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-CDOUBLE-VECTOR 0))) 

(DEFUN |CDFVEC;empty;$;5| ($) (MAKE-CDOUBLE-VECTOR 0)) 

(PUT '|CDFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-CDOUBLE-VECTOR) 

(DEFUN |CDFVEC;qnew;I$;6| (|n| $) (MAKE-CDOUBLE-VECTOR |n|)) 

(DEFUN |CDFVEC;new;NniC$;7| (|n| |x| $)
  (PROG (|res|)
    (RETURN
     (SEQ (LETT |res| (MAKE-CDOUBLE-VECTOR |n|) |CDFVEC;new;NniC$;7|)
          (EXIT (SPADCALL |res| |x| (QREFELT $ 15))))))) 

(PUT '|CDFVEC;qelt;$IC;8| '|SPADreplace| 'CDELT) 

(DEFUN |CDFVEC;qelt;$IC;8| (|x| |i| $) (CDELT |x| |i|)) 

(PUT '|CDFVEC;elt;$IC;9| '|SPADreplace| 'CDELT) 

(DEFUN |CDFVEC;elt;$IC;9| (|x| |i| $) (CDELT |x| |i|)) 

(PUT '|CDFVEC;qsetelt!;$I2C;10| '|SPADreplace| 'CDSETELT) 

(DEFUN |CDFVEC;qsetelt!;$I2C;10| (|x| |i| |s| $) (CDSETELT |x| |i| |s|)) 

(PUT '|CDFVEC;setelt;$I2C;11| '|SPADreplace| 'CDSETELT) 

(DEFUN |CDFVEC;setelt;$I2C;11| (|x| |i| |s| $) (CDSETELT |x| |i| |s|)) 

(DEFUN |CDFVEC;fill!;$C$;12| (|x| |s| $)
  (PROG (#1=#:G2503 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|CDFVEC;fill!;$C$;12|))
           (LETT #1# (|sub_SI| (CDLEN |x|) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (CDSETELT |x| |i| |s|))) (LETT |i| (|inc_SI| |i|) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |ComplexDoubleFloatVector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2516)
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
                          (CONS NIL (CONS 1 (|ComplexDoubleFloatVector;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ComplexDoubleFloatVector|))))))))))) 

(DEFUN |ComplexDoubleFloatVector;| ()
  (PROG (|dv$| $ #1=#:G2512 #2=#:G2513 #3=#:G2511 |pv$| #4=#:G2514)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ComplexDoubleFloatVector|)
            . #5=(|ComplexDoubleFloatVector|))
      (LETT $ (GETREFV 37) . #5#)
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
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|Complex| (|DoubleFloat|))
                                                 '(|SetCategory|))
                                                . #5#)
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
                                                    (|Complex|
                                                     (|DoubleFloat|))))
                                                 (|HasCategory|
                                                  (|Complex| (|DoubleFloat|))
                                                  '(|SetCategory|)))
                                                . #5#)
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
                                          (LETT #3#
                                                (|HasCategory|
                                                 (|Complex| (|DoubleFloat|))
                                                 '(|CoercibleTo|
                                                   (|OutputForm|)))
                                                . #5#)
                                          (OR #3# #2#)
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
                                           (|Complex| (|DoubleFloat|))
                                           '(|Ring|))
                                          (AND
                                           (|HasCategory|
                                            (|Complex| (|DoubleFloat|))
                                            '(|RadicalCategory|))
                                           (|HasCategory|
                                            (|Complex| (|DoubleFloat|))
                                            '(|Ring|)))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatVector| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 32768))
      (AND #4# #1# (|augmentPredVector| $ 65536))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 131072))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Complex| (|DoubleFloat|)) '(|OrderedSet|))
           (|augmentPredVector| $ 262144))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ComplexDoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| (|DoubleFloat|)) (|Integer|)
              |CDFVEC;qelt;$IC;8| |CDFVEC;qsetelt!;$I2C;10|
              (|NonNegativeInteger|) |CDFVEC;#;$Nni;3| |CDFVEC;minIndex;$I;4|
              |CDFVEC;empty;$;5| |CDFVEC;qnew;I$;6| |CDFVEC;fill!;$C$;12|
              |CDFVEC;new;NniC$;7| |CDFVEC;elt;$IC;9| |CDFVEC;setelt;$I2C;11|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|OutputForm|) (|InputForm|) (|Matrix| 6)
              (|SingleInteger|) (|String|) (|Mapping| 23 6) (|Mapping| 23 6 6)
              (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6) (|List| $)
              (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero| 6 |vector| 11 |swap!| 16 |sorted?| 23 |sort!| 34
              |sort| 45 |smaller?| 56 |size?| 62 |setelt| 68 |select| 82
              |sample| 88 |reverse!| 92 |reverse| 97 |removeDuplicates| 102
              |remove| 107 |reduce| 119 |qsetelt!| 140 |qnew| 147 |qelt| 152
              |position| 158 |parts| 177 |outerProduct| 182 |new| 188 |more?|
              194 |minIndex| 200 |min| 205 |merge| 211 |members| 224 |member?|
              229 |maxIndex| 235 |max| 240 |map!| 246 |map| 252 |magnitude| 265
              |less?| 270 |length| 276 |latex| 281 |insert| 286 |indices| 300
              |index?| 305 |hash| 311 |first| 316 |find| 321 |fill!| 327
              |every?| 333 |eval| 339 |eq?| 365 |entry?| 371 |entries| 377
              |empty?| 382 |empty| 387 |elt| 391 |dot| 410 |delete| 416 |cross|
              428 |count| 434 |copyInto!| 446 |copy| 453 |convert| 458
              |construct| 463 |concat| 468 |coerce| 491 |any?| 496 >= 502 > 508
              = 514 <= 520 < 526 - 532 + 543 * 549 |#| 567)
           'NIL
           (CONS
            (|makeByteWordVec2| 9
                                '(0 0 0 0 0 0 2 0 2 0 0 7 5 0 0 0 0 7 1 5 9 2))
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
              (|makeByteWordVec2| 36
                                  '(2 4 23 0 0 1 1 11 0 10 1 1 0 0 19 1 3 18 32
                                    0 7 7 1 1 2 23 0 1 2 0 23 30 0 1 1 19 0 0 1
                                    2 18 0 30 0 1 1 2 0 0 1 2 0 0 30 0 1 2 2 23
                                    0 0 1 2 0 23 0 10 1 3 18 6 0 31 6 1 3 18 6
                                    0 7 6 18 2 16 0 29 0 1 0 0 0 1 1 18 0 0 1 1
                                    0 0 0 1 1 17 0 0 1 2 17 0 6 0 1 2 16 0 29 0
                                    1 4 17 6 22 0 6 6 1 2 16 6 22 0 1 3 16 6 22
                                    0 6 1 3 18 6 0 7 6 9 1 0 0 7 14 2 0 6 0 7 8
                                    3 4 7 6 0 7 1 2 4 7 6 0 1 2 0 7 29 0 1 1 16
                                    19 0 1 2 14 26 0 0 1 2 0 0 10 6 16 2 0 23 0
                                    10 1 1 3 7 0 12 2 2 0 0 0 1 2 2 0 0 0 1 3 0
                                    0 30 0 0 1 1 16 19 0 1 2 17 23 6 0 1 1 3 7
                                    0 1 2 2 0 0 0 1 2 18 0 33 0 1 3 0 0 22 0 0
                                    1 2 0 0 33 0 1 1 15 6 0 1 2 0 23 0 10 1 1
                                    15 6 0 1 1 4 28 0 1 3 0 0 0 0 7 1 3 0 0 6 0
                                    7 1 1 0 36 0 1 2 0 23 7 0 1 1 4 27 0 1 1 3
                                    6 0 1 2 0 35 29 0 1 2 18 0 0 6 15 2 16 23
                                    29 0 1 3 6 0 0 19 19 1 2 6 0 0 20 1 3 6 0 0
                                    6 6 1 2 6 0 0 21 1 2 0 23 0 0 1 2 17 23 6 0
                                    1 1 0 19 0 1 1 0 23 0 1 0 0 0 13 2 0 0 0 31
                                    1 3 0 6 0 7 6 1 2 0 6 0 7 17 2 14 6 0 0 1 2
                                    0 0 0 7 1 2 0 0 0 31 1 2 14 0 0 0 1 2 17 10
                                    6 0 1 2 16 10 29 0 1 3 18 0 0 0 7 1 1 0 0 0
                                    1 1 1 25 0 1 1 0 0 19 1 2 0 0 0 0 1 1 0 0
                                    34 1 2 0 0 6 0 1 2 0 0 0 6 1 1 8 24 0 1 2
                                    16 23 29 0 1 2 2 23 0 0 1 2 2 23 0 0 1 2 4
                                    23 0 0 1 2 2 23 0 0 1 2 2 23 0 0 1 1 12 0 0
                                    1 2 12 0 0 0 1 2 10 0 0 0 1 2 12 0 7 0 1 2
                                    13 0 6 0 1 2 13 0 0 6 1 1 16 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|ComplexDoubleFloatVector| 'NILADIC T) 
