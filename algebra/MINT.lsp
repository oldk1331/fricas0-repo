
(SDEFUN |MINT;maxint;Pi;1| (($ |PositiveInteger|)) (QREFELT $ 8)) 

(SDEFUN |MINT;maxint;2Pi;2| ((|new| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| (QREFELT $ 8)) (SETELT $ 8 |new|)
                    (EXIT |old|)))) 

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
                          (QREFELT $ 23)))
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
             ((LETT #1# (HGET |$ConstructorCache| '|MachineInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineInteger|
                             (LIST (CONS NIL (CONS 1 (|MachineInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineInteger|)))))))))) 

(DEFUN |MachineInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MachineInteger|))
          (LETT $ (GETREFV 49))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MachineInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (SPADCALL 2 32 (QREFELT $ 7)))
          $))) 

(MAKEPROP '|MachineInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (|PositiveInteger|) (0 . ^)
              'MAXINT |MINT;maxint;Pi;1| |MINT;maxint;2Pi;2| |MINT;coerce;I$;4|
              (|Expression| $$) (|Mapping| $$ 5) (|Expression| 5)
              (|ExpressionFunctions2| 5 $$) (6 . |map|) (|Expression| $)
              |MINT;coerce;EE;3| (|Boolean|) (12 . >) (|List| $) (|String|)
              (18 . |concat|) |MINT;retract;$I;5| (|Union| 5 '"failed")
              |MINT;retractIfCan;$U;6|
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Union| 21 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 31 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 21) (|:| |generator| $)) (|InputForm|)
              (|PatternMatchResult| 5 $) (|Pattern| 5) (|DoubleFloat|)
              (|Float|) (|Union| $ '"failed") (|Union| 44 '"failed")
              (|Fraction| 5)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(~= 23 |zero?| 29 |unitNormal| 34 |unitCanonical| 39 |unit?| 44
              |symmetricRemainder| 49 |subtractIfCan| 55 |submod| 61
              |squareFreePart| 68 |squareFree| 73 |smaller?| 78 |sizeLess?| 84
              |sign| 90 |shift| 95 |sample| 101 |rightRecip| 105 |rightPower|
              110 |retractIfCan| 122 |retract| 127 |rem| 132 |recip| 138
              |rationalIfCan| 143 |rational?| 148 |rational| 153 |random| 158
              |quo| 163 |principalIdeal| 169 |prime?| 174 |powmod| 179
              |positiveRemainder| 186 |positive?| 192 |permutation| 197
              |patternMatch| 203 |opposite?| 210 |one?| 216 |odd?| 221
              |nextItem| 226 |negative?| 231 |multiEuclidean| 236 |mulmod| 242
              |min| 249 |maxint| 255 |max| 264 |mask| 270 |length| 275
              |leftRecip| 280 |leftPower| 285 |lcmCoef| 297 |lcm| 303 |latex|
              314 |invmod| 319 |init| 325 |inc| 329 |hashUpdate!| 334 |hash|
              340 |gcdPolynomial| 345 |gcd| 351 |factorial| 362 |factor| 367
              |extendedEuclidean| 372 |exquo| 385 |expressIdealMember| 391
              |even?| 397 |euclideanSize| 402 |divide| 407 |differentiate| 413
              |dec| 424 |copy| 429 |convert| 434 |commutator| 459 |coerce| 465
              |characteristic| 485 |bit?| 489 |binomial| 495 |base| 501
              |associator| 505 |associates?| 512 |antiCommutator| 518
              |annihilate?| 524 |addmod| 530 |abs| 537 ^ 542 |Zero| 554 |One|
              558 D 562 >= 573 > 579 = 585 <= 591 < 597 - 603 + 614 * 620)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&| NIL
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DifferentialRing&| NIL |EntireRing&|
                |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL NIL |Magma&| |AbelianSemiGroup&| NIL NIL |SetCategory&| NIL
                NIL NIL NIL NIL NIL NIL NIL |RetractableTo&| |PartialOrder&|
                NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FortranMachineTypeCategory|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DifferentialRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|PatternMatchable| 5) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|CommutativeStar|)
                 (|SetCategory|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 41)
                 (|ConvertibleTo| 40) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 39) (|ConvertibleTo| 37) (|ConvertibleTo| 5)
                 (|RetractableTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 47))
              (|makeByteWordVec2| 48
                                  '(2 6 0 0 6 7 2 15 12 13 14 16 2 5 19 0 0 20
                                    1 22 0 21 23 2 0 19 0 0 1 1 0 19 0 1 1 0 45
                                    0 1 1 0 0 0 1 1 0 19 0 1 2 0 0 0 0 1 2 0 42
                                    0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 29 0 1 2
                                    0 19 0 0 1 2 0 19 0 0 1 1 0 5 0 1 2 0 0 0 0
                                    1 0 0 0 1 1 0 42 0 1 2 0 0 0 35 1 2 0 0 0 6
                                    1 1 0 25 0 26 1 0 5 0 24 2 0 0 0 0 1 1 0 42
                                    0 1 1 0 43 0 1 1 0 19 0 1 1 0 44 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 1 0 36 21 1 1 0 19 0 1 3 0
                                    0 0 0 0 1 2 0 0 0 0 1 1 0 19 0 1 2 0 0 0 0
                                    1 3 0 38 0 39 38 1 2 0 19 0 0 1 1 0 19 0 1
                                    1 0 19 0 1 1 0 42 0 1 1 0 19 0 1 2 0 30 21
                                    0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 6 6 10 0
                                    0 6 9 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    42 0 1 2 0 0 0 35 1 2 0 0 0 6 1 2 0 27 0 0
                                    1 2 0 0 0 0 1 1 0 0 21 1 1 0 22 0 1 2 0 0 0
                                    0 1 0 0 0 1 1 0 0 0 1 2 0 46 46 0 1 1 0 48
                                    0 1 2 0 28 28 28 1 2 0 0 0 0 1 1 0 0 21 1 1
                                    0 0 0 1 1 0 29 0 1 3 0 32 0 0 0 1 2 0 33 0
                                    0 1 2 0 42 0 0 1 2 0 30 21 0 1 1 0 19 0 1 1
                                    0 35 0 1 2 0 34 0 0 1 2 0 0 0 35 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 37 0 1 1 0 5 0 1
                                    1 0 39 0 1 1 0 40 0 1 1 0 41 0 1 2 0 0 0 0
                                    1 1 0 17 14 18 1 0 0 5 11 1 0 0 0 1 1 0 47
                                    0 1 0 0 35 1 2 0 19 0 0 1 2 0 0 0 0 1 0 0 0
                                    1 3 0 0 0 0 0 1 2 0 19 0 0 1 2 0 0 0 0 1 2
                                    0 19 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    35 1 2 0 0 0 6 1 0 0 0 1 0 0 0 1 2 0 0 0 35
                                    1 1 0 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 2 0
                                    19 0 0 1 2 0 19 0 0 1 2 0 19 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 35 0 1 2 0
                                    0 5 0 1 2 0 0 0 0 1 2 0 0 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineInteger| 'NILADIC T) 
