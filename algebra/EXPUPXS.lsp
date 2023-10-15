
(SDEFUN |EXPUPXS;exponential;Ups$;1|
        ((|f| |UnivariatePuiseuxSeries| FE |var| |cen|) ($ $))
        (SPADCALL |f| (QREFELT $ 10))) 

(PUT '|EXPUPXS;exponent;$Ups;2| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |EXPUPXS;exponent;$Ups;2|
        ((|f| $) ($ |UnivariatePuiseuxSeries| FE |var| |cen|)) |f|) 

(SDEFUN |EXPUPXS;exponentialOrder;$F;3| ((|f| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 14)
                  (QREFELT $ 15))) 

(SDEFUN |EXPUPXS;zero?;$B;4| ((|f| $) ($ |Boolean|))
        (NULL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22)))) 

(SDEFUN |EXPUPXS;=;2$B;5| ((|f| $) (|g| $) ($ |Boolean|))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22))
         (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 22))
         (QREFELT $ 25))) 

(SDEFUN |EXPUPXS;<;2$B;6| ((|f| $) (|g| $) ($ |Boolean|))
        (SPROG
         ((|gCoef| (FE)) (|fCoef| (FE)) (|ordg| #1=(|Fraction| (|Integer|)))
          (|ordf| #1#))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 24)) (NULL (SPADCALL |g| (QREFELT $ 24))))
           ((SPADCALL |g| (QREFELT $ 24)) NIL)
           (#2='T
            (SEQ
             (LETT |ordf| (SPADCALL |f| (QREFELT $ 16))
                   . #3=(|EXPUPXS;<;2$B;6|))
             (LETT |ordg| (SPADCALL |g| (QREFELT $ 16)) . #3#)
             (EXIT
              (COND ((SPADCALL |ordf| |ordg| (QREFELT $ 27)) 'T)
                    ((SPADCALL |ordf| |ordg| (QREFELT $ 28)) NIL)
                    (#2#
                     (SEQ
                      (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT $ 29)) . #3#)
                      (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT $ 29)) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |fCoef| |gCoef| (QREFELT $ 30))
                         (SPADCALL (SPADCALL |f| (QREFELT $ 31))
                                   (SPADCALL |g| (QREFELT $ 31))
                                   (QREFELT $ 32)))
                        (#2#
                         (SPADCALL |fCoef| |gCoef| (QREFELT $ 33))))))))))))))) 

(SDEFUN |EXPUPXS;coerce;$Of;7| ((|f| $) ($ |OutputForm|))
        (SPADCALL "%e" (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 35))
                  (QREFELT $ 36))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExponentialOfUnivariatePuiseuxSeries|)
                                               '|domainEqualList|)
                    . #3=(|ExponentialOfUnivariatePuiseuxSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ExponentialOfUnivariatePuiseuxSeries;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExponentialOfUnivariatePuiseuxSeries|)))))))))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G139 NIL) (#2=#:G140 NIL) (#3=#:G141 NIL) (#4=#:G142 NIL)
    (#5=#:G144 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #6=(|ExponentialOfUnivariatePuiseuxSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT DV$3 (|devaluate| |#3|) . #6#)
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3)
          . #6#)
    (LETT $ (GETREFV 64) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
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
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
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
                                                                  |#1|))))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #6#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #6#)
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
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
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #4# #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 16777216))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #1# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|UnivariatePuiseuxSeries| |#1| |#2| |#3|))
    $))) 

