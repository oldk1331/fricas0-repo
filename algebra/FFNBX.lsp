
(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtension;|)) 

(DEFUN |FiniteFieldNormalBasisExtension| (&REST #1=#:G144)
  (SPROG NIL
         (PROG (#2=#:G145)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtension|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasisExtension|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldNormalBasisExtension;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtension|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtension;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G143 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldNormalBasisExtension|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FiniteFieldNormalBasisExtension| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 50) . #2#)
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
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasisExtension|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
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
              (|Record| (|:| |value| 6) (|:| |index| 47)) (|Union| 27 31)
              (|PositiveInteger|) (|FiniteFieldFunctions| 6)
              (0 . |createLowComplexityNormalBasis|) (|Union| $ '"failed")
              (|Union| 16 '"failed") (|OnePointCompletion| 10)
              (|NonNegativeInteger|) (|List| $) (|Boolean|) (|InputForm|)
              (|Record| (|:| |factor| 25) (|:| |exponent| 25)) (|List| 20)
              (|Union| 32 '"failed") (|Matrix| $) (|Table| 10 16) (|Integer|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| 6) (|Union| 27 '"failed")
              (|SparseUnivariatePolynomial| $) (|Matrix| 6)
              (|Vector| (|List| 8)) (|Vector| $) (|Vector| 6)
              (|CardinalNumber|) (|Union| 6 '"failed") (|Fraction| 25)
              (|Factored| $) (|Union| 17 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 40 '#1#)
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
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| 36)
                 (|CommutativeRing|) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 36) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 36 36)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 36) (|LeftModule| 36)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 49)
                 (|ConvertibleTo| 19))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
