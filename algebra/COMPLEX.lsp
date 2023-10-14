
(DEFUN |COMPLEX;writeOMComplex| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 10))
       (SPADCALL |dev| "complex1" "complex_cartesian" (QREFELT $ 12))
       (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 14))
       (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 14))
       (EXIT (SPADCALL |dev| (QREFELT $ 16))))) 

(DEFUN |COMPLEX;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|COMPLEX;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 18)) (QREFELT $ 19))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 20))
          (|COMPLEX;writeOMComplex| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 21)) (SPADCALL |dev| (QREFELT $ 22))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |COMPLEX;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|COMPLEX;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 18)) (QREFELT $ 19))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 20))))
          (|COMPLEX;writeOMComplex| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 21))))
          (SPADCALL |dev| (QREFELT $ 22))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |COMPLEX;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 20)) (|COMPLEX;writeOMComplex| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 21))))) 

(DEFUN |COMPLEX;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 20))))
       (|COMPLEX;writeOMComplex| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 21))))))) 

(DEFUN |COMPLEX;Zero;$;6| ($)
  (CONS (|spadConstant| $ 29) (|spadConstant| $ 29))) 

(DEFUN |COMPLEX;One;$;7| ($) (CONS (|spadConstant| $ 31) (|spadConstant| $ 29))) 

(DEFUN |COMPLEX;zero?;$B;8| (|x| $)
  (COND
   ((SPADCALL (QCAR |x|) (QREFELT $ 32)) (SPADCALL (QCDR |x|) (QREFELT $ 32)))
   ('T 'NIL))) 

(DEFUN |COMPLEX;one?;$B;9| (|x| $)
  (COND
   ((SPADCALL (QCAR |x|) (|spadConstant| $ 31) (QREFELT $ 34))
    (SPADCALL (QCDR |x|) (QREFELT $ 32)))
   ('T 'NIL))) 

(DEFUN |COMPLEX;coerce;R$;10| (|r| $) (CONS |r| (|spadConstant| $ 29))) 

(PUT '|COMPLEX;complex;2R$;11| '|SPADreplace| 'CONS) 

(DEFUN |COMPLEX;complex;2R$;11| (|r| |i| $) (CONS |r| |i|)) 

(PUT '|COMPLEX;real;$R;12| '|SPADreplace| 'QCAR) 

(DEFUN |COMPLEX;real;$R;12| (|x| $) (QCAR |x|)) 

(PUT '|COMPLEX;imag;$R;13| '|SPADreplace| 'QCDR) 

(DEFUN |COMPLEX;imag;$R;13| (|x| $) (QCDR |x|)) 

(DEFUN |COMPLEX;+;3$;14| (|x| |y| $)
  (CONS (|add_DF| (QCAR |x|) (QCAR |y|)) (|add_DF| (QCDR |x|) (QCDR |y|)))) 

(DEFUN |COMPLEX;-;3$;15| (|x| |y| $)
  (CONS (|sub_DF| (QCAR |x|) (QCAR |y|)) (|sub_DF| (QCDR |x|) (QCDR |y|)))) 

(DEFUN |COMPLEX;*;3$;16| (|x| |y| $)
  (CONS
   (|sub_DF| (|mul_DF| (QCAR |x|) (QCAR |y|)) (|mul_DF| (QCDR |x|) (QCDR |y|)))
   (|add_DF| (|mul_DF| (QCDR |x|) (QCAR |y|))
             (|mul_DF| (QCDR |y|) (QCAR |x|))))) 

(DEFUN |COMPLEX;+;3$;17| (|x| |y| $)
  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 41))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 41)))) 

(DEFUN |COMPLEX;-;3$;18| (|x| |y| $)
  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 42))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 42)))) 

(DEFUN |COMPLEX;*;3$;19| (|x| |y| $)
  (CONS
   (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 43))
             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 43)) (QREFELT $ 42))
   (SPADCALL (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT $ 43))
             (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT $ 43)) (QREFELT $ 41)))) 

