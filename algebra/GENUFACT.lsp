
(/VERSIONCHECK 2) 

(DEFUN |GENUFACT;factorWarning| (|f| $)
  (SPADCALL
   (LIST
    (SPADCALL "WARNING (genufact): No known algorithm to factor "
              (QREFELT $ 10))
    (SPADCALL |f| (QREFELT $ 13))
    (SPADCALL ", trying square-free." (QREFELT $ 10)))
   (QREFELT $ 17))) 

(DEFUN |GENUFACT;factor;SupF;2| (|f| $)
  (PROG (|upp| |up| |var| |giform|)
    (RETURN
     (SEQ
      (COND
       ((|domainEqual| (QREFELT $ 6) (|Integer|))
        (SPADCALL |f| (QREFELT $ 21)))
       ((|domainEqual| (QREFELT $ 6) (|Fraction| (|Integer|)))
        (SPADCALL |f| (QREFELT $ 23)))
       ((|HasCategory| (QREFELT $ 6) '(|FiniteFieldCategory|))
        (SPADCALL |f| (QREFELT $ 25)))
       ((|domainEqual| (QREFELT $ 6) (|Complex| (|Integer|)))
        (SPADCALL |f| (QREFELT $ 27)))
       ((|domainEqual| (QREFELT $ 6) (|Complex| (|Fraction| (|Integer|))))
        (SPADCALL |f| (QREFELT $ 29)))
       ((|domainEqual| (QREFELT $ 6) (|AlgebraicNumber|))
        (SPADCALL |f| (QREFELT $ 31)))
       ((|HasSignature| (QREFELT $ 6)
                        (LIST '|generator| (LIST (|devaluate| (QREFELT $ 6)))))
        (SEQ
         (LETT |giform|
               (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 32)) (QREFELT $ 33))
                         (QREFELT $ 35))
               . #1=(|GENUFACT;factor;SupF;2|))
         (COND
          ((SPADCALL |giform| (QREFELT $ 37))
           (SEQ (LETT |var| (SPADCALL |giform| (QREFELT $ 39)) . #1#)
                (LETT |up|
                      (|UnivariatePolynomial| |var| (|Fraction| (|Integer|)))
                      . #1#)
                (EXIT
                 (LETT |upp|
                       (|UnivariatePolynomial| |var|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|))))
                       . #1#))))
          (#2='T
           (SEQ
            (LETT |up| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                  . #1#)
            (EXIT
             (LETT |upp|
                   (|SparseUnivariatePolynomial|
                    (|Fraction| (|Polynomial| (|Integer|))))
                   . #1#)))))
         (EXIT
          (COND
           ((|HasCategory| (QREFELT $ 6)
                           (LIST '|MonogenicAlgebra|
                                 (LIST '|Fraction| '(|Integer|))
                                 (|devaluate| |up|)))
            (SPADCALL |f|
                      (|compiledLookupCheck| '|factor|
                                             (LIST
                                              (LIST '|Factored|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| (ELT $ 6))))
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 6))))
                                             (|SimpleAlgebraicExtensionAlgFactor|
                                              |up| (ELT $ 6)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 6))))))
           ((|HasCategory| (QREFELT $ 6)
                           (LIST '|MonogenicAlgebra|
                                 (LIST '|Fraction|
                                       (LIST '|Polynomial| '(|Integer|)))
                                 (|devaluate| |upp|)))
            (SPADCALL |f|
                      (|compiledLookupCheck| '|factor|
                                             (LIST
                                              (LIST '|Factored|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| (ELT $ 6))))
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 6))))
                                             (|SAERationalFunctionAlgFactor|
                                              |upp| (ELT $ 6)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 6))))))
           (#2#
            (SEQ (|GENUFACT;factorWarning| (SPADCALL |f| (QREFELT $ 40)) $)
                 (EXIT (SPADCALL |f| (QREFELT $ 42)))))))))
       (#2#
        (SEQ (|GENUFACT;factorWarning| (SPADCALL |f| (QREFELT $ 40)) $)
             (EXIT (SPADCALL |f| (QREFELT $ 42)))))))))) 

(DECLAIM (NOTINLINE |GenUFactorize;|)) 

(DEFUN |GenUFactorize| (#1=#:G113)
  (PROG ()
    (RETURN
     (PROG (#2=#:G114)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|GenUFactorize|)
                                           '|domainEqualList|)
                . #3=(|GenUFactorize|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|GenUFactorize;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|GenUFactorize|))))))))))) 

(DEFUN |GenUFactorize;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GenUFactorize|))
      (LETT |dv$| (LIST '|GenUFactorize| DV$1) . #1#)
      (LETT $ (GETREFV 44) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GenUFactorize| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GenUFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Any|) (|String|)
              (|AnyFunctions1| 8) (0 . |coerce|) (|OutputForm|)
              (|AnyFunctions1| 11) (5 . |coerce|) (|Void|) (|List| 7)
              (|OutputPackage|) (10 . |outputList|) (|Factored| 19)
              (|SparseUnivariatePolynomial| 6) (|GaloisGroupFactorizer| 19)
              (15 . |factor|) (|RationalFactorize| 19) (20 . |factor|)
              (|DistinctDegreeFactorize| 6 19) (25 . |factor|)
              (|ComplexFactorization| (|Integer|) 19) (30 . |factor|)
              (|ComplexFactorization| (|Fraction| (|Integer|)) 19)
              (35 . |factor|) (|AlgFactor| 19) (40 . |factor|)
              (45 . |generator|) (49 . |coerce|) (|InputForm|) (54 . |convert|)
              (|Boolean|) (59 . |symbol?|) (|Symbol|) (64 . |symbol|)
              (69 . |coerce|) (|Factored| $) (74 . |squareFree|)
              |GENUFACT;factor;SupF;2|)
           '#(|factor| 79) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 43
                                                 '(1 9 7 8 10 1 12 7 11 13 1 16
                                                   14 15 17 1 20 18 19 21 1 22
                                                   18 19 23 1 24 18 19 25 1 26
                                                   18 19 27 1 28 18 19 29 1 30
                                                   18 19 31 0 6 0 32 1 6 11 0
                                                   33 1 34 0 11 35 1 34 36 0 37
                                                   1 34 38 0 39 1 19 11 0 40 1
                                                   19 41 0 42 1 0 18 19 43)))))
           '|lookupComplete|)) 
