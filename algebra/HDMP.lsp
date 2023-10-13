
(/VERSIONCHECK 2) 

(DEFUN |HomogeneousDistributedMultivariatePolynomial| (&REST #1=#:G161)
  (PROG ()
    (RETURN
     (PROG (#2=#:G162)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|HomogeneousDistributedMultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|HomogeneousDistributedMultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |HomogeneousDistributedMultivariatePolynomial;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|HomogeneousDistributedMultivariatePolynomial|))))))))))) 

(DEFUN |HomogeneousDistributedMultivariatePolynomial;| (|#1| |#2|)
  (PROG (#1=#:G160 |pv$| #2=#:G159 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #3=(|HomogeneousDistributedMultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$|
            (LIST '|HomogeneousDistributedMultivariatePolynomial| DV$1 DV$2)
            . #3#)
      (LETT $ (GETREFV 55) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2|
                                                         '(|canonicalUnitNormal|))
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
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#2|
                                                          '(|IntegralDomain|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
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
                                                               '(|GcdDomain|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|CommutativeRing|))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#2|
                                                          '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))))
                      . #3#))
      (|haddProp| |$ConstructorCache|
                  '|HomogeneousDistributedMultivariatePolynomial|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND
       (LETT #1#
             (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #3#)
       (|augmentPredVector| $ 8388608))
      (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 16777216))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|HomogeneousDistributedMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|GeneralDistributedMultivariatePolynomial| 6 7 48)
              (|local| |#1|) (|local| |#2|) (|Union| 26 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 31)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 31 $)
              (|Union| $ '#1#) (|Fraction| 31) (|OrderedVariableList| 6)
              (|NonNegativeInteger|) (|Boolean|) (|List| $)
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 31) (|Record| (|:| |mat| 24) (|:| |vec| (|Vector| 31)))
              (|Vector| $) (|Factored| 21) (|Union| 29 '#1#) (|List| 21)
              (|Union| 16 '#2="failed") (|Integer|) (|Union| 31 '#2#)
              (|List| 31) (|List| 17) (|Union| 20 '#3="failed")
              (|Record| (|:| |var| 17) (|:| |exponent| 18)) (|Union| 36 '#3#)
              (|List| 18) (|SparseUnivariatePolynomial| 7)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 17 '#3#)
              (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|List| 7) (|List| 46) (|Equation| $) (|Mapping| 7 7)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 18)
              (|Union| 7 '#2#) (|Mapping| 48 48) (|PositiveInteger|)
              (|SingleInteger|) (|String|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 1 1 23 22 0 3 11 2 0 0 21 3 3 11 12 13 2 17
                                  0 0 11 14 0 0 0 0 2 11 11 0 0 0 0 0 0 0 0 5 6
                                  10 0 0 0 0 0 0 0 0 0 0 0 2 3 4 7 8 9 15 16))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |UniqueFactorizationDomain&| |GcdDomain&| |IntegralDomain&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&| NIL
                |Module&| NIL NIL |Module&| NIL |Ring&| NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 7
                                       (|HomogeneousDirectProduct| (LENGTH 6)
                                                                   18)
                                       (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 7) (|Algebra| $$)
                 (|Algebra| 16) (|Algebra| 7)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|LinearlyExplicitRingOver| 7) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|Module| 16)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 7)
                 (|LinearlyExplicitRingOver| 31) (|Ring|) (|BiModule| 7 7)
                 (|BiModule| 16 16) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 7)
                 (|RightModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 16) (|RightModule| 16) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 31)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 7)
                 (|SetCategory|) (|RetractableTo| (|OrderedVariableList| 6))
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 54) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 11) (|ConvertibleTo| 12) (|ConvertibleTo| 10)
                 (|RetractableTo| 16) (|RetractableTo| 31))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
