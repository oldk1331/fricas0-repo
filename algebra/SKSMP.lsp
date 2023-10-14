
(SDEFUN |SKSMP;D;Var$;1| ((|v| |Var|) ($ $))
        (SPADCALL (|spadConstant| $ 10) |v| 1 (QREFELT $ 13))) 

(SDEFUN |SKSMP;Delta;S$;2| ((|s| |Symbol|) ($ $))
        (SPROG ((|vu| (|Union| |Var| "failed")))
               (SEQ
                (LETT |vu| (SPADCALL |s| (QREFELT $ 17)) |SKSMP;Delta;S$;2|)
                (EXIT
                 (COND ((QEQCAR |vu| 1) (|error| "missing variable"))
                       ('T (SPADCALL (QCDR |vu|) (QREFELT $ 14)))))))) 

(SDEFUN |SKSMP;lift_map| ((|f| |Mapping| R R) ($ |Mapping| $ $))
        (SPROG NIL (CONS #'|SKSMP;lift_map!0| (VECTOR $ |f|)))) 

(SDEFUN |SKSMP;lift_map!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|SKSMP;lift_map|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 28)))))) 

(SDEFUN |SKSMP;lift_morphism| ((|m| |Automorphism| R) ($ |Automorphism| $))
        (SPROG NIL
               (SPADCALL
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!0| (VECTOR $ |m|)) $)
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!1| (VECTOR $ |m|)) $)
                (QREFELT $ 32)))) 

(SDEFUN |SKSMP;lift_morphism!1| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|SKSMP;lift_morphism|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |m| (QREFELT $ 31)) |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;lift_morphism!0| ((|x| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|SKSMP;lift_morphism|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |m| |x| (QREFELT $ 30)))))) 

(SDEFUN |SKSMP;*;3$;5| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|ru| (|Upol|)) (|yu| (|Upol|)) (|xu| (|Upol|)) (|v| (|Var|))
          (#1=#:G134 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 34))
            (SPADCALL (SPADCALL |x| (QREFELT $ 35)) |y| (QREFELT $ 36)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2
                       (LETT #1# (SPADCALL |x| (QREFELT $ 38))
                             . #2=(|SKSMP;*;3$;5|))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) "failed") #1#))
                   . #2#)
             (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)) . #2#)
             (LETT |yu| (SPADCALL |y| |v| (QREFELT $ 40)) . #2#)
             (LETT |ru|
                   (SPADCALL |xu| |yu|
                             (|SKSMP;lift_morphism|
                              (SPADCALL |v| (QREFELT $ 8)) $)
                             (|SKSMP;lift_map| (SPADCALL |v| (QREFELT $ 9)) $)
                             (QREFELT $ 42))
                   . #2#)
             (EXIT (SPADCALL |ru| |v| (QREFELT $ 43))))))))) 

(SDEFUN |SKSMP;*;$R$;6| ((|x| $) (|r| R) ($ $))
        (SPADCALL |x| (SPADCALL |r| (QREFELT $ 45)) (QREFELT $ 44))) 

