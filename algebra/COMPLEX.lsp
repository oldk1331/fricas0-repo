
(SDEFUN |COMPLEX;writeOMComplex| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 10))
             (SPADCALL |dev| "complex1" "complex_cartesian" (QREFELT $ 12))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 14))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 14))
             (EXIT (SPADCALL |dev| (QREFELT $ 16))))) 

(SDEFUN |COMPLEX;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
             (|COMPLEX;writeOMComplex| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))))) 

(SDEFUN |COMPLEX;Zero;$;3| (($ $))
        (CONS (|spadConstant| $ 22) (|spadConstant| $ 22))) 

(SDEFUN |COMPLEX;One;$;4| (($ $))
        (CONS (|spadConstant| $ 24) (|spadConstant| $ 22))) 

(SDEFUN |COMPLEX;zero?;$B;5| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (QREFELT $ 25))
          (SPADCALL (QCDR |x|) (QREFELT $ 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;one?;$B;6| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| $ 24) (QREFELT $ 27))
          (SPADCALL (QCDR |x|) (QREFELT $ 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;coerce;R$;7| ((|r| R) ($ $)) (CONS |r| (|spadConstant| $ 22))) 

(PUT '|COMPLEX;complex;2R$;8| '|SPADreplace| 'CONS) 

(SDEFUN |COMPLEX;complex;2R$;8| ((|r| R) (|i| R) ($ $)) (CONS |r| |i|)) 

(PUT '|COMPLEX;real;$R;9| '|SPADreplace| 'QCAR) 

(SDEFUN |COMPLEX;real;$R;9| ((|x| $) ($ R)) (QCAR |x|)) 

(PUT '|COMPLEX;imag;$R;10| '|SPADreplace| 'QCDR) 

(SDEFUN |COMPLEX;imag;$R;10| ((|x| $) ($ R)) (QCDR |x|)) 

(SDEFUN |COMPLEX;+;3$;11| ((|x| $) (|y| $) ($ $))
        (CONS (|add_DF| (QCAR |x|) (QCAR |y|))
              (|add_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;-;3$;12| ((|x| $) (|y| $) ($ $))
        (CONS (|sub_DF| (QCAR |x|) (QCAR |y|))
              (|sub_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;*;3$;13| ((|x| $) (|y| $) ($ $))
        (CONS
         (|sub_DF| (|mul_DF| (QCAR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |x|) (QCDR |y|)))
         (|add_DF| (|mul_DF| (QCDR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |y|) (QCAR |x|))))) 

(SDEFUN |COMPLEX;+;3$;14| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 34))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 34)))) 

(SDEFUN |COMPLEX;-;3$;15| ((|x| $) (|y| $) ($ $))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 35))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 35)))) 

(SDEFUN |COMPLEX;*;3$;16| ((|x| $) (|y| $) ($ $))
        (CONS
         (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 36))
                   (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 36))
                   (QREFELT $ 35))
         (SPADCALL (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 36))
                   (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT $ 36))
                   (QREFELT $ 34)))) 

(SDEFUN |COMPLEX;exquo;2$U;17| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL (QCDR |y|) (QREFELT $ 25))
          (SPADCALL |x| (QCAR |y|) (QREFELT $ 38)))
         ('T
          (SPADCALL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 39)) (QREFELT $ 33))
                    (SPADCALL |y| (QREFELT $ 40)) (QREFELT $ 38))))) 

(DECLAIM (NOTINLINE |Complex;|)) 

