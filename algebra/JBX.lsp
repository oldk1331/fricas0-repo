
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
              (|Union| 31 '#2="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 41)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|List| 32) (|List| $) (|BasicOperator|)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|Factored| $)
              (|SparseMultivariatePolynomial| 28 41) (|Polynomial| 24)
              (|Fraction| 38) (|Fraction| 62) (|Kernel| $) (|Union| 43 '#1#)
              (|Fraction| 60) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 28 $)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 50 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 52 '#2#)
              (|List| 59) (|Mapping| $ 31) (|List| 55) (|Mapping| $ $)
              (|List| 57) (|NonNegativeInteger|) (|Polynomial| 28)
              (|Union| 60 '#1#) (|SparseUnivariatePolynomial| $)
              (|Expression| 28) (|SegmentBinding| $)
              (|Record| (|:| |coef| 31) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 68 '"failed")
              (|Polynomial| $) (|Union| 41 '#1#) (|List| 41) (|List| 74)
              (|Equation| $) (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 54))
              (|Record| (|:| |Sys| 31) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|PositiveInteger|)
              (|Record| (|:| |DSys| 31) (|:| |JVars| 83)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassP| 134 |weberE| 141
              |variables| 147 |univariate| 152 |unitNormal| 158 |unitCanonical|
              163 |unit?| 168 |tower| 173 |tanh| 183 |tan| 188 |symbol| 193
              |summation| 198 |subtractIfCan| 210 |subst| 216 |struveL| 242
              |struveH| 248 |squareFreePart| 254 |squareFree| 259 |sqrt| 264
              |sortLD| 269 |solveFor| 274 |smaller?| 280 |sizeLess?| 286 |sinh|
              292 |sin| 297 |simplify| 302 |simpOne| 308 |simpMod| 313
              |setNotation| 326 |sech| 331 |sec| 336 |sample| 341 |rootsOf| 345
              |rootSum| 372 |rootOf| 379 |riemannZeta| 406 |retractIfCan| 411
              |retract| 451 |rem| 491 |reducedSystem| 497 |reduceMod| 508
              |reduce| 514 |recip| 519 |quo| 524 |product| 530 |principalIdeal|
              542 |prime?| 547 |polylog| 552 |polygamma| 558 |pi| 564
              |permutation| 568 |patternMatch| 574 |paren| 588 |orderDim| 598
              |order| 605 |opposite?| 610 |operators| 616 |operator| 621 |one?|
              626 |odd?| 631 |numerator| 636 |numer| 641 |numIndVar| 646
              |numDepVar| 650 |nthRoot| 654 |multiEuclidean| 660 |minPoly| 666
              |meixnerM| 671 |meijerG| 679 |map| 688 |mainKernel| 694
              |lommelS2| 699 |lommelS1| 706 |log| 713 |li| 718 |lerchPhi| 723
              |legendreQ| 730 |legendreP| 737 |leadingDer| 744 |lcmCoef| 749
              |lcm| 755 |latex| 766 |lambertW| 771 |laguerreL| 776 |kummerU|
              783 |kummerM| 790 |kernels| 797 |kernel| 807 |kelvinKer| 819
              |kelvinKei| 825 |kelvinBer| 831 |kelvinBei| 837 |jetVariables|
              843 |jacobiZeta| 848 |jacobiTheta| 854 |jacobiSn| 860 |jacobiP|
              866 |jacobiMatrix| 874 |jacobiDn| 885 |jacobiCn| 891 |isTimes|
              897 |isPower| 902 |isPlus| 907 |isMult| 912 |isExpt| 917 |is?|
              934 |inv| 946 |integral| 951 |hypergeometricF| 963 |hermiteH| 970
              |height| 976 |hashUpdate!| 981 |hash| 987 |hankelH2| 992
              |hankelH1| 998 |ground?| 1004 |ground| 1009 |getNotation| 1014
              |gcdPolynomial| 1018 |gcd| 1024 |function| 1035 |fresnelS| 1041
              |fresnelC| 1046 |freeOf?| 1051 |formalDiff2| 1069 |formalDiff|
              1083 |factorials| 1101 |factorial| 1112 |factor| 1117
              |extractSymbol| 1122 |extendedEuclidean| 1127 |exquo| 1140
              |expressIdealMember| 1146 |exp| 1152 |even?| 1157 |eval| 1162
              |euclideanSize| 1323 |erfi| 1328 |erf| 1333 |elt| 1338
              |ellipticPi| 1434 |ellipticK| 1441 |ellipticF| 1446 |ellipticE|
              1452 |divide| 1463 |distribute| 1469 |dimension| 1480 |dilog|
              1487 |digamma| 1492 |differentiate| 1497 |denominator| 1529
              |denom| 1534 |definingPolynomial| 1539 |dSubst| 1544 |csch| 1551
              |csc| 1556 |coth| 1561 |cot| 1566 |cosh| 1571 |cos| 1576
              |convert| 1581 |const?| 1601 |conjugate| 1606 |commutator| 1612
              |coerce| 1618 |class| 1688 |charthRoot| 1693 |charlierC| 1698
              |characteristic| 1705 |box| 1709 |binomial| 1719 |besselY| 1725
              |besselK| 1731 |besselJ| 1737 |besselI| 1743 |belong?| 1749
              |autoReduce| 1754 |atanh| 1759 |atan| 1764 |associates?| 1769
              |asinh| 1775 |asin| 1780 |asech| 1785 |asec| 1790 |applyQuote|
              1795 |annihilate?| 1831 |angerJ| 1837 |airyBiPrime| 1843 |airyBi|
              1848 |airyAiPrime| 1853 |airyAi| 1858 |acsch| 1863 |acsc| 1868
              |acoth| 1873 |acot| 1878 |acosh| 1883 |acos| 1888 |abs| 1893 ^
              1898 |Zero| 1928 X 1932 U 1941 |Si| 1950 |Shi| 1955 P 1960 |One|
              1982 |Gamma| 1986 |Ei| 1997 D 2002 |Ci| 2028 |Chi| 2033 |Beta|
              2038 = 2044 / 2050 - 2062 + 2073 * 2079)
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
                 (|RetractableTo| 43) (|RetractableTo| 60) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 31 70 1 2 0 31 62 8 1 1 0 31 62 1
                                    1 0 31 0 1 2 0 31 0 8 1 1 0 0 70 1 1 0 0 62
                                    1 2 0 0 62 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 29 0 1 2 1 40 0 41 1 1 0 86
                                    0 1 1 0 0 0 1 1 0 10 0 1 1 0 72 0 1 1 0 72
                                    31 1 1 0 0 0 1 1 0 0 0 1 1 0 79 31 1 2 0 0
                                    0 8 1 2 0 0 0 64 1 2 0 20 0 0 1 2 0 0 0 74
                                    1 3 0 0 0 72 31 1 2 0 0 0 73 1 3 0 0 0 6 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 36
                                    0 1 1 0 0 0 1 1 0 31 31 1 2 0 20 0 6 1 2 0
                                    10 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 2
                                    0 78 31 79 1 1 0 0 0 1 3 0 78 31 79 31 1 2
                                    0 31 31 31 1 1 0 84 8 1 1 0 0 0 1 1 0 0 0 1
                                    0 0 0 1 1 0 31 70 1 1 0 31 62 1 2 0 31 62 8
                                    1 1 0 31 0 1 2 0 31 0 8 1 3 0 0 0 62 8 1 1
                                    0 0 70 1 1 0 0 62 1 2 0 0 62 8 1 1 0 0 0 1
                                    2 0 0 0 8 1 1 0 0 0 1 1 2 23 0 1 1 1 42 0 1
                                    1 6 61 0 1 1 0 20 5 21 1 0 71 0 1 1 0 75 0
                                    1 1 0 76 0 1 1 0 85 0 1 1 2 24 0 1 1 1 43 0
                                    1 1 6 60 0 1 1 0 0 5 22 1 0 41 0 1 1 0 8 0
                                    1 1 0 28 0 1 1 0 6 0 1 2 0 0 0 0 1 2 6 46
                                    47 48 1 1 6 49 47 1 2 0 31 31 31 1 1 0 0 0
                                    1 1 0 20 0 1 2 0 0 0 0 1 2 0 0 0 8 1 2 0 0
                                    0 64 1 1 0 65 31 1 1 0 10 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3 11 44 0 34
                                    44 1 3 12 45 0 35 45 1 1 0 0 0 1 1 0 0 31 1
                                    3 0 59 31 79 59 1 1 0 59 0 1 2 0 10 0 0 1 1
                                    0 30 0 1 1 0 32 32 1 1 0 10 0 1 1 17 10 0 1
                                    1 0 0 0 1 1 6 37 0 1 0 0 81 1 0 0 81 1 2 0
                                    0 0 28 1 2 0 25 31 0 1 1 16 62 41 1 4 0 0 0
                                    0 0 0 1 5 17 0 31 31 31 31 0 1 2 0 0 57 41
                                    1 1 0 71 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 1 0 6 0 1 2 0 87 0 0 1 1 0
                                    0 31 1 2 0 0 0 0 1 1 0 88 0 1 1 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    72 0 1 1 0 72 31 1 2 0 0 32 0 1 2 0 0 32 31
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 4 0 0 0 0 0 0 1 1 0 79 31 1 2 0
                                    79 31 83 1 2 0 0 0 0 1 2 0 0 0 0 1 1 15 25
                                    0 1 1 6 53 0 1 1 14 25 0 1 1 14 27 0 1 2 6
                                    51 0 32 1 2 6 51 0 8 1 1 15 51 0 1 2 0 10 0
                                    8 1 2 0 10 0 32 1 1 0 0 0 1 2 0 0 0 64 1 2
                                    0 0 0 8 1 3 17 0 31 31 0 1 2 0 0 0 0 1 1 0
                                    59 0 1 2 0 90 90 0 1 1 0 89 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 10 0 1 1 0 28 0 1 0 0 8 1 2
                                    0 62 62 62 1 2 0 0 0 0 1 1 0 0 31 1 2 0 0 8
                                    31 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 8 1 2 0
                                    10 0 0 1 2 0 10 0 6 1 3 0 80 0 81 79 1 3 0
                                    82 31 81 79 1 2 0 31 31 81 1 2 0 0 0 81 1 2
                                    0 0 0 54 1 2 0 0 0 8 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 36 0 1 1 0 79 79 1 2 0 67 0 0 1 3 0 69
                                    0 0 0 1 2 0 20 0 0 1 2 0 25 31 0 1 1 0 0 0
                                    1 1 17 10 0 1 2 8 0 0 8 1 1 8 0 0 1 2 8 0 0
                                    29 1 4 8 0 0 30 31 8 1 4 8 0 0 32 0 8 1 4 6
                                    0 0 29 54 56 1 4 6 0 0 29 54 58 1 4 6 0 0 8
                                    59 55 1 4 6 0 0 8 59 57 1 3 0 0 0 72 31 1 3
                                    0 0 0 41 0 1 2 0 0 0 73 1 3 0 0 0 0 0 1 2 0
                                    0 0 74 1 3 0 0 0 31 31 1 3 0 0 0 29 58 1 3
                                    0 0 0 8 55 1 3 0 0 0 29 56 1 3 0 0 0 8 57 1
                                    3 0 0 0 30 56 1 3 0 0 0 30 58 1 3 0 0 0 32
                                    55 1 3 0 0 0 32 57 1 1 0 59 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 32 0 0 1 2 0 0 32 0 1 4 0 0
                                    32 0 0 0 1 6 0 0 32 0 0 0 0 0 1 5 0 0 32 0
                                    0 0 0 1 7 0 0 32 0 0 0 0 0 0 1 9 0 0 32 0 0
                                    0 0 0 0 0 0 1 8 0 0 32 0 0 0 0 0 0 0 1 10 0
                                    0 32 0 0 0 0 0 0 0 0 0 1 2 0 0 32 31 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 66 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 3 0 59 31 79 59 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 6 1 3 0 0 0 29 54 1 3 0 0 0 8 59 1 2 0
                                    0 0 8 1 2 0 0 0 29 1 1 0 0 0 1 1 1 37 0 1 1
                                    16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 8
                                    33 0 1 1 9 34 0 1 1 10 35 0 1 1 1 0 36 1 1
                                    0 10 0 1 2 7 0 0 0 1 2 7 0 0 0 1 1 1 0 38 1
                                    1 1 0 39 1 1 1 0 43 1 1 6 0 37 1 1 6 0 60 1
                                    1 0 63 0 1 1 0 0 63 1 1 0 0 24 1 1 0 0 41 1
                                    1 0 0 8 1 1 0 0 6 13 1 0 0 0 1 1 0 0 28 1 1
                                    0 91 0 1 1 0 59 0 1 1 4 20 0 1 3 0 0 0 0 0
                                    1 0 0 59 1 1 0 0 0 1 1 0 0 31 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 1 0 10 32 1 1 0 31 31 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 3 0 0 8 0 0 1 2 0 0 8 0 1 4 0
                                    0 8 0 0 0 1 2 0 0 8 31 1 5 0 0 8 0 0 0 0 1
                                    2 0 10 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 28 1 2 0 0 0 24 1 2
                                    0 0 0 59 1 2 0 0 0 81 1 0 0 0 1 0 0 0 1 1 0
                                    0 81 1 0 0 0 1 1 0 0 81 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 81 59 1 1 0 0 59 1 1 0 0 54 1 2 0 0
                                    81 54 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 8 59 1 3 0 0 0 29 54 1 2 0 0 0
                                    29 1 2 0 0 0 8 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 1 0 37 37 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 0
                                    28 1 2 0 0 0 24 1 2 0 0 24 0 1 2 0 0 0 0 1
                                    2 0 0 28 0 1 2 0 0 59 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
