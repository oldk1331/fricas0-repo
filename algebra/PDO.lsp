
(SDEFUN |PDO;adjoint;2$;1| ((|x| $) ($ $))
        (SPROG
         ((|xu| (|Sup|)) (|res| ($)) (|sign| ($)) (|d| (|NonNegativeInteger|))
          (|v| (|Var|)) (#1=#:G113 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2
                            (LETT #1# (SPADCALL |x| (QREFELT $ 17))
                                  . #2=(|PDO;adjoint;2$;1|))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                          (|Union| (QREFELT $ 7) "failed")
                                          #1#))
                        . #2#)
                  (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 20)) . #2#)
                  (LETT |res| (|spadConstant| $ 21) . #2#)
                  (LETT |xu| (SPADCALL (ELT $ 22) |xu| (QREFELT $ 24)) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |xu| (|spadConstant| $ 26) (QREFELT $ 27)))
                         (GO G191)))
                       (SEQ (LETT |d| (SPADCALL |xu| (QREFELT $ 29)) . #2#)
                            (LETT |sign|
                                  (COND
                                   ((ODDP |d|)
                                    (SPADCALL (|spadConstant| $ 30)
                                              (QREFELT $ 32)))
                                   ('T (|spadConstant| $ 30)))
                                  . #2#)
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |sign|
                                                       (SPADCALL
                                                        (|spadConstant| $ 30)
                                                        |v| |d| (QREFELT $ 33))
                                                       (QREFELT $ 34))
                                             (SPADCALL |xu| (QREFELT $ 35))
                                             (QREFELT $ 34))
                                            (QREFELT $ 36))
                                  . #2#)
                            (EXIT
                             (LETT |xu| (SPADCALL |xu| (QREFELT $ 37)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperator;|)) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G140)
  (SPROG NIL
         (PROG (#2=#:G141)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialDifferentialOperator|)
                                               '|domainEqualList|)
                    . #3=(|PartialDifferentialOperator|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PartialDifferentialOperator;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialDifferentialOperator|)))))))))) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G138 NIL) (#2=#:G139 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|PartialDifferentialOperator|))
    (LETT DV$2 (|devaluate| |#2|) . #3#)
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2) . #3#)
    (LETT $ (GETREFV 62) . #3#)
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
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
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
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|LeftOreRing|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# (|HasCategory| |#1| '(|Ring|)))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 67108864))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #1#
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 17179869184))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 13 (|SparseUnivariatePolynomial| $))
    $))) 

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT $ 10))
                                                  (NRTEVAL (ELT $ 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |Zero|) |PDO;adjoint;2$;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |Zero|) (40 . |Zero|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |One|) (59 . |One|) (63 . -)
              (68 . |monomial|) (75 . *) (81 . |leadingCoefficient|) (86 . +)
              (92 . |reductum|)
              (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 42))) (|Matrix| $)
              (|Vector| $) (|Matrix| 42) (|Integer|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 42) (|Union| 45 '#1="failed") (|Union| 42 '#1#)
              (|Matrix| 6) (|Record| (|:| |mat| 48) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 7) (|List| $) (|List| 7) (|List| 28)
              (|Mapping| 50 50) (|List| 6) (|Union| 6 '#1#) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |subtractIfCan| 145 |smaller?| 151 |sample| 157
              |retractIfCan| 161 |retract| 176 |reductum| 191 |reducedSystem|
              196 |recip| 218 |primitivePart| 223 |primitiveMonomials| 228
              |pomopo!| 233 |opposite?| 241 |one?| 247 |numberOfMonomials| 252
              |monomials| 257 |monomial?| 262 |monomial| 267 |minimumDegree|
              287 |mapExponents| 292 |map| 298 |mainVariable| 304
              |leadingMonomial| 309 |leadingCoefficient| 314 |latex| 319
              |hashUpdate!| 324 |hash| 330 |ground?| 335 |ground| 340 |fmecg|
              345 |exquo| 353 |degree| 365 |content| 382 |coerce| 387
              |coefficients| 412 |coefficient| 417 |charthRoot| 437
              |characteristic| 442 |binomThmExpt| 446 |associates?| 453
              |annihilate?| 459 |adjoint| 465 ^ 470 |Zero| 482 |One| 486 D 490
              = 495 / 501 - 507 + 518 * 524)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 0 0 1 9 1 2 3 4 9 10 11 0 1 4 12 0 0 1 1
                                  4 12 14 26 25 13 0 24 13 0 0 8 0 0 0 0 0 4 5
                                  6 7 9))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |FullyLinearlyExplicitOver&|
                |Module&| NIL NIL |EntireRing&| NIL NIL NIL NIL NIL NIL |Ring&|
                NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |Monoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|Algebra| 45)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 45)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 42)
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|BiModule| 6 6) (|BiModule| 45 45) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 45)
                 (|RightModule| 45) (|RightModule| $$) (|Rng|)
                 (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 61) (|noZeroDivisors|) (|RetractableTo| 45)
                 (|RetractableTo| 42) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 61
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 30 14 0 1 1 0 52
                                    0 1 1 29 44 0 1 1 29 0 0 1 1 29 14 0 1 2 0
                                    28 0 52 1 2 0 28 0 52 1 1 0 28 0 1 2 31 43
                                    0 0 1 2 8 14 0 0 1 0 30 0 1 1 5 46 0 1 1 6
                                    47 0 1 1 0 56 0 1 1 5 45 0 1 1 6 42 0 1 1 0
                                    6 0 1 1 0 0 0 1 2 19 38 39 40 1 1 19 41 39
                                    1 1 9 48 39 1 2 9 49 39 40 1 1 33 43 0 1 1
                                    18 0 0 1 1 13 51 0 1 4 0 0 0 6 50 0 1 2 30
                                    14 0 0 1 1 33 14 0 1 1 0 28 0 1 1 0 51 0 1
                                    1 0 14 0 1 3 0 0 0 52 53 1 3 0 0 0 7 28 33
                                    2 0 0 6 50 1 1 0 50 0 1 2 0 0 54 0 1 2 0 0
                                    11 0 1 1 0 16 0 17 1 0 0 0 1 1 0 6 0 1 1 0
                                    58 0 1 2 0 60 60 0 1 1 0 59 0 1 1 0 14 0 15
                                    1 0 6 0 1 4 9 0 0 50 6 0 1 2 29 43 0 0 1 2
                                    4 43 0 6 1 2 0 53 0 52 1 2 0 28 0 7 1 1 0
                                    50 0 1 1 18 6 0 1 1 27 0 0 1 1 35 0 42 1 1
                                    17 0 45 1 1 0 0 6 1 1 0 61 0 1 1 0 55 0 1 3
                                    0 0 0 7 28 1 3 0 0 0 52 53 1 2 0 6 0 50 1 1
                                    2 43 0 1 0 34 28 1 3 28 0 0 0 28 1 2 29 14
                                    0 0 1 2 34 14 0 0 1 1 0 0 0 22 2 33 0 0 28
                                    1 2 0 0 0 57 1 0 30 0 21 0 33 0 30 1 0 0 7
                                    1 2 0 14 0 0 1 2 15 0 0 6 1 1 32 0 0 32 2
                                    32 0 0 0 1 2 0 0 0 0 36 2 32 0 42 0 1 2 30
                                    0 28 0 1 2 1 0 0 45 1 2 1 0 45 0 1 2 0 0 6
                                    0 1 2 0 0 0 0 34 2 0 0 0 6 1 2 0 0 57 0
                                    1)))))
           '|lookupComplete|)) 
