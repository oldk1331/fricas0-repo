
(PUT '|U8MAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U8MAT;minRowIndex;$I;1| ((|x| $) ($ |Integer|)) 0) 

(PUT '|U8MAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U8MAT;minColIndex;$I;2| ((|x| $) ($ |Integer|)) 0) 

(PUT '|U8MAT;nrows;$Nni;3| '|SPADreplace| 'ANROWS_U8) 

(SDEFUN |U8MAT;nrows;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (ANROWS_U8 |x|)) 

(PUT '|U8MAT;ncols;$Nni;4| '|SPADreplace| 'ANCOLS_U8) 

(SDEFUN |U8MAT;ncols;$Nni;4| ((|x| $) ($ |NonNegativeInteger|)) (ANCOLS_U8 |x|)) 

(SDEFUN |U8MAT;maxRowIndex;$I;5| ((|x| $) ($ |Integer|)) (- (ANROWS_U8 |x|) 1)) 

(SDEFUN |U8MAT;maxColIndex;$I;6| ((|x| $) ($ |Integer|)) (- (ANCOLS_U8 |x|) 1)) 

(PUT '|U8MAT;qelt;$3I;7| '|SPADreplace| 'AREF2_U8) 

(SDEFUN |U8MAT;qelt;$3I;7|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |Integer|))
        (AREF2_U8 |m| |i| |j|)) 

(PUT '|U8MAT;elt;$3I;8| '|SPADreplace| 'AREF2_U8) 

(SDEFUN |U8MAT;elt;$3I;8|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) ($ |Integer|))
        (AREF2_U8 |m| |i| |j|)) 

(PUT '|U8MAT;qsetelt!;$4I;9| '|SPADreplace| 'SETAREF2_U8) 

(SDEFUN |U8MAT;qsetelt!;$4I;9|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|Integer|))
         ($ . #2#))
        (SETAREF2_U8 |m| |i| |j| |r|)) 

(PUT '|U8MAT;setelt!;$4I;10| '|SPADreplace| 'SETAREF2_U8) 

(SDEFUN |U8MAT;setelt!;$4I;10|
        ((|m| $) (|i| . #1=(|Integer|)) (|j| . #1#) (|r| . #2=(|Integer|))
         ($ . #2#))
        (SETAREF2_U8 |m| |i| |j| |r|)) 

(PUT '|U8MAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_U8 0 0))) 

(SDEFUN |U8MAT;empty;$;11| (($ $)) (MAKE_MATRIX_U8 0 0)) 

(PUT '|U8MAT;qnew;2I$;12| '|SPADreplace| 'MAKE_MATRIX_U8) 

(SDEFUN |U8MAT;qnew;2I$;12| ((|rows| |Integer|) (|cols| |Integer|) ($ $))
        (MAKE_MATRIX_U8 |rows| |cols|)) 

(PUT '|U8MAT;new;2NniI$;13| '|SPADreplace| 'MAKE_MATRIX1_U8) 

(SDEFUN |U8MAT;new;2NniI$;13|
        ((|rows| . #1=(|NonNegativeInteger|)) (|cols| . #1#) (|a| |Integer|)
         ($ $))
        (MAKE_MATRIX1_U8 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |U8Matrix;|)) 

(DEFUN |U8Matrix| ()
  (SPROG NIL
         (PROG (#1=#:G2393)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|U8Matrix|)
                    . #2=(|U8Matrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|U8Matrix|
                             (LIST (CONS NIL (CONS 1 (|U8Matrix;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|U8Matrix|)))))))))) 

(DEFUN |U8Matrix;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2391 NIL) (#2=#:G2390 NIL) (#3=#:G2389 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|U8Matrix|) . #4=(|U8Matrix|))
    (LETT $ (GETREFV 45) . #4#)
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
                                        (|HasCategory| (|Integer|) '(|Monoid|))
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
    $))) 

(MAKEPROP '|U8Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |U8MAT;minRowIndex;$I;1|
              |U8MAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |U8MAT;nrows;$Nni;3| |U8MAT;ncols;$Nni;4|
              |U8MAT;maxRowIndex;$I;5| |U8MAT;maxColIndex;$I;6|
              |U8MAT;qelt;$3I;7| |U8MAT;elt;$3I;8| |U8MAT;qsetelt!;$4I;9|
              |U8MAT;setelt!;$4I;10| |U8MAT;empty;$;11| |U8MAT;qnew;2I$;12|
              |U8MAT;new;2NniI$;13| (|List| 6) (|Equation| 6) (|List| 22)
              (|Boolean|) (|OutputForm|) (|List| 36) (|Union| $ '"failed")
              (|SingleInteger|) (|HashState|) (|String|) (|Mapping| 24 6)
              (|Void|) (|List| (|List| 9)) (|List| $) (|Union| 6 '"one")
              (|U8Vector|) (|Mapping| 6 6 6) (|List| 21) (|Mapping| 6 6)
              (|List| 34) (|PositiveInteger|) (|List| 41) (|List| 44)
              (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |size?| 88
              |setsubMatrix!| 94 |setelt!| 102 |setRow!| 134 |setColumn!| 141
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
                   '#((|MatrixCategory| 6 36 36)
                      (|TwoDimensionalArrayCategory| 6 36 36)
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 25))
                   (|makeByteWordVec2| 44
                                       '(2 15 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 34 0 41 1 2 0 34 0 42 1 1 0 0 34 1 2
                                         0 0 0 0 1 1 0 0 36 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 0
                                         24 0 9 1 4 0 0 0 6 6 0 1 4 0 0 0 43 43
                                         0 1 4 0 0 0 21 21 0 1 4 0 0 0 44 44 0
                                         1 4 0 6 0 6 6 6 17 3 0 0 0 6 36 1 3 0
                                         0 0 6 36 1 2 0 0 9 6 1 0 0 0 1 1 9 0 0
                                         1 2 0 36 0 6 1 1 10 9 0 1 4 0 6 0 6 6
                                         6 16 2 0 0 6 6 19 2 0 0 9 9 1 3 0 6 0
                                         6 6 14 2 0 0 0 6 1 1 0 21 0 1 1 10 9 0
                                         1 1 10 26 0 1 1 0 9 0 10 3 0 0 9 9 6
                                         20 1 0 9 0 11 2 0 24 0 9 1 1 11 6 0 1
                                         1 0 6 0 7 1 0 6 0 8 1 13 21 0 1 2 14
                                         24 6 0 1 1 0 6 0 12 1 0 6 0 13 3 0 0 9
                                         9 37 1 1 0 0 38 1 2 0 0 39 0 1 4 0 0
                                         37 0 0 6 1 3 0 0 37 0 0 1 2 0 0 39 0 1
                                         1 0 38 0 1 2 0 24 0 9 1 1 1 30 0 1 7 0
                                         32 0 6 33 34 9 9 35 1 1 0 0 34 1 2 0 0
                                         0 0 1 2 0 0 0 0 1 1 0 0 34 1 1 12 27 0
                                         1 2 0 34 0 41 1 2 0 34 0 42 1 1 0 0 34
                                         1 2 0 0 0 0 1 2 1 29 29 0 1 1 1 28 0 1
                                         2 0 0 0 6 1 2 10 27 0 6 1 2 13 24 31 0
                                         1 3 2 0 0 21 21 1 2 2 0 0 22 1 3 2 0 0
                                         6 6 1 2 2 0 0 23 1 2 0 24 0 0 1 1 0 24
                                         0 1 0 0 0 18 3 0 0 0 43 43 1 3 0 0 0
                                         21 21 1 3 0 0 0 44 44 1 4 0 6 0 6 6 6
                                         1 3 0 6 0 6 6 15 1 0 0 21 1 1 0 0 34 1
                                         1 0 24 0 1 1 11 6 0 1 2 14 9 6 0 1 2
                                         13 9 31 0 1 1 0 0 0 1 1 9 26 0 1 2 0
                                         36 0 6 1 1 5 25 0 1 1 0 0 36 1 3 0 40
                                         0 41 41 1 3 0 40 0 42 42 1 1 0 0 40 1
                                         2 13 24 31 0 1 1 7 24 0 1 2 12 0 0 6 1
                                         2 8 0 0 9 1 1 11 6 0 1 2 15 24 0 0 1 2
                                         12 0 0 6 1 2 7 0 0 0 1 1 7 0 0 1 2 0 0
                                         0 0 1 2 7 0 6 0 1 2 0 36 36 0 1 2 0 0
                                         0 6 1 2 0 36 0 36 1 2 0 0 0 0 1 2 0 0
                                         6 0 1 1 13 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U8Matrix| 'NILADIC T) 
