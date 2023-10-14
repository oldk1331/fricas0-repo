
(PUT '|CDFMAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFMAT;minRowIndex;$I;1| ((|x| $) ($ |Integer|)) 0) 

(PUT '|CDFMAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |CDFMAT;minColIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|CDFMAT;nrows;$Nni;3| '|SPADreplace| 'CDANROWS) 

(SDEFUN |CDFMAT;nrows;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (CDANROWS |x|)) 

(PUT '|CDFMAT;ncols;$Nni;4| '|SPADreplace| 'CDANCOLS) 

(SDEFUN |CDFMAT;ncols;$Nni;4| ((|x| $) ($ |NonNegativeInteger|)) (CDANCOLS |x|)) 

(SDEFUN |CDFMAT;maxRowIndex;$I;5| ((|x| $) ($ |Integer|)) (- (CDANROWS |x|) 1)) 

(SDEFUN |CDFMAT;maxColIndex;$I;6| ((|x| $) ($ |Integer|)) (- (CDANCOLS |x|) 1)) 

(PUT '|CDFMAT;qelt;$2IC;7| '|SPADreplace| 'CDAREF2) 

(SDEFUN |CDFMAT;qelt;$2IC;7|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#)
         ($ |Complex| (|DoubleFloat|)))
        (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;elt;$2IC;8| '|SPADreplace| 'CDAREF2) 

(SDEFUN |CDFMAT;elt;$2IC;8|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#)
         ($ |Complex| (|DoubleFloat|)))
        (CDAREF2 |m| |i| |j|)) 

(PUT '|CDFMAT;qsetelt!;$2I2C;9| '|SPADreplace| 'CDSETAREF2) 

(SDEFUN |CDFMAT;qsetelt!;$2I2C;9|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#)
         (|r| . #2=(|Complex| (|DoubleFloat|))) ($ . #2#))
        (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;setelt!;$2I2C;10| '|SPADreplace| 'CDSETAREF2) 

(SDEFUN |CDFMAT;setelt!;$2I2C;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#)
         (|r| . #2=(|Complex| (|DoubleFloat|))) ($ . #2#))
        (CDSETAREF2 |m| |i| |j| |r|)) 

(PUT '|CDFMAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE-CDOUBLE-MATRIX 0 0))) 

(SDEFUN |CDFMAT;empty;$;11| (($ $)) (MAKE-CDOUBLE-MATRIX 0 0)) 

(PUT '|CDFMAT;qnew;2I$;12| '|SPADreplace| 'MAKE-CDOUBLE-MATRIX) 

(SDEFUN |CDFMAT;qnew;2I$;12| ((|rows| |Integer|) (|cols| |Integer|) ($ $))
        (MAKE-CDOUBLE-MATRIX |rows| |cols|)) 

(SDEFUN |CDFMAT;new;2NniC$;13|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#)
         (|a| |Complex| (|DoubleFloat|)) ($ $))
        (SPROG
         ((#2=#:G2533 NIL) (|j| NIL) (#3=#:G2532 NIL) (|i| NIL) (|res| ($)))
         (SEQ
          (LETT |res| (MAKE-CDOUBLE-MATRIX |rows| |cols|)
                . #4=(|CDFMAT;new;2NniC$;13|))
          (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |rows| 1) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |cols| 1) . #4#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (EXIT (CDSETAREF2 |res| |i| |j| |a|)))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |ComplexDoubleFloatMatrix;|)) 

(DEFUN |ComplexDoubleFloatMatrix| ()
  (SPROG NIL
         (PROG (#1=#:G2548)
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
                              (CONS NIL
                                    (CONS 1 (|ComplexDoubleFloatMatrix;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ComplexDoubleFloatMatrix|)))))))))) 

(DEFUN |ComplexDoubleFloatMatrix;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2546 NIL) (#2=#:G2545 NIL) (#3=#:G2544 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|ComplexDoubleFloatMatrix|)
          . #4=(|ComplexDoubleFloatMatrix|))
    (LETT $ (GETREFV 48) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory|
                                          (|Complex| (|DoubleFloat|))
                                          '(|Evalable|
                                            (|Complex| (|DoubleFloat|))))
                                         #1#)
                                        (LETT #2#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|BasicType|))
                                              . #4#)
                                        (OR #2# #1#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Complex| (|DoubleFloat|))
                                               '(|CoercibleTo| (|OutputForm|)))
                                              . #4#)
                                        (OR #3#
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
                    . #4#))
    (|haddProp| |$ConstructorCache| '|ComplexDoubleFloatMatrix| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
    (AND (|HasCategory| $ '(|finiteAggregate|)) #2#
         (|augmentPredVector| $ 8192))
    (AND (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #2#) #1#)
         (|augmentPredVector| $ 16384))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|ComplexDoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |CDFMAT;minRowIndex;$I;1|
              |CDFMAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |CDFMAT;nrows;$Nni;3| |CDFMAT;ncols;$Nni;4|
              |CDFMAT;maxRowIndex;$I;5| |CDFMAT;maxColIndex;$I;6|
              (|Complex| (|DoubleFloat|)) |CDFMAT;qelt;$2IC;7|
              |CDFMAT;elt;$2IC;8| |CDFMAT;qsetelt!;$2I2C;9|
              |CDFMAT;setelt!;$2I2C;10| |CDFMAT;empty;$;11|
              |CDFMAT;qnew;2I$;12| |CDFMAT;new;2NniC$;13| (|List| 14)
              (|Equation| 14) (|List| 23) (|Boolean|) (|OutputForm|)
              (|List| 37) (|Union| $ '"failed") (|HashState|) (|SingleInteger|)
              (|String|) (|Mapping| 25 14) (|Void|) (|List| (|List| 9))
              (|List| $) (|Union| 14 '"one") (|ComplexDoubleFloatVector|)
              (|Mapping| 14 6 6) (|List| 22) (|Mapping| 14 14 14)
              (|Mapping| 14 14) (|List| 35) (|PositiveInteger|) (|List| 43)
              (|List| 46) (|Segment| 6) (|List| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |size?| 88
              |setsubMatrix!| 94 |setelt!| 102 |setRow!| 198 |setColumn!| 205
              |scalarMatrix| 212 |sample| 218 |rowSlice| 222 |rowEchelon| 227
              |row| 232 |rank| 238 |qsetelt!| 243 |qnew| 251 |qelt| 263
              |positivePower| 270 |parts| 276 |nullity| 281 |nullSpace| 286
              |nrows| 291 |new| 296 |ncols| 303 |more?| 308 |minordet| 314
              |minRowIndex| 319 |minColIndex| 324 |members| 329 |member?| 334
              |maxRowIndex| 340 |maxColIndex| 345 |matrix| 350 |map!| 362 |map|
              368 |listOfLists| 389 |less?| 394 |latex| 400 |kronecker_prod1|
              405 |kroneckerSum| 416 |kroneckerProduct| 427 |inverse| 438
              |horizSplit| 443 |horizConcat| 455 |hashUpdate!| 466 |hash| 472
              |fill!| 477 |exquo| 483 |every?| 489 |eval| 495 |eq?| 521
              |empty?| 527 |empty| 532 |elt| 536 |diagonalMatrix| 628
              |diagonal?| 638 |determinant| 643 |count| 648 |copy| 660
              |columnSpace| 665 |column| 670 |colSlice| 676 |coerce| 681
              |blockSplit| 691 |blockConcat| 705 |any?| 710 |antisymmetric?|
              716 ^ 721 |Pfaffian| 733 = 738 / 744 - 750 + 761 * 767 |#| 803)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 0 2 1 0 0 0 2 4 6))
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
                   (|makeByteWordVec2| 47
                                       '(2 15 25 0 0 1 1 0 25 0 1 2 0 0 9 9 1 2
                                         0 35 0 43 1 2 0 35 0 44 1 1 0 0 35 1 2
                                         0 0 0 0 1 1 0 0 37 1 1 0 0 0 1 1 0 25
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 25 0 1 2 0
                                         25 0 9 1 4 0 0 0 6 6 0 1 4 0 0 0 45 46
                                         0 1 4 0 0 0 45 45 0 1 4 0 0 0 46 45 0
                                         1 4 0 0 0 47 46 0 1 4 0 0 0 46 47 0 1
                                         4 0 0 0 47 47 0 1 4 0 0 0 46 46 0 1 4
                                         0 0 0 6 47 0 1 4 0 0 0 47 6 0 1 4 0 14
                                         0 6 6 14 18 4 0 0 0 45 6 0 1 4 0 0 0 6
                                         45 0 1 3 0 0 0 6 37 1 3 0 0 0 6 37 1 2
                                         0 0 9 14 1 0 0 0 1 1 0 46 0 1 1 9 0 0
                                         1 2 0 37 0 6 1 1 10 9 0 1 4 0 14 0 6 6
                                         14 17 2 0 0 6 6 20 2 0 0 9 9 1 3 0 14
                                         0 6 6 15 2 0 0 0 6 1 1 0 22 0 1 1 10 9
                                         0 1 1 10 27 0 1 1 0 9 0 10 3 0 0 9 9
                                         14 21 1 0 9 0 11 2 0 25 0 9 1 1 11 14
                                         0 1 1 0 6 0 7 1 0 6 0 8 1 13 22 0 1 2
                                         14 25 14 0 1 1 0 6 0 12 1 0 6 0 13 3 0
                                         0 9 9 38 1 1 0 0 39 1 2 0 0 41 0 1 4 0
                                         0 40 0 0 14 1 3 0 0 40 0 0 1 2 0 0 41
                                         0 1 1 0 39 0 1 2 0 25 0 9 1 1 1 31 0 1
                                         7 0 33 0 6 34 35 9 9 36 1 1 0 0 35 1 2
                                         0 0 0 0 1 1 0 0 35 1 2 0 0 0 0 1 1 12
                                         28 0 1 2 0 35 0 43 1 2 0 35 0 44 1 1 0
                                         0 35 1 2 0 0 0 0 1 2 1 29 29 0 1 1 1
                                         30 0 1 2 0 0 0 14 1 2 10 28 0 14 1 2
                                         13 25 32 0 1 3 2 0 0 22 22 1 2 2 0 0
                                         23 1 3 2 0 0 14 14 1 2 2 0 0 24 1 2 0
                                         25 0 0 1 1 0 25 0 1 0 0 0 19 3 0 0 0
                                         45 46 1 3 0 0 0 45 45 1 3 0 0 0 46 45
                                         1 3 0 0 0 45 6 1 3 0 0 0 46 47 1 3 0 0
                                         0 6 45 1 3 0 0 0 46 46 1 3 0 0 0 47 46
                                         1 3 0 0 0 47 6 1 3 0 0 0 47 47 1 3 0 0
                                         0 6 47 1 4 0 14 0 6 6 14 1 3 0 14 0 6
                                         6 16 1 0 0 22 1 1 0 0 35 1 1 0 25 0 1
                                         1 11 14 0 1 2 14 9 14 0 1 2 13 9 32 0
                                         1 1 0 0 0 1 1 9 27 0 1 2 0 37 0 6 1 1
                                         0 46 0 1 1 5 26 0 1 1 0 0 37 1 3 0 42
                                         0 43 43 1 3 0 42 0 44 44 1 1 0 0 42 1
                                         2 13 25 32 0 1 1 7 25 0 1 2 12 0 0 6 1
                                         2 8 0 0 9 1 1 11 14 0 1 2 15 25 0 0 1
                                         2 12 0 0 14 1 2 7 0 0 0 1 1 7 0 0 1 2
                                         0 0 0 0 1 2 7 0 6 0 1 2 0 37 0 37 1 2
                                         0 37 37 0 1 2 0 0 14 0 1 2 0 0 0 14 1
                                         2 0 0 0 0 1 1 13 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ComplexDoubleFloatMatrix| 'NILADIC T) 
