
(/VERSIONCHECK 2) 

(DEFUN |FiniteFieldExtension| (&REST #1=#:G160)
  (PROG ()
    (RETURN
     (PROG (#2=#:G161)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FiniteFieldExtension|)
                                           '|domainEqualList|)
                . #3=(|FiniteFieldExtension|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FiniteFieldExtension;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FiniteFieldExtension|))))))))))) 

(DEFUN |FiniteFieldExtension;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G159 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldExtension|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|FiniteFieldExtension| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 47) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Finite|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           #1#)))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|FiniteFieldExtension| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteFieldExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtensionByPolynomial| 6
                                                  (NRTEVAL
                                                   (SPADCALL (QREFELT $ 7)
                                                             (QREFELT $ 11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 6)
              (0 . |createIrreduciblePoly|) (|Union| $ '"failed")
              (|Union| 15 '"failed") (|OnePointCompletion| 9)
              (|NonNegativeInteger|) (|List| $) (|InputForm|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 23)) (|List| 18)
              (|Union| 30 '"failed") (|Matrix| $) (|Table| 9 15) (|Integer|)
              (|Boolean|) (|Union| 8 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SparseUnivariatePolynomial| $) (|Vector| 6) (|Matrix| 6)
              (|Vector| $) (|CardinalNumber|) (|Union| 6 '"failed")
              (|Fraction| 23) (|Factored| $) (|Union| 16 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 36 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 16) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 0 0
                                  0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&| NIL
                |Algebra&| |Module&| |Module&| NIL |EntireRing&| |Module&| NIL
                NIL |DifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| 6) (|Algebra| 33)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| 6) (|Module| 33)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 33 33)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 33) (|LeftModule| 33) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|StepThrough|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 45) (|ConvertibleTo| 17))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
