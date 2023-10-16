
(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtension;|)) 

(DEFUN |FiniteFieldNormalBasisExtension| (&REST #1=#:G147)
  (SPROG NIL
         (PROG (#2=#:G148)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtension|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldNormalBasisExtension;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtension|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtension;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G146 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FiniteFieldNormalBasisExtension| DV$1 DV$2))
    (LETT $ (GETREFV 52))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasisExtension|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND #1# (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 8))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldNormalBasisExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 6
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 6) (|:| |index| 49)) (|Union| 32 34)
              (|PositiveInteger|) (|FiniteFieldFunctions| 6)
              (0 . |createLowComplexityNormalBasis|) (|Union| 36 '#1="failed")
              (|Matrix| $) (|Union| $ '"failed") (|Union| 18 '"failed")
              (|OnePointCompletion| 10) (|NonNegativeInteger|) (|List| $)
              (|Boolean|) (|InputForm|) (|Union| 23 '#1#) (|List| 24)
              (|SparseUnivariatePolynomial| $) (|Factored| 24) (|Table| 10 18)
              (|Integer|) (|Record| (|:| |factor| 27) (|:| |exponent| 18))
              (|List| 28) (|Union| 32 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 6) (|Matrix| 6)
              (|Vector| (|List| 8)) (|Vector| 6) (|Vector| $)
              (|Union| 6 '"failed") (|Fraction| 27) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 40 '#2="failed") (|Union| 19 '#2#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 19) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  2 0 0 2 2 0 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL NIL |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |DifferentialRing&| NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 38) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 6) (|Module| 38) (|Module| $$) (|SemiRng|)
                 (|BiModule| 6 6) (|BiModule| 38 38) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 38) (|LeftModule| 38) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 51) (|ConvertibleTo| 21))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
