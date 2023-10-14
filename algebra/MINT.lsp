
(/VERSIONCHECK 2) 

(DEFUN |MINT;maxint;Pi;1| ($) (QREFELT $ 8)) 

(DEFUN |MINT;maxint;2Pi;2| (|new| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 8) |MINT;maxint;2Pi;2|) (SETELT $ 8 |new|)
          (EXIT |old|))))) 

(DEFUN |MINT;coerce;EE;3| (|u| $) (SPADCALL (ELT $ 11) |u| (QREFELT $ 16))) 

(DEFUN |MINT;coerce;I$;4| (|u| $)
  (PROG (|message|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (ABS |u|) (QREFELT $ 8) (QREFELT $ 20))
        (SEQ
         (LETT |message|
               (SPADCALL
                (LIST (STRINGIMAGE |u|) "  > MAXINT("
                      (STRINGIMAGE (QREFELT $ 8)) ")")
                (QREFELT $ 23))
               |MINT;coerce;I$;4|)
         (EXIT (|error| (SPADCALL |message| (QREFELT $ 25))))))
       ('T |u|)))))) 

(PUT '|MINT;retract;$I;5| '|SPADreplace| '(XLAM (|u|) |u|)) 

(DEFUN |MINT;retract;$I;5| (|u| $) |u|) 

(PUT '|MINT;retractIfCan;$U;6| '|SPADreplace| '(XLAM (|u|) (CONS 0 |u|))) 

(DEFUN |MINT;retractIfCan;$U;6| (|u| $) (CONS 0 |u|)) 

(DEFUN |MachineInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G162)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MachineInteger|)
                . #2=(|MachineInteger|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MachineInteger|
                         (LIST (CONS NIL (CONS 1 (|MachineInteger;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|MachineInteger|))))))))))) 

(DEFUN |MachineInteger;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MachineInteger|) . #1=(|MachineInteger|))
      (LETT $ (GETREFV 55) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MachineInteger| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (SPADCALL 2 32 (QREFELT $ 7)))
      $)))) 

