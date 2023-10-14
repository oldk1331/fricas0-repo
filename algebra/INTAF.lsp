
(/VERSIONCHECK 2) 

(DEFUN |INTAF;F2UPUP| (|f| |kx| |k| |p| $)
  (|INTAF;UP2UPUP| (SPADCALL |f| |k| |p| (QREFELT $ 11)) |kx| $)) 

(DEFUN |INTAF;rootintegrate| (|f| |t| |k| |derivation| $)
  (PROG (|curve| |q| |r| #1=#:G133 |f1| |r1| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |r1|
            (SPADCALL
             (LETT |modulus|
                   (|INTAF;UP2UPUP|
                    (LETT |p| (SPADCALL |k| (QREFELT $ 14))
                          . #2=(|INTAF;rootintegrate|))
                    |t| $)
                   . #2#)
             (QREFELT $ 18))
            . #2#)
      (LETT |f1|
            (SPADCALL (|INTAF;F2UPUP| |f| |t| |k| |p| $)
                      (SPADCALL (SPADCALL (QCAR |r1|) (QREFELT $ 20)) 1
                                (QREFELT $ 23))
                      (QREFELT $ 24))
            . #2#)
      (LETT |r|
            (PROG2 (LETT #1# (SPADCALL (QCDR |r1|) (QREFELT $ 27)) . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|Record|
                              (|:| |radicand|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))))
                              (|:| |deg| (|NonNegativeInteger|)))
                             #1#))
            . #2#)
      (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 28)) . #2#)
      (LETT |curve|
            (|RadicalFunctionField| (QREFELT $ 7)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))))
                                    (SPADCALL |q| (QREFELT $ 29)) (QCDR |r|))
            . #2#)
      (EXIT
       (SPADCALL
        (CONS #'|INTAF;rootintegrate!0| (VECTOR |k| |t| |r1| |curve| $))
        (SPADCALL
         (SPADCALL |f1|
                   (|compiledLookupCheck| '|reduce|
                                          (LIST '$
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 7))))))
                                          |curve|))
         |derivation|
         (|compiledLookupCheck| '|algintegrate|
                                (LIST
                                 (LIST '|IntegrationResult|
                                       (|devaluate| |curve|))
                                 (|devaluate| |curve|)
                                 (LIST '|Mapping|
                                       (LIST '|SparseUnivariatePolynomial|
                                             (|devaluate| (ELT $ 7)))
                                       (LIST '|SparseUnivariatePolynomial|
                                             (|devaluate| (ELT $ 7)))))
                                (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|)))
        (|compiledLookupCheck| '|map|
                               (LIST
                                (LIST '|IntegrationResult|
                                      (|devaluate| (ELT $ 7)))
                                (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                      (|devaluate| |curve|))
                                (LIST '|IntegrationResult|
                                      (|devaluate| |curve|)))
                               (|IntegrationResultFunctions2| |curve|
                                                              (ELT $ 7))))))))) 

(DEFUN |INTAF;rootintegrate!0| (|x1| $$)
  (PROG ($ |curve| |r1| |t| |k|)
    (LETT $ (QREFELT $$ 4) . #1=(|INTAF;rootintegrate|))
    (LETT |curve| (QREFELT $$ 3) . #1#)
    (LETT |r1| (QREFELT $$ 2) . #1#)
    (LETT |t| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|INTAF;UPUP2F|
       (SPADCALL |x1|
                 (|compiledLookupCheck| '|lift|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (LIST '|Fraction|
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate|
                                                       (ELT $ 7)))))
                                         '$)
                                        |curve|))
       (QCAR |r1|) |t| |k| $))))) 

(DEFUN |INTAF;algintegrate| (|f| |t| |k| |derivation| $)
  (PROG (|curve| |modulus| |p| |f1| |r1|)
    (RETURN
     (SEQ
      (LETT |r1|
            (SPADCALL
             (LETT |modulus|
                   (|INTAF;UP2UPUP|
                    (LETT |p| (SPADCALL |k| (QREFELT $ 14))
                          . #1=(|INTAF;algintegrate|))
                    |t| $)
                   . #1#)
             (QREFELT $ 18))
            . #1#)
      (LETT |f1|
            (SPADCALL (|INTAF;F2UPUP| |f| |t| |k| |p| $)
                      (SPADCALL (SPADCALL (QCAR |r1|) (QREFELT $ 20)) 1
                                (QREFELT $ 23))
                      (QREFELT $ 24))
            . #1#)
      (LETT |modulus|
            (|INTAF;UP2UPUP| (LETT |p| (SPADCALL |k| (QREFELT $ 14)) . #1#) |t|
             $)
            . #1#)
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      (QCDR |r1|))
            . #1#)
      (EXIT
       (SPADCALL
        (CONS #'|INTAF;algintegrate!0| (VECTOR |k| |t| |r1| |curve| $))
        (SPADCALL
         (SPADCALL |f1|
                   (|compiledLookupCheck| '|reduce|
                                          (LIST '$
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 7))))))
                                          |curve|))
         |derivation|
         (|compiledLookupCheck| '|algintegrate|
                                (LIST
                                 (LIST '|IntegrationResult|
                                       (|devaluate| |curve|))
                                 (|devaluate| |curve|)
                                 (LIST '|Mapping|
                                       (LIST '|SparseUnivariatePolynomial|
                                             (|devaluate| (ELT $ 7)))
                                       (LIST '|SparseUnivariatePolynomial|
                                             (|devaluate| (ELT $ 7)))))
                                (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|)))
        (|compiledLookupCheck| '|map|
                               (LIST
                                (LIST '|IntegrationResult|
                                      (|devaluate| (ELT $ 7)))
                                (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                      (|devaluate| |curve|))
                                (LIST '|IntegrationResult|
                                      (|devaluate| |curve|)))
                               (|IntegrationResultFunctions2| |curve|
                                                              (ELT $ 7))))))))) 

(DEFUN |INTAF;algintegrate!0| (|x1| $$)
  (PROG ($ |curve| |r1| |t| |k|)
    (LETT $ (QREFELT $$ 4) . #1=(|INTAF;algintegrate|))
    (LETT |curve| (QREFELT $$ 3) . #1#)
    (LETT |r1| (QREFELT $$ 2) . #1#)
    (LETT |t| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|INTAF;UPUP2F|
       (SPADCALL |x1|
                 (|compiledLookupCheck| '|lift|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (LIST '|Fraction|
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate|
                                                       (ELT $ 7)))))
                                         '$)
                                        |curve|))
       (QCAR |r1|) |t| |k| $))))) 

