
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |UnivariateFormalPowerSeries;|)) 

(DEFUN |UnivariateFormalPowerSeries| (#1=#:G143)
  (PROG ()
    (RETURN
     (PROG (#2=#:G144)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateFormalPowerSeries|)
                                           '|domainEqualList|)
                . #3=(|UnivariateFormalPowerSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|UnivariateFormalPowerSeries;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariateFormalPowerSeries|))))))))))) 

(DEFUN |UnivariateFormalPowerSeries;| (|#1|)
  (PROG (|pv$| #1=#:G135 #2=#:G136 #3=#:G137 #4=#:G138 #5=#:G139 #6=#:G142 $
         |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|UnivariateFormalPowerSeries|))
      (LETT |dv$| (LIST '|UnivariateFormalPowerSeries| DV$1) . #7#)
      (LETT $ (GETREFV 32) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #7#)
                                          (OR #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|NonNegativeInteger|)
                                                                 (|devaluate|
                                                                  |#1|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PartialDifferentialRing|
                                                            (|Symbol|)))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (|HasCategory| (|NonNegativeInteger|)
                                                         '(|SemiGroup|))
                                          (|HasSignature| |#1|
                                                          (LIST '^
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|NonNegativeInteger|))))
                                          (AND
                                           (|HasSignature| |#1|
                                                           (LIST '^
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|))))
                                           (|HasSignature| |#1|
                                                           (LIST '|coerce|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|)))))
                                          (LETT #5#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #7#)
                                          (OR #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              #5#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #5#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #7#)
                                          (OR #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|NonNegativeInteger|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #1# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|NonNegativeInteger|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|AlgebraicallyClosedFunctionSpace|
                                                             (|Integer|)))
                                            (|HasCategory| |#1|
                                                           '(|PrimitiveFunctionCategory|))
                                            (|HasCategory| |#1|
                                                           '(|TranscendentalFunctionCategory|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|integrate|
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Symbol|))))
                                            (|HasSignature| |#1|
                                                            (LIST '|variables|
                                                                  (LIST
                                                                   '(|List|
                                                                     (|Symbol|))
                                                                   (|devaluate|
                                                                    |#1|))))))))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|UnivariateFormalPowerSeries|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 33554432))
      (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 67108864))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #5#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 134217728))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #4#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 268435456))
      (AND
       (OR #3#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR #2#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1073741824))
      (AND
       (OR #1#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|NonNegativeInteger|)
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 2147483648))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariateFormalPowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariateTaylorSeries| 6 (NRTEVAL '|x|)
                                        (NRTEVAL (|spadConstant| $ 7)))
              (|local| |#1|) (0 . |Zero|) (|Boolean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|List| 12) (|Symbol|) (|List| 14)
              (|NonNegativeInteger|) (|Integer|) (|Variable| (NRTEVAL '|x|))
              (|Fraction| 15) (|Stream| 6)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6) (|Polynomial| 6)
              (|Mapping| 6 15) (|Record| (|:| |k| 14) (|:| |c| 6))
              (|Stream| 22) (|PositiveInteger|) (|List| 26)
              (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 2 1 2 5 1 6 2 2 3 4 5 8 7 0 1 6 15 0
                                  0 1 1 6 13 15 19 17 21 0 17 23 0 0 0 1 0 0 0
                                  6 2 14 9 1 1 1 1 1 1))
            (CONS
             '#(|UnivariateTaylorSeriesCategory&|
                |UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |Module&| NIL |Module&| |EntireRing&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |BasicType&| NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariateTaylorSeriesCategory| 6)
                 (|UnivariatePowerSeriesCategory| 6 14)
                 (|PowerSeriesCategory| 6 14 26) (|AbelianMonoidRing| 6 14)
                 (|IntegralDomain|) (|Algebra| 17) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 17) (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 12) (|DifferentialRing|)
                 (|BiModule| 6 6) (|BiModule| 17 17) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 17)
                 (|RightModule| 17) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 31) (|CommutativeStar|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 7 '(0 6 0 7)))))
           '|lookupIncomplete|)) 
