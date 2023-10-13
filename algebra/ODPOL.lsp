
(/VERSIONCHECK 2) 

(DEFUN |OrderlyDifferentialPolynomial| (#1=#:G168)
  (PROG ()
    (RETURN
     (PROG (#2=#:G169)
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
  (PROG (#1=#:G167 |pv$| #2=#:G166 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|OrderlyDifferentialPolynomial|))
      (LETT |dv$| (LIST '|OrderlyDifferentialPolynomial| DV$1) . #3#)
      (LETT $ (GETREFV 59) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
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
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
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
                                                               '(|GcdDomain|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           #2#
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
                                                             '(|PolynomialFactorizationExplicit|)))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|OrderlyDifferentialPolynomial|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #3#)
       (|augmentPredVector| $ 33554432))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OrderlyDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 19 16)
              (|local| |#1|) (|Union| 29 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 35)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 35 $)
              (|Union| $ '#1#) (|Fraction| 35)
              (|OrderlyDifferentialVariable| 19) (|NonNegativeInteger|)
              (|Boolean|) (|Symbol|) (|List| 19) (|List| 6) (|List| $)
              (|Mapping| $ 17) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 35) (|Record| (|:| |mat| 27) (|:| |vec| (|Vector| 35)))
              (|Vector| $) (|List| 17) (|Factored| 24) (|Union| 33 '#1#)
              (|List| 24) (|Union| 15 '#2="failed") (|Integer|)
              (|Union| 35 '#2#) (|Union| 38 '#2#)
              (|SparseMultivariatePolynomial| 6 19) (|Union| 19 '#2#)
              (|Mapping| 6 6) (|List| 16)
              (|Record| (|:| |var| 16) (|:| |exponent| 17))
              (|Union| 42 '#3="failed") (|Union| 22 '#3#)
              (|SparseUnivariatePolynomial| 6)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 16 '#3#)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|List| 51) (|Equation| $) (|IndexedExponents| 16)
              (|Union| 6 '#2#) (|Mapping| 52 52) (|PositiveInteger|)
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 1 0 25 24 0 0 3 11 2 0 0 23 3 3 11 12
                                  13 2 17 19 18 0 0 11 14 0 0 0 0 2 11 11 0 0 0
                                  0 0 0 0 0 5 6 10 0 0 0 0 0 0 0 0 0 0 0 0 0 2
                                  3 4 7 8 9 15 16 18 18))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                |IntegralDomain&| |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&| NIL
                |Module&| NIL NIL |Module&| NIL |PartialDifferentialRing&|
                |DifferentialRing&| |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL |Evalable&|
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 19 16 52)
                 (|PolynomialCategory| 6 52 16)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 52) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 52) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|Algebra| 15) (|Algebra| 6) (|PartialDifferentialRing| 16)
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
                 (|RetractableTo| 19) (|RetractableTo| 16)
                 (|InnerEvalable| 16 $$) (|InnerEvalable| 16 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 58) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|RetractableTo| 15) (|RetractableTo| 35)
                 (|InnerEvalable| 19 $$) (|InnerEvalable| 19 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
