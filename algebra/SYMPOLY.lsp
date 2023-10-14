
(DEFUN |SYMPOLY;*;3$;1| (|p1| |p2| $)
  (PROG (#1=#:G108 #2=#:G107 #3=#:G109 #4=#:G115 |t2| #5=#:G114 #6=#:G113 |t1|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 9))
            ('T
             (COND
              ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT $ 12))
               (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 13)))
              ((SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 16)) |p1|)
              (#7='T
               (PROGN
                (LETT #1# NIL . #8=(|SYMPOLY;*;3$;1|))
                (SEQ (LETT |t1| NIL . #8#) (LETT #6# (REVERSE |p1|) . #8#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #5# NIL . #8#)
                               (SEQ (LETT |t2| NIL . #8#) (LETT #4# |p2| . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |t2| (CAR #4#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #5#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |t1|) (QCAR |t2|)
                                                        (QREFELT $ 17))
                                              (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                        (QREFELT $ 18)))
                                             #5#)
                                            . #8#)))
                                    (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              . #8#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #8#))
                         ('T
                          (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                     (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#7# (|spadConstant| $ 9)))))))))))) 

(DEFUN |SYMPOLY;*;3$;2| (|p1| |p2| $)
  (PROG (#1=#:G117 #2=#:G116 #3=#:G118 |r| #4=#:G124 |t2| #5=#:G123 #6=#:G122
         |t1|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 9))
            ('T
             (COND
              ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT $ 12))
               (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 13)))
              ((SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 16)) |p1|)
              (#7='T
               (PROGN
                (LETT #1# NIL . #8=(|SYMPOLY;*;3$;2|))
                (SEQ (LETT |t1| NIL . #8#) (LETT #6# (REVERSE |p1|) . #8#) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (PROGN
                               (LETT #5# NIL . #8#)
                               (SEQ (LETT |t2| NIL . #8#) (LETT #4# |p2| . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |t2| (CAR #4#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |r|
                                               (SPADCALL (QCDR |t1|)
                                                         (QCDR |t2|)
                                                         (QREFELT $ 18))
                                               . #8#)
                                         (|spadConstant| $ 21) (QREFELT $ 22))
                                        (LETT #5#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT $ 17))
                                                |r|)
                                               #5#)
                                              . #8#)))))
                                    (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              . #8#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 19)) . #8#))
                         ('T
                          (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                     (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#7# (|spadConstant| $ 9)))))))))))) 

(DECLAIM (NOTINLINE |SymmetricPolynomial;|)) 

(DEFUN |SymmetricPolynomial| (#1=#:G144)
  (PROG ()
    (RETURN
     (PROG (#2=#:G145)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SymmetricPolynomial|)
                                           '|domainEqualList|)
                . #3=(|SymmetricPolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SymmetricPolynomial;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SymmetricPolynomial|))))))))))) 

(DEFUN |SymmetricPolynomial;| (|#1|)
  (PROG (|pv$| #1=#:G140 #2=#:G141 #3=#:G142 #4=#:G143 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|SymmetricPolynomial|))
      (LETT |dv$| (LIST '|SymmetricPolynomial| DV$1) . #5#)
      (LETT $ (GETREFV 39) . #5#)
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
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
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
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #1# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| (|Partition|)
                                                          '(|CancellationAbelianMonoid|)))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|SymmetricPolynomial| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 134217728))
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 268435456))
      (AND
       (OR (|HasCategory| |#1| '(|EntireRing|))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|)))
       (|augmentPredVector| $ 1073741824))
      (AND
       (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|SemiRing|)))
       (|augmentPredVector| $ 2147483648))
      (AND
       (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|)))
       (|augmentPredVector| $ 4294967296))
      (AND
       (OR #3#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 8589934592))
      (AND
       (OR #2#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 17179869184))
      (AND
       (OR #1#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 34359738368))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Record| (|:| |k| (|Partition|)) (|:| |c| |#1|)))
      (QSETREFV $ 8 (|List| (QREFELT $ 7)))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;1|) $)))
       ('T (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;2|) $))))
      $)))) 

(MAKEPROP '|SymmetricPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|)
              '|Term| '|Rep| (0 . |Zero|) (|Boolean|) (|Partition|)
              (4 . |zero?|) (9 . *) (15 . |One|) (19 . |One|) (23 . =) (29 . +)
              (35 . *) (41 . +) (47 . *) (53 . |Zero|) (57 . ~=) (|Integer|)
              (|NonNegativeInteger|) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 23) (|Union| 27 '#1="failed") (|Union| 23 '#1#)
              (|Mapping| 11 11) (|List| 6) (|Union| 6 '#1#) (|Mapping| 6 6)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(|Zero| 63 |One| 67 = 71 + 77 * 83) 'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 2 1 2 16 1 16 2 3 4 16 5 0 1 17 19 0 0 1
                                  1 17 18 20 22 24 6 0 26 6 0 0 10 0 0 0 0 0 0
                                  16 7 5 8 9 11))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL |Algebra&|
                |Algebra&| |Algebra&| |Module&| NIL |Module&| NIL NIL |Module&|
                |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |AbelianSemiGroup&| |SemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL |RetractableTo&| |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 11) (|AbelianMonoidRing| 6 11)
                 (|IntegralDomain|) (|Algebra| 27) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 27) (|CommutativeRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|BiModule| 6 6) (|BiModule| 27 27) (|Ring|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 27) (|RightModule| 27) (|Rng|) (|LeftModule| $$)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 38)
                 (|CommutativeStar|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 27) (|RetractableTo| 23)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 36
                                  '(0 0 0 9 1 11 10 0 12 2 0 0 6 0 13 0 0 0 14
                                    0 6 0 15 2 0 10 0 0 16 2 11 0 0 0 17 2 6 0
                                    0 0 18 2 0 0 0 0 19 2 0 0 0 0 20 0 6 0 21 2
                                    6 10 0 0 22 0 36 0 9 0 32 0 14 2 0 10 0 0
                                    16 2 0 0 0 0 19 2 0 0 6 0 13 2 0 0 0 0
                                    20)))))
           '|lookupIncomplete|)) 