(DEFUN |Complex| (#1=#:G2490)
  (SPROG NIL
         (PROG (#2=#:G2491)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Complex|)
                                               '|domainEqualList|)
                    . #3=(|Complex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Complex;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Complex|)))))))))) 

(DEFUN |Complex;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2486 NIL) (#2=#:G2487 NIL) (#3=#:G2488 NIL)
    (#4=#:G2489 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Complex|))
    (LETT |dv$| (LIST '|Complex| DV$1) . #5#)
    (LETT $ (GETREFV 97) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|FiniteFieldCategory|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Field|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         #3#)
                                        (|HasCategory| |#1|
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|additiveValuation|))
                                        (|HasCategory| |#1|
                                                       '(|multiplicativeValuation|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1|
                                                       '(|RealNumberSystem|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RealNumberSystem|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|EuclideanDomain|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#)
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|EuclideanDomain|))
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                              . #5#)
                                        (OR #1#
                                            (AND #4#
                                                 (|HasCategory| |#1|
                                                                '(|PolynomialFactorizationExplicit|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|))))
                                        (OR #1# #4#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|))
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|)))
                                            #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#)
                                        (OR #1# #4# #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Complex| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|EuclideanDomain|))
           (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
           (|HasCategory| $ '(|CharacteristicNonZero|)))
      (|HasCategory| |#1| '(|FiniteFieldCategory|)))
     (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|EuclideanDomain|))
              (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 17592186044416))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |real| |#1|) (|:| |imag| |#1|)))
    (COND
     ((|testBitVector| |pv$| 31)
      (PROGN
       (QSETREFV $ 20
                 (CONS (|dispatchFunction| |COMPLEX;OMwrite;Omd$BV;2|) $)))))
    (COND
     ((|domainEqual| |#1| (|DoubleFloat|))
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |COMPLEX;+;3$;11|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |COMPLEX;-;3$;12|) $))
       (QSETREFV $ 33 (CONS (|dispatchFunction| |COMPLEX;*;3$;13|) $))))
     ('T
      (PROGN
       (QSETREFV $ 31 (CONS (|dispatchFunction| |COMPLEX;+;3$;14|) $))
       (QSETREFV $ 32 (CONS (|dispatchFunction| |COMPLEX;-;3$;15|) $))
       (QSETREFV $ 33 (CONS (|dispatchFunction| |COMPLEX;*;3$;16|) $)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (QSETREFV $ 41 (CONS (|dispatchFunction| |COMPLEX;exquo;2$U;17|) $))))
    $))) 

(MAKEPROP '|Complex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Void|)
              (|OpenMathDevice|) (0 . |OMputApp|) (|String|)
              (5 . |OMputSymbol|) |COMPLEX;real;$R;9| (12 . |OMwrite|)
              |COMPLEX;imag;$R;10| (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) (33 . |OMwrite|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;Zero;$;3|) $))
              (40 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;One;$;4|) $))
              (44 . |One|) (48 . |zero?|) |COMPLEX;zero?;$B;5| (53 . =)
              |COMPLEX;one?;$B;6| |COMPLEX;coerce;R$;7| |COMPLEX;complex;2R$;8|
              (59 . +) (65 . -) (71 . *) (77 . +) (83 . -) (89 . *)
              (|Union| $ '#1="failed") (95 . |exquo|) (101 . |conjugate|)
              (106 . |norm|) (111 . |exquo|) (|Factored| 43)
              (|SparseUnivariatePolynomial| $) (|Union| 45 '#2="failed")
              (|List| 43) (|Integer|) (|Fraction| 46)
              (|Record| (|:| |r| 6) (|:| |phi| 6)) (|Union| 69 '#2#)
              (|Matrix| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 46)
              (|NonNegativeInteger|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Union| 58 '"failed")
              (|Record| (|:| |coef| 58) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 62 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|List| 66) (|Equation| 6) (|List| 6) (|Matrix| 6) (|Vector| $)
              (|Mapping| 6 6) (|Fraction| 72) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|Union| 56 '"failed")
              (|OnePointCompletion| 73)
              (|Record| (|:| |factor| 46) (|:| |exponent| 46)) (|List| 76)
              (|Table| 73 56)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|Symbol|)
              (|List| 80) (|Union| 47 '#1#) (|Matrix| 46)
              (|Record| (|:| |mat| 83) (|:| |vec| (|Vector| 46))) (|List| 56)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 46 $)
              (|Complex| (|DoubleFloat|)) (|Complex| (|Float|))
              (|Union| 46 '#3="failed")
              (|Record| (|:| |mat| 68) (|:| |vec| 93)) (|Union| 6 '#3#)
              (|Vector| 6) (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(~= 117 |zero?| 123 |unitNormal| 128 |unitCanonical| 133 |unit?|
              138 |traceMatrix| 143 |trace| 152 |tanh| 157 |tan| 162
              |tableForDiscreteLogarithm| 167 |subtractIfCan| 172
              |squareFreePolynomial| 178 |squareFreePart| 183 |squareFree| 188
              |sqrt| 193 |solveLinearPolynomialEquation| 198 |smaller?| 204
              |sizeLess?| 210 |size| 216 |sinh| 220 |sin| 225 |sech| 230 |sec|
              235 |sample| 240 |rightRecip| 244 |rightPower| 249 |retractIfCan|
              261 |retract| 276 |represents| 291 |representationType| 302 |rem|
              306 |regularRepresentation| 312 |reducedSystem| 323 |reduce| 345
              |recip| 355 |real| 360 |rationalIfCan| 365 |rational?| 370
              |rational| 375 |rank| 380 |random| 384 |quo| 388 |principalIdeal|
              394 |primitiveElement| 399 |primitive?| 403 |primeFrobenius| 408
              |prime?| 419 |polarCoordinates| 424 |pi| 429 |patternMatch| 433
              |order| 447 |opposite?| 457 |one?| 463 |nthRoot| 468 |norm| 474
              |nextItem| 479 |multiEuclidean| 484 |minimalPolynomial| 490 |map|
              495 |lookup| 501 |log| 506 |lift| 511 |leftRecip| 516 |leftPower|
              521 |lcmCoef| 533 |lcm| 539 |latex| 550 |inv| 555 |init| 560
              |index| 564 |imaginary| 569 |imag| 573 |hashUpdate!| 578 |hash|
              584 |generator| 589 |gcdPolynomial| 593 |gcd| 599
              |factorsOfCyclicGroupSize| 610 |factorSquareFreePolynomial| 614
              |factorPolynomial| 619 |factor| 624 |extendedEuclidean| 629
              |exquo| 642 |expressIdealMember| 654 |exp| 660 |eval| 665
              |euclideanSize| 705 |enumerate| 710 |elt| 714 |divide| 720
              |discriminant| 726 |discreteLog| 735 |differentiate| 746
              |derivationCoordinates| 796 |definingPolynomial| 802 |csch| 806
              |csc| 811 |createPrimitiveElement| 816 |coth| 820 |cot| 825
              |cosh| 830 |cos| 835 |coordinates| 840 |convert| 862 |conjugate|
              907 |conditionP| 912 |complex| 917 |commutator| 923 |coerce| 929
              |charthRoot| 954 |characteristicPolynomial| 964 |characteristic|
              969 |basis| 973 |atanh| 977 |atan| 982 |associator| 987
              |associates?| 994 |asinh| 1000 |asin| 1005 |asech| 1010 |asec|
              1015 |argument| 1020 |antiCommutator| 1025 |annihilate?| 1031
              |acsch| 1037 |acsc| 1042 |acoth| 1047 |acot| 1052 |acosh| 1057
              |acos| 1062 |abs| 1067 ^ 1072 |Zero| 1102 |One| 1106 |OMwrite|
              1110 D 1134 = 1184 / 1190 - 1196 + 1207 * 1213)
           'NIL
           (CONS
            (|makeByteWordVec2| 40
                                '(0 0 2 2 4 39 17 40 17 0 36 0 0 0 3 11 35 0 0
                                  0 1 3 5 9 10 20 22 23 0 0 0 0 0 3 10 0 0 0 0
                                  3 0 0 0 0 0 3 3 0 0 0 0 0 0 0 0 0 6 0 0 0 2
                                  21 27 28 0 0 0 12 25 0 0 0 0 0 0 0 3 3 7 8 10
                                  13 12 12 12 12 12 14 15 15 16 18 19 24 25 26
                                  29 30 31))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitOver&| |DivisionRing&| NIL NIL |Algebra&|
                NIL NIL NIL |Algebra&| NIL NIL |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Rng&| NIL
                |Module&| NIL |Module&| |Module&| |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |FullyEvalableOver&| |Magma&| |AbelianSemiGroup&| NIL
                NIL NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |TranscendentalFunctionCategory&| |Evalable&| NIL
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL |OpenMath&|)
             (CONS
              '#((|ComplexCategory| 6)
                 (|MonogenicAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|GcdDomain|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DifferentialExtension| 6) (|FullyLinearlyExplicitOver| 6)
                 (|DivisionRing|) (|LeftOreRing|) (|IntegralDomain|)
                 (|Algebra| 6) (|LinearlyExplicitOver| 6) (|CommutativeRing|)
                 (|CharacteristicZero|) (|Algebra| 47)
                 (|CharacteristicNonZero|) (|LinearlyExplicitOver| 46)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 80)
                 (|DifferentialRing|) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 6) (|SemiRng|) (|Module| 47) (|Module| $$)
                 (|FramedModule| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 47 47) (|RightModule| 6)
                 (|LeftModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 47) (|RightModule| 47)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|FullyPatternMatchable| 6)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|FullyEvalableOver| 6) (|Magma|)
                 (|AbelianSemiGroup|) (|StepThrough|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 46)
                 (|Patternable| 6) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 6) (|Type|)
                 (|RetractableTo| 6)
                 (|ConvertibleTo| (|SparseUnivariatePolynomial| 6))
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 95) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| 47) (|RetractableTo| 46)
                 (|noZeroDivisors|) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 89) (|ConvertibleTo| 88) (|ConvertibleTo| 53)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 80 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|ConvertibleTo| 54) (|ConvertibleTo| 55) (|OpenMath|))
              (|makeByteWordVec2| 96
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 6 8 9 0 14 1
                                    9 8 0 16 1 9 8 0 17 1 9 8 0 18 3 0 8 9 0 19
                                    20 0 6 0 22 0 6 0 24 1 6 19 0 25 2 6 19 0 0
                                    27 2 0 0 0 0 31 2 0 0 0 0 32 2 0 0 0 0 33 2
                                    6 0 0 0 34 2 6 0 0 0 35 2 6 0 0 0 36 2 0 37
                                    0 6 38 1 0 0 0 39 1 0 6 0 40 2 0 37 0 0 41
                                    2 0 19 0 0 1 1 0 19 0 26 1 43 52 0 1 1 43 0
                                    0 1 1 43 19 0 1 0 0 68 1 1 0 68 69 1 1 0 6
                                    0 1 1 12 0 0 1 1 12 0 0 1 1 2 78 46 1 2 0
                                    37 0 0 1 1 38 42 43 1 1 42 0 0 1 1 42 51 0
                                    1 1 13 0 0 1 2 38 44 45 43 1 2 21 19 0 0 1
                                    2 11 19 0 0 1 0 6 56 1 1 12 0 0 1 1 12 0 0
                                    1 1 12 0 0 1 1 12 0 0 1 0 0 0 1 1 0 37 0 1
                                    2 0 0 0 56 1 2 0 0 0 73 1 1 7 82 0 1 1 8 90
                                    0 1 1 0 92 0 1 1 7 47 0 1 1 8 46 0 1 1 0 6
                                    0 1 1 0 0 93 1 2 0 0 93 69 1 0 2 79 1 2 11
                                    0 0 0 1 1 0 68 0 1 2 0 68 0 69 1 1 9 83 50
                                    1 2 9 84 50 69 1 1 0 68 50 1 2 0 91 50 69 1
                                    1 3 37 71 1 1 0 0 72 1 1 0 37 0 1 1 0 6 0
                                    13 1 34 82 0 1 1 34 19 0 1 1 34 47 0 1 0 0
                                    73 1 0 6 0 1 2 11 0 0 0 1 1 11 60 58 1 0 2
                                    0 1 1 2 19 0 1 1 2 0 0 1 2 2 0 0 56 1 1 42
                                    19 0 1 1 33 48 0 1 0 12 0 1 3 27 86 0 54 86
                                    1 3 28 87 0 55 87 1 1 2 75 0 1 1 2 73 0 1 2
                                    0 19 0 0 1 1 0 19 0 28 2 13 0 0 46 1 1 0 6
                                    0 40 1 2 37 0 1 2 11 59 58 0 1 1 3 72 0 1 2
                                    0 0 70 0 1 1 6 73 0 1 1 12 0 0 1 1 0 72 0 1
                                    1 0 37 0 1 2 0 0 0 56 1 2 0 0 0 73 1 2 11
                                    57 0 0 1 1 11 0 58 1 2 11 0 0 0 1 1 0 11 0
                                    1 1 3 0 0 1 0 2 0 1 1 6 0 73 1 0 0 0 1 1 0
                                    6 0 15 2 0 94 94 0 1 1 0 96 0 1 0 0 0 1 2
                                    11 43 43 43 1 2 11 0 0 0 1 1 11 0 58 1 0 2
                                    77 1 1 38 42 43 1 1 38 42 43 1 1 42 51 0 1
                                    3 11 63 0 0 0 1 2 11 64 0 0 1 2 43 37 0 0
                                    41 2 10 37 0 6 38 2 11 59 58 0 1 1 12 0 0 1
                                    2 25 0 0 65 1 2 25 0 0 66 1 3 25 0 0 67 67
                                    1 3 25 0 0 6 6 1 3 24 0 0 80 6 1 3 24 0 0
                                    81 67 1 1 11 56 0 1 0 6 58 1 2 26 0 0 6 1 2
                                    11 61 0 0 1 0 0 6 1 1 0 6 69 1 2 2 74 0 0 1
                                    1 2 56 0 1 2 23 0 0 56 1 1 23 0 0 1 3 22 0
                                    0 80 56 1 3 22 0 0 81 85 1 2 22 0 0 81 1 2
                                    22 0 0 80 1 2 0 0 0 70 1 3 0 0 0 70 56 1 2
                                    3 68 69 70 1 0 0 72 1 1 12 0 0 1 1 12 0 0 1
                                    0 2 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 0 93 0 1 1 0 68 69 1 2 0 68 69
                                    69 1 2 0 93 0 69 1 1 16 53 0 1 1 29 54 0 1
                                    1 30 55 0 1 1 15 88 0 1 1 15 89 0 1 1 0 0
                                    72 1 1 0 72 0 1 1 0 93 0 1 1 0 0 93 1 1 0 0
                                    0 39 1 44 49 50 1 2 0 0 6 6 30 2 0 0 0 0 1
                                    1 43 0 0 1 1 41 0 47 1 1 0 0 6 29 1 0 0 46
                                    1 1 0 95 0 1 1 45 37 0 1 1 2 0 0 1 1 0 72 0
                                    1 0 0 56 1 0 0 69 1 1 12 0 0 1 1 12 0 0 1 3
                                    0 0 0 0 0 1 2 43 19 0 0 1 1 12 0 0 1 1 12 0
                                    0 1 1 12 0 0 1 1 12 0 0 1 1 12 6 0 1 2 0 0
                                    0 0 1 2 0 19 0 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    32 0 0 1 2 13 0 0 47 1 2 3 0 0 46 1 2 12 0
                                    0 0 1 2 0 0 0 56 1 2 0 0 0 73 1 0 0 0 21 0
                                    0 0 23 1 31 11 0 1 2 31 8 9 0 1 2 31 11 0
                                    19 1 3 31 8 9 0 19 20 2 23 0 0 56 1 1 23 0
                                    0 1 3 22 0 0 80 56 1 3 22 0 0 81 85 1 2 22
                                    0 0 80 1 2 22 0 0 81 1 2 0 0 0 70 1 3 0 0 0
                                    70 56 1 2 0 19 0 0 1 2 3 0 0 0 1 2 0 0 0 0
                                    32 1 0 0 0 1 2 0 0 0 0 31 2 3 0 0 47 1 2 3
                                    0 47 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 56 0
                                    1 2 0 0 46 0 1 2 0 0 0 0 33 2 0 0 73 0
                                    1)))))
           '|lookupComplete|)) 
