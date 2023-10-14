
(/VERSIONCHECK 2) 

(DEFUN |JBP;jetVariables;$L;1| (|p| $) (SPADCALL |p| (QREFELT $ 10))) 

(DEFUN |JBP;subst;$JB2$;2| (|p| |jv| |exp| $)
  (SPADCALL |p| |jv| |exp| (QREFELT $ 12))) 

(PUT '|JBP;numerator;2$;3| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |JBP;numerator;2$;3| (|l| $) |l|) 

(DEFUN |JBP;denominator;2$;4| (|l| $) (|spadConstant| $ 15)) 

(DEFUN |JBP;solveFor;$JBU;5| (|p| |jv| $)
  (PROG (|cc| |c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |p| |jv| (QREFELT $ 17))
            . #1=(|JBP;solveFor;$JBU;5|))
      (EXIT
       (COND
        ((SPADCALL |c| (QREFELT $ 19))
         (SEQ (LETT |cc| (SPADCALL |c| (QREFELT $ 20)) . #1#)
              (EXIT
               (CONS 0
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 15) |cc| (QREFELT $ 22)) |p|
                       (QREFELT $ 23))
                      (SPADCALL |jv| (QREFELT $ 24)) (QREFELT $ 25))))))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |JBP;solveFor;$JBU;6| (|p| |jv| $)
  (PROG (|rc| |cc| |c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |p| |jv| (QREFELT $ 17))
            . #1=(|JBP;solveFor;$JBU;6|))
      (EXIT
       (COND
        ((SPADCALL |c| (QREFELT $ 19))
         (SEQ (LETT |cc| (SPADCALL |c| (QREFELT $ 20)) . #1#)
              (LETT |rc| (SPADCALL |cc| (QREFELT $ 28)) . #1#)
              (EXIT
               (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                     (#2='T
                      (CONS 0
                            (SPADCALL (SPADCALL (QCDR |rc|) |p| (QREFELT $ 29))
                                      (SPADCALL |jv| (QREFELT $ 24))
                                      (QREFELT $ 25))))))))
        (#2# (CONS 1 "failed")))))))) 

(DEFUN |JBP;groebner;2L;7| (|lp| $)
  (PROG (LJV |lj| #1=#:G133 |p| #2=#:G132)
    (RETURN
     (SEQ (SPADCALL "groebner" (QREFELT $ 32))
          (LETT |lj|
                (PROGN
                 (LETT #2# NIL . #3=(|JBP;groebner;2L;7|))
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 11)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT LJV (SPADCALL (ELT $ 33) |lj| NIL (QREFELT $ 39)) . #3#)
          (SPADCALL
           (SPADCALL "LJV" (SPADCALL LJV (QREFELT $ 40)) (QREFELT $ 41))
           (QREFELT $ 32))
          (EXIT
           (SPADCALL |lp|
                     (|compiledLookupCheck| '|groebner|
                                            (LIST
                                             (LIST '|List| (|devaluate| $))
                                             (LIST '|List| (|devaluate| $)))
                                            (|JetGroebner| (ELT $ 6) (ELT $ 7)
                                                           LJV $
                                                           (|DirectProduct|
                                                            (|#| LJV)
                                                            (|NonNegativeInteger|)))))))))) 

(DECLAIM (NOTINLINE |JetBundlePolynomial;|)) 

(DEFUN |JetBundlePolynomial| (&REST #1=#:G173)
  (PROG ()
    (RETURN
     (PROG (#2=#:G174)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetBundlePolynomial|)
                                           '|domainEqualList|)
                . #3=(|JetBundlePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetBundlePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|JetBundlePolynomial|))))))))))) 

(DEFUN |JetBundlePolynomial;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G172 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|JetBundlePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|JetBundlePolynomial| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 93) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory| |#2|
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
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|JetBundlePolynomial| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
           (|HasCategory| $ '(|CharacteristicNonZero|))
           (|augmentPredVector| $ 1048576))
      (AND
       (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
       (|augmentPredVector| $ 2097152))
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 4194304))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|SparseMultivariatePolynomial| |#1| |#2|))
      (COND
       ((|testBitVector| |pv$| 16)
        (QSETREFV $ 27 (CONS (|dispatchFunction| |JBP;solveFor;$JBU;5|) $)))
       ('T
        (QSETREFV $ 27 (CONS (|dispatchFunction| |JBP;solveFor;$JBU;6|) $))))
      (COND
       ((|testBitVector| |pv$| 19)
        (QSETREFV $ 43 (CONS (|dispatchFunction| |JBP;groebner;2L;7|) $))))
      $)))) 

(MAKEPROP '|JetBundlePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|List| 7) (0 . |variables|)
              |JBP;jetVariables;$L;1| (5 . |eval|) |JBP;subst;$JB2$;2|
              |JBP;numerator;2$;3| (12 . |One|) |JBP;denominator;2$;4|
              (16 . |differentiate|) (|Boolean|) (22 . |ground?|)
              (27 . |retract|) (32 . |One|) (36 . /) (42 . *) (48 . |coerce|)
              (53 . -) (|Union| $ '"failed") (59 . |solveFor|) (65 . |recip|)
              (70 . *) (|Void|) (|OutputForm|) (76 . |print|) (81 . |setUnion|)
              (|List| $$) (87 . |empty|) (91 . |empty|) (|Mapping| 9 9 9)
              (|List| 9) (95 . |reduce|) (102 . |coerce|) (107 . |assign|)
              (|List| $) (113 . |groebner|) (|Union| 55 '#1="failed")
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 63)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 63 $)
              (|Fraction| 63) (|NonNegativeInteger|) (|Factored| $)
              (|Record| (|:| |mat| 56) (|:| |vec| (|Vector| 63))) (|Vector| $)
              (|Matrix| 63) (|Factored| 58) (|SparseUnivariatePolynomial| $)
              (|Union| 60 '#1#) (|List| 58) (|Union| 51 '#2="failed")
              (|Union| 63 '#2#) (|Integer|) (|List| 52) (|Union| 7 '"failed")
              (|Matrix| 6) (|Record| (|:| |mat| 66) (|:| |vec| (|Vector| 6)))
              (|IndexedExponents| 7) (|Mapping| 68 68) (|List| 6)
              (|Union| 6 '#2#) (|Mapping| 6 6) (|Equation| $) (|List| 73)
              (|SparseUnivariatePolynomial| 6)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 42 '#3="failed")
              (|Record| (|:| |var| 7) (|:| |exponent| 52)) (|Union| 78 '#3#)
              (|Union| '"failed" (|List| 64))
              (|Record| (|:| |Sys| 42) (|:| JM 82) (|:| |Depend| 80))
              (|SparseEchelonMatrix| 7 $)
              (|Record| (|:| |DSys| 42) (|:| |JVars| 38)) (|PositiveInteger|)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 9)) (|Symbol|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 86) (|String|) (|SingleInteger|) (|HashState|))
           '#(|variables| 118 |subst| 123 |solveFor| 130 |retract| 136
              |numerator| 141 |jetVariables| 146 |ground?| 151 |groebner| 156
              |eval| 161 |differentiate| 168 |denominator| 174 |coerce| 179
              |One| 184 / 188 - 194 * 200)
           'NIL
           (CONS
            (|makeByteWordVec2| 20
                                '(0 0 1 0 0 1 0 0 0 0 0 0 7 20 0 0 0 0 0 0 7 8
                                  9 20 14 0 0 0 7 0 0 0 0 0 7 7 0 0 0 0 0 0 0 0
                                  2 3 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 5 6 10
                                  11 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |JetBundleFunctionCategory&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL
                |FullyLinearlyExplicitRingOver&| NIL |Algebra&| |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL
                |PartialDifferentialRing&| |EntireRing&| |Module&| NIL
                |Module&| NIL NIL |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL
                NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|JetBundleFunctionCategory| 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|LeftOreRing|) (|Algebra| $$) (|Algebra| 51) (|Algebra| 6)
                 (|PartialDifferentialRing| 86) (|LinearlyExplicitRingOver| 6)
                 (|PartialDifferentialRing| 7) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|Module| 51) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 63) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 51 51)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|LeftModule| 51)
                 (|RightModule| 51) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 63)
                 (|Comparable|) (|Evalable| $$) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6)
                 (|RetractableTo| 7) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 31)
                 (|ConvertibleTo| 47) (|ConvertibleTo| 48) (|ConvertibleTo| 46)
                 (|RetractableTo| 51) (|RetractableTo| 63)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 43
                                  '(1 0 9 0 10 3 0 0 0 7 0 12 0 0 0 15 2 0 0 0
                                    7 17 1 0 18 0 19 1 0 6 0 20 0 6 0 21 2 0 0
                                    0 6 22 2 0 0 0 0 23 1 0 0 7 24 2 0 0 0 0 25
                                    2 0 26 0 7 27 1 6 26 0 28 2 0 0 6 0 29 1 31
                                    30 0 32 2 9 0 0 0 33 0 34 0 35 0 31 0 36 3
                                    38 9 37 0 9 39 1 9 31 0 40 2 31 0 0 0 41 1
                                    0 42 42 43 1 0 9 0 10 3 0 0 0 7 0 13 2 0 26
                                    0 7 27 1 0 6 0 20 1 0 0 0 14 1 0 9 0 11 1 0
                                    18 0 19 1 19 42 42 43 3 0 0 0 7 0 12 2 0 0
                                    0 7 17 1 0 0 0 16 1 0 0 7 24 0 0 0 15 2 16
                                    0 0 6 22 2 0 0 0 0 25 2 0 0 6 0 29 2 0 0 0
                                    0 23)))))
           '|lookupIncomplete|)) 
