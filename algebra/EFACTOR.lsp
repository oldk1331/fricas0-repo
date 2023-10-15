
(SDEFUN |EFACTOR;poly_factor;SupF;1|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |EFACTOR;poly_factor;SupF;2|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |EFACTOR;poly_factor;SupF;3|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (SPADCALL |p| (QREFELT $ 16))) 

(PUT '|EFACTOR;poly_factor;SupF;4| '|SPADreplace|
     '(XLAM (|p|) (|error| "factorPolynomial unimplemented"))) 

(SDEFUN |EFACTOR;poly_factor;SupF;4|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |Factored|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)))))
        (|error| "factorPolynomial unimplemented")) 

(SDEFUN |EFACTOR;factorPolynomial;SupF;5|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|fr2| (|SparseUnivariatePolynomial| F))
          (|fru| (|SparseUnivariatePolynomial| F))
          (|fr1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#1=#:G134 NIL) (|frec| NIL)
          (|fres1|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| F)))))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|pf| (F)) (#2=#:G133 NIL) (|k| NIL) (|kl| (|List| (|Kernel| F)))
          (|cnp| (|SparseUnivariatePolynomial| F)) (|cn| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |p| (QREFELT $ 28))
                . #3=(|EFACTOR;factorPolynomial;SupF;5|))
          (LETT |cn| (SPADCALL |p| (QREFELT $ 29)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |cn| (|spadConstant| $ 31) (QREFELT $ 33))
             (SPADCALL |p| 1 (QREFELT $ 38)))
            (#4='T
             (SEQ (LETT |p| (SPADCALL |p| |cn| (QREFELT $ 39)) . #3#)
                  (LETT |cnp| (SPADCALL |cn| (QREFELT $ 40)) . #3#)
                  (EXIT
                   (COND ((< |n| 1) (SPADCALL |cnp| NIL (QREFELT $ 44)))
                         ((EQL |n| 1)
                          (SPADCALL |cnp|
                                    (LIST (VECTOR (CONS 3 "prime") |p| 1))
                                    (QREFELT $ 44)))
                         (#4#
                          (SEQ
                           (LETT |kl|
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 46))
                                           (QREFELT $ 49))
                                 . #3#)
                           (SEQ (LETT |k| NIL . #3#) (LETT #2# |kl| . #3#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (COND
                                  ((NULL
                                    (SPADCALL |k| '|nthRoot| (QREFELT $ 50)))
                                   (COND
                                    ((NULL
                                      (SPADCALL |k| '|rootOf| (QREFELT $ 50)))
                                     (EXIT "iterate")))))
                                 (EXIT
                                  (|error|
                                   "factorPolynomial: algebraic coefficients")))
                                (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |pf|
                                 (SPADCALL
                                  (SPADCALL |p| (QREFELT $ 19)
                                            (SPADCALL (QREFELT $ 25)
                                                      (QREFELT $ 52))
                                            (QREFELT $ 53))
                                  (QREFELT $ 54))
                                 . #3#)
                           (LETT |p2|
                                 (SPADCALL (SPADCALL |pf| (QREFELT $ 56))
                                           (QREFELT $ 25) (QREFELT $ 57))
                                 . #3#)
                           (LETT |fres1| (SPADCALL |p2| (QREFELT $ 12)) . #3#)
                           (LETT |res| (SPADCALL |cnp| NIL (QREFELT $ 44))
                                 . #3#)
                           (SEQ (LETT |frec| NIL . #3#)
                                (LETT #1# (SPADCALL |fres1| (QREFELT $ 60))
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
                                       ((< (SPADCALL |fr1| (QREFELT $ 61)) 1)
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (COND
                                          ((SPADCALL (QVELT |frec| 0)
                                                     (CONS 3 "prime")
                                                     (QREFELT $ 62))
                                           (COND
                                            ((SPADCALL (QVELT |frec| 0)
                                                       (CONS 2 "irred")
                                                       (QREFELT $ 62))
                                             (EXIT (|error| "impossible"))))))
                                         (LETT |fru|
                                               (SPADCALL (ELT $ 63) |fr1|
                                                         (QREFELT $ 66))
                                               . #3#)
                                         (LETT |fr2|
                                               (SPADCALL |fru|
                                                         (SPADCALL |fru|
                                                                   (QREFELT $
                                                                            29))
                                                         (QREFELT $ 39))
                                               . #3#)
                                         (EXIT
                                          (LETT |res|
                                                (SPADCALL |res|
                                                          (SPADCALL |fr2|
                                                                    (QVELT
                                                                     |frec| 2)
                                                                    (QREFELT $
                                                                             67))
                                                          (QREFELT $ 68))
                                                . #3#)))))))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))))))) 

(DECLAIM (NOTINLINE |ExpressionFactorPolynomial;|)) 

(DEFUN |ExpressionFactorPolynomial| (&REST #1=#:G135)
  (SPROG NIL
         (PROG (#2=#:G136)
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
          (LETT $ (GETREFV 70) . #1#)
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
            (PROGN
             (QSETREFV $ 12
                       (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;1|)
                             $))))
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (PROGN
             (QSETREFV $ 12
                       (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;2|)
                             $))))
           ((|HasCategory|
             (|SparseMultivariatePolynomial| |#1| (|Kernel| |#2|))
             '(|PolynomialFactorizationExplicit|))
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;3|)
                            $)))
           ('T
            (QSETREFV $ 12
                      (CONS (|dispatchFunction| |EFACTOR;poly_factor;SupF;4|)
                            $))))
          (QSETREFV $ 19 (SPADCALL (QREFELT $ 18)))
          (QSETREFV $ 22 (SPADCALL (QREFELT $ 21)))
          (QSETREFV $ 25 (SPADCALL (QREFELT $ 22) (QREFELT $ 24)))
          $))) 

(MAKEPROP '|ExpressionFactorPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 9) (|SparseUnivariatePolynomial| 15)
              (|MultivariateFactorize| 23 (|IndexedExponents| 23) 6 15)
              (0 . |factor|) (5 . |poly_factor|) (|Factored| 14)
              (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 23) (10 . |factorPolynomial|)
              (|SingletonAsOrderedSet|) (15 . |create|) '|dummy| (|Symbol|)
              (19 . |new|) '|xs| (|Kernel| 7) (23 . |kernel|) '|xk|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 7)
              (28 . |degree|) (33 . |leadingCoefficient|) (38 . |Zero|)
              (42 . |Zero|) (|Boolean|) (46 . =) (52 . |One|) (56 . |One|)
              (|Integer|) (|Factored| 27) (60 . |nilFactor|) (66 . /)
              (72 . |coerce|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 41) (|:| |fctr| 27) (|:| |xpnt| 36))
              (|List| 42) (77 . |makeFR|) (|List| 7) (83 . |coefficients|)
              (|List| 51) (|List| $) (88 . |kernels|) (93 . |is?|) (|Kernel| $)
              (99 . |coerce|) (104 . |eval|) (111 . |retract|)
              (|SparseMultivariatePolynomial| 6 51) (116 . |numer|)
              (121 . |univariate|)
              (|Record| (|:| |flg| 41) (|:| |fctr| 9) (|:| |xpnt| 36))
              (|List| 58) (127 . |factorList|) (132 . |degree|) (137 . ~=)
              (143 . |coerce|) (|Mapping| 7 15)
              (|UnivariatePolynomialCategoryFunctions2| 15 9 7 27)
              (148 . |map|) (154 . |primeFactor|) (160 . *)
              |EFACTOR;factorPolynomial;SupF;5|)
           '#(|poly_factor| 166 |factorPolynomial| 171) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(1 10 8 9 11 1 0 8 9 12 1 15
                                                   13 14 16 0 17 0 18 0 20 0 21
                                                   1 23 0 20 24 1 27 26 0 28 1
                                                   27 7 0 29 0 6 0 30 0 7 0 31
                                                   2 7 32 0 0 33 0 6 0 34 0 7 0
                                                   35 2 37 0 27 36 38 2 27 0 0
                                                   7 39 1 27 0 7 40 2 37 0 27
                                                   43 44 1 27 45 0 46 1 7 47 48
                                                   49 2 23 32 0 20 50 1 7 0 51
                                                   52 3 27 0 0 17 7 53 1 27 7 0
                                                   54 1 7 55 0 56 2 15 14 0 23
                                                   57 1 8 59 0 60 1 9 26 0 61 2
                                                   41 32 0 0 62 1 7 0 55 63 2
                                                   65 27 64 9 66 2 37 0 27 36
                                                   67 2 37 0 0 0 68 1 0 8 9 12
                                                   1 0 37 27 69)))))
           '|lookupComplete|)) 
