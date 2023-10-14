
(PUT '|DFMAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFMAT;minRowIndex;$I;1| ((|x| $) ($ |Integer|)) 0) 

(PUT '|DFMAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFMAT;minColIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|DFMAT;nrows;$Nni;3| '|SPADreplace| 'DANROWS) 

(SDEFUN |DFMAT;nrows;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (DANROWS |x|)) 

(PUT '|DFMAT;ncols;$Nni;4| '|SPADreplace| 'DANCOLS) 

(SDEFUN |DFMAT;ncols;$Nni;4| ((|x| $) ($ |NonNegativeInteger|)) (DANCOLS |x|)) 

(SDEFUN |DFMAT;maxRowIndex;$I;5| ((|x| $) ($ |Integer|)) (- (DANROWS |x|) 1)) 

(SDEFUN |DFMAT;maxColIndex;$I;6| ((|x| $) ($ |Integer|)) (- (DANCOLS |x|) 1)) 

(PUT '|DFMAT;qelt;$2IDf;7| '|SPADreplace| 'DAREF2) 

(SDEFUN |DFMAT;qelt;$2IDf;7|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |DoubleFloat|))
        (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;elt;$2IDf;8| '|SPADreplace| 'DAREF2) 

(SDEFUN |DFMAT;elt;$2IDf;8|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |DoubleFloat|))
        (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;qsetelt!;$2I2Df;9| '|SPADreplace| 'DSETAREF2) 

(SDEFUN |DFMAT;qsetelt!;$2I2Df;9|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|DoubleFloat|))
         ($ . #2#))
        (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;setelt;$2I2Df;10| '|SPADreplace| 'DSETAREF2) 

(SDEFUN |DFMAT;setelt;$2I2Df;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|DoubleFloat|))
         ($ . #2#))
        (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE-DOUBLE-MATRIX 0 0))) 

(SDEFUN |DFMAT;empty;$;11| (($ $)) (MAKE-DOUBLE-MATRIX 0 0)) 

(PUT '|DFMAT;qnew;2I$;12| '|SPADreplace| 'MAKE-DOUBLE-MATRIX) 

(SDEFUN |DFMAT;qnew;2I$;12| ((|rows| |Integer|) (|cols| |Integer|) ($ $))
        (MAKE-DOUBLE-MATRIX |rows| |cols|)) 

(PUT '|DFMAT;new;2NniDf$;13| '|SPADreplace| 'MAKE-DOUBLE-MATRIX1) 

(SDEFUN |DFMAT;new;2NniDf$;13|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#)
         (|a| |DoubleFloat|) ($ $))
        (MAKE-DOUBLE-MATRIX1 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |DoubleFloatMatrix;|)) 

(DEFUN |DoubleFloatMatrix| ()
  (SPROG NIL
         (PROG (#1=#:G2449)
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
                             (LIST
                              (CONS NIL (CONS 1 (|DoubleFloatMatrix;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DoubleFloatMatrix|)))))))))) 

