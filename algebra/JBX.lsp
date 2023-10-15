
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
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
              (|Union| 32 '#2="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 42)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|BasicOperator|) (|List| 30) (|List| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|List| 42)
              (|Factored| $) (|SparseMultivariatePolynomial| 28 42)
              (|Polynomial| 24) (|Fraction| 39) (|Fraction| 63) (|Kernel| $)
              (|Union| 44 '#1#) (|Fraction| 61)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 28 $)
              (|Matrix| 28) (|Matrix| $)
              (|Record| (|:| |mat| 47) (|:| |vec| (|Vector| 28))) (|Vector| $)
              (|Record| (|:| |var| 42) (|:| |exponent| 28)) (|Union| 51 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 53 '#2#)
              (|List| 60) (|Mapping| $ 32) (|List| 56) (|Mapping| $ $)
              (|List| 58) (|NonNegativeInteger|) (|Polynomial| 28)
              (|Union| 61 '#1#) (|SparseUnivariatePolynomial| $)
              (|Expression| 28) (|SegmentBinding| $)
              (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 69 '"failed")
              (|Polynomial| $) (|Union| 42 '#1#) (|Equation| $) (|List| 73)
              (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 55))
              (|Record| (|:| |Sys| 32) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|PositiveInteger|)
              (|Record| (|:| |DSys| 32) (|:| |JVars| 83)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassP| 134 |weberE| 141
              |variables| 147 |univariate| 157 |unitNormal| 163 |unitCanonical|
              168 |unit?| 173 |tower| 178 |tanh| 188 |tan| 193 |symbol| 198
              |summation| 203 |subtractIfCan| 215 |subst| 221 |struveL| 247
              |struveH| 253 |squareFreePart| 259 |squareFree| 264 |sqrt| 269
              |sortLD| 274 |solveFor| 279 |smaller?| 285 |sizeLess?| 291 |sinh|
              297 |sin| 302 |simplify| 307 |simpOne| 313 |simpMod| 318
              |setNotation| 331 |sech| 336 |sec| 341 |sample| 346 |rootsOf| 350
              |rootSum| 377 |rootOf| 384 |riemannZeta| 411 |retractIfCan| 416
              |retract| 456 |rem| 496 |reducedSystem| 502 |reduceMod| 513
              |reduce| 519 |recip| 524 |quo| 529 |product| 535 |principalIdeal|
              547 |prime?| 552 |polylog| 557 |polygamma| 563 |pi| 569
              |permutation| 573 |patternMatch| 579 |paren| 593 |orderDim| 603
              |order| 610 |opposite?| 615 |operators| 621 |operator| 626 |one?|
              631 |odd?| 636 |numerator| 641 |numer| 646 |numIndVar| 651
              |numDepVar| 655 |nthRoot| 659 |multiEuclidean| 665 |minPoly| 671
              |meixnerM| 676 |meijerG| 684 |map| 693 |mainKernel| 699
              |lommelS2| 704 |lommelS1| 711 |log| 718 |li| 723 |lerchPhi| 728
              |legendreQ| 735 |legendreP| 742 |leadingDer| 749 |lcmCoef| 754
              |lcm| 760 |latex| 771 |lambertW| 776 |laguerreL| 781 |kummerU|
              788 |kummerM| 795 |kernels| 802 |kernel| 812 |kelvinKer| 824
              |kelvinKei| 830 |kelvinBer| 836 |kelvinBei| 842 |jetVariables|
              848 |jacobiZeta| 853 |jacobiTheta| 859 |jacobiSn| 865 |jacobiP|
              871 |jacobiMatrix| 879 |jacobiDn| 890 |jacobiCn| 896 |isTimes|
              902 |isPower| 907 |isPlus| 912 |isMult| 917 |isExpt| 922 |is?|
              939 |inv| 951 |integral| 956 |hypergeometricF| 968 |hermiteH| 975
              |height| 981 |hashUpdate!| 986 |hash| 992 |hankelH2| 997
              |hankelH1| 1003 |ground?| 1009 |ground| 1014 |getNotation| 1019
              |gcdPolynomial| 1023 |gcd| 1029 |function| 1040 |fresnelS| 1046
              |fresnelC| 1051 |freeOf?| 1056 |formalDiff2| 1074 |formalDiff|
              1088 |factorials| 1106 |factorial| 1117 |factor| 1122
              |extractSymbol| 1127 |extendedEuclidean| 1132 |exquo| 1145
              |expressIdealMember| 1151 |exp| 1157 |even?| 1162 |eval| 1167
              |euclideanSize| 1328 |erfi| 1333 |erf| 1338 |elt| 1343
              |ellipticPi| 1439 |ellipticK| 1446 |ellipticF| 1451 |ellipticE|
              1457 |divide| 1468 |distribute| 1474 |dimension| 1485 |dilog|
              1492 |digamma| 1497 |differentiate| 1502 |denominator| 1534
              |denom| 1539 |definingPolynomial| 1544 |dSubst| 1549 |csch| 1556
              |csc| 1561 |coth| 1566 |cot| 1571 |cosh| 1576 |cos| 1581
              |convert| 1586 |const?| 1606 |conjugate| 1611 |commutator| 1617
              |coerce| 1623 |class| 1693 |charthRoot| 1698 |charlierC| 1703
              |characteristic| 1710 |box| 1714 |binomial| 1724 |besselY| 1730
              |besselK| 1736 |besselJ| 1742 |besselI| 1748 |belong?| 1754
              |autoReduce| 1759 |atanh| 1764 |atan| 1769 |associates?| 1774
              |asinh| 1780 |asin| 1785 |asech| 1790 |asec| 1795 |applyQuote|
              1800 |annihilate?| 1836 |angerJ| 1842 |algtower| 1848
              |airyBiPrime| 1858 |airyBi| 1863 |airyAiPrime| 1868 |airyAi| 1873
              |acsch| 1878 |acsc| 1883 |acoth| 1888 |acot| 1893 |acosh| 1898
              |acos| 1903 |abs| 1908 ^ 1913 |Zero| 1943 X 1947 U 1956 |Si| 1965
              |Shi| 1970 P 1975 |One| 1997 |Gamma| 2001 |Ei| 2012 D 2017 |Ci|
              2043 |Chi| 2048 |Beta| 2053 = 2059 / 2065 - 2077 + 2088 * 2094)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3
                                  4 5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0
                                  0 0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |Algebra&| |FullyLinearlyExplicitRingOver&| |Module&| NIL
                |PartialDifferentialRing&| |EntireRing&| |Module&| |Module&|
                NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL NIL
                |AbelianGroup&| NIL NIL |Group&| NIL |ExpressionSpace&|
                |AbelianMonoid&| |Monoid&| NIL NIL NIL |SemiGroup&|
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
                 (|JetBundleFunctionCategory| 6) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 24) (|LeftOreRing|)
                 (|Algebra| $$) (|Algebra| 28)
                 (|FullyLinearlyExplicitRingOver| 28) (|Module| 24)
                 (|CommutativeRing|) (|PartialDifferentialRing| 8)
                 (|EntireRing|) (|Module| $$) (|Module| 28)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 28) (|BiModule| 24 24)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 28 28)
                 (|RightModule| 24) (|LeftModule| 24) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|LeftModule| 28) (|RightModule| 28)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|Group|) (|FullyPatternMatchable| 28) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|SemiGroup|)
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
                 (|RetractableTo| 44) (|RetractableTo| 61) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 32 63 1 1 0 32 71 1 2 0 32 63 8 1
                                    1 0 32 0 1 2 0 32 0 8 1 1 0 0 63 1 1 0 0 71
                                    1 2 0 0 63 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 29 32 1 1 0 29 0 1 2 1 41 0
                                    42 1 1 0 86 0 1 1 0 0 0 1 1 0 10 0 1 1 0 36
                                    0 1 1 0 36 32 1 1 0 0 0 1 1 0 0 0 1 1 0 79
                                    32 1 2 0 0 0 8 1 2 0 0 0 65 1 2 0 20 0 0 1
                                    2 0 0 0 73 1 3 0 0 0 36 32 1 2 0 0 0 74 1 3
                                    0 0 0 6 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 1 0 37 0 1 1 0 0 0 1 1 0 32 32 1 2 0 20 0
                                    6 1 2 0 10 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 78 32 79 1 1 0 0 0 1 3 0 78 32 79
                                    32 1 2 0 32 32 32 1 1 0 84 8 1 1 0 0 0 1 1
                                    0 0 0 1 0 0 0 1 1 0 32 63 1 1 0 32 71 1 2 0
                                    32 63 8 1 1 0 32 0 1 2 0 32 0 8 1 3 0 0 0
                                    63 8 1 1 0 0 63 1 1 0 0 71 1 2 0 0 63 8 1 1
                                    0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 2 23 0 1 1
                                    1 43 0 1 1 6 62 0 1 1 0 20 5 21 1 0 72 0 1
                                    1 0 75 0 1 1 0 76 0 1 1 0 85 0 1 1 2 24 0 1
                                    1 1 44 0 1 1 6 61 0 1 1 0 0 5 22 1 0 42 0 1
                                    1 0 8 0 1 1 0 28 0 1 1 0 6 0 1 2 0 0 0 0 1
                                    1 6 47 48 1 2 6 49 48 50 1 2 0 32 32 32 1 1
                                    0 0 0 1 1 0 20 0 1 2 0 0 0 0 1 2 0 0 0 65 1
                                    2 0 0 0 8 1 1 0 66 32 1 1 0 10 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3 11 45
                                    0 34 45 1 3 12 46 0 35 46 1 1 0 0 0 1 1 0 0
                                    32 1 3 0 60 32 79 60 1 1 0 60 0 1 2 0 10 0
                                    0 1 1 0 31 0 1 1 0 30 30 1 1 0 10 0 1 1 17
                                    10 0 1 1 0 0 0 1 1 6 38 0 1 0 0 81 1 0 0 81
                                    1 2 0 0 0 28 1 2 0 25 32 0 1 1 16 63 42 1 4
                                    0 0 0 0 0 0 1 5 17 0 32 32 32 32 0 1 2 0 0
                                    58 42 1 1 0 72 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0 87 0 0
                                    1 1 0 0 32 1 2 0 0 0 0 1 1 0 88 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 36 0 1 1 0 36 32 1 2 0 0 30 32 1 2 0 0
                                    30 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0 79 32 1
                                    2 0 79 32 83 1 2 0 0 0 0 1 2 0 0 0 0 1 1 15
                                    25 0 1 1 6 54 0 1 1 14 25 0 1 1 14 27 0 1 2
                                    6 52 0 8 1 2 6 52 0 30 1 1 15 52 0 1 2 0 10
                                    0 30 1 2 0 10 0 8 1 1 0 0 0 1 2 0 0 0 8 1 2
                                    0 0 0 65 1 3 17 0 32 32 0 1 2 0 0 0 0 1 1 0
                                    60 0 1 2 0 90 90 0 1 1 0 89 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 10 0 1 1 0 28 0 1 0 0 8 1 2
                                    0 63 63 63 1 2 0 0 0 0 1 1 0 0 32 1 2 0 0 8
                                    32 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 8 1 2 0
                                    10 0 0 1 2 0 10 0 6 1 3 0 80 0 81 79 1 3 0
                                    82 32 81 79 1 2 0 32 32 81 1 2 0 0 0 81 1 2
                                    0 0 0 55 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1
                                    1 0 37 0 1 1 0 79 79 1 2 0 68 0 0 1 3 0 70
                                    0 0 0 1 2 0 20 0 0 1 2 0 25 32 0 1 1 0 0 0
                                    1 1 17 10 0 1 2 8 0 0 8 1 2 8 0 0 29 1 4 8
                                    0 0 30 0 8 1 1 8 0 0 1 4 8 0 0 31 32 8 1 4
                                    6 0 0 29 55 57 1 4 6 0 0 29 55 59 1 4 6 0 0
                                    8 60 58 1 4 6 0 0 8 60 56 1 3 0 0 0 42 0 1
                                    3 0 0 0 36 32 1 2 0 0 0 73 1 2 0 0 0 74 1 3
                                    0 0 0 0 0 1 3 0 0 0 32 32 1 3 0 0 0 29 57 1
                                    3 0 0 0 29 59 1 3 0 0 0 8 56 1 3 0 0 0 31
                                    59 1 3 0 0 0 8 58 1 3 0 0 0 31 57 1 3 0 0 0
                                    30 58 1 3 0 0 0 30 56 1 1 0 60 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 0 30 0 1 3 0 0 30 0 0 1 5 0
                                    0 30 0 0 0 0 1 4 0 0 30 0 0 0 1 6 0 0 30 0
                                    0 0 0 0 1 8 0 0 30 0 0 0 0 0 0 0 1 7 0 0 30
                                    0 0 0 0 0 0 1 9 0 0 30 0 0 0 0 0 0 0 0 1 2
                                    0 0 30 32 1 10 0 0 30 0 0 0 0 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 2 0 67 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 3 0 60 32 79 60 1 1 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 6 1 3 0 0 0 29 55 1 3 0 0 0 8 60 1 2
                                    0 0 0 8 1 2 0 0 0 29 1 1 0 0 0 1 1 1 38 0 1
                                    1 16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    8 33 0 1 1 9 34 0 1 1 10 35 0 1 1 1 0 37 1
                                    1 0 10 0 1 2 7 0 0 0 1 2 7 0 0 0 1 1 1 0 39
                                    1 1 1 0 40 1 1 1 0 44 1 1 6 0 38 1 1 6 0 61
                                    1 1 0 64 0 1 1 0 0 64 1 1 0 0 24 1 1 0 0 42
                                    1 1 0 0 8 1 1 0 0 6 13 1 0 0 0 1 1 0 0 28 1
                                    1 0 91 0 1 1 0 60 0 1 1 4 20 0 1 3 0 0 0 0
                                    0 1 0 0 60 1 1 0 0 32 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 10 30 1 1 0 32 32 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 8 0 1 4 0 0 8 0 0 0 1
                                    3 0 0 8 0 0 1 5 0 0 8 0 0 0 0 1 2 0 0 8 32
                                    1 2 0 10 0 0 1 2 0 0 0 0 1 1 1 36 0 1 1 1
                                    36 32 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 28 1 2 0 0 0 24 1 2 0 0 0 60 1 2 0 0
                                    0 81 1 0 0 0 1 0 0 0 1 1 0 0 81 1 0 0 0 1 1
                                    0 0 81 1 1 0 0 0 1 1 0 0 0 1 2 0 0 81 60 1
                                    1 0 0 60 1 1 0 0 55 1 2 0 0 81 55 1 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 8
                                    60 1 3 0 0 0 29 55 1 2 0 0 0 29 1 2 0 0 0 8
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 10 0
                                    0 1 2 1 0 38 38 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 3 0 0 28 1 2 0 0 0 24
                                    1 2 0 0 24 0 1 2 0 0 0 0 1 2 0 0 28 0 1 2 0
                                    0 60 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
