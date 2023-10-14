
(/VERSIONCHECK 2) 

(DEFUN |TS;polynomial;$NniP;1| (|s| |n| $)
  (PROG (|sum| |i|)
    (RETURN
     (SEQ (LETT |sum| (|spadConstant| $ 9) . #1=(|TS;polynomial;$NniP;1|))
          (SEQ (LETT |i| 0 . #1#) G190
               (COND
                ((OR (|greater_SI| |i| |n|)
                     (NULL
                      (COND ((SPADCALL |s| (QREFELT $ 11)) 'NIL) ('T 'T))))
                 (GO G191)))
               (SEQ
                (LETT |sum|
                      (SPADCALL |sum| (SPADCALL |s| (QREFELT $ 12))
                                (QREFELT $ 13))
                      . #1#)
                (EXIT (LETT |s| (SPADCALL |s| (QREFELT $ 14)) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |sum|))))) 

(DECLAIM (NOTINLINE |TaylorSeries;|)) 

(DEFUN |TaylorSeries| (#1=#:G116)
  (PROG ()
    (RETURN
     (PROG (#2=#:G117)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|TaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|TaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|TaylorSeries;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|TaylorSeries|))))))))))) 

(DEFUN |TaylorSeries;| (|#1|)
  (PROG (|pv$| #1=#:G115 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|TaylorSeries|))
      (LETT |dv$| (LIST '|TaylorSeries| DV$1) . #2#)
      (LETT $ (GETREFV 36) . #2#)
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
                                          (|HasCategory| |#1| '(|Field|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|TaylorSeries| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND #1# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 128))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Stream| (|Polynomial| |#1|)))
      $)))) 

(MAKEPROP '|TaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariateTaylorSeries| 6 20 8)
              (|local| |#1|) '|Rep| (|Polynomial| 6) (0 . |Zero|) (|Boolean|)
              (4 . |empty?|) (9 . |frst|) (14 . +) (20 . |rst|)
              (|NonNegativeInteger|) |TS;polynomial;$NniP;1|
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Mapping| $) (|Symbol|) (|Fraction| 22) (|Integer|) (|List| 20)
              (|List| 15) (|List| $) (|Equation| $) (|List| 26) (|Mapping| 6 6)
              (|IndexedExponents| 20) (|List| 29) (|PositiveInteger|)
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 25 |zero?| 31 |variables| 36 |unitNormal| 41 |unitCanonical|
              46 |unit?| 51 |tanh| 56 |tan| 61 |subtractIfCan| 66 |sqrt| 72
              |sinh| 77 |sin| 82 |sech| 87 |sec| 92 |sample| 97 |reductum| 101
              |recip| 106 |polynomial| 111 |pole?| 124 |pi| 129 |order| 133
              |one?| 146 |nthRoot| 151 |monomial?| 157 |monomial| 162 |map| 196
              |log| 202 |leadingMonomial| 207 |leadingCoefficient| 212 |latex|
              217 |integrate| 222 |hashUpdate!| 235 |hash| 241 |fintegrate| 246
              |extend| 253 |exquo| 259 |exp| 265 |eval| 270 |differentiate| 310
              |degree| 336 |csch| 341 |csc| 346 |coth| 351 |cot| 356 |cosh| 361
              |cos| 366 |complete| 371 |coerce| 376 |coefficient| 411
              |charthRoot| 437 |characteristic| 442 |atanh| 446 |atan| 451
              |associates?| 456 |asinh| 462 |asin| 467 |asech| 472 |asec| 477
              |acsch| 482 |acsc| 487 |acoth| 492 |acot| 497 |acosh| 502 |acos|
              507 ^ 512 |Zero| 536 |One| 540 D 544 = 570 / 576 - 582 + 593 *
              599)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 1 2 5 0 1 6 2 2 3 4 5 0 0 1 6 0 0 0 0
                                  1 1 6 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 1
                                  1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |PartialDifferentialRing&| |Module&| NIL |Module&|
                |EntireRing&| NIL NIL |Module&| |Ring&| NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |Evalable&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 20)
                 (|PowerSeriesCategory| 6 29 20) (|AbelianMonoidRing| 6 29)
                 (|IntegralDomain|) (|Algebra| 21) (|Algebra| $$) (|Algebra| 6)
                 (|PartialDifferentialRing| 20) (|Module| 21)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 21 21)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 21) (|RightModule| 21)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 20 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 34)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 35
                                  '(0 8 0 9 1 7 10 0 11 1 7 8 0 12 2 8 0 0 0 13
                                    1 7 0 0 14 2 0 10 0 0 1 1 0 10 0 1 1 0 23 0
                                    1 1 9 18 0 1 1 9 0 0 1 1 9 10 0 1 1 1 0 0 1
                                    1 1 0 0 1 2 0 17 0 0 1 1 1 0 0 1 1 1 0 0 1
                                    1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 0 0 0 1 1 0 0
                                    0 1 1 0 17 0 1 2 0 8 0 15 16 3 0 8 0 15 15
                                    1 1 0 10 0 1 0 1 0 1 2 0 15 0 20 1 3 0 15 0
                                    20 15 1 1 0 10 0 1 2 1 0 0 22 1 1 0 10 0 1
                                    3 0 0 0 23 24 1 3 0 0 0 20 15 1 2 0 0 6 29
                                    1 3 0 0 0 23 30 1 3 0 0 0 20 29 1 2 0 0 28
                                    0 1 1 1 0 0 1 1 0 0 0 1 1 0 6 0 1 1 0 33 0
                                    1 3 1 0 0 20 6 1 2 1 0 0 20 1 2 0 32 32 0 1
                                    1 0 35 0 1 3 1 0 19 20 6 1 2 0 0 0 15 1 2 9
                                    17 0 0 1 1 1 0 0 1 3 0 0 0 0 0 1 3 0 0 0 25
                                    25 1 2 0 0 0 26 1 3 0 0 0 23 25 1 2 0 0 0
                                    27 1 3 0 0 0 20 0 1 3 0 0 0 23 24 1 2 0 0 0
                                    23 1 3 0 0 0 20 15 1 2 0 0 0 20 1 1 0 29 0
                                    1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 1 0 0 0 1 1 8 0 6 1 1 9 0
                                    0 1 1 1 0 21 1 1 0 0 8 1 1 0 0 20 1 1 0 0
                                    22 1 1 0 34 0 1 2 0 8 0 15 1 3 0 0 0 20 15
                                    1 3 0 0 0 23 24 1 2 0 6 0 29 1 1 3 17 0 1 0
                                    0 15 1 1 1 0 0 1 1 1 0 0 1 2 9 10 0 0 1 1 1
                                    0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 2 1 0 0 21 1 2 1 0 0 0 1 2 0 0 0 15
                                    1 2 0 0 0 31 1 0 0 0 1 0 0 0 1 3 0 0 0 20
                                    15 1 3 0 0 0 23 24 1 2 0 0 0 20 1 2 0 0 0
                                    23 1 2 0 10 0 0 1 2 7 0 0 6 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 1 0 21 0 1 2 1 0 0 21
                                    1 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 0 0 1 2 0 0
                                    22 0 1 2 0 0 15 0 1 2 0 0 31 0 1)))))
           '|lookupComplete|)) 
