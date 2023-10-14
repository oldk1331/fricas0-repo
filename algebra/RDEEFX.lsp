
(SDEFUN |RDEEFX;P_to_UP|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         ($ |SparseUnivariatePolynomial| (|Expression| R)))
        (SPROG
         ((|up1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))))
         (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 12)) |RDEEFX;P_to_UP|)
              (EXIT (SPADCALL (ELT $ 15) |up1| (QREFELT $ 20)))))) 

(SDEFUN |RDEEFX;UP_to_UPUP|
        ((|p| |SparseUnivariatePolynomial| (|Expression| R))
         ($ |SparseUnivariatePolynomial|
          (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPADCALL (ELT $ 21) |p| (QREFELT $ 25))) 

(SDEFUN |RDEEFX;get_uv0|
        ((|tt| |Expression| R) (|coeffs| |List| (|Integer|))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         ($ |Record| (|:| |u_part| (|Expression| R))
          (|:| |v_part| (|Expression| R)) (|:| |exponent| (|Integer|))
          (|:| |coeff| (|Integer|))))
        (SPROG
         ((|kc| #1=(|Integer|)) (#2=#:G266 NIL) (|vi| NIL) (#3=#:G267 NIL)
          (|ki| NIL) (|kf| (|Expression| R)) (|u| (|Expression| R))
          (#4=#:G264 NIL) (|ui| NIL) (#5=#:G265 NIL) (#6=#:G263 NIL) (|ku| #1#)
          (#7=#:G261 NIL) (#8=#:G262 NIL) (|v0| (|Expression| R))
          (#9=#:G259 NIL) (#10=#:G260 NIL) (#11=#:G258 NIL))
         (SEQ
          (LETT |v0|
                (SPADCALL |tt|
                          (SPADCALL (ELT $ 26)
                                    (PROGN
                                     (LETT #11# NIL . #12=(|RDEEFX;get_uv0|))
                                     (SEQ (LETT |ki| NIL . #12#)
                                          (LETT #10# |coeffs| . #12#)
                                          (LETT |vi| NIL . #12#)
                                          (LETT #9# |vlst| . #12#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |vi| (CAR #9#) . #12#)
                                                 NIL)
                                                (ATOM #10#)
                                                (PROGN
                                                 (LETT |ki| (CAR #10#) . #12#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #11#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |ki|
                                                              (QREFELT $ 28))
                                                    |vi| (QREFELT $ 29))
                                                   #11#)
                                                  . #12#)))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT #10# (CDR #10#)
                                                        . #12#))
                                                . #12#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #11#))))
                                    (|spadConstant| $ 30) (QREFELT $ 33))
                          (QREFELT $ 34))
                . #12#)
          (LETT |ku| 0 . #12#) (LETT |u| (|spadConstant| $ 35) . #12#)
          (COND
           ((SPADCALL |k| '|exp| (QREFELT $ 38))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #12#)
                 (EXIT
                  (SEQ (LETT |ki| NIL . #12#) (LETT #8# |coeffs| . #12#)
                       (LETT |ui| NIL . #12#) (LETT #7# |ulst| . #12#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |ui| (CAR #7#) . #12#) NIL)
                             (ATOM #8#)
                             (PROGN (LETT |ki| (CAR #8#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |ui| |kf| (QREFELT $ 41))
                           (LETT |ku| |ki| . #12#))
                          ('T
                           (LETT |u|
                                 (SPADCALL |u|
                                           (SPADCALL |ui| |ki| (QREFELT $ 42))
                                           (QREFELT $ 29))
                                 . #12#)))))
                       (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (LETT |u|
                  (SPADCALL (ELT $ 29)
                            (PROGN
                             (LETT #6# NIL . #12#)
                             (SEQ (LETT |ki| NIL . #12#)
                                  (LETT #5# |coeffs| . #12#)
                                  (LETT |ui| NIL . #12#)
                                  (LETT #4# |ulst| . #12#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |ui| (CAR #4#) . #12#)
                                         NIL)
                                        (ATOM #5#)
                                        (PROGN
                                         (LETT |ki| (CAR #5#) . #12#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |ui| |ki| (QREFELT $ 42))
                                           #6#)
                                          . #12#)))
                                  (LETT #4#
                                        (PROG1 (CDR #4#)
                                          (LETT #5# (CDR #5#) . #12#))
                                        . #12#)
                                  (GO G190) G191 (EXIT (NREVERSE #6#))))
                            (|spadConstant| $ 35) (QREFELT $ 33))
                  . #12#)))
          (LETT |kc| 0 . #12#)
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 38))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #12#)
                 (EXIT
                  (SEQ (LETT |ki| NIL . #12#) (LETT #3# |coeffs| . #12#)
                       (LETT |vi| NIL . #12#) (LETT #2# |vlst| . #12#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |vi| (CAR #2#) . #12#) NIL)
                             (ATOM #3#)
                             (PROGN (LETT |ki| (CAR #3#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |vi| |kf| (QREFELT $ 41))
                           (LETT |kc| |ki| . #12#)))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #12#))
                             . #12#)
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT (VECTOR |u| |v0| |ku| |kc|))))) 

(SDEFUN |RDEEFX;get_uv|
        ((|tt| |Expression| R) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|k| |Kernel| (|Expression| R))
         (|x| |Symbol|)
         ($ |Union|
          (|Record| (|:| |u_part| (|Expression| R))
                    (|:| |v_part| (|Expression| R))
                    (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
          "failed"))
        (SPROG
         ((|d| #1=(|Integer|))
          (|cd| (|Record| (|:| |num| (|List| (|Integer|))) (|:| |den| #1#)))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|dvvec| (|Vector| (|Expression| R))) (#2=#:G280 NIL) (|vi| NIL)
          (#3=#:G279 NIL))
         (SEQ
          (LETT |dvvec|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #4=(|RDEEFX;get_uv|))
                  (SEQ (LETT |vi| NIL . #4#) (LETT #2# |vlst| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |vi| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #3#
                               (CONS (SPADCALL |vi| |x| (QREFELT $ 43)) #3#)
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #3#))))
                 (QREFELT $ 45))
                . #4#)
          (LETT |su|
                (SPADCALL |dvvec| (SPADCALL |tt| |x| (QREFELT $ 43))
                          (QREFELT $ 48))
                . #4#)
          (EXIT
           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                 (#5='T
                  (SEQ (LETT |sv| (QCDR |su|) . #4#)
                       (LETT |cd| (SPADCALL |sv| (QREFELT $ 52)) . #4#)
                       (LETT |d| (QCDR |cd|) . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL |d| 1 (QREFELT $ 55)) (CONS 1 "failed"))
                         (#5#
                          (CONS 0
                                (|RDEEFX;get_uv0| |tt| (QCAR |cd|) |vlst|
                                 |ulst| |k| |x| $)))))))))))) 

(SDEFUN |RDEEFX;handle_factor|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|f1| |SparseUnivariatePolynomial| (|Expression| R)) (|r0| |Integer|)
         (|u0| |Expression| R) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|k| |Kernel| (|Expression| R))
         (|x| |Symbol|) (|known_dividing| |Boolean|)
         ($ |Union|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)))
          "failed"))
        (SPROG
         ((|ff1| #1=(|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G300 NIL)
          (|ff3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#3=#:G290 NIL) (|ff2| #1#)
          (|ff| #4=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|f2pp| #5=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|tt1| #4#) (|u| (|Expression| R)) (|tt| (|Expression| R))
          (|v0| (|Expression| R)) (|u_exp| (|Integer|))
          (|uv|
           (|Record| (|:| |u_part| (|Expression| R))
                     (|:| |v_part| (|Expression| R))
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| (|Expression| R))
                      (|:| |v_part| (|Expression| R))
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|f2| #5#) (|deg1| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dummy| (SPADCALL (QREFELT $ 57))
                  . #6=(|RDEEFX;handle_factor|))
            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 59)) . #6#)
            (LETT |tt|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 60))
                             (SPADCALL (SPADCALL |deg1| (QREFELT $ 28))
                                       (SPADCALL |f1| |deg1| (QREFELT $ 60))
                                       (QREFELT $ 29))
                             (QREFELT $ 61))
                   (QREFELT $ 62))
                  . #6#)
            (LETT |f2|
                  (SPADCALL |f1| |dummy|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 63))
                             (SPADCALL |tt| (QREFELT $ 21)) (QREFELT $ 64))
                            (QREFELT $ 65))
                  . #6#)
            (COND
             ((NULL
               (SPADCALL (CONS #'|RDEEFX;handle_factor!0| (VECTOR $ |x|))
                         (SPADCALL |f2| (QREFELT $ 66)) (QREFELT $ 68)))
              (EXIT
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7=#:G299)))))
            (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $) . #6#)
            (EXIT
             (COND
              ((QEQCAR |uvu| 1)
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7#)))
              (#8='T
               (SEQ (LETT |uv| (QCDR |uvu|) . #6#)
                    (LETT |u| (QVELT |uv| 0) . #6#)
                    (LETT |u_exp| (QVELT |uv| 2) . #6#)
                    (LETT |v0| (QVELT |uv| 1) . #6#)
                    (COND
                     ((EQL |r0| 0)
                      (SEQ (LETT |r0| (QVELT |uv| 3) . #6#)
                           (EXIT
                            (LETT |tt|
                                  (SPADCALL |tt|
                                            (SPADCALL
                                             (SPADCALL |r0| (QREFELT $ 28))
                                             (SPADCALL |k| (QREFELT $ 40))
                                             (QREFELT $ 29))
                                            (QREFELT $ 34))
                                  . #6#))))
                     (#8#
                      (LETT |u|
                            (SPADCALL (SPADCALL |u0| |r0| (QREFELT $ 42)) |u|
                                      (QREFELT $ 29))
                            . #6#)))
                    (LETT |tt1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |r0| (QREFELT $ 28)) 1
                                     (QREFELT $ 63))
                           (SPADCALL |tt| (QREFELT $ 21)) (QREFELT $ 64))
                          . #6#)
                    (LETT |ff|
                          (SPADCALL |nf| (SPADCALL |tt1| |denf| (QREFELT $ 71))
                                    (QREFELT $ 64))
                          . #6#)
                    (COND
                     ((SPADCALL |deg1| 1 (QREFELT $ 72))
                      (LETT |ff|
                            (SPADCALL
                             (SPADCALL (SPADCALL |denf| 1 (QREFELT $ 73))
                                       (SPADCALL |ff| (QREFELT $ 74))
                                       (QREFELT $ 75))
                             (|RDEEFX;UP_to_UPUP| |f2| $) (QREFELT $ 76))
                            . #6#)))
                    (LETT |f2pp|
                          (COND ((EQL |deg1| 1) (|spadConstant| $ 70))
                                (#8# |f2|))
                          . #6#)
                    (EXIT
                     (COND
                      (|known_dividing|
                       (SEQ
                        (LETT |ff|
                              (SPADCALL |ff| (SPADCALL |ff| (QREFELT $ 77))
                                        (QREFELT $ 78))
                              . #6#)
                        (EXIT
                         (CONS 0
                               (VECTOR |ff| |r0| |tt| |f2pp| |u| |u_exp|
                                       |v0|)))))
                      (#8#
                       (SEQ
                        (LETT |ff2|
                              (LETT |ff1| (SPADCALL |ff| |gd| (QREFELT $ 79))
                                    . #6#)
                              . #6#)
                        (LETT |ff3|
                              (PROG2
                                  (LETT #3#
                                        (SPADCALL |ff| |ff1| (QREFELT $ 81))
                                        . #6#)
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (QREFELT $ 6)))
                                                (|Union|
                                                 (|SparseUnivariatePolynomial|
                                                  (|Expression| (QREFELT $ 6)))
                                                 #9="failed")
                                                #3#))
                              . #6#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL
                                 (LETT |ff2|
                                       (SPADCALL |ff2| |ff3| (QREFELT $ 79))
                                       . #6#)
                                 (|spadConstant| $ 54) (QREFELT $ 82)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |ff3|
                                     (PROG2
                                         (LETT #3#
                                               (SPADCALL |ff3| |ff2|
                                                         (QREFELT $ 81))
                                               . #6#)
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (|Expression|
                                                         (QREFELT $ 6)))
                                                       (|Union|
                                                        (|SparseUnivariatePolynomial|
                                                         (|Expression|
                                                          (QREFELT $ 6)))
                                                        #9#)
                                                       #3#))
                                     . #6#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL (EQL (SPADCALL |ff3| (QREFELT $ 59)) 0))
                          (COND
                           ((SPADCALL |k| '|exp| (QREFELT $ 38))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |ff3| (QREFELT $ 83))
                                         (|spadConstant| $ 70) (QREFELT $ 84)))
                              (EXIT
                               (PROGN
                                (LETT #2# (CONS 1 #10="failed") . #6#)
                                (GO #7#))))))
                           (#8#
                            (EXIT
                             (PROGN
                              (LETT #2# (CONS 1 #10#) . #6#)
                              (GO #7#)))))))
                        (LETT |ff1|
                              (SPADCALL |ff1| (SPADCALL |ff1| (QREFELT $ 77))
                                        (QREFELT $ 78))
                              . #6#)
                        (EXIT
                         (CONS 0
                               (VECTOR |ff1| |r0| |tt| |f2pp| |u| |u_exp|
                                       |v0|)))))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |RDEEFX;handle_factor!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;handle_factor|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 43)) (|spadConstant| $ 30)
                      (QREFELT $ 41)))))) 

(SDEFUN |RDEEFX;z_basis|
        ((|a| |Vector| (|Fraction| (|Integer|)))
         (|b| |List| (|Vector| (|Fraction| (|Integer|))))
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| (|Integer|)))
                    (|:| |basis| (|List| (|Vector| (|Integer|)))))
          "failed"))
        (SPROG
         ((#1=#:G308 NIL) (|i| NIL) (|av| #2=(|Vector| (|Integer|)))
          (|ki| (|Integer|)) (|di| (|Integer|)) (|g| #3=(|Integer|))
          (|c2| #4=(|Integer|)) (|c1| #5=(|Integer|))
          (|#G44|
           (|Record| (|:| |coef1| #5#) (|:| |coef2| #4#)
                     (|:| |generator| #3#)))
          (|ki1| (|Integer|)) (|di2| (|Integer|)) (|di1| (|Integer|))
          (#6=#:G323 NIL) (|bi| #7=(|Integer|)) (|ai| #7#)
          (|n| (|NonNegativeInteger|)) (|bv| #2#) (|gb| (|Integer|))
          (|bl| #8=(|List| (|Integer|))) (|db| #9=(|Integer|))
          (|cd| (|Record| (|:| |num| #8#) (|:| |den| #9#)))
          (|bvp| (|Vector| (|Fraction| (|Integer|)))) (|da| #9#)
          (|nn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nn| (LENGTH |b|) . #10=(|RDEEFX;z_basis|))
                (EXIT
                 (COND ((SPADCALL |nn| 1 (QREFELT $ 72)) (|error| "#b > 1"))
                       (#11='T
                        (SEQ (LETT |cd| (SPADCALL |a| (QREFELT $ 52)) . #10#)
                             (LETT |da| (QCDR |cd|) . #10#)
                             (LETT |av| (SPADCALL (QCAR |cd|) (QREFELT $ 87))
                                   . #10#)
                             (EXIT
                              (COND
                               ((EQL |nn| 0)
                                (COND
                                 ((SPADCALL |da| 1 (QREFELT $ 55))
                                  (CONS 1 "failed"))
                                 (#11# (CONS 0 (CONS |av| NIL)))))
                               (#11#
                                (SEQ (LETT |bvp| (|SPADfirst| |b|) . #10#)
                                     (LETT |cd| (SPADCALL |bvp| (QREFELT $ 52))
                                           . #10#)
                                     (LETT |db| (QCDR |cd|) . #10#)
                                     (LETT |bl| (QCAR |cd|) . #10#)
                                     (LETT |gb| (SPADCALL |bl| (QREFELT $ 89))
                                           . #10#)
                                     (LETT |bv| (SPADCALL |bl| (QREFELT $ 87))
                                           . #10#)
                                     (LETT |n| (QVSIZE |bv|) . #10#)
                                     (SEQ (LETT |i| 1 . #10#) G190
                                          (COND
                                           ((|greater_SI| |i| |n|) (GO G191)))
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
                                                                            90))
                                                                 |gb|
                                                                 (QREFELT $
                                                                          91))
                                                                . #10#)
                                                          (QCDR #1#)
                                                        (|check_union2|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #12="failed")
                                                         #1#))
                                                      (QREFELT $ 92))))
                                          (LETT |i| (|inc_SI| |i|) . #10#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((EQL |da| 1)
                                        (CONS 0 (CONS |av| (LIST |bv|))))
                                       ((QEQCAR
                                         (SPADCALL |db| |da| (QREFELT $ 91)) 1)
                                        (CONS 1 "failed"))
                                       (#11#
                                        (SEQ (LETT |ki| 0 . #10#)
                                             (LETT |di| 1 . #10#)
                                             (SEQ (LETT |i| 1 . #10#) G190
                                                  (COND
                                                   ((|greater_SI| |i| |n|)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |ai|
                                                         (SPADCALL |av| |i|
                                                                   (QREFELT $
                                                                            90))
                                                         . #10#)
                                                   (LETT |bi|
                                                         (SPADCALL |bv| |i|
                                                                   (QREFELT $
                                                                            90))
                                                         . #10#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (REM
                                                        (- |ai| (* |ki| |bi|))
                                                        |di|)
                                                       0 (QREFELT $ 55))
                                                      (PROGN
                                                       (LETT #6#
                                                             (CONS 1 "failed")
                                                             . #10#)
                                                       (GO #13=#:G322)))
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
                                                                         $ 91))
                                                                       . #10#)
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #12#)
                                                                #1#))
                                                             . #10#)
                                                       (LETT |di2|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (SPADCALL
                                                                        |di1|
                                                                        (GCD
                                                                         |di1|
                                                                         |di|)
                                                                        (QREFELT
                                                                         $ 91))
                                                                       . #10#)
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
                                                                (|Union|
                                                                 (|Integer|)
                                                                 #12#)
                                                                #1#))
                                                             . #10#)
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
                                                                            93))
                                                                 . #10#)
                                                           (PROGN
                                                            (LETT |#G44|
                                                                  (SPADCALL
                                                                   |di| |di2|
                                                                   (QREFELT $
                                                                            95))
                                                                  . #10#)
                                                            (LETT |c1|
                                                                  (QVELT |#G44|
                                                                         0)
                                                                  . #10#)
                                                            (LETT |c2|
                                                                  (QVELT |#G44|
                                                                         1)
                                                                  . #10#)
                                                            (LETT |g|
                                                                  (QVELT |#G44|
                                                                         2)
                                                                  . #10#)
                                                            |#G44|)
                                                           (LETT |di|
                                                                 (* |di2| |di|)
                                                                 . #10#)
                                                           (EXIT
                                                            (LETT |ki|
                                                                  (REM
                                                                   (+
                                                                    (* |ki1|
                                                                       |c1|)
                                                                    (* |ki|
                                                                       |c2|))
                                                                   |di|)
                                                                  . #10#)))))))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #10#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |av|
                                                   (SPADCALL |av|
                                                             (SPADCALL |ki|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 96))
                                                             (QREFELT $ 97))
                                                   . #10#)
                                             (SEQ (LETT |i| 1 . #10#) G190
                                                  (COND
                                                   ((|greater_SI| |i| |n|)
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
                                                                           90))
                                                                         |da|
                                                                         (QREFELT
                                                                          $
                                                                          91))
                                                                        . #10#)
                                                                  (QCDR #1#)
                                                                (|check_union2|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #12#)
                                                                 #1#))
                                                              (QREFELT $ 92))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #10#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (CONS |av|
                                                          (LIST
                                                           |bv|))))))))))))))))))
          #13# (EXIT #6#)))) 

(SDEFUN |RDEEFX;lin_args|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst| |List| (|Expression| R))
         (|ulst| |List| #1=(|Expression| R)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)) (|:| |has_part2?| (|Boolean|))
           (|:| |ratpart2| (|Integer|)) (|:| |v_part2| (|Expression| R))
           (|:| |u_part2| (|Expression| R))
           (|:| |shift_part2| (|Expression| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)) (|:| |has_part2?| (|Boolean|))
             (|:| |ratpart2| (|Integer|)) (|:| |v_part2| (|Expression| R))
             (|:| |u_part2| (|Expression| R))
             (|:| |shift_part2| (|Expression| R)))))
          (|v2| #2=(|Expression| R)) (|u2| #3=(|Expression| R))
          (|uv2|
           #4=(|Record| (|:| |u_part| (|Expression| R))
                        (|:| |v_part| (|Expression| R))
                        (|:| |exponent| (|Integer|))
                        (|:| |coeff| (|Integer|))))
          (|r2| (|Integer|)) (|bv| (|Vector| (|Integer|))) (|v1| #2#)
          (|u1| #3#) (|uv1| #4#) (|tt1| (|Expression| R))
          (|a1n| (|Expression| R)) (|r0| (|Integer|))
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
          (|psolu| #5=(|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sol_rec|
           (|Record| (|:| |particular| #5#)
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|vecf| (|Vector| (|Expression| R))) (|dv0| #6=(|Expression| R))
          (|dvs| (|List| #7=(|Expression| R))) (#8=#:G359 NIL) (|v| NIL)
          (#9=#:G358 NIL) (|dv1| #7#) (#10=#:G354 NIL)
          (|no_sol| #11=(|Boolean|))
          (|f2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|r0u| (|Union| (|Integer|) "failed")) (|r0f| (|Expression| R))
          (|b0p| #7#) (|b0| #12=(|Expression| R)) (|has_r0| #11#) (|a1p| #7#)
          (|tt| #6#) (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|deg1| (|NonNegativeInteger|)) (#13=#:G357 NIL) (|fac| NIL)
          (|dummy| (|SingletonAsOrderedSet|))
          (|ulst1| (|List| (|Expression| R)))
          (|vlst1| (|List| (|Expression| R))) (|u0| #1#) (#14=#:G355 NIL)
          (#15=#:G356 NIL) (|u| NIL) (|v0| (|Expression| R)) (|a0| #12#)
          (|a1| (|Expression| R))
          (|fgd|
           (|Factored|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (|gd1|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |gd1|
                (SPADCALL
                 (SPADCALL (SPADCALL |gd| (QREFELT $ 99)) |k| (QREFELT $ 101))
                 (QREFELT $ 102))
                . #16=(|RDEEFX;lin_args|))
          (LETT |fgd| (SPADCALL |gd1| (QREFELT $ 105)) . #16#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf| (QREFELT $ 59)) 1 (QREFELT $ 106))
             (|error| "lin_args only works for linear nf"))
            (#17='T
             (SEQ
              (LETT |a1|
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT $ 59)) 1)
                      (SPADCALL |nf| (QREFELT $ 77)))
                     (#17# (|spadConstant| $ 30)))
                    . #16#)
              (LETT |a0| (SPADCALL |nf| 0 (QREFELT $ 60)) . #16#)
              (LETT |v0| (SPADCALL |k| (QREFELT $ 40)) . #16#)
              (LETT |vlst1| NIL . #16#) (LETT |ulst1| NIL . #16#)
              (SEQ (LETT |u| NIL . #16#) (LETT #15# |ulst| . #16#)
                   (LETT |v| NIL . #16#) (LETT #14# |vlst| . #16#) G190
                   (COND
                    ((OR (ATOM #14#) (PROGN (LETT |v| (CAR #14#) . #16#) NIL)
                         (ATOM #15#) (PROGN (LETT |u| (CAR #15#) . #16#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |v0| (QREFELT $ 41))
                       (LETT |u0| |u| . #16#))
                      ('T
                       (SEQ (LETT |vlst1| (CONS |v| |vlst1|) . #16#)
                            (EXIT
                             (LETT |ulst1| (CONS |u| |ulst1|) . #16#)))))))
                   (LETT #14# (PROG1 (CDR #14#) (LETT #15# (CDR #15#) . #16#))
                         . #16#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |dummy| (SPADCALL (QREFELT $ 57)) . #16#)
              (LETT |res| NIL . #16#)
              (SEQ (LETT |fac| NIL . #16#)
                   (LETT #13# (SPADCALL |fgd| (QREFELT $ 109)) . #16#) G190
                   (COND
                    ((OR (ATOM #13#)
                         (PROGN (LETT |fac| (CAR #13#) . #16#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |k| $) . #16#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 59)) . #16#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL |f1|
                                             (SPADCALL |f1| (QREFELT $ 77))
                                             (QREFELT $ 78))
                                   . #16#)
                             (LETT |tt|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |f1| (- |deg1| 1)
                                               (QREFELT $ 60))
                                     (SPADCALL |deg1| (QREFELT $ 28))
                                     (QREFELT $ 61))
                                    (QREFELT $ 62))
                                   . #16#)
                             (LETT |no_sol| 'NIL . #16#)
                             (LETT |has_r0| 'NIL . #16#)
                             (LETT |f2| (|spadConstant| $ 70) . #16#)
                             (LETT |r0| 0 . #16#)
                             (LETT |r0f| (|spadConstant| $ 30) . #16#)
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 72))
                               (SEQ
                                (EXIT
                                 (SEQ
                                  (LETT |f2|
                                        (SPADCALL |f1| |dummy|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 35) 1
                                                    (QREFELT $ 63))
                                                   (SPADCALL |tt|
                                                             (QREFELT $ 21))
                                                   (QREFELT $ 64))
                                                  (QREFELT $ 65))
                                        . #16#)
                                  (LETT |f2|
                                        (SPADCALL |f2|
                                                  (SPADCALL |f2|
                                                            (QREFELT $ 77))
                                                  (QREFELT $ 78))
                                        . #16#)
                                  (COND
                                   ((SPADCALL
                                     (LETT |a1p|
                                           (SPADCALL |a1| |x| (QREFELT $ 43))
                                           . #16#)
                                     (|spadConstant| $ 30) (QREFELT $ 110))
                                    (SEQ (LETT |has_r0| 'T . #16#)
                                         (LETT |b0|
                                               (SPADCALL |f2| 0 (QREFELT $ 60))
                                               . #16#)
                                         (LETT |b0p|
                                               (SPADCALL |b0| |x|
                                                         (QREFELT $ 43))
                                               . #16#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b0p|
                                                      (|spadConstant| $ 30)
                                                      (QREFELT $ 41))
                                            (LETT |no_sol| 'T . #16#))
                                           ('T
                                            (SEQ
                                             (LETT |r0f|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |deg1|
                                                                  (QREFELT $
                                                                           28))
                                                        |a1p| (QREFELT $ 29))
                                                       |b0| (QREFELT $ 29))
                                                      |b0p| (QREFELT $ 61))
                                                     (QREFELT $ 62))
                                                    |a1| (QREFELT $ 34))
                                                   . #16#)
                                             (LETT |r0u|
                                                   (SPADCALL |r0f|
                                                             (QREFELT $ 112))
                                                   . #16#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |r0u| 1)
                                                (LETT |no_sol| 'T . #16#))
                                               ('T
                                                (SEQ
                                                 (LETT |r0| (QCDR |r0u|)
                                                       . #16#)
                                                 (EXIT
                                                  (LETT |f2|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |a1| |r0f|
                                                                    (QREFELT $
                                                                             26))
                                                          |deg1|
                                                          (QREFELT $ 42))
                                                         (SPADCALL |f2| |dummy|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (|spadConstant|
                                                                      $ 35)
                                                                     (SPADCALL
                                                                      |a1|
                                                                      |r0f|
                                                                      (QREFELT
                                                                       $ 26))
                                                                     (QREFELT $
                                                                              61))
                                                                    1
                                                                    (QREFELT $
                                                                             63))
                                                                   (QREFELT $
                                                                            65))
                                                         (QREFELT $ 114))
                                                        . #16#)))))))))))))
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (CONS #'|RDEEFX;lin_args!0|
                                             (VECTOR $ |x|))
                                       (SPADCALL |f2| (QREFELT $ 66))
                                       (QREFELT $ 68)))
                                     (PROGN
                                      (LETT #10# (LETT |no_sol| 'T . #16#)
                                            . #16#)
                                      (GO #18=#:G337)))))))
                                #18# (EXIT #10#))))
                             (EXIT
                              (COND (|no_sol| "iterate")
                                    ('T
                                     (SEQ
                                      (LETT |dv0|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |a1| |tt|
                                                         (QREFELT $ 29))
                                               |a0| (QREFELT $ 26))
                                              |x| (QREFELT $ 43))
                                             (QREFELT $ 62))
                                            . #16#)
                                      (LETT |dv1|
                                            (SPADCALL |tt| |x| (QREFELT $ 43))
                                            . #16#)
                                      (LETT |dvs|
                                            (PROGN
                                             (LETT #9# NIL . #16#)
                                             (SEQ (LETT |v| NIL . #16#)
                                                  (LETT #8# |vlst1| . #16#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #8#)
                                                        (PROGN
                                                         (LETT |v| (CAR #8#)
                                                               . #16#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #9#
                                                          (CONS
                                                           (SPADCALL |v| |x|
                                                                     (QREFELT $
                                                                              43))
                                                           #9#)
                                                          . #16#)))
                                                  (LETT #8# (CDR #8#) . #16#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #9#))))
                                            . #16#)
                                      (LETT |vecf|
                                            (COND
                                             (|has_r0|
                                              (SEQ
                                               (LETT |dv0|
                                                     (SPADCALL |dv0|
                                                               (SPADCALL |r0f|
                                                                         |dv1|
                                                                         (QREFELT
                                                                          $
                                                                          29))
                                                               (QREFELT $ 26))
                                                     . #16#)
                                               (EXIT
                                                (SPADCALL |dvs|
                                                          (QREFELT $ 45)))))
                                             ('T
                                              (SPADCALL (CONS |dv1| |dvs|)
                                                        (QREFELT $ 45))))
                                            . #16#)
                                      (LETT |sol_rec|
                                            (SPADCALL |vecf| |dv0|
                                                      (QREFELT $ 116))
                                            . #16#)
                                      (LETT |psolu| (QCAR |sol_rec|) . #16#)
                                      (EXIT
                                       (COND ((QEQCAR |psolu| 1) "iterate")
                                             ('T
                                              (SEQ
                                               (LETT |psol| (QCDR |psolu|)
                                                     . #16#)
                                               (COND
                                                (|has_r0|
                                                 (LETT |psol|
                                                       (SPADCALL
                                                        (CONS
                                                         (SPADCALL |r0|
                                                                   (QREFELT $
                                                                            118))
                                                         (SPADCALL |psol|
                                                                   (QREFELT $
                                                                            120)))
                                                        (QREFELT $ 121))
                                                       . #16#)))
                                               (LETT |zbu|
                                                     (|RDEEFX;z_basis| |psol|
                                                      (QCDR |sol_rec|) $)
                                                     . #16#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |zbu| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |zb| (QCDR |zbu|)
                                                         . #16#)
                                                   (LETT |vec1| (QCAR |zb|)
                                                         . #16#)
                                                   (LETT |r0|
                                                         (SPADCALL |vec1| 1
                                                                   (QREFELT $
                                                                            90))
                                                         . #16#)
                                                   (LETT |a1n|
                                                         (SPADCALL |a1|
                                                                   (SPADCALL
                                                                    |r0|
                                                                    (QREFELT $
                                                                             28))
                                                                   (QREFELT $
                                                                            26))
                                                         . #16#)
                                                   (LETT |tt1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |a1n| |tt|
                                                                     (QREFELT $
                                                                              29))
                                                           (QREFELT $ 62))
                                                          |a0| (QREFELT $ 34))
                                                         . #16#)
                                                   (LETT |uv1|
                                                         (|RDEEFX;get_uv0|
                                                          |tt1|
                                                          (CDR
                                                           (SPADCALL |vec1|
                                                                     (QREFELT $
                                                                              122)))
                                                          |vlst1| |ulst1| |k|
                                                          |x| $)
                                                         . #16#)
                                                   (LETT |u1|
                                                         (SPADCALL
                                                          (QVELT |uv1| 0)
                                                          (SPADCALL |u0| |r0|
                                                                    (QREFELT $
                                                                             42))
                                                          (QREFELT $ 29))
                                                         . #16#)
                                                   (LETT |v1| (QVELT |uv1| 1)
                                                         . #16#)
                                                   (EXIT
                                                    (COND
                                                     ((NULL (QCDR |zb|))
                                                      (LETT |res|
                                                            (CONS
                                                             (VECTOR |f1| |r0|
                                                                     |tt1| |f2|
                                                                     |u1| 0
                                                                     |v1| 'NIL
                                                                     0
                                                                     (|spadConstant|
                                                                      $ 30)
                                                                     (|spadConstant|
                                                                      $ 35)
                                                                     (|spadConstant|
                                                                      $ 30))
                                                             |res|)
                                                            . #16#))
                                                     ('T
                                                      (SEQ
                                                       (LETT |bv|
                                                             (|SPADfirst|
                                                              (QCDR |zb|))
                                                             . #16#)
                                                       (LETT |r2|
                                                             (SPADCALL |bv| 1
                                                                       (QREFELT
                                                                        $ 90))
                                                             . #16#)
                                                       (LETT |uv2|
                                                             (|RDEEFX;get_uv0|
                                                              (SPADCALL |tt|
                                                                        (QREFELT
                                                                         $ 62))
                                                              (CDR
                                                               (SPADCALL |bv|
                                                                         (QREFELT
                                                                          $
                                                                          122)))
                                                              |vlst1| |ulst1|
                                                              |k| |x| $)
                                                             . #16#)
                                                       (LETT |u2|
                                                             (SPADCALL
                                                              (QVELT |uv2| 0)
                                                              (SPADCALL |u0|
                                                                        |r2|
                                                                        (QREFELT
                                                                         $ 42))
                                                              (QREFELT $ 29))
                                                             . #16#)
                                                       (LETT |v2|
                                                             (QVELT |uv2| 1)
                                                             . #16#)
                                                       (EXIT
                                                        (LETT |res|
                                                              (CONS
                                                               (VECTOR |f1|
                                                                       |r0|
                                                                       |tt1|
                                                                       |f2|
                                                                       |u1| 0
                                                                       |v1| 'T
                                                                       |r2|
                                                                       (SPADCALL
                                                                        |tt|
                                                                        (QREFELT
                                                                         $ 62))
                                                                       |u2|
                                                                       |v2|)
                                                               |res|)
                                                              . #16#)))))))))))))))))))))))
                   (LETT #13# (CDR #13#) . #16#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(SDEFUN |RDEEFX;lin_args!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;lin_args|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 43)) (|spadConstant| $ 30)
                      (QREFELT $ 41)))))) 

(SDEFUN |RDEEFX;get_rational_solutions2|
        ((|eq1f| |Expression| R) (|k1| |Kernel| (|Expression| R))
         ($ |List| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|List| (|Fraction| (|Integer|))))
          (|val1r| (|Fraction| (|Integer|)))
          (|fac| #1=(|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G369 NIL)
          (|facr| NIL)
          (|facl|
           (|List| (|Record| (|:| |factor| #1#) (|:| |exponent| (|Integer|)))))
          (|ff| (|Factored| (|SparseUnivariatePolynomial| (|Integer|))))
          (|eq2z| (|SparseUnivariatePolynomial| (|Integer|)))
          (|pl2| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G368 NIL) (|i| NIL) (#4=#:G367 NIL)
          (|vvr| (|Matrix| (|Integer|))) (|vm| (|Matrix| (|Expression| R)))
          (|vv| (|Vector| (|Expression| R))) (|nn| (|NonNegativeInteger|))
          (|eq2p| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ
          (LETT |eq2p|
                (SPADCALL (SPADCALL |eq1f| |k1| (QREFELT $ 127))
                          (QREFELT $ 128))
                . #5=(|RDEEFX;get_rational_solutions2|))
          (LETT |nn| (+ (SPADCALL |eq2p| (QREFELT $ 59)) 1) . #5#)
          (LETT |vv| (SPADCALL |eq2p| |nn| (QREFELT $ 129)) . #5#)
          (LETT |vm|
                (SPADCALL (LIST (SPADCALL |vv| (QREFELT $ 130)))
                          (QREFELT $ 133))
                . #5#)
          (LETT |vvr| (SPADCALL |vm| (QREFELT $ 136)) . #5#)
          (LETT |pl2|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) (LETT #3# (ANROWS |vvr|) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |vvr| |i| (QREFELT $ 137))
                                         (QREFELT $ 139))
                               #4#)
                              . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |eq2z| (SPADCALL |pl2| (QREFELT $ 140)) . #5#)
          (LETT |ff| (SPADCALL |eq2z| (QREFELT $ 143)) . #5#)
          (LETT |facl| (SPADCALL |ff| (QREFELT $ 146)) . #5#)
          (LETT |res| NIL . #5#)
          (SEQ (LETT |facr| NIL . #5#) (LETT #2# |facl| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |facr| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |fac| (QCAR |facr|) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |fac| (QREFELT $ 147)) 1
                                 (QREFELT $ 148))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |val1r|
                              (SPADCALL
                               (SPADCALL (SPADCALL |fac| 0 (QREFELT $ 149))
                                         (SPADCALL |fac| (QREFELT $ 150))
                                         (QREFELT $ 151))
                               (QREFELT $ 152))
                              . #5#)
                        (EXIT (LETT |res| (CONS |val1r| |res|) . #5#)))))))
               (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;get_rational_solutions|
        ((|eq1| |Equation| (|Fraction| (|Polynomial| (|Expression| R))))
         (|s1| |Symbol|) (|s2| |Symbol|) ($ |List| (|Fraction| (|Integer|))))
        (SPROG
         ((|eq1f| (|Expression| R)) (|k1| (|Kernel| (|Expression| R)))
          (|eq1p| (|Polynomial| (|Expression| R)))
          (|ru2| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|ru1| (|Union| (|Expression| R) "failed"))
          (|ru0| (|Union| (|Polynomial| (|Expression| R)) "failed"))
          (|rv| (|Fraction| (|Polynomial| (|Expression| R)))))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |rv| (SPADCALL |eq1| (QREFELT $ 155))
                   . #1=(|RDEEFX;get_rational_solutions|))
             (|spadConstant| $ 156) (QREFELT $ 157))
            (COND
             ((SPADCALL |s1|
                        (SPADCALL (SPADCALL |eq1| (QREFELT $ 158))
                                  (QREFELT $ 159))
                        (QREFELT $ 160))
              (|error| "wrong format of solution 1"))
             (#2='T
              (SEQ (LETT |ru0| (SPADCALL |rv| (QREFELT $ 162)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |ru0| 1) NIL)
                          (#2#
                           (SEQ
                            (LETT |ru1| (SPADCALL (QCDR |ru0|) (QREFELT $ 165))
                                  . #1#)
                            (EXIT
                             (COND ((QEQCAR |ru1| 1) NIL)
                                   (#2#
                                    (SEQ
                                     (LETT |ru2|
                                           (SPADCALL (QCDR |ru1|)
                                                     (QREFELT $ 167))
                                           . #1#)
                                     (EXIT
                                      (COND ((QEQCAR |ru2| 1) NIL)
                                            (#2#
                                             (LIST (QCDR |ru2|)))))))))))))))))
           (#2#
            (SEQ
             (LETT |eq1p|
                   (SPADCALL (SPADCALL |eq1| (QREFELT $ 158)) (QREFELT $ 168))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL |s2| (SPADCALL |eq1p| (QREFELT $ 170))
                          (QREFELT $ 171))
                (|error| "wrong format of solution 2"))
               (#2#
                (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT $ 172)) . #1#)
                     (LETT |eq1f|
                           (SPADCALL
                            (SPADCALL |eq1p| |s1|
                                      (SPADCALL |k1| (QREFELT $ 40))
                                      (QREFELT $ 173))
                            (QREFELT $ 174))
                           . #1#)
                     (EXIT
                      (|RDEEFX;get_rational_solutions2| |eq1f| |k1|
                       $)))))))))))) 

(SDEFUN |RDEEFX;F_to_FP|
        ((|p| |Expression| R) (|ls| |List| (|Symbol|))
         (|lk| |List| (|Kernel| (|Expression| R)))
         ($ |Polynomial| (|Expression| R)))
        (SPROG
         ((|pu1|
           (|SparseUnivariatePolynomial| (|Polynomial| (|Expression| R))))
          (|pu| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|s1| (|Symbol|)) (|k1| (|Kernel| (|Expression| R))))
         (SEQ
          (COND ((NULL |lk|) (SPADCALL |p| (QREFELT $ 175)))
                ('T
                 (SEQ (LETT |k1| (|SPADfirst| |lk|) . #1=(|RDEEFX;F_to_FP|))
                      (LETT |s1| (|SPADfirst| |ls|) . #1#)
                      (LETT |pu|
                            (SPADCALL (SPADCALL |p| |k1| (QREFELT $ 127))
                                      (QREFELT $ 128))
                            . #1#)
                      (LETT |pu1|
                            (SPADCALL
                             (CONS #'|RDEEFX;F_to_FP!0| (VECTOR |lk| $ |ls|))
                             |pu| (QREFELT $ 182))
                            . #1#)
                      (EXIT (SPADCALL |pu1| |s1| (QREFELT $ 183))))))))) 

(SDEFUN |RDEEFX;F_to_FP!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls| $ |lk|)
          (LETT |ls| (QREFELT $$ 2) . #1=(|RDEEFX;F_to_FP|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|RDEEFX;F_to_FP| |c| (SPADCALL |ls| (QREFELT $ 176))
             (SPADCALL |lk| (QREFELT $ 178)) $))))) 

(SDEFUN |RDEEFX;solve_poly_eqs|
        ((|eqs| |List| (|Expression| R)) (|s1| |Symbol|) (|s2| |Symbol|)
         ($ |List|
          (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|val2alg| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|val2eq| (|Polynomial| (|Expression| R))) (#1=#:G406 NIL)
          (|val1r| NIL)
          (|eq1| (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))
          (|eq0p| (|Polynomial| (|Expression| R)))
          (|eq0| (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))
          (#2=#:G405 NIL) (|sol0| NIL)
          (|lsol0|
           (|List|
            (|List|
             (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))))
          (#3=#:G404 NIL) (|ci| NIL) (#4=#:G403 NIL)
          (|eqs0| (|List| (|Polynomial| (|Expression| R)))) (#5=#:G402 NIL)
          (|eqi| NIL) (#6=#:G401 NIL) (|k2| #7=(|Kernel| (|Expression| R)))
          (|k1| #7#))
         (SEQ
          (LETT |k1| (SPADCALL |s1| (QREFELT $ 172))
                . #8=(|RDEEFX;solve_poly_eqs|))
          (LETT |k2| (SPADCALL |s2| (QREFELT $ 172)) . #8#)
          (LETT |eqs0|
                (PROGN
                 (LETT #6# NIL . #8#)
                 (SEQ (LETT |eqi| NIL . #8#) (LETT #5# |eqs| . #8#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |eqi| (CAR #5#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (|RDEEFX;F_to_FP|
                                (SPADCALL (SPADCALL |eqi| (QREFELT $ 102))
                                          (QREFELT $ 15))
                                (LIST |s1| |s2|) (LIST |k1| |k2|) $)
                               #6#)
                              . #8#)))
                      (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #8#)
          (LETT |lsol0|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #8#)
                  (SEQ (LETT |ci| NIL . #8#) (LETT #3# |eqs0| . #8#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |ci| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4# (CONS (SPADCALL |ci| (QREFELT $ 184)) #4#)
                               . #8#)))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (LIST |s2| |s1|) (QREFELT $ 188))
                . #8#)
          (LETT |res| NIL . #8#)
          (SEQ (LETT |sol0| NIL . #8#) (LETT #2# |lsol0| . #8#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sol0| (CAR #2#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |sol0|) 2 (QREFELT $ 55))
                   (|error| "wrong format of solution 0"))
                  ('T
                   (SEQ (LETT |eq0| (|SPADfirst| |sol0|) . #8#)
                        (LETT |eq0p|
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq0| (QREFELT $ 158))
                                         (SPADCALL |eq0| (QREFELT $ 155))
                                         (QREFELT $ 189))
                               (QREFELT $ 168))
                              . #8#)
                        (LETT |eq1| (SPADCALL |sol0| (QREFELT $ 191)) . #8#)
                        (EXIT
                         (SEQ (LETT |val1r| NIL . #8#)
                              (LETT #1#
                                    (|RDEEFX;get_rational_solutions| |eq1| |s1|
                                     |s2| $)
                                    . #8#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |val1r| (CAR #1#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |val2eq|
                                     (SPADCALL |eq0p| |s1|
                                               (SPADCALL |val1r|
                                                         (QREFELT $ 192))
                                               (QREFELT $ 173))
                                     . #8#)
                               (LETT |val2alg|
                                     (SPADCALL |val2eq| (QREFELT $ 193)) . #8#)
                               (EXIT
                                (LETT |res|
                                      (CONS (CONS |val1r| |val2alg|) |res|)
                                      . #8#)))
                              (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                              (EXIT NIL))))))))
               (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args0|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst0| |List| (|Expression| R))
         (|ulst0| |List| #1=(|Expression| R)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|vp| (|Expression| R)) (|dega| (|Integer|))
          (|fac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|ap| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G436 NIL)
          (|res1|
           (|Union|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))
            "failed"))
          (|res1l|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|nn| #3=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|ri| (|Integer|)) (|ru| (|Union| (|Integer|) "failed"))
          (#4=#:G435 NIL) (|r0| NIL) (|degn1| (|NonNegativeInteger|))
          (|degn| #5=(|NonNegativeInteger|)) (|degd| #5#)
          (|ratl| (|List| (|Fraction| (|Integer|)))) (|eq1| (|Expression| R))
          (|nnp| #3#) (#6=#:G434 NIL) (|sol| NIL) (|r_bad| (|Integer|))
          (|has_r_bad| (|Boolean|)) (|ccu| (|Union| (|Integer|) "failed"))
          (|cc| (|Expression| R))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|eqs0| (|List| (|Expression| R))) (#7=#:G433 NIL) (|ci| NIL)
          (#8=#:G432 NIL)
          (|qq| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|b| #9=(|Kernel| (|Expression| R))) (|bs| #10=(|Symbol|)) (|a| #9#)
          (|as| #10#) (|u0| #1#) (|ulst| (|List| (|Expression| R)))
          (|vlst| (|List| (|Expression| R))) (#11=#:G430 NIL) (|v| NIL)
          (#12=#:G431 NIL) (|u| NIL) (|kf| (|Expression| R)))
         (SEQ (LETT |vlst| NIL . #13=(|RDEEFX;ei_args0|))
              (LETT |ulst| NIL . #13#)
              (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #13#)
              (SEQ (LETT |u| NIL . #13#) (LETT #12# |ulst0| . #13#)
                   (LETT |v| NIL . #13#) (LETT #11# |vlst0| . #13#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |v| (CAR #11#) . #13#) NIL)
                         (ATOM #12#) (PROGN (LETT |u| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |kf| (QREFELT $ 110))
                       (SEQ (LETT |vlst| (CONS |v| |vlst|) . #13#)
                            (EXIT (LETT |ulst| (CONS |u| |ulst|) . #13#))))
                      ('T (LETT |u0| |u| . #13#)))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |as| (SPADCALL (QREFELT $ 194)) . #13#)
              (LETT |a| (SPADCALL |as| (QREFELT $ 172)) . #13#)
              (LETT |bs| (SPADCALL (QREFELT $ 194)) . #13#)
              (LETT |b| (SPADCALL |bs| (QREFELT $ 172)) . #13#)
              (LETT |nn|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT $ 40)) 1
                                          (QREFELT $ 63))
                                (SPADCALL (SPADCALL |b| (QREFELT $ 40))
                                          (QREFELT $ 21))
                                (QREFELT $ 64))
                               |denf| (QREFELT $ 71))
                              (QREFELT $ 64))
                    . #13#)
              (LETT |qq| (SPADCALL |gd| |nn| (QREFELT $ 195)) . #13#)
              (LETT |eqs0|
                    (PROGN
                     (LETT #8# NIL . #13#)
                     (SEQ (LETT |ci| NIL . #13#)
                          (LETT #7# (SPADCALL |qq| (QREFELT $ 66)) . #13#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |ci| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS
                                   (SPADCALL (SPADCALL |ci| (QREFELT $ 102))
                                             (QREFELT $ 15))
                                   #8#)
                                  . #13#)))
                          (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #13#)
              (LETT |lsol| (|RDEEFX;solve_poly_eqs| |eqs0| |as| |bs| $) . #13#)
              (LETT |has_r_bad| 'NIL . #13#) (LETT |r_bad| 0 . #13#)
              (COND
               ((>= (+ (SPADCALL |denf| (QREFELT $ 59)) 1)
                    (SPADCALL |nf| (QREFELT $ 59)))
                (COND
                 ((SPADCALL (+ (SPADCALL |denf| (QREFELT $ 59)) 1)
                            (SPADCALL |nf| (QREFELT $ 59)) (QREFELT $ 72))
                  (SEQ (LETT |has_r_bad| 'T . #13#)
                       (EXIT (LETT |r_bad| 0 . #13#))))
                 ('T
                  (SEQ
                   (LETT |cc|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 77))
                                    (SPADCALL |denf| (QREFELT $ 77))
                                    (QREFELT $ 61))
                          (QREFELT $ 62))
                         . #13#)
                   (LETT |ccu| (SPADCALL |cc| (QREFELT $ 112)) . #13#)
                   (EXIT
                    (COND
                     ((QEQCAR |ccu| 0)
                      (SEQ (LETT |has_r_bad| 'T . #13#)
                           (EXIT (LETT |r_bad| (QCDR |ccu|) . #13#)))))))))))
              (LETT |res| NIL . #13#)
              (SEQ (LETT |sol| NIL . #13#) (LETT #6# |lsol| . #13#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sol| (CAR #6#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ru| (SPADCALL (QCAR |sol|) (QREFELT $ 196)) . #13#)
                    (EXIT
                     (COND ((QEQCAR |ru| 1) "iterate")
                           ('T
                            (SEQ
                             (COND
                              (|has_r_bad|
                               (COND
                                ((EQL (QCDR |ru|) |r_bad|) (EXIT "iterate")))))
                             (LETT |res1|
                                   (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                    (QCDR |sol|) (QCDR |ru|) |u| |vlst| |ulst|
                                    |k| |x| 'T $)
                                   . #13#)
                             (EXIT
                              (COND ((QEQCAR |res1| 1) "iterate")
                                    ('T
                                     (LETT |res| (CONS (QCDR |res1|) |res|)
                                           . #13#)))))))))
                   (LETT #6# (CDR #6#) . #13#) (GO G190) G191 (EXIT NIL))
              (LETT |nnp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |nf| (QREFELT $ 197)) |denf|
                                (QREFELT $ 71))
                      (SPADCALL (SPADCALL |denf| (QREFELT $ 197)) |nf|
                                (QREFELT $ 71))
                      (QREFELT $ 198))
                     (SPADCALL (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 21))
                     (QREFELT $ 64))
                    . #13#)
              (LETT |eq1| (SPADCALL |nnp| |gd| (QREFELT $ 199)) . #13#)
              (LETT |ratl| (|RDEEFX;get_rational_solutions2| |eq1| |a| $)
                    . #13#)
              (COND
               (|has_r_bad|
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |r_bad| (QREFELT $ 118)) |ratl|
                             (QREFELT $ 200)))
                  (LETT |ratl| (CONS (SPADCALL |r_bad| (QREFELT $ 118)) |ratl|)
                        . #13#)))))
              (LETT |degd| (SPADCALL |denf| (QREFELT $ 59)) . #13#)
              (LETT |degn| (SPADCALL |nf| (QREFELT $ 59)) . #13#)
              (LETT |degn1| (MAX |degn| (+ |degd| 1)) . #13#)
              (SEQ (LETT |r0| NIL . #13#) (LETT #4# |ratl| . #13#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |r0| (CAR #4#) . #13#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ru| (SPADCALL |r0| (QREFELT $ 196)) . #13#)
                        (EXIT
                         (COND ((QEQCAR |ru| 1) "iterate")
                               ('T
                                (SEQ (LETT |ri| (QCDR |ru|) . #13#)
                                     (LETT |nn|
                                           (SPADCALL |nf|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          28))
                                                       1 (QREFELT $ 63))
                                                      |denf| (QREFELT $ 71))
                                                     (QREFELT $ 64))
                                           . #13#)
                                     (LETT |res1l|
                                           (|RDEEFX;ei_args3| |gd| |nn| |denf|
                                            |k| |vlst| |ulst| |x| $)
                                           . #13#)
                                     (EXIT
                                      (SEQ (LETT |res1| NIL . #13#)
                                           (LETT #2# |res1l| . #13#) G190
                                           (COND
                                            ((OR (ATOM #2#)
                                                 (PROGN
                                                  (LETT |res1| (CAR #2#)
                                                        . #13#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |ap| (QVELT |res1| 3) . #13#)
                                            (LETT |fac| (QVELT |res1| 0)
                                                  . #13#)
                                            (LETT |dega|
                                                  (COND
                                                   ((SPADCALL |ap|
                                                              (|spadConstant| $
                                                                              70)
                                                              (QREFELT $ 84))
                                                    1)
                                                   ('T
                                                    (SPADCALL |ap|
                                                              (QREFELT $ 59))))
                                                  . #13#)
                                            (LETT |vp| (QVELT |res1| 2) . #13#)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |fac| (QREFELT $ 59))
                                                (SPADCALL |degn1| |dega|
                                                          (QREFELT $ 201)))
                                               "iterate")
                                              ('T
                                               (LETT |res|
                                                     (CONS
                                                      (VECTOR |fac| |ri|
                                                              (QVELT |res1| 2)
                                                              |ap|
                                                              (SPADCALL
                                                               (SPADCALL |u0|
                                                                         |ri|
                                                                         (QREFELT
                                                                          $
                                                                          42))
                                                               (QVELT |res1| 4)
                                                               (QREFELT $ 29))
                                                              0
                                                              (QVELT |res1| 6))
                                                      |res|)
                                                     . #13#)))))
                                           (LETT #2# (CDR #2#) . #13#)
                                           (GO G190) G191 (EXIT NIL))))))))
                   (LETT #4# (CDR #4#) . #13#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args1|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|t| |Kernel| (|Expression| R))
         ($ |Factored|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
        (SPROG ((|r| (|Expression| R)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 40)) |denf|
                                           (QREFELT $ 114))
                                 (QREFELT $ 64))
                       |gd| (QREFELT $ 199))
                      |RDEEFX;ei_args1|)
                (EXIT
                 (SPADCALL (SPADCALL |r| (QREFELT $ 102)) (QREFELT $ 105)))))) 

(SDEFUN |RDEEFX;ei_args2|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|f_res| |Factored|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
         (|t| |Kernel| (|Expression| R)) (|k| |Kernel| (|Expression| R))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|resu|
           (|Union|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))
            "failed"))
          (|deg1| #1=(|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G445 NIL) (|fac| NIL) (|degg| #1#)
          (|dummy| (|SingletonAsOrderedSet|))
          (|rfac|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|)))))
          (|n1| (|Integer|)) (|log_case| (|Boolean|)))
         (SEQ
          (LETT |log_case| (SPADCALL |k| '|log| (QREFELT $ 38))
                . #3=(|RDEEFX;ei_args2|))
          (LETT |n1| 0 . #3#)
          (LETT |rfac| (SPADCALL |f_res| (QREFELT $ 109)) . #3#)
          (LETT |dummy| (SPADCALL (QREFELT $ 57)) . #3#) (LETT |res| NIL . #3#)
          (LETT |degg| (SPADCALL |gd| (QREFELT $ 59)) . #3#)
          (SEQ (LETT |fac| NIL . #3#) (LETT #2# |rfac| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |t| $) . #3#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 59)) . #3#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ('T
                            (SEQ
                             (LETT |resu|
                                   (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                    |f1| 0 (|spadConstant| $ 35) |vlst| |ulst|
                                    |k| |x| 'NIL $)
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |resu| 0)
                                (LETT |res| (CONS (QCDR |resu|) |res|)
                                      . #3#)))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args3|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|f_res|
           (|Factored|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (|t| (|Kernel| (|Expression| R))))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 194)) (QREFELT $ 172))
                . #1=(|RDEEFX;ei_args3|))
          (LETT |f_res| (|RDEEFX;ei_args1| |gd| |nf| |denf| |t| $) . #1#)
          (EXIT
           (|RDEEFX;ei_args2| |gd| |nf| |denf| |f_res| |t| |k| |vlst| |ulst|
            |x| $))))) 

(SDEFUN |RDEEFX;ei_args|
        ((|gd| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|res1|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R))))))
         (SEQ
          (COND ((EQL (SPADCALL |gd| (QREFELT $ 59)) 0) NIL)
                (#1='T
                 (SEQ
                  (LETT |res1|
                        (COND
                         ((SPADCALL |k| '|log| (QREFELT $ 38))
                          (|RDEEFX;ei_args0| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $))
                         (#1#
                          (|RDEEFX;ei_args3| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| $)))
                        |RDEEFX;ei_args|)
                  (EXIT |res1|))))))) 

(SDEFUN |RDEEFX;my_exp|
        ((|p| |SparseUnivariatePolynomial| (|Expression| R))
         (|n| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| (|Expression| R)))
        (SPADCALL |p| |n| (QREFELT $ 203))) 

(SDEFUN |RDEEFX;ei_candidate|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|) (|a| |Integer|)
         (|tt| |Expression| R)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|uv|
           (|Record| (|:| |u_part| (|Expression| R))
                     (|:| |v_part| (|Expression| R))
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| (|Expression| R))
                      (|:| |v_part| (|Expression| R))
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|nf1| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ
          (LETT |tt| (SPADCALL |tt| (QREFELT $ 62))
                . #1=(|RDEEFX;ei_candidate|))
          (LETT |nf1|
                (SPADCALL |nf| (SPADCALL |tt| |denf| (QREFELT $ 114))
                          (QREFELT $ 64))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf1| (QREFELT $ 83)) (|spadConstant| $ 70)
                       (QREFELT $ 82))
             |res|)
            (#2='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |nf1| (QREFELT $ 59)) 0 (QREFELT $ 106))
                (COND
                 ((NULL (SPADCALL |k| '|exp| (QREFELT $ 38))) (EXIT |res|)))))
              (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $) . #1#)
              (EXIT
               (COND ((QEQCAR |uvu| 1) |res|)
                     (#2#
                      (SEQ (LETT |uv| (QCDR |uvu|) . #1#)
                           (EXIT
                            (CONS
                             (VECTOR 1 |nf1| (|spadConstant| $ 35) |a| |tt|
                                     (|spadConstant| $ 70)
                                     (SPADCALL |nf1| |denf| (QREFELT $ 204))
                                     (|spadConstant| $ 205) (QVELT |uv| 0)
                                     (QVELT |uv| 2) (QVELT |uv| 1))
                             |res|))))))))))))) 

(SDEFUN |RDEEFX;special_ei_candidates|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|tt| (|Expression| R)) (|a| (|Integer|)) (#1=#:G484 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (|Expression| R))
          (|res|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |coeff| (|Expression| R))
                      (|:| |ratpart| (|Integer|))
                      (|:| |v_part| (|Expression| R))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |new_f|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |radicand|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |u_part| (|Expression| R))
                      (|:| |exponent| (|Integer|))
                      (|:| |shift_part| (|Expression| R)))))
          (|rdf| #2=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|rnf| #2#) (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |tt| (|spadConstant| $ 30)
                  . #4=(|RDEEFX;special_ei_candidates|))
            (LETT |a| 0 . #4#)
            (EXIT
             (COND
              ((SPADCALL |k| '|exp| (QREFELT $ 38))
               (SEQ (LETT |res| NIL . #4#)
                    (LETT |n1| (SPADCALL |nf| (QREFELT $ 59)) . #4#)
                    (LETT |n2| (SPADCALL |denf| (QREFELT $ 59)) . #4#)
                    (LETT |rnf| (SPADCALL |nf| (QREFELT $ 83)) . #4#)
                    (LETT |rdf| (SPADCALL |denf| (QREFELT $ 83)) . #4#)
                    (EXIT
                     (COND
                      ((EQL |n1| |n2|)
                       (SEQ (LETT |tt| (SPADCALL |nf| (QREFELT $ 77)) . #4#)
                            (LETT |res|
                                  (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                   |ulst| |k| |x| |a| |tt| |res| $)
                                  . #4#)
                            (COND
                             ((SPADCALL |rdf| (|spadConstant| $ 70)
                                        (QREFELT $ 82))
                              (COND
                               ((EQL (SPADCALL |rdf| (QREFELT $ 59))
                                     (SPADCALL |rnf| (QREFELT $ 59)))
                                (EXIT
                                 (SEQ
                                  (LETT |tt|
                                        (SPADCALL
                                         (SPADCALL |rnf| (QREFELT $ 77))
                                         (SPADCALL |rdf| (QREFELT $ 77))
                                         (QREFELT $ 61))
                                        . #4#)
                                  (EXIT
                                   (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                    |ulst| |k| |x| |a| |tt| |res| $))))))))
                            (EXIT |res|)))
                      (#5='T
                       (SEQ
                        (LETT |res|
                              (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst|
                               |k| |x| |a| (|spadConstant| $ 30) |res| $)
                              . #4#)
                        (COND
                         ((< |n1| |n2|)
                          (COND
                           ((SPADCALL |rdf| (|spadConstant| $ 70)
                                      (QREFELT $ 82))
                            (COND
                             ((EQL (SPADCALL |rdf| (QREFELT $ 59)) |n1|)
                              (EXIT
                               (SEQ
                                (LETT |tt|
                                      (SPADCALL (SPADCALL |nf| (QREFELT $ 77))
                                                (SPADCALL |rdf| (QREFELT $ 77))
                                                (QREFELT $ 61))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (COND
                         ((SPADCALL |n1| |n2| (QREFELT $ 72))
                          (COND
                           ((SPADCALL |rnf| (|spadConstant| $ 70)
                                      (QREFELT $ 82))
                            (COND
                             ((EQL (SPADCALL |rnf| (QREFELT $ 59)) |n2|)
                              (EXIT
                               (SEQ
                                (LETT |tt| (SPADCALL |rnf| (QREFELT $ 77))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (EXIT |res|)))))))
              ((SPADCALL (SPADCALL |nf| (QREFELT $ 59))
                         (+ (SPADCALL |denf| (QREFELT $ 59)) 1)
                         (QREFELT $ 106))
               NIL)
              (#5#
               (SEQ
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 38))
                  (COND
                   ((EQL (SPADCALL |nf| (QREFELT $ 59))
                         (+ (SPADCALL |denf| (QREFELT $ 59)) 1))
                    (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 77)) . #4#)
                         (LETT |rcu| (SPADCALL |lc| (QREFELT $ 112)) . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |rcu| 1)
                            (PROGN (LETT #1# NIL . #4#) (GO #6=#:G483)))
                           (#5#
                            (SEQ (LETT |a| (- (QCDR |rcu|)) . #4#)
                                 (EXIT
                                  (LETT |nf|
                                        (SPADCALL |nf|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |a|
                                                              (QREFELT $ 28))
                                                    1 (QREFELT $ 63))
                                                   |denf| (QREFELT $ 71))
                                                  (QREFELT $ 64))
                                        . #4#)))))))))))
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 59))
                       (SPADCALL |denf| (QREFELT $ 59)))
                  (LETT |tt| (SPADCALL |nf| (QREFELT $ 77)) . #4#)))
                (EXIT
                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst| |k| |x| |a|
                  |tt| NIL $))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |RDEEFX;gamma_candidate|
        ((|fnf| |Factored| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|nf1| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|gden1| |SparseUnivariatePolynomial| (|Expression| R))
         (|gexp| |Integer|) (|a| |Integer|) (|tt| |Expression| R)
         (|f2| |SparseUnivariatePolynomial| (|Expression| R))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|unf| (|Expression| R))
          (|uv|
           (|Record| (|:| |u_part| (|Expression| R))
                     (|:| |v_part| (|Expression| R))
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| (|Expression| R))
                      (|:| |v_part| (|Expression| R))
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (#1=#:G492 NIL)
          (|nf2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G502 NIL) (|e1| NIL) (#3=#:G503 NIL) (|fac1| NIL)
          (#4=#:G501 NIL) (|lexp1| (|List| (|NonNegativeInteger|)))
          (#5=#:G487 NIL) (#6=#:G500 NIL) (#7=#:G499 NIL) (|l1| (|Integer|))
          (|lexp| (|List| #8=(|Integer|))) (#9=#:G498 NIL) (#10=#:G497 NIL)
          (|nffacs|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| #8#)))))
         (SEQ
          (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 209))
                . #11=(|RDEEFX;gamma_candidate|))
          (LETT |lexp|
                (PROGN
                 (LETT #10# NIL . #11#)
                 (SEQ (LETT |fac1| NIL . #11#) (LETT #9# |nffacs| . #11#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |fac1| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #10# (CONS (QCDR |fac1|) #10#) . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |l1| (GCD |gexp| (SPADCALL |lexp| (QREFELT $ 89))) . #11#)
          (EXIT
           (COND ((EQL |l1| 1) |res|)
                 (#12='T
                  (SEQ
                   (LETT |lexp1|
                         (PROGN
                          (LETT #7# NIL . #11#)
                          (SEQ (LETT |e1| NIL . #11#) (LETT #6# |lexp| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |e1| (CAR #6#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #7#
                                       (CONS
                                        (PROG1
                                            (LETT #5# (QUOTIENT2 |e1| |l1|)
                                                  . #11#)
                                          (|check_subtype2| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                        #7#)
                                       . #11#)))
                               (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #7#))))
                         . #11#)
                   (LETT |nf2|
                         (SPADCALL (ELT $ 71)
                                   (PROGN
                                    (LETT #4# NIL . #11#)
                                    (SEQ (LETT |fac1| NIL . #11#)
                                         (LETT #3# |nffacs| . #11#)
                                         (LETT |e1| NIL . #11#)
                                         (LETT #2# |lexp1| . #11#) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |e1| (CAR #2#) . #11#)
                                                NIL)
                                               (ATOM #3#)
                                               (PROGN
                                                (LETT |fac1| (CAR #3#) . #11#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (|RDEEFX;my_exp|
                                                   (QCAR |fac1|) |e1| $)
                                                  #4#)
                                                 . #11#)))
                                         (LETT #2#
                                               (PROG1 (CDR #2#)
                                                 (LETT #3# (CDR #3#) . #11#))
                                               . #11#)
                                         (GO G190) G191 (EXIT (NREVERSE #4#))))
                                   (|spadConstant| $ 54) (QREFELT $ 212))
                         . #11#)
                   (LETT |gden1|
                         (COND ((EQL |gexp| 1) (|spadConstant| $ 54))
                               (#12#
                                (|RDEEFX;my_exp| |gden1|
                                 (PROG1
                                     (LETT #1# (QUOTIENT2 |gexp| |l1|) . #11#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 $)))
                         . #11#)
                   (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| $)
                         . #11#)
                   (EXIT
                    (COND ((QEQCAR |uvu| 1) |res|)
                          (#12#
                           (SEQ (LETT |uv| (QCDR |uvu|) . #11#)
                                (LETT |unf|
                                      (SPADCALL
                                       (SPADCALL |fnf| (QREFELT $ 213))
                                       (QREFELT $ 214))
                                      . #11#)
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL |unf| |x| (QREFELT $ 43))
                                    (|spadConstant| $ 30) (QREFELT $ 110))
                                   |res|)
                                  (#12#
                                   (CONS
                                    (VECTOR |l1| |nf2| |unf| |a| |tt| |f2|
                                            (SPADCALL |nf1| |denf|
                                                      (QREFELT $ 204))
                                            (SPADCALL |nf2| |gden1|
                                                      (QREFELT $ 204))
                                            (QVELT |uv| 0) (QVELT |uv| 2)
                                            (QVELT |uv| 1))
                                    |res|))))))))))))))) 

(SDEFUN |RDEEFX;gammas1|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R)) (|a| |Integer|)
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf1| |SparseUnivariatePolynomial| (|Expression| R))
         (|gexp| |Integer|) (|n2| |Integer|) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|k| |Kernel| (|Expression| R))
         (|x| |Symbol|)
         (|res| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|fnf| (|Factored| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nf1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|tt| (|Expression| R)) (|deg1| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G518 NIL) (|fac| NIL) (|e_tt| (|List| (|Expression| R)))
          (|rfacs|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|)))))
          (|f_res|
           (|Factored|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (|r| (|Expression| R))
          (|nfp1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|t| (|Kernel| (|Expression| R))))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 194)) (QREFELT $ 172))
                . #2=(|RDEEFX;gammas1|))
          (LETT |nfp1|
                (SPADCALL
                 (SPADCALL (SPADCALL |nf| (QREFELT $ 197)) |denf1|
                           (QREFELT $ 71))
                 (SPADCALL
                  (SPADCALL (SPADCALL |gexp| (QREFELT $ 28)) |nf|
                            (QREFELT $ 114))
                  (SPADCALL |denf1| (QREFELT $ 197)) (QREFELT $ 71))
                 (QREFELT $ 198))
                . #2#)
          (LETT |r|
                (SPADCALL
                 (SPADCALL |nf|
                           (SPADCALL
                            (SPADCALL (SPADCALL |t| (QREFELT $ 40))
                                      (QREFELT $ 21))
                            |denf| (QREFELT $ 71))
                           (QREFELT $ 64))
                 |nfp1| (QREFELT $ 199))
                . #2#)
          (LETT |f_res|
                (SPADCALL (SPADCALL |r| (QREFELT $ 102)) (QREFELT $ 105))
                . #2#)
          (LETT |rfacs| (SPADCALL |f_res| (QREFELT $ 109)) . #2#)
          (LETT |e_tt|
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
                  (LIST (|spadConstant| $ 30)))
                 ((EQL (SPADCALL |nf| (QREFELT $ 59))
                       (SPADCALL |denf| (QREFELT $ 59)))
                  (SEQ
                   (LETT |tt|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 77))
                                    (SPADCALL |denf| (QREFELT $ 77))
                                    (QREFELT $ 61))
                          (QREFELT $ 62))
                         . #2#)
                   (LETT |nf1|
                         (SPADCALL |nf|
                                   (SPADCALL (SPADCALL |tt| (QREFELT $ 21))
                                             |denf| (QREFELT $ 71))
                                   (QREFELT $ 64))
                         . #2#)
                   (EXIT
                    (COND ((EQL (SPADCALL |nf1| (QREFELT $ 59)) 0) (LIST |tt|))
                          (#3='T NIL)))))
                 (#3# NIL))
                . #2#)
          (COND
           ((NULL (NULL |e_tt|))
            (SEQ (LETT |tt| (|SPADfirst| |e_tt|) . #2#)
                 (LETT |nf1|
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |tt| (QREFELT $ 21))
                                           |denf| (QREFELT $ 71))
                                 (QREFELT $ 64))
                       . #2#)
                 (LETT |fnf| (SPADCALL |nf1| NIL (QREFELT $ 218)) . #2#)
                 (EXIT
                  (LETT |res|
                        (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf| |denf1|
                         |gexp| |a| |tt| (|spadConstant| $ 70) |vlst| |ulst|
                         |k| |x| |res| $)
                        . #2#)))))
          (SEQ (LETT |fac| NIL . #2#) (LETT #1# |rfacs| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |t| $) . #2#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 59)) . #2#)
                    (EXIT
                     (COND
                      ((EQL |deg1| 1)
                       (SEQ
                        (LETT |tt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f1| 0 (QREFELT $ 60))
                                         (SPADCALL |f1| 1 (QREFELT $ 60))
                                         (QREFELT $ 61))
                               (QREFELT $ 62))
                              . #2#)
                        (LETT |nf1|
                              (SPADCALL |nf|
                                        (SPADCALL
                                         (SPADCALL |tt| (QREFELT $ 21)) |denf|
                                         (QREFELT $ 71))
                                        (QREFELT $ 64))
                              . #2#)
                        (EXIT
                         (COND
                          ((< (SPADCALL 2 (QCDR |fac|) (QREFELT $ 220))
                              (SPADCALL |nf1| (QREFELT $ 59)))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 222)) . #2#)
                            (EXIT
                             (LETT |res|
                                   (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                                    |denf1| |gexp| |a| |tt|
                                    (|spadConstant| $ 70) |vlst| |ulst| |k| |x|
                                    |res| $)
                                   . #2#))))))))
                      ((OR (< (QCDR |fac|) |n2|) 'T) "iterate"))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |RDEEFX;special_candidates|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf1| |SparseUnivariatePolynomial| (|Expression| R))
         (|gexp| |Integer|) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|k| |Kernel| (|Expression| R))
         (|x| |Symbol|)
         ($ |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R)))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |coeff| (|Expression| R))
                      (|:| |ratpart| (|Integer|))
                      (|:| |v_part| (|Expression| R))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |new_f|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |radicand|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |u_part| (|Expression| R))
                      (|:| |exponent| (|Integer|))
                      (|:| |shift_part| (|Expression| R)))))
          (|nn| #1=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|ri| (|Integer|)) (|ru| (|Union| (|Integer|) "failed"))
          (#2=#:G542 NIL) (|sol| NIL)
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|f_res1| (|Expression| R)) (|tx_plus_b| #1#)
          (|bk| #3=(|Kernel| (|Expression| R))) (|bs| #4=(|Symbol|))
          (#5=#:G541 NIL) (|r0| NIL) (|ratl| (|List| (|Fraction| (|Integer|))))
          (|nnp2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|t3| #6=(|SparseUnivariatePolynomial| (|Expression| R))) (|t2| #6#)
          (|ct1| (|Expression| R)) (|t1| #6#)
          (|denf2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|denfp2| #7=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|nfp2| #7#) (|nnp| #1#) (|denfp1| #7#) (|nfp1| #7#) (|t| #3#)
          (|ts| #4#) (|n4| (|Integer|)) (|l| (|Integer|))
          (|n3| (|NonNegativeInteger|)) (|n1| #8=(|NonNegativeInteger|))
          (|a| (|Integer|)) (#9=#:G540 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (|Expression| R))
          (|n2| #8#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res1|
                  (|RDEEFX;special_ei_candidates| |nf| |denf| |vlst| |ulst| |k|
                   |x| $)
                  . #10=(|RDEEFX;special_candidates|))
            (LETT |a| 0 . #10#)
            (LETT |n1| (SPADCALL |nf| (QREFELT $ 59)) . #10#)
            (LETT |n2| (SPADCALL |denf| (QREFELT $ 59)) . #10#)
            (EXIT
             (COND ((EQL |n1| 1) |res1|)
                   (#11='T
                    (SEQ
                     (COND
                      ((EQL |n1| (+ |n2| 1))
                       (COND
                        ((NULL (SPADCALL |k| '|log| (QREFELT $ 38)))
                         (PROGN (LETT #9# |res1| . #10#) (GO #12=#:G539)))
                        ('T
                         (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 77)) . #10#)
                              (LETT |rcu| (SPADCALL |lc| (QREFELT $ 112))
                                    . #10#)
                              (EXIT
                               (COND
                                ((QEQCAR |rcu| 1)
                                 (PROGN (LETT #9# |res1| . #10#) (GO #12#)))
                                (#11#
                                 (SEQ (LETT |a| (QCDR |rcu|) . #10#)
                                      (LETT |nf|
                                            (SPADCALL |nf|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |a|
                                                                  (QREFELT $
                                                                           28))
                                                        1 (QREFELT $ 63))
                                                       |denf| (QREFELT $ 71))
                                                      (QREFELT $ 198))
                                            . #10#)
                                      (EXIT (LETT |n1| |n2| . #10#)))))))))))
                     (LETT |n3| (MAX |n1| |n2|) . #10#)
                     (LETT |l| (GCD |gexp| |n3|) . #10#)
                     (EXIT
                      (COND ((EQL |l| 1) |res1|)
                            (#11#
                             (SEQ
                              (LETT |n4| (- |n3| (QUOTIENT2 |n3| 2)) . #10#)
                              (LETT |ts| (SPADCALL (QREFELT $ 194)) . #10#)
                              (LETT |t| (SPADCALL |ts| (QREFELT $ 172)) . #10#)
                              (LETT |nfp1| (SPADCALL |nf| (QREFELT $ 197))
                                    . #10#)
                              (LETT |denfp1| (SPADCALL |denf1| (QREFELT $ 197))
                                    . #10#)
                              (COND
                               ((SPADCALL |n1| |n2| (QREFELT $ 72))
                                (COND
                                 ((SPADCALL |k| '|log| (QREFELT $ 38))
                                  (EXIT
                                   (SEQ
                                    (LETT |nnp|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |nfp1| |denf1|
                                                      (QREFELT $ 71))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |gexp| (QREFELT $ 28))
                                              |denfp1| (QREFELT $ 114))
                                             |nf| (QREFELT $ 71))
                                            (QREFELT $ 198))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |t| (QREFELT $ 40))
                                              (QREFELT $ 21))
                                             |denf| (QREFELT $ 71))
                                            |denf1| (QREFELT $ 71))
                                           (QREFELT $ 64))
                                          . #10#)
                                    (EXIT
                                     (COND
                                      ((ODDP |l|)
                                       (SEQ
                                        (LETT |nfp2|
                                              (SPADCALL |nfp1| (QREFELT $ 197))
                                              . #10#)
                                        (LETT |denfp2|
                                              (SPADCALL |denfp1|
                                                        (QREFELT $ 197))
                                              . #10#)
                                        (LETT |denf2|
                                              (SPADCALL |denf1| |denf1|
                                                        (QREFELT $ 71))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 2 |gexp|
                                                          (QREFELT $ 220))
                                                (QREFELT $ 28))
                                               |denfp1| (QREFELT $ 114))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL |t1| |nfp1|
                                                         (QREFELT $ 71))
                                               |denf1| (QREFELT $ 71))
                                              . #10#)
                                        (LETT |ct1|
                                              (SPADCALL (* (+ |gexp| 1) |gexp|)
                                                        (QREFELT $ 28))
                                              . #10#)
                                        (LETT |t2|
                                              (SPADCALL |ct1| |denfp1|
                                                        (QREFELT $ 114))
                                              . #10#)
                                        (LETT |t2|
                                              (SPADCALL
                                               (SPADCALL |t2| |denfp1|
                                                         (QREFELT $ 71))
                                               |nf| (QREFELT $ 71))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |gexp| (QREFELT $ 28))
                                               |denfp2| (QREFELT $ 114))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |t3| |nf|
                                                         (QREFELT $ 71))
                                               |denf1| (QREFELT $ 71))
                                              . #10#)
                                        (LETT |nnp2|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |nfp2| |denf2|
                                                           (QREFELT $ 71))
                                                 |t1| (QREFELT $ 198))
                                                |t2| (QREFELT $ 64))
                                               |t3| (QREFELT $ 198))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp| |nnp2|
                                                        (QREFELT $ 199))
                                              . #10#)
                                        (LETT |ratl|
                                              (|RDEEFX;get_rational_solutions2|
                                               |f_res1| |t| $)
                                              . #10#)
                                        (SEQ (LETT |r0| NIL . #10#)
                                             (LETT #5# |ratl| . #10#) G190
                                             (COND
                                              ((OR (ATOM #5#)
                                                   (PROGN
                                                    (LETT |r0| (CAR #5#)
                                                          . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |ru|
                                                    (SPADCALL |r0|
                                                              (QREFELT $ 196))
                                                    . #10#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |ru| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |ri| (QCDR |ru|)
                                                        . #10#)
                                                  (LETT |nn|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |ri|
                                                                     (QREFELT $
                                                                              28))
                                                                    1
                                                                    (QREFELT $
                                                                             63))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            71))
                                                                  (QREFELT $
                                                                           64))
                                                        . #10#)
                                                  (EXIT
                                                   (LETT |res1|
                                                         (|RDEEFX;gammas1| |nn|
                                                          |ri| |denf| |denf1|
                                                          |gexp| |n2| |vlst|
                                                          |ulst| |k| |x| |res1|
                                                          $)
                                                         . #10#)))))))
                                             (LETT #5# (CDR #5#) . #10#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |res1|)))
                                      (#11#
                                       (SEQ
                                        (LETT |bs| (SPADCALL (QREFELT $ 194))
                                              . #10#)
                                        (LETT |bk|
                                              (SPADCALL |bs| (QREFELT $ 172))
                                              . #10#)
                                        (LETT |tx_plus_b|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |t| (QREFELT $ 40)) 1
                                                (QREFELT $ 63))
                                               (SPADCALL
                                                (SPADCALL |bk| (QREFELT $ 40))
                                                (QREFELT $ 21))
                                               (QREFELT $ 64))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   |tx_plus_b|
                                                                   |denf|
                                                                   (QREFELT $
                                                                            71))
                                                                  (QREFELT $
                                                                           64))
                                                        (QREFELT $ 199))
                                              . #10#)
                                        (LETT |lsol|
                                              (|RDEEFX;solve_poly_eqs|
                                               (LIST |f_res1|
                                                     (SPADCALL |f_res1| |bs|
                                                               (QREFELT $ 43)))
                                               |ts| |bs| $)
                                              . #10#)
                                        (SEQ (LETT |sol| NIL . #10#)
                                             (LETT #2# |lsol| . #10#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |sol| (CAR #2#)
                                                          . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |ru|
                                                    (SPADCALL (QCAR |sol|)
                                                              (QREFELT $ 196))
                                                    . #10#)
                                              (EXIT
                                               (COND
                                                ((QEQCAR |ru| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |ri| (QCDR |ru|)
                                                        . #10#)
                                                  (LETT |nn|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |ri|
                                                                     (QREFELT $
                                                                              28))
                                                                    1
                                                                    (QREFELT $
                                                                             63))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            71))
                                                                  (QREFELT $
                                                                           64))
                                                        . #10#)
                                                  (EXIT
                                                   (LETT |res1|
                                                         (|RDEEFX;gammas1| |nn|
                                                          |ri| |denf| |denf1|
                                                          |gexp| |n2| |vlst|
                                                          |ulst| |k| |x| |res1|
                                                          $)
                                                         . #10#)))))))
                                             (LETT #2# (CDR #2#) . #10#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |res1|)))))))))))
                              (EXIT
                               (|RDEEFX;gammas1| |nf| |a| |denf| |denf1| |gexp|
                                |n2| |vlst| |ulst| |k| |x| |res1| $))))))))))))
          #12# (EXIT #9#)))) 

(SDEFUN |RDEEFX;finish_special_integrate|
        ((|rr1f| |Expression| R) (|a1p| |Expression| R)
         (|vs| |Vector| (|Expression| R)) (|as| |Vector| (|Expression| R))
         (|scands|
          . #1=(|List|
                (|Record| (|:| |degree| (|Integer|))
                          (|:| |factor|
                               (|SparseUnivariatePolynomial| (|Expression| R)))
                          (|:| |coeff| (|Expression| R))
                          (|:| |ratpart| (|Integer|))
                          (|:| |v_part| (|Expression| R))
                          (|:| |alg_part|
                               (|SparseUnivariatePolynomial| (|Expression| R)))
                          (|:| |new_f|
                               (|Fraction|
                                (|SparseUnivariatePolynomial|
                                 (|Expression| R))))
                          (|:| |radicand|
                               (|Fraction|
                                (|SparseUnivariatePolynomial|
                                 (|Expression| R))))
                          (|:| |u_part| (|Expression| R))
                          (|:| |exponent| (|Integer|))
                          (|:| |shift_part| (|Expression| R)))))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|gexp| |Integer|) (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|cand_prims| (|List| (|Expression| R))) (|ansp| (|Expression| R))
          (|scands1| #1#) (#2=#:G556 NIL) (|i| NIL)
          (|csol| (|Vector| (|Expression| R)))
          (|csolu| (|Union| (|Vector| (|Expression| R)) #3="failed"))
          (|c_lindep|
           (CATEGORY |package|
            (SIGNATURE |linearlyDependentOverConstants?|
             ((|Boolean|) (|Vector| (|Expression| R))))
            (SIGNATURE |linearDependenceOverConstants|
             ((|Union| (|Vector| (|Expression| R)) "failed")
              (|Vector| (|Expression| R))))
            (SIGNATURE |particularSolutionOverConstants|
             ((|Union| (|Vector| (|Expression| R)) #4="failed")
              (|Vector| (|Expression| R)) (|Expression| R)))
            (SIGNATURE |particularSolutionOverConstants|
             ((|Union| (|Vector| (|Expression| R)) #4#)
              (|Matrix| (|Expression| R)) (|Vector| (|Expression| R))))
            (SIGNATURE |solveLinearOverConstants|
             ((|Record|
               (|:| |particular| (|Union| (|Vector| (|Expression| R)) #4#))
               (|:| |basis| (|List| (|Vector| (|Expression| R)))))
              (|Vector| (|Expression| R)) (|Expression| R)))
            (SIGNATURE |solveLinearOverConstants|
             ((|Record|
               (|:| |particular| (|Union| (|Vector| (|Expression| R)) #4#))
               (|:| |basis| (|List| (|Vector| (|Expression| R)))))
              (|Matrix| (|Expression| R)) (|Vector| (|Expression| R))))
            (SIGNATURE |reducedSystem|
             ((|Record| (|:| |mat| (|Matrix| (|Expression| R)))
                        (|:| |vec| (|Vector| (|Expression| R))))
              (|Matrix| (|Expression| R)) (|Vector| (|Expression| R))))
            (SIGNATURE |reducedSystem|
             ((|Matrix| (|Expression| R)) (|Matrix| (|Expression| R)))))))
         (SEQ
          (LETT |c_lindep|
                (|ConstantLinearDependence| (QREFELT $ 6)
                                            (LIST
                                             (CONS
                                              #'|RDEEFX;finish_special_integrate!0|
                                              (VECTOR $ |x|))))
                . #5=(|RDEEFX;finish_special_integrate|))
          (LETT |csolu|
                (SPADCALL |vs| |rr1f|
                          (|compiledLookupCheck|
                           '|particularSolutionOverConstants|
                           (LIST
                            (LIST '|Union|
                                  (LIST '|Vector|
                                        (LIST '|Expression|
                                              (|devaluate| (ELT $ 6))))
                                  '#3#)
                            (LIST '|Vector|
                                  (LIST '|Expression| (|devaluate| (ELT $ 6))))
                            (LIST '|Expression| (|devaluate| (ELT $ 6))))
                           |c_lindep|))
                . #5#)
          (EXIT
           (COND
            ((QEQCAR |csolu| 1)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 30)
                     (|spadConstant| $ 30) 'NIL))
            ('T
             (SEQ (LETT |csol| (QCDR |csolu|) . #5#)
                  (LETT |scands1| |scands| . #5#) (LETT |cand_prims| NIL . #5#)
                  (LETT |ansp| (|spadConstant| $ 30) . #5#)
                  (SEQ (LETT |i| 1 . #5#) (LETT #2# (QVSIZE |vs|) . #5#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((NULL |cand_prims|)
                          (SEQ
                           (LETT |cand_prims|
                                 (|RDEEFX;get_prims| (|SPADfirst| |scands1|)
                                  |denf| |denf| |gexp| |k| $)
                                 . #5#)
                           (EXIT (LETT |scands1| (CDR |scands1|) . #5#)))))
                        (LETT |a1p|
                              (SPADCALL |a1p|
                                        (SPADCALL
                                         (SPADCALL |csol| |i| (QREFELT $ 223))
                                         (SPADCALL |as| |i| (QREFELT $ 223))
                                         (QREFELT $ 29))
                                        (QREFELT $ 34))
                              . #5#)
                        (LETT |ansp|
                              (SPADCALL |ansp|
                                        (SPADCALL
                                         (SPADCALL |csol| |i| (QREFELT $ 223))
                                         (|SPADfirst| |cand_prims|)
                                         (QREFELT $ 29))
                                        (QREFELT $ 26))
                              . #5#)
                        (EXIT (LETT |cand_prims| (CDR |cand_prims|) . #5#)))
                       (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (VECTOR |a1p| |rr1f| |ansp| 'T))))))))) 

(SDEFUN |RDEEFX;finish_special_integrate!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;finish_special_integrate|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |x| (QREFELT $ 43)))))) 

(SDEFUN |RDEEFX;exp_lower_bound|
        ((|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|scoeffs| |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|f| |Expression| R) (|g| |Expression| R)
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         ($ |Integer|))
        (SPROG
         ((|max_deg1| (|Integer|)) (|c0| (|Expression| R))
          (|order_a| (|NonNegativeInteger|))
          (|twr| (|List| (|Kernel| (|Expression| R)))) (#1=#:G572 NIL)
          (|kk| NIL) (#2=#:G571 NIL)
          (|ftwr| (|List| (|Kernel| (|Expression| R)))) (|min_deg| (|Integer|))
          (|max_deg| (|Integer|)) (|c_degs| (|List| (|NonNegativeInteger|)))
          (#3=#:G570 NIL) (|scoeff| NIL) (#4=#:G569 NIL))
         (SEQ
          (LETT |c_degs|
                (PROGN
                 (LETT #4# NIL . #5=(|RDEEFX;exp_lower_bound|))
                 (SEQ (LETT |scoeff| NIL . #5#) (LETT #3# |scoeffs| . #5#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |scoeff| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |scoeff| (QREFELT $ 224))
                                         (QREFELT $ 59))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |c_degs|
                (CONS
                 (SPADCALL (SPADCALL |rr1| (QREFELT $ 224)) (QREFELT $ 59))
                 |c_degs|)
                . #5#)
          (LETT |max_deg| (SPADCALL (ELT $ 225) |c_degs| (QREFELT $ 228))
                . #5#)
          (LETT |min_deg| (SPADCALL |nfp| (QREFELT $ 229)) . #5#)
          (LETT |ftwr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 231))
                          (SPADCALL |g| (QREFELT $ 231)) (QREFELT $ 233))
                . #5#)
          (LETT |twr|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |kk| NIL . #5#) (LETT #1# |ftwr| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| '|log| (QREFELT $ 38))
                          (LETT #2# (CONS |kk| #2#) . #5#)))))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (LETT |order_a| (SPADCALL |denfp| (QREFELT $ 229)) . #5#)
          (LETT |c0|
                (SPADCALL
                 (SPADCALL (SPADCALL |nfp| |order_a| (QREFELT $ 60))
                           (SPADCALL |denfp| |order_a| (QREFELT $ 60))
                           (QREFELT $ 61))
                 (QREFELT $ 62))
                . #5#)
          (LETT |max_deg1|
                (SPADCALL |twr| |ftwr| |c0| (- |min_deg| |order_a|)
                          (- (- |max_deg|) |order_a|) |x| |k| |lim|
                          (QREFELT $ 239))
                . #5#)
          (EXIT (MAX 0 (- (+ |max_deg1| |order_a|))))))) 

(SDEFUN |RDEEFX;exp_upper_bound|
        ((|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|scoeffs| |List| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|f| |Expression| R) (|g| |Expression| R)
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         ($ |Integer|))
        (SPROG
         ((|c0| (|Expression| R)) (|twr| (|List| (|Kernel| (|Expression| R))))
          (#1=#:G588 NIL) (|kk| NIL) (#2=#:G587 NIL)
          (|ftwr| (|List| (|Kernel| (|Expression| R)))) (|c_deg| (|Integer|))
          (|c_degs| (|List| (|NonNegativeInteger|))) (#3=#:G586 NIL)
          (|scoeff| NIL) (#4=#:G585 NIL))
         (SEQ
          (LETT |c_degs|
                (PROGN
                 (LETT #4# NIL . #5=(|RDEEFX;exp_upper_bound|))
                 (SEQ (LETT |scoeff| NIL . #5#) (LETT #3# |scoeffs| . #5#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |scoeff| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |scoeff| (QREFELT $ 59)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |c_deg| (SPADCALL (ELT $ 225) |c_degs| (QREFELT $ 228)) . #5#)
          (LETT |ftwr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 231))
                          (SPADCALL |g| (QREFELT $ 231)) (QREFELT $ 233))
                . #5#)
          (LETT |twr|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |kk| NIL . #5#) (LETT #1# |ftwr| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| '|log| (QREFELT $ 38))
                          (LETT #2# (CONS |kk| #2#) . #5#)))))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (LETT |c0|
                (SPADCALL
                 (SPADCALL (SPADCALL |nfp| (QREFELT $ 77))
                           (SPADCALL |denfp| (QREFELT $ 77)) (QREFELT $ 61))
                 (QREFELT $ 62))
                . #5#)
          (EXIT
           (SPADCALL |twr| |ftwr| |c0| (SPADCALL |denfp| (QREFELT $ 59))
                     (SPADCALL |nfp| (QREFELT $ 59)) |c_deg| |x| |k| |lim|
                     (QREFELT $ 240)))))) 

(SDEFUN |RDEEFX;special_integrate2|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| (|Expression| R)))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|ndenf| |SparseUnivariatePolynomial| (|Expression| R))
         (|f| |Expression| R) (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|a1| |Expression| R) (|r1| |Expression| R) (|g| |Expression| R)
         (|scoeffs| |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         (|gexp| |Integer|)
         (|deriv| |Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
          (|SparseUnivariatePolynomial| (|Expression| R)))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|a1p| (|Expression| R)) (|rr1f| (|Expression| R))
          (|ac1| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#2=#:G617 NIL) (|rsol| NIL) (#3=#:G618 NIL) (|c_an| NIL)
          (#4=#:G619 NIL) (|i| NIL) (|as| #5=(|Vector| (|Expression| R)))
          (|vs| #5#)
          (|rsols|
           (|List|
            (|Record|
             (|:| |ans| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |remainder|
                  (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|max_deg| (|Integer|))
          (|lc| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|specp1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|pscoeffs| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#6=#:G616 NIL) (|nscoeff| NIL) (#7=#:G615 NIL)
          (|inv_den1| (|Expression| R))
          (|inv_den|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nfp1| #1#) (|ak| (|Expression| R))
          (|nscoeffs|
           (|List|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (#8=#:G614 NIL) (#9=#:G613 NIL)
          (|mm| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#10=#:G600 NIL) (|neg_deg| (|Integer|))
          (|c_ans|
           (|List|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|her|
           (|Record|
            (|:| |answer|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |specpart|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Expression| R))))))
          (#11=#:G612 NIL) (|scoeff| NIL))
         (SEQ (LETT |nscoeffs| NIL . #12=(|RDEEFX;special_integrate2|))
              (LETT |c_ans| NIL . #12#)
              (SEQ (LETT |scoeff| NIL . #12#) (LETT #11# |scoeffs| . #12#) G190
                   (COND
                    ((OR (ATOM #11#)
                         (PROGN (LETT |scoeff| (CAR #11#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |her|
                          (|RDEEFX;special_Hermite| |scoeff| |nfp| |ndenf|
                           |denfp| |deriv| $)
                          . #12#)
                    (LETT |nscoeffs|
                          (CONS (SPADCALL |denfp| (QCDR |her|) (QREFELT $ 241))
                                |nscoeffs|)
                          . #12#)
                    (EXIT (LETT |c_ans| (CONS (QCAR |her|) |c_ans|) . #12#)))
                   (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |rr1| (SPADCALL |denfp| |rr1| (QREFELT $ 241)) . #12#)
              (LETT |nscoeffs| (NREVERSE |nscoeffs|) . #12#)
              (LETT |c_ans| (NREVERSE |c_ans|) . #12#)
              (LETT |neg_deg|
                    (COND
                     ((SPADCALL |k| '|exp| (QREFELT $ 38))
                      (|RDEEFX;exp_lower_bound| |nfp| |denfp| |rr1| |nscoeffs|
                       |f| |g| |k| |x| |lim| $))
                     ('T 0))
                    . #12#)
              (LETT |nfp1| |nfp| . #12#)
              (LETT |inv_den1| (|spadConstant| $ 35) . #12#)
              (LETT |inv_den| (|spadConstant| $ 124) . #12#)
              (LETT |pscoeffs| NIL . #12#)
              (COND
               ((SPADCALL |neg_deg| 0 (QREFELT $ 106))
                (SEQ
                 (LETT |mm|
                       (SPADCALL (|spadConstant| $ 35)
                                 (PROG1 (LETT #10# |neg_deg| . #12#)
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                 (QREFELT $ 63))
                       . #12#)
                 (LETT |nscoeffs|
                       (PROGN
                        (LETT #9# NIL . #12#)
                        (SEQ (LETT |nscoeff| NIL . #12#)
                             (LETT #8# |nscoeffs| . #12#) G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN
                                    (LETT |nscoeff| (CAR #8#) . #12#)
                                    NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #9#
                                     (CONS
                                      (SPADCALL |mm| |nscoeff| (QREFELT $ 241))
                                      #9#)
                                     . #12#)))
                             (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #12#)
                 (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 241)) . #12#)
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 242)) 1
                                 (QREFELT $ 243))
                       . #12#)
                 (LETT |nfp1|
                       (SPADCALL |nfp|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |neg_deg| (QREFELT $ 28))
                                    (SPADCALL |ak| |x| (QREFELT $ 43))
                                    (QREFELT $ 29))
                                   (QREFELT $ 21))
                                  |denfp| (QREFELT $ 71))
                                 (QREFELT $ 198))
                       . #12#)
                 (LETT |inv_den|
                       (SPADCALL (|spadConstant| $ 124)
                                 (SPADCALL |mm| (QREFELT $ 99))
                                 (QREFELT $ 244))
                       . #12#)
                 (EXIT
                  (LETT |inv_den1| (SPADCALL |inv_den| |k| (QREFELT $ 101))
                        . #12#)))))
              (LETT |pscoeffs|
                    (PROGN
                     (LETT #7# NIL . #12#)
                     (SEQ (LETT |nscoeff| NIL . #12#)
                          (LETT #6# |nscoeffs| . #12#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |nscoeff| (CAR #6#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |nscoeff| (QREFELT $ 245))
                                        #7#)
                                  . #12#)))
                          (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #12#)
              (LETT |specp1| (SPADCALL |rr1| (QREFELT $ 245)) . #12#)
              (LETT |lc| (CONS |specp1| |pscoeffs|) . #12#)
              (LETT |max_deg|
                    (|RDEEFX;exp_upper_bound| |nfp1| |denfp| |lc| |f| |g| |k|
                     |x| |lim| $)
                    . #12#)
              (LETT |rsols|
                    (SPADCALL |denfp| |nfp1| |lc| |max_deg| |deriv|
                              (QREFELT $ 250))
                    . #12#)
              (LETT |vs| (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                    . #12#)
              (LETT |as| (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                    . #12#)
              (SEQ (LETT |i| 1 . #12#) (LETT #4# (QVSIZE |vs|) . #12#)
                   (LETT |c_an| NIL . #12#) (LETT #3# |c_ans| . #12#)
                   (LETT |rsol| NIL . #12#) (LETT #2# (CDR |rsols|) . #12#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rsol| (CAR #2#) . #12#) NIL)
                         (ATOM #3#) (PROGN (LETT |c_an| (CAR #3#) . #12#) NIL)
                         (|greater_SI| |i| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |ac1|
                          (SPADCALL |c_an|
                                    (SPADCALL |inv_den|
                                              (SPADCALL (QCAR |rsol|)
                                                        (QREFELT $ 99))
                                              (QREFELT $ 251))
                                    (QREFELT $ 252))
                          . #12#)
                    (SPADCALL |as| |i| (SPADCALL |ac1| |k| (QREFELT $ 101))
                              (QREFELT $ 253))
                    (EXIT
                     (SPADCALL |vs| |i|
                               (SPADCALL
                                (SPADCALL (QCDR |rsol|) (QREFELT $ 99)) |k|
                                (QREFELT $ 101))
                               (QREFELT $ 253))))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #3#
                                 (PROG1 (CDR #3#)
                                   (LETT |i| (|inc_SI| |i|) . #12#))
                                 . #12#))
                         . #12#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |rr1f|
                    (SPADCALL
                     (SPADCALL (QCDR (|SPADfirst| |rsols|)) (QREFELT $ 99)) |k|
                     (QREFELT $ 101))
                    . #12#)
              (LETT |a1p|
                    (SPADCALL |inv_den1|
                              (SPADCALL
                               (SPADCALL (QCAR (|SPADfirst| |rsols|))
                                         (QREFELT $ 99))
                               |k| (QREFELT $ 101))
                              (QREFELT $ 29))
                    . #12#)
              (EXIT
               (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs| |as|
                |scands| |denf| |gexp| |k| |x| $))))) 

(SDEFUN |RDEEFX;do_spde1|
        ((|rr1| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R))
         (|der| |Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
          (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |defect| (|Expression| R)) (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|def_f| #1=(|Expression| R)) (|af| #1#)
          (|r2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|a1| #2=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|res1| (|Record| (|:| |ans| #2#) (|:| |nosol| (|Boolean|))))
          (|maxd| (|Integer|))
          (|spec1p| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|spec1u|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed")))
         (SEQ
          (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 255))
                . #3=(|RDEEFX;do_spde1|))
          (EXIT
           (COND ((QEQCAR |spec1u| 1) (|error| "impossible 7"))
                 (#4='T
                  (SEQ (LETT |spec1p| (QCDR |spec1u|) . #3#)
                       (LETT |maxd|
                             (- (SPADCALL |spec1p| (QREFELT $ 59))
                                (SPADCALL |nfp| (QREFELT $ 59)))
                             . #3#)
                       (LETT |res1|
                             (SPADCALL |nfp| |spec1p| |maxd| |der|
                                       (QREFELT $ 258))
                             . #3#)
                       (LETT |a1| (QCAR |res1|) . #3#)
                       (LETT |r2|
                             (SPADCALL (SPADCALL |a1| |der|)
                                       (SPADCALL |nfp| |a1| (QREFELT $ 71))
                                       (QREFELT $ 64))
                             . #3#)
                       (LETT |af|
                             (SPADCALL (SPADCALL |a1| (QREFELT $ 99)) |k|
                                       (QREFELT $ 101))
                             . #3#)
                       (LETT |def_f|
                             (SPADCALL
                              (SPADCALL |rr1| (SPADCALL |r2| (QREFELT $ 99))
                                        (QREFELT $ 259))
                              |k| (QREFELT $ 101))
                             . #3#)
                       (EXIT
                        (VECTOR |af| |def_f|
                                (COND ((QCDR |res1|) 'NIL) (#4# 'T))))))))))) 

(SDEFUN |RDEEFX;special_integrate1|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| (|Expression| R)))
         (|f| |Expression| R) (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|a1| |Expression| R) (|r1| |Expression| R) (|g| |Expression| R)
         (|ansp| |Expression| R)
         (|scoeffs| |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         (|gexp| |Integer|)
         (|derivation| |Mapping|
          (|SparseUnivariatePolynomial| (|Expression| R))
          (|SparseUnivariatePolynomial| (|Expression| R)))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|res2|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |defect| (|Expression| R)) (|:| |sol?| (|Boolean|))))
          (#2=#:G650 NIL) (|scoeff| NIL) (#3=#:G651 NIL) (|i| NIL)
          (|as| #4=(|Vector| (|Expression| R))) (|vs| #4#)
          (|rr1f| (|Expression| R)) (|a1p| (|Expression| R))
          (|inv_den1| (|Expression| R)) (|nfp1| #1#) (|ak| (|Expression| R))
          (#5=#:G649 NIL) (#6=#:G648 NIL)
          (|mm| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#7=#:G637 NIL) (|neg_deg| (|Integer|)))
         (SEQ
          (LETT |neg_deg|
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 38))
                  (|RDEEFX;exp_lower_bound| |nfp| (|spadConstant| $ 54) |rr1|
                   |scoeffs| |f| |g| |k| |x| |lim| $))
                 (#8='T 0))
                . #9=(|RDEEFX;special_integrate1|))
          (LETT |nfp1| |nfp| . #9#)
          (LETT |inv_den1| (|spadConstant| $ 35) . #9#)
          (COND
           ((SPADCALL |neg_deg| 0 (QREFELT $ 106))
            (SEQ
             (LETT |mm|
                   (SPADCALL (|spadConstant| $ 35)
                             (PROG1 (LETT #7# |neg_deg| . #9#)
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#))
                             (QREFELT $ 63))
                   . #9#)
             (LETT |scoeffs|
                   (PROGN
                    (LETT #6# NIL . #9#)
                    (SEQ (LETT |scoeff| NIL . #9#) (LETT #5# |scoeffs| . #9#)
                         G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |scoeff| (CAR #5#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS (SPADCALL |mm| |scoeff| (QREFELT $ 241))
                                       #6#)
                                 . #9#)))
                         (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #9#)
             (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 241)) . #9#)
             (LETT |ak|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 242)) 1 (QREFELT $ 243))
                   . #9#)
             (LETT |nfp1|
                   (SPADCALL |nfp|
                             (SPADCALL
                              (SPADCALL (SPADCALL |neg_deg| (QREFELT $ 28))
                                        (SPADCALL |ak| |x| (QREFELT $ 43))
                                        (QREFELT $ 29))
                              (QREFELT $ 21))
                             (QREFELT $ 198))
                   . #9#)
             (EXIT
              (LETT |inv_den1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 124)
                               (SPADCALL |mm| (QREFELT $ 99)) (QREFELT $ 244))
                     |k| (QREFELT $ 101))
                    . #9#)))))
          (LETT |res2| (|RDEEFX;do_spde1| |rr1| |nfp1| |k| |derivation| $)
                . #9#)
          (LETT |a1p| (SPADCALL |inv_den1| (QVELT |res2| 0) (QREFELT $ 29))
                . #9#)
          (EXIT
           (COND
            ((QVELT |res2| 2)
             (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 26)) |g| |ansp| 'T))
            (#8#
             (SEQ (LETT |rr1f| (QVELT |res2| 1) . #9#)
                  (LETT |vs|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                        . #9#)
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                        . #9#)
                  (SEQ (LETT |i| 1 . #9#) (LETT #3# (LENGTH |scoeffs|) . #9#)
                       (LETT |scoeff| NIL . #9#) (LETT #2# |scoeffs| . #9#)
                       G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |scoeff| (CAR #2#) . #9#) NIL)
                             (|greater_SI| |i| #3#))
                         (GO G191)))
                       (SEQ
                        (LETT |res2|
                              (|RDEEFX;do_spde1| |scoeff| |nfp1| |k|
                               |derivation| $)
                              . #9#)
                        (SPADCALL |as| |i|
                                  (SPADCALL |inv_den1| (QVELT |res2| 0)
                                            (QREFELT $ 29))
                                  (QREFELT $ 253))
                        (EXIT
                         (SPADCALL |vs| |i| (QVELT |res2| 1) (QREFELT $ 253))))
                       (LETT #2#
                             (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res3|
                        (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs|
                         |as| |scands| (|spadConstant| $ 54) |gexp| |k| |x| $)
                        . #9#)
                  (COND
                   ((NULL (QVELT |res3| 3))
                    (EXIT
                     (COND
                      ((SPADCALL |neg_deg| 0 (QREFELT $ 106))
                       (VECTOR |a1| |r1| |ansp| 'NIL))
                      (#8#
                       (VECTOR (SPADCALL |a1| |a1p| (QREFELT $ 26))
                               (SPADCALL |g| |rr1f| (QREFELT $ 34)) |ansp|
                               'NIL))))))
                  (EXIT
                   (VECTOR (SPADCALL |a1| (QVELT |res3| 0) (QREFELT $ 26)) |g|
                           (SPADCALL |ansp| (QVELT |res3| 2) (QREFELT $ 26))
                           'T))))))))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|a1| |Expression| R) (|g| |Expression| R) (|ansp| |Expression| R)
         (|derivation| |Mapping|
          (|SparseUnivariatePolynomial| (|Expression| R))
          (|SparseUnivariatePolynomial| (|Expression| R)))
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|f| (|Expression| R))
          (|scoeffs|
           (|List|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|derivation3|
           (|Mapping|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|cands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |coeff| (|Expression| R))
                      (|:| |ratpart| (|Integer|))
                      (|:| |v_part| (|Expression| R))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |new_f|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |radicand|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |u_part| (|Expression| R))
                      (|:| |exponent| (|Integer|))
                      (|:| |shift_part| (|Expression| R)))))
          (|nn| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|ri| (|Integer|)) (|rcu| (|Union| (|Integer|) #1="failed"))
          (#2=#:G750 NIL) (|sol0| (|Vector| (|Fraction| (|Integer|))))
          (#3=#:G723 NIL)
          (|sol_rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) #4="failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|vecf| (|Vector| (|Expression| R))) (#5=#:G762 NIL) (|v| NIL)
          (#6=#:G761 NIL) (|lv| (|List| (|Expression| R)))
          (|c2| #7=(|Expression| R)) (|c1| #7#) (|c0| #8=(|Expression| R))
          (|r4| (|Expression| R)) (|ulst1| (|List| (|Expression| R)))
          (|vlst1| (|List| (|Expression| R))) (#9=#:G759 NIL) (#10=#:G760 NIL)
          (|u| NIL) (|phi| (|Expression| R)) (|piv| #8#)
          (|kf| (|Expression| R)) (|unG| (R)) (G #7#)
          (|G_num|
           #11=(|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
          (|G_den| #11#)
          (|fl2|
           (|List|
            #12=(|SparseMultivariatePolynomial| R
                                                (|Kernel| (|Expression| R)))))
          (#13=#:G675 NIL) (#14=#:G758 NIL) (|fac| NIL) (#15=#:G757 NIL)
          (|fl1| (|List| #12#)) (#16=#:G673 NIL) (#17=#:G756 NIL)
          (#18=#:G755 NIL)
          (|uv0|
           (|Record| (|:| |u_part| (|Expression| R))
                     (|:| |v_part| (|Expression| R))
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu0|
           (|Union|
            (|Record| (|:| |u_part| (|Expression| R))
                      (|:| |v_part| (|Expression| R))
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|l_pifp| #7#) (|pif| (|Expression| R))
          (|pip|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
          (#19=#:G754 NIL) (#20=#:G753 NIL) (#21=#:G752 NIL) (#22=#:G751 NIL)
          (|f_numr|
           #23=(|Factored|
                (|SparseMultivariatePolynomial| R
                                                (|Kernel| (|Expression| R)))))
          (|f_denr| #23#) (|t| #24=(|Expression| R)) (|s| #24#)
          (|r| (|Expression| R)) (|r1| #8#)
          (|spec1p| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|res2|
           (|Record|
            (|:| |ans| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |nosol| (|Boolean|))))
          (|maxd| (|Integer|))
          (|spec1u|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) #1#)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 255))
                  . #25=(|RDEEFX;quadratic_log_erf_integrate|))
            (EXIT
             (COND ((QEQCAR |spec1u| 1) (|error| "impossible 10"))
                   (#26='T
                    (SEQ (LETT |spec1p| (QCDR |spec1u|) . #25#)
                         (LETT |maxd|
                               (- (SPADCALL |spec1p| (QREFELT $ 59))
                                  (SPADCALL |nfp| (QREFELT $ 59)))
                               . #25#)
                         (LETT |res2|
                               (SPADCALL |nfp| |spec1p| |maxd| |derivation|
                                         (QREFELT $ 258))
                               . #25#)
                         (LETT |a1|
                               (SPADCALL |a1|
                                         (SPADCALL
                                          (SPADCALL (QCAR |res2|)
                                                    (QREFELT $ 99))
                                          |k| (QREFELT $ 101))
                                         (QREFELT $ 26))
                               . #25#)
                         (COND
                          ((NULL (QCDR |res2|))
                           (EXIT
                            (PROGN
                             (LETT #2# (VECTOR |a1| |g| |ansp| 'T) . #25#)
                             (GO #27=#:G749)))))
                         (LETT |spec1p|
                               (SPADCALL
                                (SPADCALL |spec1p|
                                          (SPADCALL (QCAR |res2|) |derivation|)
                                          (QREFELT $ 198))
                                (SPADCALL |nfp| (QCAR |res2|) (QREFELT $ 71))
                                (QREFELT $ 198))
                               . #25#)
                         (EXIT
                          (COND
                           ((>= (SPADCALL |spec1p| (QREFELT $ 59))
                                (SPADCALL |nfp| (QREFELT $ 59)))
                            (|error| "impossible 8"))
                           (#26#
                            (SEQ
                             (LETT |r1|
                                   (SPADCALL |g|
                                             (SPADCALL
                                              (SPADCALL |spec1p|
                                                        (QREFELT $ 99))
                                              |k| (QREFELT $ 101))
                                             (QREFELT $ 34))
                                   . #25#)
                             (LETT |r| (SPADCALL |nf| (QREFELT $ 77)) . #25#)
                             (LETT |s| (SPADCALL |nf| 1 (QREFELT $ 60)) . #25#)
                             (LETT |t| (SPADCALL |nf| 0 (QREFELT $ 60)) . #25#)
                             (LETT |f_denr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 260))
                                             (QREFELT $ 105))
                                   . #25#)
                             (LETT |f_numr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 102))
                                             (QREFELT $ 105))
                                   . #25#)
                             (LETT |fl1|
                                   (PROGN
                                    (LETT #22# NIL . #25#)
                                    (SEQ (LETT |fac| NIL . #25#)
                                         (LETT #21#
                                               (SPADCALL |f_denr|
                                                         (QREFELT $ 109))
                                               . #25#)
                                         G190
                                         (COND
                                          ((OR (ATOM #21#)
                                               (PROGN
                                                (LETT |fac| (CAR #21#) . #25#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #22#
                                                   (CONS (QCAR |fac|) #22#)
                                                   . #25#)))))
                                         (LETT #21# (CDR #21#) . #25#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #22#))))
                                   . #25#)
                             (LETT |fl2|
                                   (PROGN
                                    (LETT #20# NIL . #25#)
                                    (SEQ (LETT |fac| NIL . #25#)
                                         (LETT #19#
                                               (SPADCALL |f_numr|
                                                         (QREFELT $ 109))
                                               . #25#)
                                         G190
                                         (COND
                                          ((OR (ATOM #19#)
                                               (PROGN
                                                (LETT |fac| (CAR #19#) . #25#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #20#
                                                   (CONS (QCAR |fac|) #20#)
                                                   . #25#)))))
                                         (LETT #19# (CDR #19#) . #25#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #20#))))
                                   . #25#)
                             (LETT |pip|
                                   (SPADCALL
                                    (SPADCALL (ELT $ 261) |fl1|
                                              (|spadConstant| $ 113)
                                              (QREFELT $ 264))
                                    (SPADCALL (ELT $ 261) |fl2|
                                              (|spadConstant| $ 113)
                                              (QREFELT $ 264))
                                    (QREFELT $ 261))
                                   . #25#)
                             (LETT |pif| (SPADCALL |pip| (QREFELT $ 15))
                                   . #25#)
                             (LETT |l_pifp|
                                   (SPADCALL
                                    (SPADCALL |pif| |x| (QREFELT $ 43)) |pif|
                                    (QREFELT $ 61))
                                   . #25#)
                             (LETT |uvu0|
                                   (|RDEEFX;get_uv| |l_pifp| |vlst| |ulst| |k|
                                    |x| $)
                                   . #25#)
                             (EXIT
                              (COND
                               ((QEQCAR |uvu0| 1)
                                (VECTOR |a1| |r1| |ansp| 'NIL))
                               (#26#
                                (SEQ (LETT |uv0| (QCDR |uvu0|) . #25#)
                                     (LETT |fl1|
                                           (PROGN
                                            (LETT #18# NIL . #25#)
                                            (SEQ (LETT |fac| NIL . #25#)
                                                 (LETT #17#
                                                       (SPADCALL |f_denr|
                                                                 (QREFELT $
                                                                          109))
                                                       . #25#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #17#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #17#)
                                                              . #25#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #18#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #16#
                                                                     (QUOTIENT2
                                                                      (-
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #25#)
                                                             (|check_subtype2|
                                                              (>= #16# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #16#))
                                                           (QREFELT $ 266))
                                                          #18#)
                                                         . #25#)))
                                                 (LETT #17# (CDR #17#) . #25#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #18#))))
                                           . #25#)
                                     (LETT |fl2|
                                           (PROGN
                                            (LETT #15# NIL . #25#)
                                            (SEQ (LETT |fac| NIL . #25#)
                                                 (LETT #14#
                                                       (SPADCALL |f_numr|
                                                                 (QREFELT $
                                                                          109))
                                                       . #25#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #14#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #14#)
                                                              . #25#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #15#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #13#
                                                                     (QUOTIENT2
                                                                      (+
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #25#)
                                                             (|check_subtype2|
                                                              (>= #13# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #13#))
                                                           (QREFELT $ 266))
                                                          #15#)
                                                         . #25#)))
                                                 (LETT #14# (CDR #14#) . #25#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #15#))))
                                           . #25#)
                                     (LETT |G_den|
                                           (SPADCALL (ELT $ 261) |fl1|
                                                     (|spadConstant| $ 113)
                                                     (QREFELT $ 264))
                                           . #25#)
                                     (LETT |G_num|
                                           (SPADCALL (ELT $ 261) |fl2|
                                                     (|spadConstant| $ 113)
                                                     (QREFELT $ 264))
                                           . #25#)
                                     (LETT G
                                           (SPADCALL
                                            (SPADCALL |G_den| (QREFELT $ 15))
                                            (SPADCALL |G_num| (QREFELT $ 15))
                                            (QREFELT $ 61))
                                           . #25#)
                                     (LETT |unG|
                                           (SPADCALL
                                            (SPADCALL |f_numr| (QREFELT $ 267))
                                            (QREFELT $ 268))
                                           . #25#)
                                     (LETT |kf| (SPADCALL |k| (QREFELT $ 40))
                                           . #25#)
                                     (LETT |phi|
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |r| |x| (QREFELT $ 43))
                                              (|spadConstant| $ 30)
                                              (QREFELT $ 110))
                                             (SEQ
                                              (LETT |piv|
                                                    (SPADCALL
                                                     (SPADCALL G |x|
                                                               (QREFELT $ 43))
                                                     (SPADCALL
                                                      (SPADCALL G |l_pifp|
                                                                (QREFELT $ 29))
                                                      (SPADCALL 2
                                                                (QREFELT $ 28))
                                                      (QREFELT $ 61))
                                                     (QREFELT $ 34))
                                                    . #25#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 1
                                                          (QREFELT $ 60))
                                                |piv| (QREFELT $ 61)))))
                                            (#26#
                                             (SEQ
                                              (LETT |piv|
                                                    (SPADCALL
                                                     (SPADCALL G
                                                               (SPADCALL |kf|
                                                                         |x|
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                               (QREFELT $ 29))
                                                     (SPADCALL
                                                      (SPADCALL |unG|
                                                                (SPADCALL |s|
                                                                          |x|
                                                                          (QREFELT
                                                                           $
                                                                           43))
                                                                (QREFELT $
                                                                         269))
                                                      (SPADCALL
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          28))
                                                       G (QREFELT $ 29))
                                                      (QREFELT $ 61))
                                                     (QREFELT $ 26))
                                                    . #25#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 0
                                                          (QREFELT $ 60))
                                                |piv| (QREFELT $ 61))))))
                                           . #25#)
                                     (LETT |vlst1| NIL . #25#)
                                     (LETT |ulst1| NIL . #25#)
                                     (SEQ (LETT |u| NIL . #25#)
                                          (LETT #10# |ulst| . #25#)
                                          (LETT |v| NIL . #25#)
                                          (LETT #9# |vlst| . #25#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |v| (CAR #9#) . #25#)
                                                 NIL)
                                                (ATOM #10#)
                                                (PROGN
                                                 (LETT |u| (CAR #10#) . #25#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |v| |kf|
                                                        (QREFELT $ 110))
                                              (SEQ
                                               (LETT |vlst1| (CONS |v| |vlst1|)
                                                     . #25#)
                                               (EXIT
                                                (LETT |ulst1|
                                                      (CONS |u| |ulst1|)
                                                      . #25#)))))))
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT #10# (CDR #10#)
                                                        . #25#))
                                                . #25#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |r4|
                                           (SPADCALL
                                            (SPADCALL 4 (QREFELT $ 28)) |r|
                                            (QREFELT $ 29))
                                           . #25#)
                                     (LETT |c0|
                                           (SPADCALL |t|
                                                     (SPADCALL
                                                      (SPADCALL |s| 2
                                                                (QREFELT $
                                                                         270))
                                                      |r4| (QREFELT $ 61))
                                                     (QREFELT $ 34))
                                           . #25#)
                                     (LETT |c1|
                                           (SPADCALL |s| |r4| (QREFELT $ 61))
                                           . #25#)
                                     (LETT |c2|
                                           (SPADCALL (|spadConstant| $ 35) |r4|
                                                     (QREFELT $ 61))
                                           . #25#)
                                     (LETT |lv|
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |r| |x| (QREFELT $ 43))
                                              (|spadConstant| $ 30)
                                              (QREFELT $ 110))
                                             (SPADCALL (LIST |c1| |c2|) |vlst1|
                                                       (QREFELT $ 271)))
                                            (#26# (CONS |c1| |vlst1|)))
                                           . #25#)
                                     (LETT |vecf|
                                           (SPADCALL
                                            (PROGN
                                             (LETT #6# NIL . #25#)
                                             (SEQ (LETT |v| NIL . #25#)
                                                  (LETT #5# |lv| . #25#) G190
                                                  (COND
                                                   ((OR (ATOM #5#)
                                                        (PROGN
                                                         (LETT |v| (CAR #5#)
                                                               . #25#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #6#
                                                          (CONS
                                                           (SPADCALL |v| |x|
                                                                     (QREFELT $
                                                                              43))
                                                           #6#)
                                                          . #25#)))
                                                  (LETT #5# (CDR #5#) . #25#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #6#))))
                                            (QREFELT $ 45))
                                           . #25#)
                                     (LETT |sol_rec|
                                           (SPADCALL |vecf|
                                                     (SPADCALL |c0| |x|
                                                               (QREFELT $ 43))
                                                     (QREFELT $ 116))
                                           . #25#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR (QCAR |sol_rec|) 1)
                                        (VECTOR |a1| |r1| |ansp| 'NIL))
                                       (#26#
                                        (SEQ
                                         (LETT |sol0|
                                               (PROG2
                                                   (LETT #3# (QCAR |sol_rec|)
                                                         . #25#)
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|Vector|
                                                                  (|Fraction|
                                                                   (|Integer|)))
                                                                 (|Union|
                                                                  (|Vector|
                                                                   (|Fraction|
                                                                    (|Integer|)))
                                                                  #4#)
                                                                 #3#))
                                               . #25#)
                                         (EXIT
                                          (COND
                                           ((NULL (QCDR |sol_rec|))
                                            (SEQ
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |r| |x|
                                                          (QREFELT $ 43))
                                                (|spadConstant| $ 30)
                                                (QREFELT $ 110))
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |sol0| 1
                                                             (QREFELT $ 272))
                                                   2 (QREFELT $ 273))
                                                  (SPADCALL |sol0| 2
                                                            (QREFELT $ 272))
                                                  (QREFELT $ 274))
                                                 (PROGN
                                                  (LETT #2#
                                                        (VECTOR |a1| |r1|
                                                                |ansp| 'NIL)
                                                        . #25#)
                                                  (GO #27#))))))
                                             (LETT |rcu|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |sol0| 1
                                                               (QREFELT $ 272))
                                                     (SPADCALL 2
                                                               (QREFELT $ 118))
                                                     (QREFELT $ 275))
                                                    (QREFELT $ 196))
                                                   . #25#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |rcu| 1)
                                                (VECTOR |a1| |r1| |ansp| 'NIL))
                                               (#26#
                                                (SEQ
                                                 (LETT |ri| (QCDR |rcu|)
                                                       . #25#)
                                                 (LETT |nn|
                                                       (SPADCALL |nf|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |ri|
                                                                   (QREFELT $
                                                                            28))
                                                                  1
                                                                  (QREFELT $
                                                                           63))
                                                                 (QREFELT $
                                                                          64))
                                                       . #25#)
                                                 (LETT |cands|
                                                       (|RDEEFX;gammas1| |nn|
                                                        (QCDR |rcu|)
                                                        (|spadConstant| $ 54)
                                                        (|spadConstant| $ 54) 0
                                                        1 |vlst| |ulst| |k| |x|
                                                        NIL $)
                                                       . #25#)
                                                 (LETT |derivation3|
                                                       (CONS
                                                        #'|RDEEFX;quadratic_log_erf_integrate!0|
                                                        (VECTOR |derivation|
                                                                $))
                                                       . #25#)
                                                 (LETT |scoeffs|
                                                       (|RDEEFX;get_scoeffs|
                                                        |cands|
                                                        (|spadConstant| $ 54)
                                                        |k| |derivation3| $)
                                                       . #25#)
                                                 (LETT |rr1|
                                                       (SPADCALL |spec1p|
                                                                 (QREFELT $
                                                                          99))
                                                       . #25#)
                                                 (LETT |f|
                                                       (SPADCALL
                                                        (SPADCALL |nf|
                                                                  (QREFELT $
                                                                           99))
                                                        |k| (QREFELT $ 101))
                                                       . #25#)
                                                 (EXIT
                                                  (|RDEEFX;special_integrate1|
                                                   |nfp| |f| |k| |x| |rr1| |a1|
                                                   |r1| |g| |ansp| |scoeffs|
                                                   |cands| 0 |derivation| |lim|
                                                   $))))))))
                                           ((SPADCALL
                                             (SPADCALL |r| |x| (QREFELT $ 43))
                                             (|spadConstant| $ 30)
                                             (QREFELT $ 41))
                                            (COND
                                             ((SPADCALL
                                               (LENGTH (QCDR |sol_rec|)) 1
                                               (QREFELT $ 72))
                                              (|error| "impossible 11"))
                                             (#26#
                                              (VECTOR |a1| |r1| |ansp| 'NIL))))
                                           ((OR
                                             (EQL (LENGTH (QCDR |sol_rec|)) 1)
                                             #26#)
                                            (VECTOR |a1| |r1| |ansp|
                                                    'NIL))))))))))))))))))))))
          #27# (EXIT #2#)))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;quadratic_log_erf_integrate|))
          (LETT |derivation| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 128)) |derivation|)
                        (SPADCALL |z1| (QREFELT $ 224)) (QREFELT $ 71))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 128))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 224)) |derivation|)
                        (QREFELT $ 71))
              (QREFELT $ 198))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 224))
                       (SPADCALL |z1| (QREFELT $ 224)) (QREFELT $ 71))
             (QREFELT $ 204)))))) 

(SDEFUN |RDEEFX;decompose1|
        ((|num| |SparseUnivariatePolynomial| (|Expression| R))
         (|den| |SparseUnivariatePolynomial| (|Expression| R))
         (|eidens| |List| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |List| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G766 NIL))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT $ 71) |eidens|
                                              (QREFELT $ 276))
                                    (QREFELT $ 81))
                          . #2=(|RDEEFX;decompose1|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial|
                                   (|Expression| (QREFELT $ 6)))
                                  (|Union|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (QREFELT $ 6)))
                                   "failed")
                                  #1#))
                . #2#)
          (COND
           ((SPADCALL |f1| (|spadConstant| $ 54) (QREFELT $ 82))
            (LETT |eidens| (CONS |f1| |eidens|) . #2#)))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT $ 277)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |f1| (|spadConstant| $ 54) (QREFELT $ 82)) (CDR |res|))
            ('T |res|)))))) 

(SDEFUN |RDEEFX;get_trace|
        ((|fu| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R)) (|rf1k| |Kernel| (|Expression| R))
         (|cfac| |SparseUnivariatePolynomial| (|Expression| R))
         ($ |Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|resd| (|Expression| R))
          (|fa| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|f| (|Expression| R))
          (|Sae|
           (|MonogenicAlgebra| (|Expression| R)
                               (|SparseUnivariatePolynomial|
                                (|Expression| R)))))
         (SEQ
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (|Expression| (QREFELT $ 6))
                                            (|SparseUnivariatePolynomial|
                                             (|Expression| (QREFELT $ 6)))
                                            |cfac|)
                . #1=(|RDEEFX;get_trace|))
          (LETT |f| (SPADCALL |fu| |k| (QREFELT $ 101)) . #1#)
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT $ 278)) . #1#)
          (LETT |resd|
                (SPADCALL
                 (SPADCALL |fa|
                           (|compiledLookupCheck| '|reduce|
                                                  (LIST '$
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST '|Expression|
                                                               (|devaluate|
                                                                (ELT $ 6)))))
                                                  |Sae|))
                 (|compiledLookupCheck| '|trace|
                                        (LIST
                                         (LIST '|Expression|
                                               (|devaluate| (ELT $ 6)))
                                         '$)
                                        |Sae|))
                . #1#)
          (EXIT (SPADCALL |resd| |k| (QREFELT $ 127)))))) 

(SDEFUN |RDEEFX;solve_factor1|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|einum| |SparseUnivariatePolynomial| (|Expression| R))
         (|bpol| |SparseUnivariatePolynomial| (|Expression| R))
         (|er| |Record|
          (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
          (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
          (|:| |shift_part| (|Expression| R)))
         ($ |Record| (|:| |primpart| (|Expression| R))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|poly_cor_rf|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|sp_cor|
           #1=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lp_cor| #1#) (|ansp| #2=(|Expression| R)) (#3=#:G803 NIL)
          (|zz| NIL) (|zzl| (|List| (|Expression| R)))
          (|ansp1| (|Expression| R)) (|c| (|Expression| R))
          (|cu1| (|Union| (|Expression| R) "failed"))
          (|cp| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|cu|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R))
                    #4="failed"))
          (|ppu|
           (|Union|
            (|Record|
             (|:| |coef1| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |coef2| (|SparseUnivariatePolynomial| (|Expression| R))))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|lnum1| #5=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|reml| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lnum0| #5#)
          (|coeff1_rs|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|auxl| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|denf1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#6=#:G778 NIL)
          (|spec_den| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|min_deg| (|NonNegativeInteger|))
          (|dvr|
           (|Record|
            (|:| |quotient| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |remainder| #5#)))
          (|coeff1_r|
           #7=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|coeff1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|numfp1| #8=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|ei_arg| #7#) (|eiarg_num| #8#) (|rf1k| (|Kernel| (|Expression| R)))
          (|rfc| #2#) (|vshift| (|Expression| R)) (|u_exp| (|Integer|))
          (|u0| (|Expression| R))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|v0| (|Expression| R)) (|r0| (|Integer|))
          (|eiden| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ (LETT |eiden| (QVELT |er| 0) . #9=(|RDEEFX;solve_factor1|))
              (LETT |r0| (QVELT |er| 1) . #9#) (LETT |v0| (QVELT |er| 2) . #9#)
              (LETT |cfac| (QVELT |er| 3) . #9#)
              (LETT |u0| (QVELT |er| 4) . #9#)
              (LETT |u_exp| (QVELT |er| 5) . #9#)
              (LETT |vshift| (QVELT |er| 6) . #9#)
              (LETT |rfc| (|spadConstant| $ 30) . #9#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 279)) . #9#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 280)) . #9#)))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |r0| (QREFELT $ 28)) 1
                                           (QREFELT $ 63))
                                 (SPADCALL |v0| (QREFELT $ 21)) (QREFELT $ 64))
                                (SPADCALL |rfc| (QREFELT $ 21)) (QREFELT $ 64))
                               |denf| (QREFELT $ 71))
                              (QREFELT $ 64))
                    . #9#)
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 99))
                              (SPADCALL |denf| (QREFELT $ 99)) (QREFELT $ 244))
                    . #9#)
              (LETT |numfp1|
                    (SPADCALL |nfp|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |v0|
                                          (SPADCALL
                                           (SPADCALL |r0| (QREFELT $ 28))
                                           (SPADCALL |k| (QREFELT $ 40))
                                           (QREFELT $ 29))
                                          (QREFELT $ 26))
                                |x| (QREFELT $ 43))
                               |denfp| (QREFELT $ 114))
                              (QREFELT $ 64))
                    . #9#)
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 71)) |u0|
                              (QREFELT $ 281))
                    . #9#)
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 63))
                        (QREFELT $ 99))
                       |u_exp| (QREFELT $ 282))
                      (SPADCALL |coeff1| (QREFELT $ 99)) (QREFELT $ 251))
                     (SPADCALL |eiarg_num| (QREFELT $ 99)) (QREFELT $ 244))
                    . #9#)
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 224)) . #9#)
              (LETT |coeff1_rs| (|spadConstant| $ 205) . #9#)
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 128)) |denf1|
                              (QREFELT $ 284))
                    . #9#)
              (LETT |lnum1| (QCDR |dvr|) . #9#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 38))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT $ 229)) . #9#)
                     (EXIT
                      (COND
                       ((SPADCALL |min_deg| 0 (QREFELT $ 72))
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| $ 35) |min_deg|
                                         (QREFELT $ 63))
                               . #9#)
                         (LETT |denf1|
                               (PROG2
                                   (LETT #6#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT $ 81))
                                         . #9#)
                                   (QCDR #6#)
                                 (|check_union2| (QEQCAR #6# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (|Expression| (QREFELT $ 6)))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (|Expression|
                                                    (QREFELT $ 6)))
                                                  #4#)
                                                 #6#))
                               . #9#)
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT $ 277))
                               . #9#)
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT $ 285))
                               . #9#)
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT $ 285))
                                           (QREFELT $ 99))
                                 (SPADCALL |spec_den| (QREFELT $ 99))
                                 (QREFELT $ 244))
                                . #9#)))))))))
              (LETT |lnum0| |lnum1| . #9#)
              (COND
               ((SPADCALL |bpol| |eiden| (QREFELT $ 82))
                (SEQ
                 (LETT |reml|
                       (|RDEEFX;decompose1| |lnum1| |denf1| (LIST |bpol|) $)
                       . #9#)
                 (EXIT (LETT |lnum1| (|SPADfirst| |reml|) . #9#)))))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                (SEQ
                 (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 195))
                       . #9#)
                 (LETT |ddf|
                       (SPADCALL (SPADCALL |eiden| (QREFELT $ 197)) |denf1|
                                 (QREFELT $ 195))
                       . #9#)
                 (LETT |ppu| (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 288))
                       . #9#)
                 (EXIT
                  (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                        (#10='T
                         (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #9#)
                              (EXIT
                               (LETT |einum|
                                     (SPADCALL
                                      (SPADCALL |einum|
                                                (SPADCALL |denf1|
                                                          (QREFELT $ 197))
                                                (QREFELT $ 71))
                                      |denf1| (QREFELT $ 195))
                                     . #9#)))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT $ 81)) . #9#)
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                         (|spadConstant| $ 70) (|spadConstant| $ 205)))
                (#10#
                 (SEQ (LETT |cp| (QCDR |cu|) . #9#)
                      (LETT |cu1| (SPADCALL |cp| (QREFELT $ 289)) . #9#)
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                                 (|spadConstant| $ 70) (|spadConstant| $ 205)))
                        (#10#
                         (SEQ (LETT |c| (QCDR |cu1|) . #9#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT $ 290))
                                           (|spadConstant| $ 30)
                                           (QREFELT $ 110))
                                 (VECTOR (|spadConstant| $ 30)
                                         (|spadConstant| $ 205)
                                         (|spadConstant| $ 70)
                                         (|spadConstant| $ 205)))
                                (#10#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT $ 62))
                                                     |rfc| (QREFELT $ 34))
                                                    (QREFELT $ 291))
                                                   (QREFELT $ 29))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT $ 101))
                                          (QREFELT $ 292))
                                         (QREFELT $ 29))
                                        . #9#)
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| $ 70)
                                                    (QREFELT $ 84))
                                          (LIST (|spadConstant| $ 30)))
                                         (#10#
                                          (SPADCALL |cfac| (QREFELT $ 293))))
                                        . #9#)
                                  (LETT |ansp| (|spadConstant| $ 30) . #9#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 70)
                                              (QREFELT $ 84))
                                    (LETT |ansp| |ansp1| . #9#))
                                   (#10#
                                    (SEQ (LETT |zz| NIL . #9#)
                                         (LETT #3# |zzl| . #9#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |zz| (CAR #3#) . #9#)
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
                                                                              294))
                                                           (QREFELT $ 26))
                                                 . #9#)))
                                         (LETT #3# (CDR #3#) . #9#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT $ 99))
                                                   (SPADCALL |denf1|
                                                             (QREFELT $ 99))
                                                   (QREFELT $ 244))
                                                  (QREFELT $ 241))
                                        . #9#)
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  |coeff1_rs| (QREFELT $ 241))
                                        . #9#)
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (QCAR |dvr|) (QREFELT $ 71))
                                        . #9#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 70)
                                              (QREFELT $ 82))
                                    (SEQ
                                     (LETT |lp_cor|
                                           (|RDEEFX;get_trace| |lp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #9#)
                                     (LETT |sp_cor|
                                           (|RDEEFX;get_trace| |sp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #9#)
                                     (LETT |poly_cor_rf|
                                           (|RDEEFX;get_trace|
                                            (SPADCALL |poly_cor|
                                                      (QREFELT $ 99))
                                            |k| |rf1k| |cfac| $)
                                           . #9#)
                                     (EXIT
                                      (LETT |poly_cor|
                                            (SPADCALL |poly_cor_rf|
                                                      (QREFELT $ 245))
                                            . #9#)))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| |SparseUnivariatePolynomial| (|Expression| R))
         (|p| |SparseUnivariatePolynomial| (|Expression| R)) ($ |Integer|))
        (SPROG
         ((|nn| (|Integer|)) (#1=#:G812 NIL)
          (|nqu|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed")))
         (SEQ (LETT |nn| 0 . #2=(|RDEEFX;p_power_in_q|))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |nqu| (SPADCALL |q| |p| (QREFELT $ 81)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |nqu| 1)
                             (PROGN
                              (LETT #1# |$NoValue| . #2#)
                              (GO #3=#:G809)))
                            ('T
                             (SEQ (LETT |q| (QCDR |nqu|) . #2#)
                                  (EXIT (LETT |nn| (+ |nn| 1) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
              (EXIT |nn|)))) 

(SDEFUN |RDEEFX;solve_linear_factor|
        ((|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|einum| |SparseUnivariatePolynomial| (|Expression| R))
         (|er| |Record|
          (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
          (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
          (|:| |shift_part| (|Expression| R)) (|:| |has_part2?| (|Boolean|))
          (|:| |ratpart2| (|Integer|)) (|:| |v_part2| (|Expression| R))
          (|:| |u_part2| (|Expression| R))
          (|:| |shift_part2| (|Expression| R)))
         ($ |Record| (|:| |primpart| (|Expression| R))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|dvr2|
           #1=(|Record|
               (|:| |quotient| (|SparseUnivariatePolynomial| (|Expression| R)))
               (|:| |remainder|
                    (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|ansp| #2=(|Expression| R)) (#3=#:G843 NIL) (|zz| NIL)
          (|lp_cor|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|eiargp|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|coefi| #4=(|Expression| R)) (|ansp1| #2#) (|shifti| #4#)
          (|eiargi| (|Expression| R))
          (|eiargi_r|
           #5=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|ci| #6=(|Expression| R)) (|nn| (|Integer|))
          (|einumi| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|ki| (|Integer|)) (|kif| #6#) (#7=#:G842 NIL) (|ck| NIL)
          (|zzl| (|List| (|Expression| R)))
          (|eiarg_inc| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|res1| (|List| (|List| (|Expression| R))))
          (|res1u| (|Union| (|List| (|List| (|Expression| R))) "failed"))
          (|u1| (|Expression| R)) (|einum1| (|Expression| R))
          (|lnum1| (|Expression| R))
          (|reml| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|ppu|
           (|Union|
            (|Record|
             (|:| |coef1| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |coef2| (|SparseUnivariatePolynomial| (|Expression| R))))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| (|Expression| R))) (|dvr| #1#)
          (|denf1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|coeff1_r| #5#)
          (|coeff1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|numfp1| #8=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|nn0| (|Integer|))
          (|fac1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|eiarg_num| #8#) (|lc0| (|Expression| R)) (|u0| (|Expression| R))
          (|v0| (|Expression| R)) (|r0| (|Integer|))
          (|rf1k| (|Kernel| (|Expression| R))) (|rfc| #2#)
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ (LETT |cfac| (QVELT |er| 3) . #9=(|RDEEFX;solve_linear_factor|))
              (LETT |rfc| (|spadConstant| $ 30) . #9#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 279)) . #9#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 280)) . #9#)))))
              (LETT |r0| (QVELT |er| 1) . #9#) (LETT |v0| (QVELT |er| 2) . #9#)
              (LETT |u0| (QVELT |er| 4) . #9#)
              (LETT |lc0|
                    (SPADCALL (SPADCALL |nf| (QREFELT $ 77))
                              (SPADCALL |r0| (QREFELT $ 28)) (QREFELT $ 26))
                    . #9#)
              (COND
               ((OR (SPADCALL (SPADCALL |nf| (QREFELT $ 59)) 1 (QREFELT $ 55))
                    (SPADCALL |denf| (|spadConstant| $ 54) (QREFELT $ 82)))
                (COND
                 ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                  (EXIT (|error| "cfac ~= 0 in nonlinear case"))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |r0| (QREFELT $ 28)) 1
                                          (QREFELT $ 63))
                                (SPADCALL
                                 (SPADCALL |v0|
                                           (SPADCALL |lc0| |rfc|
                                                     (QREFELT $ 29))
                                           (QREFELT $ 26))
                                 (QREFELT $ 21))
                                (QREFELT $ 64))
                               |denf| (QREFELT $ 71))
                              (QREFELT $ 64))
                    . #9#)
              (LETT |fac1| (QVELT |er| 0) . #9#)
              (LETT |nn0|
                    (COND
                     ((SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 59)) 1
                                (QREFELT $ 72))
                      (|RDEEFX;p_power_in_q| |eiarg_num| |fac1| $))
                     (#10='T 1))
                    . #9#)
              (EXIT
               (COND
                ((EQL |nn0| 0)
                 (|error|
                  "impossible, eiarg_num is not divisible by its factor"))
                (#10#
                 (SEQ
                  (LETT |numfp1|
                        (SPADCALL |nfp|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |v0|
                                              (SPADCALL
                                               (SPADCALL |r0| (QREFELT $ 28))
                                               (SPADCALL |k| (QREFELT $ 40))
                                               (QREFELT $ 29))
                                              (QREFELT $ 26))
                                    |x| (QREFELT $ 43))
                                   |denfp| (QREFELT $ 114))
                                  (QREFELT $ 64))
                        . #9#)
                  (LETT |coeff1|
                        (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 71))
                                  |u0| (QREFELT $ 281))
                        . #9#)
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT $ 99))
                                  (SPADCALL |eiarg_num| (QREFELT $ 99))
                                  (QREFELT $ 244))
                        . #9#)
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 224)) . #9#)
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 128)) |denf1|
                                  (QREFELT $ 284))
                        . #9#)
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                    (SEQ
                     (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 195))
                           . #9#)
                     (LETT |ddf|
                           (SPADCALL (SPADCALL (QVELT |er| 0) (QREFELT $ 197))
                                     |denf1| (QREFELT $ 195))
                           . #9#)
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 288))
                           . #9#)
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#10#
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #9#)
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT $ 197))
                                                    (QREFELT $ 71))
                                          |denf1| (QREFELT $ 195))
                                         . #9#)))))))))
                  (LETT |lnum1|
                        (COND
                         ((SPADCALL (SPADCALL |fac1| (QREFELT $ 59)) 1
                                    (QREFELT $ 72))
                          (SPADCALL (QCDR |dvr|) (QREFELT $ 214)))
                         (#10#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) $)
                                 . #9#)
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|) (QREFELT $ 214))))))
                        . #9#)
                  (LETT |einum1| (SPADCALL |einum| (QREFELT $ 214)) . #9#)
                  (LETT |u1| (QVELT |er| 10) . #9#)
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT $ 61))
                                  |u1| |x| (QREFELT $ 296))
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                             (|spadConstant| $ 70) (|spadConstant| $ 205)))
                    (#10#
                     (SEQ (LETT |res1| (QCDR |res1u|) . #9#)
                          (LETT |ansp1| (|spadConstant| $ 30) . #9#)
                          (LETT |lp_cor| (|spadConstant| $ 205) . #9#)
                          (LETT |eiarg_inc|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |er| 8) (QREFELT $ 28)) 1
                                   (QREFELT $ 63))
                                  (SPADCALL (QVELT |er| 9) (QREFELT $ 21))
                                  (QREFELT $ 64))
                                 |denf| (QREFELT $ 71))
                                . #9#)
                          (SETELT $ 202 (SPADCALL (QREFELT $ 57)))
                          (LETT |zzl|
                                (COND
                                 ((SPADCALL |cfac| (|spadConstant| $ 70)
                                            (QREFELT $ 84))
                                  (LIST (|spadConstant| $ 30)))
                                 (#10# (SPADCALL |cfac| (QREFELT $ 293))))
                                . #9#)
                          (SEQ (LETT |ck| NIL . #9#) (LETT #7# |res1| . #9#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |ck| (CAR #7#) . #9#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT $ 243))
                                      . #9#)
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT $ 243))
                                      . #9#)
                                (LETT |ki| (SPADCALL |kif| (QREFELT $ 297))
                                      . #9#)
                                (LETT |einumi|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 70)
                                                  (QREFELT $ 84))
                                        (SPADCALL |eiarg_num|
                                                  (SPADCALL |kif| |eiarg_inc|
                                                            (QREFELT $ 114))
                                                  (QREFELT $ 64)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 26))
                                          |lc0| (QREFELT $ 61))
                                         |eiarg_num| (QREFELT $ 114))))
                                      . #9#)
                                (LETT |nn|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |einumi| (QREFELT $ 59)) 1
                                         (QREFELT $ 72))
                                        (|RDEEFX;p_power_in_q| |einumi| |fac1|
                                         $))
                                       ('T 1))
                                      . #9#)
                                (COND
                                 ((EQL |nn| 0)
                                  (|error|
                                   "impossible, einumi not divisible by its factor")))
                                (LETT |ci|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nn0| (QREFELT $ 28)) |ci|
                                        (QREFELT $ 29))
                                       (SPADCALL |nn| (QREFELT $ 28))
                                       (QREFELT $ 61))
                                      . #9#)
                                (LETT |eiargi_r|
                                      (SPADCALL
                                       (SPADCALL |einumi| (QREFELT $ 99))
                                       (SPADCALL |denf| (QREFELT $ 99))
                                       (QREFELT $ 244))
                                      . #9#)
                                (LETT |eiargi|
                                      (SPADCALL |eiargi_r| |k| (QREFELT $ 101))
                                      . #9#)
                                (LETT |shifti|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 70)
                                                  (QREFELT $ 84))
                                        (SPADCALL (QVELT |er| 6)
                                                  (SPADCALL |kif|
                                                            (QVELT |er| 11)
                                                            (QREFELT $ 29))
                                                  (QREFELT $ 26)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 26))
                                          |lc0| (QREFELT $ 61))
                                         (SPADCALL (QVELT |er| 6)
                                                   (SPADCALL |lc0| |rfc|
                                                             (QREFELT $ 29))
                                                   (QREFELT $ 26))
                                         (QREFELT $ 29))))
                                      . #9#)
                                (LETT |ansp1|
                                      (SPADCALL |ansp1|
                                                (SPADCALL
                                                 (SPADCALL |ci|
                                                           (SPADCALL
                                                            (SPADCALL |shifti|
                                                                      (QREFELT
                                                                       $ 62))
                                                            (QREFELT $ 291))
                                                           (QREFELT $ 29))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT $ 292))
                                                 (QREFELT $ 29))
                                                (QREFELT $ 26))
                                      . #9#)
                                (LETT |coefi|
                                      (SPADCALL
                                       (SPADCALL |ci| |u0| (QREFELT $ 29))
                                       (SPADCALL |u1| |ki| (QREFELT $ 42))
                                       (QREFELT $ 29))
                                      . #9#)
                                (LETT |eiargp|
                                      (SPADCALL |denfp|
                                                (SPADCALL
                                                 (SPADCALL |eiargi| |x|
                                                           (QREFELT $ 43))
                                                 |k| (QREFELT $ 127))
                                                (QREFELT $ 241))
                                      . #9#)
                                (EXIT
                                 (LETT |lp_cor|
                                       (SPADCALL |lp_cor|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |coefi|
                                                              (QREFELT $ 21))
                                                    (QREFELT $ 99))
                                                   |eiargp| (QREFELT $ 251))
                                                  |eiargi_r| (QREFELT $ 244))
                                                 (QREFELT $ 252))
                                       . #9#)))
                               (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |ansp| (|spadConstant| $ 30) . #9#)
                          (COND
                           ((SPADCALL |cfac| (|spadConstant| $ 70)
                                      (QREFELT $ 84))
                            (LETT |ansp| |ansp1| . #9#))
                           (#10#
                            (SEQ
                             (LETT |lp_cor|
                                   (|RDEEFX;get_trace| |lp_cor| |k| |rf1k|
                                    |cfac| $)
                                   . #9#)
                             (EXIT
                              (SEQ (LETT |zz| NIL . #9#) (LETT #3# |zzl| . #9#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |zz| (CAR #3#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ansp|
                                           (SPADCALL |ansp|
                                                     (SPADCALL |ansp1| |rf1k|
                                                               |zz|
                                                               (QREFELT $ 294))
                                                     (QREFELT $ 26))
                                           . #9#)))
                                   (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT $ 128))
                                          (SPADCALL |lp_cor| (QREFELT $ 224))
                                          (QREFELT $ 284))
                                . #9#)
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT $ 99))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT $ 224))
                                     (QREFELT $ 99))
                                    (QREFELT $ 244))
                                   (QCAR |dvr2|)
                                   (|spadConstant| $ 205)))))))))))))) 

(SDEFUN |RDEEFX;linear_log_case|
        ((|num| |SparseUnivariatePolynomial| (|Expression| R))
         (|den| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| (|Expression| R))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|sp_cor|
           #1=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lp_cor| #1#) (|ansp| (|Expression| R))
          (|ar1|
           (|Record| (|:| |primpart| (|Expression| R))
                     (|:| |logpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))
                     (|:| |polypart|
                          (|SparseUnivariatePolynomial| (|Expression| R)))
                     (|:| |specpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (#2=#:G853 NIL) (|einum| NIL) (#3=#:G854 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|eidens| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#4=#:G852 NIL) (#5=#:G851 NIL)
          (|al|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)) (|:| |has_part2?| (|Boolean|))
             (|:| |ratpart2| (|Integer|)) (|:| |v_part2| (|Expression| R))
             (|:| |u_part2| (|Expression| R))
             (|:| |shift_part2| (|Expression| R))))))
         (SEQ
          (LETT |al| (|RDEEFX;lin_args| |den| |nf| |k| |vlst| |ulst| |x| $)
                . #6=(|RDEEFX;linear_log_case|))
          (EXIT
           (COND
            ((NULL |al|)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                     (|spadConstant| $ 70) (|spadConstant| $ 205)))
            ('T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |er| NIL . #6#) (LETT #4# |al| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |er| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #5# (CONS (QVELT |er| 0) #5#) . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $)
                    . #6#)
              (LETT |ansp| (|spadConstant| $ 30) . #6#)
              (LETT |lp_cor| (|spadConstant| $ 205) . #6#)
              (LETT |sp_cor| (|spadConstant| $ 205) . #6#)
              (LETT |poly_cor| (|spadConstant| $ 70) . #6#)
              (SEQ (LETT |er| NIL . #6#) (LETT #3# |al| . #6#)
                   (LETT |einum| NIL . #6#) (LETT #2# |einums| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |einum| (CAR #2#) . #6#) NIL)
                         (ATOM #3#) (PROGN (LETT |er| (CAR #3#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ar1|
                          (COND
                           ((QVELT |er| 7)
                            (|RDEEFX;solve_linear_factor| |nf|
                             (|spadConstant| $ 54) |nfp| (|spadConstant| $ 54)
                             |k| |x| |einum| |er| $))
                           ('T
                            (|RDEEFX;solve_factor1| |nf| (|spadConstant| $ 54)
                             |nfp| (|spadConstant| $ 54) |k| |x| |einum|
                             (QVELT |er| 0)
                             (VECTOR (QVELT |er| 0) (QVELT |er| 1)
                                     (QVELT |er| 2) (QVELT |er| 3)
                                     (QVELT |er| 4) (QVELT |er| 5)
                                     (QVELT |er| 6))
                             $)))
                          . #6#)
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 26))
                          . #6#)
                    (LETT |lp_cor|
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT $ 252))
                          . #6#)
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT $ 252))
                          . #6#)
                    (EXIT
                     (LETT |poly_cor|
                           (SPADCALL |poly_cor| (QVELT |ar1| 2) (QREFELT $ 64))
                           . #6#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))) 

(SDEFUN |RDEEFX;handle_nonlinear_log|
        ((|num| |SparseUnivariatePolynomial| (|Expression| R))
         (|den| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|x| |Symbol|)
         (|vlst| |List| (|Expression| R)) (|ulst| |List| (|Expression| R))
         (|lei| |List|
          (|Record|
           (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
           (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
           (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
           (|:| |shift_part| (|Expression| R))))
         (|dbasis| |Vector| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|dtrans| |Matrix| (|Integer|))
         ($ |Record| (|:| |primpart| (|Expression| R))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|ar1|
           (|Record| (|:| |primpart| (|Expression| R))
                     (|:| |logpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))
                     (|:| |polypart|
                          (|SparseUnivariatePolynomial| (|Expression| R)))
                     (|:| |specpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|einums| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|er2|
           (|Record|
            (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
            (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
            (|:| |shift_part| (|Expression| R)) (|:| |has_part2?| (|Boolean|))
            (|:| |ratpart2| (|Integer|)) (|:| |v_part2| (|Expression| R))
            (|:| |u_part2| (|Expression| R))
            (|:| |shift_part2| (|Expression| R))))
          (|u1| (|Expression| R))
          (|uv|
           (|Record| (|:| |u_part| (|Expression| R))
                     (|:| |v_part| (|Expression| R))
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| (|Expression| R))
                      (|:| |v_part| (|Expression| R))
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|v1| (|Expression| R)) (|v0| (|Expression| R)) (|r1| (|Integer|))
          (|ril| (|List| (|Integer|))) (#1=#:G880 NIL) (|er| NIL)
          (#2=#:G879 NIL) (|r0| (|Integer|))
          (|er1|
           (|Record|
            (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
            (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
            (|:| |shift_part| (|Expression| R))))
          (|lei1|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|j| NIL) (#3=#:G878 NIL)
          (|bpol| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|poly_cor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|sp_cor|
           #4=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lp_cor| #4#) (|ansp| (|Expression| R)) (#5=#:G875 NIL)
          (|einum| NIL) (#6=#:G876 NIL) (#7=#:G877 NIL)
          (|bpols| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|j0| (|NonNegativeInteger|)) (#8=#:G874 NIL) (|esum| (|Integer|))
          (|i| NIL) (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lei|) . #9=(|RDEEFX;handle_nonlinear_log|))
              (LETT |m| (QVSIZE |dbasis|) . #9#) (LETT |bpols| NIL . #9#)
              (LETT |lei1| NIL . #9#)
              (SEQ (LETT |i| 1 . #9#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ (LETT |esum| 0 . #9#)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1 . #9#) G190
                               (COND ((|greater_SI| |j| |n|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (SPADCALL |dtrans| |i| |j| (QREFELT $ 298))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1) . #9#)
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #8# |$NoValue| . #9#)
                                            (GO #10=#:G858)))
                                          ('T (LETT |j0| |j| . #9#)))))))))
                               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                               (EXIT NIL)))
                         #10# (EXIT #8#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT $ 300))
                                        |bpols|)
                                  . #9#)
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT $ 303))
                                         |lei1|)
                                   . #9#)))))))
                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| $ 30) . #9#)
              (LETT |lp_cor| (|spadConstant| $ 205) . #9#)
              (LETT |sp_cor| (|spadConstant| $ 205) . #9#)
              (LETT |poly_cor| (|spadConstant| $ 70) . #9#)
              (COND
               ((NULL (NULL |bpols|))
                (EXIT
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |bpols| $)
                        . #9#)
                  (SEQ (LETT |er| NIL . #9#) (LETT #7# |lei1| . #9#)
                       (LETT |bpol| NIL . #9#) (LETT #6# |bpols| . #9#)
                       (LETT |einum| NIL . #9#) (LETT #5# |einums| . #9#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |einum| (CAR #5#) . #9#) NIL)
                             (ATOM #6#)
                             (PROGN (LETT |bpol| (CAR #6#) . #9#) NIL)
                             (ATOM #7#)
                             (PROGN (LETT |er| (CAR #7#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| |bpol| |er| $)
                              . #9#)
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 26))
                              . #9#)
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 252))
                              . #9#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 252))
                              . #9#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 64))
                               . #9#)))
                       (LETT #5#
                             (PROG1 (CDR #5#)
                               (LETT #6#
                                     (PROG1 (CDR #6#)
                                       (LETT #7# (CDR #7#) . #9#))
                                     . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT $ 300)) . #9#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |bpol| (QREFELT $ 59)) 1 (QREFELT $ 148))
                 (|error| "degree(bpol) ~= 1"))
                (#11='T
                 (SEQ
                  (SEQ (LETT |er| NIL . #9#) (LETT #3# |lei| . #9#)
                       (LETT |j| 1 . #9#) G190
                       (COND
                        ((OR (|greater_SI| |j| |n|) (ATOM #3#)
                             (PROGN (LETT |er| (CAR #3#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT $ 298)) 1)
                           (LETT |lei1| (CONS |er| |lei1|) . #9#)))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #3# (CDR #3#) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |er1| (|SPADfirst| |lei1|) . #9#)
                  (LETT |r0| (QVELT |er1| 1) . #9#)
                  (LETT |lei| (CDR |lei1|) . #9#)
                  (LETT |ril|
                        (PROGN
                         (LETT #2# NIL . #9#)
                         (SEQ (LETT |er| NIL . #9#) (LETT #1# |lei| . #9#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |er| (CAR #1#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2# (CONS (- (QVELT |er| 1) |r0|) #2#)
                                      . #9#)))
                              (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #9#)
                  (LETT |r1| (SPADCALL |ril| (QREFELT $ 89)) . #9#)
                  (LETT |v0| (QVELT |er1| 2) . #9#)
                  (LETT |v1|
                        (SPADCALL (QVELT (|SPADfirst| |lei|) 2) |v0|
                                  (QREFELT $ 34))
                        . #9#)
                  (LETT |v1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |r1| (QREFELT $ 28))
                                   (SPADCALL
                                    (- (QVELT (|SPADfirst| |lei|) 1) |r0|)
                                    (QREFELT $ 28))
                                   (QREFELT $ 61))
                         |v1| (QREFELT $ 29))
                        . #9#)
                  (LETT |uvu| (|RDEEFX;get_uv| |v1| |vlst| |ulst| |k| |x| $)
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |uvu| 1) (|error| "impossible, get_uv failed"))
                    (#11#
                     (SEQ (LETT |uv| (QCDR |uvu|) . #9#)
                          (LETT |u1|
                                (SPADCALL (QVELT |uv| 0)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT $ 242)) 1
                                            (QREFELT $ 243))
                                           |r1| (QREFELT $ 42))
                                          (QREFELT $ 29))
                                . #9#)
                          (LETT |er2|
                                (VECTOR |bpol| |r0| |v0| (|spadConstant| $ 70)
                                        (QVELT |er1| 4) 0 (QVELT |er1| 6) 'T
                                        |r1| |v1| |u1| (QVELT |uv| 1))
                                . #9#)
                          (LETT |einums|
                                (|RDEEFX;decompose1| |num| |den| (LIST |bpol|)
                                 $)
                                . #9#)
                          (LETT |ar1|
                                (|RDEEFX;solve_linear_factor| |nf| |denf| |nfp|
                                 |denfp| |k| |x| (|SPADfirst| |einums|) |er2|
                                 $)
                                . #9#)
                          (EXIT |ar1|)))))))))))) 

(SDEFUN |RDEEFX;handle_logpart|
        ((|num| |SparseUnivariatePolynomial| (|Expression| R))
         (|den| |SparseUnivariatePolynomial| (|Expression| R))
         (|nf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R)) (|vlst| |List| (|Expression| R))
         (|ulst| |List| (|Expression| R)) (|x| |Symbol|)
         ($ |Record| (|:| |primpart| (|Expression| R))
          (|:| |logpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|poly_cor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|sp_cor|
           #1=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lp_cor| #1#) (|ansp| (|Expression| R))
          (|ar1|
           (|Record| (|:| |primpart| (|Expression| R))
                     (|:| |logpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))
                     (|:| |polypart|
                          (|SparseUnivariatePolynomial| (|Expression| R)))
                     (|:| |specpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (#2=#:G913 NIL) (|einum| NIL) (#3=#:G914 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|dtrans| #4=(|Matrix| (|Integer|)))
          (|dbasis|
           #5=(|Vector| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lei|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|ninds| (|List| (|Integer|)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lei1|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |ratpart| (|Integer|)) (|:| |v_part| (|Expression| R))
             (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
             (|:| |shift_part| (|Expression| R)))))
          (|neidens| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|i| NIL) (#6=#:G911 NIL) (|eiden| NIL) (#7=#:G912 NIL)
          (|n| (|NonNegativeInteger|)) (|nidbl| (|List| (|Integer|)))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|bi| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|m| (|NonNegativeInteger|)) (#8=#:G908 NIL)
          (|lp| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|dr| (|Record| (|:| |basis| #5#) (|:| |transform| #4#)))
          (#9=#:G910 NIL) (#10=#:G909 NIL))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 38))
            (COND
             ((SPADCALL |denf| (|spadConstant| $ 54) (QREFELT $ 84))
              (COND
               ((SPADCALL (SPADCALL |nf| (QREFELT $ 59)) 1 (QREFELT $ 307))
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| $))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| $ 54) (QREFELT $ 84))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
              (EXIT
               (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                       (|spadConstant| $ 70) (|spadConstant| $ 205)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| $)
                . #11=(|RDEEFX;handle_logpart|))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 205)
                     (|spadConstant| $ 70) (|spadConstant| $ 205)))
            (#12='T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #10# NIL . #11#)
                     (SEQ (LETT |er| NIL . #11#) (LETT #9# |lei| . #11#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |er| (CAR #9#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10# (CONS (QVELT |er| 0) #10#) . #11#)))
                          (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #11#)
              (LETT |ansp| (|spadConstant| $ 30) . #11#)
              (LETT |lp_cor| (|spadConstant| $ 205) . #11#)
              (LETT |sp_cor| (|spadConstant| $ 205) . #11#)
              (LETT |poly_cor| (|spadConstant| $ 70) . #11#)
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT $ 38))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT $ 308))
                                  (QREFELT $ 311))
                        . #11#)
                  (LETT |dbasis| (QCAR |dr|) . #11#)
                  (LETT |dtrans| (QCDR |dr|) . #11#)
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT $ 99))
                                  (SPADCALL |den| (QREFELT $ 99))
                                  (QREFELT $ 244))
                        . #11#)
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (LETT |ar1|
                                (|RDEEFX;handle_nonlinear_log| |num| |den| |nf|
                                 |denf| |nfp| |denfp| |k| |x| |vlst| |ulst|
                                 |lei| |dbasis| |dtrans| $)
                                . #11#)
                          (LETT |ansp|
                                (SPADCALL |ansp| (QVELT |ar1| 0)
                                          (QREFELT $ 26))
                                . #11#)
                          (LETT |lp_cor|
                                (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                          (QREFELT $ 252))
                                . #11#)
                          (LETT |sp_cor|
                                (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                          (QREFELT $ 252))
                                . #11#)
                          (LETT |poly_cor|
                                (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                          (QREFELT $ 64))
                                . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| $ 205)
                                       (QREFELT $ 312))
                             (PROGN
                              (LETT #8# |$NoValue| . #11#)
                              (GO #13=#:G900)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT $ 259))
                                    . #11#)
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| $ 205)
                                           (QREFELT $ 312))
                                 (PROGN
                                  (LETT #8# |$NoValue| . #11#)
                                  (GO #13#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT $ 128))
                                        . #11#)
                                  (LETT |den| (SPADCALL |lp| (QREFELT $ 224))
                                        . #11#)
                                  (LETT |ndbl| NIL . #11#)
                                  (LETT |nidbl| NIL . #11#)
                                  (LETT |m| (QVSIZE |dbasis|) . #11#)
                                  (SEQ (LETT |i| 1 . #11#) G190
                                       (COND
                                        ((|greater_SI| |i| |m|) (GO G191)))
                                       (SEQ
                                        (LETT |bi|
                                              (SPADCALL |dbasis| |i|
                                                        (QREFELT $ 300))
                                              . #11#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |den| |bi|
                                                      (QREFELT $ 81))
                                            0)
                                           (SEQ
                                            (LETT |ndbl| (CONS |bi| |ndbl|)
                                                  . #11#)
                                            (EXIT
                                             (LETT |nidbl| (CONS |i| |nidbl|)
                                                   . #11#)))))))
                                       (LETT |i| (|inc_SI| |i|) . #11#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |ndbl|) |m|)
                                     (|error|
                                      "no progress in handle_nonlinear_log"))
                                    ('T
                                     (SEQ
                                      (LETT |ndbl| (NREVERSE |ndbl|) . #11#)
                                      (LETT |nidbl| (NREVERSE |nidbl|) . #11#)
                                      (LETT |neidens| NIL . #11#)
                                      (LETT |ninds| NIL . #11#)
                                      (LETT |lei1| NIL . #11#)
                                      (LETT |n| (LENGTH |eidens|) . #11#)
                                      (SEQ (LETT |er| NIL . #11#)
                                           (LETT #7# |lei| . #11#)
                                           (LETT |eiden| NIL . #11#)
                                           (LETT #6# |eidens| . #11#)
                                           (LETT |i| 1 . #11#) G190
                                           (COND
                                            ((OR (|greater_SI| |i| |n|)
                                                 (ATOM #6#)
                                                 (PROGN
                                                  (LETT |eiden| (CAR #6#)
                                                        . #11#)
                                                  NIL)
                                                 (ATOM #7#)
                                                 (PROGN
                                                  (LETT |er| (CAR #7#) . #11#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((QEQCAR
                                                (SPADCALL |den| |eiden|
                                                          (QREFELT $ 81))
                                                0)
                                               (SEQ
                                                (LETT |neidens|
                                                      (CONS |eiden| |neidens|)
                                                      . #11#)
                                                (LETT |ninds|
                                                      (CONS |i| |ninds|)
                                                      . #11#)
                                                (EXIT
                                                 (LETT |lei1|
                                                       (CONS |er| |lei1|)
                                                       . #11#)))))))
                                           (LETT |i|
                                                 (PROG1 (|inc_SI| |i|)
                                                   (LETT #6#
                                                         (PROG1 (CDR #6#)
                                                           (LETT #7# (CDR #7#)
                                                                 . #11#))
                                                         . #11#))
                                                 . #11#)
                                           (GO G190) G191 (EXIT NIL))
                                      (LETT |eidens| (NREVERSE |neidens|)
                                            . #11#)
                                      (LETT |ninds| (NREVERSE |ninds|) . #11#)
                                      (LETT |lei| (NREVERSE |lei1|) . #11#)
                                      (LETT |dbasis|
                                            (SPADCALL |ndbl| (QREFELT $ 308))
                                            . #11#)
                                      (EXIT
                                       (LETT |dtrans|
                                             (SPADCALL |dtrans| |nidbl| |ninds|
                                                       (QREFELT $ 313))
                                             . #11#)))))))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #13# (EXIT #8#))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))
                (#12#
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| $)
                        . #11#)
                  (SEQ (LETT |er| NIL . #11#) (LETT #3# |lei| . #11#)
                       (LETT |einum| NIL . #11#) (LETT #2# |einums| . #11#)
                       G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |einum| (CAR #2#) . #11#) NIL)
                             (ATOM #3#)
                             (PROGN (LETT |er| (CAR #3#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| (QVELT |er| 0) |er| $)
                              . #11#)
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT $ 26))
                              . #11#)
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT $ 252))
                              . #11#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 252))
                              . #11#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 64))
                               . #11#)))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #11#))
                             . #11#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

(SDEFUN |RDEEFX;gamma_denominator|
        ((|denf| . #1=(|SparseUnivariatePolynomial| (|Expression| R)))
         (|k| |Kernel| (|Expression| R))
         ($ |Record|
          (|:| |radicand| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |exponent| (|Integer|))))
        (SPROG
         ((|gden1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G940 NIL) (#3=#:G936 NIL) (#4=#:G948 NIL) (|fac1| NIL)
          (#5=#:G947 NIL) (|l1| (|Integer|)) (|lexp| (|List| #6=(|Integer|)))
          (#7=#:G946 NIL) (#8=#:G945 NIL)
          (|nffacs|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| #6#))))
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|denf1| #1#) (#9=#:G918 NIL) (#10=#:G916 NIL) (|s_deg| (|Integer|)))
         (SEQ (LETT |s_deg| 0 . #11=(|RDEEFX;gamma_denominator|))
              (LETT |denf1| |denf| . #11#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 38))
                (SEQ (LETT |s_deg| (SPADCALL |denf| (QREFELT $ 229)) . #11#)
                     (EXIT
                      (LETT |denf1|
                            (PROG2
                                (LETT #9#
                                      (SPADCALL |denf|
                                                (SPADCALL (|spadConstant| $ 35)
                                                          (PROG1
                                                              (LETT #10#
                                                                    |s_deg|
                                                                    . #11#)
                                                            (|check_subtype2|
                                                             (>= #10# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #10#))
                                                          (QREFELT $ 63))
                                                (QREFELT $ 81))
                                      . #11#)
                                (QCDR #9#)
                              (|check_union2| (QEQCAR #9# 0)
                                              (|SparseUnivariatePolynomial|
                                               (|Expression| (QREFELT $ 6)))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (QREFELT $ 6)))
                                               "failed")
                                              #9#))
                            . #11#)))))
              (EXIT
               (COND
                ((SPADCALL |denf1| (|spadConstant| $ 54) (QREFELT $ 84))
                 (COND ((EQL |s_deg| 0) (CONS (|spadConstant| $ 54) 0))
                       (#12='T
                        (CONS (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 63))
                              |s_deg|))))
                (#12#
                 (SEQ (LETT |fnf| (SPADCALL |denf1| (QREFELT $ 222)) . #11#)
                      (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 209)) . #11#)
                      (LETT |lexp|
                            (PROGN
                             (LETT #8# NIL . #11#)
                             (SEQ (LETT |fac1| NIL . #11#)
                                  (LETT #7# |nffacs| . #11#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |fac1| (CAR #7#) . #11#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8# (CONS (QCDR |fac1|) #8#)
                                          . #11#)))
                                  (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                                  (EXIT (NREVERSE #8#))))
                            . #11#)
                      (LETT |l1|
                            (SPADCALL (CONS |s_deg| |lexp|) (QREFELT $ 89))
                            . #11#)
                      (EXIT
                       (COND ((EQL |l1| 1) (CONS |denf| 1))
                             (#12#
                              (SEQ
                               (LETT |gden1|
                                     (SPADCALL (ELT $ 71)
                                               (PROGN
                                                (LETT #5# NIL . #11#)
                                                (SEQ (LETT |fac1| NIL . #11#)
                                                     (LETT #4# |nffacs| . #11#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #4#)
                                                           (PROGN
                                                            (LETT |fac1|
                                                                  (CAR #4#)
                                                                  . #11#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #5#
                                                             (CONS
                                                              (|RDEEFX;my_exp|
                                                               (QCAR |fac1|)
                                                               (PROG1
                                                                   (LETT #3#
                                                                         (QUOTIENT2
                                                                          (QCDR
                                                                           |fac1|)
                                                                          |l1|)
                                                                         . #11#)
                                                                 (|check_subtype2|
                                                                  (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                                               $)
                                                              #5#)
                                                             . #11#)))
                                                     (LETT #4# (CDR #4#)
                                                           . #11#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #5#))))
                                               (QREFELT $ 276))
                                     . #11#)
                               (COND
                                ((SPADCALL |s_deg| 0 (QREFELT $ 106))
                                 (LETT |gden1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 35)
                                                  (PROG1
                                                      (LETT #2#
                                                            (QUOTIENT2 |s_deg|
                                                                       |l1|)
                                                            . #11#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 63))
                                        |gden1| (QREFELT $ 71))
                                       . #11#)))
                               (EXIT (CONS |gden1| |l1|))))))))))))) 

(SDEFUN |RDEEFX;special_Hermite|
        ((|r| |Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
         (|nfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|ndenf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denfp| |SparseUnivariatePolynomial| (|Expression| R))
         (|deriv| |Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
          (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |Record|
          (|:| |answer|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |specpart|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))))
        (SPROG
         ((|mult| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|denr| #1=(|SparseUnivariatePolynomial| (|Expression| R)))
          (#2=#:G955 NIL)
          (|numr| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|nfp1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|an| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|nn| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|ee|
           (|Record|
            (|:| |coef1| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |coef2| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (#3=#:G952 NIL) (#4=#:G962 NIL)
          (|hh1| (|SparseUnivariatePolynomial| (|Expression| R))) (|ad| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ad|
                  (LETT |denr| (SPADCALL |r| (QREFELT $ 224))
                        . #5=(|RDEEFX;special_Hermite|))
                  . #5#)
            (LETT |numr| (SPADCALL |r| (QREFELT $ 128)) . #5#)
            (LETT |an| (|spadConstant| $ 70) . #5#)
            (LETT |mult| (|spadConstant| $ 54) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |hh1| (SPADCALL |denr| |ndenf| (QREFELT $ 79)) . #5#)
                   (EXIT
                    (COND
                     ((EQL (SPADCALL |hh1| (QREFELT $ 59)) 0)
                      (PROGN
                       (LETT #4#
                             (CONS
                              (SPADCALL (SPADCALL |denfp| |an| (QREFELT $ 71))
                                        |ad| (QREFELT $ 204))
                              (SPADCALL |numr| |denr| (QREFELT $ 204)))
                             . #5#)
                       (GO #6=#:G961)))
                     ('T
                      (SEQ
                       (LETT |ee|
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL |nfp| |hh1| |numr|
                                                 (QREFELT $ 288))
                                       . #5#)
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0)
                                               (|Record|
                                                (|:| |coef1|
                                                     (|SparseUnivariatePolynomial|
                                                      (|Expression|
                                                       (QREFELT $ 6))))
                                                (|:| |coef2|
                                                     (|SparseUnivariatePolynomial|
                                                      (|Expression|
                                                       (QREFELT $ 6)))))
                                               (|Union|
                                                (|Record|
                                                 (|:| |coef1|
                                                      (|SparseUnivariatePolynomial|
                                                       (|Expression|
                                                        (QREFELT $ 6))))
                                                 (|:| |coef2|
                                                      (|SparseUnivariatePolynomial|
                                                       (|Expression|
                                                        (QREFELT $ 6)))))
                                                "failed")
                                               #3#))
                             . #5#)
                       (LETT |nn| (SPADCALL (QCAR |ee|) |hh1| (QREFELT $ 195))
                             . #5#)
                       (LETT |an|
                             (SPADCALL |an|
                                       (SPADCALL |mult| |nn| (QREFELT $ 71))
                                       (QREFELT $ 64))
                             . #5#)
                       (LETT |nfp1|
                             (SPADCALL |nfp|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL |denfp|
                                                            (SPADCALL |denr|
                                                                      |deriv|)
                                                            (QREFELT $ 71))
                                                  |denr| (QREFELT $ 81))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (|Expression|
                                                           (QREFELT $ 6)))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (|Expression|
                                                            (QREFELT $ 6)))
                                                          #7="failed")
                                                         #2#))
                                       (QREFELT $ 198))
                             . #5#)
                       (LETT |numr|
                             (SPADCALL
                              (SPADCALL |numr|
                                        (SPADCALL |nfp1| |nn| (QREFELT $ 71))
                                        (QREFELT $ 198))
                              (SPADCALL (SPADCALL |denfp| |nn| (QREFELT $ 71))
                                        |deriv|)
                              (QREFELT $ 198))
                             . #5#)
                       (LETT |numr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |numr| |hh1| (QREFELT $ 81))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (QREFELT $ 6)))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (QREFELT $ 6)))
                                                #7#)
                                               #2#))
                             . #5#)
                       (LETT |denr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |denr| |hh1| (QREFELT $ 81))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (QREFELT $ 6)))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (QREFELT $ 6)))
                                                #7#)
                                               #2#))
                             . #5#)
                       (EXIT
                        (LETT |mult| (SPADCALL |mult| |hh1| (QREFELT $ 71))
                              . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |RDEEFX;ei_int_log|
        ((|f| |Expression| R)
         (|ng| |SparseUnivariatePolynomial| (|Expression| R)) (|x| |Symbol|)
         (|k| |Kernel| (|Expression| R))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         (|ext| |Mapping|
          (|Union|
           (|Record| (|:| |ratpart| (|Expression| R))
                     (|:| |coeff| (|Expression| R)))
           "failed")
          (|Expression| R) (|Expression| R))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| #1=(|Expression| R)) (|r1| #1#)
          (|res2|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|gm| (|Expression| R)) (|kfm| (|Expression| R)) (|am1| #1#)
          (|res1|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R)) (|:| |sol?| (|Boolean|))))
          (|m| NIL) (|ansp| #1#) (|dk| (|Expression| R))
          (|kf| (|Expression| R)) (|k1| (|Kernel| (|Expression| R)))
          (|lk| (|List| (|Kernel| (|Expression| R)))) (|ngu| (|Expression| R)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 99)) |k| (QREFELT $ 101))
                . #2=(|RDEEFX;ei_int_log|))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 231))
                          (SPADCALL |ngu| (QREFELT $ 231)) (QREFELT $ 233))
                . #2#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 314)) |x|
                          (QREFELT $ 315))
                . #2#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #2#)
          (LETT |dk| (SPADCALL |kf| |x| (QREFELT $ 43)) . #2#)
          (LETT |r1| (|spadConstant| $ 30) . #2#)
          (LETT |ansp| (|spadConstant| $ 30) . #2#) (LETT |is_sol| 'T . #2#)
          (LETT |rh| (|spadConstant| $ 30) . #2#)
          (LETT |am1| (|spadConstant| $ 30) . #2#)
          (SEQ (LETT |m| (SPADCALL |ng| (QREFELT $ 59)) . #2#) G190
               (COND ((< |m| 1) (GO G191)))
               (SEQ
                (LETT |gm|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |m| 1) (QREFELT $ 28)) |dk|
                                  (QREFELT $ 29))
                        |am1| (QREFELT $ 29))
                       (QREFELT $ 62))
                      . #2#)
                (COND
                 ((EQL |m| (SPADCALL |ng| (QREFELT $ 59)))
                  (SEQ
                   (LETT |gm|
                         (SPADCALL |gm| (SPADCALL |ng| (QREFELT $ 77))
                                   (QREFELT $ 26))
                         . #2#)
                   (EXIT (LETT |ng| (SPADCALL |ng| (QREFELT $ 83)) . #2#)))))
                (LETT |res1|
                      (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 320))
                      . #2#)
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 2)) ('T 'NIL))
                      . #2#)
                (LETT |am1| (QVELT |res1| 0) . #2#)
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 321)) . #2#)
                (LETT |r1|
                      (SPADCALL |r1| (SPADCALL |kfm| |am1| (QREFELT $ 29))
                                (QREFELT $ 26))
                      . #2#)
                (EXIT
                 (LETT |rh|
                       (SPADCALL
                        (SPADCALL |rh|
                                  (SPADCALL |kfm| (QVELT |res1| 1)
                                            (QREFELT $ 29))
                                  (QREFELT $ 26))
                        (SPADCALL
                         (SPADCALL (SPADCALL |m| (QREFELT $ 28)) |dk|
                                   (QREFELT $ 29))
                         |am1| (QREFELT $ 29))
                        (QREFELT $ 26))
                       . #2#)))
               (LETT |m| (+ |m| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |gm|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 214))
                          (SPADCALL |dk| |am1| (QREFELT $ 29)) (QREFELT $ 34))
                . #2#)
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 323))
                . #2#)
          (LETT |r1| (SPADCALL |r1| (QVELT |res2| 0) (QREFELT $ 26)) . #2#)
          (LETT |rh| (SPADCALL |rh| (QVELT |res2| 1) (QREFELT $ 26)) . #2#)
          (LETT |is_sol| (COND (|is_sol| (QVELT |res2| 3)) ('T 'NIL)) . #2#)
          (EXIT (VECTOR |r1| |rh| (QVELT |res2| 2) |is_sol|))))) 

(SDEFUN |RDEEFX;ei_int_exp|
        ((|f| |Expression| R)
         (|ng| |SparseUnivariatePolynomial| (|Expression| R))
         (|degs| |NonNegativeInteger|) (|x| |Symbol|)
         (|k| |Kernel| (|Expression| R))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         (|ext| |Mapping|
          (|Union|
           (|Record| (|:| |ratpart| (|Expression| R))
                     (|:| |coeff| (|Expression| R)))
           "failed")
          (|Expression| R) (|Expression| R))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| #1=(|Expression| R)) (|ansp| #1#)
          (|r1| #1#) (|kfm| (|Expression| R))
          (|res1|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|f1| (|Expression| R)) (|gm| (|Expression| R)) (|m| (|Integer|))
          (|kf| (|Expression| R)) (|ak| (|Expression| R))
          (|k1| (|Kernel| (|Expression| R)))
          (|lk| (|List| (|Kernel| (|Expression| R)))) (|ngu| (|Expression| R)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 99)) |k| (QREFELT $ 101))
                . #2=(|RDEEFX;ei_int_exp|))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 231))
                          (SPADCALL |ngu| (QREFELT $ 231)) (QREFELT $ 233))
                . #2#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 314)) |x|
                          (QREFELT $ 315))
                . #2#)
          (LETT |ak|
                (SPADCALL (SPADCALL |k| (QREFELT $ 242)) 1 (QREFELT $ 243))
                . #2#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #2#)
          (LETT |r1| (|spadConstant| $ 30) . #2#)
          (LETT |ansp| (|spadConstant| $ 30) . #2#) (LETT |is_sol| 'T . #2#)
          (LETT |rh| (|spadConstant| $ 30) . #2#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |ng| (|spadConstant| $ 70) (QREFELT $ 82)))
                 (GO G191)))
               (SEQ (LETT |m| (- (SPADCALL |ng| (QREFELT $ 59)) |degs|) . #2#)
                    (LETT |gm| (SPADCALL |ng| (QREFELT $ 77)) . #2#)
                    (LETT |ng| (SPADCALL |ng| (QREFELT $ 83)) . #2#)
                    (LETT |f1|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |m| (QREFELT $ 28))
                                              |ak| (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #2#)
                    (LETT |res1|
                          (SPADCALL 1 |f1| |gm| |x| |lim| |ext|
                                    (QREFELT $ 323))
                          . #2#)
                    (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 42)) . #2#)
                    (LETT |r1|
                          (SPADCALL |r1|
                                    (SPADCALL |kfm| (QVELT |res1| 0)
                                              (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #2#)
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |res1| 2) (QREFELT $ 26))
                          . #2#)
                    (LETT |rh|
                          (SPADCALL |rh|
                                    (SPADCALL |kfm| (QVELT |res1| 1)
                                              (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #2#)
                    (EXIT
                     (LETT |is_sol|
                           (COND (|is_sol| (QVELT |res1| 3)) ('T 'NIL))
                           . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |r1| |rh| |ansp| |is_sol|))))) 

(SDEFUN |RDEEFX;get_scoeff|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
          (|:| |v_part| (|Expression| R))
          (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |new_f|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |radicand|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
          (|:| |shift_part| (|Expression| R)))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R))
         (|der| |Mapping|
          #1=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|res| |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         ($ |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
        (SPROG
         ((|gt|
           #2=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|i| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|l1| (|NonNegativeInteger|)) (#3=#:G1007 NIL) (|coeff1_r| #2#)
          (|coeff1|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nfp| #1#) (|d| (|Integer|)) (|vshift| (|Expression| R))
          (|u_exp| (|Integer|)) (|u0| (|Expression| R)) (|ak| (|Expression| R))
          (|nf1| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|v0| (|Expression| R)) (|r0| (|Integer|))
          (|nn| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #4=(|RDEEFX;get_scoeff|))
              (LETT |r0| (QVELT |scand| 3) . #4#)
              (LETT |v0| (QVELT |scand| 4) . #4#)
              (LETT |cfac| (QVELT |scand| 5) . #4#)
              (LETT |u0| (QVELT |scand| 8) . #4#)
              (LETT |nf1| (QVELT |scand| 6) . #4#)
              (COND
               ((SPADCALL |r0| 0 (QREFELT $ 55))
                (SEQ
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 242)) 1
                                 (QREFELT $ 243))
                       . #4#)
                 (EXIT
                  (LETT |u0|
                        (SPADCALL |u0| (SPADCALL |ak| |r0| (QREFELT $ 42))
                                  (QREFELT $ 29))
                        . #4#)))))
              (LETT |u_exp| (QVELT |scand| 9) . #4#)
              (LETT |vshift| (QVELT |scand| 10) . #4#)
              (LETT |d| (QVELT |scand| 0) . #4#)
              (EXIT
               (COND
                ((EQL |d| 1)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|) . #4#)
                      (COND
                       ((OR
                         (SPADCALL (QVELT |scand| 2) (|spadConstant| $ 35)
                                   (QREFELT $ 110))
                         (SPADCALL |cfac| (|spadConstant| $ 70)
                                   (QREFELT $ 82)))
                        (EXIT (|error| "impossible coeff"))))
                      (LETT |coeff1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u0| (QREFELT $ 21)) |nfp|
                                       (QREFELT $ 241))
                             |nf1| (QREFELT $ 244))
                            . #4#)
                      (LETT |coeff1_r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 35) 1
                                         (QREFELT $ 63))
                               (QREFELT $ 99))
                              |u_exp| (QREFELT $ 282))
                             |coeff1| (QREFELT $ 251))
                            . #4#)
                      (EXIT (CONS |coeff1_r| |res|))))
                ((SPADCALL |d| 1 (QREFELT $ 106))
                 (COND
                  ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                   (|error| "unimplemented"))
                  (#5='T
                   (SEQ
                    (LETT |l1|
                          (PROG1 (LETT #3# (- |d| 1) . #4#)
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#))
                          . #4#)
                    (LETT |nf2| (QVELT |scand| 7) . #4#)
                    (LETT |gt|
                          (SPADCALL
                           (SPADCALL (SPADCALL |nf2| |der|)
                                     (SPADCALL |u0| (QREFELT $ 21))
                                     (QREFELT $ 324))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 63))
                             (QREFELT $ 99))
                            |u_exp| (QREFELT $ 282))
                           (QREFELT $ 251))
                          . #4#)
                    (SEQ (LETT |i| 1 . #4#) G190
                         (COND ((|greater_SI| |i| |l1|) (GO G191)))
                         (SEQ (LETT |res| (CONS |gt| |res|) . #4#)
                              (EXIT
                               (LETT |gt| (SPADCALL |gt| |nf2| (QREFELT $ 251))
                                     . #4#)))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))))
                (#5# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;get_scoeffs|
        ((|scands| |List|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| (|Expression| R))
                    (|:| |alg_part|
                         (|SparseUnivariatePolynomial| (|Expression| R)))
                    (|:| |new_f|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |radicand|
                         (|Fraction|
                          (|SparseUnivariatePolynomial| (|Expression| R))))
                    (|:| |u_part| (|Expression| R))
                    (|:| |exponent| (|Integer|))
                    (|:| |shift_part| (|Expression| R))))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|k| |Kernel| (|Expression| R))
         (|der| |Mapping|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         ($ |List|
          (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (#1=#:G1018 NIL) (|scand| NIL))
         (SEQ (LETT |res| NIL . #2=(|RDEEFX;get_scoeffs|))
              (SEQ (LETT |scand| NIL . #2#) (LETT #1# |scands| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |scand| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|RDEEFX;get_scoeff| |scand| |denf| |k| |der| |res|
                            $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |RDEEFX;get_prims|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |coeff| (|Expression| R)) (|:| |ratpart| (|Integer|))
          (|:| |v_part| (|Expression| R))
          (|:| |alg_part| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|:| |new_f|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |radicand|
               (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|:| |u_part| (|Expression| R)) (|:| |exponent| (|Integer|))
          (|:| |shift_part| (|Expression| R)))
         (|denf| |SparseUnivariatePolynomial| (|Expression| R))
         (|denf1| |SparseUnivariatePolynomial| (|Expression| R))
         (|gexp| |Integer|) (|k| |Kernel| (|Expression| R))
         ($ |List| (|Expression| R)))
        (SPROG
         ((|res| (|List| (|Expression| R))) (|f1| (|Expression| R))
          (|ff| #1=(|Expression| R)) (|c1| #2=(|Expression| R)) (|j1| #2#)
          (|j| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lf| (|Expression| R)) (|l1| (|NonNegativeInteger|))
          (#3=#:G1022 NIL) (|gpow| (|Integer|)) (#4=#:G1020 NIL)
          (|d| (|Integer|)) (|f| #1#)
          (|nf| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|uc| (|Expression| R)) (|vshift| (|Expression| R))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|nn| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #5=(|RDEEFX;get_prims|))
              (LETT |cfac| (QVELT |scand| 5) . #5#)
              (LETT |vshift| (QVELT |scand| 10) . #5#)
              (LETT |uc| (QVELT |scand| 2) . #5#)
              (LETT |nf| (QVELT |scand| 6) . #5#)
              (LETT |f| (SPADCALL |nf| |k| (QREFELT $ 101)) . #5#)
              (LETT |d| (QVELT |scand| 0) . #5#)
              (EXIT
               (COND
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 62))
                             (QREFELT $ 291))
                   (SPADCALL |f| (QREFELT $ 292)) (QREFELT $ 29))))
                ((SPADCALL |d| 1 (QREFELT $ 106))
                 (COND
                  ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                   (|error| "unimplemented"))
                  (#6='T
                   (SEQ
                    (LETT |gpow|
                          (PROG2
                              (LETT #4# (SPADCALL |gexp| |d| (QREFELT $ 91))
                                    . #5#)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #4#))
                          . #5#)
                    (LETT |l1|
                          (PROG1 (LETT #3# (- |d| 1) . #5#)
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#))
                          . #5#)
                    (LETT |lf| (SPADCALL |d| (QREFELT $ 28)) . #5#)
                    (LETT |res| NIL . #5#) (LETT |nf2| (QVELT |scand| 7) . #5#)
                    (SEQ (LETT |j| 1 . #5#) G190
                         (COND ((|greater_SI| |j| |l1|) (GO G191)))
                         (SEQ
                          (LETT |j1|
                                (SPADCALL (SPADCALL |j| (QREFELT $ 28)) |lf|
                                          (QREFELT $ 61))
                                . #5#)
                          (LETT |c1|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |uc| (QREFELT $ 62))
                                            (SPADCALL |j1| (QREFELT $ 62))
                                            (QREFELT $ 325))
                                  (SPADCALL (SPADCALL |vshift| (QREFELT $ 62))
                                            (QREFELT $ 291))
                                  (QREFELT $ 29))
                                 |lf| (QREFELT $ 61))
                                . #5#)
                          (LETT |f1|
                                (COND
                                 ((EQL (SPADCALL 2 |j| (QREFELT $ 326)) |d|)
                                  (SEQ
                                   (LETT |ff|
                                         (SPADCALL |nf2| |k| (QREFELT $ 101))
                                         . #5#)
                                   (EXIT
                                    (SPADCALL
                                     (SPADCALL |c1|
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 327))
                                                (QREFELT $ 328))
                                               (QREFELT $ 29))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |uc| (QREFELT $ 62))
                                                 (QREFELT $ 328))
                                       |ff| (QREFELT $ 29))
                                      (QREFELT $ 329))
                                     (QREFELT $ 29)))))
                                 ('T
                                  (SPADCALL
                                   (SPADCALL |c1|
                                             (SPADCALL |j1|
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          62))
                                                       (QREFELT $ 330))
                                             (QREFELT $ 29))
                                   (QREFELT $ 62))))
                                . #5#)
                          (EXIT (LETT |res| (CONS |f1| |res|) . #5#)))
                         (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (NREVERSE |res|))))))
                (#6# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45|
        ((|n| |Integer|) (|f| |Expression| R) (|g| |Expression| R)
         (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| (|Expression| R))
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| (|Expression| R))
                                     (|:| |logand| (|Expression| R))))))
           "failed")
          (|Expression| R) (|List| (|Expression| R)))
         (|ext| |Mapping|
          (|Union|
           (|Record| (|:| |ratpart| (|Expression| R))
                     (|:| |coeff| (|Expression| R)))
           "failed")
          (|Expression| R) (|Expression| R))
         ($ |Record| (|:| |ans| (|Expression| R))
          (|:| |right| (|Expression| R)) (|:| |primpart| (|Expression| R))
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res6|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R)) (|:| |sol?| (|Boolean|))))
          (|r1| (|Expression| R)) (|rr1f| #1=(|Expression| R)) (#2=#:G1142 NIL)
          (|rr1| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|ansp| (|Expression| R)) (|a1| #1#)
          (|res4|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|f1| #3=(|Expression| R)) (|g1| #3#) (|u| (|Expression| R))
          (|rc| (|Integer|)) (|rcu| (|Union| (|Integer|) "failed"))
          (|lc| (|Expression| R))
          (|spec1p| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|spec1u|
           #4=(|Union| (|SparseUnivariatePolynomial| (|Expression| R))
                       "failed"))
          (|res3|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|base_case| (|Boolean|))
          (|scoeffs|
           (|List|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|derivation3|
           (|Mapping|
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|scands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |coeff| (|Expression| R))
                      (|:| |ratpart| (|Integer|))
                      (|:| |v_part| (|Expression| R))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |new_f|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |radicand|
                           (|Fraction|
                            (|SparseUnivariatePolynomial| (|Expression| R))))
                      (|:| |u_part| (|Expression| R))
                      (|:| |exponent| (|Integer|))
                      (|:| |shift_part| (|Expression| R)))))
          (|her2|
           (|Record|
            (|:| |answer|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |specpart|
                 (|Fraction|
                  (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|ndenf| #5=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|denf_split|
           (|Record| (|:| |normal| #5#)
                     (|:| |special|
                          (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|derivation2|
           (|Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
                      (|SparseUnivariatePolynomial| (|Expression| R))))
          (|gexp| (|Integer|))
          (|gden1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|#G412|
           (|Record|
            (|:| |radicand| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |exponent| (|Integer|))))
          (|res5|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|lp1u| #4#)
          (|lp|
           #6=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|ar1|
           (|Record| (|:| |primpart| (|Expression| R))
                     (|:| |logpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))
                     (|:| |polypart|
                          (|SparseUnivariatePolynomial| (|Expression| R)))
                     (|:| |specpart|
                          (|Fraction|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|ulst| (|List| (|Expression| R))) (#7=#:G1148 NIL) (|kk| NIL)
          (#8=#:G1147 NIL) (|vlst| (|List| (|Expression| R))) (#9=#:G1146 NIL)
          (#10=#:G1145 NIL) (|lk1| (|List| #11=(|Kernel| (|Expression| R))))
          (#12=#:G1144 NIL) (#13=#:G1143 NIL)
          (|ng| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|degs| (|NonNegativeInteger|))
          (|ds| #14=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|nf| #15=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|denf| #14#)
          (|fu|
           #16=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lnum| #15#) (|lden| #14#)
          (|her|
           (|Record|
            (|:| |answer|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |logpart| #6#)
            (|:| |specpart|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
                      (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nfp| #15#) (|denfp| #14#) (|dk| #15#) (|dku| #16#) (|gu| #16#)
          (|fpu| #16#) (|k| (|Kernel| (|Expression| R))) (|lk| (|List| #11#))
          (|fp| (|Expression| R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fp|
                  (SPADCALL (SPADCALL |n| |f| (QREFELT $ 331)) |x|
                            (QREFELT $ 43))
                  . #17=(|RDEEFX;ei_int;I2ESMMR;45|))
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| $ 30) (QREFELT $ 41))
               (SEQ
                (LETT |res5|
                      (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 320))
                      . #17#)
                (EXIT
                 (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                         (|spadConstant| $ 30) (QVELT |res5| 2)))))
              (#18='T
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 231))
                                 (SPADCALL |g| (QREFELT $ 231))
                                 (QREFELT $ 233))
                       |x| (QREFELT $ 314))
                      . #17#)
                (LETT |k| (SPADCALL |lk| (QREFELT $ 332)) . #17#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |k| (QREFELT $ 334)) (QREFELT $ 7)
                             (QREFELT $ 335))
                   (SEQ
                    (LETT |res5|
                          (SPADCALL |n| |f| |g| |x| |lim| |ext|
                                    (QREFELT $ 320))
                          . #17#)
                    (EXIT
                     (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                             (|spadConstant| $ 30) (QVELT |res5| 2)))))
                  (#18#
                   (SEQ (LETT |f| (SPADCALL |n| |f| (QREFELT $ 331)) . #17#)
                        (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 127)) . #17#)
                        (LETT |gu| (SPADCALL |g| |k| (QREFELT $ 127)) . #17#)
                        (LETT |dku|
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 40)) |x|
                                         (QREFELT $ 290))
                               |k| (QREFELT $ 127))
                              . #17#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |dku| (QREFELT $ 224))
                                     (|spadConstant| $ 54) (QREFELT $ 82))
                           (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 30)
                                   (|spadConstant| $ 30) 'NIL))
                          (#18#
                           (SEQ
                            (LETT |dk| (SPADCALL |dku| (QREFELT $ 128)) . #17#)
                            (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 224))
                                  . #17#)
                            (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 128))
                                  . #17#)
                            (LETT |derivation|
                                  (CONS #'|RDEEFX;ei_int;I2ESMMR;45!1|
                                        (VECTOR |dk| |x| $ |denfp|))
                                  . #17#)
                            (LETT |her|
                                  (SPADCALL
                                   (SPADCALL |denfp| |gu| (QREFELT $ 241))
                                   |derivation| |nfp| (QREFELT $ 340))
                                  . #17#)
                            (LETT |lp| (QVELT |her| 1) . #17#)
                            (LETT |a1|
                                  (SPADCALL (QVELT |her| 0) |k|
                                            (QREFELT $ 101))
                                  . #17#)
                            (LETT |rr1|
                                  (SPADCALL
                                   (SPADCALL |lp|
                                             (SPADCALL (QVELT |her| 3)
                                                       (QREFELT $ 99))
                                             (QREFELT $ 252))
                                   (QVELT |her| 2) (QREFELT $ 252))
                                  . #17#)
                            (LETT |rr1|
                                  (SPADCALL |rr1|
                                            (SPADCALL |denfp| (QREFELT $ 99))
                                            (QREFELT $ 244))
                                  . #17#)
                            (LETT |r1|
                                  (SPADCALL |g|
                                            (SPADCALL |rr1| |k|
                                                      (QREFELT $ 101))
                                            (QREFELT $ 34))
                                  . #17#)
                            (EXIT
                             (COND
                              ((SPADCALL |rr1| (|spadConstant| $ 205)
                                         (QREFELT $ 312))
                               (VECTOR |a1| |g| (|spadConstant| $ 30) 'T))
                              (#18#
                               (SEQ
                                (LETT |lden| (SPADCALL |lp| (QREFELT $ 224))
                                      . #17#)
                                (LETT |lnum| (SPADCALL |lp| (QREFELT $ 128))
                                      . #17#)
                                (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 127))
                                      . #17#)
                                (LETT |denf| (SPADCALL |fu| (QREFELT $ 224))
                                      . #17#)
                                (LETT |nf| (SPADCALL |fu| (QREFELT $ 128))
                                      . #17#)
                                (COND
                                 ((SPADCALL |denf| (|spadConstant| $ 54)
                                            (QREFELT $ 84))
                                  (COND
                                   ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
                                    (COND
                                     ((SPADCALL |k| '|exp| (QREFELT $ 38))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |lp| (|spadConstant| $ 205)
                                                   (QREFELT $ 341))
                                         (VECTOR |a1| |r1|
                                                 (|spadConstant| $ 30) 'NIL))
                                        (#18#
                                         (SEQ
                                          (LETT |ds|
                                                (SPADCALL (QVELT |her| 2)
                                                          (QREFELT $ 224))
                                                . #17#)
                                          (COND
                                           ((OR
                                             (SPADCALL
                                              (SPADCALL |ds| (QREFELT $ 83))
                                              (|spadConstant| $ 70)
                                              (QREFELT $ 82))
                                             (SPADCALL
                                              (SPADCALL |ds| (QREFELT $ 77))
                                              (|spadConstant| $ 35)
                                              (QREFELT $ 110)))
                                            (EXIT
                                             (|error|
                                              "unexpected special part"))))
                                          (LETT |degs|
                                                (SPADCALL |ds| (QREFELT $ 59))
                                                . #17#)
                                          (LETT |ng|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 35) |degs|
                                                   (QREFELT $ 63))
                                                  (QVELT |her| 3)
                                                  (QREFELT $ 71))
                                                 (SPADCALL (QVELT |her| 2)
                                                           (QREFELT $ 128))
                                                 (QREFELT $ 64))
                                                . #17#)
                                          (LETT |res5|
                                                (|RDEEFX;ei_int_exp| |f| |ng|
                                                 |degs| |x| |k| |lim| |ext| $)
                                                . #17#)
                                          (LETT |a1|
                                                (SPADCALL |a1| (QVELT |res5| 0)
                                                          (QREFELT $ 26))
                                                . #17#)
                                          (LETT |r1|
                                                (SPADCALL |r1| (QVELT |res5| 1)
                                                          (QREFELT $ 26))
                                                . #17#)
                                          (EXIT
                                           (VECTOR |a1| |r1| (QVELT |res5| 2)
                                                   (QVELT |res5| 3)))))))))))))
                                (LETT |lk1|
                                      (PROGN
                                       (LETT #13# NIL . #17#)
                                       (SEQ (LETT |kk| NIL . #17#)
                                            (LETT #12# |lk| . #17#) G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #12#)
                                                         . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((COND
                                                 ((SPADCALL |kk| '|log|
                                                            (QREFELT $ 38))
                                                  'T)
                                                 (#18#
                                                  (SPADCALL |kk| '|exp|
                                                            (QREFELT $ 38))))
                                                (LETT #13# (CONS |kk| #13#)
                                                      . #17#)))))
                                            (LETT #12# (CDR #12#) . #17#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #13#))))
                                      . #17#)
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #10# NIL . #17#)
                                       (SEQ (LETT |kk| NIL . #17#)
                                            (LETT #9# |lk1| . #17#) G190
                                            (COND
                                             ((OR (ATOM #9#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #9#) . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #10#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          38))
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          40)))
                                                      ('T
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           242))
                                                        1 (QREFELT $ 243))))
                                                     #10#)
                                                    . #17#)))
                                            (LETT #9# (CDR #9#) . #17#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #10#))))
                                      . #17#)
                                (LETT |ulst|
                                      (PROGN
                                       (LETT #8# NIL . #17#)
                                       (SEQ (LETT |kk| NIL . #17#)
                                            (LETT #7# |lk1| . #17#) G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #7#) . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #8#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          38))
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           242))
                                                        1 (QREFELT $ 243)))
                                                      ('T
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          40))))
                                                     #8#)
                                                    . #17#)))
                                            (LETT #7# (CDR #7#) . #17#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #8#))))
                                      . #17#)
                                (LETT |ar1|
                                      (|RDEEFX;handle_logpart| |lnum| |lden|
                                       |nf| |denf| |nfp| |denfp| |k| |vlst|
                                       |ulst| |x| $)
                                      . #17#)
                                (LETT |ansp| (QVELT |ar1| 0) . #17#)
                                (LETT |lp|
                                      (SPADCALL |lp| (QVELT |ar1| 1)
                                                (QREFELT $ 259))
                                      . #17#)
                                (QSETVELT |her| 2
                                          (SPADCALL (QVELT |her| 2)
                                                    (QVELT |ar1| 3)
                                                    (QREFELT $ 259)))
                                (QSETVELT |her| 3
                                          (SPADCALL (QVELT |her| 3)
                                                    (QVELT |ar1| 2)
                                                    (QREFELT $ 198)))
                                (LETT |lp1u| (SPADCALL |lp| (QREFELT $ 255))
                                      . #17#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |lp1u| 1)
                                   (VECTOR |a1| |r1| (|spadConstant| $ 30)
                                           'NIL))
                                  (#18#
                                   (SEQ
                                    (QSETVELT |her| 3
                                              (SPADCALL (QVELT |her| 3)
                                                        (QCDR |lp1u|)
                                                        (QREFELT $ 64)))
                                    (COND
                                     ((SPADCALL (QVELT |her| 3)
                                                (|spadConstant| $ 70)
                                                (QREFELT $ 84))
                                      (COND
                                       ((SPADCALL (QVELT |her| 2)
                                                  (|spadConstant| $ 205)
                                                  (QREFELT $ 312))
                                        (EXIT (VECTOR |a1| |g| |ansp| 'T))))))
                                    (COND
                                     ((SPADCALL |denf| (|spadConstant| $ 54)
                                                (QREFELT $ 84))
                                      (COND
                                       ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
                                        (COND
                                         ((OR
                                           (SPADCALL |k| '|log| (QREFELT $ 38))
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT $ 334))
                                            (QREFELT $ 8) (QREFELT $ 335)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |lp|
                                                       (|spadConstant| $ 205)
                                                       (QREFELT $ 341))
                                             (VECTOR |a1| |r1|
                                                     (|spadConstant| $ 30)
                                                     'NIL))
                                            ((SPADCALL (QVELT |her| 2)
                                                       (|spadConstant| $ 205)
                                                       (QREFELT $ 341))
                                             (|error|
                                              "unexpected special part"))
                                            (#18#
                                             (SEQ
                                              (LETT |res5|
                                                    (|RDEEFX;ei_int_log| |f|
                                                     (QVELT |her| 3) |x| |k|
                                                     |lim| |ext| $)
                                                    . #17#)
                                              (LETT |a1|
                                                    (SPADCALL |a1|
                                                              (QVELT |res5| 0)
                                                              (QREFELT $ 26))
                                                    . #17#)
                                              (LETT |r1|
                                                    (SPADCALL |r1|
                                                              (QVELT |res5| 1)
                                                              (QREFELT $ 26))
                                                    . #17#)
                                              (EXIT
                                               (VECTOR |a1| |r1|
                                                       (SPADCALL |ansp|
                                                                 (QVELT |res5|
                                                                        2)
                                                                 (QREFELT $
                                                                          26))
                                                       (QVELT |res5|
                                                              3)))))))))))))
                                    (LETT |rr1|
                                          (SPADCALL
                                           (SPADCALL (QVELT |her| 3)
                                                     (QREFELT $ 99))
                                           (QVELT |her| 2) (QREFELT $ 252))
                                          . #17#)
                                    (LETT |rr1|
                                          (SPADCALL |rr1|
                                                    (SPADCALL |denfp|
                                                              (QREFELT $ 99))
                                                    (QREFELT $ 244))
                                          . #17#)
                                    (PROGN
                                     (LETT |#G412|
                                           (|RDEEFX;gamma_denominator| |denf|
                                            |k| $)
                                           . #17#)
                                     (LETT |gden1| (QCAR |#G412|) . #17#)
                                     (LETT |gexp| (QCDR |#G412|) . #17#)
                                     |#G412|)
                                    (LETT |derivation2|
                                          (CONS #'|RDEEFX;ei_int;I2ESMMR;45!3|
                                                (VECTOR |dk| |x| $))
                                          . #17#)
                                    (LETT |denf_split|
                                          (SPADCALL |denf| |derivation2|
                                                    (QREFELT $ 344))
                                          . #17#)
                                    (LETT |ndenf| (QCAR |denf_split|) . #17#)
                                    (LETT |her2|
                                          (|RDEEFX;special_Hermite| |rr1| |nfp|
                                           |ndenf| |denfp| |derivation2| $)
                                          . #17#)
                                    (LETT |a1|
                                          (SPADCALL |a1|
                                                    (SPADCALL (QCAR |her2|) |k|
                                                              (QREFELT $ 101))
                                                    (QREFELT $ 26))
                                          . #17#)
                                    (LETT |rr1| (QCDR |her2|) . #17#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |rr1| (|spadConstant| $ 205)
                                                 (QREFELT $ 312))
                                       (VECTOR |a1| |g| |ansp| 'T))
                                      (#18#
                                       (SEQ
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 54)
                                                    (QREFELT $ 84))
                                          (COND
                                           ((EQL (SPADCALL |nf| (QREFELT $ 59))
                                                 2)
                                            (COND
                                             ((SPADCALL |k| '|log|
                                                        (QREFELT $ 38))
                                              (EXIT
                                               (|RDEEFX;quadratic_log_erf_integrate|
                                                |nf| |nfp| |rr1| |a1| |g|
                                                |ansp| |derivation| |vlst|
                                                |ulst| |k| |x| |lim| $))))))))
                                        (LETT |scands|
                                              (|RDEEFX;special_candidates| |nf|
                                               |denf| |gden1| |gexp| |vlst|
                                               |ulst| |k| |x| $)
                                              . #17#)
                                        (LETT |derivation3|
                                              (CONS
                                               #'|RDEEFX;ei_int;I2ESMMR;45!4|
                                               (VECTOR |derivation2| $))
                                              . #17#)
                                        (LETT |scoeffs|
                                              (|RDEEFX;get_scoeffs| |scands|
                                               |denf| |k| |derivation3| $)
                                              . #17#)
                                        (LETT |base_case|
                                              (QEQCAR
                                               (SPADCALL |k| (QREFELT $ 346))
                                               0)
                                              . #17#)
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 54)
                                                    (QREFELT $ 84))
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |nfp| (QREFELT $ 59)) 0
                                             (QREFELT $ 72))
                                            (EXIT
                                             (|RDEEFX;special_integrate1| |nfp|
                                              |f| |k| |x| |rr1| |a1| |r1| |g|
                                              |ansp| |scoeffs| |scands| |gexp|
                                              |derivation| |lim| $))))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |denf| (QREFELT $ 59)) 0
                                            (QREFELT $ 72))
                                           (SEQ
                                            (LETT |res3|
                                                  (|RDEEFX;special_integrate2|
                                                   |nfp| |denfp| |denf| |ndenf|
                                                   |f| |k| |x| |rr1| |a1| |r1|
                                                   |g| |scoeffs| |scands|
                                                   |gexp| |derivation2| |lim|
                                                   $)
                                                  . #17#)
                                            (EXIT
                                             (VECTOR
                                              (SPADCALL |a1| (QVELT |res3| 0)
                                                        (QREFELT $ 26))
                                              (SPADCALL |r1| (QVELT |res3| 1)
                                                        (QREFELT $ 26))
                                              (SPADCALL |ansp| (QVELT |res3| 2)
                                                        (QREFELT $ 26))
                                              (QVELT |res3| 3)))))
                                          (#18#
                                           (SEQ
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| $ 54)
                                                        (QREFELT $ 84))
                                              (COND
                                               ((SPADCALL |k| '|log|
                                                          (QREFELT $ 38))
                                                (COND
                                                 ((EQL
                                                   (SPADCALL |nf|
                                                             (QREFELT $ 59))
                                                   1)
                                                  (SEQ
                                                   (LETT |spec1u|
                                                         (SPADCALL |rr1|
                                                                   (QREFELT $
                                                                            255))
                                                         . #17#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |spec1u| 1)
                                                      (|error| "impossible 9"))
                                                     (#18#
                                                      (SEQ
                                                       (LETT |spec1p|
                                                             (QCDR |spec1u|)
                                                             . #17#)
                                                       (EXIT
                                                        (COND
                                                         ((EQL
                                                           (SPADCALL |spec1p|
                                                                     (QREFELT $
                                                                              59))
                                                           0)
                                                          (SEQ
                                                           (LETT |lc|
                                                                 (SPADCALL |nf|
                                                                           (QREFELT
                                                                            $
                                                                            77))
                                                                 . #17#)
                                                           (LETT |rcu|
                                                                 (SPADCALL |lc|
                                                                           (QREFELT
                                                                            $
                                                                            112))
                                                                 . #17#)
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |rcu| 1)
                                                              "skip")
                                                             (#18#
                                                              (SEQ
                                                               (LETT |rc|
                                                                     (QCDR
                                                                      |rcu|)
                                                                     . #17#)
                                                               (LETT |u|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |k|
                                                                        (QREFELT
                                                                         $
                                                                         242))
                                                                       1
                                                                       (QREFELT
                                                                        $ 243))
                                                                      |rc|
                                                                      (QREFELT
                                                                       $ 42))
                                                                     . #17#)
                                                               (LETT |g1|
                                                                     (SPADCALL
                                                                      |spec1p|
                                                                      0
                                                                      (QREFELT
                                                                       $ 60))
                                                                     . #17#)
                                                               (LETT |f1|
                                                                     (SPADCALL
                                                                      |nf| 0
                                                                      (QREFELT
                                                                       $ 60))
                                                                     . #17#)
                                                               (LETT |res4|
                                                                     (SPADCALL
                                                                      1 |f1|
                                                                      (SPADCALL
                                                                       |g1| |u|
                                                                       (QREFELT
                                                                        $ 29))
                                                                      |x| |lim|
                                                                      |ext|
                                                                      (QREFELT
                                                                       $ 323))
                                                                     . #17#)
                                                               (LETT |a1|
                                                                     (SPADCALL
                                                                      |a1|
                                                                      (SPADCALL
                                                                       (QVELT
                                                                        |res4|
                                                                        0)
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 61))
                                                                      (QREFELT
                                                                       $ 26))
                                                                     . #17#)
                                                               (LETT |ansp|
                                                                     (SPADCALL
                                                                      |ansp|
                                                                      (QVELT
                                                                       |res4|
                                                                       2)
                                                                      (QREFELT
                                                                       $ 26))
                                                                     . #17#)
                                                               (LETT |rr1|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |spec1p|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QVELT
                                                                          |res4|
                                                                          1)
                                                                         |u|
                                                                         (QREFELT
                                                                          $
                                                                          61))
                                                                        (QREFELT
                                                                         $ 21))
                                                                       (QREFELT
                                                                        $ 198))
                                                                      (QREFELT
                                                                       $ 99))
                                                                     . #17#)
                                                               (LETT |r1|
                                                                     (SPADCALL
                                                                      |g|
                                                                      (SPADCALL
                                                                       |rr1|
                                                                       |k|
                                                                       (QREFELT
                                                                        $ 101))
                                                                      (QREFELT
                                                                       $ 34))
                                                                     . #17#)
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #2#
                                                                       (VECTOR
                                                                        |a1|
                                                                        |r1|
                                                                        |ansp|
                                                                        (QVELT
                                                                         |res4|
                                                                         3))
                                                                       . #17#)
                                                                 (GO
                                                                  #19=#:G1141))))))))))))))))))))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |rr1|
                                                         (|spadConstant| $ 205)
                                                         (QREFELT $ 312))
                                               (VECTOR |a1| |g| |ansp| 'T))
                                              (#18#
                                               (SEQ
                                                (LETT |rr1f|
                                                      (SPADCALL |rr1| |k|
                                                                (QREFELT $
                                                                         101))
                                                      . #17#)
                                                (LETT |r1|
                                                      (SPADCALL |g| |rr1f|
                                                                (QREFELT $ 34))
                                                      . #17#)
                                                (LETT |res6|
                                                      (SPADCALL 1 |f| |rr1f|
                                                                |x| |lim| |ext|
                                                                (QREFELT $
                                                                         320))
                                                      . #17#)
                                                (EXIT
                                                 (VECTOR
                                                  (SPADCALL |a1|
                                                            (QVELT |res6| 0)
                                                            (QREFELT $ 26))
                                                  (SPADCALL |r1|
                                                            (QVELT |res6| 1)
                                                            (QREFELT $ 26))
                                                  |ansp|
                                                  (QVELT |res6|
                                                         2)))))))))))))))))))))))))))))))))))))
          #19# (EXIT #2#)))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation2|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;ei_int;I2ESMMR;45|))
          (LETT |derivation2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z1| (QREFELT $ 128)) |derivation2|)
               (SPADCALL |z1| (QREFELT $ 224)) (QREFELT $ 71))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 128))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 224))
                                  |derivation2|)
                        (QREFELT $ 71))
              (QREFELT $ 198))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 224))
                       (SPADCALL |z1| (QREFELT $ 224)) (QREFELT $ 71))
             (QREFELT $ 204)))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45!3| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEEFX;ei_int;I2ESMMR;45|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEEFX;ei_int;I2ESMMR;45!2|
                                   (VECTOR $ |x|))
                             |dk| (QREFELT $ 337))))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45!2| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 290)))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| $ |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3) . #1=(|RDEEFX;ei_int;I2ESMMR;45|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2ESMMR;45!0|
                                             (VECTOR $ |x|))
                                       |dk| (QREFELT $ 337))
                             (QREFELT $ 71))))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;45!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 290)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX| (#1=#:G1149)
  (SPROG NIL
         (PROG (#2=#:G1150)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryRischDEX|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ElementaryRischDEX;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX|)))))))))) 

(DEFUN |ElementaryRischDEX;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDEX|))
          (LETT |dv$| (LIST '|ElementaryRischDEX| DV$1) . #1#)
          (LETT $ (GETREFV 347) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 '|%alg|)
          (QSETREFV $ 8 '|prim|)
          (QSETREFV $ 202 (SPADCALL (QREFELT $ 57)))
          $))) 

(MAKEPROP '|ElementaryRischDEX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'ALGOP 'PRIM
              (|SparseUnivariatePolynomial| $) (|Kernel| 14)
              (|SparseMultivariatePolynomial| 6 10) (0 . |univariate|)
              (|SparseMultivariatePolynomial| 6 39) (|Expression| 6)
              (6 . |coerce|) (|SparseUnivariatePolynomial| 14)
              (|Mapping| 14 11) (|SparseUnivariatePolynomial| 11)
              (|SparseUnivariatePolynomialFunctions2| 11 14) (11 . |map|)
              (17 . |coerce|) (|SparseUnivariatePolynomial| 16)
              (|Mapping| 16 14) (|SparseUnivariatePolynomialFunctions2| 14 16)
              (22 . |map|) (28 . +) (|Integer|) (34 . |coerce|) (39 . *)
              (45 . |Zero|) (|Mapping| 14 14 14) (|List| 14) (49 . |reduce|)
              (56 . -) (62 . |One|) (|Boolean|) (|Symbol|) (66 . |is?|)
              (|Kernel| $) (72 . |coerce|) (77 . =) (83 . ^) (89 . D)
              (|Vector| 14) (95 . |vector|) (|Union| 50 '"failed")
              (|IntegerLinearDependence| 14) (100 . |particularSolutionOverQ|)
              (|Record| (|:| |num| 85) (|:| |den| 27)) (|Vector| 117)
              (|InnerCommonDenominator| 27 117 85 50)
              (106 . |splitDenominator|) (111 . |One|) (115 . |One|) (119 . ~=)
              (|SingletonAsOrderedSet|) (125 . |create|) (|NonNegativeInteger|)
              (129 . |degree|) (134 . |coefficient|) (140 . /) (146 . -)
              (151 . |monomial|) (157 . +) (163 . |eval|)
              (170 . |coefficients|) (|Mapping| 36 14) (175 . |every?|)
              (181 . |Zero|) (185 . |Zero|) (189 . *) (195 . >)
              (201 . |monomial|) (207 . |coerce|) (212 . +) (218 . |resultant|)
              (224 . |leadingCoefficient|) (229 . /) (235 . |gcd|)
              (|Union| $ '"failed") (241 . |exquo|) (247 . ~=)
              (253 . |reductum|) (258 . =) (|List| 27) (|Vector| 27)
              (264 . |vector|) (|List| $) (269 . |gcd|) (274 . |elt|)
              (280 . |exquo|) (286 . |setelt!|) (293 . |invmod|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (299 . |extendedEuclidean|) (305 . *) (311 . +) (|Fraction| 16)
              (317 . |coerce|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 10) 10
                                                     6 11 14)
              (322 . |multivariate|) (328 . |numer|) (|Factored| 11)
              (|DenominatorIntegration| 6) (333 . |factor|) (338 . >)
              (|Record| (|:| |factor| 11) (|:| |exponent| 27)) (|List| 107)
              (344 . |factors|) (349 . ~=) (|Union| 27 '#1="failed")
              (355 . |retractIfCan|) (360 . |One|) (364 . *)
              (|Record| (|:| |particular| 46) (|:| |basis| (|List| 50)))
              (370 . |solveLinearlyOverQ|) (|Fraction| 27) (376 . |coerce|)
              (|List| 117) (381 . |entries|) (386 . |vector|) (391 . |entries|)
              (396 . |One|) (400 . |One|) (404 . |One|) (408 . |One|)
              (412 . |univariate|) (418 . |numer|) (423 . |vectorise|)
              (429 . |parts|) (|List| 32) (|Matrix| 14) (434 . |matrix|)
              (|Matrix| 27) (|Matrix| $) (439 . |reducedSystem|) (444 . |row|)
              (|SparseUnivariatePolynomial| 27) (450 . |unvectorise|)
              (455 . |gcd|) (|Factored| 138)
              (|MultivariateFactorize| 56 58 27 138) (460 . |factor|)
              (|Record| (|:| |factor| 138) (|:| |exponent| 27)) (|List| 144)
              (465 . |factors|) (470 . |degree|) (475 . ~=)
              (481 . |coefficient|) (487 . |leadingCoefficient|) (492 . /)
              (498 . -) (|Fraction| 164) (|Equation| 153) (503 . |rhs|)
              (508 . |Zero|) (512 . ~=) (518 . |lhs|) (523 . |retract|)
              (528 . ~=) (|Union| 164 '#2="failed") (534 . |retractIfCan|)
              (|Union| 14 '"failed") (|Polynomial| 14) (539 . |retractIfCan|)
              (|Union| 117 '#1#) (544 . |retractIfCan|) (549 . |numer|)
              (|List| 37) (554 . |variables|) (559 . |member?|)
              (565 . |kernel|) (570 . |eval|) (577 . |retract|)
              (582 . |coerce|) (587 . |rest|) (|List| 10) (592 . |rest|)
              (|SparseUnivariatePolynomial| 164) (|Mapping| 164 14)
              (|SparseUnivariatePolynomialFunctions2| 14 164) (597 . |map|)
              (603 . |multivariate|) (609 . |coerce|) (|List| 190) (|List| 153)
              (|SystemSolvePackage| 14) (614 . |solve|) (620 . -) (|List| 154)
              (626 . |last|) (631 . |coerce|) (636 . |univariate|)
              (641 . |new|) (645 . |rem|) (651 . |retractIfCan|)
              (656 . |differentiate|) (661 . -) (667 . |resultant|)
              (673 . |member?|) (679 . *) '|dummy| (685 . ^) (691 . /)
              (697 . |Zero|) (|Record| (|:| |factor| 16) (|:| |exponent| 27))
              (|List| 206) (|Factored| 16) (701 . |factors|)
              (|Mapping| 16 16 16) (|List| 16) (706 . |reduce|) (713 . |unit|)
              (718 . |retract|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 215) (|:| |fctr| 16) (|:| |xpnt| 27))
              (|List| 216) (723 . |makeFR|) (|PositiveInteger|) (729 . *)
              (|Factored| $) (735 . |squareFree|) (740 . |elt|) (746 . |denom|)
              (751 . |max|) (|Mapping| 58 58 58) (|List| 58) (757 . |reduce|)
              (763 . |minimumDegree|) (|List| 39) (768 . |tower|)
              (|IntegrationTools| 6 14) (773 . |union|)
              (|Record| (|:| |coeff| 14) (|:| |logand| 14))
              (|Record| (|:| |mainpart| 14) (|:| |limitedlogs| (|List| 234)))
              (|Union| 235 '"failed") (|Mapping| 236 14 32)
              (|ElementaryRischDE| 6 14) (779 . |boundAt0|) (791 . |boundInf|)
              (804 . *) (810 . |argument|) (815 . |elt|) (821 . /)
              (827 . |retract|) (|Record| (|:| |ans| 16) (|:| |remainder| 16))
              (|List| 246) (|Mapping| 16 16) (|RDEaux| 6 14)
              (832 . |multi_SPDE|) (841 . *) (847 . +) (853 . |setelt!|)
              (|Union| 16 '#2#) (860 . |retractIfCan|)
              (|Record| (|:| |ans| 16) (|:| |nosol| 36))
              (|TranscendentalRischDE| 14 16) (865 . |SPDEnocancel1|) (873 . -)
              (879 . |denom|) (884 . *) (|Mapping| 11 11 11) (|List| 11)
              (890 . |reduce|) (897 . *) (903 . ^) (909 . |unit|)
              (914 . |retract|) (919 . *) (925 . ^) (931 . |concat|)
              (937 . |elt|) (943 . ^) (949 . ~=) (955 . /) (961 . |reduce|)
              (967 . |decompose|) (973 . |univariate|) (980 . |rootOf|)
              (985 . |retract|) (990 . *) (996 . ^)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (1002 . |divide|) (1008 . |elt|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 286 '"failed") (1014 . |extendedEuclidean|)
              (1021 . |retractIfCan|) (1026 . |differentiate|) (1032 . |exp|)
              (1037 . |Ei|) (1042 . |zerosOf|) (1047 . |eval|)
              (|Union| 131 '"failed") (1054 . |solve_u|) (1061 . |retract|)
              (1066 . |elt|) (|Vector| 16) (1073 . |elt|)
              (|Record| (|:| |factor| 16) (|:| |ratpart| 27) (|:| |v_part| 14)
                        (|:| |alg_part| 16) (|:| |u_part| 14)
                        (|:| |exponent| 27) (|:| |shift_part| 14))
              (|List| 301) (1079 . |elt|) (1085 . |One|) (|Fraction| 22)
              (1089 . |One|) (1093 . <=) (1099 . |vector|)
              (|Record| (|:| |basis| 299) (|:| |transform| 134))
              (|GcdBasis| 16) (1104 . |gcdDecomposition|) (1109 . =)
              (1115 . |elt|) (1122 . |varselect|) (1128 . |ksec|)
              (|Record| (|:| |ans| 14) (|:| |right| 14) (|:| |sol?| 36))
              (|Record| (|:| |ratpart| 14) (|:| |coeff| 14))
              (|Union| 317 '"failed") (|Mapping| 318 14 14) (1135 . |rischDE|)
              (1145 . ^)
              (|Record| (|:| |ans| 14) (|:| |right| 14) (|:| |primpart| 14)
                        (|:| |sol?| 36))
              |RDEEFX;ei_int;I2ESMMR;45| (1151 . *) (1157 . ^) (1163 . *)
              (1169 . |pi|) (1173 . |sqrt|) (1178 . |erf|) (1183 . |Gamma|)
              (1189 . *) (1195 . |kmax|) (|BasicOperator|) (1200 . |operator|)
              (1205 . |has?|) (|Mapping| 14 14) (1211 . |differentiate|)
              (|Record| (|:| |answer| 98) (|:| |logpart| 98)
                        (|:| |specpart| 98) (|:| |polypart| 16))
              (|TranscendentalHermiteIntegration| 14 16)
              (1218 . |HermiteIntegrate|) (1225 . ~=)
              (|Record| (|:| |normal| 16) (|:| |special| 16))
              (|MonomialExtensionTools| 14 16) (1231 . |split|)
              (|Union| 37 '"failed") (1237 . |symbolIfCan|))
           '#(|ei_int| 1242) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 346
                                                 '(2 11 9 0 10 12 1 14 0 13 15
                                                   2 19 16 17 18 20 1 16 0 14
                                                   21 2 24 22 23 16 25 2 14 0 0
                                                   0 26 1 14 0 27 28 2 14 0 0 0
                                                   29 0 14 0 30 3 32 14 31 0 14
                                                   33 2 14 0 0 0 34 0 14 0 35 2
                                                   10 36 0 37 38 1 14 0 39 40 2
                                                   14 36 0 0 41 2 14 0 0 27 42
                                                   2 14 0 0 37 43 1 44 0 32 45
                                                   2 47 46 44 14 48 1 51 49 50
                                                   52 0 6 0 53 0 16 0 54 2 27
                                                   36 0 0 55 0 56 0 57 1 16 58
                                                   0 59 2 16 14 0 58 60 2 14 0
                                                   0 0 61 1 14 0 0 62 2 16 0 14
                                                   58 63 2 16 0 0 0 64 3 16 0 0
                                                   56 0 65 1 16 32 0 66 2 32 36
                                                   67 0 68 0 6 0 69 0 16 0 70 2
                                                   16 0 0 0 71 2 58 36 0 0 72 2
                                                   22 0 16 58 73 1 22 0 16 74 2
                                                   22 0 0 0 75 2 22 16 0 0 76 1
                                                   16 14 0 77 2 16 0 0 14 78 2
                                                   16 0 0 0 79 2 16 80 0 0 81 2
                                                   16 36 0 0 82 1 16 0 0 83 2
                                                   16 36 0 0 84 1 86 0 85 87 1
                                                   27 0 88 89 2 86 27 0 27 90 2
                                                   27 80 0 0 91 3 86 27 0 27 27
                                                   92 2 27 0 0 0 93 2 27 94 0 0
                                                   95 2 86 0 27 0 96 2 86 0 0 0
                                                   97 1 98 0 16 99 2 100 14 98
                                                   10 101 1 14 13 0 102 1 104
                                                   103 11 105 2 27 36 0 0 106 1
                                                   103 108 0 109 2 14 36 0 0
                                                   110 1 14 111 0 112 0 11 0
                                                   113 2 16 0 14 0 114 2 47 115
                                                   44 14 116 1 117 0 27 118 1
                                                   50 119 0 120 1 50 0 119 121
                                                   1 86 85 0 122 0 22 0 123 0
                                                   98 0 124 0 103 0 125 0 117 0
                                                   126 2 100 98 14 10 127 1 98
                                                   16 0 128 2 16 44 0 58 129 1
                                                   44 32 0 130 1 132 0 131 133
                                                   1 14 134 135 136 2 134 86 0
                                                   27 137 1 138 0 86 139 1 138
                                                   0 88 140 1 142 141 138 143 1
                                                   141 145 0 146 1 138 58 0 147
                                                   2 58 36 0 0 148 2 138 27 0
                                                   58 149 1 138 27 0 150 2 117
                                                   0 27 27 151 1 117 0 0 152 1
                                                   154 153 0 155 0 153 0 156 2
                                                   153 36 0 0 157 1 154 153 0
                                                   158 1 153 37 0 159 2 37 36 0
                                                   0 160 1 153 161 0 162 1 164
                                                   163 0 165 1 14 166 0 167 1
                                                   153 164 0 168 1 164 169 0
                                                   170 2 169 36 37 0 171 1 10 0
                                                   37 172 3 164 0 0 37 14 173 1
                                                   164 14 0 174 1 164 0 14 175
                                                   1 169 0 0 176 1 177 0 0 178
                                                   2 181 179 180 16 182 2 164 0
                                                   9 37 183 1 153 0 164 184 2
                                                   187 185 186 169 188 2 153 0
                                                   0 0 189 1 190 154 0 191 1 14
                                                   0 117 192 1 164 16 0 193 0
                                                   37 0 194 2 16 0 0 0 195 1
                                                   117 111 0 196 1 16 0 0 197 2
                                                   16 0 0 0 198 2 16 14 0 0 199
                                                   2 119 36 117 0 200 2 27 0 58
                                                   0 201 2 16 0 0 58 203 2 98 0
                                                   16 16 204 0 98 0 205 1 208
                                                   207 0 209 3 211 16 210 0 16
                                                   212 1 208 16 0 213 1 16 14 0
                                                   214 2 208 0 16 217 218 2 27
                                                   0 219 0 220 1 16 221 0 222 2
                                                   44 14 0 27 223 1 98 16 0 224
                                                   2 58 0 0 0 225 2 227 58 226
                                                   0 228 1 16 58 0 229 1 14 230
                                                   0 231 2 232 177 177 177 233
                                                   8 238 27 177 177 14 27 27 37
                                                   10 237 239 9 238 27 177 177
                                                   14 27 27 27 37 10 237 240 2
                                                   98 0 16 0 241 1 10 32 0 242
                                                   2 32 14 0 27 243 2 98 0 0 0
                                                   244 1 98 16 0 245 5 249 247
                                                   16 16 211 27 248 250 2 98 0
                                                   0 0 251 2 98 0 0 0 252 3 44
                                                   14 0 27 14 253 1 98 254 0
                                                   255 4 257 256 16 16 27 248
                                                   258 2 98 0 0 0 259 1 14 13 0
                                                   260 2 11 0 0 0 261 3 263 11
                                                   262 0 11 264 2 117 0 0 0 265
                                                   2 11 0 0 58 266 1 103 11 0
                                                   267 1 11 6 0 268 2 14 0 6 0
                                                   269 2 14 0 0 219 270 2 32 0
                                                   0 0 271 2 50 117 0 27 272 2
                                                   117 0 0 27 273 2 117 36 0 0
                                                   274 2 117 0 0 0 275 2 211 16
                                                   210 0 276 2 104 211 16 211
                                                   277 3 100 16 14 10 16 278 1
                                                   14 0 9 279 1 14 39 0 280 2
                                                   16 0 0 14 281 2 98 0 0 27
                                                   282 2 16 283 0 0 284 2 211
                                                   16 0 27 285 3 16 287 0 0 0
                                                   288 1 16 163 0 289 2 14 0 0
                                                   37 290 1 14 0 0 291 1 14 0 0
                                                   292 1 14 88 9 293 3 14 0 0
                                                   39 0 294 3 104 295 14 14 37
                                                   296 1 14 27 0 297 3 134 27 0
                                                   27 27 298 2 299 16 0 27 300
                                                   2 302 301 0 27 303 0 164 0
                                                   304 0 305 0 306 2 27 36 0 0
                                                   307 1 299 0 211 308 1 310
                                                   309 299 311 2 98 36 0 0 312
                                                   3 134 0 0 85 85 313 2 232
                                                   177 177 37 314 3 232 10 10
                                                   177 37 315 6 238 316 27 14
                                                   14 37 237 319 320 2 14 0 0
                                                   58 321 2 98 0 0 16 324 2 14
                                                   0 0 0 325 2 58 0 219 0 326 0
                                                   14 0 327 1 14 0 0 328 1 14 0
                                                   0 329 2 14 0 0 0 330 2 14 0
                                                   27 0 331 1 232 10 177 332 1
                                                   10 333 0 334 2 333 36 0 37
                                                   335 3 16 0 0 336 0 337 3 339
                                                   338 98 248 16 340 2 98 36 0
                                                   0 341 2 343 342 16 248 344 1
                                                   10 345 0 346 6 0 322 27 14
                                                   14 37 237 319 323)))))
           '|lookupComplete|)) 
