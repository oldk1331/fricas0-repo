
(/VERSIONCHECK 2) 

(DEFUN |OrderlyDifferentialPolynomial| (#1=#:G169)
  (PROG ()
    (RETURN
     (PROG (#2=#:G170)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|OrderlyDifferentialPolynomial|)
                                           '|domainEqualList|)
                . #3=(|OrderlyDifferentialPolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|OrderlyDifferentialPolynomial;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OrderlyDifferentialPolynomial|))))))))))) 

(DEFUN |OrderlyDifferentialPolynomial;| (|#1|)
  (PROG (#1=#:G168 |pv$| #2=#:G166 #3=#:G167 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|OrderlyDifferentialPolynomial|))
      (LETT |dv$| (LIST '|OrderlyDifferentialPolynomial| DV$1) . #4#)
      (LETT $ (GETREFV 59) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|OrderlyDifferentialVariable|
                                             (|Symbol|))
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|OrderlyDifferentialVariable|
                                             (|Symbol|))
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|OrderlyDifferentialVariable|
                                             (|Symbol|))
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|OrderlyDifferentialVariable|
                                             (|Symbol|))
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|OrderlyDifferentialVariable|
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
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3# #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|OrderlyDifferentialPolynomial|
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
       (OR #2#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 1073741824))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OrderlyDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 19 17)
              (|local| |#1|) (|Union| 29 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 35)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 35 $)
              (|Union| $ '#1#) (|Fraction| 35) (|NonNegativeInteger|)
              (|OrderlyDifferentialVariable| 19) (|Boolean|) (|Symbol|)
              (|List| 19) (|List| 6) (|List| $) (|Mapping| $ 16)
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 35) (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 35)))
              (|Vector| $) (|List| 16) (|Factored| 24) (|Union| 33 '#1#)
              (|List| 24) (|Union| 15 '#2="failed") (|Integer|)
              (|Union| 35 '#2#) (|Union| 38 '#2#)
              (|SparseMultivariatePolynomial| 6 19) (|Union| 19 '#2#)
              (|Mapping| 6 6) (|Union| 22 '#3="failed")
              (|Record| (|:| |var| 17) (|:| |exponent| 16)) (|Union| 42 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 17)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 17 '#2#) (|List| 49) (|Equation| $)
              (|IndexedExponents| 17) (|Union| 6 '#2#) (|Mapping| 50 50)
              (|Record| (|:| |mat| 54) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|PositiveInteger|) (|SingleInteger|) (|String|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 1 0 1 0 25 24 0 0 27 8 23 0 0 23 27 2 8
                                  9 10 23 15 17 16 0 0 8 26 0 0 0 0 21 8 8 0 0
                                  0 0 0 0 0 0 3 4 14 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 26 2 5 6 7 11 12 13 16 16))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| |PartialDifferentialRing&| NIL
                NIL |Module&| |EntireRing&| |Module&| NIL NIL |Module&| NIL
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
              '#((|DifferentialPolynomialCategory| 6 19 17 50)
                 (|PolynomialCategory| 6 50 17)
                 (|MaybeSkewPolynomialCategory| 6 50 17)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 50) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 50) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|Algebra| 15) (|Algebra| 6) (|PartialDifferentialRing| 17)
                 (|LinearlyExplicitRingOver| 6) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|Module| 15)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 35) (|PartialDifferentialRing| 19)
                 (|DifferentialRing|) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 15 15) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 15) (|RightModule| 15) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 35)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 6)
                 (|SetCategory|)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 19))
                 (|RetractableTo| 19) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 17) (|InnerEvalable| 17 $$)
                 (|InnerEvalable| 17 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 58) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|RetractableTo| 15) (|RetractableTo| 35)
                 (|canonicalUnitNormal|) (|InnerEvalable| 19 $$)
                 (|InnerEvalable| 19 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
