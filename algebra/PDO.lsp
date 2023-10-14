
(SDEFUN |PDO;adjoint;2$;1| ((|x| $) ($ $))
        (SPROG
         ((|xu| (|Sup|)) (|res| ($)) (|sign| ($)) (|d| (|NonNegativeInteger|))
          (|v| (|Var|)) (#1=#:G112 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2
                            (LETT #1# (SPADCALL |x| (QREFELT $ 17))
                                  . #2=(|PDO;adjoint;2$;1|))
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
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

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G138)
  (SPROG NIL
         (PROG (#2=#:G139)
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
   ((|pv$| NIL) (#1=#:G137 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|PartialDifferentialOperator|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 62) . #2#)
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
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
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
                                        (|HasCategory| |#1| '(|LeftOreRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 262144))
    (AND (|HasCategory| $ '(|CommutativeRing|)) (|augmentPredVector| $ 524288))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1048576))
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
              (92 . |reductum|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 46) (|Matrix| 46) (|Matrix| $)
              (|Record| (|:| |mat| 41) (|:| |vec| (|Vector| 46))) (|Vector| $)
              (|Union| 40 '#1="failed") (|Integer|) (|Union| 46 '#1#)
              (|List| 7) (|List| $) (|List| 28) (|Matrix| 6)
              (|Record| (|:| |mat| 51) (|:| |vec| (|Vector| 6)))
              (|Mapping| 54 54) (|IndexedExponents| 7) (|List| 6)
              (|Union| 6 '#1#) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |subtractIfCan| 145 |smaller?| 151 |sample| 157
              |retractIfCan| 161 |retract| 176 |reductum| 191 |reducedSystem|
              196 |recip| 218 |primitivePart| 223 |primitiveMonomials| 228
              |pomopo!| 233 |opposite?| 241 |one?| 247 |numberOfMonomials| 252
              |monomials| 257 |monomial?| 262 |monomial| 267 |minimumDegree|
              287 |mapExponents| 292 |map| 298 |mainVariable| 304
              |leadingMonomial| 309 |leadingCoefficient| 314 |latex| 319
              |hashUpdate!| 324 |hash| 330 |ground?| 335 |ground| 340 |exquo|
              345 |degree| 357 |content| 374 |coerce| 379 |coefficients| 404
              |coefficient| 409 |charthRoot| 429 |characteristic| 434
              |binomThmExpt| 438 |associates?| 445 |annihilate?| 451 |adjoint|
              457 ^ 462 |Zero| 474 |One| 478 D 482 = 487 / 493 - 499 + 510 *
              516)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 0 0 0 2 0 1 2 5 0 1 6 2 3 4 5 7 14 15 0 0 1
                                  8 0 0 0 0 1 1 9 0 0 0 0 0 0 0 0 13 0 0 0 0 0
                                  0 6 7 10 11 12))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| NIL |Module&| NIL |Module&|
                NIL NIL |Module&| |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |Monoid&|
                NIL |AbelianMonoid&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| 40) (|Algebra| $$) (|Algebra| 6)
                 (|LinearlyExplicitRingOver| 6) (|Module| 40)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 46)
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 40 40)
                 (|BiModule| $$ $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| 40) (|RightModule| 40)
                 (|RightModule| $$) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|AbelianMonoid|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|unitsKnown|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 61) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 40) (|RetractableTo| 46)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 61
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 0 14 0 1 1 0 48
                                    0 1 1 21 39 0 1 1 21 0 0 1 1 21 14 0 1 2 0
                                    28 0 48 1 2 0 28 0 48 1 1 0 28 0 1 2 0 38 0
                                    0 1 2 13 14 0 0 1 0 0 0 1 1 10 45 0 1 1 11
                                    47 0 1 1 0 56 0 1 1 10 40 0 1 1 11 46 0 1 1
                                    0 6 0 1 1 0 0 0 1 1 14 41 42 1 2 14 43 42
                                    44 1 1 0 51 42 1 2 0 52 42 44 1 1 0 38 0 1
                                    1 18 0 0 1 1 0 49 0 1 4 0 0 0 6 54 0 1 2 0
                                    14 0 0 1 1 0 14 0 1 1 0 28 0 1 1 0 49 0 1 1
                                    0 14 0 1 3 0 0 0 7 28 33 3 0 0 0 48 50 1 2
                                    0 0 6 54 1 1 0 54 0 1 2 0 0 53 0 1 2 0 0 11
                                    0 1 1 0 16 0 17 1 0 0 0 1 1 0 6 0 1 1 0 58
                                    0 1 2 0 60 60 0 1 1 0 59 0 1 1 0 14 0 15 1
                                    0 6 0 1 2 21 38 0 0 1 2 7 38 0 6 1 2 0 50 0
                                    48 1 2 0 28 0 7 1 1 0 54 0 1 1 18 6 0 1 1
                                    19 0 0 1 1 17 0 40 1 1 0 0 46 1 1 0 0 6 1 1
                                    0 61 0 1 1 0 55 0 1 3 0 0 0 48 50 1 3 0 0 0
                                    7 28 1 2 0 6 0 54 1 1 3 38 0 1 0 0 28 1 3
                                    20 0 0 0 28 1 2 21 14 0 0 1 2 0 14 0 0 1 1
                                    0 0 0 22 2 0 0 0 28 1 2 0 0 0 57 1 0 0 0 21
                                    0 0 0 30 1 0 0 7 1 2 0 14 0 0 1 2 16 0 0 6
                                    1 1 0 0 0 32 2 0 0 0 0 1 2 0 0 0 0 36 2 1 0
                                    0 40 1 2 1 0 40 0 1 2 0 0 28 0 1 2 0 0 46 0
                                    1 2 0 0 6 0 1 2 0 0 0 0 34 2 0 0 0 6 1 2 0
                                    0 57 0 1)))))
           '|lookupComplete|)) 
