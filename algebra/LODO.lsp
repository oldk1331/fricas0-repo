
(/VERSIONCHECK 2) 

(DEFUN |LODO;coerce;$Of;1| (|l| $) (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 17))) 

(DEFUN |LODO;elt;$2A;2| (|p| |a| $)
  (SPADCALL |p| (|spadConstant| $ 20) |a| (QREFELT $ 21))) 

(DEFUN |LODO;symmetricProduct;3$;3| (|a| |b| $)
  (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 25))) 

(DEFUN |LODO;symmetricPower;$Nni$;4| (|a| |n| $)
  (SPADCALL |a| |n| (QREFELT $ 7) (QREFELT $ 28))) 

(DEFUN |LODO;directSum;3$;5| (|a| |b| $)
  (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G128)
  (PROG ()
    (RETURN
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
                    '|LinearOrdinaryDifferentialOperator|))))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|LinearOrdinaryDifferentialOperator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2) . #1#)
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
                                          (|HasCategory| |#1| '(|GcdDomain|))
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12
                (|SparseUnivariateSkewPolynomial| |#1| (|spadConstant| $ 11)
                                                  |#2|))
      (QSETREFV $ 16 (SPADCALL 'D (QREFELT $ 15)))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |LODO;symmetricProduct;3$;3|) $))
         (QSETREFV $ 29
                   (CONS (|dispatchFunction| |LODO;symmetricPower;$Nni$;4|) $))
         (QSETREFV $ 31 (CONS (|dispatchFunction| |LODO;directSum;3$;5|) $)))))
      $)))) 

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
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Fraction| 37)
              (|Union| 35 '#1="failed") (|Integer|) (|Union| 37 '#1#)
              (|List| 6) (|Union| 6 '#1#) (|Boolean|) (|PositiveInteger|)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 77 |zero?| 83 |symmetricSquare| 88 |symmetricProduct| 93
              |symmetricPower| 99 |subtractIfCan| 105 |sample| 111
              |rightRemainder| 115 |rightQuotient| 121 |rightLcm| 127
              |rightGcd| 133 |rightExtendedGcd| 139 |rightExactQuotient| 145
              |rightDivide| 151 |retractIfCan| 157 |retract| 172 |reductum| 187
              |recip| 192 |primitivePart| 197 |one?| 202 |monomial| 207
              |monicRightDivide| 213 |monicLeftDivide| 219 |minimumDegree| 225
              |leftRemainder| 230 |leftQuotient| 236 |leftLcm| 242 |leftGcd|
              248 |leftExtendedGcd| 254 |leftExactQuotient| 260 |leftDivide|
              266 |leadingCoefficient| 272 |latex| 277 |hashUpdate!| 282 |hash|
              288 |exquo| 293 |elt| 299 |directSum| 305 |degree| 311 |content|
              316 |coerce| 321 |coefficients| 341 |coefficient| 346
              |characteristic| 352 |apply| 356 |adjoint| 363 ^ 368 |Zero| 380
              |One| 384 D 388 = 392 - 398 + 409 * 415)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 2 3))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&| |Algebra&| |Module&|
                |Ring&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
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
                 (|BasicType|) (|CoercibleTo| 13) (|RetractableTo| 35)
                 (|RetractableTo| 37))
              (|makeByteWordVec2| 45
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 41 0 0 1 1 0 41 0 1 1 6 0 0 1 2
                                    6 0 0 0 26 2 6 0 0 27 29 2 0 33 0 0 1 0 0 0
                                    1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0
                                    0 0 1 2 6 32 0 0 1 2 6 33 0 0 1 2 6 34 0 0
                                    1 1 2 36 0 1 1 3 38 0 1 1 0 40 0 1 1 2 35 0
                                    1 1 3 37 0 1 1 0 6 0 1 1 0 0 0 1 1 0 33 0 1
                                    1 5 0 0 1 1 0 41 0 1 2 0 0 6 27 1 2 4 34 0
                                    0 1 2 4 34 0 0 1 1 0 27 0 1 2 6 0 0 0 1 2 6
                                    0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 32 0 0
                                    1 2 6 33 0 0 1 2 6 34 0 0 1 1 0 6 0 1 1 0
                                    43 0 1 2 0 45 45 0 1 1 0 44 0 1 2 4 33 0 6
                                    1 2 0 6 0 6 22 2 6 0 0 0 31 1 0 27 0 1 1 5
                                    6 0 1 1 2 0 35 1 1 0 0 6 1 1 0 0 37 1 1 0
                                    13 0 18 1 0 39 0 1 2 0 6 0 27 1 0 0 27 1 3
                                    0 6 0 6 6 21 1 0 0 0 1 2 0 0 0 27 1 2 0 0 0
                                    42 1 0 0 0 19 0 0 0 8 0 0 0 1 2 0 41 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 6
                                    1 2 0 0 6 0 1 2 0 0 37 0 1 2 0 0 0 0 1 2 0
                                    0 27 0 1 2 0 0 42 0 1)))))
           '|lookupComplete|)) 
