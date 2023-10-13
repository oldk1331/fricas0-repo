
(/VERSIONCHECK 2) 

(PUT '|SUPXS;getExpon| '|SPADreplace| 'QCAR) 

(DEFUN |SUPXS;getExpon| (|pxs| $) (QCAR |pxs|)) 

(DEFUN |SUPXS;variable;$S;2| (|x| $) (QREFELT $ 7)) 

(DEFUN |SUPXS;center;$Coef;3| (|x| $) (QREFELT $ 8)) 

(DEFUN |SUPXS;coerce;V$;4| (|v| $)
  (COND
   ((SPADCALL (QREFELT $ 8) (QREFELT $ 14))
    (SPADCALL (|spadConstant| $ 15) (|spadConstant| $ 18) (QREFELT $ 19)))
   ('T
    (SPADCALL
     (SPADCALL (|spadConstant| $ 15) (|spadConstant| $ 18) (QREFELT $ 19))
     (SPADCALL (QREFELT $ 8) (|spadConstant| $ 22) (QREFELT $ 19))
     (QREFELT $ 23))))) 

(DEFUN |SUPXS;coerce;Suts$;5| (|uts| $)
  (SPADCALL (SPADCALL |uts| (QREFELT $ 28)) (QREFELT $ 29))) 

(DEFUN |SUPXS;retractIfCan;$U;6| (|upxs| $)
  (PROG (|uls|)
    (RETURN
     (SEQ
      (LETT |uls| (SPADCALL |upxs| (QREFELT $ 32)) |SUPXS;retractIfCan;$U;6|)
      (EXIT
       (COND ((QEQCAR |uls| 1) (CONS 1 "failed"))
             ('T (SPADCALL (QCDR |uls|) (QREFELT $ 34))))))))) 

(DEFUN |SUPXS;differentiate;$V$;7| (|upxs| |v| $)
  (SPADCALL |upxs| (QREFELT $ 36))) 

(DEFUN |SUPXS;integrate;$V$;8| (|upxs| |v| $) (SPADCALL |upxs| (QREFELT $ 38))) 

(DEFUN |SUPXS;coerce;$Of;9| (|x| $)
  (PROG (|degr| |count| |nx| |refer| |st| |sups|)
    (RETURN
     (SEQ
      (LETT |sups| (SPADCALL |x| (QREFELT $ 40)) . #1=(|SUPXS;coerce;$Of;9|))
      (LETT |st| (SPADCALL |sups| (QREFELT $ 44)) . #1#)
      (LETT |refer| (SPADCALL |sups| (QREFELT $ 46)) . #1#)
      (COND
       ((NULL (SPADCALL |st| (QREFELT $ 47)))
        (COND
         ((NULL (SPADCALL |st| (QREFELT $ 48)))
          (SEQ
           (LETT |nx|
                 (SPADCALL (SPADCALL |refer| (QREFELT $ 50)) (QREFELT $ 52))
                 . #1#)
           (EXIT
            (COND
             ((QEQCAR |nx| 0)
              (SEQ (LETT |count| |$streamCount| . #1#)
                   (LETT |degr| (MIN |count| (+ (+ (QCDR |nx|) |count|) 1))
                         . #1#)
                   (EXIT (SPADCALL |sups| |degr| (QREFELT $ 54))))))))))))
      (EXIT
       (SPADCALL |st| |refer| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) (SPADCALL |x| (QREFELT $ 55))
                 (QREFELT $ 57))))))) 

(DEFUN |SparseUnivariatePuiseuxSeries| (&REST #1=#:G177)
  (PROG ()
    (RETURN
     (PROG (#2=#:G178)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SparseUnivariatePuiseuxSeries|)
                                           '|domainEqualList|)
                . #3=(|SparseUnivariatePuiseuxSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SparseUnivariatePuiseuxSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SparseUnivariatePuiseuxSeries|))))))))))) 

(DEFUN |SparseUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (PROG (|pv$| #1=#:G175 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseUnivariatePuiseuxSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT |dv$| (LIST '|SparseUnivariatePuiseuxSeries| DV$1 DV$2 DV$3) . #2#)
      (LETT $ (GETREFV 83) . #2#)
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
                                                             '(|AbelianMonoid|))
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
                                                                   |#1|)))))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianMonoid|))
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
      (|haddProp| |$ConstructorCache| '|SparseUnivariatePuiseuxSeries|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9
                (|Record| (|:| |expon| (|Fraction| (|Integer|)))
                          (|:| |lSeries|
                               (|SparseUnivariateLaurentSeries| |#1| |#2|
                                                                |#3|))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 37
                  (CONS (|dispatchFunction| |SUPXS;differentiate;$V$;7|) $))))
      (COND
       ((|testBitVector| |pv$| 15)
        (QSETREFV $ 39 (CONS (|dispatchFunction| |SUPXS;integrate;$V$;8|) $))))
      $)))) 

(MAKEPROP '|SparseUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeriesConstructor| 6 27)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Symbol|)
              |SUPXS;variable;$S;2| |SUPXS;center;$Coef;3| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Fraction| 53)
              (13 . |One|) (17 . |monomial|) (23 . |Zero|) (27 . |Zero|)
              (31 . |Zero|) (35 . +) (|Variable| 7) |SUPXS;coerce;V$;4|
              (|SparseUnivariateTaylorSeries| 6 7 8)
              (|SparseUnivariateLaurentSeries| 6 7 8) (41 . |coerce|)
              (46 . |coerce|) |SUPXS;coerce;Suts$;5| (|Union| 27 '"failed")
              (51 . |retractIfCan|) (|Union| 26 '"failed")
              (56 . |retractIfCan|) |SUPXS;retractIfCan;$U;6|
              (61 . |differentiate|) (66 . |differentiate|) (72 . |integrate|)
              (77 . |integrate|) (83 . |laurentRep|)
              (|Record| (|:| |k| 53) (|:| |c| 6)) (|Stream| 41)
              (|InnerSparseUnivariatePowerSeries| 6) (88 . |getStream|)
              (|Reference| 49) (93 . |getRef|) (98 . |explicitlyEmpty?|)
              (103 . |explicitEntries?|) (|OrderedCompletion| 53) (108 . |elt|)
              (|Union| 53 '"failed") (113 . |retractIfCan|) (|Integer|)
              (118 . |extend|) (124 . |rationalPower|) (|OutputForm|)
              (129 . |seriesToOutputForm|) |SUPXS;coerce;$Of;9|
              (|NonNegativeInteger|) (|List| 10) (|List| 59)
              (|Union| $ '"failed") (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 63) (|:| |generator| $))
              (|Union| 63 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 68 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Stream| 6) (|Record| (|:| |k| 17) (|:| |c| 6)) (|Stream| 74)
              (|PositiveInteger|) (|List| 78) (|SingletonAsOrderedSet|)
              (|List| 17) (|Mapping| 6 6) (|SingleInteger|) (|String|))
           '#(|variable| 138 |retractIfCan| 143 |rationalPower| 153 |monomial|
              158 |laurentRep| 164 |integrate| 169 |differentiate| 180 |coerce|
              191 |center| 211 |Zero| 216 |One| 220 + 224)
           'NIL
           (CONS
            (|makeByteWordVec2| 19
                                '(0 0 7 0 7 0 7 7 0 7 14 7 3 10 15 1 2 3 5 4 10
                                  13 14 15 0 12 19 15 0 0 3 11 19 15 15 18 8 17
                                  0 8 16 0 0 0 15 0 0 0 0 6 9 3 10 7 7 15 15 15
                                  15 15 15))
            (CONS
             '#(|UnivariatePuiseuxSeriesConstructorCategory&| NIL |Field&|
                |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| |IntegralDomain&|
                |DivisionRing&| |Algebra&| |Algebra&| |Algebra&| NIL NIL
                |Module&| |PartialDifferentialRing&| |DifferentialRing&|
                |Module&| NIL NIL |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |RetractableTo&| |RetractableTo&| |BasicType&| NIL NIL NIL NIL
                NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesConstructorCategory| 6
                                                               (|SparseUnivariateLaurentSeries|
                                                                6 7 8))
                 (|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariatePowerSeriesCategory| 6 17) (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 17 78) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|Algebra| 6) (|Algebra| $$) (|Algebra| 17)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 10) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|) (|Module| 17)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 17 17) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 17)
                 (|RightModule| 17) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| (|SparseUnivariateLaurentSeries| 6 7 8))
                 (|BasicType|) (|CoercibleTo| 56) (|Eltable| $$ $$)
                 (|unitsKnown|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 58
                                  '(1 6 13 0 14 0 6 0 15 0 0 0 16 0 17 0 18 2 0
                                    0 6 17 19 0 6 0 20 0 0 0 21 0 17 0 22 2 0 0
                                    0 0 23 1 27 0 26 28 1 0 0 27 29 1 0 31 0 32
                                    1 27 33 0 34 1 0 0 0 36 2 0 0 0 24 37 1 0 0
                                    0 38 2 0 0 0 24 39 1 0 27 0 40 1 43 42 0 44
                                    1 43 45 0 46 1 42 13 0 47 1 42 13 0 48 1 45
                                    49 0 50 1 49 51 0 52 2 43 0 0 53 54 1 0 17
                                    0 55 5 43 56 42 45 10 6 17 57 1 0 10 0 11 1
                                    0 33 0 35 1 0 31 0 32 1 0 17 0 55 2 0 0 6
                                    17 19 1 0 27 0 40 2 15 0 0 24 39 1 15 0 0
                                    38 1 4 0 0 36 2 0 0 0 24 37 1 0 0 24 25 1 0
                                    0 26 30 1 0 0 27 29 1 0 56 0 58 1 0 6 0 12
                                    0 25 0 21 0 8 0 16 2 0 0 0 0 23)))))
           '|lookupIncomplete|)) 
