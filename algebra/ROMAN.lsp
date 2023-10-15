
(SDEFUN |ROMAN;roman;I$;1| ((|n| |Integer|) ($ $)) (SPADCALL |n| (QREFELT $ 6))) 

(SDEFUN |ROMAN;roman;S$;2| ((|sy| |Symbol|) ($ $))
        (SPADCALL |sy| (QREFELT $ 9))) 

(SDEFUN |ROMAN;convert;S$;3| ((|sy| |Symbol|) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |sy| (QREFELT $ 12)) (QREFELT $ 15))
                  (QREFELT $ 6))) 

(SDEFUN |ROMAN;coerce;$Of;4| ((|r| $) ($ |OutputForm|))
        (SPROG ((#1=#:G118 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |r| (QREFELT $ 16))
                      . #2=(|ROMAN;coerce;$Of;4|))
                (EXIT
                 (COND ((ZEROP |n|) (SPADCALL |n| (QREFELT $ 18)))
                       ((MINUSP |n|)
                        (SPADCALL
                         (SPADCALL (SPADCALL |r| (QREFELT $ 19))
                                   (QREFELT $ 20))
                         (QREFELT $ 21)))
                       ('T
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (PROG1 (LETT #1# |n| . #2#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 22))
                          (QREFELT $ 23))
                         (QREFELT $ 24)))))))) 

(DECLAIM (NOTINLINE |RomanNumeral;|)) 

(DEFUN |RomanNumeral| ()
  (SPROG NIL
         (PROG (#1=#:G144)
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
                 ((NOT #1#) (HREM |$ConstructorCache| '|RomanNumeral|)))))))))) 

(DEFUN |RomanNumeral;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RomanNumeral|) . #1=(|RomanNumeral|))
          (LETT $ (GETREFV 49) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RomanNumeral| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RomanNumeral| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (0 . |coerce|) |ROMAN;roman;I$;1|
              (|Symbol|) |ROMAN;convert;S$;3| |ROMAN;roman;S$;2| (|String|)
              (5 . |string|) (|PositiveInteger|) (|NumberFormats|)
              (10 . |ScanRoman|) (15 . |convert|) (|OutputForm|)
              (20 . |coerce|) (25 . -) |ROMAN;coerce;$Of;4| (30 . -)
              (35 . |FormatRoman|) (40 . |coerce|) (45 . |coerce|)
              (|Union| 27 '"failed") (|Boolean|) (|Fraction| 5)
              (|Union| $ '"failed") (|DoubleFloat|) (|Float|)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|InputForm|)
              (|Union| 5 '"failed") (|NonNegativeInteger|)
              (|Union| 37 '"failed") (|List| $)
              (|Record| (|:| |coef| 37) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 41 '"failed")
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|SingleInteger|))
           '#(~= 50 |zero?| 56 |unitNormal| 61 |unitCanonical| 66 |unit?| 71
              |symmetricRemainder| 76 |subtractIfCan| 82 |submod| 88
              |squareFreePart| 95 |squareFree| 100 |smaller?| 105 |sizeLess?|
              111 |sign| 117 |shift| 122 |sample| 128 |roman| 132
              |retractIfCan| 142 |retract| 147 |rem| 152 |recip| 158
              |rationalIfCan| 163 |rational?| 168 |rational| 173 |random| 178
              |quo| 183 |principalIdeal| 189 |prime?| 194 |powmod| 199
              |positiveRemainder| 206 |positive?| 212 |permutation| 217
              |patternMatch| 223 |opposite?| 230 |one?| 236 |odd?| 241
              |nextItem| 246 |negative?| 251 |multiEuclidean| 256 |mulmod| 262
              |min| 269 |max| 275 |mask| 281 |length| 286 |lcmCoef| 291 |lcm|
              297 |latex| 308 |invmod| 313 |init| 319 |inc| 323 |hashUpdate!|
              328 |hash| 334 |gcdPolynomial| 339 |gcd| 345 |factorial| 356
              |factor| 361 |extendedEuclidean| 366 |exquo| 379
              |expressIdealMember| 385 |even?| 391 |euclideanSize| 396 |divide|
              401 |differentiate| 407 |dec| 418 |copy| 423 |convert| 428
              |coerce| 458 |characteristic| 478 |bit?| 482 |binomial| 488
              |base| 494 |associates?| 498 |annihilate?| 504 |addmod| 510 |abs|
              517 ^ 522 |Zero| 534 |One| 538 D 542 >= 553 > 559 = 565 <= 571 <
              577 - 583 + 594 * 600)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 5)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 30)
                 (|ConvertibleTo| 29) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 32) (|ConvertibleTo| 33) (|RetractableTo| 5)
                 (|ConvertibleTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| 48
                                  '(1 0 0 5 6 1 8 11 0 12 1 14 13 11 15 1 0 5 0
                                    16 1 5 17 0 18 1 0 0 0 19 1 17 0 0 21 1 14
                                    11 13 22 1 8 0 11 23 1 8 17 0 24 2 0 26 0 0
                                    1 1 0 26 0 1 1 0 46 0 1 1 0 0 0 1 1 0 26 0
                                    1 2 0 0 0 0 1 2 0 28 0 0 1 3 0 0 0 0 0 1 1
                                    0 0 0 1 1 0 43 0 1 2 0 26 0 0 1 2 0 26 0 0
                                    1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 5 7 1
                                    0 0 8 10 1 0 34 0 1 1 0 5 0 1 2 0 0 0 0 1 1
                                    0 28 0 1 1 0 25 0 1 1 0 26 0 1 1 0 27 0 1 1
                                    0 0 0 1 2 0 0 0 0 1 1 0 38 37 1 1 0 26 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 26 0 1 2 0 0
                                    0 0 1 3 0 31 0 32 31 1 2 0 26 0 0 1 1 0 26
                                    0 1 1 0 26 0 1 1 0 28 0 1 1 0 26 0 1 2 0 36
                                    37 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 45 0 0 1 1 0 0 37
                                    1 2 0 0 0 0 1 1 0 11 0 1 2 0 0 0 0 1 0 0 0
                                    1 1 0 0 0 1 2 0 47 47 0 1 1 0 48 0 1 2 0 44
                                    44 44 1 1 0 0 37 1 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 43 0 1 2 0 40 0 0 1 3 0 42 0 0 0 1 2 0 28
                                    0 0 1 2 0 36 37 0 1 1 0 26 0 1 1 0 35 0 1 2
                                    0 39 0 0 1 1 0 0 0 1 2 0 0 0 35 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 8 9 1 0 29 0 1 1 0 30 0 1 1
                                    0 32 0 1 1 0 33 0 1 1 0 5 0 16 1 0 0 5 6 1
                                    0 0 0 1 1 0 0 5 6 1 0 17 0 20 0 0 35 1 2 0
                                    26 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 26 0 0 1 2
                                    0 26 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    35 1 2 0 0 0 13 1 0 0 0 1 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 35 1 2 0 26 0 0 1 2 0 26 0 0 1 2 0
                                    26 0 0 1 2 0 26 0 0 1 2 0 26 0 0 1 1 0 0 0
                                    19 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 5 0 1 2 0
                                    0 0 0 1 2 0 0 35 0 1 2 0 0 13 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|RomanNumeral| 'NILADIC T) 
