
(/VERSIONCHECK 2) 

(DEFUN |PDO;adjoint;2$;1| (|x| $)
  (PROG (|xu| |res| |sign| |d| |v| #1=#:G134)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
            ('T
             (SEQ
              (LETT |v|
                    (PROG2
                        (LETT #1# (SPADCALL |x| (QREFELT $ 17))
                              . #2=(|PDO;adjoint;2$;1|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                    . #2#)
              (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 20)) . #2#)
              (LETT |res| (|spadConstant| $ 21) . #2#)
              (LETT |xu| (SPADCALL (ELT $ 22) |xu| (QREFELT $ 24)) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |xu| (|spadConstant| $ 26) (QREFELT $ 27)))
                     (GO G191)))
                   (SEQ (LETT |d| (SPADCALL |xu| (QREFELT $ 29)) . #2#)
                        (LETT |sign|
                              (COND
                               ((ODDP |d|)
                                (SPADCALL (|spadConstant| $ 30)
                                          (QREFELT $ 32)))
                               ('T (|spadConstant| $ 30)))
                              . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |sign|
                                                   (SPADCALL
                                                    (|spadConstant| $ 30) |v|
                                                    |d| (QREFELT $ 33))
                                                   (QREFELT $ 34))
                                         (SPADCALL |xu| (QREFELT $ 35))
                                         (QREFELT $ 34))
                                        (QREFELT $ 36))
                              . #2#)
                        (EXIT
                         (LETT |xu| (SPADCALL |xu| (QREFELT $ 37)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G159)
  (PROG ()
    (RETURN
     (PROG (#2=#:G160)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PartialDifferentialOperator|)
                                           '|domainEqualList|)
                . #3=(|PartialDifferentialOperator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PartialDifferentialOperator;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|PartialDifferentialOperator|))))))))))) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialDifferentialOperator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 62) . #1#)
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
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
                                          (|HasCategory| |#1| '(|LeftOreRing|))
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
                                          (|HasCategory| |#1| '(|GcdDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 16384))
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 32768))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 13 (|SparseUnivariatePolynomial| $))
      $)))) 

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT $ 10))
                                                  (NRTEVAL (ELT $ 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |Zero|) |PDO;adjoint;2$;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |Zero|) (40 . |Zero|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |One|) (59 . |One|) (63 . -)
              (68 . |monomial|) (75 . *) (81 . |leadingCoefficient|) (86 . +)
              (92 . |reductum|) (|Fraction| 47) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |mat| 44) (|:| |vec| (|Vector| 47))) (|Matrix| $)
              (|Vector| $) (|Matrix| 47) (|Union| 38 '#1="failed")
              (|Union| 47 '#1#) (|Integer|) (|List| 7) (|List| $) (|List| 28)
              (|Record| (|:| |mat| 52) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|IndexedExponents| 7) (|Mapping| 53 53) (|List| 6)
              (|Union| 6 '#1#) (|PositiveInteger|) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 113
              |unitCanonical| 118 |unit?| 123 |totalDegreeSorted| 128
              |totalDegree| 134 |subtractIfCan| 145 |smaller?| 151 |sample| 157
              |retractIfCan| 161 |retract| 176 |reductum| 191 |reducedSystem|
              196 |recip| 218 |primitivePart| 223 |primitiveMonomials| 228
              |pomopo!| 233 |one?| 241 |numberOfMonomials| 246 |monomials| 251
              |monomial?| 256 |monomial| 261 |minimumDegree| 281 |mapExponents|
              286 |map| 292 |mainVariable| 298 |leadingMonomial| 303
              |leadingCoefficient| 308 |latex| 313 |hashUpdate!| 318 |hash| 324
              |ground?| 329 |ground| 334 |exquo| 339 |degree| 351 |content| 368
              |coerce| 373 |coefficients| 398 |coefficient| 403 |charthRoot|
              423 |characteristic| 428 |binomThmExpt| 432 |associates?| 439
              |adjoint| 445 ^ 450 |Zero| 462 |One| 466 D 470 = 475 / 481 - 487
              + 498 * 504)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 2 0 1 2 3 0 1 3 2 4 5 3 2 10 11 0 0 1
                                  3 0 0 0 0 1 1 3 0 0 0 0 0 0 0 0 9 0 0 0 0 0 0
                                  3 2 6 7 8))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| NIL |Module&| NIL |Module&|
                NIL NIL |Module&| |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |Monoid&| NIL
                |AbelianMonoid&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| 38) (|Algebra| $$) (|Algebra| 6)
                 (|LinearlyExplicitRingOver| 6) (|Module| 38)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 47)
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 38 38)
                 (|BiModule| $$ $$) (|LeftModule| $$) (|Rng|) (|LeftModule| 6)
                 (|RightModule| 6) (|LeftModule| 38) (|RightModule| 38)
                 (|RightModule| $$) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|AbelianMonoid|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|unitsKnown|) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 61) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 38) (|RetractableTo| 47)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 61
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 0 14 0 1 1 0 48
                                    0 1 1 2 40 0 1 1 2 0 0 1 1 2 14 0 1 2 0 28
                                    0 48 1 2 0 28 0 48 1 1 0 28 0 1 2 0 39 0 0
                                    1 2 9 14 0 0 1 0 0 0 1 1 6 45 0 1 1 7 46 0
                                    1 1 0 56 0 1 1 6 38 0 1 1 7 47 0 1 1 0 6 0
                                    1 1 0 0 0 1 2 10 41 42 43 1 1 10 44 42 1 2
                                    0 51 42 43 1 1 0 52 42 1 1 0 39 0 1 1 14 0
                                    0 1 1 0 49 0 1 4 0 0 0 6 53 0 1 1 0 14 0 1
                                    1 0 28 0 1 1 0 49 0 1 1 0 14 0 1 3 0 0 0 7
                                    28 33 3 0 0 0 48 50 1 2 0 0 6 53 1 1 0 53 0
                                    1 2 0 0 54 0 1 2 0 0 11 0 1 1 0 16 0 17 1 0
                                    0 0 1 1 0 6 0 1 1 0 58 0 1 2 0 60 60 0 1 1
                                    0 59 0 1 1 0 14 0 15 1 0 6 0 1 2 2 39 0 0 1
                                    2 2 39 0 6 1 2 0 50 0 48 1 2 0 28 0 7 1 1 0
                                    53 0 1 1 14 6 0 1 1 15 0 0 1 1 13 0 38 1 1
                                    0 0 47 1 1 0 0 6 1 1 0 61 0 1 1 0 55 0 1 3
                                    0 0 0 48 50 1 3 0 0 0 7 28 1 2 0 6 0 53 1 1
                                    4 39 0 1 0 0 28 1 3 16 0 0 0 28 1 2 2 14 0
                                    0 1 1 0 0 0 22 2 0 0 0 28 1 2 0 0 0 57 1 0
                                    0 0 21 0 0 0 30 1 0 0 7 1 2 0 14 0 0 1 2 12
                                    0 0 6 1 1 0 0 0 32 2 0 0 0 0 1 2 0 0 0 0 36
                                    2 1 0 38 0 1 2 1 0 0 38 1 2 0 0 28 0 1 2 0
                                    0 47 0 1 2 0 0 6 0 1 2 0 0 0 0 34 2 0 0 0 6
                                    1 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
