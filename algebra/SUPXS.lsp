
(PUT '|SUPXS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |SUPXS;getExpon| ((|pxs| (%)) (% (|Fraction| (|Integer|))))
        (QCAR |pxs|)) 

(SDEFUN |SUPXS;variable;%S;2| ((|x| (%)) (% (|Symbol|))) (QREFELT % 7)) 

(SDEFUN |SUPXS;center;%Coef;3| ((|x| (%)) (% (|Coef|))) (QREFELT % 8)) 

(SDEFUN |SUPXS;coerce;V%;4| ((|v| (|Variable| |var|)) (% (%)))
        (COND
         ((SPADCALL (QREFELT % 8) (QREFELT % 14))
          (SPADCALL (|spadConstant| % 15) (|spadConstant| % 18)
                    (QREFELT % 19)))
         ('T
          (SPADCALL
           (SPADCALL (|spadConstant| % 15) (|spadConstant| % 18)
                     (QREFELT % 19))
           (SPADCALL (QREFELT % 8) (|spadConstant| % 22) (QREFELT % 19))
           (QREFELT % 23))))) 

(SDEFUN |SUPXS;coerce;Suts%;5|
        ((|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)) (% (%)))
        (SPADCALL (SPADCALL |uts| (QREFELT % 28)) (QREFELT % 29))) 

