
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

(DEFUN |Polynomial| (#1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
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
  (PROG (#1=#:G164 |pv$| #2=#:G163 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Polynomial|))
      (LETT |dv$| (LIST '|Polynomial| DV$1) . #3#)
      (LETT $ (GETREFV 69) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
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
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
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
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           #2#
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
                                                             '(|PolynomialFactorizationExplicit|)))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|Polynomial| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #3#)
       (|augmentPredVector| $ 8388608))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 16777216))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 11)
        (QSETREFV $ 29 (CONS (|dispatchFunction| |POLY;integrate;$S$;2|) $))))
      $)))) 

(MAKEPROP '|Polynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 16)
              (|local| |#1|) (|Union| 6 '#1="failed") (0 . |retractIfCan|)
              (|OutputForm|) (5 . |coerce|) (|Boolean|)
              (|UserDefinedPartialOrdering| 16) (10 . |userOrdered?|)
              (|List| 16) (14 . |variables|) (|Symbol|) (19 . |largest|)
              (|Union| 16 '#2="failed") (24 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (29 . |univariate|)
              (35 . |coerce|) (|SparseUnivariatePolynomial| $$)
              (40 . |outputForm|) |POLY;coerce;$Of;1| (46 . |integrate|)
              (51 . |coerce|) (56 . |elt|) (62 . |integrate|)
              (|Union| 45 '#3="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 50)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 50 $)
              (|Union| $ '#3#) (|Fraction| 50) (|NonNegativeInteger|)
              (|List| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Matrix| 50) (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 50)))
              (|Vector| $) (|Factored| 20) (|Union| 48 '#3#) (|List| 20)
              (|Union| 38 '#1#) (|Integer|) (|Union| 50 '#1#) (|Union| 40 '#2#)
              (|Record| (|:| |var| 16) (|:| |exponent| 39)) (|Union| 53 '#2#)
              (|List| 39) (|SparseUnivariatePolynomial| 6)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 59) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|List| 6) (|List| 62) (|Equation| $) (|Mapping| 6 6)
              (|IndexedExponents| 16) (|Mapping| 64 64) (|PositiveInteger|)
              (|SingleInteger|) (|String|))
           '#(|variables| 68 |univariate| 73 |retractIfCan| 79 |mainVariable|
              84 |integrate| 89 |coerce| 95)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 1 0 1 0 23 22 0 3 11 2 0 0 21 3 3 11 12 13
                                  2 17 0 0 11 14 0 0 0 0 2 11 11 0 0 0 0 0 0 0
                                  0 5 6 10 0 0 0 0 0 0 0 0 0 0 0 2 3 4 7 8 9 15
                                  16))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| |IntegralDomain&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&| NIL
                |Module&| NIL NIL |Module&| NIL |Ring&| NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 6 64 16)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 64) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 64) (|GcdDomain|) (|IntegralDomain|)
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
                 (|SetCategory|) (|RetractableTo| 16) (|InnerEvalable| 16 $$)
                 (|InnerEvalable| 16 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 9) (|CommutativeStar|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 32) (|RetractableTo| 38)
                 (|RetractableTo| 50))
              (|makeByteWordVec2| 29
                                  '(1 0 7 0 8 1 6 9 0 10 0 12 11 13 1 0 14 0 15
                                    1 12 16 14 17 1 0 18 0 19 2 0 20 0 16 21 1
                                    16 9 0 22 2 23 9 0 9 24 1 23 0 0 26 1 0 0
                                    16 27 2 23 2 0 2 28 2 0 0 0 16 29 1 0 14 0
                                    15 2 0 20 0 16 21 1 0 7 0 8 1 0 18 0 19 2
                                    11 0 0 16 29 1 0 0 16 27 1 0 9 0 25)))))
           '|lookupIncomplete|)) 
