
(SDEFUN |COMPFACT;myMap|
        ((|r| |Complex| RR) ($ |Complex| (|Fraction| (|Integer|))))
        (SPROG ((|cr| (|Complex| (|Integer|))))
               (SEQ
                (COND
                 ((|domainEqual| (|Complex| (QREFELT $ 6))
                                 (|Complex| (|Integer|)))
                  (SEQ (LETT |cr| |r| |COMPFACT;myMap|)
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |cr| (QREFELT $ 13))
                                   (QREFELT $ 15))
                         (SPADCALL (SPADCALL |cr| (QREFELT $ 16))
                                   (QREFELT $ 15))
                         (QREFELT $ 18)))))
                 ((|domainEqual| (|Complex| (QREFELT $ 6))
                                 (|Complex| (|Fraction| (|Integer|))))
                  |r|))))) 

(SDEFUN |COMPFACT;compND|
        ((|cc| |Complex| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |cnum| (|Complex| (|Integer|)))
          (|:| |cden| (|Integer|))))
        (SPROG
         ((#1=#:G107 NIL) (|ccd| (|Integer|)) (|dcci| #2=(|Integer|))
          (|dccr| #2#) (|cci| (|Fraction| (|Integer|)))
          (|ccr| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |ccr| (SPADCALL |cc| (QREFELT $ 19)) . #3=(|COMPFACT;compND|))
          (LETT |cci| (SPADCALL |cc| (QREFELT $ 20)) . #3#)
          (LETT |dccr| (SPADCALL |ccr| (QREFELT $ 21)) . #3#)
          (LETT |dcci| (SPADCALL |cci| (QREFELT $ 21)) . #3#)
          (LETT |ccd| (SPADCALL |dccr| |dcci| (QREFELT $ 22)) . #3#)
          (EXIT
           (CONS
            (SPADCALL
             (*
              (PROG2 (LETT #1# (SPADCALL |ccd| |dccr| (QREFELT $ 24)) . #3#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
              (SPADCALL |ccr| (QREFELT $ 25)))
             (*
              (PROG2 (LETT #1# (SPADCALL |ccd| |dcci| (QREFELT $ 24)) . #3#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
              (SPADCALL |cci| (QREFELT $ 25)))
             (QREFELT $ 26))
            |ccd|))))) 

(SDEFUN |COMPFACT;conv|
        ((|f| |SparseUnivariatePolynomial|
          (|Complex| (|Fraction| (|Integer|))))
         ($ |Record|
          (|:| |convP| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (|:| |convD| (|Fraction| (|Integer|)))))
        (SPROG
         ((|dris1| #1=(|Integer|))
          (|pris| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (#2=#:G113 NIL) (|dris| #1#)
          (|cdf|
           (|Record| (|:| |cnum| (|Complex| (|Integer|)))
                     (|:| |cden| (|Integer|))))
          (|cf| (|Complex| (|Fraction| (|Integer|)))) (#3=#:G120 NIL) (|i| NIL)
          (|pdris| #1#))
         (SEQ (LETT |pris| (|spadConstant| $ 28) . #4=(|COMPFACT;conv|))
              (LETT |dris| 1 . #4#) (LETT |dris1| 1 . #4#)
              (LETT |pdris| 1 . #4#)
              (SEQ (LETT |i| 0 . #4#)
                   (LETT #3# (SPADCALL |f| (QREFELT $ 31)) . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |cf| (SPADCALL |f| |i| (QREFELT $ 32)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |cf| (|spadConstant| $ 35) (QREFELT $ 37))
                           "next i")
                          ('T
                           (SEQ (LETT |cdf| (|COMPFACT;compND| |cf| $) . #4#)
                                (LETT |dris|
                                      (SPADCALL (QCDR |cdf|) |dris1|
                                                (QREFELT $ 22))
                                      . #4#)
                                (LETT |pris|
                                      (SPADCALL
                                       (SPADCALL
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |dris| |dris1|
                                                            (QREFELT $ 24))
                                                  . #4#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (|Integer|) #2#))
                                        |pris| (QREFELT $ 38))
                                       (SPADCALL
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |dris| (QCDR |cdf|)
                                                            (QREFELT $ 24))
                                                  . #4#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (|Integer|) #2#))
                                        (SPADCALL (QCAR |cdf|) |i|
                                                  (QREFELT $ 39))
                                        (QREFELT $ 38))
                                       (QREFELT $ 40))
                                      . #4#)
                                (EXIT (LETT |dris1| |dris| . #4#)))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |pris| (SPADCALL |dris| (QREFELT $ 15))))))) 

(SDEFUN |COMPFACT;backConv|
        ((|ffr| |Factored|
          (|SparseUnivariatePolynomial| (|Complex| (|Fraction| (|Integer|)))))
         ($ |Factored| PR))
        (SPROG
         ((|uconst| (|Complex| (|Integer|)))
          (|const|
           (|SparseUnivariatePolynomial| (|Complex| (|Fraction| (|Integer|)))))
          (|lc| (|Complex| (|Fraction| (|Integer|))))
          (|ris|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| PR) (|:| |xpnt| (|Integer|)))))
          (|expf| (|Integer|))
          (|fact| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (#1=#:G135 NIL) (|ff| NIL) (#2=#:G134 NIL) (|f| NIL) (#3=#:G133 NIL))
         (SEQ
          (COND
           ((|domainEqual| (|Complex| (QREFELT $ 6))
                           (|Complex| (|Fraction| (|Integer|))))
            (SPADCALL (SPADCALL |ffr| (QREFELT $ 42))
                      (PROGN
                       (LETT #3# NIL . #4=(|COMPFACT;backConv|))
                       (SEQ (LETT |f| NIL . #4#)
                            (LETT #2# (SPADCALL |ffr| (QREFELT $ 46)) . #4#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (VECTOR (QVELT |f| 0) (QVELT |f| 1)
                                             (QVELT |f| 2))
                                     #3#)
                                    . #4#)))
                            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT $ 50)))
           ((|domainEqual| (|Complex| (QREFELT $ 6)) (|Complex| (|Integer|)))
            (SEQ (LETT |const| (SPADCALL |ffr| (QREFELT $ 42)) . #4#)
                 (LETT |ris| NIL . #4#)
                 (SEQ (LETT |ff| NIL . #4#)
                      (LETT #1# (SPADCALL |ffr| (QREFELT $ 46)) . #4#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |fact|
                             (SPADCALL
                              (QCAR (|COMPFACT;conv| (QVELT |ff| 1) $))
                              (QREFELT $ 51))
                             . #4#)
                       (LETT |expf| (QVELT |ff| 2) . #4#)
                       (LETT |ris|
                             (CONS (VECTOR (QVELT |ff| 0) |fact| |expf|) |ris|)
                             . #4#)
                       (LETT |lc|
                             (|COMPFACT;myMap| (SPADCALL |fact| (QREFELT $ 53))
                              $)
                             . #4#)
                       (EXIT
                        (LETT |const|
                              (SPADCALL |const|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (QVELT |ff| 1)
                                                    (QREFELT $ 54))
                                          |lc| (QREFELT $ 55))
                                         |expf| (QREFELT $ 56))
                                        (QREFELT $ 57))
                              . #4#)))
                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                 (LETT |uconst|
                       (QCAR
                        (|COMPFACT;compND| (SPADCALL |const| 0 (QREFELT $ 32))
                         $))
                       . #4#)
                 (EXIT
                  (SPADCALL (SPADCALL |uconst| (QREFELT $ 58)) |ris|
                            (QREFELT $ 50))))))))) 

(SDEFUN |COMPFACT;factor;PRF;5| ((|pol| PR) ($ |Factored| PR))
        (SPROG
         ((|ffr|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|Complex| (|Fraction| (|Integer|))))))
          (|ratPol|
           (|SparseUnivariatePolynomial|
            (|Complex| (|Fraction| (|Integer|))))))
         (SEQ
          (LETT |ratPol| (|spadConstant| $ 59) . #1=(|COMPFACT;factor;PRF;5|))
          (LETT |ratPol|
                (SPADCALL (CONS (|function| |COMPFACT;myMap|) $) |pol|
                          (QREFELT $ 61))
                . #1#)
          (LETT |ffr| (SPADCALL |ratPol| (QREFELT $ 62)) . #1#)
          (EXIT (|COMPFACT;backConv| |ffr| $))))) 

(DECLAIM (NOTINLINE |ComplexFactorization;|)) 

(DEFUN |ComplexFactorization| (&REST #1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexFactorization|)
                                               '|domainEqualList|)
                    . #3=(|ComplexFactorization|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexFactorization;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ComplexFactorization|)))))))))) 

(DEFUN |ComplexFactorization;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexFactorization|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ComplexFactorization| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 64) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ComplexFactorization|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|SimpleAlgebraicExtensionAlgFactor|
                     (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
                     (|Complex| (|Fraction| (|Integer|)))
                     (|SparseUnivariatePolynomial|
                      (|Complex| (|Fraction| (|Integer|))))))
          (QSETREFV $ 9
                    (|UnivariatePolynomialCategoryFunctions2| (|Complex| |#1|)
                                                              |#2|
                                                              (|Complex|
                                                               (|Fraction|
                                                                (|Integer|)))
                                                              (|SparseUnivariatePolynomial|
                                                               (|Complex|
                                                                (|Fraction|
                                                                 (|Integer|))))))
          (QSETREFV $ 10
                    (|UnivariatePolynomialCategoryFunctions2|
                     (|Complex| (|Fraction| (|Integer|)))
                     (|SparseUnivariatePolynomial|
                      (|Complex| (|Fraction| (|Integer|))))
                     (|Complex| |#1|) |#2|))
          $))) 

(MAKEPROP '|ComplexFactorization| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SAEF
              'UPCF2 'UPCFB (|Integer|) (|Complex| 11) (0 . |real|)
              (|Fraction| 11) (5 . |coerce|) (10 . |imag|) (|Complex| 14)
              (15 . |complex|) (21 . |real|) (26 . |imag|) (31 . |denom|)
              (36 . |lcm|) (|Union| $ '"failed") (42 . |exquo|) (48 . |numer|)
              (53 . |complex|) (|SparseUnivariatePolynomial| 12) (59 . |Zero|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 17)
              (63 . |degree|) (68 . |coefficient|) (74 . |Zero|) (78 . |Zero|)
              (82 . |Zero|) (|Boolean|) (86 . =) (92 . *) (98 . |monomial|)
              (104 . +) (|Factored| 30) (110 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 43) (|:| |fctr| 30) (|:| |xpnt| 11))
              (|List| 44) (115 . |factorList|)
              (|Record| (|:| |flg| 43) (|:| |fctr| 7) (|:| |xpnt| 11))
              (|List| 47) (|Factored| 7) (120 . |makeFR|)
              (126 . |primitivePart|) (|Complex| 6)
              (131 . |leadingCoefficient|) (136 . |leadingCoefficient|)
              (141 . /) (147 . ^) (153 . *) (159 . |coerce|) (164 . |Zero|)
              (|Mapping| 17 52) (168 . |map|) (174 . |factor|)
              |COMPFACT;factor;PRF;5|)
           '#(|factor| 179) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 63
                                                 '(1 12 11 0 13 1 14 0 11 15 1
                                                   12 11 0 16 2 17 0 14 14 18 1
                                                   17 14 0 19 1 17 14 0 20 1 14
                                                   11 0 21 2 11 0 0 0 22 2 11
                                                   23 0 0 24 1 14 11 0 25 2 12
                                                   0 11 11 26 0 27 0 28 1 30 29
                                                   0 31 2 30 17 0 29 32 0 6 0
                                                   33 0 7 0 34 0 17 0 35 2 17
                                                   36 0 0 37 2 27 0 11 0 38 2
                                                   27 0 12 29 39 2 27 0 0 0 40
                                                   1 41 30 0 42 1 41 45 0 46 2
                                                   49 0 7 48 50 1 27 0 0 51 1 7
                                                   52 0 53 1 30 17 0 54 2 17 0
                                                   0 0 55 2 17 0 0 11 56 2 30 0
                                                   0 17 57 1 7 0 52 58 0 30 0
                                                   59 2 9 30 60 7 61 1 8 41 30
                                                   62 1 0 49 7 63)))))
           '|lookupComplete|)) 
