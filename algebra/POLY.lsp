
(/VERSIONCHECK 2) 

(DEFUN |POLY;coerce;$Of;1| (|p| $)
  (PROG (|a| #1=#:G107 |r|)
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

(DECLAIM (NOTINLINE |Polynomial;|)) 

(DEFUN |Polynomial| (#1=#:G146)
  (PROG ()
    (RETURN
     (PROG (#2=#:G147)
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
  (PROG (#1=#:G145 |pv$| #2=#:G142 #3=#:G143 #4=#:G144 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|Polynomial|))
      (LETT |dv$| (LIST '|Polynomial| DV$1) . #5#)
      (LETT $ (GETREFV 71) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
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
                                          (OR
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           #4#)
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
                                                . #5#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                          (OR #3# #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #5#)
                                          (OR #3# #4# #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #4# #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #4# #2#) (OR #4# #2#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              #4# #2#)))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|Polynomial| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 536870912))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #5#)
       (|augmentPredVector| $ 1073741824))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 2147483648))
      (AND
       (OR (|HasCategory| |#1| '(|EntireRing|))
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 4294967296))
      (AND
       (OR #4#
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 8589934592))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 10)
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
              (|Union| 46 '#2="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 51)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 51 $)
              (|Union| $ '#2#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 51) (|NonNegativeInteger|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Factored| $) (|Matrix| 51)
              (|Record| (|:| |mat| 44) (|:| |vec| (|Vector| 51))) (|Vector| $)
              (|Factored| 20) (|Union| 49 '#2#) (|List| 20) (|Union| 39 '#1#)
              (|Integer|) (|Union| 51 '#1#)
              (|Record| (|:| |var| 16) (|:| |exponent| 40))
              (|Union| 53 '#3="failed") (|Union| 42 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 40)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|List| 6)
              (|Equation| $) (|List| 60) (|IndexedExponents| 16)
              (|Mapping| 6 6) (|Mapping| 62 62)
              (|Record| (|:| |mat| 66) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(|variables| 68 |univariate| 73 |retractIfCan| 79 |mainVariable|
              84 |integrate| 89 |coerce| 95)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 1 0 1 0 4 26 0 28 3 10 23 0 0 25 28 10 11
                                  12 23 13 18 0 0 10 29 0 0 0 0 22 10 10 0 0 0
                                  0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0 0 0 0 0 27 2
                                  7 8 9 14 15 16))
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
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 62 16)
                 (|MaybeSkewPolynomialCategory| 6 62 16)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 62) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 62) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 39) (|Algebra| 6)
                 (|PartialDifferentialRing| 16) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 39)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 51) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 39 39) (|BiModule| $$ $$) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 39) (|RightModule| 39)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 51) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 16)
                 (|InnerEvalable| 16 $$) (|InnerEvalable| 16 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 9) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 33) (|ConvertibleTo| 34)
                 (|ConvertibleTo| 32) (|RetractableTo| 39) (|RetractableTo| 51)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 29
                                  '(1 0 7 0 8 1 6 9 0 10 0 12 11 13 1 0 14 0 15
                                    1 12 16 14 17 1 0 18 0 19 2 0 20 0 16 21 1
                                    16 9 0 22 2 23 9 0 9 24 1 23 0 0 26 1 0 0
                                    16 27 2 23 2 0 2 28 2 0 0 0 16 29 1 0 14 0
                                    15 2 0 20 0 16 21 1 0 7 0 8 1 0 18 0 19 2
                                    10 0 0 16 29 1 0 0 16 27 1 0 9 0 25)))))
           '|lookupIncomplete|)) 
