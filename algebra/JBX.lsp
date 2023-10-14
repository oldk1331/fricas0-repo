
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
              (|Polynomial| $) (|Union| 40 '#1#) (|List| 40) (|List| 74)
              (|Equation| $) (|Union| 8 '#1#) (|Union| 28 '#1#)
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
              |rootOf| 367 |riemannZeta| 394 |retractIfCan| 399 |retract| 439
              |rem| 479 |reducedSystem| 485 |reduceMod| 496 |reduce| 502
              |recip| 507 |quo| 512 |product| 518 |principalIdeal| 530 |prime?|
              535 |polylog| 540 |polygamma| 546 |pi| 552 |permutation| 556
              |patternMatch| 562 |paren| 576 |orderDim| 586 |order| 593
              |operators| 598 |operator| 603 |one?| 608 |odd?| 613 |numerator|
              618 |numer| 623 |numIndVar| 628 |numDepVar| 632 |nthRoot| 636
              |multiEuclidean| 642 |minPoly| 648 |meijerG| 653 |map| 662
              |mainKernel| 668 |lommelS2| 673 |lommelS1| 680 |log| 687 |li| 692
              |lerchPhi| 697 |legendreQ| 704 |legendreP| 711 |leadingDer| 718
              |lcmCoef| 723 |lcm| 729 |latex| 740 |lambertW| 745 |kummerU| 750
              |kummerM| 757 |kernels| 764 |kernel| 769 |kelvinKer| 781
              |kelvinKei| 787 |kelvinBer| 793 |kelvinBei| 799 |jetVariables|
              805 |jacobiZeta| 810 |jacobiTheta| 816 |jacobiSn| 822
              |jacobiMatrix| 828 |jacobiDn| 839 |jacobiCn| 845 |isTimes| 851
              |isPower| 856 |isPlus| 861 |isMult| 866 |isExpt| 871 |is?| 888
              |inv| 900 |integral| 905 |hypergeometricF| 917 |height| 924
              |hashUpdate!| 929 |hash| 935 |hankelH2| 940 |hankelH1| 946
              |ground?| 952 |ground| 957 |getNotation| 962 |gcdPolynomial| 966
              |gcd| 972 |function| 983 |fresnelS| 989 |fresnelC| 994 |freeOf?|
              999 |formalDiff2| 1017 |formalDiff| 1031 |factorials| 1049
              |factorial| 1060 |factor| 1065 |extractSymbol| 1070
              |extendedEuclidean| 1075 |exquo| 1088 |expressIdealMember| 1094
              |exp| 1100 |even?| 1105 |eval| 1110 |euclideanSize| 1271 |erf|
              1276 |elt| 1281 |ellipticPi| 1377 |ellipticK| 1384 |ellipticF|
              1389 |ellipticE| 1395 |divide| 1406 |distribute| 1412 |dimension|
              1423 |dilog| 1430 |digamma| 1435 |differentiate| 1440
              |denominator| 1472 |denom| 1477 |definingPolynomial| 1482
              |dSubst| 1487 |csch| 1494 |csc| 1499 |coth| 1504 |cot| 1509
              |cosh| 1514 |cos| 1519 |convert| 1524 |const?| 1544 |conjugate|
              1549 |commutator| 1555 |coerce| 1561 |class| 1631 |charthRoot|
              1636 |characteristic| 1641 |box| 1645 |binomial| 1655 |besselY|
              1661 |besselK| 1667 |besselJ| 1673 |besselI| 1679 |belong?| 1685
              |autoReduce| 1690 |atanh| 1695 |atan| 1700 |associates?| 1705
              |asinh| 1711 |asin| 1716 |asech| 1721 |asec| 1726 |applyQuote|
              1731 |angerJ| 1767 |airyBiPrime| 1773 |airyBi| 1778 |airyAiPrime|
              1783 |airyAi| 1788 |acsch| 1793 |acsc| 1798 |acoth| 1803 |acot|
              1808 |acosh| 1813 |acos| 1818 |abs| 1823 ^ 1828 |Zero| 1858 X
              1862 U 1871 |Si| 1880 |Shi| 1885 P 1890 |One| 1912 |Gamma| 1916
              |Ei| 1927 D 1932 |Ci| 1958 |Chi| 1963 |Beta| 1968 = 1974 / 1980 -
              1992 + 2003 * 2009)
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
                                    64 1 2 0 20 0 0 1 2 0 0 0 74 1 3 0 0 0 72
                                    31 1 2 0 0 0 73 1 3 0 0 0 6 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 36 0 1 1 0 0 0 1
                                    1 0 31 31 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0
                                    10 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 78 31 79 1
                                    1 0 0 0 1 3 0 78 31 79 31 1 2 0 31 31 31 1
                                    1 0 84 8 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0
                                    31 70 1 2 0 31 62 8 1 1 0 31 62 1 1 0 31 0
                                    1 2 0 31 0 8 1 1 0 0 70 1 2 0 0 62 8 1 1 0
                                    0 62 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 2
                                    23 0 1 1 1 43 0 1 1 6 61 0 1 1 0 20 5 21 1
                                    0 71 0 1 1 0 75 0 1 1 0 76 0 1 1 0 85 0 1 1
                                    2 24 0 1 1 1 42 0 1 1 6 60 0 1 1 0 0 5 22 1
                                    0 40 0 1 1 0 8 0 1 1 0 28 0 1 1 0 6 0 1 2 0
                                    0 0 0 1 1 6 46 47 1 2 6 48 47 49 1 2 0 31
                                    31 31 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0 1 2
                                    0 0 0 8 1 2 0 0 0 64 1 1 0 65 31 1 1 0 10 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0
                                    1 3 11 44 0 34 44 1 3 12 45 0 35 45 1 1 0 0
                                    0 1 1 0 0 31 1 3 0 59 31 79 59 1 1 0 59 0 1
                                    1 0 30 0 1 1 0 32 32 1 1 0 10 0 1 1 17 10 0
                                    1 1 0 0 0 1 1 6 37 0 1 0 0 81 1 0 0 81 1 2
                                    0 0 0 28 1 2 0 25 31 0 1 1 16 62 40 1 5 17
                                    0 31 31 31 31 0 1 2 0 0 57 40 1 1 0 71 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 1 0 6 0 1 2 0 87 0 0 1 1 0 0 31 1 2 0 0 0
                                    0 1 1 0 88 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 72 0 1 2 0 0 32 0 1 2 0 0 32
                                    31 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 79 31 83 1 1 0 79 31 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 1 15 25 0 1 1 6 53 0
                                    1 1 14 25 0 1 1 14 27 0 1 2 6 51 0 8 1 2 6
                                    51 0 32 1 1 15 51 0 1 2 0 10 0 8 1 2 0 10 0
                                    32 1 1 0 0 0 1 2 0 0 0 64 1 2 0 0 0 8 1 3
                                    17 0 31 31 0 1 1 0 59 0 1 2 0 90 90 0 1 1 0
                                    89 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 0 1 1
                                    0 28 0 1 0 0 8 1 2 0 62 62 62 1 2 0 0 0 0 1
                                    1 0 0 31 1 2 0 0 8 31 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 10 0 0 1 2 0 10 0 8 1 2 0 10 0 6 1 3 0
                                    80 31 81 79 1 3 0 82 0 81 79 1 2 0 31 31 81
                                    1 2 0 0 0 54 1 2 0 0 0 81 1 1 0 0 0 1 2 0 0
                                    0 8 1 1 0 0 0 1 1 0 36 0 1 1 0 79 79 1 2 0
                                    67 0 0 1 3 0 69 0 0 0 1 2 0 20 0 0 1 2 0 25
                                    31 0 1 1 0 0 0 1 1 17 10 0 1 2 8 0 0 29 1 2
                                    8 0 0 8 1 1 8 0 0 1 4 8 0 0 30 31 8 1 4 8 0
                                    0 32 0 8 1 4 6 0 0 29 54 56 1 4 6 0 0 29 54
                                    58 1 4 6 0 0 8 59 57 1 4 6 0 0 8 59 55 1 3
                                    0 0 0 72 31 1 3 0 0 0 40 0 1 2 0 0 0 73 1 3
                                    0 0 0 0 0 1 2 0 0 0 74 1 3 0 0 0 31 31 1 3
                                    0 0 0 29 58 1 3 0 0 0 8 55 1 3 0 0 0 29 56
                                    1 3 0 0 0 8 57 1 3 0 0 0 30 56 1 3 0 0 0 30
                                    58 1 3 0 0 0 32 55 1 3 0 0 0 32 57 1 1 0 59
                                    0 1 1 0 0 0 1 3 0 0 32 0 0 1 2 0 0 32 0 1 5
                                    0 0 32 0 0 0 0 1 4 0 0 32 0 0 0 1 6 0 0 32
                                    0 0 0 0 0 1 8 0 0 32 0 0 0 0 0 0 0 1 7 0 0
                                    32 0 0 0 0 0 0 1 9 0 0 32 0 0 0 0 0 0 0 0 1
                                    2 0 0 32 31 1 10 0 0 32 0 0 0 0 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 2 0 66 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 3 0 59 31 79 59 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 6 1 3 0 0 0 29 54 1 2 0 0 0 29 1 3
                                    0 0 0 8 59 1 2 0 0 0 8 1 1 0 0 0 1 1 1 37 0
                                    1 1 16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 8 33 0 1 1 9 34 0 1 1 10 35 0 1 1 1 0 36
                                    1 1 0 10 0 1 2 7 0 0 0 1 2 7 0 0 0 1 1 1 0
                                    38 1 1 1 0 41 1 1 1 0 42 1 1 6 0 37 1 1 6 0
                                    60 1 1 0 63 0 1 1 0 0 63 1 1 0 0 24 1 1 0 0
                                    40 1 1 0 0 8 1 1 0 0 6 13 1 0 0 0 1 1 0 0
                                    28 1 1 0 91 0 1 1 0 59 0 1 1 4 20 0 1 0 0
                                    59 1 1 0 0 31 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 10 32 1 1 0 31 31 1 1 0 0 0 1 1 0 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 2 0 0 8 0 1 3 0 0 8 0 0 1 5 0 0 8 0
                                    0 0 0 1 4 0 0 8 0 0 0 1 2 0 0 8 31 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 28 1 2 0 0 0 24 1 2 0 0 0 59 1 2 0 0 0
                                    81 1 0 0 0 1 0 0 0 1 1 0 0 81 1 0 0 0 1 1 0
                                    0 81 1 1 0 0 0 1 1 0 0 0 1 2 0 0 81 59 1 1
                                    0 0 59 1 1 0 0 54 1 2 0 0 81 54 1 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 29 54
                                    1 3 0 0 0 8 59 1 2 0 0 0 8 1 2 0 0 0 29 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1
                                    2 1 0 37 37 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 3 0 0 28 1 2 0 0 24 0 1 2
                                    0 0 0 24 1 2 0 0 0 0 1 2 0 0 28 0 1 2 0 0
                                    59 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
