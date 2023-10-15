
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
         (PROG (#1=#:G2387)
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
   ((|dv$| NIL) ($ NIL) (#1=#:G2384 NIL) (#2=#:G2385 NIL) (#3=#:G2383 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|U8Matrix|) . #4=(|U8Matrix|))
    (LETT $ (GETREFV 45) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|))
                                              . #4#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Integer|)
                                                              '(|Evalable|
                                                                (|Integer|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|SetCategory|)))
                                              . #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|Evalable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Comparable|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #3# #2#)
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
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| $ 65536))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      #1#)
     (|augmentPredVector| $ 131072))
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
              (|HashState|) (|SingleInteger|) (|String|) (|Mapping| 24 6)
              (|Void|) (|List| 40) (|List| $) (|Union| 6 '"one") (|U8Vector|)
              (|Mapping| 6 6 6) (|List| 21) (|List| 34) (|List| 9)
              (|Mapping| 6 6) (|PositiveInteger|) (|List| 44) (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |smaller?| 88 |size?|
              94 |setsubMatrix!| 100 |setelt!| 108 |setRow!| 204 |setColumn!|
              211 |scalarMatrix| 218 |sample| 224 |rowSlice| 228 |rowEchelon|
              233 |row| 238 |rank| 244 |qsetelt!| 249 |qnew| 257 |qelt| 269
              |positivePower| 276 |parts| 282 |nullity| 287 |nullSpace| 292
              |nrows| 297 |new| 302 |ncols| 309 |more?| 314 |minordet| 320
              |minRowIndex| 325 |minColIndex| 330 |members| 335 |member?| 340
              |maxRowIndex| 346 |maxColIndex| 351 |matrix| 356 |map!| 368 |map|
              374 |listOfLists| 395 |less?| 400 |latex| 406 |kronecker_prod1|
              411 |kroneckerSum| 422 |kroneckerProduct| 433 |inverse| 444
              |horizSplit| 449 |horizConcat| 461 |hashUpdate!| 472 |hash| 478
              |fill!| 483 |exquo| 489 |every?| 495 |eval| 501 |eq?| 527
              |empty?| 533 |empty| 538 |elt| 542 |diagonalMatrix| 634
              |diagonal?| 644 |determinant| 649 |count| 654 |copy| 666
              |columnSpace| 671 |column| 676 |colSlice| 682 |coerce| 687
              |blockSplit| 697 |blockConcat| 711 |any?| 716 |antisymmetric?|
              722 ^ 727 |Pfaffian| 739 = 744 / 750 - 756 + 767 * 773 |#| 809)
           'NIL
           (CONS (|makeByteWordVec2| 9 '(0 0 0 1 0 7 5 0 0 0 7 4 9))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 36 36)
                      (|TwoDimensionalArrayCategory| 6 36 36)
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 25))
                   (|makeByteWordVec2| 44
                                       '(2 18 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 34 0 40 1 2 0 34 0 42 1 2 0 0 0 0 1
                                         1 0 0 34 1 1 0 0 36 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 1
                                         24 0 0 1 2 0 24 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 43 44 0 1 4 0 0 0 43 43 0 1 4
                                         0 0 0 44 21 0 1 4 0 0 0 44 43 0 1 4 0
                                         0 0 44 44 0 1 4 0 0 0 21 44 0 1 4 0 0
                                         0 21 6 0 1 4 0 0 0 21 21 0 1 4 0 0 0 6
                                         21 0 1 4 0 6 0 6 6 6 17 4 0 0 0 6 43 0
                                         1 4 0 0 0 43 6 0 1 3 0 0 0 6 36 1 3 0
                                         0 0 6 36 1 2 0 0 9 6 1 0 0 0 1 1 0 44
                                         0 1 1 12 0 0 1 2 0 36 0 6 1 1 13 9 0 1
                                         4 0 6 0 6 6 6 16 2 0 0 6 6 19 2 0 0 9
                                         9 1 3 0 6 0 6 6 14 2 0 0 0 6 1 1 0 21
                                         0 1 1 13 9 0 1 1 13 26 0 1 1 0 9 0 10
                                         3 0 0 9 9 6 20 1 0 9 0 11 2 0 24 0 9 1
                                         1 14 6 0 1 1 0 6 0 7 1 0 6 0 8 1 16 21
                                         0 1 2 17 24 6 0 1 1 0 6 0 12 1 0 6 0
                                         13 3 0 0 9 9 37 1 1 0 0 38 1 2 0 0 41
                                         0 1 3 0 0 37 0 0 1 4 0 0 37 0 0 6 1 2
                                         0 0 41 0 1 1 0 38 0 1 2 0 24 0 9 1 1 3
                                         30 0 1 7 0 32 0 6 33 34 9 9 35 1 1 0 0
                                         34 1 2 0 0 0 0 1 1 0 0 34 1 2 0 0 0 0
                                         1 1 15 27 0 1 2 0 34 0 40 1 2 0 34 0
                                         42 1 2 0 0 0 0 1 1 0 0 34 1 2 3 28 28
                                         0 1 1 3 29 0 1 2 0 0 0 6 1 2 13 27 0 6
                                         1 2 16 24 31 0 1 3 6 0 0 21 21 1 2 6 0
                                         0 22 1 3 6 0 0 6 6 1 2 6 0 0 23 1 2 0
                                         24 0 0 1 1 0 24 0 1 0 0 0 18 3 0 0 0
                                         43 43 1 3 0 0 0 44 43 1 3 0 0 0 43 44
                                         1 3 0 0 0 6 43 1 3 0 0 0 43 6 1 3 0 0
                                         0 21 44 1 3 0 0 0 44 21 1 3 0 0 0 21
                                         21 1 3 0 0 0 44 44 1 3 0 0 0 6 21 1 3
                                         0 0 0 21 6 1 4 0 6 0 6 6 6 1 3 0 6 0 6
                                         6 15 1 0 0 21 1 1 0 0 34 1 1 0 24 0 1
                                         1 14 6 0 1 2 17 9 6 0 1 2 16 9 31 0 1
                                         1 0 0 0 1 1 12 26 0 1 2 0 36 0 6 1 1 0
                                         44 0 1 1 8 25 0 1 1 0 0 36 1 3 0 39 0
                                         40 40 1 3 0 39 0 42 42 1 1 0 0 39 1 2
                                         16 24 31 0 1 1 10 24 0 1 2 15 0 0 6 1
                                         2 11 0 0 9 1 1 14 6 0 1 2 18 24 0 0 1
                                         2 15 0 0 6 1 2 10 0 0 0 1 1 10 0 0 1 2
                                         0 0 0 0 1 2 10 0 6 0 1 2 0 36 0 36 1 2
                                         0 36 36 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2
                                         0 0 0 0 1 1 16 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U8Matrix| 'NILADIC T) 