(DEFUN |COMPLEX;exquo;2$U;20| (|x| |y| $)
  (COND
   ((SPADCALL (QCDR |y|) (QREFELT $ 32))
    (SPADCALL |x| (QCAR |y|) (QREFELT $ 45)))
   ('T
    (SPADCALL (SPADCALL |x| (SPADCALL |y| (QREFELT $ 46)) (QREFELT $ 40))
              (SPADCALL |y| (QREFELT $ 47)) (QREFELT $ 45))))) 

(DECLAIM (NOTINLINE |Complex;|)) 

(DEFUN |Complex| (#1=#:G2512)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2513)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Complex|))))))))))) 

(DEFUN |Complex;| (|#1|)
  (PROG (|pv$| #1=#:G2508 #2=#:G2509 #3=#:G2510 #4=#:G2511 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|Complex|))
      (LETT |dv$| (LIST '|Complex| DV$1) . #5#)
      (LETT $ (GETREFV 104) . #5#)
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
                                                         '(|LinearlyExplicitRingOver|
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
                                          (|HasCategory| |#1|
                                                         '(|RealConstant|))
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
                                                               (|devaluate|
                                                                |#1|)
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
         (QSETREFV $ 23 (CONS (|dispatchFunction| |COMPLEX;OMwrite;$S;2|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |COMPLEX;OMwrite;$BS;3|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |COMPLEX;OMwrite;Omd$V;4|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |COMPLEX;OMwrite;Omd$BV;5|) $)))))
      (COND
       ((|domainEqual| |#1| (|DoubleFloat|))
        (PROGN
         (QSETREFV $ 38 (CONS (|dispatchFunction| |COMPLEX;+;3$;14|) $))
         (QSETREFV $ 39 (CONS (|dispatchFunction| |COMPLEX;-;3$;15|) $))
         (QSETREFV $ 40 (CONS (|dispatchFunction| |COMPLEX;*;3$;16|) $))))
       ('T
        (PROGN
         (QSETREFV $ 38 (CONS (|dispatchFunction| |COMPLEX;+;3$;17|) $))
         (QSETREFV $ 39 (CONS (|dispatchFunction| |COMPLEX;-;3$;18|) $))
         (QSETREFV $ 40 (CONS (|dispatchFunction| |COMPLEX;*;3$;19|) $)))))
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 48 (CONS (|dispatchFunction| |COMPLEX;exquo;2$U;20|) $))))
      $)))) 

(MAKEPROP '|Complex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Void|)
              (|OpenMathDevice|) (0 . |OMputApp|) (|String|)
              (5 . |OMputSymbol|) |COMPLEX;real;$R;12| (12 . |OMwrite|)
              |COMPLEX;imag;$R;13| (18 . |OMputEndApp|) (|OpenMathEncoding|)
              (23 . |OMencodingXML|) (27 . |OMopenString|) (33 . |OMputObject|)
              (38 . |OMputEndObject|) (43 . |OMclose|) (48 . |OMwrite|)
              (|Boolean|) (53 . |OMwrite|) (59 . |OMwrite|) (65 . |OMwrite|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;Zero;$;6|) $))
              (72 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;One;$;7|) $))
              (76 . |One|) (80 . |zero?|) |COMPLEX;zero?;$B;8| (85 . =)
              |COMPLEX;one?;$B;9| |COMPLEX;coerce;R$;10|
              |COMPLEX;complex;2R$;11| (91 . +) (97 . -) (103 . *) (109 . +)
              (115 . -) (121 . *) (|Union| $ '#1="failed") (127 . |exquo|)
              (133 . |conjugate|) (138 . |norm|) (143 . |exquo|)
              (|Factored| 50) (|SparseUnivariatePolynomial| $)
              (|Union| 52 '#2="failed") (|List| 50) (|Integer|) (|Fraction| 53)
              (|Record| (|:| |r| 6) (|:| |phi| 6)) (|Union| 76 '#2#)
              (|Matrix| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 53)
              (|NonNegativeInteger|)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 65) (|:| |generator| $))
              (|Union| 65 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 70 '"failed")
              (|List| 73) (|Equation| 6) (|List| 6) (|Matrix| 6) (|Vector| $)
              (|Mapping| 6 6) (|Fraction| 79) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|OnePointCompletion| 80)
              (|Union| 63 '"failed")
              (|Record| (|:| |factor| 53) (|:| |exponent| 53)) (|List| 83)
              (|Table| 80 63)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|Symbol|)
              (|List| 87) (|Union| 54 '#1#)
              (|Record| (|:| |mat| 91) (|:| |vec| (|Vector| 53))) (|Matrix| 53)
              (|List| 63) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 53 $) (|Complex| (|Float|))
              (|Complex| (|DoubleFloat|)) (|Union| 53 '#3="failed")
              (|Record| (|:| |mat| 75) (|:| |vec| 100)) (|Union| 6 '#3#)
              (|Vector| 6) (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(~= 149 |zero?| 155 |unitNormal| 160 |unitCanonical| 165 |unit?|
              170 |traceMatrix| 175 |trace| 184 |tanh| 189 |tan| 194
              |tableForDiscreteLogarithm| 199 |subtractIfCan| 204
              |squareFreePolynomial| 210 |squareFreePart| 215 |squareFree| 220
              |sqrt| 225 |solveLinearPolynomialEquation| 230 |smaller?| 236
              |sizeLess?| 242 |size| 248 |sinh| 252 |sin| 257 |sech| 262 |sec|
              267 |sample| 272 |retractIfCan| 276 |retract| 291 |represents|
              306 |representationType| 317 |rem| 321 |regularRepresentation|
              327 |reducedSystem| 338 |reduce| 360 |recip| 370 |real| 375
              |rationalIfCan| 380 |rational?| 385 |rational| 390 |rank| 395
              |random| 399 |quo| 403 |principalIdeal| 409 |primitiveElement|
              414 |primitive?| 418 |primeFrobenius| 423 |prime?| 434
              |polarCoordinates| 439 |pi| 444 |patternMatch| 448 |order| 462
              |opposite?| 472 |one?| 478 |nthRoot| 483 |norm| 489 |nextItem|
              494 |multiEuclidean| 499 |minimalPolynomial| 505 |map| 510
              |lookup| 516 |log| 521 |lift| 526 |lcmCoef| 531 |lcm| 537 |latex|
              548 |inv| 553 |init| 558 |index| 562 |imaginary| 567 |imag| 571
              |hashUpdate!| 576 |hash| 582 |generator| 587 |gcdPolynomial| 591
              |gcd| 597 |factorsOfCyclicGroupSize| 608
              |factorSquareFreePolynomial| 612 |factorPolynomial| 617 |factor|
              622 |extendedEuclidean| 627 |exquo| 640 |expressIdealMember| 652
              |exp| 658 |eval| 663 |euclideanSize| 703 |enumerate| 708 |elt|
              712 |divide| 718 |discriminant| 724 |discreteLog| 733
              |differentiate| 744 |derivationCoordinates| 794
              |definingPolynomial| 800 |csch| 804 |csc| 809
              |createPrimitiveElement| 814 |coth| 818 |cot| 823 |cosh| 828
              |cos| 833 |coordinates| 838 |convert| 860 |conjugate| 905
              |conditionP| 910 |complex| 915 |coerce| 921 |charthRoot| 946
              |characteristicPolynomial| 956 |characteristic| 961 |basis| 965
              |atanh| 969 |atan| 974 |associates?| 979 |asinh| 985 |asin| 990
              |asech| 995 |asec| 1000 |argument| 1005 |annihilate?| 1010
              |acsch| 1016 |acsc| 1021 |acoth| 1026 |acot| 1031 |acosh| 1036
              |acos| 1041 |abs| 1046 ^ 1051 |Zero| 1081 |One| 1085 |OMwrite|
              1089 D 1113 = 1163 / 1169 - 1175 + 1186 * 1192)
           'NIL
           (CONS
            (|makeByteWordVec2| 40
                                '(0 0 2 2 4 39 17 40 17 0 36 0 3 35 0 0 0 3 10
                                  11 0 0 0 1 3 5 9 10 20 22 23 0 0 0 3 0 0 0 0
                                  0 3 3 0 0 0 0 0 0 0 0 0 0 6 2 21 27 28 0 0 0
                                  12 25 0 0 0 0 0 0 0 3 3 7 8 10 13 12 12 12 12
                                  12 14 15 15 16 18 19 24 25 26 29 30 31))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DivisionRing&| NIL |Algebra&|
                |DifferentialExtension&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| NIL NIL NIL |Module&| NIL |Module&| NIL
                NIL |Module&| |EntireRing&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&|
                |Finite&| NIL NIL NIL NIL NIL |FullyRetractableTo&|
                |SetCategory&| |TranscendentalFunctionCategory&| |Evalable&|
                NIL |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL NIL)
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
                 (|DivisionRing|) (|IntegralDomain|) (|Algebra| 6)
                 (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 54)
                 (|Algebra| $$) (|LeftOreRing|) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| 6) (|CharacteristicZero|)
                 (|Module| 54) (|CharacteristicNonZero|)
                 (|LinearlyExplicitRingOver| 53) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 87) (|DifferentialRing|)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 54 54) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|RightModule| 6) (|LeftModule| 6) (|LeftModule| 54)
                 (|RightModule| 54) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|FullyPatternMatchable| 6) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|FullyEvalableOver| 6) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Finite|) (|StepThrough|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 53)
                 (|Patternable| 6) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|Evalable| 6) (|Type|)
                 (|RetractableTo| 6)
                 (|ConvertibleTo| (|SparseUnivariatePolynomial| 6))
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 102) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| 54) (|RetractableTo| 53)
                 (|noZeroDivisors|) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 95) (|ConvertibleTo| 96) (|ConvertibleTo| 60)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 87 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|ConvertibleTo| 61) (|ConvertibleTo| 62) (|OpenMath|))
              (|makeByteWordVec2| 103
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 6 8 9 0 14 1
                                    9 8 0 16 0 17 0 18 2 9 0 11 17 19 1 9 8 0
                                    20 1 9 8 0 21 1 9 8 0 22 1 0 11 0 23 2 0 11
                                    0 24 25 2 0 8 9 0 26 3 0 8 9 0 24 27 0 6 0
                                    29 0 6 0 31 1 6 24 0 32 2 6 24 0 0 34 2 0 0
                                    0 0 38 2 0 0 0 0 39 2 0 0 0 0 40 2 6 0 0 0
                                    41 2 6 0 0 0 42 2 6 0 0 0 43 2 0 44 0 6 45
                                    1 0 0 0 46 1 0 6 0 47 2 0 44 0 0 48 2 0 24
                                    0 0 1 1 0 24 0 33 1 43 59 0 1 1 43 0 0 1 1
                                    43 24 0 1 0 0 75 1 1 0 75 76 1 1 0 6 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 2 85 53 1 2 0 44 0 0
                                    1 1 38 49 50 1 1 42 0 0 1 1 42 58 0 1 1 13
                                    0 0 1 2 38 51 52 50 1 2 21 24 0 0 1 2 11 24
                                    0 0 1 0 6 63 1 1 12 0 0 1 1 12 0 0 1 1 12 0
                                    0 1 1 12 0 0 1 0 0 0 1 1 7 89 0 1 1 8 97 0
                                    1 1 0 99 0 1 1 7 54 0 1 1 8 53 0 1 1 0 6 0
                                    1 1 0 0 100 1 2 0 0 100 76 1 0 2 86 1 2 11
                                    0 0 0 1 1 0 75 0 1 2 0 75 0 76 1 2 9 90 57
                                    76 1 1 9 91 57 1 2 0 98 57 76 1 1 0 75 57 1
                                    1 3 44 78 1 1 0 0 79 1 1 0 44 0 1 1 0 6 0
                                    13 1 34 89 0 1 1 34 24 0 1 1 34 54 0 1 0 0
                                    80 1 0 6 0 1 2 11 0 0 0 1 1 11 66 65 1 0 2
                                    0 1 1 2 24 0 1 1 2 0 0 1 2 2 0 0 63 1 1 42
                                    24 0 1 1 33 55 0 1 0 12 0 1 3 27 93 0 61 93
                                    1 3 28 94 0 62 94 1 1 2 81 0 1 1 2 80 0 1 2
                                    0 24 0 0 1 1 0 24 0 35 2 13 0 0 53 1 1 0 6
                                    0 47 1 2 44 0 1 2 11 67 65 0 1 1 3 79 0 1 2
                                    0 0 77 0 1 1 6 80 0 1 1 12 0 0 1 1 0 79 0 1
                                    2 11 64 0 0 1 2 11 0 0 0 1 1 11 0 65 1 1 0
                                    11 0 1 1 3 0 0 1 0 2 0 1 1 6 0 80 1 0 0 0 1
                                    1 0 6 0 15 2 0 101 101 0 1 1 0 103 0 1 0 0
                                    0 1 2 11 50 50 50 1 2 11 0 0 0 1 1 11 0 65
                                    1 0 2 84 1 1 38 49 50 1 1 38 49 50 1 1 42
                                    58 0 1 2 11 69 0 0 1 3 11 71 0 0 0 1 2 43
                                    44 0 0 48 2 10 44 0 6 45 2 11 67 65 0 1 1
                                    12 0 0 1 2 25 0 0 72 1 2 25 0 0 73 1 3 25 0
                                    0 74 74 1 3 25 0 0 6 6 1 3 24 0 0 87 6 1 3
                                    24 0 0 88 74 1 1 11 63 0 1 0 6 65 1 2 26 0
                                    0 6 1 2 11 68 0 0 1 0 0 6 1 1 0 6 76 1 2 2
                                    82 0 0 1 1 2 63 0 1 2 23 0 0 63 1 1 23 0 0
                                    1 3 22 0 0 88 92 1 3 22 0 0 87 63 1 2 22 0
                                    0 87 1 2 22 0 0 88 1 3 0 0 0 77 63 1 2 0 0
                                    0 77 1 2 3 75 76 77 1 0 0 79 1 1 12 0 0 1 1
                                    12 0 0 1 0 2 0 1 1 12 0 0 1 1 12 0 0 1 1 12
                                    0 0 1 1 12 0 0 1 1 0 75 76 1 1 0 100 0 1 2
                                    0 100 0 76 1 2 0 75 76 76 1 1 16 60 0 1 1
                                    29 61 0 1 1 30 62 0 1 1 15 95 0 1 1 15 96 0
                                    1 1 0 0 79 1 1 0 79 0 1 1 0 0 100 1 1 0 100
                                    0 1 1 0 0 0 46 1 44 56 57 1 2 0 0 6 6 37 1
                                    43 0 0 1 1 41 0 54 1 1 0 0 6 36 1 0 0 53 1
                                    1 0 102 0 1 1 45 44 0 1 1 2 0 0 1 1 0 79 0
                                    1 0 0 63 1 0 0 76 1 1 12 0 0 1 1 12 0 0 1 2
                                    43 24 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0
                                    1 1 12 0 0 1 1 12 6 0 1 2 0 24 0 0 1 1 12 0
                                    0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0
                                    0 1 1 12 0 0 1 1 32 0 0 1 2 13 0 0 54 1 2 3
                                    0 0 53 1 2 12 0 0 0 1 2 0 0 0 63 1 2 0 0 0
                                    80 1 0 0 0 28 0 0 0 30 1 31 11 0 23 2 31 8
                                    9 0 26 2 31 11 0 24 25 3 31 8 9 0 24 27 2
                                    23 0 0 63 1 1 23 0 0 1 3 22 0 0 87 63 1 3
                                    22 0 0 88 92 1 2 22 0 0 88 1 2 22 0 0 87 1
                                    3 0 0 0 77 63 1 2 0 0 0 77 1 2 0 24 0 0 1 2
                                    3 0 0 0 1 2 0 0 0 0 39 1 0 0 0 1 2 0 0 0 0
                                    38 2 3 0 0 54 1 2 3 0 54 0 1 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 0 0 0 0 40 2 0 0 53 0 1 2 0 0
                                    63 0 1 2 0 0 80 0 1)))))
           '|lookupComplete|)) 
