
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
  (PROG (|row1| |n2| |n1| |xx| |minRow|)
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
               (SEQ (LETT |minRow| 1 . #1=(|MATRIX;swapRows!;$2I$;5|))
                    (LETT |xx| |x| . #1#) (LETT |n1| (- |i1| |minRow|) . #1#)
                    (LETT |n2| (- |i2| |minRow|) . #1#)
                    (LETT |row1| (QAREF1 |xx| |n1|) . #1#)
                    (QSETAREF1 |xx| |n1| (QAREF1 |xx| |n2|))
                    (QSETAREF1 |xx| |n2| |row1|) (EXIT |xx|)))))))))) 

(DEFUN |MATRIX;determinant;$R;6| (|x| $) (SPADCALL |x| (QREFELT $ 17))) 

(DEFUN |MATRIX;minordet;$R;7| (|x| $) (SPADCALL |x| (QREFELT $ 19))) 

(DEFUN |MATRIX;rowEchelon;2$;8| (|x| $) (SPADCALL |x| (QREFELT $ 21))) 

(DEFUN |MATRIX;rank;$Nni;9| (|x| $) (SPADCALL |x| (QREFELT $ 24))) 

(DEFUN |MATRIX;nullity;$Nni;10| (|x| $) (SPADCALL |x| (QREFELT $ 26))) 

(DEFUN |MATRIX;nullSpace;$L;11| (|x| $) (SPADCALL |x| (QREFELT $ 29))) 

(DEFUN |MATRIX;inverse;$U;12| (|x| $) (SPADCALL |x| (QREFELT $ 32))) 

(DEFUN |MATRIX;diagonalMatrix;V$;13| (|v| $)
  (PROG (#1=#:G2095 |i| #2=#:G2096 |j| #3=#:G2097 |k| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #4=(|MATRIX;diagonalMatrix;V$;13|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 35)) . #4#)
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 38)) . #4#)
               (LETT #3# (QVSIZE |v|) . #4#) (LETT |j| 1 . #4#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 36)) . #4#)
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

(DEFUN |Matrix| (#1=#:G2107)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2108)
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
  (PROG (|pv$| #1=#:G2105 #2=#:G2106 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Matrix|))
      (LETT |dv$| (LIST '|Matrix| DV$1) . #3#)
      (LETT $ (GETREFV 62) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|SetCategory|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
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
                                                . #3#)
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
                                                . #3#)
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
                      . #3#))
      (|haddProp| |$ConstructorCache| '|Matrix| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
      (AND (|HasCategory| |#1| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 8192))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 18
                   (CONS (|dispatchFunction| |MATRIX;determinant;$R;6|) $))
         (QSETREFV $ 20
                   (CONS (|dispatchFunction| |MATRIX;minordet;$R;7|) $)))))
      (COND
       ((|testBitVector| |pv$| 8)
        (QSETREFV $ 22
                  (CONS (|dispatchFunction| |MATRIX;rowEchelon;2$;8|) $))))
      (COND
       ((|testBitVector| |pv$| 9)
        (PROGN
         (QSETREFV $ 25 (CONS (|dispatchFunction| |MATRIX;rank;$Nni;9|) $))
         (QSETREFV $ 27 (CONS (|dispatchFunction| |MATRIX;nullity;$Nni;10|) $))
         (QSETREFV $ 30
                   (CONS (|dispatchFunction| |MATRIX;nullSpace;$L;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 11)
        (QSETREFV $ 34 (CONS (|dispatchFunction| |MATRIX;inverse;$U;12|) $))))
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
              |MATRIX;swapRows!;$2I$;5|
              (|MatrixLinearAlgebraFunctions| 6 37 37 $$) (11 . |determinant|)
              (16 . |determinant|) (21 . |minordet|) (26 . |minordet|)
              (31 . |rowEchelon|) (36 . |rowEchelon|) (|NonNegativeInteger|)
              (41 . |rank|) (46 . |rank|) (51 . |nullity|) (56 . |nullity|)
              (|List| 37) (61 . |nullSpace|) (66 . |nullSpace|)
              (|Union| $$ '"failed") (71 . |inverse|) (|Union| $ '"failed")
              (76 . |inverse|) (81 . |zero|) (87 . |maxColIndex|) (|Vector| 6)
              (92 . |minIndex|) |MATRIX;diagonalMatrix;V$;13| (|Symbol|)
              (|InputForm|) (97 . |convert|) (|List| 49) (102 . |listOfLists|)
              (107 . |convert|) (|List| $) (112 . |convert|) (117 . |convert|)
              (|List| 6) (|List| 51) (|Equation| 6) (|Mapping| 13 6)
              (|OutputForm|) (|SingleInteger|) (|String|) (|Void|)
              (|List| (|List| 23)) (|Union| 6 '"one") (|List| 7)
              (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(|zero| 122 |swapRows!| 128 |rowEchelon| 135 |rank| 140 |qsetelt!|
              145 |qelt| 153 |nullity| 160 |nullSpace| 165 |minordet| 170
              |minRowIndex| 175 |minColIndex| 180 |maxRowIndex| 185
              |maxColIndex| 190 |listOfLists| 195 |inverse| 200
              |diagonalMatrix| 205 |determinant| 210 |convert| 215)
           'NIL
           (CONS (|makeByteWordVec2| 12 '(0 0 0 0 12 1 0 0 0 12 1 5 2))
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
                                       '(1 0 7 0 12 2 7 13 0 0 14 1 16 6 2 17 1
                                         0 6 0 18 1 16 6 2 19 1 0 6 0 20 1 16 2
                                         2 21 1 0 0 0 22 1 16 23 2 24 1 0 23 0
                                         25 1 16 23 2 26 1 0 23 0 27 1 16 28 2
                                         29 1 0 28 0 30 1 16 31 2 32 1 0 33 0
                                         34 2 0 0 23 23 35 1 0 7 0 36 1 37 7 0
                                         38 1 41 0 40 42 1 0 43 0 44 1 43 41 0
                                         45 1 41 0 46 47 1 0 41 0 48 2 0 0 23
                                         23 35 3 0 0 0 7 7 15 1 8 0 0 22 1 9 23
                                         0 25 4 0 6 0 7 7 6 11 3 0 6 0 7 7 10 1
                                         9 23 0 27 1 9 28 0 30 1 10 6 0 20 1 0
                                         7 0 8 1 0 7 0 9 1 0 7 0 12 1 0 7 0 36
                                         1 0 43 0 44 1 11 33 0 34 1 0 0 37 39 1
                                         10 6 0 18 1 2 41 0 48)))))
           '|lookupIncomplete|)) 
