
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
  (PROG (|t2| |t1| #1=#:G2089 |j|)
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

(DEFUN |MATRIX;copy;2$;6| (|m| $)
  (PROG (#1=#:G2095 |j| #2=#:G2094 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans| (MAKE_MATRIX (ANROWS |m|) (ANCOLS |m|))
            . #3=(|MATRIX;copy;2$;6|))
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 15)) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |ans| |i| |j| (QAREF2O |m| |i| |j| 1 1) 1 1)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MATRIX;determinant;$R;7| (|x| $) (SPADCALL |x| (QREFELT $ 19))) 

(DEFUN |MATRIX;minordet;$R;8| (|x| $) (SPADCALL |x| (QREFELT $ 21))) 

(DEFUN |MATRIX;rowEchelon;2$;9| (|x| $) (SPADCALL |x| (QREFELT $ 23))) 

(DEFUN |MATRIX;rank;$Nni;10| (|x| $) (SPADCALL |x| (QREFELT $ 26))) 

(DEFUN |MATRIX;nullity;$Nni;11| (|x| $) (SPADCALL |x| (QREFELT $ 28))) 

(DEFUN |MATRIX;nullSpace;$L;12| (|x| $) (SPADCALL |x| (QREFELT $ 31))) 

(DEFUN |MATRIX;inverse;$U;13| (|x| $) (SPADCALL |x| (QREFELT $ 34))) 

(DEFUN |MATRIX;diagonalMatrix;V$;14| (|v| $)
  (PROG (#1=#:G2112 |i| #2=#:G2113 |j| #3=#:G2114 |k| |ans| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #4=(|MATRIX;diagonalMatrix;V$;14|))
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 37)) . #4#)
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 39)) . #4#)
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

(DEFUN |MATRIX;convert;$If;15| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|matrix| (QREFELT $ 43))
         (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 46)))
   (QREFELT $ 48))) 

(DECLAIM (NOTINLINE |Matrix;|)) 

(DEFUN |Matrix| (#1=#:G2126)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2127)
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
  (PROG (|pv$| #1=#:G2123 #2=#:G2124 #3=#:G2125 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Matrix|))
      (LETT |dv$| (LIST '|Matrix| DV$1) . #4#)
      (LETT $ (GETREFV 70) . #4#)
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
         (QSETREFV $ 20
                   (CONS (|dispatchFunction| |MATRIX;determinant;$R;7|) $))
         (QSETREFV $ 22
                   (CONS (|dispatchFunction| |MATRIX;minordet;$R;8|) $)))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 24
                  (CONS (|dispatchFunction| |MATRIX;rowEchelon;2$;9|) $))))
      (COND
       ((|testBitVector| |pv$| 11)
        (PROGN
         (QSETREFV $ 27 (CONS (|dispatchFunction| |MATRIX;rank;$Nni;10|) $))
         (QSETREFV $ 29 (CONS (|dispatchFunction| |MATRIX;nullity;$Nni;11|) $))
         (QSETREFV $ 32
                   (CONS (|dispatchFunction| |MATRIX;nullSpace;$L;12|) $)))))
      (COND
       ((|testBitVector| |pv$| 13)
        (QSETREFV $ 36 (CONS (|dispatchFunction| |MATRIX;inverse;$U;13|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 49 (CONS (|dispatchFunction| |MATRIX;convert;$If;15|) $))))
      $)))) 

(MAKEPROP '|Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 (NRTEVAL 1) (NRTEVAL 1) 38
                                                 38)
              (|local| |#1|) (|Integer|) |MATRIX;minRowIndex;$I;1|
              |MATRIX;minColIndex;$I;2| |MATRIX;qelt;$2IR;3|
              |MATRIX;qsetelt!;$2I2R;4| (0 . |maxRowIndex|) (|Boolean|) (5 . >)
              (11 . |maxColIndex|) |MATRIX;swapRows!;$2I$;5| |MATRIX;copy;2$;6|
              (|MatrixLinearAlgebraFunctions| 6 38 38 $$) (16 . |determinant|)
              (21 . |determinant|) (26 . |minordet|) (31 . |minordet|)
              (36 . |rowEchelon|) (41 . |rowEchelon|) (|NonNegativeInteger|)
              (46 . |rank|) (51 . |rank|) (56 . |nullity|) (61 . |nullity|)
              (|List| 38) (66 . |nullSpace|) (71 . |nullSpace|)
              (|Union| $$ '"failed") (76 . |inverse|) (|Union| $ '"failed")
              (81 . |inverse|) (86 . |zero|) (|Vector| 6) (92 . |minIndex|)
              |MATRIX;diagonalMatrix;V$;14| (|Symbol|) (|InputForm|)
              (97 . |convert|) (|List| 50) (102 . |listOfLists|)
              (107 . |convert|) (|List| $) (112 . |convert|) (117 . |convert|)
              (|List| 6) (|Equation| 6) (|List| 51) (|Mapping| 13 6)
              (|OutputForm|) (|SingleInteger|) (|HashState|) (|String|)
              (|Void|) (|List| (|List| 25)) (|Union| 6 '"one")
              (|Mapping| 6 7 7) (|Mapping| 6 6 6) (|List| 47) (|List| 66)
              (|Mapping| 6 6) (|PositiveInteger|) (|Segment| 7) (|List| 67)
              (|List| 7))
           '#(|zero| 122 |swapRows!| 128 |rowEchelon| 135 |rank| 140 |qsetelt!|
              145 |qelt| 153 |nullity| 160 |nullSpace| 165 |minordet| 170
              |minRowIndex| 175 |minColIndex| 180 |maxRowIndex| 185
              |maxColIndex| 190 |listOfLists| 195 |inverse| 200
              |diagonalMatrix| 205 |determinant| 210 |copy| 215 |convert| 220)
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
                      (|CoercibleTo| 54) (|ConvertibleTo| 42))
                   (|makeByteWordVec2| 49
                                       '(1 0 7 0 12 2 7 13 0 0 14 1 0 7 0 15 1
                                         18 6 2 19 1 0 6 0 20 1 18 6 2 21 1 0 6
                                         0 22 1 18 2 2 23 1 0 0 0 24 1 18 25 2
                                         26 1 0 25 0 27 1 18 25 2 28 1 0 25 0
                                         29 1 18 30 2 31 1 0 30 0 32 1 18 33 2
                                         34 1 0 35 0 36 2 0 0 25 25 37 1 38 7 0
                                         39 1 42 0 41 43 1 0 44 0 45 1 44 42 0
                                         46 1 42 0 47 48 1 0 42 0 49 2 0 0 25
                                         25 37 3 0 0 0 7 7 16 1 10 0 0 24 1 11
                                         25 0 27 4 0 6 0 7 7 6 11 3 0 6 0 7 7
                                         10 1 11 25 0 29 1 11 30 0 32 1 12 6 0
                                         22 1 0 7 0 8 1 0 7 0 9 1 0 7 0 12 1 0
                                         7 0 15 1 0 44 0 45 1 13 35 0 36 1 0 0
                                         38 40 1 12 6 0 20 1 0 0 0 17 1 2 42 0
                                         49)))))
           '|lookupIncomplete|)) 
