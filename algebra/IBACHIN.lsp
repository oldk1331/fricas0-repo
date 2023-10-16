
(SDEFUN |IBACHIN;applyFrobToMatrix|
        ((|mat| |Matrix| R) (|q| |NonNegativeInteger|) ($ |Matrix| R))
        (SPROG
         ((#1=#:G113 NIL) (|j| NIL) (#2=#:G112 NIL) (|i| NIL)
          (|ans| (|Matrix| R)) (|n| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (ANROWS |mat|) . #3=(|IBACHIN;applyFrobToMatrix|))
              (LETT |n| (ANCOLS |mat|) . #3#)
              (LETT |ans| (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 10)) . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |m| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# |n| . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |ans| |i| |j|
                                        (SPADCALL
                                         (CONS #'|IBACHIN;applyFrobToMatrix!0|
                                               (VECTOR $ |q|))
                                         (QAREF2O |mat| |i| |j| 1 1)
                                         (QREFELT $ 14))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |IBACHIN;applyFrobToMatrix!0| ((|k1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|IBACHIN;applyFrobToMatrix|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 12)))))) 

(SDEFUN |IBACHIN;listConjugateBases;R2NniL;2|
        ((|bas| |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R)))
         (|q| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |List|
          #1=(|Record| (|:| |basis| #2=(|Matrix| R)) (|:| |basisDen| R)
                       (|:| |basisInv| #3=(|Matrix| R)))))
        (SPROG
         ((|outList|
           (|List|
            (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                      (|:| |basisInv| (|Matrix| R)))))
          (|newBasis| #1#) (|bDen| (R)) (|bInv| #3#) (|b| #2#) (#4=#:G123 NIL)
          (|i| NIL))
         (SEQ
          (LETT |outList| (SPADCALL |bas| (QREFELT $ 17))
                . #5=(|IBACHIN;listConjugateBases;R2NniL;2|))
          (LETT |b| (QVELT |bas| 0) . #5#) (LETT |bInv| (QVELT |bas| 2) . #5#)
          (LETT |bDen| (QVELT |bas| 1) . #5#)
          (SEQ (LETT |i| 1 . #5#) (LETT #4# (- |n| 1) . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ (LETT |b| (|IBACHIN;applyFrobToMatrix| |b| |q| $) . #5#)
                    (LETT |bInv| (|IBACHIN;applyFrobToMatrix| |bInv| |q| $)
                          . #5#)
                    (LETT |bDen|
                          (SPADCALL
                           (CONS #'|IBACHIN;listConjugateBases;R2NniL;2!0|
                                 (VECTOR $ |q|))
                           |bDen| (QREFELT $ 14))
                          . #5#)
                    (LETT |newBasis| (VECTOR |b| |bDen| |bInv|) . #5#)
                    (EXIT (LETT |outList| (CONS |newBasis| |outList|) . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;listConjugateBases;R2NniL;2!0| ((|k1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1)
                . #1=(|IBACHIN;listConjugateBases;R2NniL;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 12)))))) 

(SDEFUN |IBACHIN;factorList;K3NniL;3|
        ((|a| K) (|q| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| K)))
        (SPROG
         ((|outList| (|List| (|SparseUnivariatePolynomial| K)))
          (|coef| #1=(|SparseUnivariatePolynomial| K)) (#2=#:G128 NIL)
          (|i| NIL) (|xx| #1#))
         (SEQ
          (LETT |coef| (SPADCALL |a| 0 (QREFELT $ 22))
                . #3=(|IBACHIN;factorList;K3NniL;3|))
          (LETT |xx| (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 22)) . #3#)
          (LETT |outList|
                (SPADCALL
                 (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 23)) |k|
                           (QREFELT $ 24))
                 (QREFELT $ 26))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (- |n| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |coef| |q| (QREFELT $ 24)) . #3#)
                    (EXIT
                     (LETT |outList|
                           (CONS
                            (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 23)) |k|
                                      (QREFELT $ 24))
                            |outList|)
                           . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;basisInfoToPolys|
        ((|mat| |Matrix| R) (|lcm| R) (|den| R) ($ |List| UP))
        (SPROG
         ((|outList| (|List| UP)) (|pp| (UP)) (#1=#:G135 NIL) (|j| NIL)
          (#2=#:G134 NIL) (|i| NIL) (|n1| (|Integer|)) (|n| (|Integer|)))
         (SEQ (LETT |n| (ANROWS |mat|) . #3=(|IBACHIN;basisInfoToPolys|))
              (LETT |n1| (- |n| 1) . #3#) (LETT |outList| NIL . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |n| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |pp| (|spadConstant| $ 28) . #3#)
                        (SEQ (LETT |j| 0 . #3#) (LETT #1# |n1| . #3#) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |pp|
                                     (SPADCALL |pp|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |lcm| |den|
                                                           (QREFELT $ 29))
                                                 (QAREF2O |mat| |i| (+ |j| 1) 1
                                                          1)
                                                 (QREFELT $ 30))
                                                |j| (QREFELT $ 31))
                                               (QREFELT $ 32))
                                     . #3#)))
                             (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |outList| (CONS |pp| |outList|) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |outList|))))) 

(SDEFUN |IBACHIN;basesToPolyLists|
        ((|basisList| |List|
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R))))
         (|lcm| R) ($ |List| (|List| UP)))
        (SPROG ((#1=#:G140 NIL) (|b| NIL) (#2=#:G139 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|IBACHIN;basesToPolyLists|))
                 (SEQ (LETT |b| NIL . #3#) (LETT #1# |basisList| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|IBACHIN;basisInfoToPolys| (QVELT |b| 0) |lcm|
                                (QVELT |b| 1) $)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean|
        ((|f| UP) (|g| UP) (|p| R) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| UP) (|:| |coef2| UP)))
        (SPROG
         ((|t| #1=(|SparseUnivariatePolynomial| R)) (|s| #1#) (|pPower| (R))
          (|quorem|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| R))
                     (|:| |remainder| (|SparseUnivariatePolynomial| R))))
          (|tau| #2=(|SparseUnivariatePolynomial| R)) (|sigma| #2#)
          (|rhs| (|SparseUnivariatePolynomial| R)) (#3=#:G145 NIL)
          (|num| (|SparseUnivariatePolynomial| R)) (#4=#:G164 NIL) (|i| NIL)
          (|t1| #1#) (|s1| #1#) (|tt1| #5=(|SparseUnivariatePolynomial| |sae|))
          (|ss1| #6=(|SparseUnivariatePolynomial| |sae|))
          (|ee|
           (|Record| (|:| |coef1| #6#) (|:| |coef2| #5#)
                     (|:| |generator| (|SparseUnivariatePolynomial| |sae|))))
          (|gBar| #7=(|SparseUnivariatePolynomial| |sae|)) (|fBar| #7#)
          (|gSUP| #8=(|SparseUnivariatePolynomial| R)) (|fSUP| #8#)
          (|sae|
           (|Join| (|MonogenicAlgebra| K R)
                   (CATEGORY |package|
                    (IF (|has| K (|Field|))
                        (IF (|has| K (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7) |p|)
                . #9=(|IBACHIN;approximateExtendedEuclidean|))
          (LETT |fSUP| (SPADCALL |f| (QREFELT $ 34)) . #9#)
          (LETT |gSUP| (SPADCALL |g| (QREFELT $ 34)) . #9#)
          (LETT |fBar|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST '$ (|devaluate| (ELT $ 7)))
                                        |sae|)
                 |fSUP|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT $ 7)))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 7))))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         (ELT $ 7) |sae|)))
                . #9#)
          (LETT |gBar|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST '$ (|devaluate| (ELT $ 7)))
                                        |sae|)
                 |gSUP|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT $ 7)))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 7))))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         (ELT $ 7) |sae|)))
                . #9#)
          (LETT |ee|
                (SPADCALL |fBar| |gBar|
                          (|compiledLookupCheck| '|extendedEuclidean|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:| '|coef1| '$)
                                                        (LIST '|:| '|coef2| '$)
                                                        (LIST '|:| '|generator|
                                                              '$))
                                                  '$ '$)
                                                 (|SparseUnivariatePolynomial|
                                                  |sae|)))
                . #9#)
          (COND
           ((NULL
             (SPADCALL (QVELT |ee| 2)
                       (SPADCALL
                        (|compiledLookupCheck| '|One| (LIST '$)
                                               (|SparseUnivariatePolynomial|
                                                |sae|)))
                       (|compiledLookupCheck| '= (LIST (LIST '|Boolean|) '$ '$)
                                              (|SparseUnivariatePolynomial|
                                               |sae|))))
            (EXIT (|error| "polynomials aren't relatively prime"))))
          (LETT |ss1| (QVELT |ee| 0) . #9#) (LETT |tt1| (QVELT |ee| 1) . #9#)
          (LETT |s1|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST (|devaluate| (ELT $ 7)) '$)
                                        |sae|)
                 |ss1|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 7)))
                                         (LIST '|Mapping|
                                               (|devaluate| (ELT $ 7))
                                               (|devaluate| |sae|))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|)))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         |sae| (ELT $ 7))))
                . #9#)
          (LETT |s| |s1| . #9#)
          (LETT |t1|
                (SPADCALL
                 (|compiledLookupCheck| '|convert|
                                        (LIST (|devaluate| (ELT $ 7)) '$)
                                        |sae|)
                 |tt1|
                 (|compiledLookupCheck| '|map|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| (ELT $ 7)))
                                         (LIST '|Mapping|
                                               (|devaluate| (ELT $ 7))
                                               (|devaluate| |sae|))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|)))
                                        (|SparseUnivariatePolynomialFunctions2|
                                         |sae| (ELT $ 7))))
                . #9#)
          (LETT |t| |t1| . #9#) (LETT |pPower| |p| . #9#)
          (SEQ (LETT |i| 2 . #9#) (LETT #4# |n| . #9#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (LETT |num|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 37)
                                 (SPADCALL |s| |fSUP| (QREFELT $ 35))
                                 (QREFELT $ 38))
                       (SPADCALL |t| |gSUP| (QREFELT $ 35)) (QREFELT $ 38))
                      . #9#)
                (LETT |rhs|
                      (PROG2
                          (LETT #3# (SPADCALL |num| |pPower| (QREFELT $ 40))
                                . #9#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))
                                        (|Union|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7))
                                         "failed")
                                        #3#))
                      . #9#)
                (LETT |sigma|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!0|
                             (VECTOR $ |p|))
                       (SPADCALL |s1| |rhs| (QREFELT $ 35)) (QREFELT $ 43))
                      . #9#)
                (LETT |tau|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!1|
                             (VECTOR $ |p|))
                       (SPADCALL |t1| |rhs| (QREFELT $ 35)) (QREFELT $ 43))
                      . #9#)
                (LETT |s|
                      (SPADCALL |s| (SPADCALL |pPower| |sigma| (QREFELT $ 44))
                                (QREFELT $ 45))
                      . #9#)
                (LETT |t|
                      (SPADCALL |t| (SPADCALL |pPower| |tau| (QREFELT $ 44))
                                (QREFELT $ 45))
                      . #9#)
                (LETT |quorem| (SPADCALL |s| |gSUP| (QREFELT $ 47)) . #9#)
                (LETT |pPower| (SPADCALL |pPower| |p| (QREFELT $ 30)) . #9#)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|IBACHIN;approximateExtendedEuclidean!2|
                             (VECTOR $ |pPower|))
                       (QCDR |quorem|) (QREFELT $ 43))
                      . #9#)
                (EXIT
                 (LETT |t|
                       (SPADCALL
                        (CONS #'|IBACHIN;approximateExtendedEuclidean!3|
                              (VECTOR $ |pPower|))
                        (SPADCALL |t|
                                  (SPADCALL |fSUP| (QCAR |quorem|)
                                            (QREFELT $ 35))
                                  (QREFELT $ 45))
                        (QREFELT $ 43))
                       . #9#)))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS (SPADCALL |s| (QREFELT $ 48))
                 (SPADCALL |t| (QREFELT $ 48))))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!3| ((|r1| NIL) ($$ NIL))
        (PROG (|pPower| $)
          (LETT |pPower| (QREFELT $$ 1)
                . #1=(|IBACHIN;approximateExtendedEuclidean|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 41)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!2| ((|r1| NIL) ($$ NIL))
        (PROG (|pPower| $)
          (LETT |pPower| (QREFELT $$ 1)
                . #1=(|IBACHIN;approximateExtendedEuclidean|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 41)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!1| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1)
                . #1=(|IBACHIN;approximateExtendedEuclidean|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 41)))))) 

(SDEFUN |IBACHIN;approximateExtendedEuclidean!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1)
                . #1=(|IBACHIN;approximateExtendedEuclidean|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 41)))))) 

(SDEFUN |IBACHIN;mapChineseToList|
        ((|list| |List| UP) (|polyList| |List| UP) (|i| |Integer|) (|den| R)
         ($ |List| UP))
        (SPROG
         ((#1=#:G179 NIL) (|pp| NIL) (#2=#:G178 NIL) (|invPoly| (UP))
          (|n| (|NonNegativeInteger|)) (#3=#:G171 NIL) (|prime| (R))
          (|factoredDen|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R) (|:| |exponent| (|Integer|)))))
          (|q| (UP)) (|j| NIL) (|p| (UP)) (#4=#:G177 NIL))
         (SEQ
          (LETT |q| (|spadConstant| $ 36) . #5=(|IBACHIN;mapChineseToList|))
          (SEQ (LETT |j| 1 . #5#) (LETT #4# (- |i| 1) . #5#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (LETT |q|
                      (SPADCALL |q| (|SPADfirst| |polyList|) (QREFELT $ 49))
                      . #5#)
                (EXIT (LETT |polyList| (CDR |polyList|) . #5#)))
               (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |p| (|SPADfirst| |polyList|) . #5#)
          (LETT |polyList| (CDR |polyList|) . #5#)
          (SEQ (LETT |j| (+ |i| 1) . #5#) G190
               (COND ((NULL (NULL (NULL |polyList|))) (GO G191)))
               (SEQ
                (LETT |q|
                      (SPADCALL |q| (|SPADfirst| |polyList|) (QREFELT $ 49))
                      . #5#)
                (EXIT (LETT |polyList| (CDR |polyList|) . #5#)))
               (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |factoredDen|
                (SPADCALL (SPADCALL |den| (QREFELT $ 52)) (QREFELT $ 56))
                . #5#)
          (LETT |prime| (QVELT (|SPADfirst| |factoredDen|) 1) . #5#)
          (LETT |n|
                (PROG1 (LETT #3# (QVELT (|SPADfirst| |factoredDen|) 2) . #5#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #5#)
          (LETT |invPoly|
                (QCAR
                 (|IBACHIN;approximateExtendedEuclidean| |q| |p| |prime| |n|
                  $))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |pp| NIL . #5#) (LETT #1# |list| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |pp| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (QCDR
                           (SPADCALL
                            (SPADCALL (SPADCALL |pp| |invPoly| (QREFELT $ 49))
                                      |q| (QREFELT $ 49))
                            (SPADCALL |p| |q| (QREFELT $ 49)) (QREFELT $ 57)))
                          #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |IBACHIN;polyListToMatrix|
        ((|polyList| |List| UP) (|n| |NonNegativeInteger|) ($ |Matrix| R))
        (SPROG
         ((|poly| (UP)) (#1=#:G186 NIL) (|i| NIL) (#2=#:G187 NIL)
          (|mat| (|Matrix| R)))
         (SEQ
          (LETT |mat| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 10))
                . #3=(|IBACHIN;polyListToMatrix|))
          (SEQ (LETT |poly| NIL . #3#) (LETT #2# |polyList| . #3#)
               (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
               (COND
                ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                     (PROGN (LETT |poly| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |poly| (QREFELT $ 59))))
                        (GO G191)))
                      (SEQ
                       (SPADCALL |mat| |i|
                                 (+ (SPADCALL |poly| (QREFELT $ 60)) 1)
                                 (SPADCALL |poly| (QREFELT $ 61))
                                 (QREFELT $ 64))
                       (EXIT
                        (LETT |poly| (SPADCALL |poly| (QREFELT $ 65)) . #3#)))
                      NIL (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |IBACHIN;chineseRemainder;LLNniR;9|
        ((|factors| |List| UP)
         (|factorBases| |List|
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R))))
         (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
          (|:| |basisInv| (|Matrix| R))))
        (SPROG
         ((|matInv| (|Matrix| R)) (|mat| (|Matrix| R))
          (|basisPolys| (|List| UP)) (|basisPolyLists| (|List| (|List| UP)))
          (|polyList| (|List| UP)) (|i| NIL) (#1=#:G200 NIL) (|pList| NIL)
          (|factorBasisPolyLists| (|List| (|List| UP))) (|denLCM| (R))
          (#2=#:G199 NIL) (|base| NIL) (#3=#:G198 NIL))
         (SEQ
          (LETT |denLCM|
                (SPADCALL (ELT $ 66)
                          (PROGN
                           (LETT #3# NIL
                                 . #4=(|IBACHIN;chineseRemainder;LLNniR;9|))
                           (SEQ (LETT |base| NIL . #4#)
                                (LETT #2# |factorBases| . #4#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN
                                       (LETT |base| (CAR #2#) . #4#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3# (CONS (QVELT |base| 1) #3#)
                                        . #4#)))
                                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          (QREFELT $ 69))
                . #4#)
          (EXIT
           (COND
            ((SPADCALL |denLCM| (|spadConstant| $ 19) (QREFELT $ 70))
             (VECTOR (SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 71))
                     (|spadConstant| $ 19)
                     (SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 71))))
            ('T
             (SEQ
              (LETT |factorBasisPolyLists|
                    (|IBACHIN;basesToPolyLists| |factorBases| |denLCM| $)
                    . #4#)
              (LETT |basisPolyLists| NIL . #4#)
              (SEQ (LETT |pList| NIL . #4#)
                   (LETT #1# |factorBasisPolyLists| . #4#) (LETT |i| 1 . #4#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pList| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |polyList|
                          (|IBACHIN;mapChineseToList| |pList| |factors| |i|
                           |denLCM| $)
                          . #4#)
                    (EXIT
                     (LETT |basisPolyLists| (CONS |polyList| |basisPolyLists|)
                           . #4#)))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |basisPolys|
                    (SPADCALL (NREVERSE |basisPolyLists|) (QREFELT $ 74))
                    . #4#)
              (LETT |mat|
                    (SPADCALL
                     (SPADCALL (|IBACHIN;polyListToMatrix| |basisPolys| |n| $)
                               |denLCM| (QREFELT $ 76))
                     (QREFELT $ 77))
                    . #4#)
              (LETT |matInv| (SPADCALL |mat| |denLCM| (QREFELT $ 79)) . #4#)
              (EXIT (VECTOR |mat| |denLCM| |matInv|))))))))) 

(DECLAIM (NOTINLINE |ChineseRemainderToolsForIntegralBases;|)) 

(DEFUN |ChineseRemainderToolsForIntegralBases| (&REST #1=#:G201)
  (SPROG NIL
         (PROG (#2=#:G202)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ChineseRemainderToolsForIntegralBases|)
                                               '|domainEqualList|)
                    . #3=(|ChineseRemainderToolsForIntegralBases|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ChineseRemainderToolsForIntegralBases;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ChineseRemainderToolsForIntegralBases|)))))))))) 

(DEFUN |ChineseRemainderToolsForIntegralBases;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ChineseRemainderToolsForIntegralBases|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|ChineseRemainderToolsForIntegralBases| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 81) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|ChineseRemainderToolsForIntegralBases|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ChineseRemainderToolsForIntegralBases| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) (4 . |Zero|) (|NonNegativeInteger|)
              (8 . ^) (|Mapping| 6 6) (14 . |map|)
              (|Record| (|:| |basis| 63) (|:| |basisDen| 7)
                        (|:| |basisInv| 63))
              (|List| 15) (20 . |list|) (25 . |One|) (29 . |One|)
              |IBACHIN;listConjugateBases;R2NniL;2|
              (|SparseUnivariatePolynomial| 6) (33 . |monomial|) (39 . -)
              (45 . ^) (|List| 21) (51 . |list|) |IBACHIN;factorList;K3NniL;3|
              (56 . |Zero|) (60 . |quo|) (66 . *) (72 . |monomial|) (78 . +)
              (|SparseUnivariatePolynomial| 7) (84 . |makeSUP|) (89 . *)
              (95 . |One|) (99 . |One|) (103 . -) (|Union| $ '"failed")
              (109 . |exquo|) (115 . |rem|) (|Mapping| 7 7) (121 . |map|)
              (127 . *) (133 . +)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (139 . |monicDivide|) (145 . |unmakeSUP|) (150 . *)
              (|Factored| 7) (|DistinctDegreeFactorize| 6 7) (156 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 53) (|:| |factor| 7) (|:| |exponent| 62))
              (|List| 54) (161 . |factorList|) (166 . |monicDivide|)
              (|Boolean|) (172 . |zero?|) (177 . |degree|)
              (182 . |leadingCoefficient|) (|Integer|) (|Matrix| 7)
              (187 . |setelt!|) (195 . |reductum|) (200 . |lcm|)
              (|Mapping| 7 7 7) (|List| 7) (206 . |reduce|) (212 . =)
              (218 . |scalarMatrix|) (|List| $) (|List| 8) (224 . |concat|)
              (|ModularHermitianRowReduction| 7) (229 . |rowEchelon|)
              (235 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 63)
              (240 . |UpTriBddDenomInv|) |IBACHIN;chineseRemainder;LLNniR;9|)
           '#(|listConjugateBases| 246 |factorList| 253 |chineseRemainder| 261)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 80
                                                 '(0 6 0 9 0 7 0 10 2 6 0 0 11
                                                   12 2 7 0 13 0 14 1 16 0 15
                                                   17 0 6 0 18 0 7 0 19 2 21 0
                                                   6 11 22 2 21 0 0 0 23 2 21 0
                                                   0 11 24 1 25 0 21 26 0 8 0
                                                   28 2 7 0 0 0 29 2 7 0 0 0 30
                                                   2 8 0 7 11 31 2 8 0 0 0 32 1
                                                   8 33 0 34 2 33 0 0 0 35 0 8
                                                   0 36 0 33 0 37 2 33 0 0 0 38
                                                   2 33 39 0 7 40 2 7 0 0 0 41
                                                   2 33 0 42 0 43 2 33 0 7 0 44
                                                   2 33 0 0 0 45 2 33 46 0 0 47
                                                   1 8 0 33 48 2 8 0 0 0 49 1
                                                   51 50 7 52 1 50 55 0 56 2 8
                                                   46 0 0 57 1 8 58 0 59 1 8 11
                                                   0 60 1 8 7 0 61 4 63 7 0 62
                                                   62 7 64 1 8 0 0 65 2 7 0 0 0
                                                   66 2 68 7 67 0 69 2 7 58 0 0
                                                   70 2 63 0 11 7 71 1 73 0 72
                                                   74 2 75 63 63 7 76 1 63 0 0
                                                   77 2 78 63 63 7 79 3 0 16 15
                                                   11 11 20 4 0 25 6 11 11 11
                                                   27 3 0 15 73 16 11 80)))))
           '|lookupComplete|)) 
