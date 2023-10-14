
(PUT '|U8MAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U8MAT;minRowIndex;$I;1| (|x| $) 0) 

(PUT '|U8MAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U8MAT;minColIndex;$I;2| (|x| $) 0) 

(PUT '|U8MAT;nrows;$Nni;3| '|SPADreplace| 'ANROWS_U8) 

(DEFUN |U8MAT;nrows;$Nni;3| (|x| $) (ANROWS_U8 |x|)) 

(PUT '|U8MAT;ncols;$Nni;4| '|SPADreplace| 'ANCOLS_U8) 

(DEFUN |U8MAT;ncols;$Nni;4| (|x| $) (ANCOLS_U8 |x|)) 

(DEFUN |U8MAT;maxRowIndex;$I;5| (|x| $) (- (ANROWS_U8 |x|) 1)) 

(DEFUN |U8MAT;maxColIndex;$I;6| (|x| $) (- (ANCOLS_U8 |x|) 1)) 

(PUT '|U8MAT;qelt;$3I;7| '|SPADreplace| 'AREF2_U8) 

(DEFUN |U8MAT;qelt;$3I;7| (|m| |i| |j| $) (AREF2_U8 |m| |i| |j|)) 

(PUT '|U8MAT;elt;$3I;8| '|SPADreplace| 'AREF2_U8) 

(DEFUN |U8MAT;elt;$3I;8| (|m| |i| |j| $) (AREF2_U8 |m| |i| |j|)) 

(PUT '|U8MAT;qsetelt!;$4I;9| '|SPADreplace| 'SETAREF2_U8) 

(DEFUN |U8MAT;qsetelt!;$4I;9| (|m| |i| |j| |r| $) (SETAREF2_U8 |m| |i| |j| |r|)) 

(PUT '|U8MAT;setelt;$4I;10| '|SPADreplace| 'SETAREF2_U8) 

(DEFUN |U8MAT;setelt;$4I;10| (|m| |i| |j| |r| $) (SETAREF2_U8 |m| |i| |j| |r|)) 

(PUT '|U8MAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_U8 0 0))) 

(DEFUN |U8MAT;empty;$;11| ($) (MAKE_MATRIX_U8 0 0)) 

(PUT '|U8MAT;qnew;2I$;12| '|SPADreplace| 'MAKE_MATRIX_U8) 

(DEFUN |U8MAT;qnew;2I$;12| (|rows| |cols| $) (MAKE_MATRIX_U8 |rows| |cols|)) 

(PUT '|U8MAT;new;2NniI$;13| '|SPADreplace| 'MAKE_MATRIX1_U8) 

(DEFUN |U8MAT;new;2NniI$;13| (|rows| |cols| |a| $)
  (MAKE_MATRIX1_U8 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |U8Matrix;|)) 

(DEFUN |U8Matrix| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2369)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|U8Matrix|) . #2=(|U8Matrix|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|U8Matrix|
                         (LIST (CONS NIL (CONS 1 (|U8Matrix;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|U8Matrix|))))))))))) 

(DEFUN |U8Matrix;| ()
  (PROG (|dv$| $ #1=#:G2367 #2=#:G2366 #3=#:G2365 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U8Matrix|) . #4=(|U8Matrix|))
      (LETT $ (GETREFV 40) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|SetCategory|))
                                                . #4#)
                                          (AND
                                           (|HasCategory| (|Integer|)
                                                          '(|Evalable|
                                                            (|Integer|)))
                                           #1#)
                                          (LETT #2#
                                                (|HasCategory| (|Integer|)
                                                               '(|BasicType|))
                                                . #4#)
                                          (OR #2# #1#)
                                          (LETT #3#
                                                (|HasCategory| (|Integer|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #4#)
                                          (OR #3#
                                              (AND
                                               (|HasCategory| (|Integer|)
                                                              '(|Evalable|
                                                                (|Integer|)))
                                               #1#))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|))
                                          (|HasCategory| (|Integer|)
                                                         '(|Monoid|))
                                          (|HasCategory| (|Integer|)
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Integer|)
                                                         '(|Field|))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|U8Matrix| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #2#
           (|augmentPredVector| $ 8192))
      (AND (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #2#) #1#)
           (|augmentPredVector| $ 16384))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|U8Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |U8MAT;minRowIndex;$I;1|
              |U8MAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |U8MAT;nrows;$Nni;3| |U8MAT;ncols;$Nni;4|
              |U8MAT;maxRowIndex;$I;5| |U8MAT;maxColIndex;$I;6|
              |U8MAT;qelt;$3I;7| |U8MAT;elt;$3I;8| |U8MAT;qsetelt!;$4I;9|
              |U8MAT;setelt;$4I;10| |U8MAT;empty;$;11| |U8MAT;qnew;2I$;12|
              |U8MAT;new;2NniI$;13| (|List| 6) (|List| 23) (|Equation| 6)
              (|Boolean|) (|OutputForm|) (|List| 36) (|Union| $ '"failed")
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 24 6)
              (|Void|) (|List| (|List| 9)) (|List| $) (|Union| 6 '"one")
              (|U8Vector|) (|List| 21) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertConcat| 17 |transpose| 23
              |symmetric?| 33 |swapRows!| 38 |swapColumns!| 45 |subMatrix| 52
              |squareTop| 61 |square?| 66 |size?| 71 |setsubMatrix!| 77
              |setelt| 85 |setRow!| 101 |setColumn!| 108 |scalarMatrix| 115
              |sample| 121 |rowEchelon| 125 |row| 130 |rank| 136 |qsetelt!| 141
              |qnew| 149 |qelt| 155 |positivePower| 162 |parts| 168 |nullity|
              173 |nullSpace| 178 |nrows| 183 |new| 188 |ncols| 195 |more?| 200
              |minordet| 206 |minRowIndex| 211 |minColIndex| 216 |members| 221
              |member?| 226 |maxRowIndex| 232 |maxColIndex| 237 |matrix| 242
              |map!| 254 |map| 260 |listOfLists| 281 |less?| 286 |latex| 292
              |kronecker_prod1| 297 |kroneckerSum| 308 |kroneckerProduct| 319
              |inverse| 330 |horizConcat| 335 |hashUpdate!| 341 |hash| 347
              |fill!| 352 |exquo| 358 |every?| 364 |eval| 370 |eq?| 396
              |empty?| 402 |empty| 407 |elt| 411 |diagonalMatrix| 433
              |diagonal?| 443 |determinant| 448 |count| 453 |copy| 465
              |columnSpace| 470 |column| 475 |coerce| 481 |any?| 491
              |antisymmetric?| 497 ^ 502 |Pfaffian| 514 = 519 / 525 - 531 + 542
              * 548 |#| 584)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 36 36)
                      (|TwoDimensionalArrayCategory| 6 36 36)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 25))
                   (|makeByteWordVec2| 39
                                       '(2 15 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 0 0 0 1 1 0 0 36 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 0
                                         24 0 9 1 4 0 0 0 6 6 0 1 4 0 0 0 21 21
                                         0 1 4 0 6 0 6 6 6 17 3 0 0 0 6 36 1 3
                                         0 0 0 6 36 1 2 0 0 9 6 1 0 0 0 1 1 9 0
                                         0 1 2 0 36 0 6 1 1 10 9 0 1 4 0 6 0 6
                                         6 6 16 2 0 0 6 6 19 3 0 6 0 6 6 14 2 0
                                         0 0 6 1 1 0 21 0 1 1 10 9 0 1 1 10 26
                                         0 1 1 0 9 0 10 3 0 0 9 9 6 20 1 0 9 0
                                         11 2 0 24 0 9 1 1 11 6 0 1 1 0 6 0 7 1
                                         0 6 0 8 1 13 21 0 1 2 14 24 6 0 1 1 0
                                         6 0 12 1 0 6 0 13 3 0 0 9 9 38 1 1 0 0
                                         37 1 2 0 0 39 0 1 4 0 0 38 0 0 6 1 3 0
                                         0 38 0 0 1 2 0 0 39 0 1 1 0 37 0 1 2 0
                                         24 0 9 1 1 1 30 0 1 7 0 32 0 6 33 34 9
                                         9 35 1 2 0 0 0 0 1 1 0 0 34 1 1 0 0 34
                                         1 2 0 0 0 0 1 1 12 27 0 1 2 0 0 0 0 1
                                         2 1 29 29 0 1 1 1 28 0 1 2 0 0 0 6 1 2
                                         10 27 0 6 1 2 13 24 31 0 1 3 2 0 0 21
                                         21 1 3 2 0 0 6 6 1 2 2 0 0 22 1 2 2 0
                                         0 23 1 2 0 24 0 0 1 1 0 24 0 1 0 0 0
                                         18 3 0 0 0 21 21 1 4 0 6 0 6 6 6 1 3 0
                                         6 0 6 6 15 1 0 0 34 1 1 0 0 21 1 1 0
                                         24 0 1 1 11 6 0 1 2 14 9 6 0 1 2 13 9
                                         31 0 1 1 0 0 0 1 1 9 26 0 1 2 0 36 0 6
                                         1 1 5 25 0 1 1 0 0 36 1 2 13 24 31 0 1
                                         1 7 24 0 1 2 12 0 0 6 1 2 8 0 0 9 1 1
                                         11 6 0 1 2 15 24 0 0 1 2 12 0 0 6 1 1
                                         7 0 0 1 2 7 0 0 0 1 2 0 0 0 0 1 2 7 0
                                         6 0 1 2 0 36 0 36 1 2 0 36 36 0 1 2 0
                                         0 0 6 1 2 0 0 0 0 1 2 0 0 6 0 1 1 13 9
                                         0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U8Matrix| 'NILADIC T) 
