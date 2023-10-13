
(/VERSIONCHECK 2) 

(DEFUN |SQMATRIX;Zero;$;1| ($) (QREFELT $ 10)) 

(DEFUN |SQMATRIX;One;$;2| ($) (QREFELT $ 13)) 

(DEFUN |SQMATRIX;characteristic;Nni;3| ($) (SPADCALL (QREFELT $ 16))) 

(DEFUN |SQMATRIX;matrix;L$;4| (|l| $)
  (PROG (#1=#:G143 |j| #2=#:G144 |r| #3=#:G141 |i| #4=#:G142 |ll| |ans|
         #5=#:G134 #6=#:G140)
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
               (SPADCALL (QREFELT $ 6) (QREFELT $ 6) (|spadConstant| $ 8)
                         (QREFELT $ 20))
               . #7#)
         (SEQ (LETT |ll| NIL . #7#) (LETT #4# |l| . #7#) (LETT |i| 1 . #7#)
              (LETT #3# (SPADCALL |ans| (QREFELT $ 22)) . #7#) G190
              (COND
               ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                    (PROGN (LETT |ll| (CAR #4#) . #7#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |r| NIL . #7#) (LETT #2# |ll| . #7#)
                     (LETT |j| 1 . #7#)
                     (LETT #1# (SPADCALL |ans| (QREFELT $ 23)) . #7#) G190
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
  (SPADCALL (SPADCALL |x| |i| (QREFELT $ 27)) (QREFELT $ 29))) 

(DEFUN |SQMATRIX;column;$IDp;6| (|x| |j| $)
  (SPADCALL (SPADCALL |x| |j| (QREFELT $ 31)) (QREFELT $ 29))) 

(DEFUN |SQMATRIX;coerce;$Of;7| (|x| $) (SPADCALL |x| (QREFELT $ 34))) 

(DEFUN |SQMATRIX;scalarMatrix;R$;8| (|r| $)
  (SPADCALL (QREFELT $ 6) |r| (QREFELT $ 36))) 

(DEFUN |SQMATRIX;diagonalMatrix;L$;9| (|l| $)
  (COND
   ((SPADCALL (LENGTH |l|) (QREFELT $ 6) (QREFELT $ 19))
    (|error| "diagonalMatrix: wrong number of entries in list"))
   ('T (SPADCALL |l| (QREFELT $ 38))))) 

(DEFUN |SQMATRIX;coerce;$M;10| (|x| $) (SPADCALL |x| (QREFELT $ 40))) 

(DEFUN |SQMATRIX;squareMatrix;M$;11| (|x| $)
  (COND
   ((OR (SPADCALL (QVSIZE |x|) (QREFELT $ 6) (QREFELT $ 19))
        (SPADCALL (SPADCALL |x| (QREFELT $ 42)) (QREFELT $ 6) (QREFELT $ 19)))
    (|error| "squareMatrix: matrix of bad dimensions"))
   ('T (SPADCALL |x| (QREFELT $ 40))))) 

(DEFUN |SQMATRIX;*;$2Dp;12| (|x| |v| $)
  (SPADCALL (SPADCALL |x| (SPADCALL |v| (QREFELT $ 44)) (QREFELT $ 45))
            (QREFELT $ 29))) 

(DEFUN |SQMATRIX;*;Dp$Dp;13| (|v| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 44)) |x| (QREFELT $ 47))
            (QREFELT $ 29))) 

(DEFUN |SQMATRIX;determinant;$R;14| (|x| $) (SPADCALL |x| (QREFELT $ 49))) 

(DEFUN |SQMATRIX;minordet;$R;15| (|x| $) (SPADCALL |x| (QREFELT $ 51))) 

(DEFUN |SQMATRIX;Pfaffian;$R;16| (|x| $) (SPADCALL |x| (QREFELT $ 53))) 

(DEFUN |SQMATRIX;rowEchelon;2$;17| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |SQMATRIX;rank;$Nni;18| (|x| $) (SPADCALL |x| (QREFELT $ 57))) 

(DEFUN |SQMATRIX;nullity;$Nni;19| (|x| $) (SPADCALL |x| (QREFELT $ 59))) 

(DEFUN |SQMATRIX;nullSpace;$L;20| (|x| $)
  (PROG (#1=#:G167 |c| #2=#:G166)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SQMATRIX;nullSpace;$L;20|))
       (SEQ (LETT |c| NIL . #3#) (LETT #1# (SPADCALL |x| (QREFELT $ 62)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 29)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SQMATRIX;inverse;$U;21| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 66)) |SQMATRIX;inverse;$U;21|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCDR |u|))))))))) 

(DEFUN |SQMATRIX;^;$I$;22| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 68))) 

(DEFUN |SQMATRIX;recip;$U;23| (|x| $) (SPADCALL |x| (QREFELT $ 67))) 

(DEFUN |SQMATRIX;convert;$If;24| (|x| $)
  (SPADCALL
   (LIST (SPADCALL '|squareMatrix| (QREFELT $ 73))
         (SPADCALL (SPADCALL |x| (QREFELT $ 41)) (QREFELT $ 74)))
   (QREFELT $ 76))) 

(DEFUN |SquareMatrix| (&REST #1=#:G200)
  (PROG ()
    (RETURN
     (PROG (#2=#:G201)
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
  (PROG (|pv$| #1=#:G196 #2=#:G197 #3=#:G199 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|SquareMatrix|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|SquareMatrix| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 97) . #4#)
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
                                          (|HasCategory| |#2| '(|SetCategory|))
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
      (AND (|HasCategory| |#2| '(|SetCategory|))
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
         (QSETREFV $ 50
                   (CONS (|dispatchFunction| |SQMATRIX;determinant;$R;14|) $))
         (QSETREFV $ 52
                   (CONS (|dispatchFunction| |SQMATRIX;minordet;$R;15|) $))
         (QSETREFV $ 54
                   (CONS (|dispatchFunction| |SQMATRIX;Pfaffian;$R;16|) $)))))
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 56
                  (CONS (|dispatchFunction| |SQMATRIX;rowEchelon;2$;17|) $))))
      (COND
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 58 (CONS (|dispatchFunction| |SQMATRIX;rank;$Nni;18|) $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |SQMATRIX;nullity;$Nni;19|) $))
         (QSETREFV $ 64
                   (CONS (|dispatchFunction| |SQMATRIX;nullSpace;$L;20|) $)))))
      (COND
       ((|testBitVector| |pv$| 17)
        (PROGN
         (QSETREFV $ 67 (CONS (|dispatchFunction| |SQMATRIX;inverse;$U;21|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |SQMATRIX;^;$I$;22|) $))
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |SQMATRIX;recip;$U;23|) $)))))
      (COND
       ((|testBitVector| |pv$| 24)
        (QSETREFV $ 77
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
              (20 . ~=) (26 . |new|) (|Integer|) (33 . |maxRowIndex|)
              (38 . |maxColIndex|) (|List| 37) |SQMATRIX;matrix;L$;4|
              (|Vector| 7) (43 . |row|) (|DirectProduct| 6 7)
              (49 . |directProduct|) |SQMATRIX;row;$IDp;5| (54 . |column|)
              |SQMATRIX;column;$IDp;6| (|OutputForm|) (60 . |coerce|)
              |SQMATRIX;coerce;$Of;7| (65 . |scalarMatrix|) (|List| 7)
              (71 . |diagonalMatrix|) |SQMATRIX;diagonalMatrix;L$;9|
              (76 . |copy|) |SQMATRIX;coerce;$M;10| (81 . |ncols|)
              |SQMATRIX;squareMatrix;M$;11| (86 . |coerce|) (91 . *)
              |SQMATRIX;*;$2Dp;12| (97 . *) |SQMATRIX;*;Dp$Dp;13|
              (103 . |determinant|) (108 . |determinant|) (113 . |minordet|)
              (118 . |minordet|) (123 . |Pfaffian|) (128 . |Pfaffian|)
              (133 . |rowEchelon|) (138 . |rowEchelon|) (143 . |rank|)
              (148 . |rank|) (153 . |nullity|) (158 . |nullity|) (|List| 26)
              (163 . |nullSpace|) (|List| 28) (168 . |nullSpace|)
              (|Union| $ '"failed") (173 . |inverse|) (178 . |inverse|)
              (183 . ^) (189 . ^) (195 . |recip|) (|Symbol|) (|InputForm|)
              (200 . |convert|) (205 . |convert|) (|List| $) (210 . |convert|)
              (215 . |convert|) (|List| 79) (|Equation| 7)
              (|Record| (|:| |mat| 83) (|:| |vec| (|Vector| 21))) (|Matrix| $)
              (|Vector| $) (|Matrix| 21) (|List| 71) (|List| 15)
              (|Mapping| 18 7) (|Mapping| 7 7) (|PositiveInteger|)
              (|Fraction| 21) (|Union| 89 '#1="failed") (|Union| 21 '#1#)
              (|Record| (|:| |mat| 5) (|:| |vec| 26)) (|Union| 7 '#1#)
              (|Mapping| 7 7 7) (|String|) (|SingleInteger|))
           '#(~= 220 |zero?| 226 |transpose| 231 |trace| 236 |symmetric?| 241
              |subtractIfCan| 246 |squareMatrix| 252 |square?| 257 |size?| 262
              |size| 268 |scalarMatrix| 272 |sample| 277 |rowEchelon| 281 |row|
              286 |retractIfCan| 292 |retract| 307 |reducedSystem| 322 |recip|
              344 |rank| 349 |random| 354 |qelt| 358 |parts| 365 |one?| 370
              |nullity| 375 |nullSpace| 380 |nrows| 385 |ncols| 390 |more?| 395
              |minordet| 401 |minRowIndex| 406 |minColIndex| 411 |members| 416
              |member?| 421 |maxRowIndex| 427 |maxColIndex| 432 |matrix| 437
              |map!| 442 |map| 448 |lookup| 461 |listOfLists| 466 |less?| 471
              |latex| 477 |inverse| 482 |index| 487 |hash| 492 |exquo| 497
              |every?| 503 |eval| 509 |eq?| 535 |enumerate| 541 |empty?| 545
              |empty| 550 |elt| 554 |differentiate| 569 |diagonalProduct| 619
              |diagonalMatrix| 624 |diagonal?| 629 |diagonal| 634 |determinant|
              639 |count| 644 |copy| 656 |convert| 661 |columnSpace| 666
              |column| 671 |coerce| 677 |characteristic| 702 |any?| 706
              |antisymmetric?| 712 ^ 717 |Zero| 735 |Pfaffian| 739 |One| 744 D
              748 = 798 / 804 - 810 + 821 * 827 |#| 875)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 3 3 1 3 4 5 6 0 7 0 0 3 7 23 2 23 0 0 2
                                  0 0 0 8 0 0 0 16 0 0 0 0 0 0 16 9 10 25 11))
            (CONS
             '#(|SquareMatrixCategory&| |RectangularMatrixCategory&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| NIL NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL |AbelianMonoid&| |Monoid&| |HomogeneousAggregate&|
                |AbelianSemiGroup&| |SemiGroup&| |Finite&|
                |FullyRetractableTo&| |Aggregate&| |SetCategory&| |Evalable&|
                NIL |RetractableTo&| NIL NIL |BasicType&| NIL |InnerEvalable&|
                |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|SquareMatrixCategory| 6 7 (|DirectProduct| 6 7)
                                         (|DirectProduct| 6 7))
                 (|RectangularMatrixCategory| 6 6 7 (|DirectProduct| 6 7)
                                              (|DirectProduct| 6 7))
                 (|Algebra| 7) (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7)
                 (|LinearlyExplicitRingOver| 7) (|LinearlyExplicitRingOver| 21)
                 (|PartialDifferentialRing| 71) (|DifferentialRing|)
                 (|BiModule| 7 7) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|Monoid|) (|HomogeneousAggregate| 7) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Finite|) (|FullyRetractableTo| 7)
                 (|Aggregate|) (|SetCategory|) (|Evalable| 7)
                 (|CoercibleTo| (|Matrix| 7)) (|RetractableTo| 7)
                 (|finiteAggregate|) (|Type|) (|BasicType|) (|CoercibleTo| 33)
                 (|InnerEvalable| 7 7) (|RetractableTo| 89)
                 (|RetractableTo| 21) (|ConvertibleTo| 72) (|unitsKnown|))
              (|makeByteWordVec2| 96
                                  '(0 7 0 8 0 7 0 12 0 0 0 14 0 7 15 16 0 0 15
                                    17 2 15 18 0 0 19 3 5 0 15 15 7 20 1 5 21 0
                                    22 1 5 21 0 23 2 5 26 0 21 27 1 28 0 26 29
                                    2 5 26 0 21 31 1 5 33 0 34 2 5 0 15 7 36 1
                                    5 0 37 38 1 5 0 0 40 1 5 15 0 42 1 28 26 0
                                    44 2 5 26 0 26 45 2 5 26 26 0 47 1 5 7 0 49
                                    1 0 7 0 50 1 5 7 0 51 1 0 7 0 52 1 5 7 0 53
                                    1 0 7 0 54 1 5 0 0 55 1 0 0 0 56 1 5 15 0
                                    57 1 0 15 0 58 1 5 15 0 59 1 0 15 0 60 1 5
                                    61 0 62 1 0 63 0 64 1 5 65 0 66 1 0 65 0 67
                                    2 5 0 0 21 68 2 0 0 0 21 69 1 0 65 0 70 1
                                    72 0 71 73 1 5 72 0 74 1 72 0 75 76 1 0 72
                                    0 77 2 0 18 0 0 1 1 0 18 0 1 1 0 0 0 1 1 0
                                    7 0 1 1 0 18 0 1 2 22 65 0 0 1 1 0 0 5 43 1
                                    0 18 0 1 2 0 18 0 15 1 0 8 15 1 1 0 0 7 9 0
                                    0 0 1 1 12 0 0 56 2 0 28 0 21 30 1 9 90 0 1
                                    1 10 91 0 1 1 0 93 0 1 1 9 89 0 1 1 10 21 0
                                    1 1 0 7 0 1 2 18 80 81 82 1 1 18 83 81 1 1
                                    3 5 81 1 2 3 92 81 82 1 1 2 65 0 70 1 13 15
                                    0 58 0 8 0 1 3 0 7 0 21 21 1 1 27 37 0 1 1
                                    2 18 0 1 1 13 15 0 60 1 13 63 0 64 1 0 15 0
                                    1 1 0 15 0 1 2 0 18 0 15 1 1 1 7 0 52 1 0
                                    21 0 1 1 0 21 0 1 1 27 37 0 1 2 28 18 7 0 1
                                    1 0 21 0 1 1 0 21 0 1 1 0 0 24 25 2 26 0 87
                                    0 1 2 0 0 87 0 1 3 0 0 94 0 0 1 1 8 88 0 1
                                    1 0 24 0 1 2 0 18 0 15 1 1 0 95 0 1 1 17 65
                                    0 67 1 8 0 88 1 1 0 96 0 1 2 13 65 0 7 1 2
                                    27 18 86 0 1 3 15 0 0 7 7 1 3 15 0 0 37 37
                                    1 2 15 0 0 78 1 2 15 0 0 79 1 2 0 18 0 0 1
                                    0 8 75 1 1 0 18 0 1 0 0 0 1 3 0 7 0 21 21 1
                                    4 0 7 0 21 21 7 1 2 19 0 0 15 1 1 19 0 0 1
                                    3 20 0 0 84 85 1 2 20 0 0 84 1 3 20 0 0 71
                                    15 1 2 20 0 0 71 1 3 3 0 0 87 15 1 2 3 0 0
                                    87 1 1 0 7 0 1 1 0 0 37 39 1 0 18 0 1 1 0
                                    28 0 1 1 1 7 0 50 2 28 15 7 0 1 2 27 15 86
                                    0 1 1 0 0 0 1 1 24 72 0 77 1 12 63 0 1 2 0
                                    28 0 21 32 1 21 0 21 1 1 9 0 89 1 1 0 5 0
                                    41 1 0 0 7 1 1 0 33 0 35 0 3 15 17 2 27 18
                                    86 0 1 1 0 18 0 1 2 17 0 0 21 69 2 2 0 0 15
                                    1 2 0 0 0 88 1 0 0 0 11 1 1 7 0 54 0 2 0 14
                                    2 19 0 0 15 1 1 19 0 0 1 3 20 0 0 84 85 1 2
                                    20 0 0 84 1 3 20 0 0 71 15 1 2 20 0 0 71 1
                                    2 3 0 0 87 1 3 3 0 0 87 15 1 2 0 18 0 0 1 2
                                    17 0 0 7 1 2 22 0 0 0 1 1 22 0 0 1 2 0 0 0
                                    0 1 2 22 0 21 0 1 2 0 28 0 28 46 2 0 28 28
                                    0 48 2 0 0 7 0 1 2 0 0 0 7 1 2 0 0 0 0 1 2
                                    0 0 15 0 1 2 0 0 88 0 1 1 27 15 0 1)))))
           '|lookupComplete|)) 
