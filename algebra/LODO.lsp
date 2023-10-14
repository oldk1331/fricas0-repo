
(SDEFUN |LODO;coerce;$Of;1| ((|l| $) ($ |OutputForm|))
        (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 17))) 

(SDEFUN |LODO;elt;$2A;2| ((|p| $) (|a| A) ($ A))
        (SPADCALL |p| (|spadConstant| $ 20) |a| (QREFELT $ 21))) 

(SDEFUN |LODO;symmetricProduct;3$;3| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 25))) 

(SDEFUN |LODO;symmetricPower;$Nni$;4|
        ((|a| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |a| |n| (QREFELT $ 7) (QREFELT $ 28))) 

(SDEFUN |LODO;directSum;3$;5| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G128)
  (SPROG NIL
         (PROG (#2=#:G129)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperator|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |LinearOrdinaryDifferentialOperator;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperator|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              (|HasCategory| |#1| '(|Field|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12
                    (|SparseUnivariateSkewPolynomial| |#1|
                                                      (|spadConstant| $ 11)
                                                      |#2|))
          (QSETREFV $ 16 (SPADCALL 'D (QREFELT $ 15)))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 26
                       (CONS (|dispatchFunction| |LODO;symmetricProduct;3$;3|)
                             $))
             (QSETREFV $ 29
                       (CONS (|dispatchFunction| |LODO;symmetricPower;$Nni$;4|)
                             $))
             (QSETREFV $ 31
                       (CONS (|dispatchFunction| |LODO;directSum;3$;5|) $)))))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 6
                                                (NRTEVAL (|spadConstant| $ 11))
                                                7)
              (|local| |#1|) (|local| |#2|) (0 . |One|) (4 . |One|)
              (|Automorphism| 6) (8 . |One|) '|Rep| (|OutputForm|) (|Symbol|)
              (12 . |coerce|) '|outputD| (17 . |outputForm|)
              |LODO;coerce;$Of;1| (23 . |Zero|) (27 . |Zero|) (31 . |apply|)
              |LODO;elt;$2A;2| (|Mapping| 6 6)
              (|LinearOrdinaryDifferentialOperatorsOps| 6 $$)
              (38 . |symmetricProduct|) (45 . |symmetricProduct|)
              (|NonNegativeInteger|) (51 . |symmetricPower|)
              (58 . |symmetricPower|) (64 . |directSum|) (71 . |directSum|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| $ '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 36 '#1="failed") (|Fraction| 38) (|Union| 38 '#1#)
              (|Integer|) (|List| 6) (|Union| 6 '#1#) (|Boolean|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 77 |zero?| 83 |symmetricSquare| 88 |symmetricProduct| 93
              |symmetricPower| 99 |subtractIfCan| 105 |sample| 111
              |rightRemainder| 115 |rightQuotient| 121 |rightLcm| 127
              |rightGcd| 133 |rightExtendedGcd| 139 |rightExactQuotient| 145
              |rightDivide| 151 |retractIfCan| 157 |retract| 172 |reductum| 187
              |recip| 192 |primitivePart| 197 |opposite?| 202 |one?| 208
              |monomial| 213 |monicRightDivide| 219 |monicLeftDivide| 225
              |minimumDegree| 231 |leftRemainder| 236 |leftQuotient| 242
              |leftLcm| 248 |leftGcd| 254 |leftExtendedGcd| 260
              |leftExactQuotient| 266 |leftDivide| 272 |leadingCoefficient| 278
              |latex| 283 |hashUpdate!| 288 |hash| 294 |exquo| 299 |elt| 305
              |directSum| 311 |degree| 317 |content| 322 |coerce| 327
              |coefficients| 347 |coefficient| 352 |characteristic| 358 |apply|
              362 |annihilate?| 369 |adjoint| 375 ^ 380 |Zero| 392 |One| 396 D
              400 = 404 - 410 + 421 * 427)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 2 3))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&| |Algebra&| |Module&|
                |Ring&| NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&| NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6) (|Algebra| 6)
                 (|Module| 6) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|Eltable| 6 6) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 13) (|RetractableTo| 36)
                 (|RetractableTo| 38))
              (|makeByteWordVec2| 45
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 41 0 0 1 1 0 41 0 1 1 6 0 0 1 2
                                    6 0 0 0 26 2 6 0 0 27 29 2 0 33 0 0 1 0 0 0
                                    1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0
                                    0 0 1 2 6 32 0 0 1 2 6 33 0 0 1 2 6 34 0 0
                                    1 1 2 35 0 1 1 3 37 0 1 1 0 40 0 1 1 2 36 0
                                    1 1 3 38 0 1 1 0 6 0 1 1 0 0 0 1 1 0 33 0 1
                                    1 5 0 0 1 2 0 41 0 0 1 1 0 41 0 1 2 0 0 6
                                    27 1 2 4 34 0 0 1 2 4 34 0 0 1 1 0 27 0 1 2
                                    6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0
                                    1 2 6 32 0 0 1 2 6 33 0 0 1 2 6 34 0 0 1 1
                                    0 6 0 1 1 0 43 0 1 2 0 45 45 0 1 1 0 44 0 1
                                    2 4 33 0 6 1 2 0 6 0 6 22 2 6 0 0 0 31 1 0
                                    27 0 1 1 5 6 0 1 1 2 0 36 1 1 0 0 6 1 1 0 0
                                    38 1 1 0 13 0 18 1 0 39 0 1 2 0 6 0 27 1 0
                                    0 27 1 3 0 6 0 6 6 21 2 0 41 0 0 1 1 0 0 0
                                    1 2 0 0 0 27 1 2 0 0 0 42 1 0 0 0 19 0 0 0
                                    8 0 0 0 1 2 0 41 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0
                                    38 0 1 2 0 0 0 0 1 2 0 0 27 0 1 2 0 0 42 0
                                    1)))))
           '|lookupComplete|)) 
