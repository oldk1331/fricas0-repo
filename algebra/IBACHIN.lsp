
(/VERSIONCHECK 2) 

(DEFUN |IBACHIN;applyFrobToMatrix| (|mat| |q| $)
  (PROG (|j| |i| |ans| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |mat|) . #1=(|IBACHIN;applyFrobToMatrix|))
          (LETT |n| (ANCOLS |mat|) . #1#)
          (LETT |ans| (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 10)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |m|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |ans| |i| |j|
                                    (SPADCALL
                                     (CONS #'|IBACHIN;applyFrobToMatrix!0|
                                           (VECTOR $ |q|))
                                     (QAREF2O |mat| |i| |j| 1 1)
                                     (QREFELT $ 14))
                                    1 1)))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |IBACHIN;applyFrobToMatrix!0| (|k1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|IBACHIN;applyFrobToMatrix|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 12)))))) 

(DEFUN |IBACHIN;listConjugateBases;R2NniL;2| (|bas| |q| |n| $)
  (PROG (|outList| |newBasis| |bDen| |bInv| |b| #1=#:G143 |i|)
    (RETURN
     (SEQ
      (LETT |outList| (SPADCALL |bas| (QREFELT $ 17))
            . #2=(|IBACHIN;listConjugateBases;R2NniL;2|))
      (LETT |b| (QVELT |bas| 0) . #2#) (LETT |bInv| (QVELT |bas| 2) . #2#)
      (LETT |bDen| (QVELT |bas| 1) . #2#)
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (LETT |b| (|IBACHIN;applyFrobToMatrix| |b| |q| $) . #2#)
                (LETT |bInv| (|IBACHIN;applyFrobToMatrix| |bInv| |q| $) . #2#)
                (LETT |bDen|
                      (SPADCALL
                       (CONS #'|IBACHIN;listConjugateBases;R2NniL;2!0|
                             (VECTOR $ |q|))
                       |bDen| (QREFELT $ 14))
                      . #2#)
                (LETT |newBasis| (VECTOR |b| |bDen| |bInv|) . #2#)
                (EXIT (LETT |outList| (CONS |newBasis| |outList|) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |outList|)))))) 

(DEFUN |IBACHIN;listConjugateBases;R2NniL;2!0| (|k1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|IBACHIN;listConjugateBases;R2NniL;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 12)))))) 

(DEFUN |IBACHIN;factorList;K3NniL;3| (|a| |q| |n| |k| $)
  (PROG (|outList| |coef| #1=#:G148 |i| |xx|)
    (RETURN
     (SEQ
      (LETT |coef| (SPADCALL |a| 0 (QREFELT $ 22))
            . #2=(|IBACHIN;factorList;K3NniL;3|))
      (LETT |xx| (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 22)) . #2#)
      (LETT |outList|
            (SPADCALL
             (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 23)) |k|
                       (QREFELT $ 24))
             (QREFELT $ 26))
            . #2#)
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (LETT |coef| (SPADCALL |coef| |q| (QREFELT $ 24)) . #2#)
                (EXIT
                 (LETT |outList|
                       (CONS
                        (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 23)) |k|
                                  (QREFELT $ 24))
                        |outList|)
                       . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |outList|)))))) 

(DEFUN |IBACHIN;basisInfoToPolys| (|mat| |lcm| |den| $)
  (PROG (|outList| |pp| |j| |i| |n1| |n|)
    (RETURN
     (SEQ (LETT |n| (ANROWS |mat|) . #1=(|IBACHIN;basisInfoToPolys|))
          (LETT |n1| (- |n| 1) . #1#) (LETT |outList| NIL . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |pp| (|spadConstant| $ 28) . #1#)
                    (SEQ (LETT |j| 0 . #1#) G190
                         (COND ((|greater_SI| |j| |n1|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |pp|
                                 (SPADCALL |pp|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |lcm| |den|
                                                       (QREFELT $ 29))
                                             (QAREF2O |mat| |i| (+ |j| 1) 1 1)
                                             (QREFELT $ 30))
                                            |j| (QREFELT $ 31))
                                           (QREFELT $ 32))
                                 . #1#)))
                         (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |outList| (CONS |pp| |outList|) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |outList|)))))) 

(DEFUN |IBACHIN;basesToPolyLists| (|basisList| |lcm| $)
  (PROG (#1=#:G158 |b| #2=#:G157)
    (RETURN
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
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean| (|f| |g| |p| |n| $)
  (PROG (|t| |s| |pPower| |quorem| |tau| |sigma| |rhs| #1=#:G163 |num| |i| |t1|
         |s1| |tt1| |ss1| |ee| |gBar| |fBar| |gSUP| |fSUP| |sae|)
    (RETURN
     (SEQ
      (LETT |sae| (|SimpleAlgebraicExtension| (QREFELT $ 6) (QREFELT $ 7) |p|)
            . #2=(|IBACHIN;approximateExtendedEuclidean|))
      (LETT |fSUP| (SPADCALL |f| (QREFELT $ 34)) . #2#)
      (LETT |gSUP| (SPADCALL |g| (QREFELT $ 34)) . #2#)
      (LETT |fBar|
            (SPADCALL
             (|compiledLookupCheck| '|convert|
                                    (LIST '$ (|devaluate| (ELT $ 7))) |sae|)
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
            . #2#)
      (LETT |gBar|
            (SPADCALL
             (|compiledLookupCheck| '|convert|
                                    (LIST '$ (|devaluate| (ELT $ 7))) |sae|)
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
            . #2#)
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
            . #2#)
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
      (LETT |ss1| (QVELT |ee| 0) . #2#) (LETT |tt1| (QVELT |ee| 1) . #2#)
      (LETT |s1|
            (SPADCALL
             (|compiledLookupCheck| '|convert|
                                    (LIST (|devaluate| (ELT $ 7)) '$) |sae|)
             |ss1|
             (|compiledLookupCheck| '|map|
                                    (LIST
                                     (LIST '|SparseUnivariatePolynomial|
                                           (|devaluate| (ELT $ 7)))
                                     (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                           (|devaluate| |sae|))
                                     (LIST '|SparseUnivariatePolynomial|
                                           (|devaluate| |sae|)))
                                    (|SparseUnivariatePolynomialFunctions2|
                                     |sae| (ELT $ 7))))
            . #2#)
      (LETT |s| |s1| . #2#)
      (LETT |t1|
            (SPADCALL
             (|compiledLookupCheck| '|convert|
                                    (LIST (|devaluate| (ELT $ 7)) '$) |sae|)
             |tt1|
             (|compiledLookupCheck| '|map|
                                    (LIST
                                     (LIST '|SparseUnivariatePolynomial|
                                           (|devaluate| (ELT $ 7)))
                                     (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                           (|devaluate| |sae|))
                                     (LIST '|SparseUnivariatePolynomial|
                                           (|devaluate| |sae|)))
                                    (|SparseUnivariatePolynomialFunctions2|
                                     |sae| (ELT $ 7))))
            . #2#)
      (LETT |t| |t1| . #2#) (LETT |pPower| |p| . #2#)
      (SEQ (LETT |i| 2 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (LETT |num|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 37)
                             (SPADCALL |s| |fSUP| (QREFELT $ 35))
                             (QREFELT $ 38))
                   (SPADCALL |t| |gSUP| (QREFELT $ 35)) (QREFELT $ 38))
                  . #2#)
            (LETT |rhs|
                  (PROG2
                      (LETT #1# (SPADCALL |num| |pPower| (QREFELT $ 40)) . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #1#))
                  . #2#)
            (LETT |sigma|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!0|
                         (VECTOR $ |p|))
                   (SPADCALL |s1| |rhs| (QREFELT $ 35)) (QREFELT $ 43))
                  . #2#)
            (LETT |tau|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!1|
                         (VECTOR $ |p|))
                   (SPADCALL |t1| |rhs| (QREFELT $ 35)) (QREFELT $ 43))
                  . #2#)
            (LETT |s|
                  (SPADCALL |s| (SPADCALL |pPower| |sigma| (QREFELT $ 44))
                            (QREFELT $ 45))
                  . #2#)
            (LETT |t|
                  (SPADCALL |t| (SPADCALL |pPower| |tau| (QREFELT $ 44))
                            (QREFELT $ 45))
                  . #2#)
            (LETT |quorem| (SPADCALL |s| |gSUP| (QREFELT $ 47)) . #2#)
            (LETT |pPower| (SPADCALL |pPower| |p| (QREFELT $ 30)) . #2#)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!2|
                         (VECTOR $ |pPower|))
                   (QCDR |quorem|) (QREFELT $ 43))
                  . #2#)
            (EXIT
             (LETT |t|
                   (SPADCALL
                    (CONS #'|IBACHIN;approximateExtendedEuclidean!3|
                          (VECTOR $ |pPower|))
                    (SPADCALL |t|
                              (SPADCALL |fSUP| (QCAR |quorem|) (QREFELT $ 35))
                              (QREFELT $ 45))
                    (QREFELT $ 43))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS (SPADCALL |s| (QREFELT $ 48)) (SPADCALL |t| (QREFELT $ 48)))))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!3| (|r1| $$)
  (PROG (|pPower| $)
    (LETT |pPower| (QREFELT $$ 1)
          . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 41)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!2| (|r1| $$)
  (PROG (|pPower| $)
    (LETT |pPower| (QREFELT $$ 1)
          . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 41)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!1| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 41)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!0| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 41)))))) 

(DEFUN |IBACHIN;mapChineseToList| (|list| |polyList| |i| |den| $)
  (PROG (#1=#:G195 |pp| #2=#:G194 |invPoly| |n| #3=#:G187 |prime| |factoredDen|
         |q| |j| |p| #4=#:G193)
    (RETURN
     (SEQ (LETT |q| (|spadConstant| $ 36) . #5=(|IBACHIN;mapChineseToList|))
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
               (COND
                ((NULL (COND ((NULL |polyList|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |q|
                      (SPADCALL |q| (|SPADfirst| |polyList|) (QREFELT $ 49))
                      . #5#)
                (EXIT (LETT |polyList| (CDR |polyList|) . #5#)))
               (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |factoredDen| (SPADCALL |den| (QREFELT $ 52)) . #5#)
          (LETT |prime| (SPADCALL |factoredDen| 1 (QREFELT $ 54)) . #5#)
          (LETT |n|
                (PROG1
                    (LETT #3# (SPADCALL |factoredDen| 1 (QREFELT $ 55)) . #5#)
                  (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
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
                            (SPADCALL |p| |q| (QREFELT $ 49)) (QREFELT $ 56)))
                          #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |IBACHIN;polyListToMatrix| (|polyList| |n| $)
  (PROG (|poly| |i| #1=#:G202 |mat|)
    (RETURN
     (SEQ
      (LETT |mat| (MAKE_MATRIX1 |n| |n| (|spadConstant| $ 10))
            . #2=(|IBACHIN;polyListToMatrix|))
      (SEQ (LETT |poly| NIL . #2#) (LETT #1# |polyList| . #2#)
           (LETT |i| 1 . #2#) G190
           (COND
            ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                 (PROGN (LETT |poly| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |poly| (QREFELT $ 58)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ
                   (SPADCALL |mat| |i| (+ (SPADCALL |poly| (QREFELT $ 59)) 1)
                             (SPADCALL |poly| (QREFELT $ 60)) (QREFELT $ 62))
                   (EXIT (LETT |poly| (SPADCALL |poly| (QREFELT $ 63)) . #2#)))
                  NIL (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |mat|))))) 

(DEFUN |IBACHIN;chineseRemainder;LLNniR;9| (|factors| |factorBases| |n| $)
  (PROG (|matInv| |mat| |basisPolys| |basisPolyLists| |polyList| |i| #1=#:G215
         |pList| |factorBasisPolyLists| |denLCM| #2=#:G214 |base| #3=#:G213)
    (RETURN
     (SEQ
      (LETT |denLCM|
            (SPADCALL (ELT $ 64)
                      (PROGN
                       (LETT #3# NIL
                             . #4=(|IBACHIN;chineseRemainder;LLNniR;9|))
                       (SEQ (LETT |base| NIL . #4#)
                            (LETT #2# |factorBases| . #4#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |base| (CAR #2#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3# (CONS (QVELT |base| 1) #3#) . #4#)))
                            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT $ 67))
            . #4#)
      (EXIT
       (COND
        ((SPADCALL |denLCM| (|spadConstant| $ 19) (QREFELT $ 68))
         (VECTOR (SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 69))
                 (|spadConstant| $ 19)
                 (SPADCALL |n| (|spadConstant| $ 19) (QREFELT $ 69))))
        ('T
         (SEQ
          (LETT |factorBasisPolyLists|
                (|IBACHIN;basesToPolyLists| |factorBases| |denLCM| $) . #4#)
          (LETT |basisPolyLists| NIL . #4#)
          (SEQ (LETT |pList| NIL . #4#) (LETT #1# |factorBasisPolyLists| . #4#)
               (LETT |i| 1 . #4#) G190
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
                (SPADCALL (NREVERSE |basisPolyLists|) (QREFELT $ 72)) . #4#)
          (LETT |mat|
                (SPADCALL
                 (SPADCALL (|IBACHIN;polyListToMatrix| |basisPolys| |n| $)
                           |denLCM| (QREFELT $ 74))
                 (QREFELT $ 75))
                . #4#)
          (LETT |matInv| (SPADCALL |mat| |denLCM| (QREFELT $ 77)) . #4#)
          (EXIT (VECTOR |mat| |denLCM| |matInv|)))))))))) 

(DECLAIM (NOTINLINE |ChineseRemainderToolsForIntegralBases;|)) 

(DEFUN |ChineseRemainderToolsForIntegralBases| (&REST #1=#:G216)
  (PROG ()
    (RETURN
     (PROG (#2=#:G217)
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
                  (APPLY (|function| |ChineseRemainderToolsForIntegralBases;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ChineseRemainderToolsForIntegralBases|))))))))))) 

(DEFUN |ChineseRemainderToolsForIntegralBases;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ChineseRemainderToolsForIntegralBases|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$|
            (LIST '|ChineseRemainderToolsForIntegralBases| DV$1 DV$2 DV$3)
            . #1#)
      (LETT $ (GETREFV 79) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ChineseRemainderToolsForIntegralBases|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ChineseRemainderToolsForIntegralBases| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) (4 . |Zero|) (|NonNegativeInteger|)
              (8 . ^) (|Mapping| 6 6) (14 . |map|)
              (|Record| (|:| |basis| 61) (|:| |basisDen| 7)
                        (|:| |basisInv| 61))
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
              (|Integer|) (161 . |nthFactor|) (167 . |nthExponent|)
              (173 . |monicDivide|) (|Boolean|) (179 . |zero?|)
              (184 . |degree|) (189 . |leadingCoefficient|) (|Matrix| 7)
              (194 . |setelt|) (202 . |reductum|) (207 . |lcm|)
              (|Mapping| 7 7 7) (|List| 7) (213 . |reduce|) (219 . =)
              (225 . |scalarMatrix|) (|List| $) (|List| 8) (231 . |concat|)
              (|ModularHermitianRowReduction| 7) (236 . |rowEchelon|)
              (242 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 61)
              (247 . |UpTriBddDenomInv|) |IBACHIN;chineseRemainder;LLNniR;9|)
           '#(|listConjugateBases| 253 |factorList| 260 |chineseRemainder| 268)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 78
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
                                                   51 50 7 52 2 50 7 0 53 54 2
                                                   50 53 0 53 55 2 8 46 0 0 56
                                                   1 8 57 0 58 1 8 11 0 59 1 8
                                                   7 0 60 4 61 7 0 53 53 7 62 1
                                                   8 0 0 63 2 7 0 0 0 64 2 66 7
                                                   65 0 67 2 7 57 0 0 68 2 61 0
                                                   11 7 69 1 71 0 70 72 2 73 61
                                                   61 7 74 1 61 0 0 75 2 76 61
                                                   61 7 77 3 0 16 15 11 11 20 4
                                                   0 25 6 11 11 11 27 3 0 15 71
                                                   16 11 78)))))
           '|lookupComplete|)) 
