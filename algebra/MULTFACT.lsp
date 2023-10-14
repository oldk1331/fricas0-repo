
(/VERSIONCHECK 2) 

(DEFUN |MULTFACT;factor;PF;1| (|p| $)
  (SEQ
   (COND
    ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
     (SPADCALL |p| (QREFELT $ 12)))
    ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Complex| (|Integer|))))
     (SPADCALL |p| (QREFELT $ 14)))
    ('T
     (SEQ
      (COND
       ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Polynomial| (|Integer|))))
        (COND
         ((|HasSignature| (QREFELT $ 6)
                          (LIST '|convert| (LIST '(|Symbol|) '$)))
          (EXIT (SPADCALL |p| (QREFELT $ 16)))))))
      (EXIT (SPADCALL |p| (ELT $ 20) (QREFELT $ 23)))))))) 

(DEFUN |MULTFACT;factor;SupF;2| (|up| $)
  (SPADCALL |up| (ELT $ 20) (QREFELT $ 27))) 

(DEFUN |MultivariateFactorize| (&REST #1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MultivariateFactorize|)
                                           '|domainEqualList|)
                . #3=(|MultivariateFactorize|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MultivariateFactorize;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MultivariateFactorize|))))))))))) 

(DEFUN |MultivariateFactorize;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultivariateFactorize|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MultivariateFactorize| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MultivariateFactorize|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MultivariateFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Factored| 9)
              (|MRationalFactorize| 7 6 (|Integer|) 9) (0 . |factor|)
              (|MRationalFactorize| 7 6 (|Complex| (|Integer|)) 9)
              (5 . |factor|)
              (|MPolyCatRationalFunctionFactorizer| 7 6 (|Integer|) 9)
              (10 . |factor|) (|Factored| 18) (|SparseUnivariatePolynomial| 8)
              (|GenUFactorize| 8) (15 . |factor|) (|Mapping| 17 18)
              (|InnerMultFact| 6 7 8 9) (20 . |factor|) |MULTFACT;factor;PF;1|
              (|Factored| 26) (|SparseUnivariatePolynomial| 9) (26 . |factor|)
              |MULTFACT;factor;SupF;2|)
           '#(|factor| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 11 10 9 12 1 13 10 9 14 1
                                                   15 10 9 16 1 19 17 18 20 2
                                                   22 10 9 21 23 2 22 25 26 21
                                                   27 1 0 25 26 28 1 0 10 9
                                                   24)))))
           '|lookupComplete|)) 
