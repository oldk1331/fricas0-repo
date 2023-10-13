
(/VERSIONCHECK 2) 

(DEFUN |EXPUPXS;exponential;Ups$;1| (|f| $) (SPADCALL |f| (QREFELT $ 10))) 

(PUT '|EXPUPXS;exponent;$Ups;2| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |EXPUPXS;exponent;$Ups;2| (|f| $) |f|) 

(DEFUN |EXPUPXS;exponentialOrder;$F;3| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (|spadConstant| $ 14) (QREFELT $ 15))) 

(DEFUN |EXPUPXS;zero?;$B;4| (|f| $)
  (NULL
   (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
             (QREFELT $ 22)))) 

(DEFUN |EXPUPXS;=;2$B;5| (|f| |g| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 20))
             (QREFELT $ 22))
   (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 19)) (QREFELT $ 20))
             (QREFELT $ 22))
   (QREFELT $ 25))) 

(DEFUN |EXPUPXS;<;2$B;6| (|f| |g| $)
  (PROG (|gCoef| |fCoef| |ordg| |ordf|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 24))
        (COND ((SPADCALL |g| (QREFELT $ 24)) 'NIL) (#1='T 'T)))
       ((SPADCALL |g| (QREFELT $ 24)) 'NIL)
       (#1#
        (SEQ
         (LETT |ordf| (SPADCALL |f| (QREFELT $ 16)) . #2=(|EXPUPXS;<;2$B;6|))
         (LETT |ordg| (SPADCALL |g| (QREFELT $ 16)) . #2#)
         (EXIT
          (COND ((SPADCALL |ordf| |ordg| (QREFELT $ 27)) 'T)
                ((SPADCALL |ordf| |ordg| (QREFELT $ 28)) 'NIL)
                (#1#
                 (SEQ (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT $ 29)) . #2#)
                      (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT $ 29)) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |fCoef| |gCoef| (QREFELT $ 30))
                         (SPADCALL (SPADCALL |f| (QREFELT $ 31))
                                   (SPADCALL |g| (QREFELT $ 31))
                                   (QREFELT $ 32)))
                        (#1#
                         (SPADCALL |fCoef| |gCoef| (QREFELT $ 33)))))))))))))))) 

