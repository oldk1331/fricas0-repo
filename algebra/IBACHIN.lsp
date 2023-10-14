
(/VERSIONCHECK 2) 

(DEFUN |IBACHIN;applyFrobToMatrix| (|mat| |q| $)
  (PROG (|j| |i| |ans| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (QVSIZE |mat|) . #1=(|IBACHIN;applyFrobToMatrix|))
          (LETT |n| (SPADCALL |mat| (QREFELT $ 11)) . #1#)
          (LETT |ans| (SPADCALL |m| |n| (|spadConstant| $ 13) (QREFELT $ 14))
                . #1#)
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
                                     (QREFELT $ 17))
                                    1 1)))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |IBACHIN;applyFrobToMatrix!0| (|k1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|IBACHIN;applyFrobToMatrix|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 15)))))) 

(DEFUN |IBACHIN;listConjugateBases;R2NniL;2| (|bas| |q| |n| $)
  (PROG (|outList| |newBasis| |bDen| |bInv| |b| #1=#:G143 |i|)
    (RETURN
     (SEQ
      (LETT |outList| (SPADCALL |bas| (QREFELT $ 20))
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
                       |bDen| (QREFELT $ 17))
                      . #2#)
                (LETT |newBasis| (VECTOR |b| |bDen| |bInv|) . #2#)
                (EXIT (LETT |outList| (CONS |newBasis| |outList|) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |outList|)))))) 

(DEFUN |IBACHIN;listConjugateBases;R2NniL;2!0| (|k1| $$)
  (PROG (|q| $)
    (LETT |q| (QREFELT $$ 1) . #1=(|IBACHIN;listConjugateBases;R2NniL;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |k1| |q| (QREFELT $ 15)))))) 

(DEFUN |IBACHIN;factorList;K3NniL;3| (|a| |q| |n| |k| $)
  (PROG (|outList| |coef| #1=#:G148 |i| |xx|)
    (RETURN
     (SEQ
      (LETT |coef| (SPADCALL |a| 0 (QREFELT $ 25))
            . #2=(|IBACHIN;factorList;K3NniL;3|))
      (LETT |xx| (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 25)) . #2#)
      (LETT |outList|
            (SPADCALL
             (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 26)) |k|
                       (QREFELT $ 27))
             (QREFELT $ 29))
            . #2#)
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (LETT |coef| (SPADCALL |coef| |q| (QREFELT $ 27)) . #2#)
                (EXIT
                 (LETT |outList|
                       (CONS
                        (SPADCALL (SPADCALL |xx| |coef| (QREFELT $ 26)) |k|
                                  (QREFELT $ 27))
                        |outList|)
                       . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |outList|)))))) 

(DEFUN |IBACHIN;basisInfoToPolys| (|mat| |lcm| |den| $)
  (PROG (|outList| |pp| |j| |i| |n1| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |mat|) . #1=(|IBACHIN;basisInfoToPolys|))
          (LETT |n1| (- |n| 1) . #1#) (LETT |outList| NIL . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |pp| (|spadConstant| $ 31) . #1#)
                    (SEQ (LETT |j| 0 . #1#) G190
                         (COND ((|greater_SI| |j| |n1|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |pp|
                                 (SPADCALL |pp|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |lcm| |den|
                                                       (QREFELT $ 32))
                                             (QAREF2O |mat| |i| (+ |j| 1) 1 1)
                                             (QREFELT $ 33))
                                            |j| (QREFELT $ 34))
                                           (QREFELT $ 35))
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
      (LETT |fSUP| (SPADCALL |f| (QREFELT $ 37)) . #2#)
      (LETT |gSUP| (SPADCALL |g| (QREFELT $ 37)) . #2#)
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
                   (SPADCALL (|spadConstant| $ 40)
                             (SPADCALL |s| |fSUP| (QREFELT $ 38))
                             (QREFELT $ 41))
                   (SPADCALL |t| |gSUP| (QREFELT $ 38)) (QREFELT $ 41))
                  . #2#)
            (LETT |rhs|
                  (PROG2
                      (LETT #1# (SPADCALL |num| |pPower| (QREFELT $ 43)) . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #1#))
                  . #2#)
            (LETT |sigma|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!0|
                         (VECTOR $ |p|))
                   (SPADCALL |s1| |rhs| (QREFELT $ 38)) (QREFELT $ 46))
                  . #2#)
            (LETT |tau|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!1|
                         (VECTOR $ |p|))
                   (SPADCALL |t1| |rhs| (QREFELT $ 38)) (QREFELT $ 46))
                  . #2#)
            (LETT |s|
                  (SPADCALL |s| (SPADCALL |pPower| |sigma| (QREFELT $ 47))
                            (QREFELT $ 48))
                  . #2#)
            (LETT |t|
                  (SPADCALL |t| (SPADCALL |pPower| |tau| (QREFELT $ 47))
                            (QREFELT $ 48))
                  . #2#)
            (LETT |quorem| (SPADCALL |s| |gSUP| (QREFELT $ 50)) . #2#)
            (LETT |pPower| (SPADCALL |pPower| |p| (QREFELT $ 33)) . #2#)
            (LETT |s|
                  (SPADCALL
                   (CONS #'|IBACHIN;approximateExtendedEuclidean!2|
                         (VECTOR $ |pPower|))
                   (QCDR |quorem|) (QREFELT $ 46))
                  . #2#)
            (EXIT
             (LETT |t|
                   (SPADCALL
                    (CONS #'|IBACHIN;approximateExtendedEuclidean!3|
                          (VECTOR $ |pPower|))
                    (SPADCALL |t|
                              (SPADCALL |fSUP| (QCAR |quorem|) (QREFELT $ 38))
                              (QREFELT $ 48))
                    (QREFELT $ 46))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS (SPADCALL |s| (QREFELT $ 51)) (SPADCALL |t| (QREFELT $ 51)))))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!3| (|r1| $$)
  (PROG (|pPower| $)
    (LETT |pPower| (QREFELT $$ 1)
          . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 44)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!2| (|r1| $$)
  (PROG (|pPower| $)
    (LETT |pPower| (QREFELT $$ 1)
          . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |pPower| (QREFELT $ 44)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!1| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 44)))))) 

(DEFUN |IBACHIN;approximateExtendedEuclidean!0| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|IBACHIN;approximateExtendedEuclidean|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 44)))))) 

(DEFUN |IBACHIN;mapChineseToList| (|list| |polyList| |i| |den| $)
  (PROG (#1=#:G195 |pp| #2=#:G194 |invPoly| |n| #3=#:G187 |prime| |factoredDen|
         |q| |j| |p| #4=#:G193)
    (RETURN
     (SEQ (LETT |q| (|spadConstant| $ 39) . #5=(|IBACHIN;mapChineseToList|))
          (SEQ (LETT |j| 1 . #5#) (LETT #4# (- |i| 1) . #5#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (LETT |q|
                      (SPADCALL |q| (|SPADfirst| |polyList|) (QREFELT $ 52))
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
                      (SPADCALL |q| (|SPADfirst| |polyList|) (QREFELT $ 52))
                      . #5#)
                (EXIT (LETT |polyList| (CDR |polyList|) . #5#)))
               (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |factoredDen| (SPADCALL |den| (QREFELT $ 55)) . #5#)
          (LETT |prime| (SPADCALL |factoredDen| 1 (QREFELT $ 57)) . #5#)
          (LETT |n|
                (PROG1
                    (LETT #3# (SPADCALL |factoredDen| 1 (QREFELT $ 58)) . #5#)
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
                            (SPADCALL (SPADCALL |pp| |invPoly| (QREFELT $ 52))
                                      |q| (QREFELT $ 52))
                            (SPADCALL |p| |q| (QREFELT $ 52)) (QREFELT $ 59)))
                          #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |IBACHIN;polyListToMatrix| (|polyList| |n| $)
  (PROG (|poly| |i| #1=#:G202 |mat|)
    (RETURN
     (SEQ
      (LETT |mat| (SPADCALL |n| |n| (|spadConstant| $ 13) (QREFELT $ 14))
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
                     (COND ((SPADCALL |poly| (QREFELT $ 61)) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ
                   (SPADCALL |mat| |i| (+ (SPADCALL |poly| (QREFELT $ 62)) 1)
                             (SPADCALL |poly| (QREFELT $ 63)) (QREFELT $ 64))
                   (EXIT (LETT |poly| (SPADCALL |poly| (QREFELT $ 65)) . #2#)))
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
            (SPADCALL (ELT $ 66)
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
                      (QREFELT $ 69))
            . #4#)
      (EXIT
       (COND
        ((SPADCALL |denLCM| (|spadConstant| $ 22) (QREFELT $ 70))
         (VECTOR (SPADCALL |n| (|spadConstant| $ 22) (QREFELT $ 71))
                 (|spadConstant| $ 22)
                 (SPADCALL |n| (|spadConstant| $ 22) (QREFELT $ 71))))
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
                (SPADCALL (NREVERSE |basisPolyLists|) (QREFELT $ 74)) . #4#)
          (LETT |mat|
                (SPADCALL
                 (SPADCALL (|IBACHIN;polyListToMatrix| |basisPolys| |n| $)
                           |denLCM| (QREFELT $ 76))
                 (QREFELT $ 77))
                . #4#)
          (LETT |matInv| (SPADCALL |mat| |denLCM| (QREFELT $ 79)) . #4#)
          (EXIT (VECTOR |mat| |denLCM| |matInv|)))))))))) 

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
      (LETT $ (GETREFV 81) . #1#)
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
              (|local| |#3|) (|NonNegativeInteger|) (|Matrix| 7) (0 . |ncols|)
              (5 . |Zero|) (9 . |Zero|) (13 . |new|) (20 . ^) (|Mapping| 6 6)
              (26 . |map|)
              (|Record| (|:| |basis| 10) (|:| |basisDen| 7)
                        (|:| |basisInv| 10))
              (|List| 18) (32 . |list|) (37 . |One|) (41 . |One|)
              |IBACHIN;listConjugateBases;R2NniL;2|
              (|SparseUnivariatePolynomial| 6) (45 . |monomial|) (51 . -)
              (57 . ^) (|List| 24) (63 . |list|) |IBACHIN;factorList;K3NniL;3|
              (68 . |Zero|) (72 . |quo|) (78 . *) (84 . |monomial|) (90 . +)
              (|SparseUnivariatePolynomial| 7) (96 . |makeSUP|) (101 . *)
              (107 . |One|) (111 . |One|) (115 . -) (|Union| $ '"failed")
              (121 . |exquo|) (127 . |rem|) (|Mapping| 7 7) (133 . |map|)
              (139 . *) (145 . +)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (151 . |monicDivide|) (157 . |unmakeSUP|) (162 . *)
              (|Factored| 7) (|DistinctDegreeFactorize| 6 7) (168 . |factor|)
              (|Integer|) (173 . |nthFactor|) (179 . |nthExponent|)
              (185 . |monicDivide|) (|Boolean|) (191 . |zero?|)
              (196 . |degree|) (201 . |leadingCoefficient|) (206 . |setelt|)
              (214 . |reductum|) (219 . |lcm|) (|Mapping| 7 7 7) (|List| 7)
              (225 . |reduce|) (231 . =) (237 . |scalarMatrix|) (|List| $)
              (|List| 8) (243 . |concat|) (|ModularHermitianRowReduction| 7)
              (248 . |rowEchelon|) (254 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 10)
              (259 . |UpTriBddDenomInv|) |IBACHIN;chineseRemainder;LLNniR;9|)
           '#(|listConjugateBases| 265 |factorList| 272 |chineseRemainder| 280)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 80
                                                 '(1 10 9 0 11 0 6 0 12 0 7 0
                                                   13 3 10 0 9 9 7 14 2 6 0 0 9
                                                   15 2 7 0 16 0 17 1 19 0 18
                                                   20 0 6 0 21 0 7 0 22 2 24 0
                                                   6 9 25 2 24 0 0 0 26 2 24 0
                                                   0 9 27 1 28 0 24 29 0 8 0 31
                                                   2 7 0 0 0 32 2 7 0 0 0 33 2
                                                   8 0 7 9 34 2 8 0 0 0 35 1 8
                                                   36 0 37 2 36 0 0 0 38 0 8 0
                                                   39 0 36 0 40 2 36 0 0 0 41 2
                                                   36 42 0 7 43 2 7 0 0 0 44 2
                                                   36 0 45 0 46 2 36 0 7 0 47 2
                                                   36 0 0 0 48 2 36 49 0 0 50 1
                                                   8 0 36 51 2 8 0 0 0 52 1 54
                                                   53 7 55 2 53 7 0 56 57 2 53
                                                   56 0 56 58 2 8 49 0 0 59 1 8
                                                   60 0 61 1 8 9 0 62 1 8 7 0
                                                   63 4 10 7 0 56 56 7 64 1 8 0
                                                   0 65 2 7 0 0 0 66 2 68 7 67
                                                   0 69 2 7 60 0 0 70 2 10 0 9
                                                   7 71 1 73 0 72 74 2 75 10 10
                                                   7 76 1 10 0 0 77 2 78 10 10
                                                   7 79 3 0 19 18 9 9 23 4 0 28
                                                   6 9 9 9 30 3 0 18 73 19 9
                                                   80)))))
           '|lookupComplete|)) 
