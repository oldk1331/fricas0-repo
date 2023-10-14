
(SDEFUN |INTDEN;MP_to_UP|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         ($ |SparseUnivariatePolynomial| (|Expression| R)))
        (SPROG
         ((|up1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))))
         (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 10)) |INTDEN;MP_to_UP|)
              (EXIT (SPADCALL (ELT $ 13) |up1| (QREFELT $ 18)))))) 

(SDEFUN |INTDEN;factor;SmpF;2|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         ($ |Factored|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
        (SPADCALL |p| (QREFELT $ 22))) 

(PUT '|INTDEN;factor;SmpF;3| '|SPADreplace|
     '(XLAM (|p|) (|error| "No factor for polynomials over R"))) 

(SDEFUN |INTDEN;factor;SmpF;3|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         ($ |Factored|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
        (|error| "No factor for polynomials over R")) 

(SDEFUN |INTDEN;li_factors|
        ((|df| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         (|lk| |List| (|Kernel| (|Expression| R))) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
           (|:| |den| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
             (|:| |den| (|Integer|)))))
          (|f2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|k2| #1=(|Expression| R)) (#2=#:G221 NIL) (|c| NIL) (#3=#:G222 NIL)
          (|ki| NIL) (#4=#:G220 NIL) (|u1| #1#) (#5=#:G218 NIL) (|ui| NIL)
          (#6=#:G219 NIL) (#7=#:G217 NIL) (|d| #8=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #8#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| (|Expression| R))) (#9=#:G216 NIL) (|kk| NIL)
          (#10=#:G215 NIL) (|dvvec| (|Vector| (|Expression| R)))
          (#11=#:G214 NIL) (#12=#:G213 NIL) (|vlst| (|List| (|Expression| R)))
          (#13=#:G212 NIL) (#14=#:G211 NIL) (|rsum| (|Expression| R))
          (|deg1| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#15=#:G210 NIL) (|fac| NIL) (|u0| (|Expression| R))
          (|nk| (|NonNegativeInteger|)) (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
                . #16=(|INTDEN;li_factors|))
          (LETT |res| NIL . #16#)
          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #16#)
          (LETT |vlst| NIL . #16#) (LETT |nk| (LENGTH |lk|) . #16#)
          (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
                . #16#)
          (SEQ (LETT |fac| NIL . #16#) (LETT #15# |lfac| . #16#) G190
               (COND
                ((OR (ATOM #15#) (PROGN (LETT |fac| (CAR #15#) . #16#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #16#)
                    (LETT |f1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f1| (QREFELT $ 33))
                                     (QREFELT $ 34))
                           |f1| (QREFELT $ 35))
                          . #16#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #16#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ((SPADCALL
                             (CONS #'|INTDEN;li_factors!0| (VECTOR $ |x|))
                             (SPADCALL |f1| (QREFELT $ 45)) (QREFELT $ 47))
                            (LETT |res|
                                  (CONS
                                   (VECTOR |f1| |f1| |u0| (|spadConstant| $ 42)
                                           1)
                                   |res|)
                                  . #16#))
                           ((NULL |lk|) "iterate")
                           ('T
                            (SEQ
                             (LETT |rsum|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |deg1| (QREFELT $ 48))
                                              (QREFELT $ 34))
                                    (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 51))
                                    (QREFELT $ 52))
                                   . #16#)
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 53))
                               (LETT |f2|
                                     (SPADCALL |f1| |dummy|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 54)
                                                          1 (QREFELT $ 55))
                                                (SPADCALL |rsum|
                                                          (QREFELT $ 56))
                                                (QREFELT $ 57))
                                               (QREFELT $ 58))
                                     . #16#)))
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 53))
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (CONS #'|INTDEN;li_factors!1|
                                         (VECTOR $ |x|))
                                   (SPADCALL |f2| (QREFELT $ 45))
                                   (QREFELT $ 47)))
                                 (EXIT "iterate")))))
                             (COND
                              ((NULL |vlst|)
                               (SEQ
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #14# NIL . #16#)
                                       (SEQ (LETT |kk| NIL . #16#)
                                            (LETT #13# |lk| . #16#) G190
                                            (COND
                                             ((OR (ATOM #13#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #13#)
                                                         . #16#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #14#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          59))
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          61)))
                                                      ('T
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           30))
                                                        1 (QREFELT $ 32))))
                                                     #14#)
                                                    . #16#)))
                                            (LETT #13# (CDR #13#) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #14#))))
                                      . #16#)
                                (LETT |dvvec|
                                      (SPADCALL
                                       (PROGN
                                        (LETT #12# NIL . #16#)
                                        (SEQ (LETT |c| NIL . #16#)
                                             (LETT #11# |vlst| . #16#) G190
                                             (COND
                                              ((OR (ATOM #11#)
                                                   (PROGN
                                                    (LETT |c| (CAR #11#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #12#
                                                     (CONS
                                                      (SPADCALL |c| |x|
                                                                (QREFELT $ 41))
                                                      #12#)
                                                     . #16#)))
                                             (LETT #11# (CDR #11#) . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #12#))))
                                       (QREFELT $ 63))
                                      . #16#)
                                (EXIT
                                 (LETT |ulst|
                                       (PROGN
                                        (LETT #10# NIL . #16#)
                                        (SEQ (LETT |kk| NIL . #16#)
                                             (LETT #9# |lk| . #16#) G190
                                             (COND
                                              ((OR (ATOM #9#)
                                                   (PROGN
                                                    (LETT |kk| (CAR #9#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #10#
                                                     (CONS
                                                      (COND
                                                       ((SPADCALL |kk| '|log|
                                                                  (QREFELT $
                                                                           59))
                                                        (SPADCALL
                                                         (SPADCALL |kk|
                                                                   (QREFELT $
                                                                            30))
                                                         1 (QREFELT $ 32)))
                                                       ('T
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           61))))
                                                      #10#)
                                                     . #16#)))
                                             (LETT #9# (CDR #9#) . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #10#))))
                                       . #16#)))))
                             (LETT |su|
                                   (SPADCALL |dvvec|
                                             (SPADCALL |rsum| |x|
                                                       (QREFELT $ 41))
                                             (QREFELT $ 66))
                                   . #16#)
                             (EXIT
                              (COND ((QEQCAR |su| 1) "iterate")
                                    ('T
                                     (SEQ (LETT |sv| (QCDR |su|) . #16#)
                                          (LETT |cd|
                                                (SPADCALL |sv| (QREFELT $ 70))
                                                . #16#)
                                          (LETT |d| (QCDR |cd|) . #16#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |d| 1 (QREFELT $ 71))
                                             "iterate")
                                            ('T
                                             (SEQ
                                              (LETT |u1|
                                                    (SPADCALL (ELT $ 52)
                                                              (PROGN
                                                               (LETT #7# NIL
                                                                     . #16#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #16#)
                                                                (LETT #6#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #16#)
                                                                (LETT |ui| NIL
                                                                      . #16#)
                                                                (LETT #5#
                                                                      |ulst|
                                                                      . #16#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT |ui|
                                                                          (CAR
                                                                           #5#)
                                                                          . #16#)
                                                                    NIL)
                                                                   (ATOM #6#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #6#)
                                                                          . #16#)
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #7#
                                                                        (CONS
                                                                         (SPADCALL
                                                                          |ui|
                                                                          |ki|
                                                                          (QREFELT
                                                                           $
                                                                           72))
                                                                         #7#)
                                                                        . #16#)))
                                                                (LETT #5#
                                                                      (PROG1
                                                                          (CDR
                                                                           #5#)
                                                                        (LETT
                                                                         #6#
                                                                         (CDR
                                                                          #6#)
                                                                         . #16#))
                                                                      . #16#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #7#))))
                                                              (QREFELT $ 74))
                                                    . #16#)
                                              (LETT |k2|
                                                    (SPADCALL (ELT $ 75)
                                                              (PROGN
                                                               (LETT #4# NIL
                                                                     . #16#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #16#)
                                                                (LETT #3#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #16#)
                                                                (LETT |c| NIL
                                                                      . #16#)
                                                                (LETT #2#
                                                                      |vlst|
                                                                      . #16#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #2#)
                                                                   (PROGN
                                                                    (LETT |c|
                                                                          (CAR
                                                                           #2#)
                                                                          . #16#)
                                                                    NIL)
                                                                   (ATOM #3#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #3#)
                                                                          . #16#)
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT #4#
                                                                        (CONS
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |ki|
                                                                            (QREFELT
                                                                             $
                                                                             76))
                                                                           (QREFELT
                                                                            $
                                                                            77))
                                                                          |c|
                                                                          (QREFELT
                                                                           $
                                                                           52))
                                                                         #4#)
                                                                        . #16#)))
                                                                (LETT #2#
                                                                      (PROG1
                                                                          (CDR
                                                                           #2#)
                                                                        (LETT
                                                                         #3#
                                                                         (CDR
                                                                          #3#)
                                                                         . #16#))
                                                                      . #16#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #4#))))
                                                              (QREFELT $ 74))
                                                    . #16#)
                                              (LETT |f2|
                                                    (SPADCALL |f1| |dummy|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 54)
                                                                1
                                                                (QREFELT $ 55))
                                                               (SPADCALL |k2|
                                                                         (QREFELT
                                                                          $
                                                                          56))
                                                               (QREFELT $ 57))
                                                              (QREFELT $ 58))
                                                    . #16#)
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (CONS #'|INTDEN;li_factors!2|
                                                        (VECTOR $ |x|))
                                                  (SPADCALL |f2|
                                                            (QREFELT $ 45))
                                                  (QREFELT $ 47)))
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
                                                                          72))
                                                               |u1|
                                                               (QREFELT $ 52))
                                                              |k2| |d|)
                                                      |res|)
                                                     . #16#)))))))))))))))
               (LETT #15# (CDR #15#) . #16#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;li_factors!2| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                      (QREFELT $ 44)))))) 

(SDEFUN |INTDEN;li_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                      (QREFELT $ 44)))))) 

(SDEFUN |INTDEN;li_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                      (QREFELT $ 44)))))) 

(SDEFUN |INTDEN;poly_factors|
        ((|df| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         (|lk| |List| (|Kernel| (|Expression| R))) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
           (|:| |den| (|Integer|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
             (|:| |den| (|Integer|)))))
          (|f2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|k2| #1=(|Expression| R)) (#2=#:G289 NIL) (|c| NIL) (#3=#:G290 NIL)
          (|ki| NIL) (#4=#:G288 NIL) (|u1| #1#) (#5=#:G286 NIL) (|ui| NIL)
          (#6=#:G287 NIL) (#7=#:G285 NIL) (|d| #8=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #8#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| (|Expression| R))) (#9=#:G284 NIL) (|kk| NIL)
          (#10=#:G283 NIL) (|dvvec| (|Vector| (|Expression| R)))
          (#11=#:G282 NIL) (#12=#:G281 NIL) (|vlst| (|List| (|Expression| R)))
          (#13=#:G280 NIL) (#14=#:G279 NIL) (|lprod| (|Expression| R))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|tc| (|Expression| R)) (|deg1| (|NonNegativeInteger|))
          (#15=#:G278 NIL) (|fac| NIL) (|v0| (|Expression| R))
          (|nk| (|NonNegativeInteger|)) (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
                . #16=(|INTDEN;poly_factors|))
          (LETT |res| NIL . #16#)
          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #16#)
          (LETT |vlst| NIL . #16#) (LETT |nk| (LENGTH |lk|) . #16#)
          (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
                . #16#)
          (SEQ (LETT |fac| NIL . #16#) (LETT #15# |lfac| . #16#) G190
               (COND
                ((OR (ATOM #15#) (PROGN (LETT |fac| (CAR #15#) . #16#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |f1|
                      (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #16#)
                      . #16#)
                (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #16#)
                (EXIT
                 (COND ((EQL |deg1| 0) "iterate")
                       ('T
                        (SEQ
                         (LETT |tc| (SPADCALL |f1| 0 (QREFELT $ 51)) . #16#)
                         (EXIT
                          (COND
                           ((SPADCALL |tc| (|spadConstant| $ 42)
                                      (QREFELT $ 44))
                            "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL (SPADCALL |tc| (QREFELT $ 34))
                                             |f1| (QREFELT $ 35))
                                   . #16#)
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (CONS #'|INTDEN;poly_factors!0|
                                       (VECTOR $ |x|))
                                 (SPADCALL |f1| (QREFELT $ 45)) (QREFELT $ 47))
                                (LETT |res|
                                      (CONS
                                       (VECTOR |f1| |f1| (|spadConstant| $ 54)
                                               |v0| 1)
                                       |res|)
                                      . #16#))
                               ((NULL |lk|) "iterate")
                               ('T
                                (SEQ
                                 (LETT |lprod| (SPADCALL |f1| (QREFELT $ 33))
                                       . #16#)
                                 (COND
                                  ((NULL |vlst|)
                                   (SEQ
                                    (LETT |vlst|
                                          (PROGN
                                           (LETT #14# NIL . #16#)
                                           (SEQ (LETT |kk| NIL . #16#)
                                                (LETT #13# |lk| . #16#) G190
                                                (COND
                                                 ((OR (ATOM #13#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #13#)
                                                             . #16#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #14#
                                                        (CONS
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|log|
                                                                     (QREFELT $
                                                                              59))
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              61)))
                                                          ('T
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 30))
                                                            1 (QREFELT $ 32))))
                                                         #14#)
                                                        . #16#)))
                                                (LETT #13# (CDR #13#) . #16#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #14#))))
                                          . #16#)
                                    (LETT |dvvec|
                                          (SPADCALL
                                           (PROGN
                                            (LETT #12# NIL . #16#)
                                            (SEQ (LETT |c| NIL . #16#)
                                                 (LETT #11# |vlst| . #16#) G190
                                                 (COND
                                                  ((OR (ATOM #11#)
                                                       (PROGN
                                                        (LETT |c| (CAR #11#)
                                                              . #16#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #12#
                                                         (CONS
                                                          (SPADCALL |c| |x|
                                                                    (QREFELT $
                                                                             41))
                                                          #12#)
                                                         . #16#)))
                                                 (LETT #11# (CDR #11#) . #16#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #12#))))
                                           (QREFELT $ 63))
                                          . #16#)
                                    (EXIT
                                     (LETT |ulst|
                                           (PROGN
                                            (LETT #10# NIL . #16#)
                                            (SEQ (LETT |kk| NIL . #16#)
                                                 (LETT #9# |lk| . #16#) G190
                                                 (COND
                                                  ((OR (ATOM #9#)
                                                       (PROGN
                                                        (LETT |kk| (CAR #9#)
                                                              . #16#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #10#
                                                         (CONS
                                                          (COND
                                                           ((SPADCALL |kk|
                                                                      '|log|
                                                                      (QREFELT
                                                                       $ 59))
                                                            (SPADCALL
                                                             (SPADCALL |kk|
                                                                       (QREFELT
                                                                        $ 30))
                                                             1 (QREFELT $ 32)))
                                                           ('T
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 61))))
                                                          #10#)
                                                         . #16#)))
                                                 (LETT #9# (CDR #9#) . #16#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #10#))))
                                           . #16#)))))
                                 (LETT |su|
                                       (SPADCALL |dvvec|
                                                 (SPADCALL
                                                  (SPADCALL |lprod| |x|
                                                            (QREFELT $ 41))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |deg1|
                                                              (QREFELT $ 76))
                                                    (QREFELT $ 77))
                                                   |lprod| (QREFELT $ 52))
                                                  (QREFELT $ 78))
                                                 (QREFELT $ 66))
                                       . #16#)
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) "iterate")
                                        ('T
                                         (SEQ (LETT |sv| (QCDR |su|) . #16#)
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT $ 70))
                                                    . #16#)
                                              (LETT |d| (QCDR |cd|) . #16#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT $ 71))
                                                 "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT $ 52)
                                                                  (PROGN
                                                                   (LETT #7#
                                                                         NIL
                                                                         . #16#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #6#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #16#)
                                                                    (LETT |ui|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #5#
                                                                          |ulst|
                                                                          . #16#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #5#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ui|
                                                                         (CAR
                                                                          #5#)
                                                                         . #16#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #6#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #6#)
                                                                         . #16#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #7#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              |ui|
                                                                              |ki|
                                                                              (QREFELT
                                                                               $
                                                                               72))
                                                                             #7#)
                                                                            . #16#)))
                                                                    (LETT #5#
                                                                          (PROG1
                                                                              (CDR
                                                                               #5#)
                                                                            (LETT
                                                                             #6#
                                                                             (CDR
                                                                              #6#)
                                                                             . #16#))
                                                                          . #16#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #7#))))
                                                                  (QREFELT $
                                                                           74))
                                                        . #16#)
                                                  (LETT |k2|
                                                        (SPADCALL (ELT $ 75)
                                                                  (PROGN
                                                                   (LETT #4#
                                                                         NIL
                                                                         . #16#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #3#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #16#)
                                                                    (LETT |c|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #2#
                                                                          |vlst|
                                                                          . #16#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #2#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |c|
                                                                         (CAR
                                                                          #2#)
                                                                         . #16#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #3#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #3#)
                                                                         . #16#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #4#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |ki|
                                                                                (QREFELT
                                                                                 $
                                                                                 76))
                                                                               (QREFELT
                                                                                $
                                                                                77))
                                                                              |c|
                                                                              (QREFELT
                                                                               $
                                                                               52))
                                                                             #4#)
                                                                            . #16#)))
                                                                    (LETT #2#
                                                                          (PROG1
                                                                              (CDR
                                                                               #2#)
                                                                            (LETT
                                                                             #3#
                                                                             (CDR
                                                                              #3#)
                                                                             . #16#))
                                                                          . #16#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #4#))))
                                                                  (QREFELT $
                                                                           74))
                                                        . #16#)
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT $
                                                                             34))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 54)
                                                                    1
                                                                    (QREFELT $
                                                                             55))
                                                                   (QREFELT $
                                                                            35))
                                                                  (QREFELT $
                                                                           58))
                                                        . #16#)
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR $ |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 47)))
                                                    (EXIT "iterate")))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT $
                                                                            75))
                                                                  1)
                                                          |res|)
                                                         . #16#)))))))))))))))))))))))
               (LETT #15# (CDR #15#) . #16#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |INTDEN;poly_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                      (QREFELT $ 44)))))) 

(SDEFUN |INTDEN;poly_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                      (QREFELT $ 44)))))) 

(SDEFUN |INTDEN;decompose;Sup2L;6|
        ((|nn| |SparseUnivariatePolynomial| (|Expression| R))
         (|dens| |List| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |List| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|cden| (|Factored| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|cnum| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|ct|
           (|PartialFraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|i| NIL) (#1=#:G306 NIL) (|fden| NIL) (|nfacs| (|Integer|))
          (|pfr|
           (|PartialFraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nd| (|Factored| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|fdens|
           (|List|
            (|Factored| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (#2=#:G305 NIL) (|nden| NIL) (#3=#:G304 NIL))
         (SEQ
          (LETT |fdens|
                (PROGN
                 (LETT #3# NIL . #4=(|INTDEN;decompose;Sup2L;6|))
                 (SEQ (LETT |nden| NIL . #4#) (LETT #2# |dens| . #4#) G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |nden| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3# (CONS (SPADCALL |nden| 1 (QREFELT $ 80)) #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |nd| (SPADCALL (ELT $ 82) |fdens| (QREFELT $ 85)) . #4#)
          (LETT |pfr| (SPADCALL |nn| |nd| (QREFELT $ 87)) . #4#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pfr| (QREFELT $ 88)) (|spadConstant| $ 39)
                       (QREFELT $ 89))
             (|error| "decompose: wholePart(pfr) ~= 0"))
            ('T
             (SEQ (LETT |nfacs| (SPADCALL |pfr| (QREFELT $ 90)) . #4#)
                  (LETT |res| NIL . #4#)
                  (SEQ (LETT |fden| NIL . #4#) (LETT #1# |fdens| . #4#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |fden| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |i| 1 . #4#) G190
                              (COND ((|greater_SI| |i| |nfacs|) (GO G191)))
                              (SEQ
                               (LETT |ct| (SPADCALL |pfr| |i| (QREFELT $ 91))
                                     . #4#)
                               (LETT |cnum| (SPADCALL |ct| (QREFELT $ 92))
                                     . #4#)
                               (LETT |cden| (SPADCALL |ct| (QREFELT $ 93))
                                     . #4#)
                               (EXIT
                                (COND
                                 ((SPADCALL |cden| |fden| (QREFELT $ 94))
                                  (LETT |res| (CONS |cnum| |res|) . #4#)))))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))))))) 

(SDEFUN |INTDEN;decompose1|
        ((|nn| |SparseUnivariatePolynomial| (|Expression| R))
         (|elden| |SparseUnivariatePolynomial| (|Expression| R))
         (|lidens| |List| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |List| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| (|Expression| R)))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0 (QREFELT $ 53))
            (LETT |lidens| (CONS |elden| |lidens|) . #1=(|INTDEN;decompose1|)))
           ((SPADCALL |elden| (|spadConstant| $ 50) (QREFELT $ 89))
            (|error| "Impossible 5")))
          (LETT |res| (SPADCALL |nn| |lidens| (QREFELT $ 96)) . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0 (QREFELT $ 53))
             |res|)
            ('T (CONS (|spadConstant| $ 39) |res|))))))) 

(SDEFUN |INTDEN;p_power_in_q|
        ((|p| |SparseMultivariatePolynomial| (|Expression| R)
          (|Kernel| (|Expression| R)))
         (|q| |SparseMultivariatePolynomial| (|Expression| R)
          (|Kernel| (|Expression| R)))
         ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (#1=#:G312 NIL)
          (|qq|
           (|Union|
            (|SparseMultivariatePolynomial| (|Expression| R)
                                            (|Kernel| (|Expression| R)))
            "failed")))
         (SEQ (LETT |res| 0 . #2=(|INTDEN;p_power_in_q|))
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR
                       (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 99)) . #2#) 0))
                     (GO G191)))
                   (SEQ
                    (LETT |q|
                          (PROG2 (LETT #1# |qq| . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0)
                                           (|SparseMultivariatePolynomial|
                                            (|Expression| (QREFELT $ 6))
                                            (|Kernel|
                                             (|Expression| (QREFELT $ 6))))
                                           #1#))
                          . #2#)
                    (EXIT (LETT |res| (+ |res| 1) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTDEN;MP_to_MPF|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|lk| |List| (|Kernel| (|Expression| R)))
         ($ |SparseMultivariatePolynomial| (|Expression| R)
          (|Kernel| (|Expression| R))))
        (SPROG NIL
               (SPADCALL (CONS #'|INTDEN;MP_to_MPF!0| (VECTOR $ |lk|))
                         (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 109)))) 

(SDEFUN |INTDEN;MP_to_MPF!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 77)) (QREFELT $ 105))) 

(SDEFUN |INTDEN;MP_to_MPF!0| ((|k| NIL) ($$ NIL))
        (PROG (|lk| $)
          (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |k| |lk| (QREFELT $ 101))
              (SPADCALL (|spadConstant| $ 102) |k| (|spadConstant| $ 103)
                        (QREFELT $ 104)))
             ('T (SPADCALL (SPADCALL |k| (QREFELT $ 61)) (QREFELT $ 105)))))))) 

(SDEFUN |INTDEN;solve_u;2ESU;10|
        ((|f1| |Expression| R) (|u| |Expression| R) (|x| |Symbol|)
         ($ |Union| (|List| (|List| (|Expression| R))) "failed"))
        (SPROG
         ((#1=#:G380 NIL) (|c| NIL) (|j| NIL) (#2=#:G379 NIL) (#3=#:G369 NIL)
          (#4=#:G378 NIL) (|sl| (|List| (|Expression| R)))
          (|sl0| (|Union| (|List| (|Expression| R)) "failed"))
          (|eqsl| (|List| (|Expression| R)))
          (|eqs|
           (|SparseMultivariatePolynomial| (|Expression| R)
                                           (|Kernel| (|Expression| R))))
          (#5=#:G376 NIL) (|p1| NIL) (#6=#:G377 NIL) (|coef| NIL)
          (|lpow|
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| R)
                                            (|Kernel| (|Expression| R)))))
          (|pp|
           #7=(|SparseMultivariatePolynomial| (|Expression| R)
                                              (|Kernel| (|Expression| R))))
          (#8=#:G375 NIL) (|lpow0| (|List| #7#)) (|coefs| (|List| (|Symbol|)))
          (#9=#:G374 NIL)
          (|nf1|
           #10=(|SparseMultivariatePolynomial| (|Expression| R)
                                               (|Kernel| (|Expression| R))))
          (|cc| (|Expression| R)) (|ccru| (|Union| (|Expression| R) "failed"))
          (|ccu|
           (|Union|
            (|SparseMultivariatePolynomial| (|Expression| R)
                                            (|Kernel| (|Expression| R)))
            "failed"))
          (|dup| #7#) (#11=#:G340 NIL) (|nup| #7#) (#12=#:G338 NIL)
          (|m| (|Integer|)) (|n| (|Integer|))
          (|qu| (|Union| (|NonNegativeInteger|) "failed"))
          (|degdu| #13=(|NonNegativeInteger|)) (|degnu| #13#) (|degdf| #13#)
          (|degnf| #13#) (|du| #10#) (|nu| #10#) (|df1| #10#)
          (|vk2| (|List| #14=(|Kernel| (|Expression| R)))) (#15=#:G373 NIL)
          (|k| NIL) (#16=#:G372 NIL) (|k1| (|Kernel| (|Expression| R)))
          (|vk| (|List| #14#)) (#17=#:G371 NIL) (#18=#:G370 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |vk|
                  (PROGN
                   (LETT #18# NIL . #19=(|INTDEN;solve_u;2ESU;10|))
                   (SEQ (LETT |k| NIL . #19#)
                        (LETT #17# (SPADCALL |u| (QREFELT $ 111)) . #19#) G190
                        (COND
                         ((OR (ATOM #17#)
                              (PROGN (LETT |k| (CAR #17#) . #19#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 61)) |x|
                                       (QREFELT $ 41))
                             (|spadConstant| $ 42) (QREFELT $ 112))
                            (LETT #18# (CONS |k| #18#) . #19#)))))
                        (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                        (EXIT (NREVERSE #18#))))
                  . #19#)
            (EXIT
             (COND ((NULL |vk|) (|error| "solve_u: constant u"))
                   (#20='T
                    (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 113)) . #19#)
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 41))
                                      (|spadConstant| $ 42) (QREFELT $ 44))
                            (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 42)))))
                           (#20#
                            (SEQ
                             (LETT |vk2|
                                   (PROGN
                                    (LETT #16# NIL . #19#)
                                    (SEQ (LETT |k| NIL . #19#)
                                         (LETT #15#
                                               (SPADCALL |f1| (QREFELT $ 111))
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
                                               (SPADCALL |k| (QREFELT $ 61))
                                               |x| (QREFELT $ 41))
                                              (|spadConstant| $ 42)
                                              (QREFELT $ 112))
                                             (LETT #16# (CONS |k| #16#)
                                                   . #19#)))))
                                         (LETT #15# (CDR #15#) . #19#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #16#))))
                                   . #19#)
                             (COND
                              ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 114)))
                               (COND
                                ((NULL
                                  (NULL (SPADCALL |vk| |vk2| (QREFELT $ 114))))
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (CONS 1 #21="failed") . #19#)
                                   (GO #22=#:G368))))))
                              (#20#
                               (EXIT
                                (PROGN
                                 (LETT #3# (CONS 1 #21#) . #19#)
                                 (GO #22#)))))
                             (LETT |nf1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 115)) |vk| $)
                                   . #19#)
                             (LETT |df1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 116)) |vk| $)
                                   . #19#)
                             (LETT |nu|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 115)) |vk| $)
                                   . #19#)
                             (LETT |du|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 116)) |vk| $)
                                   . #19#)
                             (LETT |degnf|
                                   (SPADCALL |nf1| |k1| (QREFELT $ 117))
                                   . #19#)
                             (LETT |degdf|
                                   (SPADCALL |df1| |k1| (QREFELT $ 117))
                                   . #19#)
                             (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 117))
                                   . #19#)
                             (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 117))
                                   . #19#)
                             (COND
                              ((EQL |degdu| 0)
                               (SEQ
                                (LETT |qu|
                                      (SPADCALL |degdf| |degnu|
                                                (QREFELT $ 118))
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
                                                        (QREFELT $ 118))
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
                                                (QREFELT $ 118))
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
                                                        (QREFELT $ 118))
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
                                    (QREFELT $ 71))
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed") . #19#)
                                    (GO #22#))))))))
                             (LETT |n| (MAX |n| 0) . #19#)
                             (LETT |m| (MAX |m| 0) . #19#)
                             (LETT |nup|
                                   (COND
                                    ((SPADCALL |n| 0 (QREFELT $ 119))
                                     (SPADCALL |nu|
                                               (PROG1 (LETT #12# |n| . #19#)
                                                 (|check_subtype| (>= #12# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #12#))
                                               (QREFELT $ 120)))
                                    (#20# (|spadConstant| $ 102)))
                                   . #19#)
                             (LETT |dup|
                                   (COND
                                    ((SPADCALL |m| 0 (QREFELT $ 119))
                                     (SPADCALL |du|
                                               (PROG1 (LETT #11# |m| . #19#)
                                                 (|check_subtype| (>= #11# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #11#))
                                               (QREFELT $ 120)))
                                    (#20# (|spadConstant| $ 102)))
                                   . #19#)
                             (LETT |ccu|
                                   (SPADCALL |df1|
                                             (SPADCALL |dup| |nup|
                                                       (QREFELT $ 121))
                                             (QREFELT $ 99))
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
                                       (SPADCALL (QCDR |ccu|) (QREFELT $ 123))
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
                                                (SPADCALL (|spadConstant| $ 54)
                                                          |cc| (QREFELT $ 78))
                                                |nf1| (QREFELT $ 126))
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
                                                               (QREFELT $ 127))
                                                              #9#)
                                                             . #19#)))
                                                     (LETT |j| (+ |j| 1)
                                                           . #19#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               . #19#)
                                         (LETT |eqs| |nf1| . #19#)
                                         (LETT |pp| (|spadConstant| $ 102)
                                               . #19#)
                                         (LETT |lpow0| (LIST |pp|) . #19#)
                                         (SEQ (LETT |j| (- 1 |n|) . #19#) G190
                                              (COND ((> |j| |m|) (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |nu| |pp|
                                                               (QREFELT $ 121))
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
                                         (LETT |pp| (|spadConstant| $ 102)
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
                                                               (QREFELT $ 121))
                                                     . #19#)
                                               (EXIT
                                                (LETT |lpow|
                                                      (CONS
                                                       (SPADCALL |pp| |p1|
                                                                 (QREFELT $
                                                                          121))
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
                                                                           128))
                                                                 |p1|
                                                                 (QREFELT $
                                                                          126))
                                                                (QREFELT $
                                                                         129))
                                                      . #19#)))
                                              (LETT #5#
                                                    (PROG1 (CDR #5#)
                                                      (LETT #6# (CDR #6#)
                                                            . #19#))
                                                    . #19#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |eqsl|
                                               (SPADCALL |eqs| (QREFELT $ 130))
                                               . #19#)
                                         (LETT |sl0|
                                               (SPADCALL |eqsl| |coefs|
                                                         (QREFELT $ 134))
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
                                                       (|spadConstant| $ 42)
                                                       (QREFELT $ 112))
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
                                                                     $ 42)
                                                                    (QREFELT $
                                                                             112))
                                                          (LETT #2#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         48)))
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
        ((|f| |Expression| R) (|u| |Expression| R) (|x| |Symbol|)
         ($ |Union| (|List| (|List| (|Expression| R))) "failed"))
        (SPROG ((|deru| (|Expression| R)))
               (SEQ
                (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 41))
                      |INTDEN;li_int1|)
                (EXIT
                 (COND
                  ((SPADCALL |deru| (|spadConstant| $ 42) (QREFELT $ 44))
                   (|error| "li_int1: constant log"))
                  ('T
                   (SPADCALL (SPADCALL |f| |deru| (QREFELT $ 78)) |u| |x|
                             (QREFELT $ 136)))))))) 

(SDEFUN |INTDEN;mk_li|
        ((|c| |Expression| R) (|j| |Integer|) (|u| |Expression| R)
         (|s| |Expression| R) ($ |Expression| R))
        (SPROG ((|es| (|Expression| R)))
               (SEQ
                (COND
                 ((EQL |j| -1)
                  (SPADCALL |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u| (QREFELT $ 137)) |s|
                                       (QREFELT $ 75))
                             (QREFELT $ 137))
                            (QREFELT $ 52)))
                 ('T
                  (SEQ
                   (LETT |es| (SPADCALL |s| (QREFELT $ 138)) |INTDEN;mk_li|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (SPADCALL |u| |es| (QREFELT $ 52))
                                          (+ |j| 1) (QREFELT $ 72))
                                (QREFELT $ 139))
                               (QREFELT $ 52))
                     (SPADCALL |es| (+ |j| 1) (QREFELT $ 72))
                     (QREFELT $ 78))))))))) 

(SDEFUN |INTDEN;UP2UPR|
        ((|p| |SparseUnivariatePolynomial| (|Expression| R))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
        (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 145))) 

(SDEFUN |INTDEN;UP2UPR!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 56)) (QREFELT $ 141))) 

(SDEFUN |INTDEN;li_int3|
        ((|f| |Expression| R)
         (|rf| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         (|lk| |List| (|Kernel| (|Expression| R))) (|x| |Symbol|)
         ($ |Union|
          (|Record|
           (|:| |answer|
                (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
           (|:| |logpart|
                (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Expression| R))))))
          "failed"))
        (SPROG
         ((|res| (|Expression| R)) (#1=#:G426 NIL) (|zz| NIL)
          (|lle| (|Expression| R))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction|
                             (|SparseUnivariatePolynomial| (|Expression| R)))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction|
                             (|SparseUnivariatePolynomial|
                              (|Expression| R))))))))
          (#2=#:G425 NIL) (|e| NIL) (|zzl| (|List| (|Expression| R)))
          (|rf1k| (|Kernel| (|Expression| R)))
          (|elpart|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lli| (|List| (|List| (|Expression| R)))) (#3=#:G420 NIL)
          (|liu| (|Union| (|List| (|List| (|Expression| R))) "failed"))
          (|tf| (|Expression| R)) (|c_shift| (|Expression| R))
          (|ddf| (|Expression| R)) (|rf1| (|Expression| R))
          (|rfc| (|Expression| R)) (|deg1| (|NonNegativeInteger|))
          (|u1| (|Expression| R))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|liden| #4=(|SparseUnivariatePolynomial| (|Expression| R)))
          (#5=#:G423 NIL) (|ldr| NIL) (#6=#:G424 NIL) (|linum| NIL)
          (|u0| (|Expression| R)) (|dummy| (|SingletonAsOrderedSet|))
          (|linums| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|dn| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elden|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|lidens| (|List| #4#)) (#7=#:G422 NIL) (#8=#:G421 NIL)
          (|ldrs|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
             (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;li_factors| (SPADCALL |f| (QREFELT $ 116)) |k| |lk|
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
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 146))
                                     (SPADCALL (ELT $ 81) |lidens|
                                               (QREFELT $ 148))
                                     (QREFELT $ 149))
                           . #9#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                            (#10#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 150))
                                     (QCDR |elden|) |lidens| $)
                                    . #9#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 151))
                                    . #9#)
                              (LETT |linums| (CDR |dn|) . #9#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #9#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                              (QREFELT $ 32))
                                    . #9#)
                              (LETT |res| (|spadConstant| $ 42) . #9#)
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
                                           ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 152))
                                                   . #9#)
                                             (LETT |c_shift|
                                                   (SPADCALL |rfc|
                                                             (QREFELT $ 153))
                                                   . #9#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 3)
                                                             (QREFELT $ 154))
                                                   . #9#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |liden|
                                                               (QREFELT $ 155))
                                                     |dummy| |rf1|
                                                     (QREFELT $ 156))
                                                    (QREFELT $ 157))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |linum| |dummy|
                                                                |rf1|
                                                                (QREFELT $
                                                                         156))
                                                      (QREFELT $ 157))
                                                     |ddf| (QREFELT $ 78))
                                                    . #9#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 0
                                                             (QREFELT $ 51))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |linum|
                                                              (QREFELT $ 157))
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
                                            (GO #11=#:G419)))
                                          ('T
                                           (SEQ (LETT |lli| (QCDR |liu|) . #9#)
                                                (COND
                                                 ((EQL (LENGTH |lli|) 1)
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |lli| 1
                                                                (QREFELT $
                                                                         159))
                                                      2 (QREFELT $ 32))
                                                     (SPADCALL
                                                      (|spadConstant| $ 54)
                                                      (QREFELT $ 153))
                                                     (QREFELT $ 44))
                                                    (EXIT
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (LETT |logs|
                                                             (CONS
                                                              (VECTOR
                                                               (|spadConstant|
                                                                $ 161)
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 162)
                                                                 1
                                                                 (QREFELT $
                                                                          163))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |lli| 1
                                                                     (QREFELT $
                                                                              159))
                                                                    1
                                                                    (QREFELT $
                                                                             32))
                                                                   (QREFELT $
                                                                            56))
                                                                  (QREFELT $
                                                                           141))
                                                                 (QREFELT $
                                                                          164))
                                                                (QREFELT $
                                                                         165))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |liden|
                                                                 (QREFELT $
                                                                          141))
                                                                (QREFELT $
                                                                         164)))
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
                                                                         151))
                                                                       (QREFELT
                                                                        $ 166))
                                                             . #9#))))))))
                                                (COND
                                                 ((SPADCALL |deg1| 1
                                                            (QREFELT $ 53))
                                                  (SEQ
                                                   (LETT |rf1k|
                                                         (SPADCALL |rfc|
                                                                   (QREFELT $
                                                                            167))
                                                         . #9#)
                                                   (EXIT
                                                    (LETT |zzl|
                                                          (SPADCALL |cfac|
                                                                    (QREFELT $
                                                                             169))
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
                                                                           54)
                                                           (QREFELT $ 153))
                                                          (QREFELT $ 44))
                                                         (COND
                                                          ((EQL |deg1| 1)
                                                           (EXIT
                                                            (LETT |logs|
                                                                  (CONS
                                                                   (VECTOR
                                                                    (|spadConstant|
                                                                     $ 161)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       $ 162)
                                                                      1
                                                                      (QREFELT
                                                                       $ 163))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |e| 1
                                                                         (QREFELT
                                                                          $
                                                                          32))
                                                                        (QREFELT
                                                                         $ 56))
                                                                       (QREFELT
                                                                        $ 141))
                                                                      (QREFELT
                                                                       $ 164))
                                                                     (QREFELT $
                                                                              165))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |liden|
                                                                      (QREFELT
                                                                       $ 141))
                                                                     (QREFELT $
                                                                              164)))
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
                                                               (QREFELT $ 170))
                                                              |u1| |c_shift| $)
                                                             . #9#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             53))
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
                                                                              171))
                                                                    (QREFELT $
                                                                             75))
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
                                                                           75))
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
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                                (QREFELT $ 141))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 172) |logs|
                                                NIL
                                                (QREFELT $ 178)))))))))))))))
          #11# (EXIT #3#)))) 

(SDEFUN |INTDEN;mk_poly|
        ((|c| |Expression| R) (|j| |Integer|) (|u| |Expression| R)
         (|s| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|ifac| (|Expression| R)) (|res| (|Expression| R)) (|i1| (|Integer|))
          (|i| NIL) (|j1| (|Integer|)) (|eu| (|Expression| R)))
         (SEQ
          (COND
           ((EQL |j| 0)
            (SPADCALL |c|
                      (SPADCALL |u|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |u| (QREFELT $ 138))
                                           (SPADCALL (|spadConstant| $ 54) |s|
                                                     (QREFELT $ 78))
                                           (QREFELT $ 75))
                                 (QREFELT $ 137))
                                (QREFELT $ 154))
                      (QREFELT $ 52)))
           ('T
            (SEQ
             (LETT |eu|
                   (SPADCALL |s| (SPADCALL |u| (QREFELT $ 138)) (QREFELT $ 52))
                   . #1=(|INTDEN;mk_poly|))
             (LETT |j1| (+ |j| 1) . #1#)
             (LETT |res|
                   (SPADCALL (SPADCALL |u| |j1| (QREFELT $ 72))
                             (SPADCALL (SPADCALL |j1| (QREFELT $ 76))
                                       (QREFELT $ 77))
                             (QREFELT $ 78))
                   . #1#)
             (LETT |res|
                   (SPADCALL |res|
                             (SPADCALL (SPADCALL |u| |j| (QREFELT $ 72))
                                       (SPADCALL
                                        (SPADCALL |eu| (|spadConstant| $ 54)
                                                  (QREFELT $ 75))
                                        (QREFELT $ 137))
                                       (QREFELT $ 52))
                             (QREFELT $ 154))
                   . #1#)
             (LETT |ifac|
                   (SPADCALL
                    (SPADCALL (SPADCALL |j| (QREFELT $ 76)) (QREFELT $ 77))
                    (QREFELT $ 153))
                   . #1#)
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |j|) (GO G191)))
                  (SEQ (LETT |i1| (- |j| |i|) . #1#)
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL
                                        (SPADCALL |ifac|
                                                  (SPADCALL |u| |i1|
                                                            (QREFELT $ 72))
                                                  (QREFELT $ 52))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (+ |i| 1) (QREFELT $ 76))
                                          (QREFELT $ 77))
                                         (SPADCALL |eu| (QREFELT $ 153))
                                         (QREFELT $ 179))
                                        (QREFELT $ 52))
                                       (QREFELT $ 75))
                             . #1#)
                       (EXIT
                        (LETT |ifac|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |i1| (QREFELT $ 76))
                                          (QREFELT $ 77))
                                |ifac| (QREFELT $ 52))
                               (QREFELT $ 153))
                              . #1#)))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |c| |res| (QREFELT $ 52))))))))) 

(SDEFUN |INTDEN;poly_int3|
        ((|f| |Expression| R)
         (|rf| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         (|lk| |List| (|Kernel| (|Expression| R))) (|x| |Symbol|)
         ($ |Union|
          (|Record|
           (|:| |answer|
                (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
           (|:| |logpart|
                (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
           (|:| |ir|
                (|IntegrationResult|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Expression| R))))))
          "failed"))
        (SPROG
         ((|res| (|Expression| R)) (#1=#:G466 NIL) (|zz| NIL)
          (|lle| (|Expression| R)) (#2=#:G458 NIL) (|ii| (|Integer|))
          (#3=#:G465 NIL) (|e| NIL) (|zzl| (|List| (|Expression| R)))
          (|rf1k| (|Kernel| (|Expression| R)))
          (|elpart|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lpoly| (|List| (|List| (|Expression| R))))
          (|polyu| (|Union| (|List| (|List| (|Expression| R))) "failed"))
          (|tf| #4=(|Expression| R)) (|c_shift| #4#) (|ddf| (|Expression| R))
          (|rf1| (|Expression| R)) (|rfc| (|Expression| R))
          (|deg1| (|NonNegativeInteger|))
          (|polynum| #5=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|v1| (|Expression| R))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|polyden| #6=(|SparseUnivariatePolynomial| (|Expression| R)))
          (#7=#:G463 NIL) (|ldr| NIL) (#8=#:G464 NIL) (|polynum1| NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction|
                             (|SparseUnivariatePolynomial| (|Expression| R)))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction|
                             (|SparseUnivariatePolynomial|
                              (|Expression| R))))))))
          (|u0| (|Expression| R)) (|dummy| (|SingletonAsOrderedSet|))
          (|polynums1|
           (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|dn| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elden|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|polydens1| (|List| #5#)) (#9=#:G462 NIL) (|p| NIL) (#10=#:G461 NIL)
          (|polydens| (|List| #6#)) (#11=#:G460 NIL) (#12=#:G459 NIL)
          (|ldrs|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |cfactor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ufun| (|Expression| R)) (|:| |vfun| (|Expression| R))
             (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;poly_factors| (SPADCALL |f| (QREFELT $ 116)) |k|
                   |lk| |x| $)
                  . #13=(|INTDEN;poly_int3|))
            (LETT |polydens|
                  (PROGN
                   (LETT #12# NIL . #13#)
                   (SEQ (LETT |ldr| NIL . #13#) (LETT #11# |ldrs| . #13#) G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |ldr| (CAR #11#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT #12# (CONS (QVELT |ldr| 0) #12#) . #13#)))
                        (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #13#)
            (EXIT
             (COND ((NULL |polydens|) (CONS 1 "failed"))
                   (#14='T
                    (SEQ
                     (LETT |polydens1|
                           (PROGN
                            (LETT #10# NIL . #13#)
                            (SEQ (LETT |p| NIL . #13#)
                                 (LETT #9# |polydens| . #13#) G190
                                 (COND
                                  ((OR (ATOM #9#)
                                       (PROGN (LETT |p| (CAR #9#) . #13#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #10#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 33))
                                            (QREFELT $ 34))
                                           |p| (QREFELT $ 35))
                                          #10#)
                                         . #13#)))
                                 (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                                 (EXIT (NREVERSE #10#))))
                           . #13#)
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 146))
                                     (SPADCALL (ELT $ 81) |polydens1|
                                               (QREFELT $ 148))
                                     (QREFELT $ 149))
                           . #13#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                            (#14#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 150))
                                     (QCDR |elden|) |polydens1| $)
                                    . #13#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 151))
                                    . #13#)
                              (LETT |polynums1| (CDR |dn|) . #13#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #13#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                              (QREFELT $ 32))
                                    . #13#)
                              (LETT |res| (|spadConstant| $ 42) . #13#)
                              (LETT |logs| NIL . #13#)
                              (SEQ (LETT |polynum1| NIL . #13#)
                                   (LETT #8# |polynums1| . #13#)
                                   (LETT |ldr| NIL . #13#)
                                   (LETT #7# |ldrs| . #13#) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN
                                          (LETT |ldr| (CAR #7#) . #13#)
                                          NIL)
                                         (ATOM #8#)
                                         (PROGN
                                          (LETT |polynum1| (CAR #8#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |polyden| (QVELT |ldr| 0) . #13#)
                                        (LETT |cfac| (QVELT |ldr| 1) . #13#)
                                        (LETT |v1| (QVELT |ldr| 3) . #13#)
                                        (LETT |polynum|
                                              (SPADCALL
                                               (SPADCALL |polyden|
                                                         (QREFELT $ 33))
                                               |polynum1| (QREFELT $ 35))
                                              . #13#)
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |polyden|
                                                         (QREFELT $ 37))
                                               . #13#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 152))
                                                   . #13#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 2)
                                                             (QREFELT $ 78))
                                                   . #13#)
                                             (LETT |c_shift|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|spadConstant| $ 54)
                                                     |rfc| (QREFELT $ 78))
                                                    (QREFELT $ 153))
                                                   . #13#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |cfac|
                                                               (QREFELT $ 155))
                                                     |dummy| |rfc|
                                                     (QREFELT $ 156))
                                                    (QREFELT $ 157))
                                                   . #13#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |polynum|
                                                                 |dummy| |rf1|
                                                                 (QREFELT $
                                                                          156))
                                                       (QREFELT $ 157))
                                                      (SPADCALL |rfc| |ddf|
                                                                (QREFELT $ 52))
                                                      (QREFELT $ 78))
                                                     (QREFELT $ 153))
                                                    . #13#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 1
                                                             (QREFELT $ 51))
                                                   . #13#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |polynum|
                                                              (QREFELT $ 157))
                                                    . #13#)))))))
                                        (LETT |polyu|
                                              (|INTDEN;li_int1| |tf| |v1| |x|
                                               $)
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |polyu| 1)
                                           (PROGN
                                            (LETT #2# (CONS 1 "failed") . #13#)
                                            (GO #15=#:G457)))
                                          ('T
                                           (SEQ
                                            (LETT |lpoly| (QCDR |polyu|)
                                                  . #13#)
                                            (COND
                                             ((EQL (LENGTH |lpoly|) 1)
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |lpoly| 1
                                                            (QREFELT $ 159))
                                                  2 (QREFELT $ 32))
                                                 (|spadConstant| $ 42)
                                                 (QREFELT $ 44))
                                                (EXIT
                                                 (LETT |elpart|
                                                       (SPADCALL |elpart|
                                                                 (SPADCALL
                                                                  |polynum|
                                                                  |polyden|
                                                                  (QREFELT $
                                                                           151))
                                                                 (QREFELT $
                                                                          166))
                                                       . #13#))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 53))
                                              (SEQ
                                               (LETT |rf1k|
                                                     (SPADCALL |rfc|
                                                               (QREFELT $ 167))
                                                     . #13#)
                                               (EXIT
                                                (LETT |zzl|
                                                      (SPADCALL |cfac|
                                                                (QREFELT $
                                                                         169))
                                                      . #13#)))))
                                            (EXIT
                                             (SEQ (LETT |e| NIL . #13#)
                                                  (LETT #3# |lpoly| . #13#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #3#)
                                                        (PROGN
                                                         (LETT |e| (CAR #3#)
                                                               . #13#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |ii|
                                                         (SPADCALL
                                                          (SPADCALL |e| 2
                                                                    (QREFELT $
                                                                             32))
                                                          (QREFELT $ 170))
                                                         . #13#)
                                                   (EXIT
                                                    (COND
                                                     ((< |ii| 0)
                                                      (PROGN
                                                       (LETT #2#
                                                             (CONS 1 "failed")
                                                             . #13#)
                                                       (GO #15#)))
                                                     ((SPADCALL
                                                       (SPADCALL |e| 1
                                                                 (QREFELT $
                                                                          32))
                                                       (|spadConstant| $ 42)
                                                       (QREFELT $ 44))
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
                                                             . #13#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             53))
                                                          (SEQ
                                                           (LETT |zz| NIL
                                                                 . #13#)
                                                           (LETT #1# |zzl|
                                                                 . #13#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #1#)
                                                                 (PROGN
                                                                  (LETT |zz|
                                                                        (CAR
                                                                         #1#)
                                                                        . #13#)
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
                                                                              171))
                                                                    (QREFELT $
                                                                             75))
                                                                   . #13#)))
                                                           (LETT #1# (CDR #1#)
                                                                 . #13#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                         ('T
                                                          (LETT |res|
                                                                (SPADCALL |res|
                                                                          |lle|
                                                                          (QREFELT
                                                                           $
                                                                           75))
                                                                . #13#)))))))))
                                                  (LETT #3# (CDR #3#) . #13#)
                                                  (GO G190) G191
                                                  (EXIT NIL))))))))
                                   (LETT #7#
                                         (PROG1 (CDR #7#)
                                           (LETT #8# (CDR #8#) . #13#))
                                         . #13#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (CONS 0
                                     (VECTOR
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                                (QREFELT $ 141))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 172) |logs|
                                                NIL
                                                (QREFELT $ 178)))))))))))))))
          #15# (EXIT #2#)))) 

(SDEFUN |INTDEN;li_int;FKSR;17|
        ((|rf| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         ($ |Record|
          (|:| |answer|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Expression| R)))))))
        (SPROG
         ((|res|
           (|Union|
            (|Record|
             (|:| |answer|
                  (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
             (|:| |logpart|
                  (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction|
                    (|SparseUnivariatePolynomial| (|Expression| R))))))
            "failed"))
          (|lk| (|List| (|Kernel| (|Expression| R)))) (#1=#:G474 NIL)
          (|kk| NIL) (#2=#:G473 NIL) (|f| (|Expression| R)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
                . #3=(|INTDEN;li_int;FKSR;17|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 182)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 59))
                                  (SPADCALL |kk| |k| (QREFELT $ 183)))
                                 (#4='T 'NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 185))
                . #3#)
          (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 172) |rf| (|spadConstant| $ 186)))
            (#4# (QCDR |res|))))))) 

(SDEFUN |INTDEN;poly_int;FKSR;18|
        ((|rf| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         ($ |Record|
          (|:| |answer|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction|
                 (|SparseUnivariatePolynomial| (|Expression| R)))))))
        (SPROG
         ((|res|
           (|Union|
            (|Record|
             (|:| |answer|
                  (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
             (|:| |logpart|
                  (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction|
                    (|SparseUnivariatePolynomial| (|Expression| R))))))
            "failed"))
          (|lk| (|List| (|Kernel| (|Expression| R)))) (#1=#:G481 NIL)
          (|kk| NIL) (#2=#:G480 NIL) (|f| (|Expression| R)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
                . #3=(|INTDEN;poly_int;FKSR;18|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 182)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 59))
                                  (SPADCALL |kk| |k| (QREFELT $ 183)))
                                 (#4='T 'NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 185))
                . #3#)
          (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 172) |rf| (|spadConstant| $ 186)))
            (#4# (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |DenominatorIntegration;|)) 

(DEFUN |DenominatorIntegration| (#1=#:G482)
  (SPROG NIL
         (PROG (#2=#:G483)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DenominatorIntegration|)
                                               '|domainEqualList|)
                    . #3=(|DenominatorIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|DenominatorIntegration;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DenominatorIntegration|)))))))))) 

(DEFUN |DenominatorIntegration;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DenominatorIntegration|))
          (LETT |dv$| (LIST '|DenominatorIntegration| DV$1) . #1#)
          (LETT $ (GETREFV 190) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DenominatorIntegration| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
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
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| $) (|Kernel| 12)
              (|SparseMultivariatePolynomial| 6 8) (0 . |univariate|)
              (|SparseMultivariatePolynomial| 6 60) (|Expression| 6)
              (6 . |coerce|) (|SparseUnivariatePolynomial| 12) (|Mapping| 12 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 12) (11 . |map|)
              '#:G103 (|Factored| 9)
              (|MultivariateFactorize| 8 (|IndexedExponents| 8) 6 9)
              (17 . |factor|) (22 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 31)) (|List| 24)
              (27 . |factors|) (|SingletonAsOrderedSet|) (32 . |create|)
              (|List| 12) (36 . |argument|) (|Integer|) (41 . |elt|)
              (47 . |leadingCoefficient|) (52 . |inv|) (57 . *)
              (|NonNegativeInteger|) (63 . |degree|) (68 . |Zero|)
              (72 . |Zero|) (|Symbol|) (76 . D) (82 . |Zero|) (|Boolean|)
              (86 . =) (92 . |coefficients|) (|Mapping| 43 12) (97 . |every?|)
              (103 . |coerce|) (108 . |One|) (112 . |One|)
              (116 . |coefficient|) (122 . *) (128 . >) (134 . |One|)
              (138 . |monomial|) (144 . |coerce|) (149 . -) (155 . |eval|)
              (162 . |is?|) (|Kernel| $) (168 . |coerce|) (|Vector| 12)
              (173 . |vector|) (|Union| 68 '"failed")
              (|IntegerLinearDependence| 12) (178 . |particularSolutionOverQ|)
              (|Record| (|:| |num| (|List| 31)) (|:| |den| 31)) (|Vector| 160)
              (|InnerCommonDenominator| 31 160 (|List| 31) 68)
              (184 . |splitDenominator|) (189 . ~=) (195 . ^)
              (|Mapping| 12 12 12) (201 . |reduce|) (207 . +) (213 . |coerce|)
              (218 . |coerce|) (223 . /) (|Factored| 14) (229 . |nilFactor|)
              (235 . *) (241 . *) (|Mapping| 79 79 79) (|List| 79)
              (247 . |reduce|) (|PartialFraction| 14) (253 . |partialFraction|)
              (259 . |wholePart|) (264 . ~=) (270 . |numberOfFractionalTerms|)
              (275 . |nthFractionalTerm|) (281 . |firstNumer|)
              (286 . |firstDenom|) (291 . =) (|List| 14)
              |INTDEN;decompose;Sup2L;6| (|Union| $ '"failed")
              (|SparseMultivariatePolynomial| 12 8) (297 . |exquo|) (|List| 8)
              (303 . |member?|) (309 . |One|) (313 . |One|) (317 . |monomial|)
              (324 . |coerce|) (|Mapping| 98 8) (|Mapping| 98 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 6 9 98)
              (329 . |map|) (|List| 60) (336 . |kernels|) (341 . ~=)
              (347 . |last|) (352 . |setDifference|) (358 . |numer|)
              (363 . |denom|) (368 . |degree|) (374 . |exquo|) (380 . >)
              (386 . ^) (392 . *) (|Union| 12 '"failed") (398 . |retractIfCan|)
              (403 . /) (409 . |One|) (413 . *) (419 . |new|) (423 . |coerce|)
              (428 . -) (434 . |coefficients|) (|Union| 29 '"failed")
              (|List| 40) (|ExpressionLinearSolve| 6) (439 . |lin_sol|)
              (|Union| 158 '"failed") |INTDEN;solve_u;2ESU;10| (445 . |log|)
              (450 . |exp|) (455 . |li|) (|Fraction| 14) (460 . |coerce|)
              (|SparseUnivariatePolynomial| 140) (|Mapping| 140 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 14 140 142)
              (465 . |map|) (471 . |denom|) (|Mapping| 14 14 14)
              (476 . |reduce|) (482 . |exquo|) (488 . |numer|) (493 . /)
              (499 . |rootOf|) (504 . -) (509 . -) (515 . |differentiate|)
              (520 . |eval|) (527 . |retract|) (|List| 29) (532 . |elt|)
              (|Fraction| 31) (538 . |One|) (542 . |One|) (546 . |monomial|)
              (552 . |coerce|) (557 . -) (563 . +) (569 . |retract|) (|List| $)
              (574 . |zerosOf|) (579 . |retract|) (584 . |eval|) (591 . |Zero|)
              (|Record| (|:| |scalar| 160) (|:| |coeff| 142)
                        (|:| |logand| 142))
              (|List| 173) (|Record| (|:| |integrand| 140) (|:| |intvar| 140))
              (|List| 175) (|IntegrationResult| 140) (595 . |mkAnswer|)
              (602 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 8) 8 6
                                                     9 12)
              (608 . |multivariate|) (614 . |tower|) (619 . ~=)
              (|IntegrationTools| 6 12) (625 . |varselect|) (631 . |Zero|)
              (|Record| (|:| |answer| 140) (|:| |logpart| 140) (|:| |ir| 177))
              |INTDEN;li_int;FKSR;17| |INTDEN;poly_int;FKSR;18|)
           '#(|solve_u| 635 |poly_int| 642 |li_int| 649 |factor| 656
              |decompose| 661)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 189
                                                 '(2 9 7 0 8 10 1 12 0 11 13 2
                                                   17 14 15 16 18 1 21 20 9 22
                                                   1 0 20 9 23 1 20 25 0 26 0
                                                   27 0 28 1 8 29 0 30 2 29 12
                                                   0 31 32 1 14 12 0 33 1 12 0
                                                   0 34 2 14 0 12 0 35 1 14 36
                                                   0 37 0 6 0 38 0 14 0 39 2 12
                                                   0 0 40 41 0 12 0 42 2 12 43
                                                   0 0 44 1 14 29 0 45 2 29 43
                                                   46 0 47 1 12 0 31 48 0 6 0
                                                   49 0 14 0 50 2 14 12 0 36 51
                                                   2 12 0 0 0 52 2 36 43 0 0 53
                                                   0 12 0 54 2 14 0 12 36 55 1
                                                   14 0 12 56 2 14 0 0 0 57 3
                                                   14 0 0 27 0 58 2 8 43 0 40
                                                   59 1 12 0 60 61 1 62 0 29 63
                                                   2 65 64 62 12 66 1 69 67 68
                                                   70 2 31 43 0 0 71 2 12 0 0
                                                   31 72 2 29 12 73 0 74 2 12 0
                                                   0 0 75 1 6 0 31 76 1 12 0 6
                                                   77 2 12 0 0 0 78 2 79 0 14
                                                   31 80 2 14 0 0 0 81 2 79 0 0
                                                   0 82 2 84 79 83 0 85 2 86 0
                                                   14 79 87 1 86 14 0 88 2 14
                                                   43 0 0 89 1 86 31 0 90 2 86
                                                   0 0 31 91 1 86 14 0 92 1 86
                                                   79 0 93 2 79 43 0 0 94 2 98
                                                   97 0 0 99 2 100 43 8 0 101 0
                                                   98 0 102 0 36 0 103 3 98 0 0
                                                   8 36 104 1 98 0 12 105 3 108
                                                   98 106 107 9 109 1 12 110 0
                                                   111 2 12 43 0 0 112 1 100 8
                                                   0 113 2 100 0 0 0 114 1 12
                                                   11 0 115 1 12 11 0 116 2 98
                                                   36 0 8 117 2 36 97 0 0 118 2
                                                   31 43 0 0 119 2 98 0 0 36
                                                   120 2 98 0 0 0 121 1 98 122
                                                   0 123 2 98 0 0 12 124 0 9 0
                                                   125 2 98 0 12 0 126 0 40 0
                                                   127 1 12 0 40 128 2 98 0 0 0
                                                   129 1 98 29 0 130 2 133 131
                                                   29 132 134 1 12 0 0 137 1 12
                                                   0 0 138 1 12 0 0 139 1 140 0
                                                   14 141 2 144 142 143 14 145
                                                   1 140 14 0 146 2 95 14 147 0
                                                   148 2 14 97 0 0 149 1 140 14
                                                   0 150 2 140 0 14 14 151 1 12
                                                   0 7 152 1 12 0 0 153 2 12 0
                                                   0 0 154 1 14 0 0 155 3 14 0
                                                   0 27 12 156 1 14 12 0 157 2
                                                   158 29 0 31 159 0 160 0 161
                                                   0 140 0 162 2 142 0 140 36
                                                   163 1 142 0 140 164 2 142 0
                                                   0 0 165 2 140 0 0 0 166 1 12
                                                   60 0 167 1 12 168 7 169 1 12
                                                   31 0 170 3 12 0 0 60 0 171 0
                                                   140 0 172 3 177 0 140 174
                                                   176 178 2 12 0 0 0 179 2 180
                                                   12 140 8 181 1 12 110 0 182
                                                   2 8 43 0 0 183 2 184 100 100
                                                   40 185 0 177 0 186 3 0 135
                                                   12 12 40 136 3 0 187 140 8
                                                   40 189 3 0 187 140 8 40 188
                                                   1 0 20 9 23 2 0 95 14 95
                                                   96)))))
           '|lookupComplete|)) 
