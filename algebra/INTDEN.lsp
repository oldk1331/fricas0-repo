
(SDEFUN |INTDEN;li_factors|
        ((|df| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
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
          (|f2| (|SparseUnivariatePolynomial| F)) (|k2| (F)) (#1=#:G216 NIL)
          (|c| NIL) (#2=#:G217 NIL) (|ki| NIL) (#3=#:G215 NIL) (|u1| (F))
          (#4=#:G213 NIL) (|ui| NIL) (#5=#:G214 NIL) (#6=#:G212 NIL)
          (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #7#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| F)) (#8=#:G211 NIL) (|kk| NIL) (#9=#:G210 NIL)
          (|dvvec| (|Vector| F)) (#10=#:G209 NIL) (#11=#:G208 NIL)
          (|vlst| (|List| F)) (#12=#:G207 NIL) (#13=#:G206 NIL) (|rsum| (F))
          (|deg1| (|NonNegativeInteger|))
          (|f1| #14=(|SparseUnivariatePolynomial| F)) (#15=#:G205 NIL)
          (|fac| NIL) (|u0| (F)) (|nk| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #14#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 11)) (QREFELT $ 15))
                . #16=(|INTDEN;li_factors|))
          (LETT |res| NIL . #16#)
          (LETT |dummy| (SPADCALL (QREFELT $ 17)) . #16#)
          (LETT |vlst| NIL . #16#) (LETT |nk| (LENGTH |lk|) . #16#)
          (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT $ 20)) 1 (QREFELT $ 22))
                . #16#)
          (SEQ (LETT |fac| NIL . #16#) (LETT #15# |lfac| . #16#) G190
               (COND
                ((OR (ATOM #15#) (PROGN (LETT |fac| (CAR #15#) . #16#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (QVELT |fac| 1) . #16#)
                    (LETT |f1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f1| (QREFELT $ 23))
                                     (QREFELT $ 24))
                           |f1| (QREFELT $ 25))
                          . #16#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 27)) . #16#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ((SPADCALL
                             (CONS #'|INTDEN;li_factors!0| (VECTOR $ |x|))
                             (SPADCALL |f1| (QREFELT $ 34)) (QREFELT $ 36))
                            (LETT |res|
                                  (CONS
                                   (VECTOR |f1| |f1| |u0| (|spadConstant| $ 29)
                                           1)
                                   |res|)
                                  . #16#))
                           ((NULL |lk|) "iterate")
                           ('T
                            (SEQ
                             (LETT |rsum|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |deg1| (QREFELT $ 37))
                                              (QREFELT $ 24))
                                    (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 40))
                                    (QREFELT $ 41))
                                   . #16#)
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 42))
                               (LETT |f2|
                                     (SPADCALL |f1| |dummy|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 39)
                                                          1 (QREFELT $ 43))
                                                (SPADCALL |rsum|
                                                          (QREFELT $ 44))
                                                (QREFELT $ 45))
                                               (QREFELT $ 46))
                                     . #16#)))
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 42))
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (CONS #'|INTDEN;li_factors!1|
                                         (VECTOR $ |x|))
                                   (SPADCALL |f2| (QREFELT $ 34))
                                   (QREFELT $ 36)))
                                 (EXIT "iterate")))))
                             (COND
                              ((NULL |vlst|)
                               (SEQ
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #13# NIL . #16#)
                                       (SEQ (LETT |kk| NIL . #16#)
                                            (LETT #12# |lk| . #16#) G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #12#)
                                                         . #16#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #13#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          47))
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          49)))
                                                      ('T
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           20))
                                                        1 (QREFELT $ 22))))
                                                     #13#)
                                                    . #16#)))
                                            (LETT #12# (CDR #12#) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #13#))))
                                      . #16#)
                                (LETT |dvvec|
                                      (SPADCALL
                                       (PROGN
                                        (LETT #11# NIL . #16#)
                                        (SEQ (LETT |c| NIL . #16#)
                                             (LETT #10# |vlst| . #16#) G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |c| (CAR #10#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #11#
                                                     (CONS
                                                      (SPADCALL |c| |x|
                                                                (QREFELT $ 31))
                                                      #11#)
                                                     . #16#)))
                                             (LETT #10# (CDR #10#) . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #11#))))
                                       (QREFELT $ 51))
                                      . #16#)
                                (EXIT
                                 (LETT |ulst|
                                       (PROGN
                                        (LETT #9# NIL . #16#)
                                        (SEQ (LETT |kk| NIL . #16#)
                                             (LETT #8# |lk| . #16#) G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |kk| (CAR #8#)
                                                          . #16#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #9#
                                                     (CONS
                                                      (COND
                                                       ((SPADCALL |kk| '|log|
                                                                  (QREFELT $
                                                                           47))
                                                        (SPADCALL
                                                         (SPADCALL |kk|
                                                                   (QREFELT $
                                                                            20))
                                                         1 (QREFELT $ 22)))
                                                       ('T
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           49))))
                                                      #9#)
                                                     . #16#)))
                                             (LETT #8# (CDR #8#) . #16#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #9#))))
                                       . #16#)))))
                             (LETT |su|
                                   (SPADCALL |dvvec|
                                             (SPADCALL |rsum| |x|
                                                       (QREFELT $ 31))
                                             (QREFELT $ 54))
                                   . #16#)
                             (EXIT
                              (COND ((QEQCAR |su| 1) "iterate")
                                    ('T
                                     (SEQ (LETT |sv| (QCDR |su|) . #16#)
                                          (LETT |cd|
                                                (SPADCALL |sv| (QREFELT $ 58))
                                                . #16#)
                                          (LETT |d| (QCDR |cd|) . #16#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |d| 1 (QREFELT $ 59))
                                             "iterate")
                                            ('T
                                             (SEQ
                                              (LETT |u1|
                                                    (SPADCALL (ELT $ 41)
                                                              (PROGN
                                                               (LETT #6# NIL
                                                                     . #16#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #16#)
                                                                (LETT #5#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #16#)
                                                                (LETT |ui| NIL
                                                                      . #16#)
                                                                (LETT #4#
                                                                      |ulst|
                                                                      . #16#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #4#)
                                                                   (PROGN
                                                                    (LETT |ui|
                                                                          (CAR
                                                                           #4#)
                                                                          . #16#)
                                                                    NIL)
                                                                   (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #5#)
                                                                          . #16#)
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
                                                                           60))
                                                                         #6#)
                                                                        . #16#)))
                                                                (LETT #4#
                                                                      (PROG1
                                                                          (CDR
                                                                           #4#)
                                                                        (LETT
                                                                         #5#
                                                                         (CDR
                                                                          #5#)
                                                                         . #16#))
                                                                      . #16#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #6#))))
                                                              (QREFELT $ 62))
                                                    . #16#)
                                              (LETT |k2|
                                                    (SPADCALL (ELT $ 63)
                                                              (PROGN
                                                               (LETT #3# NIL
                                                                     . #16#)
                                                               (SEQ
                                                                (LETT |ki| NIL
                                                                      . #16#)
                                                                (LETT #2#
                                                                      (QCAR
                                                                       |cd|)
                                                                      . #16#)
                                                                (LETT |c| NIL
                                                                      . #16#)
                                                                (LETT #1#
                                                                      |vlst|
                                                                      . #16#)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #1#)
                                                                   (PROGN
                                                                    (LETT |c|
                                                                          (CAR
                                                                           #1#)
                                                                          . #16#)
                                                                    NIL)
                                                                   (ATOM #2#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #2#)
                                                                          . #16#)
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
                                                                             64))
                                                                           (QREFELT
                                                                            $
                                                                            65))
                                                                          |c|
                                                                          (QREFELT
                                                                           $
                                                                           41))
                                                                         #3#)
                                                                        . #16#)))
                                                                (LETT #1#
                                                                      (PROG1
                                                                          (CDR
                                                                           #1#)
                                                                        (LETT
                                                                         #2#
                                                                         (CDR
                                                                          #2#)
                                                                         . #16#))
                                                                      . #16#)
                                                                (GO G190) G191
                                                                (EXIT
                                                                 (NREVERSE
                                                                  #3#))))
                                                              (QREFELT $ 62))
                                                    . #16#)
                                              (LETT |f2|
                                                    (SPADCALL |f1| |dummy|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 39)
                                                                1
                                                                (QREFELT $ 43))
                                                               (SPADCALL |k2|
                                                                         (QREFELT
                                                                          $
                                                                          44))
                                                               (QREFELT $ 45))
                                                              (QREFELT $ 46))
                                                    . #16#)
                                              (COND
                                               ((NULL
                                                 (SPADCALL
                                                  (CONS #'|INTDEN;li_factors!2|
                                                        (VECTOR $ |x|))
                                                  (SPADCALL |f2|
                                                            (QREFELT $ 34))
                                                  (QREFELT $ 36)))
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
                                                                          60))
                                                               |u1|
                                                               (QREFELT $ 41))
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
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 31)) (|spadConstant| $ 29)
                      (QREFELT $ 33)))))) 

(SDEFUN |INTDEN;li_factors!1| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 31)) (|spadConstant| $ 29)
                      (QREFELT $ 33)))))) 

(SDEFUN |INTDEN;li_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 31)) (|spadConstant| $ 29)
                      (QREFELT $ 33)))))) 

(SDEFUN |INTDEN;poly_factors|
        ((|df| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
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
          (|f2| (|SparseUnivariatePolynomial| F)) (|k2| (F)) (#1=#:G284 NIL)
          (|c| NIL) (#2=#:G285 NIL) (|ki| NIL) (#3=#:G283 NIL) (|u1| (F))
          (#4=#:G281 NIL) (|ui| NIL) (#5=#:G282 NIL) (#6=#:G280 NIL)
          (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #7#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|ulst| (|List| F)) (#8=#:G279 NIL) (|kk| NIL) (#9=#:G278 NIL)
          (|dvvec| (|Vector| F)) (#10=#:G277 NIL) (#11=#:G276 NIL)
          (|vlst| (|List| F)) (#12=#:G275 NIL) (#13=#:G274 NIL) (|lprod| (F))
          (|f1| #14=(|SparseUnivariatePolynomial| F)) (|tc| (F))
          (|deg1| (|NonNegativeInteger|)) (#15=#:G273 NIL) (|fac| NIL)
          (|v0| (F)) (|nk| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|))
          (|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #14#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 11)) (QREFELT $ 15))
                . #16=(|INTDEN;poly_factors|))
          (LETT |res| NIL . #16#)
          (LETT |dummy| (SPADCALL (QREFELT $ 17)) . #16#)
          (LETT |vlst| NIL . #16#) (LETT |nk| (LENGTH |lk|) . #16#)
          (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT $ 20)) 1 (QREFELT $ 22))
                . #16#)
          (SEQ (LETT |fac| NIL . #16#) (LETT #15# |lfac| . #16#) G190
               (COND
                ((OR (ATOM #15#) (PROGN (LETT |fac| (CAR #15#) . #16#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (QVELT |fac| 1) . #16#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 27)) . #16#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ('T
                            (SEQ
                             (LETT |tc| (SPADCALL |f1| 0 (QREFELT $ 40))
                                   . #16#)
                             (EXIT
                              (COND
                               ((SPADCALL |tc| (|spadConstant| $ 29)
                                          (QREFELT $ 33))
                                "iterate")
                               ('T
                                (SEQ
                                 (LETT |f1|
                                       (SPADCALL (SPADCALL |tc| (QREFELT $ 24))
                                                 |f1| (QREFELT $ 25))
                                       . #16#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (CONS #'|INTDEN;poly_factors!0|
                                           (VECTOR $ |x|))
                                     (SPADCALL |f1| (QREFELT $ 34))
                                     (QREFELT $ 36))
                                    (LETT |res|
                                          (CONS
                                           (VECTOR |f1| |f1|
                                                   (|spadConstant| $ 39) |v0|
                                                   1)
                                           |res|)
                                          . #16#))
                                   ((NULL |lk|) "iterate")
                                   ('T
                                    (SEQ
                                     (LETT |lprod|
                                           (SPADCALL |f1| (QREFELT $ 23))
                                           . #16#)
                                     (COND
                                      ((NULL |vlst|)
                                       (SEQ
                                        (LETT |vlst|
                                              (PROGN
                                               (LETT #13# NIL . #16#)
                                               (SEQ (LETT |kk| NIL . #16#)
                                                    (LETT #12# |lk| . #16#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #12#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #12#)
                                                                 . #16#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #13#
                                                            (CONS
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         '|log|
                                                                         (QREFELT
                                                                          $
                                                                          47))
                                                               (SPADCALL |kk|
                                                                         (QREFELT
                                                                          $
                                                                          49)))
                                                              ('T
                                                               (SPADCALL
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           $
                                                                           20))
                                                                1
                                                                (QREFELT $
                                                                         22))))
                                                             #13#)
                                                            . #16#)))
                                                    (LETT #12# (CDR #12#)
                                                          . #16#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #13#))))
                                              . #16#)
                                        (LETT |dvvec|
                                              (SPADCALL
                                               (PROGN
                                                (LETT #11# NIL . #16#)
                                                (SEQ (LETT |c| NIL . #16#)
                                                     (LETT #10# |vlst| . #16#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #10#)
                                                           (PROGN
                                                            (LETT |c|
                                                                  (CAR #10#)
                                                                  . #16#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #11#
                                                             (CONS
                                                              (SPADCALL |c| |x|
                                                                        (QREFELT
                                                                         $ 31))
                                                              #11#)
                                                             . #16#)))
                                                     (LETT #10# (CDR #10#)
                                                           . #16#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #11#))))
                                               (QREFELT $ 51))
                                              . #16#)
                                        (EXIT
                                         (LETT |ulst|
                                               (PROGN
                                                (LETT #9# NIL . #16#)
                                                (SEQ (LETT |kk| NIL . #16#)
                                                     (LETT #8# |lk| . #16#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #8#)
                                                           (PROGN
                                                            (LETT |kk|
                                                                  (CAR #8#)
                                                                  . #16#)
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
                                                                           $
                                                                           47))
                                                                (SPADCALL
                                                                 (SPADCALL |kk|
                                                                           (QREFELT
                                                                            $
                                                                            20))
                                                                 1
                                                                 (QREFELT $
                                                                          22)))
                                                               ('T
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           $
                                                                           49))))
                                                              #9#)
                                                             . #16#)))
                                                     (LETT #8# (CDR #8#)
                                                           . #16#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               . #16#)))))
                                     (LETT |su|
                                           (SPADCALL |dvvec|
                                                     (SPADCALL
                                                      (SPADCALL |lprod| |x|
                                                                (QREFELT $ 31))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |deg1|
                                                                  (QREFELT $
                                                                           64))
                                                        (QREFELT $ 65))
                                                       |lprod| (QREFELT $ 41))
                                                      (QREFELT $ 66))
                                                     (QREFELT $ 54))
                                           . #16#)
                                     (EXIT
                                      (COND ((QEQCAR |su| 1) "iterate")
                                            ('T
                                             (SEQ
                                              (LETT |sv| (QCDR |su|) . #16#)
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT $ 58))
                                                    . #16#)
                                              (LETT |d| (QCDR |cd|) . #16#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT $ 59))
                                                 "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT $ 41)
                                                                  (PROGN
                                                                   (LETT #6#
                                                                         NIL
                                                                         . #16#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #5#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #16#)
                                                                    (LETT |ui|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #4#
                                                                          |ulst|
                                                                          . #16#)
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
                                                                         . #16#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #5#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #5#)
                                                                         . #16#)
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
                                                                               60))
                                                                             #6#)
                                                                            . #16#)))
                                                                    (LETT #4#
                                                                          (PROG1
                                                                              (CDR
                                                                               #4#)
                                                                            (LETT
                                                                             #5#
                                                                             (CDR
                                                                              #5#)
                                                                             . #16#))
                                                                          . #16#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #6#))))
                                                                  (QREFELT $
                                                                           62))
                                                        . #16#)
                                                  (LETT |k2|
                                                        (SPADCALL (ELT $ 63)
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         NIL
                                                                         . #16#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #2#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #16#)
                                                                    (LETT |c|
                                                                          NIL
                                                                          . #16#)
                                                                    (LETT #1#
                                                                          |vlst|
                                                                          . #16#)
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
                                                                         . #16#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #2#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #2#)
                                                                         . #16#)
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
                                                                                 64))
                                                                               (QREFELT
                                                                                $
                                                                                65))
                                                                              |c|
                                                                              (QREFELT
                                                                               $
                                                                               41))
                                                                             #3#)
                                                                            . #16#)))
                                                                    (LETT #1#
                                                                          (PROG1
                                                                              (CDR
                                                                               #1#)
                                                                            (LETT
                                                                             #2#
                                                                             (CDR
                                                                              #2#)
                                                                             . #16#))
                                                                          . #16#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #3#))))
                                                                  (QREFELT $
                                                                           62))
                                                        . #16#)
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT $
                                                                             24))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 39)
                                                                    1
                                                                    (QREFELT $
                                                                             43))
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           46))
                                                        . #16#)
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR $ |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT $ 34))
                                                      (QREFELT $ 36)))
                                                    (EXIT "iterate")))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT $
                                                                            63))
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
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 31)) (|spadConstant| $ 29)
                      (QREFELT $ 33)))))) 

(SDEFUN |INTDEN;poly_factors!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 31)) (|spadConstant| $ 29)
                      (QREFELT $ 33)))))) 

(SDEFUN |INTDEN;decompose1|
        ((|nn| |SparseUnivariatePolynomial| F)
         (|elden| |SparseUnivariatePolynomial| F)
         (|lidens| |List| (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|res| (|List| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |elden| (QREFELT $ 27)) 0 (QREFELT $ 42))
                  (LETT |lidens| (CONS |elden| |lidens|)
                        . #1=(|INTDEN;decompose1|)))
                 ((SPADCALL |elden| (|spadConstant| $ 67) (QREFELT $ 68))
                  (|error| "Impossible 5")))
                (LETT |res| (SPADCALL |nn| |lidens| (QREFELT $ 71)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |elden| (QREFELT $ 27)) 0
                             (QREFELT $ 42))
                   |res|)
                  ('T (CONS (|spadConstant| $ 72) |res|))))))) 

(SDEFUN |INTDEN;p_power_in_q|
        ((|p| |SparseMultivariatePolynomial| F (|Kernel| F))
         (|q| |SparseMultivariatePolynomial| F (|Kernel| F)) ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (#1=#:G291 NIL)
          (|qq|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F))
                    #2="failed")))
         (SEQ (LETT |res| 0 . #3=(|INTDEN;p_power_in_q|))
              (SEQ G190
                   (COND
                    ((NULL
                      (QEQCAR
                       (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 75)) . #3#) 0))
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
                         (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 86)))) 

(SDEFUN |INTDEN;MP_to_MPF!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 65)) (QREFELT $ 81))) 

(SDEFUN |INTDEN;MP_to_MPF!0| ((|k| NIL) ($$ NIL))
        (PROG (|lk| $)
          (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |k| |lk| (QREFELT $ 77))
              (SPADCALL (|spadConstant| $ 78) |k| (|spadConstant| $ 79)
                        (QREFELT $ 80)))
             ('T (SPADCALL (SPADCALL |k| (QREFELT $ 49)) (QREFELT $ 81)))))))) 

(SDEFUN |INTDEN;solve_u;2FSU;6|
        ((|f1| F) (|u| F) (|x| |Symbol|)
         ($ |Union| (|List| (|List| F)) "failed"))
        (SPROG
         ((#1=#:G361 NIL) (|c| NIL) (#2=#:G362 NIL) (|j| NIL) (#3=#:G360 NIL)
          (#4=#:G348 NIL) (#5=#:G359 NIL) (|sl| (|List| F))
          (|sl0| (|Union| (|List| F) "failed")) (|eqsl| (|List| F))
          (|eqs| (|SparseMultivariatePolynomial| F (|Kernel| F)))
          (#6=#:G357 NIL) (|p1| NIL) (#7=#:G358 NIL) (|coef| NIL)
          (|lpow| (|List| (|SparseMultivariatePolynomial| F (|Kernel| F))))
          (|pp| #8=(|SparseMultivariatePolynomial| F (|Kernel| F)))
          (#9=#:G356 NIL) (|lpow0| (|List| #8#)) (#10=#:G355 NIL)
          (|coefs| (|List| (|Symbol|))) (#11=#:G354 NIL) (#12=#:G353 NIL)
          (|nf1| #13=(|SparseMultivariatePolynomial| F (|Kernel| F)))
          (|cc| (F)) (|ccru| (|Union| F "failed"))
          (|ccu|
           (|Union| (|SparseMultivariatePolynomial| F (|Kernel| F)) "failed"))
          (|dup| #8#) (#14=#:G319 NIL) (|nup| #8#) (#15=#:G317 NIL)
          (|m| (|Integer|)) (|n| (|Integer|))
          (|qu| (|Union| (|NonNegativeInteger|) "failed"))
          (|degdu| #16=(|NonNegativeInteger|)) (|degnu| #16#) (|degdf| #16#)
          (|degnf| #16#) (|du| #13#) (|nu| #13#) (|df1| #13#)
          (|vk2| (|List| #17=(|Kernel| F))) (#18=#:G352 NIL) (|k| NIL)
          (#19=#:G351 NIL) (|k1| (|Kernel| F)) (|vk| (|List| #17#))
          (#20=#:G350 NIL) (#21=#:G349 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |vk|
                  (PROGN
                   (LETT #21# NIL . #22=(|INTDEN;solve_u;2FSU;6|))
                   (SEQ (LETT |k| NIL . #22#)
                        (LETT #20# (SPADCALL |u| (QREFELT $ 88)) . #22#) G190
                        (COND
                         ((OR (ATOM #20#)
                              (PROGN (LETT |k| (CAR #20#) . #22#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 49)) |x|
                                       (QREFELT $ 31))
                             (|spadConstant| $ 29) (QREFELT $ 89))
                            (LETT #21# (CONS |k| #21#) . #22#)))))
                        (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                        (EXIT (NREVERSE #21#))))
                  . #22#)
            (EXIT
             (COND ((NULL |vk|) (|error| "solve_u: constant u"))
                   (#23='T
                    (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 90)) . #22#)
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 31))
                                      (|spadConstant| $ 29) (QREFELT $ 33))
                            (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 29)))))
                           (#23#
                            (SEQ
                             (LETT |vk2|
                                   (PROGN
                                    (LETT #19# NIL . #22#)
                                    (SEQ (LETT |k| NIL . #22#)
                                         (LETT #18#
                                               (SPADCALL |f1| (QREFELT $ 88))
                                               . #22#)
                                         G190
                                         (COND
                                          ((OR (ATOM #18#)
                                               (PROGN
                                                (LETT |k| (CAR #18#) . #22#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |k| (QREFELT $ 49))
                                               |x| (QREFELT $ 31))
                                              (|spadConstant| $ 29)
                                              (QREFELT $ 89))
                                             (LETT #19# (CONS |k| #19#)
                                                   . #22#)))))
                                         (LETT #18# (CDR #18#) . #22#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #19#))))
                                   . #22#)
                             (COND
                              ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 91)))
                               (COND
                                ((NULL
                                  (NULL (SPADCALL |vk| |vk2| (QREFELT $ 91))))
                                 (EXIT
                                  (PROGN
                                   (LETT #4# (CONS 1 #24="failed") . #22#)
                                   (GO #25=#:G347))))))
                              (#23#
                               (EXIT
                                (PROGN
                                 (LETT #4# (CONS 1 #24#) . #22#)
                                 (GO #25#)))))
                             (LETT |nf1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 93)) |vk| $)
                                   . #22#)
                             (LETT |df1|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |f1| (QREFELT $ 94)) |vk| $)
                                   . #22#)
                             (LETT |nu|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 93)) |vk| $)
                                   . #22#)
                             (LETT |du|
                                   (|INTDEN;MP_to_MPF|
                                    (SPADCALL |u| (QREFELT $ 94)) |vk| $)
                                   . #22#)
                             (LETT |degnf| (SPADCALL |nf1| |k1| (QREFELT $ 95))
                                   . #22#)
                             (LETT |degdf| (SPADCALL |df1| |k1| (QREFELT $ 95))
                                   . #22#)
                             (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 95))
                                   . #22#)
                             (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 95))
                                   . #22#)
                             (COND
                              ((EQL |degdu| 0)
                               (SEQ
                                (LETT |qu|
                                      (SPADCALL |degdf| |degnu| (QREFELT $ 96))
                                      . #22#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |qu| 1)
                                   (PROGN
                                    (LETT #4# (CONS 1 "failed") . #22#)
                                    (GO #25#)))
                                  (#23#
                                   (SEQ (LETT |n| (QCDR |qu|) . #22#)
                                        (LETT |qu|
                                              (SPADCALL |degnf| |degnu|
                                                        (QREFELT $ 96))
                                              . #22#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |qu| 1)
                                           (PROGN
                                            (LETT #4# (CONS 1 "failed") . #22#)
                                            (GO #25#)))
                                          (#23#
                                           (LETT |m| (- (QCDR |qu|) |n|)
                                                 . #22#))))))))))
                              ((EQL |degnu| 0)
                               (SEQ
                                (LETT |qu|
                                      (SPADCALL |degdf| |degdu| (QREFELT $ 96))
                                      . #22#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |qu| 1)
                                   (PROGN
                                    (LETT #4# (CONS 1 "failed") . #22#)
                                    (GO #25#)))
                                  (#23#
                                   (SEQ (LETT |m| (QCDR |qu|) . #22#)
                                        (LETT |qu|
                                              (SPADCALL |degnf| |degdu|
                                                        (QREFELT $ 96))
                                              . #22#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |qu| 1)
                                           (PROGN
                                            (LETT #4# (CONS 1 "failed") . #22#)
                                            (GO #25#)))
                                          (#23#
                                           (LETT |n| (- (QCDR |qu|) |m|)
                                                 . #22#))))))))))
                              (#23#
                               (SEQ
                                (LETT |m| (|INTDEN;p_power_in_q| |du| |df1| $)
                                      . #22#)
                                (LETT |n| (|INTDEN;p_power_in_q| |nu| |df1| $)
                                      . #22#)
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (+ (* |m| |degdu|) (* |n| |degnu|)) |degdf|
                                    (QREFELT $ 59))
                                   (PROGN
                                    (LETT #4# (CONS 1 "failed") . #22#)
                                    (GO #25#))))))))
                             (LETT |n| (MAX |n| 0) . #22#)
                             (LETT |m| (MAX |m| 0) . #22#)
                             (LETT |nup|
                                   (COND
                                    ((SPADCALL |n| 0 (QREFELT $ 97))
                                     (SPADCALL |nu|
                                               (PROG1 (LETT #15# |n| . #22#)
                                                 (|check_subtype2| (>= #15# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #15#))
                                               (QREFELT $ 98)))
                                    (#23# (|spadConstant| $ 78)))
                                   . #22#)
                             (LETT |dup|
                                   (COND
                                    ((SPADCALL |m| 0 (QREFELT $ 97))
                                     (SPADCALL |du|
                                               (PROG1 (LETT #14# |m| . #22#)
                                                 (|check_subtype2| (>= #14# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #14#))
                                               (QREFELT $ 98)))
                                    (#23# (|spadConstant| $ 78)))
                                   . #22#)
                             (LETT |ccu|
                                   (SPADCALL |df1|
                                             (SPADCALL |dup| |nup|
                                                       (QREFELT $ 99))
                                             (QREFELT $ 75))
                                   . #22#)
                             (EXIT
                              (COND
                               ((QEQCAR |ccu| 1)
                                (PROGN
                                 (LETT #4# (CONS 1 "failed") . #22#)
                                 (GO #25#)))
                               (#23#
                                (SEQ
                                 (LETT |ccru|
                                       (SPADCALL (QCDR |ccu|) (QREFELT $ 101))
                                       . #22#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ccru| 1)
                                    (PROGN
                                     (LETT #4# (CONS 1 "failed") . #22#)
                                     (GO #25#)))
                                   (#23#
                                    (SEQ (LETT |cc| (QCDR |ccru|) . #22#)
                                         (LETT |nf1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 39)
                                                          |cc| (QREFELT $ 66))
                                                |nf1| (QREFELT $ 106))
                                               . #22#)
                                         (LETT |coefs|
                                               (PROGN
                                                (LETT #12# NIL . #22#)
                                                (SEQ (LETT |j| (- |n|) . #22#)
                                                     (LETT #11# |m| . #22#)
                                                     G190
                                                     (COND
                                                      ((> |j| #11#) (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #12#
                                                             (CONS
                                                              (SPADCALL
                                                               (QREFELT $ 107))
                                                              #12#)
                                                             . #22#)))
                                                     (LETT |j| (+ |j| 1)
                                                           . #22#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #12#))))
                                               . #22#)
                                         (LETT |eqs| |nf1| . #22#)
                                         (LETT |pp| (|spadConstant| $ 78)
                                               . #22#)
                                         (LETT |lpow0| (LIST |pp|) . #22#)
                                         (SEQ (LETT |j| (- 1 |n|) . #22#)
                                              (LETT #10# |m| . #22#) G190
                                              (COND ((> |j| #10#) (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |nu| |pp|
                                                               (QREFELT $ 99))
                                                     . #22#)
                                               (EXIT
                                                (LETT |lpow0|
                                                      (CONS |pp| |lpow0|)
                                                      . #22#)))
                                              (LETT |j| (+ |j| 1) . #22#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |lpow|
                                               (LIST (|SPADfirst| |lpow0|))
                                               . #22#)
                                         (LETT |pp| (|spadConstant| $ 78)
                                               . #22#)
                                         (SEQ (LETT |p1| NIL . #22#)
                                              (LETT #9# (CDR |lpow0|) . #22#)
                                              G190
                                              (COND
                                               ((OR (ATOM #9#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #9#)
                                                           . #22#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |pp|
                                                     (SPADCALL |du| |pp|
                                                               (QREFELT $ 99))
                                                     . #22#)
                                               (EXIT
                                                (LETT |lpow|
                                                      (CONS
                                                       (SPADCALL |pp| |p1|
                                                                 (QREFELT $
                                                                          99))
                                                       |lpow|)
                                                      . #22#)))
                                              (LETT #9# (CDR #9#) . #22#)
                                              (GO G190) G191 (EXIT NIL))
                                         (SEQ (LETT |coef| NIL . #22#)
                                              (LETT #7# |coefs| . #22#)
                                              (LETT |p1| NIL . #22#)
                                              (LETT #6# |lpow| . #22#) G190
                                              (COND
                                               ((OR (ATOM #6#)
                                                    (PROGN
                                                     (LETT |p1| (CAR #6#)
                                                           . #22#)
                                                     NIL)
                                                    (ATOM #7#)
                                                    (PROGN
                                                     (LETT |coef| (CAR #7#)
                                                           . #22#)
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
                                                                           108))
                                                                 |p1|
                                                                 (QREFELT $
                                                                          106))
                                                                (QREFELT $
                                                                         109))
                                                      . #22#)))
                                              (LETT #6#
                                                    (PROG1 (CDR #6#)
                                                      (LETT #7# (CDR #7#)
                                                            . #22#))
                                                    . #22#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |eqsl|
                                               (SPADCALL |eqs| (QREFELT $ 110))
                                               . #22#)
                                         (LETT |sl0|
                                               (SPADCALL |eqsl| |coefs|
                                                         (QREFELT $ 114))
                                               . #22#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |sl0| 1) (CONS 1 "failed"))
                                           (#23#
                                            (SEQ
                                             (LETT |sl| (QCDR |sl0|) . #22#)
                                             (SEQ (LETT |c| NIL . #22#)
                                                  (LETT #5# |sl| . #22#) G190
                                                  (COND
                                                   ((OR (ATOM #5#)
                                                        (PROGN
                                                         (LETT |c| (CAR #5#)
                                                               . #22#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (SPADCALL |c| |x|
                                                                 (QREFELT $
                                                                          31))
                                                       (|spadConstant| $ 29)
                                                       (QREFELT $ 89))
                                                      (PROGN
                                                       (LETT #4#
                                                             (CONS 1 "failed")
                                                             . #22#)
                                                       (GO #25#))))))
                                                  (LETT #5# (CDR #5#) . #22#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (PROGN
                                                     (LETT #3# NIL . #22#)
                                                     (SEQ
                                                      (LETT |j| (- |n|) . #22#)
                                                      (LETT #2# |m| . #22#)
                                                      (LETT |c| NIL . #22#)
                                                      (LETT #1# |sl| . #22#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #1#)
                                                                   . #22#)
                                                             NIL)
                                                            (> |j| #2#))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |c|
                                                                    (|spadConstant|
                                                                     $ 29)
                                                                    (QREFELT $
                                                                             89))
                                                          (LETT #3#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         37)))
                                                                 #3#)
                                                                . #22#)))))
                                                      (LETT #1#
                                                            (PROG1 (CDR #1#)
                                                              (LETT |j|
                                                                    (+ |j| 1)
                                                                    . #22#))
                                                            . #22#)
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE
                                                        #3#))))))))))))))))))))))))))))
          #25# (EXIT #4#)))) 

(SDEFUN |INTDEN;li_int1|
        ((|f| F) (|u| F) (|x| |Symbol|)
         ($ |Union| (|List| (|List| F)) "failed"))
        (SPROG ((|deru| (F)))
               (SEQ
                (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 31))
                      |INTDEN;li_int1|)
                (EXIT
                 (COND
                  ((SPADCALL |deru| (|spadConstant| $ 29) (QREFELT $ 33))
                   (|error| "li_int1: constant log"))
                  ('T
                   (SPADCALL (SPADCALL |f| |deru| (QREFELT $ 66)) |u| |x|
                             (QREFELT $ 116)))))))) 

(SDEFUN |INTDEN;mk_li| ((|c| F) (|j| |Integer|) (|u| F) (|s| F) ($ F))
        (SPROG ((|es| (F)))
               (SEQ
                (COND
                 ((EQL |j| -1)
                  (SPADCALL |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u| (QREFELT $ 117)) |s|
                                       (QREFELT $ 63))
                             (QREFELT $ 117))
                            (QREFELT $ 41)))
                 ('T
                  (SEQ
                   (LETT |es| (SPADCALL |s| (QREFELT $ 118)) |INTDEN;mk_li|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (SPADCALL |u| |es| (QREFELT $ 41))
                                          (+ |j| 1) (QREFELT $ 60))
                                (QREFELT $ 119))
                               (QREFELT $ 41))
                     (SPADCALL |es| (+ |j| 1) (QREFELT $ 60))
                     (QREFELT $ 66))))))))) 

(SDEFUN |INTDEN;UP2UPR|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 125))) 

(SDEFUN |INTDEN;UP2UPR!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 44)) (QREFELT $ 121))) 

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
         ((|res| (F)) (#1=#:G408 NIL) (|zz| NIL) (|lle| (F))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F))))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|SparseUnivariatePolynomial| F)))))))
          (#2=#:G407 NIL) (|e| NIL) (|zzl| (|List| F)) (|rf1k| (|Kernel| F))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lli| (|List| (|List| F))) (#3=#:G402 NIL)
          (|liu| (|Union| (|List| (|List| F)) "failed")) (|tf| (F))
          (|c_shift| (F)) (|ddf| (F)) (|rf1| (F)) (|rfc| (F))
          (|deg1| (|NonNegativeInteger|)) (|u1| (F))
          (|cfac| (|SparseUnivariatePolynomial| F))
          (|liden| #4=(|SparseUnivariatePolynomial| F)) (#5=#:G405 NIL)
          (|ldr| NIL) (#6=#:G406 NIL) (|linum| NIL) (|u0| (F))
          (|dummy| (|SingletonAsOrderedSet|))
          (|linums| (|List| (|SparseUnivariatePolynomial| F)))
          (|dn| (|List| (|SparseUnivariatePolynomial| F)))
          (|elden| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|lidens| (|List| #4#)) (#7=#:G404 NIL) (#8=#:G403 NIL)
          (|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;li_factors| (SPADCALL |rf| (QREFELT $ 126)) |k| |lk|
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
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 126))
                                     (SPADCALL (ELT $ 127) |lidens|
                                               (QREFELT $ 129))
                                     (QREFELT $ 130))
                           . #9#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                            (#10#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 131))
                                     (QCDR |elden|) |lidens| $)
                                    . #9#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 132))
                                    . #9#)
                              (LETT |linums| (CDR |dn|) . #9#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 17)) . #9#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 20)) 1
                                              (QREFELT $ 22))
                                    . #9#)
                              (LETT |res| (|spadConstant| $ 29) . #9#)
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
                                                         (QREFELT $ 27))
                                               . #9#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |deg1| 1 (QREFELT $ 42))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 134))
                                                   . #9#)
                                             (LETT |c_shift|
                                                   (SPADCALL |rfc|
                                                             (QREFELT $ 135))
                                                   . #9#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 3)
                                                             (QREFELT $ 136))
                                                   . #9#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |liden|
                                                               (QREFELT $ 137))
                                                     |dummy| |rf1|
                                                     (QREFELT $ 138))
                                                    (QREFELT $ 139))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |linum| |dummy|
                                                                |rf1|
                                                                (QREFELT $
                                                                         138))
                                                      (QREFELT $ 139))
                                                     |ddf| (QREFELT $ 66))
                                                    . #9#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 0
                                                             (QREFELT $ 40))
                                                   . #9#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |linum|
                                                              (QREFELT $ 139))
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
                                            (GO #11=#:G401)))
                                          ('T
                                           (SEQ (LETT |lli| (QCDR |liu|) . #9#)
                                                (COND
                                                 ((EQL (LENGTH |lli|) 1)
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |lli| 1
                                                                (QREFELT $
                                                                         141))
                                                      2 (QREFELT $ 22))
                                                     (SPADCALL
                                                      (|spadConstant| $ 39)
                                                      (QREFELT $ 135))
                                                     (QREFELT $ 33))
                                                    (EXIT
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (LETT |logs|
                                                             (CONS
                                                              (VECTOR
                                                               (|spadConstant|
                                                                $ 104)
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 142)
                                                                 1
                                                                 (QREFELT $
                                                                          143))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |lli| 1
                                                                     (QREFELT $
                                                                              141))
                                                                    1
                                                                    (QREFELT $
                                                                             22))
                                                                   (QREFELT $
                                                                            44))
                                                                  (QREFELT $
                                                                           121))
                                                                 (QREFELT $
                                                                          144))
                                                                (QREFELT $
                                                                         145))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |liden|
                                                                 (QREFELT $
                                                                          121))
                                                                (QREFELT $
                                                                         144)))
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
                                                                         132))
                                                                       (QREFELT
                                                                        $ 146))
                                                             . #9#))))))))
                                                (COND
                                                 ((SPADCALL |deg1| 1
                                                            (QREFELT $ 42))
                                                  (SEQ
                                                   (LETT |rf1k|
                                                         (SPADCALL |rfc|
                                                                   (QREFELT $
                                                                            147))
                                                         . #9#)
                                                   (EXIT
                                                    (LETT |zzl|
                                                          (SPADCALL |cfac|
                                                                    (QREFELT $
                                                                             149))
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
                                                                             22))
                                                          (SPADCALL
                                                           (|spadConstant| $
                                                                           39)
                                                           (QREFELT $ 135))
                                                          (QREFELT $ 33))
                                                         (COND
                                                          ((EQL |deg1| 1)
                                                           (EXIT
                                                            (LETT |logs|
                                                                  (CONS
                                                                   (VECTOR
                                                                    (|spadConstant|
                                                                     $ 104)
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       $ 142)
                                                                      1
                                                                      (QREFELT
                                                                       $ 143))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |e| 1
                                                                         (QREFELT
                                                                          $
                                                                          22))
                                                                        (QREFELT
                                                                         $ 44))
                                                                       (QREFELT
                                                                        $ 121))
                                                                      (QREFELT
                                                                       $ 144))
                                                                     (QREFELT $
                                                                              145))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |liden|
                                                                      (QREFELT
                                                                       $ 121))
                                                                     (QREFELT $
                                                                              144)))
                                                                   |logs|)
                                                                  . #9#))))))
                                                       (LETT |lle|
                                                             (|INTDEN;mk_li|
                                                              (SPADCALL |e| 1
                                                                        (QREFELT
                                                                         $ 22))
                                                              (SPADCALL
                                                               (SPADCALL |e| 2
                                                                         (QREFELT
                                                                          $
                                                                          22))
                                                               (QREFELT $ 150))
                                                              |u1| |c_shift| $)
                                                             . #9#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             42))
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
                                                                              151))
                                                                    (QREFELT $
                                                                             63))
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
                                                                           63))
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
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 44))
                                                (QREFELT $ 121))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 152) |logs|
                                                NIL
                                                (QREFELT $ 158)))))))))))))))
          #11# (EXIT #3#)))) 

(SDEFUN |INTDEN;mk_poly| ((|c| F) (|j| |Integer|) (|u| F) (|s| F) ($ F))
        (SPROG
         ((|ifac| (F)) (|res| (F)) (|i1| (|Integer|)) (#1=#:G413 NIL) (|i| NIL)
          (|j1| (|Integer|)) (|eu| (F)))
         (SEQ
          (COND
           ((EQL |j| 0)
            (SPADCALL |c|
                      (SPADCALL |u|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |u| (QREFELT $ 118))
                                           (SPADCALL (|spadConstant| $ 39) |s|
                                                     (QREFELT $ 66))
                                           (QREFELT $ 63))
                                 (QREFELT $ 117))
                                (QREFELT $ 136))
                      (QREFELT $ 41)))
           ('T
            (SEQ
             (LETT |eu|
                   (SPADCALL |s| (SPADCALL |u| (QREFELT $ 118)) (QREFELT $ 41))
                   . #2=(|INTDEN;mk_poly|))
             (LETT |j1| (+ |j| 1) . #2#)
             (LETT |res|
                   (SPADCALL (SPADCALL |u| |j1| (QREFELT $ 60))
                             (SPADCALL (SPADCALL |j1| (QREFELT $ 64))
                                       (QREFELT $ 65))
                             (QREFELT $ 66))
                   . #2#)
             (LETT |res|
                   (SPADCALL |res|
                             (SPADCALL (SPADCALL |u| |j| (QREFELT $ 60))
                                       (SPADCALL
                                        (SPADCALL |eu| (|spadConstant| $ 39)
                                                  (QREFELT $ 63))
                                        (QREFELT $ 117))
                                       (QREFELT $ 41))
                             (QREFELT $ 136))
                   . #2#)
             (LETT |ifac|
                   (SPADCALL
                    (SPADCALL (SPADCALL |j| (QREFELT $ 64)) (QREFELT $ 65))
                    (QREFELT $ 135))
                   . #2#)
             (SEQ (LETT |i| 1 . #2#) (LETT #1# |j| . #2#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |i1| (- |j| |i|) . #2#)
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL
                                        (SPADCALL |ifac|
                                                  (SPADCALL |u| |i1|
                                                            (QREFELT $ 60))
                                                  (QREFELT $ 41))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (+ |i| 1) (QREFELT $ 64))
                                          (QREFELT $ 65))
                                         (SPADCALL |eu| (QREFELT $ 135))
                                         (QREFELT $ 159))
                                        (QREFELT $ 41))
                                       (QREFELT $ 63))
                             . #2#)
                       (EXIT
                        (LETT |ifac|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |i1| (QREFELT $ 64))
                                          (QREFELT $ 65))
                                |ifac| (QREFELT $ 41))
                               (QREFELT $ 135))
                              . #2#)))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |c| |res| (QREFELT $ 41))))))))) 

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
         ((|res| (F)) (#1=#:G449 NIL) (|zz| NIL) (|lle| (F)) (#2=#:G441 NIL)
          (|ii| (|Integer|)) (#3=#:G448 NIL) (|e| NIL) (|zzl| (|List| F))
          (|rf1k| (|Kernel| F))
          (|elpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lpoly| (|List| (|List| F)))
          (|polyu| (|Union| (|List| (|List| F)) "failed")) (|tf| (F))
          (|c_shift| (F)) (|ddf| (F)) (|rf1| (F)) (|rfc| (F))
          (|deg1| (|NonNegativeInteger|))
          (|polynum| #4=(|SparseUnivariatePolynomial| F)) (|v1| (F))
          (|cfac| (|SparseUnivariatePolynomial| F))
          (|polyden| #5=(|SparseUnivariatePolynomial| F)) (#6=#:G446 NIL)
          (|ldr| NIL) (#7=#:G447 NIL) (|polynum1| NIL)
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
          (|polydens1| (|List| #4#)) (#8=#:G445 NIL) (|p| NIL) (#9=#:G444 NIL)
          (|polydens| (|List| #5#)) (#10=#:G443 NIL) (#11=#:G442 NIL)
          (|ldrs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |cfactor| (|SparseUnivariatePolynomial| F))
                      (|:| |ufun| F) (|:| |vfun| F) (|:| |den| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ldrs|
                  (|INTDEN;poly_factors| (SPADCALL |rf| (QREFELT $ 126)) |k|
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
                                            (SPADCALL |p| (QREFELT $ 23))
                                            (QREFELT $ 24))
                                           |p| (QREFELT $ 25))
                                          #9#)
                                         . #12#)))
                                 (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           . #12#)
                     (LETT |elden|
                           (SPADCALL (SPADCALL |rf| (QREFELT $ 126))
                                     (SPADCALL (ELT $ 127) |polydens1|
                                               (QREFELT $ 129))
                                     (QREFELT $ 130))
                           . #12#)
                     (EXIT
                      (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                            (#13#
                             (SEQ
                              (LETT |dn|
                                    (|INTDEN;decompose1|
                                     (SPADCALL |rf| (QREFELT $ 131))
                                     (QCDR |elden|) |polydens1| $)
                                    . #12#)
                              (LETT |elpart|
                                    (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                              (QREFELT $ 132))
                                    . #12#)
                              (LETT |polynums1| (CDR |dn|) . #12#)
                              (LETT |dummy| (SPADCALL (QREFELT $ 17)) . #12#)
                              (LETT |u0|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 20)) 1
                                              (QREFELT $ 22))
                                    . #12#)
                              (LETT |res| (|spadConstant| $ 29) . #12#)
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
                                                         (QREFELT $ 23))
                                               |polynum1| (QREFELT $ 25))
                                              . #12#)
                                        (SEQ
                                         (LETT |deg1|
                                               (SPADCALL |polyden|
                                                         (QREFELT $ 27))
                                               . #12#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |deg1| 1 (QREFELT $ 42))
                                            (SEQ
                                             (LETT |rfc|
                                                   (SPADCALL |cfac|
                                                             (QREFELT $ 134))
                                                   . #12#)
                                             (LETT |rf1|
                                                   (SPADCALL |rfc|
                                                             (QVELT |ldr| 2)
                                                             (QREFELT $ 66))
                                                   . #12#)
                                             (LETT |c_shift|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|spadConstant| $ 39)
                                                     |rfc| (QREFELT $ 66))
                                                    (QREFELT $ 135))
                                                   . #12#)
                                             (LETT |ddf|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |cfac|
                                                               (QREFELT $ 137))
                                                     |dummy| |rfc|
                                                     (QREFELT $ 138))
                                                    (QREFELT $ 139))
                                                   . #12#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |polynum|
                                                                 |dummy| |rf1|
                                                                 (QREFELT $
                                                                          138))
                                                       (QREFELT $ 139))
                                                      (SPADCALL |rfc| |ddf|
                                                                (QREFELT $ 41))
                                                      (QREFELT $ 66))
                                                     (QREFELT $ 135))
                                                    . #12#))))
                                           ('T
                                            (SEQ
                                             (LETT |c_shift|
                                                   (SPADCALL |cfac| 1
                                                             (QREFELT $ 40))
                                                   . #12#)
                                             (EXIT
                                              (LETT |tf|
                                                    (SPADCALL |polynum|
                                                              (QREFELT $ 139))
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
                                            (GO #14=#:G440)))
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
                                                            (QREFELT $ 141))
                                                  2 (QREFELT $ 22))
                                                 (|spadConstant| $ 29)
                                                 (QREFELT $ 33))
                                                (EXIT
                                                 (LETT |elpart|
                                                       (SPADCALL |elpart|
                                                                 (SPADCALL
                                                                  |polynum|
                                                                  |polyden|
                                                                  (QREFELT $
                                                                           132))
                                                                 (QREFELT $
                                                                          146))
                                                       . #12#))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 42))
                                              (SEQ
                                               (LETT |rf1k|
                                                     (SPADCALL |rfc|
                                                               (QREFELT $ 147))
                                                     . #12#)
                                               (EXIT
                                                (LETT |zzl|
                                                      (SPADCALL |cfac|
                                                                (QREFELT $
                                                                         149))
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
                                                                             22))
                                                          (QREFELT $ 150))
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
                                                                          22))
                                                       (|spadConstant| $ 29)
                                                       (QREFELT $ 33))
                                                      "iterate")
                                                     ('T
                                                      (SEQ
                                                       (LETT |lle|
                                                             (|INTDEN;mk_poly|
                                                              (SPADCALL |e| 1
                                                                        (QREFELT
                                                                         $ 22))
                                                              |ii| |v1|
                                                              |c_shift| $)
                                                             . #12#)
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |deg1| 1
                                                                    (QREFELT $
                                                                             42))
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
                                                                              151))
                                                                    (QREFELT $
                                                                             63))
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
                                                                           63))
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
                                      (SPADCALL (SPADCALL |res| (QREFELT $ 44))
                                                (QREFELT $ 121))
                                      |elpart|
                                      (SPADCALL (|spadConstant| $ 152) |logs|
                                                NIL
                                                (QREFELT $ 158)))))))))))))))
          #14# (EXIT #2#)))) 

(SDEFUN |INTDEN;li_int;FKSR;13|
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
          (|lk| (|List| (|Kernel| F))) (#1=#:G457 NIL) (|kk| NIL)
          (#2=#:G456 NIL) (|f| (F)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 161))
                . #3=(|INTDEN;li_int;FKSR;13|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 162)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 47)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 47))
                                  (SPADCALL |kk| |k| (QREFELT $ 163)))
                                 (#4='T NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 165))
                . #3#)
          (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 152) |rf| (|spadConstant| $ 166)))
            (#4# (QCDR |res|))))))) 

(SDEFUN |INTDEN;poly_int;FKSR;14|
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
          (|lk| (|List| (|Kernel| F))) (#1=#:G464 NIL) (|kk| NIL)
          (#2=#:G463 NIL) (|f| (F)))
         (SEQ
          (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 161))
                . #3=(|INTDEN;poly_int;FKSR;14|))
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |kk| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 162)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 47)) 'T)
                                 ((SPADCALL |kk| '|log| (QREFELT $ 47))
                                  (SPADCALL |kk| |k| (QREFELT $ 163)))
                                 (#4='T NIL))
                           (LETT #2# (CONS |kk| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 165))
                . #3#)
          (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| $) . #3#)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (VECTOR (|spadConstant| $ 152) |rf| (|spadConstant| $ 166)))
            (#4# (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |DenominatorIntegration;|)) 

(DEFUN |DenominatorIntegration| (&REST #1=#:G465)
  (SPROG NIL
         (PROG (#2=#:G466)
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
          (LETT $ (GETREFV 170) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DenominatorIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DenominatorIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 9) (|SparseUnivariatePolynomial| 7)
              (|ExpressionFactorPolynomial| 6 7) (0 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 12) (|:| |factor| 9) (|:| |exponent| 26))
              (|List| 13) (5 . |factorList|) (|SingletonAsOrderedSet|)
              (10 . |create|) (|List| 7) (|Kernel| 7) (14 . |argument|)
              (|Integer|) (19 . |elt|) (25 . |leadingCoefficient|) (30 . |inv|)
              (35 . *) (|NonNegativeInteger|) (41 . |degree|) (46 . |Zero|)
              (50 . |Zero|) (|Symbol|) (54 . D) (|Boolean|) (60 . =)
              (66 . |coefficients|) (|Mapping| 32 7) (71 . |every?|)
              (77 . |coerce|) (82 . |One|) (86 . |One|) (90 . |coefficient|)
              (96 . *) (102 . >) (108 . |monomial|) (114 . |coerce|) (119 . -)
              (125 . |eval|) (132 . |is?|) (|Kernel| $) (138 . |coerce|)
              (|Vector| 7) (143 . |vector|) (|Union| 56 '"failed")
              (|IntegerLinearDependence| 7) (148 . |particularSolutionOverQ|)
              (|Record| (|:| |num| (|List| 21)) (|:| |den| 21)) (|Vector| 103)
              (|InnerCommonDenominator| 21 103 (|List| 21) 56)
              (154 . |splitDenominator|) (159 . ~=) (165 . ^) (|Mapping| 7 7 7)
              (171 . |reduce|) (177 . +) (183 . |coerce|) (188 . |coerce|)
              (193 . /) (199 . |One|) (203 . ~=) (|List| 9)
              (|PartialFractionUtilities| 7 9) (209 . |decompose|)
              (215 . |Zero|) (|Union| $ '"failed")
              (|SparseMultivariatePolynomial| 7 19) (219 . |exquo|) (|List| 19)
              (225 . |member?|) (231 . |One|) (235 . |One|) (239 . |monomial|)
              (246 . |coerce|) (|Mapping| 74 19) (|Mapping| 74 6)
              (|SparseMultivariatePolynomial| 6 19)
              (|PolynomialCategoryLifting| (|IndexedExponents| 19) 19 6 84 74)
              (251 . |map|) (|List| 48) (258 . |kernels|) (263 . ~=)
              (269 . |last|) (274 . |setDifference|)
              (|SparseMultivariatePolynomial| 6 48) (280 . |numer|)
              (285 . |denom|) (290 . |degree|) (296 . |exquo|) (302 . >)
              (308 . ^) (314 . *) (|Union| 7 '"failed") (320 . |retractIfCan|)
              (325 . /) (|Fraction| 21) (331 . |One|) (335 . |One|) (339 . *)
              (345 . |new|) (349 . |coerce|) (354 . -) (360 . |coefficients|)
              (|Union| 18 '"failed") (|List| 30) (|ExpressionLinearSolve| 6 7)
              (365 . |lin_sol|) (|Union| 140 '"failed") |INTDEN;solve_u;2FSU;6|
              (371 . |log|) (376 . |exp|) (381 . |li|) (|Fraction| 9)
              (386 . |coerce|) (|SparseUnivariatePolynomial| 120)
              (|Mapping| 120 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 9 120 122)
              (391 . |map|) (397 . |denom|) (402 . *) (|Mapping| 9 9 9)
              (408 . |reduce|) (414 . |exquo|) (420 . |numer|) (425 . /)
              (|SparseUnivariatePolynomial| $) (431 . |rootOf|) (436 . -)
              (441 . -) (447 . |differentiate|) (452 . |eval|)
              (459 . |retract|) (|List| 18) (464 . |elt|) (470 . |One|)
              (474 . |monomial|) (480 . |coerce|) (485 . -) (491 . +)
              (497 . |retract|) (|List| $) (502 . |zerosOf|) (507 . |retract|)
              (512 . |eval|) (519 . |Zero|)
              (|Record| (|:| |scalar| 103) (|:| |coeff| 122)
                        (|:| |logand| 122))
              (|List| 153) (|Record| (|:| |integrand| 120) (|:| |intvar| 120))
              (|List| 155) (|IntegrationResult| 120) (523 . |mkAnswer|)
              (530 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 19) 19
                                                     6 84 7)
              (536 . |multivariate|) (542 . |tower|) (547 . ~=)
              (|IntegrationTools| 6 7) (553 . |varselect|) (559 . |Zero|)
              (|Record| (|:| |answer| 120) (|:| |logpart| 120) (|:| |ir| 157))
              |INTDEN;li_int;FKSR;13| |INTDEN;poly_int;FKSR;14|)
           '#(|solve_u| 563 |poly_int| 570 |li_int| 577) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 169
                                                 '(1 10 8 9 11 1 8 14 0 15 0 16
                                                   0 17 1 19 18 0 20 2 18 7 0
                                                   21 22 1 9 7 0 23 1 7 0 0 24
                                                   2 9 0 7 0 25 1 9 26 0 27 0 6
                                                   0 28 0 7 0 29 2 7 0 0 30 31
                                                   2 7 32 0 0 33 1 9 18 0 34 2
                                                   18 32 35 0 36 1 7 0 21 37 0
                                                   6 0 38 0 7 0 39 2 9 7 0 26
                                                   40 2 7 0 0 0 41 2 26 32 0 0
                                                   42 2 9 0 7 26 43 1 9 0 7 44
                                                   2 9 0 0 0 45 3 9 0 0 16 0 46
                                                   2 19 32 0 30 47 1 7 0 48 49
                                                   1 50 0 18 51 2 53 52 50 7 54
                                                   1 57 55 56 58 2 21 32 0 0 59
                                                   2 7 0 0 21 60 2 18 7 61 0 62
                                                   2 7 0 0 0 63 1 6 0 21 64 1 7
                                                   0 6 65 2 7 0 0 0 66 0 9 0 67
                                                   2 9 32 0 0 68 2 70 69 9 69
                                                   71 0 9 0 72 2 74 73 0 0 75 2
                                                   76 32 19 0 77 0 74 0 78 0 26
                                                   0 79 3 74 0 0 19 26 80 1 74
                                                   0 7 81 3 85 74 82 83 84 86 1
                                                   7 87 0 88 2 7 32 0 0 89 1 76
                                                   19 0 90 2 76 0 0 0 91 1 7 92
                                                   0 93 1 7 92 0 94 2 74 26 0
                                                   19 95 2 26 73 0 0 96 2 21 32
                                                   0 0 97 2 74 0 0 26 98 2 74 0
                                                   0 0 99 1 74 100 0 101 2 74 0
                                                   0 7 102 0 103 0 104 0 84 0
                                                   105 2 74 0 7 0 106 0 30 0
                                                   107 1 7 0 30 108 2 74 0 0 0
                                                   109 1 74 18 0 110 2 113 111
                                                   18 112 114 1 7 0 0 117 1 7 0
                                                   0 118 1 7 0 0 119 1 120 0 9
                                                   121 2 124 122 123 9 125 1
                                                   120 9 0 126 2 9 0 0 0 127 2
                                                   69 9 128 0 129 2 9 73 0 0
                                                   130 1 120 9 0 131 2 120 0 9
                                                   9 132 1 7 0 133 134 1 7 0 0
                                                   135 2 7 0 0 0 136 1 9 0 0
                                                   137 3 9 0 0 16 7 138 1 9 7 0
                                                   139 2 140 18 0 21 141 0 120
                                                   0 142 2 122 0 120 26 143 1
                                                   122 0 120 144 2 122 0 0 0
                                                   145 2 120 0 0 0 146 1 7 48 0
                                                   147 1 7 148 133 149 1 7 21 0
                                                   150 3 7 0 0 48 0 151 0 120 0
                                                   152 3 157 0 120 154 156 158
                                                   2 7 0 0 0 159 2 160 7 120 19
                                                   161 1 7 87 0 162 2 19 32 0 0
                                                   163 2 164 76 76 30 165 0 157
                                                   0 166 3 0 115 7 7 30 116 3 0
                                                   167 120 19 30 169 3 0 167
                                                   120 19 30 168)))))
           '|lookupComplete|)) 
