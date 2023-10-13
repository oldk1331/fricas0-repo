
(/VERSIONCHECK 2) 

(PUT '|DFVEC;qelt;$IDf;1| '|SPADreplace| 'DELT) 

(DEFUN |DFVEC;qelt;$IDf;1| (|x| |i| $) (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;2| '|SPADreplace| 'DSETELT) 

(DEFUN |DFVEC;qsetelt!;$I2Df;2| (|x| |i| |s| $) (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;#;$Nni;3| '|SPADreplace| 'DLEN) 

(DEFUN |DFVEC;#;$Nni;3| (|x| $) (DLEN |x|)) 

(PUT '|DFVEC;minIndex;$I;4| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |DFVEC;minIndex;$I;4| (|x| $) 0) 

(PUT '|DFVEC;empty;$;5| '|SPADreplace| '(XLAM NIL (MAKE-DOUBLE-VECTOR 0))) 

(DEFUN |DFVEC;empty;$;5| ($) (MAKE-DOUBLE-VECTOR 0)) 

(PUT '|DFVEC;qnew;I$;6| '|SPADreplace| 'MAKE-DOUBLE-VECTOR) 

(DEFUN |DFVEC;qnew;I$;6| (|n| $) (MAKE-DOUBLE-VECTOR |n|)) 

(PUT '|DFVEC;new;NniDf$;7| '|SPADreplace| 'MAKE-DOUBLE-VECTOR1) 

(DEFUN |DFVEC;new;NniDf$;7| (|n| |x| $) (MAKE-DOUBLE-VECTOR1 |n| |x|)) 

(PUT '|DFVEC;qelt;$IDf;8| '|SPADreplace| 'DELT) 

(DEFUN |DFVEC;qelt;$IDf;8| (|x| |i| $) (DELT |x| |i|)) 

(PUT '|DFVEC;elt;$IDf;9| '|SPADreplace| 'DELT) 

(DEFUN |DFVEC;elt;$IDf;9| (|x| |i| $) (DELT |x| |i|)) 

(PUT '|DFVEC;qsetelt!;$I2Df;10| '|SPADreplace| 'DSETELT) 

(DEFUN |DFVEC;qsetelt!;$I2Df;10| (|x| |i| |s| $) (DSETELT |x| |i| |s|)) 

(PUT '|DFVEC;setelt;$I2Df;11| '|SPADreplace| 'DSETELT) 

(DEFUN |DFVEC;setelt;$I2Df;11| (|x| |i| |s| $) (DSETELT |x| |i| |s|)) 

(DEFUN |DFVEC;fill!;$Df$;12| (|x| |s| $)
  (PROG (#1=#:G2360 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|DFVEC;fill!;$Df$;12|))
           (LETT #1# (|sub_SI| (DLEN |x|) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (DSETELT |x| |i| |s|))) (LETT |i| (|inc_SI| |i|) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |DoubleFloatVector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2373)
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
                         (LIST (CONS NIL (CONS 1 (|DoubleFloatVector;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|DoubleFloatVector|))))))))))) 

(DEFUN |DoubleFloatVector;| ()
  (PROG (|dv$| $ #1=#:G2369 #2=#:G2370 #3=#:G2368 |pv$| #4=#:G2371)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DoubleFloatVector|) . #5=(|DoubleFloatVector|))
      (LETT $ (GETREFV 37) . #5#)
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
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory| (|DoubleFloat|)
                                                               '(|SetCategory|))
                                                . #5#)
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
                                                . #5#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|Evalable|
                                                             (|DoubleFloat|)))
                                            (|HasCategory| (|DoubleFloat|)
                                                           '(|OrderedSet|)))
                                           #2#)
                                          (LETT #3#
                                                (|HasCategory| (|DoubleFloat|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #5#)
                                          (OR #3# #2#)
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
                      . #5#))
      (|haddProp| |$ConstructorCache| '|DoubleFloatVector| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #4# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
           (|augmentPredVector| $ 32768))
      (AND #4# #1# (|augmentPredVector| $ 65536))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 131072))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
           (|augmentPredVector| $ 262144))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DoubleFloatVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|DoubleFloat|) (|Integer|)
              |DFVEC;qelt;$IDf;8| |DFVEC;qsetelt!;$I2Df;10|
              (|NonNegativeInteger|) |DFVEC;#;$Nni;3| |DFVEC;minIndex;$I;4|
              |DFVEC;empty;$;5| |DFVEC;qnew;I$;6| |DFVEC;new;NniDf$;7|
              |DFVEC;elt;$IDf;9| |DFVEC;setelt;$I2Df;11| |DFVEC;fill!;$Df$;12|
              (|List| 6) (|Equation| 6) (|List| 20) (|Mapping| 6 6 6)
              (|Boolean|) (|OutputForm|) (|InputForm|) (|Matrix| 6) (|String|)
              (|SingleInteger|) (|Mapping| 23 6) (|Mapping| 23 6 6)
              (|UniversalSegment| 7) (|Void|) (|Mapping| 6 6) (|List| $)
              (|Union| 6 '"failed") (|List| 7))
           '#(~= 0 |zero| 6 |swap!| 11 |sorted?| 18 |sort!| 29 |sort| 40
              |smaller?| 51 |size?| 57 |setelt| 63 |select| 77 |sample| 83
              |reverse!| 87 |reverse| 92 |removeDuplicates| 97 |remove| 102
              |reduce| 114 |qsetelt!| 135 |qnew| 142 |qelt| 147 |position| 153
              |parts| 172 |outerProduct| 177 |new| 183 |more?| 189 |minIndex|
              195 |min| 200 |merge| 206 |members| 219 |member?| 224 |maxIndex|
              230 |max| 235 |map!| 241 |map| 247 |magnitude| 260 |less?| 265
              |length| 271 |latex| 276 |insert| 281 |indices| 295 |index?| 300
              |hash| 306 |first| 311 |find| 316 |fill!| 322 |every?| 328 |eval|
              334 |eq?| 360 |entry?| 366 |entries| 372 |empty?| 377 |empty| 382
              |elt| 386 |dot| 405 |delete| 411 |cross| 423 |count| 429
              |copyInto!| 441 |copy| 448 |convert| 453 |construct| 458 |concat|
              463 |coerce| 486 |any?| 491 >= 497 > 503 = 509 <= 515 < 521 - 527
              + 538 * 544 |#| 562)
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
                                  '(2 4 23 0 0 1 1 11 0 10 1 3 18 32 0 7 7 1 1
                                    2 23 0 1 2 0 23 30 0 1 1 19 0 0 1 2 18 0 30
                                    0 1 1 2 0 0 1 2 0 0 30 0 1 2 2 23 0 0 1 2 0
                                    23 0 10 1 3 18 6 0 31 6 1 3 18 6 0 7 6 17 2
                                    16 0 29 0 1 0 0 0 1 1 18 0 0 1 1 0 0 0 1 1
                                    17 0 0 1 2 17 0 6 0 1 2 16 0 29 0 1 4 17 6
                                    22 0 6 6 1 2 16 6 22 0 1 3 16 6 22 0 6 1 3
                                    18 6 0 7 6 9 1 0 0 7 14 2 0 6 0 7 8 3 4 7 6
                                    0 7 1 2 4 7 6 0 1 2 0 7 29 0 1 1 16 19 0 1
                                    2 14 26 0 0 1 2 0 0 10 6 15 2 0 23 0 10 1 1
                                    3 7 0 12 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 30 0
                                    0 1 1 16 19 0 1 2 17 23 6 0 1 1 3 7 0 1 2 2
                                    0 0 0 1 2 18 0 33 0 1 3 0 0 22 0 0 1 2 0 0
                                    33 0 1 1 15 6 0 1 2 0 23 0 10 1 1 15 6 0 1
                                    1 4 27 0 1 3 0 0 6 0 7 1 3 0 0 0 0 7 1 1 0
                                    36 0 1 2 0 23 7 0 1 1 4 28 0 1 1 3 6 0 1 2
                                    0 35 29 0 1 2 18 0 0 6 18 2 16 23 29 0 1 3
                                    6 0 0 19 19 1 2 6 0 0 20 1 3 6 0 0 6 6 1 2
                                    6 0 0 21 1 2 0 23 0 0 1 2 17 23 6 0 1 1 0
                                    19 0 1 1 0 23 0 1 0 0 0 13 2 0 0 0 31 1 3 0
                                    6 0 7 6 1 2 0 6 0 7 16 2 14 6 0 0 1 2 0 0 0
                                    31 1 2 0 0 0 7 1 2 14 0 0 0 1 2 17 10 6 0 1
                                    2 16 10 29 0 1 3 18 0 0 0 7 1 1 0 0 0 1 1 1
                                    25 0 1 1 0 0 19 1 2 0 0 0 0 1 1 0 0 34 1 2
                                    0 0 6 0 1 2 0 0 0 6 1 1 8 24 0 1 2 16 23 29
                                    0 1 2 2 23 0 0 1 2 2 23 0 0 1 2 4 23 0 0 1
                                    2 2 23 0 0 1 2 2 23 0 0 1 2 12 0 0 0 1 1 12
                                    0 0 1 2 10 0 0 0 1 2 12 0 7 0 1 2 13 0 0 6
                                    1 2 13 0 6 0 1 1 16 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatVector| 'NILADIC T) 
