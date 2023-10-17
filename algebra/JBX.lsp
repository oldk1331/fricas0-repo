
(SDEFUN |JBX;coerce;JB%;1| ((|jv| (JB)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT % 9)) '|Indep| (QREFELT % 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT % 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG ((#1=#:G123 NIL) (|jv| NIL) (#2=#:G122 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT % 16)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |jv| NIL)
                                  (LETT #1# (SPADCALL |p| (QREFELT % 15))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |jv| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT % 9))
                                                  '|Indep|)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            'T (QREFELT % 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe%;3| ((|p| (|JetBundleExpression| JB)) (% (%)))
        (SPROG ((|px| (|Union| % "failed")))
               (SEQ (LETT |px| (SPADCALL |p| (QREFELT % 21)))
                    (EXIT
                     (COND
                      ((QEQCAR |px| 1)
                       (|error|
                        "Only functions of independent variables allowed"))
                      ('T (QCDR |px|))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G189)
  (SPROG NIL
         (PROG (#2=#:G190)
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
  (SPROG ((|pv$| NIL) (#1=#:G188 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleXExpression| DV$1))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 32768))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 65536))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|JetBundleExpression| |#1|))
          %))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB%;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| % '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe%;3| (|Fraction| 51)
              (|Union| 23 '#1="failed") (|Union| 29 '#2="failed")
              (|Record| (|:| |coef| 51) (|:| |var| 39)) (|Union| 26 '#2#)
              (|List| 30) (|List| %) (|BasicOperator|) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 51) (|List| 39) (|Factored| %)
              (|SparseMultivariatePolynomial| 51 39) (|Polynomial| 23)
              (|Fraction| 65) (|Kernel| %) (|Fraction| 37) (|Fraction| 63)
              (|Union| 41 '#1#) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 51 %) (|Union| 46 '#1#) (|AlgebraicNumber|)
              (|Matrix| 51) (|Matrix| %)
              (|Record| (|:| |mat| 47) (|:| |vec| (|Vector| 51))) (|Vector| %)
              (|Integer|) (|Record| (|:| |var| 39) (|:| |exponent| 51))
              (|Union| 52 '#2#) (|Record| (|:| |val| %) (|:| |exponent| 51))
              (|Union| 54 '#2#) (|List| 8) (|List| 60) (|Mapping| % %)
              (|List| 58) (|NonNegativeInteger|) (|Mapping| % 29) (|List| 61)
              (|Polynomial| 51) (|Union| 63 '#1#)
              (|SparseUnivariatePolynomial| %) (|Expression| 51)
              (|SegmentBinding| %)
              (|Record| (|:| |coef| 29) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 71 '"failed")
              (|Polynomial| %) (|Union| 39 '#1#) (|Equation| %) (|List| 75)
              (|Union| 8 '#1#) (|Union| 51 '#1#)
              (|Union| '"failed" (|List| 57))
              (|Record| (|:| |Sys| 29) (|:| JM 81) (|:| |Depend| 79))
              (|SparseEchelonMatrix| 6 %)
              (|Record| (|:| |DSys| 29) (|:| |JVars| 85)) (|PositiveInteger|)
              (|Record| (|:| |DPhi| %) (|:| |JVars| 14)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|String|) (|OutputForm|))
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
              1037 |hankelH2| 1042 |hankelH1| 1048 |ground?| 1054 |ground| 1059
              |getNotation| 1064 |gcdPolynomial| 1068 |gcd| 1074 |function|
              1085 |fresnelS| 1091 |fresnelC| 1096 |freeOf?| 1101
              |fractionPart| 1119 |formalDiff2| 1124 |formalDiff| 1138 |floor|
              1156 |factorials| 1161 |factorial| 1172 |factor| 1177
              |extractSymbol| 1182 |extendedEuclidean| 1187 |exquo| 1200
              |expressIdealMember| 1206 |exp| 1212 |even?| 1217 |eval| 1222
              |euclideanSize| 1366 |erfi| 1371 |erf| 1376 |elt| 1381
              |ellipticPi| 1477 |ellipticK| 1484 |ellipticF| 1489 |ellipticE|
              1495 |divide| 1506 |distribute| 1512 |diracDelta| 1523
              |dimension| 1528 |dilog| 1535 |digamma| 1540 |differentiate| 1545
              |denominator| 1577 |denom| 1582 |definingPolynomial| 1587
              |dSubst| 1592 |csch| 1599 |csc| 1604 |coth| 1609 |cot| 1614
              |cosh| 1619 |cos| 1624 |convert| 1629 |const?| 1649 |conjugate|
              1654 |commutator| 1665 |coerce| 1671 |class| 1746 |charthRoot|
              1751 |charlierC| 1756 |characteristic| 1763 |ceiling| 1767 |box|
              1772 |binomial| 1777 |besselY| 1783 |besselK| 1789 |besselJ| 1795
              |besselI| 1801 |belong?| 1807 |autoReduce| 1812 |atanh| 1817
              |atan| 1822 |associator| 1827 |associates?| 1834 |asinh| 1840
              |asin| 1845 |asech| 1850 |asec| 1855 |applyQuote| 1860
              |antiCommutator| 1896 |annihilate?| 1902 |angerJ| 1908 |algtower|
              1914 |airyBiPrime| 1924 |airyBi| 1929 |airyAiPrime| 1934 |airyAi|
              1939 |acsch| 1944 |acsc| 1949 |acoth| 1954 |acot| 1959 |acosh|
              1964 |acos| 1969 |abs| 1974 ^ 1979 |Zero| 2009 X 2013 U 2022 |Si|
              2031 |Shi| 2036 P 2041 |One| 2063 |Gamma| 2067 |Ei| 2078 D 2083
              |Ci| 2109 |Chi| 2114 |Beta| 2119 = 2125 / 2131 - 2143 + 2154 *
              2160)
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
              '#((|AlgebraicallyClosedFunctionSpace| 51)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 51) (|Field|)
                 (|EuclideanDomain|) (|JetBundleBaseFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 23) (|PartialDifferentialRing| 8)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 51)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 23) (|Module| $$) (|SemiRng|)
                 (|Module| 51) (|FullyLinearlyExplicitOver| 51)
                 (|BiModule| 23 23) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 51 51) (|LinearlyExplicitOver| 51)
                 (|RightModule| 23) (|LeftModule| 23) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 51)
                 (|RightModule| 51) (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 51) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|FullyRetractableTo| 51)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 51)
                 (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 51)
                 (|Patternable| 51) (|RetractableTo| 8) (|Evalable| $$)
                 (|RetractableTo| (|Kernel| $$)) (|RetractableTo| 6)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 23)
                 (|RetractableTo| 41) (|RetractableTo| 63) (|RetractableTo| 46)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 51) (|Type|) (|CoercibleFrom| 8)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|CoercibleFrom| (|Kernel| $$)) (|CoercibleFrom| 6)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 91) (|CoercibleFrom| 23)
                 (|CoercibleFrom| 41) (|CoercibleFrom| 63) (|ConvertibleTo| 31)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33)
                 (|CoercibleFrom| 46))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 29 65 1 1 0 29 73 1 2 0 29 65 8 1
                                    1 0 29 0 1 2 0 29 0 8 1 1 0 0 65 1 1 0 0 73
                                    1 2 0 0 65 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 56 0 1 1 0 56
                                    29 1 2 1 38 0 39 1 1 0 0 0 1 1 0 88 0 1 1 0
                                    0 0 1 1 0 10 0 1 1 0 34 0 1 1 0 34 29 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 81 29 1 2 0 0 0 67 1 2
                                    0 0 0 8 1 2 0 20 0 0 1 2 0 0 0 76 1 2 0 0 0
                                    75 1 3 0 0 0 34 29 1 3 0 0 0 6 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 35 0 1 1 0 0
                                    0 1 1 0 29 29 1 2 0 20 0 6 1 2 0 10 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 80 29 81
                                    1 1 0 0 0 1 2 0 29 29 29 1 3 0 80 29 81 29
                                    1 1 0 0 0 1 1 0 86 8 1 1 0 0 0 1 1 0 0 0 1
                                    0 0 0 1 1 0 29 65 1 1 0 29 73 1 2 0 29 65 8
                                    1 1 0 29 0 1 2 0 29 0 8 1 3 0 0 0 65 8 1 1
                                    0 0 65 1 1 0 0 73 1 2 0 0 65 8 1 1 0 0 0 1
                                    2 0 0 0 8 1 1 0 20 0 1 2 0 0 0 60 1 2 0 0 0
                                    83 1 1 0 0 0 1 1 13 24 0 1 1 1 42 0 1 1 12
                                    45 0 1 1 5 64 0 1 1 0 20 5 21 1 0 74 0 1 1
                                    0 77 0 1 1 0 78 0 1 1 0 87 0 1 1 13 23 0 1
                                    1 1 41 0 1 1 12 46 0 1 1 5 63 0 1 1 0 0 5
                                    22 1 0 39 0 1 1 0 8 0 1 1 0 51 0 1 1 0 6 0
                                    1 2 0 0 0 0 1 1 5 47 48 1 2 5 49 48 50 1 2
                                    0 29 29 29 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0
                                    1 2 0 0 0 8 1 2 0 0 0 67 1 1 0 68 29 1 1 0
                                    10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0
                                    0 0 0 1 3 10 43 0 32 43 1 3 11 44 0 33 44 1
                                    1 0 0 0 1 3 0 60 29 81 60 1 1 0 60 0 1 2 0
                                    10 0 0 1 1 0 28 0 1 1 0 30 30 1 1 0 10 0 1
                                    1 17 10 0 1 1 0 0 0 1 1 5 36 0 1 0 0 83 1 0
                                    0 83 1 2 0 0 0 51 1 2 0 25 29 0 1 1 16 65
                                    39 1 4 0 0 0 0 0 0 1 5 17 0 29 29 29 29 0 1
                                    2 0 0 58 39 1 1 0 74 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 20 0 1 2 0
                                    0 0 60 1 2 0 0 0 83 1 1 0 6 0 1 2 0 89 0 0
                                    1 1 0 0 29 1 2 0 0 0 0 1 1 0 90 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 34 29 1 1 0 34 0 1 2 0 0 30 29 1 2 0 0
                                    30 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0 81 29 1
                                    2 0 81 29 85 1 2 0 0 0 0 1 2 0 0 0 0 1 1 15
                                    25 0 1 1 5 55 0 1 1 14 25 0 1 1 14 27 0 1 2
                                    5 53 0 30 1 2 5 53 0 8 1 1 15 53 0 1 2 0 10
                                    0 30 1 2 0 10 0 8 1 1 0 0 0 1 2 0 0 0 8 1 2
                                    0 0 0 67 1 3 17 0 29 29 0 1 2 0 0 0 0 1 1 0
                                    60 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 0 1 1
                                    0 51 0 1 0 0 8 1 2 0 65 65 65 1 2 0 0 0 0 1
                                    1 0 0 29 1 2 0 0 8 29 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 10 0 8 1 2 0 10 0 0 1 2 0 10 0 6 1 1 0
                                    0 0 1 3 0 82 29 83 81 1 3 0 84 0 83 81 1 2
                                    0 0 0 57 1 2 0 29 29 83 1 2 0 0 0 83 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 0
                                    35 0 1 1 0 81 81 1 2 0 70 0 0 1 3 0 72 0 0
                                    0 1 2 0 20 0 0 1 2 0 25 29 0 1 1 0 0 0 1 1
                                    17 10 0 1 4 7 0 0 28 29 8 1 4 7 0 0 30 0 8
                                    1 4 5 0 0 56 57 59 1 4 5 0 0 8 60 61 1 4 5
                                    0 0 56 57 62 1 4 5 0 0 8 60 58 1 3 0 0 0 39
                                    0 1 3 0 0 0 34 29 1 2 0 0 0 75 1 2 0 0 0 76
                                    1 3 0 0 0 0 0 1 3 0 0 0 29 29 1 3 0 0 0 56
                                    59 1 3 0 0 0 8 61 1 3 0 0 0 56 62 1 3 0 0 0
                                    8 58 1 3 0 0 0 28 62 1 3 0 0 0 28 59 1 3 0
                                    0 0 30 61 1 3 0 0 0 30 58 1 1 0 60 0 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 30 0 1 3 0 0 30 0 0 1
                                    5 0 0 30 0 0 0 0 1 4 0 0 30 0 0 0 1 6 0 0
                                    30 0 0 0 0 0 1 8 0 0 30 0 0 0 0 0 0 0 1 7 0
                                    0 30 0 0 0 0 0 0 1 10 0 0 30 0 0 0 0 0 0 0
                                    0 0 1 9 0 0 30 0 0 0 0 0 0 0 0 1 2 0 0 30
                                    29 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 69 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 3 0 60 29 81 60 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 6 1 3 0 0 0 56 57 1
                                    3 0 0 0 8 60 1 2 0 0 0 8 1 2 0 0 0 56 1 1 0
                                    0 0 1 1 1 36 0 1 1 16 0 0 1 3 0 0 0 6 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 7 31 0 1 1 8 32 0 1 1 9 33
                                    0 1 1 1 0 35 1 1 0 10 0 1 2 6 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 1 1 0 37 1 1 1 0 40 1 1 1 0
                                    41 1 1 12 0 46 1 1 5 0 36 1 1 5 0 63 1 1 0
                                    66 0 1 1 0 0 66 1 1 0 0 23 1 1 0 0 39 1 1 0
                                    0 8 1 1 0 0 6 13 1 0 0 0 1 1 0 0 51 1 1 0
                                    91 0 1 1 0 60 0 1 1 3 20 0 1 3 0 0 0 0 0 1
                                    0 0 60 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 10 30 1 1 0 29 29 1 1 0 0 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 8 0 1 3 0 0
                                    8 0 0 1 5 0 0 8 0 0 0 0 1 4 0 0 8 0 0 0 1 2
                                    0 0 8 29 1 2 0 0 0 0 1 2 0 10 0 0 1 2 0 0 0
                                    0 1 1 1 34 29 1 1 1 34 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 51 1 2 0 0 0 23 1
                                    2 0 0 0 60 1 2 0 0 0 83 1 0 0 0 1 0 0 0 1 1
                                    0 0 83 1 0 0 0 1 1 0 0 83 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 83 60 1 1 0 0 60 1 1 0 0 57 1 2 0
                                    0 83 57 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 3 0 0 0 8 60 1 3 0 0 0 56 57 1 2 0 0
                                    0 56 1 2 0 0 0 8 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 10 0 0 1 2 1 0 36 36 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 5 0
                                    0 51 1 2 0 0 0 23 1 2 0 0 23 0 1 2 0 0 60 0
                                    1 2 0 0 51 0 1 2 0 0 0 0 1 2 0 0 83 0
                                    1)))))
           '|lookupComplete|)) 
