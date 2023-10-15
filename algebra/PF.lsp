
(DECLAIM (NOTINLINE |PrimeField;|)) 

(DEFUN |PrimeField| (#1=#:G138)
  (SPROG NIL
         (PROG (#2=#:G139)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimeField|)
                                               '|domainEqualList|)
                    . #3=(|PrimeField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimeField;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PrimeField|)))))))))) 

(DEFUN |PrimeField;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimeField|))
          (LETT |dv$| (LIST '|PrimeField| DV$1) . #1#)
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PrimeField| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|Finite|)) (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
          (COND ((QREFELT $ 11))
                ('T (|error| "Argument to prime field must be a prime")))
          $))) 

(MAKEPROP '|PrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPrimeField| (NRTEVAL (QREFELT $ 6)))
              (|local| |#1|) (|Boolean|) (|Integer|) (|IntegerPrimesPackage| 8)
              (0 . |prime?|) '#:G104 (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| $) (|PositiveInteger|)
              (|Union| 13 '"failed") (|Union| $ '"failed") (|CardinalNumber|)
              (|OnePointCompletion| 14) (|Vector| $) (|Matrix| $)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 8) (|:| |exponent| 8)) (|List| 22)
              (|Table| 14 12) (|Union| 19 '"failed") (|InputForm|) (|List| $)
              (|Union| 12 '"failed") (|Fraction| 8) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 31 '#1="failed") (|Union| 27 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 27) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL NIL |DifferentialRing&| NIL
                |Algebra&| NIL |EntireRing&| |Algebra&| NIL |VectorSpace&|
                |Rng&| NIL |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL |Finite&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL |RetractableTo&| NIL NIL
                NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|FiniteFieldCategory|)
                 (|ExtensionField| $$) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|LeftOreRing|) (|DifferentialRing|)
                 (|CharacteristicNonZero|) (|Algebra| 29) (|CommutativeRing|)
                 (|EntireRing|) (|Algebra| $$) (|Ring|) (|VectorSpace| $$)
                 (|Rng|) (|SemiRing|) (|Module| $$) (|Module| 29) (|SemiRng|)
                 (|BiModule| $$ $$) (|BiModule| 29 29) (|NonAssociativeRing|)
                 (|LeftModule| $$) (|RightModule| 29) (|LeftModule| 29)
                 (|NonAssociativeRng|) (|RightModule| $$) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|StepThrough|) (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|ConvertibleTo| 8) (|RetractableTo| $$)
                 (|ConvertibleTo| 26) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 42))
              (|makeByteWordVec2| 10 '(1 9 7 8 10)))))
           '|lookupIncomplete|)) 
