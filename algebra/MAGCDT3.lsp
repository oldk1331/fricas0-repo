
(SDEFUN |MAGCDT3;pack_modulus1|
        ((|lm| |List| (|Polynomial| (|Integer|))) (|lvz| |List| (|Symbol|))
         (|p| |Integer|)
         ($ . #1=(|Union| (|List| (|Polynomial| (|Integer|))) "failed")))
        (SPROG
         ((|res1u| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|ic0| (|Polynomial| (|Integer|)))
          (|ic0u| (|Union| (|Polynomial| (|Integer|)) "failed"))
          (|c0| (|Polynomial| (|Integer|)))
          (|m1u| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (|lm1u| #1#)
          (|lv1| (|List| (|Symbol|)))
          (|resu| (|SparseUnivariatePolynomial| (|Integer|)))
          (|icc| (|Integer|)) (|cc| (|Integer|))
          (|mm| (|SparseUnivariatePolynomial| (|Integer|)))
          (|m1| (|Polynomial| (|Integer|))) (|v1| (|Symbol|)))
         (SEQ (LETT |v1| (|SPADfirst| |lvz|) . #2=(|MAGCDT3;pack_modulus1|))
              (LETT |m1| (|SPADfirst| |lm|) . #2#)
              (EXIT
               (COND
                ((EQL (LENGTH |lm|) 1)
                 (SEQ (LETT |mm| (SPADCALL |m1| (QREFELT $ 8)) . #2#)
                      (LETT |cc| (SPADCALL |mm| (QREFELT $ 10)) . #2#)
                      (EXIT
                       (COND ((EQL |cc| 0) (CONS 1 "failed"))
                             (#3='T
                              (SEQ
                               (LETT |icc| (SPADCALL |cc| |p| (QREFELT $ 12))
                                     . #2#)
                               (LETT |resu|
                                     (SPADCALL
                                      (CONS #'|MAGCDT3;pack_modulus1!0|
                                            (VECTOR $ |p|))
                                      (SPADCALL |icc| |mm| (QREFELT $ 14))
                                      (QREFELT $ 16))
                                     . #2#)
                               (EXIT
                                (CONS 0
                                      (LIST
                                       (SPADCALL |resu| |v1|
                                                 (QREFELT $ 18)))))))))))
                (#3#
                 (SEQ (LETT |lv1| (CDR |lvz|) . #2#)
                      (LETT |lm1u|
                            (|MAGCDT3;pack_modulus1| (CDR |lm|) |lv1| |p| $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |lm1u| 1) (CONS 1 "failed"))
                             (#3#
                              (SEQ (LETT |lm1| (QCDR |lm1u|) . #2#)
                                   (LETT |m1u|
                                         (SPADCALL (|SPADfirst| |lm|) |v1|
                                                   (QREFELT $ 20))
                                         . #2#)
                                   (LETT |c0| (SPADCALL |m1u| (QREFELT $ 22))
                                         . #2#)
                                   (LETT |ic0u|
                                         (SPADCALL |c0| |lm1| |lv1| |p|
                                                   (QREFELT $ 26))
                                         . #2#)
                                   (EXIT
                                    (COND ((QEQCAR |ic0u| 1) (CONS 1 "failed"))
                                          (#3#
                                           (SEQ
                                            (LETT |ic0| (QCDR |ic0u|) . #2#)
                                            (LETT |res1u|
                                                  (SPADCALL
                                                   (CONS
                                                    #'|MAGCDT3;pack_modulus1!1|
                                                    (VECTOR $ |p| |lv1| |lm1|))
                                                   (SPADCALL |ic0| |m1u|
                                                             (QREFELT $ 27))
                                                   (QREFELT $ 29))
                                                  . #2#)
                                            (EXIT
                                             (CONS 0
                                                   (CONS
                                                    (SPADCALL |res1u| |v1|
                                                              (QREFELT $ 30))
                                                    |lm1|)))))))))))))))))) 

(SDEFUN |MAGCDT3;pack_modulus1!1| ((|c| NIL) ($$ NIL))
        (PROG (|lm1| |lv1| |p| $)
          (LETT |lm1| (QREFELT $$ 3) . #1=(|MAGCDT3;pack_modulus1|))
          (LETT |lv1| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm1| |lv1| |p| $))))) 

(SDEFUN |MAGCDT3;pack_modulus1!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|MAGCDT3;pack_modulus1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |p| (QREFELT $ 13)))))) 

(SDEFUN |MAGCDT3;pack_modulus;LLIU;2|
        ((|lm| |List| (|Polynomial| #1=(|Integer|))) (|lvz| |List| (|Symbol|))
         (|p| . #1#)
         ($ |Union|
          (|Record| (|:| |svz| (|List| (|Symbol|)))
                    (|:| |sm| (|List| (|Polynomial| (|Integer|))))
                    (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
          "failed"))
        (SPROG
         ((|sizes| (|List| (|Integer|))) (|msize| (|Integer|)) (#2=#:G159 NIL)
          (|deg| NIL) (|ldeg| (|List| (|NonNegativeInteger|))) (#3=#:G157 NIL)
          (|m| NIL) (#4=#:G158 NIL) (|v| NIL) (#5=#:G156 NIL)
          (|nlmu| (|Union| (|List| (|Polynomial| (|Integer|))) "failed")))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |lvz|) (LENGTH |lm|) (QREFELT $ 32))
            (|error| "pack_modulus: #lvz ~= #lm"))
           (#6='T
            (SEQ
             (LETT |nlmu| (|MAGCDT3;pack_modulus1| |lm| |lvz| |p| $)
                   . #7=(|MAGCDT3;pack_modulus;LLIU;2|))
             (EXIT
              (COND ((QEQCAR |nlmu| 1) (CONS 1 "failed"))
                    (#6#
                     (SEQ
                      (LETT |ldeg|
                            (PROGN
                             (LETT #5# NIL . #7#)
                             (SEQ (LETT |v| NIL . #7#) (LETT #4# |lvz| . #7#)
                                  (LETT |m| NIL . #7#) (LETT #3# |lm| . #7#)
                                  G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |m| (CAR #3#) . #7#) NIL)
                                        (ATOM #4#)
                                        (PROGN (LETT |v| (CAR #4#) . #7#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS
                                           (SPADCALL |m| |v| (QREFELT $ 34))
                                           #5#)
                                          . #7#)))
                                  (LETT #3#
                                        (PROG1 (CDR #3#)
                                          (LETT #4# (CDR #4#) . #7#))
                                        . #7#)
                                  (GO G190) G191 (EXIT (NREVERSE #5#))))
                            . #7#)
                      (LETT |sizes| NIL . #7#) (LETT |msize| 1 . #7#)
                      (SEQ (LETT |deg| NIL . #7#)
                           (LETT #2# (REVERSE |ldeg|) . #7#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |deg| (CAR #2#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |msize|
                                  (SPADCALL |deg| |msize| (QREFELT $ 35))
                                  . #7#)
                            (EXIT (LETT |sizes| (CONS |msize| |sizes|) . #7#)))
                           (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (CONS 0
                             (VECTOR |lvz| (QCDR |nlmu|) |sizes|
                                     |p|))))))))))))) 

(SDEFUN |MAGCDT3;pack_exps0;SevL2IV;3|
        ((|exps| |SortedExponentVector|) (|sizes| |List| (|Integer|))
         (|ns| |Integer|) (|start| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G167 NIL) (|j| NIL) (|nstart| (|Integer|)) (#2=#:G166 NIL)
          (|i| NIL) (|deg| (|Integer|)) (|msize| (|Integer|))
          (|size1| (|Integer|)) (|do_rec| (|Boolean|))
          (|rsiz| (|List| (|Integer|))))
         (SEQ (LETT |rsiz| (CDR |sizes|) . #3=(|MAGCDT3;pack_exps0;SevL2IV;3|))
              (LETT |do_rec| (COND ((NULL |rsiz|) 'NIL) (#4='T 'T)) . #3#)
              (LETT |size1| (|SPADfirst| |sizes|) . #3#)
              (LETT |msize| (COND (|do_rec| (|SPADfirst| |rsiz|)) (#4# 1))
                    . #3#)
              (LETT |deg| (QUOTIENT2 |size1| |msize|) . #3#)
              (EXIT
               (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |deg| 1) . #3#) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (LETT |nstart| (+ |start| (* (* |ns| |i|) |msize|)) . #3#)
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |msize| 1) . #3#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |exps|
                                        (+ |nstart|
                                           (SPADCALL |j| |ns| (QREFELT $ 35)))
                                        |i|)))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (COND
                       (|do_rec|
                        (SPADCALL |exps| |rsiz| |ns| (+ |nstart| 1)
                                  (QREFELT $ 43))))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |MAGCDT3;pack_exps;2IRSev;4|
        ((|dg| . #1=(|Integer|)) (|msize| . #1#)
         (|mu| |Record| (|:| |svz| (|List| (|Symbol|)))
          (|:| |sm| (|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
         ($ |SortedExponentVector|))
        (SPROG
         ((|exps| (|SortedExponentVector|)) (|nsize| (|NonNegativeInteger|))
          (|ns| (|NonNegativeInteger|)) (|size0| (|Integer|))
          (|sizes| (|List| (|Integer|))))
         (SEQ (LETT |sizes| (QVELT |mu| 2) . #2=(|MAGCDT3;pack_exps;2IRSev;4|))
              (LETT |msize| (|SPADfirst| |sizes|) . #2#)
              (LETT |size0| (* (+ |dg| 1) |msize|) . #2#)
              (LETT |ns| (+ (LENGTH |sizes|) 1) . #2#)
              (LETT |nsize| (SPADCALL |ns| |size0| (QREFELT $ 35)) . #2#)
              (LETT |exps| (GETREFV_U32 |nsize| 0) . #2#)
              (SPADCALL |exps| (CONS |size0| |sizes|) |ns| 0 (QREFELT $ 43))
              (EXIT |exps|)))) 

(SDEFUN |MAGCDT3;repack0|
        ((|res0| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|coeffs| |U32Vector|) (|start| |Integer|) (|lv| |List| (|Symbol|))
         (|sizes| |List| (|Integer|)) ($ |Void|))
        (SPROG
         ((|j| (|Integer|)) (|nsizes| (|List| (|Integer|)))
          (|msize| (|Integer|)) (|nlv| (|List| (|Symbol|))) (|v1| (|Symbol|))
          (|cc| (|Integer|)))
         (SEQ
          (COND
           ((NULL |lv|)
            (SEQ
             (SEQ G190
                  (COND
                   ((NULL
                     (COND
                      ((SPADCALL |res0| (|spadConstant| $ 45) (QREFELT $ 46))
                       'NIL)
                      ('T 'T)))
                    (GO G191)))
                  (SEQ
                   (LETT |j| (SPADCALL |res0| (QREFELT $ 47))
                         . #1=(|MAGCDT3;repack0|))
                   (LETT |cc|
                         (SPADCALL (SPADCALL |res0| (QREFELT $ 22))
                                   (QREFELT $ 48))
                         . #1#)
                   (SETELT_U32 |coeffs| (+ |start| |j|) |cc|)
                   (EXIT (LETT |res0| (SPADCALL |res0| (QREFELT $ 49)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (QREFELT $ 50)))))
           ('T
            (SEQ (LETT |v1| (|SPADfirst| |lv|) . #1#)
                 (LETT |nlv| (CDR |lv|) . #1#)
                 (LETT |msize| (|SPADfirst| |sizes|) . #1#)
                 (LETT |nsizes| (CDR |sizes|) . #1#)
                 (EXIT
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL |res0| (|spadConstant| $ 45)
                                      (QREFELT $ 46))
                            'NIL)
                           ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |j| (SPADCALL |res0| (QREFELT $ 47)) . #1#)
                            (|MAGCDT3;repack0|
                             (SPADCALL (SPADCALL |res0| (QREFELT $ 22)) |v1|
                                       (QREFELT $ 20))
                             |coeffs| (+ |start| (* |j| |msize|)) |nlv|
                             |nsizes| $)
                            (EXIT
                             (LETT |res0| (SPADCALL |res0| (QREFELT $ 49))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))))))))) 

(SDEFUN |MAGCDT3;repack1;SupUvIRV;6|
        ((|res00| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|coeffs| |U32Vector|) (|dg| |Integer|)
         (|mu| |Record| (|:| |svz| (|List| (|Symbol|)))
          (|:| |sm| (|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
         ($ |Void|))
        (SPROG
         ((#1=#:G183 NIL) (|i| NIL) (|msize| (|Integer|))
          (|sizes| (|List| (|Integer|))) (|lv| (|List| (|Symbol|))))
         (SEQ (LETT |lv| (QVELT |mu| 0) . #2=(|MAGCDT3;repack1;SupUvIRV;6|))
              (LETT |sizes| (QVELT |mu| 2) . #2#)
              (LETT |msize| (|SPADfirst| |sizes|) . #2#)
              (SEQ (LETT |i| 0 . #2#)
                   (LETT #1# (- (* (+ |dg| 1) |msize|) 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |coeffs| |i| 0)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (|MAGCDT3;repack0| |res00| |coeffs| 0 |lv| |sizes| $))))) 

(SDEFUN |MAGCDT3;MPtoMPT;PSLRSup;7|
        ((|x| |Polynomial| (|Integer|)) (|ivx| . #1=(|Symbol|))
         (|ivz| |List| #1#)
         (|mu| |Record| (|:| |svz| (|List| (|Symbol|)))
          (|:| |sm| (|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPADCALL |x| |ivx| (QREFELT $ 20))) 

(SDEFUN |MAGCDT3;zero?;SupB;8|
        ((|x| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |Boolean|))
        (SPADCALL |x| (|spadConstant| $ 45) (QREFELT $ 46))) 

(SDEFUN |MAGCDT3;degree;SupI;9|
        ((|x| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |Integer|))
        (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |MAGCDT3;mreduction1|
        ((|x| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|p| |Integer|) ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|ux| #1=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|c| (|Polynomial| (|Integer|))) (|dx| #2=(|Integer|)) (|dm1| #2#)
          (|rm| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|um1| #1#) (|v1| (|Symbol|)) (|m1| (|Polynomial| (|Integer|)))
          (|cc| (|Integer|)))
         (SEQ
          (COND
           ((NULL |lm|)
            (SEQ
             (LETT |cc| (SPADCALL |x| (QREFELT $ 48))
                   . #3=(|MAGCDT3;mreduction1|))
             (EXIT
              (SPADCALL (SPADCALL |cc| |p| (QREFELT $ 13)) (QREFELT $ 56)))))
           ('T
            (SEQ (LETT |m1| (|SPADfirst| |lm|) . #3#)
                 (LETT |v1| (|SPADfirst| |lv|) . #3#)
                 (LETT |um1| (SPADCALL |m1| |v1| (QREFELT $ 20)) . #3#)
                 (LETT |rm| (SPADCALL |um1| (QREFELT $ 49)) . #3#)
                 (LETT |dm1| (SPADCALL |um1| (QREFELT $ 47)) . #3#)
                 (LETT |ux| (SPADCALL |x| |v1| (QREFELT $ 20)) . #3#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SEQ (LETT |dx| (SPADCALL |ux| (QREFELT $ 47)) . #3#)
                              (EXIT (COND ((< |dx| |dm1|) 'NIL) ('T 'T)))))
                        (GO G191)))
                      (SEQ (LETT |c| (SPADCALL |ux| (QREFELT $ 22)) . #3#)
                           (LETT |c|
                                 (|MAGCDT3;mreduction1| |c| (CDR |lm|)
                                  (CDR |lv|) |p| $)
                                 . #3#)
                           (EXIT
                            (LETT |ux|
                                  (SPADCALL (SPADCALL |ux| (QREFELT $ 49))
                                            (SPADCALL
                                             (SPADCALL |c| (- |dx| |dm1|)
                                                       (QREFELT $ 57))
                                             |rm| (QREFELT $ 58))
                                            (QREFELT $ 59))
                                  . #3#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |ux|
                       (SPADCALL
                        (CONS #'|MAGCDT3;mreduction1!0|
                              (VECTOR |p| |lv| $ |lm|))
                        |ux| (QREFELT $ 29))
                       . #3#)
                 (EXIT (SPADCALL |ux| |v1| (QREFELT $ 30))))))))) 

(SDEFUN |MAGCDT3;mreduction1!0| ((|c| NIL) ($$ NIL))
        (PROG (|lm| $ |lv| |p|)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;mreduction1|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|MAGCDT3;mreduction1| |c| (SPADCALL |lm| (QREFELT $ 60))
             (SPADCALL |lv| (QREFELT $ 61)) |p| $))))) 

(SDEFUN |MAGCDT3;mreduction|
        ((|x| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|mu| |Record| (|:| |svz| #1=(|List| (|Symbol|)))
          (|:| |sm| #2=(|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| #3=(|Integer|)))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG ((|p| #3#) (|lv| #1#) (|lm| #2#))
               (SEQ (LETT |lm| (QVELT |mu| 1) . #4=(|MAGCDT3;mreduction|))
                    (LETT |lv| (QVELT |mu| 0) . #4#)
                    (LETT |p| (QVELT |mu| 3) . #4#)
                    (EXIT
                     (SPADCALL
                      (CONS #'|MAGCDT3;mreduction!0| (VECTOR $ |p| |lv| |lm|))
                      |x| (QREFELT $ 29)))))) 

(SDEFUN |MAGCDT3;mreduction!0| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;mreduction|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;extended_gcd|
        ((|x| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|y| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|p| |Integer|)
         ($ |List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG
         ((#1=#:G216 NIL)
          (|t1| #2=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|t0| #3=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|#G53| #4=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|#G52| #2#) (|s1| #3#) (|s0| #2#) (|#G51| #4#) (|#G50| #3#)
          (|r1| #4#) (|r0| #4#) (|#G49| #4#) (|#G48| #4#)
          (|cm| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|c0| #5=(|Polynomial| (|Integer|))) (|dr0| #6=(|Integer|))
          (|c1| #5#) (|dr1| #6#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |r0|
                  (SPADCALL
                   (CONS #'|MAGCDT3;extended_gcd!0| (VECTOR $ |p| |lv| |lm|))
                   |x| (QREFELT $ 29))
                  . #7=(|MAGCDT3;extended_gcd|))
            (LETT |s0| (|spadConstant| $ 62) . #7#)
            (LETT |t0| (|spadConstant| $ 45) . #7#)
            (LETT |r1|
                  (SPADCALL
                   (CONS #'|MAGCDT3;extended_gcd!1| (VECTOR $ |p| |lv| |lm|))
                   |y| (QREFELT $ 29))
                  . #7#)
            (LETT |s1| (|spadConstant| $ 45) . #7#)
            (LETT |t1| (|spadConstant| $ 62) . #7#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL (LETT |dr1| (SPADCALL |r1| (QREFELT $ 47)) . #7#)
                              0 (QREFELT $ 63)))
                   (GO G191)))
                 (SEQ (LETT |c1| (SPADCALL |r1| (QREFELT $ 22)) . #7#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (>=
                               (LETT |dr0| (SPADCALL |r0| (QREFELT $ 47))
                                     . #7#)
                               |dr1|))
                             (GO G191)))
                           (SEQ
                            (LETT |c0| (SPADCALL |r0| (QREFELT $ 22)) . #7#)
                            (LETT |c0|
                                  (|MAGCDT3;mreduction1| |c0| |lm| |lv| |p| $)
                                  . #7#)
                            (LETT |cm|
                                  (SPADCALL |c0| (- |dr0| |dr1|)
                                            (QREFELT $ 57))
                                  . #7#)
                            (LETT |r0|
                                  (SPADCALL
                                   (SPADCALL |c1|
                                             (SPADCALL |r0| (QREFELT $ 49))
                                             (QREFELT $ 27))
                                   (SPADCALL |cm|
                                             (SPADCALL |r1| (QREFELT $ 49))
                                             (QREFELT $ 58))
                                   (QREFELT $ 59))
                                  . #7#)
                            (LETT |s0|
                                  (SPADCALL (SPADCALL |c1| |s0| (QREFELT $ 27))
                                            (SPADCALL |cm| |s1| (QREFELT $ 58))
                                            (QREFELT $ 59))
                                  . #7#)
                            (EXIT
                             (LETT |t0|
                                   (SPADCALL
                                    (SPADCALL |c1| |t0| (QREFELT $ 27))
                                    (SPADCALL |cm| |t1| (QREFELT $ 58))
                                    (QREFELT $ 59))
                                   . #7#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |r0|
                            (SPADCALL
                             (CONS #'|MAGCDT3;extended_gcd!2|
                                   (VECTOR $ |p| |lv| |lm|))
                             |r0| (QREFELT $ 29))
                            . #7#)
                      (LETT |s0|
                            (SPADCALL
                             (CONS #'|MAGCDT3;extended_gcd!3|
                                   (VECTOR $ |p| |lv| |lm|))
                             |s0| (QREFELT $ 29))
                            . #7#)
                      (LETT |t0|
                            (SPADCALL
                             (CONS #'|MAGCDT3;extended_gcd!4|
                                   (VECTOR $ |p| |lv| |lm|))
                             |r0| (QREFELT $ 29))
                            . #7#)
                      (PROGN
                       (LETT |#G48| |r1| . #7#)
                       (LETT |#G49| |r0| . #7#)
                       (LETT |r0| |#G48| . #7#)
                       (LETT |r1| |#G49| . #7#))
                      (PROGN
                       (LETT |#G50| |s1| . #7#)
                       (LETT |#G51| |s0| . #7#)
                       (LETT |s0| |#G50| . #7#)
                       (LETT |s1| |#G51| . #7#))
                      (EXIT
                       (PROGN
                        (LETT |#G52| |t1| . #7#)
                        (LETT |#G53| |t0| . #7#)
                        (LETT |t0| |#G52| . #7#)
                        (LETT |t1| |#G53| . #7#))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |r1| (|spadConstant| $ 45) (QREFELT $ 46))
               (PROGN (LETT #1# (LIST |r0| |s0| |t0|) . #7#) (GO #1#)))
              ('T (PROGN (LETT #1# (LIST |r1| |s1| |t1|) . #7#) (GO #1#)))))))
          #1# (EXIT #1#)))) 

(SDEFUN |MAGCDT3;extended_gcd!4| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;extended_gcd|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;extended_gcd!3| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;extended_gcd|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;extended_gcd!2| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;extended_gcd|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;extended_gcd!1| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;extended_gcd|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;extended_gcd!0| ((|c| NIL) ($$ NIL))
        (PROG (|lm| |lv| |p| $)
          (LETT |lm| (QREFELT $$ 3) . #1=(|MAGCDT3;extended_gcd|))
          (LETT |lv| (QREFELT $$ 2) . #1#)
          (LETT |p| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|MAGCDT3;mreduction1| |c| |lm| |lv| |p| $))))) 

(SDEFUN |MAGCDT3;m_inverse;PLLIU;13|
        ((|x| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|p| |Integer|) ($ |Union| (|Polynomial| (|Integer|)) "failed"))
        (SPROG
         ((|res1| (|Polynomial| (|Integer|)))
          (|ic0| (|Polynomial| (|Integer|)))
          (|ic0u| (|Union| (|Polynomial| (|Integer|)) "failed"))
          (|c0| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|ee|
           (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|ux| #1=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|um1| #1#) (|lv1| (|List| (|Symbol|)))
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (|v1| (|Symbol|))
          (|m1| (|Polynomial| (|Integer|))) (|cc| (|Integer|)))
         (SEQ
          (COND
           ((NULL |lm|)
            (SEQ
             (LETT |cc| (SPADCALL |x| (QREFELT $ 48))
                   . #2=(|MAGCDT3;m_inverse;PLLIU;13|))
             (EXIT
              (COND ((EQL |cc| 0) (CONS 1 "failed"))
                    (#3='T
                     (CONS 0
                           (SPADCALL (SPADCALL |cc| |p| (QREFELT $ 12))
                                     (QREFELT $ 56))))))))
           (#3#
            (SEQ (LETT |m1| (|SPADfirst| |lm|) . #2#)
                 (LETT |v1| (|SPADfirst| |lv|) . #2#)
                 (LETT |lm1| (CDR |lm|) . #2#) (LETT |lv1| (CDR |lv|) . #2#)
                 (LETT |um1| (SPADCALL |m1| |v1| (QREFELT $ 20)) . #2#)
                 (LETT |ux| (SPADCALL |x| |v1| (QREFELT $ 20)) . #2#)
                 (LETT |ee|
                       (|MAGCDT3;extended_gcd| |ux| |um1| |lm1| |lv1| |p| $)
                       . #2#)
                 (LETT |c0| (SPADCALL |ee| 1 (QREFELT $ 65)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |c0| (QREFELT $ 47)) 0 (QREFELT $ 63))
                    (CONS 1 "failed"))
                   (#3#
                    (SEQ
                     (LETT |ic0u|
                           (SPADCALL (SPADCALL |c0| (QREFELT $ 66)) |lm1| |lv1|
                                     |p| (QREFELT $ 26))
                           . #2#)
                     (EXIT
                      (COND ((QEQCAR |ic0u| 1) (CONS 1 "failed"))
                            (#3#
                             (SEQ (LETT |ic0| (QCDR |ic0u|) . #2#)
                                  (LETT |res1|
                                        (SPADCALL
                                         (SPADCALL |ic0|
                                                   (SPADCALL |ee| 2
                                                             (QREFELT $ 65))
                                                   (QREFELT $ 27))
                                         |v1| (QREFELT $ 30))
                                        . #2#)
                                  (EXIT
                                   (CONS 0
                                         (|MAGCDT3;mreduction1| |res1| |lm|
                                          |lv| |p| $))))))))))))))))) 

(SDEFUN |MAGCDT3;canonicalIfCan;SupRU;14|
        ((|x| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|mu| |Record| (|:| |svz| (|List| (|Symbol|)))
          (|:| |sm| (|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
         ($ |Union| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
          "failed"))
        (SPROG
         ((|rr| (|Union| (|Polynomial| (|Integer|)) "failed"))
          (|cl| (|Polynomial| (|Integer|))) (|p| (|Integer|))
          (|lv| (|List| (|Symbol|)))
          (|lm| (|List| (|Polynomial| (|Integer|)))))
         (SEQ
          (LETT |lm| (QVELT |mu| 1) . #1=(|MAGCDT3;canonicalIfCan;SupRU;14|))
          (LETT |lv| (QVELT |mu| 0) . #1#) (LETT |p| (QVELT |mu| 3) . #1#)
          (LETT |cl| (SPADCALL |x| (QREFELT $ 22)) . #1#)
          (LETT |rr| (SPADCALL |cl| |lm| |lv| |p| (QREFELT $ 26)) . #1#)
          (EXIT
           (COND ((QEQCAR |rr| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (|MAGCDT3;mreduction|
                         (SPADCALL (QCDR |rr|) |x| (QREFELT $ 27)) |mu|
                         $)))))))) 

(SDEFUN |MAGCDT3;pseudoRem;2SupRSup;15|
        ((|x| . #1=(|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (|y| . #1#)
         (|mu| |Record| (|:| |svz| (|List| (|Symbol|)))
          (|:| |sm| (|List| (|Polynomial| (|Integer|))))
          (|:| |msizes| (|List| (|Integer|))) (|:| |sp| (|Integer|)))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|cy| #2=(|Polynomial| (|Integer|)))
          (|cm| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|c2| (|Polynomial| (|Integer|))) (|ccy| #2#)
          (|cmm| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|ccx| #2#) (|c| #2#) (|j| #3=(|Integer|)) (|i| #3#))
         (SEQ
          (LETT |i| (SPADCALL |x| (QREFELT $ 47))
                . #4=(|MAGCDT3;pseudoRem;2SupRSup;15|))
          (LETT |j| (SPADCALL |y| (QREFELT $ 47)) . #4#)
          (EXIT
           (COND ((EQL |j| 0) (|spadConstant| $ 45)) ((< |i| |j|) |x|)
                 ('T
                  (SEQ (LETT |cy| (SPADCALL |y| (QREFELT $ 22)) . #4#)
                       (LETT |c| (SPADCALL |x| (QREFELT $ 22)) . #4#)
                       (LETT |cm|
                             (SPADCALL |c|
                                       (SPADCALL (|spadConstant| $ 39)
                                                 (- |i| |j|) (QREFELT $ 57))
                                       (QREFELT $ 27))
                             . #4#)
                       (COND
                        ((SPADCALL |i| |j| (QREFELT $ 63))
                         (SEQ
                          (LETT |ccx|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 49))
                                          (QREFELT $ 22))
                                . #4#)
                          (LETT |cmm|
                                (SPADCALL (|spadConstant| $ 39)
                                          (- (- |i| |j|) 1) (QREFELT $ 57))
                                . #4#)
                          (LETT |ccy|
                                (SPADCALL (SPADCALL |y| (QREFELT $ 49))
                                          (QREFELT $ 22))
                                . #4#)
                          (LETT |c2|
                                (SPADCALL (SPADCALL |cy| |ccx| (QREFELT $ 69))
                                          (SPADCALL |c| |ccy| (QREFELT $ 69))
                                          (QREFELT $ 70))
                                . #4#)
                          (LETT |cm|
                                (|MAGCDT3;mreduction|
                                 (SPADCALL (SPADCALL |cy| |cm| (QREFELT $ 27))
                                           (SPADCALL |c2| |cmm| (QREFELT $ 27))
                                           (QREFELT $ 71))
                                 |mu| $)
                                . #4#)
                          (EXIT
                           (LETT |cy|
                                 (|MAGCDT3;mreduction1|
                                  (SPADCALL |cy| |cy| (QREFELT $ 69))
                                  (QVELT |mu| 1) (QVELT |mu| 0) (QVELT |mu| 3)
                                  $)
                                 . #4#)))))
                       (LETT |x|
                             (SPADCALL (SPADCALL |cy| |x| (QREFELT $ 27))
                                       (SPADCALL |cm| |y| (QREFELT $ 58))
                                       (QREFELT $ 59))
                             . #4#)
                       (EXIT (|MAGCDT3;mreduction| |x| |mu| $))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcdTools3;|)) 

(DEFUN |ModularAlgebraicGcdTools3| ()
  (SPROG NIL
         (PROG (#1=#:G248)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularAlgebraicGcdTools3|)
                    . #2=(|ModularAlgebraicGcdTools3|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularAlgebraicGcdTools3|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ModularAlgebraicGcdTools3;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ModularAlgebraicGcdTools3|)))))))))) 

(DEFUN |ModularAlgebraicGcdTools3;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularAlgebraicGcdTools3|)
                . #1=(|ModularAlgebraicGcdTools3|))
          (LETT $ (GETREFV 73) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcdTools3| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularAlgebraicGcdTools3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 9)
              (|Polynomial| 9) (0 . |univariate|) (|Integer|)
              (5 . |leadingCoefficient|) (10 . |Zero|) (14 . |invmod|)
              (20 . |positiveRemainder|) (26 . *) (|Mapping| 9 9) (32 . |map|)
              (|Symbol|) (38 . |multivariate|) (|SparseUnivariatePolynomial| $)
              (44 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (50 . |leadingCoefficient|) (|Union| 7 '"failed") (|List| 7)
              (|List| 17) |MAGCDT3;m_inverse;PLLIU;13| (55 . *) (|Mapping| 7 7)
              (61 . |map|) (67 . |multivariate|) (|Boolean|) (73 . ~=)
              (|NonNegativeInteger|) (79 . |degree|) (85 . *)
              (|Record| (|:| |svz| 25) (|:| |sm| 24) (|:| |msizes| 42)
                        (|:| |sp| 9))
              (|Union| 36 '"failed") |MAGCDT3;pack_modulus;LLIU;2| (91 . |One|)
              (|Void|) (|SortedExponentVector|) (|List| 9)
              |MAGCDT3;pack_exps0;SevL2IV;3| |MAGCDT3;pack_exps;2IRSev;4|
              (95 . |Zero|) (99 . =) |MAGCDT3;degree;SupI;9| (105 . |ground|)
              (110 . |reductum|) (115 . |void|) (|U32Vector|)
              |MAGCDT3;repack1;SupUvIRV;6| |MAGCDT3;MPtoMPT;PSLRSup;7|
              |MAGCDT3;zero?;SupB;8| (119 . |degree|) (124 . |coerce|)
              (129 . |monomial|) (135 . *) (141 . -) (147 . |rest|)
              (152 . |rest|) (157 . |One|) (161 . >) (|List| 21) (167 . |elt|)
              (173 . |ground|) (|Union| 21 '"failed")
              |MAGCDT3;canonicalIfCan;SupRU;14| (178 . *) (184 . -) (190 . +)
              |MAGCDT3;pseudoRem;2SupRSup;15|)
           '#(|zero?| 196 |repack1| 201 |pseudoRem| 209 |pack_modulus| 216
              |pack_exps0| 223 |pack_exps| 231 |m_inverse| 238 |degree| 246
              |canonicalIfCan| 251 |MPtoMPT| 257)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|ModularAlgebraicGcdOperations| 21 36))
                             (|makeByteWordVec2| 72
                                                 '(1 7 6 0 8 1 6 9 0 10 0 7 0
                                                   11 2 9 0 0 0 12 2 9 0 0 0 13
                                                   2 6 0 9 0 14 2 6 0 15 0 16 2
                                                   7 0 6 17 18 2 7 19 0 17 20 1
                                                   21 7 0 22 2 21 0 7 0 27 2 21
                                                   0 28 0 29 2 7 0 19 17 30 2 9
                                                   31 0 0 32 2 7 33 0 17 34 2 9
                                                   0 33 0 35 0 7 0 39 0 21 0 45
                                                   2 21 31 0 0 46 1 7 9 0 48 1
                                                   21 0 0 49 0 40 0 50 1 21 33
                                                   0 55 1 7 0 9 56 2 21 0 7 33
                                                   57 2 21 0 0 0 58 2 21 0 0 0
                                                   59 1 24 0 0 60 1 25 0 0 61 0
                                                   21 0 62 2 9 31 0 0 63 2 64
                                                   21 0 9 65 1 21 7 0 66 2 7 0
                                                   0 0 69 2 7 0 0 0 70 2 21 0 0
                                                   0 71 1 0 31 21 54 4 0 40 21
                                                   51 9 36 52 3 0 21 21 21 36
                                                   72 3 0 37 24 25 9 38 4 0 40
                                                   41 42 9 9 43 3 0 41 9 9 36
                                                   44 4 0 23 7 24 25 9 26 1 0 9
                                                   21 47 2 0 67 21 36 68 4 0 21
                                                   7 17 25 36 53)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularAlgebraicGcdTools3| 'NILADIC T) 
