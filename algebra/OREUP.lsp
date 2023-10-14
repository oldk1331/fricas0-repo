
(/VERSIONCHECK 2) 

(DEFUN |OREUP;coerce;V$;1| (|v| $)
  (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 16))) 

(DEFUN |OREUP;coerce;$Of;2| (|p| $)
  (SPADCALL |p| (SPADCALL (QREFELT $ 6) (QREFELT $ 21)) (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G122)
  (PROG ()
    (RETURN
     (PROG (#2=#:G123)
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
              (HREM |$ConstructorCache| '|UnivariateSkewPolynomial|))))))))))) 

(DEFUN |UnivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariateSkewPolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|UnivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 38) . #1#)
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
      $)))) 

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariateSkewPolynomial| 7 8 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |One|) (4 . |One|) (8 . |One|)
              (|NonNegativeInteger|) (12 . |monomial|) (|Variable| 6)
              |OREUP;coerce;V$;1| (|Symbol|) (|OutputForm|) (18 . |outputForm|)
              (23 . |outputForm|) |OREUP;coerce;$Of;2|
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| $ '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Fraction| 29)
              (|Union| 27 '#1="failed") (|Integer|) (|Union| 29 '#1#)
              (|List| 7) (|Union| 7 '#1#) (|Boolean|) (|PositiveInteger|)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 29 |zero?| 35 |subtractIfCan| 40 |sample| 46 |rightRemainder|
              50 |rightQuotient| 56 |rightLcm| 62 |rightGcd| 68
              |rightExtendedGcd| 74 |rightExactQuotient| 80 |rightDivide| 86
              |retractIfCan| 92 |retract| 107 |reductum| 122 |recip| 127
              |primitivePart| 132 |one?| 137 |monomial| 142 |monicRightDivide|
              148 |monicLeftDivide| 154 |minimumDegree| 160 |leftRemainder| 165
              |leftQuotient| 171 |leftLcm| 177 |leftGcd| 183 |leftExtendedGcd|
              189 |leftExactQuotient| 195 |leftDivide| 201 |leadingCoefficient|
              207 |latex| 212 |hashUpdate!| 217 |hash| 223 |exquo| 228 |degree|
              234 |content| 239 |coerce| 244 |coefficients| 269 |coefficient|
              274 |characteristic| 280 |apply| 284 ^ 291 |Zero| 303 |One| 307 =
              311 - 317 + 328 * 334)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  2 3))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&| |Algebra&| |Module&|
                |Ring&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
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
                 (|CoercibleTo| 20) (|RetractableTo| 27) (|RetractableTo| 29))
              (|makeByteWordVec2| 37
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 33 0 0 1 1 0
                                    33 0 1 2 0 25 0 0 1 0 0 0 1 2 6 0 0 0 1 2 6
                                    0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 24 0 0
                                    1 2 6 25 0 0 1 2 6 26 0 0 1 1 2 28 0 1 1 3
                                    30 0 1 1 0 32 0 1 1 2 27 0 1 1 3 29 0 1 1 0
                                    7 0 1 1 0 0 0 1 1 0 25 0 1 1 5 0 0 1 1 0 33
                                    0 1 2 0 0 7 15 16 2 4 26 0 0 1 2 4 26 0 0 1
                                    1 0 15 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0
                                    0 1 2 6 0 0 0 1 2 6 24 0 0 1 2 6 25 0 0 1 2
                                    6 26 0 0 1 1 0 7 0 1 1 0 36 0 1 2 0 35 35 0
                                    1 1 0 37 0 1 2 4 25 0 7 1 1 0 15 0 1 1 5 7
                                    0 1 1 2 0 27 1 1 0 0 17 18 1 0 0 7 1 1 0 0
                                    29 1 1 0 20 0 23 1 0 31 0 1 2 0 7 0 15 1 0
                                    0 15 1 3 0 7 0 7 7 1 2 0 0 0 15 1 2 0 0 0
                                    34 1 0 0 0 1 0 0 0 13 2 0 33 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 7 1 2 0 0
                                    7 0 1 2 0 0 0 0 1 2 0 0 29 0 1 2 0 0 15 0 1
                                    2 0 0 34 0 1)))))
           '|lookupComplete|)) 
