
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

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G130)
  (SPROG NIL
         (PROG (#2=#:G131)
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
          (LETT $ (GETREFV 47) . #1#)
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
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Union| $ '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Fraction| 39)
              (|Union| 36 '#1="failed") (|Union| 39 '#1#) (|Integer|)
              (|List| 6) (|Union| 6 '#1#) (|Boolean|) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 77 |zero?| 83 |symmetricSquare| 88 |symmetricProduct| 93
              |symmetricPower| 99 |subtractIfCan| 105 |sample| 111
              |right_ext_ext_GCD| 115 |rightRemainder| 121 |rightQuotient| 127
              |rightLcm| 133 |rightGcd| 139 |rightExtendedGcd| 145
              |rightExactQuotient| 151 |rightDivide| 157 |retractIfCan| 163
              |retract| 178 |reductum| 193 |recip| 198 |primitivePart| 203
              |opposite?| 208 |one?| 214 |monomial| 219 |monicRightDivide| 225
              |monicLeftDivide| 231 |minimumDegree| 237 |leftRemainder| 242
              |leftQuotient| 248 |leftLcm| 254 |leftGcd| 260 |leftExtendedGcd|
              266 |leftExactQuotient| 272 |leftDivide| 278 |leadingCoefficient|
              284 |latex| 289 |hashUpdate!| 294 |hash| 300 |exquo| 305 |elt|
              311 |directSum| 317 |degree| 323 |content| 328 |coerce| 333
              |coefficients| 353 |coefficient| 358 |characteristic| 364 |apply|
              368 |annihilate?| 375 |adjoint| 381 ^ 386 |Zero| 398 |One| 402 D
              406 = 410 - 416 + 427 * 433)
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
                 (|RetractableTo| 39))
              (|makeByteWordVec2| 46
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 42 0 0 1 1 0 42 0 1 1 6 0 0 1 2
                                    6 0 0 0 26 2 6 0 0 27 29 2 0 34 0 0 1 0 0 0
                                    1 2 6 33 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6
                                    0 0 0 1 2 6 0 0 0 1 2 6 32 0 0 1 2 6 34 0 0
                                    1 2 6 35 0 0 1 1 2 37 0 1 1 3 38 0 1 1 0 41
                                    0 1 1 2 36 0 1 1 3 39 0 1 1 0 6 0 1 1 0 0 0
                                    1 1 0 34 0 1 1 5 0 0 1 2 0 42 0 0 1 1 0 42
                                    0 1 2 0 0 6 27 1 2 4 35 0 0 1 2 4 35 0 0 1
                                    1 0 27 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0
                                    0 1 2 6 0 0 0 1 2 6 32 0 0 1 2 6 34 0 0 1 2
                                    6 35 0 0 1 1 0 6 0 1 1 0 44 0 1 2 0 46 46 0
                                    1 1 0 45 0 1 2 4 34 0 6 1 2 0 6 0 6 22 2 6
                                    0 0 0 31 1 0 27 0 1 1 5 6 0 1 1 2 0 36 1 1
                                    0 0 6 1 1 0 0 39 1 1 0 13 0 18 1 0 40 0 1 2
                                    0 6 0 27 1 0 0 27 1 3 0 6 0 6 6 21 2 0 42 0
                                    0 1 1 0 0 0 1 2 0 0 0 27 1 2 0 0 0 43 1 0 0
                                    0 19 0 0 0 8 0 0 0 1 2 0 42 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 6 0 1 2 0 0 0
                                    6 1 2 0 0 39 0 1 2 0 0 0 0 1 2 0 0 27 0 1 2
                                    0 0 43 0 1)))))
           '|lookupComplete|)) 