(DEFUN |EXPUPXS;coerce;$Of;7| (|f| $)
  (SPADCALL "%e" (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 35))
            (QREFELT $ 36))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G161)
  (PROG ()
    (RETURN
     (PROG (#2=#:G162)
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
                  (APPLY (|function| |ExponentialOfUnivariatePuiseuxSeries;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ExponentialOfUnivariatePuiseuxSeries|))))))))))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G159 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #2=(|ExponentialOfUnivariatePuiseuxSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3)
            . #2#)
      (LETT $ (GETREFV 62) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
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
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|SemiGroup|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (|HasCategory| |#1| '(|SemiRing|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (OR (|HasCategory| |#1| '(|Ring|))
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
                                                         '(|IntegralDomain|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|))
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
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1| '(|Field|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Algebra|
                                                                 (|Fraction|
                                                                  (|Integer|))))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|))
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
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|))
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
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Fraction|
                                                                       (|Integer|))
                                                                     (|devaluate|
                                                                      |#1|)))))
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
                                           (AND #1#
                                                (|HasCategory| |#1|
                                                               '(|AlgebraicallyClosedFunctionSpace|
                                                                 (|Integer|)))
                                                (|HasCategory| |#1|
                                                               '(|PrimitiveFunctionCategory|))
                                                (|HasCategory| |#1|
                                                               '(|TranscendentalFunctionCategory|)))
                                           (AND #1#
                                                (|HasSignature| |#1|
                                                                (LIST
                                                                 '|integrate|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Symbol|))))
                                                (|HasSignature| |#1|
                                                                (LIST
                                                                 '|variables|
                                                                 (LIST
                                                                  '(|List|
                                                                    (|Symbol|))
                                                                  (|devaluate|
                                                                   |#1|))))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
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
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|UnivariatePuiseuxSeries| |#1| |#2| |#3|))
      $)))) 

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
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 44 '"failed")
              (|Record| (|:| |coef| 44) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 49 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Stream| 6) (|PositiveInteger|) (|List| 58) (|List| 13)
              (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|SingleInteger|)
              (|String|))
           '#(~= 82 |zero?| 88 |variables| 93 |variable| 98 |unitNormal| 103
              |unitCanonical| 108 |unit?| 113 |truncate| 118 |terms| 131 |tanh|
              136 |tan| 141 |subtractIfCan| 146 |squareFreePart| 152
              |squareFree| 157 |sqrt| 162 |smaller?| 167 |sizeLess?| 173 |sinh|
              179 |sin| 184 |series| 189 |sech| 195 |sec| 200 |sample| 205
              |rem| 209 |reductum| 215 |recip| 220 |quo| 225 |principalIdeal|
              231 |prime?| 236 |pole?| 241 |pi| 246 |order| 250 |one?| 261
              |nthRoot| 266 |multiplyExponents| 272 |multiEuclidean| 284
              |monomial?| 290 |monomial| 295 |min| 315 |max| 321 |map| 327
              |log| 333 |leadingMonomial| 338 |leadingCoefficient| 343 |lcm|
              348 |latex| 359 |inv| 364 |integrate| 369 |hash| 380
              |gcdPolynomial| 385 |gcd| 391 |factor| 402 |extendedEuclidean|
              407 |extend| 420 |exquo| 426 |expressIdealMember| 432
              |exponentialOrder| 438 |exponential| 443 |exponent| 448 |exp| 453
              |eval| 458 |euclideanSize| 464 |elt| 469 |divide| 481
              |differentiate| 487 |degree| 524 |csch| 529 |csc| 534 |coth| 539
              |cot| 544 |cosh| 549 |cos| 554 |complete| 559 |coerce| 564
              |coefficient| 589 |charthRoot| 595 |characteristic| 600 |center|
              604 |atanh| 609 |atan| 614 |associates?| 619 |asinh| 625 |asin|
              630 |asech| 635 |asec| 640 |approximate| 645 |acsch| 651 |acsc|
              656 |acoth| 661 |acot| 666 |acosh| 671 |acos| 676 ^ 681 |Zero|
              711 |One| 715 D 719 >= 756 > 762 = 768 <= 774 < 780 / 786 - 798 +
              809 * 815)
           'NIL
           (CONS
            (|makeByteWordVec2| 18
                                '(0 7 0 7 0 7 7 0 7 14 7 3 10 15 1 2 3 5 4 10
                                  13 14 15 0 12 18 15 0 0 3 11 18 15 15 0 17 0
                                  8 16 0 0 0 8 0 0 0 0 15 0 0 0 6 9 3 10 7 7 15
                                  15 15 15 15 15))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                |IntegralDomain&| |DivisionRing&| |Algebra&| |Algebra&|
                |Algebra&| NIL NIL |Module&| |PartialDifferentialRing&|
                |DifferentialRing&| |Module&| NIL NIL |Module&| NIL NIL |Ring&|
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL |AbelianMonoid&| |OrderedSet&| |Monoid&| NIL
                |AbelianSemiGroup&| |SemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| |PartialOrder&| |BasicType&|
                NIL NIL NIL NIL NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 58) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|Algebra| 13)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 39) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 13)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 13 13) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 13)
                 (|RightModule| 13) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|OrderedSet|) (|Monoid|) (|Comparable|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|PartialOrder|)
                 (|BasicType|) (|CoercibleTo| 34) (|Eltable| $$ $$)
                 (|unitsKnown|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 61
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    9 34 0 35 2 34 0 0 0 36 2 0 23 0 0 1 1 0 23
                                    0 24 1 0 56 0 1 1 0 39 0 1 1 10 53 0 1 1 10
                                    0 0 1 1 10 23 0 1 2 0 0 0 13 1 3 0 0 0 13
                                    13 1 1 0 18 0 19 1 15 0 0 1 1 15 0 0 1 2 23
                                    43 0 0 1 1 7 0 0 1 1 7 52 0 1 1 15 0 0 1 2
                                    0 23 0 0 1 2 7 23 0 0 1 1 15 0 0 1 1 15 0 0
                                    1 2 0 0 41 18 1 1 15 0 0 1 1 15 0 0 1 0 0 0
                                    1 2 7 0 0 0 1 1 0 0 0 31 1 8 43 0 1 2 7 0 0
                                    0 1 1 7 47 44 1 1 7 23 0 1 1 0 23 0 1 0 15
                                    0 1 1 0 13 0 1 2 0 13 0 13 15 1 8 23 0 1 2
                                    15 0 0 42 1 2 0 0 0 13 1 2 0 0 0 55 1 2 7
                                    46 44 0 1 1 0 23 0 1 3 0 0 0 56 57 1 3 0 0
                                    0 58 13 1 2 0 0 6 13 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 59 0 1 1 15 0 0 1 1 0 0 0 1 1 0 6
                                    0 1 2 7 0 0 0 1 1 7 0 44 1 1 0 61 0 1 1 7 0
                                    0 1 2 21 0 0 39 1 1 15 0 0 1 1 0 60 0 1 2 7
                                    45 45 45 1 2 7 0 0 0 1 1 7 0 44 1 1 7 52 0
                                    1 3 7 50 0 0 0 1 2 7 51 0 0 1 2 0 0 0 13 1
                                    2 10 43 0 0 1 2 7 46 44 0 1 1 0 13 0 16 1 0
                                    0 5 11 1 0 5 0 12 1 15 0 0 1 2 19 54 0 6 1
                                    1 7 41 0 1 2 6 0 0 0 1 2 0 6 0 13 1 2 7 48
                                    0 0 1 2 5 0 0 38 1 2 5 0 0 39 1 3 5 0 0 38
                                    40 1 3 5 0 0 39 41 1 1 4 0 0 1 2 4 0 0 41 1
                                    1 0 13 0 1 1 15 0 0 1 1 15 0 0 1 1 15 0 0 1
                                    1 15 0 0 1 1 15 0 0 1 1 15 0 0 1 1 0 0 0 10
                                    1 9 0 42 1 1 15 0 13 1 1 3 0 6 1 1 10 0 0 1
                                    1 0 34 0 37 2 0 6 0 13 29 1 1 43 0 1 0 9 41
                                    1 1 0 6 0 1 1 15 0 0 1 1 15 0 0 1 2 10 23 0
                                    0 1 1 15 0 0 1 1 15 0 0 1 1 15 0 0 1 1 15 0
                                    0 1 2 20 6 0 13 1 1 15 0 0 1 1 15 0 0 1 1
                                    15 0 0 1 1 15 0 0 1 1 15 0 0 1 1 15 0 0 1 2
                                    8 0 0 41 1 2 15 0 0 13 1 2 15 0 0 0 1 2 7 0
                                    0 42 1 2 0 0 0 55 1 0 0 0 1 0 8 0 1 2 5 0 0
                                    38 1 2 5 0 0 39 1 3 5 0 0 38 40 1 3 5 0 0
                                    39 41 1 1 4 0 0 1 2 4 0 0 41 1 2 0 23 0 0 1
                                    2 0 23 0 0 1 2 0 23 0 0 26 2 0 23 0 0 1 2 0
                                    23 0 0 32 2 7 0 0 0 1 2 7 0 0 6 1 2 22 0 0
                                    0 1 1 22 0 0 1 2 0 0 0 0 1 2 22 0 42 0 1 2
                                    15 0 0 13 1 2 15 0 13 0 1 2 0 0 41 0 1 2 0
                                    0 0 6 1 2 0 0 6 0 1 2 0 0 0 0 1 2 0 0 55 0
                                    1)))))
           '|lookupComplete|)) 
