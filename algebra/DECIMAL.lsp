
(/VERSIONCHECK 2) 

(DEFUN |DECIMAL;decimal;F$;1| (|r| $) (SPADCALL |r| (QREFELT $ 7))) 

(PUT '|DECIMAL;coerce;$Re;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |DECIMAL;coerce;$Re;2| (|x| $) |x|) 

(DECLAIM (NOTINLINE |DecimalExpansion;|)) 

(DEFUN |DecimalExpansion| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G163)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DecimalExpansion|)
                . #2=(|DecimalExpansion|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DecimalExpansion|
                         (LIST (CONS NIL (CONS 1 (|DecimalExpansion;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|DecimalExpansion|))))))))))) 

(DEFUN |DecimalExpansion;| ()
  (PROG (|dv$| $ #1=#:G161 |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DecimalExpansion|) . #2=(|DecimalExpansion|))
      (LETT $ (GETREFV 55) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Symbol|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RealConstant|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedIntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedIntegralDomain|))
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedSet|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|StepThrough|))
                                          (|HasCategory| (|Integer|)
                                                         '(|InnerEvalable|
                                                           (|Symbol|)
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Evalable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Eltable|
                                                           (|Integer|)
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|DifferentialRing|))
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
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|EuclideanDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|IntegerNumberSystem|))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|Comparable|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedIntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|DecimalExpansion| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|CharacteristicNonZero|))
           (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
           (|augmentPredVector| $ 33554432))
      (AND
       (OR
        (AND (|HasCategory| $ '(|CharacteristicNonZero|))
             (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|)))
        (|HasCategory| (|Integer|) '(|CharacteristicNonZero|)))
       (|augmentPredVector| $ 67108864))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DecimalExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|RadixExpansion| '10) (|Fraction| 18)
              (0 . |coerce|) |DECIMAL;decimal;F$;1| |DECIMAL;coerce;$Re;2|
              (|Union| 26 '#1="failed") (|Matrix| $) (|Union| $ '"failed")
              (|Boolean|) (|InputForm|) (|Pattern| 34) (|Pattern| 18)
              (|NonNegativeInteger|) (|Integer|) (|Equation| 18) (|List| 19)
              (|List| 18) (|List| 23) (|Symbol|) (|Matrix| 18)
              (|Record| (|:| |mat| 24) (|:| |vec| (|Vector| 18))) (|Vector| $)
              (|List| 17) (|PatternMatchResult| 34 $)
              (|PatternMatchResult| 18 $) (|Factored| 31)
              (|SparseUnivariatePolynomial| $) (|Union| 33 '#1#) (|List| 31)
              (|Float|) (|DoubleFloat|) (|Union| 18 '#2="failed")
              (|Union| 6 '#2#) (|Union| 23 '#2#) (|Mapping| 18 18)
              (|Factored| $) (|Union| 42 '#3="failed") (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 44 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 42) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 5 |zero?| 11 |wholePart| 16 |unitNormal| 21 |unitCanonical| 26
              |unit?| 31 |subtractIfCan| 36 |squareFreePolynomial| 42
              |squareFreePart| 47 |squareFree| 52
              |solveLinearPolynomialEquation| 57 |smaller?| 63 |sizeLess?| 69
              |sign| 75 |sample| 80 |retractIfCan| 84 |retract| 104 |rem| 124
              |reducedSystem| 130 |recip| 152 |random| 157 |quo| 161
              |principalIdeal| 167 |prime?| 172 |positive?| 177 |patternMatch|
              182 |one?| 196 |numerator| 201 |numer| 206 |nextItem| 211
              |negative?| 216 |multiEuclidean| 221 |min| 227 |max| 233 |map|
              239 |lcmCoef| 245 |lcm| 251 |latex| 262 |inv| 267 |init| 272
              |hashUpdate!| 276 |hash| 282 |gcdPolynomial| 287 |gcd| 293
              |fractionPart| 304 |floor| 314 |factorSquareFreePolynomial| 319
              |factorPolynomial| 324 |factor| 329 |extendedEuclidean| 334
              |exquo| 347 |expressIdealMember| 353 |eval| 359 |euclideanSize|
              399 |elt| 404 |divide| 410 |differentiate| 416 |denominator| 466
              |denom| 471 |decimal| 476 |convert| 481 |conditionP| 506 |coerce|
              511 |charthRoot| 551 |characteristic| 556 |ceiling| 560
              |associates?| 565 |abs| 571 ^ 576 |Zero| 594 |One| 598 D 602 >=
              652 > 658 = 664 <= 670 < 676 / 682 - 694 + 705 * 711)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3
                                  4 7 15 16 0 0 0 0 7 0 0 0 0 0 0 0 7 0 7 0 0 7
                                  0 0 0 0 9 0 0 0 25 11 19 20 0 0 6 13 0 0 0 0
                                  0 0 0 0 0 2 5 6 6 8 10 12 13 14 17 18))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL |Module&| |Module&|
                NIL |EntireRing&| |Module&| NIL NIL |OrderedRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL |OrderedSet&|
                |FullyEvalableOver&| |SemiGroup&| |AbelianSemiGroup&| NIL NIL
                NIL NIL NIL |SetCategory&| NIL |Evalable&| NIL |RetractableTo&|
                NIL NIL NIL NIL NIL |BasicType&| NIL |RetractableTo&| NIL NIL
                NIL |PartialOrder&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 18) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 18)
                 (|DifferentialExtension| 18) (|Algebra| 18) (|Algebra| 6)
                 (|LeftOreRing|) (|Algebra| $$) (|LinearlyExplicitRingOver| 18)
                 (|Module| 18) (|Module| 6) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|OrderedRing|) (|PartialDifferentialRing| 23)
                 (|DifferentialRing|) (|BiModule| 18 18) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|Ring|) (|OrderedAbelianGroup|)
                 (|RightModule| 18) (|LeftModule| 18) (|RightModule| 6)
                 (|LeftModule| 6) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedAbelianSemiGroup|)
                 (|FullyPatternMatchable| 18) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|OrderedSet|) (|FullyEvalableOver| 18)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Comparable|)
                 (|StepThrough|) (|PatternMatchable| 34)
                 (|PatternMatchable| 18) (|Patternable| 18) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 18) (|Type|) (|RetractableTo| 18)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 54) (|RetractableTo| 23)
                 (|ConvertibleTo| 14) (|ConvertibleTo| 35) (|ConvertibleTo| 34)
                 (|PartialOrder|) (|RetractableTo| 6) (|InnerEvalable| 23 18)
                 (|InnerEvalable| 18 18) (|Eltable| 18 $$) (|ConvertibleTo| 15)
                 (|ConvertibleTo| 16))
              (|makeByteWordVec2| 54
                                  '(1 0 0 6 7 2 0 13 0 0 1 1 0 13 0 1 1 22 18 0
                                    1 1 0 49 0 1 1 0 0 0 1 1 0 13 0 1 2 0 12 0
                                    0 1 1 1 30 31 1 1 0 0 0 1 1 0 40 0 1 2 1 32
                                    33 31 1 2 24 13 0 0 1 2 0 13 0 0 1 1 7 18 0
                                    1 0 0 0 1 1 10 36 0 1 1 10 37 0 1 1 2 38 0
                                    1 1 0 36 0 1 1 10 18 0 1 1 10 6 0 1 1 2 23
                                    0 1 1 0 18 0 1 2 0 0 0 0 1 1 21 24 11 1 2
                                    21 25 11 26 1 1 0 24 11 1 2 0 25 11 26 1 1
                                    0 12 0 1 0 23 0 1 2 0 0 0 0 1 1 0 47 42 1 1
                                    0 13 0 1 1 7 13 0 1 3 19 28 0 15 28 1 3 20
                                    29 0 16 29 1 1 0 13 0 1 1 0 0 0 1 1 0 18 0
                                    1 1 11 12 0 1 1 7 13 0 1 2 0 41 42 0 1 2 8
                                    0 0 0 1 2 8 0 0 0 1 2 0 0 39 0 1 2 0 48 0 0
                                    1 1 0 0 42 1 2 0 0 0 0 1 1 0 51 0 1 1 0 0 0
                                    1 0 11 0 1 2 0 53 53 0 1 1 0 52 0 1 2 0 31
                                    31 31 1 1 0 0 42 1 2 0 0 0 0 1 1 22 0 0 1 1
                                    0 6 0 1 1 23 18 0 1 1 1 30 31 1 1 1 30 31 1
                                    1 0 40 0 1 2 0 43 0 0 1 3 0 45 0 0 0 1 2 0
                                    12 0 0 1 2 0 41 42 0 1 2 13 0 0 19 1 2 13 0
                                    0 20 1 3 13 0 0 21 21 1 3 13 0 0 18 18 1 3
                                    12 0 0 22 21 1 3 12 0 0 23 18 1 1 0 17 0 1
                                    2 14 0 0 18 1 2 0 46 0 0 1 2 16 0 0 17 1 1
                                    16 0 0 1 3 15 0 0 23 17 1 3 15 0 0 22 27 1
                                    2 15 0 0 23 1 2 15 0 0 22 1 3 0 0 0 39 17 1
                                    2 0 0 0 39 1 1 0 0 0 1 1 0 18 0 1 1 0 0 6 8
                                    1 5 14 0 1 1 17 15 0 1 1 18 16 0 1 1 6 34 0
                                    1 1 6 35 0 1 1 26 10 11 1 1 2 0 23 1 1 0 6
                                    0 1 1 0 5 0 9 1 0 0 18 1 1 0 0 6 7 1 0 0 0
                                    1 1 0 0 18 1 1 0 54 0 1 1 27 12 0 1 0 0 17
                                    1 1 23 18 0 1 2 0 13 0 0 1 1 7 0 0 1 2 0 0
                                    0 18 1 2 0 0 0 17 1 2 0 0 0 50 1 0 0 0 1 0
                                    0 0 1 2 16 0 0 17 1 1 16 0 0 1 3 15 0 0 23
                                    17 1 3 15 0 0 22 27 1 2 15 0 0 23 1 2 15 0
                                    0 22 1 3 0 0 0 39 17 1 2 0 0 0 39 1 2 8 13
                                    0 0 1 2 8 13 0 0 1 2 0 13 0 0 1 2 8 13 0 0
                                    1 2 8 13 0 0 1 2 0 0 18 18 1 2 0 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 18
                                    1 2 0 0 18 0 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0
                                    0 18 0 1 2 0 0 0 0 1 2 0 0 17 0 1 2 0 0 50
                                    0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|DecimalExpansion| 'NILADIC T) 
