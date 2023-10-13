
(/VERSIONCHECK 2) 

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

(DEFUN |Complex| (#1=#:G2484)
  (PROG ()
    (RETURN
     (PROG (#2=#:G2485)
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
  (PROG (|pv$| #1=#:G2480 #2=#:G2481 #3=#:G2482 #4=#:G2483 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|Complex|))
      (LETT |dv$| (LIST '|Complex| DV$1) . #5#)
      (LETT $ (GETREFV 102) . #5#)
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
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|TranscendentalFunctionCategory|))
                                                . #5#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|RadicalCategory|))
                                           #3#)
                                          (|HasCategory| |#1|
                                                         '(|RealConstant|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1|
                                                         '(|additiveValuation|))
                                          (|HasCategory| |#1|
                                                         '(|multiplicativeValuation|))
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
                                          (|HasCategory| |#1|
                                                         '(|IntegerNumberSystem|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|EuclideanDomain|))
                                                . #5#)
                                          (OR #2# #4#
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #4#
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                          (OR #2# #4#
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|)))
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
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #4#)
                                          (OR #1# #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                          (OR #1#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|Complex| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND
       (OR
        (AND #2# (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
             (|HasCategory| $ '(|CharacteristicNonZero|)))
        (|HasCategory| |#1| '(|FiniteFieldCategory|)))
       (|augmentPredVector| $ 4398046511104))
      (AND
       (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
           (AND #2# (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|))))
       (|augmentPredVector| $ 8796093022208))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Record| (|:| |real| |#1|) (|:| |imag| |#1|)))
      (COND
       ((|testBitVector| |pv$| 28)
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
              (|Record| (|:| |r| 6) (|:| |phi| 6)) (|Union| 75 '#2#)
              (|Matrix| $) (|Factored| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 53)
              (|NonNegativeInteger|) (|List| $) (|Union| 64 '"failed")
              (|Record| (|:| |coef| 64) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 68 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|List| 72) (|Equation| 6) (|List| 6) (|Matrix| 6) (|Vector| $)
              (|Mapping| 6 6) (|Fraction| 78) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|Union| 63 '"failed")
              (|OnePointCompletion| 79)
              (|Record| (|:| |factor| 53) (|:| |exponent| 53)) (|List| 82)
              (|Table| 79 63)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|List| 87)
              (|Symbol|) (|Union| 54 '#1#)
              (|Record| (|:| |mat| 90) (|:| |vec| (|Vector| 53))) (|Matrix| 53)
              (|List| 63) (|PatternMatchResult| (|Float|) $)
              (|PatternMatchResult| 53 $) (|Complex| (|DoubleFloat|))
              (|Complex| (|Float|)) (|Union| 53 '#3="failed")
              (|Record| (|:| |mat| 74) (|:| |vec| 99)) (|Union| 6 '#3#)
              (|Vector| 6) (|OutputForm|) (|SingleInteger|))
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
              |one?| 472 |nthRoot| 477 |norm| 483 |nextItem| 488
              |multiEuclidean| 493 |minimalPolynomial| 499 |map| 504 |lookup|
              510 |log| 515 |lift| 520 |lcm| 525 |latex| 536 |inv| 541 |init|
              546 |index| 550 |imaginary| 555 |imag| 559 |hash| 564 |generator|
              569 |gcdPolynomial| 573 |gcd| 579 |factorsOfCyclicGroupSize| 590
              |factorSquareFreePolynomial| 594 |factorPolynomial| 599 |factor|
              604 |extendedEuclidean| 609 |exquo| 622 |expressIdealMember| 634
              |exp| 640 |eval| 645 |euclideanSize| 685 |enumerate| 690 |elt|
              694 |divide| 700 |discriminant| 706 |discreteLog| 715
              |differentiate| 726 |derivationCoordinates| 776
              |definingPolynomial| 782 |csch| 786 |csc| 791
              |createPrimitiveElement| 796 |coth| 800 |cot| 805 |cosh| 810
              |cos| 815 |coordinates| 820 |convert| 842 |conjugate| 887
              |conditionP| 892 |complex| 897 |coerce| 903 |charthRoot| 928
              |characteristicPolynomial| 938 |characteristic| 943 |basis| 947
              |atanh| 951 |atan| 956 |associates?| 961 |asinh| 967 |asin| 972
              |asech| 977 |asec| 982 |argument| 987 |acsch| 992 |acsc| 997
              |acoth| 1002 |acot| 1007 |acosh| 1012 |acos| 1017 |abs| 1022 ^
              1027 |Zero| 1057 |One| 1061 |OMwrite| 1065 D 1089 = 1139 / 1145 -
              1151 + 1162 * 1168)
           'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 0 2 2 4 38 35 39 35 0 34 0 3 33 0 0 0 3 10
                                  0 0 0 1 3 5 9 10 11 19 20 0 0 0 3 0 0 0 0 0 3
                                  3 0 0 0 0 0 0 0 0 0 0 6 2 18 24 25 0 0 0 12
                                  22 0 0 0 0 0 0 0 3 3 7 8 10 13 12 12 12 12 12
                                  14 14 15 16 17 21 22 23 26 27 28))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |FramedAlgebra&| |GcdDomain&|
                |FiniteRankAlgebra&| |DivisionRing&| |IntegralDomain&|
                |Algebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&| NIL NIL
                |Module&| NIL |Module&| NIL NIL |Module&| NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Ring&| NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |FullyEvalableOver&|
                |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL NIL NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&|
                |TranscendentalFunctionCategory&| |Evalable&| NIL
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL
                NIL NIL)
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
                 (|Algebra| $$) (|LinearlyExplicitRingOver| 6)
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
                 (|CoercibleTo| 100) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| 54) (|RetractableTo| 53)
                 (|noZeroDivisors|) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|ConvertibleTo| 95)
                 (|ConvertibleTo| 94) (|ConvertibleTo| 60)
                 (|additiveValuation|) (|multiplicativeValuation|)
                 (|InnerEvalable| 87 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$)
                 (|ConvertibleTo| 61) (|ConvertibleTo| 62) (|OpenMath|))
              (|makeByteWordVec2| 101
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 6 8 9 0 14 1
                                    9 8 0 16 0 17 0 18 2 9 0 11 17 19 1 9 8 0
                                    20 1 9 8 0 21 1 9 8 0 22 1 0 11 0 23 2 0 11
                                    0 24 25 2 0 8 9 0 26 3 0 8 9 0 24 27 0 6 0
                                    29 0 6 0 31 1 6 24 0 32 2 6 24 0 0 34 2 0 0
                                    0 0 38 2 0 0 0 0 39 2 0 0 0 0 40 2 6 0 0 0
                                    41 2 6 0 0 0 42 2 6 0 0 0 43 2 0 44 0 6 45
                                    1 0 0 0 46 1 0 6 0 47 2 0 44 0 0 48 2 0 24
                                    0 0 1 1 0 24 0 33 1 42 59 0 1 1 42 0 0 1 1
                                    42 24 0 1 0 0 74 1 1 0 74 75 1 1 0 6 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 2 84 53 1 2 0 44 0 0
                                    1 1 37 49 50 1 1 41 0 0 1 1 41 58 0 1 1 13
                                    0 0 1 2 37 51 52 50 1 2 18 24 0 0 1 2 32 24
                                    0 0 1 0 6 63 1 1 12 0 0 1 1 12 0 0 1 1 12 0
                                    0 1 1 12 0 0 1 0 0 0 1 1 7 88 0 1 1 8 96 0
                                    1 1 0 98 0 1 1 7 54 0 1 1 8 53 0 1 1 0 6 0
                                    1 1 0 0 99 1 2 0 0 99 75 1 0 2 85 1 2 32 0
                                    0 0 1 1 0 74 0 1 2 0 74 0 75 1 2 9 89 57 75
                                    1 1 9 90 57 1 1 0 74 57 1 2 0 97 57 75 1 1
                                    3 44 77 1 1 0 0 78 1 1 0 44 0 1 1 0 6 0 13
                                    1 31 88 0 1 1 31 24 0 1 1 31 54 0 1 0 0 79
                                    1 0 6 0 1 2 32 0 0 0 1 1 32 66 64 1 0 2 0 1
                                    1 2 24 0 1 2 2 0 0 63 1 1 2 0 0 1 1 41 24 0
                                    1 1 30 55 0 1 0 12 0 1 3 24 92 0 61 92 1 3
                                    25 93 0 62 93 1 1 2 81 0 1 1 2 79 0 1 1 0
                                    24 0 35 2 13 0 0 53 1 1 0 6 0 47 1 2 44 0 1
                                    2 32 65 64 0 1 1 3 78 0 1 2 0 0 76 0 1 1 6
                                    79 0 1 1 12 0 0 1 1 0 78 0 1 1 32 0 64 1 2
                                    32 0 0 0 1 1 0 11 0 1 1 3 0 0 1 0 2 0 1 1 6
                                    0 79 1 0 0 0 1 1 0 6 0 15 1 0 101 0 1 0 0 0
                                    1 2 32 50 50 50 1 2 32 0 0 0 1 1 32 0 64 1
                                    0 2 83 1 1 37 49 50 1 1 37 49 50 1 1 41 58
                                    0 1 3 32 69 0 0 0 1 2 32 70 0 0 1 2 42 44 0
                                    0 48 2 10 44 0 6 45 2 32 65 64 0 1 1 12 0 0
                                    1 2 22 0 0 71 1 3 22 0 0 6 6 1 2 22 0 0 72
                                    1 3 22 0 0 73 73 1 3 21 0 0 86 73 1 3 21 0
                                    0 87 6 1 1 32 63 0 1 0 6 64 1 2 23 0 0 6 1
                                    2 32 67 0 0 1 0 0 6 1 1 0 6 75 1 2 2 80 0 0
                                    1 1 2 63 0 1 2 20 0 0 63 1 1 20 0 0 1 3 19
                                    0 0 86 91 1 2 19 0 0 86 1 3 19 0 0 87 63 1
                                    2 19 0 0 87 1 2 0 0 0 76 1 3 0 0 0 76 63 1
                                    2 3 74 75 76 1 0 0 78 1 1 12 0 0 1 1 12 0 0
                                    1 0 2 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1
                                    1 12 0 0 1 1 0 99 0 1 1 0 74 75 1 2 0 74 75
                                    75 1 2 0 99 0 75 1 1 15 60 0 1 1 26 61 0 1
                                    1 27 62 0 1 1 14 94 0 1 1 14 95 0 1 1 0 0
                                    78 1 1 0 78 0 1 1 0 99 0 1 1 0 0 99 1 1 0 0
                                    0 46 1 43 56 57 1 2 0 0 6 6 37 1 42 0 0 1 1
                                    40 0 54 1 1 0 0 6 36 1 0 0 53 1 1 0 100 0 1
                                    1 44 44 0 1 1 2 0 0 1 1 0 78 0 1 0 0 63 1 0
                                    0 75 1 1 12 0 0 1 1 12 0 0 1 2 42 24 0 0 1
                                    1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1
                                    1 12 6 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1
                                    1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 29 0 0 1
                                    2 13 0 0 54 1 2 3 0 0 53 1 2 12 0 0 0 1 2 0
                                    0 0 63 1 2 0 0 0 79 1 0 0 0 28 0 0 0 30 1
                                    28 11 0 23 2 28 8 9 0 26 2 28 11 0 24 25 3
                                    28 8 9 0 24 27 2 20 0 0 63 1 1 20 0 0 1 3
                                    19 0 0 86 91 1 3 19 0 0 87 63 1 2 19 0 0 87
                                    1 2 19 0 0 86 1 2 0 0 0 76 1 3 0 0 0 76 63
                                    1 2 0 24 0 0 1 2 3 0 0 0 1 2 0 0 0 0 39 1 0
                                    0 0 1 2 0 0 0 0 38 2 3 0 0 54 1 2 3 0 54 0
                                    1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0 40 2 0
                                    0 53 0 1 2 0 0 63 0 1 2 0 0 79 0 1)))))
           '|lookupComplete|)) 
