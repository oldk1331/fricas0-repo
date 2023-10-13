
(/VERSIONCHECK 2) 

(PUT '|DFMAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |DFMAT;minRowIndex;$I;1| (|x| $) 0) 

(PUT '|DFMAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |DFMAT;minColIndex;$I;2| (|x| $) 0) 

(PUT '|DFMAT;nrows;$Nni;3| '|SPADreplace| 'DANROWS) 

(DEFUN |DFMAT;nrows;$Nni;3| (|x| $) (DANROWS |x|)) 

(PUT '|DFMAT;ncols;$Nni;4| '|SPADreplace| 'DANCOLS) 

(DEFUN |DFMAT;ncols;$Nni;4| (|x| $) (DANCOLS |x|)) 

(DEFUN |DFMAT;maxRowIndex;$I;5| (|x| $) (- (DANROWS |x|) 1)) 

(DEFUN |DFMAT;maxColIndex;$I;6| (|x| $) (- (DANCOLS |x|) 1)) 

(PUT '|DFMAT;qelt;$2IDf;7| '|SPADreplace| 'DAREF2) 

(DEFUN |DFMAT;qelt;$2IDf;7| (|m| |i| |j| $) (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;elt;$2IDf;8| '|SPADreplace| 'DAREF2) 

(DEFUN |DFMAT;elt;$2IDf;8| (|m| |i| |j| $) (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;qsetelt!;$2I2Df;9| '|SPADreplace| 'DSETAREF2) 

(DEFUN |DFMAT;qsetelt!;$2I2Df;9| (|m| |i| |j| |r| $)
  (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;setelt;$2I2Df;10| '|SPADreplace| 'DSETAREF2) 

(DEFUN |DFMAT;setelt;$2I2Df;10| (|m| |i| |j| |r| $) (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE-DOUBLE-MATRIX 0 0))) 

(DEFUN |DFMAT;empty;$;11| ($) (MAKE-DOUBLE-MATRIX 0 0)) 

(PUT '|DFMAT;qnew;2I$;12| '|SPADreplace| 'MAKE-DOUBLE-MATRIX) 

(DEFUN |DFMAT;qnew;2I$;12| (|rows| |cols| $) (MAKE-DOUBLE-MATRIX |rows| |cols|)) 

(PUT '|DFMAT;new;2NniDf$;13| '|SPADreplace| 'MAKE-DOUBLE-MATRIX1) 

(DEFUN |DFMAT;new;2NniDf$;13| (|rows| |cols| |a| $)
  (MAKE-DOUBLE-MATRIX1 |rows| |cols| |a|)) 

(DEFUN |DoubleFloatMatrix| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2400)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatMatrix|)
                . #2=(|DoubleFloatMatrix|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DoubleFloatMatrix|
                         (LIST (CONS NIL (CONS 1 (|DoubleFloatMatrix;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|DoubleFloatMatrix|))))))))))) 

(DEFUN |DoubleFloatMatrix;| ()
  (PROG (|dv$| $ #1=#:G2398 #2=#:G2397 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DoubleFloatMatrix|) . #3=(|DoubleFloatMatrix|))
      (LETT $ (GETREFV 41) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| (|DoubleFloat|)
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| (|DoubleFloat|)
                                                          '(|Evalable|
                                                            (|DoubleFloat|)))
                                           #1#)
                                          (LETT #2#
                                                (|HasCategory| (|DoubleFloat|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| (|DoubleFloat|)
                                                              '(|Evalable|
                                                                (|DoubleFloat|)))
                                               #1#))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|AbelianGroup|))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|Monoid|))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|Field|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|DoubleFloatMatrix| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |DFMAT;minRowIndex;$I;1|
              |DFMAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |DFMAT;nrows;$Nni;3| |DFMAT;ncols;$Nni;4|
              |DFMAT;maxRowIndex;$I;5| |DFMAT;maxColIndex;$I;6| (|DoubleFloat|)
              |DFMAT;qelt;$2IDf;7| |DFMAT;elt;$2IDf;8|
              |DFMAT;qsetelt!;$2I2Df;9| |DFMAT;setelt;$2I2Df;10|
              |DFMAT;empty;$;11| |DFMAT;qnew;2I$;12| |DFMAT;new;2NniDf$;13|
              (|List| 14) (|List| 24) (|Equation| 14) (|Boolean|)
              (|OutputForm|) (|List| 36) (|Union| $ '"failed")
              (|SingleInteger|) (|String|) (|Mapping| 25 14) (|Void|)
              (|List| (|List| 9)) (|List| $) (|Union| 14 '"one")
              (|DoubleFloatVector|) (|List| 6) (|List| 22) (|Mapping| 14 14 14)
              (|Mapping| 14 14))
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
                   '#((|MatrixCategory| 14 36 36)
                      (|TwoDimensionalArrayCategory| 14 36 36)
                      (|HomogeneousAggregate| 14) (|Aggregate|) (|Evalable| 14)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 14 14)
                      (|BasicType|) (|CoercibleTo| 26))
                   (|makeByteWordVec2| 40
                                       '(2 1 25 0 0 1 2 0 0 9 9 1 2 0 0 0 0 1 1
                                         0 0 0 1 1 0 0 36 1 1 0 25 0 1 3 0 0 0
                                         6 6 1 3 0 0 0 6 6 1 5 0 0 0 6 6 6 6 1
                                         1 0 0 0 1 1 0 25 0 1 2 0 25 0 9 1 4 0
                                         0 0 6 6 0 1 4 0 0 0 37 37 0 1 4 0 14 0
                                         6 6 14 18 3 0 0 0 6 36 1 3 0 0 0 6 36
                                         1 2 0 0 9 14 1 0 0 0 1 1 7 0 0 1 2 0
                                         36 0 6 1 1 8 9 0 1 4 0 14 0 6 6 14 17
                                         2 0 0 6 6 20 3 0 14 0 6 6 15 2 0 0 0 6
                                         1 1 0 22 0 1 1 8 9 0 1 1 8 27 0 1 1 0
                                         9 0 10 3 0 0 9 9 14 21 1 0 9 0 11 2 0
                                         25 0 9 1 1 9 14 0 1 1 0 6 0 7 1 0 6 0
                                         8 1 11 22 0 1 2 12 25 14 0 1 1 0 6 0
                                         12 1 0 6 0 13 1 0 0 38 1 2 0 0 40 0 1
                                         4 0 0 39 0 0 14 1 3 0 0 39 0 0 1 2 0 0
                                         40 0 1 1 0 38 0 1 2 0 25 0 9 1 1 1 30
                                         0 1 7 0 32 0 6 33 34 9 9 35 1 1 0 0 34
                                         1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 34 1 1
                                         10 28 0 1 2 0 0 0 0 1 1 1 29 0 1 2 0 0
                                         0 14 1 2 8 28 0 14 1 2 11 25 31 0 1 3
                                         2 0 0 22 22 1 3 2 0 0 14 14 1 2 2 0 0
                                         23 1 2 2 0 0 24 1 2 0 25 0 0 1 1 0 25
                                         0 1 0 0 0 19 3 0 0 0 37 37 1 4 0 14 0
                                         6 6 14 1 3 0 14 0 6 6 16 1 0 0 34 1 1
                                         0 0 22 1 1 0 25 0 1 1 9 14 0 1 2 12 9
                                         14 0 1 2 11 9 31 0 1 1 0 0 0 1 1 7 27
                                         0 1 2 0 36 0 6 1 1 3 26 0 1 1 0 0 36 1
                                         2 11 25 31 0 1 1 5 25 0 1 2 10 0 0 6 1
                                         2 6 0 0 9 1 1 9 14 0 1 2 1 25 0 0 1 2
                                         10 0 0 14 1 2 5 0 0 0 1 1 5 0 0 1 2 0
                                         0 0 0 1 2 5 0 6 0 1 2 0 36 0 36 1 2 0
                                         36 36 0 1 2 0 0 0 14 1 2 0 0 0 0 1 2 0
                                         0 14 0 1 1 11 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatMatrix| 'NILADIC T) 
