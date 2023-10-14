
(/VERSIONCHECK 2) 

(PUT '|MATRIX;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 1)) 

(DEFUN |MATRIX;minRowIndex;$I;1| (|x| $) 1) 

(PUT '|MATRIX;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 1)) 

(DEFUN |MATRIX;minColIndex;$I;2| (|x| $) 1) 

(PUT '|MATRIX;qelt;$2IR;3| '|SPADreplace|
     '(XLAM (|m| |i| |j|) (QAREF2O |m| |i| |j| 1 1))) 

(DEFUN |MATRIX;qelt;$2IR;3| (|m| |i| |j| $) (QAREF2O |m| |i| |j| 1 1)) 

(PUT '|MATRIX;qsetelt!;$2I2R;4| '|SPADreplace|
     '(XLAM (|m| |i| |j| |r|) (QSETAREF2O |m| |i| |j| |r| 1 1))) 

(DEFUN |MATRIX;qsetelt!;$2I2R;4| (|m| |i| |j| |r| $)
  (QSETAREF2O |m| |i| |j| |r| 1 1)) 

(DEFUN |MATRIX;swapRows!;$2I$;5| (|x| |i1| |i2| $)
  (PROG (|t2| |t1| #1=#:G2109 |j|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| 1)
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 14))
                (OR (< |i2| 1)
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                              (QREFELT $ 14)))))
        (|error| "swapRows!: index out of range"))
       ('T
        (COND ((EQL |i1| |i2|) |x|)
              ('T
               (SEQ
                (SEQ (LETT |j| 1 . #2=(|MATRIX;swapRows!;$2I$;5|))
                     (LETT #1# (SPADCALL |x| (QREFELT $ 15)) . #2#) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ (LETT |t1| (QAREF2O |x| |i1| |j| 1 1) . #2#)
                          (LETT |t2| (QAREF2O |x| |i2| |j| 1 1) . #2#)
                          (QSETAREF2O |x| |i1| |j| |t2| 1 1)
                          (EXIT (QSETAREF2O |x| |i2| |j| |t1| 1 1)))
                     (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |MATRIX;determinant;$R;6| (|x| $) (SPADCALL |x| (QREFELT $ 18))) 

(DEFUN |MATRIX;minordet;$R;7| (|x| $) (SPADCALL |x| (QREFELT $ 20))) 

(DEFUN |MATRIX;rowEchelon;2$;8| (|x| $) (SPADCALL |x| (QREFELT $ 22))) 

(DEFUN |MATRIX;rank;$Nni;9| (|x| $) (SPADCALL |x| (QREFELT $ 25))) 

(DEFUN |MATRIX;nullity;$Nni;10| (|x| $) (SPADCALL |x| (QREFELT $ 27))) 

(DEFUN |MATRIX;nullSpace;$L;11| (|x| $) (SPADCALL |x| (QREFELT $ 30))) 

(DEFUN |MATRIX;inverse;$U;12| (|x| $) (SPADCALL |x| (QREFELT $ 33))) 

(DEFUN |MATRIX;diagonalMatrix;V$;13| (|v| $)
  (PROG (#1=#:G2126 |i| #2=#:G2127 |j| #3=#:G2128 |k| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #4=(|MATRIX;diagonalMatrix;V$;13|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 36)) . #4#)
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 38)) . #4#)
               (LETT #3# (QVSIZE |v|) . #4#) (LETT |j| 1 . #4#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 15)) . #4#)
               (LETT |i| 1 . #4#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 12)) . #4#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (|greater_SI| |j| #2#) (> |k| #3#))
                 (GO G191)))
               (SEQ (EXIT (QSETAREF2O |ans| |i| |j| (QAREF1O |v| |k| 1) 1 1)))
               (LETT |i|
                     (PROG1 (|inc_SI| |i|)
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT |k| (+ |k| 1) . #4#))
                             . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MATRIX;convert;$If;14| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|matrix| (QREFELT $ 42))
         (SPADCALL (SPADCALL |x| (QREFELT $ 44)) (QREFELT $ 45)))
   (QREFELT $ 47))) 

(DECLAIM (NOTINLINE |Matrix;|)) 

(DEFUN |Matrix| (#1=#:G2140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Matrix|)
                                           '|domainEqualList|)
                . #3=(|Matrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Matrix;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Matrix|))))))))))) 

(DEFUN |Matrix;| (|#1|)
  (PROG (|pv$| #1=#:G2137 #2=#:G2138 #3=#:G2139 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Matrix|))
      (LETT |dv$| (LIST '|Matrix| DV$1) . #4#)
      (LETT $ (GETREFV 64) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|SetCategory|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|BasicType|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           (|HasCategory| |#1|
                                                          '(|SetCategory|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|))))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1| '(|Monoid|))
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (LETT #1#
                                                (|HasCategory| |#1| '(|Field|))
                                                . #4#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #1#)
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|SetCategory|))))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|Matrix| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 16384))
      (AND #3# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32768))
      (AND
       (OR (AND #3# (|HasCategory| $ '(|finiteAggregate|)))
           (|HasCategory| |#1| '(|SetCategory|)))
       (|augmentPredVector| $ 65536))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 12)
        (PROGN
         (QSETREFV $ 19
                   (CONS (|dispatchFunction| |MATRIX;determinant;$R;6|) $))
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |MATRIX;minordet;$R;7|) $)))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 23
                  (CONS (|dispatchFunction| |MATRIX;rowEchelon;2$;8|) $))))
      (COND
       ((|testBitVector| |pv$| 11)
        (PROGN
         (QSETREFV $ 26 (CONS (|dispatchFunction| |MATRIX;rank;$Nni;9|) $))
         (QSETREFV $ 28 (CONS (|dispatchFunction| |MATRIX;nullity;$Nni;10|) $))
         (QSETREFV $ 31
                   (CONS (|dispatchFunction| |MATRIX;nullSpace;$L;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 13)
        (QSETREFV $ 35 (CONS (|dispatchFunction| |MATRIX;inverse;$U;12|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 48 (CONS (|dispatchFunction| |MATRIX;convert;$If;14|) $))))
      $)))) 

(MAKEPROP '|Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 37
                                                 37)
              (|local| |#1|) (|Integer|) |MATRIX;minRowIndex;$I;1|
              |MATRIX;minColIndex;$I;2| |MATRIX;qelt;$2IR;3|
              |MATRIX;qsetelt!;$2I2R;4| (0 . |maxRowIndex|) (|Boolean|) (5 . >)
              (11 . |maxColIndex|) |MATRIX;swapRows!;$2I$;5|
              (|MatrixLinearAlgebraFunctions| 6 37 37 $$) (16 . |determinant|)
              (21 . |determinant|) (26 . |minordet|) (31 . |minordet|)
              (36 . |rowEchelon|) (41 . |rowEchelon|) (|NonNegativeInteger|)
              (46 . |rank|) (51 . |rank|) (56 . |nullity|) (61 . |nullity|)
              (|List| 37) (66 . |nullSpace|) (71 . |nullSpace|)
              (|Union| $$ '"failed") (76 . |inverse|) (|Union| $ '"failed")
              (81 . |inverse|) (86 . |zero|) (|Vector| 6) (92 . |minIndex|)
              |MATRIX;diagonalMatrix;V$;13| (|Symbol|) (|InputForm|)
              (97 . |convert|) (|List| 49) (102 . |listOfLists|)
              (107 . |convert|) (|List| $) (112 . |convert|) (117 . |convert|)
              (|List| 6) (|List| 51) (|Equation| 6) (|Mapping| 13 6)
              (|OutputForm|) (|SingleInteger|) (|HashState|) (|String|)
              (|Void|) (|List| (|List| 24)) (|Union| 6 '"one") (|List| 7)
              (|Mapping| 6 7 7) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(|zero| 122 |swapRows!| 128 |rowEchelon| 135 |rank| 140 |qsetelt!|
              145 |qelt| 153 |nullity| 160 |nullSpace| 165 |minordet| 170
              |minRowIndex| 175 |minColIndex| 180 |maxRowIndex| 185
              |maxColIndex| 190 |listOfLists| 195 |inverse| 200
              |diagonalMatrix| 205 |determinant| 210 |convert| 215)
           'NIL
           (CONS (|makeByteWordVec2| 14 '(0 0 0 0 14 1 0 0 0 14 4 7 2))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|Vector| 6) (|Vector| 6))
                      (|TwoDimensionalArrayCategory| 6 (|Vector| 6)
                                                     (|Vector| 6))
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 53) (|ConvertibleTo| 41))
                   (|makeByteWordVec2| 48
                                       '(1 0 7 0 12 2 7 13 0 0 14 1 0 7 0 15 1
                                         17 6 2 18 1 0 6 0 19 1 17 6 2 20 1 0 6
                                         0 21 1 17 2 2 22 1 0 0 0 23 1 17 24 2
                                         25 1 0 24 0 26 1 17 24 2 27 1 0 24 0
                                         28 1 17 29 2 30 1 0 29 0 31 1 17 32 2
                                         33 1 0 34 0 35 2 0 0 24 24 36 1 37 7 0
                                         38 1 41 0 40 42 1 0 43 0 44 1 43 41 0
                                         45 1 41 0 46 47 1 0 41 0 48 2 0 0 24
                                         24 36 3 0 0 0 7 7 16 1 10 0 0 23 1 11
                                         24 0 26 4 0 6 0 7 7 6 11 3 0 6 0 7 7
                                         10 1 11 24 0 28 1 11 29 0 31 1 12 6 0
                                         21 1 0 7 0 8 1 0 7 0 9 1 0 7 0 12 1 0
                                         7 0 15 1 0 43 0 44 1 13 34 0 35 1 0 0
                                         37 39 1 12 6 0 19 1 2 41 0 48)))))
           '|lookupIncomplete|)) 
