
(/VERSIONCHECK 2) 

(DEFUN |JBX;coerce;JB$;1| (|jv| $)
  (COND
   ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
    (|error| "Only functions of independent variables allowed"))
   ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(DEFUN |JBX;retractIfCan;JbeU;2| (|p| $)
  (PROG (#1=#:G122 |jv| #2=#:G121)
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

(DEFUN |JetBundleXExpression| (#1=#:G186)
  (PROG ()
    (RETURN
     (PROG (#2=#:G187)
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
  (PROG (|pv$| #1=#:G184 #2=#:G185 $ |dv$| DV$1)
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
              (|Union| 32 '#2="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 41)) (|Union| 26 '#2#)
              (|Integer|) (|List| 8) (|BasicOperator|) (|List| 30) (|List| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 28) (|Factored| $)
              (|SparseMultivariatePolynomial| 28 41) (|Polynomial| 24)
              (|Fraction| 38) (|Fraction| 62) (|Kernel| $) (|Union| 43 '#1#)
              (|Fraction| 61) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 28 $) (|Matrix| 28) (|Matrix| $)
              (|Record| (|:| |mat| 46) (|:| |vec| (|Vector| 28))) (|Vector| $)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 50 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 52 '#2#)
              (|List| 57) (|Mapping| $ $) (|List| 55) (|NonNegativeInteger|)
              (|Mapping| $ 32) (|List| 58) (|Union| 61 '#1#) (|Polynomial| 28)
              (|SparseUnivariatePolynomial| $) (|Expression| 28)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 68 '"failed")
              (|Polynomial| $) (|Union| 41 '#1#) (|List| 41) (|Equation| $)
              (|List| 73) (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 54))
              (|Record| (|:| |Sys| 32) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DSys| 32) (|:| |JVars| 83)) (|PositiveInteger|)
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
              |order| 600 |opposite?| 605 |operators| 611 |operator| 616 |one?|
              621 |odd?| 626 |numerator| 631 |numer| 636 |numIndVar| 641
              |numDepVar| 645 |nthRoot| 649 |multiEuclidean| 655 |minPoly| 661
              |meijerG| 666 |map| 675 |mainKernel| 681 |lommelS2| 686
              |lommelS1| 693 |log| 700 |li| 705 |lerchPhi| 710 |legendreQ| 717
              |legendreP| 724 |leadingDer| 731 |lcmCoef| 736 |lcm| 742 |latex|
              753 |lambertW| 758 |kummerU| 763 |kummerM| 770 |kernels| 777
              |kernel| 782 |kelvinKer| 794 |kelvinKei| 800 |kelvinBer| 806
              |kelvinBei| 812 |jetVariables| 818 |jacobiZeta| 823 |jacobiTheta|
              829 |jacobiSn| 835 |jacobiMatrix| 841 |jacobiDn| 852 |jacobiCn|
              858 |isTimes| 864 |isPower| 869 |isPlus| 874 |isMult| 879
              |isExpt| 884 |is?| 901 |inv| 913 |integral| 918 |hypergeometricF|
              930 |height| 937 |hashUpdate!| 942 |hash| 948 |hankelH2| 953
              |hankelH1| 959 |ground?| 965 |ground| 970 |getNotation| 975
              |gcdPolynomial| 979 |gcd| 985 |function| 996 |fresnelS| 1002
              |fresnelC| 1007 |freeOf?| 1012 |formalDiff2| 1030 |formalDiff|
              1044 |factorials| 1062 |factorial| 1073 |factor| 1078
              |extractSymbol| 1083 |extendedEuclidean| 1088 |exquo| 1101
              |expressIdealMember| 1107 |exp| 1113 |even?| 1118 |eval| 1123
              |euclideanSize| 1284 |erfi| 1289 |erf| 1294 |elt| 1299
              |ellipticPi| 1395 |ellipticK| 1402 |ellipticF| 1407 |ellipticE|
              1413 |divide| 1424 |distribute| 1430 |dimension| 1441 |dilog|
              1448 |digamma| 1453 |differentiate| 1458 |denominator| 1490
              |denom| 1495 |definingPolynomial| 1500 |dSubst| 1505 |csch| 1512
              |csc| 1517 |coth| 1522 |cot| 1527 |cosh| 1532 |cos| 1537
              |convert| 1542 |const?| 1562 |conjugate| 1567 |commutator| 1573
              |coerce| 1579 |class| 1649 |charthRoot| 1654 |characteristic|
              1659 |box| 1663 |binomial| 1673 |besselY| 1679 |besselK| 1685
              |besselJ| 1691 |besselI| 1697 |belong?| 1703 |autoReduce| 1708
              |atanh| 1713 |atan| 1718 |associates?| 1723 |asinh| 1729 |asin|
              1734 |asech| 1739 |asec| 1744 |applyQuote| 1749 |annihilate?|
              1785 |angerJ| 1791 |airyBiPrime| 1797 |airyBi| 1802 |airyAiPrime|
              1807 |airyAi| 1812 |acsch| 1817 |acsc| 1822 |acoth| 1827 |acot|
              1832 |acosh| 1837 |acos| 1842 |abs| 1847 ^ 1852 |Zero| 1882 X
              1886 U 1895 |Si| 1904 |Shi| 1909 P 1914 |One| 1936 |Gamma| 1940
              |Ei| 1951 D 1956 |Ci| 1982 |Chi| 1987 |Beta| 1992 = 1998 / 2004 -
              2016 + 2027 * 2033)
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
                 (|RetractableTo| 43) (|RetractableTo| 61) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 32 70 1 2 0 32 62 8 1 1 0 32 62 1
                                    1 0 32 0 1 2 0 32 0 8 1 1 0 0 70 1 2 0 0 62
                                    8 1 1 0 0 62 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 29 0 1 2 1 40 0 41 1 1 0 86
                                    0 1 1 0 0 0 1 1 0 10 0 1 1 0 72 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 79 32 1 2 0 0 0 8 1 2 0 0 0
                                    64 1 2 0 20 0 0 1 2 0 0 0 73 1 3 0 0 0 72
                                    32 1 2 0 0 0 74 1 3 0 0 0 6 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 36 0 1 1 0 0 0 1
                                    1 0 32 32 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0
                                    10 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 78 32 79 1
                                    1 0 0 0 1 2 0 32 32 32 1 3 0 78 32 79 32 1
                                    1 0 84 8 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0
                                    32 70 1 2 0 32 62 8 1 1 0 32 62 1 1 0 32 0
                                    1 2 0 32 0 8 1 3 0 0 0 62 8 1 1 0 0 70 1 2
                                    0 0 62 8 1 1 0 0 62 1 1 0 0 0 1 2 0 0 0 8 1
                                    1 0 0 0 1 1 2 23 0 1 1 1 42 0 1 1 6 60 0 1
                                    1 0 20 5 21 1 0 71 0 1 1 0 75 0 1 1 0 76 0
                                    1 1 0 85 0 1 1 2 24 0 1 1 1 43 0 1 1 6 61 0
                                    1 1 0 0 5 22 1 0 41 0 1 1 0 8 0 1 1 0 28 0
                                    1 1 0 6 0 1 2 0 0 0 0 1 1 6 46 47 1 2 6 48
                                    47 49 1 2 0 32 32 32 1 1 0 0 0 1 1 0 20 0 1
                                    2 0 0 0 0 1 2 0 0 0 8 1 2 0 0 0 64 1 1 0 65
                                    32 1 1 0 10 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0
                                    0 1 2 0 0 0 0 1 3 11 44 0 34 44 1 3 12 45 0
                                    35 45 1 1 0 0 0 1 1 0 0 32 1 3 0 57 32 79
                                    57 1 1 0 57 0 1 2 0 10 0 0 1 1 0 31 0 1 1 0
                                    30 30 1 1 0 10 0 1 1 17 10 0 1 1 0 0 0 1 1
                                    6 37 0 1 0 0 81 1 0 0 81 1 2 0 0 0 28 1 2 0
                                    25 32 0 1 1 16 62 41 1 5 17 0 32 32 32 32 0
                                    1 2 0 0 55 41 1 1 0 71 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0
                                    87 0 0 1 2 0 0 0 0 1 1 0 0 32 1 1 0 88 0 1
                                    1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    72 0 1 2 0 0 30 0 1 2 0 0 30 32 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    14 0 15 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 79 32 1 2 0 79 32 83 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 1 15 25 0 1 1 6 53 0 1 1 14 25 0 1
                                    1 14 27 0 1 2 6 51 0 30 1 2 6 51 0 8 1 1 15
                                    51 0 1 2 0 10 0 30 1 2 0 10 0 8 1 1 0 0 0 1
                                    2 0 0 0 8 1 2 0 0 0 64 1 3 17 0 32 32 0 1 1
                                    0 57 0 1 2 0 90 90 0 1 1 0 89 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 0 10 0 1 1 0 28 0 1 0 0 8 1
                                    2 0 62 62 62 1 1 0 0 32 1 2 0 0 0 0 1 2 0 0
                                    8 32 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 2 0
                                    10 0 8 1 2 0 10 0 6 1 3 0 80 32 81 79 1 3 0
                                    82 0 81 79 1 2 0 0 0 54 1 2 0 32 32 81 1 2
                                    0 0 0 81 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1
                                    1 0 36 0 1 1 0 79 79 1 2 0 67 0 0 1 3 0 69
                                    0 0 0 1 2 0 20 0 0 1 2 0 25 32 0 1 1 0 0 0
                                    1 1 17 10 0 1 2 8 0 0 8 1 1 8 0 0 1 2 8 0 0
                                    29 1 4 8 0 0 30 0 8 1 4 8 0 0 31 32 8 1 4 6
                                    0 0 29 54 56 1 4 6 0 0 8 57 58 1 4 6 0 0 29
                                    54 59 1 4 6 0 0 8 57 55 1 3 0 0 0 41 0 1 3
                                    0 0 0 72 32 1 2 0 0 0 73 1 2 0 0 0 74 1 3 0
                                    0 0 0 0 1 3 0 0 0 32 32 1 3 0 0 0 29 59 1 3
                                    0 0 0 29 56 1 3 0 0 0 8 55 1 3 0 0 0 8 58 1
                                    3 0 0 0 31 56 1 3 0 0 0 30 58 1 3 0 0 0 31
                                    59 1 3 0 0 0 30 55 1 1 0 57 0 1 1 0 0 0 1 1
                                    0 0 0 1 2 0 0 30 0 1 3 0 0 30 0 0 1 5 0 0
                                    30 0 0 0 0 1 4 0 0 30 0 0 0 1 6 0 0 30 0 0
                                    0 0 0 1 8 0 0 30 0 0 0 0 0 0 0 1 7 0 0 30 0
                                    0 0 0 0 0 1 9 0 0 30 0 0 0 0 0 0 0 0 1 2 0
                                    0 30 32 1 10 0 0 30 0 0 0 0 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 66 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 3 0 57 32 79 57 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 6 1 3 0 0 0 29 54 1 3 0 0 0 8 57 1 2 0
                                    0 0 8 1 2 0 0 0 29 1 1 0 0 0 1 1 1 37 0 1 1
                                    16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 8
                                    33 0 1 1 9 34 0 1 1 10 35 0 1 1 1 0 36 1 1
                                    0 10 0 1 2 7 0 0 0 1 2 7 0 0 0 1 1 1 0 38 1
                                    1 1 0 39 1 1 1 0 43 1 1 6 0 37 1 1 6 0 61 1
                                    1 0 63 0 1 1 0 0 63 1 1 0 0 24 1 1 0 0 41 1
                                    1 0 0 8 1 1 0 0 0 1 1 0 0 6 13 1 0 0 28 1 1
                                    0 91 0 1 1 0 57 0 1 1 4 20 0 1 0 0 57 1 1 0
                                    0 32 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 30
                                    1 1 0 32 32 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    3 0 0 8 0 0 1 2 0 0 8 0 1 4 0 0 8 0 0 0 1 2
                                    0 0 8 32 1 5 0 0 8 0 0 0 0 1 2 0 10 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 28 1 2 0 0 0 24 1 2 0 0 0 57 1 2 0
                                    0 0 81 1 0 0 0 1 0 0 0 1 1 0 0 81 1 0 0 0 1
                                    1 0 0 81 1 1 0 0 0 1 1 0 0 0 1 1 0 0 57 1 1
                                    0 0 54 1 2 0 0 81 57 1 2 0 0 81 54 1 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 8
                                    57 1 3 0 0 0 29 54 1 2 0 0 0 29 1 2 0 0 0 8
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 10 0
                                    0 1 2 1 0 37 37 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 3 0 0 28 1 2 0 0 24 0
                                    1 2 0 0 0 24 1 2 0 0 0 0 1 2 0 0 28 0 1 2 0
                                    0 57 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
