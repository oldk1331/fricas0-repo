
(DECLAIM (NOTINLINE |FiniteFieldNormalBasis;|)) 

(DEFUN |FiniteFieldNormalBasis| (&REST #1=#:G144)
  (SPROG NIL
         (PROG (#2=#:G145)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasis|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldNormalBasis;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldNormalBasis|)))))))))) 

(DEFUN |FiniteFieldNormalBasis;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G143 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldNormalBasis|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldNormalBasis| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 51) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|PrimeField| |#1|)
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|PrimeField| |#1|) '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| (|PrimeField| |#1|)
                                                        '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasis| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldNormalBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 32
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 32) (|:| |index| 48)) (|Union| 27 31)
              (|PositiveInteger|) (|FiniteFieldFunctions| 32)
              (0 . |createLowComplexityNormalBasis|) (|Union| $ '"failed")
              (|Union| 16 '"failed") (|OnePointCompletion| 10)
              (|NonNegativeInteger|) (|List| $) (|Boolean|) (|InputForm|)
              (|Record| (|:| |factor| 25) (|:| |exponent| 25)) (|List| 20)
              (|Union| 33 '"failed") (|Matrix| $) (|Table| 10 16) (|Integer|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 32) (|Union| 27 '"failed")
              (|SparseUnivariatePolynomial| $) (|Matrix| 32)
              (|Vector| (|List| 8)) (|PrimeField| 6) (|Vector| $) (|Vector| 32)
              (|CardinalNumber|) (|Union| 32 '"failed") (|Fraction| 25)
              (|Factored| $) (|Union| 17 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 41 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 17) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  2 0 0 2 2 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL NIL |Algebra&| NIL
                |EntireRing&| |Algebra&| NIL NIL |DifferentialRing&| NIL
                |VectorSpace&| |Rng&| NIL |Module&| |Module&| |Module&| NIL NIL
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|ExtensionField| (|PrimeField| 6)) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| 37) (|CommutativeRing|)
                 (|EntireRing|) (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| (|PrimeField| 6)) (|Rng|) (|SemiRing|)
                 (|Module| (|PrimeField| 6)) (|Module| 37) (|Module| $$)
                 (|SemiRng|) (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 37 37) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 37)
                 (|LeftModule| 37) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|SetCategory|)
                 (|RetractableTo| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 50)
                 (|ConvertibleTo| 19))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
