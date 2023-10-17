
(SDEFUN |TS;polynomial;%NniP;1|
        ((|s| (%)) (|n| (|NonNegativeInteger|)) (% (|Polynomial| |Coef|)))
        (SPROG ((|sum| (|Polynomial| |Coef|)) (#1=#:G7 NIL) (|i| NIL))
               (SEQ (LETT |sum| (|spadConstant| % 9))
                    (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                         (COND
                          ((OR (|greater_SI| |i| #1#)
                               (NULL (NULL (SPADCALL |s| (QREFELT % 11)))))
                           (GO G191)))
                         (SEQ
                          (LETT |sum|
                                (SPADCALL |sum| (SPADCALL |s| (QREFELT % 12))
                                          (QREFELT % 13)))
                          (EXIT (LETT |s| (SPADCALL |s| (QREFELT % 14)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |sum|)))) 

(DECLAIM (NOTINLINE |TaylorSeries;|)) 

(DEFUN |TaylorSeries| (#1=#:G20)
  (SPROG NIL
         (PROG (#2=#:G21)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TaylorSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TaylorSeries;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TaylorSeries|)))))))))) 

(DEFUN |TaylorSeries;| (|#1|)
  (SPROG
   ((#1=#:G19 NIL) (|pv$| NIL) (#2=#:G18 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|TaylorSeries| DV$1))
    (LETT % (GETREFV 35))
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
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory|
                                         (|IndexedExponents| (|Symbol|))
                                         '(|Comparable|))))))
    (|haddProp| |$ConstructorCache| '|TaylorSeries| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 512))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #1#)
     (|augmentPredVector| % 1024))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #1#)
     (|augmentPredVector| % 2048))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Stream| (|Polynomial| |#1|)))
    %))) 

(MAKEPROP '|TaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariateTaylorSeries| 6 24 8)
              (|local| |#1|) '|Rep| (|Polynomial| 6) (0 . |Zero|) (|Boolean|)
              (4 . |empty?|) (9 . |frst|) (14 . +) (20 . |rst|)
              (|NonNegativeInteger|) |TS;polynomial;%NniP;1|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| % '"failed") (|PositiveInteger|)
              (|Record| (|:| |k| 22) (|:| |c| 6)) (|List| 20)
              (|IndexedExponents| 24) (|Mapping| %) (|Symbol|) (|Integer|)
              (|Fraction| 25) (|List| 24) (|List| 15) (|List| %) (|Equation| %)
              (|List| 30) (|Mapping| 6 6) (|OutputForm|) (|String|))
           '#(~= 25 |zero?| 31 |unitNormal| 36 |unitCanonical| 41 |unit?| 46
              |tanh| 51 |tan| 56 |subtractIfCan| 61 |sqrt| 67 |sinh| 72 |sin|
              77 |sech| 82 |sec| 87 |sample| 92 |rightRecip| 96 |rightPower|
              101 |reductum| 113 |recip| 118 |polynomial| 123 |pole?| 136
              |plenaryPower| 141 |pi| 147 |order| 151 |opposite?| 164 |one?|
              170 |nthRoot| 175 |monomial?| 181 |monomial| 186 |map| 206 |log|
              212 |leftRecip| 217 |leftPower| 222 |leadingTerm| 234
              |leadingSupport| 239 |leadingMonomial| 244 |leadingCoefficient|
              249 |latex| 254 |integrate| 259 |fintegrate| 272 |extend| 279
              |exquo| 285 |exp| 291 |eval| 296 |differentiate| 336 |degree| 362
              |csch| 367 |csc| 372 |coth| 377 |cot| 382 |cosh| 387 |cos| 392
              |constructOrdered| 397 |construct| 402 |complete| 407
              |commutator| 412 |coerce| 418 |coefficient| 453 |charthRoot| 479
              |characteristic| 484 |atanh| 488 |atan| 493 |associator| 498
              |associates?| 505 |asinh| 511 |asin| 516 |asech| 521 |asec| 526
              |antiCommutator| 531 |annihilate?| 537 |acsch| 543 |acsc| 548
              |acoth| 553 |acot| 558 |acosh| 563 |acos| 568 ^ 573 |Zero| 597
              |One| 601 D 605 = 631 / 637 - 643 + 654 * 660)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 6 0 1 6 2 3 4 5 0 0 0 1 6 5 0 1 6 5 0
                                  0 0 0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0
                                  0 1 6 0 0 0 0 0 0 1 1 1 1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |PartialDifferentialRing&|
                |Algebra&| |Algebra&| |EntireRing&| NIL NIL |Algebra&| NIL
                |Rng&| NIL |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&| NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Magma&| |AbelianSemiGroup&| |Evalable&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 24)
                 (|PowerSeriesCategory| 6 22 24) (|AbelianMonoidRing| 6 22)
                 (|IntegralDomain|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 24) (|Algebra| 26) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|SemiRing|) (|NonAssociativeAlgebra| 26)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|SemiRng|) (|Module| 26) (|Module| $$) (|Module| 6)
                 (|IndexedProductCategory| 6 22) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 26 26)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 26) (|RightModule| 26)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|CommutativeStar|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 24 $$)
                 (|VariablesCommuteWithCoefficients|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 33)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|))
              (|makeByteWordVec2| 34
                                  '(0 8 0 9 1 7 10 0 11 1 7 8 0 12 2 8 0 0 0 13
                                    1 7 0 0 14 2 0 10 0 0 1 1 0 10 0 1 1 10 17
                                    0 1 1 10 0 0 1 1 10 10 0 1 1 1 0 0 1 1 1 0
                                    0 1 2 0 18 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0
                                    0 1 1 1 0 0 1 1 1 0 0 1 0 0 0 1 1 0 18 0 1
                                    2 0 0 0 15 1 2 0 0 0 19 1 1 8 0 0 1 1 0 18
                                    0 1 2 0 8 0 15 16 3 0 8 0 15 15 1 1 0 10 0
                                    1 2 12 0 0 19 1 0 1 0 1 2 0 15 0 24 1 3 0
                                    15 0 24 15 1 2 0 10 0 0 1 1 0 10 0 1 2 1 0
                                    0 25 1 1 0 10 0 1 3 0 0 0 24 15 1 3 0 0 0
                                    27 28 1 2 0 0 6 22 1 2 0 0 32 0 1 1 1 0 0 1
                                    1 0 18 0 1 2 0 0 0 15 1 2 0 0 0 19 1 1 8 20
                                    0 1 1 8 22 0 1 1 0 0 0 1 1 0 6 0 1 1 0 34 0
                                    1 3 1 0 0 24 6 1 2 1 0 0 24 1 3 1 0 23 24 6
                                    1 2 0 0 0 15 1 2 10 18 0 0 1 1 1 0 0 1 3 0
                                    0 0 29 29 1 2 0 0 0 30 1 3 0 0 0 0 0 1 3 0
                                    0 0 27 29 1 2 0 0 0 31 1 3 0 0 0 24 0 1 3 0
                                    0 0 24 15 1 3 0 0 0 27 28 1 2 0 0 0 24 1 2
                                    0 0 0 27 1 1 0 22 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 8 0
                                    21 1 1 0 0 21 1 1 0 0 0 1 2 0 0 0 0 1 1 9 0
                                    6 1 1 11 0 0 1 1 1 0 26 1 1 0 0 8 1 1 0 0
                                    24 1 1 0 0 25 1 1 0 33 0 1 2 0 8 0 15 1 3 0
                                    0 0 27 28 1 3 0 0 0 24 15 1 2 0 6 0 22 1 1
                                    3 18 0 1 0 0 15 1 1 1 0 0 1 1 1 0 0 1 3 0 0
                                    0 0 0 1 2 10 10 0 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1
                                    1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 2 1 0 0 26 1 2 1 0 0 0 1 2
                                    0 0 0 15 1 2 0 0 0 19 1 0 0 0 1 0 0 0 1 3 0
                                    0 0 24 15 1 3 0 0 0 27 28 1 2 0 0 0 24 1 2
                                    0 0 0 27 1 2 0 10 0 0 1 2 7 0 0 6 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 1 2 1 0 26 0 1 2 1
                                    0 0 26 1 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 15 0
                                    1 2 0 0 25 0 1 2 0 0 0 0 1 2 0 0 19 0
                                    1)))))
           '|lookupComplete|)) 
