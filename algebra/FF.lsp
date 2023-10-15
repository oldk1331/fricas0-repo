
(DECLAIM (NOTINLINE |FiniteField;|)) 

(DEFUN |FiniteField| (&REST #1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteField|)
                                               '|domainEqualList|)
                    . #3=(|FiniteField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FiniteField|)))))))))) 

(DEFUN |FiniteField;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G138 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteField|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteField| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 48) . #2#)
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
    (|haddProp| |$ConstructorCache| '|FiniteField| (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtensionByPolynomial| 28
                                                  (NRTEVAL
                                                   (SPADCALL (QREFELT $ 7)
                                                             (QREFELT $ 11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 28)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 28)
              (0 . |createIrreduciblePoly|) (|OnePointCompletion| 9)
              (|Union| $ '"failed") (|Union| 15 '"failed")
              (|NonNegativeInteger|) (|List| $) (|InputForm|) (|Boolean|)
              (|Union| 30 '"failed") (|Matrix| $) (|Table| 9 15) (|Integer|)
              (|Record| (|:| |factor| 22) (|:| |exponent| 22)) (|List| 23)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 8 '"failed") (|SparseUnivariatePolynomial| $)
              (|PrimeField| 6) (|Matrix| 28) (|Vector| $) (|Vector| 28)
              (|CardinalNumber|) (|Union| 28 '"failed") (|Fraction| 22)
              (|Factored| $) (|Union| 16 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 38 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 16) (|:| |generator| $))
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
                 (|LeftOreRing|) (|Algebra| 34) (|CommutativeRing|)
                 (|EntireRing|) (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| (|PrimeField| 6)) (|Rng|) (|SemiRing|)
                 (|Module| (|PrimeField| 6)) (|Module| 34) (|Module| $$)
                 (|SemiRng|) (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 34 34) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 34)
                 (|LeftModule| 34) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|SetCategory|)
                 (|RetractableTo| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 47)
                 (|ConvertibleTo| 17))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
