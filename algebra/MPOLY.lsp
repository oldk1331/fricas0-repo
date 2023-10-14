
(DECLAIM (NOTINLINE |MultivariatePolynomial;|)) 

(DEFUN |MultivariatePolynomial| (&REST #1=#:G142)
  (SPROG NIL
         (PROG (#2=#:G143)
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
                  (HREM |$ConstructorCache| '|MultivariatePolynomial|)))))))))) 

(DEFUN |MultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G141 NIL) (|pv$| NIL) (#2=#:G138 NIL) (#3=#:G139 NIL) (#4=#:G140 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|MultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|MultivariatePolynomial| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 56) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
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
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #4#)
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
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #3#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|)))
                                        (OR #3# #4#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              . #5#)
                                        (OR #3# #4# #2#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4# #2#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #4# #2#) (OR #4# #2#)
                                        (OR #3#
                                            (|HasCategory| |#2|
                                                           '(|EntireRing|))
                                            #4# #2#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|MultivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #5#)
     (|augmentPredVector| $ 1073741824))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #4# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|MultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 7 20)
              (|local| |#1|) (|local| |#2|) (|Union| 27 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 32)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 32 $)
              (|Union| $ '#1#) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 32) (|NonNegativeInteger|) (|OrderedVariableList| 6)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Matrix| 32) (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 32)))
              (|Vector| $) (|Factored| 23) (|Union| 30 '#1#) (|List| 23)
              (|Union| 18 '#2="failed") (|Integer|) (|Union| 32 '#2#)
              (|Record| (|:| |var| 20) (|:| |exponent| 19))
              (|Union| 34 '#3="failed") (|Union| 22 '#3#)
              (|SparseUnivariatePolynomial| 7) (|List| 19) (|List| 20)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 20 '#2#) (|List| 7) (|Equation| $) (|List| 43)
              (|IndexedExponents| 20) (|Mapping| 7 7) (|Union| 7 '#2#)
              (|Mapping| 45 45)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 1 0 1 0 4 26 0 28 3 10 23 0 0 25 28 10 11
                                  12 23 13 18 0 0 10 29 0 0 0 0 22 10 10 0 0 0
                                  0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0 0 0 0 0 27 2
                                  7 8 9 14 15 16))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL |Rng&| NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
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
                 (|LeftOreRing|) (|Algebra| 18) (|Algebra| 7)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|LinearlyExplicitRingOver| 7) (|CommutativeRing|)
                 (|Module| $$) (|Module| 18) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 7) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 32) (|Ring|) (|BiModule| 7 7)
                 (|BiModule| 18 18) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 7)
                 (|RightModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 18) (|RightModule| 18) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 32)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| (|OrderedVariableList| 6))
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 55) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 11) (|ConvertibleTo| 12)
                 (|ConvertibleTo| 10) (|RetractableTo| 18) (|RetractableTo| 32)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
