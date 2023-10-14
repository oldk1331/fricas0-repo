
(SDEFUN |ORESUP;^;$Pi$;1| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 11))) 

(SDEFUN |ORESUP;^;$Nni$;2| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((ZEROP |n|) (|spadConstant| $ 13))
              ('T (SPADCALL |x| |n| (QREFELT $ 11))))) 

(SDEFUN |ORESUP;*;3$;3| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))) 

(SDEFUN |ORESUP;*;$R$;4| ((|x| $) (|r| R) ($ $))
        (SPADCALL |x| (SPADCALL |r| (|spadConstant| $ 13) (QREFELT $ 22))
                  (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 19))) 

(SDEFUN |ORESUP;apply;$3R;5| ((|p| $) (|c| R) (|r| R) ($ R))
        (SPADCALL |p| |c| |r| (QREFELT $ 7) (QREFELT $ 8) (QREFELT $ 24))) 

(SDEFUN |ORESUP;monicLeftDivide;2$R;6|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 27))) 

(SDEFUN |ORESUP;monicRightDivide;2$R;7|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 30))) 

(SDEFUN |ORESUP;leftDivide;2$R;8|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 32))) 

(SDEFUN |ORESUP;rightDivide;2$R;9|
        ((|a| $) (|b| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPADCALL |a| |b| (QREFELT $ 7) (QREFELT $ 34))) 

(DECLAIM (NOTINLINE |SparseUnivariateSkewPolynomial;|)) 

(DEFUN |SparseUnivariateSkewPolynomial| (&REST #1=#:G136)
  (SPROG NIL
         (PROG (#2=#:G137)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseUnivariateSkewPolynomial;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|SparseUnivariateSkewPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|SparseUnivariateSkewPolynomial| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 49) . #1#)
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
          (|haddProp| |$ConstructorCache| '|SparseUnivariateSkewPolynomial|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 29
                       (CONS
                        (|dispatchFunction| |ORESUP;monicLeftDivide;2$R;6|) $))
             (QSETREFV $ 31
                       (CONS
                        (|dispatchFunction| |ORESUP;monicRightDivide;2$R;7|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 33
                       (CONS (|dispatchFunction| |ORESUP;leftDivide;2$R;8|) $))
             (QSETREFV $ 35
                       (CONS (|dispatchFunction| |ORESUP;rightDivide;2$R;9|)
                             $)))))
          $))) 

(MAKEPROP '|SparseUnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|PositiveInteger|)
              (|RepeatedSquaring| $$) (0 . |expt|) |ORESUP;^;$Pi$;1|
              (6 . |One|) (|NonNegativeInteger|) |ORESUP;^;$Nni$;2|
              (|Automorphism| 6) (|Mapping| 6 6)
              (|UnivariateSkewPolynomialCategoryOps| 6 $$) (10 . |times|)
              |ORESUP;*;3$;3| (18 . |One|) (22 . *) |ORESUP;*;$R$;4|
              (28 . |apply|) |ORESUP;apply;$3R;5|
              (|Record| (|:| |quotient| $$) (|:| |remainder| $$))
              (37 . |monicLeftDivide|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (44 . |monicLeftDivide|) (50 . |monicRightDivide|)
              (57 . |monicRightDivide|) (63 . |leftDivide|) (70 . |leftDivide|)
              (76 . |rightDivide|) (83 . |rightDivide|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| $ '"failed") (|Fraction| 40) (|Union| 38 '#1="failed")
              (|Integer|) (|Union| 40 '#1#) (|OutputForm|) (|List| 6)
              (|Union| 6 '#1#) (|Boolean|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 89 |zero?| 95 |subtractIfCan| 100 |sample| 106
              |rightRemainder| 110 |rightQuotient| 116 |rightLcm| 122
              |rightGcd| 128 |rightExtendedGcd| 134 |rightExactQuotient| 140
              |rightDivide| 146 |retractIfCan| 152 |retract| 167 |reductum| 182
              |recip| 187 |primitivePart| 192 |outputForm| 197 |opposite?| 203
              |one?| 209 |monomial| 214 |monicRightDivide| 220
              |monicLeftDivide| 226 |minimumDegree| 232 |leftRemainder| 237
              |leftQuotient| 243 |leftLcm| 249 |leftGcd| 255 |leftExtendedGcd|
              261 |leftExactQuotient| 267 |leftDivide| 273 |leadingCoefficient|
              279 |latex| 284 |hashUpdate!| 289 |hash| 295 |exquo| 300 |degree|
              306 |content| 311 |coerce| 316 |coefficients| 336 |coefficient|
              341 |characteristic| 347 |apply| 351 |annihilate?| 358 ^ 364
              |Zero| 376 |One| 380 = 384 - 390 + 401 * 407)
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
              '#((|UnivariateSkewPolynomialCategory| 6) (|Algebra| 6)
                 (|Module| 6) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 42) (|RetractableTo| 38) (|RetractableTo| 40))
              (|makeByteWordVec2| 48
                                  '(2 10 2 2 9 11 0 0 0 13 4 18 2 2 2 16 17 19
                                    0 16 0 21 2 0 0 6 0 22 5 18 6 2 6 6 16 17
                                    24 3 18 26 2 2 16 27 2 0 28 0 0 29 3 18 26
                                    2 2 16 30 2 0 28 0 0 31 3 18 26 2 2 16 32 2
                                    0 28 0 0 33 3 18 26 2 2 16 34 2 0 28 0 0 35
                                    2 0 45 0 0 1 1 0 45 0 1 2 0 37 0 0 1 0 0 0
                                    1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6 0
                                    0 0 1 2 6 36 0 0 1 2 6 37 0 0 1 2 6 28 0 0
                                    35 1 2 39 0 1 1 3 41 0 1 1 0 44 0 1 1 2 38
                                    0 1 1 3 40 0 1 1 0 6 0 1 1 0 0 0 1 1 0 37 0
                                    1 1 5 0 0 1 2 0 42 0 42 1 2 0 45 0 0 1 1 0
                                    45 0 1 2 0 0 6 14 1 2 4 28 0 0 31 2 4 28 0
                                    0 29 1 0 14 0 1 2 6 0 0 0 1 2 6 0 0 0 1 2 6
                                    0 0 0 1 2 6 0 0 0 1 2 6 36 0 0 1 2 6 37 0 0
                                    1 2 6 28 0 0 33 1 0 6 0 1 1 0 47 0 1 2 0 46
                                    46 0 1 1 0 48 0 1 2 4 37 0 6 1 1 0 14 0 1 1
                                    5 6 0 1 1 2 0 38 1 1 0 0 6 1 1 0 0 40 1 1 0
                                    42 0 1 1 0 43 0 1 2 0 6 0 14 1 0 0 14 1 3 0
                                    6 0 6 6 25 2 0 45 0 0 1 2 0 0 0 14 15 2 0 0
                                    0 9 12 0 0 0 1 0 0 0 13 2 0 45 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 6 23 2
                                    0 0 6 0 22 2 0 0 40 0 1 2 0 0 0 0 20 2 0 0
                                    14 0 1 2 0 0 9 0 1)))))
           '|lookupComplete|)) 
