
(/VERSIONCHECK 2) 

(DEFUN |SYMPOLY;*;3$;1| (|p1| |p2| $)
  (PROG (#1=#:G130 #2=#:G129 #3=#:G131 #4=#:G137 |t2| #5=#:G136 #6=#:G135 |t1|)
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
  (PROG (#1=#:G139 #2=#:G138 #3=#:G140 |r| #4=#:G146 |t2| #5=#:G145 #6=#:G144
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

(DEFUN |SymmetricPolynomial| (#1=#:G166)
  (PROG ()
    (RETURN
     (PROG (#2=#:G167)
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
  (PROG (|pv$| #1=#:G162 #2=#:G163 #3=#:G164 #4=#:G165 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|SymmetricPolynomial|))
      (LETT |dv$| (LIST '|SymmetricPolynomial| DV$1) . #5#)
      (LETT $ (GETREFV 38) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|)))
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
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           (|HasCategory| |#1| '(|Ring|)))
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
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Record| (|:| |k| (|Partition|)) (|:| |c| |#1|)))
      (QSETREFV $ 8 (|List| (QREFELT $ 7)))
      (COND
       ((|HasCategory| |#1| '(|EntireRing|))
        (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;1|) $)))
       ('T (QSETREFV $ 20 (CONS (|dispatchFunction| |SYMPOLY;*;3$;2|) $))))
      $)))) 

(MAKEPROP '|SymmetricPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|)
              '|Term| '|Rep| (0 . |Zero|) (|Boolean|) (|Partition|)
              (4 . |zero?|) (9 . *) (15 . |One|) (19 . |One|) (23 . =) (29 . +)
              (35 . *) (41 . +) (47 . *) (53 . |Zero|) (57 . ~=)
              (|Fraction| 24) (|Integer|) (|NonNegativeInteger|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| 23 '#1="failed") (|Union| 24 '#1#) (|Mapping| 11 11)
              (|List| 6) (|Union| 6 '#1#) (|Mapping| 6 6) (|PositiveInteger|)
              (|String|) (|OutputForm|) (|SingleInteger|))
           '#(|Zero| 63 |One| 67 = 71 + 77 * 83) 'NIL
           (CONS
            (|makeByteWordVec2| 21
                                '(0 0 4 1 4 5 1 6 4 4 7 8 5 0 1 9 6 0 0 1 1 5 9
                                  10 17 2 19 0 2 21 0 0 13 0 0 0 0 0 3 5 4 11
                                  12 14))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&|
                |IntegralDomain&| |Algebra&| |Algebra&| |Algebra&| |Module&|
                NIL |Module&| NIL NIL NIL |Module&| NIL NIL |Ring&| NIL NIL NIL
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&| NIL
                |FullyRetractableTo&| |SetCategory&| |RetractableTo&|
                |BasicType&| NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|
                NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 11) (|AbelianMonoidRing| 6 11)
                 (|IntegralDomain|) (|Algebra| 23) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 23) (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|BiModule| 6 6) (|BiModule| 23 23) (|Ring|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 23) (|RightModule| 23) (|RightModule| $$)
                 (|Rng|) (|LeftModule| $$) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 36)
                 (|unitsKnown|) (|CommutativeStar|) (|noZeroDivisors|)
                 (|RetractableTo| 23) (|RetractableTo| 24)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 22
                                  '(0 0 0 9 1 11 10 0 12 2 0 0 6 0 13 0 0 0 14
                                    0 6 0 15 2 0 10 0 0 16 2 11 0 0 0 17 2 6 0
                                    0 0 18 2 0 0 0 0 19 2 0 0 0 0 20 0 6 0 21 2
                                    6 10 0 0 22 0 20 0 9 0 2 0 14 2 0 10 0 0 16
                                    2 0 0 0 0 19 2 0 0 6 0 13 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
