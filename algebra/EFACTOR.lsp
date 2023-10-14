
(SDEFUN |EFACTOR;factorPolynomial;SupF;1|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|fr2| (|SparseUnivariatePolynomial| F))
          (|fru| (|SparseUnivariatePolynomial| F))
          (|fr1| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G128 NIL) (|frec| NIL)
          (|fres1|
           (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|pf| (F)) (|xk| (|Kernel| F)) (|xs| (|Symbol|)) (#2=#:G127 NIL)
          (|k| NIL) (|kl| (|List| (|Kernel| F)))
          (|cnp| (|SparseUnivariatePolynomial| F)) (|cn| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |p| (QREFELT $ 13))
                . #3=(|EFACTOR;factorPolynomial;SupF;1|))
          (LETT |cn| (SPADCALL |p| (QREFELT $ 14)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |cn| (|spadConstant| $ 15) (QREFELT $ 17))
             (SPADCALL |p| 1 (QREFELT $ 21)))
            (#4='T
             (SEQ (LETT |p| (SPADCALL |p| |cn| (QREFELT $ 22)) . #3#)
                  (LETT |cnp| (SPADCALL |cn| (QREFELT $ 23)) . #3#)
                  (EXIT
                   (COND ((< |n| 1) (SPADCALL |cnp| NIL (QREFELT $ 27)))
                         ((EQL |n| 1)
                          (SPADCALL |cnp|
                                    (LIST (VECTOR (CONS 3 "prime") |p| 1))
                                    (QREFELT $ 27)))
                         (#4#
                          (SEQ
                           (LETT |kl|
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                           (QREFELT $ 32))
                                 . #3#)
                           (SEQ (LETT |k| NIL . #3#) (LETT #2# |kl| . #3#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (COND
                                  ((NULL
                                    (SPADCALL |k| '|nthRoot| (QREFELT $ 35)))
                                   (COND
                                    ((NULL
                                      (SPADCALL |k| '|rootOf| (QREFELT $ 35)))
                                     (EXIT "iterate")))))
                                 (EXIT
                                  (|error|
                                   "factorPolynomial: algebraic coefficients")))
                                (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |xs| (SPADCALL (QREFELT $ 36)) . #3#)
                           (LETT |xk| (SPADCALL |xs| (QREFELT $ 37)) . #3#)
                           (LETT |pf|
                                 (SPADCALL
                                  (SPADCALL |p| (QREFELT $ 10)
                                            (SPADCALL |xk| (QREFELT $ 39))
                                            (QREFELT $ 40))
                                  (QREFELT $ 41))
                                 . #3#)
                           (LETT |fres1|
                                 (SPADCALL (SPADCALL |pf| (QREFELT $ 43))
                                           (QREFELT $ 47))
                                 . #3#)
                           (LETT |res| (SPADCALL |cnp| NIL (QREFELT $ 27))
                                 . #3#)
                           (SEQ (LETT |frec| NIL . #3#)
                                (LETT #1# (SPADCALL |fres1| (QREFELT $ 50))
                                      . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN
                                       (LETT |frec| (CAR #1#) . #3#)
                                       NIL))
                                  (GO G191)))
                                (SEQ (LETT |fr1| (QVELT |frec| 1) . #3#)
                                     (EXIT
                                      (COND
                                       ((< (SPADCALL |fr1| |xk| (QREFELT $ 51))
                                           1)
                                        "iterate")
                                       ((SPADCALL (QVELT |frec| 0)
                                                  (CONS 3 "prime")
                                                  (QREFELT $ 52))
                                        (|error| "impossible"))
                                       ('T
                                        (SEQ
                                         (LETT |fru|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |fr1|
                                                           (QREFELT $ 53))
                                                 |xk| (QREFELT $ 55))
                                                (QREFELT $ 57))
                                               . #3#)
                                         (LETT |fr2|
                                               (SPADCALL |fru|
                                                         (SPADCALL |fru|
                                                                   (QREFELT $
                                                                            14))
                                                         (QREFELT $ 22))
                                               . #3#)
                                         (EXIT
                                          (LETT |res|
                                                (SPADCALL |res|
                                                          (SPADCALL |fr2|
                                                                    (QVELT
                                                                     |frec| 2)
                                                                    (QREFELT $
                                                                             58))
                                                          (QREFELT $ 59))
                                                . #3#)))))))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))))))) 

(PUT '|EFACTOR;factorPolynomial;SupF;2| '|SPADreplace|
     '(XLAM (|p|) (|error| "factorPolynomial unimplemented"))) 

(SDEFUN |EFACTOR;factorPolynomial;SupF;2|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (|error| "factorPolynomial unimplemented")) 

(PUT '|EFACTOR;factorPolynomial;SupF;3| '|SPADreplace|
     '(XLAM (|p|) (|error| "factorPolynomial unimplemented"))) 

(SDEFUN |EFACTOR;factorPolynomial;SupF;3|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (|error| "factorPolynomial unimplemented")) 

(DECLAIM (NOTINLINE |ExpressionFactorPolynomial;|)) 

(DEFUN |ExpressionFactorPolynomial| (&REST #1=#:G131)
  (SPROG NIL
         (PROG (#2=#:G132)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionFactorPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionFactorPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionFactorPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionFactorPolynomial|)))))))))) 

(DEFUN |ExpressionFactorPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionFactorPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionFactorPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 61) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionFactorPolynomial|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (COND
             ((|domainEqual| |#2| (|Expression| (|Integer|)))
              (PROGN
               (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
               (QSETREFV $ 60
                         (CONS
                          (|dispatchFunction|
                           |EFACTOR;factorPolynomial;SupF;1|)
                          $))))
             ('T
              (QSETREFV $ 60
                        (CONS
                         (|dispatchFunction| |EFACTOR;factorPolynomial;SupF;2|)
                         $)))))
           ('T
            (QSETREFV $ 60
                      (CONS
                       (|dispatchFunction| |EFACTOR;factorPolynomial;SupF;3|)
                       $))))
          $))) 

(MAKEPROP '|ExpressionFactorPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SingletonAsOrderedSet|) (0 . |create|) '|dummy|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 7)
              (4 . |degree|) (9 . |leadingCoefficient|) (14 . |Zero|)
              (|Boolean|) (18 . =) (24 . |One|) (|Integer|) (|Factored| 12)
              (28 . |nilFactor|) (34 . /) (40 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 24) (|:| |fctr| 12) (|:| |xpnt| 19))
              (|List| 25) (45 . |makeFR|) (|List| 7) (51 . |coefficients|)
              (|List| 38) (|List| $) (56 . |kernels|) (|Symbol|) (|Kernel| 7)
              (61 . |is?|) (67 . |new|) (71 . |kernel|) (|Kernel| $)
              (76 . |coerce|) (81 . |eval|) (88 . |retract|)
              (|SparseMultivariatePolynomial| 6 38) (93 . |numer|)
              (|Factored| 45) (|SparseMultivariatePolynomial| 6 34)
              (|MultivariateFactorize| 34 (|IndexedExponents| 34) 6 45)
              (98 . |factor|)
              (|Record| (|:| |flg| 24) (|:| |fctr| 45) (|:| |xpnt| 19))
              (|List| 48) (103 . |factorList|) (108 . |degree|) (114 . ~=)
              (120 . |coerce|) (|Fraction| (|SparseUnivariatePolynomial| $))
              (125 . |univariate|) (|Fraction| 12) (131 . |numer|)
              (136 . |primeFactor|) (142 . *) (148 . |factorPolynomial|))
           '#(|factorPolynomial| 153) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(0 8 0 9 1 12 11 0 13 1 12 7
                                                   0 14 0 7 0 15 2 7 16 0 0 17
                                                   0 7 0 18 2 20 0 12 19 21 2
                                                   12 0 0 7 22 1 12 0 7 23 2 20
                                                   0 12 26 27 1 12 28 0 29 1 7
                                                   30 31 32 2 34 16 0 33 35 0
                                                   33 0 36 1 34 0 33 37 1 7 0
                                                   38 39 3 12 0 0 8 7 40 1 12 7
                                                   0 41 1 7 42 0 43 1 46 44 45
                                                   47 1 44 49 0 50 2 45 11 0 34
                                                   51 2 24 16 0 0 52 1 7 0 42
                                                   53 2 7 54 0 38 55 1 56 12 0
                                                   57 2 20 0 12 19 58 2 20 0 0
                                                   0 59 1 0 20 12 60 1 0 20 12
                                                   60)))))
           '|lookupComplete|)) 
