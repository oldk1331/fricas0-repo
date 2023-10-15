
(SDEFUN |AN;zero?;$B;1| ((|a| $) ($ |Boolean|))
        (SPADCALL |a| (|spadConstant| $ 7) (QREFELT $ 10))) 

(SDEFUN |AN;one?;$B;2| ((|a| $) ($ |Boolean|))
        (SPADCALL |a| (|spadConstant| $ 12) (QREFELT $ 10))) 

(SDEFUN |AN;=;2$B;3| ((|a| $) (|b| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |a| |b| (QREFELT $ 15)) (|spadConstant| $ 7)
                  (QREFELT $ 10))) 

(SDEFUN |AN;convert;$If;4| ((|x| $) ($ |InputForm|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |AlgebraicNumber;|)) 

(DEFUN |AlgebraicNumber| ()
  (SPROG NIL
         (PROG (#1=#:G145)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|AlgebraicNumber|)
                    . #2=(|AlgebraicNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|AlgebraicNumber|
                             (LIST (CONS NIL (CONS 1 (|AlgebraicNumber;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|AlgebraicNumber|)))))))))) 

(DEFUN |AlgebraicNumber;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|AlgebraicNumber|) . #1=(|AlgebraicNumber|))
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AlgebraicNumber| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 1))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 2))
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 4))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|InnerAlgebraicNumber|))
          $))) 

