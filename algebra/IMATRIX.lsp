
(/VERSIONCHECK 2) 

(DEFUN |IMATRIX;swapRows!;$2I$;1| (|x| |i1| |i2| $)
  (PROG (|row1| |n2| |n1| |xx| |minRow|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 10)))
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 13))
                (OR (< |i2| (SPADCALL |x| (QREFELT $ 10)))
                    (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 11))
                              (QREFELT $ 13)))))
        (|error| "swapRows!: index out of range"))
       ('T
        (COND ((EQL |i1| |i2|) |x|)
              ('T
               (SEQ
                (LETT |minRow| (SPADCALL |x| (QREFELT $ 10))
                      . #1=(|IMATRIX;swapRows!;$2I$;1|))
                (LETT |xx| |x| . #1#) (LETT |n1| (- |i1| |minRow|) . #1#)
                (LETT |n2| (- |i2| |minRow|) . #1#)
                (LETT |row1| (QAREF1 |xx| |n1|) . #1#)
                (QSETAREF1 |xx| |n1| (QAREF1 |xx| |n2|))
                (QSETAREF1 |xx| |n2| |row1|) (EXIT |xx|)))))))))) 

(DEFUN |IMATRIX;determinant;$R;2| (|x| $) (SPADCALL |x| (QREFELT $ 16))) 

(DEFUN |IMATRIX;minordet;$R;3| (|x| $) (SPADCALL |x| (QREFELT $ 18))) 

(DEFUN |IMATRIX;rowEchelon;2$;4| (|x| $) (SPADCALL |x| (QREFELT $ 20))) 

(DEFUN |IMATRIX;rank;$Nni;5| (|x| $) (SPADCALL |x| (QREFELT $ 23))) 

(DEFUN |IMATRIX;nullity;$Nni;6| (|x| $) (SPADCALL |x| (QREFELT $ 25))) 

(DEFUN |IMATRIX;nullSpace;$L;7| (|x| $) (SPADCALL |x| (QREFELT $ 28))) 

(DEFUN |IMATRIX;inverse;$U;8| (|x| $) (SPADCALL |x| (QREFELT $ 31))) 

(DEFUN |IndexedMatrix| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IndexedMatrix|)
                                           '|domainEqualList|)
                . #3=(|IndexedMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IndexedMatrix;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|IndexedMatrix|))))))))))) 

(DEFUN |IndexedMatrix;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G155 #2=#:G156 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|IndexedMatrix|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT DV$3 (|devaluate| |#3|) . #3#)
      (LETT |dv$| (LIST '|IndexedMatrix| DV$1 DV$2 DV$3) . #3#)
      (LETT $ (GETREFV 51) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1| '(|Monoid|))
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|IndexedMatrix| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 1024))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 2048))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 9)
        (PROGN
         (QSETREFV $ 17
                   (CONS (|dispatchFunction| |IMATRIX;determinant;$R;2|) $))
         (QSETREFV $ 19
                   (CONS (|dispatchFunction| |IMATRIX;minordet;$R;3|) $)))))
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 21
                  (CONS (|dispatchFunction| |IMATRIX;rowEchelon;2$;4|) $))))
      (COND
       ((|testBitVector| |pv$| 8)
        (PROGN
         (QSETREFV $ 24 (CONS (|dispatchFunction| |IMATRIX;rank;$Nni;5|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IMATRIX;nullity;$Nni;6|) $))
         (QSETREFV $ 29
                   (CONS (|dispatchFunction| |IMATRIX;nullSpace;$L;7|) $)))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 33 (CONS (|dispatchFunction| |IMATRIX;inverse;$U;8|) $))))
      $)))) 

(MAKEPROP '|IndexedMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|InnerIndexedTwoDimensionalArray| 6 7 8 45 46) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (|Boolean|) (10 . >)
              |IMATRIX;swapRows!;$2I$;1|
              (|MatrixLinearAlgebraFunctions| 6 45 46 $$) (16 . |determinant|)
              (21 . |determinant|) (26 . |minordet|) (31 . |minordet|)
              (36 . |rowEchelon|) (41 . |rowEchelon|) (|NonNegativeInteger|)
              (46 . |rank|) (51 . |rank|) (56 . |nullity|) (61 . |nullity|)
              (|List| 46) (66 . |nullSpace|) (71 . |nullSpace|)
              (|Union| $$ '"failed") (76 . |inverse|) (|Union| $ '"failed")
              (81 . |inverse|) (|List| 6) (|Equation| 6) (|List| 35)
              (|Mapping| 12 6) (|OutputForm|) (|SingleInteger|) (|String|)
              (|Void|) (|List| (|List| 22)) (|List| $) (|Union| 6 '"one")
              (|IndexedVector| 6 8) (|IndexedVector| 6 7) (|List| 9)
              (|List| 34) (|Mapping| 6 6 6) (|Mapping| 6 6))
           '#(|swapRows!| 86 |rowEchelon| 93 |rank| 98 |nullity| 103
              |nullSpace| 108 |minordet| 113 |minRowIndex| 118 |maxRowIndex|
              123 |inverse| 128 |determinant| 133)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL NIL NIL |InnerEvalable&| |BasicType&|
                     NIL)
                  (CONS
                   '#((|MatrixCategory| 6 (|IndexedVector| 6 8)
                                        (|IndexedVector| 6 7))
                      (|TwoDimensionalArrayCategory| 6 (|IndexedVector| 6 8)
                                                     (|IndexedVector| 6 7))
                      (|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6) (|BasicType|)
                      (|CoercibleTo| 38))
                   (|makeByteWordVec2| 33
                                       '(1 0 9 0 10 1 0 9 0 11 2 9 12 0 0 13 1
                                         15 6 2 16 1 0 6 0 17 1 15 6 2 18 1 0 6
                                         0 19 1 15 2 2 20 1 0 0 0 21 1 15 22 2
                                         23 1 0 22 0 24 1 15 22 2 25 1 0 22 0
                                         26 1 15 27 2 28 1 0 27 0 29 1 15 30 2
                                         31 1 0 32 0 33 3 0 0 0 9 9 14 1 7 0 0
                                         21 1 8 22 0 24 1 8 22 0 26 1 8 27 0 29
                                         1 9 6 0 19 1 0 9 0 10 1 0 9 0 11 1 10
                                         32 0 33 1 9 6 0 17)))))
           '|lookupIncomplete|)) 
