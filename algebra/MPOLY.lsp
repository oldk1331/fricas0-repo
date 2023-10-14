
(/VERSIONCHECK 2) 

(DEFUN |MultivariatePolynomial| (&REST #1=#:G163)
  (PROG ()
    (RETURN
     (PROG (#2=#:G164)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|MultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MultivariatePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MultivariatePolynomial|))))))))))) 

(DEFUN |MultivariatePolynomial;| (|#1| |#2|)
  (PROG (#1=#:G162 |pv$| #2=#:G160 #3=#:G161 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|MultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|MultivariatePolynomial| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 56) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#2|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo| (|InputForm|))))
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #2# #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|MultivariatePolynomial|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 33554432))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 67108864))
      (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 134217728))
      (AND
       (OR #3#
           (AND (|HasCategory| |#2| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 268435456))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 7 18)
              (|local| |#1|) (|local| |#2|) (|Union| 27 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 33)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 33 $)
              (|Union| $ '#1#) (|Fraction| 33) (|NonNegativeInteger|)
              (|OrderedVariableList| 6) (|Boolean|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 33) (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 33)))
              (|Vector| $) (|Factored| 22) (|Union| 30 '#1#) (|List| 22)
              (|Union| 16 '#2="failed") (|Union| 33 '#2#) (|Integer|)
              (|Union| 21 '#3="failed")
              (|Record| (|:| |var| 18) (|:| |exponent| 17)) (|Union| 35 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| 7) (|List| 17) (|List| 18)
              (|Union| 18 '#2#) (|List| 7) (|List| 44) (|Equation| $)
              (|Mapping| 7 7) (|IndexedExponents| 18) (|Union| 7 '#2#)
              (|Mapping| 46 46)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 1 0 5 4 0 6 3 12 23 0 0 23 6 12 13 14
                                  23 6 19 0 0 12 25 0 0 0 0 24 12 12 0 0 0 0 0
                                  0 0 0 7 8 18 0 0 0 0 0 0 0 0 0 0 0 0 25 2 9
                                  10 11 15 16 17))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 7
                                       (|IndexedExponents|
                                        (|OrderedVariableList| 6))
                                       (|OrderedVariableList| 6))
                 (|MaybeSkewPolynomialCategory| 7
                                                (|IndexedExponents|
                                                 (|OrderedVariableList| 6))
                                                (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 7
                                            (|IndexedExponents|
                                             (|OrderedVariableList| 6)))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 7
                                      (|IndexedExponents|
                                       (|OrderedVariableList| 6)))
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 7) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 16) (|Algebra| 7)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|LinearlyExplicitRingOver| 7) (|CommutativeRing|)
                 (|Module| $$) (|Module| 16) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 7) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 33) (|Ring|) (|BiModule| 7 7)
                 (|BiModule| 16 16) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 7)
                 (|RightModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 16) (|RightModule| 16) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 33)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| (|OrderedVariableList| 6))
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 55) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 11) (|ConvertibleTo| 12)
                 (|ConvertibleTo| 10) (|RetractableTo| 16) (|RetractableTo| 33)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