(SDEFUN |SUPXS;retractIfCan;%U;6|
        ((|upxs| (%))
         (%
          (|Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
                   "failed")))
        (SPROG
         ((|uls|
           (|Union| (|SparseUnivariateLaurentSeries| |Coef| |var| |cen|)
                    "failed")))
         (SEQ (LETT |uls| (SPADCALL |upxs| (QREFELT % 32)))
              (EXIT
               (COND ((QEQCAR |uls| 1) (CONS 1 "failed"))
                     ('T (SPADCALL (QCDR |uls|) (QREFELT % 34)))))))) 

(SDEFUN |SUPXS;differentiate;%V%;7|
        ((|upxs| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |upxs| (QREFELT % 36))) 

(SDEFUN |SUPXS;integrate;%V%;8| ((|upxs| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |upxs| (QREFELT % 38))) 

(SDEFUN |SUPXS;coerce;%Of;9| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|degr| (|Integer|)) (|count| (|NonNegativeInteger|))
          (|nx| (|Union| (|Integer|) "failed"))
          (|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|sups| (|InnerSparseUnivariatePowerSeries| |Coef|)))
         (SEQ (LETT |sups| (SPADCALL |x| (QREFELT % 40)))
              (LETT |st| (SPADCALL |sups| (QREFELT % 44)))
              (LETT |refer| (SPADCALL |sups| (QREFELT % 46)))
              (COND
               ((NULL (SPADCALL |st| (QREFELT % 47)))
                (COND
                 ((NULL (SPADCALL |st| (QREFELT % 48)))
                  (SEQ
                   (LETT |nx|
                         (SPADCALL (SPADCALL |refer| (QREFELT % 50))
                                   (QREFELT % 52)))
                   (EXIT
                    (COND
                     ((QEQCAR |nx| 0)
                      (SEQ (LETT |count| |$streamCount|)
                           (LETT |degr|
                                 (MIN |count| (+ (+ (QCDR |nx|) |count|) 1)))
                           (EXIT
                            (SPADCALL |sups| |degr| (QREFELT % 54))))))))))))
              (EXIT
               (SPADCALL |st| |refer| (SPADCALL |x| (QREFELT % 11))
                         (SPADCALL |x| (QREFELT % 12))
                         (SPADCALL |x| (QREFELT % 55)) (QREFELT % 57)))))) 

(DECLAIM (NOTINLINE |SparseUnivariatePuiseuxSeries;|)) 

(DEFUN |SparseUnivariatePuiseuxSeries| (&REST #1=#:G61)
  (SPROG NIL
         (PROG (#2=#:G62)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseUnivariatePuiseuxSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariatePuiseuxSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariatePuiseuxSeries|)))))))))) 

(DEFUN |SparseUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G54 NIL) (#2=#:G55 NIL) (#3=#:G56 NIL) (#4=#:G57 NIL)
    (#5=#:G59 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|SparseUnivariatePuiseuxSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 81))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|Comparable|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
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
                                                                 |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
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
                                              (|HasCategory| |#1| '(|Ring|)))
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
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
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
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR #1# (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 34359738368))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9
              (|Record| (|:| |expon| (|Fraction| (|Integer|)))
                        (|:| |lSeries|
                             (|SparseUnivariateLaurentSeries| |#1| |#2|
                                                              |#3|))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 37
                (CONS (|dispatchFunction| |SUPXS;differentiate;%V%;7|) %))))
    (COND
     ((|testBitVector| |pv$| 6)
      (QSETREFV % 39 (CONS (|dispatchFunction| |SUPXS;integrate;%V%;8|) %))))
    %))) 

(MAKEPROP '|SparseUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariatePuiseuxSeriesConstructor| 6 27)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Symbol|)
              |SUPXS;variable;%S;2| |SUPXS;center;%Coef;3| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Fraction| 53)
              (13 . |One|) (17 . |monomial|) (23 . |Zero|) (27 . |Zero|)
              (31 . |Zero|) (35 . +) (|Variable| (NRTEVAL (QREFELT % 7)))
              |SUPXS;coerce;V%;4|
              (|SparseUnivariateTaylorSeries| 6 (NRTEVAL (QREFELT % 7))
                                              (NRTEVAL (QREFELT % 8)))
              (|SparseUnivariateLaurentSeries| 6 (NRTEVAL (QREFELT % 7))
                                               (NRTEVAL (QREFELT % 8)))
              (41 . |coerce|) (46 . |coerce|) |SUPXS;coerce;Suts%;5|
              (|Union| 27 '"failed") (51 . |retractIfCan|)
              (|Union| 26 '"failed") (56 . |retractIfCan|)
              |SUPXS;retractIfCan;%U;6| (61 . |differentiate|)
              (66 . |differentiate|) (72 . |integrate|) (77 . |integrate|)
              (83 . |laurentRep|) (|Record| (|:| |k| 53) (|:| |c| 6))
              (|Stream| 41) (|InnerSparseUnivariatePowerSeries| 6)
              (88 . |getStream|) (|Reference| 49) (93 . |getRef|)
              (98 . |explicitlyEmpty?|) (103 . |explicitEntries?|)
              (|OrderedCompletion| 53) (108 . |elt|) (|Union| 53 '"failed")
              (113 . |retractIfCan|) (|Integer|) (118 . |extend|)
              (124 . |rationalPower|) (|OutputForm|)
              (129 . |seriesToOutputForm|) |SUPXS;coerce;%Of;9| (|String|)
              (|PositiveInteger|) (|Record| (|:| |k| 17) (|:| |c| 6))
              (|List| 61) (|Mapping| 6 6) (|Stream| 61) (|NonNegativeInteger|)
              (|List| 10) (|List| 65) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Factored| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 71 '#1="failed") (|Union| 74 '#1#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 74) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Stream| 6))
           '#(|variable| 138 |retractIfCan| 143 |rationalPower| 153 |monomial|
              158 |laurentRep| 164 |integrate| 169 |differentiate| 180 |coerce|
              191 |center| 211 |Zero| 216 |One| 220 + 224)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 7 0 7 0 7 7 0 7 0 16 7 15 7 6 16 15 3 4
                                  10 2 1 21 6 21 15 18 10 6 15 10 0 6 20 0 0 0
                                  6 6 21 0 0 0 0 0 27 18 18 26 18 25 0 0 0 0 15
                                  6 0 0 0 7 7 16 15 20 6 6 6 6 6 6 5 0 0 0 0
                                  0))
            (CONS
             '#(|UnivariatePuiseuxSeriesConstructorCategory&| NIL |Field&| NIL
                |EuclideanDomain&| |UnivariatePowerSeriesCategory&|
                |UniqueFactorizationDomain&| NIL |PowerSeriesCategory&|
                |GcdDomain&| |AbelianMonoidRing&| NIL |DivisionRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL NIL NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Module&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL |NonAssociativeSemiRng&|
                |AbelianSemiGroup&| |Magma&| NIL
                |TranscendentalFunctionCategory&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL NIL
                NIL)
             (CONS
              '#((|UnivariatePuiseuxSeriesConstructorCategory| 6
                                                               (|SparseUnivariateLaurentSeries|
                                                                6 7 8))
                 (|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 17)
                 (|EuclideanDomain|) (|UnivariatePowerSeriesCategory| 6 17)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 17 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 17) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 17) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|PartialDifferentialRing| 10)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Ring|) (|NonAssociativeAlgebra| 17) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Module| 17) (|Module| $$)
                 (|Module| 6) (|SemiRng|) (|BiModule| 17 17)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 17) (|RightModule| 17)
                 (|LeftModule| 17) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|AbelianSemiGroup|) (|Magma|)
                 (|CommutativeStar|) (|TranscendentalFunctionCategory|)
                 (|SetCategory|)
                 (|RetractableTo| (|SparseUnivariateLaurentSeries| 6 7 8))
                 (|RetractableTo| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 56) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|)
                 (|CoercibleFrom| (|SparseUnivariateLaurentSeries| 6 7 8))
                 (|CoercibleFrom| (|SparseUnivariateTaylorSeries| 6 7 8)))
              (|makeByteWordVec2| 58
                                  '(1 6 13 0 14 0 6 0 15 0 0 0 16 0 17 0 18 2 0
                                    0 6 17 19 0 6 0 20 0 0 0 21 0 17 0 22 2 0 0
                                    0 0 23 1 27 0 26 28 1 0 0 27 29 1 0 31 0 32
                                    1 27 33 0 34 1 0 0 0 36 2 0 0 0 24 37 1 0 0
                                    0 38 2 0 0 0 24 39 1 0 27 0 40 1 43 42 0 44
                                    1 43 45 0 46 1 42 13 0 47 1 42 13 0 48 1 45
                                    49 0 50 1 49 51 0 52 2 43 0 0 53 54 1 0 17
                                    0 55 5 43 56 42 45 10 6 17 57 1 0 10 0 11 1
                                    0 31 0 32 1 0 33 0 35 1 0 17 0 55 2 0 0 6
                                    17 19 1 0 27 0 40 1 6 0 0 38 2 6 0 0 24 39
                                    2 0 0 0 24 37 1 3 0 0 36 1 0 56 0 58 1 0 0
                                    27 29 1 0 0 24 25 1 0 0 26 30 1 0 6 0 12 0
                                    34 0 21 0 32 0 16 2 0 0 0 0 23)))))
           '|lookupIncomplete|)) 
