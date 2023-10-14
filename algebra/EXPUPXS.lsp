
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

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G170)
  (PROG ()
    (RETURN
     (PROG (#2=#:G171)
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
  (PROG (|pv$| #1=#:G162 #2=#:G163 #3=#:G164 #4=#:G165 #5=#:G166 #6=#:G168 $
         |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #7=(|ExponentialOfUnivariatePuiseuxSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT DV$3 (|devaluate| |#3|) . #7#)
      (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3)
            . #7#)
      (LETT $ (GETREFV 64) . #7#)
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
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|SemiGroup|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (LETT #6#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #7#)
                                          (OR #6#
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
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #7#)
                                          (OR #6#
                                              (|HasCategory| |#1| '(|Field|))
                                              #5#)
                                          (OR (|HasCategory| |#1| '(|Field|))
                                              #5#)
                                          (LETT #4#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #7#)
                                          (OR #4#
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Fraction|
                                                                       (|Integer|))
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR #6#
                                              (|HasCategory| |#1| '(|Field|))
                                              #5# #4#
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
                                           #6# (|HasCategory| |#1| '(|Field|))
                                           #5# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|SemiRing|))
                                                . #7#)
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
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6# (|HasCategory| |#1| '(|Field|))
                                           #5# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #7#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #2# #1#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #6# (|HasCategory| |#1| '(|Field|))
                                           #5# #4#
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Fraction|
                                                                    (|Integer|))
                                                                  (|devaluate|
                                                                   |#1|)))))))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 33554432))
      (AND
       (OR (|HasCategory| |#1| '(|Field|))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 67108864))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #4#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 134217728))
      (AND
       (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           #3#
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 268435456))
      (AND
       (OR #2#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR #1#
           (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasSignature| |#1|
                           (LIST '*
                                 (LIST (|devaluate| |#1|)
                                       '(|Fraction| (|Integer|))
                                       (|devaluate| |#1|)))))
       (|augmentPredVector| $ 1073741824))
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
              |EXPUPXS;coerce;$Of;7| (|Symbol|) (|NonNegativeInteger|)
              (|List| 38) (|List| 39) (|Integer|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Union| 46 '"failed")
              (|Record| (|:| |coef| 46) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 51 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Stream| 6) (|PositiveInteger|) (|List| 58)
              (|SingletonAsOrderedSet|) (|List| 13) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 82 |zero?| 88 |variables| 93 |variable| 98 |unitNormal| 103
              |unitCanonical| 108 |unit?| 113 |truncate| 118 |terms| 131 |tanh|
              136 |tan| 141 |subtractIfCan| 146 |squareFreePart| 152
              |squareFree| 157 |sqrt| 162 |smaller?| 167 |sizeLess?| 173 |sinh|
              179 |sin| 184 |series| 189 |sech| 195 |sec| 200 |sample| 205
              |rem| 209 |reductum| 215 |recip| 220 |quo| 225 |principalIdeal|
              231 |prime?| 236 |pole?| 241 |pi| 246 |order| 250 |one?| 261
              |nthRoot| 266 |multiplyExponents| 272 |multiEuclidean| 284
              |monomial?| 290 |monomial| 295 |min| 315 |max| 321 |map| 327
              |log| 333 |leadingMonomial| 338 |leadingCoefficient| 343
              |lcmCoef| 348 |lcm| 354 |latex| 365 |inv| 370 |integrate| 375
              |hashUpdate!| 386 |hash| 392 |gcdPolynomial| 397 |gcd| 403
              |factor| 414 |extendedEuclidean| 419 |extend| 432 |exquo| 438
              |expressIdealMember| 444 |exponentialOrder| 450 |exponential| 455
              |exponent| 460 |exp| 465 |eval| 470 |euclideanSize| 476 |elt| 481
              |divide| 493 |differentiate| 499 |degree| 536 |csch| 541 |csc|
              546 |coth| 551 |cot| 556 |cosh| 561 |cos| 566 |complete| 571
              |coerce| 576 |coefficient| 601 |charthRoot| 607 |characteristic|
              612 |center| 616 |atanh| 621 |atan| 626 |associates?| 631 |asinh|
              637 |asin| 642 |asech| 647 |asec| 652 |approximate| 657 |acsch|
              663 |acsc| 668 |acoth| 673 |acot| 678 |acosh| 683 |acos| 688 ^
              693 |Zero| 723 |One| 727 D 731 >= 768 > 774 = 780 <= 786 < 792 /
              798 - 810 + 821 * 827)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 6 0 6 0 6 6 0 6 15 6 9 15 6 7 1 2 9 4 3 15
                                  14 15 7 0 14 19 7 0 0 14 18 19 7 7 0 23 0 21
                                  25 0 0 0 21 0 0 0 0 7 0 0 0 0 5 17 14 15 6 6
                                  7 7 7 7 7 7))
            (CONS
             '#(NIL |Field&| |UnivariatePowerSeriesCategory&|
                |EuclideanDomain&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| |Algebra&| |Algebra&| NIL |Algebra&| NIL
                NIL |Module&| |PartialDifferentialRing&| |DifferentialRing&|
                |Module&| NIL |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |AbelianMonoid&| |OrderedSet&| |Monoid&| NIL
                |AbelianSemiGroup&| |SemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| |PartialOrder&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 13) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 13 58) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|) (|Algebra| 13)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 38) (|DifferentialRing|)
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
                                    0 24 1 0 57 0 1 1 0 38 0 1 1 27 44 0 1 1 27
                                    0 0 1 1 27 23 0 1 3 0 0 0 13 13 1 2 0 0 0
                                    13 1 1 0 18 0 19 1 7 0 0 1 1 7 0 0 1 2 31
                                    43 0 0 1 1 6 0 0 1 1 6 54 0 1 1 7 0 0 1 2 0
                                    23 0 0 1 2 6 23 0 0 1 1 7 0 0 1 1 7 0 0 1 2
                                    0 0 39 18 1 1 7 0 0 1 1 7 0 0 1 0 0 0 1 2 6
                                    0 0 0 1 1 0 0 0 31 1 29 43 0 1 2 6 0 0 0 1
                                    1 6 49 46 1 1 6 23 0 1 1 0 23 0 1 0 7 0 1 2
                                    0 13 0 13 15 1 0 13 0 1 1 29 23 0 1 2 7 0 0
                                    42 1 2 0 0 0 13 1 2 0 0 0 56 1 2 6 48 46 0
                                    1 1 0 23 0 1 3 0 0 0 58 13 1 3 0 0 0 57 59
                                    1 2 0 0 6 13 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 60 0 1 1 7 0 0 1 1 0 0 0 1 1 0 6 0 1 2 6
                                    45 0 0 1 2 6 0 0 0 1 1 6 0 46 1 1 0 61 0 1
                                    1 6 0 0 1 2 12 0 0 38 1 1 7 0 0 1 2 0 63 63
                                    0 1 1 0 62 0 1 2 6 47 47 47 1 2 6 0 0 0 1 1
                                    6 0 46 1 1 6 54 0 1 3 6 52 0 0 0 1 2 6 53 0
                                    0 1 2 0 0 0 13 1 2 27 43 0 0 1 2 6 48 46 0
                                    1 1 0 13 0 16 1 0 0 5 11 1 0 5 0 12 1 7 0 0
                                    1 2 10 55 0 6 1 1 6 39 0 1 2 5 0 0 0 1 2 0
                                    6 0 13 1 2 6 50 0 0 1 2 4 0 0 38 1 3 4 0 0
                                    38 39 1 2 4 0 0 40 1 3 4 0 0 40 41 1 1 3 0
                                    0 1 2 3 0 0 39 1 1 0 13 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    1 0 0 0 10 1 26 0 6 1 1 28 0 42 1 1 27 0 0
                                    1 1 7 0 13 1 1 0 34 0 37 2 0 6 0 13 29 1 1
                                    43 0 1 0 28 39 1 1 0 6 0 1 1 7 0 0 1 1 7 0
                                    0 1 2 27 23 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 2 11 6 0 13 1 1 7 0 0 1 1 7 0
                                    0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1 1 7 0 0 1
                                    2 29 0 0 39 1 2 7 0 0 13 1 2 7 0 0 0 1 2 6
                                    0 0 42 1 2 0 0 0 56 1 0 0 0 1 0 29 0 1 2 4
                                    0 0 38 1 3 4 0 0 38 39 1 2 4 0 0 40 1 3 4 0
                                    0 40 41 1 1 3 0 0 1 2 3 0 0 39 1 2 0 23 0 0
                                    1 2 0 23 0 0 1 2 0 23 0 0 26 2 0 23 0 0 1 2
                                    0 23 0 0 32 2 6 0 0 0 1 2 6 0 0 6 1 1 30 0
                                    0 1 2 30 0 0 0 1 2 0 0 0 0 1 2 30 0 42 0 1
                                    2 7 0 13 0 1 2 7 0 0 13 1 2 0 0 39 0 1 2 0
                                    0 6 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 56 0
                                    1)))))
           '|lookupComplete|)) 
