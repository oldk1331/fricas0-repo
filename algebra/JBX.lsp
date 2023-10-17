
(SDEFUN |JBX;coerce;JB$;1| ((|jv| (JB)) ($ ($)))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| (|JetBundleExpression| JB)) ($ (|Union| $ "failed")))
        (SPROG ((#1=#:G122 NIL) (|jv| NIL) (#2=#:G121 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT $ 16)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |jv| NIL)
                                  (LETT #1# (SPADCALL |p| (QREFELT $ 15))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |jv| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT $ 9))
                                                  '|Indep|)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT $ 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe$;3| ((|p| (|JetBundleExpression| JB)) ($ ($)))
        (SPROG ((|px| (|Union| $ "failed")))
               (SEQ (LETT |px| (SPADCALL |p| (QREFELT $ 21)))
                    (EXIT
                     (COND
                      ((QEQCAR |px| 1)
                       (|error|
                        "Only functions of independent variables allowed"))
                      ('T (QCDR |px|))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G188)
  (SPROG NIL
         (PROG (#2=#:G189)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleXExpression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleXExpression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleXExpression|)))))))))) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G187 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleXExpression| DV$1))
          (LETT $ (GETREFV 94))
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
                                                                     (|Integer|))))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))))
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
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe$;3| (|Fraction| 50)
              (|Union| 23 '#1="failed")
              (|Record| (|:| |coef| 50) (|:| |var| 40))
              (|Union| 25 '#2="failed") (|Union| 30 '#2#) (|BasicOperator|)
              (|List| 28) (|List| $) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 50) (|List| 40) (|Factored| $)
              (|SparseMultivariatePolynomial| 50 40) (|Polynomial| 23)
              (|Fraction| 37) (|Fraction| 65) (|Kernel| $) (|Union| 42 '#1#)
              (|Fraction| 63) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 50 $) (|AlgebraicNumber|) (|Union| 45 '#1#)
              (|Record| (|:| |mat| 51) (|:| |vec| (|Vector| 50))) (|Matrix| $)
              (|Vector| $) (|Integer|) (|Matrix| 50)
              (|Record| (|:| |var| 40) (|:| |exponent| 50)) (|Union| 52 '#2#)
              (|List| 8) (|List| 62) (|Mapping| $ $) (|List| 56)
              (|Record| (|:| |val| $) (|:| |exponent| 50)) (|Union| 58 '#2#)
              (|Mapping| $ 30) (|List| 60) (|NonNegativeInteger|)
              (|Polynomial| 50) (|Union| 63 '#1#)
              (|SparseUnivariatePolynomial| $) (|Expression| 50)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 30) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 71 '"failed")
              (|Polynomial| $) (|Union| 40 '#1#) (|List| 76) (|Equation| $)
              (|Union| 8 '#1#) (|Union| 50 '#1#)
              (|Union| '"failed" (|List| 55))
              (|Record| (|:| |Sys| 30) (|:| JM 81) (|:| |Depend| 79))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|PositiveInteger|)
              (|Record| (|:| |DSys| 30) (|:| |JVars| 85)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassPInverse| 134 |weierstrassP|
              141 |weberE| 148 |variables| 154 |univariate| 164 |unitStep| 170
              |unitNormal| 175 |unitCanonical| 180 |unit?| 185 |tower| 190
              |tanh| 200 |tan| 205 |symbol| 210 |summation| 215 |subtractIfCan|
              227 |subst| 233 |struveL| 259 |struveH| 265 |squareFreePart| 271
              |squareFree| 276 |sqrt| 281 |sortLD| 286 |solveFor| 291
              |smaller?| 297 |sizeLess?| 303 |sinh| 309 |sin| 314 |simplify|
              319 |simpOne| 325 |simpMod| 330 |sign| 343 |setNotation| 348
              |sech| 353 |sec| 358 |sample| 363 |rootsOf| 367 |rootSum| 394
              |rootOf| 401 |rightRecip| 428 |rightPower| 433 |riemannZeta| 445
              |retractIfCan| 450 |retract| 495 |rem| 540 |reducedSystem| 546
              |reduceMod| 557 |reduce| 563 |recip| 568 |quo| 573 |product| 579
              |principalIdeal| 591 |prime?| 596 |polylog| 601 |polygamma| 607
              |pi| 613 |permutation| 617 |patternMatch| 623 |paren| 637
              |orderDim| 642 |order| 649 |opposite?| 654 |operators| 660
              |operator| 665 |one?| 670 |odd?| 675 |numerator| 680 |numer| 685
              |numIndVar| 690 |numDepVar| 694 |nthRoot| 698 |multiEuclidean|
              704 |minPoly| 710 |meixnerM| 715 |meijerG| 723 |map| 732
              |mainKernel| 738 |lommelS2| 743 |lommelS1| 750 |log| 757 |li| 762
              |lerchPhi| 767 |legendreQ| 774 |legendreP| 781 |leftRecip| 788
              |leftPower| 793 |leadingDer| 805 |lcmCoef| 810 |lcm| 816 |latex|
              827 |lambertW| 832 |laguerreL| 837 |kummerU| 844 |kummerM| 851
              |kernels| 858 |kernel| 868 |kelvinKer| 880 |kelvinKei| 886
              |kelvinBer| 892 |kelvinBei| 898 |jetVariables| 904 |jacobiZeta|
              909 |jacobiTheta| 915 |jacobiSn| 921 |jacobiP| 927 |jacobiMatrix|
              935 |jacobiDn| 946 |jacobiCn| 952 |isTimes| 958 |isPower| 963
              |isPlus| 968 |isMult| 973 |isExpt| 978 |is?| 995 |inv| 1007
              |integral| 1012 |hypergeometricF| 1024 |hermiteH| 1031 |height|
              1037 |hashUpdate!| 1042 |hash| 1048 |hankelH2| 1053 |hankelH1|
              1059 |ground?| 1065 |ground| 1070 |getNotation| 1075
              |gcdPolynomial| 1079 |gcd| 1085 |function| 1096 |fresnelS| 1102
              |fresnelC| 1107 |freeOf?| 1112 |fractionPart| 1130 |formalDiff2|
              1135 |formalDiff| 1149 |floor| 1167 |factorials| 1172 |factorial|
              1183 |factor| 1188 |extractSymbol| 1193 |extendedEuclidean| 1198
              |exquo| 1211 |expressIdealMember| 1217 |exp| 1223 |even?| 1228
              |eval| 1233 |euclideanSize| 1377 |erfi| 1382 |erf| 1387 |elt|
              1392 |ellipticPi| 1488 |ellipticK| 1495 |ellipticF| 1500
              |ellipticE| 1506 |divide| 1517 |distribute| 1523 |diracDelta|
              1534 |dimension| 1539 |dilog| 1546 |digamma| 1551 |differentiate|
              1556 |denominator| 1588 |denom| 1593 |definingPolynomial| 1598
              |dSubst| 1603 |csch| 1610 |csc| 1615 |coth| 1620 |cot| 1625
              |cosh| 1630 |cos| 1635 |convert| 1640 |const?| 1660 |conjugate|
              1665 |commutator| 1676 |coerce| 1682 |class| 1757 |charthRoot|
              1762 |charlierC| 1767 |characteristic| 1774 |ceiling| 1778 |box|
              1783 |binomial| 1788 |besselY| 1794 |besselK| 1800 |besselJ| 1806
              |besselI| 1812 |belong?| 1818 |autoReduce| 1823 |atanh| 1828
              |atan| 1833 |associator| 1838 |associates?| 1845 |asinh| 1851
              |asin| 1856 |asech| 1861 |asec| 1866 |applyQuote| 1871
              |antiCommutator| 1907 |annihilate?| 1913 |angerJ| 1919 |algtower|
              1925 |airyBiPrime| 1935 |airyBi| 1940 |airyAiPrime| 1945 |airyAi|
              1950 |acsch| 1955 |acsc| 1960 |acoth| 1965 |acot| 1970 |acosh|
              1975 |acos| 1980 |abs| 1985 ^ 1990 |Zero| 2020 X 2024 U 2033 |Si|
              2042 |Shi| 2047 P 2052 |One| 2074 |Gamma| 2078 |Ei| 2089 D 2094
              |Ci| 2120 |Chi| 2125 |Beta| 2130 = 2136 / 2142 - 2154 + 2165 *
              2171)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 3 4 0 0
                                  0 0 0 0 2 5 0 0 0 2 5 0 0 0 0 0 2 5 0 6 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 10 11 0 0 0 0 0 0 0 0 0
                                  0 13 1 5 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 13 1 5 7 8 9 12))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&| |Algebra&|
                NIL NIL NIL |Rng&| NIL |Module&| |Module&| NIL |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| |Group&| NIL NIL NIL NIL |ExpressionSpace&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                |FullyRetractableTo&| NIL |Magma&| |AbelianSemiGroup&| NIL NIL
                NIL |TranscendentalFunctionCategory&| |RetractableTo&| NIL
                |RetractableTo&| |Evalable&| |RetractableTo&| |RetractableTo&|
                NIL |SetCategory&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&| NIL NIL NIL
                NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 50)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 50) (|Field|)
                 (|EuclideanDomain|) (|JetBundleBaseFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 23) (|PartialDifferentialRing| 8)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 50)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 23) (|Module| $$) (|SemiRng|)
                 (|Module| 50) (|FullyLinearlyExplicitOver| 50)
                 (|BiModule| 23 23) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 50 50) (|LinearlyExplicitOver| 50)
                 (|RightModule| 23) (|LeftModule| 23) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 50)
                 (|RightModule| 50) (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 50) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|FullyRetractableTo| 50)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 50)
                 (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 50)
                 (|Patternable| 50) (|RetractableTo| 8) (|Evalable| $$)
                 (|RetractableTo| (|Kernel| $$)) (|RetractableTo| 6)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 23)
                 (|RetractableTo| 42) (|RetractableTo| 63) (|RetractableTo| 45)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 50) (|Type|) (|CoercibleFrom| 8)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|CoercibleFrom| (|Kernel| $$)) (|CoercibleFrom| 6)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 93) (|CoercibleFrom| 23)
                 (|CoercibleFrom| 42) (|CoercibleFrom| 63) (|ConvertibleTo| 31)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33)
                 (|CoercibleFrom| 45))
              (|makeByteWordVec2| 93
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 30 73 1 2 0 30 65 8 1 1 0 30 65 1
                                    1 0 30 0 1 2 0 30 0 8 1 1 0 0 73 1 2 0 0 65
                                    8 1 1 0 0 65 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 54 0 1 1 0 54
                                    30 1 2 1 39 0 40 1 1 0 0 0 1 1 0 88 0 1 1 0
                                    0 0 1 1 0 10 0 1 1 0 34 0 1 1 0 34 30 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 81 30 1 2 0 0 0 67 1 2
                                    0 0 0 8 1 2 0 20 0 0 1 2 0 0 0 76 1 3 0 0 0
                                    34 30 1 2 0 0 0 75 1 3 0 0 0 6 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 35 0 1 1 0 0
                                    0 1 1 0 30 30 1 2 0 20 0 6 1 2 0 10 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 80 30 81
                                    1 1 0 0 0 1 3 0 80 30 81 30 1 2 0 30 30 30
                                    1 1 0 0 0 1 1 0 86 8 1 1 0 0 0 1 1 0 0 0 1
                                    0 0 0 1 1 0 30 73 1 2 0 30 65 8 1 1 0 30 65
                                    1 1 0 30 0 1 2 0 30 0 8 1 3 0 0 0 65 8 1 1
                                    0 0 73 1 2 0 0 65 8 1 1 0 0 65 1 1 0 0 0 1
                                    2 0 0 0 8 1 1 0 20 0 1 2 0 0 0 62 1 2 0 0 0
                                    83 1 1 0 0 0 1 1 13 24 0 1 1 1 41 0 1 1 12
                                    46 0 1 1 5 64 0 1 1 0 20 5 21 1 0 74 0 1 1
                                    0 77 0 1 1 0 78 0 1 1 0 87 0 1 1 13 23 0 1
                                    1 1 42 0 1 1 12 45 0 1 1 5 63 0 1 1 0 0 5
                                    22 1 0 40 0 1 1 0 8 0 1 1 0 50 0 1 1 0 6 0
                                    1 2 0 0 0 0 1 2 5 47 48 49 1 1 5 51 48 1 2
                                    0 30 30 30 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0
                                    1 2 0 0 0 8 1 2 0 0 0 67 1 1 0 68 30 1 1 0
                                    10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0
                                    0 0 0 1 3 10 43 0 32 43 1 3 11 44 0 33 44 1
                                    1 0 0 0 1 3 0 62 30 81 62 1 1 0 62 0 1 2 0
                                    10 0 0 1 1 0 29 0 1 1 0 28 28 1 1 0 10 0 1
                                    1 17 10 0 1 1 0 0 0 1 1 5 36 0 1 0 0 83 1 0
                                    0 83 1 2 0 0 0 50 1 2 0 27 30 0 1 1 16 65
                                    40 1 4 0 0 0 0 0 0 1 5 17 0 30 30 30 30 0 1
                                    2 0 0 56 40 1 1 0 74 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 20 0 1 2 0
                                    0 0 62 1 2 0 0 0 83 1 1 0 6 0 1 2 0 89 0 0
                                    1 2 0 0 0 0 1 1 0 0 30 1 1 0 90 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 34 0 1 1 0 34 30 1 2 0 0 28 0 1 2 0 0
                                    28 30 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 2 0 81 30
                                    85 1 1 0 81 30 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    15 27 0 1 1 5 59 0 1 1 14 27 0 1 1 14 26 0
                                    1 2 5 53 0 28 1 2 5 53 0 8 1 1 15 53 0 1 2
                                    0 10 0 8 1 2 0 10 0 28 1 1 0 0 0 1 2 0 0 0
                                    8 1 2 0 0 0 67 1 3 17 0 30 30 0 1 2 0 0 0 0
                                    1 1 0 62 0 1 2 0 92 92 0 1 1 0 91 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 10 0 1 1 0 50 0 1 0 0
                                    8 1 2 0 65 65 65 1 2 0 0 0 0 1 1 0 0 30 1 2
                                    0 0 8 30 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 0 1
                                    2 0 10 0 8 1 2 0 10 0 6 1 1 0 0 0 1 3 0 82
                                    0 83 81 1 3 0 84 30 83 81 1 2 0 30 30 83 1
                                    2 0 0 0 83 1 2 0 0 0 55 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 8 1 1 0 0 0 1 1 0 35 0 1 1 0 81
                                    81 1 2 0 70 0 0 1 3 0 72 0 0 0 1 2 0 20 0 0
                                    1 2 0 27 30 0 1 1 0 0 0 1 1 17 10 0 1 4 7 0
                                    0 28 0 8 1 4 7 0 0 29 30 8 1 4 5 0 0 54 55
                                    57 1 4 5 0 0 54 55 61 1 4 5 0 0 8 62 56 1 4
                                    5 0 0 8 62 60 1 3 0 0 0 34 30 1 3 0 0 0 40
                                    0 1 2 0 0 0 75 1 3 0 0 0 0 0 1 2 0 0 0 76 1
                                    3 0 0 0 30 30 1 3 0 0 0 54 57 1 3 0 0 0 54
                                    61 1 3 0 0 0 8 56 1 3 0 0 0 8 60 1 3 0 0 0
                                    29 57 1 3 0 0 0 28 60 1 3 0 0 0 29 61 1 3 0
                                    0 0 28 56 1 1 0 62 0 1 1 0 0 0 1 1 0 0 0 1
                                    3 0 0 28 0 0 1 2 0 0 28 0 1 4 0 0 28 0 0 0
                                    1 6 0 0 28 0 0 0 0 0 1 5 0 0 28 0 0 0 0 1 7
                                    0 0 28 0 0 0 0 0 0 1 9 0 0 28 0 0 0 0 0 0 0
                                    0 1 8 0 0 28 0 0 0 0 0 0 0 1 2 0 0 28 30 1
                                    10 0 0 28 0 0 0 0 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1
                                    2 0 69 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 3 0 62 30 81 62 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 6 1 3 0 0 0 54 55 1 2 0 0 0 54 1 3 0 0
                                    0 8 62 1 2 0 0 0 8 1 1 0 0 0 1 1 1 36 0 1 1
                                    16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 7
                                    31 0 1 1 8 32 0 1 1 9 33 0 1 1 1 0 35 1 1 0
                                    10 0 1 2 6 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1
                                    1 0 37 1 1 1 0 38 1 1 1 0 42 1 1 12 0 45 1
                                    1 5 0 36 1 1 5 0 63 1 1 0 66 0 1 1 0 0 66 1
                                    1 0 0 23 1 1 0 0 40 1 1 0 0 8 1 1 0 0 6 13
                                    1 0 0 0 1 1 0 0 50 1 1 0 93 0 1 1 0 62 0 1
                                    1 3 20 0 1 3 0 0 0 0 0 1 0 0 62 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 28 1 1 0
                                    30 30 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 8 0 0 1 2 0 0 8 0 1 4 0 0 8 0
                                    0 0 1 2 0 0 8 30 1 5 0 0 8 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 0 0 0 0 1 1 1 34 0 1 1
                                    1 34 30 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 50 1 2 0 0 0 23 1 2 0 0 0 62 1 2 0
                                    0 0 83 1 0 0 0 1 0 0 0 1 1 0 0 83 1 0 0 0 1
                                    1 0 0 83 1 1 0 0 0 1 1 0 0 0 1 1 0 0 62 1 1
                                    0 0 55 1 2 0 0 83 62 1 2 0 0 83 55 1 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0
                                    54 55 1 3 0 0 0 8 62 1 2 0 0 0 8 1 2 0 0 0
                                    54 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 10
                                    0 0 1 2 1 0 36 36 1 2 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 5 0 0 50 1 2 0 0 0
                                    23 1 2 0 0 23 0 1 2 0 0 62 0 1 2 0 0 50 0 1
                                    2 0 0 0 0 1 2 0 0 83 0 1)))))
           '|lookupComplete|)) 
