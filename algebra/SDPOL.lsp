
(/VERSIONCHECK 2) 

(DEFUN |SequentialDifferentialPolynomial| (#1=#:G170)
  (PROG ()
    (RETURN
     (PROG (#2=#:G171)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SequentialDifferentialPolynomial|)
                                           '|domainEqualList|)
                . #3=(|SequentialDifferentialPolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SequentialDifferentialPolynomial;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SequentialDifferentialPolynomial|))))))))))) 

(DEFUN |SequentialDifferentialPolynomial;| (|#1|)
  (PROG (#1=#:G169 |pv$| #2=#:G167 #3=#:G168 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|SequentialDifferentialPolynomial|))
      (LETT |dv$| (LIST '|SequentialDifferentialPolynomial| DV$1) . #4#)
      (LETT $ (GETREFV 61) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|SequentialDifferentialVariable|
                                             (|Symbol|))
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|SequentialDifferentialVariable|
                                             (|Symbol|))
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|SequentialDifferentialVariable|
                                             (|Symbol|))
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|SequentialDifferentialVariable|
                                             (|Symbol|))
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|SequentialDifferentialVariable|
                                             (|Symbol|))
                                            '(|ConvertibleTo| (|InputForm|))))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|SequentialDifferentialPolynomial|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 134217728))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 268435456))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 536870912))
      (AND
       (OR #3#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 1073741824))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SequentialDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 19 17)
              (|local| |#1|) (|Union| 30 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 36)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 36 $)
              (|Union| $ '#1#) (|Fraction| 36) (|NonNegativeInteger|)
              (|SequentialDifferentialVariable| 19) (|Boolean|) (|Symbol|)
              (|List| 19) (|List| 6) (|List| $) (|Mapping| $ 16)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 36) (|Record| (|:| |mat| 28) (|:| |vec| (|Vector| 36)))
              (|Vector| $) (|List| 16) (|Factored| 25) (|Union| 34 '#1#)
              (|List| 25) (|Union| 15 '#2="failed") (|Integer|)
              (|Union| 36 '#2#) (|Union| 39 '#2#)
              (|SparseMultivariatePolynomial| 6 19) (|Union| 19 '#2#)
              (|Mapping| 6 6) (|Union| 22 '#3="failed")
              (|Record| (|:| |var| 17) (|:| |exponent| 16)) (|Union| 43 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 17)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 17 '#2#) (|List| 50) (|Equation| $)
              (|IndexedExponents| 17) (|Union| 6 '#2#) (|Mapping| 51 51)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 1 0 1 0 5 4 0 0 6 3 12 25 0 0 25 6 12
                                  13 14 25 6 19 21 20 0 0 12 27 0 0 0 0 26 12
                                  12 0 0 0 0 0 0 0 0 7 8 18 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 27 2 9 10 11 15 16 17 20 20))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| NIL |Algebra&| |Algebra&| |PartialDifferentialRing&|
                NIL NIL |Module&| |Module&| NIL NIL |Module&| |EntireRing&| NIL
                |PartialDifferentialRing&| |DifferentialRing&| |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |InnerEvalable&|
                |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 19 17 51)
                 (|PolynomialCategory| 6 51 17)
                 (|MaybeSkewPolynomialCategory| 6 51 17)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 51) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 51) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 15) (|Algebra| 6)
                 (|PartialDifferentialRing| 17) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 15)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 36)
                 (|PartialDifferentialRing| 19) (|DifferentialRing|) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 15 15) (|BiModule| $$ $$) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 15) (|RightModule| 15)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 36) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 19))
                 (|RetractableTo| 19) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 17) (|InnerEvalable| 17 $$)
                 (|InnerEvalable| 17 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 60) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|RetractableTo| 15) (|RetractableTo| 36)
                 (|canonicalUnitNormal|) (|InnerEvalable| 19 $$)
                 (|InnerEvalable| 19 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
