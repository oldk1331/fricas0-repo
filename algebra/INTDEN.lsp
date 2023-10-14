
(SDEFUN |INTDEN;MP_to_UP|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|up1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 11)) |INTDEN;MP_to_UP|)
              (EXIT (SPADCALL (ELT $ 13) |up1| (QREFELT $ 18)))))) 

(SDEFUN |INTDEN;factor;SmpF;2|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
        (SPADCALL |p| (QREFELT $ 22))) 

(PUT '|INTDEN;factor;SmpF;3| '|SPADreplace|
     '(XLAM (|p|) (|error| "No factor for polynomials over R"))) 

(SDEFUN |INTDEN;factor;SmpF;3|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
        (|error| "No factor for polynomials over R")) 

(SDEFUN |INTDEN;li_factors|
        ((|df| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                    (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
          (|f2| (|SparseUnivariatePolynomial| F)) (|k2| (F)) (#1=#:G221 NIL)
          (|c| NIL) (#2=#:G222 NIL) (|ki| NIL) (#3=#:G220 NIL) (|u1| (F))
          (#4=#:G218 NIL) (|ui| NIL) (#5=#:G219 NIL) (#6=#:G217 NIL)
          (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #7#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| F)) (#8=#:G216 NIL) (|kk| NIL) (#9=#:G215 NIL)
          (|dvvec| (|Vector| F)) (#10=#:G214 NIL) (#11=#:G213 NIL)
          (|vlst| (|List| F)) (#12=#:G212 NIL) (#13=#:G211 NIL) (|rsum| (F))
          (|deg1| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| F)) (#14=#:G210 NIL) (|fac| NIL)
          (|u0| (F)) (|nk| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record|
             (|:| |factor| (|SparseMultivariatePolynomial| R (|Kernel| F)))
             (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
                . #15=(|INTDEN;li_factors|))
          (LETT |res| NIL . #15#)
          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #15#)
          (LETT |vlst| NIL . #15#) (LETT |nk| (LENGTH |lk|) . #15#)
          (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
                . #15#)
          (SEQ (LETT |fac| NIL . #15#) (LETT #14# |lfac| . #15#) G190
               (COND
                ((OR (ATOM #14#) (PROGN (LETT |fac| (CAR #14#) . #15#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #15#)
                    (LETT |f1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f1| (QREFELT $ 33))
                                     (QREFELT $ 34))
                           |f1| (QREFELT $ 35))
                          . #15#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #15#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ((SPADCALL
                             (CONS #'|INTDEN;li_factors!0| (VECTOR $ |x|))
                             (SPADCALL |f1| (QREFELT $ 44)) (QREFELT $ 46))
                            (LETT |res|
                                  (CONS
                                   (VECTOR |f1| |f1| |u0| (|spadConstant| $ 39)
                                           1)
                                   |res|)
                                  . #15#))
                           ((NULL |lk|) "iterate")
                           ('T
                            (SEQ
                             (LETT |rsum|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |deg1| (QREFELT $ 47))
                                              (QREFELT $ 34))
                                    (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 50))
                                    (QREFELT $ 51))
                                   . #15#)
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 52))
                               (LETT |f2|
                                     (SPADCALL |f1| |dummy|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 49)
                                                          1 (QREFELT $ 53))
                                                (SPADCALL |rsum|
                                                          (QREFELT $ 54))
                                                (QREFELT $ 55))
                                               (QREFELT $ 56))
                                     . #15#)))
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 52))
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (CONS #'|INTDEN;li_factors!1|
                                         (VECTOR $ |x|))
                                   (SPADCALL |f2| (QREFELT $ 44))
                                   (QREFELT $ 46)))
                                 (EXIT "iterate")))))
                             (COND
                              ((NULL |vlst|)
                               (SEQ
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #13# NIL . #15#)
                                       (SEQ (LETT |kk| NIL . #15#)
                                            (LETT #12# |lk| . #15#) G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #12#)
                                                         . #15#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #13#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          57))
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          59)))
                                                      ('T
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           30))
                                                        1 (QREFELT $ 32))))
                                                     #13#)
                                                    . #15#)))
                                            (LETT #12# (CDR #12#) . #15#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #13#))))
                                      . #15#)
                                (LETT |dvvec|
                                      (SPADCALL
                                       (PROGN
                                        (LETT #11# NIL . #15#)
                                        (SEQ (LETT |c| NIL . #15#)
                                             (LETT #10# |vlst| . #15#) G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |c| (CAR #10#)
                                                          . #15#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #11#
                                                     (CONS
                                                      (SPADCALL |c| |x|
                                                                (QREFELT $ 41))
                                                      #11#)
                                                     . #15#)))
                                             (LETT #10# (CDR #10#) . #15#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #11#))))
                                       (QREFELT $ 61))
                                      . #15#)
                                (EXIT
                                 (LETT |ulst|
                                       (PROGN
                                        (LETT #9# NIL . #15#)
                                        (SEQ (LETT |kk| NIL . #15#)
                                             (LETT #8# |lk| . #15#) G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |kk| (CAR #8#)
                                                          . #15#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #9#
                                                     (CONS
                                                      (COND
                                                       ((SPADCALL |kk| '|log|
                                                                  (QREFELT $
                                                                           57))
                                                        (SPADCALL
                                                         (SPADCALL |kk|
                                                                   (QREFELT $
                                                                            30))
                                                         1 (QREFELT $ 32)))
                                                       ('T
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           59))))
                                                      #9#)
                                                     . #15#)))
                                             (LETT #8# (CDR #8#) . #15#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #9#))))
                                       . #15#)))))
                             (LETT |su|
                                   (SPADCALL |dvvec|
                                             (SPADCALL |rsum| |x|
                                                       (QREFELT $ 41))
                                             (QREFELT $ 64))
                                   . #15#)
                             (EXIT
                              (COND ((QEQCAR |su| 1) "iterate")
                                    ('T
                                     (SEQ (LETT |sv| (QCDR |su|) . #15#)
                                          (LETT |cd|
                                                (SPADCALL |sv| (QREFELT $ 68))
                                                . #15#)
                                          (LETT |d| (QCDR |cd|) . #15#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |d| 1 (QREFELT $ 69))
                                             "iterate")
                                            ('T
                                             (SEQ
                                              (LETT |u1|
                                                    (SPADCALL (ELT $ 51)
                                                              (PROGN
                                                               (LETT #6# NIL
                                                                     . #15#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #15#)
                                                                (LETT #5#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #15#)
                                                                (LETT |ui| NIL
                                                                      . #15#)
                                                                (LETT #4#
                                                                      |ulst|
                                                                      . #15#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #4#)
                                                                   (PROGN
                                                                    (LETT |ui|
                                                                          (CAR
                                                                           #4#)
                                                                          . #15#)
                                                                    NIL)
                                                                   (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #5#)
                                                                          . #15#)
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #6#
                                                                        (CONS
                                                                         (SPADCALL
                                                                          |ui|
                                                                          |ki|
                                                                          (QREFELT
                                                                           $
                                                                           70))
                                                                         #6#)
                                                                        . #15#)))
                                                                (LETT #4#
                                                                      (PROG1
                                                                          (CDR
                                                                           #4#)
                                                                        (LETT
                                                                         #5#
                                                                         (CDR
                                                                          #5#)
                                                                         . #15#))
                                                                      . #15#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #6#))))
                                                              (QREFELT $ 72))
                                                    . #15#)
                                              (LETT |k2|
                                                    (SPADCALL (ELT $ 73)
                                                              (PROGN
                                                               (LETT #3# NIL
                                                                     . #15#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #15#)
                                                                (LETT #2#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #15#)
                                                                (LETT |c| NIL
                                                                      . #15#)
                                                                (LETT #1#
                                                                      |vlst|
                                                                      . #15#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #1#)
                                                                   (PROGN
                                                                    (LETT |c|
                                                                          (CAR
                                                                           #1#)
                                                                          . #15#)
                                                                    NIL)
                                                                   (ATOM #2#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #2#)
                                                                          . #15#)
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #3#
                                                                        (CONS
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |ki|
                                                                            (QREFELT
                                                                             $
                                                                             74))
                                                                           (QREFELT
                                                                            $
                                                                            75))
                                                                          |c|
                                                                          (QREFELT
                                                                           $
                                                                           51))
                                                                         #3#)
                                                                        . #15#)))
                                                                (LETT #1#
                                                                      (PROG1
                                                                          (CDR
                                                                           #1#)
                                                                        (LETT
                                                                         #2#
                                                                         (CDR
                                                                          #2#)
                                                                         . #15#))
                                                                      . #15#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #3#))))
                                                              (QREFELT $ 72))
                                                    . #15#)
                                              (LETT |f2|
                                                    (SPADCALL |f1| |dummy|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 49)
                                                                1
                                                                (QREFELT $ 53))
                                                               (SPADCALL |k2|
                                                                         (QREFELT
                                                                          $
                                                                          54))
                                                               (QREFELT $ 55))
                                                              (QREFELT $ 56))
                                                    . #15#)
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (CONS #'|INTDEN;li_factors!2|
                                                        (VECTOR $ |x|))
                                                  (SPADCALL |f2|
                                                            (QREFELT $ 44))
                                                  (QREFELT $ 46)))
                                                (EXIT
                                                 (|error| "Impossible 1"))))
                                              (EXIT
                                               (LETT |res|
                                                     (CONS
                                                      (VECTOR |f1| |f2|
                                                              (SPADCALL
                                                               (SPADCALL |u0|
                                                                         |d|
                                                                         (QREFELT
                                                                          $
                                                                          70))
                                                               |u1|
                                                               (QREFELT $ 51))
                                                              |k2| |d|)
                                                      |res|)
                                                     . #15#)))))))))))))))
               (LETT #14# (CDR #14#) . #15#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;li_factors!2| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 39)
                      (QREFELT $ 43)))))) 

(SDEFUN |INTDEN;li_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 39)
                      (QREFELT $ 43)))))) 

(SDEFUN |INTDEN;li_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 39)
                      (QREFELT $ 43)))))) 

(SDEFUN |INTDEN;poly_factors|
        ((|df| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                    (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|)))))
          (|f2| (|SparseUnivariatePolynomial| F)) (|k2| (F)) (#1=#:G289 NIL)
          (|c| NIL) (#2=#:G290 NIL) (|ki| NIL) (#3=#:G288 NIL) (|u1| (F))
          (#4=#:G286 NIL) (|ui| NIL) (#5=#:G287 NIL) (#6=#:G285 NIL)
          (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #7#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| F)) (#8=#:G284 NIL) (|kk| NIL) (#9=#:G283 NIL)
          (|dvvec| (|Vector| F)) (#10=#:G282 NIL) (#11=#:G281 NIL)
          (|vlst| (|List| F)) (#12=#:G280 NIL) (#13=#:G279 NIL) (|lprod| (F))
          (|f1| (|SparseUnivariatePolynomial| F)) (|tc| (F))
          (|deg1| (|NonNegativeInteger|)) (#14=#:G278 NIL) (|fac| NIL)
          (|v0| (F)) (|nk| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record|
             (|:| |factor| (|SparseMultivariatePolynomial| R (|Kernel| F)))
             (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
                . #15=(|INTDEN;poly_factors|))
          (LETT |res| NIL . #15#)
          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #15#)
          (LETT |vlst| NIL . #15#) (LETT |nk| (LENGTH |lk|) . #15#)
          (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
                . #15#)
          (SEQ (LETT |fac| NIL . #15#) (LETT #14# |lfac| . #15#) G190
               (COND
                ((OR (ATOM #14#) (PROGN (LETT |fac| (CAR #14#) . #15#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |f1|
                      (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #15#)
                      . #15#)
                (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #15#)
                (EXIT
                 (COND ((EQL |deg1| 0) "iterate")
                       ('T
                        (SEQ
                         (LETT |tc| (SPADCALL |f1| 0 (QREFELT $ 50)) . #15#)
                         (EXIT
                          (COND
                           ((SPADCALL |tc| (|spadConstant| $ 39)
                                      (QREFELT $ 43))
                            "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL (SPADCALL |tc| (QREFELT $ 34))
                                             |f1| (QREFELT $ 35))
                                   . #15#)
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (CONS #'|INTDEN;poly_factors!0|
                                       (VECTOR $ |x|))
                                 (SPADCALL |f1| (QREFELT $ 44)) (QREFELT $ 46))
                                (LETT |res|
                                      (CONS
                                       (VECTOR |f1| |f1| (|spadConstant| $ 49)
                                               |v0| 1)
                                       |res|)
                                      . #15#))
                               ((NULL |lk|) "iterate")
                               ('T
                                (SEQ
                                 (LETT |lprod| (SPADCALL |f1| (QREFELT $ 33))
                                       . #15#)
                                 (COND
                                  ((NULL |vlst|)
                                   (SEQ
                                    (LETT |vlst|
                                          (PROGN
                                           (LETT #13# NIL . #15#)
                                           (SEQ (LETT |kk| NIL . #15#)
                                                (LETT #12# |lk| . #15#) G190
                                                (COND
                                                 ((OR (ATOM #12#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #12#)
                                                             . #15#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #13#
                                                        (CONS
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|log|
                                                                     (QREFELT $
                                                                              57))
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              59)))
                                                          ('T
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 30))
                                                            1 (QREFELT $ 32))))
                                                         #13#)
                                                        . #15#)))
                                                (LETT #12# (CDR #12#) . #15#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #13#))))
                                          . #15#)
                                    (LETT |dvvec|
                                          (SPADCALL
                                           (PROGN
                                            (LETT #11# NIL . #15#)
                                            (SEQ (LETT |c| NIL . #15#)
                                                 (LETT #10# |vlst| . #15#) G190
                                                 (COND
                                                  ((OR (ATOM #10#)
                                                       (PROGN
                                                        (LETT |c| (CAR #10#)
                                                              . #15#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #11#
                                                         (CONS
                                                          (SPADCALL |c| |x|
                                                                    (QREFELT $
                                                                             41))
                                                          #11#)
                                                         . #15#)))
                                                 (LETT #10# (CDR #10#) . #15#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #11#))))
                                           (QREFELT $ 61))
                                          . #15#)
                                    (EXIT
                                     (LETT |ulst|
                                           (PROGN
                                            (LETT #9# NIL . #15#)
                                            (SEQ (LETT |kk| NIL . #15#)
                                                 (LETT #8# |lk| . #15#) G190
                                                 (COND
                                                  ((OR (ATOM #8#)
                                                       (PROGN
                                                        (LETT |kk| (CAR #8#)
                                                              . #15#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #9#
                                                         (CONS
                                                          (COND
                                                           ((SPADCALL |kk|
                                                                      '|log|
                                                                      (QREFELT
                                                                       $ 57))
                                                            (SPADCALL
                                                             (SPADCALL |kk|
                                                                       (QREFELT
                                                                        $ 30))
                                                             1 (QREFELT $ 32)))
                                                           ('T
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 59))))
                                                          #9#)
                                                         . #15#)))
                                                 (LETT #8# (CDR #8#) . #15#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #9#))))
                                           . #15#)))))
                                 (LETT |su|
                                       (SPADCALL |dvvec|
                                                 (SPADCALL
                                                  (SPADCALL |lprod| |x|
                                                            (QREFELT $ 41))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |deg1|
                                                              (QREFELT $ 74))
                                                    (QREFELT $ 75))
                                                   |lprod| (QREFELT $ 51))
                                                  (QREFELT $ 76))
                                                 (QREFELT $ 64))
                                       . #15#)
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) "iterate")
                                        ('T
                                         (SEQ (LETT |sv| (QCDR |su|) . #15#)
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT $ 68))
                                                    . #15#)
                                              (LETT |d| (QCDR |cd|) . #15#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT $ 69))
                                                 "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT $ 51)
                                                                  (PROGN
                                                                   (LETT #6#
                                                                         NIL
                                                                         . #15#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #15#)
                                                                    (LETT #5#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #15#)
                                                                    (LETT |ui|
                                                                          NIL
                                                                          . #15#)
                                                                    (LETT #4#
                                                                          |ulst|
                                                                          . #15#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #4#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ui|
                                                                         (CAR
                                                                          #4#)
                                                                         . #15#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #5#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #5#)
                                                                         . #15#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #6#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              |ui|
                                                                              |ki|
                                                                              (QREFELT
                                                                               $
                                                                               70))
                                                                             #6#)
                                                                            . #15#)))
                                                                    (LETT #4#
                                                                          (PROG1
                                                                              (CDR
                                                                               #4#)
                                                                            (LETT
                                                                             #5#
                                                                             (CDR
                                                                              #5#)
                                                                             . #15#))
                                                                          . #15#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #6#))))
                                                                  (QREFELT $
                                                                           72))
                                                        . #15#)
                                                  (LETT |k2|
                                                        (SPADCALL (ELT $ 73)
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         NIL
                                                                         . #15#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #15#)
                                                                    (LETT #2#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #15#)
                                                                    (LETT |c|
                                                                          NIL
                                                                          . #15#)
                                                                    (LETT #1#
                                                                          |vlst|
                                                                          . #15#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #1#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |c|
                                                                         (CAR
                                                                          #1#)
                                                                         . #15#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #2#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #2#)
                                                                         . #15#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #3#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |ki|
                                                                                (QREFELT
                                                                                 $
                                                                                 74))
                                                                               (QREFELT
                                                                                $
                                                                                75))
                                                                              |c|
                                                                              (QREFELT
                                                                               $
                                                                               51))
                                                                             #3#)
                                                                            . #15#)))
                                                                    (LETT #1#
                                                                          (PROG1
                                                                              (CDR
                                                                               #1#)
                                                                            (LETT
                                                                             #2#
                                                                             (CDR
                                                                              #2#)
                                                                             . #15#))
                                                                          . #15#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #3#))))
                                                                  (QREFELT $
                                                                           72))
                                                        . #15#)
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT $
                                                                             34))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 49)
                                                                    1
                                                                    (QREFELT $
                                                                             53))
                                                                   (QREFELT $
                                                                            35))
                                                                  (QREFELT $
                                                                           56))
                                                        . #15#)
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR $ |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT $ 44))
                                                      (QREFELT $ 46)))
                                                    (EXIT "iterate")))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT $
                                                                            73))
                                                                  1)
                                                          |res|)
                                                         . #15#)))))))))))))))))))))))
               (LETT #14# (CDR #14#) . #15#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;poly_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 39)
                      (QREFELT $ 43)))))) 

(SDEFUN |INTDEN;poly_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 39)
                      (QREFELT $ 43)))))) 

(SDEFUN |INTDEN;decompose1|
        ((|nn| |SparseUnivariatePolynomial| F)
         (|elden| |SparseUnivariatePolynomial| F)
         (|lidens| |List| (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|res| (|List| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0 (QREFELT $ 52))
                  (LETT |lidens| (CONS |elden| |lidens|)
                        . #1=(|INTDEN;decompose1|)))
                 ((SPADCALL |elden| (|spadConstant| $ 77) (QREFELT $ 78))
                  (|error| "Impossible 5")))
                (LETT |res| (SPADCALL |nn| |lidens| (QREFELT $ 81)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0
                             (QREFELT $ 52))
                   |res|)
                  ('T (CONS (|spadConstant| $ 82) |res|))))))) 

(SDEFUN |INTDEN;p_power_in_q|
        ((|p| |SparseMultivariatePolynomial| F (|Kernel| F))
         (|q| |SparseMultivariatePolynomial| F (|Kernel| F)) ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (#1=#:G296 NIL)
          (|qq|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F))
                    #2="failed")))
         (SEQ (LETT |res| 0 . #3=(|INTDEN;p_power_in_q|))
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR
                       (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 85)) . #3#) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |q|
                          (PROG2 (LETT #1# |qq| . #3#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|SparseMultivariatePolynomial|
                                             (QREFELT $ 7)
                                             (|Kernel| (QREFELT $ 7)))
                                            (|Union|
                                             (|SparseMultivariatePolynomial|
                                              (QREFELT $ 7)
                                              (|Kernel| (QREFELT $ 7)))
                                             #2#)
                                            #1#))
                          . #3#)
                    (EXIT (LETT |res| (+ |res| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTDEN;MP_to_MPF|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|lk| |List| (|Kernel| F))
         ($ |SparseMultivariatePolynomial| F (|Kernel| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|INTDEN;MP_to_MPF!0| (VECTOR $ |lk|))
                         (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 95)))) 

(SDEFUN |INTDEN;MP_to_MPF!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 75)) (QREFELT $ 91))) 

(SDEFUN |INTDEN;MP_to_MPF!0| ((|k| NIL) ($$ NIL))
        (PROG (|lk| $)
          (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |k| |lk| (QREFELT $ 87))
              (SPADCALL (|spadConstant| $ 88) |k| (|spadConstant| $ 89)
                        (QREFELT $ 90)))
             ('T (SPADCALL (SPADCALL |k| (QREFELT $ 59)) (QREFELT $ 91)))))))) 

(SDEFUN |INTDEN;solve_u;2FSU;9|
        ((|f1| F) (|u| F) (|x| |Symbol|)
         ($ |Union| (|List| (|List| F)) "failed"))
        (SPROG
         ((#1=#:G364 NIL) (|c| NIL) (|j| NIL) (#2=#:G363 NIL) (#3=#:G353 NIL)
          (#4=#:G362 NIL) (|sl| (|List| F))
          (|sl0| (|Union| (|List| F) "failed")) (|eqsl| (|List| F))
          (|eqs| (|SparseMultivariatePolynomial| F (|Kernel| F)))
          (#5=#:G360 NIL) (|p1| NIL) (#6=#:G361 NIL) (|coef| NIL)
          (|lpow| (|List| (|SparseMultivariatePolynomial| F (|Kernel| F))))
          (|pp| #7=(|SparseMultivariatePolynomial| F (|Kernel| F)))
          (#8=#:G359 NIL) (|lpow0| (|List| #7#)) (|coefs| (|List| (|Symbol|)))
          (#9=#:G358 NIL)
          (|nf1| #10=(|SparseMultivariatePolynomial| F (|Kernel| F)))
          (|cc| (F)) (|ccru| (|Union| F "failed"))
          (|ccu|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F)) "failed"))
          (|dup| #7#) (#11=#:G324 NIL) (|nup| #7#) (#12=#:G322 NIL)
          (|m| (|Integer|)) (|n| (|Integer|))
          (|qu| (|Union| (|NonNegativeInteger|) "failed"))
          (|degdu| #13=(|NonNegativeInteger|)) (|degnu| #13#) (|degdf| #13#)
          (|degnf| #13#) (|du| #10#) (|nu| #10#) (|df1| #10#)
          (|vk2| (|List| #14=(|Kernel| F))) (#15=#:G357 NIL) (|k| NIL)
          (#16=#:G356 NIL) (|k1| (|Kernel| F)) (|vk| (|List| #14#))
          (#17=#:G355 NIL) (#18=#:G354 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |vk|
                  (PROGN
                   (LETT #18# NIL . #19=(|INTDEN;solve_u;2FSU;9|))
                   (SEQ (LETT |k| NIL . #19#)
                        (LETT #17# (SPADCALL |u| (QREFELT $ 97)) . #19#) G190
                        (COND
                         ((OR (ATOM #17#)
                              (PROGN (LETT |k| (CAR #17#) . #19#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 59)) |x|
                                       (QREFELT $ 41))
                             (|spadConstant| $ 39) (QREFELT $ 98))
                            (LETT #18# (CONS |k| #18#) . #19#)))))
                        (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                        (EXIT (NREVERSE #18#))))
                  . #19#)
            (EXIT
             (COND ((NULL |vk|) (|error| "solve_u: constant u"))
                   (#20='T
                    (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 99)) . #19#)
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 41))
                                      (|spadConstant| $ 39) (QREFELT $ 43))
                            (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 39)))))
                           (#20#
                            (SEQ
                             (LETT |vk2|
                                   (PROGN
                                    (LETT #16# NIL . #19#)
                                    (SEQ (LETT |k| NIL . #19#)
                                         (LETT #15#
                                               (SPADCALL |f1| (QREFELT $ 97))
                                               . #19#)
                                         G190
                                         (COND
                                          ((OR (ATOM #15#)
                                               (PROGN
                                                (LETT |k| (CAR #15#) . #19#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |k| (QREFELT $ 59))
                                               |x| (QREFELT $ 41))
                                              (|spadConstant| $ 39)
                                              (QREFELT $ 98))
                                             (LETT #16# (CONS |k| #16#)
                                                   . #19#)))))
                                         (LETT #15# (CDR #15#) . #19#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #16#))))
                                   . #19#)
                             (COND
                              ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 100)))
                               (COND
                                ((NULL
                                  (NULL (SPADCALL |vk| |vk2| (QREFELT $ 100))))
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (CONS 1 #21="failed") . #19#)
                                   (GO #22=#:G352))))))
                              (#20#
                               (EXIT
                                (PROGN
                                 (LETT #3# (CONS 1 #21#) . #19#)
                                 (GO #22#)))))
                             (LETT |nf1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 101)) |vk| $)
                                   . #19#)
                             (LETT |df1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 102)) |vk| $)
                                   . #19#)
                             (LETT |nu|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 101)) |vk| $)
                                   . #19#)
                             (LETT |du|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 102)) |vk| $)
                                   . #19#)
                             (LETT |degnf|
                                   (SPADCALL |nf1| |k1| (QREFELT $ 103))
                                   . #19#)
                             (LETT |degdf|
                                   (SPADCALL |df1| |k1| (QREFELT $ 103))
                                   . #19#)
                             (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 103))
                                   . #19#)
                             (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 103))
                                   . #19#)
                             (COND
                              ((EQL |degdu| 0)
                               (SEQ
                                (LETT |qu|
                                      (SPADCALL |degdf| |degnu|
                                                (QREFELT $ 104))
                                      . #19#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |qu| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed") . #19#)
                                    (GO #22#)))
                                  (#20#
                                   (SEQ (LETT |n| (QCDR |qu|) . #19#)
                                        (LETT |qu|
                                              (SPADCALL |degnf| |degnu|
                                                        (QREFELT $ 104))
                                              . #19#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |qu| 1)
                                           (PROGN
                                            (LETT #3# (CONS 1 "failed") . #19#)
                                            (GO #22#)))
                                          (#20#
                                           (LETT |m| (- (QCDR |qu|) |n|)
                                                 . #19#))))))))))
                              ((EQL |degnu| 0)
                               (SEQ
                                (LETT |qu|
                                      (SPADCALL |degdf| |degdu|
                                                (QREFELT $ 104))
                                      . #19#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |qu| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed") . #19#)
                                    (GO #22#)))
                                  (#20#
                                   (SEQ (LETT |m| (QCDR |qu|) . #19#)
                                        (LETT |qu|
                                              (SPADCALL |degnf| |degdu|
                                                        (QREFELT $ 104))
                                              . #19#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |qu| 1)
                                           (PROGN
                                            (LETT #3# (CONS 1 "failed") . #19#)
                                            (GO #22#)))
                                          (#20#
                                           (LETT |n| (- (QCDR |qu|) |m|)
                                                 . #19#))))))))))
                              (#20#
                               (SEQ
                                (LETT |m| (|INTDEN;p_power_in_q| |du| |df1| $)
                                      . #19#)
                                (LETT |n| (|INTDEN;p_power_in_q| |nu| |df1| $)
                                      . #19#)
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (+ (* |m| |degdu|) (* |n| |degnu|)) |degdf|
                                    (QREFELT $ 69))
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed") . #19#)
                                    (GO #22#))))))))
                             (LETT |n| (MAX |n| 0) . #19#)
                             (LETT |m| (MAX |m| 0) . #19#)
                             (LETT |nup|
                                   (COND
                                    ((SPADCALL |n| 0 (QREFELT $ 105))
                                     (SPADCALL |nu|
                                               (PROG1 (LETT #12# |n| . #19#)
                                                 (|check_subtype2| (>= #12# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #12#))
                                               (QREFELT $ 106)))
                                    (#20# (|spadConstant| $ 88)))
                                   . #19#)
                             (LETT |dup|
                                   (COND
                                    ((SPADCALL |m| 0 (QREFELT $ 105))
                                     (SPADCALL |du|
                                               (PROG1 (LETT #11# |m| . #19#)
                                                 (|check_subtype2| (>= #11# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #11#))
                                               (QREFELT $ 106)))
                                    (#20# (|spadConstant| $ 88)))
                                   . #19#)
                             (LETT |ccu|
                                   (SPADCALL |df1|
                                             (SPADCALL |dup| |nup|
                                                       (QREFELT $ 107))
                                             (QREFELT $ 85))
                                   . #19#)
                             (EXIT
                              (COND
                               ((QEQCAR |ccu| 1)
                                (PROGN
                                 (LETT #3# (CONS 1 "failed") . #19#)
                                 (GO #22#)))
                               (#20#
                                (SEQ
                                 (LETT |ccru|
                                       (SPADCALL (QCDR |ccu|) (QREFELT $ 109))
                                       . #19#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ccru| 1)
                                    (PROGN
                                     (LETT #3# (CONS 1 "failed") . #19#)
                                     (GO #22#)))
                                   (#20#
                                    (SEQ (LETT |cc| (QCDR |ccru|) . #19#)
                                         (LETT |nf1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 49)
                                                          |cc| (QREFELT $ 76))
                                                |nf1| (QREFELT $ 112))
                                               . #19#)
                                         (LETT |coefs|
                                               (PROGN
                                                (LETT #9# NIL . #19#)
                                                (SEQ (LETT |j| (- |n|) . #19#)
                                                     G190
                                                     (COND
                                                      ((> |j| |m|) (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #9#
                                                             (CONS
                                                              (SPADCALL
                                                               (QREFELT $ 113))
                                                              #9#)
                                                             . #19#)))
                                                     (LETT |j| (+ |j| 1)
                                                           . #19#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               . #19#)
                                         (LETT |eqs| |nf1| . #19#)
                                         (LETT |pp| (|spadConstant| $ 88)
                                               . #19#)
                                         (LETT |lpow0| (LIST |pp|) . #19#)
                                         (SEQ (LETT |j| (- 1 |n|) . #19#) G190
                                              (COND ((> |j| |m|) (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |nu| |pp|
                                                               (QREFELT $ 107))
                                                     . #19#)
                                               (EXIT
                                                (LETT |lpow0|
                                                      (CONS |pp| |lpow0|)
                                                      . #19#)))
                                              (LETT |j| (+ |j| 1) . #19#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |lpow|
                                               (LIST (|SPADfirst| |lpow0|))
                                               . #19#)
                                         (LETT |pp| (|spadConstant| $ 88)
                                               . #19#)
                                         (SEQ (LETT |p1| NIL . #19#)
                                              (LETT #8# (CDR |lpow0|) . #19#)
                                              G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #8#)
                                                           . #19#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |du| |pp|
                                                               (QREFELT $ 107))
                                                     . #19#)
                                               (EXIT
                                                (LETT |lpow|
                                                      (CONS
                                                       (SPADCALL |pp| |p1|
                                                                 (QREFELT $
                                                                          107))
                                                       |lpow|)
                                                      . #19#)))
                                              (LETT #8# (CDR #8#) . #19#)
                                              (GO G190) G191 (EXIT NIL))
                                         (SEQ (LETT |coef| NIL . #19#)
                                              (LETT #6# |coefs| . #19#)
                                              (LETT |p1| NIL . #19#)
                                              (LETT #5# |lpow| . #19#) G190
                                              (COND
                                               ((OR (ATOM #5#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #5#)
                                                           . #19#)
                                                     NIL)
                                                    (ATOM #6#)
                                                    (PROGN
                                                     (LETT |coef| (CAR #6#)
                                                           . #19#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |eqs|
                                                      (SPADCALL |eqs|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |coef|
                                                                  (QREFELT $
                                                                           114))
                                                                 |p1|
                                                                 (QREFELT $
                                                                          112))
                                                                (QREFELT $
                                                                         115))
                                                      . #19#)))
                                              (LETT #5#
                                                    (PROG1 (CDR #5#)
                                                      (LETT #6# (CDR #6#)
                                                            . #19#))
                                                    . #19#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |eqsl|
                                               (SPADCALL |eqs| (QREFELT $ 116))
                                               . #19#)
                                         (LETT |sl0|
                                               (SPADCALL |eqsl| |coefs|
                                                         (QREFELT $ 120))
                                               . #19#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |sl0| 1) (CONS 1 "failed"))
                                           (#20#
                                            (SEQ
                                             (LETT |sl| (QCDR |sl0|) . #19#)
                                             (SEQ (LETT |c| NIL . #19#)
                                                  (LETT #4# |sl| . #19#) G190
                                                  (COND
                                                   ((OR (ATOM #4#)
                                                        (PROGN
                                                         (LETT |c| (CAR #4#)
                                                               . #19#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (SPADCALL |c| |x|
                                                                 (QREFELT $
                                                                          41))
                                                       (|spadConstant| $ 39)
                                                       (QREFELT $ 98))
                                                      (PROGN
                                                       (LETT #3#
                                                             (CONS 1 "failed")
                                                             . #19#)
                                                       (GO #22#))))))
                                                  (LETT #4# (CDR #4#) . #19#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (PROGN
                                                     (LETT #2# NIL . #19#)
                                                     (SEQ
                                                      (LETT |j| (- |n|) . #19#)
                                                      (LETT |c| NIL . #19#)
                                                      (LETT #1# |sl| . #19#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #1#)
                                                                   . #19#)
                                                             NIL)
                                                            (> |j| |m|))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |c|
                                                                    (|spadConstant|
                                                                     $ 39)
                                                                    (QREFELT $
                                                                             98))
                                                          (LETT #2#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         47)))
                                                                 #2#)
                                                                . #19#)))))
                                                      (LETT #1#
                                                            (PROG1 (CDR #1#)
                                                              (LETT |j|
                                                                    (+ |j| 1)
                                                                    . #19#))
                                                            . #19#)
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE
                                                        #2#))))))))))))))))))))))))))))
          #22# (EXIT #3#)))) 

(SDEFUN |INTDEN;li_int1|
        ((|f| F) (|u| F) (|x| |Symbol|)
         ($ |Union| (|List| (|List| F)) "failed"))
        (SPROG ((|deru| (F)))
               (SEQ
                (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 41))
                      |INTDEN;li_int1|)
                (EXIT
                 (COND
                  ((SPADCALL |deru| (|spadConstant| $ 39) (QREFELT $ 43))
                   (|error| "li_int1: constant log"))
                  ('T
                   (SPADCALL (SPADCALL |f| |deru| (QREFELT $ 76)) |u| |x|
                             (QREFELT $ 122)))))))) 

(SDEFUN |INTDEN;mk_li| ((|c| F) (|j| |Integer|) (|u| F) (|s| F) ($ F))
        (SPROG ((|es| (F)))
               (SEQ
                (COND
                 ((EQL |j| -1)
                  (SPADCALL |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u| (QREFELT $ 123)) |s|
                                       (QREFELT $ 73))
                             (QREFELT $ 123))
                            (QREFELT $ 51)))
                 ('T
                  (SEQ
                   (LETT |es| (SPADCALL |s| (QREFELT $ 124)) |INTDEN;mk_li|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (SPADCALL |u| |es| (QREFELT $ 51))
                                          (+ |j| 1) (QREFELT $ 70))
                                (QREFELT $ 125))
                               (QREFELT $ 51))
                     (SPADCALL |es| (+ |j| 1) (QREFELT $ 70))
                     (QREFELT $ 76))))))))) 

(SDEFUN |INTDEN;UP2UPR|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 131))) 

(SDEFUN |INTDEN;UP2UPR!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) (QREFELT $ 127))) 

(SDEFUN |INTDEN;li_int3|
        ((|f| F) (|rf| |Fraction| (|SparseUnivariatePolynomial| F))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |Union|
          (|Record|
           (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction| (|SparseUnivariatePolynomial| F)))))
          "failed"))
        (SPROG
         ((|res| (F)) (#1=#:G410 NIL) (|zz| NIL) (|lle| (F))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F)))))))
          (#2=#:G409 NIL) (|e| NIL) (|zzl| (|List| F)) (|rf1k| (|Kernel| F))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lli| (|List| (|List| F))) (#3=#:G404 NIL)
          (|liu| (|Union| (|List| (|List| F)) "failed")) (|tf| (F))
          (|c_shift| (F)) (|ddf| (F)) (|rf1| (F)) (|rfc| (F))
          (|deg1| (|NonNegativeInteger|)) (|u1| (F))
          (|cfac| (|SparseUnivariatePolynomial| F))
          (|liden| #4=(|SparseUnivariatePolynomial| F)) (#5=#:G407 NIL)
          (|ldr| NIL) (#6=#:G408 NIL) (|linum| NIL) (|u0| (F))
          (|dummy| (|SingletonAsOrderedSet|))
          (|linums| (|List| (|SparseUnivariatePolynomial| F)))
          (|dn| (|List| (|SparseUnivariatePolynomial| F)))
          (|elden| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|lidens| (|List| #4#)) (#7=#:G406 NIL) (#8=#:G405 NIL)
          (|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;li_factors| (SPADCALL |f| (QREFELT $ 102)) |k| |lk|
                   |x| $)
                  . #9=(|INTDEN;li_int3|))
            (LETT |lidens|
                  (PROGN
                   (LETT #8# NIL . #9#)
                   (SEQ (LETT |ldr| NIL . #9#) (LETT #7# |ldrs| . #9#) G190
                        (COND
                         ((OR (ATOM #7#)
                              (PROGN (LETT |ldr| (CAR #7#) . #9#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #8# (CONS (QVELT |ldr| 0) #8#) . #9#)))
                        (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #8#))))
                  . #9#)
            (EXIT
             (COND ((NULL |lidens|) (CONS 1 "failed"))
                   (#10='T
                    (SEQ
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 132))
                                     (SPADCALL (ELT $ 133) |lidens|
                                               (QREFELT $ 135))
                                     (QREFELT $ 136))
                           . #9#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                            (#10#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 137))
                                     (QCDR |elden|) |lidens| $)
                                    . #9#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 138))
                                    . #9#)
                              (LETT |linums| (CDR |dn|) . #9#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #9#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                              (QREFELT $ 32))
                                    . #9#)
                              (LETT |res| (|spadConstant| $ 39) . #9#)
                              (LETT |logs| NIL . #9#)
                              (SEQ (LETT |linum| NIL . #9#)
                                   (LETT #6# |linums| . #9#)
                                   (LETT |ldr| NIL . #9#)
                                   (LETT #5# |ldrs| . #9#) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |ldr| (CAR #5#) . #9#)
                                          NIL)
                                         (ATOM #6#)
                                         (PROGN
                                          (LETT |linum| (CAR #6#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |liden| (QVELT |ldr| 0) . #9#)
                                        (LETT |cfac| (QVELT |ldr| 1) . #9#)
                                        (LETT |u1| (QVELT |ldr| 2) . #9#)
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |liden|
                                                         (QREFELT $ 37))
                                               . #9#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |deg1| 1 (QREFELT $ 52))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 139))
                                                   . #9#)
                                             (LETT |c_shift|
                                                   (SPADCALL |rfc|
                                                             (QREFELT $ 140))
                                                   . #9#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 3)
                                                             (QREFELT $ 141))
                                                   . #9#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |liden|
                                                               (QREFELT $ 142))
                                                     |dummy| |rf1|
                                                     (QREFELT $ 143))
                                                    (QREFELT $ 144))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |linum| |dummy|
                                                                |rf1|
                                                                (QREFELT $
                                                                         143))
                                                      (QREFELT $ 144))
                                                     |ddf| (QREFELT $ 76))
                                                    . #9#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 0
                                                             (QREFELT $ 50))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |linum|
                                                              (QREFELT $ 144))
                                                    . #9#)))))))
                                        (LETT |liu|
                                              (|INTDEN;li_int1| |tf| |u1| |x|
                                               $)
                                              . #9#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |liu| 1)
                                           (PROGN
                                            (LETT #3# (CONS 1 "failed") . #9#)
                                            (GO #11=#:G403)))
                                          ('T
                                           (SEQ (LETT |lli| (QCDR |liu|) . #9#)
                                                (COND
                                                 ((EQL (LENGTH |lli|) 1)
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |lli| 1
                                                                (QREFELT $
                                                                         146))
                                                      2 (QREFELT $ 32))
                                                     (SPADCALL
                                                      (|spadConstant| $ 49)
                                                      (QREFELT $ 140))
                                                     (QREFELT $ 43))
                                                    (EXIT
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (LETT |logs|
                                                             (CONS
                                                              (VECTOR
                                                               (|spadConstant|
                                                                $ 148)
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 149)
                                                                 1
                                                                 (QREFELT $
                                                                          150))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |lli| 1
                                                                     (QREFELT $
                                                                              146))
                                                                    1
                                                                    (QREFELT $
                                                                             32))
                                                                   (QREFELT $
                                                                            54))
                                                                  (QREFELT $
                                                                           127))
                                                                 (QREFELT $
                                                                          151))
                                                                (QREFELT $
                                                                         152))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |liden|
                                                                 (QREFELT $
                                                                          127))
                                                                (QREFELT $
                                                                         151)))
                                                              |logs|)
                                                             . #9#))
                                                      ('T
                                                       (LETT |elpart|
                                                             (SPADCALL |elpart|
                                                                       (SPADCALL
                                                                        |linum|
                                                                        |liden|
                                                                        (QREFELT
                                                                         $
                                                                         138))
                                                                       (QREFELT
                                                                        $ 153))
                                                             . #9#))))))))
                                                (COND
                                                 ((SPADCALL |deg1| 1
                                                            (QREFELT $ 52))
                                                  (SEQ
                                                   (LETT |rf1k|
                                                         (SPADCALL |rfc|
                                                                   (QREFELT $
                                                                            154))
                                                         . #9#)
                                                   (EXIT
                                                    (LETT |zzl|
                                                          (SPADCALL |cfac|
                                                                    (QREFELT $
                                                                             156))
                                                          . #9#)))))
                                                (EXIT
                                                 (SEQ (LETT |e| NIL . #9#)
                                                      (LETT #2# |lli| . #9#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #2#)
                                                            (PROGN
                                                             (LETT |e|
                                                                   (CAR #2#)
                                                                   . #9#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (COND
                                                        ((SPADCALL
                                                          (SPADCALL |e| 2
                                                                    (QREFELT $
                                                                             32))
                                                          (SPADCALL
                                                           (|spadConstant| $
                                                                           49)
                                                           (QREFELT $ 140))
                                                          (QREFELT $ 43))
                                                         (COND
                                                          ((EQL |deg1| 1)
                                                           (EXIT
                                                            (LETT |logs|
                                                                  (CONS
                                                                   (VECTOR
                                                                    (|spadConstant|
                                                                     $ 148)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       $ 149)
                                                                      1
                                                                      (QREFELT
                                                                       $ 150))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |e| 1
                                                                         (QREFELT
                                                                          $
                                                                          32))
                                                                        (QREFELT
                                                                         $ 54))
                                                                       (QREFELT
                                                                        $ 127))
                                                                      (QREFELT
                                                                       $ 151))
                                                                     (QREFELT $
                                                                              152))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |liden|
                                                                      (QREFELT
                                                                       $ 127))
                                                                     (QREFELT $
                                                                              151)))
                                                                   |logs|)
                                                                  . #9#))))))
                                                       (LETT |lle|
                                                             (|INTDEN;mk_li|
                                                              (SPADCALL |e| 1
                                                                        (QREFELT
                                                                         $ 32))
                                                              (SPADCALL
                                                               (SPADCALL |e| 2
                                                                         (QREFELT
                                                                          $
                                                                          32))
                                                               (QREFELT $ 157))
                                                              |u1| |c_shift| $)
                                                             . #9#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             52))
                                                          (SEQ
                                                           (LETT |zz| NIL
                                                                 . #9#)
                                                           (LETT #1# |zzl|
                                                                 . #9#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #1#)
                                                                 (PROGN
                                                                  (LETT |zz|
                                                                        (CAR
                                                                         #1#)
                                                                        . #9#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT |res|
                                                                   (SPADCALL
                                                                    |res|
                                                                    (SPADCALL
                                                                     |lle|
                                                                     |rf1k|
                                                                     |zz|
                                                                     (QREFELT $
                                                                              158))
                                                                    (QREFELT $
                                                                             73))
                                                                   . #9#)))
                                                           (LETT #1# (CDR #1#)
                                                                 . #9#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                         ('T
                                                          (LETT |res|
                                                                (SPADCALL |res|
                                                                          |lle|
                                                                          (QREFELT
                                                                           $
                                                                           73))
                                                                . #9#)))))
                                                      (LETT #2# (CDR #2#)
                                                            . #9#)
                                                      (GO G190) G191
                                                      (EXIT NIL))))))))
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# (CDR #6#) . #9#))
                                         . #9#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (CONS 0
                                     (VECTOR
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 54))
                                                (QREFELT $ 127))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 159) |logs|
                                                NIL
                                                (QREFELT $ 165)))))))))))))))
          #11# (EXIT #3#)))) 

(SDEFUN |INTDEN;mk_poly| ((|c| F) (|j| |Integer|) (|u| F) (|s| F) ($ F))
        (SPROG
         ((|ifac| (F)) (|res| (F)) (|i1| (|Integer|)) (|i| NIL)
          (|j1| (|Integer|)) (|eu| (F)))
         (SEQ
          (COND
           ((EQL |j| 0)
            (SPADCALL |c|
                      (SPADCALL |u|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |u| (QREFELT $ 124))
                                           (SPADCALL (|spadConstant| $ 49) |s|
                                                     (QREFELT $ 76))
                                           (QREFELT $ 73))
                                 (QREFELT $ 123))
                                (QREFELT $ 141))
                      (QREFELT $ 51)))
           ('T
            (SEQ
             (LETT |eu|
                   (SPADCALL |s| (SPADCALL |u| (QREFELT $ 124)) (QREFELT $ 51))
                   . #1=(|INTDEN;mk_poly|))
             (LETT |j1| (+ |j| 1) . #1#)
             (LETT |res|
                   (SPADCALL (SPADCALL |u| |j1| (QREFELT $ 70))
                             (SPADCALL (SPADCALL |j1| (QREFELT $ 74))
                                       (QREFELT $ 75))
                             (QREFELT $ 76))
                   . #1#)
             (LETT |res|
                   (SPADCALL |res|
                             (SPADCALL (SPADCALL |u| |j| (QREFELT $ 70))
                                       (SPADCALL
                                        (SPADCALL |eu| (|spadConstant| $ 49)
                                                  (QREFELT $ 73))
                                        (QREFELT $ 123))
                                       (QREFELT $ 51))
                             (QREFELT $ 141))
                   . #1#)
             (LETT |ifac|
                   (SPADCALL
                    (SPADCALL (SPADCALL |j| (QREFELT $ 74)) (QREFELT $ 75))
                    (QREFELT $ 140))
                   . #1#)
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |j|) (GO G191)))
                  (SEQ (LETT |i1| (- |j| |i|) . #1#)
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL
                                        (SPADCALL |ifac|
                                                  (SPADCALL |u| |i1|
                                                            (QREFELT $ 70))
                                                  (QREFELT $ 51))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (+ |i| 1) (QREFELT $ 74))
                                          (QREFELT $ 75))
                                         (SPADCALL |eu| (QREFELT $ 140))
                                         (QREFELT $ 166))
                                        (QREFELT $ 51))
                                       (QREFELT $ 73))
                             . #1#)
                       (EXIT
                        (LETT |ifac|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |i1| (QREFELT $ 74))
                                          (QREFELT $ 75))
                                |ifac| (QREFELT $ 51))
                               (QREFELT $ 140))
                              . #1#)))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |c| |res| (QREFELT $ 51))))))))) 

(SDEFUN |INTDEN;poly_int3|
        ((|f| F) (|rf| |Fraction| (|SparseUnivariatePolynomial| F))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |Union|
          (|Record|
           (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction| (|SparseUnivariatePolynomial| F)))))
          "failed"))
        (SPROG
         ((|res| (F)) (#1=#:G450 NIL) (|zz| NIL) (|lle| (F)) (#2=#:G442 NIL)
          (|ii| (|Integer|)) (#3=#:G449 NIL) (|e| NIL) (|zzl| (|List| F))
          (|rf1k| (|Kernel| F))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lpoly| (|List| (|List| F)))
          (|polyu| (|Union| (|List| (|List| F)) "failed")) (|tf| (F))
          (|c_shift| (F)) (|ddf| (F)) (|rf1| (F)) (|rfc| (F))
          (|deg1| (|NonNegativeInteger|))
          (|polynum| #4=(|SparseUnivariatePolynomial| F)) (|v1| (F))
          (|cfac| (|SparseUnivariatePolynomial| F))
          (|polyden| #5=(|SparseUnivariatePolynomial| F)) (#6=#:G447 NIL)
          (|ldr| NIL) (#7=#:G448 NIL) (|polynum1| NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F)))))))
          (|u0| (F)) (|dummy| (|SingletonAsOrderedSet|))
          (|polynums1| (|List| (|SparseUnivariatePolynomial| F)))
          (|dn| (|List| (|SparseUnivariatePolynomial| F)))
          (|elden| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|polydens1| (|List| #4#)) (#8=#:G446 NIL) (|p| NIL) (#9=#:G445 NIL)
          (|polydens| (|List| #5#)) (#10=#:G444 NIL) (#11=#:G443 NIL)
          (|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;poly_factors| (SPADCALL |f| (QREFELT $ 102)) |k|
                   |lk| |x| $)
                  . #12=(|INTDEN;poly_int3|))
            (LETT |polydens|
                  (PROGN
                   (LETT #11# NIL . #12#)
                   (SEQ (LETT |ldr| NIL . #12#) (LETT #10# |ldrs| . #12#) G190
                        (COND
                         ((OR (ATOM #10#)
                              (PROGN (LETT |ldr| (CAR #10#) . #12#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #11# (CONS (QVELT |ldr| 0) #11#) . #12#)))
                        (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                        (EXIT (NREVERSE #11#))))
                  . #12#)
            (EXIT
             (COND ((NULL |polydens|) (CONS 1 "failed"))
                   (#13='T
                    (SEQ
                     (LETT |polydens1|
                           (PROGN
                            (LETT #9# NIL . #12#)
                            (SEQ (LETT |p| NIL . #12#)
                                 (LETT #8# |polydens| . #12#) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |p| (CAR #8#) . #12#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 33))
                                            (QREFELT $ 34))
                                           |p| (QREFELT $ 35))
                                          #9#)
                                         . #12#)))
                                 (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           . #12#)
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 132))
                                     (SPADCALL (ELT $ 133) |polydens1|
                                               (QREFELT $ 135))
                                     (QREFELT $ 136))
                           . #12#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                            (#13#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 137))
                                     (QCDR |elden|) |polydens1| $)
                                    . #12#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 138))
                                    . #12#)
                              (LETT |polynums1| (CDR |dn|) . #12#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #12#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                              (QREFELT $ 32))
                                    . #12#)
                              (LETT |res| (|spadConstant| $ 39) . #12#)
                              (LETT |logs| NIL . #12#)
                              (SEQ (LETT |polynum1| NIL . #12#)
                                   (LETT #7# |polynums1| . #12#)
                                   (LETT |ldr| NIL . #12#)
                                   (LETT #6# |ldrs| . #12#) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN
                                          (LETT |ldr| (CAR #6#) . #12#)
                                          NIL)
                                         (ATOM #7#)
                                         (PROGN
                                          (LETT |polynum1| (CAR #7#) . #12#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |polyden| (QVELT |ldr| 0) . #12#)
                                        (LETT |cfac| (QVELT |ldr| 1) . #12#)
                                        (LETT |v1| (QVELT |ldr| 3) . #12#)
                                        (LETT |polynum|
                                              (SPADCALL
                                               (SPADCALL |polyden|
                                                         (QREFELT $ 33))
                                               |polynum1| (QREFELT $ 35))
                                              . #12#)
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |polyden|
                                                         (QREFELT $ 37))
                                               . #12#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |deg1| 1 (QREFELT $ 52))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 139))
                                                   . #12#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 2)
                                                             (QREFELT $ 76))
                                                   . #12#)
                                             (LETT |c_shift|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|spadConstant| $ 49)
                                                     |rfc| (QREFELT $ 76))
                                                    (QREFELT $ 140))
                                                   . #12#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |cfac|
                                                               (QREFELT $ 142))
                                                     |dummy| |rfc|
                                                     (QREFELT $ 143))
                                                    (QREFELT $ 144))
                                                   . #12#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |polynum|
                                                                 |dummy| |rf1|
                                                                 (QREFELT $
                                                                          143))
                                                       (QREFELT $ 144))
                                                      (SPADCALL |rfc| |ddf|
                                                                (QREFELT $ 51))
                                                      (QREFELT $ 76))
                                                     (QREFELT $ 140))
                                                    . #12#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 1
                                                             (QREFELT $ 50))
                                                   . #12#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |polynum|
                                                              (QREFELT $ 144))
                                                    . #12#)))))))
                                        (LETT |polyu|
                                              (|INTDEN;li_int1| |tf| |v1| |x|
                                               $)
                                              . #12#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |polyu| 1)
                                           (PROGN
                                            (LETT #2# (CONS 1 "failed") . #12#)
                                            (GO #14=#:G441)))
                                          ('T
                                           (SEQ
                                            (LETT |lpoly| (QCDR |polyu|)
                                                  . #12#)
                                            (COND
                                             ((EQL (LENGTH |lpoly|) 1)
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |lpoly| 1
                                                            (QREFELT $ 146))
                                                  2 (QREFELT $ 32))
                                                 (|spadConstant| $ 39)
                                                 (QREFELT $ 43))
                                                (EXIT
                                                 (LETT |elpart|
                                                       (SPADCALL |elpart|
                                                                 (SPADCALL
                                                                  |polynum|
                                                                  |polyden|
                                                                  (QREFELT $
                                                                           138))
                                                                 (QREFELT $
                                                                          153))
                                                       . #12#))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 52))
                                              (SEQ
                                               (LETT |rf1k|
                                                     (SPADCALL |rfc|
                                                               (QREFELT $ 154))
                                                     . #12#)
                                               (EXIT
                                                (LETT |zzl|
                                                      (SPADCALL |cfac|
                                                                (QREFELT $
                                                                         156))
                                                      . #12#)))))
                                            (EXIT
                                             (SEQ (LETT |e| NIL . #12#)
                                                  (LETT #3# |lpoly| . #12#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #3#)
                                                        (PROGN
                                                         (LETT |e| (CAR #3#)
                                                               . #12#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |ii|
                                                         (SPADCALL
                                                          (SPADCALL |e| 2
                                                                    (QREFELT $
                                                                             32))
                                                          (QREFELT $ 157))
                                                         . #12#)
                                                   (EXIT
                                                    (COND
                                                     ((< |ii| 0)
                                                      (PROGN
                                                       (LETT #2#
                                                             (CONS 1 "failed")
                                                             . #12#)
                                                       (GO #14#)))
                                                     ((SPADCALL
                                                       (SPADCALL |e| 1
                                                                 (QREFELT $
                                                                          32))
                                                       (|spadConstant| $ 39)
                                                       (QREFELT $ 43))
                                                      "iterate")
                                                     ('T
                                                      (SEQ
                                                       (LETT |lle|
                                                             (|INTDEN;mk_poly|
                                                              (SPADCALL |e| 1
                                                                        (QREFELT
                                                                         $ 32))
                                                              |ii| |v1|
                                                              |c_shift| $)
                                                             . #12#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             52))
                                                          (SEQ
                                                           (LETT |zz| NIL
                                                                 . #12#)
                                                           (LETT #1# |zzl|
                                                                 . #12#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #1#)
                                                                 (PROGN
                                                                  (LETT |zz|
                                                                        (CAR
                                                                         #1#)
                                                                        . #12#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT |res|
                                                                   (SPADCALL
                                                                    |res|
                                                                    (SPADCALL
                                                                     |lle|
                                                                     |rf1k|
                                                                     |zz|
                                                                     (QREFELT $
                                                                              158))
                                                                    (QREFELT $
                                                                             73))
                                                                   . #12#)))
                                                           (LETT #1# (CDR #1#)
                                                                 . #12#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                         ('T
                                                          (LETT |res|
                                                                (SPADCALL |res|
                                                                          |lle|
                                                                          (QREFELT
                                                                           $
                                                                           73))
                                                                . #12#)))))))))
                                                  (LETT #3# (CDR #3#) . #12#)
                                                  (GO G190) G191
                                                  (EXIT NIL))))))))
                                   (LETT #6#
                                         (PROG1 (CDR #6#)
                                           (LETT #7# (CDR #7#) . #12#))
                                         . #12#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (CONS 0
                                     (VECTOR
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 54))
                                                (QREFELT $ 127))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 159) |logs|
                                                NIL
                                                (QREFELT $ 165)))))))))))))))
          #14# (EXIT #2#)))) 

(SDEFUN |INTDEN;li_int;FKSR;16|
        ((|rf| |Fraction| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|x| |Symbol|)
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|res|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            "failed"))
          (|lk| (|List| (|Kernel| F))) (#1=#:G458 NIL) (|kk| NIL)
          (#2=#:G457 NIL) (|f| (F)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 168))
                . #3=(|INTDEN;li_int;FKSR;16|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 169)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 57)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 57))
                                  (SPADCALL |kk| |k| (QREFELT $ 170)))
                                 (#4='T 'NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 172))
                . #3#)
          (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 159) |rf| (|spadConstant| $ 173)))
            (#4# (QCDR |res|))))))) 

(SDEFUN |INTDEN;poly_int;FKSR;17|
        ((|rf| |Fraction| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|x| |Symbol|)
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|res|
           (|Union|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            "failed"))
          (|lk| (|List| (|Kernel| F))) (#1=#:G465 NIL) (|kk| NIL)
          (#2=#:G464 NIL) (|f| (F)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 168))
                . #3=(|INTDEN;poly_int;FKSR;17|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 169)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 57)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 57))
                                  (SPADCALL |kk| |k| (QREFELT $ 170)))
                                 (#4='T 'NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 172))
                . #3#)
          (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 159) |rf| (|spadConstant| $ 173)))
            (#4# (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |DenominatorIntegration;|)) 

(DEFUN |DenominatorIntegration| (&REST #1=#:G466)
  (SPROG NIL
         (PROG (#2=#:G467)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DenominatorIntegration|)
                                               '|domainEqualList|)
                    . #3=(|DenominatorIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DenominatorIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DenominatorIntegration|)))))))))) 

(DEFUN |DenominatorIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DenominatorIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DenominatorIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 177) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DenominatorIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 19
                    (COND
                     ((|HasCategory| |#1| '(|EuclideanDomain|))
                      (|HasCategory| |#1| '(|CharacteristicZero|)))
                     ('T 'NIL)))
          (COND
           ((QREFELT $ 19)
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |INTDEN;factor;SmpF;2|) $)))
           ('T
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |INTDEN;factor;SmpF;3|) $))))
          $))) 

(MAKEPROP '|DenominatorIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| $) (|Kernel| 7)
              (|SparseMultivariatePolynomial| 6 9) (0 . |univariate|)
              (|SparseMultivariatePolynomial| 6 58) (6 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 10)
              (|SparseUnivariatePolynomial| 10)
              (|SparseUnivariatePolynomialFunctions2| 10 7) (11 . |map|)
              '#:G104 (|Factored| 10)
              (|MultivariateFactorize| 9 (|IndexedExponents| 9) 6 10)
              (17 . |factor|) (22 . |factor|)
              (|Record| (|:| |factor| 10) (|:| |exponent| 31)) (|List| 24)
              (27 . |factors|) (|SingletonAsOrderedSet|) (32 . |create|)
              (|List| 7) (36 . |argument|) (|Integer|) (41 . |elt|)
              (47 . |leadingCoefficient|) (52 . |inv|) (57 . *)
              (|NonNegativeInteger|) (63 . |degree|) (68 . |Zero|)
              (72 . |Zero|) (|Symbol|) (76 . D) (|Boolean|) (82 . =)
              (88 . |coefficients|) (|Mapping| 42 7) (93 . |every?|)
              (99 . |coerce|) (104 . |One|) (108 . |One|) (112 . |coefficient|)
              (118 . *) (124 . >) (130 . |monomial|) (136 . |coerce|) (141 . -)
              (147 . |eval|) (154 . |is?|) (|Kernel| $) (160 . |coerce|)
              (|Vector| 7) (165 . |vector|) (|Union| 66 '"failed")
              (|IntegerLinearDependence| 7) (170 . |particularSolutionOverQ|)
              (|Record| (|:| |num| (|List| 31)) (|:| |den| 31)) (|Vector| 147)
              (|InnerCommonDenominator| 31 147 (|List| 31) 66)
              (176 . |splitDenominator|) (181 . ~=) (187 . ^) (|Mapping| 7 7 7)
              (193 . |reduce|) (199 . +) (205 . |coerce|) (210 . |coerce|)
              (215 . /) (221 . |One|) (225 . ~=) (|List| 14)
              (|PartialFractionUtilities| 7 14) (231 . |decompose|)
              (237 . |Zero|) (|Union| $ '"failed")
              (|SparseMultivariatePolynomial| 7 9) (241 . |exquo|) (|List| 9)
              (247 . |member?|) (253 . |One|) (257 . |One|) (261 . |monomial|)
              (268 . |coerce|) (|Mapping| 84 9) (|Mapping| 84 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 9) 9 6 10 84)
              (273 . |map|) (|List| 58) (280 . |kernels|) (285 . ~=)
              (291 . |last|) (296 . |setDifference|) (302 . |numer|)
              (307 . |denom|) (312 . |degree|) (318 . |exquo|) (324 . >)
              (330 . ^) (336 . *) (|Union| 7 '"failed") (342 . |retractIfCan|)
              (347 . /) (353 . |One|) (357 . *) (363 . |new|) (367 . |coerce|)
              (372 . -) (378 . |coefficients|) (|Union| 29 '"failed")
              (|List| 40) (|ExpressionLinearSolve| 6 7) (383 . |lin_sol|)
              (|Union| 145 '"failed") |INTDEN;solve_u;2FSU;9| (389 . |log|)
              (394 . |exp|) (399 . |li|) (|Fraction| 14) (404 . |coerce|)
              (|SparseUnivariatePolynomial| 126) (|Mapping| 126 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 14 126 128)
              (409 . |map|) (415 . |denom|) (420 . *) (|Mapping| 14 14 14)
              (426 . |reduce|) (432 . |exquo|) (438 . |numer|) (443 . /)
              (449 . |rootOf|) (454 . -) (459 . -) (465 . |differentiate|)
              (470 . |eval|) (477 . |retract|) (|List| 29) (482 . |elt|)
              (|Fraction| 31) (488 . |One|) (492 . |One|) (496 . |monomial|)
              (502 . |coerce|) (507 . -) (513 . +) (519 . |retract|) (|List| $)
              (524 . |zerosOf|) (529 . |retract|) (534 . |eval|) (541 . |Zero|)
              (|Record| (|:| |scalar| 147) (|:| |coeff| 128)
                        (|:| |logand| 128))
              (|List| 160) (|Record| (|:| |integrand| 126) (|:| |intvar| 126))
              (|List| 162) (|IntegrationResult| 126) (545 . |mkAnswer|)
              (552 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 9) 9 6
                                                     10 7)
              (558 . |multivariate|) (564 . |tower|) (569 . ~=)
              (|IntegrationTools| 6 7) (575 . |varselect|) (581 . |Zero|)
              (|Record| (|:| |answer| 126) (|:| |logpart| 126) (|:| |ir| 164))
              |INTDEN;li_int;FKSR;16| |INTDEN;poly_int;FKSR;17|)
           '#(|solve_u| 585 |poly_int| 592 |li_int| 599 |factor| 606) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 176
                                                 '(2 10 8 0 9 11 1 7 0 12 13 2
                                                   17 14 15 16 18 1 21 20 10 22
                                                   1 0 20 10 23 1 20 25 0 26 0
                                                   27 0 28 1 9 29 0 30 2 29 7 0
                                                   31 32 1 14 7 0 33 1 7 0 0 34
                                                   2 14 0 7 0 35 1 14 36 0 37 0
                                                   6 0 38 0 7 0 39 2 7 0 0 40
                                                   41 2 7 42 0 0 43 1 14 29 0
                                                   44 2 29 42 45 0 46 1 7 0 31
                                                   47 0 6 0 48 0 7 0 49 2 14 7
                                                   0 36 50 2 7 0 0 0 51 2 36 42
                                                   0 0 52 2 14 0 7 36 53 1 14 0
                                                   7 54 2 14 0 0 0 55 3 14 0 0
                                                   27 0 56 2 9 42 0 40 57 1 7 0
                                                   58 59 1 60 0 29 61 2 63 62
                                                   60 7 64 1 67 65 66 68 2 31
                                                   42 0 0 69 2 7 0 0 31 70 2 29
                                                   7 71 0 72 2 7 0 0 0 73 1 6 0
                                                   31 74 1 7 0 6 75 2 7 0 0 0
                                                   76 0 14 0 77 2 14 42 0 0 78
                                                   2 80 79 14 79 81 0 14 0 82 2
                                                   84 83 0 0 85 2 86 42 9 0 87
                                                   0 84 0 88 0 36 0 89 3 84 0 0
                                                   9 36 90 1 84 0 7 91 3 94 84
                                                   92 93 10 95 1 7 96 0 97 2 7
                                                   42 0 0 98 1 86 9 0 99 2 86 0
                                                   0 0 100 1 7 12 0 101 1 7 12
                                                   0 102 2 84 36 0 9 103 2 36
                                                   83 0 0 104 2 31 42 0 0 105 2
                                                   84 0 0 36 106 2 84 0 0 0 107
                                                   1 84 108 0 109 2 84 0 0 7
                                                   110 0 10 0 111 2 84 0 7 0
                                                   112 0 40 0 113 1 7 0 40 114
                                                   2 84 0 0 0 115 1 84 29 0 116
                                                   2 119 117 29 118 120 1 7 0 0
                                                   123 1 7 0 0 124 1 7 0 0 125
                                                   1 126 0 14 127 2 130 128 129
                                                   14 131 1 126 14 0 132 2 14 0
                                                   0 0 133 2 79 14 134 0 135 2
                                                   14 83 0 0 136 1 126 14 0 137
                                                   2 126 0 14 14 138 1 7 0 8
                                                   139 1 7 0 0 140 2 7 0 0 0
                                                   141 1 14 0 0 142 3 14 0 0 27
                                                   7 143 1 14 7 0 144 2 145 29
                                                   0 31 146 0 147 0 148 0 126 0
                                                   149 2 128 0 126 36 150 1 128
                                                   0 126 151 2 128 0 0 0 152 2
                                                   126 0 0 0 153 1 7 58 0 154 1
                                                   7 155 8 156 1 7 31 0 157 3 7
                                                   0 0 58 0 158 0 126 0 159 3
                                                   164 0 126 161 163 165 2 7 0
                                                   0 0 166 2 167 7 126 9 168 1
                                                   7 96 0 169 2 9 42 0 0 170 2
                                                   171 86 86 40 172 0 164 0 173
                                                   3 0 121 7 7 40 122 3 0 174
                                                   126 9 40 176 3 0 174 126 9
                                                   40 175 1 0 20 10 23)))))
           '|lookupComplete|)) 