(MAKEPROP '|ExponentialOfUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeries| 6 7 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep|
              (0 . |complete|) |EXPUPXS;exponential;Ups$;1|
              |EXPUPXS;exponent;$Ups;2| (|Fraction| 42) (5 . |Zero|)
              (9 . |order|) |EXPUPXS;exponentialOrder;$F;3|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 17) (15 . |terms|)
              (20 . |complete|) (|List| 17) (25 . |entries|) (|Boolean|)
              |EXPUPXS;zero?;$B;4| (30 . =) |EXPUPXS;=;2$B;5| (36 . >) (42 . <)
              (48 . |coefficient|) (54 . =) (60 . |reductum|) |EXPUPXS;<;2$B;6|
              (65 . |smaller?|) (|OutputForm|) (71 . |coerce|) (76 . ^)
              |EXPUPXS;coerce;$Of;7| (|List| 39) (|Symbol|) (|List| 41)
              (|NonNegativeInteger|) (|Integer|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 46 '"failed")
              (|Record| (|:| |coef| 46) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 52 '"failed")
              (|Factored| $) (|Stream| 6) (|PositiveInteger|) (|List| 59)
              (|List| 13) (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 82 |zero?| 88 |variables| 93 |variable| 98 |unitNormal| 103
              |unitCanonical| 108 |unit?| 113 |truncate| 118 |terms| 131 |tanh|
              136 |tan| 141 |subtractIfCan| 146 |squareFreePart| 152
              |squareFree| 157 |sqrt| 162 |smaller?| 167 |sizeLess?| 173 |sinh|
              179 |sin| 184 |series| 189 |sech| 195 |sec| 200 |sample| 205
              |rightRecip| 209 |rightPower| 214 |rem| 226 |reductum| 232
              |recip| 237 |quo| 242 |principalIdeal| 248 |prime?| 253 |pole?|
              258 |pi| 263 |order| 267 |opposite?| 278 |one?| 284 |nthRoot| 289
              |multiplyExponents| 295 |multiEuclidean| 307 |monomial?| 313
              |monomial| 318 |min| 338 |max| 344 |map| 350 |log| 356
              |leftRecip| 361 |leftPower| 366 |leadingMonomial| 378
              |leadingCoefficient| 383 |lcmCoef| 388 |lcm| 394 |latex| 405
              |inv| 410 |integrate| 415 |hashUpdate!| 426 |hash| 432
              |gcdPolynomial| 437 |gcd| 443 |factor| 454 |extendedEuclidean|
              459 |extend| 472 |exquo| 478 |expressIdealMember| 484
              |exponentialOrder| 490 |exponential| 495 |exponent| 500 |exp| 505
              |eval| 510 |euclideanSize| 516 |elt| 521 |divide| 533
              |differentiate| 539 |degree| 576 |csch| 581 |csc| 586 |coth| 591
              |cot| 596 |cosh| 601 |cos| 606 |complete| 611 |commutator| 616
              |coerce| 622 |coefficient| 647 |charthRoot| 653 |characteristic|
              658 |center| 662 |atanh| 667 |atan| 672 |associator| 677
              |associates?| 684 |asinh| 690 |asin| 695 |asech| 700 |asec| 705
              |approximate| 710 |antiCommutator| 716 |annihilate?| 722 |acsch|
              728 |acsc| 733 |acoth| 738 |acot| 743 |acosh| 748 |acos| 753 ^
              758 |Zero| 788 |One| 792 D 796 >= 833 > 839 = 845 <= 851 < 857 /
              863 - 875 + 886 * 892)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 6 0 6 0 6 6 0 6 6 15 6 1 2 9 4 3 15 14 15 7
                                  20 17 20 0 9 15 7 0 0 19 7 0 0 0 0 20 7 7 0
                                  24 0 23 17 17 0 0 0 0 17 0 0 0 0 7 0 0 0 0 5
                                  19 14 15 6 6 7 7 7 7 7 7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |DifferentialRing&| |Algebra&| NIL
                |EntireRing&| |Algebra&| NIL NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL |NonAssociativeSemiRng&| |AbelianMonoid&| |OrderedSet&| NIL
                |MagmaWithUnit&| NIL |Magma&| |AbelianSemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |PartialOrder&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 59) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|LeftOreRing|) (|IntegralDomain|)
                 (|DivisionRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 39) (|DifferentialRing|)
                 (|Algebra| $$) (|CommutativeRing|) (|EntireRing|)
                 (|Algebra| 13) (|Ring|) (|SemiRing|) (|Rng|) (|SemiRng|)
                 (|Module| 6) (|Module| $$) (|Module| 13) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 13 13)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|LeftModule| 13)
                 (|RightModule| 13) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|OrderedSet|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|PartialOrder|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 34) (|Eltable| $$ $$) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 63
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    9 34 0 35 2 34 0 0 0 36 2 0 23 0 0 1 1 0 23
                                    0 24 1 0 57 0 1 1 0 39 0 1 1 26 44 0 1 1 26
                                    0 0 1 1 26 23 0 1 3 0 0 0 13 13 1 2 0 0 0
                                    13 1 1 0 18 0 19 1 7 0 0 1 1 7 0 0 1 2 29
                                    43 0 0 1 1 6 0 0 1 1 6 54 0 1 1 7 0 0 1 2 0
                                    23 0 0 1 2 6 23 0 0 1 1 7 0 0 1 1 7 0 0 1 2
                                    0 0 41 18 1 1 7 0 0 1 1 7 0 0 1 0 0 0 1 1
                                    27 43 0 1 2 27 0 0 41 1 2 0 0 0 56 1 2 6 0
                                    0 0 1 1 0 0 0 31 1 27 43 0 1 2 6 0 0 0 1 1
                                    6 49 46 1 1 6 23 0 1 1 0 23 0 1 0 7 0 1 2 0
                                    13 0 13 15 1 0 13 0 1 2 0 23 0 0 1 1 27 23
                                    0 1 2 7 0 0 42 1 2 0 0 0 13 1 2 0 0 0 56 1
                                    2 6 48 46 0 1 1 0 23 0 1 3 0 0 0 57 58 1 3
                                    0 0 0 59 13 1 2 0 0 6 13 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 60 0 1 1 7 0 0 1 1 27 43 0 1
                                    2 27 0 0 41 1 2 0 0 0 56 1 1 0 0 0 1 1 0 6
                                    0 1 2 6 45 0 0 1 1 6 0 46 1 2 6 0 0 0 1 1 0
                                    61 0 1 1 6 0 0 1 2 12 0 0 39 1 1 7 0 0 1 2
                                    0 63 63 0 1 1 0 62 0 1 2 6 47 47 47 1 1 6 0
                                    46 1 2 6 0 0 0 1 1 6 54 0 1 2 6 51 0 0 1 3
                                    6 53 0 0 0 1 2 0 0 0 13 1 2 26 43 0 0 1 2 6
                                    48 46 0 1 1 0 13 0 16 1 0 0 5 11 1 0 5 0 12
                                    1 7 0 0 1 2 10 55 0 6 1 1 6 41 0 1 2 5 0 0
                                    0 1 2 0 6 0 13 1 2 6 50 0 0 1 2 4 0 0 38 1
                                    2 4 0 0 39 1 3 4 0 0 38 40 1 3 4 0 0 39 41
                                    1 1 3 0 0 1 2 3 0 0 41 1 1 0 13 0 1 1 7 0 0
                                    1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 1 0 0 0 10 2 28 0 0 0 1 1 25 0 6 1
                                    1 28 0 42 1 1 26 0 0 1 1 7 0 13 1 1 0 34 0
                                    37 2 0 6 0 13 29 1 1 43 0 1 0 28 41 1 1 0 6
                                    0 1 1 7 0 0 1 1 7 0 0 1 3 28 0 0 0 0 1 2 26
                                    23 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7
                                    0 0 1 2 11 6 0 13 1 2 0 0 0 0 1 2 28 23 0 0
                                    1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1
                                    7 0 0 1 1 7 0 0 1 2 27 0 0 41 1 2 7 0 0 13
                                    1 2 7 0 0 0 1 2 6 0 0 42 1 2 0 0 0 56 1 0 0
                                    0 1 0 27 0 1 2 4 0 0 39 1 3 4 0 0 39 41 1 2
                                    4 0 0 38 1 3 4 0 0 38 40 1 1 3 0 0 1 2 3 0
                                    0 41 1 2 0 23 0 0 1 2 0 23 0 0 1 2 0 23 0 0
                                    26 2 0 23 0 0 1 2 0 23 0 0 32 2 6 0 0 0 1 2
                                    6 0 0 6 1 1 30 0 0 1 2 30 0 0 0 1 2 0 0 0 0
                                    1 2 30 0 42 0 1 2 7 0 13 0 1 2 7 0 0 13 1 2
                                    0 0 41 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 0
                                    0 1 2 0 0 56 0 1)))))
           '|lookupComplete|)) 
