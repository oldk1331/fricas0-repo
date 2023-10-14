
(/VERSIONCHECK 2) 

(PUT '|CDFMAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |CDFMAT;minRowIndex;$I;1| (|x| $) 0) 

(PUT '|CDFMAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |CDFMAT;minColIndex;$I;2| (|x| $) 0) 

(PUT '|CDFMAT;nrows;$Nni;3| '|SPADreplace| 'CDANROWS) 

(DEFUN |CDFMAT;nrows;$Nni;3| (|x| $) (CDANROWS |x|)) 

(PUT '|CDFMAT;ncols;$Nni;4| '|SPADreplace| 'CDANCOLS) 

(DEFUN |CDFMAT;ncols;$Nni;4| (|x| $) (CDANCOLS |x|)) 

(DEFUN |CDFMAT;maxRowIndex;$I;5| (|x| $) (- (CDANROWS |x|) 1)) 

(DEFUN |CDFMAT;maxColIndex;$I;6| (|x| $) (- (CDANCOLS |x|) 1)) 

(PUT '|CDFMAT;qelt;$2IC;7| '|SPADreplace| 'CDAREF2) 

(DEFUN |CDFMAT;qelt;$2IC;7| (|m| |i| |j| $) (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;elt;$2IC;8| '|SPADreplace| 'CDAREF2) 

(DEFUN |CDFMAT;elt;$2IC;8| (|m| |i| |j| $) (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;qsetelt!;$2I2C;9| '|SPADreplace| 'CDSETAREF2) 

(DEFUN |CDFMAT;qsetelt!;$2I2C;9| (|m| |i| |j| |r| $)
  (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;setelt;$2I2C;10| '|SPADreplace| 'CDSETAREF2) 

(DEFUN |CDFMAT;setelt;$2I2C;10| (|m| |i| |j| |r| $)
  (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE-CDOUBLE-MATRIX 0 0))) 

(DEFUN |CDFMAT;empty;$;11| ($) (MAKE-CDOUBLE-MATRIX 0 0)) 

(PUT '|CDFMAT;qnew;2I$;12| '|SPADreplace| 'MAKE-CDOUBLE-MATRIX) 

(DEFUN |CDFMAT;qnew;2I$;12| (|rows| |cols| $)
  (MAKE-CDOUBLE-MATRIX |rows| |cols|)) 

(DEFUN |CDFMAT;new;2NniC$;13| (|rows| |cols| |a| $)
  (PROG (#1=#:G2559 |j| #2=#:G2558 |i| |res|)
    (RETURN
     (SEQ
      (LETT |res| (MAKE-CDOUBLE-MATRIX |rows| |cols|)
            . #3=(|CDFMAT;new;2NniC$;13|))
      (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |rows| 1) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |cols| 1) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ (EXIT (CDSETAREF2 |res| |i| |j| |a|)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |ComplexDoubleFloatMatrix| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2572)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ComplexDoubleFloatMatrix|)
                . #2=(|ComplexDoubleFloatMatrix|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ComplexDoubleFloatMatrix|
                         (LIST
                          (CONS NIL (CONS 1 (|ComplexDoubleFloatMatrix;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ComplexDoubleFloatMatrix|))))))))))) 

(DEFUN |ComplexDoubleFloatMatrix;| ()
  (PROG (|dv$| $ #1=#:G2570 #2=#:G2569 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ComplexDoubleFloatMatrix|)
            . #3=(|ComplexDoubleFloatMatrix|))
      (LETT $ (GETREFV 42) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|Complex| (|DoubleFloat|))
                                                 '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory|
                                            (|Complex| (|DoubleFloat|))
                                            '(|Evalable|
                                              (|Complex| (|DoubleFloat|))))
                                           #1#)
                                          (LETT #2#
                                                (|HasCategory|
                                                 (|Complex| (|DoubleFloat|))
                                                 '(|CoercibleTo|
                                                   (|OutputForm|)))
                                                . #3#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory|
                                                (|Complex| (|DoubleFloat|))
                                                '(|Evalable|
                                                  (|Complex| (|DoubleFloat|))))
                                               #1#))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|AbelianGroup|))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|Monoid|))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|EuclideanDomain|))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|IntegralDomain|))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|Complex| (|DoubleFloat|))
                                           '(|Field|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatMatrix| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #1#
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ComplexDoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |CDFMAT;minRowIndex;$I;1|
              |CDFMAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |CDFMAT;nrows;$Nni;3| |CDFMAT;ncols;$Nni;4|
              |CDFMAT;maxRowIndex;$I;5| |CDFMAT;maxColIndex;$I;6|
              (|Complex| (|DoubleFloat|)) |CDFMAT;qelt;$2IC;7|
              |CDFMAT;elt;$2IC;8| |CDFMAT;qsetelt!;$2I2C;9|
              |CDFMAT;setelt;$2I2C;10| |CDFMAT;empty;$;11| |CDFMAT;qnew;2I$;12|
              |CDFMAT;new;2NniC$;13| (|List| 14) (|List| 24) (|Equation| 14)
              (|Boolean|) (|OutputForm|) (|List| 37) (|Union| $ '"failed")
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 25 14)
              (|Void|) (|List| (|List| 9)) (|List| $) (|Union| 14 '"one")
              (|ComplexDoubleFloatVector|) (|List| 6) (|List| 22)
              (|Mapping| 14 14 14) (|Mapping| 14 14))
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
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 14 37 37)
                      (|TwoDimensionalArrayCategory| 14 37 37)
                      (|HomogeneousAggregate| 14) (|Aggregate|) (|Evalable| 14)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 14 14)
                      (|BasicType|) (|CoercibleTo| 26))
                   (|makeByteWordVec2| 41
                                       '(2 1 25 0 0 1 2 0 0 9 9 1 2 0 0 0 0 1 1
                                         0 0 0 1 1 0 0 37 1 1 0 25 0 1 3 0 0 0
                                         6 6 1 3 0 0 0 6 6 1 5 0 0 0 6 6 6 6 1
                                         1 0 0 0 1 1 0 25 0 1 2 0 25 0 9 1 4 0
                                         0 0 6 6 0 1 4 0 0 0 38 38 0 1 4 0 14 0
                                         6 6 14 18 3 0 0 0 6 37 1 3 0 0 0 6 37
                                         1 2 0 0 9 14 1 0 0 0 1 1 7 0 0 1 2 0
                                         37 0 6 1 1 8 9 0 1 4 0 14 0 6 6 14 17
                                         2 0 0 6 6 20 3 0 14 0 6 6 15 2 0 0 0 6
                                         1 1 0 22 0 1 1 8 9 0 1 1 8 27 0 1 1 0
                                         9 0 10 3 0 0 9 9 14 21 1 0 9 0 11 2 0
                                         25 0 9 1 1 9 14 0 1 1 0 6 0 7 1 0 6 0
                                         8 1 11 22 0 1 2 12 25 14 0 1 1 0 6 0
                                         12 1 0 6 0 13 1 0 0 39 1 2 0 0 41 0 1
                                         4 0 0 40 0 0 14 1 3 0 0 40 0 0 1 2 0 0
                                         41 0 1 1 0 39 0 1 2 0 25 0 9 1 1 1 31
                                         0 1 7 0 33 0 6 34 35 9 9 36 1 1 0 0 35
                                         1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 35 1 1
                                         10 28 0 1 2 0 0 0 0 1 2 1 30 30 0 1 1
                                         1 29 0 1 2 0 0 0 14 1 2 8 28 0 14 1 2
                                         11 25 32 0 1 3 2 0 0 22 22 1 3 2 0 0
                                         14 14 1 2 2 0 0 23 1 2 2 0 0 24 1 2 0
                                         25 0 0 1 1 0 25 0 1 0 0 0 19 3 0 0 0
                                         38 38 1 4 0 14 0 6 6 14 1 3 0 14 0 6 6
                                         16 1 0 0 35 1 1 0 0 22 1 1 0 25 0 1 1
                                         9 14 0 1 2 12 9 14 0 1 2 11 9 32 0 1 1
                                         0 0 0 1 1 7 27 0 1 2 0 37 0 6 1 1 3 26
                                         0 1 1 0 0 37 1 2 11 25 32 0 1 1 5 25 0
                                         1 2 10 0 0 6 1 2 6 0 0 9 1 1 9 14 0 1
                                         2 1 25 0 0 1 2 10 0 0 14 1 2 5 0 0 0 1
                                         1 5 0 0 1 2 0 0 0 0 1 2 5 0 6 0 1 2 0
                                         37 0 37 1 2 0 37 37 0 1 2 0 0 0 14 1 2
                                         0 0 0 0 1 2 0 0 14 0 1 1 11 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ComplexDoubleFloatMatrix| 'NILADIC T) 
