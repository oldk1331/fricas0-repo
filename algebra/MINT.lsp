
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

(DECLAIM (NOTINLINE |MachineInteger;|)) 

(DEFUN |MachineInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G140)
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
              (|NonNegativeInteger|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 21) (|:| |generator| $))
              (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 5))) (|Matrix| $)
              (|Vector| $) (|Matrix| 5) (|Pattern| 5) (|InputForm|)
              (|PatternMatchResult| 5 $) (|Float|) (|Union| $ '"failed")
              (|DoubleFloat|) (|Fraction| 5) (|Union| 50 '"failed")
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
              |patternMatch| 211 |opposite?| 218 |one?| 224 |odd?| 229
              |nextItem| 234 |negative?| 239 |multiEuclidean| 244 |mulmod| 250
              |min| 257 |maxint| 263 |max| 272 |mask| 278 |length| 283
              |lcmCoef| 288 |lcm| 294 |latex| 305 |invmod| 310 |init| 316 |inc|
              320 |hashUpdate!| 325 |hash| 331 |gcdPolynomial| 336 |gcd| 342
              |factorial| 353 |factor| 358 |extendedEuclidean| 363 |exquo| 376
              |expressIdealMember| 382 |even?| 388 |euclideanSize| 393 |divide|
              398 |differentiate| 404 |dec| 415 |copy| 420 |convert| 425
              |coerce| 450 |characteristic| 475 |bit?| 479 |binomial| 485
              |base| 491 |associates?| 495 |annihilate?| 501 |addmod| 507 |abs|
              514 ^ 519 |Zero| 531 |One| 535 D 539 >= 550 > 556 = 562 <= 568 <
              574 - 580 + 591 * 597)
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
                |EntireRing&| NIL |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
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
                 (|canonicalUnitNormal|) (|ConvertibleTo| 47)
                 (|ConvertibleTo| 49) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 44) (|ConvertibleTo| 45) (|ConvertibleTo| 5)
                 (|RetractableTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 24))
              (|makeByteWordVec2| 54
                                  '(2 6 0 0 6 7 1 0 0 5 11 2 15 12 13 14 16 2 5
                                    19 0 0 20 1 22 0 21 23 1 22 24 0 25 2 0 19
                                    0 0 1 1 0 19 0 1 1 0 52 0 1 1 0 0 0 1 1 0
                                    19 0 1 2 0 0 0 0 1 2 0 48 0 0 1 3 0 0 0 0 0
                                    1 1 0 0 0 1 1 0 32 0 1 2 0 19 0 0 1 2 0 19
                                    0 0 1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 28
                                    0 29 1 0 5 0 27 2 0 0 0 0 1 2 0 40 41 42 1
                                    1 0 43 41 1 1 0 48 0 1 1 0 51 0 1 1 0 19 0
                                    1 1 0 50 0 1 1 0 0 0 1 0 0 0 1 2 0 0 0 0 1
                                    1 0 39 21 1 1 0 19 0 1 3 0 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 19 0 1 2 0 0 0 0 1 3 0 46 0 44 46
                                    1 2 0 19 0 0 1 1 0 19 0 1 1 0 19 0 1 1 0 48
                                    0 1 1 0 19 0 1 2 0 33 21 0 1 3 0 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 6 6 10 0 0 6 9 2 0 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 30 0 0 1 2 0 0 0 0
                                    1 1 0 0 21 1 1 0 22 0 1 2 0 0 0 0 1 0 0 0 1
                                    1 0 0 0 1 2 0 53 53 0 1 1 0 54 0 1 2 0 31
                                    31 31 1 1 0 0 21 1 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 32 0 1 2 0 34 0 0 1 3 0 36 0 0 0 1 2 0 48
                                    0 0 1 2 0 33 21 0 1 1 0 19 0 1 1 0 37 0 1 2
                                    0 38 0 0 1 2 0 0 0 37 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 5 0 1 1 0 44 0 1 1 0 45 0 1 1
                                    0 47 0 1 1 0 49 0 1 1 0 17 14 18 1 0 0 5 26
                                    1 0 0 0 1 1 0 0 5 26 1 0 24 0 1 0 0 37 1 2
                                    0 19 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 19 0 0 1
                                    2 0 19 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 37 1 2 0 0 0 6 1 0 0 0 1 0 0 0 1 2 0 0 0
                                    37 1 1 0 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 2
                                    0 19 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 5 0 1 2 0
                                    0 0 0 1 2 0 0 37 0 1 2 0 0 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineInteger| 'NILADIC T) 
