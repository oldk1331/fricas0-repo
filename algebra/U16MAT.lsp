
(/VERSIONCHECK 2) 

(PUT '|U16MAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U16MAT;minRowIndex;$I;1| (|x| $) 0) 

(PUT '|U16MAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U16MAT;minColIndex;$I;2| (|x| $) 0) 

(PUT '|U16MAT;nrows;$Nni;3| '|SPADreplace| 'ANROWS_U16) 

(DEFUN |U16MAT;nrows;$Nni;3| (|x| $) (ANROWS_U16 |x|)) 

(PUT '|U16MAT;ncols;$Nni;4| '|SPADreplace| 'ANCOLS_U16) 

(DEFUN |U16MAT;ncols;$Nni;4| (|x| $) (ANCOLS_U16 |x|)) 

(DEFUN |U16MAT;maxRowIndex;$I;5| (|x| $) (- (ANROWS_U16 |x|) 1)) 

(DEFUN |U16MAT;maxColIndex;$I;6| (|x| $) (- (ANCOLS_U16 |x|) 1)) 

(PUT '|U16MAT;qelt;$3I;7| '|SPADreplace| 'AREF2_U16) 

(DEFUN |U16MAT;qelt;$3I;7| (|m| |i| |j| $) (AREF2_U16 |m| |i| |j|)) 

(PUT '|U16MAT;elt;$3I;8| '|SPADreplace| 'AREF2_U16) 

(DEFUN |U16MAT;elt;$3I;8| (|m| |i| |j| $) (AREF2_U16 |m| |i| |j|)) 

(PUT '|U16MAT;qsetelt!;$4I;9| '|SPADreplace| 'SETAREF2_U16) 

(DEFUN |U16MAT;qsetelt!;$4I;9| (|m| |i| |j| |r| $)
  (SETAREF2_U16 |m| |i| |j| |r|)) 

(PUT '|U16MAT;setelt;$4I;10| '|SPADreplace| 'SETAREF2_U16) 

(DEFUN |U16MAT;setelt;$4I;10| (|m| |i| |j| |r| $)
  (SETAREF2_U16 |m| |i| |j| |r|)) 

(PUT '|U16MAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_U16 0 0))) 

(DEFUN |U16MAT;empty;$;11| ($) (MAKE_MATRIX_U16 0 0)) 

(PUT '|U16MAT;qnew;2I$;12| '|SPADreplace| 'MAKE_MATRIX_U16) 

(DEFUN |U16MAT;qnew;2I$;12| (|rows| |cols| $) (MAKE_MATRIX_U16 |rows| |cols|)) 

(PUT '|U16MAT;new;2NniI$;13| '|SPADreplace| 'MAKE_MATRIX1_U16) 

(DEFUN |U16MAT;new;2NniI$;13| (|rows| |cols| |a| $)
  (MAKE_MATRIX1_U16 |rows| |cols| |a|)) 

(DEFUN |U16Matrix| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2352)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|U16Matrix|) . #2=(|U16Matrix|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|U16Matrix|
                         (LIST (CONS NIL (CONS 1 (|U16Matrix;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|U16Matrix|))))))))))) 

(DEFUN |U16Matrix;| ()
  (PROG (|dv$| $ #1=#:G2350 #2=#:G2349 #3=#:G2348 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U16Matrix|) . #4=(|U16Matrix|))
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
      (|haddProp| |$ConstructorCache| '|U16Matrix| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #2#
           (|augmentPredVector| $ 8192))
      (AND (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #2#) #1#)
           (|augmentPredVector| $ 16384))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|U16Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |U16MAT;minRowIndex;$I;1|
              |U16MAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |U16MAT;nrows;$Nni;3| |U16MAT;ncols;$Nni;4|
              |U16MAT;maxRowIndex;$I;5| |U16MAT;maxColIndex;$I;6|
              |U16MAT;qelt;$3I;7| |U16MAT;elt;$3I;8| |U16MAT;qsetelt!;$4I;9|
              |U16MAT;setelt;$4I;10| |U16MAT;empty;$;11| |U16MAT;qnew;2I$;12|
              |U16MAT;new;2NniI$;13| (|List| 6) (|List| 23) (|Equation| 6)
              (|Boolean|) (|OutputForm|) (|List| 36) (|Union| $ '"failed")
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 24 6)
              (|Void|) (|List| (|List| 9)) (|List| $) (|Union| 6 '"one")
              (|U16Vector|) (|List| 21) (|Mapping| 6 6 6) (|Mapping| 6 6))
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
              |horizConcat| 323 |hashUpdate!| 329 |hash| 335 |fill!| 340
              |exquo| 346 |every?| 352 |eval| 358 |eq?| 384 |empty?| 390
              |empty| 395 |elt| 399 |diagonalMatrix| 421 |diagonal?| 431
              |determinant| 436 |count| 441 |copy| 453 |columnSpace| 458
              |column| 463 |coerce| 469 |any?| 479 |antisymmetric?| 485 ^ 490
              |Pfaffian| 502 = 507 / 513 - 519 + 530 * 536 |#| 572)
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
                                       '(2 15 24 0 0 1 2 0 0 9 9 1 2 0 0 0 0 1
                                         1 0 0 0 1 1 0 0 36 1 1 0 24 0 1 3 0 0
                                         0 6 6 1 3 0 0 0 6 6 1 5 0 0 0 6 6 6 6
                                         1 1 0 0 0 1 1 0 24 0 1 2 0 24 0 9 1 4
                                         0 0 0 6 6 0 1 4 0 0 0 21 21 0 1 4 0 6
                                         0 6 6 6 17 3 0 0 0 6 36 1 3 0 0 0 6 36
                                         1 2 0 0 9 6 1 0 0 0 1 1 9 0 0 1 2 0 36
                                         0 6 1 1 10 9 0 1 4 0 6 0 6 6 6 16 2 0
                                         0 6 6 19 3 0 6 0 6 6 14 2 0 0 0 6 1 1
                                         0 21 0 1 1 10 9 0 1 1 10 26 0 1 1 0 9
                                         0 10 3 0 0 9 9 6 20 1 0 9 0 11 2 0 24
                                         0 9 1 1 11 6 0 1 1 0 6 0 7 1 0 6 0 8 1
                                         13 21 0 1 2 14 24 6 0 1 1 0 6 0 12 1 0
                                         6 0 13 1 0 0 37 1 2 0 0 39 0 1 4 0 0
                                         38 0 0 6 1 3 0 0 38 0 0 1 2 0 0 39 0 1
                                         1 0 37 0 1 2 0 24 0 9 1 1 1 30 0 1 7 0
                                         32 0 6 33 34 9 9 35 1 1 0 0 34 1 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 0 34 1 1 12 27 0
                                         1 2 0 0 0 0 1 2 1 29 29 0 1 1 1 28 0 1
                                         2 0 0 0 6 1 2 10 27 0 6 1 2 13 24 31 0
                                         1 3 2 0 0 21 21 1 3 2 0 0 6 6 1 2 2 0
                                         0 22 1 2 2 0 0 23 1 2 0 24 0 0 1 1 0
                                         24 0 1 0 0 0 18 3 0 0 0 21 21 1 4 0 6
                                         0 6 6 6 1 3 0 6 0 6 6 15 1 0 0 34 1 1
                                         0 0 21 1 1 0 24 0 1 1 11 6 0 1 2 14 9
                                         6 0 1 2 13 9 31 0 1 1 0 0 0 1 1 9 26 0
                                         1 2 0 36 0 6 1 1 5 25 0 1 1 0 0 36 1 2
                                         13 24 31 0 1 1 7 24 0 1 2 12 0 0 6 1 2
                                         8 0 0 9 1 1 11 6 0 1 2 15 24 0 0 1 2
                                         12 0 0 6 1 2 7 0 0 0 1 1 7 0 0 1 2 0 0
                                         0 0 1 2 7 0 6 0 1 2 0 36 0 36 1 2 0 36
                                         36 0 1 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 6
                                         0 1 1 13 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U16Matrix| 'NILADIC T) 
