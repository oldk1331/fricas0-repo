
(/VERSIONCHECK 2) 

(DEFUN |JBX;coerce;JB$;1| (|jv| $)
  (COND
   ((SPADCALL (SPADCALL |jv| (QREFELT $ 9)) '|Indep| (QREFELT $ 11))
    (|error| "Only functions of independent variables allowed"))
   ('T (SPADCALL |jv| (QREFELT $ 12))))) 

(DEFUN |JBX;retractIfCan;JbeU;2| (|p| $)
  (PROG (#1=#:G144 |jv| #2=#:G143)
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

(DEFUN |JetBundleXExpression| (#1=#:G207)
  (PROG ()
    (RETURN
     (PROG (#2=#:G208)
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
  (PROG (|pv$| #1=#:G205 #2=#:G206 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleXExpression|))
      (LETT |dv$| (LIST '|JetBundleXExpression| DV$1) . #3#)
      (LETT $ (GETREFV 90) . #3#)
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
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe$;3| (|Fraction| 28)
              (|Union| 23 '#1="failed")
              (|Record| (|:| |coef| 28) (|:| |var| 41))
              (|Union| 25 '#2="failed") (|Union| 32 '#2#) (|Integer|)
              (|List| 8) (|BasicOperator|) (|List| 30) (|List| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 28)
              (|SparseMultivariatePolynomial| 28 41) (|Factored| $)
              (|Fraction| 39) (|Polynomial| 23) (|Fraction| 62) (|Kernel| $)
              (|Union| 43 '#1#) (|Fraction| 60)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 28 $)
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 28))) (|Matrix| $)
              (|Vector| $) (|Matrix| 28)
              (|Record| (|:| |var| 41) (|:| |exponent| 28)) (|Union| 50 '#2#)
              (|List| 57) (|Mapping| $ $) (|List| 53)
              (|Record| (|:| |val| $) (|:| |exponent| 28)) (|Union| 55 '#2#)
              (|NonNegativeInteger|) (|Mapping| $ 32) (|List| 58)
              (|Polynomial| 28) (|Union| 60 '#1#)
              (|SparseUnivariatePolynomial| $) (|Expression| 28)
              (|SegmentBinding| $)
              (|Record| (|:| |coef| 32) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 67 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Polynomial| $) (|Union| 41 '#1#) (|List| 41) (|Equation| $)
              (|List| 73) (|Union| 8 '#1#) (|Union| 28 '#1#)
              (|Union| '"failed" (|List| 52))
              (|Record| (|:| |Sys| 32) (|:| JM 79) (|:| |Depend| 77))
              (|SparseEchelonMatrix| 6 $)
              (|Record| (|:| |DSys| 32) (|:| |JVars| 83)) (|PositiveInteger|)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 14)) (|List| 14) (|Void|)
              (|Union| 6 '#1#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|) (|String|) (|OutputForm|))
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
              |lcm| 723 |latex| 734 |lambertW| 739 |kummerU| 744 |kummerM| 751
              |kernels| 758 |kernel| 763 |kelvinKer| 775 |kelvinKei| 781
              |kelvinBer| 787 |kelvinBei| 793 |jetVariables| 799 |jacobiZeta|
              804 |jacobiTheta| 810 |jacobiSn| 816 |jacobiMatrix| 822
              |jacobiDn| 833 |jacobiCn| 839 |isTimes| 845 |isPower| 850
              |isPlus| 855 |isMult| 860 |isExpt| 865 |is?| 882 |inv| 894
              |integral| 899 |hypergeometricF| 911 |height| 918 |hash| 923
              |hankelH2| 928 |hankelH1| 934 |ground?| 940 |ground| 945
              |getNotation| 950 |gcdPolynomial| 954 |gcd| 960 |function| 971
              |fresnelS| 977 |fresnelC| 982 |freeOf?| 987 |formalDiff2| 1005
              |formalDiff| 1019 |factorials| 1037 |factorial| 1048 |factor|
              1053 |extractSymbol| 1058 |extendedEuclidean| 1063 |exquo| 1076
              |expressIdealMember| 1082 |exp| 1088 |even?| 1093 |eval| 1098
              |euclideanSize| 1259 |erf| 1264 |elt| 1269 |ellipticPi| 1365
              |ellipticK| 1372 |ellipticF| 1377 |ellipticE| 1383 |divide| 1394
              |distribute| 1400 |dimension| 1411 |dilog| 1418 |digamma| 1423
              |differentiate| 1428 |denominator| 1460 |denom| 1465
              |definingPolynomial| 1470 |dSubst| 1475 |csch| 1482 |csc| 1487
              |coth| 1492 |cot| 1497 |cosh| 1502 |cos| 1507 |convert| 1512
              |const?| 1532 |conjugate| 1537 |commutator| 1543 |coerce| 1549
              |class| 1619 |charthRoot| 1624 |characteristic| 1629 |box| 1633
              |binomial| 1643 |besselY| 1649 |besselK| 1655 |besselJ| 1661
              |besselI| 1667 |belong?| 1673 |autoReduce| 1678 |atanh| 1683
              |atan| 1688 |associates?| 1693 |asinh| 1699 |asin| 1704 |asech|
              1709 |asec| 1714 |applyQuote| 1719 |angerJ| 1755 |airyBiPrime|
              1761 |airyBi| 1766 |airyAiPrime| 1771 |airyAi| 1776 |acsch| 1781
              |acsc| 1786 |acoth| 1791 |acot| 1796 |acosh| 1801 |acos| 1806
              |abs| 1811 ^ 1816 |Zero| 1846 X 1850 U 1859 |Si| 1868 |Shi| 1873
              P 1878 |One| 1900 |Gamma| 1904 |Ei| 1915 D 1920 |Ci| 1946 |Chi|
              1951 |Beta| 1956 = 1962 / 1968 - 1980 + 1991 * 1997)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3 4
                                  5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0 0
                                  0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleBaseFunctionCategory&| NIL
                |UniqueFactorizationDomain&| |JetBundleFunctionCategory&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| |Algebra&|
                |Algebra&| |FullyLinearlyExplicitRingOver&| |Module&|
                |EntireRing&| NIL |PartialDifferentialRing&| |Module&|
                |Module&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL |Group&| NIL |ExpressionSpace&|
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
                 (|IntegralDomain|) (|Algebra| 23) (|Algebra| $$)
                 (|Algebra| 28) (|FullyLinearlyExplicitRingOver| 28)
                 (|Module| 23) (|EntireRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 8) (|Module| $$) (|Module| 28)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 28) (|BiModule| 23 23)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 28 28)
                 (|RightModule| 23) (|LeftModule| 23) (|LeftModule| $$) (|Rng|)
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
                 (|BasicType|) (|CoercibleTo| 89) (|RetractableTo| 23)
                 (|RetractableTo| 43) (|RetractableTo| 60) (|ConvertibleTo| 33)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 35))
              (|makeByteWordVec2| 89
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 1 0 32 62 1 1 0 32 70 1 2 0 32 62 8 1
                                    1 0 32 0 1 2 0 32 0 8 1 1 0 0 62 1 1 0 0 70
                                    1 2 0 0 62 8 1 1 0 0 0 1 2 0 0 0 8 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 29 0 1 2 1 40 0 41 1 1 0 86
                                    0 1 1 0 0 0 1 1 0 10 0 1 1 0 72 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 79 32 1 2 0 0 0 8 1 2 0 0 0
                                    64 1 2 0 20 0 0 1 2 0 0 0 74 1 2 0 0 0 73 1
                                    3 0 0 0 72 32 1 3 0 0 0 6 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 0 0 1 1
                                    0 32 32 1 2 0 20 0 6 1 2 0 10 0 0 1 2 0 10
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 78 32 79 1 1
                                    0 0 0 1 3 0 78 32 79 32 1 2 0 32 32 32 1 1
                                    0 84 8 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 32
                                    62 1 1 0 32 70 1 2 0 32 62 8 1 1 0 32 0 1 2
                                    0 32 0 8 1 1 0 0 62 1 1 0 0 70 1 2 0 0 62 8
                                    1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 2 24 0
                                    1 1 1 42 0 1 1 6 61 0 1 1 0 20 5 21 1 0 71
                                    0 1 1 0 75 0 1 1 0 76 0 1 1 0 85 0 1 1 2 23
                                    0 1 1 1 43 0 1 1 6 60 0 1 1 0 0 5 22 1 0 41
                                    0 1 1 0 8 0 1 1 0 28 0 1 1 0 6 0 1 2 0 0 0
                                    0 1 2 6 46 47 48 1 1 6 49 47 1 2 0 32 32 32
                                    1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0 1 2 0 0 0
                                    8 1 2 0 0 0 64 1 1 0 65 32 1 1 0 10 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3
                                    11 44 0 34 44 1 3 12 45 0 35 45 1 1 0 0 32
                                    1 1 0 0 0 1 3 0 57 32 79 57 1 1 0 57 0 1 1
                                    0 31 0 1 1 0 30 30 1 1 0 10 0 1 1 17 10 0 1
                                    1 0 0 0 1 1 6 36 0 1 0 0 81 1 0 0 81 1 2 0
                                    0 0 28 1 2 0 27 32 0 1 1 16 62 41 1 5 17 0
                                    32 32 32 32 0 1 2 0 0 53 41 1 1 0 71 0 1 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 6 0 1 2 0 0 0 0 1 1 0 0 32 1 1 0 88 0 1
                                    1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    72 0 1 2 0 0 30 32 1 2 0 0 30 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    14 0 15 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 79 32 83 1 1 0 79 32 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 1 15 27 0 1 1 6 56 0 1 1 14 27 0 1
                                    1 14 26 0 1 2 6 51 0 30 1 2 6 51 0 8 1 1 15
                                    51 0 1 2 0 10 0 30 1 2 0 10 0 8 1 1 0 0 0 1
                                    2 0 0 0 64 1 2 0 0 0 8 1 3 17 0 32 32 0 1 1
                                    0 57 0 1 1 0 87 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 10 0 1 1 0 28 0 1 0 0 8 1 2 0 62 62 62
                                    1 2 0 0 0 0 1 1 0 0 32 1 2 0 0 8 32 1 1 0 0
                                    0 1 1 0 0 0 1 2 0 10 0 8 1 2 0 10 0 0 1 2 0
                                    10 0 6 1 3 0 80 32 81 79 1 3 0 82 0 81 79 1
                                    2 0 0 0 52 1 2 0 32 32 81 1 2 0 0 0 81 1 1
                                    0 0 0 1 2 0 0 0 8 1 1 0 0 0 1 1 0 37 0 1 1
                                    0 79 79 1 3 0 68 0 0 0 1 2 0 69 0 0 1 2 0
                                    20 0 0 1 2 0 27 32 0 1 1 0 0 0 1 1 17 10 0
                                    1 2 8 0 0 8 1 2 8 0 0 29 1 4 8 0 0 30 0 8 1
                                    1 8 0 0 1 4 8 0 0 31 32 8 1 4 6 0 0 29 52
                                    54 1 4 6 0 0 8 57 58 1 4 6 0 0 29 52 59 1 4
                                    6 0 0 8 57 53 1 3 0 0 0 41 0 1 3 0 0 0 72
                                    32 1 2 0 0 0 73 1 2 0 0 0 74 1 3 0 0 0 0 0
                                    1 3 0 0 0 32 32 1 3 0 0 0 29 59 1 3 0 0 0
                                    29 54 1 3 0 0 0 8 58 1 3 0 0 0 31 54 1 3 0
                                    0 0 8 53 1 3 0 0 0 31 59 1 3 0 0 0 30 53 1
                                    3 0 0 0 30 58 1 1 0 57 0 1 1 0 0 0 1 2 0 0
                                    30 0 1 4 0 0 30 0 0 0 1 3 0 0 30 0 0 1 5 0
                                    0 30 0 0 0 0 1 7 0 0 30 0 0 0 0 0 0 1 6 0 0
                                    30 0 0 0 0 0 1 8 0 0 30 0 0 0 0 0 0 0 1 10
                                    0 0 30 0 0 0 0 0 0 0 0 0 1 9 0 0 30 0 0 0 0
                                    0 0 0 0 1 2 0 0 30 32 1 3 0 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    66 0 0 1 2 0 0 0 0 1 1 0 0 0 1 3 0 57 32 79
                                    57 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 6 1 3 0 0
                                    0 8 57 1 3 0 0 0 29 52 1 2 0 0 0 29 1 2 0 0
                                    0 8 1 1 0 0 0 1 1 1 36 0 1 1 16 0 0 1 3 0 0
                                    0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 8 33 0 1 1 9 34 0
                                    1 1 10 35 0 1 1 1 0 37 1 1 0 10 0 1 2 7 0 0
                                    0 1 2 7 0 0 0 1 1 1 0 38 1 1 1 0 39 1 1 1 0
                                    43 1 1 6 0 36 1 1 6 0 60 1 1 0 63 0 1 1 0 0
                                    63 1 1 0 0 23 1 1 0 0 41 1 1 0 0 8 1 1 0 0
                                    6 13 1 0 0 0 1 1 0 0 28 1 1 0 89 0 1 1 0 57
                                    0 1 1 4 20 0 1 0 0 57 1 1 0 0 0 1 1 0 0 32
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 10 30 1 1 0 32 32 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 10 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 8 0 1 4 0
                                    0 8 0 0 0 1 3 0 0 8 0 0 1 5 0 0 8 0 0 0 0 1
                                    2 0 0 8 32 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 28 1 2 0 0 0 23 1 2
                                    0 0 0 57 1 2 0 0 0 81 1 0 0 0 1 0 0 0 1 1 0
                                    0 81 1 0 0 0 1 1 0 0 81 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 57 1 1 0 0 52 1 2 0 0 81 57 1 2 0 0
                                    81 52 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 0 29 52 1 2 0 0 0 29 1 3 0 0 0 8
                                    57 1 2 0 0 0 8 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 1 0 36 36 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 0
                                    28 1 2 0 0 0 23 1 2 0 0 23 0 1 2 0 0 28 0 1
                                    2 0 0 0 0 1 2 0 0 57 0 1 2 0 0 81 0 1)))))
           '|lookupComplete|)) 
