
(/VERSIONCHECK 2) 

(DEFUN |SMPEXPR;log;2$;1| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 10))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "log p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: log only defined for elements of the coefficient ring"))))))) 

(DEFUN |SMPEXPR;exp;2$;2| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 19))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "exp p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: exp only defined for elements of the coefficient ring"))))))) 

(DEFUN |SMPEXPR;sin;2$;3| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 21))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "sin p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: sin only defined for elements of the coefficient ring"))))))) 

(DEFUN |SMPEXPR;asin;2$;4| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 23))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "asin p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: asin only defined for elements of the coefficient ring"))))))) 

(DEFUN |SMPEXPR;cos;2$;5| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 25))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "cos p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: cos only defined for elements of the coefficient ring"))))))) 

(DEFUN |SMPEXPR;acos;2$;6| (|p| $)
  (SEQ
   (COND
    ((SPADCALL |p| (QREFELT $ 8))
     (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 27))
               (QREFELT $ 11)))
    ('T
     (SEQ
      (SPADCALL
       (SPADCALL "acos p for p= " (SPADCALL |p| (QREFELT $ 13)) (QREFELT $ 14))
       (QREFELT $ 17))
      (EXIT
       (|error|
        "SUPTRAFUN: acos only defined for elements of the coefficient ring"))))))) 

(DEFUN |SparseMultivariatePolynomialExpressions| (#1=#:G187)
  (PROG ()
    (RETURN
     (PROG (#2=#:G188)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SparseMultivariatePolynomialExpressions|)
                                           '|domainEqualList|)
                . #3=(|SparseMultivariatePolynomialExpressions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SparseMultivariatePolynomialExpressions;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SparseMultivariatePolynomialExpressions|))))))))))) 

(DEFUN |SparseMultivariatePolynomialExpressions;| (|#1|)
  (PROG (#1=#:G186 |pv$| #2=#:G184 #3=#:G185 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #4=(|SparseMultivariatePolynomialExpressions|))
      (LETT |dv$| (LIST '|SparseMultivariatePolynomialExpressions| DV$1) . #4#)
      (LETT $ (GETREFV 73) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|NonNegativeInteger|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|NonNegativeInteger|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|NonNegativeInteger|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|NonNegativeInteger|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|NonNegativeInteger|)
                                            '(|ConvertibleTo| (|InputForm|))))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache|
                  '|SparseMultivariatePolynomialExpressions| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 67108864))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 134217728))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 268435456))
      (AND
       (OR #3#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 536870912))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 20)
        (PROGN
         (QSETREFV $ 18 (CONS (|dispatchFunction| |SMPEXPR;log;2$;1|) $))
         (QSETREFV $ 20 (CONS (|dispatchFunction| |SMPEXPR;exp;2$;2|) $))
         (QSETREFV $ 22 (CONS (|dispatchFunction| |SMPEXPR;sin;2$;3|) $))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |SMPEXPR;asin;2$;4|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |SMPEXPR;cos;2$;5|) $))
         (QSETREFV $ 28 (CONS (|dispatchFunction| |SMPEXPR;acos;2$;6|) $)))))
      $)))) 

(MAKEPROP '|SparseMultivariatePolynomialExpressions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 38)
              (|local| |#1|) (|Boolean|) (0 . |ground?|) (5 . |ground|)
              (10 . |log|) (15 . |coerce|) (|OutputForm|) (20 . |coerce|)
              (25 . |hconcat|) (|Void|) (|OutputPackage|) (31 . |output|)
              (36 . |log|) (41 . |exp|) (46 . |exp|) (51 . |sin|) (56 . |sin|)
              (61 . |asin|) (66 . |asin|) (71 . |cos|) (76 . |cos|)
              (81 . |acos|) (86 . |acos|) (|Union| 46 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 51)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 51 $)
              (|Union| $ '#1#) (|Fraction| 51) (|NonNegativeInteger|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 51) (|Record| (|:| |mat| 44) (|:| |vec| (|Vector| 51)))
              (|Vector| $) (|Factored| 41) (|Union| 49 '#1#) (|List| 41)
              (|Union| 37 '#2="failed") (|Integer|) (|Union| 51 '#2#)
              (|Record| (|:| |var| 38) (|:| |exponent| 38))
              (|Union| 53 '#3="failed") (|Union| 40 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| 6) (|List| 38) (|Union| 38 '#2#)
              (|List| 6) (|Equation| $) (|List| 61) (|Mapping| 6 6)
              (|IndexedExponents| 38) (|Union| 6 '#2#) (|Mapping| 64 64)
              (|Matrix| 6) (|Record| (|:| |mat| 67) (|:| |vec| (|Vector| 6)))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(|sin| 91 |log| 96 |ground?| 101 |ground| 106 |exp| 111 |cos| 116
              |coerce| 121 |asin| 131 |acos| 136)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 1 0 1 0 5 4 0 6 3 12 24 0 0 24 6 12 13 14
                                  24 6 19 0 0 12 26 0 0 0 0 25 12 12 0 0 0 0 0
                                  0 0 0 7 8 18 0 0 0 20 0 0 0 0 0 0 0 0 0 26 2
                                  9 10 11 15 16 17 20 20 20 20 20))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL
                |ElementaryFunctionCategory&|)
             (CONS
              '#((|PolynomialCategory| 6 64 38)
                 (|MaybeSkewPolynomialCategory| 6 64 38)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 64) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 64) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 37) (|Algebra| 6)
                 (|PartialDifferentialRing| 38) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 37)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 51) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 37 37) (|BiModule| $$ $$) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 37) (|RightModule| 37)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 51) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 38)
                 (|InnerEvalable| 38 $$) (|InnerEvalable| 38 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 12) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 32) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 31) (|RetractableTo| 37) (|RetractableTo| 51)
                 (|canonicalUnitNormal|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|))
              (|makeByteWordVec2| 28
                                  '(1 0 7 0 8 1 0 6 0 9 1 6 0 0 10 1 0 0 6 11 1
                                    0 12 0 13 2 12 0 0 0 14 1 16 15 12 17 1 0 0
                                    0 18 1 6 0 0 19 1 0 0 0 20 1 6 0 0 21 1 0 0
                                    0 22 1 6 0 0 23 1 0 0 0 24 1 6 0 0 25 1 0 0
                                    0 26 1 6 0 0 27 1 0 0 0 28 1 20 0 0 22 1 20
                                    0 0 18 1 0 7 0 8 1 0 6 0 9 1 20 0 0 20 1 20
                                    0 0 26 1 0 0 6 11 1 0 12 0 13 1 20 0 0 24 1
                                    20 0 0 28)))))
           '|lookupIncomplete|)) 
