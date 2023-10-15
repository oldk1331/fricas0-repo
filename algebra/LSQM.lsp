
(SDEFUN |LSQM;elt;$2IR;1| ((|x| $) (|k| . #1=(|Integer|)) (|l| . #1#) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |k| |l| (QREFELT $ 13))) 

(SDEFUN |LSQM;conv| ((|v| |DirectProduct| |n2| R) ($ |SquareMatrix| |n| R))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G111 NIL) (|j| NIL) (#2=#:G110 NIL) (|i| NIL)
          (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT $ 6) (QREFELT $ 6)
                              (|spadConstant| $ 15))
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
                                      (SPADCALL |v| |z| (QREFELT $ 17))
                                      (QREFELT $ 19))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT $ 20)))))) 

(SDEFUN |LSQM;canonical_coordinates| ((|a| $) ($ |Vector| R))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G118 NIL) (|j| NIL) (#2=#:G117 NIL) (|i| NIL)
          (|res| (|Vector| R)))
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
                                      (QREFELT $ 22))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LSQM;coordinates;$VV;4| ((|a| $) (|b| |Vector| $) ($ |Vector| R))
        (SPROG
         ((|canonical| (|Boolean|)) (#1=#:G125 NIL) (|j| NIL)
          (|bv| (|Vector| R)) (#2=#:G124 NIL) (|i| NIL))
         (SEQ (LETT |canonical| 'T . #3=(|LSQM;coordinates;$VV;4|))
              (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 9) . #3#) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (NULL |canonical|)) (GO G191)))
                   (SEQ
                    (LETT |bv|
                          (|LSQM;canonical_coordinates|
                           (SPADCALL |b| |i| (QREFELT $ 24)) $)
                          . #3#)
                    (LETT |canonical|
                          (COND
                           (|canonical|
                            (SPADCALL (SPADCALL |bv| |i| (QREFELT $ 25))
                                      (|spadConstant| $ 26) (QREFELT $ 28)))
                           ('T 'NIL))
                          . #3#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#)
                          G190
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
                                            (SPADCALL |bv| |j| (QREFELT $ 25))
                                            (|spadConstant| $ 15)
                                            (QREFELT $ 28)))
                                          ('T 'NIL))
                                         . #3#)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|canonical| (|LSQM;canonical_coordinates| |a| $))
                     ('T
                      (|error|
                       "coordinates works only in canonical basis"))))))) 

(SDEFUN |LSQM;convDM| ((|v| |DirectProduct| |n2| R) ($ $))
        (SPROG ((|sq| (|SquareMatrix| |n| R)))
               (SEQ (LETT |sq| (|LSQM;conv| |v| $) |LSQM;convDM|)
                    (EXIT (SPADCALL |sq| (QREFELT $ 31)))))) 

(SDEFUN |LSQM;basis;V;6| (($ |Vector| $))
        (SPROG
         ((|res| (|Vector| $)) (|ldp| (|List| (|DirectProduct| |n2| R)))
          (#1=#:G129 NIL) (#2=#:G135 NIL) (|i| NIL) (#3=#:G134 NIL))
         (SEQ (SETELT $ 9 (* (QREFELT $ 6) (QREFELT $ 6)))
              (LETT |ldp|
                    (PROGN
                     (LETT #3# NIL . #4=(|LSQM;basis;V;6|))
                     (SEQ (LETT |i| 1 . #4#) (LETT #2# (QREFELT $ 9) . #4#)
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL
                                    (PROG1 (LETT #1# |i| . #4#)
                                      (|check_subtype2| (> #1# 0)
                                                        '(|PositiveInteger|)
                                                        '(|NonNegativeInteger|)
                                                        #1#))
                                    (QREFELT $ 33))
                                   #3#)
                                  . #4#)))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (EXIT
               (LETT |res|
                     (SPADCALL
                      (SPADCALL (CONS (|function| |LSQM;convDM|) $) |ldp|
                                (QREFELT $ 38))
                      (QREFELT $ 39))
                     . #4#))))) 

(SDEFUN |LSQM;someBasis;V;7| (($ |Vector| $)) (SPADCALL (QREFELT $ 40))) 

(SDEFUN |LSQM;rank;Pi;8| (($ |PositiveInteger|))
        (* (QREFELT $ 6) (QREFELT $ 6))) 

(DECLAIM (NOTINLINE |LieSquareMatrix;|)) 

(DEFUN |LieSquareMatrix| (&REST #1=#:G161)
  (SPROG NIL
         (PROG (#2=#:G162)
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
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LieSquareMatrix|)))))))))) 

(DEFUN |LieSquareMatrix;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G160 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|LieSquareMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|LieSquareMatrix| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 78) . #2#)
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
                                         (|HasCategory| |#2| '(|SetCategory|)))
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
    $))) 

(MAKEPROP '|LieSquareMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|AssociatedLieAlgebra| 7 10) (|local| |#1|)
              (|local| |#2|) '|Rep| '|n2| (|SquareMatrix| 6 7) (0 . |coerce|)
              (|Integer|) (5 . |elt|) |LSQM;elt;$2IR;1| (12 . |Zero|)
              (|DirectProduct| 9 7) (16 . |elt|) (|Matrix| 7) (22 . |setelt!|)
              (30 . |squareMatrix|) (|Vector| 7) (35 . |setelt!|) (|Vector| $$)
              (42 . |elt|) (48 . |elt|) (54 . |One|) (|Boolean|) (58 . =)
              (|Vector| $) |LSQM;coordinates;$VV;4| (64 . |coerce|)
              (|PositiveInteger|) (69 . |unitVector|) (|List| $$)
              (|Mapping| $$ 16) (|List| 16) (|ListFunctions2| 16 $$)
              (74 . |map|) (80 . |vector|) |LSQM;basis;V;6|
              |LSQM;someBasis;V;7| |LSQM;rank;Pi;8| (|NonNegativeInteger|)
              (|List| 7) (|Equation| 7) (|List| 45)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 12))) (|Matrix| $)
              (|Matrix| 12) (|List| 52) (|List| 43) (|Symbol|) (|Mapping| 27 7)
              (|Mapping| 7 7) (|List| 70)
              (|SparseUnivariatePolynomial| (|Polynomial| 7))
              (|Union| $ '"failed") (|List| $) (|InputForm|)
              (|SparseUnivariatePolynomial| 7) (|List| 21)
              (|Record| (|:| |particular| $) (|:| |basis| 58))
              (|Union| 62 '"failed") (|Union| 65 '#1="failed") (|Fraction| 12)
              (|Union| 12 '#1#) (|Record| (|:| |mat| 18) (|:| |vec| 21))
              (|Vector| 18) (|List| (|Polynomial| 7)) (|DirectProduct| 6 7)
              (|Union| 7 '#1#) (|List| 44) (|Mapping| 7 7 7) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 85 |zero?| 91 |unit| 96 |trace| 100 |symmetric?| 105
              |subtractIfCan| 110 |structuralConstants| 116 |square?| 125
              |someBasis| 130 |size?| 134 |size| 140 |scalarMatrix| 144
              |sample| 149 |rowEchelon| 153 |row| 158 |rightUnits| 164
              |rightUnit| 168 |rightTraceMatrix| 172 |rightTrace| 181
              |rightRegularRepresentation| 186 |rightRecip| 197
              |rightRankPolynomial| 202 |rightPower| 206 |rightNorm| 212
              |rightMinimalPolynomial| 217 |rightDiscriminant| 222
              |rightCharacteristicPolynomial| 231 |rightAlternative?| 236
              |retractIfCan| 240 |retract| 255 |represents| 270 |reducedSystem|
              281 |recip| 303 |rank| 308 |random| 317 |qelt| 321
              |powerAssociative?| 328 |plenaryPower| 332 |parts| 338
              |opposite?| 343 |one?| 349 |nullity| 354 |nullSpace| 359 |nrows|
              364 |noncommutativeJordanAlgebra?| 369 |ncols| 373 |more?| 378
              |minordet| 384 |minRowIndex| 389 |minColIndex| 394 |members| 399
              |member?| 404 |maxRowIndex| 410 |maxColIndex| 415 |matrix| 420
              |map!| 425 |map| 431 |lookup| 444 |listOfLists| 449 |lieAlgebra?|
              454 |lieAdmissible?| 458 |less?| 462 |leftUnits| 468 |leftUnit|
              472 |leftTraceMatrix| 476 |leftTrace| 485
              |leftRegularRepresentation| 490 |leftRecip| 501
              |leftRankPolynomial| 506 |leftPower| 510 |leftNorm| 516
              |leftMinimalPolynomial| 521 |leftDiscriminant| 526
              |leftCharacteristicPolynomial| 535 |leftAlternative?| 540 |latex|
              544 |jordanAlgebra?| 549 |jordanAdmissible?| 553
              |jacobiIdentity?| 557 |inverse| 561 |index| 566 |hashUpdate!| 571
              |hash| 577 |flexible?| 582 |exquo| 586 |every?| 592 |eval| 598
              |eq?| 624 |enumerate| 630 |empty?| 634 |empty| 639 |elt| 643
              |differentiate| 664 |diagonalProduct| 714 |diagonalMatrix| 719
              |diagonal?| 724 |diagonal| 729 |determinant| 734 |count| 739
              |copy| 751 |coordinates| 756 |convert| 778
              |conditionsForIdempotents| 793 |commutator| 802 |commutative?|
              808 |columnSpace| 812 |column| 817 |coerce| 823 |characteristic|
              848 |basis| 852 |associatorDependence| 856 |associator| 860
              |associative?| 867 |apply| 871 |any?| 877 |antisymmetric?| 883
              |antiCommutator| 888 |antiCommutative?| 894 |antiAssociative?|
              898 |annihilate?| 902 |alternative?| 908 ^ 912 |Zero| 930
              |Pfaffian| 934 |One| 939 D 943 = 993 / 999 - 1005 + 1016 * 1022
              |#| 1070)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 1 3 3 0 3 4 5 6 0 7 0 0 0 3 7 0 0 2
                                  0 0 0 2 0 0 0 0 8 0 0 0 14 0 0 0 0 0 0 8 14 9
                                  10 3))
            (CONS
             '#(|FramedNonAssociativeAlgebra&| |SquareMatrixCategory&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |RectangularMatrixCategory&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| |NonAssociativeRng&| NIL NIL
                NIL |Rng&| |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |Monoid&| |Magma&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| |SemiGroup&|
                |Finite&| |FullyRetractableTo&| |Aggregate&| |SetCategory&|
                |Evalable&| NIL |RetractableTo&| NIL NIL |BasicType&| NIL NIL
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL)
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
                 (|PartialDifferentialRing| 52) (|DifferentialRing|)
                 (|BiModule| 7 7) (|Ring|) (|NonAssociativeRng|)
                 (|RightModule| 7) (|LeftModule| 7) (|LeftModule| $$) (|Rng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|SemiRng|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|Monoid|) (|Magma|) (|HomogeneousAggregate| 7)
                 (|AbelianSemiGroup|) (|SemiGroup|) (|Finite|)
                 (|FullyRetractableTo| 7) (|Aggregate|) (|SetCategory|)
                 (|Evalable| 7) (|CoercibleTo| (|Matrix| 7))
                 (|RetractableTo| 7) (|finiteAggregate|) (|Type|) (|BasicType|)
                 (|CoercibleTo| 77) (|ConvertibleTo| 59) (|InnerEvalable| 7 7)
                 (|RetractableTo| 65) (|RetractableTo| 12) (|unitsKnown|))
              (|makeByteWordVec2| 77
                                  '(1 8 10 0 11 3 10 7 0 12 12 13 0 7 0 15 2 16
                                    7 0 12 17 4 18 7 0 12 12 7 19 1 10 0 18 20
                                    3 21 7 0 12 7 22 2 23 2 0 12 24 2 21 7 0 12
                                    25 0 7 0 26 2 7 27 0 0 28 1 8 0 10 31 1 16
                                    0 32 33 2 37 34 35 36 38 1 23 0 34 39 2 0
                                    27 0 0 1 1 0 27 0 1 0 20 57 1 1 0 7 0 1 1 0
                                    27 0 1 2 0 57 0 0 1 1 0 68 29 1 0 0 68 1 1
                                    0 27 0 1 0 0 29 41 2 0 27 0 43 1 0 8 43 1 1
                                    0 0 7 1 0 0 0 1 1 11 0 0 1 2 0 70 0 12 1 0
                                    20 63 1 0 20 57 1 1 0 18 29 1 0 0 18 1 1 0
                                    7 0 1 2 0 18 0 29 1 1 0 18 0 1 1 20 57 0 1
                                    0 19 56 1 2 0 0 0 32 1 1 0 7 0 1 1 20 60 0
                                    1 1 0 7 29 1 0 0 7 1 1 0 60 0 1 0 0 27 1 1
                                    9 64 0 1 1 10 66 0 1 1 0 71 0 1 1 9 65 0 1
                                    1 10 12 0 1 1 0 7 0 1 2 0 0 21 29 1 1 0 0
                                    21 1 2 15 47 48 29 1 1 15 49 48 1 1 3 18 48
                                    1 2 3 67 48 29 1 1 2 57 0 1 1 20 43 0 1 0 0
                                    32 42 0 8 0 1 3 0 7 0 12 12 1 0 0 27 1 2 0
                                    0 0 32 1 1 22 44 0 1 2 0 27 0 0 1 1 2 27 0
                                    1 1 20 43 0 1 1 20 55 0 1 1 0 43 0 1 0 0 27
                                    1 1 0 43 0 1 2 0 27 0 43 1 1 1 7 0 1 1 0 12
                                    0 1 1 0 12 0 1 1 22 44 0 1 2 23 27 7 0 1 1
                                    0 12 0 1 1 0 12 0 1 1 0 0 72 1 2 21 0 54 0
                                    1 2 0 0 54 0 1 3 0 0 73 0 0 1 1 8 32 0 1 1
                                    0 72 0 1 0 0 27 1 0 0 27 1 2 0 27 0 43 1 0
                                    20 63 1 0 20 57 1 1 0 18 29 1 0 0 18 1 1 0
                                    7 0 1 2 0 18 0 29 1 1 0 18 0 1 1 20 57 0 1
                                    0 19 56 1 2 0 0 0 32 1 1 0 7 0 1 1 20 60 0
                                    1 1 0 7 29 1 0 0 7 1 1 0 60 0 1 0 0 27 1 1
                                    0 74 0 1 0 0 27 1 0 0 27 1 0 0 27 1 1 19 57
                                    0 1 1 8 0 32 1 2 0 76 76 0 1 1 0 75 0 1 0 0
                                    27 1 2 20 57 0 7 1 2 22 27 53 0 1 3 13 0 0
                                    44 44 1 2 13 0 0 45 1 3 13 0 0 7 7 1 2 13 0
                                    0 46 1 2 0 27 0 0 1 0 8 58 1 1 0 27 0 1 0 0
                                    0 1 2 0 7 0 12 1 3 0 7 0 12 12 14 4 0 7 0
                                    12 12 7 1 2 16 0 0 43 1 1 16 0 0 1 3 17 0 0
                                    52 43 1 3 17 0 0 50 51 1 2 17 0 0 50 1 2 17
                                    0 0 52 1 2 3 0 0 54 1 3 3 0 0 54 43 1 1 0 7
                                    0 1 1 0 0 44 1 1 0 27 0 1 1 0 70 0 1 1 1 7
                                    0 1 2 23 43 7 0 1 2 22 43 53 0 1 1 0 0 0 1
                                    2 0 21 0 29 30 2 0 18 29 29 1 1 0 18 29 1 1
                                    0 21 0 1 1 8 59 0 1 1 0 0 21 1 1 0 21 0 1 1
                                    0 69 29 1 0 0 69 1 2 0 0 0 0 1 0 0 27 1 1
                                    11 55 0 1 2 0 70 0 12 1 1 18 0 12 1 1 9 0
                                    65 1 1 0 18 0 1 1 0 0 7 1 1 0 77 0 1 0 3 43
                                    1 0 0 29 40 0 20 61 1 3 0 0 0 0 0 1 0 0 27
                                    1 2 0 0 18 0 1 2 22 27 53 0 1 1 0 27 0 1 2
                                    0 0 0 0 1 0 0 27 1 0 0 27 1 2 3 27 0 0 1 0
                                    0 27 1 2 19 0 0 12 1 2 2 0 0 43 1 2 0 0 0
                                    32 1 0 0 0 1 1 1 7 0 1 0 2 0 1 2 16 0 0 43
                                    1 1 16 0 0 1 3 17 0 0 50 51 1 2 17 0 0 50 1
                                    3 17 0 0 52 43 1 2 17 0 0 52 1 3 3 0 0 54
                                    43 1 2 3 0 0 54 1 2 0 27 0 0 1 2 19 0 0 7 1
                                    2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 12
                                    0 1 2 0 70 70 0 1 2 0 70 0 70 1 2 0 0 0 7 1
                                    2 0 0 7 0 1 2 0 0 43 0 1 2 0 0 0 0 1 2 0 0
                                    32 0 1 1 22 43 0 1)))))
           '|lookupComplete|)) 
