
(/VERSIONCHECK 2) 

(DEFUN |FiniteField| (&REST #1=#:G159)
  (PROG ()
    (RETURN
     (PROG (#2=#:G160)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|FiniteField|))))))))))) 

(DEFUN |FiniteField;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G158 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteField|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|FiniteField| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 46) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|PrimeField| |#1|)
                                                         '(|CharacteristicZero|))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|PrimeField| |#1|)
                                                 '(|Finite|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| (|PrimeField| |#1|)
                                                          '(|CharacteristicNonZero|))
                                           #1#)))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|FiniteField| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtensionByPolynomial| 28
                                                  (NRTEVAL
                                                   (SPADCALL (QREFELT $ 7)
                                                             (QREFELT $ 11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 28)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 28)
              (0 . |createIrreduciblePoly|) (|Union| $ '"failed")
              (|Union| 15 '"failed") (|OnePointCompletion| 9)
              (|NonNegativeInteger|) (|List| $) (|InputForm|)
              (|Union| 31 '"failed") (|Matrix| $) (|Table| 9 15) (|Integer|)
              (|Record| (|:| |factor| 21) (|:| |exponent| 21)) (|List| 22)
              (|Boolean|) (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 8 '"failed") (|SparseUnivariatePolynomial| $)
              (|PrimeField| 6) (|Vector| 28) (|Matrix| 28) (|Vector| $)
              (|CardinalNumber|) (|Union| 28 '"failed") (|Fraction| 21)
              (|Factored| $) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 36 '#1="failed") (|Union| 16 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 16) (|:| |generator| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 0 0 0
                                  0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&|
                |Algebra&| |Module&| |Module&| |EntireRing&| NIL |Module&| NIL
                NIL |DifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|ExtensionField| (|PrimeField| 6)) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|VectorSpace| (|PrimeField| 6)) (|Algebra| 34) (|Algebra| $$)
                 (|Module| (|PrimeField| 6)) (|Module| 34) (|EntireRing|)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 34 34) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 34)
                 (|LeftModule| 34) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Finite|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| (|PrimeField| 6))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 44) (|ConvertibleTo| 17))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
