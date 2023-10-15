
(DECLAIM (NOTINLINE |FiniteFieldCyclicGroupExtension;|)) 

(DEFUN |FiniteFieldCyclicGroupExtension| (&REST #1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldCyclicGroupExtension|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldCyclicGroupExtension|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldCyclicGroupExtension;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldCyclicGroupExtension|)))))))))) 

(DEFUN |FiniteFieldCyclicGroupExtension;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G138 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldCyclicGroupExtension|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldCyclicGroupExtension| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 48) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FiniteFieldCyclicGroupExtension|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|FiniteFieldCyclicGroupExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldCyclicGroupExtensionByPolynomial| 6
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT $ 7)
                                                               (QREFELT $
                                                                        11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 6)
              (0 . |createPrimitivePoly|) (|Union| $ '"failed")
              (|Union| 15 '"failed") (|OnePointCompletion| 9)
              (|NonNegativeInteger|) (|List| $) (|Boolean|) (|InputForm|)
              (|Record| (|:| |factor| 24) (|:| |exponent| 24)) (|List| 19)
              (|Union| 31 '"failed") (|Matrix| $) (|Table| 9 15) (|Integer|)
              (|Union| 8 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| $) (|PrimitiveArray| 45)
              (|Vector| 6) (|Matrix| 6) (|Vector| $) (|CardinalNumber|)
              (|Union| 6 '"failed") (|Fraction| 24) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 36 '#1="failed") (|Union| 16 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
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
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| 34)
                 (|CommutativeRing|) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 34) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 34 34)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 34) (|LeftModule| 34)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 47)
                 (|ConvertibleTo| 18))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
