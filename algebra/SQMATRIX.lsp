
(/VERSIONCHECK 2) 

(DEFUN |SQMATRIX;Zero;$;1| ($) (QREFELT $ 10)) 

(DEFUN |SQMATRIX;One;$;2| ($) (QREFELT $ 13)) 

(DEFUN |SQMATRIX;characteristic;Nni;3| ($) (SPADCALL (QREFELT $ 16))) 

(DEFUN |SQMATRIX;matrix;L$;4| (|l| $)
  (PROG (#1=#:G121 |j| #2=#:G122 |r| #3=#:G119 |i| #4=#:G120 |ll| |ans|
         #5=#:G112 #6=#:G118)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 19))
        (|error| "matrix: wrong number of rows"))
       ('T
        (SEQ
         (SEQ
          (EXIT
           (SEQ (LETT |ll| NIL . #7=(|SQMATRIX;matrix;L$;4|))
                (LETT #6# |l| . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |ll|) (QREFELT $ 6) (QREFELT $ 19))
                    (PROGN
                     (LETT #5# (|error| "matrix: wrong number of columns")
                           . #7#)
                     (GO #5#))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
          #5# (EXIT #5#))
         (LETT |ans|
               (MAKE_MATRIX1 (QREFELT $ 6) (QREFELT $ 6) (|spadConstant| $ 8))
               . #7#)
         (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#) (LETT |i| 1 . #7#)
              (LETT #3# (SPADCALL |ans| (QREFELT $ 21)) . #7#) G190
              (COND
               ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                    (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                     (LETT |j| 1 . #7#)
                     (LETT #1# (SPADCALL |ans| (QREFELT $ 22)) . #7#) G190
                     (COND
                      ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                           (PROGN (LETT |r| (CAR #2#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                     (LETT |j|
                           (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#) . #7#))
                           . #7#)
                     (GO G190) G191 (EXIT NIL))))
              (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #7#))
                    . #7#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |SQMATRIX;row;$IDp;5| (|x| |i| $)
  (SPADCALL (SPADCALL |x| |i| (QREFELT $ 26)) (QREFELT $ 28))) 

(DEFUN |SQMATRIX;column;$IDp;6| (|x| |j| $)
  (SPADCALL (SPADCALL |x| |j| (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |SQMATRIX;coerce;$Of;7| (|x| $) (SPADCALL |x| (QREFELT $ 33))) 

(DEFUN |SQMATRIX;scalarMatrix;R$;8| (|r| $)
  (SPADCALL (QREFELT $ 6) |r| (QREFELT $ 35))) 

(DEFUN |SQMATRIX;diagonalMatrix;L$;9| (|l| $)
  (COND
   ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 19))
    (|error| "diagonalMatrix: wrong number of entries in list"))
   ('T (SPADCALL |l| (QREFELT $ 37))))) 

(DEFUN |SQMATRIX;coerce;$M;10| (|x| $) (SPADCALL |x| (QREFELT $ 39))) 

(DEFUN |SQMATRIX;squareMatrix;M$;11| (|x| $)
  (COND
   ((OR (SPADCALL (ANROWS |x|) (QREFELT $ 6) (QREFELT $ 19))
        (SPADCALL (ANCOLS |x|) (QREFELT $ 6) (QREFELT $ 19)))
    (|error| "squareMatrix: matrix of bad dimensions"))
   ('T (SPADCALL |x| (QREFELT $ 39))))) 

(DEFUN |SQMATRIX;*;$2Dp;12| (|x| |v| $)
  (SPADCALL (SPADCALL |x| (SPADCALL |v| (QREFELT $ 42)) (QREFELT $ 43))
            (QREFELT $ 28))) 

(DEFUN |SQMATRIX;*;Dp$Dp;13| (|v| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 42)) |x| (QREFELT $ 45))
            (QREFELT $ 28))) 

(DEFUN |SQMATRIX;determinant;$R;14| (|x| $) (SPADCALL |x| (QREFELT $ 47))) 

(DEFUN |SQMATRIX;minordet;$R;15| (|x| $) (SPADCALL |x| (QREFELT $ 49))) 

(DEFUN |SQMATRIX;Pfaffian;$R;16| (|x| $) (SPADCALL |x| (QREFELT $ 51))) 

(DEFUN |SQMATRIX;rowEchelon;2$;17| (|x| $) (SPADCALL |x| (QREFELT $ 53))) 

(DEFUN |SQMATRIX;rank;$Nni;18| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |SQMATRIX;nullity;$Nni;19| (|x| $) (SPADCALL |x| (QREFELT $ 57))) 

(DEFUN |SQMATRIX;nullSpace;$L;20| (|x| $)
  (PROG (#1=#:G145 |c| #2=#:G144)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SQMATRIX;nullSpace;$L;20|))
       (SEQ (LETT |c| NIL . #3#) (LETT #1# (SPADCALL |x| (QREFELT $ 60)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 28)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SQMATRIX;inverse;$U;21| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 64)) |SQMATRIX;inverse;$U;21|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCDR |u|))))))))) 

(DEFUN |SQMATRIX;^;$I$;22| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 66))) 

(DEFUN |SQMATRIX;recip;$U;23| (|x| $) (SPADCALL |x| (QREFELT $ 65))) 

(DEFUN |SQMATRIX;convert;$If;24| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|squareMatrix| (QREFELT $ 71))
         (SPADCALL (SPADCALL |x| (QREFELT $ 40)) (QREFELT $ 72)))
   (QREFELT $ 74))) 

(DECLAIM (NOTINLINE |SquareMatrix;|)) 

(DEFUN |SquareMatrix| (&REST #1=#:G178)
  (PROG ()
    (RETURN
     (PROG (#2=#:G179)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SquareMatrix|)
                                           '|domainEqualList|)
                . #3=(|SquareMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SquareMatrix;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SquareMatrix|))))))))))) 

(DEFUN |SquareMatrix;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G174 #2=#:G175 #3=#:G177 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|SquareMatrix|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|SquareMatrix| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 96) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2| '(|SemiRing|))
                                          (|HasCategory| |#2| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (LETT #3#
                                                (|HasCategory| |#2|
                                                               '(|DifferentialRing|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasCategory| |#2|
                                                          '(|CommutativeRing|))
                                           #3# (|HasCategory| |#2| '(|Ring|)))
                                          (|HasCategory| |#2| '(|Finite|))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (OR
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|CommutativeStar|))
                                            (|HasCategory| |#2|
                                                           '(|unitsKnown|)))
                                           (|HasCategory| |#2| '(|Ring|)))
                                          (|HasCategory| |#2|
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2| '(|BasicType|))
                                          (AND
                                           (|HasCategory| |#2|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                           (|HasCategory| |#2|
                                                          '(|SetCategory|)))
                                          (OR
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2|
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2|
                                                           '(|PartialDifferentialRing|
                                                             (|Symbol|))))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2|
                                                           '(|CommutativeRing|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            #3#)
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2| '(|Finite|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2| '(|Ring|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2| '(|SemiRing|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                            (|HasCategory| |#2|
                                                           '(|SetCategory|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#2| '(|Ring|)))
                                          (AND #3#
                                               (|HasCategory| |#2| '(|Ring|)))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasCategory| |#2| '(|Ring|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           (|HasCategory| |#2| '(|Ring|)))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|AbelianGroup|))
                                                . #4#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|CommutativeRing|))
                                           #3# (|HasCategory| |#2| '(|Ring|)))
                                          (LETT #1#
                                                (|HasCategory| |#2|
                                                               '(|ConvertibleTo|
                                                                 (|InputForm|)))
                                                . #4#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitRingOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND #2#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|CommutativeRing|))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|CommutativeStar|))
                                               (|HasCategory| |#2|
                                                              '(|Finite|)))
                                              (AND #3#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|)))
                                              (AND
                                               (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRing|))))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|SquareMatrix| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 33554432))
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 67108864))
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 134217728))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (|spadConstant| $ 8) (QREFELT $ 9)))
      (COND
       ((|HasCategory| |#2| '(|Monoid|))
        (PROGN
         (QSETREFV $ 13 (SPADCALL (|spadConstant| $ 12) (QREFELT $ 9)))
         (QSETREFV $ 14
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |SQMATRIX;One;$;2|) $
                               14))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 17
                  (CONS (|dispatchFunction| |SQMATRIX;characteristic;Nni;3|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 48
                   (CONS (|dispatchFunction| |SQMATRIX;determinant;$R;14|) $))
         (QSETREFV $ 50
                   (CONS (|dispatchFunction| |SQMATRIX;minordet;$R;15|) $))
         (QSETREFV $ 52
                   (CONS (|dispatchFunction| |SQMATRIX;Pfaffian;$R;16|) $)))))
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |SQMATRIX;rowEchelon;2$;17|) $))))
      (COND
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 56 (CONS (|dispatchFunction| |SQMATRIX;rank;$Nni;18|) $))
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |SQMATRIX;nullity;$Nni;19|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |SQMATRIX;nullSpace;$L;20|) $)))))
      (COND
       ((|testBitVector| |pv$| 17)
        (PROGN
         (QSETREFV $ 65 (CONS (|dispatchFunction| |SQMATRIX;inverse;$U;21|) $))
         (QSETREFV $ 67 (CONS (|dispatchFunction| |SQMATRIX;^;$I$;22|) $))
         (QSETREFV $ 68
                   (CONS (|dispatchFunction| |SQMATRIX;recip;$U;23|) $)))))
      (COND
       ((|testBitVector| |pv$| 24)
        (QSETREFV $ 75
                  (CONS (|dispatchFunction| |SQMATRIX;convert;$If;24|) $))))
      $)))) 

(MAKEPROP '|SquareMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Matrix| 7) (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) |SQMATRIX;scalarMatrix;R$;8| 'ZERO
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SQMATRIX;Zero;$;1|) $))
              (4 . |One|) 'ONE (8 . |One|) (|NonNegativeInteger|)
              (12 . |characteristic|) (16 . |characteristic|) (|Boolean|)
              (20 . ~=) (|Integer|) (26 . |maxRowIndex|) (31 . |maxColIndex|)
              (|List| 36) |SQMATRIX;matrix;L$;4| (|Vector| 7) (36 . |row|)
              (|DirectProduct| 6 7) (42 . |directProduct|)
              |SQMATRIX;row;$IDp;5| (47 . |column|) |SQMATRIX;column;$IDp;6|
              (|OutputForm|) (53 . |coerce|) |SQMATRIX;coerce;$Of;7|
              (58 . |scalarMatrix|) (|List| 7) (64 . |diagonalMatrix|)
              |SQMATRIX;diagonalMatrix;L$;9| (69 . |copy|)
              |SQMATRIX;coerce;$M;10| |SQMATRIX;squareMatrix;M$;11|
              (74 . |coerce|) (79 . *) |SQMATRIX;*;$2Dp;12| (85 . *)
              |SQMATRIX;*;Dp$Dp;13| (91 . |determinant|) (96 . |determinant|)
              (101 . |minordet|) (106 . |minordet|) (111 . |Pfaffian|)
              (116 . |Pfaffian|) (121 . |rowEchelon|) (126 . |rowEchelon|)
              (131 . |rank|) (136 . |rank|) (141 . |nullity|) (146 . |nullity|)
              (|List| 25) (151 . |nullSpace|) (|List| 27) (156 . |nullSpace|)
              (|Union| $ '"failed") (161 . |inverse|) (166 . |inverse|)
              (171 . ^) (177 . ^) (183 . |recip|) (|Symbol|) (|InputForm|)
              (188 . |convert|) (193 . |convert|) (|List| $) (198 . |convert|)
              (203 . |convert|) (|List| 77) (|Equation| 7) (|Matrix| 20)
              (|Matrix| $) (|Record| (|:| |mat| 78) (|:| |vec| (|Vector| 20)))
              (|Vector| $) (|List| 69) (|List| 15) (|Mapping| 18 7)
              (|Mapping| 7 7) (|PositiveInteger|) (|Fraction| 20)
              (|Union| 87 '#1="failed") (|Union| 20 '#1#)
              (|Record| (|:| |mat| 5) (|:| |vec| 25)) (|Union| 7 '#1#)
              (|Mapping| 7 7 7) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 208 |zero?| 214 |transpose| 219 |trace| 224 |symmetric?| 229
              |subtractIfCan| 234 |squareMatrix| 240 |square?| 245 |size?| 250
              |size| 256 |scalarMatrix| 260 |sample| 265 |rowEchelon| 269 |row|
              274 |retractIfCan| 280 |retract| 295 |reducedSystem| 310 |recip|
              332 |rank| 337 |random| 342 |qelt| 346 |parts| 353 |opposite?|
              358 |one?| 364 |nullity| 369 |nullSpace| 374 |nrows| 379 |ncols|
              384 |more?| 389 |minordet| 395 |minRowIndex| 400 |minColIndex|
              405 |members| 410 |member?| 415 |maxRowIndex| 421 |maxColIndex|
              426 |matrix| 431 |map!| 436 |map| 442 |lookup| 455 |listOfLists|
              460 |less?| 465 |latex| 471 |inverse| 476 |index| 481
              |hashUpdate!| 486 |hash| 492 |exquo| 497 |every?| 503 |eval| 509
              |eq?| 535 |enumerate| 541 |empty?| 545 |empty| 550 |elt| 554
              |differentiate| 569 |diagonalProduct| 619 |diagonalMatrix| 624
              |diagonal?| 629 |diagonal| 634 |determinant| 639 |count| 644
              |copy| 656 |convert| 661 |columnSpace| 666 |column| 671 |coerce|
              677 |characteristic| 702 |any?| 706 |antisymmetric?| 712
              |annihilate?| 717 ^ 723 |Zero| 741 |Pfaffian| 745 |One| 750 D 754
              = 804 / 810 - 816 + 827 * 833 |#| 881)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 3 3 1 3 4 5 6 0 7 0 0 3 7 23 2 23 0 0 2
                                  0 0 0 8 0 0 0 16 0 0 0 0 0 0 16 9 10 25 11))
            (CONS
             '#(|SquareMatrixCategory&| |RectangularMatrixCategory&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| NIL NIL NIL |Rng&|
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| |SemiGroup&|
                |Finite&| |FullyRetractableTo&| |Aggregate&| |SetCategory&|
                |Evalable&| NIL |RetractableTo&| NIL NIL |BasicType&| NIL
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|SquareMatrixCategory| 6 7 (|DirectProduct| 6 7)
                                         (|DirectProduct| 6 7))
                 (|RectangularMatrixCategory| 6 6 7 (|DirectProduct| 6 7)
                                              (|DirectProduct| 6 7))
                 (|Algebra| 7) (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7)
                 (|LinearlyExplicitRingOver| 7) (|LinearlyExplicitRingOver| 20)
                 (|PartialDifferentialRing| 69) (|DifferentialRing|)
                 (|BiModule| 7 7) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|Monoid|) (|HomogeneousAggregate| 7) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Finite|) (|FullyRetractableTo| 7)
                 (|Aggregate|) (|SetCategory|) (|Evalable| 7)
                 (|CoercibleTo| (|Matrix| 7)) (|RetractableTo| 7)
                 (|finiteAggregate|) (|Type|) (|BasicType|) (|CoercibleTo| 32)
                 (|InnerEvalable| 7 7) (|RetractableTo| 87)
                 (|RetractableTo| 20) (|ConvertibleTo| 70) (|unitsKnown|))
              (|makeByteWordVec2| 95
                                  '(0 7 0 8 0 7 0 12 0 0 0 14 0 7 15 16 0 0 15
                                    17 2 15 18 0 0 19 1 5 20 0 21 1 5 20 0 22 2
                                    5 25 0 20 26 1 27 0 25 28 2 5 25 0 20 30 1
                                    5 32 0 33 2 5 0 15 7 35 1 5 0 36 37 1 5 0 0
                                    39 1 27 25 0 42 2 5 25 0 25 43 2 5 25 25 0
                                    45 1 5 7 0 47 1 0 7 0 48 1 5 7 0 49 1 0 7 0
                                    50 1 5 7 0 51 1 0 7 0 52 1 5 0 0 53 1 0 0 0
                                    54 1 5 15 0 55 1 0 15 0 56 1 5 15 0 57 1 0
                                    15 0 58 1 5 59 0 60 1 0 61 0 62 1 5 63 0 64
                                    1 0 63 0 65 2 5 0 0 20 66 2 0 0 0 20 67 1 0
                                    63 0 68 1 70 0 69 71 1 5 70 0 72 1 70 0 73
                                    74 1 0 70 0 75 2 0 18 0 0 1 1 0 18 0 1 1 0
                                    0 0 1 1 0 7 0 1 1 0 18 0 1 2 22 63 0 0 1 1
                                    0 0 5 41 1 0 18 0 1 2 0 18 0 15 1 0 8 15 1
                                    1 0 0 7 9 0 0 0 1 1 12 0 0 54 2 0 27 0 20
                                    29 1 9 88 0 1 1 10 89 0 1 1 0 91 0 1 1 9 87
                                    0 1 1 10 20 0 1 1 0 7 0 1 1 18 78 79 1 2 18
                                    80 79 81 1 2 3 90 79 81 1 1 3 5 79 1 1 2 63
                                    0 68 1 13 15 0 56 0 8 0 1 3 0 7 0 20 20 1 1
                                    27 36 0 1 2 0 18 0 0 1 1 2 18 0 1 1 13 15 0
                                    58 1 13 61 0 62 1 0 15 0 1 1 0 15 0 1 2 0
                                    18 0 15 1 1 1 7 0 50 1 0 20 0 1 1 0 20 0 1
                                    1 27 36 0 1 2 28 18 7 0 1 1 0 20 0 1 1 0 20
                                    0 1 1 0 0 23 24 2 26 0 85 0 1 2 0 0 85 0 1
                                    3 0 0 92 0 0 1 1 8 86 0 1 1 0 23 0 1 2 0 18
                                    0 15 1 1 0 94 0 1 1 17 63 0 65 1 8 0 86 1 2
                                    0 93 93 0 1 1 0 95 0 1 2 13 63 0 7 1 2 27
                                    18 84 0 1 3 15 0 0 7 7 1 3 15 0 0 36 36 1 2
                                    15 0 0 76 1 2 15 0 0 77 1 2 0 18 0 0 1 0 8
                                    73 1 1 0 18 0 1 0 0 0 1 3 0 7 0 20 20 1 4 0
                                    7 0 20 20 7 1 2 19 0 0 15 1 1 19 0 0 1 3 20
                                    0 0 82 83 1 2 20 0 0 82 1 3 20 0 0 69 15 1
                                    2 20 0 0 69 1 3 3 0 0 85 15 1 2 3 0 0 85 1
                                    1 0 7 0 1 1 0 0 36 38 1 0 18 0 1 1 0 27 0 1
                                    1 1 7 0 48 2 28 15 7 0 1 2 27 15 84 0 1 1 0
                                    0 0 1 1 24 70 0 75 1 12 61 0 1 2 0 27 0 20
                                    31 1 21 0 20 1 1 9 0 87 1 1 0 5 0 40 1 0 0
                                    7 1 1 0 32 0 34 0 3 15 17 2 27 18 84 0 1 1
                                    0 18 0 1 2 3 18 0 0 1 2 17 0 0 20 67 2 2 0
                                    0 15 1 2 0 0 0 86 1 0 0 0 11 1 1 7 0 52 0 2
                                    0 14 2 19 0 0 15 1 1 19 0 0 1 3 20 0 0 82
                                    83 1 2 20 0 0 82 1 3 20 0 0 69 15 1 2 20 0
                                    0 69 1 2 3 0 0 85 1 3 3 0 0 85 15 1 2 0 18
                                    0 0 1 2 17 0 0 7 1 2 22 0 0 0 1 1 22 0 0 1
                                    2 0 0 0 0 1 2 22 0 20 0 1 2 0 27 27 0 46 2
                                    0 27 0 27 44 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0
                                    15 0 1 2 0 0 0 0 1 2 0 0 86 0 1 1 27 15 0
                                    1)))))
           '|lookupComplete|)) 
