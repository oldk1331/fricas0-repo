
(/VERSIONCHECK 2) 

(DEFUN |ROMAN;roman;I$;1| (|n| $) (SPADCALL |n| (QREFELT $ 6))) 

(DEFUN |ROMAN;roman;S$;2| (|sy| $) (SPADCALL |sy| (QREFELT $ 9))) 

(DEFUN |ROMAN;convert;S$;3| (|sy| $)
  (SPADCALL (SPADCALL (SPADCALL |sy| (QREFELT $ 12)) (QREFELT $ 15))
            (QREFELT $ 6))) 

(DEFUN |ROMAN;coerce;$Of;4| (|r| $)
  (PROG (#1=#:G139 |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 16)) . #2=(|ROMAN;coerce;$Of;4|))
          (EXIT
           (COND ((ZEROP |n|) (SPADCALL |n| (QREFELT $ 18)))
                 ((MINUSP |n|)
                  (SPADCALL
                   (SPADCALL (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 20))
                   (QREFELT $ 21)))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (PROG1 (LETT #1# |n| . #2#)
                       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                     (QREFELT $ 22))
                    (QREFELT $ 23))
                   (QREFELT $ 24))))))))) 

(DEFUN |RomanNumeral| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G166)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|RomanNumeral|)
                . #2=(|RomanNumeral|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|RomanNumeral|
                         (LIST (CONS NIL (CONS 1 (|RomanNumeral;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|RomanNumeral|))))))))))) 

(DEFUN |RomanNumeral;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|RomanNumeral|) . #1=(|RomanNumeral|))
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RomanNumeral| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RomanNumeral| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (0 . |coerce|) |ROMAN;roman;I$;1|
              (|Symbol|) |ROMAN;convert;S$;3| |ROMAN;roman;S$;2| (|String|)
              (5 . |string|) (|PositiveInteger|) (|NumberFormats|)
              (10 . |ScanRoman|) (15 . |convert|) (|OutputForm|)
              (20 . |coerce|) (25 . -) |ROMAN;coerce;$Of;4| (30 . -)
              (35 . |FormatRoman|) (40 . |coerce|) (45 . |coerce|)
              (|Fraction| 5) (|Union| 25 '"failed") (|Boolean|)
              (|Union| $ '"failed") (|Float|) (|DoubleFloat|)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|InputForm|)
              (|Record| (|:| |mat| 37) (|:| |vec| (|Vector| 5))) (|Matrix| $)
              (|Vector| $) (|Matrix| 5) (|Union| 5 '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 41) (|:| |generator| $)) (|List| $)
              (|Union| 41 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 45 '"failed")
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|SingleInteger|))
           '#(~= 50 |zero?| 56 |unitNormal| 61 |unitCanonical| 66 |unit?| 71
              |symmetricRemainder| 76 |subtractIfCan| 82 |submod| 88
              |squareFreePart| 95 |squareFree| 100 |smaller?| 105 |sizeLess?|
              111 |sign| 117 |shift| 122 |sample| 128 |roman| 132
              |retractIfCan| 142 |retract| 147 |rem| 152 |reducedSystem| 158
              |recip| 169 |rationalIfCan| 174 |rational?| 179 |rational| 184
              |random| 189 |quo| 198 |principalIdeal| 204 |prime?| 209 |powmod|
              214 |positiveRemainder| 221 |positive?| 227 |permutation| 232
              |patternMatch| 238 |one?| 245 |odd?| 250 |nextItem| 255
              |negative?| 260 |multiEuclidean| 265 |mulmod| 271 |min| 278 |max|
              284 |mask| 290 |length| 295 |lcmCoef| 300 |lcm| 306 |latex| 317
              |invmod| 322 |init| 328 |inc| 332 |hashUpdate!| 337 |hash| 343
              |gcdPolynomial| 348 |gcd| 354 |factorial| 365 |factor| 370
              |extendedEuclidean| 375 |exquo| 388 |expressIdealMember| 394
              |even?| 400 |euclideanSize| 405 |divide| 410 |differentiate| 416
              |dec| 427 |copy| 432 |convert| 437 |coerce| 467 |characteristic|
              487 |bit?| 491 |binomial| 497 |base| 503 |associates?| 507
              |addmod| 513 |abs| 520 ^ 525 |Zero| 537 |One| 541 D 545 >= 556 >
              562 = 568 <= 574 < 580 - 586 + 597 * 603)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL NIL
                |Algebra&| NIL NIL |DifferentialRing&| |OrderedRing&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| $$) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 5) (|DifferentialRing|)
                 (|OrderedRing|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 5)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 29)
                 (|ConvertibleTo| 30) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33) (|RetractableTo| 5)
                 (|ConvertibleTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| 52
                                  '(1 0 0 5 6 1 8 11 0 12 1 14 13 11 15 1 0 5 0
                                    16 1 5 17 0 18 1 0 0 0 19 1 17 0 0 21 1 14
                                    11 13 22 1 8 0 11 23 1 8 17 0 24 2 0 27 0 0
                                    1 1 0 27 0 1 1 0 50 0 1 1 0 0 0 1 1 0 27 0
                                    1 2 0 0 0 0 1 2 0 28 0 0 1 3 0 0 0 0 0 1 1
                                    0 0 0 1 1 0 47 0 1 2 0 27 0 0 1 2 0 27 0 0
                                    1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 5 7 1
                                    0 0 8 10 1 0 38 0 1 1 0 5 0 1 2 0 0 0 0 1 2
                                    0 34 35 36 1 1 0 37 35 1 1 0 28 0 1 1 0 26
                                    0 1 1 0 27 0 1 1 0 25 0 1 1 0 0 0 1 0 0 0 1
                                    2 0 0 0 0 1 1 0 40 41 1 1 0 27 0 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 27 0 1 2 0 0 0 0 1 3
                                    0 31 0 32 31 1 1 0 27 0 1 1 0 27 0 1 1 0 28
                                    0 1 1 0 27 0 1 2 0 42 41 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 49 0 0 1 1 0 0 41 1 2 0 0 0 0 1 1 0 11
                                    0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 0 1 2 0 51 51
                                    0 1 1 0 52 0 1 2 0 48 48 48 1 2 0 0 0 0 1 1
                                    0 0 41 1 1 0 0 0 1 1 0 47 0 1 2 0 44 0 0 1
                                    3 0 46 0 0 0 1 2 0 28 0 0 1 2 0 42 41 0 1 1
                                    0 27 0 1 1 0 39 0 1 2 0 43 0 0 1 1 0 0 0 1
                                    2 0 0 0 39 1 1 0 0 0 1 1 0 0 0 1 1 0 0 8 9
                                    1 0 29 0 1 1 0 30 0 1 1 0 33 0 1 1 0 32 0 1
                                    1 0 5 0 16 1 0 0 5 6 1 0 0 0 1 1 0 0 5 6 1
                                    0 17 0 20 0 0 39 1 2 0 27 0 0 1 2 0 0 0 0 1
                                    0 0 0 1 2 0 27 0 0 1 3 0 0 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 39 1 2 0 0 0 13 1 0 0 0 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 39 1 2 0 27 0 0 1 2 0 27
                                    0 0 1 2 0 27 0 0 1 2 0 27 0 0 1 2 0 27 0 0
                                    1 2 0 0 0 0 1 1 0 0 0 19 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 5 0 1 2 0 0 39 0 1 2 0 0 13 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|RomanNumeral| 'NILADIC T) 