(DEFUN |INTAF;UP2UPUP| (|p| |k| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTAF;UP2UPUP!0| (VECTOR $ |k|)) |p| (QREFELT $ 34))))) 

(DEFUN |INTAF;UP2UPUP!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTAF;UP2UPUP|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 31)))))) 

(DEFUN |INTAF;UPUP2F| (|p| |cf| |t| |k| $)
  (PROG ()
    (RETURN
     (SPADCALL
      (SPADCALL (CONS #'|INTAF;UPUP2F!0| (VECTOR $ |t|)) |p| (QREFELT $ 38))
      (SPADCALL (SPADCALL |cf| |t| (QREFELT $ 35))
                (SPADCALL |k| (QREFELT $ 39)) (QREFELT $ 40))
      (QREFELT $ 41))))) 

(DEFUN |INTAF;UPUP2F!0| (|x1| $$)
  (PROG (|t| $)
    (LETT |t| (QREFELT $$ 1) . #1=(|INTAF;UPUP2F|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |t| (QREFELT $ 35)))))) 

(DEFUN |INTAF;algint;F2KMIr;6| (|f| |t| |y| |derivation| $)
  (COND
   ((SPADCALL |y| '|nthRoot| (QREFELT $ 44))
    (|INTAF;rootintegrate| |f| |t| |y| |derivation| $))
   ((SPADCALL |y| '|rootOf| (QREFELT $ 44))
    (|INTAF;algintegrate| |f| |t| |y| |derivation| $))
   ('T (|error| "failed - cannot handle that integrand")))) 

(DECLAIM (NOTINLINE |AlgebraicIntegration;|)) 

(DEFUN |AlgebraicIntegration| (&REST #1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraicIntegration|)
                                           '|domainEqualList|)
                . #3=(|AlgebraicIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraicIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AlgebraicIntegration|))))))))))) 

(DEFUN |AlgebraicIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AlgebraicIntegration| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 48) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicIntegration| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|AlgebraicIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 7) (|Kernel| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 9) 9 6
                                                     (|SparseMultivariatePolynomial|
                                                      6 9)
                                                     7)
              (0 . |univariate|) (|SparseUnivariatePolynomial| $) (|Kernel| $)
              (7 . |minPoly|) (|Record| (|:| |coef| 19) (|:| |poly| 16))
              (|SparseUnivariatePolynomial| 19) (|ChangeOfVariable| 7 8 16)
              (12 . |mkIntegral|) (|Fraction| 8) (17 . |inv|) (22 . |One|)
              (|NonNegativeInteger|) (26 . |monomial|) (32 . |elt|)
              (|Record| (|:| |radicand| 19) (|:| |deg| 22))
              (|Union| 25 '"failed") (38 . |radPoly|) (43 . |retract|)
              (48 . |coerce|) (|Fraction| 12) (53 . |univariate|)
              (|Mapping| 19 7) (|SparseUnivariatePolynomialFunctions2| 7 19)
              (59 . |map|) (65 . |multivariate|) (|Mapping| 7 19)
              (|SparseUnivariatePolynomialFunctions2| 19 7) (71 . |map|)
              (77 . |coerce|) (82 . *) (88 . |elt|) (|Boolean|) (|Symbol|)
              (94 . |is?|) (|IntegrationResult| 7) (|Mapping| 8 8)
              |INTAF;algint;F2KMIr;6|)
           '#(|algint| 100) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(3 10 8 7 9 8 11 1 7 12 13 14
                                                   1 17 15 16 18 1 19 0 0 20 0
                                                   6 0 21 2 16 0 19 22 23 2 16
                                                   0 0 0 24 1 17 26 16 27 1 19
                                                   8 0 28 1 19 0 8 29 2 7 30 0
                                                   13 31 2 33 16 32 8 34 2 10 7
                                                   19 9 35 2 37 8 36 16 38 1 7
                                                   0 13 39 2 7 0 0 0 40 2 8 7 0
                                                   7 41 2 9 42 0 43 44 4 0 45 7
                                                   9 9 46 47)))))
           '|lookupComplete|)) 
