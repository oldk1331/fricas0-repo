
(/VERSIONCHECK 2) 

(DEFUN |POLY;coerce;$Of;1| (|p| $)
  (PROG (|a| #1=#:G129 |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 8)) . #2=(|POLY;coerce;$Of;1|))
          (EXIT
           (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 10)))
                 (#3='T
                  (SEQ
                   (LETT |a|
                         (COND
                          ((SPADCALL (QREFELT $ 13))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 15))
                                     (QREFELT $ 17)))
                          (#3#
                           (PROG2
                               (LETT #1# (SPADCALL |p| (QREFELT $ 19)) . #2#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))))
                         . #2#)
                   (EXIT
                    (SPADCALL (SPADCALL |p| |a| (QREFELT $ 21))
                              (SPADCALL |a| (QREFELT $ 22))
                              (QREFELT $ 24))))))))))) 

(DEFUN |POLY;integrate;$S$;2| (|p| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |p| |x| (QREFELT $ 21)) (QREFELT $ 26))
            (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 28))) 

(DEFUN |Polynomial| (#1=#:G166)
  (PROG ()
    (RETURN
     (PROG (#2=#:G167)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Polynomial|)
                                           '|domainEqualList|)
                . #3=(|Polynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Polynomial;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Polynomial|))))))))))) 

(DEFUN |Polynomial;| (|#1|)
  (PROG (#1=#:G165 |pv$| #2=#:G163 #3=#:G164 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|Polynomial|))
      (LETT |dv$| (LIST '|Polynomial| DV$1) . #4#)
      (LETT $ (GETREFV 69) . #4#)
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
                                           (|HasCategory| (|Symbol|)
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| (|Symbol|)
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| (|Symbol|)
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| (|Symbol|)
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory| (|Symbol|)
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
      (|haddProp| |$ConstructorCache| '|Polynomial| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 33554432))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 67108864))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 134217728))
      (AND
       (OR #2#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 268435456))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 8)
        (QSETREFV $ 29 (CONS (|dispatchFunction| |POLY;integrate;$S$;2|) $))))
      $)))) 

(MAKEPROP '|Polynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 16)
              (|local| |#1|) (|Union| 6 '#1="failed") (0 . |retractIfCan|)
              (|OutputForm|) (5 . |coerce|) (|Boolean|)
              (|UserDefinedPartialOrdering| 16) (10 . |userOrdered?|)
              (|List| 16) (14 . |variables|) (|Symbol|) (19 . |largest|)
              (|Union| 16 '"failed") (24 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (29 . |univariate|)
              (35 . |coerce|) (|SparseUnivariatePolynomial| $$)
              (40 . |outputForm|) |POLY;coerce;$Of;1| (46 . |integrate|)
              (51 . |coerce|) (56 . |elt|) (62 . |integrate|)
              (|Union| 44 '#2="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 50)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 50 $)
              (|Union| $ '#2#) (|Fraction| 50) (|NonNegativeInteger|)
              (|List| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |mat| 45) (|:| |vec| (|Vector| 50))) (|Vector| $)
              (|Matrix| 50) (|Factored| 20) (|Union| 48 '#2#) (|List| 20)
              (|Union| 38 '#1#) (|Integer|) (|Union| 50 '#1#)
              (|Union| 40 '#3="failed")
              (|Record| (|:| |var| 16) (|:| |exponent| 39)) (|Union| 53 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| 6) (|List| 39) (|List| 6)
              (|Equation| $) (|List| 59) (|IndexedExponents| 16)
              (|Mapping| 6 6) (|Mapping| 61 61) (|Matrix| 6)
              (|Record| (|:| |mat| 64) (|:| |vec| (|Vector| 6)))
              (|PositiveInteger|) (|SingleInteger|) (|String|))
           '#(|variables| 68 |univariate| 73 |retractIfCan| 79 |mainVariable|
              84 |integrate| 89 |coerce| 95)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 1 0 23 22 0 25 8 21 0 0 21 25 2 8 9
                                  10 21 15 0 0 8 24 0 0 0 0 19 8 8 0 0 0 0 0 0
                                  0 0 3 4 14 0 0 0 0 0 0 0 0 0 0 0 0 24 2 5 6 7
                                  11 12 13))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |EntireRing&| |Module&| NIL NIL |Module&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 61 16)
                 (|MaybeSkewPolynomialCategory| 6 61 16)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 61) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 61) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|Algebra| 38) (|Algebra| 6) (|PartialDifferentialRing| 16)
                 (|LinearlyExplicitRingOver| 6) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|Module| 38)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 50) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 38 38) (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|LeftModule| 38) (|RightModule| 38) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 50)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 16) (|InnerEvalable| 16 $$)
                 (|InnerEvalable| 16 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 9) (|CommutativeStar|) (|noZeroDivisors|)
                 (|ConvertibleTo| 33) (|ConvertibleTo| 34) (|ConvertibleTo| 32)
                 (|RetractableTo| 38) (|RetractableTo| 50)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 29
                                  '(1 0 7 0 8 1 6 9 0 10 0 12 11 13 1 0 14 0 15
                                    1 12 16 14 17 1 0 18 0 19 2 0 20 0 16 21 1
                                    16 9 0 22 2 23 9 0 9 24 1 23 0 0 26 1 0 0
                                    16 27 2 23 2 0 2 28 2 0 0 0 16 29 1 0 14 0
                                    15 2 0 20 0 16 21 1 0 7 0 8 1 0 18 0 19 2 8
                                    0 0 16 29 1 0 0 16 27 1 0 9 0 25)))))
           '|lookupIncomplete|)) 
