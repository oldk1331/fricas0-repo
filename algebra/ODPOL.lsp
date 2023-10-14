
(DECLAIM (NOTINLINE |OrderlyDifferentialPolynomial;|)) 

(DEFUN |OrderlyDifferentialPolynomial| (#1=#:G149)
  (SPROG NIL
         (PROG (#2=#:G150)
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
                  (PROG1 (|OrderlyDifferentialPolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrderlyDifferentialPolynomial|)))))))))) 

(DEFUN |OrderlyDifferentialPolynomial;| (|#1|)
  (SPROG
   ((#1=#:G148 NIL) (|pv$| NIL) (#2=#:G145 NIL) (#3=#:G146 NIL) (#4=#:G147 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|OrderlyDifferentialPolynomial|))
    (LETT |dv$| (LIST '|OrderlyDifferentialPolynomial| DV$1) . #5#)
    (LETT $ (GETREFV 61) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
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
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
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
                                              . #5#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #3# #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #5#)
                                        (OR #3# #4# #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4# #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #4# #2#) (OR #4# #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #4# #2#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|OrderlyDifferentialPolynomial|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 2147483648))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #5#)
     (|augmentPredVector| $ 4294967296))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR #4# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 34359738368))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|OrderlyDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 20 19)
              (|local| |#1|) (|Union| 29 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 37)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 37 $)
              (|Union| $ '#1#) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 37) (|NonNegativeInteger|)
              (|OrderlyDifferentialVariable| 20) (|Symbol|) (|List| 20)
              (|List| 6) (|List| $) (|Mapping| $ 18)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |mat| 30) (|:| |vec| (|Vector| 37))) (|Vector| $)
              (|Matrix| 37) (|List| 18) (|Factored| 26) (|Union| 34 '#1#)
              (|List| 26) (|Union| 17 '#2="failed") (|Union| 37 '#2#)
              (|Integer|) (|Union| 39 '#2#)
              (|SparseMultivariatePolynomial| 6 20) (|Union| 20 '#2#)
              (|Mapping| 6 6) (|Record| (|:| |var| 19) (|:| |exponent| 18))
              (|Union| 42 '#3="failed") (|Union| 23 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| 6) (|List| 19) (|Union| 19 '#2#)
              (|Equation| $) (|List| 49) (|IndexedExponents| 19)
              (|Union| 6 '#2#) (|Mapping| 51 51)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 0 0 1 0 1 0 4 28 0 0 30 3 10 25 0 0 27 30
                                  10 11 12 25 13 18 20 19 0 0 10 31 0 0 0 0 24
                                  10 10 0 0 0 0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 29 2 7 8 9 14 15 16 19 19))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| NIL |Algebra&| |Algebra&| |PartialDifferentialRing&|
                NIL NIL |Module&| |Module&| NIL NIL |Module&| |EntireRing&| NIL
                |PartialDifferentialRing&| |DifferentialRing&| |Ring&| NIL NIL
                NIL |Rng&| NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |InnerEvalable&|
                |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 20 19 51)
                 (|PolynomialCategory| 6 51 19)
                 (|MaybeSkewPolynomialCategory| 6 51 19)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 51) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 51) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 17) (|Algebra| 6)
                 (|PartialDifferentialRing| 19) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 17)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 37)
                 (|PartialDifferentialRing| 20) (|DifferentialRing|) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 17 17) (|BiModule| $$ $$) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 17) (|RightModule| 17)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 37) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 20))
                 (|RetractableTo| 20) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 19) (|InnerEvalable| 19 $$)
                 (|InnerEvalable| 19 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 60) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|RetractableTo| 17) (|RetractableTo| 37)
                 (|canonicalUnitNormal|) (|InnerEvalable| 20 $$)
                 (|InnerEvalable| 20 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
