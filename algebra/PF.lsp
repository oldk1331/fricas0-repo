
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |PrimeField;|)) 

(DEFUN |PrimeField| (#1=#:G161)
  (PROG ()
    (RETURN
     (PROG (#2=#:G162)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|PrimeField|))))))))))) 

(DEFUN |PrimeField;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimeField|))
      (LETT |dv$| (LIST '|PrimeField| DV$1) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PrimeField| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CharacteristicZero|)) (|augmentPredVector| $ 1))
      (AND (|HasCategory| $ '(|Finite|)) (|augmentPredVector| $ 2))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
      (COND ((QREFELT $ 11))
            ('T (|error| "Argument to prime field must be a prime")))
      $)))) 

(MAKEPROP '|PrimeField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerPrimeField| 6) (|local| |#1|)
              (|Boolean|) (|Integer|) (|IntegerPrimesPackage| 8) (0 . |prime?|)
              '#:G127 (|NonNegativeInteger|) (|PositiveInteger|)
              (|SparseUnivariatePolynomial| $) (|Union| 14 '"failed")
              (|Union| $ '"failed") (|CardinalNumber|)
              (|OnePointCompletion| 13) (|Vector| $) (|Matrix| $)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 13 12) (|Union| 19 '"failed")
              (|Record| (|:| |factor| 8) (|:| |exponent| 8)) (|List| 24)
              (|InputForm|) (|List| $) (|Union| 12 '"failed") (|Fraction| 8)
              (|Factored| $) (|Union| 27 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 32 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 27) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&| NIL
                |Algebra&| |Module&| |DifferentialRing&| NIL |Module&| NIL
                |EntireRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL NIL
                |Finite&| |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| $$) (|FiniteFieldCategory|)
                 (|ExtensionField| $$) (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| $$) (|Algebra| 29)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| $$)
                 (|DifferentialRing|) (|CharacteristicNonZero|) (|Module| 29)
                 (|CommutativeRing|) (|EntireRing|) (|CharacteristicZero|)
                 (|BiModule| $$ $$) (|BiModule| 29 29) (|Ring|)
                 (|LeftModule| $$) (|RightModule| 29) (|LeftModule| 29) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|StepThrough|) (|Finite|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|SetCategory|)
                 (|ConvertibleTo| 8) (|RetractableTo| $$) (|ConvertibleTo| 26)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 41))
              (|makeByteWordVec2| 10 '(1 9 7 8 10)))))
           '|lookupIncomplete|)) 
