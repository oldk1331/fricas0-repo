
(/VERSIONCHECK 2) 

(DEFUN |MCMPLX;coerce;C$;1| (|u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 8)) (QREFELT $ 10))
            (SPADCALL (SPADCALL |u| (QREFELT $ 11)) (QREFELT $ 10))
            (QREFELT $ 12))) 

(DEFUN |MCMPLX;coerce;C$;2| (|u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 16)) (QREFELT $ 17))
            (SPADCALL (SPADCALL |u| (QREFELT $ 18)) (QREFELT $ 17))
            (QREFELT $ 12))) 

(DEFUN |MCMPLX;coerce;C$;3| (|u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
            (SPADCALL (SPADCALL |u| (QREFELT $ 24)) (QREFELT $ 23))
            (QREFELT $ 12))) 

(DEFUN |MCMPLX;coerce;C$;4| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (SPADCALL |u| (QREFELT $ 27))
            (QREFELT $ 12))) 

(DEFUN |MCMPLX;coerce;$C;5| (|u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 29)) (QREFELT $ 30))
            (SPADCALL (SPADCALL |u| (QREFELT $ 31)) (QREFELT $ 30))
            (QREFELT $ 32))) 

(DEFUN |MachineComplex| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G180)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MachineComplex|)
                . #2=(|MachineComplex|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MachineComplex|
                         (LIST (CONS NIL (CONS 1 (|MachineComplex;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|MachineComplex|))))))))))) 

