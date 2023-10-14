
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |BalancedPAdicRational;|)) 

(DEFUN |BalancedPAdicRational| (#1=#:G140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BalancedPAdicRational|)
                                           '|domainEqualList|)
                . #3=(|BalancedPAdicRational|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|BalancedPAdicRational;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|BalancedPAdicRational|))))))))))) 

(DEFUN |BalancedPAdicRational;| (|#1|)
  (PROG (|pv$| #1=#:G139 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|BalancedPAdicRational|))
      (LETT |dv$| (LIST '|BalancedPAdicRational| DV$1) . #2#)
      (LETT $ (GETREFV 58) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|RetractableTo| (|Symbol|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|ConvertibleTo| (|InputForm|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|RealConstant|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|OrderedIntegralDomain|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|OrderedSet|))
                                          (OR
                                           (|HasCategory|
                                            (|BalancedPAdicInteger| |#1|)
                                            '(|OrderedIntegralDomain|))
                                           (|HasCategory|
                                            (|BalancedPAdicInteger| |#1|)
                                            '(|OrderedSet|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|RetractableTo| (|Integer|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|StepThrough|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           (LIST '|InnerEvalable| '(|Symbol|)
                                                 (LIST '|BalancedPAdicInteger|
                                                       (|devaluate| |#1|))))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           (LIST '|Evalable|
                                                 (LIST '|BalancedPAdicInteger|
                                                       (|devaluate| |#1|))))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           (LIST '|Eltable|
                                                 (LIST '|BalancedPAdicInteger|
                                                       (|devaluate| |#1|))
                                                 (LIST '|BalancedPAdicInteger|
                                                       (|devaluate| |#1|))))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|PartialDifferentialRing|
                                             (|Symbol|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|LinearlyExplicitRingOver|
                                             (|Integer|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|))))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|))))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|PatternMatchable| (|Float|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|PatternMatchable| (|Integer|)))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|EuclideanDomain|))
                                          (|HasCategory|
                                           (|BalancedPAdicInteger| |#1|)
                                           '(|IntegerNumberSystem|))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|BalancedPAdicInteger| |#1|)
                                                 '(|Comparable|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|OrderedIntegralDomain|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|OrderedSet|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|BalancedPAdicRational| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|BalancedPAdicInteger| |#1|)
                          '(|PolynomialFactorizationExplicit|))
           (|augmentPredVector| $ 33554432))
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|))
             (|HasCategory| (|BalancedPAdicInteger| |#1|)
                            '(|PolynomialFactorizationExplicit|)))
        (|HasCategory| (|BalancedPAdicInteger| |#1|)
                       '(|CharacteristicNonZero|)))
       (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|BalancedPAdicRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PAdicRationalConstructor| 6 15)
              (|local| |#1|) (|Union| 23 '#1="failed") (|Matrix| $)
              (|Union| $ '"failed") (|Boolean|) (|InputForm|) (|Pattern| 32)
              (|Pattern| 24) (|NonNegativeInteger|) (|BalancedPAdicInteger| 6)
              (|List| 17) (|Equation| 15) (|List| 15) (|Symbol|) (|List| 19)
              (|Matrix| 24) (|Record| (|:| |mat| 21) (|:| |vec| (|Vector| 24)))
              (|Vector| $) (|Integer|) (|List| 14) (|PatternMatchResult| 32 $)
              (|PatternMatchResult| 24 $) (|Factored| 29)
              (|SparseUnivariatePolynomial| $) (|Union| 31 '#1#) (|List| 29)
              (|Float|) (|DoubleFloat|) (|Union| 24 '#2="failed")
              (|Union| 36 '#2#) (|Fraction| 24) (|Union| 19 '#2#)
              (|ContinuedFraction| 36) (|Matrix| 15)
              (|Record| (|:| |mat| 39) (|:| |vec| (|Vector| 15)))
              (|Mapping| 15 15) (|Union| 15 '#2#) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 44 '#3="failed") (|Union| 47 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 47) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0
                                  3 4 15 16 17 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0
                                  0 7 0 0 0 0 9 0 0 0 25 11 20 21 0 0 6 13 0 0
                                  0 0 0 0 0 0 0 2 5 6 6 8 10 10 12 13 14 18
                                  19))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| |OrderedRing&| NIL
                |Module&| |Module&| NIL |EntireRing&| |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |OrderedSet&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| (|BalancedPAdicInteger| 6)) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|DivisionRing|)
                 (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| (|BalancedPAdicInteger| 6))
                 (|DifferentialExtension| (|BalancedPAdicInteger| 6))
                 (|Algebra| (|BalancedPAdicInteger| 6)) (|Algebra| 36)
                 (|LeftOreRing|) (|Algebra| $$) (|OrderedRing|)
                 (|LinearlyExplicitRingOver| (|BalancedPAdicInteger| 6))
                 (|Module| (|BalancedPAdicInteger| 6)) (|Module| 36)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 19) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 24)
                 (|BiModule| (|BalancedPAdicInteger| 6)
                             (|BalancedPAdicInteger| 6))
                 (|BiModule| 36 36) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|)
                 (|RightModule| (|BalancedPAdicInteger| 6))
                 (|LeftModule| (|BalancedPAdicInteger| 6)) (|RightModule| 36)
                 (|LeftModule| 36) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable| (|BalancedPAdicInteger| 6))
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| (|BalancedPAdicInteger| 6)) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|PatternMatchable| 32) (|PatternMatchable| 24)
                 (|Patternable| (|BalancedPAdicInteger| 6)) (|SetCategory|)
                 (|RealConstant|) (|Evalable| (|BalancedPAdicInteger| 6))
                 (|Type|) (|RetractableTo| (|BalancedPAdicInteger| 6))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 57) (|RetractableTo| 19)
                 (|ConvertibleTo| 11) (|ConvertibleTo| 33) (|ConvertibleTo| 32)
                 (|PartialOrder|) (|RetractableTo| 36) (|RetractableTo| 24)
                 (|InnerEvalable| 19 (|BalancedPAdicInteger| 6))
                 (|InnerEvalable| (|BalancedPAdicInteger| 6)
                                  (|BalancedPAdicInteger| 6))
                 (|Eltable| (|BalancedPAdicInteger| 6) $$) (|ConvertibleTo| 12)
                 (|ConvertibleTo| 13))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