(DEFUN |DoubleFloatMatrix;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2447 NIL) (#2=#:G2446 NIL) (#3=#:G2445 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|DoubleFloatMatrix|) . #4=(|DoubleFloatMatrix|))
    (LETT $ (GETREFV 48) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Evalable|
                                                          (|DoubleFloat|)))
                                         #1#)
                                        (LETT #2#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|BasicType|))
                                              . #4#)
                                        (OR #2# #1#)
                                        (LETT #3#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #3#
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
                    . #4#))
    (|haddProp| |$ConstructorCache| '|DoubleFloatMatrix| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 4096))
    (AND (|HasCategory| $ '(|finiteAggregate|)) #2#
         (|augmentPredVector| $ 8192))
    (AND (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #2#) #1#)
         (|augmentPredVector| $ 16384))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|DoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |DFMAT;minRowIndex;$I;1|
              |DFMAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |DFMAT;nrows;$Nni;3| |DFMAT;ncols;$Nni;4|
              |DFMAT;maxRowIndex;$I;5| |DFMAT;maxColIndex;$I;6| (|DoubleFloat|)
              |DFMAT;qelt;$2IDf;7| |DFMAT;elt;$2IDf;8|
              |DFMAT;qsetelt!;$2I2Df;9| |DFMAT;setelt;$2I2Df;10|
              |DFMAT;empty;$;11| |DFMAT;qnew;2I$;12| |DFMAT;new;2NniDf$;13|
              (|List| 14) (|Equation| 14) (|List| 23) (|Boolean|)
              (|OutputForm|) (|List| 37) (|Union| $ '"failed")
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 25 14)
              (|Void|) (|List| (|List| 9)) (|List| $) (|Union| 14 '"one")
              (|DoubleFloatVector|) (|Mapping| 14 6 6) (|List| 22)
              (|Mapping| 14 14 14) (|Mapping| 14 14) (|List| 35)
              (|PositiveInteger|) (|List| 43) (|List| 47) (|List| 6)
              (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |size?| 88
              |setsubMatrix!| 94 |setelt| 102 |setRow!| 134 |setColumn!| 141
              |scalarMatrix| 148 |sample| 154 |rowEchelon| 158 |row| 163 |rank|
              169 |qsetelt!| 174 |qnew| 182 |qelt| 194 |positivePower| 201
              |parts| 207 |nullity| 212 |nullSpace| 217 |nrows| 222 |new| 227
              |ncols| 234 |more?| 239 |minordet| 245 |minRowIndex| 250
              |minColIndex| 255 |members| 260 |member?| 265 |maxRowIndex| 271
              |maxColIndex| 276 |matrix| 281 |map!| 293 |map| 299 |listOfLists|
              320 |less?| 325 |latex| 331 |kronecker_prod1| 336 |kroneckerSum|
              347 |kroneckerProduct| 358 |inverse| 369 |horizSplit| 374
              |horizConcat| 386 |hashUpdate!| 397 |hash| 403 |fill!| 408
              |exquo| 414 |every?| 420 |eval| 426 |eq?| 452 |empty?| 458
              |empty| 463 |elt| 467 |diagonalMatrix| 503 |diagonal?| 513
              |determinant| 518 |count| 523 |copy| 535 |columnSpace| 540
              |column| 545 |coerce| 551 |blockSplit| 561 |blockConcat| 575
              |any?| 580 |antisymmetric?| 586 ^ 591 |Pfaffian| 603 = 608 / 614
              - 620 + 631 * 637 |#| 673)
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
                                         25 0 9 1 4 0 0 0 6 6 0 1 4 0 0 0 45 45
                                         0 1 4 0 0 0 46 46 0 1 4 0 0 0 47 47 0
                                         1 4 0 14 0 6 6 14 18 3 0 0 0 6 37 1 3
                                         0 0 0 6 37 1 2 0 0 9 14 1 0 0 0 1 1 9
                                         0 0 1 2 0 37 0 6 1 1 10 9 0 1 4 0 14 0
                                         6 6 14 17 2 0 0 6 6 20 2 0 0 9 9 1 3 0
                                         14 0 6 6 15 2 0 0 0 6 1 1 0 22 0 1 1
                                         10 9 0 1 1 10 27 0 1 1 0 9 0 10 3 0 0
                                         9 9 14 21 1 0 9 0 11 2 0 25 0 9 1 1 11
                                         14 0 1 1 0 6 0 7 1 0 6 0 8 1 13 22 0 1
                                         2 14 25 14 0 1 1 0 6 0 12 1 0 6 0 13 3
                                         0 0 9 9 38 1 1 0 0 39 1 2 0 0 41 0 1 4
                                         0 0 40 0 0 14 1 3 0 0 40 0 0 1 2 0 0
                                         41 0 1 1 0 39 0 1 2 0 25 0 9 1 1 1 31
                                         0 1 7 0 33 0 6 34 35 9 9 36 1 1 0 0 35
                                         1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 35 1 1
                                         12 28 0 1 2 0 35 0 43 1 2 0 35 0 44 1
                                         1 0 0 35 1 2 0 0 0 0 1 2 1 30 30 0 1 1
                                         1 29 0 1 2 0 0 0 14 1 2 10 28 0 14 1 2
                                         13 25 32 0 1 3 2 0 0 22 22 1 2 2 0 0
                                         23 1 3 2 0 0 14 14 1 2 2 0 0 24 1 2 0
                                         25 0 0 1 1 0 25 0 1 0 0 0 19 3 0 0 0
                                         45 45 1 3 0 0 0 46 46 1 3 0 0 0 47 47
                                         1 4 0 14 0 6 6 14 1 3 0 14 0 6 6 16 1
                                         0 0 22 1 1 0 0 35 1 1 0 25 0 1 1 11 14
                                         0 1 2 14 9 14 0 1 2 13 9 32 0 1 1 0 0
                                         0 1 1 9 27 0 1 2 0 37 0 6 1 1 5 26 0 1
                                         1 0 0 37 1 3 0 42 0 43 43 1 3 0 42 0
                                         44 44 1 1 0 0 42 1 2 13 25 32 0 1 1 7
                                         25 0 1 2 12 0 0 6 1 2 8 0 0 9 1 1 11
                                         14 0 1 2 15 25 0 0 1 2 12 0 0 14 1 2 7
                                         0 0 0 1 1 7 0 0 1 2 0 0 0 0 1 2 7 0 6
                                         0 1 2 0 37 37 0 1 2 0 0 0 14 1 2 0 37
                                         0 37 1 2 0 0 0 0 1 2 0 0 14 0 1 1 13 9
                                         0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatMatrix| 'NILADIC T) 
