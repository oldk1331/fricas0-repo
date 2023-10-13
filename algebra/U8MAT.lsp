
(/VERSIONCHECK 2) 

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

(DEFUN |U8Matrix| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2346)
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
  (PROG (|dv$| $ #1=#:G2344 #2=#:G2343 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U8Matrix|) . #3=(|U8Matrix|))
      (LETT $ (GETREFV 39) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| (|Integer|)
                                                          '(|Evalable|
                                                            (|Integer|)))
                                           #1#)
                                          (LETT #2#
                                                (|HasCategory| (|Integer|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #2#
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
                      . #3#))
      (|haddProp| |$ConstructorCache| '|U8Matrix| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#
           (|augmentPredVector| $ 2048))
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
              (|Boolean|) (|OutputForm|) (|List| 35) (|Union| $ '"failed")
              (|SingleInteger|) (|String|) (|Mapping| 24 6) (|Void|)
              (|List| (|List| 9)) (|List| $) (|Union| 6 '"one") (|U8Vector|)
              (|List| 21) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(~= 0 |zero| 6 |vertConcat| 12 |transpose| 18 |symmetric?| 28
              |swapRows!| 33 |swapColumns!| 40 |subMatrix| 47 |squareTop| 56
              |square?| 61 |size?| 66 |setsubMatrix!| 72 |setelt| 80 |setRow!|
              96 |setColumn!| 103 |scalarMatrix| 110 |sample| 116 |rowEchelon|
              120 |row| 125 |rank| 131 |qsetelt!| 136 |qnew| 144 |qelt| 150
              |positivePower| 157 |parts| 163 |nullity| 168 |nullSpace| 173
              |nrows| 178 |new| 183 |ncols| 190 |more?| 195 |minordet| 201
              |minRowIndex| 206 |minColIndex| 211 |members| 216 |member?| 221
              |maxRowIndex| 227 |maxColIndex| 232 |matrix| 237 |map!| 242 |map|
              248 |listOfLists| 269 |less?| 274 |latex| 280 |kronecker_prod1|
              285 |kroneckerSum| 296 |kroneckerProduct| 307 |inverse| 318
              |horizConcat| 323 |hash| 329 |fill!| 334 |exquo| 340 |every?| 346
              |eval| 352 |eq?| 378 |empty?| 384 |empty| 389 |elt| 393
              |diagonalMatrix| 415 |diagonal?| 425 |determinant| 430 |count|
              435 |copy| 447 |columnSpace| 452 |column| 457 |coerce| 463 |any?|
              473 |antisymmetric?| 479 ^ 484 |Pfaffian| 496 = 501 / 507 - 513 +
              524 * 530 |#| 566)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 35 35)
                      (|TwoDimensionalArrayCategory| 6 35 35)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 25))
                   (|makeByteWordVec2| 38
                                       '(2 1 24 0 0 1 2 0 0 9 9 1 2 0 0 0 0 1 1
                                         0 0 0 1 1 0 0 35 1 1 0 24 0 1 3 0 0 0
                                         6 6 1 3 0 0 0 6 6 1 5 0 0 0 6 6 6 6 1
                                         1 0 0 0 1 1 0 24 0 1 2 0 24 0 9 1 4 0
                                         0 0 6 6 0 1 4 0 0 0 21 21 0 1 4 0 6 0
                                         6 6 6 17 3 0 0 0 6 35 1 3 0 0 0 6 35 1
                                         2 0 0 9 6 1 0 0 0 1 1 7 0 0 1 2 0 35 0
                                         6 1 1 8 9 0 1 4 0 6 0 6 6 6 16 2 0 0 6
                                         6 19 3 0 6 0 6 6 14 2 0 0 0 6 1 1 0 21
                                         0 1 1 8 9 0 1 1 8 26 0 1 1 0 9 0 10 3
                                         0 0 9 9 6 20 1 0 9 0 11 2 0 24 0 9 1 1
                                         9 6 0 1 1 0 6 0 7 1 0 6 0 8 1 11 21 0
                                         1 2 12 24 6 0 1 1 0 6 0 12 1 0 6 0 13
                                         1 0 0 36 1 2 0 0 38 0 1 4 0 0 37 0 0 6
                                         1 3 0 0 37 0 0 1 2 0 0 38 0 1 1 0 36 0
                                         1 2 0 24 0 9 1 1 1 29 0 1 7 0 31 0 6
                                         32 33 9 9 34 1 1 0 0 33 1 2 0 0 0 0 1
                                         2 0 0 0 0 1 1 0 0 33 1 1 10 27 0 1 2 0
                                         0 0 0 1 1 1 28 0 1 2 0 0 0 6 1 2 8 27
                                         0 6 1 2 11 24 30 0 1 3 2 0 0 21 21 1 3
                                         2 0 0 6 6 1 2 2 0 0 22 1 2 2 0 0 23 1
                                         2 0 24 0 0 1 1 0 24 0 1 0 0 0 18 3 0 0
                                         0 21 21 1 4 0 6 0 6 6 6 1 3 0 6 0 6 6
                                         15 1 0 0 33 1 1 0 0 21 1 1 0 24 0 1 1
                                         9 6 0 1 2 12 9 6 0 1 2 11 9 30 0 1 1 0
                                         0 0 1 1 7 26 0 1 2 0 35 0 6 1 1 3 25 0
                                         1 1 0 0 35 1 2 11 24 30 0 1 1 5 24 0 1
                                         2 10 0 0 6 1 2 6 0 0 9 1 1 9 6 0 1 2 1
                                         24 0 0 1 2 10 0 0 6 1 2 5 0 0 0 1 1 5
                                         0 0 1 2 0 0 0 0 1 2 5 0 6 0 1 2 0 35 0
                                         35 1 2 0 35 35 0 1 2 0 0 0 6 1 2 0 0 0
                                         0 1 2 0 0 6 0 1 1 11 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U8Matrix| 'NILADIC T) 
