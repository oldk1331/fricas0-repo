
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

(DEFUN |JetBundleXExpression| (#1=#:G187)
  (SPROG NIL
         (PROG (#2=#:G188)
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
  (SPROG ((|pv$| NIL) (#1=#:G186 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|JetBundleXExpression|))
          (LETT |dv$| (LIST '|JetBundleXExpression| DV$1) . #2#)
          (LETT $ (GETREFV 94) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CommutativeRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Ring|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Group|))
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
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    . #2#)
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
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
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Integer|))))
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
                                                #1#)
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|Group|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|Ring|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 65536))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 131072))
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
              (|Polynomial| 24) (|Fraction| 65) (|Kernel| $) (|Fraction| 39)
              (|Fraction| 64) (|Union| 43 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 28 $)
              (|Union| 48 '#1#) (|AlgebraicNumber|)
              (|Record| (|:| |mat| 52) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 53 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 55 '#2#)
              (|List| 60) (|Mapping| $ $) (|List| 58) (|NonNegativeInteger|)
              (|Mapping| $ 31) (|List| 61) (|Union| 64 '#1#) (|Polynomial| 28)
              (|SparseUnivariatePolynomial| $) (|Expression| 28)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 31) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 71 '"failed")
              (|Polynomial| $) (|Union| 41 '#1#) (|Equation| $) (|List| 75)
              (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 57))
              (|Record| (|:| |Sys| 31) (|:| JM 81) (|:| |Depend| 79))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DSys| 31) (|:| |JVars| 85)) (|PositiveInteger|)
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
              |riemannZeta| 435 |retractIfCan| 440 |retract| 485 |rem| 530
              |reducedSystem| 536 |reduceMod| 547 |reduce| 553 |recip| 558
              |quo| 563 |product| 569 |principalIdeal| 581 |prime?| 586
              |polylog| 591 |polygamma| 597 |pi| 603 |permutation| 607
              |patternMatch| 613 |paren| 627 |orderDim| 632 |order| 639
              |opposite?| 644 |operators| 650 |operator| 655 |one?| 660 |odd?|
              665 |numerator| 670 |numer| 675 |numIndVar| 680 |numDepVar| 684
              |nthRoot| 688 |multiEuclidean| 694 |minPoly| 700 |meixnerM| 705
              |meijerG| 713 |map| 722 |mainKernel| 728 |lommelS2| 733
              |lommelS1| 740 |log| 747 |li| 752 |lerchPhi| 757 |legendreQ| 764
              |legendreP| 771 |leftRecip| 778 |leftPower| 783 |leadingDer| 795
              |lcmCoef| 800 |lcm| 806 |latex| 817 |lambertW| 822 |laguerreL|
              827 |kummerU| 834 |kummerM| 841 |kernels| 848 |kernel| 858
              |kelvinKer| 870 |kelvinKei| 876 |kelvinBer| 882 |kelvinBei| 888
              |jetVariables| 894 |jacobiZeta| 899 |jacobiTheta| 905 |jacobiSn|
              911 |jacobiP| 917 |jacobiMatrix| 925 |jacobiDn| 936 |jacobiCn|
              942 |isTimes| 948 |isPower| 953 |isPlus| 958 |isMult| 963
              |isExpt| 968 |is?| 985 |inv| 997 |integral| 1002
              |hypergeometricF| 1014 |hermiteH| 1021 |height| 1027
              |hashUpdate!| 1032 |hash| 1038 |hankelH2| 1043 |hankelH1| 1049
              |ground?| 1055 |ground| 1060 |getNotation| 1065 |gcdPolynomial|
              1069 |gcd| 1075 |function| 1086 |fresnelS| 1092 |fresnelC| 1097
              |freeOf?| 1102 |formalDiff2| 1120 |formalDiff| 1134 |factorials|
              1152 |factorial| 1163 |factor| 1168 |extractSymbol| 1173
              |extendedEuclidean| 1178 |exquo| 1191 |expressIdealMember| 1197
              |exp| 1203 |even?| 1208 |eval| 1213 |euclideanSize| 1374 |erfi|
              1379 |erf| 1384 |elt| 1389 |ellipticPi| 1485 |ellipticK| 1492
              |ellipticF| 1497 |ellipticE| 1503 |divide| 1514 |distribute| 1520
              |dimension| 1531 |dilog| 1538 |digamma| 1543 |differentiate| 1548
              |denominator| 1580 |denom| 1585 |definingPolynomial| 1590
              |dSubst| 1595 |csch| 1602 |csc| 1607 |coth| 1612 |cot| 1617
              |cosh| 1622 |cos| 1627 |convert| 1632 |const?| 1652 |conjugate|
              1657 |commutator| 1668 |coerce| 1674 |class| 1749 |charthRoot|
              1754 |charlierC| 1759 |characteristic| 1766 |box| 1770 |binomial|
              1775 |besselY| 1781 |besselK| 1787 |besselJ| 1793 |besselI| 1799
              |belong?| 1805 |autoReduce| 1810 |atanh| 1815 |atan| 1820
              |associator| 1825 |associates?| 1832 |asinh| 1838 |asin| 1843
              |asech| 1848 |asec| 1853 |applyQuote| 1858 |antiCommutator| 1894
              |annihilate?| 1900 |angerJ| 1906 |algtower| 1912 |airyBiPrime|
              1922 |airyBi| 1927 |airyAiPrime| 1932 |airyAi| 1937 |acsch| 1942
              |acsc| 1947 |acoth| 1952 |acot| 1957 |acosh| 1962 |acos| 1967
              |abs| 1972 ^ 1977 |Zero| 2007 X 2011 U 2020 |Si| 2029 |Shi| 2034
              P 2039 |One| 2061 |Gamma| 2065 |Ei| 2076 D 2081 |Ci| 2107 |Chi|
              2112 |Beta| 2117 = 2123 / 2129 - 2141 + 2152 * 2158)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 2 3 4
                                  14 0 0 0 0 0 0 2 0 0 0 2 0 0 0 0 0 2 2 0 6 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 10 11 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  13 1 5 7 8 9 12))
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
                |Evalable&| NIL |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |RetractableTo&|)
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
                 (|Patternable| 28) (|Evalable| $$) (|CommutativeStar|)
                 (|SetCategory|) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
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
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 93) (|RetractableTo| 24)
                 (|RetractableTo| 43) (|RetractableTo| 64) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35)
                 (|RetractableTo| 48))
              (|makeByteWordVec2| 93
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 31 73 1 1 0 31 65 1 2 0 31 65 8 1
                                    1 0 31 0 1 2 0 31 0 8 1 1 0 0 73 1 1 0 0 65
                                    1 2 0 0 65 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 29 0 1 1 0 29
                                    31 1 2 1 40 0 41 1 1 0 88 0 1 1 0 0 0 1 1 0
                                    10 0 1 1 0 36 0 1 1 0 36 31 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 81 31 1 2 0 0 0 8 1 2 0 0 0 67 1
                                    2 0 20 0 0 1 2 0 0 0 75 1 3 0 0 0 36 31 1 2
                                    0 0 0 76 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 0 0 1 1 0 31
                                    31 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 80 31 81 1 1 0 0 0
                                    1 3 0 80 31 81 31 1 2 0 31 31 31 1 1 0 86 8
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 31 73 1 1
                                    0 31 65 1 2 0 31 65 8 1 1 0 31 0 1 2 0 31 0
                                    8 1 3 0 0 0 65 8 1 1 0 0 65 1 1 0 0 73 1 2
                                    0 0 65 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 20 0 1
                                    2 0 0 0 60 1 2 0 0 0 83 1 1 0 0 0 1 1 13 23
                                    0 1 1 1 44 0 1 1 12 47 0 1 1 5 63 0 1 1 0
                                    20 5 21 1 0 74 0 1 1 0 77 0 1 1 0 78 0 1 1
                                    0 87 0 1 1 13 24 0 1 1 1 43 0 1 1 12 48 0 1
                                    1 5 64 0 1 1 0 0 5 22 1 0 41 0 1 1 0 8 0 1
                                    1 0 28 0 1 1 0 6 0 1 2 0 0 0 0 1 2 5 49 50
                                    51 1 1 5 52 50 1 2 0 31 31 31 1 1 0 0 0 1 1
                                    0 20 0 1 2 0 0 0 0 1 2 0 0 0 67 1 2 0 0 0 8
                                    1 1 0 68 31 1 1 0 10 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 0 0 0 1 2 0 0 0 0 1 3 10 45 0 34 45 1
                                    3 11 46 0 35 46 1 1 0 0 0 1 3 0 60 31 81 60
                                    1 1 0 60 0 1 2 0 10 0 0 1 1 0 30 0 1 1 0 32
                                    32 1 1 0 10 0 1 1 18 10 0 1 1 0 0 0 1 1 5
                                    38 0 1 0 0 83 1 0 0 83 1 2 0 0 0 28 1 2 0
                                    25 31 0 1 1 17 65 41 1 4 0 0 0 0 0 0 1 5 18
                                    0 31 31 31 31 0 1 2 0 0 58 41 1 1 0 74 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 1 0 20 0 1 2 0 0 0 60 1 2 0 0 0 83 1 1 0
                                    6 0 1 2 0 89 0 0 1 2 0 0 0 0 1 1 0 0 31 1 1
                                    0 90 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 3 0 0 0 0 0 1 1 0 36 31 1 1 0 36 0 1 2
                                    0 0 32 31 1 2 0 0 32 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 14 0 15 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0
                                    0 0 1 2 0 81 31 85 1 1 0 81 31 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 16 25 0 1 1 5 56 0 1 1 15
                                    25 0 1 1 15 27 0 1 2 5 54 0 32 1 2 5 54 0 8
                                    1 1 16 54 0 1 2 0 10 0 32 1 2 0 10 0 8 1 1
                                    0 0 0 1 2 0 0 0 67 1 2 0 0 0 8 1 3 18 0 31
                                    31 0 1 2 0 0 0 0 1 1 0 60 0 1 2 0 92 92 0 1
                                    1 0 91 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 0
                                    1 1 0 28 0 1 0 0 8 1 2 0 65 65 65 1 2 0 0 0
                                    0 1 1 0 0 31 1 2 0 0 8 31 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 10 0 8 1 2 0 10 0 0 1 2 0 10 0 6 1
                                    3 0 82 31 83 81 1 3 0 84 0 83 81 1 2 0 31
                                    31 83 1 2 0 0 0 57 1 2 0 0 0 83 1 1 0 0 0 1
                                    2 0 0 0 8 1 1 0 0 0 1 1 0 37 0 1 1 0 81 81
                                    1 2 0 70 0 0 1 3 0 72 0 0 0 1 2 0 20 0 0 1
                                    2 0 25 31 0 1 1 0 0 0 1 1 18 10 0 1 2 7 0 0
                                    29 1 2 7 0 0 8 1 1 7 0 0 1 4 7 0 0 30 31 8
                                    1 4 7 0 0 32 0 8 1 4 5 0 0 29 57 59 1 4 5 0
                                    0 8 60 61 1 4 5 0 0 29 57 62 1 4 5 0 0 8 60
                                    58 1 3 0 0 0 41 0 1 3 0 0 0 36 31 1 2 0 0 0
                                    75 1 2 0 0 0 76 1 3 0 0 0 0 0 1 3 0 0 0 31
                                    31 1 3 0 0 0 29 59 1 3 0 0 0 8 61 1 3 0 0 0
                                    29 62 1 3 0 0 0 8 58 1 3 0 0 0 30 62 1 3 0
                                    0 0 30 59 1 3 0 0 0 32 61 1 3 0 0 0 32 58 1
                                    1 0 60 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 32 0 1
                                    3 0 0 32 0 0 1 5 0 0 32 0 0 0 0 1 4 0 0 32
                                    0 0 0 1 6 0 0 32 0 0 0 0 0 1 8 0 0 32 0 0 0
                                    0 0 0 0 1 7 0 0 32 0 0 0 0 0 0 1 9 0 0 32 0
                                    0 0 0 0 0 0 0 1 2 0 0 32 31 1 10 0 0 32 0 0
                                    0 0 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 69 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 3 0 60 31 81 60 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 6 1 3 0 0 0 29 57 1
                                    2 0 0 0 29 1 3 0 0 0 8 60 1 2 0 0 0 8 1 1 0
                                    0 0 1 1 1 38 0 1 1 17 0 0 1 3 0 0 0 6 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 7 33 0 1 1 8 34 0 1 1 9 35
                                    0 1 1 1 0 37 1 1 0 10 0 1 2 6 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 1 1 0 39 1 1 1 0 42 1 1 1 0
                                    43 1 1 12 0 48 1 1 5 0 38 1 1 5 0 64 1 1 0
                                    66 0 1 1 0 0 66 1 1 0 0 24 1 1 0 0 41 1 1 0
                                    0 8 1 1 0 0 6 13 1 0 0 0 1 1 0 0 28 1 1 0
                                    93 0 1 1 0 60 0 1 1 3 20 0 1 3 0 0 0 0 0 1
                                    0 0 60 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10
                                    32 1 1 0 31 31 1 1 0 0 0 1 1 0 0 0 1 3 0 0
                                    0 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 3 0 0 8 0 0 1 2 0 0 8 0 1
                                    5 0 0 8 0 0 0 0 1 4 0 0 8 0 0 0 1 2 0 0 8
                                    31 1 2 0 0 0 0 1 2 0 10 0 0 1 2 0 0 0 0 1 1
                                    1 36 31 1 1 1 36 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 28 1 2 0 0 0 24 1 2 0 0
                                    0 60 1 2 0 0 0 83 1 0 0 0 1 0 0 0 1 1 0 0
                                    83 1 0 0 0 1 1 0 0 83 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 60 1 2 0 0 83 60 1 1 0 0 57 1 2 0 0
                                    83 57 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 29 57 1 3 0 0 0 8 60 1 2 0 0 0
                                    8 1 2 0 0 0 29 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 1 0 38 38 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 2 0 0
                                    28 1 2 0 0 0 24 1 2 0 0 24 0 1 2 0 0 60 0 1
                                    2 0 0 28 0 1 2 0 0 0 0 1 2 0 0 83 0 1)))))
           '|lookupComplete|)) 
