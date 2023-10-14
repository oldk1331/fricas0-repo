
(/VERSIONCHECK 2) 

(DEFUN |DSMP;retractIfCan;$U;1| (|p| $)
  (COND
   ((ZEROP (SPADCALL |p| (QREFELT $ 10)))
    (CONS 0
          (SPADCALL (CONS #'|DSMP;retractIfCan;$U;1!0| $) (ELT $ 14) |p|
                    (QREFELT $ 18))))
   ('T (CONS 1 "failed")))) 

(DEFUN |DSMP;retractIfCan;$U;1!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 13))) 

(DEFUN |DSMP;coerce;Smp$;2| (|p| $)
  (SPADCALL (CONS #'|DSMP;coerce;Smp$;2!0| $) (ELT $ 23) |p| (QREFELT $ 27))) 

(DEFUN |DSMP;coerce;Smp$;2!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 22))) 

(DEFUN |DifferentialSparseMultivariatePolynomial| (&REST #1=#:G178)
  (PROG ()
    (RETURN
     (PROG (#2=#:G179)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DifferentialSparseMultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|DifferentialSparseMultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |DifferentialSparseMultivariatePolynomial;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|DifferentialSparseMultivariatePolynomial|))))))))))) 

(DEFUN |DifferentialSparseMultivariatePolynomial;| (|#1| |#2| |#3|)
  (PROG (#1=#:G177 |pv$| #2=#:G175 #3=#:G176 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #4=(|DifferentialSparseMultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT DV$3 (|devaluate| |#3|) . #4#)
      (LETT |dv$|
            (LIST '|DifferentialSparseMultivariatePolynomial| DV$1 DV$2 DV$3)
            . #4#)
      (LETT $ (GETREFV 78) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#3|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#3|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#3|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#3|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory| |#3|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|))))
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
                                                         '(|DifferentialRing|))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
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
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3# #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache|
                  '|DifferentialSparseMultivariatePolynomial|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 134217728))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 268435456))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 536870912))
      (AND
       (OR #2#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 1073741824))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DifferentialSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|NonNegativeInteger|) (0 . |order|) (5 . |retract|)
              (|SparseMultivariatePolynomial| 6 7) (10 . |coerce|)
              (15 . |coerce|) (|Mapping| 12 8) (|Mapping| 12 6)
              (|PolynomialCategoryLifting| 69 8 6 $$ 12) (20 . |map|)
              (|Union| 12 '"failed") |DSMP;retractIfCan;$U;1| (27 . |coerce|)
              (32 . |coerce|) (37 . |coerce|) (|Mapping| $$ 7) (|Mapping| $$ 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 6 12 $$)
              (42 . |map|) |DSMP;coerce;Smp$;2| (|Union| 48 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 56)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 56 $)
              (|Union| $ '#1#) (|Fraction| 56) (|Boolean|) (|List| 7)
              (|List| 6) (|List| $) (|Mapping| $ 9)
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 56) (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 56)))
              (|Vector| $) (|List| 51) (|List| 9) (|Symbol|) (|Factored| 43)
              (|Union| 54 '#1#) (|List| 43) (|Union| 37 '#2="failed")
              (|Integer|) (|Union| 56 '#2#) (|Union| 7 '#2#) (|Mapping| 6 6)
              (|Union| 41 '#3="failed")
              (|Record| (|:| |var| 8) (|:| |exponent| 9)) (|Union| 61 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 8)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 8 '#2#) (|List| 68) (|Equation| $)
              (|IndexedExponents| 8) (|Union| 6 '#2#) (|Mapping| 69 69)
              (|Record| (|:| |mat| 73) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|PositiveInteger|) (|SingleInteger|) (|String|) (|OutputForm|))
           '#(|retractIfCan| 49 |order| 54 |coerce| 59) 'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 1 0 1 0 25 24 0 0 27 8 23 0 0 23 27 2 8
                                  9 10 23 15 17 16 0 0 8 26 0 0 0 0 21 8 8 0 0
                                  0 0 0 0 0 0 3 4 14 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 26 2 5 6 7 11 12 13 16 16))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| |PartialDifferentialRing&| NIL
                NIL |Module&| |EntireRing&| |Module&| NIL NIL |Module&| NIL
                |PartialDifferentialRing&| |DifferentialRing&| |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |InnerEvalable&|
                |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 7 8
                                                   (|IndexedExponents| 8))
                 (|PolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 8) 8)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 8))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 8)) (|GcdDomain|)
                 (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|Algebra| 37) (|Algebra| 6) (|PartialDifferentialRing| 8)
                 (|LinearlyExplicitRingOver| 6) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|Module| 37)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 56) (|PartialDifferentialRing| 51)
                 (|DifferentialRing|) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 37 37) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 37) (|RightModule| 37) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 56)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 6)
                 (|SetCategory|)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|RetractableTo| 7) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 8) (|InnerEvalable| 8 $$)
                 (|InnerEvalable| 8 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 77) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33) (|ConvertibleTo| 31)
                 (|RetractableTo| 37) (|RetractableTo| 56)
                 (|canonicalUnitNormal|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6))
              (|makeByteWordVec2| 28
                                  '(1 0 9 0 10 1 8 7 0 11 1 12 0 7 13 1 12 0 6
                                    14 3 17 12 15 16 2 18 1 8 0 7 21 1 0 0 8 22
                                    1 0 0 6 23 3 26 2 24 25 12 27 1 0 19 0 20 1
                                    0 9 0 10 1 0 0 12 28 1 0 0 8 22 1 0 0 6
                                    23)))))
           '|lookupIncomplete|)) 
