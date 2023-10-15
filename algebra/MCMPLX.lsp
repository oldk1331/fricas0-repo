
(SDEFUN |MCMPLX;coerce;C$;1| ((|u| |Complex| (|Float|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 8)) (QREFELT $ 10))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 11)) (QREFELT $ 10))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;2| ((|u| |Complex| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 16)) (QREFELT $ 17))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 18)) (QREFELT $ 17))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;3| ((|u| |Complex| (|MachineInteger|)) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 24)) (QREFELT $ 23))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;C$;4| ((|u| |Complex| (|MachineFloat|)) ($ $))
        (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (SPADCALL |u| (QREFELT $ 27))
                  (QREFELT $ 12))) 

(SDEFUN |MCMPLX;coerce;$C;5| ((|u| $) ($ |Complex| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 29)) (QREFELT $ 30))
                  (SPADCALL (SPADCALL |u| (QREFELT $ 31)) (QREFELT $ 30))
                  (QREFELT $ 32))) 

(DECLAIM (NOTINLINE |MachineComplex;|)) 

(DEFUN |MachineComplex| ()
  (SPROG NIL
         (PROG (#1=#:G159)
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
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineComplex|)))))))))) 

(DEFUN |MachineComplex;| ()
  (SPROG
   ((|dv$| NIL) ($ NIL) (#1=#:G157 NIL) (#2=#:G156 NIL) (#3=#:G155 NIL)
    (#4=#:G154 NIL) (#5=#:G153 NIL) (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|MachineComplex|) . #6=(|MachineComplex|))
    (LETT $ (GETREFV 90) . #6#)
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
                                              . #6#)
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|EuclideanDomain|))
                                        (LETT #2#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|TranscendentalFunctionCategory|))
                                              . #6#)
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
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|EuclideanDomain|))
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|)))
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
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PolynomialFactorizationExplicit|))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|EuclideanDomain|))
                                               (|HasCategory| (|MachineFloat|)
                                                              '(|PolynomialFactorizationExplicit|)))
                                              . #6#)
                                        (OR #3#
                                            (AND #1#
                                                 (|HasCategory|
                                                  (|MachineFloat|)
                                                  '(|PolynomialFactorizationExplicit|)))
                                            (AND
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|PolynomialFactorizationExplicit|))))
                                        (LETT #4#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|IntegerNumberSystem|))
                                              . #6#)
                                        (OR #3# #1#
                                            (AND
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| (|MachineFloat|)
                                                            '(|PolynomialFactorizationExplicit|)))
                                            #4#)
                                        (OR
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|EuclideanDomain|))
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #4#)
                                        (OR #3# #1# #4#)
                                        (LETT #5#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|RealNumberSystem|))
                                              . #6#)
                                        (AND #5# #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|IntegralDomain|))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|MachineComplex| NIL (CONS 1 $))
    (|stuffDomainSlots| $)
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|))
           (|HasCategory| (|MachineFloat|)
                          '(|PolynomialFactorizationExplicit|)))
      (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
     (|augmentPredVector| $ 137438953472))
    (AND
     (OR
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|))
           (|HasCategory| (|MachineFloat|)
                          '(|PolynomialFactorizationExplicit|)))
      (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|)))
     (|augmentPredVector| $ 274877906944))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

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
              (|Fraction| 14) (|Record| (|:| |r| 9) (|:| |phi| 9)) (|Boolean|)
              (|Factored| $) (|Union| $ '"failed") (|Union| 62 '#1#)
              (|Matrix| $) (|InputForm|) (|Pattern| 6) (|Pattern| 14)
              (|NonNegativeInteger|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 49 '#2="failed") (|Union| 52 '#2#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 52) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 9) (|Equation| 9) (|List| 58)
              (|SparseUnivariatePolynomial| 9) (|Matrix| 9) (|Vector| $)
              (|Mapping| 9 9) (|Fraction| 60) (|PositiveInteger|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 65 48) (|Record| (|:| |factor| 14) (|:| |exponent| 14))
              (|List| 68) (|Union| 48 '"failed") (|OnePointCompletion| 65)
              (|Symbol|) (|List| 72) (|Union| 38 '"failed") (|Matrix| 14)
              (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 14))) (|List| 48)
              (|PatternMatchResult| 6 $) (|PatternMatchResult| 14 $)
              (|Complex| (|DoubleFloat|)) (|Vector| 9) (|Union| 9 '#3="failed")
              (|Record| (|:| |mat| 61) (|:| |vec| 81)) (|Union| 14 '#3#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sech| 195 |sec|
              200 |sample| 205 |rightRecip| 209 |rightPower| 214 |retractIfCan|
              226 |retract| 241 |represents| 256 |representationType| 267 |rem|
              271 |regularRepresentation| 277 |reducedSystem| 288 |reduce| 310
              |recip| 320 |real| 325 |rationalIfCan| 330 |rational?| 335
              |rational| 340 |rank| 345 |random| 349 |quo| 353 |principalIdeal|
              359 |primitiveElement| 364 |primitive?| 368 |primeFrobenius| 373
              |prime?| 384 |polarCoordinates| 389 |pi| 394 |patternMatch| 398
              |order| 412 |opposite?| 422 |one?| 428 |nthRoot| 433 |norm| 439
              |nextItem| 444 |multiEuclidean| 449 |minimalPolynomial| 455 |min|
              460 |max| 466 |map| 472 |lookup| 478 |log| 483 |lift| 488
              |leftRecip| 493 |leftPower| 498 |lcmCoef| 510 |lcm| 516 |latex|
              527 |inv| 532 |init| 537 |index| 541 |imaginary| 546 |imag| 550
              |hashUpdate!| 555 |hash| 561 |generator| 566 |gcdPolynomial| 570
              |gcd| 576 |factorsOfCyclicGroupSize| 587
              |factorSquareFreePolynomial| 591 |factorPolynomial| 596 |factor|
              601 |extendedEuclidean| 606 |exquo| 619 |expressIdealMember| 631
              |exp| 637 |eval| 642 |euclideanSize| 682 |enumerate| 687 |elt|
              691 |divide| 697 |discriminant| 703 |discreteLog| 712
              |differentiate| 723 |derivationCoordinates| 773
              |definingPolynomial| 779 |csch| 783 |csc| 788
              |createPrimitiveElement| 793 |coth| 797 |cot| 802 |cosh| 807
              |cos| 812 |coordinates| 817 |convert| 839 |conjugate| 884
              |conditionP| 889 |complex| 894 |commutator| 900 |coerce| 906
              |charthRoot| 961 |characteristicPolynomial| 971 |characteristic|
              976 |basis| 980 |atanh| 984 |atan| 989 |associator| 994
              |associates?| 1001 |asinh| 1007 |asin| 1012 |asech| 1017 |asec|
              1022 |argument| 1027 |antiCommutator| 1032 |annihilate?| 1038
              |acsch| 1044 |acsc| 1049 |acoth| 1054 |acot| 1059 |acosh| 1064
              |acos| 1069 |abs| 1074 ^ 1079 |Zero| 1109 |One| 1113 D 1117 >=
              1167 > 1173 = 1179 <= 1185 < 1191 / 1197 - 1203 + 1214 * 1220)
           'NIL
           (CONS
            (|makeByteWordVec2| 33
                                '(0 0 2 2 4 30 15 32 15 0 0 33 0 0 0 0 3 9 0 0
                                  0 0 0 1 3 5 8 18 19 0 0 0 0 0 0 3 0 0 0 3 0 0
                                  0 0 0 3 3 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 2 23
                                  24 0 0 0 10 21 0 0 0 0 0 0 0 0 0 0 3 3 7 11
                                  10 10 10 10 10 12 13 13 14 16 17 20 21 22 25
                                  26))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |FramedAlgebra&|
                |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitOver&| |FiniteRankAlgebra&|
                |DivisionRing&| NIL NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                NIL |Algebra&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Rng&| NIL |Module&| |Module&| NIL
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL |OrderedSet&| NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |FullyEvalableOver&| NIL |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL |FullyRetractableTo&|
                |SetCategory&| |TranscendentalFunctionCategory&| |Evalable&|
                NIL |RetractableTo&| NIL |RetractableTo&| |PartialOrder&| NIL
                NIL NIL |BasicType&| NIL NIL NIL |RetractableTo&|
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 60)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|FortranMachineTypeCategory|)
                 (|FramedAlgebra| 9 60) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 9) (|FullyLinearlyExplicitOver| 9)
                 (|FiniteRankAlgebra| 9 60) (|DivisionRing|) (|LeftOreRing|)
                 (|CommutativeRing|) (|LinearlyExplicitOver| 9) (|Algebra| 9)
                 (|EntireRing|) (|Algebra| $$) (|CharacteristicZero|)
                 (|Algebra| 38) (|CharacteristicNonZero|)
                 (|LinearlyExplicitOver| 14) (|PartialDifferentialRing| 72)
                 (|DifferentialRing|) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 9) (|Module| $$) (|SemiRng|) (|Module| 38)
                 (|BiModule| 9 9) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|BiModule| 38 38) (|RightModule| 9) (|LeftModule| 9)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| 38) (|RightModule| 38) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|FullyPatternMatchable| 9)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|FullyEvalableOver| 9) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|StepThrough|) (|PatternMatchable| 6)
                 (|PatternMatchable| 14) (|Patternable| 9)
                 (|FullyRetractableTo| 9) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 9) (|Type|)
                 (|RetractableTo| 9) (|ConvertibleTo| 60) (|RetractableTo| 14)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 88)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|RetractableTo| 38) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 7) (|ConvertibleTo| 80) (|ConvertibleTo| 45)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 72 9) (|InnerEvalable| 9 9) (|Eltable| 9 $$)
                 (|ConvertibleTo| 46) (|ConvertibleTo| 47))
              (|makeByteWordVec2| 89
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 40 0 0 1 1 0 40 0 1 1 0
                                    85 0 1 1 0 0 0 1 1 0 40 0 1 1 0 61 62 1 0 0
                                    61 1 1 0 9 0 1 1 10 0 0 1 1 10 0 0 1 1 2 67
                                    14 1 2 0 42 0 0 1 1 29 37 36 1 1 34 0 0 1 1
                                    34 41 0 1 1 11 0 0 1 2 29 34 35 36 1 2 0 40
                                    0 0 1 2 9 40 0 0 1 0 6 48 1 1 10 0 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 0 0 0 1 1 0 42
                                    0 1 2 0 0 0 48 1 2 0 0 0 65 1 1 7 74 0 1 1
                                    0 82 0 1 1 0 84 0 1 1 7 38 0 1 1 0 9 0 1 1
                                    0 14 0 1 2 0 0 81 62 1 1 0 0 81 1 0 2 66 1
                                    2 9 0 0 0 1 2 0 61 0 62 1 1 0 61 0 1 1 8 75
                                    44 1 2 8 76 44 62 1 1 0 61 44 1 2 0 83 44
                                    62 1 1 3 42 64 1 1 0 0 60 1 1 0 42 0 1 1 0
                                    9 0 29 1 31 74 0 1 1 31 40 0 1 1 31 38 0 1
                                    0 0 65 1 0 6 0 1 2 9 0 0 0 1 1 9 55 52 1 0
                                    2 0 1 1 2 40 0 1 2 2 0 0 48 1 1 2 0 0 1 1
                                    34 40 0 1 1 36 39 0 1 0 10 0 1 3 23 78 0 46
                                    78 1 3 24 79 0 47 79 1 1 2 65 0 1 1 2 71 0
                                    1 2 0 40 0 0 1 1 0 40 0 1 2 11 0 0 14 1 1 0
                                    9 0 1 1 2 42 0 1 2 9 51 52 0 1 1 3 60 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 63 0 1 1 6 65 0
                                    1 1 10 0 0 1 1 0 60 0 1 1 0 42 0 1 2 0 0 0
                                    48 1 2 0 0 0 65 1 2 9 56 0 0 1 1 9 0 52 1 2
                                    9 0 0 0 1 1 0 87 0 1 1 3 0 0 1 0 2 0 1 1 6
                                    0 65 1 0 0 0 1 1 0 9 0 31 2 0 86 86 0 1 1 0
                                    89 0 1 0 0 0 1 2 9 36 36 36 1 1 9 0 52 1 2
                                    9 0 0 0 1 0 2 69 1 1 29 37 36 1 1 29 37 36
                                    1 1 34 41 0 1 3 9 50 0 0 0 1 2 9 53 0 0 1 2
                                    37 42 0 9 1 2 0 42 0 0 1 2 9 51 52 0 1 1 10
                                    0 0 1 3 21 0 0 57 57 1 2 21 0 0 58 1 3 21 0
                                    0 9 9 1 2 21 0 0 59 1 3 20 0 0 72 9 1 3 20
                                    0 0 73 57 1 1 9 48 0 1 0 6 52 1 2 22 0 0 9
                                    1 2 9 54 0 0 1 1 0 9 62 1 0 0 9 1 1 2 48 0
                                    1 2 2 70 0 0 1 1 19 0 0 1 2 19 0 0 48 1 2
                                    18 0 0 73 1 2 18 0 0 72 1 3 18 0 0 72 48 1
                                    3 18 0 0 73 77 1 2 0 0 0 63 1 3 0 0 0 63 48
                                    1 2 3 61 62 63 1 0 0 60 1 1 10 0 0 1 1 10 0
                                    0 1 0 2 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0
                                    1 1 10 0 0 1 2 0 81 0 62 1 2 0 61 62 62 1 1
                                    0 81 0 1 1 0 61 62 1 1 14 45 0 1 1 25 46 0
                                    1 1 26 47 0 1 1 13 80 0 1 1 13 7 0 1 1 0 0
                                    81 1 1 0 81 0 1 1 0 60 0 1 1 0 0 60 1 1 0 0
                                    0 1 1 39 43 44 1 2 0 0 9 9 12 2 0 0 0 0 1 1
                                    27 0 38 1 1 0 7 0 33 1 0 0 5 28 1 0 0 21 25
                                    1 0 0 15 19 1 0 0 7 13 1 0 0 9 1 1 0 0 14 1
                                    1 0 0 0 1 1 0 0 14 1 1 0 88 0 1 1 38 42 0 1
                                    1 2 0 0 1 1 0 60 0 1 0 0 48 1 0 0 62 1 1 10
                                    0 0 1 1 10 0 0 1 3 0 0 0 0 0 1 2 0 40 0 0 1
                                    1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1
                                    1 10 9 0 1 2 0 0 0 0 1 2 0 40 0 0 1 1 10 0
                                    0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0
                                    0 1 1 10 0 0 1 1 35 0 0 1 2 11 0 0 38 1 2 3
                                    0 0 14 1 2 10 0 0 0 1 2 0 0 0 48 1 2 0 0 0
                                    65 1 0 0 0 1 0 0 0 1 1 19 0 0 1 2 19 0 0 48
                                    1 2 18 0 0 72 1 3 18 0 0 72 48 1 2 18 0 0
                                    73 1 3 18 0 0 73 77 1 3 0 0 0 63 48 1 2 0 0
                                    0 63 1 2 0 40 0 0 1 2 0 40 0 0 1 2 0 40 0 0
                                    1 2 0 40 0 0 1 2 0 40 0 0 1 2 3 0 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 3 0 38 0 1
                                    2 3 0 0 38 1 2 0 0 0 9 1 2 0 0 9 0 1 2 0 0
                                    48 0 1 2 0 0 14 0 1 2 0 0 0 0 1 2 0 0 65 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineComplex| 'NILADIC T) 
