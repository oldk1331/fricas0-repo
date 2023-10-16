
(DECLAIM (NOTINLINE |PrimeField;|)) 

(DEFUN |PrimeField| (#1=#:G141)
  (SPROG NIL
         (PROG (#2=#:G142)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimeField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimeField;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PrimeField|)))))))))) 

(DEFUN |PrimeField;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|PrimeField| DV$1))
          (LETT $ (GETREFV 45))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PrimeField| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (AND (|HasCategory| $ '(|Finite|)) (|augmentPredVector| $ 2))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
          (COND ((QREFELT $ 11))
                ('T (|error| "Argument to prime field must be a prime")))
          $))) 

(MAKEPROP '|PrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPrimeField| (NRTEVAL (QREFELT $ 6)))
              (|local| |#1|) (|Boolean|) (|Integer|) (|IntegerPrimesPackage| 8)
              (0 . |prime?|) '#:G104 (|Union| 20 '#1="failed") (|Matrix| $)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| $)
              (|PositiveInteger|) (|Union| 15 '"failed") (|Union| $ '"failed")
              (|OnePointCompletion| 16) (|Vector| $)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 8) (|:| |exponent| 14)) (|List| 22)
              (|Table| 16 14) (|Factored| 15) (|Union| 27 '#1#) (|List| 15)
              (|InputForm|) (|List| $) (|Union| 14 '"failed") (|Fraction| 8)
              (|Factored| $) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 33 '#2="failed") (|Union| 29 '#2#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 29) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 5 |zero?| 11 |unitNormal| 16 |unitCanonical| 21 |unit?| 26
              |transcendent?| 31 |transcendenceDegree| 36 |trace| 40
              |tableForDiscreteLogarithm| 51 |subtractIfCan| 56
              |squareFreePolynomial| 62 |squareFreePart| 67 |squareFree| 72
              |sqrt| 77 |solveLinearPolynomialEquation| 82 |smaller?| 88
              |sizeLess?| 94 |size| 100 |sample| 104 |rightRecip| 108
              |rightPower| 113 |retractIfCan| 125 |retract| 130 |represents|
              135 |representationType| 140 |rem| 144 |recip| 150 |random| 155
              |quo| 159 |principalIdeal| 165 |primitiveElement| 170
              |primitive?| 174 |primeFrobenius| 179 |prime?| 190 |order| 195
              |opposite?| 205 |one?| 211 |normalElement| 216 |normal?| 220
              |norm| 225 |nextItem| 236 |multiEuclidean| 241
              |minimalPolynomial| 247 |lookup| 258 |linearAssociatedOrder| 263
              |linearAssociatedLog| 268 |linearAssociatedExp| 279 |leftRecip|
              285 |leftPower| 290 |lcmCoef| 302 |lcm| 308 |latex| 319 |inv| 324
              |init| 329 |index| 333 |inGroundField?| 338 |hashUpdate!| 343
              |hash| 349 |generator| 354 |gcdPolynomial| 358 |gcd| 364
              |factorsOfCyclicGroupSize| 375 |factorSquareFreePolynomial| 379
              |factorPolynomial| 384 |factor| 389 |extensionDegree| 394
              |extendedEuclidean| 402 |exquo| 415 |expressIdealMember| 421
              |euclideanSize| 427 |enumerate| 432 |divide| 436 |discreteLog|
              442 |differentiate| 453 |degree| 464 |definingPolynomial| 474
              |createPrimitiveElement| 478 |createNormalElement| 482
              |coordinates| 486 |convert| 496 |conditionP| 506 |commutator| 511
              |coerce| 517 |charthRoot| 537 |characteristic| 547 |basis| 551
              |associator| 560 |associates?| 567 |antiCommutator| 573
              |annihilate?| 579 |algebraic?| 585 ^ 590 |Zero| 608 |One| 612
              |Frobenius| 616 D 627 = 638 / 644 - 650 + 661 * 667)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |DifferentialRing&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| |Module&| NIL
                NIL NIL |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL |Finite&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL |SetCategory&| NIL |RetractableTo&| NIL
                NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|FiniteFieldCategory|)
                 (|ExtensionField| $$) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 31) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|) (|Module| 31)
                 (|Module| $$) (|SemiRng|) (|BiModule| 31 31)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 31)
                 (|LeftModule| 31) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|Finite|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|CommutativeStar|) (|SetCategory|) (|ConvertibleTo| 8)
                 (|RetractableTo| $$) (|ConvertibleTo| 28) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 44))
              (|makeByteWordVec2| 44
                                  '(1 9 7 8 10 2 0 7 0 0 1 1 0 7 0 1 1 0 40 0 1
                                    1 0 0 0 1 1 0 7 0 1 1 0 7 0 1 0 0 14 1 2 2
                                    0 0 16 1 1 0 0 0 1 1 0 24 8 1 2 0 18 0 0 1
                                    1 0 25 15 1 1 0 0 0 1 1 0 32 0 1 1 0 0 0 1
                                    2 0 26 27 15 1 2 0 7 0 0 1 2 0 7 0 0 1 0 0
                                    14 1 0 0 0 1 1 0 18 0 1 2 0 0 0 14 1 2 0 0
                                    0 16 1 1 0 18 0 1 1 0 0 0 1 1 0 0 20 1 0 0
                                    21 1 2 0 0 0 0 1 1 0 18 0 1 0 0 0 1 2 0 0 0
                                    0 1 1 0 38 29 1 0 0 0 1 1 0 7 0 1 1 0 0 0 1
                                    2 0 0 0 14 1 1 0 7 0 1 1 0 16 0 1 1 0 19 0
                                    1 2 0 7 0 0 1 1 0 7 0 1 0 2 0 1 1 2 7 0 1 2
                                    2 0 0 16 1 1 0 0 0 1 1 0 18 0 1 2 0 35 29 0
                                    1 2 2 15 0 16 1 1 0 15 0 1 1 0 16 0 1 1 2
                                    15 0 1 1 2 15 0 1 2 2 17 0 0 1 2 2 0 0 15 1
                                    1 0 18 0 1 2 0 0 0 14 1 2 0 0 0 16 1 2 0 39
                                    0 0 1 1 0 0 29 1 2 0 0 0 0 1 1 0 41 0 1 1 0
                                    0 0 1 0 0 0 1 1 0 0 16 1 1 0 7 0 1 2 0 43
                                    43 0 1 1 0 42 0 1 0 2 0 1 2 0 15 15 15 1 1
                                    0 0 29 1 2 0 0 0 0 1 0 0 23 1 1 0 25 15 1 1
                                    0 25 15 1 1 0 32 0 1 0 0 19 1 0 0 16 1 3 0
                                    34 0 0 0 1 2 0 36 0 0 1 2 0 18 0 0 1 2 0 35
                                    29 0 1 1 0 14 0 1 0 0 29 1 2 0 37 0 0 1 1 0
                                    14 0 1 2 0 30 0 0 1 1 0 0 0 1 2 0 0 0 14 1
                                    1 0 19 0 1 1 0 16 0 1 0 0 15 1 0 0 0 1 0 2
                                    0 1 1 0 13 20 1 1 0 20 0 1 1 0 8 0 1 1 0 28
                                    0 1 1 1 12 13 1 2 0 0 0 0 1 1 0 0 31 1 1 0
                                    0 0 1 1 0 0 8 1 1 0 44 0 1 1 0 0 0 1 1 0 18
                                    0 1 0 0 14 1 1 0 20 16 1 0 0 20 1 3 0 0 0 0
                                    0 1 2 0 7 0 0 1 2 0 0 0 0 1 2 0 7 0 0 1 1 0
                                    7 0 1 2 0 0 0 8 1 2 0 0 0 14 1 2 0 0 0 16 1
                                    0 0 0 1 0 0 0 1 2 2 0 0 14 1 1 2 0 0 1 1 0
                                    0 0 1 2 0 0 0 14 1 2 0 7 0 0 1 2 0 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    31 1 2 0 0 31 0 1 2 0 0 14 0 1 2 0 0 8 0 1
                                    2 0 0 0 0 1 2 0 0 16 0 1)))))
           '|lookupComplete|)) 