(DEFUN |MachineComplex;| ()
  (PROG (|dv$| $ #1=#:G178 #2=#:G177 #3=#:G176 #4=#:G175 #5=#:G174 #6=#:G173
         |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MachineComplex|) . #7=(|MachineComplex|))
      (LETT $ (GETREFV 88) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|FiniteFieldCategory|))
                                          (LETT #1#
                                                (|HasCategory| (|MachineFloat|)
                                                               '(|Field|))
                                                . #7#)
                                          (OR #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|FiniteFieldCategory|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|Finite|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (LETT #2#
                                                (|HasCategory| (|MachineFloat|)
                                                               '(|TranscendentalFunctionCategory|))
                                                . #7#)
                                          (AND
                                           (|HasCategory| (|MachineFloat|)
                                                          '(|RadicalCategory|))
                                           #2#)
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|arbitraryPrecision|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|RealConstant|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|additiveValuation|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|multiplicativeValuation|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|DifferentialRing|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|InnerEvalable|
                                                           (|Symbol|)
                                                           (|MachineFloat|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|Evalable|
                                                           (|MachineFloat|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|Eltable|
                                                           (|MachineFloat|)
                                                           (|MachineFloat|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (LETT #3#
                                                (|HasCategory| (|MachineFloat|)
                                                               '(|EuclideanDomain|))
                                                . #7#)
                                          (OR #3# #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|FiniteFieldCategory|)))
                                          (OR
                                           (|HasCategory| (|MachineFloat|)
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #1#)
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|PolynomialFactorizationExplicit|))
                                          (LETT #4#
                                                (AND
                                                 (|HasCategory|
                                                  (|MachineFloat|)
                                                  '(|EuclideanDomain|))
                                                 (|HasCategory|
                                                  (|MachineFloat|)
                                                  '(|PolynomialFactorizationExplicit|)))
                                                . #7#)
                                          (OR #4#
                                              (AND #1#
                                                   (|HasCategory|
                                                    (|MachineFloat|)
                                                    '(|PolynomialFactorizationExplicit|)))
                                              (AND
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|FiniteFieldCategory|))
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|PolynomialFactorizationExplicit|))))
                                          (LETT #5#
                                                (|HasCategory| (|MachineFloat|)
                                                               '(|IntegerNumberSystem|))
                                                . #7#)
                                          (OR #4# #1#
                                              (AND
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|FiniteFieldCategory|))
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|PolynomialFactorizationExplicit|)))
                                              #5#)
                                          (OR #3# #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|FiniteFieldCategory|))
                                              #5#)
                                          (OR #4# #1# #5#)
                                          (LETT #6#
                                                (|HasCategory| (|MachineFloat|)
                                                               '(|RealNumberSystem|))
                                                . #7#)
                                          (AND #6# #2#)
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|IntegralDomain|))))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|MachineComplex| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|)) #3#
             (|HasCategory| (|MachineFloat|)
                            '(|PolynomialFactorizationExplicit|)))
        (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
       (|augmentPredVector| $ 137438953472))
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|)) #3#
             (|HasCategory| (|MachineFloat|)
                            '(|PolynomialFactorizationExplicit|)))
        (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|)))
       (|augmentPredVector| $ 274877906944))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MachineComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Complex| 9) (|Float|) (|Complex| 6)
              (0 . |real|) (|MachineFloat|) (5 . |coerce|) (10 . |imag|)
              (15 . |complex|) |MCMPLX;coerce;C$;1| (|Integer|) (|Complex| 14)
              (21 . |real|) (26 . |coerce|) (31 . |imag|) |MCMPLX;coerce;C$;2|
              (|MachineInteger|) (|Complex| 20) (36 . |real|) (41 . |coerce|)
              (46 . |imag|) |MCMPLX;coerce;C$;3| (51 . |real|) (56 . |imag|)
              |MCMPLX;coerce;C$;4| (61 . |real|) (66 . |coerce|) (71 . |imag|)
              (76 . |complex|) |MCMPLX;coerce;$C;5| (|Union| 35 '#1="failed")
              (|List| 36) (|SparseUnivariatePolynomial| $) (|Factored| 36)
              (|Fraction| 14) (|Record| (|:| |r| 9) (|:| |phi| 9))
              (|Factored| $) (|Boolean|) (|Union| $ '"failed")
              (|Union| 62 '#1#) (|Matrix| $) (|InputForm|) (|Pattern| 6)
              (|Pattern| 14) (|NonNegativeInteger|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 49 '#2="failed") (|Union| 52 '#2#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 52) (|:| |generator| $)) (|List| 9)
              (|Equation| 9) (|List| 57) (|SparseUnivariatePolynomial| 9)
              (|Fraction| 59) (|Matrix| 9) (|Vector| $) (|Mapping| 9 9)
              (|PositiveInteger|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 14) (|:| |exponent| 14)) (|List| 66)
              (|Table| 64 48) (|Union| 48 '"failed") (|OnePointCompletion| 64)
              (|List| 72) (|Symbol|) (|Union| 38 '"failed")
              (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 14))) (|Matrix| 14)
              (|List| 48) (|PatternMatchResult| 6 $)
              (|PatternMatchResult| 14 $) (|Complex| (|DoubleFloat|))
              (|Vector| 9) (|Union| 9 '#3="failed")
              (|Record| (|:| |mat| 61) (|:| |vec| 80)) (|Union| 14 '#3#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sech| 195 |sec|
              200 |sample| 205 |retractIfCan| 209 |retract| 224 |represents|
              239 |representationType| 250 |rem| 254 |regularRepresentation|
              260 |reducedSystem| 271 |reduce| 293 |recip| 303 |real| 308
              |rationalIfCan| 313 |rational?| 318 |rational| 323 |rank| 328
              |random| 332 |quo| 336 |principalIdeal| 342 |primitiveElement|
              347 |primitive?| 351 |primeFrobenius| 356 |prime?| 367
              |polarCoordinates| 372 |pi| 377 |patternMatch| 381 |order| 395
              |one?| 405 |nthRoot| 410 |norm| 416 |nextItem| 421
              |multiEuclidean| 426 |minimalPolynomial| 432 |min| 437 |max| 443
              |map| 449 |lookup| 455 |log| 460 |lift| 465 |lcm| 470 |latex| 481
              |inv| 486 |init| 491 |index| 495 |imaginary| 500 |imag| 504
              |hash| 509 |generator| 514 |gcdPolynomial| 518 |gcd| 524
              |factorsOfCyclicGroupSize| 535 |factorSquareFreePolynomial| 539
              |factorPolynomial| 544 |factor| 549 |extendedEuclidean| 554
              |exquo| 567 |expressIdealMember| 579 |exp| 585 |eval| 590
              |euclideanSize| 630 |enumerate| 635 |elt| 639 |divide| 645
              |discriminant| 651 |discreteLog| 660 |differentiate| 671
              |derivationCoordinates| 721 |definingPolynomial| 727 |csch| 731
              |csc| 736 |createPrimitiveElement| 741 |coth| 745 |cot| 750
              |cosh| 755 |cos| 760 |coordinates| 765 |convert| 787 |conjugate|
              832 |conditionP| 837 |complex| 842 |coerce| 848 |charthRoot| 903
              |characteristicPolynomial| 913 |characteristic| 918 |basis| 922
              |atanh| 926 |atan| 931 |associates?| 936 |asinh| 942 |asin| 947
              |asech| 952 |asec| 957 |argument| 962 |acsch| 967 |acsc| 972
              |acoth| 977 |acot| 982 |acosh| 987 |acos| 992 |abs| 997 ^ 1002
              |Zero| 1032 |One| 1036 D 1040 >= 1090 > 1096 = 1102 <= 1108 <
              1114 / 1120 - 1126 + 1137 * 1143)
           'NIL
           (CONS
            (|makeByteWordVec2| 33
                                '(0 0 2 2 4 30 26 32 26 0 0 33 0 0 3 0 0 0 0 3
                                  0 0 0 0 0 1 3 5 8 16 17 0 0 0 3 0 0 0 0 0 3 3
                                  0 0 0 0 0 0 0 0 0 0 0 0 6 2 21 22 0 0 0 9 19
                                  0 0 0 0 0 0 0 0 0 0 3 3 7 10 9 9 9 9 9 11 12
                                  12 13 14 15 18 19 20 23 24))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |FramedAlgebra&|
                |GcdDomain&| NIL |FiniteRankAlgebra&| |DivisionRing&|
                |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| NIL NIL |Module&|
                |EntireRing&| |Module&| NIL |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Ring&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL
                |FullyEvalableOver&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |Finite&| NIL NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |TranscendentalFunctionCategory&| |Evalable&| NIL
                |RetractableTo&| NIL |RetractableTo&| |PartialOrder&| NIL NIL
                NIL |BasicType&| NIL NIL NIL |RetractableTo&|
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 59)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|FortranMachineTypeCategory|)
                 (|FramedAlgebra| 9 59) (|GcdDomain|) (|IntegralDomain|)
                 (|FiniteRankAlgebra| 9 59) (|DivisionRing|)
                 (|DifferentialExtension| 9)
                 (|FullyLinearlyExplicitRingOver| 9) (|Algebra| 9)
                 (|Algebra| $$) (|Algebra| 38) (|CommutativeRing|)
                 (|LinearlyExplicitRingOver| 9) (|Module| 9) (|EntireRing|)
                 (|Module| $$) (|CharacteristicZero|) (|Module| 38)
                 (|CharacteristicNonZero|) (|LinearlyExplicitRingOver| 14)
                 (|PartialDifferentialRing| 72) (|DifferentialRing|)
                 (|BiModule| 9 9) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 38 38) (|RightModule| 9) (|LeftModule| 9)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$) (|LeftModule| 38)
                 (|RightModule| 38) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|FullyPatternMatchable| 9) (|OrderedSet|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|FullyEvalableOver| 9) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Finite|) (|StepThrough|)
                 (|PatternMatchable| 6) (|PatternMatchable| 14)
                 (|Patternable| 9) (|FullyRetractableTo| 9) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 9) (|Type|)
                 (|RetractableTo| 9) (|ConvertibleTo| 59) (|RetractableTo| 14)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 86)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|RetractableTo| 38) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 7) (|ConvertibleTo| 79) (|ConvertibleTo| 45)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 72 9) (|InnerEvalable| 9 9) (|Eltable| 9 $$)
                 (|ConvertibleTo| 46) (|ConvertibleTo| 47))
              (|makeByteWordVec2| 87
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 41 0 0 1 1 0 41 0 1 1 0
                                    84 0 1 1 0 0 0 1 1 0 41 0 1 1 0 61 62 1 0 0
                                    61 1 1 0 9 0 1 1 9 0 0 1 1 9 0 0 1 1 2 68
                                    14 1 2 0 42 0 0 1 1 29 37 36 1 1 34 0 0 1 1
                                    34 40 0 1 1 10 0 0 1 2 29 34 35 36 1 2 0 41
                                    0 0 1 2 25 41 0 0 1 0 6 48 1 1 9 0 0 1 1 9
                                    0 0 1 1 9 0 0 1 1 9 0 0 1 0 0 0 1 1 7 73 0
                                    1 1 0 81 0 1 1 0 83 0 1 1 7 38 0 1 1 0 9 0
                                    1 1 0 14 0 1 2 0 0 80 62 1 1 0 0 80 1 0 2
                                    65 1 2 25 0 0 0 1 2 0 61 0 62 1 1 0 61 0 1
                                    2 8 74 44 62 1 1 8 75 44 1 1 0 61 44 1 2 0
                                    82 44 62 1 1 3 42 60 1 1 0 0 59 1 1 0 42 0
                                    1 1 0 9 0 29 1 31 73 0 1 1 31 41 0 1 1 31
                                    38 0 1 0 0 64 1 0 6 0 1 2 25 0 0 0 1 1 25
                                    55 52 1 0 2 0 1 1 2 41 0 1 2 2 0 0 48 1 1 2
                                    0 0 1 1 34 41 0 1 1 36 39 0 1 0 9 0 1 3 21
                                    77 0 46 77 1 3 22 78 0 47 78 1 1 2 64 0 1 1
                                    2 70 0 1 1 0 41 0 1 2 10 0 0 14 1 1 0 9 0 1
                                    1 2 42 0 1 2 25 51 52 0 1 1 3 59 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 63 0 1 1 6 64 0 1 1
                                    9 0 0 1 1 0 59 0 1 2 25 0 0 0 1 1 25 0 52 1
                                    1 0 85 0 1 1 3 0 0 1 0 2 0 1 1 6 0 64 1 0 0
                                    0 1 1 0 9 0 31 1 0 87 0 1 0 0 0 1 2 25 36
                                    36 36 1 2 25 0 0 0 1 1 25 0 52 1 0 2 67 1 1
                                    29 37 36 1 1 29 37 36 1 1 34 40 0 1 3 25 50
                                    0 0 0 1 2 25 53 0 0 1 2 37 42 0 9 1 2 0 42
                                    0 0 1 2 25 51 52 0 1 1 9 0 0 1 3 19 0 0 56
                                    56 1 2 19 0 0 57 1 3 19 0 0 9 9 1 2 19 0 0
                                    58 1 3 18 0 0 71 56 1 3 18 0 0 72 9 1 1 25
                                    48 0 1 0 6 52 1 2 20 0 0 9 1 2 25 54 0 0 1
                                    1 0 9 62 1 0 0 9 1 1 2 48 0 1 2 2 69 0 0 1
                                    1 17 0 0 1 2 17 0 0 48 1 2 16 0 0 72 1 3 16
                                    0 0 72 48 1 2 16 0 0 71 1 3 16 0 0 71 76 1
                                    3 0 0 0 63 48 1 2 0 0 0 63 1 2 3 61 62 63 1
                                    0 0 59 1 1 9 0 0 1 1 9 0 0 1 0 2 0 1 1 9 0
                                    0 1 1 9 0 0 1 1 9 0 0 1 1 9 0 0 1 2 0 80 0
                                    62 1 2 0 61 62 62 1 1 0 61 62 1 1 0 80 0 1
                                    1 13 45 0 1 1 23 46 0 1 1 24 47 0 1 1 12 7
                                    0 1 1 12 79 0 1 1 0 80 0 1 1 0 0 80 1 1 0
                                    59 0 1 1 0 0 59 1 1 0 0 0 1 1 39 43 44 1 2
                                    0 0 9 9 12 1 27 0 38 1 1 0 7 0 33 1 0 0 5
                                    28 1 0 0 21 25 1 0 0 15 19 1 0 0 7 13 1 0 0
                                    9 1 1 0 0 14 1 1 0 0 0 1 1 0 0 14 1 1 0 86
                                    0 1 1 38 42 0 1 1 2 0 0 1 1 0 59 0 1 0 0 48
                                    1 0 0 62 1 1 9 0 0 1 1 9 0 0 1 2 0 41 0 0 1
                                    1 9 0 0 1 1 9 0 0 1 1 9 0 0 1 1 9 0 0 1 1 9
                                    9 0 1 1 9 0 0 1 1 9 0 0 1 1 9 0 0 1 1 9 0 0
                                    1 1 9 0 0 1 1 9 0 0 1 1 35 0 0 1 2 10 0 0
                                    38 1 2 3 0 0 14 1 2 9 0 0 0 1 2 0 0 0 48 1
                                    2 0 0 0 64 1 0 0 0 1 0 0 0 1 1 17 0 0 1 2
                                    17 0 0 48 1 2 16 0 0 72 1 2 16 0 0 71 1 3
                                    16 0 0 71 76 1 3 16 0 0 72 48 1 3 0 0 0 63
                                    48 1 2 0 0 0 63 1 2 0 41 0 0 1 2 0 41 0 0 1
                                    2 0 41 0 0 1 2 0 41 0 0 1 2 0 41 0 0 1 2 3
                                    0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2
                                    3 0 38 0 1 2 3 0 0 38 1 2 0 0 0 9 1 2 0 0 9
                                    0 1 2 0 0 0 0 1 2 0 0 14 0 1 2 0 0 48 0 1 2
                                    0 0 64 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineComplex| 'NILADIC T) 
