
(SDEFUN |PDO;adjoint;2%;1| ((|x| (%)) (% (%)))
        (SPROG
         ((|xu| (|Sup|)) (|res| (%)) (|sign| (%)) (|d| (|NonNegativeInteger|))
          (|v| (|Var|)) (#1=#:G113 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 17)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                          (|Union| (QREFELT % 7) "failed")
                                          #1#)))
                  (LETT |xu| (SPADCALL |x| |v| (QREFELT % 20)))
                  (LETT |res| (|spadConstant| % 21))
                  (LETT |xu| (SPADCALL (ELT % 22) |xu| (QREFELT % 24)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |xu| (|spadConstant| % 26) (QREFELT % 27)))
                         (GO G191)))
                       (SEQ (LETT |d| (SPADCALL |xu| (QREFELT % 29)))
                            (LETT |sign|
                                  (COND
                                   ((ODDP |d|)
                                    (SPADCALL (|spadConstant| % 30)
                                              (QREFELT % 32)))
                                   ('T (|spadConstant| % 30))))
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |sign|
                                                       (SPADCALL
                                                        (|spadConstant| % 30)
                                                        |v| |d| (QREFELT % 33))
                                                       (QREFELT % 34))
                                             (SPADCALL |xu| (QREFELT % 35))
                                             (QREFELT % 34))
                                            (QREFELT % 36)))
                            (EXIT (LETT |xu| (SPADCALL |xu| (QREFELT % 37)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperator;|)) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G149)
  (SPROG NIL
         (PROG (#2=#:G150)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialDifferentialOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PartialDifferentialOperator;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialDifferentialOperator|)))))))))) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G144 NIL) (#2=#:G145 NIL) (#3=#:G147 NIL) (#4=#:G146 NIL)
    (#5=#:G148 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2))
    (LETT % (GETREFV 66))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|LeftOreRing|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #5# (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
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
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
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
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #5#) #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
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
                                         #1# #2#)
                                        (OR #5#
                                            (|HasCategory|
                                             (|IndexedExponents| |#2|)
                                             '(|Comparable|)))))))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #1#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 137438953472))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 13 (|SparseUnivariatePolynomial| %))
    %))) 

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT % 10))
                                                  (NRTEVAL (ELT % 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| %)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |Zero|) |PDO;adjoint;2%;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |Zero|) (40 . |Zero|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |One|) (59 . |One|) (63 . -)
              (68 . |monomial|) (75 . *) (81 . |leadingCoefficient|) (86 . +)
              (92 . |reductum|) (|Matrix| 42) (|Matrix| %)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 42))) (|Vector| %)
              (|Integer|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 42) (|IndexedExponents| 7)
              (|Record| (|:| |k| 46) (|:| |c| 6)) (|List| 47) (|Mapping| 6 46)
              (|Union| 45 '#1="failed") (|Union| 42 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 52) (|:| |vec| (|Vector| 6))) (|List| %)
              (|List| 7) (|List| 28) (|Mapping| 46 46) (|Union| 6 '#1#)
              (|List| 6) (|List| 46) (|PositiveInteger|) (|HashState|)
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |support| 145 |subtractIfCan| 150 |smaller?|
              156 |sample| 162 |rightRecip| 166 |rightPower| 171 |retractIfCan|
              183 |retract| 198 |reductum| 213 |reducedSystem| 218 |recip| 240
              |primitivePart| 245 |primitiveMonomials| 250 |pomopo!| 255
              |opposite?| 263 |one?| 269 |numberOfMonomials| 274 |monomials|
              279 |monomial?| 284 |monomial| 289 |minimumDegree| 309
              |mapExponents| 314 |map| 320 |mainVariable| 326 |listOfTerms| 331
              |linearExtend| 336 |leftRecip| 342 |leftPower| 347 |leadingTerm|
              359 |leadingSupport| 364 |leadingMonomial| 369
              |leadingCoefficient| 374 |latex| 379 |hashUpdate!| 384 |hash| 390
              |ground?| 395 |ground| 400 |fmecg| 405 |exquo| 413 |degree| 425
              |content| 442 |constructOrdered| 447 |construct| 452 |commutator|
              457 |coerce| 463 |coefficients| 488 |coefficient| 493
              |charthRoot| 513 |characteristic| 518 |binomThmExpt| 522
              |associator| 529 |associates?| 536 |antiCommutator| 542
              |annihilate?| 548 |adjoint| 554 ^ 559 |Zero| 571 |One| 575 D 579
              = 584 / 590 - 596 + 607 * 613)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(0 0 0 0 1 2 3 4 11 12 0 12 14 0 0 1 5 10 0 0
                                  0 1 10 22 10 0 0 0 0 0 1 1 22 12 13 25 14 14
                                  0 0 28 14 0 0 0 9 0 0 6 7 0 0 0 4 6 7 8 10))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| NIL NIL |EntireRing&| NIL NIL
                |FreeModuleCategory&| |Rng&| NIL NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|Algebra| 45)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|EntireRing|)
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7))
                 (|Ring|) (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|Module| 45) (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 45 45)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 42)
                 (|NonAssociativeRing|) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 45) (|RightModule| 45)
                 (|RightModule| 42) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| 6) (|SetCategory|) (|RetractableTo| 45)
                 (|RetractableTo| 42) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 64) (|noZeroDivisors|) (|CoercibleFrom| 45)
                 (|CoercibleFrom| 42) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 65
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 35 14 0 1 1 0 55
                                    0 1 1 32 44 0 1 1 32 0 0 1 1 32 14 0 1 2 0
                                    28 0 55 1 1 0 28 0 1 2 0 28 0 55 1 1 0 60 0
                                    1 2 34 43 0 0 1 2 9 14 0 0 1 0 35 0 1 1 36
                                    43 0 1 2 36 0 0 28 1 2 0 0 0 61 1 1 6 50 0
                                    1 1 7 51 0 1 1 0 58 0 1 1 6 45 0 1 1 7 42 0
                                    1 1 0 6 0 1 1 29 0 0 1 1 21 38 39 1 2 21 40
                                    39 41 1 1 10 52 39 1 2 10 53 39 41 1 1 36
                                    43 0 1 1 19 0 0 1 1 14 54 0 1 4 0 0 0 6 46
                                    0 1 2 35 14 0 0 1 1 36 14 0 1 1 0 28 0 1 1
                                    0 54 0 1 1 0 14 0 1 3 0 0 0 55 56 1 3 0 0 0
                                    7 28 33 2 0 0 6 46 1 1 0 46 0 1 2 0 0 57 0
                                    1 2 0 0 11 0 1 1 0 16 0 17 1 0 48 0 1 2 5 6
                                    49 0 1 1 36 43 0 1 2 36 0 0 28 1 2 0 0 0 61
                                    1 1 15 47 0 1 1 15 46 0 1 1 29 0 0 1 1 29 6
                                    0 1 1 0 63 0 1 2 0 62 62 0 1 1 0 65 0 1 1 0
                                    14 0 15 1 0 6 0 1 4 10 0 0 46 6 0 1 2 32 43
                                    0 0 1 2 4 43 0 6 1 2 0 56 0 55 1 2 0 28 0 7
                                    1 1 0 46 0 1 1 19 6 0 1 1 15 0 48 1 1 0 0
                                    48 1 2 38 0 0 0 1 1 37 0 42 1 1 30 0 0 1 1
                                    18 0 45 1 1 0 0 6 1 1 0 64 0 1 1 0 59 0 1 3
                                    0 0 0 55 56 1 3 0 0 0 7 28 1 2 0 6 0 46 1 1
                                    2 43 0 1 0 38 28 1 3 31 0 0 0 28 1 3 38 0 0
                                    0 0 1 2 32 14 0 0 1 2 0 0 0 0 1 2 38 14 0 0
                                    1 1 0 0 0 22 2 36 0 0 28 1 2 0 0 0 61 1 0
                                    35 0 21 0 36 0 30 1 0 0 7 1 2 0 14 0 0 1 2
                                    16 0 0 6 1 1 33 0 0 32 2 33 0 0 0 1 2 0 0 0
                                    0 36 2 21 0 0 42 1 2 33 0 42 0 1 2 35 0 28
                                    0 1 2 1 0 0 45 1 2 1 0 45 0 1 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 0 0 0 0 34 2 0 0 61 0 1)))))
           '|lookupComplete|)) 
