
(/VERSIONCHECK 2) 

(DEFUN |JBX;coerce;JB$;1| (|jv| $)
  (COND
   ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
    (|error| "Only functions of independent variables allowed"))
   ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(DEFUN |JBX;retractIfCan;JbeU;2| (|p| $)
  (PROG (#1=#:G146 |jv| #2=#:G145)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (ELT $ 16)
                  (PROGN
                   (LETT #2# NIL . #3=(|JBX;retractIfCan;JbeU;2|))
                   (SEQ (LETT |jv| NIL . #3#)
                        (LETT #1# (SPADCALL |p| (QREFELT $ 15)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |jv| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (EQUAL (SPADCALL |jv| (QREFELT $ 9)) '|Indep|)
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  'T (QREFELT $ 19))
        (CONS 0 |p|))
       ('T (CONS 1 "failed"))))))) 

(DEFUN |JBX;retract;Jbe$;3| (|p| $)
  (PROG (|px|)
    (RETURN
     (SEQ (LETT |px| (SPADCALL |p| (QREFELT $ 21)) |JBX;retract;Jbe$;3|)
          (EXIT
           (COND
            ((QEQCAR |px| 1)
             (|error| "Only functions of independent variables allowed"))
            ('T (QCDR |px|)))))))) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G210)
  (PROG ()
    (RETURN
     (PROG (#2=#:G211)
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
              (HREM |$ConstructorCache| '|JetBundleXExpression|))))))))))) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (PROG (|pv$| #1=#:G208 #2=#:G209 $ |dv$| DV$1)
    (RETURN
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
                                           (|HasCategory| (|Integer|)
                                                          '(|Ring|)))
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
      $)))) 

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
              (|Record| (|:| |coef| 28) (|:| |var| 40)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|List| 32) (|List| $) (|BasicOperator|)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|Factored| $)
              (|SparseMultivariatePolynomial| 28 40) (|Polynomial| 24)
              (|Fraction| 62) (|Kernel| $) (|Fraction| 38) (|Fraction| 60)
              (|Union| 42 '#1#) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 28 $) (|Matrix| 28) (|Matrix| $)
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 28))) (|Vector| $)
              (|Record| (|:| |var| 40) (|:| |exponent| 28)) (|Union| 50 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 52 '#2#)
              (|List| 59) (|Mapping| $ 31) (|List| 55) (|Mapping| $ $)
              (|List| 57) (|NonNegativeInteger|) (|Polynomial| 28)
              (|Union| 60 '#1#) (|SparseUnivariatePolynomial| $)
              (|Expression| 28) (|SegmentBinding| $)
              (|Record| (|:| |coef| 31) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 68 '"failed")
              (|Polynomial| $) (|Union| 40 '#1#) (|List| 40) (|Equation| $)
              (|List| 73) (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 54))
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
              |weierstrassPPrime| 127 |weierstrassP| 134 |weberE| 141
              |variables| 147 |univariate| 152 |unitNormal| 158 |unitCanonical|
              163 |unit?| 168 |tower| 173 |tanh| 178 |tan| 183 |symbol| 188
              |summation| 193 |subtractIfCan| 205 |subst| 211 |struveL| 237
              |struveH| 243 |squareFreePart| 249 |squareFree| 254 |sqrt| 259
              |sortLD| 264 |solveFor| 269 |smaller?| 275 |sizeLess?| 281 |sinh|
              287 |sin| 292 |simplify| 297 |simpOne| 303 |simpMod| 308
              |setNotation| 321 |sech| 326 |sec| 331 |sample| 336 |rootsOf| 340
              |rootSum| 367 |rootOf| 374 |riemannZeta| 401 |retractIfCan| 406
              |retract| 446 |rem| 486 |reducedSystem| 492 |reduceMod| 503
              |reduce| 509 |recip| 514 |quo| 519 |product| 525 |principalIdeal|
              537 |prime?| 542 |polylog| 547 |polygamma| 553 |pi| 559
              |permutation| 563 |patternMatch| 569 |paren| 583 |orderDim| 593
              |order| 600 |operators| 605 |operator| 610 |one?| 615 |odd?| 620
              |numerator| 625 |numer| 630 |numIndVar| 635 |numDepVar| 639
              |nthRoot| 643 |multiEuclidean| 649 |minPoly| 655 |meijerG| 660
              |map| 669 |mainKernel| 675 |lommelS2| 680 |lommelS1| 687 |log|
              694 |li| 699 |lerchPhi| 704 |legendreQ| 711 |legendreP| 718
              |leadingDer| 725 |lcmCoef| 730 |lcm| 736 |latex| 747 |lambertW|
              752 |kummerU| 757 |kummerM| 764 |kernels| 771 |kernel| 776
              |kelvinKer| 788 |kelvinKei| 794 |kelvinBer| 800 |kelvinBei| 806
              |jetVariables| 812 |jacobiZeta| 817 |jacobiTheta| 823 |jacobiSn|
              829 |jacobiMatrix| 835 |jacobiDn| 846 |jacobiCn| 852 |isTimes|
              858 |isPower| 863 |isPlus| 868 |isMult| 873 |isExpt| 878 |is?|
              895 |inv| 907 |integral| 912 |hypergeometricF| 924 |height| 931
              |hashUpdate!| 936 |hash| 942 |hankelH2| 947 |hankelH1| 953
              |ground?| 959 |ground| 964 |getNotation| 969 |gcdPolynomial| 973
              |gcd| 979 |function| 990 |fresnelS| 996 |fresnelC| 1001 |freeOf?|
              1006 |formalDiff2| 1024 |formalDiff| 1038 |factorials| 1056
              |factorial| 1067 |factor| 1072 |extractSymbol| 1077
              |extendedEuclidean| 1082 |exquo| 1095 |expressIdealMember| 1101
              |exp| 1107 |even?| 1112 |eval| 1117 |euclideanSize| 1278 |erf|
              1283 |elt| 1288 |ellipticPi| 1384 |ellipticK| 1391 |ellipticF|
              1396 |ellipticE| 1402 |divide| 1413 |distribute| 1419 |dimension|
              1430 |dilog| 1437 |digamma| 1442 |differentiate| 1447
              |denominator| 1479 |denom| 1484 |definingPolynomial| 1489
              |dSubst| 1494 |csch| 1501 |csc| 1506 |coth| 1511 |cot| 1516
              |cosh| 1521 |cos| 1526 |convert| 1531 |const?| 1551 |conjugate|
              1556 |commutator| 1562 |coerce| 1568 |class| 1638 |charthRoot|
              1643 |characteristic| 1648 |box| 1652 |binomial| 1662 |besselY|
              1668 |besselK| 1674 |besselJ| 1680 |besselI| 1686 |belong?| 1692
              |autoReduce| 1697 |atanh| 1702 |atan| 1707 |associates?| 1712
              |asinh| 1718 |asin| 1723 |asech| 1728 |asec| 1733 |applyQuote|
              1738 |angerJ| 1774 |airyBiPrime| 1780 |airyBi| 1785 |airyAiPrime|
              1790 |airyAi| 1795 |acsch| 1800 |acsc| 1805 |acoth| 1810 |acot|
              1815 |acosh| 1820 |acos| 1825 |abs| 1830 ^ 1835 |Zero| 1865 X
              1869 U 1878 |Si| 1887 |Shi| 1892 P 1897 |One| 1919 |Gamma| 1923
              |Ei| 1934 D 1939 |Ci| 1965 |Chi| 1970 |Beta| 1975 = 1981 / 1987 -
              1999 + 2010 * 2016)
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
                NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL
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
                 (|RetractableTo| 42) (|RetractableTo| 60) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 31 70 1 2 0 31 62 8 1 1 0 31 62 1
                                    1 0 31 0 1 2 0 31 0 8 1 1 0 0 70 1 2 0 0 62
                                    8 1 1 0 0 62 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 29 0 1 2 1 39 0 40 1 1 0 86
                                    0 1 1 0 0 0 1 1 0 10 0 1 1 0 72 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 79 31 1 2 0 0 0 8 1 2 0 0 0
                                    64 1 2 0 20 0 0 1 2 0 0 0 74 1 2 0 0 0 73 1
                                    3 0 0 0 72 31 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 36 0 1 1 0 0 0 1 1
                                    0 31 31 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 78 31 79 1 1
                                    0 0 0 1 3 0 78 31 79 31 1 2 0 31 31 31 1 1
                                    0 84 8 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 31
                                    70 1 2 0 31 62 8 1 1 0 31 62 1 1 0 31 0 1 2
                                    0 31 0 8 1 3 0 0 0 62 8 1 1 0 0 70 1 2 0 0
                                    62 8 1 1 0 0 62 1 1 0 0 0 1 2 0 0 0 8 1 1 0
                                    0 0 1 1 2 23 0 1 1 1 43 0 1 1 6 61 0 1 1 0
                                    20 5 21 1 0 71 0 1 1 0 75 0 1 1 0 76 0 1 1
                                    0 85 0 1 1 2 24 0 1 1 1 42 0 1 1 6 60 0 1 1
                                    0 0 5 22 1 0 40 0 1 1 0 8 0 1 1 0 28 0 1 1
                                    0 6 0 1 2 0 0 0 0 1 1 6 46 47 1 2 6 48 47
                                    49 1 2 0 31 31 31 1 1 0 0 0 1 1 0 20 0 1 2
                                    0 0 0 0 1 2 0 0 0 8 1 2 0 0 0 64 1 1 0 65
                                    31 1 1 0 10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0
                                    0 1 2 0 0 0 0 1 3 11 44 0 34 44 1 3 12 45 0
                                    35 45 1 1 0 0 31 1 1 0 0 0 1 3 0 59 31 79
                                    59 1 1 0 59 0 1 1 0 30 0 1 1 0 32 32 1 1 0
                                    10 0 1 1 17 10 0 1 1 0 0 0 1 1 6 37 0 1 0 0
                                    81 1 0 0 81 1 2 0 0 0 28 1 2 0 25 31 0 1 1
                                    16 62 40 1 5 17 0 31 31 31 31 0 1 2 0 0 57
                                    40 1 1 0 71 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0 87 0 0 1 1
                                    0 0 31 1 2 0 0 0 0 1 1 0 88 0 1 1 0 0 0 1 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 72 0 1 2 0 0
                                    32 0 1 2 0 0 32 31 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 14 0 15 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 79 31 83
                                    1 1 0 79 31 1 2 0 0 0 0 1 2 0 0 0 0 1 1 15
                                    25 0 1 1 6 53 0 1 1 14 25 0 1 1 14 27 0 1 2
                                    6 51 0 8 1 2 6 51 0 32 1 1 15 51 0 1 2 0 10
                                    0 8 1 2 0 10 0 32 1 1 0 0 0 1 2 0 0 0 64 1
                                    2 0 0 0 8 1 3 17 0 31 31 0 1 1 0 59 0 1 2 0
                                    90 90 0 1 1 0 89 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 10 0 1 1 0 28 0 1 0 0 8 1 2 0 62 62
                                    62 1 2 0 0 0 0 1 1 0 0 31 1 2 0 0 8 31 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 2 0 10 0 8 1
                                    2 0 10 0 6 1 3 0 80 31 81 79 1 3 0 82 0 81
                                    79 1 2 0 31 31 81 1 2 0 0 0 54 1 2 0 0 0 81
                                    1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 0 36 0
                                    1 1 0 79 79 1 2 0 67 0 0 1 3 0 69 0 0 0 1 2
                                    0 20 0 0 1 2 0 25 31 0 1 1 0 0 0 1 1 17 10
                                    0 1 2 8 0 0 29 1 2 8 0 0 8 1 1 8 0 0 1 4 8
                                    0 0 30 31 8 1 4 8 0 0 32 0 8 1 4 6 0 0 29
                                    54 56 1 4 6 0 0 29 54 58 1 4 6 0 0 8 59 57
                                    1 4 6 0 0 8 59 55 1 3 0 0 0 40 0 1 3 0 0 0
                                    72 31 1 2 0 0 0 73 1 2 0 0 0 74 1 3 0 0 0 0
                                    0 1 3 0 0 0 31 31 1 3 0 0 0 29 58 1 3 0 0 0
                                    8 55 1 3 0 0 0 29 56 1 3 0 0 0 8 57 1 3 0 0
                                    0 30 56 1 3 0 0 0 30 58 1 3 0 0 0 32 55 1 3
                                    0 0 0 32 57 1 1 0 59 0 1 1 0 0 0 1 2 0 0 32
                                    0 1 4 0 0 32 0 0 0 1 3 0 0 32 0 0 1 5 0 0
                                    32 0 0 0 0 1 7 0 0 32 0 0 0 0 0 0 1 6 0 0
                                    32 0 0 0 0 0 1 8 0 0 32 0 0 0 0 0 0 0 1 10
                                    0 0 32 0 0 0 0 0 0 0 0 0 1 9 0 0 32 0 0 0 0
                                    0 0 0 0 1 2 0 0 32 31 1 3 0 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    66 0 0 1 1 0 0 0 1 2 0 0 0 0 1 3 0 59 31 79
                                    59 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 6 1 3 0 0
                                    0 29 54 1 2 0 0 0 29 1 3 0 0 0 8 59 1 2 0 0
                                    0 8 1 1 0 0 0 1 1 1 37 0 1 1 16 0 0 1 3 0 0
                                    0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 8 33 0 1 1 9 34 0
                                    1 1 10 35 0 1 1 1 0 36 1 1 0 10 0 1 2 7 0 0
                                    0 1 2 7 0 0 0 1 1 1 0 38 1 1 1 0 41 1 1 1 0
                                    42 1 1 6 0 37 1 1 6 0 60 1 1 0 63 0 1 1 0 0
                                    63 1 1 0 0 24 1 1 0 0 40 1 1 0 0 8 1 1 0 0
                                    6 13 1 0 0 0 1 1 0 0 28 1 1 0 91 0 1 1 0 59
                                    0 1 1 4 20 0 1 0 0 59 1 1 0 0 0 1 1 0 0 31
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 10 32 1 1 0 31 31 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 8 0 1 3 0
                                    0 8 0 0 1 5 0 0 8 0 0 0 0 1 4 0 0 8 0 0 0 1
                                    2 0 0 8 31 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 28 1 2 0 0 0 24 1 2
                                    0 0 0 59 1 2 0 0 0 81 1 0 0 0 1 0 0 0 1 1 0
                                    0 81 1 0 0 0 1 1 0 0 81 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 81 59 1 1 0 0 59 1 1 0 0 54 1 2 0 0
                                    81 54 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 29 54 1 3 0 0 0 8 59 1 2 0 0 0
                                    8 1 2 0 0 0 29 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 1 0 37 37 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 0
                                    28 1 2 0 0 24 0 1 2 0 0 0 24 1 2 0 0 0 0 1
                                    2 0 0 28 0 1 2 0 0 59 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
