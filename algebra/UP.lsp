
(/VERSIONCHECK 2) 

(DEFUN |UP;coerce;$Of;1| (|p| $)
  (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 11)) (QREFELT $ 12))) 

(DEFUN |UP;coerce;V$;2| (|v| $)
  (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G155)
  (PROG ()
    (RETURN
     (PROG (#2=#:G156)
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
  (PROG (#1=#:G154 |pv$| #2=#:G151 #3=#:G152 #4=#:G153 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|UnivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2) . #5#)
      (LETT $ (GETREFV 74) . #5#)
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
                                          (|HasCategory| |#2| '(|EntireRing|))
                                          (LETT #4#
                                                (|HasCategory| |#2|
                                                               '(|GcdDomain|))
                                                . #5#)
                                          (OR (|HasCategory| |#2| '(|Field|))
                                              #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR
                                           (|HasCategory| |#2| '(|EntireRing|))
                                           #4#)
                                          (LETT #3#
                                                (|HasCategory| |#2|
                                                               '(|IntegralDomain|))
                                                . #5#)
                                          (OR (|HasCategory| |#2| '(|Field|))
                                              #4# #3#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #4# #3#)
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
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|CommutativeRing|))
                                                . #5#)
                                          (OR #2#
                                              (|HasCategory| |#2| '(|Field|))
                                              #4# #3#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|)))
                                          (OR #2# #4# #3#)
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|))
                                              #4# #3#)))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 1073741824))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #5#)
       (|augmentPredVector| $ 2147483648))
      (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 4294967296))
      (AND
       (OR (|HasCategory| |#2| '(|EntireRing|))
           (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 8589934592))
      (AND
       (OR #4#
           (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 17179869184))
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
              (|Union| 47 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 55)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 55 $)
              (|Union| $ '#1#) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 55) (|SingletonAsOrderedSet|)
              (|Record| (|:| |coef| 33) (|:| |generator| $)) (|List| $)
              (|Union| 33 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 36 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $)
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 39 '"failed")
              (|Record| (|:| |mat| 48) (|:| |vec| (|Vector| 55))) (|Vector| $)
              (|Matrix| 55) (|List| 9) (|List| 16) (|Factored| 41)
              (|Union| 53 '#1#) (|List| 41) (|Union| 30 '#2="failed")
              (|Integer|) (|Union| 55 '#2#) (|Mapping| 7 7) (|Vector| 7)
              (|Record| (|:| |var| 31) (|:| |exponent| 16))
              (|Union| 59 '"failed") (|List| 31) (|Union| 31 '#2#) (|List| 7)
              (|Equation| $) (|List| 64) (|Union| 7 '#2#) (|Mapping| 16 16)
              (|Record| (|:| |mat| 69) (|:| |vec| 58)) (|Matrix| 7)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 25 |zero?| 31 |vectorise| 36 |variables| 42 |unvectorise| 47
              |unmakeSUP| 52 |univariate| 57 |unitNormal| 68 |unitCanonical| 73
              |unit?| 78 |totalDegreeSorted| 83 |totalDegree| 89
              |subtractIfCan| 100 |subResultantGcd| 106 |squareFreePolynomial|
              112 |squareFreePart| 117 |squareFree| 122
              |solveLinearPolynomialEquation| 127 |smaller?| 133 |sizeLess?|
              139 |shiftRight| 145 |shiftLeft| 151 |separate| 157 |sample| 163
              |retractIfCan| 167 |retract| 187 |resultant| 207 |rem| 220
              |reductum| 226 |reducedSystem| 231 |recip| 253 |quo| 258
              |pseudoRemainder| 264 |pseudoQuotient| 270 |pseudoDivide| 276
              |principalIdeal| 282 |primitivePart| 287 |primitiveMonomials| 298
              |prime?| 303 |pomopo!| 308 |patternMatch| 316 |order| 330 |one?|
              336 |numberOfMonomials| 341 |nextItem| 346 |multivariate| 351
              |multiplyExponents| 363 |multiEuclidean| 369 |monomials| 375
              |monomial?| 380 |monomial| 385 |monicDivide| 405 |minimumDegree|
              418 |mapExponents| 435 |map| 441 |makeSUP| 447 |mainVariable| 452
              |leadingMonomial| 457 |leadingCoefficient| 462 |lcmCoef| 467
              |lcm| 473 |latex| 484 |karatsubaDivide| 489 |isTimes| 495
              |isPlus| 500 |isExpt| 505 |integrate| 510 |init| 515
              |hashUpdate!| 519 |hash| 525 |ground?| 530 |ground| 535
              |gcdPolynomial| 540 |gcd| 546 |fmecg| 557
              |factorSquareFreePolynomial| 565 |factorPolynomial| 570 |factor|
              575 |extendedEuclidean| 580 |exquo| 593 |expressIdealMember| 605
              |eval| 611 |euclideanSize| 665 |elt| 670 |divideExponents| 700
              |divide| 706 |discriminant| 712 |differentiate| 723 |degree| 806
              |convert| 823 |content| 838 |conditionP| 849 |composite| 854
              |coerce| 866 |coefficients| 901 |coefficient| 906 |charthRoot|
              926 |characteristic| 931 |binomThmExpt| 935 |associates?| 942 ^
              948 |Zero| 960 |One| 964 D 968 = 1044 / 1050 - 1056 + 1067 *
              1073)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(0 0 0 1 15 0 1 15 0 18 21 0 0 7 27 22 17 0 0
                                  0 7 8 9 27 14 27 22 19 24 0 0 7 30 0 0 0 0 7
                                  7 28 0 0 0 0 0 0 0 0 2 3 13 23 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 5 6 10 11 12 15 29 16 20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| NIL |PartialDifferentialRing&| |DifferentialRing&|
                NIL |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL NIL NIL
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 31)
                 (|MaybeSkewPolynomialCategory| 7 16 31)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 7 16)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 7)
                 (|FullyLinearlyExplicitRingOver| 7) (|Algebra| 30)
                 (|Algebra| 7) (|Algebra| $$) (|LeftOreRing|)
                 (|PartialDifferentialRing| 31) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 7) (|Module| 30)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 7)
                 (|LinearlyExplicitRingOver| 55) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 9)
                 (|Ring|) (|BiModule| 7 7) (|BiModule| 30 30)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 7) (|RightModule| 7)
                 (|LeftModule| $$) (|LeftModule| 30) (|RightModule| 30)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 55)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 7) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 7 7) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 31) (|InnerEvalable| 31 $$)
                 (|InnerEvalable| 31 7) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 7) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 10) (|ConvertibleTo| 23) (|ConvertibleTo| 24)
                 (|ConvertibleTo| 22) (|RetractableTo| 30) (|RetractableTo| 55)
                 (|canonicalUnitNormal|) (|additiveValuation|)
                 (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 73
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 28 0 0 1 1 0 28 0 1 2
                                    0 58 0 16 1 1 0 61 0 1 1 0 0 58 1 1 0 0 5 1
                                    2 0 41 0 31 1 1 0 5 0 1 1 34 29 0 1 1 34 0
                                    0 1 1 34 28 0 1 2 0 16 0 61 1 2 0 16 0 61 1
                                    1 0 16 0 1 2 0 27 0 0 1 2 20 0 0 0 1 1 1 51
                                    41 1 1 17 0 0 1 1 17 43 0 1 2 1 52 53 41 1
                                    2 13 28 0 0 1 2 15 28 0 0 1 2 0 0 0 16 1 2
                                    0 0 0 16 1 2 17 42 0 0 1 0 0 0 1 1 10 54 0
                                    1 1 11 56 0 1 1 0 62 0 1 1 0 66 0 1 1 10 30
                                    0 1 1 11 55 0 1 1 0 31 0 1 1 0 7 0 1 2 26 7
                                    0 0 1 3 26 0 0 0 31 1 2 15 0 0 0 1 1 0 0 0
                                    1 2 14 46 21 47 1 1 14 48 21 1 2 0 68 21 47
                                    1 1 0 69 21 1 1 0 27 0 1 2 15 0 0 0 1 2 0 0
                                    0 0 1 2 20 0 0 0 1 2 20 44 0 0 1 1 15 32 33
                                    1 2 17 0 0 31 1 1 17 0 0 1 1 0 33 0 1 1 1
                                    28 0 1 4 0 0 0 7 16 0 1 3 2 25 0 23 25 1 3
                                    3 26 0 24 26 1 2 20 16 0 0 1 1 0 28 0 1 1 0
                                    16 0 1 1 23 27 0 1 2 0 0 41 31 1 2 0 0 5 31
                                    1 2 0 0 0 16 1 2 15 34 33 0 1 1 0 33 0 1 1
                                    0 28 0 1 2 0 0 7 16 17 3 0 0 0 31 16 1 3 0
                                    0 0 61 50 1 2 0 35 0 0 1 3 0 35 0 0 31 1 2
                                    0 50 0 61 1 2 0 16 0 31 1 1 0 16 0 1 2 0 0
                                    67 0 1 2 0 0 57 0 1 1 0 5 0 1 1 0 62 0 1 1
                                    0 0 0 1 1 0 7 0 1 2 17 40 0 0 1 2 17 0 0 0
                                    1 1 17 0 33 1 1 0 71 0 1 2 0 35 0 16 1 1 0
                                    34 0 1 1 0 34 0 1 1 0 60 0 1 1 7 0 0 1 0 23
                                    0 1 2 0 73 73 0 1 1 0 72 0 1 1 0 28 0 1 1 0
                                    7 0 1 2 17 41 41 41 1 1 17 0 33 1 2 17 0 0
                                    0 1 4 0 0 0 16 7 0 1 1 1 51 41 1 1 1 51 41
                                    1 1 1 43 0 1 3 15 37 0 0 0 1 2 15 38 0 0 1
                                    2 34 27 0 0 1 2 16 27 0 7 1 2 15 34 33 0 1
                                    3 0 0 0 61 33 1 3 0 0 0 61 63 1 3 0 0 0 31
                                    0 1 3 0 0 0 31 7 1 3 0 0 0 0 0 1 3 0 0 0 33
                                    33 1 2 0 0 0 64 1 2 0 0 0 65 1 1 15 16 0 1
                                    2 15 7 39 7 1 2 20 39 0 39 1 2 20 39 39 39
                                    1 2 0 0 0 0 1 2 0 7 0 7 1 2 0 27 0 16 1 2
                                    15 35 0 0 1 1 26 7 0 1 2 26 0 0 31 1 3 24 0
                                    0 49 50 1 2 24 0 0 49 1 3 24 0 0 9 16 1 2
                                    24 0 0 9 1 3 0 0 0 57 0 1 3 0 0 0 57 16 1 2
                                    0 0 0 57 1 1 0 0 0 1 2 0 0 0 16 1 3 0 0 0
                                    61 50 1 3 0 0 0 31 16 1 2 0 0 0 31 1 2 0 0
                                    0 61 1 1 0 16 0 1 2 0 16 0 31 1 2 0 50 0 61
                                    1 1 6 22 0 1 1 4 23 0 1 1 5 24 0 1 2 17 0 0
                                    31 1 1 17 7 0 1 1 32 20 21 1 2 20 45 39 0 1
                                    2 20 27 0 0 1 1 35 0 0 1 1 25 0 30 1 1 0 0
                                    18 19 1 0 0 31 1 1 0 0 7 1 1 0 0 55 1 1 0
                                    10 0 13 1 0 63 0 1 2 0 7 0 16 1 3 0 0 0 61
                                    50 1 3 0 0 0 31 16 1 1 33 27 0 1 0 0 16 1 3
                                    31 0 0 0 16 1 2 34 28 0 0 1 2 0 0 0 16 1 2
                                    0 0 0 70 1 0 0 0 1 0 0 0 14 3 24 0 0 49 50
                                    1 3 24 0 0 9 16 1 2 24 0 0 9 1 2 24 0 0 49
                                    1 2 0 0 0 57 1 3 0 0 0 57 16 1 1 0 0 0 1 2
                                    0 0 0 16 1 3 0 0 0 31 16 1 3 0 0 0 61 50 1
                                    2 0 0 0 61 1 2 0 0 0 31 1 2 0 28 0 0 1 2 15
                                    0 0 7 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    7 0 0 30 1 2 7 0 30 0 1 2 0 0 0 7 1 2 0 0 7
                                    0 1 2 0 0 55 0 1 2 0 0 0 0 1 2 0 0 16 0 1 2
                                    0 0 70 0 1)))))
           '|lookupComplete|)) 
