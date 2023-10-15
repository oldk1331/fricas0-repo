
(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator3;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator3| (&REST #1=#:G133)
  (SPROG NIL
         (PROG (#2=#:G134)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator3|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperator3|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator3;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator3|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator3;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G129 NIL) (#2=#:G130 NIL) (#3=#:G131 NIL) (#4=#:G132 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|LinearOrdinaryDifferentialOperator3|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator3| DV$1 DV$2 DV$3)
          . #5#)
    (LETT $ (GETREFV 42) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#3| '(|EntireRing|))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#3|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#3| '(|Comparable|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (|HasCategory| |#3|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #4#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|SemiRing|))
                                        (OR
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#3| '(|GcdDomain|))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3#
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #2#
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #3# #1# #2#
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|Field|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator3|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| |#3| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 33554432))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 67108864))
    (AND
     (OR (|HasCategory| |#3| '(|EntireRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|SemiRing|)))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #3# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #2# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #1# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 8 (NRTEVAL (ELT $ 10)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|LinearOrdinaryDifferentialOperator3Aux| 6 7 8)
              (0 . |delta_deriv|)
              (|Record| (|:| |mat| 14) (|:| |vec| (|Vector| 15))) (|Matrix| $)
              (|Vector| $) (|Matrix| 15) (|Integer|) (|NonNegativeInteger|)
              (|Boolean|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 15)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 20 '#1="failed") (|Union| 15 '#1#) (|Matrix| 8)
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 8))) (|List| $)
              (|List| 30) (|SingletonAsOrderedSet|) (|List| 16)
              (|Union| 30 '"failed") (|Mapping| 16 16) (|List| 8)
              (|Union| 8 '#1#) (|Mapping| 8 8) (|PositiveInteger|)
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 0 0 0 0 1 9 11 1 2 3 4 9 10 11 0 1 4 12 0 0
                                  1 1 4 12 14 20 22 13 0 24 13 0 0 8 0 0 0 0 0
                                  0 4 5 6 7 9))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |FullyLinearlyExplicitOver&|
                |Algebra&| |Module&| NIL NIL |EntireRing&| NIL NIL |Module&|
                NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |AbelianSemiGroup&| |SemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 8)
                 (|UnivariateSkewPolynomialCategory| 8)
                 (|MaybeSkewPolynomialCategory| 8 16 30)
                 (|FiniteAbelianMonoidRing| 8 16) (|AbelianMonoidRing| 8 16)
                 (|Algebra| 20) (|FullyLinearlyExplicitOver| 8) (|Algebra| 8)
                 (|Module| 20) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 8)
                 (|LinearlyExplicitOver| 15) (|Module| 8) (|BiModule| 8 8)
                 (|BiModule| 20 20) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 8) (|RightModule| 8) (|LeftModule| 20)
                 (|RightModule| 20) (|RightModule| $$) (|Rng|)
                 (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 8)
                 (|SetCategory|) (|Eltable| 8 8) (|RetractableTo| 8)
                 (|BasicType|) (|CoercibleTo| 40) (|noZeroDivisors|)
                 (|RetractableTo| 20) (|RetractableTo| 15)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 10 '(1 9 8 8 10)))))
           '|lookupIncomplete|)) 
