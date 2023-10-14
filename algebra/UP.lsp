
(/VERSIONCHECK 2) 

(DEFUN |UP;coerce;$Of;1| (|p| $)
  (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 11)) (QREFELT $ 12))) 

(DEFUN |UP;coerce;V$;2| (|v| $)
  (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 17))) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G175)
  (PROG ()
    (RETURN
     (PROG (#2=#:G176)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|UnivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |UnivariatePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UnivariatePolynomial|))))))))))) 

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (PROG (#1=#:G174 |pv$| #2=#:G172 #3=#:G173 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|UnivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 72) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|SingletonAsOrderedSet|)
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
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2| '(|StepThrough|))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (LETT #3#
                                                (|HasCategory| |#2|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#2| '(|Field|))
                                              #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#2| '(|Field|))
                                              #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR (|HasCategory| |#2| '(|Field|))
                                              #2#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 134217728))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 268435456))
      (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 536870912))
      (AND
       (OR #2#
           (AND (|HasCategory| |#2| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 1073741824))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|SparseUnivariatePolynomial| |#2|))
      $)))) 

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;$Of;1|
              (11 . |One|) (15 . |One|) (|NonNegativeInteger|)
              (19 . |monomial|) (|Variable| 6) |UP;coerce;V$;2|
              (|Union| 46 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 54)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 54 $)
              (|Union| $ '#1#) (|Fraction| 54) (|SingletonAsOrderedSet|)
              (|Boolean|) (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|List| $) (|Union| 32 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 36 '"failed")
              (|Fraction| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 38 '"failed")
              (|Record| (|:| |mat| 47) (|:| |vec| (|Vector| 54))) (|Vector| $)
              (|Matrix| 54) (|List| 9) (|List| 16) (|Factored| 39)
              (|Union| 52 '#1#) (|List| 39) (|Union| 28 '#2="failed")
              (|Integer|) (|Union| 54 '#2#) (|Mapping| 7 7) (|Vector| 7)
              (|Record| (|:| |var| 29) (|:| |exponent| 16))
              (|Union| 58 '"failed") (|List| 29) (|Union| 29 '#2#) (|List| 7)
              (|Equation| $) (|List| 63) (|Union| 7 '#2#) (|Mapping| 16 16)
              (|Matrix| 7) (|Record| (|:| |mat| 67) (|:| |vec| 57))
              (|PositiveInteger|) (|SingleInteger|) (|String|))
           '#(~= 25 |zero?| 31 |vectorise| 36 |variables| 42 |unmakeSUP| 47
              |univariate| 52 |unitNormal| 63 |unitCanonical| 68 |unit?| 73
              |totalDegreeSorted| 78 |totalDegree| 84 |subtractIfCan| 95
              |subResultantGcd| 101 |squareFreePolynomial| 107 |squareFreePart|
              112 |squareFree| 117 |solveLinearPolynomialEquation| 122
              |smaller?| 128 |sizeLess?| 134 |shiftRight| 140 |shiftLeft| 146
              |separate| 152 |sample| 158 |retractIfCan| 162 |retract| 182
              |resultant| 202 |rem| 215 |reductum| 221 |reducedSystem| 226
              |recip| 248 |quo| 253 |pseudoRemainder| 259 |pseudoQuotient| 265
              |pseudoDivide| 271 |principalIdeal| 277 |primitivePart| 282
              |primitiveMonomials| 293 |prime?| 298 |pomopo!| 303
              |patternMatch| 311 |order| 325 |one?| 331 |numberOfMonomials| 336
              |nextItem| 341 |multivariate| 346 |multiplyExponents| 358
              |multiEuclidean| 364 |monomials| 370 |monomial?| 375 |monomial|
              380 |monicDivide| 400 |minimumDegree| 413 |mapExponents| 430
              |map| 436 |makeSUP| 442 |mainVariable| 447 |leadingMonomial| 452
              |leadingCoefficient| 457 |lcm| 462 |latex| 473 |karatsubaDivide|
              478 |isTimes| 484 |isPlus| 489 |isExpt| 494 |integrate| 499
              |init| 504 |hash| 508 |ground?| 513 |ground| 518 |gcdPolynomial|
              523 |gcd| 529 |fmecg| 540 |factorSquareFreePolynomial| 548
              |factorPolynomial| 553 |factor| 558 |extendedEuclidean| 563
              |exquo| 576 |expressIdealMember| 588 |eval| 594 |euclideanSize|
              648 |elt| 653 |divideExponents| 683 |divide| 689 |discriminant|
              695 |differentiate| 706 |degree| 789 |convert| 806 |content| 821
              |conditionP| 832 |composite| 837 |coerce| 849 |coefficients| 884
              |coefficient| 889 |charthRoot| 909 |characteristic| 914
              |binomThmExpt| 918 |associates?| 925 ^ 931 |Zero| 943 |One| 947 D
              951 = 1027 / 1033 - 1039 + 1050 * 1056)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 1 15 0 1 15 0 25 24 0 0 7 23 27 0 0 0 7
                                  8 9 23 14 23 27 16 18 0 0 7 26 0 0 0 0 7 7 21
                                  0 0 0 0 0 0 0 0 2 3 13 17 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 4 5 6 10 11 12 15 26 16 16))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| |DifferentialRing&| NIL
                |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL NIL NIL
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 29)
                 (|MaybeSkewPolynomialCategory| 7 16 29)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 7 16)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 7)
                 (|FullyLinearlyExplicitRingOver| 7) (|Algebra| 28)
                 (|Algebra| 7) (|Algebra| $$) (|PartialDifferentialRing| 29)
                 (|DifferentialRing|) (|LinearlyExplicitRingOver| 7)
                 (|Module| 28) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Module| 7) (|LinearlyExplicitRingOver| 54)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 9) (|Ring|) (|BiModule| 7 7)
                 (|BiModule| 28 28) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 7)
                 (|RightModule| 7) (|LeftModule| $$) (|LeftModule| 28)
                 (|RightModule| 28) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 54)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 7) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 7 7) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 29) (|InnerEvalable| 29 $$)
                 (|InnerEvalable| 29 7) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 7) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 10) (|ConvertibleTo| 23) (|ConvertibleTo| 24)
                 (|ConvertibleTo| 22) (|RetractableTo| 28) (|RetractableTo| 54)
                 (|canonicalUnitNormal|) (|additiveValuation|)
                 (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 71
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 30 0 0 1 1 0 30 0 1 2
                                    0 57 0 16 1 1 0 60 0 1 1 0 0 5 1 2 0 39 0
                                    29 1 1 0 5 0 1 1 16 42 0 1 1 16 0 0 1 1 16
                                    30 0 1 2 0 16 0 60 1 1 0 16 0 1 2 0 16 0 60
                                    1 2 0 27 0 0 1 2 16 0 0 0 1 1 1 50 39 1 1
                                    22 0 0 1 1 22 41 0 1 2 1 51 52 39 1 2 13 30
                                    0 0 1 2 15 30 0 0 1 2 0 0 0 16 1 2 0 0 0 16
                                    1 2 22 40 0 0 1 0 0 0 1 1 10 53 0 1 1 11 55
                                    0 1 1 0 61 0 1 1 0 65 0 1 1 10 28 0 1 1 11
                                    54 0 1 1 0 29 0 1 1 0 7 0 1 2 20 7 0 0 1 3
                                    20 0 0 0 29 1 2 15 0 0 0 1 1 0 0 0 1 2 14
                                    45 21 46 1 1 14 47 21 1 1 0 67 21 1 2 0 68
                                    21 46 1 1 0 27 0 1 2 15 0 0 0 1 2 0 0 0 0 1
                                    2 16 0 0 0 1 2 16 43 0 0 1 1 15 31 32 1 2
                                    22 0 0 29 1 1 22 0 0 1 1 0 32 0 1 1 1 30 0
                                    1 4 0 0 0 7 16 0 1 3 2 25 0 23 25 1 3 3 26
                                    0 24 26 1 2 16 16 0 0 1 1 0 30 0 1 1 0 16 0
                                    1 1 17 27 0 1 2 0 0 5 29 1 2 0 0 39 29 1 2
                                    0 0 0 16 1 2 15 33 32 0 1 1 0 32 0 1 1 0 30
                                    0 1 2 0 0 7 16 17 3 0 0 0 29 16 1 3 0 0 0
                                    60 49 1 2 0 34 0 0 1 3 0 34 0 0 29 1 2 0 16
                                    0 29 1 2 0 49 0 60 1 1 0 16 0 1 2 0 0 66 0
                                    1 2 0 0 56 0 1 1 0 5 0 1 1 0 61 0 1 1 0 0 0
                                    1 1 0 7 0 1 2 22 0 0 0 1 1 22 0 32 1 1 0 71
                                    0 1 2 0 34 0 16 1 1 0 33 0 1 1 0 33 0 1 1 0
                                    59 0 1 1 7 0 0 1 0 17 0 1 1 0 70 0 1 1 0 30
                                    0 1 1 0 7 0 1 2 22 39 39 39 1 2 22 0 0 0 1
                                    1 22 0 32 1 4 0 0 0 16 7 0 1 1 1 50 39 1 1
                                    1 50 39 1 1 1 41 0 1 2 15 35 0 0 1 3 15 37
                                    0 0 0 1 2 16 27 0 0 1 2 16 27 0 7 1 2 15 33
                                    32 0 1 3 0 0 0 60 32 1 3 0 0 0 60 62 1 3 0
                                    0 0 29 0 1 3 0 0 0 29 7 1 3 0 0 0 0 0 1 3 0
                                    0 0 32 32 1 2 0 0 0 63 1 2 0 0 0 64 1 1 15
                                    16 0 1 2 15 7 38 7 1 2 16 38 0 38 1 2 16 38
                                    38 38 1 2 0 7 0 7 1 2 0 0 0 0 1 2 0 27 0 16
                                    1 2 15 34 0 0 1 1 20 7 0 1 2 20 0 0 29 1 3
                                    18 0 0 48 49 1 3 18 0 0 9 16 1 2 18 0 0 9 1
                                    2 18 0 0 48 1 3 0 0 0 56 0 1 2 0 0 0 56 1 3
                                    0 0 0 56 16 1 1 0 0 0 1 2 0 0 0 16 1 3 0 0
                                    0 60 49 1 2 0 0 0 60 1 3 0 0 0 29 16 1 2 0
                                    0 0 29 1 1 0 16 0 1 2 0 16 0 29 1 2 0 49 0
                                    60 1 1 6 22 0 1 1 4 23 0 1 1 5 24 0 1 2 22
                                    0 0 29 1 1 22 7 0 1 1 29 20 21 1 2 16 44 38
                                    0 1 2 16 27 0 0 1 1 31 0 0 1 1 19 0 28 1 1
                                    0 0 18 19 1 0 0 29 1 1 0 0 7 1 1 0 0 54 1 1
                                    0 10 0 13 1 0 62 0 1 2 0 7 0 16 1 3 0 0 0
                                    29 16 1 3 0 0 0 60 49 1 1 30 27 0 1 0 0 16
                                    1 3 28 0 0 0 16 1 2 16 30 0 0 1 2 0 0 0 16
                                    1 2 0 0 0 69 1 0 0 0 1 0 0 0 14 3 18 0 0 9
                                    16 1 3 18 0 0 48 49 1 2 18 0 0 48 1 2 18 0
                                    0 9 1 2 0 0 0 56 1 3 0 0 0 56 16 1 1 0 0 0
                                    1 2 0 0 0 16 1 3 0 0 0 60 49 1 3 0 0 0 29
                                    16 1 2 0 0 0 29 1 2 0 0 0 60 1 2 0 30 0 0 1
                                    2 15 0 0 7 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 7 0 0 28 1 2 7 0 28 0 1 2 0 0 0 7 1 2
                                    0 0 7 0 1 2 0 0 0 0 1 2 0 0 54 0 1 2 0 0 16
                                    0 1 2 0 0 69 0 1)))))
           '|lookupComplete|)) 