(SDEFUN |SKSMP;exquo;2$U;7| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG
         ((|res| ($)) (|cc| ($)) (#1=#:G157 NIL)
          (|cu| (|Union| (|SparseMultivariatePolynomial| R |Var|) "failed"))
          (|lx| (|SparseMultivariatePolynomial| R |Var|)) (|lx1| ($))
          (|ly| (|SparseMultivariatePolynomial| R |Var|))
          (|maxd| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |y| (QREFELT $ 34))
             (SPADCALL |x| (SPADCALL |y| (QREFELT $ 35)) (QREFELT $ 47)))
            ((SPADCALL |x| (QREFELT $ 34)) (CONS 1 "failed"))
            ('T
             (SEQ
              (LETT |maxd| (SPADCALL |x| (QREFELT $ 48))
                    . #2=(|SKSMP;exquo;2$U;7|))
              (LETT |ly| (SPADCALL |y| (QREFELT $ 49)) . #2#)
              (LETT |res| (|spadConstant| $ 25) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |x| (|spadConstant| $ 25) (QREFELT $ 51)))
                     (GO G191)))
                   (SEQ (LETT |lx1| (SPADCALL |x| (QREFELT $ 49)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |lx1| (QREFELT $ 48)) |maxd|
                                     (QREFELT $ 52))
                           (PROGN
                            (LETT #1# (CONS 1 "failed") . #2#)
                            (GO #3=#:G156)))
                          ('T
                           (SEQ (LETT |lx| |lx1| . #2#)
                                (LETT |cu| (SPADCALL |lx| |ly| (QREFELT $ 53))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |cu| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #2#)
                                    (GO #3#)))
                                  ('T
                                   (SEQ (LETT |cc| (QCDR |cu|) . #2#)
                                        (LETT |res|
                                              (SPADCALL |res| |cc|
                                                        (QREFELT $ 54))
                                              . #2#)
                                        (EXIT
                                         (LETT |x|
                                               (SPADCALL |x|
                                                         (SPADCALL |cc| |y|
                                                                   (QREFELT $
                                                                            44))
                                                         (QREFELT $ 55))
                                               . #2#)))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |res|))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SKSMP;^;$Pi$;8| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPROG ((|res| ($)) (#1=#:G161 NIL) (|i| NIL))
               (SEQ (LETT |res| |x| . #2=(|SKSMP;^;$Pi$;8|))
                    (SEQ (LETT |i| 2 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT $ 44))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SKSMP;^;$Nni$;9| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 10))
              ('T (SPADCALL |x| |n| (QREFELT $ 58))))) 

(SDEFUN |SKSMP;coerce;$Of;10| ((|x| $) ($ |OutputForm|))
        (SPROG ((|xu| (|Upol|)) (|v| (|Var|)) (#1=#:G164 NIL))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 34))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 61)))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2
                             (LETT #1# (SPADCALL |x| (QREFELT $ 38))
                                   . #2=(|SKSMP;coerce;$Of;10|))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) "failed")
                                           #1#))
                         . #2#)
                   (LETT |xu| (SPADCALL |x| |v| (QREFELT $ 40)) . #2#)
                   (EXIT
                    (SPADCALL |xu|
                              (SPADCALL (SPADCALL 'D (QREFELT $ 62))
                                        (SPADCALL |v| (QREFELT $ 63))
                                        (QREFELT $ 64))
                              (QREFELT $ 65))))))))) 

(DECLAIM (NOTINLINE |SparseMultivariateSkewPolynomial;|)) 

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G183)
  (SPROG NIL
         (PROG (#2=#:G184)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariateSkewPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariateSkewPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseMultivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G182 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseMultivariateSkewPolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT DV$4 (|devaluate| |#4|) . #2#)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4)
          . #2#)
    (LETT $ (GETREFV 88) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 262144))
    (AND (|HasCategory| $ '(|CommutativeRing|)) (|augmentPredVector| $ 524288))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1048576))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|variable|
                            (LIST
                             (LIST '|Union| (|devaluate| |#2|)
                                   (|devaluate| "failed"))
                             '(|Symbol|))))
      (QSETREFV $ 18 (CONS (|dispatchFunction| |SKSMP;Delta;S$;2|) $))))
    (QSETREFV $ 19 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 20
              (|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| |#1| |#2|)))
    (QSETREFV $ 24
              (SPADCALL (LIST #'|SparseMultivariateSkewPolynomial!0|)
                        (QREFELT $ 23)))
    (QSETREFV $ 26
              (|SparseUnivariateSkewPolynomial| $ (QREFELT $ 24)
                                                (CONS
                                                 #'|SparseMultivariateSkewPolynomial!1|
                                                 $)))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 56 (CONS (|dispatchFunction| |SKSMP;exquo;2$U;7|) $))))
    $))) 

(DEFUN |SparseMultivariateSkewPolynomial!1| (|x| $) (|spadConstant| $ 25)) 

(DEFUN |SparseMultivariateSkewPolynomial!0| (|x| $$) |x|) 

(MAKEPROP '|SparseMultivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |One|) (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|)
              |SKSMP;D;Var$;1| (|Union| $ '"failed") (|Symbol|)
              (15 . |variable|) (20 . |Delta|) '|Sup| '|Supp| (|Mapping| $$ $$)
              (|Automorphism| $$) (25 . |morphism|) '|id| (30 . |Zero|) '|Upol|
              (|Mapping| 6 6) (34 . |map|) (|Automorphism| 6) (40 . |elt|)
              (46 . |inv|) (51 . |morphism|) (|Boolean|) (57 . |ground?|)
              (62 . |retract|) (67 . *) (|Union| 7 '"failed")
              (73 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (78 . |univariate|) (|UnivariateSkewPolynomialCategoryOps| $$ 26)
              (84 . |times|) (92 . |multivariate|) |SKSMP;*;3$;5|
              (98 . |coerce|) |SKSMP;*;$R$;6| (103 . |exquo|)
              (109 . |totalDegree|) (114 . |leadingMonomial|) (119 . |Zero|)
              (123 . ~=) (129 . >) (135 . |exquo|) (141 . +) (147 . -)
              (153 . |exquo|) (|PositiveInteger|) |SKSMP;^;$Pi$;8|
              |SKSMP;^;$Nni$;9| (|OutputForm|) (159 . |coerce|)
              (164 . |coerce|) (169 . |coerce|) (174 . |sub|)
              (180 . |outputForm|) |SKSMP;coerce;$Of;10|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 74) (|Matrix| 74) (|Matrix| $)
              (|Record| (|:| |mat| 69) (|:| |vec| (|Vector| 74))) (|Vector| $)
              (|Union| 68 '#1="failed") (|Integer|) (|Union| 74 '#1#)
              (|List| 7) (|List| $) (|List| 12) (|Matrix| 6)
              (|Record| (|:| |mat| 79) (|:| |vec| (|Vector| 6)))
              (|Mapping| 82 82) (|IndexedExponents| 7) (|List| 6)
              (|Union| 6 '#1#) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 186 |zero?| 192 |variables| 197 |unitNormal| 202
              |unitCanonical| 207 |unit?| 212 |totalDegreeSorted| 217
              |totalDegree| 223 |subtractIfCan| 234 |smaller?| 240 |sample| 246
              |retractIfCan| 250 |retract| 265 |reductum| 280 |reducedSystem|
              285 |recip| 307 |primitivePart| 312 |primitiveMonomials| 317
              |pomopo!| 322 |opposite?| 330 |one?| 336 |numberOfMonomials| 341
              |monomials| 346 |monomial?| 351 |monomial| 356 |minimumDegree|
              376 |mapExponents| 381 |map| 387 |mainVariable| 393
              |leadingMonomial| 398 |leadingCoefficient| 403 |latex| 408
              |hashUpdate!| 413 |hash| 419 |ground?| 424 |ground| 429 |exquo|
              434 |degree| 446 |content| 463 |coerce| 468 |coefficients| 493
              |coefficient| 498 |charthRoot| 518 |characteristic| 523
              |binomThmExpt| 527 |associates?| 534 |annihilate?| 540 ^ 546
              |Zero| 558 |One| 562 |Delta| 566 D 571 = 576 / 582 - 588 + 599 *
              605)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 2 0 1 2 5 0 1 6 2 3 4 5 7 14 0 0 1 8
                                  0 0 0 0 1 1 9 0 0 0 0 0 0 0 0 13 0 0 0 0 0 0
                                  6 7 10 11 12))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |FullyLinearlyExplicitRingOver&|
                |Algebra&| |Algebra&| |Algebra&| NIL |Module&| NIL |Module&|
                NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |Monoid&|
                NIL |AbelianMonoid&| |SemiGroup&| |AbelianSemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| 68) (|Algebra| $$) (|Algebra| 6)
                 (|LinearlyExplicitRingOver| 6) (|Module| 68)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 74) (|Ring|) (|BiModule| 6 6)
                 (|BiModule| 68 68) (|BiModule| $$ $$) (|LeftModule| $$)
                 (|Rng|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 68)
                 (|RightModule| 68) (|RightModule| $$) (|AbelianGroup|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|unitsKnown|) (|RetractableTo| 6)
                 (|BasicType|) (|CoercibleTo| 60) (|CommutativeStar|)
                 (|noZeroDivisors|) (|RetractableTo| 68) (|RetractableTo| 74)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 87
                                  '(0 0 0 10 0 6 0 11 3 0 0 0 7 12 13 1 7 15 16
                                    17 1 0 0 16 18 1 22 0 21 23 0 0 0 25 2 0 0
                                    27 0 28 2 29 6 0 6 30 1 29 0 0 31 2 22 0 21
                                    21 32 1 0 33 0 34 1 0 6 0 35 2 0 0 6 0 36 1
                                    0 37 0 38 2 5 39 0 7 40 4 41 26 26 26 22 21
                                    42 2 5 0 39 7 43 1 0 0 6 45 2 0 15 0 6 47 1
                                    0 12 0 48 1 0 0 0 49 0 6 0 50 2 0 33 0 0 51
                                    2 12 33 0 0 52 2 5 15 0 0 53 2 0 0 0 0 54 2
                                    0 0 0 0 55 2 0 15 0 0 56 1 6 60 0 61 1 16
                                    60 0 62 1 7 60 0 63 2 60 0 0 0 64 2 26 60 0
                                    60 65 2 0 33 0 0 51 1 0 33 0 1 1 0 76 0 1 1
                                    21 67 0 1 1 21 0 0 1 1 21 33 0 1 2 0 12 0
                                    76 1 2 0 12 0 76 1 1 0 12 0 48 2 0 15 0 0 1
                                    2 13 33 0 0 1 0 0 0 1 1 10 73 0 1 1 11 75 0
                                    1 1 0 84 0 1 1 10 68 0 1 1 11 74 0 1 1 0 6
                                    0 35 1 0 0 0 1 1 14 69 70 1 2 14 71 70 72 1
                                    1 0 79 70 1 2 0 80 70 72 1 1 0 15 0 1 1 17
                                    0 0 1 1 0 77 0 1 4 0 0 0 6 82 0 1 2 0 33 0
                                    0 1 1 0 33 0 1 1 0 12 0 1 1 0 77 0 1 1 0 33
                                    0 1 3 0 0 0 7 12 13 3 0 0 0 76 78 1 2 0 0 6
                                    82 1 1 0 82 0 1 2 0 0 81 0 1 2 0 0 27 0 28
                                    1 0 37 0 38 1 0 0 0 49 1 0 6 0 1 1 0 85 0 1
                                    2 0 87 87 0 1 1 0 86 0 1 1 0 33 0 34 1 0 6
                                    0 1 2 21 15 0 0 56 2 7 15 0 6 47 2 0 78 0
                                    76 1 2 0 12 0 7 1 1 0 82 0 1 1 17 6 0 1 1
                                    19 0 0 1 1 16 0 68 1 1 0 0 74 1 1 0 0 6 45
                                    1 0 60 0 66 1 0 83 0 1 3 0 0 0 76 78 1 3 0
                                    0 0 7 12 1 2 0 6 0 82 1 1 3 15 0 1 0 0 12 1
                                    3 20 0 0 0 12 1 2 21 33 0 0 1 2 0 33 0 0 1
                                    2 0 0 0 12 59 2 0 0 0 57 58 0 0 0 25 0 0 0
                                    10 1 18 0 16 18 1 0 0 7 14 2 0 33 0 0 1 2
                                    15 0 0 6 1 1 0 0 0 1 2 0 0 0 0 55 2 0 0 0 0
                                    54 2 1 0 0 68 1 2 1 0 68 0 1 2 0 0 12 0 1 2
                                    0 0 74 0 1 2 0 0 6 0 36 2 0 0 0 0 44 2 0 0
                                    0 6 46 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
