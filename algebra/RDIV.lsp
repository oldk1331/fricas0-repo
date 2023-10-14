
(/VERSIONCHECK 2) 

(DEFUN |RDIV;order;FdUPUPMNni;1| (|d| |pp| |f| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL (SPADCALL |pp| (QREFELT $ 11)) (QREFELT $ 13))
            |RDIV;order;FdUPUPMNni;1|)
      (EXIT
       (COND ((QEQCAR |r| 1) (|RDIV;algOrder| |d| |pp| |f| $))
             ('T
              (|RDIV;rootOrder| |d|
               (SPADCALL
                (SPADCALL
                 (SPADCALL (QCDR |r|) (SPADCALL |pp| (QREFELT $ 15))
                           (QREFELT $ 16))
                 (QREFELT $ 17))
                (QREFELT $ 18))
               (SPADCALL |pp| (QREFELT $ 20)) |f| $)))))))) 

(DEFUN |RDIV;algOrder| (|d| |modulus| |reduce| $)
  (PROG (|curve| |redmod|)
    (RETURN
     (SEQ
      (LETT |redmod| (SPADCALL |reduce| |modulus| (QREFELT $ 26))
            . #1=(|RDIV;algOrder|))
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 10)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 10))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 10))))
                                      |redmod|)
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |reduce| |d|
                  (|compiledLookupCheck| '|map|
                                         (LIST
                                          (LIST '|FiniteDivisor|
                                                (|devaluate| (ELT $ 10))
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 10)))
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 10)))))
                                                (|devaluate| |curve|))
                                          (LIST '|Mapping|
                                                (|devaluate| (ELT $ 10))
                                                (|devaluate| (ELT $ 6)))
                                          (LIST '|FiniteDivisor|
                                                (|devaluate| (ELT $ 6))
                                                (|devaluate| (ELT $ 7))
                                                (|devaluate| (ELT $ 8))
                                                (|devaluate| (ELT $ 9))))
                                         (|FiniteDivisorFunctions2| (ELT $ 6)
                                                                    (ELT $ 7)
                                                                    (ELT $ 8)
                                                                    (ELT $ 9)
                                                                    (ELT $ 10)
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $
                                                                          10))
                                                                    (|SparseUnivariatePolynomial|
                                                                     (|Fraction|
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            10))))
                                                                    |curve|)))
        (|compiledLookupCheck| '|order|
                               (LIST (LIST '|NonNegativeInteger|)
                                     (LIST '|FiniteDivisor|
                                           (|devaluate| (ELT $ 10))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 10)))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 10)))))
                                           (|devaluate| |curve|)))
                               (|FindOrderFinite| (ELT $ 10)
                                                  (|SparseUnivariatePolynomial|
                                                   (ELT $ 10))
                                                  (|SparseUnivariatePolynomial|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (ELT $ 10))))
                                                  |curve|)))))))) 

(DEFUN |RDIV;rootOrder| (|d| |radicand| |n| |reduce| $)
  (PROG (|curve| |redrad|)
    (RETURN
     (SEQ
      (LETT |redrad| (SPADCALL |reduce| |radicand| (QREFELT $ 29))
            . #1=(|RDIV;rootOrder|))
      (LETT |curve|
            (|RadicalFunctionField| (QREFELT $ 10)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 10))
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 10))))
                                    (SPADCALL |redrad| (QREFELT $ 31)) |n|)
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |reduce| |d|
                  (|compiledLookupCheck| '|map|
                                         (LIST
                                          (LIST '|FiniteDivisor|
                                                (|devaluate| (ELT $ 10))
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 10)))
                                                (LIST
                                                 '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 10)))))
                                                (|devaluate| |curve|))
                                          (LIST '|Mapping|
                                                (|devaluate| (ELT $ 10))
                                                (|devaluate| (ELT $ 6)))
                                          (LIST '|FiniteDivisor|
                                                (|devaluate| (ELT $ 6))
                                                (|devaluate| (ELT $ 7))
                                                (|devaluate| (ELT $ 8))
                                                (|devaluate| (ELT $ 9))))
                                         (|FiniteDivisorFunctions2| (ELT $ 6)
                                                                    (ELT $ 7)
                                                                    (ELT $ 8)
                                                                    (ELT $ 9)
                                                                    (ELT $ 10)
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $
                                                                          10))
                                                                    (|SparseUnivariatePolynomial|
                                                                     (|Fraction|
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            10))))
                                                                    |curve|)))
        (|compiledLookupCheck| '|order|
                               (LIST (LIST '|NonNegativeInteger|)
                                     (LIST '|FiniteDivisor|
                                           (|devaluate| (ELT $ 10))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 10)))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 10)))))
                                           (|devaluate| |curve|)))
                               (|FindOrderFinite| (ELT $ 10)
                                                  (|SparseUnivariatePolynomial|
                                                   (ELT $ 10))
                                                  (|SparseUnivariatePolynomial|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (ELT $ 10))))
                                                  |curve|)))))))) 

(DEFUN |ReducedDivisor| (&REST #1=#:G143)
  (PROG ()
    (RETURN
     (PROG (#2=#:G144)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ReducedDivisor|)
                                           '|domainEqualList|)
                . #3=(|ReducedDivisor|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ReducedDivisor;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ReducedDivisor|))))))))))) 

(DEFUN |ReducedDivisor;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ReducedDivisor|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|ReducedDivisor| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 32) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ReducedDivisor|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ReducedDivisor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |reductum|)
              (|Union| 14 '"failed") (5 . |retractIfCan|) (|Fraction| 7)
              (10 . |leadingCoefficient|) (15 . /) (21 . |retract|) (26 . -)
              (|NonNegativeInteger|) (31 . |degree|) (|FiniteDivisor| 6 7 8 9)
              (|Mapping| 10 6) |RDIV;order;FdUPUPMNni;1|
              (|SparseUnivariatePolynomial| 30) (|MultipleMap| 6 7 8 10 27 24)
              (36 . |map|) (|SparseUnivariatePolynomial| 10)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 10 27) (42 . |map|)
              (|Fraction| 27) (48 . |coerce|))
           '#(|order| 53) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 31
                                                 '(1 8 0 0 11 1 8 12 0 13 1 8
                                                   14 0 15 2 14 0 0 0 16 1 14 7
                                                   0 17 1 7 0 0 18 1 8 19 0 20
                                                   2 25 24 22 8 26 2 28 27 22 7
                                                   29 1 30 0 27 31 3 0 19 21 8
                                                   22 23)))))
           '|lookupComplete|)) 
