
(DECLAIM (NOTINLINE |InnerFiniteField;|)) 

(DEFUN |InnerFiniteField| (&REST #1=#:G141)
  (SPROG NIL
         (PROG (#2=#:G142)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerFiniteField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerFiniteField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerFiniteField|)))))))))) 

(DEFUN |InnerFiniteField;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G140 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|InnerFiniteField| DV$1 DV$2))
    (LETT $ (GETREFV 48))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|InnerPrimeField| |#1|)
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Finite|)))
                                        (OR
                                         (|HasCategory|
                                          (|InnerPrimeField| |#1|)
                                          '(|CharacteristicNonZero|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|InnerFiniteField| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CharacteristicNonZero|)) #1#
         (|augmentPredVector| $ 8))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|InnerFiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtension| 29 (NRTEVAL (QREFELT $ 7)))
              (|local| |#1|) (|local| |#2|) (|Union| 32 '#1="failed")
              (|Matrix| $) (|OnePointCompletion| 15) (|Union| $ '"failed")
              (|Union| 13 '"failed") (|NonNegativeInteger|) (|List| $)
              (|PositiveInteger|) (|InputForm|) (|Boolean|) (|Union| 19 '#1#)
              (|List| 20) (|SparseUnivariatePolynomial| $) (|Factored| 20)
              (|Table| 15 13) (|Integer|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 13)) (|List| 24)
              (|Union| 28 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 29)
              (|InnerPrimeField| (NRTEVAL (QREFELT $ 6))) (|Vector| 29)
              (|Matrix| 29) (|Vector| $) (|Union| 29 '"failed") (|Fraction| 23)
              (|Factored| $) (|Union| 14 '#2="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 38 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 14) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  2 0 0 2 2 0 0 0 0 0 0 0 0 0 0 0 2))
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
                |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL |RetractableTo&|
                NIL |SetCategory&| NIL NIL NIL NIL NIL NIL |BasicType&| NIL
                NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|InnerPrimeField| 6))
                 (|ExtensionField| (|InnerPrimeField| 6))
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 34) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| (|InnerPrimeField| 6)) (|Module| 34) (|Module| $$)
                 (|SemiRng|)
                 (|BiModule| (|InnerPrimeField| 6) (|InnerPrimeField| 6))
                 (|BiModule| 34 34) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| (|InnerPrimeField| 6))
                 (|LeftModule| (|InnerPrimeField| 6)) (|RightModule| 34)
                 (|LeftModule| 34) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|RetractableTo| (|InnerPrimeField| 6)) (|CommutativeStar|)
                 (|SetCategory|) (|CoercibleFrom| (|InnerPrimeField| 6))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 47) (|ConvertibleTo| 16))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
