
(SDEFUN |JBX;coerce;JB$;1| ((|jv| JB) ($ $))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| |JetBundleExpression| JB) ($ |Union| $ "failed"))
        (SPROG ((#1=#:G121 NIL) (|jv| NIL) (#2=#:G120 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #2# NIL . #3=(|JBX;retractIfCan;JbeU;2|))
                             (SEQ (LETT |jv| NIL . #3#)
                                  (LETT #1# (SPADCALL |p| (QREFELT $ 15))
                                        . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |jv| (CAR #1#) . #3#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT $ 9))
                                                  '|Indep|)
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT $ 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe$;3| ((|p| |JetBundleExpression| JB) ($ $))
        (SPROG ((|px| (|Union| $ "failed")))
               (SEQ
                (LETT |px| (SPADCALL |p| (QREFELT $ 21)) |JBX;retract;Jbe$;3|)
                (EXIT
                 (COND
                  ((QEQCAR |px| 1)
                   (|error| "Only functions of independent variables allowed"))
                  ('T (QCDR |px|))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G185)
  (SPROG NIL
         (PROG (#2=#:G186)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleXExpression|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleXExpression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleXExpression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleXExpression|)))))))))) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G183 NIL) (#2=#:G184 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleXExpression|))
    (LETT |dv$| (LIST '|JetBundleXExpression| DV$1) . #3#)
    (LETT $ (GETREFV 92) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Integer|) '(|Ring|))
                                        (|HasCategory| (|Integer|) '(|Group|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Group|)))
                                         (|HasCategory| (|Integer|) '(|Ring|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|JetBundleExpression| |#1|))
    $))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB$;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| $ '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe$;3|
              (|Union| 24 '#1="failed") (|Fraction| 28)
              (|Union| 31 '#2="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 41)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|List| 32) (|List| $) (|BasicOperator|)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|List| 41)
              (|Factored| $) (|SparseMultivariatePolynomial| 28 41)
              (|Polynomial| 24) (|Fraction| 63) (|Kernel| $) (|Fraction| 39)
              (|Fraction| 62) (|Union| 43 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 28 $)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 51 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 53 '#2#)
              (|List| 58) (|Mapping| $ $) (|List| 56) (|NonNegativeInteger|)
              (|Mapping| $ 31) (|List| 59) (|Union| 62 '#1#) (|Polynomial| 28)
              (|SparseUnivariatePolynomial| $) (|Expression| 28)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 31) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 69 '"failed")
              (|Polynomial| $) (|Union| 41 '#1#) (|Equation| $) (|List| 73)
              (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 55))
              (|Record| (|:| |Sys| 31) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DSys| 31) (|:| |JVars| 83)) (|PositiveInteger|)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassPInverse| 134 |weierstrassP|
              141 |weberE| 148 |variables| 154 |univariate| 164 |unitNormal|
              170 |unitCanonical| 175 |unit?| 180 |tower| 185 |tanh| 195 |tan|
              200 |symbol| 205 |summation| 210 |subtractIfCan| 222 |subst| 228
              |struveL| 254 |struveH| 260 |squareFreePart| 266 |squareFree| 271
              |sqrt| 276 |sortLD| 281 |solveFor| 286 |smaller?| 292 |sizeLess?|
              298 |sinh| 304 |sin| 309 |simplify| 314 |simpOne| 320 |simpMod|
              325 |setNotation| 338 |sech| 343 |sec| 348 |sample| 353 |rootsOf|
              357 |rootSum| 384 |rootOf| 391 |rightRecip| 418 |rightPower| 423
              |riemannZeta| 435 |retractIfCan| 440 |retract| 480 |rem| 520
              |reducedSystem| 526 |reduceMod| 537 |reduce| 543 |recip| 548
              |quo| 553 |product| 559 |principalIdeal| 571 |prime?| 576
              |polylog| 581 |polygamma| 587 |pi| 593 |permutation| 597
              |patternMatch| 603 |paren| 617 |orderDim| 627 |order| 634
              |opposite?| 639 |operators| 645 |operator| 650 |one?| 655 |odd?|
              660 |numerator| 665 |numer| 670 |numIndVar| 675 |numDepVar| 679
              |nthRoot| 683 |multiEuclidean| 689 |minPoly| 695 |meixnerM| 700
              |meijerG| 708 |map| 717 |mainKernel| 723 |lommelS2| 728
              |lommelS1| 735 |log| 742 |li| 747 |lerchPhi| 752 |legendreQ| 759
              |legendreP| 766 |leftRecip| 773 |leftPower| 778 |leadingDer| 790
              |lcmCoef| 795 |lcm| 801 |latex| 812 |lambertW| 817 |laguerreL|
              822 |kummerU| 829 |kummerM| 836 |kernels| 843 |kernel| 853
              |kelvinKer| 865 |kelvinKei| 871 |kelvinBer| 877 |kelvinBei| 883
              |jetVariables| 889 |jacobiZeta| 894 |jacobiTheta| 900 |jacobiSn|
              906 |jacobiP| 912 |jacobiMatrix| 920 |jacobiDn| 931 |jacobiCn|
              937 |isTimes| 943 |isPower| 948 |isPlus| 953 |isMult| 958
              |isExpt| 963 |is?| 980 |inv| 992 |integral| 997 |hypergeometricF|
              1009 |hermiteH| 1016 |height| 1022 |hashUpdate!| 1027 |hash| 1033
              |hankelH2| 1038 |hankelH1| 1044 |ground?| 1050 |ground| 1055
              |getNotation| 1060 |gcdPolynomial| 1064 |gcd| 1070 |function|
              1081 |fresnelS| 1087 |fresnelC| 1092 |freeOf?| 1097 |formalDiff2|
              1115 |formalDiff| 1129 |factorials| 1147 |factorial| 1158
              |factor| 1163 |extractSymbol| 1168 |extendedEuclidean| 1173
              |exquo| 1186 |expressIdealMember| 1192 |exp| 1198 |even?| 1203
              |eval| 1208 |euclideanSize| 1369 |erfi| 1374 |erf| 1379 |elt|
              1384 |ellipticPi| 1480 |ellipticK| 1487 |ellipticF| 1492
              |ellipticE| 1498 |divide| 1509 |distribute| 1515 |dimension| 1526
              |dilog| 1533 |digamma| 1538 |differentiate| 1543 |denominator|
              1575 |denom| 1580 |definingPolynomial| 1585 |dSubst| 1590 |csch|
              1597 |csc| 1602 |coth| 1607 |cot| 1612 |cosh| 1617 |cos| 1622
              |convert| 1627 |const?| 1647 |conjugate| 1652 |commutator| 1663
              |coerce| 1669 |class| 1739 |charthRoot| 1744 |charlierC| 1749
              |characteristic| 1756 |box| 1760 |binomial| 1770 |besselY| 1776
              |besselK| 1782 |besselJ| 1788 |besselI| 1794 |belong?| 1800
              |autoReduce| 1805 |atanh| 1810 |atan| 1815 |associator| 1820
              |associates?| 1827 |asinh| 1833 |asin| 1838 |asech| 1843 |asec|
              1848 |applyQuote| 1853 |antiCommutator| 1889 |annihilate?| 1895
              |angerJ| 1901 |algtower| 1907 |airyBiPrime| 1917 |airyBi| 1922
              |airyAiPrime| 1927 |airyAi| 1932 |acsch| 1937 |acsc| 1942 |acoth|
              1947 |acot| 1952 |acosh| 1957 |acos| 1962 |abs| 1967 ^ 1972
              |Zero| 2002 X 2006 U 2015 |Si| 2024 |Shi| 2029 P 2034 |One| 2056
              |Gamma| 2060 |Ei| 2071 D 2076 |Ci| 2102 |Chi| 2107 |Beta| 2112 =
              2118 / 2124 - 2136 + 2147 * 2153)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 3 4 5
                                  13 0 0 0 0 0 0 3 0 0 0 3 0 0 0 0 0 3 3 0 7 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 11 12 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1
                                  6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL
                |FullyLinearlyExplicitOver&| |Algebra&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&| |Algebra&|
                NIL NIL NIL NIL |Rng&| NIL |Module&| |Module&| NIL |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| |Group&| NIL
                NIL NIL NIL |ExpressionSpace&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 28)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 28) (|Field|)
                 (|EuclideanDomain|) (|JetBundleBaseFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|FullyLinearlyExplicitOver| 28)
                 (|Algebra| 24) (|PartialDifferentialRing| 8) (|EntireRing|)
                 (|Algebra| $$) (|Algebra| 28) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 28) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 24) (|Module| $$) (|SemiRng|)
                 (|Module| 28) (|BiModule| 24 24) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 28 28) (|RightModule| 24)
                 (|LeftModule| 24) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| 28) (|RightModule| 28)
                 (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 28) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 28) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 28)
                 (|Patternable| 28) (|Evalable| $$) (|SetCategory|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 28) (|Type|) (|RetractableTo| 8)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|RetractableTo| 6)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 91) (|RetractableTo| 24)
                 (|RetractableTo| 43) (|RetractableTo| 62) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 31 71 1 1 0 31 63 1 2 0 31 63 8 1
                                    1 0 31 0 1 2 0 31 0 8 1 1 0 0 71 1 1 0 0 63
                                    1 2 0 0 63 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 29 0 1 1 0 29
                                    31 1 2 1 40 0 41 1 1 0 86 0 1 1 0 0 0 1 1 0
                                    10 0 1 1 0 36 0 1 1 0 36 31 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 79 31 1 2 0 0 0 8 1 2 0 0 0 65 1
                                    2 0 20 0 0 1 2 0 0 0 73 1 3 0 0 0 36 31 1 2
                                    0 0 0 74 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 0 0 1 1 0 31
                                    31 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 78 31 79 1 1 0 0 0
                                    1 3 0 78 31 79 31 1 2 0 31 31 31 1 1 0 84 8
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 31 71 1 1
                                    0 31 63 1 2 0 31 63 8 1 1 0 31 0 1 2 0 31 0
                                    8 1 3 0 0 0 63 8 1 1 0 0 63 1 1 0 0 71 1 2
                                    0 0 63 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 20 0 1
                                    2 0 0 0 58 1 2 0 0 0 81 1 1 0 0 0 1 1 2 23
                                    0 1 1 1 44 0 1 1 6 61 0 1 1 0 20 5 21 1 0
                                    72 0 1 1 0 75 0 1 1 0 76 0 1 1 0 85 0 1 1 2
                                    24 0 1 1 1 43 0 1 1 6 62 0 1 1 0 0 5 22 1 0
                                    41 0 1 1 0 8 0 1 1 0 28 0 1 1 0 6 0 1 2 0 0
                                    0 0 1 2 6 47 48 49 1 1 6 50 48 1 2 0 31 31
                                    31 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0 1 2 0 0
                                    0 65 1 2 0 0 0 8 1 1 0 66 31 1 1 0 10 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3
                                    11 45 0 34 45 1 3 12 46 0 35 46 1 1 0 0 0 1
                                    1 0 0 31 1 3 0 58 31 79 58 1 1 0 58 0 1 2 0
                                    10 0 0 1 1 0 30 0 1 1 0 32 32 1 1 0 10 0 1
                                    1 17 10 0 1 1 0 0 0 1 1 6 38 0 1 0 0 81 1 0
                                    0 81 1 2 0 0 0 28 1 2 0 25 31 0 1 1 16 63
                                    41 1 4 0 0 0 0 0 0 1 5 17 0 31 31 31 31 0 1
                                    2 0 0 56 41 1 1 0 72 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 20 0 1 2 0
                                    0 0 58 1 2 0 0 0 81 1 1 0 6 0 1 2 0 87 0 0
                                    1 2 0 0 0 0 1 1 0 0 31 1 1 0 88 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 36 0 1 1 0 36 31 1 2 0 0 32 0 1 2 0 0
                                    32 31 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 2 0 79 31
                                    83 1 1 0 79 31 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    15 25 0 1 1 6 54 0 1 1 14 25 0 1 1 14 27 0
                                    1 2 6 52 0 32 1 2 6 52 0 8 1 1 15 52 0 1 2
                                    0 10 0 8 1 2 0 10 0 32 1 1 0 0 0 1 2 0 0 0
                                    65 1 2 0 0 0 8 1 3 17 0 31 31 0 1 2 0 0 0 0
                                    1 1 0 58 0 1 2 0 90 90 0 1 1 0 89 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 10 0 1 1 0 28 0 1 0 0
                                    8 1 2 0 63 63 63 1 2 0 0 0 0 1 1 0 0 31 1 2
                                    0 0 8 31 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 0 1
                                    2 0 10 0 8 1 2 0 10 0 6 1 3 0 80 31 81 79 1
                                    3 0 82 0 81 79 1 2 0 31 31 81 1 2 0 0 0 55
                                    1 2 0 0 0 81 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0
                                    0 1 1 0 37 0 1 1 0 79 79 1 2 0 68 0 0 1 3 0
                                    70 0 0 0 1 2 0 20 0 0 1 2 0 25 31 0 1 1 0 0
                                    0 1 1 17 10 0 1 2 8 0 0 29 1 2 8 0 0 8 1 1
                                    8 0 0 1 4 8 0 0 30 31 8 1 4 8 0 0 32 0 8 1
                                    4 6 0 0 29 55 57 1 4 6 0 0 8 58 59 1 4 6 0
                                    0 29 55 60 1 4 6 0 0 8 58 56 1 3 0 0 0 41 0
                                    1 3 0 0 0 36 31 1 2 0 0 0 73 1 2 0 0 0 74 1
                                    3 0 0 0 0 0 1 3 0 0 0 31 31 1 3 0 0 0 29 57
                                    1 3 0 0 0 29 60 1 3 0 0 0 8 56 1 3 0 0 0 8
                                    59 1 3 0 0 0 30 60 1 3 0 0 0 30 57 1 3 0 0
                                    0 32 59 1 3 0 0 0 32 56 1 1 0 58 0 1 1 0 0
                                    0 1 1 0 0 0 1 2 0 0 32 0 1 3 0 0 32 0 0 1 5
                                    0 0 32 0 0 0 0 1 4 0 0 32 0 0 0 1 6 0 0 32
                                    0 0 0 0 0 1 8 0 0 32 0 0 0 0 0 0 0 1 7 0 0
                                    32 0 0 0 0 0 0 1 9 0 0 32 0 0 0 0 0 0 0 0 1
                                    2 0 0 32 31 1 10 0 0 32 0 0 0 0 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 67 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 3 0 58 31 79 58 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 6 1 3 0 0 0 29 55 1 2 0 0 0 29 1 3
                                    0 0 0 8 58 1 2 0 0 0 8 1 1 0 0 0 1 1 1 38 0
                                    1 1 16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 8 33 0 1 1 9 34 0 1 1 10 35 0 1 1 1 0 37
                                    1 1 0 10 0 1 2 7 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 1 0 39 1 1 1 0 42 1 1 1 0 43 1 1 6 0
                                    38 1 1 6 0 62 1 1 0 64 0 1 1 0 0 64 1 1 0 0
                                    24 1 1 0 0 41 1 1 0 0 8 1 1 0 0 6 13 1 0 0
                                    0 1 1 0 0 28 1 1 0 91 0 1 1 0 58 0 1 1 4 20
                                    0 1 3 0 0 0 0 0 1 0 0 58 1 1 0 0 0 1 1 0 0
                                    31 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 1 0 10 32 1 1 0 31 31
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2 0 10
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 3 0 0 8 0 0 1 2 0 0 8 0 1 5 0 0 8 0 0 0 0
                                    1 4 0 0 8 0 0 0 1 2 0 0 8 31 1 2 0 0 0 0 1
                                    2 0 10 0 0 1 2 0 0 0 0 1 1 1 36 31 1 1 1 36
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 28 1 2 0 0 0 24 1 2 0 0 0 58 1 2 0 0 0 81
                                    1 0 0 0 1 0 0 0 1 1 0 0 81 1 0 0 0 1 1 0 0
                                    81 1 1 0 0 0 1 1 0 0 0 1 1 0 0 58 1 2 0 0
                                    81 58 1 1 0 0 55 1 2 0 0 81 55 1 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 29 55
                                    1 3 0 0 0 8 58 1 2 0 0 0 8 1 2 0 0 0 29 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1
                                    2 1 0 38 38 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 3 0 0 28 1 2 0 0 0 24 1 2
                                    0 0 24 0 1 2 0 0 58 0 1 2 0 0 28 0 1 2 0 0
                                    0 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
