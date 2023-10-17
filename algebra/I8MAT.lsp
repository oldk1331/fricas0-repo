
(PUT '|I8MAT;minRowIndex;$I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I8MAT;minRowIndex;$I;1| ((|x| ($)) ($ (|Integer|))) 0) 

(PUT '|I8MAT;minColIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I8MAT;minColIndex;$I;2| ((|x| ($)) ($ (|Integer|))) 0) 

(PUT '|I8MAT;nrows;$Nni;3| '|SPADreplace| 'ANROWS_I8) 

(SDEFUN |I8MAT;nrows;$Nni;3| ((|x| ($)) ($ (|NonNegativeInteger|)))
        (ANROWS_I8 |x|)) 

(PUT '|I8MAT;ncols;$Nni;4| '|SPADreplace| 'ANCOLS_I8) 

(SDEFUN |I8MAT;ncols;$Nni;4| ((|x| ($)) ($ (|NonNegativeInteger|)))
        (ANCOLS_I8 |x|)) 

(SDEFUN |I8MAT;maxRowIndex;$I;5| ((|x| ($)) ($ (|Integer|)))
        (- (ANROWS_I8 |x|) 1)) 

(SDEFUN |I8MAT;maxColIndex;$I;6| ((|x| ($)) ($ (|Integer|)))
        (- (ANCOLS_I8 |x|) 1)) 

(PUT '|I8MAT;qelt;$3I;7| '|SPADreplace| 'AREF2_I8) 

(SDEFUN |I8MAT;qelt;$3I;7|
        ((|m| ($)) (|i| #1=(|Integer|)) (|j| #1#) ($ (|Integer|)))
        (AREF2_I8 |m| |i| |j|)) 

(PUT '|I8MAT;elt;$3I;8| '|SPADreplace| 'AREF2_I8) 

(SDEFUN |I8MAT;elt;$3I;8|
        ((|m| ($)) (|i| #1=(|Integer|)) (|j| #1#) ($ (|Integer|)))
        (AREF2_I8 |m| |i| |j|)) 

(PUT '|I8MAT;qsetelt!;$4I;9| '|SPADreplace| 'SETAREF2_I8) 

(SDEFUN |I8MAT;qsetelt!;$4I;9|
        ((|m| ($)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|Integer|)) ($ #2#))
        (SETAREF2_I8 |m| |i| |j| |r|)) 

(PUT '|I8MAT;setelt!;$4I;10| '|SPADreplace| 'SETAREF2_I8) 

(SDEFUN |I8MAT;setelt!;$4I;10|
        ((|m| ($)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|Integer|)) ($ #2#))
        (SETAREF2_I8 |m| |i| |j| |r|)) 

(PUT '|I8MAT;empty;$;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_I8 0 0))) 

(SDEFUN |I8MAT;empty;$;11| (($ ($))) (MAKE_MATRIX_I8 0 0)) 

(PUT '|I8MAT;qnew;2Nni$;12| '|SPADreplace| 'MAKE_MATRIX_I8) 

(SDEFUN |I8MAT;qnew;2Nni$;12|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) ($ ($)))
        (MAKE_MATRIX_I8 |rows| |cols|)) 

(PUT '|I8MAT;new;2NniI$;13| '|SPADreplace| 'MAKE_MATRIX1_I8) 

(SDEFUN |I8MAT;new;2NniI$;13|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|a| (|Integer|))
         ($ ($)))
        (MAKE_MATRIX1_I8 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |I8Matrix;|)) 

(DEFUN |I8Matrix| ()
  (SPROG NIL
         (PROG (#1=#:G2652)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|I8Matrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|I8Matrix|
                             (LIST (CONS NIL (CONS 1 (|I8Matrix;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|I8Matrix|)))))))))) 

(DEFUN |I8Matrix;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G2649 NIL) (#2=#:G2650 NIL) (#3=#:G2648 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|I8Matrix|))
    (LETT $ (GETREFV 46))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|)))
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
                                                              '(|SetCategory|))))
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
                                                               (|OutputForm|))))
                                        (OR #3# #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiRng|))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Monoid|))
                                         (|HasCategory| (|Integer|)
                                                        '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|IntegralDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|I8Matrix| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 131072))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| $ 262144))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| $ 524288))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      #1#)
     (|augmentPredVector| $ 1048576))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|I8Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |I8MAT;minRowIndex;$I;1|
              |I8MAT;minColIndex;$I;2| (|NonNegativeInteger|)
              |I8MAT;nrows;$Nni;3| |I8MAT;ncols;$Nni;4|
              |I8MAT;maxRowIndex;$I;5| |I8MAT;maxColIndex;$I;6|
              |I8MAT;qelt;$3I;7| |I8MAT;elt;$3I;8| |I8MAT;qsetelt!;$4I;9|
              |I8MAT;setelt!;$4I;10| |I8MAT;empty;$;11| |I8MAT;qnew;2Nni$;12|
              |I8MAT;new;2NniI$;13| (|List| 6) (|Equation| 6) (|List| 22)
              (|Boolean|) (|OutputForm|) (|List| 28) (|Union| $ '"failed")
              (|I8Vector|) (|List| $) (|SingleInteger|) (|String|)
              (|HashState|) (|Mapping| 24 6 6) (|Mapping| 24 6) (|Void|)
              (|List| 41) (|Union| 6 '"one") (|List| 21) (|Mapping| 6 6 6)
              (|List| 29) (|List| 9) (|Mapping| 6 6) (|PositiveInteger|)
              (|List| 45) (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |smaller?| 88 |size?|
              94 |setsubMatrix!| 100 |setelt!| 108 |setRow!| 204 |setColumn!|
              211 |scalarMatrix| 218 |sample| 224 |rowSlice| 228 |rowEchelon|
              233 |row| 238 |rank| 244 |qsetelt!| 249 |qnew| 257 |qelt| 263
              |positivePower| 270 |parts| 276 |nullity| 281 |nullSpace| 286
              |nrows| 291 |new| 296 |ncols| 303 |more?| 308 |minordet| 314
              |minRowIndex| 319 |minColIndex| 324 |min| 329 |members| 334
              |member?| 339 |maxRowIndex| 345 |maxColIndex| 350 |max| 355
              |matrix| 366 |map!| 378 |map| 384 |listOfLists| 405 |less?| 410
              |latex| 416 |kronecker_prod1| 421 |kroneckerSum| 432
              |kroneckerProduct| 443 |inverse| 454 |horizSplit| 459
              |horizConcat| 471 |hashUpdate!| 482 |hash| 488 |fill!| 493
              |exquo| 499 |every?| 505 |eval| 511 |eq?| 537 |empty?| 543
              |empty| 548 |elt| 552 |diagonalMatrix| 644 |diagonal?| 654
              |determinant| 659 |count| 664 |copy| 676 |columnSpace| 681
              |column| 686 |colSlice| 692 |coerce| 697 |blockSplit| 707
              |blockConcat| 721 |any?| 726 |antisymmetric?| 732 ^ 737
              |Pfaffian| 749 = 754 / 760 - 766 + 777 * 783 |#| 819)
           'NIL
           (CONS (|makeByteWordVec2| 10 '(0 0 0 1 0 8 6 0 0 0 8 5 10))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 28 28)
                      (|TwoDimensionalArrayCategory| 6 28 28)
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 25))
                   (|makeByteWordVec2| 45
                                       '(2 21 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 29 0 41 1 2 0 29 0 43 1 2 0 0 0 0 1
                                         1 0 0 29 1 1 0 0 28 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 1
                                         24 0 0 1 2 0 24 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 44 45 0 1 4 0 0 0 44 44 0 1 4
                                         0 0 0 45 21 0 1 4 0 0 0 45 44 0 1 4 0
                                         0 0 45 45 0 1 4 0 0 0 21 45 0 1 4 0 0
                                         0 21 6 0 1 4 0 0 0 21 21 0 1 4 0 0 0 6
                                         21 0 1 4 0 6 0 6 6 6 17 4 0 0 0 44 6 0
                                         1 4 0 0 0 6 44 0 1 3 0 0 0 6 28 1 3 0
                                         0 0 6 28 1 2 0 0 9 6 1 0 0 0 1 1 0 45
                                         0 1 1 14 0 0 1 2 0 28 0 6 1 1 15 9 0 1
                                         4 0 6 0 6 6 6 16 2 0 0 9 9 19 3 0 6 0
                                         6 6 14 2 12 0 0 6 1 1 0 21 0 1 1 15 9
                                         0 1 1 15 26 0 1 1 0 9 0 10 3 0 0 9 9 6
                                         20 1 0 9 0 11 2 0 24 0 9 1 1 16 6 0 1
                                         1 0 6 0 7 1 0 6 0 8 1 19 6 0 1 1 18 21
                                         0 1 2 20 24 6 0 1 1 0 6 0 12 1 0 6 0
                                         13 1 19 6 0 1 2 18 6 33 0 1 1 0 0 38 1
                                         3 0 0 9 9 39 1 2 0 0 42 0 1 3 0 0 39 0
                                         0 1 4 0 0 39 0 0 6 1 2 0 0 42 0 1 1 0
                                         38 0 1 2 0 24 0 9 1 1 4 31 0 1 7 0 35
                                         0 6 36 29 9 9 37 1 2 0 0 0 0 1 1 0 0
                                         29 1 2 12 0 0 0 1 1 12 0 29 1 1 17 27
                                         0 1 2 0 29 0 41 1 2 0 29 0 43 1 2 0 0
                                         0 0 1 1 0 0 29 1 2 4 32 32 0 1 1 4 30
                                         0 1 2 0 0 0 6 1 2 15 27 0 6 1 2 18 24
                                         34 0 1 3 7 0 0 21 21 1 2 7 0 0 22 1 3
                                         7 0 0 6 6 1 2 7 0 0 23 1 2 0 24 0 0 1
                                         1 0 24 0 1 0 0 0 18 3 0 0 0 44 45 1 3
                                         0 0 0 44 44 1 3 0 0 0 45 44 1 3 0 0 0
                                         44 6 1 3 0 0 0 45 21 1 3 0 0 0 6 44 1
                                         3 0 0 0 45 45 1 3 0 0 0 21 45 1 3 0 0
                                         0 21 6 1 3 0 0 0 21 21 1 3 0 0 0 6 21
                                         1 4 0 6 0 6 6 6 1 3 0 6 0 6 6 15 1 0 0
                                         29 1 1 0 0 21 1 1 0 24 0 1 1 16 6 0 1
                                         2 20 9 6 0 1 2 18 9 34 0 1 1 0 0 0 1 1
                                         14 26 0 1 2 0 28 0 6 1 1 0 45 0 1 1 9
                                         25 0 1 1 0 0 28 1 3 0 40 0 41 41 1 3 0
                                         40 0 43 43 1 1 0 0 40 1 2 18 24 34 0 1
                                         1 11 24 0 1 2 13 0 0 9 1 2 17 0 0 6 1
                                         1 16 6 0 1 2 21 24 0 0 1 2 17 0 0 6 1
                                         1 11 0 0 1 2 11 0 0 0 1 2 0 0 0 0 1 2
                                         11 0 6 0 1 2 12 28 28 0 1 2 12 0 0 6 1
                                         2 12 28 0 28 1 2 12 0 0 0 1 2 12 0 6 0
                                         1 1 18 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|I8Matrix| 'NILADIC T) 
