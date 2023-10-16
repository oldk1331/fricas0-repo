
(SDEFUN |RDEEFX;top_kernel| ((|f| F) (|g| F) (|x| |Symbol|) ($ |Kernel| F))
        (SPROG
         ((|extra_tk| (|Boolean|)) (|tk| (|Kernel| F))
          (|htk| #1=(|NonNegativeInteger|)) (|hk| #1#) (#2=#:G328 NIL)
          (|k| NIL) (|lk| (|List| (|Kernel| F))) (|lkf| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lkf|
                (SPADCALL (SPADCALL |f| (QREFELT $ 11)) |x| (QREFELT $ 15)))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |g| (QREFELT $ 11)) |x| (QREFELT $ 15))
                 |lkf| (QREFELT $ 16)))
          (LETT |tk| (|SPADfirst| |lk|))
          (LETT |htk| (SPADCALL |tk| (QREFELT $ 19)))
          (LETT |extra_tk| (NULL (SPADCALL |tk| |lkf| (QREFELT $ 21))))
          (SEQ (LETT |k| NIL) (LETT #2# (CDR |lk|)) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |hk| (SPADCALL |k| (QREFELT $ 19)))
                    (EXIT
                     (COND
                      ((SPADCALL |hk| |htk| (QREFELT $ 22))
                       (SEQ (LETT |tk| |k|) (LETT |htk| |hk|)
                            (EXIT
                             (LETT |extra_tk|
                                   (NULL
                                    (SPADCALL |tk| |lkf| (QREFELT $ 21)))))))
                      ((< |hk| |htk|) "iterate")
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |tk| '|exp| (QREFELT $ 23))
                          (COND (|extra_tk| (EXIT "iterate")))))
                        (COND
                         ((SPADCALL |k| '|exp| (QREFELT $ 23))
                          (COND
                           ((NULL (SPADCALL |k| |lkf| (QREFELT $ 21)))
                            (EXIT
                             (SEQ (LETT |tk| |k|)
                                  (EXIT (LETT |extra_tk| 'T))))))))
                        (EXIT
                         (COND
                          ((SPADCALL |tk| '|exp| (QREFELT $ 23)) "iterate")
                          ((SPADCALL |k| '|exp| (QREFELT $ 23))
                           (SEQ (LETT |tk| |k|) (EXIT (LETT |extra_tk| NIL))))
                          ('T
                           (SEQ
                            (COND
                             ((SPADCALL |tk| '|log| (QREFELT $ 23))
                              (COND (|extra_tk| (EXIT "iterate")))))
                            (COND
                             ((SPADCALL |k| '|log| (QREFELT $ 23))
                              (COND
                               ((NULL (SPADCALL |k| |lkf| (QREFELT $ 21)))
                                (EXIT
                                 (SEQ (LETT |tk| |k|)
                                      (EXIT (LETT |extra_tk| 'T))))))))
                            (EXIT
                             (COND
                              ((SPADCALL |tk| '|log| (QREFELT $ 23)) "iterate")
                              ((SPADCALL |k| '|log| (QREFELT $ 23))
                               (SEQ (LETT |tk| |k|)
                                    (EXIT (LETT |extra_tk| NIL))))
                              ((SPADCALL (SPADCALL |tk| (QREFELT $ 25))
                                         (QREFELT $ 8) (QREFELT $ 26))
                               (COND
                                ((SPADCALL (SPADCALL |k| (QREFELT $ 25))
                                           (QREFELT $ 8) (QREFELT $ 26))
                                 (COND (|extra_tk| "iterate")
                                       ((NULL
                                         (SPADCALL |k| |lkf| (QREFELT $ 21)))
                                        (SEQ (LETT |tk| |k|)
                                             (EXIT (LETT |extra_tk| 'T))))))
                                ('T
                                 (SEQ (LETT |tk| |k|)
                                      (EXIT
                                       (LETT |extra_tk|
                                             (NULL
                                              (SPADCALL |k| |lkf|
                                                        (QREFELT $
                                                                 21))))))))))))))))))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |tk|)))) 

(SDEFUN |RDEEFX;genus0_if_can|
        ((|k| |Kernel| F) (|kx| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |exponent| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((|c1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|d| (F))
          (|c| (F)) (|b| (F)) (|a| (F))
          (|drf| (|SparseUnivariatePolynomial| F))
          (|nrf| (|SparseUnivariatePolynomial| F))
          (|r1rf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|r1| (F))
          (|n| (|NonNegativeInteger|)) (#1=#:G334 NIL) (|args| (|List| F)))
         (SEQ
          (COND
           ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 23))) (CONS 1 "failed"))
           ('T
            (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 28)))
                 (LETT |n|
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |args| 2 (QREFELT $ 30))
                                           (QREFELT $ 31)))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (LETT |r1| (SPADCALL |args| 1 (QREFELT $ 30)))
                 (LETT |r1rf| (SPADCALL |r1| |kx| (QREFELT $ 36)))
                 (LETT |nrf| (SPADCALL |r1rf| (QREFELT $ 39)))
                 (LETT |drf| (SPADCALL |r1rf| (QREFELT $ 40)))
                 (COND
                  ((OR
                    (SPADCALL (SPADCALL |nrf| (QREFELT $ 41)) 1 (QREFELT $ 42))
                    (SPADCALL (SPADCALL |drf| (QREFELT $ 41)) 1
                              (QREFELT $ 42)))
                   (EXIT (CONS 1 "failed"))))
                 (LETT |a| (SPADCALL |nrf| 1 (QREFELT $ 43)))
                 (LETT |b| (SPADCALL |nrf| 0 (QREFELT $ 43)))
                 (LETT |c| (SPADCALL |drf| 1 (QREFELT $ 43)))
                 (LETT |d| (SPADCALL |drf| 0 (QREFELT $ 43)))
                 (LETT |c1|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |d| |n| (QREFELT $ 46))
                                   (SPADCALL |b| (QREFELT $ 47))
                                   (QREFELT $ 48))
                         (QREFELT $ 49))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| (QREFELT $ 50)) |n|
                                    (QREFELT $ 46))
                          (SPADCALL |a| (QREFELT $ 47)) (QREFELT $ 51))
                         (QREFELT $ 49))
                        (QREFELT $ 52)))
                 (EXIT (CONS 0 (VECTOR |c1| |r1rf| |n|))))))))) 

(SDEFUN |RDEEFX;ei_int_alg|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|ansp| (F)) (|a1| (F)) (|r1| (F)) (|kf| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|nf| (F)) (|ng| (F)) (|dfx| (F)) (|fy| (F)) (|fx| (F))
          (|nxk| (|Kernel| F)) (|nx| (|Symbol|))
          (|cv|
           (|Record|
            (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |exponent| (|NonNegativeInteger|))))
          (|cvu|
           (|Union|
            (|Record|
             (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|kx| (|Kernel| F)))
         (SEQ (LETT |kx| (SPADCALL |lk| (QREFELT $ 53)))
              (COND
               ((NULL (QEQCAR (SPADCALL |kx| (QREFELT $ 55)) 0))
                (EXIT (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT $ 58)))))
              (LETT |cvu| (|RDEEFX;genus0_if_can| |k| |kx| $))
              (EXIT
               (COND
                ((QEQCAR |cvu| 1)
                 (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT $ 58)))
                ('T
                 (SEQ (LETT |cv| (QCDR |cvu|))
                      (LETT |nx| (SPADCALL (QREFELT $ 59)))
                      (LETT |nxk| (SPADCALL |nx| (QREFELT $ 60)))
                      (LETT |fx|
                            (SPADCALL (QVELT |cv| 0) |nxk| (QREFELT $ 62)))
                      (LETT |fy| (SPADCALL |nxk| (QREFELT $ 63)))
                      (LETT |dfx| (SPADCALL |fx| |nx| (QREFELT $ 64)))
                      (LETT |ng|
                            (SPADCALL |dfx|
                                      (SPADCALL |g| (LIST |kx| |k|)
                                                (LIST |fx| |fy|)
                                                (QREFELT $ 66))
                                      (QREFELT $ 67)))
                      (LETT |nf|
                            (SPADCALL |f| (LIST |kx| |k|) (LIST |fx| |fy|)
                                      (QREFELT $ 66)))
                      (LETT |res1|
                            (SPADCALL |n| |nf| |ng| |nx| (QREFELT $ 68)))
                      (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
                      (LETT |r1|
                            (SPADCALL
                             (SPADCALL (QVELT |res1| 1) |dfx| (QREFELT $ 69))
                             |nxk| |kf| (QREFELT $ 70)))
                      (LETT |a1|
                            (SPADCALL (QVELT |res1| 0) |nxk| |kf|
                                      (QREFELT $ 70)))
                      (LETT |ansp|
                            (SPADCALL (QVELT |res1| 2) |nxk| |kf|
                                      (QREFELT $ 70)))
                      (EXIT (VECTOR |a1| |r1| |ansp| (QVELT |res1| 3)))))))))) 

(SDEFUN |RDEEFX;UP_to_UPUP|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (ELT $ 47) |p| (QREFELT $ 74))) 

(SDEFUN |RDEEFX;get_uv0|
        ((|tt| F) (|coeffs| |List| (|Integer|)) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |u_part| F) (|:| |v_part| F)
          (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
        (SPROG
         ((|kc| #1=(|Integer|)) (#2=#:G371 NIL) (|vi| NIL) (#3=#:G372 NIL)
          (|ki| NIL) (|kf| (F)) (|u| (F)) (#4=#:G369 NIL) (|ui| NIL)
          (#5=#:G370 NIL) (#6=#:G368 NIL) (|ku| #1#) (#7=#:G366 NIL)
          (#8=#:G367 NIL) (|v0| (F)) (#9=#:G364 NIL) (#10=#:G365 NIL)
          (#11=#:G363 NIL))
         (SEQ
          (LETT |v0|
                (SPADCALL |tt|
                          (SPADCALL (ELT $ 75)
                                    (PROGN
                                     (LETT #11# NIL)
                                     (SEQ (LETT |ki| NIL) (LETT #10# |coeffs|)
                                          (LETT |vi| NIL) (LETT #9# |vlst|)
                                          G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |vi| (CAR #9#))
                                                 NIL)
                                                (ATOM #10#)
                                                (PROGN
                                                 (LETT |ki| (CAR #10#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #11#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |ki|
                                                              (QREFELT $ 76))
                                                    |vi| (QREFELT $ 67))
                                                   #11#))))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT #10# (CDR #10#))))
                                          (GO G190) G191
                                          (EXIT (NREVERSE #11#))))
                                    (|spadConstant| $ 45) (QREFELT $ 78))
                          (QREFELT $ 79)))
          (LETT |ku| 0) (LETT |u| (|spadConstant| $ 33))
          (COND
           ((SPADCALL |k| '|exp| (QREFELT $ 23))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
                 (EXIT
                  (SEQ (LETT |ki| NIL) (LETT #8# |coeffs|) (LETT |ui| NIL)
                       (LETT #7# |ulst|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |ui| (CAR #7#)) NIL)
                             (ATOM #8#) (PROGN (LETT |ki| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |ui| |kf| (QREFELT $ 80))
                           (LETT |ku| |ki|))
                          ('T
                           (LETT |u|
                                 (SPADCALL |u|
                                           (SPADCALL |ui| |ki| (QREFELT $ 81))
                                           (QREFELT $ 67)))))))
                       (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (LETT |u|
                  (SPADCALL (ELT $ 67)
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |ki| NIL) (LETT #5# |coeffs|)
                                  (LETT |ui| NIL) (LETT #4# |ulst|) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |ui| (CAR #4#)) NIL)
                                        (ATOM #5#)
                                        (PROGN (LETT |ki| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |ui| |ki| (QREFELT $ 81))
                                           #6#))))
                                  (LETT #4#
                                        (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                                  (GO G190) G191 (EXIT (NREVERSE #6#))))
                            (|spadConstant| $ 33) (QREFELT $ 78)))))
          (LETT |kc| 0)
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 23))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
                 (EXIT
                  (SEQ (LETT |ki| NIL) (LETT #3# |coeffs|) (LETT |vi| NIL)
                       (LETT #2# |vlst|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |vi| (CAR #2#)) NIL)
                             (ATOM #3#) (PROGN (LETT |ki| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |vi| |kf| (QREFELT $ 80))
                           (LETT |kc| |ki|)))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT (VECTOR |u| |v0| |ku| |kc|))))) 

(SDEFUN |RDEEFX;get_uv|
        ((|tt| F) (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |u_part| F) (|:| |v_part| F)
                    (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
          "failed"))
        (SPROG
         ((|d| #1=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #1#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|dvvec| (|Vector| F)) (#2=#:G385 NIL) (|vi| NIL) (#3=#:G384 NIL))
         (SEQ
          (LETT |dvvec|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL)
                  (SEQ (LETT |vi| NIL) (LETT #2# |vlst|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |vi| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS (SPADCALL |vi| |x| (QREFELT $ 64)) #3#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 83)))
          (LETT |su|
                (SPADCALL |dvvec| (SPADCALL |tt| |x| (QREFELT $ 64))
                          (QREFELT $ 86)))
          (EXIT
           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                 (#4='T
                  (SEQ (LETT |sv| (QCDR |su|))
                       (LETT |cd| (SPADCALL |sv| (QREFELT $ 90)))
                       (LETT |d| (QCDR |cd|))
                       (EXIT
                        (COND
                         ((SPADCALL |d| 1 (QREFELT $ 91)) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (|RDEEFX;get_uv0| |tt| (QCAR |cd|) |vlst|
                                 |ulst| |k| |x| $)))))))))))) 

(SDEFUN |RDEEFX;handle_factor|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|f1| |SparseUnivariatePolynomial| F) (|r0| |Integer|) (|u0| F)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|known_dividing| |Boolean|)
         ($ |Union|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))
          "failed"))
        (SPROG
         ((|ff1| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G405 NIL)
          (|ff3| (|SparseUnivariatePolynomial| F)) (#3=#:G395 NIL) (|ff2| #1#)
          (|ff| #4=(|SparseUnivariatePolynomial| F))
          (|f2pp| #5=(|SparseUnivariatePolynomial| F)) (|tt1| #4#) (|u| (F))
          (|tt| (F)) (|v0| (F)) (|u_exp| (|Integer|))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|f2| #5#) (|deg1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)))
                (LETT |tt|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 43))
                                 (SPADCALL (SPADCALL |deg1| (QREFELT $ 76))
                                           (SPADCALL |f1| |deg1|
                                                     (QREFELT $ 43))
                                           (QREFELT $ 67))
                                 (QREFELT $ 69))
                       (QREFELT $ 50)))
                (LETT |f2|
                      (SPADCALL |f1| (QREFELT $ 94)
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 33) 1
                                           (QREFELT $ 46))
                                 (SPADCALL |tt| (QREFELT $ 47)) (QREFELT $ 51))
                                (QREFELT $ 95)))
                (COND
                 ((NULL
                   (SPADCALL (CONS #'|RDEEFX;handle_factor!0| (VECTOR $ |x|))
                             (SPADCALL |f2| (QREFELT $ 96)) (QREFELT $ 98)))
                  (EXIT (PROGN (LETT #2# (CONS 1 "failed")) (GO #6=#:G404)))))
                (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $))
                (EXIT
                 (COND
                  ((QEQCAR |uvu| 1)
                   (PROGN (LETT #2# (CONS 1 "failed")) (GO #6#)))
                  (#7='T
                   (SEQ (LETT |uv| (QCDR |uvu|)) (LETT |u| (QVELT |uv| 0))
                        (LETT |u_exp| (QVELT |uv| 2))
                        (LETT |v0| (QVELT |uv| 1))
                        (COND
                         ((EQL |r0| 0)
                          (SEQ (LETT |r0| (QVELT |uv| 3))
                               (EXIT
                                (LETT |tt|
                                      (SPADCALL |tt|
                                                (SPADCALL
                                                 (SPADCALL |r0| (QREFELT $ 76))
                                                 (SPADCALL |k| (QREFELT $ 63))
                                                 (QREFELT $ 67))
                                                (QREFELT $ 79))))))
                         (#7#
                          (LETT |u|
                                (SPADCALL (SPADCALL |u0| |r0| (QREFELT $ 81))
                                          |u| (QREFELT $ 67)))))
                        (LETT |tt1|
                              (SPADCALL
                               (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                         (QREFELT $ 46))
                               (SPADCALL |tt| (QREFELT $ 47)) (QREFELT $ 51)))
                        (LETT |ff|
                              (SPADCALL |nf|
                                        (SPADCALL |tt1| |denf| (QREFELT $ 99))
                                        (QREFELT $ 51)))
                        (COND
                         ((SPADCALL |deg1| 1 (QREFELT $ 22))
                          (LETT |ff|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |denf| 1 (QREFELT $ 100))
                                           (SPADCALL |ff| (QREFELT $ 101))
                                           (QREFELT $ 102))
                                 (|RDEEFX;UP_to_UPUP| |f2| $)
                                 (QREFELT $ 103)))))
                        (LETT |f2pp|
                              (COND ((EQL |deg1| 1) (|spadConstant| $ 104))
                                    (#7# |f2|)))
                        (EXIT
                         (COND
                          (|known_dividing|
                           (SEQ
                            (LETT |ff|
                                  (SPADCALL |ff|
                                            (SPADCALL |ff| (QREFELT $ 105))
                                            (QREFELT $ 106)))
                            (EXIT
                             (CONS 0
                                   (VECTOR |ff| |r0| |tt| |f2pp| |u| |u_exp|
                                           |v0|)))))
                          (#7#
                           (SEQ
                            (LETT |ff2|
                                  (LETT |ff1|
                                        (SPADCALL |ff| |gd| (QREFELT $ 107))))
                            (LETT |ff3|
                                  (PROG2
                                      (LETT #3#
                                            (SPADCALL |ff| |ff1|
                                                      (QREFELT $ 109)))
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))
                                                    (|Union|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 7))
                                                     #8="failed")
                                                    #3#)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (LETT |ff2|
                                           (SPADCALL |ff2| |ff3|
                                                     (QREFELT $ 107)))
                                     (|spadConstant| $ 110) (QREFELT $ 111)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |ff3|
                                         (PROG2
                                             (LETT #3#
                                                   (SPADCALL |ff3| |ff2|
                                                             (QREFELT $ 109)))
                                             (QCDR #3#)
                                           (|check_union2| (QEQCAR #3# 0)
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 7))
                                                           (|Union|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 7))
                                                            #8#)
                                                           #3#)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((NULL (EQL (SPADCALL |ff3| (QREFELT $ 41)) 0))
                              (COND
                               ((SPADCALL |k| '|exp| (QREFELT $ 23))
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |ff3| (QREFELT $ 112))
                                             (|spadConstant| $ 104)
                                             (QREFELT $ 113)))
                                  (EXIT
                                   (PROGN
                                    (LETT #2# (CONS 1 #9="failed"))
                                    (GO #6#))))))
                               (#7#
                                (EXIT
                                 (PROGN (LETT #2# (CONS 1 #9#)) (GO #6#)))))))
                            (LETT |ff1|
                                  (SPADCALL |ff1|
                                            (SPADCALL |ff1| (QREFELT $ 105))
                                            (QREFELT $ 106)))
                            (EXIT
                             (CONS 0
                                   (VECTOR |ff1| |r0| |tt| |f2pp| |u| |u_exp|
                                           |v0|)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |RDEEFX;handle_factor!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;z_basis|
        ((|a| |Vector| (|Fraction| (|Integer|)))
         (|b| |List| (|Vector| (|Fraction| (|Integer|))))
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| (|Integer|)))
                    (|:| |basis| (|List| (|Vector| (|Integer|)))))
          "failed"))
        (SPROG
         ((#1=#:G413 NIL) (#2=#:G431 NIL) (|i| NIL)
          (|av| #3=(|Vector| (|Integer|))) (|ki| (|Integer|))
          (|di| (|Integer|)) (|g| #4=(|Integer|)) (|c2| #5=(|Integer|))
          (|c1| #6=(|Integer|))
          (|#G55|
           (|Record| (|:| |coef1| #6#) (|:| |coef2| #5#)
                     (|:| |generator| #4#)))
          (|ki1| (|Integer|)) (|di2| (|Integer|)) (|di1| (|Integer|))
          (#7=#:G428 NIL) (|bi| #8=(|Integer|)) (|ai| #8#) (#9=#:G430 NIL)
          (#10=#:G429 NIL) (|n| (|NonNegativeInteger|)) (|bv| #3#)
          (|gb| (|Integer|)) (|bl| #11=(|List| (|Integer|)))
          (|db| #12=(|Integer|))
          (|cd| (|Record| (|:| |num| #11#) (|:| |den| #12#)))
          (|bvp| (|Vector| (|Fraction| (|Integer|)))) (|da| #12#)
          (|nn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nn| (LENGTH |b|))
                (EXIT
                 (COND ((SPADCALL |nn| 1 (QREFELT $ 22)) (|error| "#b > 1"))
                       (#13='T
                        (SEQ (LETT |cd| (SPADCALL |a| (QREFELT $ 90)))
                             (LETT |da| (QCDR |cd|))
                             (LETT |av| (SPADCALL (QCAR |cd|) (QREFELT $ 116)))
                             (EXIT
                              (COND
                               ((EQL |nn| 0)
                                (COND
                                 ((SPADCALL |da| 1 (QREFELT $ 91))
                                  (CONS 1 "failed"))
                                 (#13# (CONS 0 (CONS |av| NIL)))))
                               (#13#
                                (SEQ (LETT |bvp| (|SPADfirst| |b|))
                                     (LETT |cd|
                                           (SPADCALL |bvp| (QREFELT $ 90)))
                                     (LETT |db| (QCDR |cd|))
                                     (LETT |bl| (QCAR |cd|))
                                     (LETT |gb|
                                           (SPADCALL |bl| (QREFELT $ 117)))
                                     (LETT |bv|
                                           (SPADCALL |bl| (QREFELT $ 116)))
                                     (LETT |n| (QVSIZE |bv|))
                                     (SEQ (LETT |i| 1) (LETT #10# |n|) G190
                                          (COND
                                           ((|greater_SI| |i| #10#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |bv| |i|
                                                      (PROG2
                                                          (LETT #1#
                                                                (SPADCALL
                                                                 (SPADCALL |bv|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            118))
                                                                 |gb|
                                                                 (QREFELT $
                                                                          119)))
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #14="failed")
                                                         #1#))
                                                      (QREFELT $ 120))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((EQL |da| 1)
                                        (CONS 0 (CONS |av| (LIST |bv|))))
                                       ((QEQCAR
                                         (SPADCALL |db| |da| (QREFELT $ 119))
                                         1)
                                        (CONS 1 "failed"))
                                       (#13#
                                        (SEQ (LETT |ki| 0) (LETT |di| 1)
                                             (SEQ (LETT |i| 1) (LETT #9# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #9#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |ai|
                                                         (SPADCALL |av| |i|
                                                                   (QREFELT $
                                                                            118)))
                                                   (LETT |bi|
                                                         (SPADCALL |bv| |i|
                                                                   (QREFELT $
                                                                            118)))
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (REM
                                                        (- |ai| (* |ki| |bi|))
                                                        |di|)
                                                       0 (QREFELT $ 91))
                                                      (PROGN
                                                       (LETT #7#
                                                             (CONS 1 "failed"))
                                                       (GO #15=#:G427)))
                                                     ('T
                                                      (SEQ
                                                       (LETT |di1|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (SPADCALL
                                                                        |da|
                                                                        (GCD
                                                                         |bi|
                                                                         |da|)
                                                                        (QREFELT
                                                                         $
                                                                         119)))
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #14#)
                                                                #1#)))
                                                       (LETT |di2|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (SPADCALL
                                                                        |di1|
                                                                        (GCD
                                                                         |di1|
                                                                         |di|)
                                                                        (QREFELT
                                                                         $
                                                                         119)))
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #14#)
                                                                #1#)))
                                                       (EXIT
                                                        (COND
                                                         ((EQL |di2| 1)
                                                          "iterate")
                                                         ('T
                                                          (SEQ
                                                           (LETT |ki1|
                                                                 (SPADCALL |bi|
                                                                           |di2|
                                                                           (QREFELT
                                                                            $
                                                                            121)))
                                                           (PROGN
                                                            (LETT |#G55|
                                                                  (SPADCALL
                                                                   |di| |di2|
                                                                   (QREFELT $
                                                                            123)))
                                                            (LETT |c1|
                                                                  (QVELT |#G55|
                                                                         0))
                                                            (LETT |c2|
                                                                  (QVELT |#G55|
                                                                         1))
                                                            (LETT |g|
                                                                  (QVELT |#G55|
                                                                         2))
                                                            |#G55|)
                                                           (LETT |di|
                                                                 (* |di2|
                                                                    |di|))
                                                           (EXIT
                                                            (LETT |ki|
                                                                  (REM
                                                                   (+
                                                                    (* |ki1|
                                                                       |c1|)
                                                                    (* |ki|
                                                                       |c2|))
                                                                   |di|))))))))))))
                                                  (LETT |i| (|inc_SI| |i|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |av|
                                                   (SPADCALL |av|
                                                             (SPADCALL |ki|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 124))
                                                             (QREFELT $ 125)))
                                             (SEQ (LETT |i| 1) (LETT #2# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #2#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |av| |i|
                                                              (PROG2
                                                                  (LETT #1#
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |av|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           118))
                                                                         |da|
                                                                         (QREFELT
                                                                          $
                                                                          119)))
                                                                  (QCDR #1#)
                                                                (|check_union2|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #14#)
                                                                 #1#))
                                                              (QREFELT $
                                                                       120))))
                                                  (LETT |i| (|inc_SI| |i|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (CONS |av|
                                                          (LIST
                                                           |bv|))))))))))))))))))
          #15# (EXIT #7#)))) 

(SDEFUN |RDEEFX;lin_args|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                    (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                    (|:| |u_part2| F) (|:| |shift_part2| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F))))
          (|v2| (F)) (|u2| (F))
          (|uv2|
           #1=(|Record| (|:| |u_part| F) (|:| |v_part| F)
                        (|:| |exponent| (|Integer|))
                        (|:| |coeff| (|Integer|))))
          (|r2| (|Integer|)) (|bv| (|Vector| (|Integer|))) (|v1| (F))
          (|u1| (F)) (|uv1| #1#) (|tt1| (F)) (|a1n| (F)) (|r0| (|Integer|))
          (|vec1| (|Vector| (|Integer|)))
          (|zb|
           (|Record| (|:| |particular| (|Vector| (|Integer|)))
                     (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (|zbu|
           (|Union|
            (|Record| (|:| |particular| (|Vector| (|Integer|)))
                      (|:| |basis| (|List| (|Vector| (|Integer|)))))
            "failed"))
          (|psol| (|Vector| (|Fraction| (|Integer|))))
          (|psolu| #2=(|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sol_rec|
           (|Record| (|:| |particular| #2#)
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|vecf| (|Vector| F)) (|dv0| (F)) (|dvs| (|List| F)) (#3=#:G467 NIL)
          (|v| NIL) (#4=#:G466 NIL) (|dv1| (F)) (#5=#:G462 NIL)
          (|no_sol| #6=(|Boolean|)) (|f2| (|SparseUnivariatePolynomial| F))
          (|r0u| (|Union| (|Integer|) "failed")) (|r0f| (F)) (|b0p| (F))
          (|b0| (F)) (|has_r0| #6#) (|a1p| (F)) (|tt| (F))
          (|f1| (|SparseUnivariatePolynomial| F))
          (|deg1| (|NonNegativeInteger|)) (#7=#:G465 NIL) (|fac| NIL)
          (|ulst1| (|List| F)) (|vlst1| (|List| F)) (|u0| (F)) (#8=#:G463 NIL)
          (#9=#:G464 NIL) (|u| NIL) (|v0| (F)) (|a0| (F)) (|a1| (F))
          (|fgd| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |fgd| (SPADCALL |gd| (QREFELT $ 128)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 42))
                 (|error| "lin_args only works for linear nf"))
                (#10='T
                 (SEQ
                  (LETT |a1|
                        (COND
                         ((EQL (SPADCALL |nf| (QREFELT $ 41)) 1)
                          (SPADCALL |nf| (QREFELT $ 105)))
                         (#10# (|spadConstant| $ 45))))
                  (LETT |a0| (SPADCALL |nf| 0 (QREFELT $ 43)))
                  (LETT |v0| (SPADCALL |k| (QREFELT $ 63))) (LETT |vlst1| NIL)
                  (LETT |ulst1| NIL)
                  (SEQ (LETT |u| NIL) (LETT #9# |ulst|) (LETT |v| NIL)
                       (LETT #8# |vlst|) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |v| (CAR #8#)) NIL)
                             (ATOM #9#) (PROGN (LETT |u| (CAR #9#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |v| |v0| (QREFELT $ 80)) (LETT |u0| |u|))
                          ('T
                           (SEQ (LETT |vlst1| (CONS |v| |vlst1|))
                                (EXIT (LETT |ulst1| (CONS |u| |ulst1|))))))))
                       (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res| NIL)
                  (SEQ (LETT |fac| NIL)
                       (LETT #7# (SPADCALL |fgd| (QREFELT $ 132))) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)))
                            (EXIT
                             (COND ((EQL |deg1| 0) "iterate")
                                   ('T
                                    (SEQ
                                     (LETT |f1|
                                           (SPADCALL |f1|
                                                     (SPADCALL |f1|
                                                               (QREFELT $ 105))
                                                     (QREFELT $ 106)))
                                     (LETT |tt|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |f1| (- |deg1| 1)
                                                       (QREFELT $ 43))
                                             (SPADCALL |deg1| (QREFELT $ 76))
                                             (QREFELT $ 69))
                                            (QREFELT $ 50)))
                                     (LETT |no_sol| NIL) (LETT |has_r0| NIL)
                                     (LETT |f2| (|spadConstant| $ 104))
                                     (LETT |r0| 0)
                                     (LETT |r0f| (|spadConstant| $ 45))
                                     (COND
                                      ((SPADCALL |deg1| 1 (QREFELT $ 22))
                                       (SEQ
                                        (EXIT
                                         (SEQ
                                          (LETT |f2|
                                                (SPADCALL |f1| (QREFELT $ 94)
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            33)
                                                            1 (QREFELT $ 46))
                                                           (SPADCALL |tt|
                                                                     (QREFELT $
                                                                              47))
                                                           (QREFELT $ 51))
                                                          (QREFELT $ 95)))
                                          (LETT |f2|
                                                (SPADCALL |f2|
                                                          (SPADCALL |f2|
                                                                    (QREFELT $
                                                                             105))
                                                          (QREFELT $ 106)))
                                          (COND
                                           ((SPADCALL
                                             (LETT |a1p|
                                                   (SPADCALL |a1| |x|
                                                             (QREFELT $ 64)))
                                             (|spadConstant| $ 45)
                                             (QREFELT $ 133))
                                            (SEQ (LETT |has_r0| 'T)
                                                 (LETT |b0|
                                                       (SPADCALL |f2| 0
                                                                 (QREFELT $
                                                                          43)))
                                                 (LETT |b0p|
                                                       (SPADCALL |b0| |x|
                                                                 (QREFELT $
                                                                          64)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |b0p|
                                                              (|spadConstant| $
                                                                              45)
                                                              (QREFELT $ 80))
                                                    (LETT |no_sol| 'T))
                                                   ('T
                                                    (SEQ
                                                     (LETT |r0f|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |deg1|
                                                                 (QREFELT $
                                                                          76))
                                                                |a1p|
                                                                (QREFELT $ 67))
                                                               |b0|
                                                               (QREFELT $ 67))
                                                              |b0p|
                                                              (QREFELT $ 69))
                                                             (QREFELT $ 50))
                                                            |a1|
                                                            (QREFELT $ 79)))
                                                     (LETT |r0u|
                                                           (SPADCALL |r0f|
                                                                     (QREFELT $
                                                                              135)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |r0u| 1)
                                                        (LETT |no_sol| 'T))
                                                       ('T
                                                        (SEQ
                                                         (LETT |r0|
                                                               (QCDR |r0u|))
                                                         (EXIT
                                                          (LETT |f2|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |a1| |r0f|
                                                                   (QREFELT $
                                                                            75))
                                                                  |deg1|
                                                                  (QREFELT $
                                                                           81))
                                                                 (SPADCALL |f2|
                                                                           (QREFELT
                                                                            $
                                                                            94)
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (|spadConstant|
                                                                              $
                                                                              33)
                                                                             (SPADCALL
                                                                              |a1|
                                                                              |r0f|
                                                                              (QREFELT
                                                                               $
                                                                               75))
                                                                             (QREFELT
                                                                              $
                                                                              69))
                                                                            1
                                                                            (QREFELT
                                                                             $
                                                                             46))
                                                                           (QREFELT
                                                                            $
                                                                            95))
                                                                 (QREFELT $
                                                                          138)))))))))))))))
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL
                                               (CONS #'|RDEEFX;lin_args!0|
                                                     (VECTOR $ |x|))
                                               (SPADCALL |f2| (QREFELT $ 96))
                                               (QREFELT $ 98)))
                                             (PROGN
                                              (LETT #5# (LETT |no_sol| 'T))
                                              (GO #11=#:G445)))))))
                                        #11# (EXIT #5#))))
                                     (EXIT
                                      (COND (|no_sol| "iterate")
                                            ('T
                                             (SEQ
                                              (LETT |dv0|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |a1| |tt|
                                                                 (QREFELT $
                                                                          67))
                                                       |a0| (QREFELT $ 75))
                                                      |x| (QREFELT $ 64))
                                                     (QREFELT $ 50)))
                                              (LETT |dv1|
                                                    (SPADCALL |tt| |x|
                                                              (QREFELT $ 64)))
                                              (LETT |dvs|
                                                    (PROGN
                                                     (LETT #4# NIL)
                                                     (SEQ (LETT |v| NIL)
                                                          (LETT #3# |vlst1|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #3#)
                                                                (PROGN
                                                                 (LETT |v|
                                                                       (CAR
                                                                        #3#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #4#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |v| |x|
                                                                    (QREFELT $
                                                                             64))
                                                                   #4#))))
                                                          (LETT #3# (CDR #3#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #4#)))))
                                              (LETT |vecf|
                                                    (COND
                                                     (|has_r0|
                                                      (SEQ
                                                       (LETT |dv0|
                                                             (SPADCALL |dv0|
                                                                       (SPADCALL
                                                                        |r0f|
                                                                        |dv1|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 75)))
                                                       (EXIT
                                                        (SPADCALL |dvs|
                                                                  (QREFELT $
                                                                           83)))))
                                                     ('T
                                                      (SPADCALL
                                                       (CONS |dv1| |dvs|)
                                                       (QREFELT $ 83)))))
                                              (LETT |sol_rec|
                                                    (SPADCALL |vecf| |dv0|
                                                              (QREFELT $ 140)))
                                              (LETT |psolu| (QCAR |sol_rec|))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |psolu| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |psol| (QCDR |psolu|))
                                                  (COND
                                                   (|has_r0|
                                                    (LETT |psol|
                                                          (SPADCALL
                                                           (CONS
                                                            (SPADCALL |r0|
                                                                      (QREFELT
                                                                       $ 142))
                                                            (SPADCALL |psol|
                                                                      (QREFELT
                                                                       $ 144)))
                                                           (QREFELT $ 145)))))
                                                  (LETT |zbu|
                                                        (|RDEEFX;z_basis|
                                                         |psol|
                                                         (QCDR |sol_rec|) $))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |zbu| 1)
                                                     "iterate")
                                                    ('T
                                                     (SEQ
                                                      (LETT |zb| (QCDR |zbu|))
                                                      (LETT |vec1| (QCAR |zb|))
                                                      (LETT |r0|
                                                            (SPADCALL |vec1| 1
                                                                      (QREFELT
                                                                       $ 118)))
                                                      (LETT |a1n|
                                                            (SPADCALL |a1|
                                                                      (SPADCALL
                                                                       |r0|
                                                                       (QREFELT
                                                                        $ 76))
                                                                      (QREFELT
                                                                       $ 75)))
                                                      (LETT |tt1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |a1n|
                                                                        |tt|
                                                                        (QREFELT
                                                                         $ 67))
                                                              (QREFELT $ 50))
                                                             |a0|
                                                             (QREFELT $ 79)))
                                                      (LETT |uv1|
                                                            (|RDEEFX;get_uv0|
                                                             |tt1|
                                                             (CDR
                                                              (SPADCALL |vec1|
                                                                        (QREFELT
                                                                         $
                                                                         146)))
                                                             |vlst1| |ulst1|
                                                             |k| |x| $))
                                                      (LETT |u1|
                                                            (SPADCALL
                                                             (QVELT |uv1| 0)
                                                             (SPADCALL |u0|
                                                                       |r0|
                                                                       (QREFELT
                                                                        $ 81))
                                                             (QREFELT $ 67)))
                                                      (LETT |v1|
                                                            (QVELT |uv1| 1))
                                                      (EXIT
                                                       (COND
                                                        ((NULL (QCDR |zb|))
                                                         (LETT |res|
                                                               (CONS
                                                                (VECTOR |f1|
                                                                        |r0|
                                                                        |tt1|
                                                                        |f2|
                                                                        |u1| 0
                                                                        |v1|
                                                                        NIL 0
                                                                        (|spadConstant|
                                                                         $ 45)
                                                                        (|spadConstant|
                                                                         $ 33)
                                                                        (|spadConstant|
                                                                         $ 45))
                                                                |res|)))
                                                        ('T
                                                         (SEQ
                                                          (LETT |bv|
                                                                (|SPADfirst|
                                                                 (QCDR |zb|)))
                                                          (LETT |r2|
                                                                (SPADCALL |bv|
                                                                          1
                                                                          (QREFELT
                                                                           $
                                                                           118)))
                                                          (LETT |uv2|
                                                                (|RDEEFX;get_uv0|
                                                                 (SPADCALL |tt|
                                                                           (QREFELT
                                                                            $
                                                                            50))
                                                                 (CDR
                                                                  (SPADCALL
                                                                   |bv|
                                                                   (QREFELT $
                                                                            146)))
                                                                 |vlst1|
                                                                 |ulst1| |k|
                                                                 |x| $))
                                                          (LETT |u2|
                                                                (SPADCALL
                                                                 (QVELT |uv2|
                                                                        0)
                                                                 (SPADCALL |u0|
                                                                           |r2|
                                                                           (QREFELT
                                                                            $
                                                                            81))
                                                                 (QREFELT $
                                                                          67)))
                                                          (LETT |v2|
                                                                (QVELT |uv2|
                                                                       1))
                                                          (EXIT
                                                           (LETT |res|
                                                                 (CONS
                                                                  (VECTOR |f1|
                                                                          |r0|
                                                                          |tt1|
                                                                          |f2|
                                                                          |u1|
                                                                          0
                                                                          |v1|
                                                                          'T
                                                                          |r2|
                                                                          (SPADCALL
                                                                           |tt|
                                                                           (QREFELT
                                                                            $
                                                                            50))
                                                                          |u2|
                                                                          |v2|)
                                                                  |res|))))))))))))))))))))))))
                       (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |RDEEFX;lin_args!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;get_rational_solutions|
        ((|eq1| |Equation| (|Fraction| (|Polynomial| F))) (|s1| |Symbol|)
         (|s2| |Symbol|) ($ |List| (|Fraction| (|Integer|))))
        (SPROG
         ((|eq1f| (F)) (|k1| (|Kernel| F)) (|eq1p| (|Polynomial| F))
          (|ru2| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|ru1| (|Union| F "failed"))
          (|ru0| (|Union| (|Polynomial| F) "failed"))
          (|rv| (|Fraction| (|Polynomial| F))))
         (SEQ
          (COND
           ((SPADCALL (LETT |rv| (SPADCALL |eq1| (QREFELT $ 149)))
                      (|spadConstant| $ 150) (QREFELT $ 151))
            (COND
             ((SPADCALL |s1|
                        (SPADCALL (SPADCALL |eq1| (QREFELT $ 152))
                                  (QREFELT $ 153))
                        (QREFELT $ 154))
              (|error| "wrong format of solution 1"))
             (#1='T
              (SEQ (LETT |ru0| (SPADCALL |rv| (QREFELT $ 156)))
                   (EXIT
                    (COND ((QEQCAR |ru0| 1) NIL)
                          (#1#
                           (SEQ
                            (LETT |ru1|
                                  (SPADCALL (QCDR |ru0|) (QREFELT $ 159)))
                            (EXIT
                             (COND ((QEQCAR |ru1| 1) NIL)
                                   (#1#
                                    (SEQ
                                     (LETT |ru2|
                                           (SPADCALL (QCDR |ru1|)
                                                     (QREFELT $ 161)))
                                     (EXIT
                                      (COND ((QEQCAR |ru2| 1) NIL)
                                            (#1#
                                             (LIST (QCDR |ru2|)))))))))))))))))
           (#1#
            (SEQ
             (LETT |eq1p|
                   (SPADCALL (SPADCALL |eq1| (QREFELT $ 152)) (QREFELT $ 162)))
             (EXIT
              (COND
               ((SPADCALL |s2| (SPADCALL |eq1p| (QREFELT $ 164))
                          (QREFELT $ 165))
                (|error| "wrong format of solution 2"))
               (#1#
                (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT $ 60)))
                     (LETT |eq1f|
                           (SPADCALL
                            (SPADCALL |eq1p| |s1|
                                      (SPADCALL |k1| (QREFELT $ 63))
                                      (QREFELT $ 166))
                            (QREFELT $ 167)))
                     (EXIT (SPADCALL |eq1f| |k1| (QREFELT $ 169))))))))))))) 

(SDEFUN |RDEEFX;F_to_FP|
        ((|p| F) (|ls| |List| (|Symbol|)) (|lk| |List| (|Kernel| F))
         ($ |Polynomial| F))
        (SPROG
         ((|pu1| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|pu| (|SparseUnivariatePolynomial| F)) (|s1| (|Symbol|))
          (|k1| (|Kernel| F)))
         (SEQ
          (COND ((NULL |lk|) (SPADCALL |p| (QREFELT $ 170)))
                ('T
                 (SEQ (LETT |k1| (|SPADfirst| |lk|))
                      (LETT |s1| (|SPADfirst| |ls|))
                      (LETT |pu|
                            (SPADCALL (SPADCALL |p| |k1| (QREFELT $ 36))
                                      (QREFELT $ 39)))
                      (LETT |pu1|
                            (SPADCALL
                             (CONS #'|RDEEFX;F_to_FP!0| (VECTOR |lk| $ |ls|))
                             |pu| (QREFELT $ 176)))
                      (EXIT (SPADCALL |pu1| |s1| (QREFELT $ 178))))))))) 

(SDEFUN |RDEEFX;F_to_FP!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls| $ |lk|)
          (LETT |ls| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|RDEEFX;F_to_FP| |c| (SPADCALL |ls| (QREFELT $ 171))
             (SPADCALL |lk| (QREFELT $ 172)) $))))) 

(SDEFUN |RDEEFX;solve_poly_eqs|
        ((|eqs| |List| F) (|s1| |Symbol|) (|s2| |Symbol|)
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|val2alg| (|SparseUnivariatePolynomial| F))
          (|val2eq| (|Polynomial| F)) (#1=#:G504 NIL) (|val1r| NIL)
          (|eq1| (|Equation| (|Fraction| (|Polynomial| F))))
          (|eq0p| (|Polynomial| F))
          (|eq0| (|Equation| (|Fraction| (|Polynomial| F)))) (#2=#:G503 NIL)
          (|sol0| NIL)
          (|lsol0|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
          (#3=#:G502 NIL) (|ci| NIL) (#4=#:G501 NIL)
          (|eqs0| (|List| (|Polynomial| F))) (#5=#:G500 NIL) (|eqi| NIL)
          (#6=#:G499 NIL) (|k2| #7=(|Kernel| F)) (|k1| #7#))
         (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT $ 60)))
              (LETT |k2| (SPADCALL |s2| (QREFELT $ 60)))
              (LETT |eqs0|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |eqi| NIL) (LETT #5# |eqs|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |eqi| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (|RDEEFX;F_to_FP|
                                    (SPADCALL (SPADCALL |eqi| (QREFELT $ 180))
                                              (QREFELT $ 181))
                                    (LIST |s1| |s2|) (LIST |k1| |k2|) $)
                                   #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |lsol0|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ci| NIL) (LETT #3# |eqs0|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |ci| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS (SPADCALL |ci| (QREFELT $ 182))
                                         #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (LIST |s2| |s1|) (QREFELT $ 186)))
              (LETT |res| NIL)
              (SEQ (LETT |sol0| NIL) (LETT #2# |lsol0|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |sol0| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |sol0|) 2 (QREFELT $ 91))
                       (|error| "wrong format of solution 0"))
                      ('T
                       (SEQ (LETT |eq0| (|SPADfirst| |sol0|))
                            (LETT |eq0p|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |eq0| (QREFELT $ 152))
                                             (SPADCALL |eq0| (QREFELT $ 149))
                                             (QREFELT $ 187))
                                   (QREFELT $ 162)))
                            (LETT |eq1| (SPADCALL |sol0| (QREFELT $ 189)))
                            (EXIT
                             (SEQ (LETT |val1r| NIL)
                                  (LETT #1#
                                        (|RDEEFX;get_rational_solutions| |eq1|
                                         |s1| |s2| $))
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |val1r| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |val2eq|
                                         (SPADCALL |eq0p| |s1|
                                                   (SPADCALL |val1r|
                                                             (QREFELT $ 190))
                                                   (QREFELT $ 166)))
                                   (LETT |val2alg|
                                         (SPADCALL |val2eq| (QREFELT $ 191)))
                                   (EXIT
                                    (LETT |res|
                                          (CONS (CONS |val1r| |val2alg|)
                                                |res|))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args0|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst0| |List| F) (|ulst0| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|vp| (F)) (|dega| (|Integer|))
          (|fac| (|SparseUnivariatePolynomial| F))
          (|ap| (|SparseUnivariatePolynomial| F)) (#1=#:G534 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (|res1l|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|nn| #2=(|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")) (#3=#:G533 NIL) (|r0| NIL)
          (|degn1| (|NonNegativeInteger|)) (|degn| #4=(|NonNegativeInteger|))
          (|degd| #4#) (|ratl| (|List| (|Fraction| (|Integer|)))) (|eq1| (F))
          (|nnp| #2#) (#5=#:G532 NIL) (|sol| NIL) (|r_bad| (|Integer|))
          (|has_r_bad| (|Boolean|)) (|ccu| (|Union| (|Integer|) "failed"))
          (|cc| (F))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|eqs0| (|List| F)) (#6=#:G531 NIL) (|ci| NIL) (#7=#:G530 NIL)
          (|qq| (|SparseUnivariatePolynomial| F)) (|b| #8=(|Kernel| F))
          (|bs| #9=(|Symbol|)) (|a| #8#) (|as| #9#) (|u0| (F))
          (|ulst| (|List| F)) (|vlst| (|List| F)) (#10=#:G528 NIL) (|v| NIL)
          (#11=#:G529 NIL) (|u| NIL) (|kf| (F)))
         (SEQ (LETT |vlst| NIL) (LETT |ulst| NIL)
              (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
              (SEQ (LETT |u| NIL) (LETT #11# |ulst0|) (LETT |v| NIL)
                   (LETT #10# |vlst0|) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |v| (CAR #10#)) NIL)
                         (ATOM #11#) (PROGN (LETT |u| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |kf| (QREFELT $ 133))
                       (SEQ (LETT |vlst| (CONS |v| |vlst|))
                            (EXIT (LETT |ulst| (CONS |u| |ulst|)))))
                      ('T (LETT |u0| |u|)))))
                   (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |as| (SPADCALL (QREFELT $ 59)))
              (LETT |a| (SPADCALL |as| (QREFELT $ 60)))
              (LETT |bs| (SPADCALL (QREFELT $ 59)))
              (LETT |b| (SPADCALL |bs| (QREFELT $ 60)))
              (LETT |nn|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT $ 63)) 1
                                          (QREFELT $ 46))
                                (SPADCALL (SPADCALL |b| (QREFELT $ 63))
                                          (QREFELT $ 47))
                                (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51)))
              (LETT |qq| (SPADCALL |gd| |nn| (QREFELT $ 192)))
              (LETT |eqs0|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |ci| NIL)
                          (LETT #6# (SPADCALL |qq| (QREFELT $ 96))) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |ci| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |ci| (QREFELT $ 180))
                                             (QREFELT $ 181))
                                   #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |lsol| (|RDEEFX;solve_poly_eqs| |eqs0| |as| |bs| $))
              (LETT |has_r_bad| NIL) (LETT |r_bad| 0)
              (COND
               ((>= (+ (SPADCALL |denf| (QREFELT $ 41)) 1)
                    (SPADCALL |nf| (QREFELT $ 41)))
                (COND
                 ((SPADCALL (+ (SPADCALL |denf| (QREFELT $ 41)) 1)
                            (SPADCALL |nf| (QREFELT $ 41)) (QREFELT $ 22))
                  (SEQ (LETT |has_r_bad| 'T) (EXIT (LETT |r_bad| 0))))
                 ('T
                  (SEQ
                   (LETT |cc|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                                    (SPADCALL |denf| (QREFELT $ 105))
                                    (QREFELT $ 69))
                          (QREFELT $ 50)))
                   (LETT |ccu| (SPADCALL |cc| (QREFELT $ 135)))
                   (EXIT
                    (COND
                     ((QEQCAR |ccu| 0)
                      (SEQ (LETT |has_r_bad| 'T)
                           (EXIT (LETT |r_bad| (QCDR |ccu|))))))))))))
              (LETT |res| NIL)
              (SEQ (LETT |sol| NIL) (LETT #5# |lsol|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |sol| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ru| (SPADCALL (QCAR |sol|) (QREFELT $ 193)))
                        (EXIT
                         (COND ((QEQCAR |ru| 1) "iterate")
                               ('T
                                (SEQ
                                 (COND
                                  (|has_r_bad|
                                   (COND
                                    ((EQL (QCDR |ru|) |r_bad|)
                                     (EXIT "iterate")))))
                                 (LETT |res1|
                                       (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                        (QCDR |sol|) (QCDR |ru|) |u| |vlst|
                                        |ulst| |k| |x| 'T $))
                                 (EXIT
                                  (COND ((QEQCAR |res1| 1) "iterate")
                                        ('T
                                         (LETT |res|
                                               (CONS (QCDR |res1|)
                                                     |res|))))))))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (LETT |nnp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |nf| (QREFELT $ 194)) |denf|
                                (QREFELT $ 99))
                      (SPADCALL (SPADCALL |denf| (QREFELT $ 194)) |nf|
                                (QREFELT $ 99))
                      (QREFELT $ 48))
                     (SPADCALL (SPADCALL |a| (QREFELT $ 63)) (QREFELT $ 47))
                     (QREFELT $ 51)))
              (LETT |eq1| (SPADCALL |nnp| |gd| (QREFELT $ 195)))
              (LETT |ratl| (SPADCALL |eq1| |a| (QREFELT $ 169)))
              (COND
               (|has_r_bad|
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |r_bad| (QREFELT $ 142)) |ratl|
                             (QREFELT $ 196)))
                  (LETT |ratl|
                        (CONS (SPADCALL |r_bad| (QREFELT $ 142)) |ratl|))))))
              (LETT |degd| (SPADCALL |denf| (QREFELT $ 41)))
              (LETT |degn| (SPADCALL |nf| (QREFELT $ 41)))
              (LETT |degn1| (MAX |degn| (+ |degd| 1)))
              (SEQ (LETT |r0| NIL) (LETT #3# |ratl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |r0| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ru| (SPADCALL |r0| (QREFELT $ 193)))
                        (EXIT
                         (COND ((QEQCAR |ru| 1) "iterate")
                               ('T
                                (SEQ (LETT |ri| (QCDR |ru|))
                                     (LETT |nn|
                                           (SPADCALL |nf|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          76))
                                                       1 (QREFELT $ 46))
                                                      |denf| (QREFELT $ 99))
                                                     (QREFELT $ 51)))
                                     (LETT |res1l|
                                           (|RDEEFX;ei_args3| |gd| |nn| |denf|
                                            |k| |vlst| |ulst| |x| $))
                                     (EXIT
                                      (SEQ (LETT |res1| NIL) (LETT #1# |res1l|)
                                           G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |res1| (CAR #1#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ (LETT |ap| (QVELT |res1| 3))
                                                (LETT |fac| (QVELT |res1| 0))
                                                (LETT |dega|
                                                      (COND
                                                       ((SPADCALL |ap|
                                                                  (|spadConstant|
                                                                   $ 104)
                                                                  (QREFELT $
                                                                           113))
                                                        1)
                                                       ('T
                                                        (SPADCALL |ap|
                                                                  (QREFELT $
                                                                           41)))))
                                                (LETT |vp| (QVELT |res1| 2))
                                                (EXIT
                                                 (COND
                                                  ((EQL
                                                    (SPADCALL |fac|
                                                              (QREFELT $ 41))
                                                    (SPADCALL |degn1| |dega|
                                                              (QREFELT $ 197)))
                                                   "iterate")
                                                  ('T
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |fac| |ri|
                                                                  (QVELT |res1|
                                                                         2)
                                                                  |ap|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u0| |ri|
                                                                    (QREFELT $
                                                                             81))
                                                                   (QVELT
                                                                    |res1| 4)
                                                                   (QREFELT $
                                                                            67))
                                                                  0
                                                                  (QVELT |res1|
                                                                         6))
                                                          |res|))))))
                                           (LETT #1# (CDR #1#)) (GO G190) G191
                                           (EXIT NIL))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args1|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|t| |Kernel| F)
         ($ |Factored| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|r| (F)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 63)) |denf|
                                           (QREFELT $ 138))
                                 (QREFELT $ 51))
                       |gd| (QREFELT $ 195)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |r| |t| (QREFELT $ 36)) (QREFELT $ 39))
                  (QREFELT $ 128)))))) 

(SDEFUN |RDEEFX;ei_args2|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|f_res| |Factored| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|resu|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (|deg1| #1=(|NonNegativeInteger|))
          (|f1| #2=(|SparseUnivariatePolynomial| F)) (#3=#:G543 NIL)
          (|fac| NIL) (|degg| #1#)
          (|rfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #2#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|n1| (|Integer|)) (|log_case| (|Boolean|)))
         (SEQ (LETT |log_case| (SPADCALL |k| '|log| (QREFELT $ 23)))
              (LETT |n1| 0) (LETT |rfac| (SPADCALL |f_res| (QREFELT $ 132)))
              (LETT |res| NIL) (LETT |degg| (SPADCALL |gd| (QREFELT $ 41)))
              (SEQ (LETT |fac| NIL) (LETT #3# |rfac|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |fac| 1))
                        (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)))
                        (EXIT
                         (COND ((EQL |deg1| 0) "iterate")
                               ('T
                                (SEQ
                                 (LETT |resu|
                                       (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                        |f1| 0 (|spadConstant| $ 33) |vlst|
                                        |ulst| |k| |x| NIL $))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |resu| 0)
                                    (LETT |res|
                                          (CONS (QCDR |resu|) |res|))))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args3|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|f_res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|t| (|Kernel| F)))
         (SEQ (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 59)) (QREFELT $ 60)))
              (LETT |f_res| (|RDEEFX;ei_args1| |gd| |nf| |denf| |t| $))
              (EXIT
               (|RDEEFX;ei_args2| |gd| |nf| |denf| |f_res| |k| |vlst| |ulst|
                |x| $))))) 

(SDEFUN |RDEEFX;ei_args|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F)))))
         (SEQ
          (COND ((EQL (SPADCALL |gd| (QREFELT $ 41)) 0) NIL)
                (#1='T
                 (SEQ
                  (LETT |res1|
                        (COND
                         ((SPADCALL |k| '|log| (QREFELT $ 23))
                          (|RDEEFX;ei_args0| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $))
                         (#1#
                          (|RDEEFX;ei_args3| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $))))
                  (EXIT |res1|))))))) 

(SDEFUN |RDEEFX;my_exp|
        ((|p| |SparseUnivariatePolynomial| F) (|n| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL |p| |n| (QREFELT $ 198))) 

(SDEFUN |RDEEFX;ei_candidate|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|) (|a| |Integer|)
         (|tt| F)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|nf1| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |tt| (SPADCALL |tt| (QREFELT $ 50)))
              (LETT |nf1|
                    (SPADCALL |nf| (SPADCALL |tt| |denf| (QREFELT $ 138))
                              (QREFELT $ 51)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |nf1| (QREFELT $ 112))
                           (|spadConstant| $ 104) (QREFELT $ 111))
                 |res|)
                (#1='T
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |nf1| (QREFELT $ 41)) 0 (QREFELT $ 42))
                    (COND
                     ((NULL (SPADCALL |k| '|exp| (QREFELT $ 23)))
                      (EXIT |res|)))))
                  (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $))
                  (EXIT
                   (COND ((QEQCAR |uvu| 1) |res|)
                         (#1#
                          (SEQ (LETT |uv| (QCDR |uvu|))
                               (EXIT
                                (CONS
                                 (VECTOR 1 |nf1| (|spadConstant| $ 33) |a| |tt|
                                         (|spadConstant| $ 104)
                                         (SPADCALL |nf1| |denf|
                                                   (QREFELT $ 199))
                                         (|spadConstant| $ 200) (QVELT |uv| 0)
                                         (QVELT |uv| 2) (QVELT |uv| 1)
                                         (|spadConstant| $ 45))
                                 |res|))))))))))))) 

(SDEFUN |RDEEFX;special_ei_candidates|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|tt| (F)) (|a| (|Integer|)) (#1=#:G582 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F))
          (|res|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|rdf| #2=(|SparseUnivariatePolynomial| F)) (|rnf| #2#)
          (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |tt| (|spadConstant| $ 45)) (LETT |a| 0)
                (EXIT
                 (COND
                  ((SPADCALL |k| '|exp| (QREFELT $ 23))
                   (SEQ (LETT |res| NIL)
                        (LETT |n1| (SPADCALL |nf| (QREFELT $ 41)))
                        (LETT |n2| (SPADCALL |denf| (QREFELT $ 41)))
                        (LETT |rnf| (SPADCALL |nf| (QREFELT $ 112)))
                        (LETT |rdf| (SPADCALL |denf| (QREFELT $ 112)))
                        (EXIT
                         (COND
                          ((EQL |n1| |n2|)
                           (SEQ (LETT |tt| (SPADCALL |nf| (QREFELT $ 105)))
                                (LETT |res|
                                      (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                       |ulst| |k| |x| |a| |tt| |res| $))
                                (COND
                                 ((SPADCALL |rdf| (|spadConstant| $ 104)
                                            (QREFELT $ 111))
                                  (COND
                                   ((EQL (SPADCALL |rdf| (QREFELT $ 41))
                                         (SPADCALL |rnf| (QREFELT $ 41)))
                                    (EXIT
                                     (SEQ
                                      (LETT |tt|
                                            (SPADCALL
                                             (SPADCALL |rnf| (QREFELT $ 105))
                                             (SPADCALL |rdf| (QREFELT $ 105))
                                             (QREFELT $ 69)))
                                      (EXIT
                                       (|RDEEFX;ei_candidate| |nf| |denf|
                                        |vlst| |ulst| |k| |x| |a| |tt| |res|
                                        $))))))))
                                (EXIT |res|)))
                          (#4='T
                           (SEQ
                            (LETT |res|
                                  (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                   |ulst| |k| |x| |a| (|spadConstant| $ 45)
                                   |res| $))
                            (COND
                             ((< |n1| |n2|)
                              (COND
                               ((SPADCALL |rdf| (|spadConstant| $ 104)
                                          (QREFELT $ 111))
                                (COND
                                 ((EQL (SPADCALL |rdf| (QREFELT $ 41)) |n1|)
                                  (EXIT
                                   (SEQ
                                    (LETT |tt|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT $ 105))
                                           (SPADCALL |rdf| (QREFELT $ 105))
                                           (QREFELT $ 69)))
                                    (EXIT
                                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                      |ulst| |k| |x| |a| |tt| |res| $))))))))))
                            (COND
                             ((SPADCALL |n1| |n2| (QREFELT $ 22))
                              (COND
                               ((SPADCALL |rnf| (|spadConstant| $ 104)
                                          (QREFELT $ 111))
                                (COND
                                 ((EQL (SPADCALL |rnf| (QREFELT $ 41)) |n2|)
                                  (EXIT
                                   (SEQ
                                    (LETT |tt|
                                          (SPADCALL |rnf| (QREFELT $ 105)))
                                    (EXIT
                                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                      |ulst| |k| |x| |a| |tt| |res| $))))))))))
                            (EXIT |res|)))))))
                  ((SPADCALL (SPADCALL |nf| (QREFELT $ 41))
                             (+ (SPADCALL |denf| (QREFELT $ 41)) 1)
                             (QREFELT $ 42))
                   NIL)
                  (#4#
                   (SEQ
                    (COND
                     ((SPADCALL |k| '|log| (QREFELT $ 23))
                      (COND
                       ((EQL (SPADCALL |nf| (QREFELT $ 41))
                             (+ (SPADCALL |denf| (QREFELT $ 41)) 1))
                        (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 105)))
                             (LETT |rcu| (SPADCALL |lc| (QREFELT $ 135)))
                             (EXIT
                              (COND
                               ((QEQCAR |rcu| 1)
                                (PROGN (LETT #1# NIL) (GO #5=#:G581)))
                               (#4#
                                (SEQ (LETT |a| (- (QCDR |rcu|)))
                                     (EXIT
                                      (LETT |nf|
                                            (SPADCALL |nf|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           76))
                                                        1 (QREFELT $ 46))
                                                       |denf| (QREFELT $ 99))
                                                      (QREFELT $
                                                               51)))))))))))))
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT $ 41))
                           (SPADCALL |denf| (QREFELT $ 41)))
                      (LETT |tt| (SPADCALL |nf| (QREFELT $ 105)))))
                    (EXIT
                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst| |k| |x|
                      |a| |tt| NIL $))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |RDEEFX;gamma_candidate|
        ((|fnf| |Factored| (|SparseUnivariatePolynomial| F))
         (|nf1| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|gden1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|a| |Integer|) (|tt| F) (|f2| |SparseUnivariatePolynomial| F)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|unf| (F)) (|nf2| (|SparseUnivariatePolynomial| F))
          (|m1| (|Integer|)) (#1=#:G604 NIL)
          (|mu| (|Union| (|Integer|) "failed"))
          (|ur|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#2=#:G592 NIL)
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (#3=#:G590 NIL) (#4=#:G610 NIL) (|e1| NIL) (#5=#:G611 NIL)
          (|fac1| NIL) (#6=#:G609 NIL)
          (|lexp1| (|List| (|NonNegativeInteger|))) (#7=#:G585 NIL)
          (#8=#:G608 NIL) (#9=#:G607 NIL) (|l1| (|Integer|))
          (|lexp| (|List| (|Integer|))) (#10=#:G606 NIL) (#11=#:G605 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 132)))
                (LETT |lexp|
                      (PROGN
                       (LETT #11# NIL)
                       (SEQ (LETT |fac1| NIL) (LETT #10# |nffacs|) G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT |fac1| (CAR #10#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT (LETT #11# (CONS (QVELT |fac1| 2) #11#))))
                            (LETT #10# (CDR #10#)) (GO G190) G191
                            (EXIT (NREVERSE #11#)))))
                (LETT |l1| (GCD |gexp| (SPADCALL |lexp| (QREFELT $ 117))))
                (EXIT
                 (COND ((EQL |l1| 1) |res|)
                       (#12='T
                        (SEQ
                         (LETT |lexp1|
                               (PROGN
                                (LETT #9# NIL)
                                (SEQ (LETT |e1| NIL) (LETT #8# |lexp|) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN (LETT |e1| (CAR #8#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #9#
                                             (CONS
                                              (PROG1
                                                  (LETT #7#
                                                        (QUOTIENT2 |e1| |l1|))
                                                (|check_subtype2| (>= #7# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #7#))
                                              #9#))))
                                     (LETT #8# (CDR #8#)) (GO G190) G191
                                     (EXIT (NREVERSE #9#)))))
                         (LETT |nf2|
                               (SPADCALL (ELT $ 99)
                                         (PROGN
                                          (LETT #6# NIL)
                                          (SEQ (LETT |fac1| NIL)
                                               (LETT #5# |nffacs|)
                                               (LETT |e1| NIL)
                                               (LETT #4# |lexp1|) G190
                                               (COND
                                                ((OR (ATOM #4#)
                                                     (PROGN
                                                      (LETT |e1| (CAR #4#))
                                                      NIL)
                                                     (ATOM #5#)
                                                     (PROGN
                                                      (LETT |fac1| (CAR #5#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #6#
                                                       (CONS
                                                        (|RDEEFX;my_exp|
                                                         (QVELT |fac1| 1) |e1|
                                                         $)
                                                        #6#))))
                                               (LETT #4#
                                                     (PROG1 (CDR #4#)
                                                       (LETT #5# (CDR #5#))))
                                               (GO G190) G191
                                               (EXIT (NREVERSE #6#))))
                                         (|spadConstant| $ 110)
                                         (QREFELT $ 203)))
                         (LETT |gden1|
                               (COND ((EQL |gexp| 1) (|spadConstant| $ 110))
                                     (#12#
                                      (|RDEEFX;my_exp| |gden1|
                                       (PROG1
                                           (LETT #3# (QUOTIENT2 |gexp| |l1|))
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       $))))
                         (LETT |uvu|
                               (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $))
                         (EXIT
                          (COND ((QEQCAR |uvu| 1) |res|)
                                (#12#
                                 (SEQ (LETT |uv| (QCDR |uvu|))
                                      (LETT |unf|
                                            (SPADCALL
                                             (SPADCALL |fnf| (QREFELT $ 204))
                                             (QREFELT $ 205)))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |unf| |x| (QREFELT $ 64))
                                         (|spadConstant| $ 45) (QREFELT $ 133))
                                        (SEQ
                                         (LETT |ur|
                                               (SPADCALL |unf|
                                                         (PROG1 (LETT #2# |l1|)
                                                           (|check_subtype2|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                                         (QREFELT $ 208)))
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL (QVELT |ur| 2) |x|
                                                      (QREFELT $ 64))
                                            (|spadConstant| $ 45)
                                            (QREFELT $ 133))
                                           (PROGN
                                            (LETT #1# |res|)
                                            (GO #13=#:G603))))
                                         (LETT |mu|
                                               (SPADCALL |l1| (QVELT |ur| 0)
                                                         (QREFELT $ 119)))
                                         (COND
                                          ((QEQCAR |mu| 1)
                                           (PROGN (LETT #1# |res|) (GO #13#))))
                                         (LETT |m1| (QCDR |mu|))
                                         (LETT |nf2|
                                               (SPADCALL |nf2| (QVELT |ur| 1)
                                                         (QREFELT $ 209)))
                                         (EXIT
                                          (LETT |unf|
                                                (SPADCALL (QVELT |ur| 2) |m1|
                                                          (QREFELT $ 81)))))))
                                      (EXIT
                                       (CONS
                                        (VECTOR |l1| |nf2| |unf| |a| |tt| |f2|
                                                (SPADCALL |nf1| |denf|
                                                          (QREFELT $ 199))
                                                (SPADCALL |nf2| |gden1|
                                                          (QREFELT $ 199))
                                                (QVELT |uv| 0) (QVELT |uv| 2)
                                                (QVELT |uv| 1)
                                                (|spadConstant| $ 45))
                                        |res|))))))))))))
          #13# (EXIT #1#)))) 

(SDEFUN |RDEEFX;solve_for_ratios| ((|lc| |List| F) ($ |List| (|Integer|)))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|li| (|Integer|))
          (|j| #1=(|NonNegativeInteger|)) (|jj| #1#) (|i| NIL)
          (|d| (|Integer|)) (#2=#:G638 NIL) (#3=#:G637 NIL)
          (|s1| (|Vector| (|Fraction| (|Integer|))))
          (|bl| #4=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (|res|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
            (|:| |basis| #4#)))
          (|v0| (|Vector| F)) (#5=#:G635 NIL) (#6=#:G636 NIL) (|c| NIL)
          (|m| (|Matrix| F)) (|nn1| (|NonNegativeInteger|)) (#7=#:G618 NIL)
          (|nlc| (|List| F)) (|c1| (F)) (#8=#:G634 NIL) (#9=#:G633 NIL)
          (|n1| #10=(|NonNegativeInteger|)) (#11=#:G631 NIL) (#12=#:G632 NIL)
          (|v| (|Vector| (|Integer|))) (|n| #10#))
         (SEQ (LETT |n| (LENGTH |lc|)) (LETT |nlc| NIL)
              (LETT |v| (MAKEARR1 |n| 1))
              (SEQ (LETT |c| NIL) (LETT #12# |lc|) (LETT |i| 1) (LETT #11# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #11#) (ATOM #12#)
                         (PROGN (LETT |c| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QEQCAR (SPADCALL |c| (QREFELT $ 161)) 0)
                       (SPADCALL |v| |i| 0 (QREFELT $ 120)))
                      ('T (LETT |nlc| (CONS |c| |nlc|))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |n1| (LENGTH |nlc|))
              (EXIT
               (COND ((EQL |n1| 0) NIL)
                     ((EQL |n1| 1)
                      (PROGN
                       (LETT #9# NIL)
                       (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                            (COND ((|greater_SI| |i| #8#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS (SPADCALL |v| 1 (QREFELT $ 118))
                                          #9#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #9#)))))
                     (#13='T
                      (SEQ (LETT |c1| (|SPADfirst| |nlc|))
                           (LETT |nlc| (CDR |nlc|))
                           (LETT |nn1|
                                 (PROG1 (LETT #7# (- |n1| 1))
                                   (|check_subtype2| (>= #7# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #7#)))
                           (LETT |m|
                                 (SPADCALL |nn1|
                                           (+
                                            (SPADCALL 2 |nn1| (QREFELT $ 211))
                                            1)
                                           (QREFELT $ 213)))
                           (SEQ (LETT |c| NIL) (LETT #6# |nlc|) (LETT |i| 1)
                                (LETT #5# |nn1|) G190
                                (COND
                                 ((OR (|greater_SI| |i| #5#) (ATOM #6#)
                                      (PROGN (LETT |c| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (SPADCALL |m| |i| 1
                                           (SPADCALL |c| (QREFELT $ 50))
                                           (QREFELT $ 214))
                                 (SPADCALL |m| |i| (+ |i| 1) |c1|
                                           (QREFELT $ 214))
                                 (EXIT
                                  (SPADCALL |m| |i| (+ |i| |n1|)
                                            (|spadConstant| $ 33)
                                            (QREFELT $ 214))))
                                (LETT |i|
                                      (PROG1 (|inc_SI| |i|)
                                        (LETT #6# (CDR #6#))))
                                (GO G190) G191 (EXIT NIL))
                           (LETT |v0| (SPADCALL |nn1| (QREFELT $ 215)))
                           (LETT |res| (SPADCALL |m| |v0| (QREFELT $ 216)))
                           (LETT |bl| (QCDR |res|))
                           (EXIT
                            (COND ((NULL |bl|) NIL)
                                  (#13#
                                   (SEQ (LETT |s1| (|SPADfirst| |bl|))
                                        (LETT |d|
                                              (SPADCALL
                                               (PROGN
                                                (LETT #3# NIL)
                                                (SEQ (LETT |i| 1)
                                                     (LETT #2# (+ |nn1| 1))
                                                     G190
                                                     (COND
                                                      ((|greater_SI| |i| #2#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #3#
                                                             (CONS
                                                              (SPADCALL
                                                               (SPADCALL |s1|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          217))
                                                               (QREFELT $ 218))
                                                              #3#))))
                                                     (LETT |i| (|inc_SI| |i|))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #3#))))
                                               (QREFELT $ 117)))
                                        (LETT |j| 1) (LETT |rl| NIL)
                                        (SEQ (LETT |i| |n|) G190
                                             (COND ((< |i| 1) (GO G191)))
                                             (SEQ
                                              (LETT |li|
                                                    (COND
                                                     ((EQL
                                                       (SPADCALL |v| |i|
                                                                 (QREFELT $
                                                                          118))
                                                       0)
                                                      0)
                                                     ('T
                                                      (SEQ (LETT |jj| |j|)
                                                           (LETT |j| (+ |j| 1))
                                                           (EXIT
                                                            (SPADCALL
                                                             (SPADCALL |d|
                                                                       (SPADCALL
                                                                        |s1|
                                                                        |jj|
                                                                        (QREFELT
                                                                         $
                                                                         217))
                                                                       (QREFELT
                                                                        $ 219))
                                                             (QREFELT $
                                                                      220)))))))
                                              (EXIT
                                               (LETT |rl| (CONS |li| |rl|))))
                                             (LETT |i| (+ |i| -1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT |rl|)))))))))))) 

(SDEFUN |RDEEFX;possible_sk|
        ((|w0| F) (|f| F) (|tk| |Kernel| F) (|x| |Symbol|)
         ($ |List| (|List| (|Fraction| (|Integer|)))))
        (SPROG
         ((|nwu| #1=(|SparseUnivariatePolynomial| F))
          (|dnw| #2=(|NonNegativeInteger|)) (|ss| (|Integer|)) (#3=#:G668 NIL)
          (|s| (|Fraction| (|Integer|))) (|g| (|SparseUnivariatePolynomial| F))
          (|dnf| #2#) (|solq| (|Vector| (|Fraction| (|Integer|))))
          (#4=#:G648 NIL)
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) #5="failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|nfu1| (|SparseUnivariatePolynomial| F))
          (|nwu1| (|SparseUnivariatePolynomial| F))
          (|res| (|List| (|List| (|Fraction| (|Integer|)))))
          (|mq| (|Matrix| (|Fraction| (|Integer|))))
          (|vq| (|Vector| (|Fraction| (|Integer|)))) (#6=#:G640 NIL)
          (|mind| (|NonNegativeInteger|)) (|ddw| #2#)
          (|dwu| #7=(|SparseUnivariatePolynomial| F)) (|ddf| #2#) (|dfu| #7#)
          (|mindf| (|Integer|)) (|mindw| (|Integer|)) (|nfu| #1#)
          (|fu| #8=(|Fraction| (|SparseUnivariatePolynomial| F))) (|wu| #8#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |tk| (QREFELT $ 25)) (QREFELT $ 8)
                       (QREFELT $ 26))
             NIL)
            (#9='T
             (SEQ (LETT |wu| (SPADCALL |w0| |tk| (QREFELT $ 36)))
                  (LETT |nwu| (SPADCALL |wu| (QREFELT $ 39)))
                  (LETT |dwu| (SPADCALL |wu| (QREFELT $ 40)))
                  (LETT |dnw| (SPADCALL |nwu| (QREFELT $ 41)))
                  (LETT |ddw| (SPADCALL |dwu| (QREFELT $ 41)))
                  (COND
                   ((EQL |dnw| 0)
                    (COND ((EQL |ddw| 0) (EXIT (|error| "impossible"))))))
                  (LETT |fu| (SPADCALL |f| |tk| (QREFELT $ 36)))
                  (LETT |nfu| (SPADCALL |fu| (QREFELT $ 39)))
                  (LETT |dfu| (SPADCALL |fu| (QREFELT $ 40)))
                  (LETT |dnf| (SPADCALL |nfu| (QREFELT $ 41)))
                  (LETT |ddf| (SPADCALL |dfu| (QREFELT $ 41))) (LETT |mindf| 0)
                  (LETT |mindw| 0)
                  (COND
                   ((SPADCALL |tk| '|exp| (QREFELT $ 23))
                    (SEQ (LETT |mindw| (SPADCALL |nwu| (QREFELT $ 221)))
                         (LETT |mindw|
                               (COND
                                ((SPADCALL |mindw| 0 (QREFELT $ 42)) |mindw|)
                                (#9# (- (SPADCALL |dwu| (QREFELT $ 221))))))
                         (LETT |mind| (SPADCALL |dfu| (QREFELT $ 221)))
                         (LETT |mindf|
                               (COND
                                ((SPADCALL |mind| 0 (QREFELT $ 22)) (- |mind|))
                                (#9# (SPADCALL |nfu| (QREFELT $ 221)))))
                         (EXIT
                          (COND
                           ((SPADCALL |ddf| |mind| (QREFELT $ 22))
                            (SEQ
                             (LETT |dfu|
                                   (PROG2
                                       (LETT #6#
                                             (SPADCALL |dfu|
                                                       (SPADCALL
                                                        (|spadConstant| $ 33)
                                                        |mind| (QREFELT $ 46))
                                                       (QREFELT $ 109)))
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 7))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7))
                                                      #10="failed")
                                                     #6#)))
                             (LETT |ddf| (- |ddf| |mind|))
                             (SEQ
                              (LETT |mind| (SPADCALL |dwu| (QREFELT $ 221)))
                              (EXIT
                               (COND
                                ((SPADCALL |mind| 0 (QREFELT $ 22))
                                 (SEQ
                                  (LETT |dwu|
                                        (PROG2
                                            (LETT #6#
                                                  (SPADCALL |dwu|
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             33)
                                                             |mind|
                                                             (QREFELT $ 46))
                                                            (QREFELT $ 109)))
                                            (QCDR #6#)
                                          (|check_union2| (QEQCAR #6# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 7))
                                                           #10#)
                                                          #6#)))
                                  (EXIT
                                   (LETT |ddw|
                                         (SPADCALL |dwu| (QREFELT $ 41)))))))))
                             (LETT |mind| (SPADCALL |nwu| (QREFELT $ 221)))
                             (EXIT
                              (COND
                               ((SPADCALL |mind| 0 (QREFELT $ 22))
                                (SEQ
                                 (LETT |nwu|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL |nwu|
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            33)
                                                            |mind|
                                                            (QREFELT $ 46))
                                                           (QREFELT $ 109)))
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))
                                                          #10#)
                                                         #6#)))
                                 (EXIT
                                  (LETT |dnw|
                                        (SPADCALL |nwu| (QREFELT $ 41))))))))))
                           (#9#
                            (SEQ
                             (LETT |vq|
                                   (SPADCALL
                                    (LIST (SPADCALL |mindf| (QREFELT $ 142))
                                          (SPADCALL (- |dnf| |ddf|)
                                                    (QREFELT $ 142)))
                                    (QREFELT $ 145)))
                             (LETT |mq|
                                   (SPADCALL
                                    (LIST
                                     (LIST (SPADCALL |mindw| (QREFELT $ 142))
                                           (SPADCALL (- |dnw| |ddw|)
                                                     (QREFELT $ 142)))
                                     (LIST (|spadConstant| $ 222)
                                           (|spadConstant| $ 222)))
                                    (QREFELT $ 225)))
                             (LETT |sol| (SPADCALL |mq| |vq| (QREFELT $ 227)))
                             (LETT |res|
                                   (COND ((QEQCAR (QCAR |sol|) 1) NIL)
                                         (#9#
                                          (SEQ
                                           (LETT |solq|
                                                 (PROG2 (LETT #4# (QCAR |sol|))
                                                     (QCDR #4#)
                                                   (|check_union2|
                                                    (QEQCAR #4# 0)
                                                    (|Vector|
                                                     (|Fraction| (|Integer|)))
                                                    (|Union|
                                                     (|Vector|
                                                      (|Fraction| (|Integer|)))
                                                     #5#)
                                                    #4#)))
                                           (EXIT
                                            (LIST
                                             (SPADCALL |solq|
                                                       (QREFELT $ 228))))))))
                             (COND
                              ((< |mindf| 0)
                               (COND
                                ((SPADCALL (- |dnf| |ddf|) 0 (QREFELT $ 42))
                                 (EXIT
                                  (PROGN (LETT #3# |res|) (GO #11=#:G667)))))))
                             (COND
                              ((EQL |mindf| 0)
                               (SEQ
                                (LETT |nwu1|
                                      (SPADCALL |nwu|
                                                (SPADCALL
                                                 (SPADCALL |nwu| 0
                                                           (QREFELT $ 43))
                                                 0 (QREFELT $ 46))
                                                (QREFELT $ 48)))
                                (EXIT
                                 (SPADCALL |vq| 1
                                           (SPADCALL
                                            (SPADCALL |nwu1| (QREFELT $ 221))
                                            (QREFELT $ 142))
                                           (QREFELT $ 229)))))
                              ((SPADCALL |mindf| 0 (QREFELT $ 42))
                               (SPADCALL |vq| 1 (|spadConstant| $ 230)
                                         (QREFELT $ 229)))
                              (#9#
                               (COND
                                ((< (- |dnf| |ddf|) 0)
                                 (SPADCALL |vq| 2 (|spadConstant| $ 230)
                                           (QREFELT $ 229)))
                                (#9#
                                 (SEQ
                                  (LETT |nfu1|
                                        (SPADCALL |nfu| (QREFELT $ 112)))
                                  (EXIT
                                   (SPADCALL |vq| 2
                                             (SPADCALL
                                              (-
                                               (SPADCALL |nfu1| (QREFELT $ 41))
                                               |ddf|)
                                              (QREFELT $ 142))
                                             (QREFELT $ 229))))))))
                             (LETT |sol| (SPADCALL |mq| |vq| (QREFELT $ 227)))
                             (EXIT
                              (COND
                               ((QEQCAR (QCAR |sol|) 1)
                                (PROGN (LETT #3# |res|) (GO #11#)))
                               (#9#
                                (SEQ
                                 (LETT |solq|
                                       (PROG2 (LETT #4# (QCAR |sol|))
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|Vector|
                                                          (|Fraction|
                                                           (|Integer|)))
                                                         (|Union|
                                                          (|Vector|
                                                           (|Fraction|
                                                            (|Integer|)))
                                                          #5#)
                                                         #4#)))
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (CONS
                                          (SPADCALL |solq| (QREFELT $ 228))
                                          |res|))
                                   (GO #11#))))))))))))))
                  (COND
                   ((EQL |dnf| 0)
                    (COND
                     ((EQL |ddf| 0)
                      (COND
                       ((SPADCALL |tk| '|log| (QREFELT $ 23)) (LETT |dnf| 1))
                       (#9# (PROGN (LETT #3# NIL) (GO #11#))))))))
                  (EXIT
                   (COND
                    ((SPADCALL |ddf| 0 (QREFELT $ 22))
                     (SEQ (LETT |g| (SPADCALL |dfu| |dwu| (QREFELT $ 107)))
                          (LETT |s|
                                (COND
                                 ((SPADCALL (SPADCALL |g| (QREFELT $ 41)) 0
                                            (QREFELT $ 22))
                                  (SPADCALL |ddf| |ddw| (QREFELT $ 231)))
                                 (#9# (SPADCALL |ddf| |dnw| (QREFELT $ 231)))))
                          (EXIT
                           (LIST
                            (LIST |s|
                                  (SPADCALL (SPADCALL |mindf| (QREFELT $ 142))
                                            (SPADCALL |s| |mindw|
                                                      (QREFELT $ 232))
                                            (QREFELT $ 233)))))))
                    (#9#
                     (SEQ (LETT |ss| 1)
                          (COND
                           ((SPADCALL |ddw| 0 (QREFELT $ 22))
                            (COND
                             ((SPADCALL |dnw| 0 (QREFELT $ 22))
                              (PROGN (LETT #3# NIL) (GO #11#)))
                             (#9#
                              (SEQ (LETT |ss| -1) (LETT |dnw| |ddw|)
                                   (EXIT (LETT |nwu| |dwu|)))))))
                          (EXIT
                           (LIST
                            (LIST
                             (SPADCALL (* |ss| |dnf|) |dnw| (QREFELT $ 231))
                             (|spadConstant| $ 230))))))))))))
          #11# (EXIT #3#)))) 

(SDEFUN |RDEEFX;possible_w| ((|f2| F) (|w1| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((|w2| (F)) (#1=#:G685 NIL) (|lc_nw1| (F)) (|lc_nf2| (F))
          (|w2u2| (|Union| F "failed"))
          (|w2u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|r2| #2=(|SparseUnivariatePolynomial| F)) (|r1| #2#)
          (|df2| #3=(|SparseUnivariatePolynomial| F))
          (|nf2| #4=(|SparseUnivariatePolynomial| F)) (|dw1| #3#) (|nw1| #4#)
          (|f2u| #5=(|Fraction| (|SparseUnivariatePolynomial| F))) (|w1u| #5#)
          (|tk| (|Kernel| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |tk| (|RDEEFX;top_kernel| (|spadConstant| $ 33) |w1| |x| $))
            (LETT |w1u| (SPADCALL |w1| |tk| (QREFELT $ 36)))
            (LETT |f2u| (SPADCALL |f2| |tk| (QREFELT $ 36)))
            (LETT |nw1| (SPADCALL |w1u| (QREFELT $ 39)))
            (LETT |dw1| (SPADCALL |w1u| (QREFELT $ 40)))
            (LETT |nf2| (SPADCALL |f2u| (QREFELT $ 39)))
            (LETT |df2| (SPADCALL |f2u| (QREFELT $ 40)))
            (EXIT
             (COND
              ((SPADCALL |df2| |dw1| (QREFELT $ 113))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |dw1| (QREFELT $ 41)) 0 (QREFELT $ 42))
                  (SEQ (LETT |r1| (SPADCALL |nw1| |dw1| (QREFELT $ 192)))
                       (LETT |r2| (SPADCALL |nf2| |dw1| (QREFELT $ 192)))
                       (LETT |w2u| (SPADCALL |r2| |r1| (QREFELT $ 109)))
                       (EXIT
                        (COND
                         ((QEQCAR |w2u| 1)
                          (PROGN (LETT #1# NIL) (GO #6=#:G684)))
                         (#7='T
                          (SEQ
                           (LETT |w2u2|
                                 (SPADCALL (QCDR |w2u|) (QREFELT $ 234)))
                           (EXIT
                            (COND
                             ((QEQCAR |w2u2| 1)
                              (PROGN (LETT #1# NIL) (GO #6#)))
                             (#7# (LETT |w2| (QCDR |w2u2|)))))))))))
                 (#7#
                  (SEQ (LETT |lc_nf2| (SPADCALL |nf2| (QREFELT $ 105)))
                       (LETT |lc_nw1| (SPADCALL |nw1| (QREFELT $ 105)))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL (SPADCALL |nw1| (QREFELT $ 41)) 1
                                     (QREFELT $ 42))
                           (NULL (SPADCALL |tk| '|log| (QREFELT $ 23))))
                          (LETT |w2|
                                (SPADCALL |lc_nf2| |lc_nw1| (QREFELT $ 69))))
                         ((SPADCALL (SPADCALL |lc_nf2| |x| (QREFELT $ 64))
                                    (|spadConstant| $ 45) (QREFELT $ 133))
                          (SEQ (|error| "unimplemented")
                               (EXIT (PROGN (LETT #1# NIL) (GO #6#)))))
                         (#7#
                          (LETT |w2|
                                (SPADCALL (|spadConstant| $ 33) |lc_nw1|
                                          (QREFELT $ 69)))))))))
                (EXIT
                 (COND
                  ((SPADCALL |w2| (|spadConstant| $ 45) (QREFELT $ 80)) NIL)
                  (#7# (LIST |w2|))))))
              (#7# NIL)))))
          #6# (EXIT #1#)))) 

(SDEFUN |RDEEFX;gen_irr_log_cands|
        ((|a| F) (|f| F) (|f2| F) (|w1| F) (|vlst| |List| F) (|ulst| |List| F)
         (|k| |Kernel| F) (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|uu| (F)) (|ai| (F)) (#1=#:G719 NIL) (|i| NIL) (|tt| (F))
          (#2=#:G716 NIL) (|li| NIL) (#3=#:G717 NIL) (|vi| NIL) (#4=#:G718 NIL)
          (|ui| NIL) (|uu1| (F)) (#5=#:G714 NIL) (|ki| NIL) (#6=#:G715 NIL)
          (|gl| (|Integer|)) (|vli| #7=(|List| (|Integer|)))
          (|d| #8=(|Integer|))
          (|cd| (|Record| (|:| |num| #7#) (|:| |den| #8#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|w_cor| (F)) (#9=#:G710 NIL) (#10=#:G711 NIL) (|k2i| NIL)
          (#11=#:G712 NIL) (#12=#:G713 NIL) (|coeffs2| #7#)
          (|wu| (|Fraction| (|SparseUnivariatePolynomial| F))) (|w| (F))
          (|a1| (F)) (|n| (|NonNegativeInteger|)) (|coeffs| #7#)
          (|dvvec| (|Vector| F)) (#13=#:G709 NIL) (#14=#:G708 NIL) (|v'| (F))
          (|lw2'| (F)) (|w2| (F)) (|lw2| (|List| F)))
         (SEQ (LETT |lw2| (|RDEEFX;possible_w| |f2| |w1| |x| $))
              (EXIT
               (COND ((NULL |lw2|) |res|)
                     (#15='T
                      (SEQ (LETT |w2| (|SPADfirst| |lw2|))
                           (LETT |lw2'|
                                 (SPADCALL (SPADCALL |w2| |x| (QREFELT $ 64))
                                           |w2| (QREFELT $ 69)))
                           (LETT |v'|
                                 (SPADCALL |lw2'|
                                           (SPADCALL
                                            (SPADCALL |w1| |x| (QREFELT $ 64))
                                            |w1| (QREFELT $ 69))
                                           (QREFELT $ 75)))
                           (LETT |dvvec|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #14# NIL)
                                   (SEQ (LETT |vi| NIL) (LETT #13# |vlst|) G190
                                        (COND
                                         ((OR (ATOM #13#)
                                              (PROGN
                                               (LETT |vi| (CAR #13#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #14#
                                                (CONS
                                                 (SPADCALL |vi| |x|
                                                           (QREFELT $ 64))
                                                 #14#))))
                                        (LETT #13# (CDR #13#)) (GO G190) G191
                                        (EXIT (NREVERSE #14#))))
                                  (QREFELT $ 83)))
                           (LETT |su| (SPADCALL |dvvec| |v'| (QREFELT $ 86)))
                           (EXIT
                            (COND ((QEQCAR |su| 1) |res|)
                                  (#15#
                                   (SEQ (LETT |sv| (QCDR |su|))
                                        (LETT |cd|
                                              (SPADCALL |sv| (QREFELT $ 90)))
                                        (LETT |d| (QCDR |cd|))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |d| 1 (QREFELT $ 91))
                                           |res|)
                                          (#15#
                                           (SEQ (LETT |coeffs| (QCAR |cd|))
                                                (LETT |n| (LENGTH |coeffs|))
                                                (LETT |a1|
                                                      (SPADCALL |a|
                                                                (|spadConstant|
                                                                 $ 33)
                                                                (QREFELT $
                                                                         79)))
                                                (LETT |w|
                                                      (SPADCALL
                                                       (SPADCALL |w1| |w2|
                                                                 (QREFELT $
                                                                          67))
                                                       (QREFELT $ 50)))
                                                (LETT |tt|
                                                      (SPADCALL |f| |w|
                                                                (QREFELT $
                                                                         75)))
                                                (LETT |wu|
                                                      (SPADCALL |w| |k|
                                                                (QREFELT $
                                                                         36)))
                                                (LETT |su|
                                                      (SPADCALL |dvvec| |lw2'|
                                                                (QREFELT $
                                                                         86)))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |su| 1)
                                                   (|error| "impossible"))
                                                  (#15#
                                                   (SEQ (LETT |sv| (QCDR |su|))
                                                        (LETT |cd|
                                                              (SPADCALL |sv|
                                                                        (QREFELT
                                                                         $
                                                                         90)))
                                                        (LETT |d| (QCDR |cd|))
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |d| 1
                                                                     (QREFELT $
                                                                              91))
                                                           (|error|
                                                            "impossible"))
                                                          (#15#
                                                           (SEQ
                                                            (LETT |coeffs2|
                                                                  (QCAR |cd|))
                                                            (LETT |w_cor|
                                                                  (SPADCALL
                                                                   |w2|
                                                                   (QREFELT $
                                                                            50)))
                                                            (SEQ
                                                             (LETT |ui| NIL)
                                                             (LETT #12# |ulst|)
                                                             (LETT |vi| NIL)
                                                             (LETT #11# |vlst|)
                                                             (LETT |k2i| NIL)
                                                             (LETT #10#
                                                                   |coeffs2|)
                                                             (LETT |ki| NIL)
                                                             (LETT #9#
                                                                   |coeffs|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #9#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #9#))
                                                                    NIL)
                                                                   (ATOM #10#)
                                                                   (PROGN
                                                                    (LETT |k2i|
                                                                          (CAR
                                                                           #10#))
                                                                    NIL)
                                                                   (ATOM #11#)
                                                                   (PROGN
                                                                    (LETT |vi|
                                                                          (CAR
                                                                           #11#))
                                                                    NIL)
                                                                   (ATOM #12#)
                                                                   (PROGN
                                                                    (LETT |ui|
                                                                          (CAR
                                                                           #12#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (LETT |tt|
                                                                    (SPADCALL
                                                                     |tt|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |ki|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       |a1|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      |vi|
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              79)))
                                                              (EXIT
                                                               (LETT |w_cor|
                                                                     (SPADCALL
                                                                      |w_cor|
                                                                      (SPADCALL
                                                                       |ui|
                                                                       (-
                                                                        |k2i|)
                                                                       (QREFELT
                                                                        $ 81))
                                                                      (QREFELT
                                                                       $
                                                                       67)))))
                                                             (LETT #9#
                                                                   (PROG1
                                                                       (CDR
                                                                        #9#)
                                                                     (LETT #10#
                                                                           (PROG1
                                                                               (CDR
                                                                                #10#)
                                                                             (LETT
                                                                              #11#
                                                                              (PROG1
                                                                                  (CDR
                                                                                   #11#)
                                                                                (LETT
                                                                                 #12#
                                                                                 (CDR
                                                                                  #12#))))))))
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL
                                                                (SPADCALL
                                                                 |w_cor| |x|
                                                                 (QREFELT $
                                                                          64))
                                                                (|spadConstant|
                                                                 $ 45)
                                                                (QREFELT $
                                                                         133))
                                                               (|error|
                                                                "impossible"))
                                                              (#15#
                                                               (SEQ
                                                                (LETT |su|
                                                                      (SPADCALL
                                                                       |dvvec|
                                                                       (SPADCALL
                                                                        |tt|
                                                                        |x|
                                                                        (QREFELT
                                                                         $ 64))
                                                                       (QREFELT
                                                                        $ 86)))
                                                                (EXIT
                                                                 (COND
                                                                  ((QEQCAR |su|
                                                                           1)
                                                                   |res|)
                                                                  (#15#
                                                                   (SEQ
                                                                    (LETT |sv|
                                                                          (QCDR
                                                                           |su|))
                                                                    (LETT |cd|
                                                                          (SPADCALL
                                                                           |sv|
                                                                           (QREFELT
                                                                            $
                                                                            90)))
                                                                    (LETT |d|
                                                                          (QCDR
                                                                           |cd|))
                                                                    (EXIT
                                                                     (COND
                                                                      ((SPADCALL
                                                                        |d| 1
                                                                        (QREFELT
                                                                         $ 91))
                                                                       |res|)
                                                                      (#15#
                                                                       (SEQ
                                                                        (LETT
                                                                         |vli|
                                                                         (QCAR
                                                                          |cd|))
                                                                        (LETT
                                                                         |uu|
                                                                         (SPADCALL
                                                                          (|spadConstant|
                                                                           $
                                                                           33)
                                                                          (QREFELT
                                                                           $
                                                                           50)))
                                                                        (LETT
                                                                         |uu1|
                                                                         (|spadConstant|
                                                                          $
                                                                          33))
                                                                        (LETT
                                                                         |gl|
                                                                         (SPADCALL
                                                                          |coeffs|
                                                                          (QREFELT
                                                                           $
                                                                           117)))
                                                                        (COND
                                                                         ((SPADCALL
                                                                           |gl|
                                                                           1
                                                                           (QREFELT
                                                                            $
                                                                            42))
                                                                          (SEQ
                                                                           (LETT
                                                                            |ui|
                                                                            NIL)
                                                                           (LETT
                                                                            #6#
                                                                            |ulst|)
                                                                           (LETT
                                                                            |ki|
                                                                            NIL)
                                                                           (LETT
                                                                            #5#
                                                                            |coeffs|)
                                                                           G190
                                                                           (COND
                                                                            ((OR
                                                                              (ATOM
                                                                               #5#)
                                                                              (PROGN
                                                                               (LETT
                                                                                |ki|
                                                                                (CAR
                                                                                 #5#))
                                                                               NIL)
                                                                              (ATOM
                                                                               #6#)
                                                                              (PROGN
                                                                               (LETT
                                                                                |ui|
                                                                                (CAR
                                                                                 #6#))
                                                                               NIL))
                                                                             (GO
                                                                              G191)))
                                                                           (SEQ
                                                                            (EXIT
                                                                             (LETT
                                                                              |uu1|
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |ui|
                                                                                (QUOTIENT2
                                                                                 |ki|
                                                                                 |gl|)
                                                                                (QREFELT
                                                                                 $
                                                                                 81))
                                                                               |uu1|
                                                                               (QREFELT
                                                                                $
                                                                                67)))))
                                                                           (LETT
                                                                            #5#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #5#)
                                                                              (LETT
                                                                               #6#
                                                                               (CDR
                                                                                #6#))))
                                                                           (GO
                                                                            G190)
                                                                           G191
                                                                           (EXIT
                                                                            NIL))))
                                                                        (SEQ
                                                                         (LETT
                                                                          |ui|
                                                                          NIL)
                                                                         (LETT
                                                                          #4#
                                                                          |ulst|)
                                                                         (LETT
                                                                          |vi|
                                                                          NIL)
                                                                         (LETT
                                                                          #3#
                                                                          |vlst|)
                                                                         (LETT
                                                                          |li|
                                                                          NIL)
                                                                         (LETT
                                                                          #2#
                                                                          |vli|)
                                                                         G190
                                                                         (COND
                                                                          ((OR
                                                                            (ATOM
                                                                             #2#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |li|
                                                                              (CAR
                                                                               #2#))
                                                                             NIL)
                                                                            (ATOM
                                                                             #3#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |vi|
                                                                              (CAR
                                                                               #3#))
                                                                             NIL)
                                                                            (ATOM
                                                                             #4#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |ui|
                                                                              (CAR
                                                                               #4#))
                                                                             NIL))
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (LETT
                                                                           |tt|
                                                                           (SPADCALL
                                                                            |tt|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              |li|
                                                                              (QREFELT
                                                                               $
                                                                               76))
                                                                             |vi|
                                                                             (QREFELT
                                                                              $
                                                                              67))
                                                                            (QREFELT
                                                                             $
                                                                             79)))
                                                                          (EXIT
                                                                           (LETT
                                                                            |uu|
                                                                            (SPADCALL
                                                                             |uu|
                                                                             (SPADCALL
                                                                              |ui|
                                                                              (-
                                                                               |li|)
                                                                              (QREFELT
                                                                               $
                                                                               81))
                                                                             (QREFELT
                                                                              $
                                                                              67)))))
                                                                         (LETT
                                                                          #2#
                                                                          (PROG1
                                                                              (CDR
                                                                               #2#)
                                                                            (LETT
                                                                             #3#
                                                                             (PROG1
                                                                                 (CDR
                                                                                  #3#)
                                                                               (LETT
                                                                                #4#
                                                                                (CDR
                                                                                 #4#))))))
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          NIL))
                                                                        (SEQ
                                                                         (LETT
                                                                          |i|
                                                                          0)
                                                                         (LETT
                                                                          #1#
                                                                          (-
                                                                           |gl|
                                                                           1))
                                                                         G190
                                                                         (COND
                                                                          ((|greater_SI|
                                                                            |i|
                                                                            #1#)
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (LETT
                                                                           |ai|
                                                                           (SPADCALL
                                                                            |a|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              |i|
                                                                              (QREFELT
                                                                               $
                                                                               76))
                                                                             (SPADCALL
                                                                              |gl|
                                                                              (QREFELT
                                                                               $
                                                                               76))
                                                                             (QREFELT
                                                                              $
                                                                              69))
                                                                            (QREFELT
                                                                             $
                                                                             79)))
                                                                          (LETT
                                                                           |res|
                                                                           (CONS
                                                                            (VECTOR
                                                                             0
                                                                             (|spadConstant|
                                                                              $
                                                                              110)
                                                                             |w_cor|
                                                                             0
                                                                             (|spadConstant|
                                                                              $
                                                                              45)
                                                                             (|spadConstant|
                                                                              $
                                                                              104)
                                                                             |wu|
                                                                             (|spadConstant|
                                                                              $
                                                                              200)
                                                                             |uu|
                                                                             0
                                                                             (SPADCALL
                                                                              |tt|
                                                                              (QREFELT
                                                                               $
                                                                               50))
                                                                             |ai|)
                                                                            |res|))
                                                                          (EXIT
                                                                           (LETT
                                                                            |uu|
                                                                            (SPADCALL
                                                                             |uu|
                                                                             |uu1|
                                                                             (QREFELT
                                                                              $
                                                                              69)))))
                                                                         (LETT
                                                                          |i|
                                                                          (|inc_SI|
                                                                           |i|))
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          NIL))
                                                                        (EXIT
                                                                         |res|)))))))))))))))))))))))))))))))))))) 

(SDEFUN |RDEEFX;irrational_gamma_candidates|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|w1| (F)) (|a| (F)) (|rls| (|List| (|Integer|))) (#1=#:G751 NIL)
          (|li| NIL) (#2=#:G750 NIL) (|km| #3=(|Integer|)) (|s| #3#)
          (|kmq| NIL) (|#G214| #4=(|List| (|Fraction| (|Integer|)))) (|sq| NIL)
          (|#G213| #4#) (#5=#:G749 NIL) (|sk| NIL) (|lsk| (|List| #4#))
          (|tk| (|Kernel| F)) (|w0| (F)) (|ak| (F)) (#6=#:G747 NIL)
          (#7=#:G748 NIL) (|kk| NIL) (|rl| (|List| (|Integer|)))
          (|cl| (|List| F)) (#8=#:G743 NIL) (|f2| (F)) (|ck| (F))
          (|nf1| (|SparseUnivariatePolynomial| F))
          (|nfr| (|Fraction| (|SparseUnivariatePolynomial| F))) (#9=#:G746 NIL)
          (|f| (F)) (|nlk| (|List| (|Kernel| F))) (#10=#:G745 NIL)
          (#11=#:G744 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |k| '|log| (QREFELT $ 23))
              (COND
               ((SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 113))
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 41)) 1)
                  (EXIT
                   (SEQ (LETT |n1| (SPADCALL |k| (QREFELT $ 19)))
                        (LETT |nlk|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |kk| NIL)
                                    (LETT #10#
                                          (SPADCALL
                                           (SPADCALL |nf| 0 (QREFELT $ 43))
                                           (QREFELT $ 11)))
                                    G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN (LETT |kk| (CAR #10#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((COND
                                         ((SPADCALL
                                           (SPADCALL
                                            (SPADCALL |kk| (QREFELT $ 63)) |x|
                                            (QREFELT $ 64))
                                           (|spadConstant| $ 45)
                                           (QREFELT $ 133))
                                          (EQL (SPADCALL |kk| (QREFELT $ 19))
                                               |n1|))
                                         (#12='T NIL))
                                        (LETT #11# (CONS |kk| #11#))))))
                                    (LETT #10# (CDR #10#)) (GO G190) G191
                                    (EXIT (NREVERSE #11#)))))
                        (LETT |nlk| (CONS |k| |nlk|))
                        (LETT |f|
                              (SPADCALL (SPADCALL |nf| |denf| (QREFELT $ 199))
                                        |k| (QREFELT $ 62)))
                        (LETT |f2| |f|) (LETT |cl| NIL)
                        (SEQ (LETT |kk| NIL) (LETT #9# |nlk|) G190
                             (COND
                              ((OR (ATOM #9#)
                                   (PROGN (LETT |kk| (CAR #9#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |kk| '|log| (QREFELT $ 23)))
                                 (COND
                                  ((SPADCALL |kk| '|exp| (QREFELT $ 23))
                                   (|error| "unimplemented"))
                                  ('T
                                   (PROGN (LETT #8# |res|) (GO #13=#:G742)))))
                                ('T
                                 (SEQ
                                  (LETT |nfr|
                                        (SPADCALL |f2| |kk| (QREFELT $ 36)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL (SPADCALL |nfr| (QREFELT $ 40))
                                               (|spadConstant| $ 110)
                                               (QREFELT $ 111))
                                     (PROGN (LETT #8# |res|) (GO #13#)))
                                    ('T
                                     (SEQ
                                      (LETT |nf1|
                                            (SPADCALL |nfr| (QREFELT $ 39)))
                                      (EXIT
                                       (COND
                                        ((EQL (SPADCALL |nf1| (QREFELT $ 41))
                                              0)
                                         (|error| "impossible"))
                                        ((SPADCALL
                                          (SPADCALL |nf1| (QREFELT $ 41)) 1
                                          (QREFELT $ 235))
                                         (PROGN (LETT #8# |res|) (GO #13#)))
                                        ('T
                                         (SEQ
                                          (LETT |ck|
                                                (SPADCALL |nf1|
                                                          (QREFELT $ 105)))
                                          (LETT |f2|
                                                (SPADCALL |nf1| 0
                                                          (QREFELT $ 43)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |ck| |x|
                                                        (QREFELT $ 64))
                                              (|spadConstant| $ 45)
                                              (QREFELT $ 133))
                                             (PROGN
                                              (LETT #8# |res|)
                                              (GO #13#)))
                                            ('T
                                             (LETT |cl|
                                                   (CONS |ck|
                                                         |cl|))))))))))))))))))
                             (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                        (LETT |cl| (NREVERSE |cl|))
                        (LETT |rl| (|RDEEFX;solve_for_ratios| |cl| $))
                        (EXIT
                         (COND ((NULL |rl|) |res|)
                               (#12#
                                (SEQ (LETT |w0| (|spadConstant| $ 33))
                                     (SEQ (LETT |kk| NIL) (LETT #7# |nlk|)
                                          (LETT |li| NIL) (LETT #6# |rl|) G190
                                          (COND
                                           ((OR (ATOM #6#)
                                                (PROGN
                                                 (LETT |li| (CAR #6#))
                                                 NIL)
                                                (ATOM #7#)
                                                (PROGN
                                                 (LETT |kk| (CAR #7#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |ak|
                                                 (SPADCALL
                                                  (SPADCALL |kk|
                                                            (QREFELT $ 28))
                                                  1 (QREFELT $ 30)))
                                           (EXIT
                                            (LETT |w0|
                                                  (SPADCALL |w0|
                                                            (SPADCALL |ak| |li|
                                                                      (QREFELT
                                                                       $ 81))
                                                            (QREFELT $ 67)))))
                                          (LETT #6#
                                                (PROG1 (CDR #6#)
                                                  (LETT #7# (CDR #7#))))
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |tk|
                                           (|RDEEFX;top_kernel|
                                            (|spadConstant| $ 33) |w0| |x| $))
                                     (LETT |lsk|
                                           (|RDEEFX;possible_sk| |w0| |f2| |tk|
                                            |x| $))
                                     (SEQ (LETT |sk| NIL) (LETT #5# |lsk|) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |sk| (CAR #5#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (PROGN
                                            (LETT |#G213| |sk|)
                                            (LETT |#G214| |#G213|)
                                            (LETT |sq| (|SPADfirst| |#G214|))
                                            (LETT |#G214| (CDR |#G214|))
                                            (LETT |kmq| (|SPADfirst| |#G214|))
                                            |#G213|)
                                           (EXIT
                                            (COND
                                             ((OR
                                               (SPADCALL |sq|
                                                         (|spadConstant| $ 230)
                                                         (QREFELT $ 236))
                                               (OR
                                                (SPADCALL
                                                 (SPADCALL |sq|
                                                           (QREFELT $ 218))
                                                 1 (QREFELT $ 91))
                                                (SPADCALL
                                                 (SPADCALL |kmq|
                                                           (QREFELT $ 218))
                                                 1 (QREFELT $ 91))))
                                              "skip")
                                             ('T
                                              (SEQ
                                               (LETT |s|
                                                     (SPADCALL |sq|
                                                               (QREFELT $
                                                                        237)))
                                               (LETT |km|
                                                     (SPADCALL |kmq|
                                                               (QREFELT $
                                                                        237)))
                                               (LETT |rls|
                                                     (PROGN
                                                      (LETT #2# NIL)
                                                      (SEQ (LETT |li| NIL)
                                                           (LETT #1# |rl|) G190
                                                           (COND
                                                            ((OR (ATOM #1#)
                                                                 (PROGN
                                                                  (LETT |li|
                                                                        (CAR
                                                                         #1#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #2#
                                                                   (CONS
                                                                    (* |s|
                                                                       |li|)
                                                                    #2#))))
                                                           (LETT #1# (CDR #1#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #2#)))))
                                               (LETT |a| (|SPADfirst| |cl|))
                                               (LETT |a|
                                                     (SPADCALL
                                                      (SPADCALL |a|
                                                                (SPADCALL |s|
                                                                          (SPADCALL
                                                                           (|SPADfirst|
                                                                            |rl|)
                                                                           (QREFELT
                                                                            $
                                                                            76))
                                                                          (QREFELT
                                                                           $
                                                                           238))
                                                                (QREFELT $ 69))
                                                      (|spadConstant| $ 33)
                                                      (QREFELT $ 75)))
                                               (LETT |w1|
                                                     (SPADCALL
                                                      (SPADCALL |w0| |s|
                                                                (QREFELT $ 81))
                                                      (SPADCALL
                                                       (SPADCALL |tk|
                                                                 (QREFELT $
                                                                          63))
                                                       |km| (QREFELT $ 81))
                                                      (QREFELT $ 67)))
                                               (EXIT
                                                (LETT |res|
                                                      (|RDEEFX;gen_irr_log_cands|
                                                       |a| |f| |f2| |w1| |vlst|
                                                       |ulst| |k| |x| |res|
                                                       $))))))))
                                          (LETT #5# (CDR #5#)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT |res|)))))))))))))
            (EXIT |res|)))
          #13# (EXIT #8#)))) 

(SDEFUN |RDEEFX;gammas1|
        ((|nf| |SparseUnivariatePolynomial| F) (|a| |Integer|)
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|n2| |Integer|) (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|fnf| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|nf1| (|SparseUnivariatePolynomial| F)) (|cfac| (F))
          (|f2| (|SparseUnivariatePolynomial| F)) (|tt| (F))
          (|deg1| (|NonNegativeInteger|))
          (|f1| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G768 NIL)
          (|fac| NIL) (|e_tt| (|List| F))
          (|rfacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f_res| (|Factored| (|SparseUnivariatePolynomial| F))) (|r| (F))
          (|nfp1| (|SparseUnivariatePolynomial| F)) (|t| (|Kernel| F)))
         (SEQ (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 59)) (QREFELT $ 60)))
              (LETT |nfp1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |nf| (QREFELT $ 194)) |denf1|
                               (QREFELT $ 99))
                     (SPADCALL
                      (SPADCALL (SPADCALL |gexp| (QREFELT $ 76)) |nf|
                                (QREFELT $ 138))
                      (SPADCALL |denf1| (QREFELT $ 194)) (QREFELT $ 99))
                     (QREFELT $ 48)))
              (LETT |r|
                    (SPADCALL
                     (SPADCALL |nf|
                               (SPADCALL
                                (SPADCALL (SPADCALL |t| (QREFELT $ 63))
                                          (QREFELT $ 47))
                                |denf| (QREFELT $ 99))
                               (QREFELT $ 51))
                     |nfp1| (QREFELT $ 195)))
              (LETT |f_res|
                    (SPADCALL
                     (SPADCALL (SPADCALL |r| |t| (QREFELT $ 36))
                               (QREFELT $ 39))
                     (QREFELT $ 128)))
              (LETT |rfacs| (SPADCALL |f_res| (QREFELT $ 132)))
              (LETT |e_tt|
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT $ 41)) 0)
                      (LIST (|spadConstant| $ 45)))
                     ((EQL (SPADCALL |nf| (QREFELT $ 41))
                           (SPADCALL |denf| (QREFELT $ 41)))
                      (SEQ
                       (LETT |tt|
                             (SPADCALL
                              (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                                        (SPADCALL |denf| (QREFELT $ 105))
                                        (QREFELT $ 69))
                              (QREFELT $ 50)))
                       (LETT |nf1|
                             (SPADCALL |nf|
                                       (SPADCALL (SPADCALL |tt| (QREFELT $ 47))
                                                 |denf| (QREFELT $ 99))
                                       (QREFELT $ 51)))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |nf1| (QREFELT $ 41)) 0) (LIST |tt|))
                         (#3='T NIL)))))
                     (#3# NIL)))
              (COND
               ((NULL (NULL |e_tt|))
                (SEQ (LETT |tt| (|SPADfirst| |e_tt|))
                     (LETT |nf1|
                           (SPADCALL |nf|
                                     (SPADCALL (SPADCALL |tt| (QREFELT $ 47))
                                               |denf| (QREFELT $ 99))
                                     (QREFELT $ 51)))
                     (LETT |fnf| (SPADCALL |nf1| NIL (QREFELT $ 239)))
                     (EXIT
                      (LETT |res|
                            (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                             |denf1| |gexp| |a| |tt| (|spadConstant| $ 104)
                             |vlst| |ulst| |k| |x| |res| $))))))
              (SEQ (LETT |fac| NIL) (LETT #2# |rfacs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |fac| 1))
                        (LETT |deg1| (SPADCALL |f1| (QREFELT $ 41)))
                        (EXIT
                         (COND
                          ((EQL |deg1| 1)
                           (SEQ
                            (LETT |tt|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |f1| 0 (QREFELT $ 43))
                                             (SPADCALL |f1| 1 (QREFELT $ 43))
                                             (QREFELT $ 69))
                                   (QREFELT $ 50)))
                            (LETT |nf1|
                                  (SPADCALL |nf|
                                            (SPADCALL
                                             (SPADCALL |tt| (QREFELT $ 47))
                                             |denf| (QREFELT $ 99))
                                            (QREFELT $ 51)))
                            (EXIT
                             (COND
                              ((< (SPADCALL 2 (QVELT |fac| 2) (QREFELT $ 211))
                                  (SPADCALL |nf1| (QREFELT $ 41)))
                               "iterate")
                              ('T
                               (SEQ
                                (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 241)))
                                (EXIT
                                 (LETT |res|
                                       (|RDEEFX;gamma_candidate| |fnf| |nf1|
                                        |denf| |denf1| |gexp| |a| |tt|
                                        (|spadConstant| $ 104) |vlst| |ulst|
                                        |k| |x| |res| $)))))))))
                          ((< (QVELT |fac| 2) |n2|) "iterate")
                          ((EQL |deg1| 2)
                           (SEQ
                            (LETT |tt|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |f1| 1 (QREFELT $ 43))
                                             (SPADCALL
                                              (SPADCALL 2 (QREFELT $ 76))
                                              (SPADCALL |f1| (QREFELT $ 105))
                                              (QREFELT $ 67))
                                             (QREFELT $ 69))
                                   (QREFELT $ 50)))
                            (LETT |f2|
                                  (SPADCALL |f1| (QREFELT $ 94)
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| $ 33) 1
                                                       (QREFELT $ 46))
                                             (SPADCALL |tt| (QREFELT $ 47))
                                             (QREFELT $ 51))
                                            (QREFELT $ 95)))
                            (COND
                             ((NULL
                               (SPADCALL
                                (CONS #'|RDEEFX;gammas1!0| (VECTOR $ |x|))
                                (SPADCALL |f2| (QREFELT $ 96)) (QREFELT $ 98)))
                              (EXIT "iterate")))
                            (LETT |cfac| (SPADCALL |f2| (QREFELT $ 242)))
                            (LETT |nf1|
                                  (SPADCALL |nf|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |tt| |cfac|
                                                        (QREFELT $ 75))
                                              (QREFELT $ 47))
                                             |denf| (QREFELT $ 99))
                                            (QREFELT $ 51)))
                            (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 241)))
                            (EXIT
                             (LETT |res|
                                   (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                                    |denf1| |gexp| |a| |tt| |f2| |vlst| |ulst|
                                    |k| |x| |res| $))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;gammas1!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 64)) (|spadConstant| $ 45)
                      (QREFELT $ 80)))))) 

(SDEFUN |RDEEFX;special_candidates|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|nn| #1=(|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")) (#2=#:G792 NIL) (|sol| NIL)
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|f_res1| (F)) (|tx_plus_b| #1#) (|bk| #3=(|Kernel| F))
          (|bs| #4=(|Symbol|)) (#5=#:G791 NIL) (|r0| NIL)
          (|ratl| (|List| (|Fraction| (|Integer|))))
          (|nnp2| (|SparseUnivariatePolynomial| F))
          (|t3| #6=(|SparseUnivariatePolynomial| F)) (|t2| #6#) (|ct1| (F))
          (|t1| #6#) (|denf2| (|SparseUnivariatePolynomial| F))
          (|denfp2| #7=(|SparseUnivariatePolynomial| F)) (|nfp2| #7#)
          (|nnp| #1#) (|denfp1| #7#) (|nfp1| #7#) (|t| #3#) (|ts| #4#)
          (|n4| (|Integer|)) (|l| (|Integer|)) (|n3| (|NonNegativeInteger|))
          (|n1| #8=(|NonNegativeInteger|)) (|a| (|Integer|)) (#9=#:G790 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F)) (|n2| #8#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res1|
                  (|RDEEFX;special_ei_candidates| |nf| |denf| |vlst| |ulst| |k|
                   |x| $))
            (LETT |res1|
                  (|RDEEFX;irrational_gamma_candidates| |nf| |denf| |vlst|
                   |ulst| |k| |x| |res1| $))
            (LETT |a| 0) (LETT |n1| (SPADCALL |nf| (QREFELT $ 41)))
            (LETT |n2| (SPADCALL |denf| (QREFELT $ 41)))
            (EXIT
             (COND ((EQL |n1| 1) |res1|)
                   (#10='T
                    (SEQ
                     (COND
                      ((EQL |n1| (+ |n2| 1))
                       (COND
                        ((NULL (SPADCALL |k| '|log| (QREFELT $ 23)))
                         (PROGN (LETT #9# |res1|) (GO #11=#:G789)))
                        ('T
                         (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 105)))
                              (LETT |rcu| (SPADCALL |lc| (QREFELT $ 135)))
                              (EXIT
                               (COND
                                ((QEQCAR |rcu| 1)
                                 (PROGN (LETT #9# |res1|) (GO #11#)))
                                (#10#
                                 (SEQ (LETT |a| (QCDR |rcu|))
                                      (LETT |nf|
                                            (SPADCALL |nf|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           76))
                                                        1 (QREFELT $ 46))
                                                       |denf| (QREFELT $ 99))
                                                      (QREFELT $ 48)))
                                      (EXIT (LETT |n1| |n2|)))))))))))
                     (LETT |n3| (MAX |n1| |n2|)) (LETT |l| (GCD |gexp| |n3|))
                     (EXIT
                      (COND ((EQL |l| 1) |res1|)
                            (#10#
                             (SEQ (LETT |n4| (- |n3| (QUOTIENT2 |n3| 2)))
                                  (LETT |ts| (SPADCALL (QREFELT $ 59)))
                                  (LETT |t| (SPADCALL |ts| (QREFELT $ 60)))
                                  (LETT |nfp1| (SPADCALL |nf| (QREFELT $ 194)))
                                  (LETT |denfp1|
                                        (SPADCALL |denf1| (QREFELT $ 194)))
                                  (COND
                                   ((SPADCALL |n1| |n2| (QREFELT $ 22))
                                    (COND
                                     ((SPADCALL |k| '|log| (QREFELT $ 23))
                                      (EXIT
                                       (SEQ
                                        (LETT |nnp|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |nfp1| |denf1|
                                                          (QREFELT $ 99))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |gexp|
                                                            (QREFELT $ 76))
                                                  |denfp1| (QREFELT $ 138))
                                                 |nf| (QREFELT $ 99))
                                                (QREFELT $ 48))
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |t| (QREFELT $ 63))
                                                  (QREFELT $ 47))
                                                 |denf| (QREFELT $ 99))
                                                |denf1| (QREFELT $ 99))
                                               (QREFELT $ 51)))
                                        (EXIT
                                         (COND
                                          ((ODDP |l|)
                                           (SEQ
                                            (LETT |nfp2|
                                                  (SPADCALL |nfp1|
                                                            (QREFELT $ 194)))
                                            (LETT |denfp2|
                                                  (SPADCALL |denfp1|
                                                            (QREFELT $ 194)))
                                            (LETT |denf2|
                                                  (SPADCALL |denf1| |denf1|
                                                            (QREFELT $ 99)))
                                            (LETT |t1|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL 2 |gexp|
                                                              (QREFELT $ 243))
                                                    (QREFELT $ 76))
                                                   |denfp1| (QREFELT $ 138)))
                                            (LETT |t1|
                                                  (SPADCALL
                                                   (SPADCALL |t1| |nfp1|
                                                             (QREFELT $ 99))
                                                   |denf1| (QREFELT $ 99)))
                                            (LETT |ct1|
                                                  (SPADCALL
                                                   (* (+ |gexp| 1) |gexp|)
                                                   (QREFELT $ 76)))
                                            (LETT |t2|
                                                  (SPADCALL |ct1| |denfp1|
                                                            (QREFELT $ 138)))
                                            (LETT |t2|
                                                  (SPADCALL
                                                   (SPADCALL |t2| |denfp1|
                                                             (QREFELT $ 99))
                                                   |nf| (QREFELT $ 99)))
                                            (LETT |t3|
                                                  (SPADCALL
                                                   (SPADCALL |gexp|
                                                             (QREFELT $ 76))
                                                   |denfp2| (QREFELT $ 138)))
                                            (LETT |t3|
                                                  (SPADCALL
                                                   (SPADCALL |t3| |nf|
                                                             (QREFELT $ 99))
                                                   |denf1| (QREFELT $ 99)))
                                            (LETT |nnp2|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |nfp2| |denf2|
                                                               (QREFELT $ 99))
                                                     |t1| (QREFELT $ 48))
                                                    |t2| (QREFELT $ 51))
                                                   |t3| (QREFELT $ 48)))
                                            (LETT |f_res1|
                                                  (SPADCALL |nnp| |nnp2|
                                                            (QREFELT $ 195)))
                                            (LETT |ratl|
                                                  (SPADCALL |f_res1| |t|
                                                            (QREFELT $ 169)))
                                            (SEQ (LETT |r0| NIL)
                                                 (LETT #5# |ratl|) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT |r0| (CAR #5#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |ru|
                                                        (SPADCALL |r0|
                                                                  (QREFELT $
                                                                           193)))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |ru| 1) "iterate")
                                                    ('T
                                                     (SEQ
                                                      (LETT |ri| (QCDR |ru|))
                                                      (LETT |nn|
                                                            (SPADCALL |nf|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |ri|
                                                                         (QREFELT
                                                                          $
                                                                          76))
                                                                        1
                                                                        (QREFELT
                                                                         $ 46))
                                                                       |denf|
                                                                       (QREFELT
                                                                        $ 99))
                                                                      (QREFELT
                                                                       $ 51)))
                                                      (EXIT
                                                       (LETT |res1|
                                                             (|RDEEFX;gammas1|
                                                              |nn| |ri| |denf|
                                                              |denf1| |gexp|
                                                              |n2| |vlst|
                                                              |ulst| |k| |x|
                                                              |res1| $))))))))
                                                 (LETT #5# (CDR #5#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (EXIT |res1|)))
                                          (#10#
                                           (SEQ
                                            (LETT |bs|
                                                  (SPADCALL (QREFELT $ 59)))
                                            (LETT |bk|
                                                  (SPADCALL |bs|
                                                            (QREFELT $ 60)))
                                            (LETT |tx_plus_b|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |t|
                                                              (QREFELT $ 63))
                                                    1 (QREFELT $ 46))
                                                   (SPADCALL
                                                    (SPADCALL |bk|
                                                              (QREFELT $ 63))
                                                    (QREFELT $ 47))
                                                   (QREFELT $ 51)))
                                            (LETT |f_res1|
                                                  (SPADCALL |nnp|
                                                            (SPADCALL |nf|
                                                                      (SPADCALL
                                                                       |tx_plus_b|
                                                                       |denf|
                                                                       (QREFELT
                                                                        $ 99))
                                                                      (QREFELT
                                                                       $ 51))
                                                            (QREFELT $ 195)))
                                            (LETT |lsol|
                                                  (|RDEEFX;solve_poly_eqs|
                                                   (LIST |f_res1|
                                                         (SPADCALL |f_res1|
                                                                   |bs|
                                                                   (QREFELT $
                                                                            64)))
                                                   |ts| |bs| $))
                                            (SEQ (LETT |sol| NIL)
                                                 (LETT #2# |lsol|) G190
                                                 (COND
                                                  ((OR (ATOM #2#)
                                                       (PROGN
                                                        (LETT |sol| (CAR #2#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |ru|
                                                        (SPADCALL (QCAR |sol|)
                                                                  (QREFELT $
                                                                           193)))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |ru| 1) "iterate")
                                                    ('T
                                                     (SEQ
                                                      (LETT |ri| (QCDR |ru|))
                                                      (LETT |nn|
                                                            (SPADCALL |nf|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |ri|
                                                                         (QREFELT
                                                                          $
                                                                          76))
                                                                        1
                                                                        (QREFELT
                                                                         $ 46))
                                                                       |denf|
                                                                       (QREFELT
                                                                        $ 99))
                                                                      (QREFELT
                                                                       $ 51)))
                                                      (EXIT
                                                       (LETT |res1|
                                                             (|RDEEFX;gammas1|
                                                              |nn| |ri| |denf|
                                                              |denf1| |gexp|
                                                              |n2| |vlst|
                                                              |ulst| |k| |x|
                                                              |res1| $))))))))
                                                 (LETT #2# (CDR #2#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (EXIT |res1|)))))))))))
                                  (EXIT
                                   (|RDEEFX;gammas1| |nf| |a| |denf| |denf1|
                                    |gexp| |n2| |vlst| |ulst| |k| |x| |res1|
                                    $))))))))))))
          #11# (EXIT #9#)))) 

(SDEFUN |RDEEFX;finish_special_integrate2|
        ((|rr1f| F) (|csol| |Vector| F) (|a1p| F) (|as| |Vector| F)
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|cand_prims| (|List| F)) (|ansp| (F)) (#1=#:G799 NIL) (|i| NIL))
         (SEQ (LETT |cand_prims| NIL) (LETT |ansp| (|spadConstant| $ 45))
              (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |as|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (COND
                     ((NULL |cand_prims|)
                      (SEQ
                       (LETT |cand_prims|
                             (|RDEEFX;get_prims| (|SPADfirst| |scands|) |denf|
                              |denf| |gexp| |k| $))
                       (EXIT (LETT |scands| (CDR |scands|))))))
                    (LETT |a1p|
                          (SPADCALL |a1p|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT $ 244))
                                     (SPADCALL |as| |i| (QREFELT $ 244))
                                     (QREFELT $ 67))
                                    (QREFELT $ 79)))
                    (LETT |ansp|
                          (SPADCALL |ansp|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT $ 244))
                                     (|SPADfirst| |cand_prims|) (QREFELT $ 67))
                                    (QREFELT $ 75)))
                    (EXIT (LETT |cand_prims| (CDR |cand_prims|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |a1p| |rr1f| |ansp| 'T))))) 

(SDEFUN |RDEEFX;finish_special_integrate|
        ((|rr1f| F) (|a1p| F) (|vs| |Vector| F) (|as| |Vector| F)
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|csol| (|Vector| F)) (|csolu| (|Union| (|Vector| F) "failed")))
         (SEQ
          (LETT |csolu|
                (SPADCALL |vs| |rr1f|
                          (LIST
                           (CONS #'|RDEEFX;finish_special_integrate!0|
                                 (VECTOR $ |x|)))
                          (QREFELT $ 249)))
          (EXIT
           (COND
            ((QEQCAR |csolu| 1)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                     (|spadConstant| $ 45) NIL))
            ('T
             (SEQ (LETT |csol| (QCDR |csolu|))
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |rr1f| |csol| |a1p| |as|
                    |scands| |denf| |gexp| |k| $))))))))) 

(SDEFUN |RDEEFX;finish_special_integrate!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |x| (QREFELT $ 64)))))) 

(SDEFUN |RDEEFX;exp_lower_bound|
        ((|nfp| |SparseUnivariatePolynomial| F) (|eta| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Symbol|) (|lk| |List| (|Kernel| F)) ($ |Integer|))
        (SPROG
         ((|min_deg| (|Integer|)) (|max_deg| (|Integer|))
          (|c_degs| (|List| (|NonNegativeInteger|))) (#1=#:G819 NIL)
          (|scoeff| NIL) (#2=#:G818 NIL)
          (|b| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F))))
         (SEQ (LETT |logi| (CONS #'|RDEEFX;exp_lower_bound!0| (VECTOR $ |x|)))
              (LETT |b| (SPADCALL |nfp| (QREFELT $ 254)))
              (LETT |c_degs|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |scoeff| NIL) (LETT #1# |scoeffs|) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |scoeff| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (SPADCALL |scoeff| (QREFELT $ 40))
                                             (QREFELT $ 41))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |c_degs|
                    (CONS
                     (SPADCALL (SPADCALL |rr1| (QREFELT $ 40)) (QREFELT $ 41))
                     |c_degs|))
              (LETT |max_deg| (SPADCALL (ELT $ 256) |c_degs| (QREFELT $ 259)))
              (LETT |min_deg| (SPADCALL |nfp| (QREFELT $ 221)))
              (EXIT
               (SPADCALL (|spadConstant| $ 110) |b| |min_deg| (- |max_deg|)
                         |lk| |eta| |logi| (QREFELT $ 262)))))) 

(SDEFUN |RDEEFX;exp_lower_bound!0| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 252)))))) 

(SDEFUN |RDEEFX;special_integrate2|
        ((|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|ndenf| |SparseUnivariatePolynomial| F) (|f| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|r1| F)
         (|g| F)
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|gexp| |Integer|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|as| (|Vector| F))
          (|part| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|partu|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|g1| (F)) (|lg1| (|List| F)) (#1=#:G829 NIL) (|scoeff| NIL)
          (#2=#:G828 NIL))
         (SEQ
          (LETT |lg1|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |scoeff| NIL) (LETT #1# |scoeffs|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |scoeff| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |scoeff| |k| (QREFELT $ 62))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |g1| (SPADCALL |rr1| |k| (QREFELT $ 62)))
          (LETT |partu|
                (SPADCALL |f| |g1| |lg1| |x| (CONS |k| |lk|) (QREFELT $ 265)))
          (EXIT
           (COND
            ((QEQCAR |partu| 1)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                     (|spadConstant| $ 45) NIL))
            ('T
             (SEQ (LETT |part| (QCDR |partu|))
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45)))
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |g1| (QCDR |part|)
                    (QCAR |part|) |as| |scands| |denf| |gexp| |k| $))))))))) 

(SDEFUN |RDEEFX;do_spde1|
        ((|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|nfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|def_f| (F)) (|af| (F)) (|r2| (|SparseUnivariatePolynomial| F))
          (|a1| #1=(|SparseUnivariatePolynomial| F))
          (|res1|
           (|Record| (|:| |ans| #1#)
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 267)))
              (EXIT
               (COND ((QEQCAR |spec1u| 1) (|error| "impossible 7"))
                     ('T
                      (SEQ (LETT |spec1p| (QCDR |spec1u|))
                           (LETT |res1|
                                 (SPADCALL |nfp| |spec1p| |der|
                                           (QREFELT $ 271)))
                           (LETT |a1| (QCAR |res1|))
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |a1| |der|)
                                           (SPADCALL |nfp| |a1| (QREFELT $ 99))
                                           (QREFELT $ 51)))
                           (LETT |af|
                                 (SPADCALL (SPADCALL |a1| (QREFELT $ 49)) |k|
                                           (QREFELT $ 62)))
                           (LETT |def_f|
                                 (SPADCALL
                                  (SPADCALL |rr1|
                                            (SPADCALL |r2| (QREFELT $ 49))
                                            (QREFELT $ 272))
                                  |k| (QREFELT $ 62)))
                           (EXIT
                            (VECTOR |af| |def_f|
                                    (SPADCALL (QCDR |res1|)
                                              (|spadConstant| $ 104)
                                              (QREFELT $ 113))))))))))) 

(SDEFUN |RDEEFX;special_integrate1|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| F)) (|f| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|r1| F)
         (|g| F) (|ansp| F)
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|gexp| |Integer|)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
          (#2=#:G857 NIL) (|scoeff| NIL) (#3=#:G858 NIL) (|i| NIL)
          (|as| #4=(|Vector| F)) (|vs| #4#) (|rr1f| (F)) (|a1p| (F))
          (|inv_den1| (F)) (|nfp1| #1#) (|ak| (F)) (#5=#:G856 NIL)
          (#6=#:G855 NIL) (|mm| (|SparseUnivariatePolynomial| F))
          (#7=#:G844 NIL) (|neg_deg| (|Integer|)) (|eta| (F)) (#8=#:G840 NIL))
         (SEQ
          (LETT |neg_deg|
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 23))
                  (SEQ
                   (LETT |eta|
                         (SPADCALL
                          (PROG2
                              (LETT #8#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 33) 1
                                                (QREFELT $ 46))
                                      |derivation|)
                                     (SPADCALL (|spadConstant| $ 33) 1
                                               (QREFELT $ 46))
                                     (QREFELT $ 109)))
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7))
                                             "failed")
                                            #8#))
                          (QREFELT $ 205)))
                   (EXIT
                    (-
                     (|RDEEFX;exp_lower_bound| |nfp| |eta| |rr1| |scoeffs| |x|
                      |lk| $)))))
                 (#9='T 0)))
          (LETT |nfp1| |nfp|) (LETT |inv_den1| (|spadConstant| $ 33))
          (COND
           ((SPADCALL |neg_deg| 0 (QREFELT $ 42))
            (SEQ
             (LETT |mm|
                   (SPADCALL (|spadConstant| $ 33)
                             (PROG1 (LETT #7# |neg_deg|)
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#))
                             (QREFELT $ 46)))
             (LETT |scoeffs|
                   (PROGN
                    (LETT #6# NIL)
                    (SEQ (LETT |scoeff| NIL) (LETT #5# |scoeffs|) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |scoeff| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS (SPADCALL |mm| |scoeff| (QREFELT $ 273))
                                       #6#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #6#)))))
             (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 273)))
             (LETT |ak|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1 (QREFELT $ 30)))
             (LETT |nfp1|
                   (SPADCALL |nfp|
                             (SPADCALL
                              (SPADCALL (SPADCALL |neg_deg| (QREFELT $ 76))
                                        (SPADCALL |ak| |x| (QREFELT $ 64))
                                        (QREFELT $ 67))
                              (QREFELT $ 47))
                             (QREFELT $ 48)))
             (EXIT
              (LETT |inv_den1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 274)
                               (SPADCALL |mm| (QREFELT $ 49)) (QREFELT $ 52))
                     |k| (QREFELT $ 62)))))))
          (LETT |res2| (|RDEEFX;do_spde1| |rr1| |nfp1| |k| |derivation| $))
          (LETT |a1p| (SPADCALL |inv_den1| (QVELT |res2| 0) (QREFELT $ 67)))
          (EXIT
           (COND
            ((QVELT |res2| 2)
             (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 75)) |g| |ansp| 'T))
            (#9#
             (SEQ (LETT |rr1f| (QVELT |res2| 1))
                  (LETT |vs|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45)))
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 45)))
                  (SEQ (LETT |i| 1) (LETT #3# (LENGTH |scoeffs|))
                       (LETT |scoeff| NIL) (LETT #2# |scoeffs|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |scoeff| (CAR #2#)) NIL)
                             (|greater_SI| |i| #3#))
                         (GO G191)))
                       (SEQ
                        (LETT |res2|
                              (|RDEEFX;do_spde1| |scoeff| |nfp1| |k|
                               |derivation| $))
                        (SPADCALL |as| |i|
                                  (SPADCALL |inv_den1| (QVELT |res2| 0)
                                            (QREFELT $ 67))
                                  (QREFELT $ 275))
                        (EXIT
                         (SPADCALL |vs| |i| (QVELT |res2| 1) (QREFELT $ 275))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res3|
                        (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs|
                         |as| |scands| (|spadConstant| $ 110) |gexp| |k| |x|
                         $))
                  (COND
                   ((NULL (QVELT |res3| 3))
                    (EXIT
                     (COND
                      ((SPADCALL |neg_deg| 0 (QREFELT $ 42))
                       (VECTOR |a1| |r1| |ansp| NIL))
                      (#9#
                       (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 75))
                               (SPADCALL |g| |rr1f| (QREFELT $ 79)) |ansp|
                               NIL))))))
                  (EXIT
                   (VECTOR (SPADCALL |a1| (QVELT |res3| 0) (QREFELT $ 75)) |g|
                           (SPADCALL |ansp| (QVELT |res3| 2) (QREFELT $ 75))
                           'T))))))))) 

(SDEFUN |RDEEFX;mk_pow1| ((|u| F) (|i| |Integer|) ($ F))
        (SPADCALL |u| |i| (QREFELT $ 81))) 

(SDEFUN |RDEEFX;mk_pow|
        ((|uu| F) (|ulst| |List| F) (|v| |Vector| (|Integer|)) ($ F))
        (SPROG
         ((|res2| (F)) (|lp| (|List| F)) (#1=#:G880 NIL) (|ui| NIL) (|i| NIL)
          (#2=#:G879 NIL) (|res| (F)))
         (SEQ
          (LETT |res|
                (|RDEEFX;mk_pow1| |uu| (SPADCALL |v| 1 (QREFELT $ 118)) $))
          (LETT |lp|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 2) (LETT |ui| NIL) (LETT #1# |ulst|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ui| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|RDEEFX;mk_pow1| |ui|
                                (SPADCALL |v| |i| (QREFELT $ 118)) $)
                               #2#))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT (NREVERSE #2#)))))
          (LETT |res2|
                (SPADCALL (ELT $ 67) |lp| (|spadConstant| $ 33)
                          (QREFELT $ 78)))
          (EXIT (SPADCALL |res| |res2| (QREFELT $ 67)))))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|g| F)
         (|ansp| F)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|as| (|Vector| F)) (|vc| #1=(|Vector| F)) (#2=#:G1013 NIL)
          (|ci| NIL) (#3=#:G1012 NIL)
          (|cndl|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|rr| (|Integer|)) (|ii| (|Integer|)) (#4=#:G1011 NIL)
          (|cil| (|List| (|List| F)))
          (|cis| (|Union| (|List| (|List| F)) "failed")) (|u1| (F)) (|u0| (F))
          (|uu| (F)) (|solb1| (|Vector| (|Integer|))) (|f| (F))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|cands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|nn| (|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|rcu| (|Union| (|Integer|) #5="failed")) (#6=#:G998 NIL)
          (|sol0| (|Vector| (|Integer|))) (#7=#:G965 NIL)
          (|sol_rec|
           (|Record|
            (|:| |particular| (|Union| (|Vector| (|Integer|)) #8="failed"))
            (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (|v2| #9=(|Vector| (|Integer|))) (|m2| #10=(|Matrix| (|Integer|)))
          (|#G331| (|Record| (|:| |mat| #10#) (|:| |vec| #9#))) (|v1| #1#)
          (|m1| (|Matrix| F)) (#11=#:G1010 NIL) (|v| NIL) (#12=#:G1009 NIL)
          (|lv| (|List| F)) (|c2| (F)) (|c1| (F)) (|c0| (F)) (|r4| (F))
          (|ulst1| (|List| F)) (|vlst1| (|List| F)) (#13=#:G1007 NIL)
          (#14=#:G1008 NIL) (|u| NIL) (|phi| (F)) (|piv| (F)) (|kf| (F))
          (|unG| (R)) (G (F))
          (|G_num| #15=(|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|G_den| #15#)
          (|fl2| (|List| #16=(|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#17=#:G1006 NIL) (|fac| NIL) (#18=#:G1005 NIL) (|fl1| (|List| #16#))
          (#19=#:G903 NIL) (#20=#:G1004 NIL) (#21=#:G1003 NIL)
          (|uv0|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu0|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|l_pifp| (F)) (|pif| (F))
          (|pip| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#22=#:G1002 NIL) (#23=#:G1001 NIL) (#24=#:G1000 NIL)
          (#25=#:G999 NIL)
          (|f_numr|
           #26=(|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|f_denr| #26#) (|t| (F)) (|s| (F)) (|r| (F)) (|r1| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|res2|
           (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) #5#)))
         (SEQ
          (EXIT
           (SEQ (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 267)))
                (EXIT
                 (COND ((QEQCAR |spec1u| 1) (|error| "impossible 10"))
                       (#27='T
                        (SEQ (LETT |spec1p| (QCDR |spec1u|))
                             (LETT |res2|
                                   (SPADCALL |nfp| |spec1p| |derivation|
                                             (QREFELT $ 271)))
                             (LETT |a1|
                                   (SPADCALL |a1|
                                             (SPADCALL
                                              (SPADCALL (QCAR |res2|)
                                                        (QREFELT $ 49))
                                              |k| (QREFELT $ 62))
                                             (QREFELT $ 75)))
                             (LETT |spec1p| (QCDR |res2|))
                             (EXIT
                              (COND
                               ((SPADCALL |spec1p| (|spadConstant| $ 104)
                                          (QREFELT $ 113))
                                (PROGN
                                 (LETT #6# (VECTOR |a1| |g| |ansp| 'T))
                                 (GO #28=#:G997)))
                               ((>= (SPADCALL |spec1p| (QREFELT $ 41))
                                    (SPADCALL |nfp| (QREFELT $ 41)))
                                (|error| "impossible 8"))
                               (#27#
                                (SEQ
                                 (LETT |r1|
                                       (SPADCALL |g|
                                                 (SPADCALL
                                                  (SPADCALL |spec1p|
                                                            (QREFELT $ 49))
                                                  |k| (QREFELT $ 62))
                                                 (QREFELT $ 79)))
                                 (LETT |r| (SPADCALL |nf| (QREFELT $ 105)))
                                 (LETT |s| (SPADCALL |nf| 1 (QREFELT $ 43)))
                                 (LETT |t| (SPADCALL |nf| 0 (QREFELT $ 43)))
                                 (LETT |f_denr|
                                       (SPADCALL (SPADCALL |r| (QREFELT $ 276))
                                                 (QREFELT $ 279)))
                                 (LETT |f_numr|
                                       (SPADCALL (SPADCALL |r| (QREFELT $ 180))
                                                 (QREFELT $ 279)))
                                 (LETT |fl1|
                                       (PROGN
                                        (LETT #25# NIL)
                                        (SEQ (LETT |fac| NIL)
                                             (LETT #24#
                                                   (SPADCALL |f_denr|
                                                             (QREFELT $ 282)))
                                             G190
                                             (COND
                                              ((OR (ATOM #24#)
                                                   (PROGN
                                                    (LETT |fac| (CAR #24#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((ODDP (QVELT |fac| 2))
                                                 (LETT #25#
                                                       (CONS (QVELT |fac| 1)
                                                             #25#))))))
                                             (LETT #24# (CDR #24#)) (GO G190)
                                             G191 (EXIT (NREVERSE #25#)))))
                                 (LETT |fl2|
                                       (PROGN
                                        (LETT #23# NIL)
                                        (SEQ (LETT |fac| NIL)
                                             (LETT #22#
                                                   (SPADCALL |f_numr|
                                                             (QREFELT $ 282)))
                                             G190
                                             (COND
                                              ((OR (ATOM #22#)
                                                   (PROGN
                                                    (LETT |fac| (CAR #22#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((ODDP (QVELT |fac| 2))
                                                 (LETT #23#
                                                       (CONS (QVELT |fac| 1)
                                                             #23#))))))
                                             (LETT #22# (CDR #22#)) (GO G190)
                                             G191 (EXIT (NREVERSE #23#)))))
                                 (LETT |pip|
                                       (SPADCALL
                                        (SPADCALL (ELT $ 284) |fl1|
                                                  (|spadConstant| $ 137)
                                                  (QREFELT $ 287))
                                        (SPADCALL (ELT $ 284) |fl2|
                                                  (|spadConstant| $ 137)
                                                  (QREFELT $ 287))
                                        (QREFELT $ 284)))
                                 (LETT |pif| (SPADCALL |pip| (QREFELT $ 181)))
                                 (LETT |l_pifp|
                                       (SPADCALL
                                        (SPADCALL |pif| |x| (QREFELT $ 64))
                                        |pif| (QREFELT $ 69)))
                                 (LETT |uvu0|
                                       (|RDEEFX;get_uv| |l_pifp| |vlst| |ulst|
                                        |k| |x| $))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |uvu0| 1)
                                    (VECTOR |a1| |r1| |ansp| NIL))
                                   (#27#
                                    (SEQ (LETT |uv0| (QCDR |uvu0|))
                                         (LETT |fl1|
                                               (PROGN
                                                (LETT #21# NIL)
                                                (SEQ (LETT |fac| NIL)
                                                     (LETT #20#
                                                           (SPADCALL |f_denr|
                                                                     (QREFELT $
                                                                              282)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #20#)
                                                           (PROGN
                                                            (LETT |fac|
                                                                  (CAR #20#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #21#
                                                             (CONS
                                                              (SPADCALL
                                                               (QVELT |fac| 1)
                                                               (PROG1
                                                                   (LETT #19#
                                                                         (QUOTIENT2
                                                                          (-
                                                                           (QVELT
                                                                            |fac|
                                                                            2)
                                                                           1)
                                                                          2))
                                                                 (|check_subtype2|
                                                                  (>= #19# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #19#))
                                                               (QREFELT $ 289))
                                                              #21#))))
                                                     (LETT #20# (CDR #20#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #21#)))))
                                         (LETT |fl2|
                                               (PROGN
                                                (LETT #18# NIL)
                                                (SEQ (LETT |fac| NIL)
                                                     (LETT #17#
                                                           (SPADCALL |f_numr|
                                                                     (QREFELT $
                                                                              282)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #17#)
                                                           (PROGN
                                                            (LETT |fac|
                                                                  (CAR #17#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #18#
                                                             (CONS
                                                              (SPADCALL
                                                               (QVELT |fac| 1)
                                                               (QUOTIENT2
                                                                (+
                                                                 (QVELT |fac|
                                                                        2)
                                                                 1)
                                                                2)
                                                               (QREFELT $ 289))
                                                              #18#))))
                                                     (LETT #17# (CDR #17#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #18#)))))
                                         (LETT |G_den|
                                               (SPADCALL (ELT $ 284) |fl1|
                                                         (|spadConstant| $ 137)
                                                         (QREFELT $ 287)))
                                         (LETT |G_num|
                                               (SPADCALL (ELT $ 284) |fl2|
                                                         (|spadConstant| $ 137)
                                                         (QREFELT $ 287)))
                                         (LETT G
                                               (SPADCALL
                                                (SPADCALL |G_den|
                                                          (QREFELT $ 181))
                                                (SPADCALL |G_num|
                                                          (QREFELT $ 181))
                                                (QREFELT $ 69)))
                                         (LETT |unG|
                                               (SPADCALL
                                                (SPADCALL |f_numr|
                                                          (QREFELT $ 290))
                                                (QREFELT $ 291)))
                                         (LETT |kf|
                                               (SPADCALL |k| (QREFELT $ 63)))
                                         (LETT |phi|
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |r| |x|
                                                            (QREFELT $ 64))
                                                  (|spadConstant| $ 45)
                                                  (QREFELT $ 133))
                                                 (SEQ
                                                  (LETT |piv|
                                                        (SPADCALL
                                                         (SPADCALL G |x|
                                                                   (QREFELT $
                                                                            64))
                                                         (SPADCALL
                                                          (SPADCALL G |l_pifp|
                                                                    (QREFELT $
                                                                             67))
                                                          (SPADCALL 2
                                                                    (QREFELT $
                                                                             76))
                                                          (QREFELT $ 69))
                                                         (QREFELT $ 79)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL |spec1p| 1
                                                              (QREFELT $ 43))
                                                    |piv| (QREFELT $ 69)))))
                                                (#27#
                                                 (SEQ
                                                  (LETT |piv|
                                                        (SPADCALL
                                                         (SPADCALL G
                                                                   (SPADCALL
                                                                    |kf| |x|
                                                                    (QREFELT $
                                                                             64))
                                                                   (QREFELT $
                                                                            67))
                                                         (SPADCALL
                                                          (SPADCALL |unG|
                                                                    (SPADCALL
                                                                     |s| |x|
                                                                     (QREFELT $
                                                                              64))
                                                                    (QREFELT $
                                                                             292))
                                                          (SPADCALL
                                                           (SPADCALL 2
                                                                     (QREFELT $
                                                                              76))
                                                           G (QREFELT $ 67))
                                                          (QREFELT $ 69))
                                                         (QREFELT $ 75)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL |spec1p| 0
                                                              (QREFELT $ 43))
                                                    |piv| (QREFELT $ 69)))))))
                                         (LETT |vlst1| NIL) (LETT |ulst1| NIL)
                                         (SEQ (LETT |u| NIL) (LETT #14# |ulst|)
                                              (LETT |v| NIL) (LETT #13# |vlst|)
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |v| (CAR #13#))
                                                     NIL)
                                                    (ATOM #14#)
                                                    (PROGN
                                                     (LETT |u| (CAR #14#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |v| |kf|
                                                            (QREFELT $ 133))
                                                  (SEQ
                                                   (LETT |vlst1|
                                                         (CONS |v| |vlst1|))
                                                   (EXIT
                                                    (LETT |ulst1|
                                                          (CONS |u|
                                                                |ulst1|))))))))
                                              (LETT #13#
                                                    (PROG1 (CDR #13#)
                                                      (LETT #14# (CDR #14#))))
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |r4|
                                               (SPADCALL
                                                (SPADCALL 4 (QREFELT $ 76)) |r|
                                                (QREFELT $ 67)))
                                         (LETT |c0|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |s| 2
                                                           (QREFELT $ 293))
                                                 |r4| (QREFELT $ 69))
                                                |t| (QREFELT $ 79)))
                                         (LETT |c1|
                                               (SPADCALL |s| |r4|
                                                         (QREFELT $ 69)))
                                         (LETT |c2|
                                               (SPADCALL (|spadConstant| $ 33)
                                                         |r4| (QREFELT $ 69)))
                                         (LETT |lv|
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |r| |x|
                                                            (QREFELT $ 64))
                                                  (|spadConstant| $ 45)
                                                  (QREFELT $ 133))
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |c1|
                                                             (QREFELT $ 50))
                                                   (SPADCALL |c2|
                                                             (QREFELT $ 50)))
                                                  |vlst1| (QREFELT $ 294)))
                                                (#27#
                                                 (CONS
                                                  (SPADCALL |c1|
                                                            (QREFELT $ 50))
                                                  |vlst1|))))
                                         (LETT |m1|
                                               (SPADCALL
                                                (LIST
                                                 (PROGN
                                                  (LETT #12# NIL)
                                                  (SEQ (LETT |v| NIL)
                                                       (LETT #11# |lv|) G190
                                                       (COND
                                                        ((OR (ATOM #11#)
                                                             (PROGN
                                                              (LETT |v|
                                                                    (CAR #11#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #12#
                                                               (CONS
                                                                (SPADCALL |v|
                                                                          |x|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                #12#))))
                                                       (LETT #11# (CDR #11#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #12#)))))
                                                (QREFELT $ 296)))
                                         (LETT |v1|
                                               (SPADCALL
                                                (LIST
                                                 (SPADCALL |c0| |x|
                                                           (QREFELT $ 64)))
                                                (QREFELT $ 83)))
                                         (PROGN
                                          (LETT |#G331|
                                                (SPADCALL |m1| |v1|
                                                          (QREFELT $ 300)))
                                          (LETT |m2| (QCAR |#G331|))
                                          (LETT |v2| (QCDR |#G331|))
                                          |#G331|)
                                         (LETT |sol_rec|
                                               (SPADCALL |m2| |v2|
                                                         (QREFELT $ 305)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR (QCAR |sol_rec|) 1)
                                            (VECTOR |a1| |r1| |ansp| NIL))
                                           (#27#
                                            (SEQ
                                             (LETT |sol0|
                                                   (PROG2
                                                       (LETT #7#
                                                             (QCAR |sol_rec|))
                                                       (QCDR #7#)
                                                     (|check_union2|
                                                      (QEQCAR #7# 0)
                                                      (|Vector| (|Integer|))
                                                      (|Union|
                                                       (|Vector| (|Integer|))
                                                       #8#)
                                                      #7#)))
                                             (EXIT
                                              (COND
                                               ((NULL (QCDR |sol_rec|))
                                                (SEQ
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |r| |x|
                                                              (QREFELT $ 64))
                                                    (|spadConstant| $ 45)
                                                    (QREFELT $ 133))
                                                   (COND
                                                    ((SPADCALL
                                                      (EXPT
                                                       (SPADCALL |sol0| 1
                                                                 (QREFELT $
                                                                          118))
                                                       2)
                                                      (SPADCALL |sol0| 2
                                                                (QREFELT $
                                                                         118))
                                                      (QREFELT $ 91))
                                                     (PROGN
                                                      (LETT #6#
                                                            (VECTOR |a1| |r1|
                                                                    |ansp|
                                                                    NIL))
                                                      (GO #28#))))))
                                                 (LETT |rcu|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |sol0| 1
                                                                    (QREFELT $
                                                                             118))
                                                          (QREFELT $ 142))
                                                         (SPADCALL 2
                                                                   (QREFELT $
                                                                            142))
                                                         (QREFELT $ 306))
                                                        (QREFELT $ 193)))
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |rcu| 1)
                                                    (VECTOR |a1| |r1| |ansp|
                                                            NIL))
                                                   (#27#
                                                    (SEQ
                                                     (LETT |ri| (QCDR |rcu|))
                                                     (LETT |nn|
                                                           (SPADCALL |nf|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |ri|
                                                                       (QREFELT
                                                                        $ 76))
                                                                      1
                                                                      (QREFELT
                                                                       $ 46))
                                                                     (QREFELT $
                                                                              51)))
                                                     (LETT |cands|
                                                           (|RDEEFX;gammas1|
                                                            |nn| (QCDR |rcu|)
                                                            (|spadConstant| $
                                                                            110)
                                                            (|spadConstant| $
                                                                            110)
                                                            0 1 |vlst| |ulst|
                                                            |k| |x| NIL $))
                                                     (LETT |derivation3|
                                                           (CONS
                                                            #'|RDEEFX;quadratic_log_erf_integrate!0|
                                                            (VECTOR
                                                             |derivation| $)))
                                                     (LETT |scoeffs|
                                                           (|RDEEFX;get_scoeffs|
                                                            |cands|
                                                            (|spadConstant| $
                                                                            110)
                                                            |k| |derivation3|
                                                            $))
                                                     (LETT |rr1|
                                                           (SPADCALL |spec1p|
                                                                     (QREFELT $
                                                                              49)))
                                                     (LETT |f|
                                                           (SPADCALL
                                                            (SPADCALL |nf|
                                                                      (QREFELT
                                                                       $ 49))
                                                            |k|
                                                            (QREFELT $ 62)))
                                                     (EXIT
                                                      (|RDEEFX;special_integrate1|
                                                       |nfp| |f| |k| |lk| |x|
                                                       |rr1| |a1| |r1| |g|
                                                       |ansp| |scoeffs| |cands|
                                                       0 |derivation| $))))))))
                                               (#27#
                                                (SEQ
                                                 (LETT |solb1|
                                                       (|SPADfirst|
                                                        (QCDR |sol_rec|)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |r| |x|
                                                               (QREFELT $ 64))
                                                     (|spadConstant| $ 45)
                                                     (QREFELT $ 80))
                                                    (COND
                                                     ((SPADCALL
                                                       (LENGTH
                                                        (QCDR |sol_rec|))
                                                       1 (QREFELT $ 22))
                                                      (|error|
                                                       "impossible 11"))
                                                     (#27#
                                                      (SEQ
                                                       (LETT |uu|
                                                             (|SPADfirst|
                                                              (SPADCALL |k|
                                                                        (QREFELT
                                                                         $
                                                                         28))))
                                                       (LETT |u0|
                                                             (|RDEEFX;mk_pow|
                                                              |uu| |ulst1|
                                                              |sol0| $))
                                                       (LETT |u1|
                                                             (|RDEEFX;mk_pow|
                                                              |uu| |ulst1|
                                                              |solb1| $))
                                                       (LETT |cis|
                                                             (SPADCALL
                                                              (SPADCALL |phi|
                                                                        |u0|
                                                                        (QREFELT
                                                                         $ 69))
                                                              |u1| |x|
                                                              (QREFELT $ 309)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |cis| 1)
                                                          (VECTOR |a1| |r1|
                                                                  |ansp| NIL))
                                                         (#27#
                                                          (SEQ
                                                           (LETT |cil|
                                                                 (QCDR |cis|))
                                                           (LETT |cndl| NIL)
                                                           (SEQ (LETT |ci| NIL)
                                                                (LETT #4#
                                                                      |cil|)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #4#)
                                                                   (PROGN
                                                                    (LETT |ci|
                                                                          (CAR
                                                                           #4#))
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |ii|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |ci|
                                                                         (QREFELT
                                                                          $
                                                                          310))
                                                                        (QREFELT
                                                                         $
                                                                         31)))
                                                                 (LETT |rr|
                                                                       (+
                                                                        (SPADCALL
                                                                         |sol0|
                                                                         1
                                                                         (QREFELT
                                                                          $
                                                                          118))
                                                                        (* |ii|
                                                                           (SPADCALL
                                                                            |solb1|
                                                                            1
                                                                            (QREFELT
                                                                             $
                                                                             118)))))
                                                                 (EXIT
                                                                  (LETT |cndl|
                                                                        (|RDEEFX;gammas1|
                                                                         (SPADCALL
                                                                          |nf|
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |rr|
                                                                            (QREFELT
                                                                             $
                                                                             76))
                                                                           1
                                                                           (QREFELT
                                                                            $
                                                                            46))
                                                                          (QREFELT
                                                                           $
                                                                           51))
                                                                         |rr|
                                                                         (|spadConstant|
                                                                          $
                                                                          110)
                                                                         (|spadConstant|
                                                                          $
                                                                          110)
                                                                         0 0
                                                                         |vlst|
                                                                         |ulst|
                                                                         |k|
                                                                         |x|
                                                                         |cndl|
                                                                         $))))
                                                                (LETT #4#
                                                                      (CDR
                                                                       #4#))
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                           (LETT |cndl|
                                                                 (NREVERSE
                                                                  |cndl|))
                                                           (LETT |vc|
                                                                 (SPADCALL
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         NIL)
                                                                   (SEQ
                                                                    (LETT |ci|
                                                                          NIL)
                                                                    (LETT #2#
                                                                          |cil|)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #2#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ci|
                                                                         (CAR
                                                                          #2#))
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #3#
                                                                            (CONS
                                                                             (|SPADfirst|
                                                                              |ci|)
                                                                             #3#))))
                                                                    (LETT #2#
                                                                          (CDR
                                                                           #2#))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #3#))))
                                                                  (QREFELT $
                                                                           83)))
                                                           (LETT |as|
                                                                 (MAKEARR1
                                                                  (LENGTH
                                                                   |cil|)
                                                                  (|spadConstant|
                                                                   $ 45)))
                                                           (EXIT
                                                            (|RDEEFX;finish_special_integrate2|
                                                             |r1| |vc| |a1|
                                                             |as| |cndl|
                                                             (|spadConstant| $
                                                                             110)
                                                             0 |k| $))))))))))
                                                   ((OR
                                                     (EQL
                                                      (LENGTH (QCDR |sol_rec|))
                                                      1)
                                                     (NULL
                                                      (SPADCALL
                                                       (LENGTH
                                                        (QCDR |sol_rec|))
                                                       2 (QREFELT $ 22))))
                                                    (VECTOR |a1| |r1| |ansp|
                                                            NIL))
                                                   ('T
                                                    (|error|
                                                     "impossible 12"))))))))))))))))))))))))))
          #28# (EXIT #6#)))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation|)
          (LETT $ (QREFELT $$ 1))
          (LETT |derivation| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) |derivation|)
                        (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 39))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 40)) |derivation|)
                        (QREFELT $ 99))
              (QREFELT $ 48))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 40))
                       (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
             (QREFELT $ 199)))))) 

(SDEFUN |RDEEFX;decompose1|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|eidens| |List| (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|f1| (|SparseUnivariatePolynomial| F)) (#1=#:G1017 NIL))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT $ 99) |eidens|
                                              (QREFELT $ 311))
                                    (QREFELT $ 109)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   "failed")
                                  #1#)))
          (COND
           ((SPADCALL |f1| (|spadConstant| $ 110) (QREFELT $ 111))
            (LETT |eidens| (CONS |f1| |eidens|))))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT $ 313)))
          (EXIT
           (COND
            ((SPADCALL |f1| (|spadConstant| $ 110) (QREFELT $ 111))
             (CDR |res|))
            ('T |res|)))))) 

(SDEFUN |RDEEFX;get_trace|
        ((|fu| |Fraction| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|rf1k| |Kernel| F) (|cfac| |SparseUnivariatePolynomial| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|resd| (F)) (|fa| (|SparseUnivariatePolynomial| F)) (|f| (F))
          (|Sae|
           (|Join| (|MonogenicAlgebra| F (|SparseUnivariatePolynomial| F))
                   (CATEGORY |package|
                    (IF (|has| F (|Field|))
                        (IF (|has| F (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)))))
         (SEQ
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            |cfac|))
          (LETT |f| (SPADCALL |fu| |k| (QREFELT $ 62)))
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT $ 314)))
          (LETT |resd|
                (SPADCALL
                 (SPADCALL |fa|
                           (|compiledLookupCheck| '|reduce|
                                                  (LIST '$
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT $ 7))))
                                                  |Sae|))
                 (|compiledLookupCheck| '|trace|
                                        (LIST (|devaluate| (ELT $ 7)) '$)
                                        |Sae|)))
          (EXIT (SPADCALL |resd| |k| (QREFELT $ 36)))))) 

(SDEFUN |RDEEFX;solve_factor1|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|einum| |SparseUnivariatePolynomial| F)
         (|bpol| |SparseUnivariatePolynomial| F)
         (|er| |Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F)) (|:| |u_part| F)
          (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|poly_cor_rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F)) (#2=#:G1054 NIL) (|zz| NIL)
          (|zzl| (|List| F)) (|ansp1| (F)) (|c| (F))
          (|cu1| (|Union| F "failed")) (|cp| (|SparseUnivariatePolynomial| F))
          (|cu| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| F))
          (|lnum1| #4=(|SparseUnivariatePolynomial| F))
          (|reml| (|List| (|SparseUnivariatePolynomial| F))) (|lnum0| #4#)
          (|coeff1_rs| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|auxl| (|List| (|SparseUnivariatePolynomial| F)))
          (|denf1| (|SparseUnivariatePolynomial| F)) (#5=#:G1029 NIL)
          (|spec_den| (|SparseUnivariatePolynomial| F))
          (|min_deg| (|NonNegativeInteger|))
          (|dvr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| #4#)))
          (|coeff1_r| #6=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coeff1| (|SparseUnivariatePolynomial| F))
          (|numfp1| #7=(|SparseUnivariatePolynomial| F)) (|ei_arg| #6#)
          (|eiarg_num| #7#) (|rf1k| (|Kernel| F)) (|rfc| (F)) (|vshift| (F))
          (|u_exp| (|Integer|)) (|u0| (F))
          (|cfac| (|SparseUnivariatePolynomial| F)) (|v0| (F))
          (|r0| (|Integer|)) (|eiden| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |eiden| (QVELT |er| 0)) (LETT |r0| (QVELT |er| 1))
              (LETT |v0| (QVELT |er| 2)) (LETT |cfac| (QVELT |er| 3))
              (LETT |u0| (QVELT |er| 4)) (LETT |u_exp| (QVELT |er| 5))
              (LETT |vshift| (QVELT |er| 6)) (LETT |rfc| (|spadConstant| $ 45))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 242)))
                     (EXIT (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 315)))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                           (QREFELT $ 46))
                                 (SPADCALL |v0| (QREFELT $ 47)) (QREFELT $ 51))
                                (SPADCALL |rfc| (QREFELT $ 47)) (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51)))
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 49))
                              (SPADCALL |denf| (QREFELT $ 49)) (QREFELT $ 52)))
              (LETT |numfp1|
                    (SPADCALL |nfp|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |v0|
                                          (SPADCALL
                                           (SPADCALL |r0| (QREFELT $ 76))
                                           (SPADCALL |k| (QREFELT $ 63))
                                           (QREFELT $ 67))
                                          (QREFELT $ 75))
                                |x| (QREFELT $ 64))
                               |denfp| (QREFELT $ 138))
                              (QREFELT $ 51)))
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 99)) |u0|
                              (QREFELT $ 209)))
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                        (QREFELT $ 49))
                       |u_exp| (QREFELT $ 316))
                      (SPADCALL |coeff1| (QREFELT $ 49)) (QREFELT $ 317))
                     (SPADCALL |eiarg_num| (QREFELT $ 49)) (QREFELT $ 52)))
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 40)))
              (LETT |coeff1_rs| (|spadConstant| $ 200))
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 39)) |denf1|
                              (QREFELT $ 319)))
              (LETT |lnum1| (QCDR |dvr|))
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 23))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT $ 221)))
                     (EXIT
                      (COND
                       ((SPADCALL |min_deg| 0 (QREFELT $ 22))
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| $ 33) |min_deg|
                                         (QREFELT $ 46)))
                         (LETT |denf1|
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT $ 109)))
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 7))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  #3#)
                                                 #5#)))
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT $ 313)))
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT $ 320)))
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT $ 320))
                                           (QREFELT $ 49))
                                 (SPADCALL |spec_den| (QREFELT $ 49))
                                 (QREFELT $ 52)))))))))))
              (LETT |lnum0| |lnum1|)
              (COND
               ((SPADCALL |bpol| |eiden| (QREFELT $ 111))
                (SEQ
                 (LETT |reml|
                       (|RDEEFX;decompose1| |lnum1| |denf1| (LIST |bpol|) $))
                 (EXIT (LETT |lnum1| (|SPADfirst| |reml|))))))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 192)))
                     (LETT |ddf|
                           (SPADCALL (SPADCALL |eiden| (QREFELT $ 194)) |denf1|
                                     (QREFELT $ 192)))
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 323)))
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#8='T
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)))
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT $ 194))
                                                    (QREFELT $ 99))
                                          |denf1| (QREFELT $ 192)))))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT $ 109)))
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                         (|spadConstant| $ 104) (|spadConstant| $ 200)))
                (#8#
                 (SEQ (LETT |cp| (QCDR |cu|))
                      (LETT |cu1| (SPADCALL |cp| (QREFELT $ 234)))
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                                 (|spadConstant| $ 104)
                                 (|spadConstant| $ 200)))
                        (#8#
                         (SEQ (LETT |c| (QCDR |cu1|))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT $ 324))
                                           (|spadConstant| $ 45)
                                           (QREFELT $ 133))
                                 (VECTOR (|spadConstant| $ 45)
                                         (|spadConstant| $ 200)
                                         (|spadConstant| $ 104)
                                         (|spadConstant| $ 200)))
                                (#8#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT $ 50))
                                                     |rfc| (QREFELT $ 79))
                                                    (QREFELT $ 325))
                                                   (QREFELT $ 67))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT $ 62))
                                          (QREFELT $ 326))
                                         (QREFELT $ 67)))
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| $ 104)
                                                    (QREFELT $ 113))
                                          (LIST (|spadConstant| $ 45)))
                                         (#8#
                                          (SPADCALL |cfac| (QREFELT $ 327)))))
                                  (LETT |ansp| (|spadConstant| $ 45))
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 104)
                                              (QREFELT $ 113))
                                    (LETT |ansp| |ansp1|))
                                   (#8#
                                    (SEQ (LETT |zz| NIL) (LETT #2# |zzl|) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |zz| (CAR #2#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |ansp|
                                                 (SPADCALL |ansp|
                                                           (SPADCALL |ansp1|
                                                                     |rf1k|
                                                                     |zz|
                                                                     (QREFELT $
                                                                              70))
                                                           (QREFELT $ 75)))))
                                         (LETT #2# (CDR #2#)) (GO G190) G191
                                         (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |denf1|
                                                             (QREFELT $ 49))
                                                   (QREFELT $ 52))
                                                  (QREFELT $ 273)))
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  |coeff1_rs| (QREFELT $ 273)))
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 47))
                                                  (QCAR |dvr|) (QREFELT $ 99)))
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 104)
                                              (QREFELT $ 111))
                                    (SEQ
                                     (LETT |lp_cor|
                                           (|RDEEFX;get_trace| |lp_cor| |k|
                                            |rf1k| |cfac| $))
                                     (LETT |sp_cor|
                                           (|RDEEFX;get_trace| |sp_cor| |k|
                                            |rf1k| |cfac| $))
                                     (LETT |poly_cor_rf|
                                           (|RDEEFX;get_trace|
                                            (SPADCALL |poly_cor|
                                                      (QREFELT $ 49))
                                            |k| |rf1k| |cfac| $))
                                     (EXIT
                                      (LETT |poly_cor|
                                            (SPADCALL |poly_cor_rf|
                                                      (QREFELT $ 328)))))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| |SparseUnivariatePolynomial| F)
         (|p| |SparseUnivariatePolynomial| F) ($ |Integer|))
        (SPROG
         ((|nn| (|Integer|)) (#1=#:G1063 NIL)
          (|nqu| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ (LETT |nn| 0)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |nqu| (SPADCALL |q| |p| (QREFELT $ 109)))
                          (EXIT
                           (COND
                            ((QEQCAR |nqu| 1)
                             (PROGN (LETT #1# |$NoValue|) (GO #2=#:G1060)))
                            ('T
                             (SEQ (LETT |q| (QCDR |nqu|))
                                  (EXIT (LETT |nn| (+ |nn| 1))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |nn|)))) 

(SDEFUN |RDEEFX;solve_linear_factor|
        ((|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|einum| |SparseUnivariatePolynomial| F)
         (|er| |Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F)) (|:| |u_part| F)
          (|:| |exponent| (|Integer|)) (|:| |shift_part| F)
          (|:| |has_part2?| (|Boolean|)) (|:| |ratpart2| (|Integer|))
          (|:| |v_part2| F) (|:| |u_part2| F) (|:| |shift_part2| F))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|dvr2|
           #1=(|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                        (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|ansp| (F)) (#2=#:G1094 NIL) (|zz| NIL)
          (|lp_cor| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|eiargp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coefi| (F)) (|ansp1| (F)) (|shifti| (F)) (|eiargi| (F))
          (|eiargi_r| #3=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ci| (F)) (|nn| (|Integer|))
          (|einumi| (|SparseUnivariatePolynomial| F)) (|ki| (|Integer|))
          (|kif| (F)) (#4=#:G1093 NIL) (|ck| NIL) (|zzl| (|List| F))
          (|eiarg_inc| (|SparseUnivariatePolynomial| F))
          (|res1| (|List| (|List| F)))
          (|res1u| (|Union| (|List| (|List| F)) "failed")) (|u1| (F))
          (|einum1| (F)) (|lnum1| (F))
          (|reml| (|List| (|SparseUnivariatePolynomial| F)))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| F)) (|dvr| #1#)
          (|denf1| (|SparseUnivariatePolynomial| F)) (|coeff1_r| #3#)
          (|coeff1| (|SparseUnivariatePolynomial| F))
          (|numfp1| #5=(|SparseUnivariatePolynomial| F)) (|nn0| (|Integer|))
          (|fac1| (|SparseUnivariatePolynomial| F)) (|eiarg_num| #5#)
          (|lc0| (F)) (|u0| (F)) (|v0| (F)) (|r0| (|Integer|))
          (|rf1k| (|Kernel| F)) (|rfc| (F))
          (|cfac| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |cfac| (QVELT |er| 3)) (LETT |rfc| (|spadConstant| $ 45))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 242)))
                     (EXIT (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 315)))))))
              (LETT |r0| (QVELT |er| 1)) (LETT |v0| (QVELT |er| 2))
              (LETT |u0| (QVELT |er| 4))
              (LETT |lc0|
                    (SPADCALL (SPADCALL |nf| (QREFELT $ 105))
                              (SPADCALL |r0| (QREFELT $ 76)) (QREFELT $ 75)))
              (COND
               ((OR (SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 91))
                    (SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 111)))
                (COND
                 ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                  (EXIT (|error| "cfac ~= 0 in nonlinear case"))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |r0| (QREFELT $ 76)) 1
                                          (QREFELT $ 46))
                                (SPADCALL
                                 (SPADCALL |v0|
                                           (SPADCALL |lc0| |rfc|
                                                     (QREFELT $ 67))
                                           (QREFELT $ 75))
                                 (QREFELT $ 47))
                                (QREFELT $ 51))
                               |denf| (QREFELT $ 99))
                              (QREFELT $ 51)))
              (LETT |fac1| (QVELT |er| 0))
              (LETT |nn0|
                    (COND
                     ((SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 41)) 1
                                (QREFELT $ 22))
                      (|RDEEFX;p_power_in_q| |eiarg_num| |fac1| $))
                     (#6='T 1)))
              (EXIT
               (COND
                ((EQL |nn0| 0)
                 (|error|
                  "impossible, eiarg_num is not divisible by its factor"))
                (#6#
                 (SEQ
                  (LETT |numfp1|
                        (SPADCALL |nfp|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |v0|
                                              (SPADCALL
                                               (SPADCALL |r0| (QREFELT $ 76))
                                               (SPADCALL |k| (QREFELT $ 63))
                                               (QREFELT $ 67))
                                              (QREFELT $ 75))
                                    |x| (QREFELT $ 64))
                                   |denfp| (QREFELT $ 138))
                                  (QREFELT $ 51)))
                  (LETT |coeff1|
                        (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 99))
                                  |u0| (QREFELT $ 209)))
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT $ 49))
                                  (SPADCALL |eiarg_num| (QREFELT $ 49))
                                  (QREFELT $ 52)))
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 40)))
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 39)) |denf1|
                                  (QREFELT $ 319)))
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                    (SEQ
                     (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 192)))
                     (LETT |ddf|
                           (SPADCALL (SPADCALL (QVELT |er| 0) (QREFELT $ 194))
                                     |denf1| (QREFELT $ 192)))
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 323)))
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#6#
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)))
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT $ 194))
                                                    (QREFELT $ 99))
                                          |denf1| (QREFELT $ 192)))))))))))
                  (LETT |lnum1|
                        (COND
                         ((SPADCALL (SPADCALL |fac1| (QREFELT $ 41)) 1
                                    (QREFELT $ 22))
                          (SPADCALL (QCDR |dvr|) (QREFELT $ 205)))
                         (#6#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) $))
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|)
                                      (QREFELT $ 205)))))))
                  (LETT |einum1| (SPADCALL |einum| (QREFELT $ 205)))
                  (LETT |u1| (QVELT |er| 10))
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT $ 69))
                                  |u1| |x| (QREFELT $ 309)))
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                             (|spadConstant| $ 104) (|spadConstant| $ 200)))
                    (#6#
                     (SEQ (LETT |res1| (QCDR |res1u|))
                          (LETT |ansp1| (|spadConstant| $ 45))
                          (LETT |lp_cor| (|spadConstant| $ 200))
                          (LETT |eiarg_inc|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |er| 8) (QREFELT $ 76)) 1
                                   (QREFELT $ 46))
                                  (SPADCALL (QVELT |er| 9) (QREFELT $ 47))
                                  (QREFELT $ 51))
                                 |denf| (QREFELT $ 99)))
                          (LETT |zzl|
                                (COND
                                 ((SPADCALL |cfac| (|spadConstant| $ 104)
                                            (QREFELT $ 113))
                                  (LIST (|spadConstant| $ 45)))
                                 (#6# (SPADCALL |cfac| (QREFELT $ 327)))))
                          (SEQ (LETT |ck| NIL) (LETT #4# |res1|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ck| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT $ 30)))
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT $ 30)))
                                (LETT |ki| (SPADCALL |kif| (QREFELT $ 31)))
                                (LETT |einumi|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                                  (QREFELT $ 113))
                                        (SPADCALL |eiarg_num|
                                                  (SPADCALL |kif| |eiarg_inc|
                                                            (QREFELT $ 138))
                                                  (QREFELT $ 51)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 75))
                                          |lc0| (QREFELT $ 69))
                                         |eiarg_num| (QREFELT $ 138)))))
                                (LETT |nn|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |einumi| (QREFELT $ 41)) 1
                                         (QREFELT $ 22))
                                        (|RDEEFX;p_power_in_q| |einumi| |fac1|
                                         $))
                                       ('T 1)))
                                (COND
                                 ((EQL |nn| 0)
                                  (|error|
                                   "impossible, einumi not divisible by its factor")))
                                (LETT |ci|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nn0| (QREFELT $ 76)) |ci|
                                        (QREFELT $ 67))
                                       (SPADCALL |nn| (QREFELT $ 76))
                                       (QREFELT $ 69)))
                                (LETT |eiargi_r|
                                      (SPADCALL
                                       (SPADCALL |einumi| (QREFELT $ 49))
                                       (SPADCALL |denf| (QREFELT $ 49))
                                       (QREFELT $ 52)))
                                (LETT |eiargi|
                                      (SPADCALL |eiargi_r| |k| (QREFELT $ 62)))
                                (LETT |shifti|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                                  (QREFELT $ 113))
                                        (SPADCALL (QVELT |er| 6)
                                                  (SPADCALL |kif|
                                                            (QVELT |er| 11)
                                                            (QREFELT $ 67))
                                                  (QREFELT $ 75)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 75))
                                          |lc0| (QREFELT $ 69))
                                         (SPADCALL (QVELT |er| 6)
                                                   (SPADCALL |lc0| |rfc|
                                                             (QREFELT $ 67))
                                                   (QREFELT $ 75))
                                         (QREFELT $ 67)))))
                                (LETT |ansp1|
                                      (SPADCALL |ansp1|
                                                (SPADCALL
                                                 (SPADCALL |ci|
                                                           (SPADCALL
                                                            (SPADCALL |shifti|
                                                                      (QREFELT
                                                                       $ 50))
                                                            (QREFELT $ 325))
                                                           (QREFELT $ 67))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT $ 326))
                                                 (QREFELT $ 67))
                                                (QREFELT $ 75)))
                                (LETT |coefi|
                                      (SPADCALL
                                       (SPADCALL |ci| |u0| (QREFELT $ 67))
                                       (SPADCALL |u1| |ki| (QREFELT $ 81))
                                       (QREFELT $ 67)))
                                (LETT |eiargp|
                                      (SPADCALL |denfp|
                                                (SPADCALL
                                                 (SPADCALL |eiargi| |x|
                                                           (QREFELT $ 64))
                                                 |k| (QREFELT $ 36))
                                                (QREFELT $ 273)))
                                (EXIT
                                 (LETT |lp_cor|
                                       (SPADCALL |lp_cor|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |coefi|
                                                              (QREFELT $ 47))
                                                    (QREFELT $ 49))
                                                   |eiargp| (QREFELT $ 317))
                                                  |eiargi_r| (QREFELT $ 52))
                                                 (QREFELT $ 329)))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (LETT |ansp| (|spadConstant| $ 45))
                          (COND
                           ((SPADCALL |cfac| (|spadConstant| $ 104)
                                      (QREFELT $ 113))
                            (LETT |ansp| |ansp1|))
                           (#6#
                            (SEQ
                             (LETT |lp_cor|
                                   (|RDEEFX;get_trace| |lp_cor| |k| |rf1k|
                                    |cfac| $))
                             (EXIT
                              (SEQ (LETT |zz| NIL) (LETT #2# |zzl|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |zz| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ansp|
                                           (SPADCALL |ansp|
                                                     (SPADCALL |ansp1| |rf1k|
                                                               |zz|
                                                               (QREFELT $ 70))
                                                     (QREFELT $ 75)))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT $ 39))
                                          (SPADCALL |lp_cor| (QREFELT $ 40))
                                          (QREFELT $ 319)))
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT $ 49))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT $ 40))
                                     (QREFELT $ 49))
                                    (QREFELT $ 52))
                                   (QCAR |dvr2|)
                                   (|spadConstant| $ 200)))))))))))))) 

(SDEFUN |RDEEFX;linear_log_case|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#2=#:G1104 NIL) (|einum| NIL) (#3=#:G1105 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G1103 NIL)
          (#5=#:G1102 NIL)
          (|al|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F)))))
         (SEQ
          (LETT |al| (|RDEEFX;lin_args| |den| |nf| |k| |vlst| |ulst| |x| $))
          (EXIT
           (COND
            ((NULL |al|)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                     (|spadConstant| $ 104) (|spadConstant| $ 200)))
            ('T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |er| NIL) (LETT #4# |al|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |er| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS (QVELT |er| 0) #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $))
              (LETT |ansp| (|spadConstant| $ 45))
              (LETT |lp_cor| (|spadConstant| $ 200))
              (LETT |sp_cor| (|spadConstant| $ 200))
              (LETT |poly_cor| (|spadConstant| $ 104))
              (SEQ (LETT |er| NIL) (LETT #3# |al|) (LETT |einum| NIL)
                   (LETT #2# |einums|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |einum| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |er| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ar1|
                          (COND
                           ((QVELT |er| 7)
                            (|RDEEFX;solve_linear_factor| |nf|
                             (|spadConstant| $ 110) |nfp|
                             (|spadConstant| $ 110) |k| |x| |einum| |er| $))
                           ('T
                            (|RDEEFX;solve_factor1| |nf| (|spadConstant| $ 110)
                             |nfp| (|spadConstant| $ 110) |k| |x| |einum|
                             (QVELT |er| 0)
                             (VECTOR (QVELT |er| 0) (QVELT |er| 1)
                                     (QVELT |er| 2) (QVELT |er| 3)
                                     (QVELT |er| 4) (QVELT |er| 5)
                                     (QVELT |er| 6))
                             $))))
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75)))
                    (LETT |lp_cor|
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT $ 329)))
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT $ 329)))
                    (EXIT
                     (LETT |poly_cor|
                           (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                     (QREFELT $ 51)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))) 

(SDEFUN |RDEEFX;handle_nonlinear_log|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|vlst| |List| F) (|ulst| |List| F)
         (|lei| |List|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (|dbasis| |Vector| (|SparseUnivariatePolynomial| F))
         (|dtrans| |Matrix| (|Integer|))
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|er2|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                     (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                     (|:| |u_part2| F) (|:| |shift_part2| F)))
          (|u1| (F))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|v1| (F)) (|v0| (F)) (|r1| (|Integer|)) (|ril| (|List| (|Integer|)))
          (#1=#:G1134 NIL) (|er| NIL) (#2=#:G1133 NIL) (|r0| (|Integer|))
          (|er1|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (#3=#:G1131 NIL) (|j| NIL) (#4=#:G1132 NIL)
          (|bpol| (|SparseUnivariatePolynomial| F))
          (|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #5=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #5#) (|ansp| (F)) (#6=#:G1128 NIL) (|einum| NIL)
          (#7=#:G1129 NIL) (#8=#:G1130 NIL)
          (|bpols| (|List| (|SparseUnivariatePolynomial| F)))
          (|j0| (|NonNegativeInteger|)) (#9=#:G1125 NIL) (|esum| (|Integer|))
          (#10=#:G1127 NIL) (#11=#:G1126 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lei|)) (LETT |m| (QVSIZE |dbasis|))
              (LETT |bpols| NIL) (LETT |lei1| NIL)
              (SEQ (LETT |i| 1) (LETT #11# |m|) G190
                   (COND ((|greater_SI| |i| #11#) (GO G191)))
                   (SEQ (LETT |esum| 0)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1) (LETT #10# |n|) G190
                               (COND ((|greater_SI| |j| #10#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (SPADCALL |dtrans| |i| |j| (QREFELT $ 330))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1))
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #9# |$NoValue|)
                                            (GO #12=#:G1109)))
                                          ('T (LETT |j0| |j|)))))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL)))
                         #12# (EXIT #9#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT $ 332))
                                        |bpols|))
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT $ 335))
                                         |lei1|))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| $ 45))
              (LETT |lp_cor| (|spadConstant| $ 200))
              (LETT |sp_cor| (|spadConstant| $ 200))
              (LETT |poly_cor| (|spadConstant| $ 104))
              (COND
               ((NULL (NULL |bpols|))
                (EXIT
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |bpols| $))
                  (SEQ (LETT |er| NIL) (LETT #8# |lei1|) (LETT |bpol| NIL)
                       (LETT #7# |bpols|) (LETT |einum| NIL)
                       (LETT #6# |einums|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |einum| (CAR #6#)) NIL)
                             (ATOM #7#) (PROGN (LETT |bpol| (CAR #7#)) NIL)
                             (ATOM #8#) (PROGN (LETT |er| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| |bpol| |er| $))
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75)))
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 329)))
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 329)))
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 51)))))
                       (LETT #6#
                             (PROG1 (CDR #6#)
                               (LETT #7#
                                     (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT $ 332)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |bpol| (QREFELT $ 41)) 1 (QREFELT $ 235))
                 (|error| "degree(bpol) ~= 1"))
                (#13='T
                 (SEQ
                  (SEQ (LETT |er| NIL) (LETT #4# |lei|) (LETT |j| 1)
                       (LETT #3# |n|) G190
                       (COND
                        ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                             (PROGN (LETT |er| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT $ 330)) 1)
                           (LETT |lei1| (CONS |er| |lei1|))))))
                       (LETT |j| (PROG1 (|inc_SI| |j|) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |er1| (|SPADfirst| |lei1|)) (LETT |r0| (QVELT |er1| 1))
                  (LETT |lei| (CDR |lei1|))
                  (LETT |ril|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |er| NIL) (LETT #1# |lei|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |er| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2# (CONS (- (QVELT |er| 1) |r0|) #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (LETT |r1| (SPADCALL |ril| (QREFELT $ 117)))
                  (LETT |v0| (QVELT |er1| 2))
                  (LETT |v1|
                        (SPADCALL (QVELT (|SPADfirst| |lei|) 2) |v0|
                                  (QREFELT $ 79)))
                  (LETT |v1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |r1| (QREFELT $ 76))
                                   (SPADCALL
                                    (- (QVELT (|SPADfirst| |lei|) 1) |r0|)
                                    (QREFELT $ 76))
                                   (QREFELT $ 69))
                         |v1| (QREFELT $ 67)))
                  (LETT |uvu| (|RDEEFX;get_uv| |v1| |vlst| |ulst| |k| |x| $))
                  (EXIT
                   (COND
                    ((QEQCAR |uvu| 1) (|error| "impossible, get_uv failed"))
                    (#13#
                     (SEQ (LETT |uv| (QCDR |uvu|))
                          (LETT |u1|
                                (SPADCALL (QVELT |uv| 0)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT $ 28)) 1
                                            (QREFELT $ 30))
                                           |r1| (QREFELT $ 81))
                                          (QREFELT $ 67)))
                          (LETT |er2|
                                (VECTOR |bpol| |r0| |v0| (|spadConstant| $ 104)
                                        (QVELT |er1| 4) 0 (QVELT |er1| 6) 'T
                                        |r1| |v1| |u1| (QVELT |uv| 1)))
                          (LETT |einums|
                                (|RDEEFX;decompose1| |num| |den| (LIST |bpol|)
                                 $))
                          (LETT |ar1|
                                (|RDEEFX;solve_linear_factor| |nf| |denf| |nfp|
                                 |denfp| |k| |x| (|SPADfirst| |einums|) |er2|
                                 $))
                          (EXIT |ar1|)))))))))))) 

(SDEFUN |RDEEFX;handle_logpart|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|vlst| |List| F) (|ulst| |List| F) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| F)
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |polypart| (|SparseUnivariatePolynomial| F))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #1#) (|ansp| (F))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#2=#:G1170 NIL) (|einum| NIL) (#3=#:G1171 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|dtrans| #4=(|Matrix| (|Integer|)))
          (|dbasis| #5=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|lei|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|ninds| (|List| (|Integer|)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F)))
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|neidens| (|List| (|SparseUnivariatePolynomial| F)))
          (#6=#:G1167 NIL) (|i| NIL) (#7=#:G1168 NIL) (|eiden| NIL)
          (#8=#:G1169 NIL) (|n| (|NonNegativeInteger|))
          (|nidbl| (|List| (|Integer|)))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| F)))
          (|bi| (|SparseUnivariatePolynomial| F)) (#9=#:G1166 NIL)
          (|m| (|NonNegativeInteger|)) (#10=#:G1163 NIL)
          (|lp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|dr| (|Record| (|:| |basis| #5#) (|:| |transform| #4#)))
          (#11=#:G1165 NIL) (#12=#:G1164 NIL))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 23))
            (COND
             ((SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 113))
              (COND
               ((SPADCALL (SPADCALL |nf| (QREFELT $ 41)) 1 (QREFELT $ 336))
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| $))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| $ 110) (QREFELT $ 113))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT $ 41)) 0)
              (EXIT
               (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                       (|spadConstant| $ 104) (|spadConstant| $ 200)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| $))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 200)
                     (|spadConstant| $ 104) (|spadConstant| $ 200)))
            (#13='T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #12# NIL)
                     (SEQ (LETT |er| NIL) (LETT #11# |lei|) G190
                          (COND
                           ((OR (ATOM #11#) (PROGN (LETT |er| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #12# (CONS (QVELT |er| 0) #12#))))
                          (LETT #11# (CDR #11#)) (GO G190) G191
                          (EXIT (NREVERSE #12#)))))
              (LETT |ansp| (|spadConstant| $ 45))
              (LETT |lp_cor| (|spadConstant| $ 200))
              (LETT |sp_cor| (|spadConstant| $ 200))
              (LETT |poly_cor| (|spadConstant| $ 104))
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT $ 23))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT $ 337))
                                  (QREFELT $ 340)))
                  (LETT |dbasis| (QCAR |dr|)) (LETT |dtrans| (QCDR |dr|))
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT $ 49))
                                  (SPADCALL |den| (QREFELT $ 49))
                                  (QREFELT $ 52)))
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (LETT |ar1|
                                (|RDEEFX;handle_nonlinear_log| |num| |den| |nf|
                                 |denf| |nfp| |denfp| |k| |x| |vlst| |ulst|
                                 |lei| |dbasis| |dtrans| $))
                          (LETT |ansp|
                                (SPADCALL |ansp| (QVELT |ar1| 0)
                                          (QREFELT $ 75)))
                          (LETT |lp_cor|
                                (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                          (QREFELT $ 329)))
                          (LETT |sp_cor|
                                (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                          (QREFELT $ 329)))
                          (LETT |poly_cor|
                                (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                          (QREFELT $ 51)))
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| $ 200)
                                       (QREFELT $ 341))
                             (PROGN (LETT #10# |$NoValue|) (GO #14=#:G1155)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT $ 272)))
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| $ 200)
                                           (QREFELT $ 341))
                                 (PROGN (LETT #10# |$NoValue|) (GO #14#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT $ 39)))
                                  (LETT |den| (SPADCALL |lp| (QREFELT $ 40)))
                                  (LETT |ndbl| NIL) (LETT |nidbl| NIL)
                                  (LETT |m| (QVSIZE |dbasis|))
                                  (SEQ (LETT |i| 1) (LETT #9# |m|) G190
                                       (COND
                                        ((|greater_SI| |i| #9#) (GO G191)))
                                       (SEQ
                                        (LETT |bi|
                                              (SPADCALL |dbasis| |i|
                                                        (QREFELT $ 332)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |den| |bi|
                                                      (QREFELT $ 109))
                                            0)
                                           (SEQ
                                            (LETT |ndbl| (CONS |bi| |ndbl|))
                                            (EXIT
                                             (LETT |nidbl|
                                                   (CONS |i| |nidbl|))))))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |ndbl|) |m|)
                                     (|error|
                                      "no progress in handle_nonlinear_log"))
                                    ('T
                                     (SEQ (LETT |ndbl| (NREVERSE |ndbl|))
                                          (LETT |nidbl| (NREVERSE |nidbl|))
                                          (LETT |neidens| NIL)
                                          (LETT |ninds| NIL) (LETT |lei1| NIL)
                                          (LETT |n| (LENGTH |eidens|))
                                          (SEQ (LETT |er| NIL) (LETT #8# |lei|)
                                               (LETT |eiden| NIL)
                                               (LETT #7# |eidens|) (LETT |i| 1)
                                               (LETT #6# |n|) G190
                                               (COND
                                                ((OR (|greater_SI| |i| #6#)
                                                     (ATOM #7#)
                                                     (PROGN
                                                      (LETT |eiden| (CAR #7#))
                                                      NIL)
                                                     (ATOM #8#)
                                                     (PROGN
                                                      (LETT |er| (CAR #8#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR
                                                    (SPADCALL |den| |eiden|
                                                              (QREFELT $ 109))
                                                    0)
                                                   (SEQ
                                                    (LETT |neidens|
                                                          (CONS |eiden|
                                                                |neidens|))
                                                    (LETT |ninds|
                                                          (CONS |i| |ninds|))
                                                    (EXIT
                                                     (LETT |lei1|
                                                           (CONS |er|
                                                                 |lei1|))))))))
                                               (LETT |i|
                                                     (PROG1 (|inc_SI| |i|)
                                                       (LETT #7#
                                                             (PROG1 (CDR #7#)
                                                               (LETT #8#
                                                                     (CDR
                                                                      #8#))))))
                                               (GO G190) G191 (EXIT NIL))
                                          (LETT |eidens| (NREVERSE |neidens|))
                                          (LETT |ninds| (NREVERSE |ninds|))
                                          (LETT |lei| (NREVERSE |lei1|))
                                          (LETT |dbasis|
                                                (SPADCALL |ndbl|
                                                          (QREFELT $ 337)))
                                          (EXIT
                                           (LETT |dtrans|
                                                 (SPADCALL |dtrans| |nidbl|
                                                           |ninds|
                                                           (QREFELT $
                                                                    342)))))))))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #14# (EXIT #10#))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))
                (#13#
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $))
                  (SEQ (LETT |er| NIL) (LETT #3# |lei|) (LETT |einum| NIL)
                       (LETT #2# |einums|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |einum| (CAR #2#)) NIL)
                             (ATOM #3#) (PROGN (LETT |er| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| (QVELT |er| 0) |er| $))
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 75)))
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 329)))
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 329)))
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 51)))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

(SDEFUN |RDEEFX;gamma_denominator|
        ((|denf| . #1=(|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         ($ |Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
          (|:| |exponent| (|Integer|))))
        (SPROG
         ((|gden1| (|SparseUnivariatePolynomial| F)) (#2=#:G1203 NIL)
          (#3=#:G1199 NIL) (#4=#:G1211 NIL) (|fac1| NIL) (#5=#:G1210 NIL)
          (|l1| (|Integer|)) (|lexp| (|List| (|Integer|))) (#6=#:G1209 NIL)
          (#7=#:G1208 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| F))) (|denf1| #1#)
          (#8=#:G1175 NIL) (#9=#:G1173 NIL) (|s_deg| (|Integer|)))
         (SEQ (LETT |s_deg| 0) (LETT |denf1| |denf|)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 23))
                (SEQ (LETT |s_deg| (SPADCALL |denf| (QREFELT $ 221)))
                     (EXIT
                      (LETT |denf1|
                            (PROG2
                                (LETT #8#
                                      (SPADCALL |denf|
                                                (SPADCALL (|spadConstant| $ 33)
                                                          (PROG1
                                                              (LETT #9#
                                                                    |s_deg|)
                                                            (|check_subtype2|
                                                             (>= #9# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #9#))
                                                          (QREFELT $ 46))
                                                (QREFELT $ 109)))
                                (QCDR #8#)
                              (|check_union2| (QEQCAR #8# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               "failed")
                                              #8#)))))))
              (EXIT
               (COND
                ((SPADCALL |denf1| (|spadConstant| $ 110) (QREFELT $ 113))
                 (COND ((EQL |s_deg| 0) (CONS (|spadConstant| $ 110) 0))
                       (#10='T
                        (CONS (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                              |s_deg|))))
                (#10#
                 (SEQ (LETT |fnf| (SPADCALL |denf1| (QREFELT $ 241)))
                      (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 132)))
                      (LETT |lexp|
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |fac1| NIL) (LETT #6# |nffacs|) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |fac1| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7# (CONS (QVELT |fac1| 2) #7#))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT (NREVERSE #7#)))))
                      (LETT |l1|
                            (SPADCALL (CONS |s_deg| |lexp|) (QREFELT $ 117)))
                      (EXIT
                       (COND ((EQL |l1| 1) (CONS |denf| 1))
                             (#10#
                              (SEQ
                               (LETT |gden1|
                                     (SPADCALL (ELT $ 99)
                                               (PROGN
                                                (LETT #5# NIL)
                                                (SEQ (LETT |fac1| NIL)
                                                     (LETT #4# |nffacs|) G190
                                                     (COND
                                                      ((OR (ATOM #4#)
                                                           (PROGN
                                                            (LETT |fac1|
                                                                  (CAR #4#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #5#
                                                             (CONS
                                                              (|RDEEFX;my_exp|
                                                               (QVELT |fac1| 1)
                                                               (PROG1
                                                                   (LETT #3#
                                                                         (QUOTIENT2
                                                                          (QVELT
                                                                           |fac1|
                                                                           2)
                                                                          |l1|))
                                                                 (|check_subtype2|
                                                                  (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                                               $)
                                                              #5#))))
                                                     (LETT #4# (CDR #4#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #5#))))
                                               (QREFELT $ 311)))
                               (COND
                                ((SPADCALL |s_deg| 0 (QREFELT $ 42))
                                 (LETT |gden1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 33)
                                                  (PROG1
                                                      (LETT #2#
                                                            (QUOTIENT2 |s_deg|
                                                                       |l1|))
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 46))
                                        |gden1| (QREFELT $ 99)))))
                               (EXIT (CONS |gden1| |l1|))))))))))))) 

(SDEFUN |RDEEFX;special_Hermite|
        ((|r| |Fraction| (|SparseUnivariatePolynomial| F))
         (|nfp| |SparseUnivariatePolynomial| F)
         (|ndenf| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|deriv| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|mult| (|SparseUnivariatePolynomial| F))
          (|denr| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G1218 NIL)
          (|numr| (|SparseUnivariatePolynomial| F))
          (|nfp1| (|SparseUnivariatePolynomial| F))
          (|an| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F))
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#3=#:G1215 NIL) (#4=#:G1225 NIL)
          (|hh1| (|SparseUnivariatePolynomial| F)) (|ad| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |ad| (LETT |denr| (SPADCALL |r| (QREFELT $ 40))))
                (LETT |numr| (SPADCALL |r| (QREFELT $ 39)))
                (LETT |an| (|spadConstant| $ 104))
                (LETT |mult| (|spadConstant| $ 110))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |hh1| (SPADCALL |denr| |ndenf| (QREFELT $ 107)))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |hh1| (QREFELT $ 41)) 0)
                          (PROGN
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |denfp| |an| (QREFELT $ 99)) |ad|
                                   (QREFELT $ 199))
                                  (SPADCALL |numr| |denr| (QREFELT $ 199))))
                           (GO #5=#:G1224)))
                         ('T
                          (SEQ
                           (LETT |ee|
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |nfp| |hh1| |numr|
                                                     (QREFELT $ 323)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|Record|
                                                    (|:| |coef1|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7)))
                                                    (|:| |coef2|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7))))
                                                   (|Union|
                                                    (|Record|
                                                     (|:| |coef1|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7)))
                                                     (|:| |coef2|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))))
                                                    "failed")
                                                   #3#)))
                           (LETT |nn|
                                 (SPADCALL (QCAR |ee|) |hh1| (QREFELT $ 192)))
                           (LETT |an|
                                 (SPADCALL |an|
                                           (SPADCALL |mult| |nn|
                                                     (QREFELT $ 99))
                                           (QREFELT $ 51)))
                           (LETT |nfp1|
                                 (SPADCALL |nfp|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL
                                                      (SPADCALL |denfp|
                                                                (SPADCALL
                                                                 |denr|
                                                                 |deriv|)
                                                                (QREFELT $ 99))
                                                      |denr| (QREFELT $ 109)))
                                               (QCDR #2#)
                                             (|check_union2| (QEQCAR #2# 0)
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 7))
                                                             (|Union|
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 7))
                                                              #6="failed")
                                                             #2#))
                                           (QREFELT $ 48)))
                           (LETT |numr|
                                 (SPADCALL
                                  (SPADCALL |numr|
                                            (SPADCALL |nfp1| |nn|
                                                      (QREFELT $ 99))
                                            (QREFELT $ 48))
                                  (SPADCALL
                                   (SPADCALL |denfp| |nn| (QREFELT $ 99))
                                   |deriv|)
                                  (QREFELT $ 48)))
                           (LETT |numr|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |numr| |hh1|
                                                     (QREFELT $ 109)))
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))
                                                    #6#)
                                                   #2#)))
                           (LETT |denr|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |denr| |hh1|
                                                     (QREFELT $ 109)))
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))
                                                    #6#)
                                                   #2#)))
                           (EXIT
                            (LETT |mult|
                                  (SPADCALL |mult| |hh1| (QREFELT $ 99)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #4#)))) 

(SDEFUN |RDEEFX;ei_int_log|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F) (|x| |Symbol|)
         (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| (F)) (|r1| (F))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|gm| (F)) (|kfm| (F)) (|am1| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|m| NIL) (|ansp| (F)) (|dk| (F)) (|kf| (F)) (|k1| (|Kernel| F))
          (|lk| (|List| (|Kernel| F))) (#1=#:G1234 NIL) (#2=#:G1233 NIL)
          (|ngu| (F)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 49)) |k| (QREFELT $ 62)))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT $ 343))
                           (SPADCALL |ngu| (QREFELT $ 343)) (QREFELT $ 16))
                 |x| (QREFELT $ 15)))
          (LETT |lk|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k1| NIL) (LETT #1# |lk|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k1| |k| (QREFELT $ 344))
                          (LETT #2# (CONS |k1| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |k1| (SPADCALL |lk| (QREFELT $ 53)))
          (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
          (LETT |dk| (SPADCALL |kf| |x| (QREFELT $ 64)))
          (LETT |r1| (|spadConstant| $ 45)) (LETT |ansp| (|spadConstant| $ 45))
          (LETT |is_sol| 'T) (LETT |rh| (|spadConstant| $ 45))
          (LETT |am1| (|spadConstant| $ 45))
          (SEQ (LETT |m| (SPADCALL |ng| (QREFELT $ 41))) G190
               (COND ((< |m| 1) (GO G191)))
               (SEQ
                (LETT |gm|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |m| 1) (QREFELT $ 76)) |dk|
                                  (QREFELT $ 67))
                        |am1| (QREFELT $ 67))
                       (QREFELT $ 50)))
                (COND
                 ((EQL |m| (SPADCALL |ng| (QREFELT $ 41)))
                  (SEQ
                   (LETT |gm|
                         (SPADCALL |gm| (SPADCALL |ng| (QREFELT $ 105))
                                   (QREFELT $ 75)))
                   (EXIT (LETT |ng| (SPADCALL |ng| (QREFELT $ 112)))))))
                (LETT |res1| (SPADCALL |f| |gm| |x| |lk| (QREFELT $ 58)))
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 3)) ('T NIL)))
                (LETT |am1| (QVELT |res1| 0))
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 345)))
                (LETT |r1|
                      (SPADCALL |r1| (SPADCALL |kfm| |am1| (QREFELT $ 67))
                                (QREFELT $ 75)))
                (EXIT
                 (LETT |rh|
                       (SPADCALL
                        (SPADCALL |rh|
                                  (SPADCALL |kfm| (QVELT |res1| 1)
                                            (QREFELT $ 67))
                                  (QREFELT $ 75))
                        (SPADCALL
                         (SPADCALL (SPADCALL |m| (QREFELT $ 76)) |dk|
                                   (QREFELT $ 67))
                         |am1| (QREFELT $ 67))
                        (QREFELT $ 75)))))
               (LETT |m| (+ |m| -1)) (GO G190) G191 (EXIT NIL))
          (LETT |gm|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 205))
                          (SPADCALL |dk| |am1| (QREFELT $ 67)) (QREFELT $ 79)))
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| (QREFELT $ 68)))
          (LETT |r1| (SPADCALL |r1| (QVELT |res2| 0) (QREFELT $ 75)))
          (LETT |rh| (SPADCALL |rh| (QVELT |res2| 1) (QREFELT $ 75)))
          (LETT |is_sol| (COND (|is_sol| (QVELT |res2| 3)) ('T NIL)))
          (EXIT (VECTOR |r1| |rh| (QVELT |res2| 2) |is_sol|))))) 

(SDEFUN |RDEEFX;ei_int_exp|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F)
         (|degs| |NonNegativeInteger|) (|x| |Symbol|) (|k| |Kernel| F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| (F)) (|ansp| (F)) (|r1| (F)) (|kfm| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|f1| (F)) (|gm| (F)) (|m| (|Integer|)) (|kf| (F)) (|ak| (F))
          (|k1| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|ngu| (F)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 49)) |k| (QREFELT $ 62)))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 343))
                          (SPADCALL |ngu| (QREFELT $ 343)) (QREFELT $ 16)))
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 15)) |x|
                          (QREFELT $ 346)))
          (LETT |ak| (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1 (QREFELT $ 30)))
          (LETT |kf| (SPADCALL |k| (QREFELT $ 63)))
          (LETT |r1| (|spadConstant| $ 45)) (LETT |ansp| (|spadConstant| $ 45))
          (LETT |is_sol| 'T) (LETT |rh| (|spadConstant| $ 45))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |ng| (|spadConstant| $ 104) (QREFELT $ 111)))
                 (GO G191)))
               (SEQ (LETT |m| (- (SPADCALL |ng| (QREFELT $ 41)) |degs|))
                    (LETT |gm| (SPADCALL |ng| (QREFELT $ 105)))
                    (LETT |ng| (SPADCALL |ng| (QREFELT $ 112)))
                    (LETT |f1|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |m| (QREFELT $ 76))
                                              |ak| (QREFELT $ 67))
                                    (QREFELT $ 75)))
                    (LETT |res1| (SPADCALL 1 |f1| |gm| |x| (QREFELT $ 68)))
                    (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 81)))
                    (LETT |r1|
                          (SPADCALL |r1|
                                    (SPADCALL |kfm| (QVELT |res1| 0)
                                              (QREFELT $ 67))
                                    (QREFELT $ 75)))
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |res1| 2) (QREFELT $ 75)))
                    (LETT |rh|
                          (SPADCALL |rh|
                                    (SPADCALL |kfm| (QVELT |res1| 1)
                                              (QREFELT $ 67))
                                    (QREFELT $ 75)))
                    (EXIT
                     (LETT |is_sol|
                           (COND (|is_sol| (QVELT |res1| 3)) ('T NIL)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |r1| |rh| |ansp| |is_sol|))))) 

(SDEFUN |RDEEFX;get_scoeff|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F)
          (|:| |a_val| F))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| #1=(|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|res| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|gt| #2=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|gt1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#3=#:G1253 NIL) (|i| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|l1| (|NonNegativeInteger|)) (#4=#:G1247 NIL) (|rf1k| (|Kernel| F))
          (|rfc| (F)) (|coeff1_r| #2#)
          (|coeff1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|nfp| #1#)
          (|d| (|Integer|)) (|vshift| (F)) (|u_exp| (|Integer|)) (|u0| (F))
          (|ak| (F)) (|nf1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|cfac| (|SparseUnivariatePolynomial| F)) (|v0| (F))
          (|r0| (|Integer|)) (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1)) (LETT |r0| (QVELT |scand| 3))
              (LETT |v0| (QVELT |scand| 4)) (LETT |cfac| (QVELT |scand| 5))
              (LETT |u0| (QVELT |scand| 8)) (LETT |nf1| (QVELT |scand| 6))
              (COND
               ((SPADCALL |r0| 0 (QREFELT $ 91))
                (SEQ
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 28)) 1
                                 (QREFELT $ 30)))
                 (EXIT
                  (LETT |u0|
                        (SPADCALL |u0| (SPADCALL |ak| |r0| (QREFELT $ 81))
                                  (QREFELT $ 67)))))))
              (LETT |u_exp| (QVELT |scand| 9))
              (LETT |vshift| (QVELT |scand| 10)) (LETT |d| (QVELT |scand| 0))
              (EXIT
               (COND
                ((EQL |d| 0)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|))
                      (LETT |coeff1|
                            (SPADCALL (SPADCALL |u0| (QREFELT $ 47)) |nfp|
                                      (QREFELT $ 273)))
                      (EXIT (CONS |coeff1| |res|))))
                ((EQL |d| 1)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|))
                      (COND
                       ((OR
                         (SPADCALL (QVELT |scand| 2) (|spadConstant| $ 33)
                                   (QREFELT $ 133))
                         (SPADCALL |cfac| (|spadConstant| $ 104)
                                   (QREFELT $ 111)))
                        (EXIT (|error| "impossible coeff"))))
                      (LETT |coeff1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u0| (QREFELT $ 47)) |nfp|
                                       (QREFELT $ 273))
                             |nf1| (QREFELT $ 52)))
                      (LETT |coeff1_r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 33) 1
                                         (QREFELT $ 46))
                               (QREFELT $ 49))
                              |u_exp| (QREFELT $ 316))
                             |coeff1| (QREFELT $ 317)))
                      (EXIT (CONS |coeff1_r| |res|))))
                ((SPADCALL |d| 1 (QREFELT $ 42))
                 (SEQ
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 104) (QREFELT $ 111))
                    (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 242)))
                         (EXIT
                          (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 315)))))))
                  (LETT |l1|
                        (PROG1 (LETT #4# (- |d| 1))
                          (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #4#)))
                  (LETT |nf2| (QVELT |scand| 7))
                  (LETT |gt|
                        (SPADCALL
                         (SPADCALL (SPADCALL |nf2| |der|)
                                   (SPADCALL |u0| (QREFELT $ 47))
                                   (QREFELT $ 347))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 33) 1 (QREFELT $ 46))
                           (QREFELT $ 49))
                          |u_exp| (QREFELT $ 316))
                         (QREFELT $ 317)))
                  (SEQ (LETT |i| 1) (LETT #3# |l1|) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (LETT |gt1|
                              (COND
                               ((SPADCALL |cfac| (|spadConstant| $ 104)
                                          (QREFELT $ 113))
                                |gt|)
                               ('T
                                (|RDEEFX;get_trace| |gt| |k| |rf1k| |cfac|
                                 $))))
                        (LETT |res| (CONS |gt1| |res|))
                        (EXIT
                         (LETT |gt| (SPADCALL |gt| |nf2| (QREFELT $ 317)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;get_scoeffs|
        ((|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#1=#:G1258 NIL) (|scand| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |scand| NIL) (LETT #1# |scands|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |scand| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|RDEEFX;get_scoeff| |scand| |denf| |k| |der| |res|
                            $))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |RDEEFX;mk_erf1| ((|uc| F) (|ff| F) ($ F))
        (SPROG ((|uc1| (F)))
               (SEQ (LETT |uc1| (SPADCALL |uc| (QREFELT $ 348)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 349)) (QREFELT $ 348))
                       (SPADCALL (SPADCALL |uc1| |ff| (QREFELT $ 67))
                                 (QREFELT $ 350))
                       (QREFELT $ 67))
                      |uc1| (QREFELT $ 69)))))) 

(SDEFUN |RDEEFX;is_imaginary?| ((|c| F) ($ |Boolean|))
        (SPROG
         ((|dl| (|List| (|Complex| (|Integer|))))
          (|nl| (|List| (|Complex| (|Integer|))))
          (|dc| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nc| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |nc| (SPADCALL |c| (QREFELT $ 180)))
              (LETT |dc| (SPADCALL |c| (QREFELT $ 276)))
              (LETT |nl| (SPADCALL |nc| (QREFELT $ 352)))
              (LETT |dl| (SPADCALL |dc| (QREFELT $ 352)))
              (EXIT
               (COND
                ((SPADCALL (CONS #'|RDEEFX;is_imaginary?!0| $) |dl|
                           (QREFELT $ 359))
                 (SPADCALL (CONS #'|RDEEFX;is_imaginary?!1| $) |nl|
                           (QREFELT $ 359)))
                ('T NIL)))))) 

(SDEFUN |RDEEFX;is_imaginary?!1| ((|c1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT $ 360)) (|spadConstant| $ 355)
                  (QREFELT $ 356))) 

(SDEFUN |RDEEFX;is_imaginary?!0| ((|c1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT $ 354)) (|spadConstant| $ 355)
                  (QREFELT $ 356))) 

(SDEFUN |RDEEFX;mk_erf;3F;54| ((|uc| F) (|ff| F) ($ F))
        (SPROG ((|uc2| (F)) (|uc1| (F)) (|s| (F)) (|im| (F)))
               (SEQ
                (COND
                 ((NULL (|RDEEFX;is_imaginary?| |uc| $))
                  (|RDEEFX;mk_erf1| |uc| |ff| $))
                 ('T
                  (SEQ
                   (LETT |im|
                         (SPADCALL (SPADCALL 0 1 (QREFELT $ 361))
                                   (QREFELT $ 362)))
                   (LETT |uc1|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 2 (QREFELT $ 76)) |im|
                                      (QREFELT $ 67))
                            |uc| (QREFELT $ 67))
                           (SPADCALL (QREFELT $ 349)) (QREFELT $ 69))
                          (QREFELT $ 50)))
                   (LETT |s| (|spadConstant| $ 33))
                   (COND
                    ((SPADCALL |uc1| (SPADCALL |uc1| (QREFELT $ 50))
                               (QREFELT $ 363))
                     (SEQ
                      (LETT |s|
                            (SPADCALL (|spadConstant| $ 33) (QREFELT $ 50)))
                      (EXIT (LETT |uc1| (SPADCALL |uc1| (QREFELT $ 50)))))))
                   (LETT |uc2| (SPADCALL |uc1| (QREFELT $ 348)))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 (QREFELT $ 76))
                               (SPADCALL
                                (SPADCALL (SPADCALL |uc2| |ff| (QREFELT $ 67))
                                          (QREFELT $ 364))
                                (SPADCALL (SPADCALL |im| |s| (QREFELT $ 67))
                                          (SPADCALL
                                           (SPADCALL |uc2| |ff| (QREFELT $ 67))
                                           (QREFELT $ 365))
                                          (QREFELT $ 67))
                                (QREFELT $ 79))
                               (QREFELT $ 67))
                     |uc2| (QREFELT $ 69))))))))) 

(SDEFUN |RDEEFX;mk_erf;3F;55| ((|uc| F) (|ff| F) ($ F))
        (|RDEEFX;mk_erf1| |uc| |ff| $)) 

(SDEFUN |RDEEFX;get_prims|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F)
          (|:| |a_val| F))
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) ($ |List| F))
        (SPROG
         ((|res| (|List| F)) (|f1| (F)) (#1=#:G1329 NIL) (|zz| NIL) (|f11| (F))
          (|ff| (F)) (|c1s| (F)) (|j1| (F)) (#2=#:G1328 NIL) (|j| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F))) (|lf| (F))
          (|l1| (|NonNegativeInteger|)) (#3=#:G1317 NIL) (|gpow| (|Integer|))
          (#4=#:G1315 NIL) (|zzl| (|List| F)) (|rf1k| (|Kernel| F)) (|rfc| (F))
          (|a| (F)) (|d| (|Integer|)) (|f| (F))
          (|nf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|uc| (F))
          (|vshift| (F)) (|cfac| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1)) (LETT |cfac| (QVELT |scand| 5))
              (LETT |vshift| (QVELT |scand| 10)) (LETT |uc| (QVELT |scand| 2))
              (LETT |nf| (QVELT |scand| 6))
              (LETT |f| (SPADCALL |nf| |k| (QREFELT $ 62)))
              (LETT |d| (QVELT |scand| 0))
              (EXIT
               (COND
                ((EQL |d| 0)
                 (SEQ (LETT |a| (QVELT |scand| 11))
                      (EXIT
                       (LIST
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |vshift| (QREFELT $ 50))
                                    (SPADCALL
                                     (SPADCALL |a| (|spadConstant| $ 33)
                                               (QREFELT $ 79))
                                     (SPADCALL (QVELT |scand| 2)
                                               (QREFELT $ 367))
                                     (QREFELT $ 67))
                                    (QREFELT $ 79))
                          (QREFELT $ 325))
                         (SPADCALL |a| |f| (QREFELT $ 368)) (QREFELT $ 67))))))
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 50))
                             (QREFELT $ 325))
                   (SPADCALL |f| (QREFELT $ 326)) (QREFELT $ 67))))
                ((SPADCALL |d| 1 (QREFELT $ 42))
                 (SEQ (LETT |rfc| (|spadConstant| $ 45))
                      (COND
                       ((SPADCALL |cfac| (|spadConstant| $ 104)
                                  (QREFELT $ 111))
                        (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 242)))
                             (EXIT
                              (LETT |rf1k|
                                    (SPADCALL |rfc| (QREFELT $ 315)))))))
                      (LETT |zzl|
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| $ 104)
                                        (QREFELT $ 113))
                              (LIST (|spadConstant| $ 45)))
                             (#5='T (SPADCALL |cfac| (QREFELT $ 327)))))
                      (LETT |gpow|
                            (PROG2
                                (LETT #4#
                                      (SPADCALL |gexp| |d| (QREFELT $ 119)))
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0) (|Integer|)
                                              (|Union| (|Integer|) "failed")
                                              #4#)))
                      (LETT |l1|
                            (PROG1 (LETT #3# (- |d| 1))
                              (|check_subtype2| (>= #3# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #3#)))
                      (LETT |lf| (SPADCALL |d| (QREFELT $ 76)))
                      (LETT |res| NIL) (LETT |nf2| (QVELT |scand| 7))
                      (SEQ (LETT |j| 1) (LETT #2# |l1|) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (LETT |j1|
                                  (SPADCALL (SPADCALL |j| (QREFELT $ 76)) |lf|
                                            (QREFELT $ 69)))
                            (LETT |c1s|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 50))
                                             (QREFELT $ 325))
                                   |lf| (QREFELT $ 69)))
                            (LETT |f1|
                                  (COND
                                   ((EQL (SPADCALL 2 |j| (QREFELT $ 211)) |d|)
                                    (SEQ
                                     (LETT |ff|
                                           (SPADCALL |nf2| |k| (QREFELT $ 62)))
                                     (EXIT
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT $ 50))
                                                 (SPADCALL |ff| |j|
                                                           (QREFELT $ 345))
                                                 (QREFELT $ 366))
                                                (QREFELT $ 67)))))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT $ 50))
                                                 (SPADCALL |j1| (QREFELT $ 50))
                                                 (QREFELT $ 369))
                                                (QREFELT $ 67))
                                      (SPADCALL |j1|
                                                (SPADCALL |f| (QREFELT $ 50))
                                                (QREFELT $ 368))
                                      (QREFELT $ 67))
                                     (QREFELT $ 50)))))
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| $ 104)
                                        (QREFELT $ 111))
                              (SEQ (LETT |f11| |f1|)
                                   (LETT |f1| (|spadConstant| $ 45))
                                   (EXIT
                                    (SEQ (LETT |zz| NIL) (LETT #1# |zzl|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |zz| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |f1|
                                                 (SPADCALL |f1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |zz|
                                                                       (QREFELT
                                                                        $ 50))
                                                             (QREFELT $ 325))
                                                            (SPADCALL |f11|
                                                                      |rf1k|
                                                                      |zz|
                                                                      (QREFELT
                                                                       $ 70))
                                                            (QREFELT $ 67))
                                                           (QREFELT $ 75)))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT NIL))))))
                            (EXIT (LETT |res| (CONS |f1| |res|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|))))
                (#5# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;ei_int_diff|
        ((|f| F) (|g| F) (|gu| |Fraction| (|SparseUnivariatePolynomial| F))
         (|x| |Symbol|) (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|nres2|
           #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                        (|:| |sol?| (|Boolean|))))
          (|g3u| #2=(|Fraction| (|SparseUnivariatePolynomial| F))) (|g3| (F))
          (|r1| (F)) (|dp1| (F)) (|p1| (F)) (|a1| (F)) (|k1f| (F))
          (|kdv| (|Kernel| F)) (|nres| #1#) (|g2| (F)) (|f2| (F)) (|dvf| (F))
          (|dv| (|Symbol|)) (|k1| (F)) (|args| (|List| F)) (|g1| (F))
          (|ngu| (|SparseUnivariatePolynomial| F)) (|fu| #2#))
         (SEQ (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 36)))
              (LETT |ngu| (SPADCALL |gu| (QREFELT $ 39)))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |gu| (QREFELT $ 40))
                           (|spadConstant| $ 110) (QREFELT $ 111))
                 (OR
                  (SPADCALL (SPADCALL |ngu| (QREFELT $ 41)) 1 (QREFELT $ 91))
                  (SPADCALL |fu|
                            (SPADCALL (SPADCALL |f| (QREFELT $ 47))
                                      (QREFELT $ 49))
                            (QREFELT $ 370))))
                (EXIT
                 (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                         (|spadConstant| $ 45) NIL))))
              (LETT |g1| (SPADCALL |ngu| (QREFELT $ 105)))
              (LETT |args| (SPADCALL |k| (QREFELT $ 28)))
              (EXIT
               (COND
                ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 91))
                 (|error| "internal error, k is not a diff"))
                (#3='T
                 (SEQ
                  (LETT |k1|
                        (SPADCALL (SPADCALL |args| 1 (QREFELT $ 30))
                                  (SPADCALL (SPADCALL |args| 2 (QREFELT $ 30))
                                            (QREFELT $ 315))
                                  (SPADCALL |args| 3 (QREFELT $ 30))
                                  (QREFELT $ 70)))
                  (LETT |dv| (SPADCALL (QREFELT $ 59)))
                  (LETT |dvf| (SPADCALL |dv| (QREFELT $ 371)))
                  (LETT |f2| (SPADCALL |f| |k1| |dvf| (QREFELT $ 372)))
                  (LETT |g2| (SPADCALL |g1| |k1| |dvf| (QREFELT $ 372)))
                  (LETT |nres| (SPADCALL 1 |f2| |g2| |dv| (QREFELT $ 68)))
                  (COND
                   ((NULL (QVELT |nres| 3))
                    (EXIT
                     (VECTOR (|spadConstant| $ 45) (|spadConstant| $ 45)
                             (|spadConstant| $ 45) NIL))))
                  (LETT |kdv| (SPADCALL |dv| (QREFELT $ 60))) (LETT |k1f| |k1|)
                  (LETT |a1|
                        (SPADCALL (QVELT |nres| 0) |kdv| |k1f| (QREFELT $ 70)))
                  (LETT |p1|
                        (SPADCALL (QVELT |nres| 2) |kdv| |k1f| (QREFELT $ 70)))
                  (LETT |dp1|
                        (COND
                         ((SPADCALL |p1| (|spadConstant| $ 45) (QREFELT $ 80))
                          (|spadConstant| $ 45))
                         (#3#
                          (SPADCALL (SPADCALL |p1| |x| (QREFELT $ 324))
                                    (SPADCALL |f| (QREFELT $ 325))
                                    (QREFELT $ 69)))))
                  (LETT |r1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |a1| |x| (QREFELT $ 324))
                                   (SPADCALL |a1|
                                             (SPADCALL |f| |x| (QREFELT $ 324))
                                             (QREFELT $ 67))
                                   (QREFELT $ 75))
                         |dp1| (QREFELT $ 75)))
                  (LETT |g3| (SPADCALL |g| |r1| (QREFELT $ 79)))
                  (EXIT
                   (COND
                    ((SPADCALL |g3| (|spadConstant| $ 45) (QREFELT $ 80))
                     (VECTOR |a1| |g| |p1| 'T))
                    (#3#
                     (SEQ (LETT |g3u| (SPADCALL |g3| |k| (QREFELT $ 36)))
                          (EXIT
                           (COND
                            ((SPADCALL |g3u|
                                       (SPADCALL (SPADCALL |g3| (QREFELT $ 47))
                                                 (QREFELT $ 49))
                                       (QREFELT $ 370))
                             (SEQ
                              (SPADCALL
                               (SPADCALL
                                "Failed to differentiate nres in ei_int_diff"
                                (QREFELT $ 375))
                               (QREFELT $ 377))
                              (EXIT
                               (VECTOR (|spadConstant| $ 45)
                                       (|spadConstant| $ 45)
                                       (|spadConstant| $ 45) NIL))))
                            (#3#
                             (SEQ
                              (LETT |nres2|
                                    (SPADCALL 1 |f| |g3| |x| (QREFELT $ 68)))
                              (EXIT
                               (VECTOR
                                (SPADCALL (QVELT |nres2| 0) |a1|
                                          (QREFELT $ 75))
                                (SPADCALL (QVELT |nres2| 1) |r1|
                                          (QREFELT $ 75))
                                (SPADCALL (QVELT |nres2| 2) |p1|
                                          (QREFELT $ 75))
                                (QVELT |nres2| 3)))))))))))))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|res6|
           #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                        (|:| |sol?| (|Boolean|))))
          (#2=#:G1420 NIL) (|r1| (F)) (|ansp| (F)) (|a1| (F))
          (|res4|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|f1| (F)) (|u| (F)) (|rc| (|Integer|))
          (|rcu2| (|Union| (|Integer|) #3="failed"))
          (|rcq| (|Fraction| (|Integer|)))
          (|rcu1| (|Union| (|Fraction| (|Integer|)) "failed")) (|lc| (F))
          (|rr1f| (F)) (#4=#:G1418 NIL) (|aa| (F)) (|res7| #1#)
          (#5=#:G1419 NIL) (|ff| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F)) (|gj| (F)) (|j| NIL)
          (|dkf| (F)) (|kf| (F)) (|d| #6=(|NonNegativeInteger|))
          (|spec1u| #7=(|Union| (|SparseUnivariatePolynomial| F) #3#))
          (|log_recursion| (|Boolean|))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|scands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|her2|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ndenf| #8=(|SparseUnivariatePolynomial| F))
          (|denf_split|
           (|Record| (|:| |normal| #8#)
                     (|:| |special| (|SparseUnivariatePolynomial| F))))
          (|derivation2|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|gexp| (|Integer|)) (|gden1| (|SparseUnivariatePolynomial| F))
          (|#G482|
           (|Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
                     (|:| |exponent| (|Integer|))))
          (|res5|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|lp1u| #7#) (|lp| #9=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ulst| (|List| F)) (#10=#:G1428 NIL) (|kk| NIL) (#11=#:G1427 NIL)
          (|vlst| (|List| F)) (#12=#:G1426 NIL) (#13=#:G1425 NIL)
          (|lk1| (|List| (|Kernel| F))) (#14=#:G1424 NIL) (#15=#:G1423 NIL)
          (|ng| (|SparseUnivariatePolynomial| F)) (|degs| #6#)
          (|ds| #16=(|SparseUnivariatePolynomial| F))
          (|nf| #17=(|SparseUnivariatePolynomial| F)) (|denf| #16#)
          (|fu| #18=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lnum| #17#) (|lden| #16#)
          (|her|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| #9#)
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |polypart| (|SparseUnivariatePolynomial| F))))
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|nfp| #17#) (|denfp| #16#) (|dk| #17#) (|dku| #18#) (|gu| #18#)
          (|fpu| #18#) (|lk| (|List| (|Kernel| F))) (#19=#:G1422 NIL)
          (#20=#:G1421 NIL) (|k| (|Kernel| F)) (|fp| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lk|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT $ 343))
                              (SPADCALL |g| (QREFELT $ 343)) (QREFELT $ 16))
                    |x| (QREFELT $ 15))
                   (LIST (SPADCALL |x| (QREFELT $ 60))) (QREFELT $ 16)))
            (LETT |f| (SPADCALL |n| |f| (QREFELT $ 238)))
            (LETT |fp| (SPADCALL |f| |x| (QREFELT $ 64)))
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| $ 45) (QREFELT $ 80))
               (SPADCALL |f| |g| |x| |lk| (QREFELT $ 58)))
              (#21='T
               (SEQ (LETT |k| (|RDEEFX;top_kernel| |f| |g| |x| $))
                    (LETT |lk|
                          (PROGN
                           (LETT #20# NIL)
                           (SEQ (LETT |kk| NIL) (LETT #19# |lk|) G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN (LETT |kk| (CAR #19#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |kk| |k| (QREFELT $ 344))
                                    (LETT #20# (CONS |kk| #20#))))))
                                (LETT #19# (CDR #19#)) (GO G190) G191
                                (EXIT (NREVERSE #20#)))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |k| (QREFELT $ 25)) (QREFELT $ 8)
                                 (QREFELT $ 26))
                       (|RDEEFX;ei_int_alg| 1 |f| |g| |x| |k| |lk| $))
                      (#21#
                       (SEQ (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 36)))
                            (LETT |gu| (SPADCALL |g| |k| (QREFELT $ 36)))
                            (EXIT
                             (COND
                              ((SPADCALL |k| '|%diff| (QREFELT $ 23))
                               (|RDEEFX;ei_int_diff| |f| |g| |gu| |x| |k| |lk|
                                $))
                              (#21#
                               (SEQ
                                (LETT |dku|
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 63))
                                                 |x| (QREFELT $ 324))
                                       |k| (QREFELT $ 36)))
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |dku| (QREFELT $ 40))
                                             (|spadConstant| $ 110)
                                             (QREFELT $ 111))
                                   (VECTOR (|spadConstant| $ 45)
                                           (|spadConstant| $ 45)
                                           (|spadConstant| $ 45) NIL))
                                  (#21#
                                   (SEQ
                                    (LETT |dk| (SPADCALL |dku| (QREFELT $ 39)))
                                    (LETT |denfp|
                                          (SPADCALL |fpu| (QREFELT $ 40)))
                                    (LETT |nfp|
                                          (SPADCALL |fpu| (QREFELT $ 39)))
                                    (LETT |derivation|
                                          (CONS #'|RDEEFX;ei_int;I2FSR;58!1|
                                                (VECTOR |dk| |x| $ |denfp|)))
                                    (LETT |her|
                                          (SPADCALL
                                           (SPADCALL |denfp| |gu|
                                                     (QREFELT $ 273))
                                           |derivation| |nfp| (QREFELT $ 381)))
                                    (LETT |lp| (QVELT |her| 1))
                                    (LETT |a1|
                                          (SPADCALL (QVELT |her| 0) |k|
                                                    (QREFELT $ 62)))
                                    (LETT |rr1|
                                          (SPADCALL
                                           (SPADCALL |lp|
                                                     (SPADCALL (QVELT |her| 3)
                                                               (QREFELT $ 49))
                                                     (QREFELT $ 329))
                                           (QVELT |her| 2) (QREFELT $ 329)))
                                    (LETT |rr1|
                                          (SPADCALL |rr1|
                                                    (SPADCALL |denfp|
                                                              (QREFELT $ 49))
                                                    (QREFELT $ 52)))
                                    (LETT |r1|
                                          (SPADCALL |g|
                                                    (SPADCALL |rr1| |k|
                                                              (QREFELT $ 62))
                                                    (QREFELT $ 79)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |rr1| (|spadConstant| $ 200)
                                                 (QREFELT $ 341))
                                       (VECTOR |a1| |g| (|spadConstant| $ 45)
                                               'T))
                                      (#21#
                                       (SEQ
                                        (LETT |lden|
                                              (SPADCALL |lp| (QREFELT $ 40)))
                                        (LETT |lnum|
                                              (SPADCALL |lp| (QREFELT $ 39)))
                                        (LETT |fu|
                                              (SPADCALL |f| |k|
                                                        (QREFELT $ 36)))
                                        (LETT |denf|
                                              (SPADCALL |fu| (QREFELT $ 40)))
                                        (LETT |nf|
                                              (SPADCALL |fu| (QREFELT $ 39)))
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 110)
                                                    (QREFELT $ 113))
                                          (COND
                                           ((EQL (SPADCALL |nf| (QREFELT $ 41))
                                                 0)
                                            (COND
                                             ((SPADCALL |k| '|exp|
                                                        (QREFELT $ 23))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |lp|
                                                           (|spadConstant| $
                                                                           200)
                                                           (QREFELT $ 370))
                                                 (VECTOR |a1| |r1|
                                                         (|spadConstant| $ 45)
                                                         NIL))
                                                (#21#
                                                 (SEQ
                                                  (LETT |ds|
                                                        (SPADCALL
                                                         (QVELT |her| 2)
                                                         (QREFELT $ 40)))
                                                  (COND
                                                   ((OR
                                                     (SPADCALL
                                                      (SPADCALL |ds|
                                                                (QREFELT $
                                                                         112))
                                                      (|spadConstant| $ 104)
                                                      (QREFELT $ 111))
                                                     (SPADCALL
                                                      (SPADCALL |ds|
                                                                (QREFELT $
                                                                         105))
                                                      (|spadConstant| $ 33)
                                                      (QREFELT $ 133)))
                                                    (EXIT
                                                     (|error|
                                                      "unexpected special part"))))
                                                  (LETT |degs|
                                                        (SPADCALL |ds|
                                                                  (QREFELT $
                                                                           41)))
                                                  (LETT |ng|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|spadConstant| $
                                                                           33)
                                                           |degs|
                                                           (QREFELT $ 46))
                                                          (QVELT |her| 3)
                                                          (QREFELT $ 99))
                                                         (SPADCALL
                                                          (QVELT |her| 2)
                                                          (QREFELT $ 39))
                                                         (QREFELT $ 51)))
                                                  (LETT |res5|
                                                        (|RDEEFX;ei_int_exp|
                                                         |f| |ng| |degs| |x|
                                                         |k| $))
                                                  (LETT |a1|
                                                        (SPADCALL |a1|
                                                                  (QVELT |res5|
                                                                         0)
                                                                  (QREFELT $
                                                                           75)))
                                                  (LETT |r1|
                                                        (SPADCALL |r1|
                                                                  (QVELT |res5|
                                                                         1)
                                                                  (QREFELT $
                                                                           75)))
                                                  (EXIT
                                                   (VECTOR |a1| |r1|
                                                           (QVELT |res5| 2)
                                                           (QVELT |res5|
                                                                  3)))))))))))))
                                        (LETT |lk1|
                                              (PROGN
                                               (LETT #15# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #14# (CONS |k| |lk|))
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #14#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #14#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((COND
                                                         ((SPADCALL |kk| '|log|
                                                                    (QREFELT $
                                                                             23))
                                                          'T)
                                                         (#21#
                                                          (SPADCALL |kk| '|exp|
                                                                    (QREFELT $
                                                                             23))))
                                                        (LETT #15#
                                                              (CONS |kk|
                                                                    #15#))))))
                                                    (LETT #14# (CDR #14#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #15#)))))
                                        (LETT |vlst|
                                              (PROGN
                                               (LETT #13# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #12# |lk1|) G190
                                                    (COND
                                                     ((OR (ATOM #12#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #12#))
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
                                                                          23))
                                                               (SPADCALL |kk|
                                                                         (QREFELT
                                                                          $
                                                                          63)))
                                                              ('T
                                                               (SPADCALL
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           $
                                                                           28))
                                                                1
                                                                (QREFELT $
                                                                         30))))
                                                             #13#))))
                                                    (LETT #12# (CDR #12#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #13#)))))
                                        (LETT |ulst|
                                              (PROGN
                                               (LETT #11# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #10# |lk1|) G190
                                                    (COND
                                                     ((OR (ATOM #10#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #10#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #11#
                                                            (CONS
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         '|log|
                                                                         (QREFELT
                                                                          $
                                                                          23))
                                                               (SPADCALL
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           $
                                                                           28))
                                                                1
                                                                (QREFELT $
                                                                         30)))
                                                              ('T
                                                               (SPADCALL |kk|
                                                                         (QREFELT
                                                                          $
                                                                          63))))
                                                             #11#))))
                                                    (LETT #10# (CDR #10#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #11#)))))
                                        (LETT |ar1|
                                              (|RDEEFX;handle_logpart| |lnum|
                                               |lden| |nf| |denf| |nfp| |denfp|
                                               |k| |vlst| |ulst| |x| $))
                                        (LETT |ansp| (QVELT |ar1| 0))
                                        (LETT |lp|
                                              (SPADCALL |lp| (QVELT |ar1| 1)
                                                        (QREFELT $ 272)))
                                        (QSETVELT |her| 2
                                                  (SPADCALL (QVELT |her| 2)
                                                            (QVELT |ar1| 3)
                                                            (QREFELT $ 272)))
                                        (QSETVELT |her| 3
                                                  (SPADCALL (QVELT |her| 3)
                                                            (QVELT |ar1| 2)
                                                            (QREFELT $ 48)))
                                        (LETT |lp1u|
                                              (SPADCALL |lp| (QREFELT $ 267)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |lp1u| 1)
                                           (VECTOR |a1| |r1|
                                                   (|spadConstant| $ 45) NIL))
                                          (#21#
                                           (SEQ
                                            (QSETVELT |her| 3
                                                      (SPADCALL (QVELT |her| 3)
                                                                (QCDR |lp1u|)
                                                                (QREFELT $
                                                                         51)))
                                            (COND
                                             ((SPADCALL (QVELT |her| 3)
                                                        (|spadConstant| $ 104)
                                                        (QREFELT $ 113))
                                              (COND
                                               ((SPADCALL (QVELT |her| 2)
                                                          (|spadConstant| $
                                                                          200)
                                                          (QREFELT $ 341))
                                                (EXIT
                                                 (VECTOR |a1| |g| |ansp|
                                                         'T))))))
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| $ 110)
                                                        (QREFELT $ 113))
                                              (COND
                                               ((EQL
                                                 (SPADCALL |nf| (QREFELT $ 41))
                                                 0)
                                                (COND
                                                 ((OR
                                                   (SPADCALL |k| '|log|
                                                             (QREFELT $ 23))
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT $ 25))
                                                    (QREFELT $ 9)
                                                    (QREFELT $ 26)))
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |lp|
                                                               (|spadConstant|
                                                                $ 200)
                                                               (QREFELT $ 370))
                                                     (VECTOR |a1| |r1|
                                                             (|spadConstant| $
                                                                             45)
                                                             NIL))
                                                    ((SPADCALL (QVELT |her| 2)
                                                               (|spadConstant|
                                                                $ 200)
                                                               (QREFELT $ 370))
                                                     (|error|
                                                      "unexpected special part"))
                                                    (#21#
                                                     (SEQ
                                                      (LETT |res5|
                                                            (|RDEEFX;ei_int_log|
                                                             |f|
                                                             (QVELT |her| 3)
                                                             |x| |k| $))
                                                      (LETT |a1|
                                                            (SPADCALL |a1|
                                                                      (QVELT
                                                                       |res5|
                                                                       0)
                                                                      (QREFELT
                                                                       $ 75)))
                                                      (LETT |r1|
                                                            (SPADCALL |r1|
                                                                      (QVELT
                                                                       |res5|
                                                                       1)
                                                                      (QREFELT
                                                                       $ 75)))
                                                      (EXIT
                                                       (VECTOR |a1| |r1|
                                                               (SPADCALL |ansp|
                                                                         (QVELT
                                                                          |res5|
                                                                          2)
                                                                         (QREFELT
                                                                          $
                                                                          75))
                                                               (QVELT |res5|
                                                                      3)))))))))))))
                                            (LETT |rr1|
                                                  (SPADCALL
                                                   (SPADCALL (QVELT |her| 3)
                                                             (QREFELT $ 49))
                                                   (QVELT |her| 2)
                                                   (QREFELT $ 329)))
                                            (LETT |rr1|
                                                  (SPADCALL |rr1|
                                                            (SPADCALL |denfp|
                                                                      (QREFELT
                                                                       $ 49))
                                                            (QREFELT $ 52)))
                                            (PROGN
                                             (LETT |#G482|
                                                   (|RDEEFX;gamma_denominator|
                                                    |denf| |k| $))
                                             (LETT |gden1| (QCAR |#G482|))
                                             (LETT |gexp| (QCDR |#G482|))
                                             |#G482|)
                                            (LETT |derivation2|
                                                  (CONS
                                                   #'|RDEEFX;ei_int;I2FSR;58!3|
                                                   (VECTOR |dk| |x| $)))
                                            (LETT |denf_split|
                                                  (SPADCALL |denf|
                                                            |derivation2|
                                                            (QREFELT $ 384)))
                                            (LETT |ndenf| (QCAR |denf_split|))
                                            (LETT |her2|
                                                  (|RDEEFX;special_Hermite|
                                                   |rr1| |nfp| |ndenf| |denfp|
                                                   |derivation2| $))
                                            (LETT |a1|
                                                  (SPADCALL |a1|
                                                            (SPADCALL
                                                             (QCAR |her2|) |k|
                                                             (QREFELT $ 62))
                                                            (QREFELT $ 75)))
                                            (LETT |rr1| (QCDR |her2|))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |rr1|
                                                         (|spadConstant| $ 200)
                                                         (QREFELT $ 341))
                                               (VECTOR |a1| |g| |ansp| 'T))
                                              (#21#
                                               (SEQ
                                                (COND
                                                 ((SPADCALL |denf|
                                                            (|spadConstant| $
                                                                            110)
                                                            (QREFELT $ 113))
                                                  (COND
                                                   ((EQL
                                                     (SPADCALL |nf|
                                                               (QREFELT $ 41))
                                                     2)
                                                    (COND
                                                     ((SPADCALL |k| '|log|
                                                                (QREFELT $ 23))
                                                      (EXIT
                                                       (|RDEEFX;quadratic_log_erf_integrate|
                                                        |nf| |nfp| |rr1| |a1|
                                                        |g| |ansp| |derivation|
                                                        |vlst| |ulst| |k| |lk|
                                                        |x| $))))))))
                                                (LETT |scands|
                                                      (|RDEEFX;special_candidates|
                                                       |nf| |denf| |gden1|
                                                       |gexp| |vlst| |ulst| |k|
                                                       |x| $))
                                                (LETT |derivation3|
                                                      (CONS
                                                       #'|RDEEFX;ei_int;I2FSR;58!4|
                                                       (VECTOR |derivation2|
                                                               $)))
                                                (LETT |scoeffs|
                                                      (|RDEEFX;get_scoeffs|
                                                       |scands| |denf| |k|
                                                       |derivation3| $))
                                                (LETT |rr1f|
                                                      (SPADCALL |rr1| |k|
                                                                (QREFELT $
                                                                         62)))
                                                (LETT |r1|
                                                      (SPADCALL |g| |rr1f|
                                                                (QREFELT $
                                                                         79)))
                                                (LETT |log_recursion| NIL)
                                                (COND
                                                 ((SPADCALL |denf|
                                                            (|spadConstant| $
                                                                            110)
                                                            (QREFELT $ 113))
                                                  (COND
                                                   ((SPADCALL |k| '|log|
                                                              (QREFELT $ 23))
                                                    (COND
                                                     ((EQL
                                                       (SPADCALL |nf|
                                                                 (QREFELT $
                                                                          41))
                                                       1)
                                                      (SEQ
                                                       (LETT |lc|
                                                             (SPADCALL |nf|
                                                                       (QREFELT
                                                                        $
                                                                        105)))
                                                       (LETT |rcu1|
                                                             (SPADCALL |lc|
                                                                       (QREFELT
                                                                        $
                                                                        161)))
                                                       (EXIT
                                                        (LETT |log_recursion|
                                                              (QEQCAR |rcu1|
                                                                      0))))))))))
                                                (EXIT
                                                 (COND
                                                  (|log_recursion|
                                                   (SEQ
                                                    (COND
                                                     (|log_recursion|
                                                      (SEQ
                                                       (LETT |spec1u|
                                                             (SPADCALL |rr1|
                                                                       (QREFELT
                                                                        $
                                                                        267)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |spec1u| 1)
                                                          (|error|
                                                           "impossible 9"))
                                                         (#21#
                                                          (SEQ
                                                           (LETT |spec1p|
                                                                 (QCDR
                                                                  |spec1u|))
                                                           (LETT |d|
                                                                 (SPADCALL
                                                                  |spec1p|
                                                                  (QREFELT $
                                                                           41)))
                                                           (LETT |aa|
                                                                 (|spadConstant|
                                                                  $ 45))
                                                           (LETT |kf|
                                                                 (SPADCALL |k|
                                                                           (QREFELT
                                                                            $
                                                                            63)))
                                                           (LETT |dkf|
                                                                 (SPADCALL |dk|
                                                                           (QREFELT
                                                                            $
                                                                            205)))
                                                           (SEQ
                                                            (EXIT
                                                             (SEQ
                                                              (LETT |j| |d|)
                                                              G190
                                                              (COND
                                                               ((< |j| 0)
                                                                (GO G191)))
                                                              (SEQ
                                                               (LETT |gj|
                                                                     (|spadConstant|
                                                                      $ 45))
                                                               (COND
                                                                ((EQL |j|
                                                                      (SPADCALL
                                                                       |spec1p|
                                                                       (QREFELT
                                                                        $ 41)))
                                                                 (SEQ
                                                                  (LETT |gj|
                                                                        (SPADCALL
                                                                         |spec1p|
                                                                         (QREFELT
                                                                          $
                                                                          105)))
                                                                  (EXIT
                                                                   (LETT
                                                                    |spec1p|
                                                                    (SPADCALL
                                                                     |spec1p|
                                                                     (QREFELT $
                                                                              112)))))))
                                                               (LETT |ff|
                                                                     (SPADCALL
                                                                      |gj|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (+ |j|
                                                                            1)
                                                                         (QREFELT
                                                                          $
                                                                          76))
                                                                        |dkf|
                                                                        (QREFELT
                                                                         $ 67))
                                                                       |aa|
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 79)))
                                                               (EXIT
                                                                (COND
                                                                 ((EQL |j| 0)
                                                                  (PROGN
                                                                   (LETT #5#
                                                                         |$NoValue|)
                                                                   (GO
                                                                    #22=#:G1397)))
                                                                 ('T
                                                                  (SEQ
                                                                   (EXIT
                                                                    (SEQ
                                                                     (LETT
                                                                      |res7|
                                                                      (SPADCALL
                                                                       |f| |ff|
                                                                       |x|
                                                                       (CONS
                                                                        |k|
                                                                        |lk|)
                                                                       (QREFELT
                                                                        $ 58)))
                                                                     (LETT |aa|
                                                                           (QVELT
                                                                            |res7|
                                                                            0))
                                                                     (LETT |a1|
                                                                           (SPADCALL
                                                                            |a1|
                                                                            (SPADCALL
                                                                             |aa|
                                                                             (SPADCALL
                                                                              |kf|
                                                                              |j|
                                                                              (QREFELT
                                                                               $
                                                                               345))
                                                                             (QREFELT
                                                                              $
                                                                              67))
                                                                            (QREFELT
                                                                             $
                                                                             75)))
                                                                     (LETT |r1|
                                                                           (SPADCALL
                                                                            |r1|
                                                                            (SPADCALL
                                                                             (QVELT
                                                                              |res7|
                                                                              1)
                                                                             (SPADCALL
                                                                              |kf|
                                                                              |j|
                                                                              (QREFELT
                                                                               $
                                                                               345))
                                                                             (QREFELT
                                                                              $
                                                                              67))
                                                                            (QREFELT
                                                                             $
                                                                             75)))
                                                                     (EXIT
                                                                      (COND
                                                                       ((NULL
                                                                         (QVELT
                                                                          |res7|
                                                                          3))
                                                                        (PROGN
                                                                         (LETT
                                                                          #4#
                                                                          (PROGN
                                                                           (LETT
                                                                            #2#
                                                                            (VECTOR
                                                                             |a1|
                                                                             |r1|
                                                                             |ansp|
                                                                             (QVELT
                                                                              |res7|
                                                                              3)))
                                                                           (GO
                                                                            #23=#:G1417)))
                                                                         (GO
                                                                          #24=#:G1395)))))))
                                                                   #24#
                                                                   (EXIT
                                                                    #4#))))))
                                                              (LETT |j|
                                                                    (+ |j| -1))
                                                              (GO G190) G191
                                                              (EXIT NIL)))
                                                            #22# (EXIT #5#))
                                                           (EXIT
                                                            (COND
                                                             ((SPADCALL |ff|
                                                                        (|spadConstant|
                                                                         $ 45)
                                                                        (QREFELT
                                                                         $ 80))
                                                              (PROGN
                                                               (LETT #2#
                                                                     (VECTOR
                                                                      |a1| |r1|
                                                                      |ansp|
                                                                      'T))
                                                               (GO #23#)))
                                                             (#21#
                                                              (SEQ
                                                               (LETT |rr1f|
                                                                     |ff|)
                                                               (LETT |lc|
                                                                     (SPADCALL
                                                                      |nf|
                                                                      (QREFELT
                                                                       $ 105)))
                                                               (LETT |rcu1|
                                                                     (SPADCALL
                                                                      |lc|
                                                                      (QREFELT
                                                                       $ 161)))
                                                               (EXIT
                                                                (COND
                                                                 ((QEQCAR
                                                                   |rcu1| 1)
                                                                  "skip")
                                                                 (#21#
                                                                  (SEQ
                                                                   (LETT |rcq|
                                                                         (QCDR
                                                                          |rcu1|))
                                                                   (LETT |rcu2|
                                                                         (SPADCALL
                                                                          |rcq|
                                                                          (QREFELT
                                                                           $
                                                                           193)))
                                                                   (EXIT
                                                                    (COND
                                                                     ((QEQCAR
                                                                       |rcu2|
                                                                       1)
                                                                      "skip")
                                                                     (#21#
                                                                      (SEQ
                                                                       (LETT
                                                                        |rc|
                                                                        (QCDR
                                                                         |rcu2|))
                                                                       (LETT
                                                                        |u|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |k|
                                                                           (QREFELT
                                                                            $
                                                                            28))
                                                                          1
                                                                          (QREFELT
                                                                           $
                                                                           30))
                                                                         |rc|
                                                                         (QREFELT
                                                                          $
                                                                          81)))
                                                                       (LETT
                                                                        |f1|
                                                                        (SPADCALL
                                                                         |nf| 0
                                                                         (QREFELT
                                                                          $
                                                                          43)))
                                                                       (LETT
                                                                        |res4|
                                                                        (SPADCALL
                                                                         1 |f1|
                                                                         (SPADCALL
                                                                          |rr1f|
                                                                          |u|
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         |x|
                                                                         (QREFELT
                                                                          $
                                                                          68)))
                                                                       (LETT
                                                                        |a1|
                                                                        (SPADCALL
                                                                         |a1|
                                                                         (SPADCALL
                                                                          (QVELT
                                                                           |res4|
                                                                           0)
                                                                          |u|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          75)))
                                                                       (LETT
                                                                        |ansp|
                                                                        (SPADCALL
                                                                         |ansp|
                                                                         (QVELT
                                                                          |res4|
                                                                          2)
                                                                         (QREFELT
                                                                          $
                                                                          75)))
                                                                       (LETT
                                                                        |r1|
                                                                        (SPADCALL
                                                                         |r1|
                                                                         (SPADCALL
                                                                          (QVELT
                                                                           |res4|
                                                                           1)
                                                                          |u|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          75)))
                                                                       (EXIT
                                                                        (PROGN
                                                                         (LETT
                                                                          #2#
                                                                          (VECTOR
                                                                           |a1|
                                                                           |r1|
                                                                           |ansp|
                                                                           (QVELT
                                                                            |res4|
                                                                            3)))
                                                                         (GO
                                                                          #23#))))))))))))))))))))))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |r1| |g|
                                                                 (QREFELT $
                                                                          80))
                                                       (VECTOR |a1| |g| |ansp|
                                                               'T))
                                                      (#21#
                                                       (SEQ
                                                        (LETT |res6|
                                                              (SPADCALL |f|
                                                                        |rr1f|
                                                                        |x|
                                                                        (CONS
                                                                         |k|
                                                                         |lk|)
                                                                        (QREFELT
                                                                         $
                                                                         58)))
                                                        (EXIT
                                                         (VECTOR
                                                          (SPADCALL |a1|
                                                                    (QVELT
                                                                     |res6| 0)
                                                                    (QREFELT $
                                                                             75))
                                                          (SPADCALL |r1|
                                                                    (QVELT
                                                                     |res6| 1)
                                                                    (QREFELT $
                                                                             75))
                                                          |ansp|
                                                          (QVELT |res6|
                                                                 3)))))))))
                                                  (#21#
                                                   (SEQ
                                                    (LETT |res3|
                                                          (|RDEEFX;special_integrate2|
                                                           |nfp| |denfp| |denf|
                                                           |ndenf| |f| |k| |lk|
                                                           |x| |rr1| |a1| |r1|
                                                           |g| |scoeffs|
                                                           |scands| |gexp| $))
                                                    (EXIT
                                                     (VECTOR
                                                      (SPADCALL |a1|
                                                                (QVELT |res3|
                                                                       0)
                                                                (QREFELT $ 75))
                                                      (SPADCALL |r1|
                                                                (QVELT |res3|
                                                                       1)
                                                                (QREFELT $ 75))
                                                      (SPADCALL |ansp|
                                                                (QVELT |res3|
                                                                       2)
                                                                (QREFELT $ 75))
                                                      (QVELT |res3|
                                                             3)))))))))))))))))))))))))))))))))))))
          #23# (EXIT #2#)))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation2|)
          (LETT $ (QREFELT $$ 1))
          (LETT |derivation2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) |derivation2|)
                        (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 39))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 40)) |derivation2|)
                        (QREFELT $ 99))
              (QREFELT $ 48))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 40))
                       (SPADCALL |z1| (QREFELT $ 40)) (QREFELT $ 99))
             (QREFELT $ 199)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!3| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEEFX;ei_int;I2FSR;58!2| (VECTOR $ |x|))
                             |dk| (QREFELT $ 378))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!2| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 324)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| $ |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2FSR;58!0|
                                             (VECTOR $ |x|))
                                       |dk| (QREFELT $ 378))
                             (QREFELT $ 99))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 324)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX| (&REST #1=#:G1429)
  (SPROG NIL
         (PROG (#2=#:G1430)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryRischDEX;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX|)))))))))) 

(DEFUN |ElementaryRischDEX;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ElementaryRischDEX| DV$1 DV$2))
          (LETT $ (GETREFV 385))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 9 '|prim|)
          (QSETREFV $ 94 (SPADCALL (QREFELT $ 93)))
          (COND
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (PROGN
             (QSETREFV $ 366
                       (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;54|) $))))
           ('T
            (QSETREFV $ 366
                      (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;55|) $))))
          $))) 

(MAKEPROP '|ElementaryRischDEX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|List| 35) (0 . |kernels|) (|List| 18) (|Symbol|)
              (|IntegrationTools| 6 7) (5 . |varselect|) (11 . |union|)
              (|NonNegativeInteger|) (|Kernel| 7) (17 . |height|) (|Boolean|)
              (22 . |member?|) (28 . >) (34 . |is?|) (|BasicOperator|)
              (40 . |operator|) (45 . |has?|) (|List| 7) (51 . |argument|)
              (|Integer|) (56 . |elt|) (62 . |retract|) (67 . |One|)
              (71 . |One|) (|Fraction| 177) (|Kernel| $) (75 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 37) (81 . |numer|)
              (86 . |denom|) (91 . |degree|) (96 . >) (102 . |coefficient|)
              (108 . |Zero|) (112 . |Zero|) (116 . |monomial|) (122 . |coerce|)
              (127 . -) (133 . |coerce|) (138 . -) (143 . +) (149 . /)
              (155 . |kmax|) (|Union| 13 '"failed") (160 . |symbolIfCan|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 20))
              (|ElementaryRischDEX2| 6 7) (165 . |do_risch_DE|) (173 . |new|)
              (177 . |kernel|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 136 7)
              (182 . |multivariate|) (188 . |coerce|) (193 . D) (|List| $)
              (199 . |eval|) (206 . *) |RDEEFX;ei_int;I2FSR;58| (212 . /)
              (218 . |eval|) (|SparseUnivariatePolynomial| 37) (|Mapping| 37 7)
              (|SparseUnivariatePolynomialFunctions2| 7 37) (225 . |map|)
              (231 . +) (237 . |coerce|) (|Mapping| 7 7 7) (242 . |reduce|)
              (249 . -) (255 . =) (261 . ^) (|Vector| 7) (267 . |vector|)
              (|Union| 88 '"failed") (|IntegerLinearDependence| 7)
              (272 . |particularSolutionOverQ|)
              (|Record| (|:| |num| 114) (|:| |den| 29)) (|Vector| 141)
              (|InnerCommonDenominator| 29 141 114 88)
              (278 . |splitDenominator|) (283 . ~=) (|SingletonAsOrderedSet|)
              (289 . |create|) '|dummy| (293 . |eval|) (300 . |coefficients|)
              (|Mapping| 20 7) (305 . |every?|) (311 . *) (317 . |monomial|)
              (323 . |coerce|) (328 . +) (334 . |resultant|) (340 . |Zero|)
              (344 . |leadingCoefficient|) (349 . /) (355 . |gcd|)
              (|Union| $ '"failed") (361 . |exquo|) (367 . |One|) (371 . ~=)
              (377 . |reductum|) (382 . =) (|List| 29) (|Vector| 29)
              (388 . |vector|) (393 . |gcd|) (398 . |elt|) (404 . |exquo|)
              (410 . |setelt!|) (417 . |invmod|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (423 . |extendedEuclidean|) (429 . *) (435 . +) (|Factored| 37)
              (|ExpressionFactorPolynomial| 6 7) (441 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 129) (|:| |factor| 37) (|:| |exponent| 17))
              (|List| 130) (446 . |factorList|) (451 . ~=)
              (|Union| 29 '#1="failed") (457 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 6 18) (462 . |One|) (466 . *)
              (|Record| (|:| |particular| 84) (|:| |basis| (|List| 88)))
              (472 . |solveLinearlyOverQ|) (|Fraction| 29) (478 . |coerce|)
              (|List| 141) (483 . |entries|) (488 . |vector|) (493 . |entries|)
              (|Fraction| 158) (|Equation| 147) (498 . |rhs|) (503 . |Zero|)
              (507 . ~=) (513 . |lhs|) (518 . |retract|) (523 . ~=)
              (|Union| 158 '#2="failed") (529 . |retractIfCan|)
              (|Union| 7 '"failed") (|Polynomial| 7) (534 . |retractIfCan|)
              (|Union| 141 '#1#) (539 . |retractIfCan|) (544 . |numer|)
              (|List| 13) (549 . |variables|) (554 . |member?|) (560 . |eval|)
              (567 . |retract|) (|FunctionSpaceRationalRoots| 6 7)
              (572 . |get_rational_roots|) (578 . |coerce|) (583 . |rest|)
              (588 . |rest|) (|SparseUnivariatePolynomial| 158)
              (|Mapping| 158 7) (|SparseUnivariatePolynomialFunctions2| 7 158)
              (593 . |map|) (|SparseUnivariatePolynomial| $)
              (599 . |multivariate|) (|SparseMultivariatePolynomial| 6 35)
              (605 . |numer|) (610 . |coerce|) (615 . |coerce|) (|List| 188)
              (|List| 147) (|SystemSolvePackage| 7) (620 . |solve|) (626 . -)
              (|List| 148) (632 . |last|) (637 . |coerce|) (642 . |univariate|)
              (647 . |rem|) (653 . |retractIfCan|) (658 . |differentiate|)
              (663 . |resultant|) (669 . |member?|) (675 . *) (681 . ^)
              (687 . /) (693 . |Zero|) (|Mapping| 37 37 37) (|List| 37)
              (697 . |reduce|) (704 . |unit|) (709 . |retract|)
              (|Record| (|:| |exponent| 17) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 136 7)
              (714 . |froot|) (720 . *) (|PositiveInteger|) (726 . *)
              (|Matrix| 7) (732 . |zero|) (738 . |setelt!|) (746 . |zero|)
              (751 . |solveLinearlyOverQ|) (757 . |elt|) (763 . |denom|)
              (768 . *) (774 . |numer|) (779 . |minimumDegree|) (784 . |One|)
              (|List| 143) (|Matrix| 141) (788 . |matrix|)
              (|LinearSystemMatrixPackage| 141 88 88 224) (793 . |solve|)
              (799 . |parts|) (804 . |setelt!|) (811 . |Zero|) (815 . /)
              (821 . *) (827 . -) (833 . |retractIfCan|) (838 . ~=) (844 . =)
              (850 . |retract|) (855 . *) (861 . |makeFR|) (|Factored| $)
              (867 . |squareFree|) (872 . |rootOf|) (877 . *) (883 . |elt|)
              (|Union| 82 '"failed") (|Mapping| 7 7) (|List| 246)
              (|ConstantLinearDependence| 6 7)
              (889 . |particularSolutionOverConstants|)
              (|Record| (|:| |logands| 27) (|:| |basis| (|List| 88)))
              (|ParametricIntegration| 6 7) (896 . |logextint|)
              (|LaurentPolynomial| 7 37) (903 . |coerce|) (908 . |max|)
              (914 . |max|) (|Mapping| 17 17 17) (|List| 17) (920 . |reduce|)
              (|Mapping| 250 12 27) (|ParametricRischDE| 6 7)
              (926 . |exp_lower_bound|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 82))
              (|Union| 263 '"failed") (937 . |do_param_RDE|) (|Union| 37 '#2#)
              (946 . |retractIfCan|)
              (|Record| (|:| |ans| 37) (|:| |remainder| 37)) (|Mapping| 37 37)
              (|RDEaux| 7) (951 . SPDE1) (958 . -) (964 . *) (970 . |One|)
              (974 . |setelt!|) (981 . |denom|) (|Factored| 136)
              (|MultivariateFactorize| 18 (|IndexedExponents| 18) 6 136)
              (986 . |factor|)
              (|Record| (|:| |flag| 129) (|:| |factor| 136)
                        (|:| |exponent| 17))
              (|List| 280) (991 . |factorList|) (996 . *) (1002 . *)
              (|Mapping| 136 136 136) (|List| 136) (1008 . |reduce|) (1015 . *)
              (1021 . ^) (1027 . |unit|) (1032 . |retract|) (1037 . *)
              (1043 . ^) (1049 . |concat|) (|List| 27) (1055 . |matrix|)
              (|Record| (|:| |mat| 303) (|:| |vec| 115)) (|Matrix| $)
              (|Vector| $) (1060 . |reducedSystem|) (|Union| 115 '"failed")
              (|Record| (|:| |particular| 301) (|:| |basis| (|List| 115)))
              (|Matrix| 29) (|SmithNormalForm| 29 115 115 303)
              (1066 . |diophantineSystem|) (1072 . /) (|Union| 295 '"failed")
              (|DenominatorIntegration| 6 7) (1078 . |solve_u|)
              (1085 . |second|) (1090 . |reduce|)
              (|PartialFractionUtilities| 7 37) (1096 . |decompose|)
              (1102 . |univariate|) (1109 . |retract|) (1114 . ^) (1120 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (1126 . |divide|) (1132 . |elt|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 321 '"failed") (1138 . |extendedEuclidean|)
              (1145 . |differentiate|) (1151 . |exp|) (1156 . |Ei|)
              (1161 . |zerosOf|) (1166 . |retract|) (1171 . +) (1177 . |elt|)
              (|Vector| 37) (1184 . |elt|)
              (|Record| (|:| |factor| 37) (|:| |ratpart| 29) (|:| |v_part| 7)
                        (|:| |alg_part| 37) (|:| |u_part| 7)
                        (|:| |exponent| 29) (|:| |shift_part| 7))
              (|List| 333) (1190 . |elt|) (1196 . <=) (1202 . |vector|)
              (|Record| (|:| |basis| 331) (|:| |transform| 303))
              (|GcdBasis| 37) (1207 . |gcdDecomposition|) (1212 . =)
              (1218 . |elt|) (1225 . |tower|) (1230 . ~=) (1236 . ^)
              (1242 . |ksec|) (1249 . *) (1255 . |sqrt|) (1260 . |pi|)
              (1264 . |erf|) (|List| 6) (1269 . |coefficients|) (|Complex| 29)
              (1274 . |imag|) (1279 . |Zero|) (1283 . =) (|Mapping| 20 353)
              (|List| 353) (1289 . |every?|) (1295 . |real|) (1300 . |complex|)
              (1306 . |coerce|) (1311 . |smaller?|) (1317 . |fresnelC|)
              (1322 . |fresnelS|) (1327 . |mk_erf|) (1333 . |log|)
              (1338 . |Gamma|) (1344 . ^) (1350 . ~=) (1356 . |coerce|)
              (1361 . |eval|) (|String|) (|OutputForm|) (1368 . |message|)
              (|Void|) (1373 . |print|) (1378 . |differentiate|)
              (|Record| (|:| |answer| 38) (|:| |logpart| 38)
                        (|:| |specpart| 38) (|:| |polypart| 37))
              (|TranscendentalHermiteIntegration| 7 37)
              (1385 . |HermiteIntegrate|)
              (|Record| (|:| |normal| 37) (|:| |special| 37))
              (|MonomialExtensionTools| 7 37) (1392 . |split|))
           '#(|mk_erf| 1398 |ei_int| 1404) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 384
                                                 '(1 7 10 0 11 2 14 12 12 13 15
                                                   2 14 12 12 12 16 1 18 17 0
                                                   19 2 12 20 18 0 21 2 17 20 0
                                                   0 22 2 18 20 0 13 23 1 18 24
                                                   0 25 2 24 20 0 13 26 1 18 27
                                                   0 28 2 27 7 0 29 30 1 7 29 0
                                                   31 0 6 0 32 0 7 0 33 2 7 34
                                                   0 35 36 1 38 37 0 39 1 38 37
                                                   0 40 1 37 17 0 41 2 29 20 0
                                                   0 42 2 37 7 0 17 43 0 6 0 44
                                                   0 7 0 45 2 37 0 7 17 46 1 37
                                                   0 7 47 2 37 0 0 0 48 1 38 0
                                                   37 49 1 7 0 0 50 2 37 0 0 0
                                                   51 2 38 0 0 0 52 1 14 18 12
                                                   53 1 18 54 0 55 4 57 56 7 7
                                                   13 12 58 0 13 0 59 1 18 0 13
                                                   60 2 61 7 38 18 62 1 7 0 35
                                                   63 2 7 0 0 13 64 3 7 0 0 10
                                                   65 66 2 7 0 0 0 67 2 7 0 0 0
                                                   69 3 7 0 0 35 0 70 2 73 71
                                                   72 37 74 2 7 0 0 0 75 1 7 0
                                                   29 76 3 27 7 77 0 7 78 2 7 0
                                                   0 0 79 2 7 20 0 0 80 2 7 0 0
                                                   29 81 1 82 0 27 83 2 85 84
                                                   82 7 86 1 89 87 88 90 2 29
                                                   20 0 0 91 0 92 0 93 3 37 0 0
                                                   92 0 95 1 37 27 0 96 2 27 20
                                                   97 0 98 2 37 0 0 0 99 2 71 0
                                                   37 17 100 1 71 0 37 101 2 71
                                                   0 0 0 102 2 71 37 0 0 103 0
                                                   37 0 104 1 37 7 0 105 2 37 0
                                                   0 7 106 2 37 0 0 0 107 2 37
                                                   108 0 0 109 0 37 0 110 2 37
                                                   20 0 0 111 1 37 0 0 112 2 37
                                                   20 0 0 113 1 115 0 114 116 1
                                                   29 0 65 117 2 115 29 0 29
                                                   118 2 29 108 0 0 119 3 115
                                                   29 0 29 29 120 2 29 0 0 0
                                                   121 2 29 122 0 0 123 2 115 0
                                                   29 0 124 2 115 0 0 0 125 1
                                                   127 126 37 128 1 126 131 0
                                                   132 2 7 20 0 0 133 1 7 134 0
                                                   135 0 136 0 137 2 37 0 7 0
                                                   138 2 85 139 82 7 140 1 141
                                                   0 29 142 1 88 143 0 144 1 88
                                                   0 143 145 1 115 114 0 146 1
                                                   148 147 0 149 0 147 0 150 2
                                                   147 20 0 0 151 1 148 147 0
                                                   152 1 147 13 0 153 2 13 20 0
                                                   0 154 1 147 155 0 156 1 158
                                                   157 0 159 1 7 160 0 161 1
                                                   147 158 0 162 1 158 163 0
                                                   164 2 163 20 13 0 165 3 158
                                                   0 0 13 7 166 1 158 7 0 167 2
                                                   168 143 7 18 169 1 158 0 7
                                                   170 1 163 0 0 171 1 12 0 0
                                                   172 2 175 173 174 37 176 2
                                                   158 0 177 13 178 1 7 179 0
                                                   180 1 7 0 179 181 1 147 0
                                                   158 182 2 185 183 184 163
                                                   186 2 147 0 0 0 187 1 188
                                                   148 0 189 1 7 0 141 190 1
                                                   158 37 0 191 2 37 0 0 0 192
                                                   1 141 134 0 193 1 37 0 0 194
                                                   2 37 7 0 0 195 2 143 20 141
                                                   0 196 2 29 0 17 0 197 2 37 0
                                                   0 17 198 2 38 0 37 37 199 0
                                                   38 0 200 3 202 37 201 0 37
                                                   203 1 126 37 0 204 1 37 7 0
                                                   205 2 207 206 7 17 208 2 37
                                                   0 0 7 209 2 17 0 210 0 211 2
                                                   212 0 17 17 213 4 212 7 0 29
                                                   29 7 214 1 82 0 17 215 2 85
                                                   139 212 82 216 2 88 141 0 29
                                                   217 1 141 29 0 218 2 141 0
                                                   29 0 219 1 141 29 0 220 1 37
                                                   17 0 221 0 141 0 222 1 224 0
                                                   223 225 2 226 139 224 88 227
                                                   1 88 143 0 228 3 88 141 0 29
                                                   141 229 0 141 0 230 2 141 0
                                                   29 29 231 2 141 0 0 29 232 2
                                                   141 0 0 0 233 1 37 157 0 234
                                                   2 17 20 0 0 235 2 141 20 0 0
                                                   236 1 141 29 0 237 2 7 0 29
                                                   0 238 2 126 0 37 131 239 1
                                                   37 240 0 241 1 7 0 177 242 2
                                                   29 0 210 0 243 2 82 7 0 29
                                                   244 3 248 245 82 7 247 249 3
                                                   251 250 13 12 27 252 1 253 0
                                                   37 254 2 29 0 0 0 255 2 17 0
                                                   0 0 256 2 258 17 257 0 259 7
                                                   261 29 37 253 29 29 12 7 260
                                                   262 5 57 264 7 7 27 13 12
                                                   265 1 38 266 0 267 3 270 268
                                                   37 37 269 271 2 38 0 0 0 272
                                                   2 38 0 37 0 273 0 38 0 274 3
                                                   82 7 0 29 7 275 1 7 179 0
                                                   276 1 278 277 136 279 1 277
                                                   281 0 282 2 29 0 0 0 283 2
                                                   136 0 0 0 284 3 286 136 285
                                                   0 136 287 2 141 0 0 141 288
                                                   2 136 0 0 17 289 1 277 136 0
                                                   290 1 136 6 0 291 2 7 0 6 0
                                                   292 2 7 0 0 210 293 2 27 0 0
                                                   0 294 1 212 0 295 296 2 7
                                                   297 298 299 300 2 304 302
                                                   303 115 305 2 141 0 0 0 306
                                                   3 308 307 7 7 13 309 1 27 7
                                                   0 310 2 202 37 201 0 311 2
                                                   312 202 37 202 313 3 61 37 7
                                                   18 37 314 1 7 35 0 315 2 38
                                                   0 0 29 316 2 38 0 0 0 317 2
                                                   37 318 0 0 319 2 202 37 0 29
                                                   320 3 37 322 0 0 0 323 2 7 0
                                                   0 13 324 1 7 0 0 325 1 7 0 0
                                                   326 1 7 65 177 327 1 38 37 0
                                                   328 2 38 0 0 0 329 3 303 29
                                                   0 29 29 330 2 331 37 0 29
                                                   332 2 334 333 0 29 335 2 29
                                                   20 0 0 336 1 331 0 202 337 1
                                                   339 338 331 340 2 38 20 0 0
                                                   341 3 303 0 0 114 114 342 1
                                                   7 10 0 343 2 18 20 0 0 344 2
                                                   7 0 0 17 345 3 14 18 18 12
                                                   13 346 2 38 0 0 37 347 1 7 0
                                                   0 348 0 7 0 349 1 7 0 0 350
                                                   1 136 351 0 352 1 353 29 0
                                                   354 0 29 0 355 2 29 20 0 0
                                                   356 2 358 20 357 0 359 1 353
                                                   29 0 360 2 353 0 29 29 361 1
                                                   7 0 6 362 2 7 20 0 0 363 1 7
                                                   0 0 364 1 7 0 0 365 2 0 7 7
                                                   7 366 1 7 0 0 367 2 7 0 0 0
                                                   368 2 7 0 0 0 369 2 38 20 0
                                                   0 370 1 7 0 13 371 3 7 0 0 0
                                                   0 372 1 374 0 373 375 1 374
                                                   376 0 377 3 37 0 0 246 0 378
                                                   3 380 379 38 269 37 381 2
                                                   383 382 37 269 384 2 0 7 7 7
                                                   366 4 0 56 29 7 7 13 68)))))
           '|lookupComplete|)) 
