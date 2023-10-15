
(SDEFUN |MINT;maxint;Pi;1| (($ |PositiveInteger|)) (QREFELT $ 8)) 

(SDEFUN |MINT;maxint;2Pi;2| ((|new| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| (QREFELT $ 8) |MINT;maxint;2Pi;2|)
                    (SETELT $ 8 |new|) (EXIT |old|)))) 

(SDEFUN |MINT;coerce;EE;3| ((|u| |Expression| (|Integer|)) ($ |Expression| $))
        (SPADCALL (ELT $ 11) |u| (QREFELT $ 16))) 

(SDEFUN |MINT;coerce;I$;4| ((|u| |Integer|) ($ $))
        (SPROG ((|message| (|String|)))
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
                   (EXIT (|error| |message|))))
                 ('T |u|))))) 

(PUT '|MINT;retract;$I;5| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |MINT;retract;$I;5| ((|u| $) ($ |Integer|)) |u|) 

(PUT '|MINT;retractIfCan;$U;6| '|SPADreplace| '(XLAM (|u|) (CONS 0 |u|))) 

(SDEFUN |MINT;retractIfCan;$U;6| ((|u| $) ($ |Union| (|Integer|) "failed"))
        (CONS 0 |u|)) 

(DECLAIM (NOTINLINE |MachineInteger;|)) 

(DEFUN |MachineInteger| ()
  (SPROG NIL
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
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineInteger|)))))))))) 

(DEFUN |MachineInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MachineInteger|) . #1=(|MachineInteger|))
          (LETT $ (GETREFV 50) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MachineInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (SPADCALL 2 32 (QREFELT $ 7)))
          $))) 

(MAKEPROP '|MachineInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (|PositiveInteger|) (0 . ^)
              'MAXINT |MINT;maxint;Pi;1| |MINT;maxint;2Pi;2| (6 . |coerce|)
              (|Expression| $$) (|Mapping| $$ 5) (|Expression| 5)
              (|ExpressionFunctions2| 5 $$) (11 . |map|) (|Expression| $)
              |MINT;coerce;EE;3| (|Boolean|) (17 . >) (|List| $) (|String|)
              (23 . |concat|) |MINT;coerce;I$;4| |MINT;retract;$I;5|
              (|Union| 5 '"failed") |MINT;retractIfCan;$U;6|
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Union| 21 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 33 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 21) (|:| |generator| $)) (|InputForm|)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|Float|)
              (|DoubleFloat|) (|Union| $ '"failed") (|Fraction| 5)
              (|Union| 44 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(~= 28 |zero?| 34 |unitNormal| 39 |unitCanonical| 44 |unit?| 49
              |symmetricRemainder| 54 |subtractIfCan| 60 |submod| 66
              |squareFreePart| 73 |squareFree| 78 |smaller?| 83 |sizeLess?| 89
              |sign| 95 |shift| 100 |sample| 106 |retractIfCan| 110 |retract|
              115 |rem| 120 |recip| 126 |rationalIfCan| 131 |rational?| 136
              |rational| 141 |random| 146 |quo| 151 |principalIdeal| 157
              |prime?| 162 |powmod| 167 |positiveRemainder| 174 |positive?| 180
              |permutation| 185 |patternMatch| 191 |opposite?| 198 |one?| 204
              |odd?| 209 |nextItem| 214 |negative?| 219 |multiEuclidean| 224
              |mulmod| 230 |min| 237 |maxint| 243 |max| 252 |mask| 258 |length|
              263 |lcmCoef| 268 |lcm| 274 |latex| 285 |invmod| 290 |init| 296
              |inc| 300 |hashUpdate!| 305 |hash| 311 |gcdPolynomial| 316 |gcd|
              322 |factorial| 333 |factor| 338 |extendedEuclidean| 343 |exquo|
              356 |expressIdealMember| 362 |even?| 368 |euclideanSize| 373
              |divide| 378 |differentiate| 384 |dec| 395 |copy| 400 |convert|
              405 |coerce| 430 |characteristic| 455 |bit?| 459 |binomial| 465
              |base| 471 |associates?| 475 |annihilate?| 481 |addmod| 487 |abs|
              494 ^ 499 |Zero| 511 |One| 515 D 519 >= 530 > 536 = 542 <= 548 <
              554 - 560 + 571 * 577)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&| NIL
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| |DifferentialRing&| NIL
                |EntireRing&| NIL |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FortranMachineTypeCategory|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|LeftOreRing|) (|Algebra| $$) (|DifferentialRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|CommutativeRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 5)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 41)
                 (|ConvertibleTo| 42) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 40) (|ConvertibleTo| 38) (|ConvertibleTo| 5)
                 (|RetractableTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 48))
              (|makeByteWordVec2| 49
                                  '(2 6 0 0 6 7 1 0 0 5 11 2 15 12 13 14 16 2 5
                                    19 0 0 20 1 22 0 21 23 2 0 19 0 0 1 1 0 19
                                    0 1 1 0 46 0 1 1 0 0 0 1 1 0 19 0 1 2 0 0 0
                                    0 1 2 0 43 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1
                                    0 30 0 1 2 0 19 0 0 1 2 0 19 0 0 1 1 0 5 0
                                    1 2 0 0 0 0 1 0 0 0 1 1 0 26 0 27 1 0 5 0
                                    25 2 0 0 0 0 1 1 0 43 0 1 1 0 45 0 1 1 0 19
                                    0 1 1 0 44 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 37
                                    21 1 1 0 19 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 19 0 1 2 0 0 0 0 1 3 0 39 0 40 39 1 2 0
                                    19 0 0 1 1 0 19 0 1 1 0 19 0 1 1 0 43 0 1 1
                                    0 19 0 1 2 0 31 21 0 1 3 0 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 6 6 10 0 0 6 9 2 0 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 2 0 28 0 0 1 2 0 0 0 0 1 1 0
                                    0 21 1 1 0 22 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 1 2 0 47 47 0 1 1 0 49 0 1 2 0 29 29 29 1
                                    1 0 0 21 1 2 0 0 0 0 1 1 0 0 0 1 1 0 30 0 1
                                    2 0 32 0 0 1 3 0 34 0 0 0 1 2 0 43 0 0 1 2
                                    0 31 21 0 1 1 0 19 0 1 1 0 36 0 1 2 0 35 0
                                    0 1 2 0 0 0 36 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 5 0 1 1 0 38 0 1 1 0 40 0 1 1 0 41
                                    0 1 1 0 42 0 1 1 0 17 14 18 1 0 0 5 24 1 0
                                    0 0 1 1 0 0 5 24 1 0 48 0 1 0 0 36 1 2 0 19
                                    0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 19 0 0 1 2 0
                                    19 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 36
                                    1 2 0 0 0 6 1 0 0 0 1 0 0 0 1 2 0 0 0 36 1
                                    1 0 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 2 0 19
                                    0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 5 0 1 2 0 0 0 0
                                    1 2 0 0 36 0 1 2 0 0 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineInteger| 'NILADIC T) 