(MAKEPROP '|AlgebraicNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerAlgebraicNumber|) '|Rep| (0 . |Zero|)
              (4 . |Zero|) (|Boolean|) (8 . |trueEqual|) |AN;zero?;$B;1|
              (14 . |One|) (18 . |One|) |AN;one?;$B;2| (22 . -) |AN;=;2$B;3|
              (|InputForm|) (28 . |convert|) (|InputFormFunctions1| $$)
              (33 . |coerceToType|) |AN;convert;$If;4| (|Union| $ '#1="failed")
              (|Union| 35 '#1#) (|Matrix| $) (|SparseUnivariatePolynomial| $)
              (|Kernel| $) (|List| 26) (|SparseMultivariatePolynomial| 44 26)
              (|NonNegativeInteger|) (|Factored| 25) (|Complex| 39)
              (|Union| 33 '#1#) (|List| 25)
              (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 40))) (|Vector| $)
              (|Matrix| 40) (|DoubleFloat|) (|Matrix| 44) (|Float|)
              (|Fraction| 44)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 44)))
              (|Union| 40 '#2="failed") (|Union| 44 '#2#) (|Integer|)
              (|PositiveInteger|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 48) (|:| |generator| $))
              (|Union| 48 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 53 '"failed")
              (|Factored| $) (|Polynomial| $) (|Symbol|) (|BasicOperator|)
              (|Mapping| $ $) (|Mapping| $ 48) (|List| 58) (|List| 59)
              (|List| 60) (|List| 57) (|Union| 26 '"failed") (|List| 67)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 38 |zerosOf| 44 |zeroOf| 60 |zero?| 76 |unitNormal| 81
              |unitCanonical| 86 |unit?| 91 |tower| 96 |subtractIfCan| 106
              |subst| 112 |squareFreePolynomial| 131 |squareFreePart| 136
              |squareFree| 141 |sqrt| 146 |solveLinearPolynomialEquation| 151
              |smaller?| 157 |sizeLess?| 163 |sample| 169 |rootsOf| 173
              |rootOf| 189 |retractIfCan| 205 |retract| 220 |rem| 235
              |reducedSystem| 241 |reduce| 263 |recip| 268 |quo| 273
              |principalIdeal| 279 |prime?| 284 |paren| 289 |opposite?| 299
              |operators| 305 |operator| 310 |one?| 315 |odd?| 320 |numer| 325
              |nthRoot| 330 |norm| 336 |multiEuclidean| 360 |minPoly| 366 |map|
              371 |mainKernel| 377 |lcmCoef| 382 |lcm| 388 |latex| 399
              |kernels| 404 |kernel| 414 |is?| 426 |inv| 438 |height| 443
              |hashUpdate!| 448 |hash| 454 |gcdPolynomial| 459 |gcd| 465
              |freeOf?| 476 |factorSquareFreePolynomial| 488 |factorPolynomial|
              493 |factor| 498 |extendedEuclidean| 503 |exquo| 516
              |expressIdealMember| 522 |even?| 528 |eval| 533 |euclideanSize|
              629 |elt| 634 |divide| 730 |distribute| 736 |differentiate| 747
              |denom| 758 |definingPolynomial| 763 |convert| 768 |conditionP|
              788 |coerce| 793 |charthRoot| 823 |characteristic| 828 |box| 832
              |belong?| 842 |associates?| 847 |annihilate?| 853 ^ 859 |Zero|
              883 |One| 887 D 891 = 902 / 908 - 914 + 925 * 931)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |DifferentialRing&| NIL NIL NIL
                |Module&| |EntireRing&| |Module&| NIL NIL NIL |Ring&| NIL NIL
                NIL NIL |Rng&| |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| NIL |SetCategory&| |Evalable&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| |RadicalCategory&| NIL
                NIL NIL NIL NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 40) (|LeftOreRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 40)
                 (|LinearlyExplicitRingOver| 44) (|Module| 40) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|BiModule| 40 40)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 40)
                 (|LeftModule| 40) (|LeftModule| $$) (|RightModule| $$) (|Rng|)
                 (|AbelianGroup|) (|SemiRing|) (|CancellationAbelianMonoid|)
                 (|ExpressionSpace|) (|Monoid|) (|SemiRng|) (|AbelianMonoid|)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|Evalable| $$)
                 (|ConvertibleTo| 17) (|ConvertibleTo| 31) (|ConvertibleTo| 39)
                 (|ConvertibleTo| 37) (|RetractableTo| 40) (|RetractableTo| 44)
                 (|RadicalCategory|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 71))
              (|makeByteWordVec2| 71
                                  '(0 0 0 7 0 6 0 8 2 6 9 0 0 10 0 0 0 12 0 6 0
                                    13 2 0 0 0 0 15 1 6 17 0 18 1 19 17 17 20 2
                                    0 9 0 0 1 1 0 48 56 1 2 0 48 25 57 1 1 0 48
                                    25 1 1 0 0 56 1 1 0 0 25 1 2 0 0 25 57 1 1
                                    0 9 0 11 1 0 46 0 1 1 0 0 0 1 1 0 9 0 1 1 0
                                    27 48 1 1 0 27 0 1 2 0 22 0 0 1 3 0 0 0 27
                                    48 1 2 0 0 0 66 1 2 0 0 0 67 1 1 0 30 25 1
                                    1 0 0 0 1 1 0 55 0 1 1 0 0 0 1 2 0 32 33 25
                                    1 2 0 9 0 0 1 2 0 9 0 0 1 0 0 0 1 1 0 48 25
                                    1 1 0 48 56 1 2 0 48 25 57 1 1 0 0 25 1 1 0
                                    0 56 1 2 0 0 25 57 1 1 0 42 0 1 1 0 43 0 1
                                    1 0 65 0 1 1 0 40 0 1 1 0 44 0 1 1 0 26 0 1
                                    2 0 0 0 0 1 2 0 34 24 35 1 1 0 36 24 1 1 0
                                    38 24 1 2 0 41 24 35 1 1 0 0 0 1 1 0 22 0 1
                                    2 0 0 0 0 1 1 0 49 48 1 1 0 9 0 1 1 0 0 48
                                    1 1 0 0 0 1 2 0 9 0 0 1 1 0 61 0 1 1 0 58
                                    58 1 1 0 9 0 14 1 2 9 0 1 1 0 28 0 1 2 0 0
                                    0 44 1 2 0 0 0 26 1 2 0 0 0 27 1 2 0 25 25
                                    27 1 2 0 25 25 26 1 2 0 50 48 0 1 1 1 25 26
                                    1 2 0 0 59 26 1 1 0 65 0 1 2 0 47 0 0 1 2 0
                                    0 0 0 1 1 0 0 48 1 1 0 68 0 1 1 0 27 48 1 1
                                    0 27 0 1 2 0 0 58 48 1 2 0 0 58 0 1 2 0 9 0
                                    57 1 2 0 9 0 58 1 1 0 0 0 1 1 0 29 0 1 2 0
                                    70 70 0 1 1 0 69 0 1 2 0 25 25 25 1 2 0 0 0
                                    0 1 1 0 0 48 1 2 0 9 0 57 1 2 0 9 0 0 1 1 0
                                    30 25 1 1 0 30 25 1 1 0 55 0 1 2 0 52 0 0 1
                                    3 0 54 0 0 0 1 2 0 22 0 0 1 2 0 50 48 0 1 1
                                    2 9 0 1 3 0 0 0 58 59 1 3 0 0 0 58 60 1 3 0
                                    0 0 61 62 1 3 0 0 0 61 63 1 3 0 0 0 57 60 1
                                    3 0 0 0 57 59 1 3 0 0 0 64 63 1 3 0 0 0 64
                                    62 1 3 0 0 0 48 48 1 2 0 0 0 67 1 3 0 0 0 0
                                    0 1 2 0 0 0 66 1 3 0 0 0 26 0 1 3 0 0 0 27
                                    48 1 1 0 29 0 1 2 0 0 58 48 1 9 0 0 58 0 0
                                    0 0 0 0 0 0 1 10 0 0 58 0 0 0 0 0 0 0 0 0 1
                                    8 0 0 58 0 0 0 0 0 0 0 1 6 0 0 58 0 0 0 0 0
                                    1 7 0 0 58 0 0 0 0 0 0 1 4 0 0 58 0 0 0 1 5
                                    0 0 58 0 0 0 0 1 3 0 0 58 0 0 1 2 0 0 58 0
                                    1 2 0 51 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 29 1 1 0 28 0 1 1 1 0 0 1 1 0
                                    17 0 21 1 0 31 0 1 1 0 37 0 1 1 0 39 0 1 1
                                    3 23 24 1 1 0 0 28 1 1 0 0 44 1 1 0 0 0 1 1
                                    0 0 40 1 1 0 0 26 1 1 0 71 0 1 1 3 22 0 1 0
                                    0 29 1 1 0 0 48 1 1 0 0 0 1 1 0 9 58 1 2 0
                                    9 0 0 1 2 0 9 0 0 1 2 0 0 0 45 1 2 0 0 0 29
                                    1 2 0 0 0 44 1 2 0 0 0 40 1 0 0 0 7 0 0 0
                                    12 1 0 0 0 1 2 0 0 0 29 1 2 0 9 0 0 16 2 0
                                    0 0 0 1 2 0 0 0 0 15 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 45 0 1 2 0 0 29 0 1 2 0 0 0 0 1 2 0 0
                                    44 0 1 2 0 0 40 0 1 2 0 0 0 40 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|AlgebraicNumber| 'NILADIC T) 
