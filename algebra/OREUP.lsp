
(SDEFUN |OREUP;coerce;V$;1| ((|v| |Variable| |x|) ($ $))
        (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 16))) 

(SDEFUN |OREUP;coerce;$Of;2| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 21)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G124)
  (SPROG NIL
         (PROG (#2=#:G125)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateSkewPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateSkewPolynomial|)))))))))) 

(DEFUN |UnivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|UnivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 39) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (|HasCategory| |#2| '(|Field|))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|UnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|SparseUnivariateSkewPolynomial| |#2| |#3| |#4|))
    $))) 

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariateSkewPolynomial| 7 8 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |One|) (4 . |One|) (8 . |One|)
              (|NonNegativeInteger|) (12 . |monomial|) (|Variable| 6)
              |OREUP;coerce;V$;1| (|Symbol|) (|OutputForm|) (18 . |outputForm|)
              (23 . |outputForm|) |OREUP;coerce;$Of;2|
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (|Union| $ '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 29 '#1="failed") (|Fraction| 31) (|Union| 31 '#1#)
              (|Integer|) (|List| 7) (|Union| 7 '#1#) (|Boolean|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 29 |zero?| 35 |subtractIfCan| 40 |sample| 46
              |right_ext_ext_GCD| 50 |rightRemainder| 56 |rightQuotient| 62
              |rightLcm| 68 |rightGcd| 74 |rightExtendedGcd| 80
              |rightExactQuotient| 86 |rightDivide| 92 |retractIfCan| 98
              |retract| 113 |reductum| 128 |recip| 133 |primitivePart| 138
              |opposite?| 143 |one?| 149 |monomial| 154 |monicRightDivide| 160
              |monicLeftDivide| 166 |minimumDegree| 172 |leftRemainder| 177
              |leftQuotient| 183 |leftLcm| 189 |leftGcd| 195 |leftExtendedGcd|
              201 |leftExactQuotient| 207 |leftDivide| 213 |leadingCoefficient|
              219 |latex| 224 |hashUpdate!| 229 |hash| 235 |exquo| 240 |degree|
              246 |content| 251 |coerce| 256 |coefficients| 281 |coefficient|
              286 |characteristic| 292 |apply| 296 |annihilate?| 303 ^ 309
              |Zero| 321 |One| 325 = 329 - 335 + 346 * 352)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  2 3))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&| |Algebra&| |Module&|
                |Ring&| NIL |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&| NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 7) (|Algebra| 7)
                 (|Module| 7) (|Ring|) (|BiModule| 7 7) (|Rng|)
                 (|LeftModule| 7) (|RightModule| 7) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 7) (|SetCategory|)
                 (|RetractableTo| 7) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 20) (|RetractableTo| 29) (|RetractableTo| 31))
              (|makeByteWordVec2| 38
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 34 0 0 1 1 0
                                    34 0 1 2 0 26 0 0 1 0 0 0 1 2 6 25 0 0 1 2
                                    6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0
                                    1 2 6 24 0 0 1 2 6 26 0 0 1 2 6 27 0 0 1 1
                                    2 28 0 1 1 3 30 0 1 1 0 33 0 1 1 2 29 0 1 1
                                    3 31 0 1 1 0 7 0 1 1 0 0 0 1 1 0 26 0 1 1 5
                                    0 0 1 2 0 34 0 0 1 1 0 34 0 1 2 0 0 7 15 16
                                    2 4 27 0 0 1 2 4 27 0 0 1 1 0 15 0 1 2 6 0
                                    0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2
                                    6 24 0 0 1 2 6 26 0 0 1 2 6 27 0 0 1 1 0 7
                                    0 1 1 0 36 0 1 2 0 38 38 0 1 1 0 37 0 1 2 4
                                    26 0 7 1 1 0 15 0 1 1 5 7 0 1 1 2 0 29 1 1
                                    0 0 17 18 1 0 0 7 1 1 0 0 31 1 1 0 20 0 23
                                    1 0 32 0 1 2 0 7 0 15 1 0 0 15 1 3 0 7 0 7
                                    7 1 2 0 34 0 0 1 2 0 0 0 15 1 2 0 0 0 35 1
                                    0 0 0 1 0 0 0 13 2 0 34 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 7 0 1 2 0 0 0 7 1
                                    2 0 0 0 0 1 2 0 0 31 0 1 2 0 0 15 0 1 2 0 0
                                    35 0 1)))))
           '|lookupComplete|)) 
