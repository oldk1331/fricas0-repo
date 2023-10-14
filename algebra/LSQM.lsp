
(/VERSIONCHECK 2) 

(DEFUN |LSQM;elt;$2IR;1| (|x| |k| |l| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |k| |l| (QREFELT $ 13))) 

(DEFUN |LSQM;conv| (|v| $)
  (PROG (|z| #1=#:G134 |j| #2=#:G133 |i| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 6) (QREFELT $ 6) (|spadConstant| $ 15)
                      (QREFELT $ 18))
            . #3=(|LSQM;conv|))
      (LETT |z| 0 . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 6) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #3#)
                       (EXIT
                        (SPADCALL |cond| |i| |j|
                                  (SPADCALL |v| |z| (QREFELT $ 20))
                                  (QREFELT $ 21))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 22))))))) 

(DEFUN |LSQM;canonical_coordinates| (|a| $)
  (PROG (|z| #1=#:G141 |j| #2=#:G140 |i| |res|)
    (RETURN
     (SEQ
      (LETT |res| (MAKEARR1 (QREFELT $ 9) (|spadConstant| $ 15))
            . #3=(|LSQM;canonical_coordinates|))
      (LETT |z| 0 . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 6) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #3#)
                       (EXIT
                        (SPADCALL |res| |z|
                                  (SPADCALL |a| |i| |j| (QREFELT $ 14))
                                  (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |LSQM;coordinates;$VV;4| (|a| |b| $)
  (PROG (|canonical| #1=#:G148 |j| |bv| #2=#:G147 |i|)
    (RETURN
     (SEQ (LETT |canonical| 'T . #3=(|LSQM;coordinates;$VV;4|))
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 9) . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #2#) (NULL |canonical|)) (GO G191)))
               (SEQ
                (LETT |bv|
                      (|LSQM;canonical_coordinates|
                       (SPADCALL |b| |i| (QREFELT $ 26)) $)
                      . #3#)
                (LETT |canonical|
                      (COND
                       (|canonical|
                        (SPADCALL (SPADCALL |bv| |i| (QREFELT $ 27))
                                  (|spadConstant| $ 28) (QREFELT $ 30)))
                       ('T 'NIL))
                      . #3#)
                (EXIT
                 (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#) G190
                      (COND
                       ((OR (|greater_SI| |j| #1#) (NULL |canonical|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND ((EQL |j| |i|) "iterate")
                              ('T
                               (LETT |canonical|
                                     (COND
                                      (|canonical|
                                       (SPADCALL
                                        (SPADCALL |bv| |j| (QREFELT $ 27))
                                        (|spadConstant| $ 15) (QREFELT $ 30)))
                                      ('T 'NIL))
                                     . #3#)))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND (|canonical| (|LSQM;canonical_coordinates| |a| $))
                 ('T
                  (|error| "coordinates works only in canonical basis")))))))) 

(DEFUN |LSQM;convDM| (|v| $)
  (PROG (|sq|)
    (RETURN
     (SEQ (LETT |sq| (|LSQM;conv| |v| $) |LSQM;convDM|)
          (EXIT (SPADCALL |sq| (QREFELT $ 33))))))) 

(DEFUN |LSQM;basis;V;6| ($)
  (PROG (|res| |ldp| #1=#:G152 #2=#:G158 |i| #3=#:G157)
    (RETURN
     (SEQ (SETELT $ 9 (* (QREFELT $ 6) (QREFELT $ 6)))
          (LETT |ldp|
                (PROGN
                 (LETT #3# NIL . #4=(|LSQM;basis;V;6|))
                 (SEQ (LETT |i| 1 . #4#) (LETT #2# (QREFELT $ 9) . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i| . #4#)
                                  (|check_subtype| (> #1# 0)
                                                   '(|PositiveInteger|) #1#))
                                (QREFELT $ 35))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT
           (LETT |res|
                 (SPADCALL
                  (SPADCALL (CONS (|function| |LSQM;convDM|) $) |ldp|
                            (QREFELT $ 40))
                  (QREFELT $ 41))
                 . #4#)))))) 

(DEFUN |LSQM;someBasis;V;7| ($) (SPADCALL (QREFELT $ 42))) 

(DEFUN |LSQM;rank;Pi;8| ($) (* (QREFELT $ 6) (QREFELT $ 6))) 

(DECLAIM (NOTINLINE |LieSquareMatrix;|)) 

(DEFUN |LieSquareMatrix| (&REST #1=#:G184)
  (PROG ()
    (RETURN
     (PROG (#2=#:G185)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LieSquareMatrix|)
                                           '|domainEqualList|)
                . #3=(|LieSquareMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LieSquareMatrix;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|LieSquareMatrix|))))))))))) 

(DEFUN |LieSquareMatrix;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G183 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|LieSquareMatrix|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|LieSquareMatrix| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 79) . #2#)
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
                                          (LETT #1#
                                                (|HasCategory| |#2|
                                                               '(|DifferentialRing|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasCategory| |#2|
                                                          '(|CommutativeRing|))
                                           #1# (|HasCategory| |#2| '(|Ring|)))
                                          (|HasCategory| |#2| '(|Finite|))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|EuclideanDomain|))
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
                                            #1#)
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
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#2| '(|Ring|)))
                                          (AND #1#
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
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|LieSquareMatrix| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 1048576))
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 2097152))
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 4194304))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|AssociatedLieAlgebra| |#2| (|SquareMatrix| |#1| |#2|)))
      (QSETREFV $ 9 (* |#1| |#1|))
      $)))) 

(MAKEPROP '|LieSquareMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|AssociatedLieAlgebra| 7 10) (|local| |#1|)
              (|local| |#2|) '|Rep| '|n2| (|SquareMatrix| 6 7) (0 . |coerce|)
              (|Integer|) (5 . |elt|) |LSQM;elt;$2IR;1| (12 . |Zero|)
              (|NonNegativeInteger|) (|Matrix| 7) (16 . |new|)
              (|DirectProduct| 9 7) (23 . |elt|) (29 . |setelt|)
              (37 . |squareMatrix|) (|Vector| 7) (42 . |setelt|) (|Vector| $$)
              (49 . |elt|) (55 . |elt|) (61 . |One|) (|Boolean|) (65 . =)
              (|Vector| $) |LSQM;coordinates;$VV;4| (71 . |coerce|)
              (|PositiveInteger|) (76 . |unitVector|) (|List| $$)
              (|Mapping| $$ 19) (|List| 19) (|ListFunctions2| 19 $$)
              (81 . |map|) (87 . |vector|) |LSQM;basis;V;6|
              |LSQM;someBasis;V;7| |LSQM;rank;Pi;8| (|List| 7) (|Equation| 7)
              (|List| 46) (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 12)))
              (|Matrix| $) (|Matrix| 12) (|Symbol|) (|List| 51) (|List| 16)
              (|Mapping| 29 7) (|Mapping| 7 7) (|List| 71)
              (|SparseUnivariatePolynomial| (|Polynomial| 7))
              (|Union| $ '"failed") (|List| $) (|InputForm|) (|List| 23)
              (|SparseUnivariatePolynomial| 7)
              (|Record| (|:| |particular| $) (|:| |basis| 59))
              (|Union| 63 '"failed") (|Union| 66 '#1="failed") (|Fraction| 12)
              (|Union| 12 '#1#) (|Record| (|:| |mat| 17) (|:| |vec| 23))
              (|Vector| 17) (|List| (|Polynomial| 7)) (|DirectProduct| 6 7)
              (|Union| 7 '#1#) (|List| 45) (|Mapping| 7 7 7) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 92 |zero?| 98 |unit| 103 |trace| 107 |symmetric?| 112
              |subtractIfCan| 117 |structuralConstants| 123 |square?| 132
              |someBasis| 137 |size?| 141 |size| 147 |scalarMatrix| 151
              |sample| 156 |rowEchelon| 160 |row| 165 |rightUnits| 171
              |rightUnit| 175 |rightTraceMatrix| 179 |rightTrace| 188
              |rightRegularRepresentation| 193 |rightRecip| 204
              |rightRankPolynomial| 209 |rightPower| 213 |rightNorm| 219
              |rightMinimalPolynomial| 224 |rightDiscriminant| 229
              |rightCharacteristicPolynomial| 238 |rightAlternative?| 243
              |retractIfCan| 247 |retract| 262 |represents| 277 |reducedSystem|
              288 |recip| 310 |rank| 315 |random| 324 |qelt| 328
              |powerAssociative?| 335 |plenaryPower| 339 |parts| 345 |one?| 350
              |nullity| 355 |nullSpace| 360 |nrows| 365
              |noncommutativeJordanAlgebra?| 370 |ncols| 374 |more?| 379
              |minordet| 385 |minRowIndex| 390 |minColIndex| 395 |members| 400
              |member?| 405 |maxRowIndex| 411 |maxColIndex| 416 |matrix| 421
              |map!| 426 |map| 432 |lookup| 445 |listOfLists| 450 |lieAlgebra?|
              455 |lieAdmissible?| 459 |less?| 463 |leftUnits| 469 |leftUnit|
              473 |leftTraceMatrix| 477 |leftTrace| 486
              |leftRegularRepresentation| 491 |leftRecip| 502
              |leftRankPolynomial| 507 |leftPower| 511 |leftNorm| 517
              |leftMinimalPolynomial| 522 |leftDiscriminant| 527
              |leftCharacteristicPolynomial| 536 |leftAlternative?| 541 |latex|
              545 |jordanAlgebra?| 550 |jordanAdmissible?| 554
              |jacobiIdentity?| 558 |inverse| 562 |index| 567 |hashUpdate!| 572
              |hash| 578 |flexible?| 583 |exquo| 587 |every?| 593 |eval| 599
              |eq?| 625 |enumerate| 631 |empty?| 635 |empty| 640 |elt| 644
              |differentiate| 665 |diagonalProduct| 715 |diagonalMatrix| 720
              |diagonal?| 725 |diagonal| 730 |determinant| 735 |count| 740
              |copy| 752 |coordinates| 757 |convert| 779
              |conditionsForIdempotents| 794 |commutator| 803 |commutative?|
              809 |columnSpace| 813 |column| 818 |coerce| 824 |characteristic|
              849 |basis| 853 |associatorDependence| 857 |associator| 861
              |associative?| 868 |apply| 872 |any?| 878 |antisymmetric?| 884
              |antiCommutator| 889 |antiCommutative?| 895 |antiAssociative?|
              899 |alternative?| 903 ^ 907 |Zero| 925 |Pfaffian| 929 |One| 934
              D 938 = 988 / 994 - 1000 + 1011 * 1017 |#| 1065)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 1 3 3 0 3 4 5 6 0 7 0 0 0 3 7 0 0 2
                                  0 0 2 0 0 0 0 8 0 0 0 14 0 0 0 0 0 0 8 14 9
                                  10 3))
            (CONS
             '#(|FramedNonAssociativeAlgebra&| |SquareMatrixCategory&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |RectangularMatrixCategory&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| |NonAssociativeRng&| NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |Monad&| |HomogeneousAggregate&| |AbelianSemiGroup&|
                |SemiGroup&| |Finite&| |FullyRetractableTo&| |Aggregate&|
                |SetCategory&| |Evalable&| NIL |RetractableTo&| NIL NIL
                |BasicType&| NIL NIL |InnerEvalable&| |RetractableTo&|
                |RetractableTo&| NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 7)
                 (|SquareMatrixCategory| 6 7 (|DirectProduct| 6 7)
                                         (|DirectProduct| 6 7))
                 (|FiniteRankNonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| 7)
                 (|RectangularMatrixCategory| 6 6 7 (|DirectProduct| 6 7)
                                              (|DirectProduct| 6 7))
                 (|Algebra| 7) (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7)
                 (|LinearlyExplicitRingOver| 7) (|LinearlyExplicitRingOver| 12)
                 (|PartialDifferentialRing| 51) (|DifferentialRing|)
                 (|BiModule| 7 7) (|Ring|) (|NonAssociativeRng|)
                 (|RightModule| 7) (|LeftModule| 7) (|LeftModule| $$) (|Rng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|SemiRng|) (|AbelianMonoid|) (|Monoid|) (|Monad|)
                 (|HomogeneousAggregate| 7) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Finite|) (|FullyRetractableTo| 7) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 7) (|CoercibleTo| (|Matrix| 7))
                 (|RetractableTo| 7) (|finiteAggregate|) (|Type|) (|BasicType|)
                 (|CoercibleTo| 78) (|ConvertibleTo| 60) (|InnerEvalable| 7 7)
                 (|RetractableTo| 66) (|RetractableTo| 12) (|unitsKnown|))
              (|makeByteWordVec2| 78
                                  '(1 8 10 0 11 3 10 7 0 12 12 13 0 7 0 15 3 17
                                    0 16 16 7 18 2 19 7 0 12 20 4 17 7 0 12 12
                                    7 21 1 10 0 17 22 3 23 7 0 12 7 24 2 25 2 0
                                    12 26 2 23 7 0 12 27 0 7 0 28 2 7 29 0 0 30
                                    1 8 0 10 33 1 19 0 34 35 2 39 36 37 38 40 1
                                    25 0 36 41 2 0 29 0 0 1 1 0 29 0 1 0 20 58
                                    1 1 0 7 0 1 1 0 29 0 1 2 0 58 0 0 1 1 0 69
                                    31 1 0 0 69 1 1 0 29 0 1 0 0 31 43 2 0 29 0
                                    16 1 0 8 16 1 1 0 0 7 1 0 0 0 1 1 11 0 0 1
                                    2 0 71 0 12 1 0 20 64 1 0 20 58 1 1 0 17 31
                                    1 0 0 17 1 1 0 7 0 1 2 0 17 0 31 1 1 0 17 0
                                    1 1 20 58 0 1 0 19 57 1 2 0 0 0 34 1 1 0 7
                                    0 1 1 20 62 0 1 1 0 7 31 1 0 0 7 1 1 0 62 0
                                    1 0 0 29 1 1 9 65 0 1 1 10 67 0 1 1 0 72 0
                                    1 1 9 66 0 1 1 10 12 0 1 1 0 7 0 1 2 0 0 23
                                    31 1 1 0 0 23 1 2 15 48 49 31 1 1 15 50 49
                                    1 1 3 17 49 1 2 3 68 49 31 1 1 2 58 0 1 1
                                    20 16 0 1 0 0 34 44 0 8 0 1 3 0 7 0 12 12 1
                                    0 0 29 1 2 0 0 0 34 1 1 22 45 0 1 1 2 29 0
                                    1 1 20 16 0 1 1 20 56 0 1 1 0 16 0 1 0 0 29
                                    1 1 0 16 0 1 2 0 29 0 16 1 1 1 7 0 1 1 0 12
                                    0 1 1 0 12 0 1 1 22 45 0 1 2 23 29 7 0 1 1
                                    0 12 0 1 1 0 12 0 1 1 0 0 73 1 2 21 0 55 0
                                    1 2 0 0 55 0 1 3 0 0 74 0 0 1 1 8 34 0 1 1
                                    0 73 0 1 0 0 29 1 0 0 29 1 2 0 29 0 16 1 0
                                    20 64 1 0 20 58 1 1 0 17 31 1 0 0 17 1 1 0
                                    7 0 1 2 0 17 0 31 1 1 0 17 0 1 1 20 58 0 1
                                    0 19 57 1 2 0 0 0 34 1 1 0 7 0 1 1 20 62 0
                                    1 1 0 7 31 1 0 0 7 1 1 0 62 0 1 0 0 29 1 1
                                    0 75 0 1 0 0 29 1 0 0 29 1 0 0 29 1 1 19 58
                                    0 1 1 8 0 34 1 2 0 77 77 0 1 1 0 76 0 1 0 0
                                    29 1 2 20 58 0 7 1 2 22 29 54 0 1 3 13 0 0
                                    45 45 1 2 13 0 0 46 1 3 13 0 0 7 7 1 2 13 0
                                    0 47 1 2 0 29 0 0 1 0 8 59 1 1 0 29 0 1 0 0
                                    0 1 2 0 7 0 12 1 3 0 7 0 12 12 14 4 0 7 0
                                    12 12 7 1 2 16 0 0 16 1 1 16 0 0 1 3 17 0 0
                                    52 53 1 3 17 0 0 51 16 1 2 17 0 0 51 1 2 17
                                    0 0 52 1 2 3 0 0 55 1 3 3 0 0 55 16 1 1 0 7
                                    0 1 1 0 0 45 1 1 0 29 0 1 1 0 71 0 1 1 1 7
                                    0 1 2 23 16 7 0 1 2 22 16 54 0 1 1 0 0 0 1
                                    2 0 23 0 31 32 2 0 17 31 31 1 1 0 23 0 1 1
                                    0 17 31 1 1 8 60 0 1 1 0 23 0 1 1 0 0 23 1
                                    1 0 70 31 1 0 0 70 1 2 0 0 0 0 1 0 0 29 1 1
                                    11 56 0 1 2 0 71 0 12 1 1 18 0 12 1 1 9 0
                                    66 1 1 0 17 0 1 1 0 0 7 1 1 0 78 0 1 0 3 16
                                    1 0 0 31 42 0 20 61 1 3 0 0 0 0 0 1 0 0 29
                                    1 2 0 0 17 0 1 2 22 29 54 0 1 1 0 29 0 1 2
                                    0 0 0 0 1 0 0 29 1 0 0 29 1 0 0 29 1 2 19 0
                                    0 12 1 2 2 0 0 16 1 2 0 0 0 34 1 0 0 0 1 1
                                    1 7 0 1 0 2 0 1 2 16 0 0 16 1 1 16 0 0 1 3
                                    17 0 0 51 16 1 3 17 0 0 52 53 1 2 17 0 0 52
                                    1 2 17 0 0 51 1 2 3 0 0 55 1 3 3 0 0 55 16
                                    1 2 0 29 0 0 1 2 19 0 0 7 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 12 0 1 2 0 71 71 0
                                    1 2 0 71 0 71 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0
                                    0 0 0 1 2 0 0 16 0 1 2 0 0 34 0 1 1 22 16 0
                                    1)))))
           '|lookupComplete|)) 