(MAKEPROP '|MachineInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (|PositiveInteger|) (0 . ^)
              'MAXINT |MINT;maxint;Pi;1| |MINT;maxint;2Pi;2| (6 . |coerce|)
              (|Expression| $$) (|Mapping| $$ 5) (|Expression| 5)
              (|ExpressionFunctions2| 5 $$) (11 . |map|) (|Expression| $)
              |MINT;coerce;EE;3| (|Boolean|) (17 . >) (|List| $) (|String|)
              (23 . |concat|) (|OutputForm|) (28 . |coerce|) |MINT;coerce;I$;4|
              |MINT;retract;$I;5| (|Union| 5 '"failed")
              |MINT;retractIfCan;$U;6|
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Union| 21 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 35 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 21) (|:| |generator| $))
              (|Record| (|:| |mat| 44) (|:| |vec| (|Vector| 5))) (|Matrix| $)
              (|Vector| $) (|InputForm|) (|Matrix| 5)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|DoubleFloat|)
              (|Float|) (|Union| $ '"failed") (|Fraction| 5)
              (|Union| 50 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|SingleInteger|))
           '#(~= 33 |zero?| 39 |unitNormal| 44 |unitCanonical| 49 |unit?| 54
              |symmetricRemainder| 59 |subtractIfCan| 65 |submod| 71
              |squareFreePart| 78 |squareFree| 83 |smaller?| 88 |sizeLess?| 94
              |sign| 100 |shift| 105 |sample| 111 |retractIfCan| 115 |retract|
              120 |rem| 125 |reducedSystem| 131 |recip| 142 |rationalIfCan| 147
              |rational?| 152 |rational| 157 |random| 162 |quo| 171
              |principalIdeal| 177 |prime?| 182 |powmod| 187
              |positiveRemainder| 194 |positive?| 200 |permutation| 205
              |patternMatch| 211 |one?| 218 |odd?| 223 |nextItem| 228
              |negative?| 233 |multiEuclidean| 238 |mulmod| 244 |min| 251
              |maxint| 257 |max| 266 |mask| 272 |length| 277 |lcmCoef| 282
              |lcm| 288 |latex| 299 |invmod| 304 |init| 310 |inc| 314
              |hashUpdate!| 319 |hash| 325 |gcdPolynomial| 330 |gcd| 336
              |factorial| 347 |factor| 352 |extendedEuclidean| 357 |exquo| 370
              |expressIdealMember| 376 |even?| 382 |euclideanSize| 387 |divide|
              392 |differentiate| 398 |dec| 409 |copy| 414 |convert| 419
              |coerce| 444 |characteristic| 469 |bit?| 473 |binomial| 479
              |base| 485 |associates?| 489 |addmod| 495 |abs| 502 ^ 507 |Zero|
              519 |One| 523 D 527 >= 538 > 544 = 550 <= 556 < 562 - 568 + 579 *
              585)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&| NIL
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL NIL
                |Algebra&| NIL NIL |DifferentialRing&| |OrderedRing&|
                |EntireRing&| NIL |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FortranMachineTypeCategory|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|Algebra| $$) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 5) (|DifferentialRing|)
                 (|OrderedRing|) (|EntireRing|) (|CommutativeRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 5)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 48)
                 (|ConvertibleTo| 47) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 46) (|ConvertibleTo| 43) (|ConvertibleTo| 5)
                 (|RetractableTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 24))
              (|makeByteWordVec2| 54
                                  '(2 6 0 0 6 7 1 0 0 5 11 2 15 12 13 14 16 2 5
                                    19 0 0 20 1 22 0 21 23 1 22 24 0 25 2 0 19
                                    0 0 1 1 0 19 0 1 1 0 52 0 1 1 0 0 0 1 1 0
                                    19 0 1 2 0 0 0 0 1 2 0 49 0 0 1 3 0 0 0 0 0
                                    1 1 0 0 0 1 1 0 32 0 1 2 0 19 0 0 1 2 0 19
                                    0 0 1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 28
                                    0 29 1 0 5 0 27 2 0 0 0 0 1 2 0 40 41 42 1
                                    1 0 44 41 1 1 0 49 0 1 1 0 51 0 1 1 0 19 0
                                    1 1 0 50 0 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    1 0 39 21 1 1 0 19 0 1 3 0 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 19 0 1 2 0 0 0 0 1 3 0 45 0 46 45
                                    1 1 0 19 0 1 1 0 19 0 1 1 0 49 0 1 1 0 19 0
                                    1 2 0 33 21 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 6 6 10 0 0 6 9 2 0 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 30 0 0 1 2 0 0 0 0 1 1 0 0 21 1 1
                                    0 22 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 0 1 2 0
                                    53 53 0 1 1 0 54 0 1 2 0 31 31 31 1 1 0 0
                                    21 1 2 0 0 0 0 1 1 0 0 0 1 1 0 32 0 1 2 0
                                    34 0 0 1 3 0 36 0 0 0 1 2 0 49 0 0 1 2 0 33
                                    21 0 1 1 0 19 0 1 1 0 38 0 1 2 0 37 0 0 1 2
                                    0 0 0 38 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 5 0 1 1 0 43 0 1 1 0 46 0 1 1 0 47 0 1 1
                                    0 48 0 1 1 0 17 14 18 1 0 0 5 26 1 0 0 0 1
                                    1 0 0 5 26 1 0 24 0 1 0 0 38 1 2 0 19 0 0 1
                                    2 0 0 0 0 1 0 0 0 1 2 0 19 0 0 1 3 0 0 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 38 1 2 0 0 0 6 1 0 0
                                    0 1 0 0 0 1 2 0 0 0 38 1 1 0 0 0 1 2 0 19 0
                                    0 1 2 0 19 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1
                                    2 0 19 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 5 0 1 2 0 0 38 0 1 2
                                    0 0 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineInteger| 'NILADIC T) 
