
(SDEFUN |LODO;coerce;$Of;1| ((|l| ($)) ($ (|OutputForm|)))
        (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 17))) 

(SDEFUN |LODO;elt;$2A;2| ((|p| ($)) (|a| (A)) ($ (A)))
        (SPADCALL |p| (|spadConstant| $ 20) |a| (QREFELT $ 21))) 

(SDEFUN |LODO;symmetricProduct;3$;3| ((|a| ($)) (|b| ($)) ($ ($)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 25))) 

(SDEFUN |LODO;symmetricPower;$Nni$;4|
        ((|a| ($)) (|n| (|NonNegativeInteger|)) ($ ($)))
        (SPADCALL |a| |n| (QREFELT $ 7) (QREFELT $ 28))) 

(SDEFUN |LODO;directSum;3$;5| ((|a| ($)) (|b| ($)) ($ ($)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G158)
  (SPROG NIL
         (PROG (#2=#:G159)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |LinearOrdinaryDifferentialOperator;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G155 NIL) (#2=#:G157 NIL) (#3=#:G156 NIL) ($ NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2))
    (LETT $ (GETREFV 63))
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
                                                       '(|CommutativeRing|))
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
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
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
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 134217728))
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 34359738368))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 12
              (|SparseUnivariateSkewPolynomial| |#1| (|spadConstant| $ 11)
                                                |#2|))
    (QSETREFV $ 16 (SPADCALL 'D (QREFELT $ 15)))
    (COND
     ((|testBitVector| |pv$| 27)
      (PROGN
       (QSETREFV $ 26
                 (CONS (|dispatchFunction| |LODO;symmetricProduct;3$;3|) $))
       (QSETREFV $ 29
                 (CONS (|dispatchFunction| |LODO;symmetricPower;$Nni$;4|) $))
       (QSETREFV $ 31 (CONS (|dispatchFunction| |LODO;directSum;3$;5|) $)))))
    $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 6
                                                (NRTEVAL (|spadConstant| $ 11))
                                                (NRTEVAL (QREFELT $ 7)))
              (|local| |#1|) (|local| |#2|) (0 . |One|) (4 . |One|)
              (|Automorphism| 6) (8 . |One|) '|Rep| (|OutputForm|) (|Symbol|)
              (12 . |coerce|) '|outputD| (17 . |outputForm|)
              |LODO;coerce;$Of;1| (23 . |Zero|) (27 . |Zero|) (31 . |apply|)
              |LODO;elt;$2A;2| (|Mapping| 6 6)
              (|LinearOrdinaryDifferentialOperatorsOps| 6 $$)
              (38 . |symmetricProduct|) (45 . |symmetricProduct|)
              (|NonNegativeInteger|) (51 . |symmetricPower|)
              (58 . |symmetricPower|) (64 . |directSum|) (71 . |directSum|)
              (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 35))) (|Matrix| $)
              (|Vector| $) (|Integer|) (|Matrix| 35) (|Boolean|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 35) (|Record| (|:| |k| 27) (|:| |c| 6)) (|List| 41)
              (|Mapping| 6 27)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 40 '#1="failed") (|Union| 35 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 6))) (|List| $)
              (|List| 53) (|SingletonAsOrderedSet|) (|List| 27)
              (|Union| 53 '"failed") (|Mapping| 27 27) (|Union| 6 '#1#)
              (|List| 6) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 77 |zero?| 83 |variables| 88 |unitNormal| 93 |unitCanonical|
              98 |unit?| 103 |totalDegreeSorted| 108 |totalDegree| 114
              |symmetricSquare| 125 |symmetricProduct| 130 |symmetricPower| 136
              |support| 142 |subtractIfCan| 147 |smaller?| 153 |sample| 159
              |right_ext_ext_GCD| 163 |rightRemainder| 169 |rightRecip| 175
              |rightQuotient| 180 |rightPower| 186 |rightLcm| 198 |rightGcd|
              204 |rightExtendedGcd| 210 |rightExactQuotient| 216 |rightDivide|
              222 |retractIfCan| 228 |retract| 243 |reductum| 258
              |reducedSystem| 263 |recip| 285 |primitivePart| 290
              |primitiveMonomials| 295 |pomopo!| 300 |opposite?| 308 |one?| 314
              |numberOfMonomials| 319 |monomials| 324 |monomial?| 329
              |monomial| 334 |monicRightDivide| 354 |monicLeftDivide| 360
              |minimumDegree| 366 |mapExponents| 371 |map| 377 |mainVariable|
              383 |listOfTerms| 388 |linearExtend| 393 |leftRemainder| 399
              |leftRecip| 405 |leftQuotient| 410 |leftPower| 416 |leftLcm| 428
              |leftGcd| 434 |leftExtendedGcd| 440 |leftExactQuotient| 446
              |leftDivide| 452 |leadingTerm| 458 |leadingSupport| 463
              |leadingMonomial| 468 |leadingCoefficient| 473 |latex| 478
              |hashUpdate!| 483 |hash| 489 |ground?| 494 |ground| 499 |fmecg|
              504 |exquo| 512 |elt| 524 |directSum| 530 |degree| 536 |content|
              553 |constructOrdered| 558 |construct| 563 |commutator| 568
              |coerce| 574 |coefficients| 599 |coefficient| 604 |charthRoot|
              624 |characteristic| 629 |binomThmExpt| 633 |associator| 640
              |associates?| 647 |apply| 653 |antiCommutator| 660 |annihilate?|
              666 |adjoint| 672 ^ 677 |Zero| 689 |One| 693 D 697 = 701 / 707 -
              713 + 724 * 730)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 0 0 0 1 2 3 4 5 11 0 11 13 0 0 1 5 10 0 0
                                  0 1 10 20 10 0 0 0 0 0 1 1 20 11 12 26 13 13
                                  0 0 25 13 0 0 0 9 0 0 6 7 0 0 0 0 4 6 7 8
                                  10))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| NIL NIL |EntireRing&|
                |Algebra&| NIL |FreeModuleCategory&| |Rng&| NIL NIL NIL
                |Module&| |Module&| |FullyLinearlyExplicitOver&| NIL NIL NIL
                NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 27 53)
                 (|FiniteAbelianMonoidRing| 6 27) (|AbelianMonoidRing| 6 27)
                 (|Algebra| 40) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 6) (|Ring|)
                 (|FreeModuleCategory| 6 27) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 27) (|Module| 40)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|IndexedProductCategory| 6 27) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 40 40)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 35)
                 (|NonAssociativeRing|) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 40) (|RightModule| 40)
                 (|RightModule| 35) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| 6) (|SetCategory|) (|RetractableTo| 40)
                 (|RetractableTo| 35) (|Eltable| 6 6) (|CoercibleFrom| 6)
                 (|BasicType|) (|CoercibleTo| 13) (|noZeroDivisors|)
                 (|CoercibleFrom| 40) (|CoercibleFrom| 35)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 62
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 37 0 0 1 1 34 37 0 1 1 0 52 0 1
                                    1 30 39 0 1 1 30 0 0 1 1 30 37 0 1 2 0 27 0
                                    52 1 1 0 27 0 1 2 0 27 0 52 1 1 27 0 0 1 2
                                    27 0 0 0 26 2 27 0 0 27 29 1 0 54 0 1 2 35
                                    38 0 0 1 2 9 37 0 0 1 0 34 0 1 2 27 44 0 0
                                    1 2 27 0 0 0 1 1 32 38 0 1 2 27 0 0 0 1 2
                                    32 0 0 27 1 2 0 0 0 59 1 2 27 0 0 0 1 2 27
                                    0 0 0 1 2 27 45 0 0 1 2 27 38 0 0 1 2 27 46
                                    0 0 1 1 6 47 0 1 1 7 48 0 1 1 0 57 0 1 1 6
                                    40 0 1 1 7 35 0 1 1 0 6 0 1 1 14 0 0 1 2 19
                                    32 33 34 1 1 19 36 33 1 1 10 49 33 1 2 10
                                    50 33 34 1 1 32 38 0 1 1 17 0 0 1 1 13 51 0
                                    1 4 0 0 0 6 27 0 1 2 34 37 0 0 1 1 32 37 0
                                    1 1 0 27 0 1 1 0 51 0 1 1 0 37 0 1 3 0 0 0
                                    53 27 1 3 0 0 0 52 54 1 2 0 0 6 27 1 2 15
                                    46 0 0 1 2 15 46 0 0 1 1 0 27 0 1 2 0 0 56
                                    0 1 2 0 0 23 0 1 1 0 55 0 1 1 0 42 0 1 2 5
                                    6 43 0 1 2 27 0 0 0 1 1 32 38 0 1 2 27 0 0
                                    0 1 2 32 0 0 27 1 2 0 0 0 59 1 2 27 0 0 0 1
                                    2 27 0 0 0 1 2 27 45 0 0 1 2 27 38 0 0 1 2
                                    27 46 0 0 1 1 14 41 0 1 1 14 27 0 1 1 14 0
                                    0 1 1 14 6 0 1 1 0 61 0 1 2 0 60 60 0 1 1 0
                                    62 0 1 1 0 37 0 1 1 0 6 0 1 4 10 0 0 27 6 0
                                    1 2 30 38 0 0 1 2 4 38 0 6 1 2 0 6 0 6 22 2
                                    27 0 0 0 31 2 0 27 0 53 1 2 0 54 0 52 1 1 0
                                    27 0 1 1 17 6 0 1 1 14 0 42 1 1 0 0 42 1 2
                                    33 0 0 0 1 1 31 0 35 1 1 28 0 0 1 1 16 0 40
                                    1 1 0 0 6 1 1 0 13 0 18 1 0 58 0 1 3 0 0 0
                                    52 54 1 3 0 0 0 53 27 1 2 0 6 0 27 1 1 2 38
                                    0 1 0 33 27 1 3 29 0 0 0 27 1 3 33 0 0 0 0
                                    1 2 30 37 0 0 1 3 0 6 0 6 6 21 2 0 0 0 0 1
                                    2 33 37 0 0 1 1 0 0 0 1 2 32 0 0 27 1 2 0 0
                                    0 59 1 0 34 0 19 0 32 0 8 0 0 0 1 2 0 37 0
                                    0 1 2 27 0 0 6 1 2 36 0 0 0 1 1 36 0 0 1 2
                                    0 0 0 0 1 2 19 0 0 35 1 2 36 0 35 0 1 2 34
                                    0 27 0 1 2 1 0 40 0 1 2 1 0 0 40 1 2 0 0 6
                                    0 1 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 59 0
                                    1)))))
           '|lookupComplete|)) 
