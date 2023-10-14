
(SDEFUN |FFPOLY2;rootOfIrreduciblePoly;SupF;1|
        ((|pf| |SparseUnivariatePolynomial| GF) ($ F))
        (SPROG
         ((|stillToFactor| #1=(|SparseUnivariatePolynomial| F)) (|root| (F))
          (|degSTF| #2=(|NonNegativeInteger|)) (|degh| #2#)
          (|h| (|SparseUnivariatePolynomial| F)) (#3=#:G128 NIL) (|j| NIL)
          (|trModp| (|SparseUnivariatePolynomial| F)) (|beta| (F))
          (#4=#:G127 NIL) (|i| NIL) (|basispointer| (|Integer|))
          (|basis| (|Vector| F))
          (|qexp| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|p| #1#) (|deg| (|PositiveInteger|)) (#5=#:G109 NIL)
          (|sizeGF| (|NonNegativeInteger|)))
         (SEQ
          (LETT |sizeGF| (SPADCALL (QREFELT $ 9))
                . #6=(|FFPOLY2;rootOfIrreduciblePoly;SupF;1|))
          (LETT |deg|
                (PROG1 (LETT #5# (SPADCALL |pf| (QREFELT $ 11)) . #6#)
                  (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #5#))
                . #6#)
          (EXIT
           (COND ((EQL |deg| 0) (|error| "no roots"))
                 ((EQL |deg| 1)
                  (SPADCALL
                   (SPADCALL (SPADCALL |pf| 0 (QREFELT $ 17)) (QREFELT $ 18))
                   (QREFELT $ 19)))
                 ('T
                  (SEQ
                   (LETT |p| (SPADCALL (ELT $ 18) |pf| (QREFELT $ 23)) . #6#)
                   (LETT |qexp| (SPADCALL |pf| (QREFELT $ 26)) . #6#)
                   (LETT |stillToFactor| |p| . #6#)
                   (LETT |basis| (SPADCALL |deg| (QREFELT $ 29)) . #6#)
                   (LETT |basispointer| 1 . #6#)
                   (LETT |root| (|spadConstant| $ 12) . #6#)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |root| (QREFELT $ 31))) (GO G191)))
                        (SEQ
                         (LETT |beta|
                               (SPADCALL |basis| |basispointer| (QREFELT $ 34))
                               . #6#)
                         (COND
                          ((SPADCALL |beta| (|spadConstant| $ 15)
                                     (QREFELT $ 35))
                           (SEQ
                            (LETT |basispointer| (+ |basispointer| 1) . #6#)
                            (EXIT
                             (LETT |beta|
                                   (SPADCALL |basis| |basispointer|
                                             (QREFELT $ 34))
                                   . #6#)))))
                         (LETT |basispointer| (+ |basispointer| 1) . #6#)
                         (LETT |trModp|
                               (SPADCALL
                                (SPADCALL (ELT $ 18) (QAREF1 |qexp| 0)
                                          (QREFELT $ 23))
                                |beta| (QREFELT $ 36))
                               . #6#)
                         (SEQ (LETT |i| 1 . #6#) (LETT #4# (- |deg| 1) . #6#)
                              G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                              (SEQ
                               (LETT |beta| (SPADCALL |beta| (QREFELT $ 37))
                                     . #6#)
                               (EXIT
                                (LETT |trModp|
                                      (SPADCALL |trModp|
                                                (SPADCALL |beta|
                                                          (SPADCALL (ELT $ 18)
                                                                    (QAREF1
                                                                     |qexp|
                                                                     |i|)
                                                                    (QREFELT $
                                                                             23))
                                                          (QREFELT $ 38))
                                                (QREFELT $ 39))
                                      . #6#)))
                              (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |trModp| (QREFELT $ 40)) 0
                                      (QREFELT $ 41))
                            (SEQ (LETT |j| 1 . #6#) (LETT #3# |sizeGF| . #6#)
                                 G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |h|
                                        (SPADCALL |stillToFactor|
                                                  (SPADCALL |trModp|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |j|
                                                                        (QREFELT
                                                                         $ 42))
                                                              (QREFELT $ 18))
                                                             (QREFELT $ 43))
                                                            (QREFELT $ 39))
                                                  (QREFELT $ 44))
                                        . #6#)
                                  (COND
                                   ((SPADCALL (SPADCALL |h| (QREFELT $ 45))
                                              (|spadConstant| $ 15)
                                              (QREFELT $ 46))
                                    (LETT |h|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |h| (QREFELT $ 45))
                                            (QREFELT $ 47))
                                           |h| (QREFELT $ 38))
                                          . #6#)))
                                  (LETT |degh| (SPADCALL |h| (QREFELT $ 40))
                                        . #6#)
                                  (LETT |degSTF|
                                        (SPADCALL |stillToFactor|
                                                  (QREFELT $ 40))
                                        . #6#)
                                  (EXIT
                                   (COND
                                    ((EQL |degh| 1)
                                     (LETT |root|
                                           (SPADCALL
                                            (SPADCALL |h| 0 (QREFELT $ 48))
                                            (QREFELT $ 19))
                                           . #6#))
                                    ((EQL (- |degSTF| |degh|) 1)
                                     (LETT |root|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |stillToFactor| |h|
                                                       (QREFELT $ 49))
                                             0 (QREFELT $ 48))
                                            (QREFELT $ 19))
                                           . #6#))
                                    ((SPADCALL |degh| 1 (QREFELT $ 41))
                                     (COND
                                      ((< |degh| |degSTF|)
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL 2 |degh| (QREFELT $ 50))
                                          |degSTF| (QREFELT $ 41))
                                         (LETT |stillToFactor|
                                               (SPADCALL |stillToFactor| |h|
                                                         (QREFELT $ 49))
                                               . #6#))
                                        ('T
                                         (LETT |stillToFactor| |h|
                                               . #6#)))))))))
                                 (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                                 (EXIT NIL))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |root|)))))))) 

(DECLAIM (NOTINLINE |FiniteFieldPolynomialPackage2;|)) 

(DEFUN |FiniteFieldPolynomialPackage2| (&REST #1=#:G129)
  (SPROG NIL
         (PROG (#2=#:G130)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldPolynomialPackage2|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldPolynomialPackage2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldPolynomialPackage2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldPolynomialPackage2|)))))))))) 

(DEFUN |FiniteFieldPolynomialPackage2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldPolynomialPackage2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteFieldPolynomialPackage2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteFieldPolynomialPackage2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteFieldPolynomialPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |size|)
              (|SparseUnivariatePolynomial| 7) (4 . |degree|) (9 . |Zero|)
              (13 . |Zero|) (17 . |Zero|) (21 . |One|) (25 . |One|)
              (29 . |coefficient|) (35 . |coerce|) (40 . -)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (45 . |map|)
              (|PrimitiveArray| 10) (|FiniteFieldPolynomialPackage| 7)
              (51 . |reducedQPowers|) (|Vector| $) (|PositiveInteger|)
              (56 . |basis|) (|Boolean|) (61 . |zero?|) (|Integer|)
              (|Vector| 6) (66 . |elt|) (72 . =) (78 . *) (84 . |Frobenius|)
              (89 . *) (95 . +) (101 . |degree|) (106 . >) (112 . |index|)
              (117 . |coerce|) (122 . |gcd|) (128 . |leadingCoefficient|)
              (133 . ~=) (139 . |inv|) (144 . |coefficient|) (150 . |quo|)
              (156 . *) |FFPOLY2;rootOfIrreduciblePoly;SupF;1|)
           '#(|rootOfIrreduciblePoly| 162) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(0 7 8 9 1 10 8 0 11 0 6 0 12
                                                   0 7 0 13 0 10 0 14 0 6 0 15
                                                   0 7 0 16 2 10 7 0 8 17 1 6 0
                                                   7 18 1 6 0 0 19 2 22 20 21
                                                   10 23 1 25 24 10 26 1 6 27
                                                   28 29 1 6 30 0 31 2 33 6 0
                                                   32 34 2 6 30 0 0 35 2 20 0 0
                                                   6 36 1 6 0 0 37 2 20 0 6 0
                                                   38 2 20 0 0 0 39 1 20 8 0 40
                                                   2 8 30 0 0 41 1 7 0 28 42 1
                                                   20 0 6 43 2 20 0 0 0 44 1 20
                                                   6 0 45 2 6 30 0 0 46 1 6 0 0
                                                   47 2 20 6 0 8 48 2 20 0 0 0
                                                   49 2 8 0 28 0 50 1 0 6 10
                                                   51)))))
           '|lookupComplete|)) 
