
(SDEFUN |RDEEFX;P_to_UP|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((|up1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 13)) |RDEEFX;P_to_UP|)
              (EXIT (SPADCALL (ELT $ 15) |up1| (QREFELT $ 20)))))) 

(SDEFUN |RDEEFX;UP_to_UPUP|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (ELT $ 21) |p| (QREFELT $ 25))) 

(SDEFUN |RDEEFX;get_uv0|
        ((|tt| F) (|coeffs| |List| (|Integer|)) (|vlst| |List| F)
         (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |u_part| F) (|:| |v_part| F)
          (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
        (SPROG
         ((|kc| #1=(|Integer|)) (#2=#:G265 NIL) (|vi| NIL) (#3=#:G266 NIL)
          (|ki| NIL) (|kf| (F)) (|u| (F)) (#4=#:G263 NIL) (|ui| NIL)
          (#5=#:G264 NIL) (#6=#:G262 NIL) (|ku| #1#) (#7=#:G260 NIL)
          (#8=#:G261 NIL) (|v0| (F)) (#9=#:G258 NIL) (#10=#:G259 NIL)
          (#11=#:G257 NIL))
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
          (|dvvec| (|Vector| F)) (#2=#:G279 NIL) (|vi| NIL) (#3=#:G278 NIL))
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
                         ((SPADCALL |d| 1 (QREFELT $ 54)) (CONS 1 "failed"))
                         (#5#
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
         ((|ff1| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G299 NIL)
          (|ff3| (|SparseUnivariatePolynomial| F)) (#3=#:G289 NIL) (|ff2| #1#)
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
          (|f2| #5#) (|deg1| (|NonNegativeInteger|))
          (|dummy| (|SingletonAsOrderedSet|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dummy| (SPADCALL (QREFELT $ 56))
                  . #6=(|RDEEFX;handle_factor|))
            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 58)) . #6#)
            (LETT |tt|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 59))
                             (SPADCALL (SPADCALL |deg1| (QREFELT $ 28))
                                       (SPADCALL |f1| |deg1| (QREFELT $ 59))
                                       (QREFELT $ 29))
                             (QREFELT $ 60))
                   (QREFELT $ 61))
                  . #6#)
            (LETT |f2|
                  (SPADCALL |f1| |dummy|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 62))
                             (SPADCALL |tt| (QREFELT $ 21)) (QREFELT $ 63))
                            (QREFELT $ 64))
                  . #6#)
            (COND
             ((NULL
               (SPADCALL (CONS #'|RDEEFX;handle_factor!0| (VECTOR $ |x|))
                         (SPADCALL |f2| (QREFELT $ 65)) (QREFELT $ 67)))
              (EXIT
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7=#:G298)))))
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
                                     (QREFELT $ 62))
                           (SPADCALL |tt| (QREFELT $ 21)) (QREFELT $ 63))
                          . #6#)
                    (LETT |ff|
                          (SPADCALL |nf| (SPADCALL |tt1| |denf| (QREFELT $ 69))
                                    (QREFELT $ 63))
                          . #6#)
                    (COND
                     ((SPADCALL |deg1| 1 (QREFELT $ 70))
                      (LETT |ff|
                            (SPADCALL
                             (SPADCALL (SPADCALL |denf| 1 (QREFELT $ 71))
                                       (SPADCALL |ff| (QREFELT $ 72))
                                       (QREFELT $ 73))
                             (|RDEEFX;UP_to_UPUP| |f2| $) (QREFELT $ 74))
                            . #6#)))
                    (LETT |f2pp|
                          (COND ((EQL |deg1| 1) (|spadConstant| $ 75))
                                (#8# |f2|))
                          . #6#)
                    (EXIT
                     (COND
                      (|known_dividing|
                       (SEQ
                        (LETT |ff|
                              (SPADCALL |ff| (SPADCALL |ff| (QREFELT $ 76))
                                        (QREFELT $ 77))
                              . #6#)
                        (EXIT
                         (CONS 0
                               (VECTOR |ff| |r0| |tt| |f2pp| |u| |u_exp|
                                       |v0|)))))
                      (#8#
                       (SEQ
                        (LETT |ff2|
                              (LETT |ff1| (SPADCALL |ff| |gd| (QREFELT $ 78))
                                    . #6#)
                              . #6#)
                        (LETT |ff3|
                              (PROG2
                                  (LETT #3#
                                        (SPADCALL |ff| |ff1| (QREFELT $ 80))
                                        . #6#)
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                (|Union|
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 7))
                                                 #9="failed")
                                                #3#))
                              . #6#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL
                                 (LETT |ff2|
                                       (SPADCALL |ff2| |ff3| (QREFELT $ 78))
                                       . #6#)
                                 (|spadConstant| $ 81) (QREFELT $ 82)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |ff3|
                                     (PROG2
                                         (LETT #3#
                                               (SPADCALL |ff3| |ff2|
                                                         (QREFELT $ 80))
                                               . #6#)
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7))
                                                       (|Union|
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 7))
                                                        #9#)
                                                       #3#))
                                     . #6#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL (EQL (SPADCALL |ff3| (QREFELT $ 58)) 0))
                          (COND
                           ((SPADCALL |k| '|exp| (QREFELT $ 38))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |ff3| (QREFELT $ 83))
                                         (|spadConstant| $ 75) (QREFELT $ 84)))
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
                              (SPADCALL |ff1| (SPADCALL |ff1| (QREFELT $ 76))
                                        (QREFELT $ 77))
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
         ((#1=#:G307 NIL) (|i| NIL) (|av| #2=(|Vector| (|Integer|)))
          (|ki| (|Integer|)) (|di| (|Integer|)) (|g| #3=(|Integer|))
          (|c2| #4=(|Integer|)) (|c1| #5=(|Integer|))
          (|#G45|
           (|Record| (|:| |coef1| #5#) (|:| |coef2| #4#)
                     (|:| |generator| #3#)))
          (|ki1| (|Integer|)) (|di2| (|Integer|)) (|di1| (|Integer|))
          (#6=#:G322 NIL) (|bi| #7=(|Integer|)) (|ai| #7#)
          (|n| (|NonNegativeInteger|)) (|bv| #2#) (|gb| (|Integer|))
          (|bl| #8=(|List| (|Integer|))) (|db| #9=(|Integer|))
          (|cd| (|Record| (|:| |num| #8#) (|:| |den| #9#)))
          (|bvp| (|Vector| (|Fraction| (|Integer|)))) (|da| #9#)
          (|nn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nn| (LENGTH |b|) . #10=(|RDEEFX;z_basis|))
                (EXIT
                 (COND ((SPADCALL |nn| 1 (QREFELT $ 70)) (|error| "#b > 1"))
                       (#11='T
                        (SEQ (LETT |cd| (SPADCALL |a| (QREFELT $ 52)) . #10#)
                             (LETT |da| (QCDR |cd|) . #10#)
                             (LETT |av| (SPADCALL (QCAR |cd|) (QREFELT $ 87))
                                   . #10#)
                             (EXIT
                              (COND
                               ((EQL |nn| 0)
                                (COND
                                 ((SPADCALL |da| 1 (QREFELT $ 54))
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
                                                       0 (QREFELT $ 54))
                                                      (PROGN
                                                       (LETT #6#
                                                             (CONS 1 "failed")
                                                             . #10#)
                                                       (GO #13=#:G321)))
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
                                                            (LETT |#G45|
                                                                  (SPADCALL
                                                                   |di| |di2|
                                                                   (QREFELT $
                                                                            95))
                                                                  . #10#)
                                                            (LETT |c1|
                                                                  (QVELT |#G45|
                                                                         0)
                                                                  . #10#)
                                                            (LETT |c2|
                                                                  (QVELT |#G45|
                                                                         1)
                                                                  . #10#)
                                                            (LETT |g|
                                                                  (QVELT |#G45|
                                                                         2)
                                                                  . #10#)
                                                            |#G45|)
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
          (|vecf| (|Vector| F)) (|dv0| (F)) (|dvs| (|List| F)) (#3=#:G358 NIL)
          (|v| NIL) (#4=#:G357 NIL) (|dv1| (F)) (#5=#:G353 NIL)
          (|no_sol| #6=(|Boolean|)) (|f2| (|SparseUnivariatePolynomial| F))
          (|r0u| (|Union| (|Integer|) "failed")) (|r0f| (F)) (|b0p| (F))
          (|b0| (F)) (|has_r0| #6#) (|a1p| (F)) (|tt| (F))
          (|f1| (|SparseUnivariatePolynomial| F))
          (|deg1| (|NonNegativeInteger|)) (#7=#:G356 NIL) (|fac| NIL)
          (|dummy| (|SingletonAsOrderedSet|)) (|ulst1| (|List| F))
          (|vlst1| (|List| F)) (|u0| (F)) (#8=#:G354 NIL) (#9=#:G355 NIL)
          (|u| NIL) (|v0| (F)) (|a0| (F)) (|a1| (F))
          (|fgd| (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|gd1| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (LETT |gd1|
                (SPADCALL
                 (SPADCALL (SPADCALL |gd| (QREFELT $ 99)) |k| (QREFELT $ 101))
                 (QREFELT $ 102))
                . #10=(|RDEEFX;lin_args|))
          (LETT |fgd| (SPADCALL |gd1| (QREFELT $ 105)) . #10#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf| (QREFELT $ 58)) 1 (QREFELT $ 106))
             (|error| "lin_args only works for linear nf"))
            (#11='T
             (SEQ
              (LETT |a1|
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT $ 58)) 1)
                      (SPADCALL |nf| (QREFELT $ 76)))
                     (#11# (|spadConstant| $ 30)))
                    . #10#)
              (LETT |a0| (SPADCALL |nf| 0 (QREFELT $ 59)) . #10#)
              (LETT |v0| (SPADCALL |k| (QREFELT $ 40)) . #10#)
              (LETT |vlst1| NIL . #10#) (LETT |ulst1| NIL . #10#)
              (SEQ (LETT |u| NIL . #10#) (LETT #9# |ulst| . #10#)
                   (LETT |v| NIL . #10#) (LETT #8# |vlst| . #10#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |v| (CAR #8#) . #10#) NIL)
                         (ATOM #9#) (PROGN (LETT |u| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |v0| (QREFELT $ 41))
                       (LETT |u0| |u| . #10#))
                      ('T
                       (SEQ (LETT |vlst1| (CONS |v| |vlst1|) . #10#)
                            (EXIT
                             (LETT |ulst1| (CONS |u| |ulst1|) . #10#)))))))
                   (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |dummy| (SPADCALL (QREFELT $ 56)) . #10#)
              (LETT |res| NIL . #10#)
              (SEQ (LETT |fac| NIL . #10#)
                   (LETT #7# (SPADCALL |fgd| (QREFELT $ 109)) . #10#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |fac| (CAR #7#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |k| $) . #10#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 58)) . #10#)
                    (EXIT
                     (COND ((EQL |deg1| 0) "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL |f1|
                                             (SPADCALL |f1| (QREFELT $ 76))
                                             (QREFELT $ 77))
                                   . #10#)
                             (LETT |tt|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |f1| (- |deg1| 1)
                                               (QREFELT $ 59))
                                     (SPADCALL |deg1| (QREFELT $ 28))
                                     (QREFELT $ 60))
                                    (QREFELT $ 61))
                                   . #10#)
                             (LETT |no_sol| 'NIL . #10#)
                             (LETT |has_r0| 'NIL . #10#)
                             (LETT |f2| (|spadConstant| $ 75) . #10#)
                             (LETT |r0| 0 . #10#)
                             (LETT |r0f| (|spadConstant| $ 30) . #10#)
                             (COND
                              ((SPADCALL |deg1| 1 (QREFELT $ 70))
                               (SEQ
                                (EXIT
                                 (SEQ
                                  (LETT |f2|
                                        (SPADCALL |f1| |dummy|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 35) 1
                                                    (QREFELT $ 62))
                                                   (SPADCALL |tt|
                                                             (QREFELT $ 21))
                                                   (QREFELT $ 63))
                                                  (QREFELT $ 64))
                                        . #10#)
                                  (LETT |f2|
                                        (SPADCALL |f2|
                                                  (SPADCALL |f2|
                                                            (QREFELT $ 76))
                                                  (QREFELT $ 77))
                                        . #10#)
                                  (COND
                                   ((SPADCALL
                                     (LETT |a1p|
                                           (SPADCALL |a1| |x| (QREFELT $ 43))
                                           . #10#)
                                     (|spadConstant| $ 30) (QREFELT $ 110))
                                    (SEQ (LETT |has_r0| 'T . #10#)
                                         (LETT |b0|
                                               (SPADCALL |f2| 0 (QREFELT $ 59))
                                               . #10#)
                                         (LETT |b0p|
                                               (SPADCALL |b0| |x|
                                                         (QREFELT $ 43))
                                               . #10#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b0p|
                                                      (|spadConstant| $ 30)
                                                      (QREFELT $ 41))
                                            (LETT |no_sol| 'T . #10#))
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
                                                      |b0p| (QREFELT $ 60))
                                                     (QREFELT $ 61))
                                                    |a1| (QREFELT $ 34))
                                                   . #10#)
                                             (LETT |r0u|
                                                   (SPADCALL |r0f|
                                                             (QREFELT $ 112))
                                                   . #10#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |r0u| 1)
                                                (LETT |no_sol| 'T . #10#))
                                               ('T
                                                (SEQ
                                                 (LETT |r0| (QCDR |r0u|)
                                                       . #10#)
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
                                                                              60))
                                                                    1
                                                                    (QREFELT $
                                                                             62))
                                                                   (QREFELT $
                                                                            64))
                                                         (QREFELT $ 114))
                                                        . #10#)))))))))))))
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (CONS #'|RDEEFX;lin_args!0|
                                             (VECTOR $ |x|))
                                       (SPADCALL |f2| (QREFELT $ 65))
                                       (QREFELT $ 67)))
                                     (PROGN
                                      (LETT #5# (LETT |no_sol| 'T . #10#)
                                            . #10#)
                                      (GO #12=#:G336)))))))
                                #12# (EXIT #5#))))
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
                                             (QREFELT $ 61))
                                            . #10#)
                                      (LETT |dv1|
                                            (SPADCALL |tt| |x| (QREFELT $ 43))
                                            . #10#)
                                      (LETT |dvs|
                                            (PROGN
                                             (LETT #4# NIL . #10#)
                                             (SEQ (LETT |v| NIL . #10#)
                                                  (LETT #3# |vlst1| . #10#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #3#)
                                                        (PROGN
                                                         (LETT |v| (CAR #3#)
                                                               . #10#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #4#
                                                          (CONS
                                                           (SPADCALL |v| |x|
                                                                     (QREFELT $
                                                                              43))
                                                           #4#)
                                                          . #10#)))
                                                  (LETT #3# (CDR #3#) . #10#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #4#))))
                                            . #10#)
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
                                                     . #10#)
                                               (EXIT
                                                (SPADCALL |dvs|
                                                          (QREFELT $ 45)))))
                                             ('T
                                              (SPADCALL (CONS |dv1| |dvs|)
                                                        (QREFELT $ 45))))
                                            . #10#)
                                      (LETT |sol_rec|
                                            (SPADCALL |vecf| |dv0|
                                                      (QREFELT $ 116))
                                            . #10#)
                                      (LETT |psolu| (QCAR |sol_rec|) . #10#)
                                      (EXIT
                                       (COND ((QEQCAR |psolu| 1) "iterate")
                                             ('T
                                              (SEQ
                                               (LETT |psol| (QCDR |psolu|)
                                                     . #10#)
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
                                                       . #10#)))
                                               (LETT |zbu|
                                                     (|RDEEFX;z_basis| |psol|
                                                      (QCDR |sol_rec|) $)
                                                     . #10#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |zbu| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |zb| (QCDR |zbu|)
                                                         . #10#)
                                                   (LETT |vec1| (QCAR |zb|)
                                                         . #10#)
                                                   (LETT |r0|
                                                         (SPADCALL |vec1| 1
                                                                   (QREFELT $
                                                                            90))
                                                         . #10#)
                                                   (LETT |a1n|
                                                         (SPADCALL |a1|
                                                                   (SPADCALL
                                                                    |r0|
                                                                    (QREFELT $
                                                                             28))
                                                                   (QREFELT $
                                                                            26))
                                                         . #10#)
                                                   (LETT |tt1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |a1n| |tt|
                                                                     (QREFELT $
                                                                              29))
                                                           (QREFELT $ 61))
                                                          |a0| (QREFELT $ 34))
                                                         . #10#)
                                                   (LETT |uv1|
                                                         (|RDEEFX;get_uv0|
                                                          |tt1|
                                                          (CDR
                                                           (SPADCALL |vec1|
                                                                     (QREFELT $
                                                                              122)))
                                                          |vlst1| |ulst1| |k|
                                                          |x| $)
                                                         . #10#)
                                                   (LETT |u1|
                                                         (SPADCALL
                                                          (QVELT |uv1| 0)
                                                          (SPADCALL |u0| |r0|
                                                                    (QREFELT $
                                                                             42))
                                                          (QREFELT $ 29))
                                                         . #10#)
                                                   (LETT |v1| (QVELT |uv1| 1)
                                                         . #10#)
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
                                                            . #10#))
                                                     ('T
                                                      (SEQ
                                                       (LETT |bv|
                                                             (|SPADfirst|
                                                              (QCDR |zb|))
                                                             . #10#)
                                                       (LETT |r2|
                                                             (SPADCALL |bv| 1
                                                                       (QREFELT
                                                                        $ 90))
                                                             . #10#)
                                                       (LETT |uv2|
                                                             (|RDEEFX;get_uv0|
                                                              (SPADCALL |tt|
                                                                        (QREFELT
                                                                         $ 61))
                                                              (CDR
                                                               (SPADCALL |bv|
                                                                         (QREFELT
                                                                          $
                                                                          122)))
                                                              |vlst1| |ulst1|
                                                              |k| |x| $)
                                                             . #10#)
                                                       (LETT |u2|
                                                             (SPADCALL
                                                              (QVELT |uv2| 0)
                                                              (SPADCALL |u0|
                                                                        |r2|
                                                                        (QREFELT
                                                                         $ 42))
                                                              (QREFELT $ 29))
                                                             . #10#)
                                                       (LETT |v2|
                                                             (QVELT |uv2| 1)
                                                             . #10#)
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
                                                                         $ 61))
                                                                       |u2|
                                                                       |v2|)
                                                               |res|)
                                                              . #10#)))))))))))))))))))))))
                   (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))))) 

(SDEFUN |RDEEFX;lin_args!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;lin_args|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT $ 43)) (|spadConstant| $ 30)
                      (QREFELT $ 41)))))) 

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
           ((SPADCALL
             (LETT |rv| (SPADCALL |eq1| (QREFELT $ 129))
                   . #1=(|RDEEFX;get_rational_solutions|))
             (|spadConstant| $ 130) (QREFELT $ 131))
            (COND
             ((SPADCALL |s1|
                        (SPADCALL (SPADCALL |eq1| (QREFELT $ 132))
                                  (QREFELT $ 133))
                        (QREFELT $ 134))
              (|error| "wrong format of solution 1"))
             (#2='T
              (SEQ (LETT |ru0| (SPADCALL |rv| (QREFELT $ 136)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |ru0| 1) NIL)
                          (#2#
                           (SEQ
                            (LETT |ru1| (SPADCALL (QCDR |ru0|) (QREFELT $ 139))
                                  . #1#)
                            (EXIT
                             (COND ((QEQCAR |ru1| 1) NIL)
                                   (#2#
                                    (SEQ
                                     (LETT |ru2|
                                           (SPADCALL (QCDR |ru1|)
                                                     (QREFELT $ 141))
                                           . #1#)
                                     (EXIT
                                      (COND ((QEQCAR |ru2| 1) NIL)
                                            (#2#
                                             (LIST (QCDR |ru2|)))))))))))))))))
           (#2#
            (SEQ
             (LETT |eq1p|
                   (SPADCALL (SPADCALL |eq1| (QREFELT $ 132)) (QREFELT $ 142))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL |s2| (SPADCALL |eq1p| (QREFELT $ 144))
                          (QREFELT $ 145))
                (|error| "wrong format of solution 2"))
               (#2#
                (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT $ 146)) . #1#)
                     (LETT |eq1f|
                           (SPADCALL
                            (SPADCALL |eq1p| |s1|
                                      (SPADCALL |k1| (QREFELT $ 40))
                                      (QREFELT $ 147))
                            (QREFELT $ 148))
                           . #1#)
                     (EXIT (SPADCALL |eq1f| |k1| (QREFELT $ 150))))))))))))) 

(SDEFUN |RDEEFX;F_to_FP|
        ((|p| F) (|ls| |List| (|Symbol|)) (|lk| |List| (|Kernel| F))
         ($ |Polynomial| F))
        (SPROG
         ((|pu1| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|pu| (|SparseUnivariatePolynomial| F)) (|s1| (|Symbol|))
          (|k1| (|Kernel| F)))
         (SEQ
          (COND ((NULL |lk|) (SPADCALL |p| (QREFELT $ 151)))
                ('T
                 (SEQ (LETT |k1| (|SPADfirst| |lk|) . #1=(|RDEEFX;F_to_FP|))
                      (LETT |s1| (|SPADfirst| |ls|) . #1#)
                      (LETT |pu|
                            (SPADCALL (SPADCALL |p| |k1| (QREFELT $ 153))
                                      (QREFELT $ 154))
                            . #1#)
                      (LETT |pu1|
                            (SPADCALL
                             (CONS #'|RDEEFX;F_to_FP!0| (VECTOR |lk| $ |ls|))
                             |pu| (QREFELT $ 161))
                            . #1#)
                      (EXIT (SPADCALL |pu1| |s1| (QREFELT $ 162))))))))) 

(SDEFUN |RDEEFX;F_to_FP!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls| $ |lk|)
          (LETT |ls| (QREFELT $$ 2) . #1=(|RDEEFX;F_to_FP|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|RDEEFX;F_to_FP| |c| (SPADCALL |ls| (QREFELT $ 155))
             (SPADCALL |lk| (QREFELT $ 157)) $))))) 

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
          (|val2eq| (|Polynomial| F)) (#1=#:G395 NIL) (|val1r| NIL)
          (|eq1| (|Equation| (|Fraction| (|Polynomial| F))))
          (|eq0p| (|Polynomial| F))
          (|eq0| (|Equation| (|Fraction| (|Polynomial| F)))) (#2=#:G394 NIL)
          (|sol0| NIL)
          (|lsol0|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
          (#3=#:G393 NIL) (|ci| NIL) (#4=#:G392 NIL)
          (|eqs0| (|List| (|Polynomial| F))) (#5=#:G391 NIL) (|eqi| NIL)
          (#6=#:G390 NIL) (|k2| #7=(|Kernel| F)) (|k1| #7#))
         (SEQ
          (LETT |k1| (SPADCALL |s1| (QREFELT $ 146))
                . #8=(|RDEEFX;solve_poly_eqs|))
          (LETT |k2| (SPADCALL |s2| (QREFELT $ 146)) . #8#)
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
                         (LETT #4# (CONS (SPADCALL |ci| (QREFELT $ 163)) #4#)
                               . #8#)))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (LIST |s2| |s1|) (QREFELT $ 167))
                . #8#)
          (LETT |res| NIL . #8#)
          (SEQ (LETT |sol0| NIL . #8#) (LETT #2# |lsol0| . #8#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sol0| (CAR #2#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |sol0|) 2 (QREFELT $ 54))
                   (|error| "wrong format of solution 0"))
                  ('T
                   (SEQ (LETT |eq0| (|SPADfirst| |sol0|) . #8#)
                        (LETT |eq0p|
                              (SPADCALL
                               (SPADCALL (SPADCALL |eq0| (QREFELT $ 132))
                                         (SPADCALL |eq0| (QREFELT $ 129))
                                         (QREFELT $ 168))
                               (QREFELT $ 142))
                              . #8#)
                        (LETT |eq1| (SPADCALL |sol0| (QREFELT $ 170)) . #8#)
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
                                                         (QREFELT $ 171))
                                               (QREFELT $ 147))
                                     . #8#)
                               (LETT |val2alg|
                                     (SPADCALL |val2eq| (QREFELT $ 172)) . #8#)
                               (EXIT
                                (LETT |res|
                                      (CONS (CONS |val1r| |val2alg|) |res|)
                                      . #8#)))
                              (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                              (EXIT NIL))))))))
               (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
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
          (|ap| (|SparseUnivariatePolynomial| F)) (#1=#:G425 NIL)
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
          (|ru| (|Union| (|Integer|) "failed")) (#3=#:G424 NIL) (|r0| NIL)
          (|degn1| (|NonNegativeInteger|)) (|degn| #4=(|NonNegativeInteger|))
          (|degd| #4#) (|ratl| (|List| (|Fraction| (|Integer|)))) (|eq1| (F))
          (|nnp| #2#) (#5=#:G423 NIL) (|sol| NIL) (|r_bad| (|Integer|))
          (|has_r_bad| (|Boolean|)) (|ccu| (|Union| (|Integer|) "failed"))
          (|cc| (F))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|eqs0| (|List| F)) (#6=#:G422 NIL) (|ci| NIL) (#7=#:G421 NIL)
          (|qq| (|SparseUnivariatePolynomial| F)) (|b| #8=(|Kernel| F))
          (|bs| #9=(|Symbol|)) (|a| #8#) (|as| #9#) (|u0| (F))
          (|ulst| (|List| F)) (|vlst| (|List| F)) (#10=#:G419 NIL) (|v| NIL)
          (#11=#:G420 NIL) (|u| NIL) (|kf| (F)))
         (SEQ (LETT |vlst| NIL . #12=(|RDEEFX;ei_args0|))
              (LETT |ulst| NIL . #12#)
              (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #12#)
              (SEQ (LETT |u| NIL . #12#) (LETT #11# |ulst0| . #12#)
                   (LETT |v| NIL . #12#) (LETT #10# |vlst0| . #12#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |v| (CAR #10#) . #12#) NIL)
                         (ATOM #11#) (PROGN (LETT |u| (CAR #11#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |kf| (QREFELT $ 110))
                       (SEQ (LETT |vlst| (CONS |v| |vlst|) . #12#)
                            (EXIT (LETT |ulst| (CONS |u| |ulst|) . #12#))))
                      ('T (LETT |u0| |u| . #12#)))))
                   (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #12#))
                         . #12#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |as| (SPADCALL (QREFELT $ 173)) . #12#)
              (LETT |a| (SPADCALL |as| (QREFELT $ 146)) . #12#)
              (LETT |bs| (SPADCALL (QREFELT $ 173)) . #12#)
              (LETT |b| (SPADCALL |bs| (QREFELT $ 146)) . #12#)
              (LETT |nn|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT $ 40)) 1
                                          (QREFELT $ 62))
                                (SPADCALL (SPADCALL |b| (QREFELT $ 40))
                                          (QREFELT $ 21))
                                (QREFELT $ 63))
                               |denf| (QREFELT $ 69))
                              (QREFELT $ 63))
                    . #12#)
              (LETT |qq| (SPADCALL |gd| |nn| (QREFELT $ 174)) . #12#)
              (LETT |eqs0|
                    (PROGN
                     (LETT #7# NIL . #12#)
                     (SEQ (LETT |ci| NIL . #12#)
                          (LETT #6# (SPADCALL |qq| (QREFELT $ 65)) . #12#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |ci| (CAR #6#) . #12#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |ci| (QREFELT $ 102))
                                             (QREFELT $ 15))
                                   #7#)
                                  . #12#)))
                          (LETT #6# (CDR #6#) . #12#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #12#)
              (LETT |lsol| (|RDEEFX;solve_poly_eqs| |eqs0| |as| |bs| $) . #12#)
              (LETT |has_r_bad| 'NIL . #12#) (LETT |r_bad| 0 . #12#)
              (COND
               ((>= (+ (SPADCALL |denf| (QREFELT $ 58)) 1)
                    (SPADCALL |nf| (QREFELT $ 58)))
                (COND
                 ((SPADCALL (+ (SPADCALL |denf| (QREFELT $ 58)) 1)
                            (SPADCALL |nf| (QREFELT $ 58)) (QREFELT $ 70))
                  (SEQ (LETT |has_r_bad| 'T . #12#)
                       (EXIT (LETT |r_bad| 0 . #12#))))
                 ('T
                  (SEQ
                   (LETT |cc|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 76))
                                    (SPADCALL |denf| (QREFELT $ 76))
                                    (QREFELT $ 60))
                          (QREFELT $ 61))
                         . #12#)
                   (LETT |ccu| (SPADCALL |cc| (QREFELT $ 112)) . #12#)
                   (EXIT
                    (COND
                     ((QEQCAR |ccu| 0)
                      (SEQ (LETT |has_r_bad| 'T . #12#)
                           (EXIT (LETT |r_bad| (QCDR |ccu|) . #12#)))))))))))
              (LETT |res| NIL . #12#)
              (SEQ (LETT |sol| NIL . #12#) (LETT #5# |lsol| . #12#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |sol| (CAR #5#) . #12#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ru| (SPADCALL (QCAR |sol|) (QREFELT $ 175)) . #12#)
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
                                   . #12#)
                             (EXIT
                              (COND ((QEQCAR |res1| 1) "iterate")
                                    ('T
                                     (LETT |res| (CONS (QCDR |res1|) |res|)
                                           . #12#)))))))))
                   (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
              (LETT |nnp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |nf| (QREFELT $ 176)) |denf|
                                (QREFELT $ 69))
                      (SPADCALL (SPADCALL |denf| (QREFELT $ 176)) |nf|
                                (QREFELT $ 69))
                      (QREFELT $ 177))
                     (SPADCALL (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 21))
                     (QREFELT $ 63))
                    . #12#)
              (LETT |eq1| (SPADCALL |nnp| |gd| (QREFELT $ 178)) . #12#)
              (LETT |ratl| (SPADCALL |eq1| |a| (QREFELT $ 150)) . #12#)
              (COND
               (|has_r_bad|
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |r_bad| (QREFELT $ 118)) |ratl|
                             (QREFELT $ 179)))
                  (LETT |ratl| (CONS (SPADCALL |r_bad| (QREFELT $ 118)) |ratl|)
                        . #12#)))))
              (LETT |degd| (SPADCALL |denf| (QREFELT $ 58)) . #12#)
              (LETT |degn| (SPADCALL |nf| (QREFELT $ 58)) . #12#)
              (LETT |degn1| (MAX |degn| (+ |degd| 1)) . #12#)
              (SEQ (LETT |r0| NIL . #12#) (LETT #3# |ratl| . #12#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |r0| (CAR #3#) . #12#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ru| (SPADCALL |r0| (QREFELT $ 175)) . #12#)
                        (EXIT
                         (COND ((QEQCAR |ru| 1) "iterate")
                               ('T
                                (SEQ (LETT |ri| (QCDR |ru|) . #12#)
                                     (LETT |nn|
                                           (SPADCALL |nf|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |ri|
                                                                 (QREFELT $
                                                                          28))
                                                       1 (QREFELT $ 62))
                                                      |denf| (QREFELT $ 69))
                                                     (QREFELT $ 63))
                                           . #12#)
                                     (LETT |res1l|
                                           (|RDEEFX;ei_args3| |gd| |nn| |denf|
                                            |k| |vlst| |ulst| |x| $)
                                           . #12#)
                                     (EXIT
                                      (SEQ (LETT |res1| NIL . #12#)
                                           (LETT #1# |res1l| . #12#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |res1| (CAR #1#)
                                                        . #12#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |ap| (QVELT |res1| 3) . #12#)
                                            (LETT |fac| (QVELT |res1| 0)
                                                  . #12#)
                                            (LETT |dega|
                                                  (COND
                                                   ((SPADCALL |ap|
                                                              (|spadConstant| $
                                                                              75)
                                                              (QREFELT $ 84))
                                                    1)
                                                   ('T
                                                    (SPADCALL |ap|
                                                              (QREFELT $ 58))))
                                                  . #12#)
                                            (LETT |vp| (QVELT |res1| 2) . #12#)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |fac| (QREFELT $ 58))
                                                (SPADCALL |degn1| |dega|
                                                          (QREFELT $ 180)))
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
                                                     . #12#)))))
                                           (LETT #1# (CDR #1#) . #12#)
                                           (GO G190) G191 (EXIT NIL))))))))
                   (LETT #3# (CDR #3#) . #12#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args1|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F) (|t| |Kernel| F)
         ($ |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
        (SPROG ((|r| (F)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 40)) |denf|
                                           (QREFELT $ 114))
                                 (QREFELT $ 63))
                       |gd| (QREFELT $ 178))
                      |RDEEFX;ei_args1|)
                (EXIT
                 (SPADCALL (SPADCALL |r| (QREFELT $ 102)) (QREFELT $ 105)))))) 

(SDEFUN |RDEEFX;ei_args2|
        ((|gd| |SparseUnivariatePolynomial| F)
         (|nf| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|f_res| |Factored| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|t| |Kernel| F) (|k| |Kernel| F) (|vlst| |List| F) (|ulst| |List| F)
         (|x| |Symbol|)
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
          (|f1| (|SparseUnivariatePolynomial| F)) (#2=#:G434 NIL) (|fac| NIL)
          (|degg| #1#) (|dummy| (|SingletonAsOrderedSet|))
          (|rfac|
           (|List|
            (|Record|
             (|:| |factor| (|SparseMultivariatePolynomial| R (|Kernel| F)))
             (|:| |exponent| (|Integer|)))))
          (|n1| (|Integer|)) (|log_case| (|Boolean|)))
         (SEQ
          (LETT |log_case| (SPADCALL |k| '|log| (QREFELT $ 38))
                . #3=(|RDEEFX;ei_args2|))
          (LETT |n1| 0 . #3#)
          (LETT |rfac| (SPADCALL |f_res| (QREFELT $ 109)) . #3#)
          (LETT |dummy| (SPADCALL (QREFELT $ 56)) . #3#) (LETT |res| NIL . #3#)
          (LETT |degg| (SPADCALL |gd| (QREFELT $ 58)) . #3#)
          (SEQ (LETT |fac| NIL . #3#) (LETT #2# |rfac| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |t| $) . #3#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 58)) . #3#)
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
         ((|f_res|
           (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|t| (|Kernel| F)))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 173)) (QREFELT $ 146))
                . #1=(|RDEEFX;ei_args3|))
          (LETT |f_res| (|RDEEFX;ei_args1| |gd| |nf| |denf| |t| $) . #1#)
          (EXIT
           (|RDEEFX;ei_args2| |gd| |nf| |denf| |f_res| |t| |k| |vlst| |ulst|
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
          (COND ((EQL (SPADCALL |gd| (QREFELT $ 58)) 0) NIL)
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
        ((|p| |SparseUnivariatePolynomial| F) (|n| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL |p| |n| (QREFELT $ 182))) 

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
                    (|:| |shift_part| F)))
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
                    (|:| |shift_part| F))))
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
         (SEQ
          (LETT |tt| (SPADCALL |tt| (QREFELT $ 61))
                . #1=(|RDEEFX;ei_candidate|))
          (LETT |nf1|
                (SPADCALL |nf| (SPADCALL |tt| |denf| (QREFELT $ 114))
                          (QREFELT $ 63))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |nf1| (QREFELT $ 83)) (|spadConstant| $ 75)
                       (QREFELT $ 82))
             |res|)
            (#2='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |nf1| (QREFELT $ 58)) 0 (QREFELT $ 106))
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
                                     (|spadConstant| $ 75)
                                     (SPADCALL |nf1| |denf| (QREFELT $ 183))
                                     (|spadConstant| $ 184) (QVELT |uv| 0)
                                     (QVELT |uv| 2) (QVELT |uv| 1))
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
                    (|:| |shift_part| F))))
        (SPROG
         ((|tt| (F)) (|a| (|Integer|)) (#1=#:G473 NIL)
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
                      (|:| |shift_part| F))))
          (|rdf| #2=(|SparseUnivariatePolynomial| F)) (|rnf| #2#)
          (|n2| #3=(|NonNegativeInteger|)) (|n1| #3#))
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
                    (LETT |n1| (SPADCALL |nf| (QREFELT $ 58)) . #4#)
                    (LETT |n2| (SPADCALL |denf| (QREFELT $ 58)) . #4#)
                    (LETT |rnf| (SPADCALL |nf| (QREFELT $ 83)) . #4#)
                    (LETT |rdf| (SPADCALL |denf| (QREFELT $ 83)) . #4#)
                    (EXIT
                     (COND
                      ((EQL |n1| |n2|)
                       (SEQ (LETT |tt| (SPADCALL |nf| (QREFELT $ 76)) . #4#)
                            (LETT |res|
                                  (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                   |ulst| |k| |x| |a| |tt| |res| $)
                                  . #4#)
                            (COND
                             ((SPADCALL |rdf| (|spadConstant| $ 75)
                                        (QREFELT $ 82))
                              (COND
                               ((EQL (SPADCALL |rdf| (QREFELT $ 58))
                                     (SPADCALL |rnf| (QREFELT $ 58)))
                                (EXIT
                                 (SEQ
                                  (LETT |tt|
                                        (SPADCALL
                                         (SPADCALL |rnf| (QREFELT $ 76))
                                         (SPADCALL |rdf| (QREFELT $ 76))
                                         (QREFELT $ 60))
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
                           ((SPADCALL |rdf| (|spadConstant| $ 75)
                                      (QREFELT $ 82))
                            (COND
                             ((EQL (SPADCALL |rdf| (QREFELT $ 58)) |n1|)
                              (EXIT
                               (SEQ
                                (LETT |tt|
                                      (SPADCALL (SPADCALL |nf| (QREFELT $ 76))
                                                (SPADCALL |rdf| (QREFELT $ 76))
                                                (QREFELT $ 60))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (COND
                         ((SPADCALL |n1| |n2| (QREFELT $ 70))
                          (COND
                           ((SPADCALL |rnf| (|spadConstant| $ 75)
                                      (QREFELT $ 82))
                            (COND
                             ((EQL (SPADCALL |rnf| (QREFELT $ 58)) |n2|)
                              (EXIT
                               (SEQ
                                (LETT |tt| (SPADCALL |rnf| (QREFELT $ 76))
                                      . #4#)
                                (EXIT
                                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                  |ulst| |k| |x| |a| |tt| |res| $))))))))))
                        (EXIT |res|)))))))
              ((SPADCALL (SPADCALL |nf| (QREFELT $ 58))
                         (+ (SPADCALL |denf| (QREFELT $ 58)) 1)
                         (QREFELT $ 106))
               NIL)
              (#5#
               (SEQ
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 38))
                  (COND
                   ((EQL (SPADCALL |nf| (QREFELT $ 58))
                         (+ (SPADCALL |denf| (QREFELT $ 58)) 1))
                    (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 76)) . #4#)
                         (LETT |rcu| (SPADCALL |lc| (QREFELT $ 112)) . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |rcu| 1)
                            (PROGN (LETT #1# NIL . #4#) (GO #6=#:G472)))
                           (#5#
                            (SEQ (LETT |a| (- (QCDR |rcu|)) . #4#)
                                 (EXIT
                                  (LETT |nf|
                                        (SPADCALL |nf|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |a|
                                                              (QREFELT $ 28))
                                                    1 (QREFELT $ 62))
                                                   |denf| (QREFELT $ 69))
                                                  (QREFELT $ 63))
                                        . #4#)))))))))))
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 58))
                       (SPADCALL |denf| (QREFELT $ 58)))
                  (LETT |tt| (SPADCALL |nf| (QREFELT $ 76)) . #4#)))
                (EXIT
                 (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst| |k| |x| |a|
                  |tt| NIL $))))))))
          #6# (EXIT #1#)))) 

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
                    (|:| |shift_part| F)))
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
                    (|:| |shift_part| F))))
        (SPROG
         ((|unf| (F))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (#1=#:G481 NIL) (|nf2| (|SparseUnivariatePolynomial| F))
          (#2=#:G491 NIL) (|e1| NIL) (#3=#:G492 NIL) (|fac1| NIL)
          (#4=#:G490 NIL) (|lexp1| (|List| (|NonNegativeInteger|)))
          (#5=#:G476 NIL) (#6=#:G489 NIL) (#7=#:G488 NIL) (|l1| (|Integer|))
          (|lexp| (|List| #8=(|Integer|))) (#9=#:G487 NIL) (#10=#:G486 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #8#)))))
         (SEQ
          (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 188))
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
                         (SPADCALL (ELT $ 69)
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
                                   (|spadConstant| $ 81) (QREFELT $ 191))
                         . #11#)
                   (LETT |gden1|
                         (COND ((EQL |gexp| 1) (|spadConstant| $ 81))
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
                                       (SPADCALL |fnf| (QREFELT $ 192))
                                       (QREFELT $ 193))
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
                                                      (QREFELT $ 183))
                                            (SPADCALL |nf2| |gden1|
                                                      (QREFELT $ 183))
                                            (QVELT |uv| 0) (QVELT |uv| 2)
                                            (QVELT |uv| 1))
                                    |res|))))))))))))))) 

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
                    (|:| |shift_part| F)))
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
                    (|:| |shift_part| F))))
        (SPROG
         ((|fnf| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|nf1| (|SparseUnivariatePolynomial| F)) (|tt| (F))
          (|deg1| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| F)) (#1=#:G507 NIL) (|fac| NIL)
          (|e_tt| (|List| F))
          (|rfacs|
           (|List|
            (|Record|
             (|:| |factor| (|SparseMultivariatePolynomial| R (|Kernel| F)))
             (|:| |exponent| (|Integer|)))))
          (|f_res|
           (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|r| (F)) (|nfp1| (|SparseUnivariatePolynomial| F))
          (|t| (|Kernel| F)))
         (SEQ
          (LETT |t| (SPADCALL (SPADCALL (QREFELT $ 173)) (QREFELT $ 146))
                . #2=(|RDEEFX;gammas1|))
          (LETT |nfp1|
                (SPADCALL
                 (SPADCALL (SPADCALL |nf| (QREFELT $ 176)) |denf1|
                           (QREFELT $ 69))
                 (SPADCALL
                  (SPADCALL (SPADCALL |gexp| (QREFELT $ 28)) |nf|
                            (QREFELT $ 114))
                  (SPADCALL |denf1| (QREFELT $ 176)) (QREFELT $ 69))
                 (QREFELT $ 177))
                . #2#)
          (LETT |r|
                (SPADCALL
                 (SPADCALL |nf|
                           (SPADCALL
                            (SPADCALL (SPADCALL |t| (QREFELT $ 40))
                                      (QREFELT $ 21))
                            |denf| (QREFELT $ 69))
                           (QREFELT $ 63))
                 |nfp1| (QREFELT $ 178))
                . #2#)
          (LETT |f_res|
                (SPADCALL (SPADCALL |r| (QREFELT $ 102)) (QREFELT $ 105))
                . #2#)
          (LETT |rfacs| (SPADCALL |f_res| (QREFELT $ 109)) . #2#)
          (LETT |e_tt|
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT $ 58)) 0)
                  (LIST (|spadConstant| $ 30)))
                 ((EQL (SPADCALL |nf| (QREFELT $ 58))
                       (SPADCALL |denf| (QREFELT $ 58)))
                  (SEQ
                   (LETT |tt|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT $ 76))
                                    (SPADCALL |denf| (QREFELT $ 76))
                                    (QREFELT $ 60))
                          (QREFELT $ 61))
                         . #2#)
                   (LETT |nf1|
                         (SPADCALL |nf|
                                   (SPADCALL (SPADCALL |tt| (QREFELT $ 21))
                                             |denf| (QREFELT $ 69))
                                   (QREFELT $ 63))
                         . #2#)
                   (EXIT
                    (COND ((EQL (SPADCALL |nf1| (QREFELT $ 58)) 0) (LIST |tt|))
                          (#3='T NIL)))))
                 (#3# NIL))
                . #2#)
          (COND
           ((NULL (NULL |e_tt|))
            (SEQ (LETT |tt| (|SPADfirst| |e_tt|) . #2#)
                 (LETT |nf1|
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |tt| (QREFELT $ 21))
                                           |denf| (QREFELT $ 69))
                                 (QREFELT $ 63))
                       . #2#)
                 (LETT |fnf| (SPADCALL |nf1| NIL (QREFELT $ 197)) . #2#)
                 (EXIT
                  (LETT |res|
                        (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf| |denf1|
                         |gexp| |a| |tt| (|spadConstant| $ 75) |vlst| |ulst|
                         |k| |x| |res| $)
                        . #2#)))))
          (SEQ (LETT |fac| NIL . #2#) (LETT #1# |rfacs| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |f1| (|RDEEFX;P_to_UP| (QCAR |fac|) |t| $) . #2#)
                    (LETT |deg1| (SPADCALL |f1| (QREFELT $ 58)) . #2#)
                    (EXIT
                     (COND
                      ((EQL |deg1| 1)
                       (SEQ
                        (LETT |tt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f1| 0 (QREFELT $ 59))
                                         (SPADCALL |f1| 1 (QREFELT $ 59))
                                         (QREFELT $ 60))
                               (QREFELT $ 61))
                              . #2#)
                        (LETT |nf1|
                              (SPADCALL |nf|
                                        (SPADCALL
                                         (SPADCALL |tt| (QREFELT $ 21)) |denf|
                                         (QREFELT $ 69))
                                        (QREFELT $ 63))
                              . #2#)
                        (EXIT
                         (COND
                          ((< (SPADCALL 2 (QCDR |fac|) (QREFELT $ 199))
                              (SPADCALL |nf1| (QREFELT $ 58)))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |fnf| (SPADCALL |nf1| (QREFELT $ 201)) . #2#)
                            (EXIT
                             (LETT |res|
                                   (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                                    |denf1| |gexp| |a| |tt|
                                    (|spadConstant| $ 75) |vlst| |ulst| |k| |x|
                                    |res| $)
                                   . #2#))))))))
                      ((OR (< (QCDR |fac|) |n2|) 'T) "iterate"))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

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
                    (|:| |shift_part| F))))
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
                      (|:| |shift_part| F))))
          (|nn| #1=(|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")) (#2=#:G531 NIL) (|sol| NIL)
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|f_res1| (F)) (|tx_plus_b| #1#) (|bk| #3=(|Kernel| F))
          (|bs| #4=(|Symbol|)) (#5=#:G530 NIL) (|r0| NIL)
          (|ratl| (|List| (|Fraction| (|Integer|))))
          (|nnp2| (|SparseUnivariatePolynomial| F))
          (|t3| #6=(|SparseUnivariatePolynomial| F)) (|t2| #6#) (|ct1| (F))
          (|t1| #6#) (|denf2| (|SparseUnivariatePolynomial| F))
          (|denfp2| #7=(|SparseUnivariatePolynomial| F)) (|nfp2| #7#)
          (|nnp| #1#) (|denfp1| #7#) (|nfp1| #7#) (|t| #3#) (|ts| #4#)
          (|n4| (|Integer|)) (|l| (|Integer|)) (|n3| (|NonNegativeInteger|))
          (|n1| #8=(|NonNegativeInteger|)) (|a| (|Integer|)) (#9=#:G529 NIL)
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F)) (|n2| #8#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res1|
                  (|RDEEFX;special_ei_candidates| |nf| |denf| |vlst| |ulst| |k|
                   |x| $)
                  . #10=(|RDEEFX;special_candidates|))
            (LETT |a| 0 . #10#)
            (LETT |n1| (SPADCALL |nf| (QREFELT $ 58)) . #10#)
            (LETT |n2| (SPADCALL |denf| (QREFELT $ 58)) . #10#)
            (EXIT
             (COND ((EQL |n1| 1) |res1|)
                   (#11='T
                    (SEQ
                     (COND
                      ((EQL |n1| (+ |n2| 1))
                       (COND
                        ((NULL (SPADCALL |k| '|log| (QREFELT $ 38)))
                         (PROGN (LETT #9# |res1| . #10#) (GO #12=#:G528)))
                        ('T
                         (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT $ 76)) . #10#)
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
                                                        1 (QREFELT $ 62))
                                                       |denf| (QREFELT $ 69))
                                                      (QREFELT $ 177))
                                            . #10#)
                                      (EXIT (LETT |n1| |n2| . #10#)))))))))))
                     (LETT |n3| (MAX |n1| |n2|) . #10#)
                     (LETT |l| (GCD |gexp| |n3|) . #10#)
                     (EXIT
                      (COND ((EQL |l| 1) |res1|)
                            (#11#
                             (SEQ
                              (LETT |n4| (- |n3| (QUOTIENT2 |n3| 2)) . #10#)
                              (LETT |ts| (SPADCALL (QREFELT $ 173)) . #10#)
                              (LETT |t| (SPADCALL |ts| (QREFELT $ 146)) . #10#)
                              (LETT |nfp1| (SPADCALL |nf| (QREFELT $ 176))
                                    . #10#)
                              (LETT |denfp1| (SPADCALL |denf1| (QREFELT $ 176))
                                    . #10#)
                              (COND
                               ((SPADCALL |n1| |n2| (QREFELT $ 70))
                                (COND
                                 ((SPADCALL |k| '|log| (QREFELT $ 38))
                                  (EXIT
                                   (SEQ
                                    (LETT |nnp|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |nfp1| |denf1|
                                                      (QREFELT $ 69))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |gexp| (QREFELT $ 28))
                                              |denfp1| (QREFELT $ 114))
                                             |nf| (QREFELT $ 69))
                                            (QREFELT $ 177))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |t| (QREFELT $ 40))
                                              (QREFELT $ 21))
                                             |denf| (QREFELT $ 69))
                                            |denf1| (QREFELT $ 69))
                                           (QREFELT $ 63))
                                          . #10#)
                                    (EXIT
                                     (COND
                                      ((ODDP |l|)
                                       (SEQ
                                        (LETT |nfp2|
                                              (SPADCALL |nfp1| (QREFELT $ 176))
                                              . #10#)
                                        (LETT |denfp2|
                                              (SPADCALL |denfp1|
                                                        (QREFELT $ 176))
                                              . #10#)
                                        (LETT |denf2|
                                              (SPADCALL |denf1| |denf1|
                                                        (QREFELT $ 69))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 2 |gexp|
                                                          (QREFELT $ 199))
                                                (QREFELT $ 28))
                                               |denfp1| (QREFELT $ 114))
                                              . #10#)
                                        (LETT |t1|
                                              (SPADCALL
                                               (SPADCALL |t1| |nfp1|
                                                         (QREFELT $ 69))
                                               |denf1| (QREFELT $ 69))
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
                                                         (QREFELT $ 69))
                                               |nf| (QREFELT $ 69))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |gexp| (QREFELT $ 28))
                                               |denfp2| (QREFELT $ 114))
                                              . #10#)
                                        (LETT |t3|
                                              (SPADCALL
                                               (SPADCALL |t3| |nf|
                                                         (QREFELT $ 69))
                                               |denf1| (QREFELT $ 69))
                                              . #10#)
                                        (LETT |nnp2|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |nfp2| |denf2|
                                                           (QREFELT $ 69))
                                                 |t1| (QREFELT $ 177))
                                                |t2| (QREFELT $ 63))
                                               |t3| (QREFELT $ 177))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp| |nnp2|
                                                        (QREFELT $ 178))
                                              . #10#)
                                        (LETT |ratl|
                                              (SPADCALL |f_res1| |t|
                                                        (QREFELT $ 150))
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
                                                              (QREFELT $ 175))
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
                                                                             62))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            69))
                                                                  (QREFELT $
                                                                           63))
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
                                        (LETT |bs| (SPADCALL (QREFELT $ 173))
                                              . #10#)
                                        (LETT |bk|
                                              (SPADCALL |bs| (QREFELT $ 146))
                                              . #10#)
                                        (LETT |tx_plus_b|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |t| (QREFELT $ 40)) 1
                                                (QREFELT $ 62))
                                               (SPADCALL
                                                (SPADCALL |bk| (QREFELT $ 40))
                                                (QREFELT $ 21))
                                               (QREFELT $ 63))
                                              . #10#)
                                        (LETT |f_res1|
                                              (SPADCALL |nnp|
                                                        (SPADCALL |nf|
                                                                  (SPADCALL
                                                                   |tx_plus_b|
                                                                   |denf|
                                                                   (QREFELT $
                                                                            69))
                                                                  (QREFELT $
                                                                           63))
                                                        (QREFELT $ 178))
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
                                                              (QREFELT $ 175))
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
                                                                             62))
                                                                   |denf|
                                                                   (QREFELT $
                                                                            69))
                                                                  (QREFELT $
                                                                           63))
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
        ((|rr1f| F) (|a1p| F) (|vs| |Vector| F) (|as| |Vector| F)
         (|scands|
          . #1=(|List|
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
                          (|:| |shift_part| F))))
         (|denf| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|cand_prims| (|List| F)) (|ansp| (F)) (|scands1| #1#)
          (#2=#:G544 NIL) (|i| NIL) (|csol| (|Vector| F))
          (|csolu| (|Union| (|Vector| F) "failed")))
         (SEQ
          (LETT |csolu|
                (SPADCALL |vs| |rr1f|
                          (LIST
                           (CONS #'|RDEEFX;finish_special_integrate!0|
                                 (VECTOR $ |x|)))
                          (QREFELT $ 206))
                . #3=(|RDEEFX;finish_special_integrate|))
          (EXIT
           (COND
            ((QEQCAR |csolu| 1)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 30)
                     (|spadConstant| $ 30) 'NIL))
            ('T
             (SEQ (LETT |csol| (QCDR |csolu|) . #3#)
                  (LETT |scands1| |scands| . #3#) (LETT |cand_prims| NIL . #3#)
                  (LETT |ansp| (|spadConstant| $ 30) . #3#)
                  (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |vs|) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((NULL |cand_prims|)
                          (SEQ
                           (LETT |cand_prims|
                                 (|RDEEFX;get_prims| (|SPADfirst| |scands1|)
                                  |denf| |denf| |gexp| |k| $)
                                 . #3#)
                           (EXIT (LETT |scands1| (CDR |scands1|) . #3#)))))
                        (LETT |a1p|
                              (SPADCALL |a1p|
                                        (SPADCALL
                                         (SPADCALL |csol| |i| (QREFELT $ 207))
                                         (SPADCALL |as| |i| (QREFELT $ 207))
                                         (QREFELT $ 29))
                                        (QREFELT $ 34))
                              . #3#)
                        (LETT |ansp|
                              (SPADCALL |ansp|
                                        (SPADCALL
                                         (SPADCALL |csol| |i| (QREFELT $ 207))
                                         (|SPADfirst| |cand_prims|)
                                         (QREFELT $ 29))
                                        (QREFELT $ 26))
                              . #3#)
                        (EXIT (LETT |cand_prims| (CDR |cand_prims|) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (VECTOR |a1p| |rr1f| |ansp| 'T))))))))) 

(SDEFUN |RDEEFX;finish_special_integrate!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX;finish_special_integrate|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |x| (QREFELT $ 43)))))) 

(SDEFUN |RDEEFX;exp_lower_bound|
        ((|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|scoeffs| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|f| F) (|g| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         ($ |Integer|))
        (SPROG
         ((|max_deg1| (|Integer|)) (|c0| (F))
          (|order_a| (|NonNegativeInteger|)) (|twr| (|List| (|Kernel| F)))
          (#1=#:G560 NIL) (|kk| NIL) (#2=#:G559 NIL)
          (|ftwr| (|List| (|Kernel| F))) (|min_deg| (|Integer|))
          (|max_deg| (|Integer|)) (|c_degs| (|List| (|NonNegativeInteger|)))
          (#3=#:G558 NIL) (|scoeff| NIL) (#4=#:G557 NIL))
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
                               (SPADCALL (SPADCALL |scoeff| (QREFELT $ 208))
                                         (QREFELT $ 58))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |c_degs|
                (CONS
                 (SPADCALL (SPADCALL |rr1| (QREFELT $ 208)) (QREFELT $ 58))
                 |c_degs|)
                . #5#)
          (LETT |max_deg| (SPADCALL (ELT $ 209) |c_degs| (QREFELT $ 212))
                . #5#)
          (LETT |min_deg| (SPADCALL |nfp| (QREFELT $ 213)) . #5#)
          (LETT |ftwr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 215))
                          (SPADCALL |g| (QREFELT $ 215)) (QREFELT $ 217))
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
          (LETT |order_a| (SPADCALL |denfp| (QREFELT $ 213)) . #5#)
          (LETT |c0|
                (SPADCALL
                 (SPADCALL (SPADCALL |nfp| |order_a| (QREFELT $ 59))
                           (SPADCALL |denfp| |order_a| (QREFELT $ 59))
                           (QREFELT $ 60))
                 (QREFELT $ 61))
                . #5#)
          (LETT |max_deg1|
                (SPADCALL |twr| |ftwr| |c0| (- |min_deg| |order_a|)
                          (- (- |max_deg|) |order_a|) |x| |k| |lim|
                          (QREFELT $ 223))
                . #5#)
          (EXIT (MAX 0 (- (+ |max_deg1| |order_a|))))))) 

(SDEFUN |RDEEFX;exp_upper_bound|
        ((|nfp| |SparseUnivariatePolynomial| F)
         (|denfp| |SparseUnivariatePolynomial| F)
         (|scoeffs| |List| (|SparseUnivariatePolynomial| F)) (|f| F) (|g| F)
         (|k| |Kernel| F) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         ($ |Integer|))
        (SPROG
         ((|c0| (F)) (|twr| (|List| (|Kernel| F))) (#1=#:G576 NIL) (|kk| NIL)
          (#2=#:G575 NIL) (|ftwr| (|List| (|Kernel| F))) (|c_deg| (|Integer|))
          (|c_degs| (|List| (|NonNegativeInteger|))) (#3=#:G574 NIL)
          (|scoeff| NIL) (#4=#:G573 NIL))
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
                        (LETT #4# (CONS (SPADCALL |scoeff| (QREFELT $ 58)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |c_deg| (SPADCALL (ELT $ 209) |c_degs| (QREFELT $ 212)) . #5#)
          (LETT |ftwr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 215))
                          (SPADCALL |g| (QREFELT $ 215)) (QREFELT $ 217))
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
                 (SPADCALL (SPADCALL |nfp| (QREFELT $ 76))
                           (SPADCALL |denfp| (QREFELT $ 76)) (QREFELT $ 60))
                 (QREFELT $ 61))
                . #5#)
          (EXIT
           (SPADCALL |twr| |ftwr| |c0| (SPADCALL |denfp| (QREFELT $ 58))
                     (SPADCALL |nfp| (QREFELT $ 58)) |c_deg| |x| |k| |lim|
                     (QREFELT $ 224)))))) 

(SDEFUN |RDEEFX;special_integrate2|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| F))
         (|denfp| |SparseUnivariatePolynomial| F)
         (|denf| |SparseUnivariatePolynomial| F)
         (|ndenf| |SparseUnivariatePolynomial| F) (|f| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|a1| F) (|r1| F) (|g| F)
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
                    (|:| |shift_part| F)))
         (|gexp| |Integer|)
         (|deriv| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|a1p| (F)) (|rr1f| (F))
          (|ac1| (|Fraction| (|SparseUnivariatePolynomial| F))) (#2=#:G609 NIL)
          (|rsol| NIL) (#3=#:G610 NIL) (|c_an| NIL) (#4=#:G611 NIL) (|i| NIL)
          (|as| #5=(|Vector| F)) (|vs| #5#)
          (|rsols|
           (|List|
            (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
          (#6=#:G598 NIL) (|max_deg| (|Integer|))
          (|lc| (|List| (|SparseUnivariatePolynomial| F)))
          (|specp1| (|SparseUnivariatePolynomial| F))
          (|pscoeffs| (|List| (|SparseUnivariatePolynomial| F)))
          (#7=#:G608 NIL) (|nscoeff| NIL) (#8=#:G607 NIL) (|inv_den1| (F))
          (|inv_den| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|nfp1| #1#) (|ak| (F))
          (|nscoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#9=#:G606 NIL) (#10=#:G605 NIL)
          (|mm| (|SparseUnivariatePolynomial| F)) (#11=#:G588 NIL)
          (|neg_deg| (|Integer|))
          (|c_ans| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|her|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#12=#:G604 NIL) (|scoeff| NIL))
         (SEQ (LETT |nscoeffs| NIL . #13=(|RDEEFX;special_integrate2|))
              (LETT |c_ans| NIL . #13#)
              (SEQ (LETT |scoeff| NIL . #13#) (LETT #12# |scoeffs| . #13#) G190
                   (COND
                    ((OR (ATOM #12#)
                         (PROGN (LETT |scoeff| (CAR #12#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |her|
                          (|RDEEFX;special_Hermite| |scoeff| |nfp| |ndenf|
                           |denfp| |deriv| $)
                          . #13#)
                    (LETT |nscoeffs|
                          (CONS (SPADCALL |denfp| (QCDR |her|) (QREFELT $ 225))
                                |nscoeffs|)
                          . #13#)
                    (EXIT (LETT |c_ans| (CONS (QCAR |her|) |c_ans|) . #13#)))
                   (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
              (LETT |rr1| (SPADCALL |denfp| |rr1| (QREFELT $ 225)) . #13#)
              (LETT |nscoeffs| (NREVERSE |nscoeffs|) . #13#)
              (LETT |c_ans| (NREVERSE |c_ans|) . #13#)
              (LETT |neg_deg|
                    (COND
                     ((SPADCALL |k| '|exp| (QREFELT $ 38))
                      (|RDEEFX;exp_lower_bound| |nfp| |denfp| |rr1| |nscoeffs|
                       |f| |g| |k| |x| |lim| $))
                     ('T 0))
                    . #13#)
              (LETT |nfp1| |nfp| . #13#)
              (LETT |inv_den1| (|spadConstant| $ 35) . #13#)
              (LETT |inv_den| (|spadConstant| $ 124) . #13#)
              (LETT |pscoeffs| NIL . #13#)
              (COND
               ((SPADCALL |neg_deg| 0 (QREFELT $ 106))
                (SEQ
                 (LETT |mm|
                       (SPADCALL (|spadConstant| $ 35)
                                 (PROG1 (LETT #11# |neg_deg| . #13#)
                                   (|check_subtype2| (>= #11# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #11#))
                                 (QREFELT $ 62))
                       . #13#)
                 (LETT |nscoeffs|
                       (PROGN
                        (LETT #10# NIL . #13#)
                        (SEQ (LETT |nscoeff| NIL . #13#)
                             (LETT #9# |nscoeffs| . #13#) G190
                             (COND
                              ((OR (ATOM #9#)
                                   (PROGN
                                    (LETT |nscoeff| (CAR #9#) . #13#)
                                    NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #10#
                                     (CONS
                                      (SPADCALL |mm| |nscoeff| (QREFELT $ 225))
                                      #10#)
                                     . #13#)))
                             (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                             (EXIT (NREVERSE #10#))))
                       . #13#)
                 (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 225)) . #13#)
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 226)) 1
                                 (QREFELT $ 227))
                       . #13#)
                 (LETT |nfp1|
                       (SPADCALL |nfp|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |neg_deg| (QREFELT $ 28))
                                    (SPADCALL |ak| |x| (QREFELT $ 43))
                                    (QREFELT $ 29))
                                   (QREFELT $ 21))
                                  |denfp| (QREFELT $ 69))
                                 (QREFELT $ 177))
                       . #13#)
                 (LETT |inv_den|
                       (SPADCALL (|spadConstant| $ 124)
                                 (SPADCALL |mm| (QREFELT $ 99))
                                 (QREFELT $ 228))
                       . #13#)
                 (EXIT
                  (LETT |inv_den1| (SPADCALL |inv_den| |k| (QREFELT $ 101))
                        . #13#)))))
              (LETT |pscoeffs|
                    (PROGN
                     (LETT #8# NIL . #13#)
                     (SEQ (LETT |nscoeff| NIL . #13#)
                          (LETT #7# |nscoeffs| . #13#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |nscoeff| (CAR #7#) . #13#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |nscoeff| (QREFELT $ 229))
                                        #8#)
                                  . #13#)))
                          (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #13#)
              (LETT |specp1| (SPADCALL |rr1| (QREFELT $ 229)) . #13#)
              (LETT |lc| (CONS |specp1| |pscoeffs|) . #13#)
              (LETT |max_deg|
                    (|RDEEFX;exp_upper_bound| |nfp1| |denfp| |lc| |f| |g| |k|
                     |x| |lim| $)
                    . #13#)
              (LETT |rsols|
                    (PROG2
                        (LETT #6#
                              (SPADCALL |denfp| |nfp1| |lc| |max_deg| |deriv|
                                        (QREFELT $ 235))
                              . #13#)
                        (QCDR #6#)
                      (|check_union2| (QEQCAR #6# 0)
                                      (|List|
                                       (|Record|
                                        (|:| |ans|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                        (|:| |remainder|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))))
                                      (|Union|
                                       (|List|
                                        (|Record|
                                         (|:| |ans|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7)))
                                         (|:| |remainder|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7)))))
                                       (|Record|
                                        (|:| |ans|
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))))
                                        (|:| |acoeff|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                        (|:| |eegen|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                        (|:| |bpar|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                        (|:| |lcpar|
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))))
                                        (|:| |dpar| (|Integer|))))
                                      #6#))
                    . #13#)
              (LETT |vs| (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                    . #13#)
              (LETT |as| (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| $ 30))
                    . #13#)
              (SEQ (LETT |i| 1 . #13#) (LETT #4# (QVSIZE |vs|) . #13#)
                   (LETT |c_an| NIL . #13#) (LETT #3# |c_ans| . #13#)
                   (LETT |rsol| NIL . #13#) (LETT #2# (CDR |rsols|) . #13#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rsol| (CAR #2#) . #13#) NIL)
                         (ATOM #3#) (PROGN (LETT |c_an| (CAR #3#) . #13#) NIL)
                         (|greater_SI| |i| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |ac1|
                          (SPADCALL |c_an|
                                    (SPADCALL |inv_den|
                                              (SPADCALL (QCAR |rsol|)
                                                        (QREFELT $ 99))
                                              (QREFELT $ 236))
                                    (QREFELT $ 237))
                          . #13#)
                    (SPADCALL |as| |i| (SPADCALL |ac1| |k| (QREFELT $ 101))
                              (QREFELT $ 238))
                    (EXIT
                     (SPADCALL |vs| |i|
                               (SPADCALL
                                (SPADCALL (QCDR |rsol|) (QREFELT $ 99)) |k|
                                (QREFELT $ 101))
                               (QREFELT $ 238))))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #3#
                                 (PROG1 (CDR #3#)
                                   (LETT |i| (|inc_SI| |i|) . #13#))
                                 . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |rr1f|
                    (SPADCALL
                     (SPADCALL (QCDR (|SPADfirst| |rsols|)) (QREFELT $ 99)) |k|
                     (QREFELT $ 101))
                    . #13#)
              (LETT |a1p|
                    (SPADCALL |inv_den1|
                              (SPADCALL
                               (SPADCALL (QCAR (|SPADfirst| |rsols|))
                                         (QREFELT $ 99))
                               |k| (QREFELT $ 101))
                              (QREFELT $ 29))
                    . #13#)
              (EXIT
               (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs| |as|
                |scands| |denf| |gexp| |k| |x| $))))) 

(SDEFUN |RDEEFX;do_spde1|
        ((|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|nfp| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|def_f| (F)) (|af| (F)) (|r2| (|SparseUnivariatePolynomial| F))
          (|a1| #1=(|SparseUnivariatePolynomial| F))
          (|res1| (|Record| (|:| |ans| #1#) (|:| |nosol| (|Boolean|))))
          (|maxd| (|Integer|)) (|spec1p| (|SparseUnivariatePolynomial| F))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 240))
                . #2=(|RDEEFX;do_spde1|))
          (EXIT
           (COND ((QEQCAR |spec1u| 1) (|error| "impossible 7"))
                 (#3='T
                  (SEQ (LETT |spec1p| (QCDR |spec1u|) . #2#)
                       (LETT |maxd|
                             (- (SPADCALL |spec1p| (QREFELT $ 58))
                                (SPADCALL |nfp| (QREFELT $ 58)))
                             . #2#)
                       (LETT |res1|
                             (SPADCALL |nfp| |spec1p| |maxd| |der|
                                       (QREFELT $ 243))
                             . #2#)
                       (LETT |a1| (QCAR |res1|) . #2#)
                       (LETT |r2|
                             (SPADCALL (SPADCALL |a1| |der|)
                                       (SPADCALL |nfp| |a1| (QREFELT $ 69))
                                       (QREFELT $ 63))
                             . #2#)
                       (LETT |af|
                             (SPADCALL (SPADCALL |a1| (QREFELT $ 99)) |k|
                                       (QREFELT $ 101))
                             . #2#)
                       (LETT |def_f|
                             (SPADCALL
                              (SPADCALL |rr1| (SPADCALL |r2| (QREFELT $ 99))
                                        (QREFELT $ 244))
                              |k| (QREFELT $ 101))
                             . #2#)
                       (EXIT
                        (VECTOR |af| |def_f|
                                (COND ((QCDR |res1|) 'NIL) (#3# 'T))))))))))) 

(SDEFUN |RDEEFX;special_integrate1|
        ((|nfp| . #1=(|SparseUnivariatePolynomial| F)) (|f| F) (|k| |Kernel| F)
         (|x| |Symbol|) (|rr1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|a1| F) (|r1| F) (|g| F) (|ansp| F)
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
                    (|:| |shift_part| F)))
         (|gexp| |Integer|)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
          (#2=#:G642 NIL) (|scoeff| NIL) (#3=#:G643 NIL) (|i| NIL)
          (|as| #4=(|Vector| F)) (|vs| #4#) (|rr1f| (F)) (|a1p| (F))
          (|inv_den1| (F)) (|nfp1| #1#) (|ak| (F)) (#5=#:G641 NIL)
          (#6=#:G640 NIL) (|mm| (|SparseUnivariatePolynomial| F))
          (#7=#:G629 NIL) (|neg_deg| (|Integer|)))
         (SEQ
          (LETT |neg_deg|
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 38))
                  (|RDEEFX;exp_lower_bound| |nfp| (|spadConstant| $ 81) |rr1|
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
                             (QREFELT $ 62))
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
                                 (CONS (SPADCALL |mm| |scoeff| (QREFELT $ 225))
                                       #6#)
                                 . #9#)))
                         (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #9#)
             (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT $ 225)) . #9#)
             (LETT |ak|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 226)) 1 (QREFELT $ 227))
                   . #9#)
             (LETT |nfp1|
                   (SPADCALL |nfp|
                             (SPADCALL
                              (SPADCALL (SPADCALL |neg_deg| (QREFELT $ 28))
                                        (SPADCALL |ak| |x| (QREFELT $ 43))
                                        (QREFELT $ 29))
                              (QREFELT $ 21))
                             (QREFELT $ 177))
                   . #9#)
             (EXIT
              (LETT |inv_den1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 124)
                               (SPADCALL |mm| (QREFELT $ 99)) (QREFELT $ 228))
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
                                  (QREFELT $ 238))
                        (EXIT
                         (SPADCALL |vs| |i| (QVELT |res2| 1) (QREFELT $ 238))))
                       (LETT #2#
                             (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res3|
                        (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs|
                         |as| |scands| (|spadConstant| $ 81) |gexp| |k| |x| $)
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
        ((|nf| |SparseUnivariatePolynomial| F)
         (|nfp| |SparseUnivariatePolynomial| F)
         (|rr1| |Fraction| (|SparseUnivariatePolynomial| F)) (|a1| F) (|g| F)
         (|ansp| F)
         (|derivation| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|vlst| |List| F) (|ulst| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|f| (F))
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
                      (|:| |shift_part| F))))
          (|nn| (|SparseUnivariatePolynomial| F)) (|ri| (|Integer|))
          (|rcu| (|Union| (|Integer|) #1="failed")) (#2=#:G742 NIL)
          (|sol0| (|Vector| (|Fraction| (|Integer|)))) (#3=#:G715 NIL)
          (|sol_rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) #4="failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|vecf| (|Vector| F)) (#5=#:G754 NIL) (|v| NIL) (#6=#:G753 NIL)
          (|lv| (|List| F)) (|c2| (F)) (|c1| (F)) (|c0| (F)) (|r4| (F))
          (|ulst1| (|List| F)) (|vlst1| (|List| F)) (#7=#:G751 NIL)
          (#8=#:G752 NIL) (|u| NIL) (|phi| (F)) (|piv| (F)) (|kf| (F))
          (|unG| (R)) (G (F))
          (|G_num| #9=(|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|G_den| #9#)
          (|fl2| (|List| #10=(|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#11=#:G667 NIL) (#12=#:G750 NIL) (|fac| NIL) (#13=#:G749 NIL)
          (|fl1| (|List| #10#)) (#14=#:G665 NIL) (#15=#:G748 NIL)
          (#16=#:G747 NIL)
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
          (#17=#:G746 NIL) (#18=#:G745 NIL) (#19=#:G744 NIL) (#20=#:G743 NIL)
          (|f_numr|
           #21=(|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|f_denr| #21#) (|t| (F)) (|s| (F)) (|r| (F)) (|r1| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|res2|
           (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                     (|:| |nosol| (|Boolean|))))
          (|maxd| (|Integer|))
          (|spec1u| (|Union| (|SparseUnivariatePolynomial| F) #1#)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |spec1u| (SPADCALL |rr1| (QREFELT $ 240))
                  . #22=(|RDEEFX;quadratic_log_erf_integrate|))
            (EXIT
             (COND ((QEQCAR |spec1u| 1) (|error| "impossible 10"))
                   (#23='T
                    (SEQ (LETT |spec1p| (QCDR |spec1u|) . #22#)
                         (LETT |maxd|
                               (- (SPADCALL |spec1p| (QREFELT $ 58))
                                  (SPADCALL |nfp| (QREFELT $ 58)))
                               . #22#)
                         (LETT |res2|
                               (SPADCALL |nfp| |spec1p| |maxd| |derivation|
                                         (QREFELT $ 243))
                               . #22#)
                         (LETT |a1|
                               (SPADCALL |a1|
                                         (SPADCALL
                                          (SPADCALL (QCAR |res2|)
                                                    (QREFELT $ 99))
                                          |k| (QREFELT $ 101))
                                         (QREFELT $ 26))
                               . #22#)
                         (COND
                          ((NULL (QCDR |res2|))
                           (EXIT
                            (PROGN
                             (LETT #2# (VECTOR |a1| |g| |ansp| 'T) . #22#)
                             (GO #24=#:G741)))))
                         (LETT |spec1p|
                               (SPADCALL
                                (SPADCALL |spec1p|
                                          (SPADCALL (QCAR |res2|) |derivation|)
                                          (QREFELT $ 177))
                                (SPADCALL |nfp| (QCAR |res2|) (QREFELT $ 69))
                                (QREFELT $ 177))
                               . #22#)
                         (EXIT
                          (COND
                           ((>= (SPADCALL |spec1p| (QREFELT $ 58))
                                (SPADCALL |nfp| (QREFELT $ 58)))
                            (|error| "impossible 8"))
                           (#23#
                            (SEQ
                             (LETT |r1|
                                   (SPADCALL |g|
                                             (SPADCALL
                                              (SPADCALL |spec1p|
                                                        (QREFELT $ 99))
                                              |k| (QREFELT $ 101))
                                             (QREFELT $ 34))
                                   . #22#)
                             (LETT |r| (SPADCALL |nf| (QREFELT $ 76)) . #22#)
                             (LETT |s| (SPADCALL |nf| 1 (QREFELT $ 59)) . #22#)
                             (LETT |t| (SPADCALL |nf| 0 (QREFELT $ 59)) . #22#)
                             (LETT |f_denr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 245))
                                             (QREFELT $ 105))
                                   . #22#)
                             (LETT |f_numr|
                                   (SPADCALL (SPADCALL |r| (QREFELT $ 102))
                                             (QREFELT $ 105))
                                   . #22#)
                             (LETT |fl1|
                                   (PROGN
                                    (LETT #20# NIL . #22#)
                                    (SEQ (LETT |fac| NIL . #22#)
                                         (LETT #19#
                                               (SPADCALL |f_denr|
                                                         (QREFELT $ 109))
                                               . #22#)
                                         G190
                                         (COND
                                          ((OR (ATOM #19#)
                                               (PROGN
                                                (LETT |fac| (CAR #19#) . #22#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #20#
                                                   (CONS (QCAR |fac|) #20#)
                                                   . #22#)))))
                                         (LETT #19# (CDR #19#) . #22#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #20#))))
                                   . #22#)
                             (LETT |fl2|
                                   (PROGN
                                    (LETT #18# NIL . #22#)
                                    (SEQ (LETT |fac| NIL . #22#)
                                         (LETT #17#
                                               (SPADCALL |f_numr|
                                                         (QREFELT $ 109))
                                               . #22#)
                                         G190
                                         (COND
                                          ((OR (ATOM #17#)
                                               (PROGN
                                                (LETT |fac| (CAR #17#) . #22#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((ODDP (QCDR |fac|))
                                             (LETT #18#
                                                   (CONS (QCAR |fac|) #18#)
                                                   . #22#)))))
                                         (LETT #17# (CDR #17#) . #22#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #18#))))
                                   . #22#)
                             (LETT |pip|
                                   (SPADCALL
                                    (SPADCALL (ELT $ 246) |fl1|
                                              (|spadConstant| $ 113)
                                              (QREFELT $ 249))
                                    (SPADCALL (ELT $ 246) |fl2|
                                              (|spadConstant| $ 113)
                                              (QREFELT $ 249))
                                    (QREFELT $ 246))
                                   . #22#)
                             (LETT |pif| (SPADCALL |pip| (QREFELT $ 15))
                                   . #22#)
                             (LETT |l_pifp|
                                   (SPADCALL
                                    (SPADCALL |pif| |x| (QREFELT $ 43)) |pif|
                                    (QREFELT $ 60))
                                   . #22#)
                             (LETT |uvu0|
                                   (|RDEEFX;get_uv| |l_pifp| |vlst| |ulst| |k|
                                    |x| $)
                                   . #22#)
                             (EXIT
                              (COND
                               ((QEQCAR |uvu0| 1)
                                (VECTOR |a1| |r1| |ansp| 'NIL))
                               (#23#
                                (SEQ (LETT |uv0| (QCDR |uvu0|) . #22#)
                                     (LETT |fl1|
                                           (PROGN
                                            (LETT #16# NIL . #22#)
                                            (SEQ (LETT |fac| NIL . #22#)
                                                 (LETT #15#
                                                       (SPADCALL |f_denr|
                                                                 (QREFELT $
                                                                          109))
                                                       . #22#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #15#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #15#)
                                                              . #22#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #16#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #14#
                                                                     (QUOTIENT2
                                                                      (-
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #22#)
                                                             (|check_subtype2|
                                                              (>= #14# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #14#))
                                                           (QREFELT $ 251))
                                                          #16#)
                                                         . #22#)))
                                                 (LETT #15# (CDR #15#) . #22#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #16#))))
                                           . #22#)
                                     (LETT |fl2|
                                           (PROGN
                                            (LETT #13# NIL . #22#)
                                            (SEQ (LETT |fac| NIL . #22#)
                                                 (LETT #12#
                                                       (SPADCALL |f_numr|
                                                                 (QREFELT $
                                                                          109))
                                                       . #22#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #12#)
                                                       (PROGN
                                                        (LETT |fac| (CAR #12#)
                                                              . #22#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #13#
                                                         (CONS
                                                          (SPADCALL
                                                           (QCAR |fac|)
                                                           (PROG1
                                                               (LETT #11#
                                                                     (QUOTIENT2
                                                                      (+
                                                                       (QCDR
                                                                        |fac|)
                                                                       1)
                                                                      2)
                                                                     . #22#)
                                                             (|check_subtype2|
                                                              (>= #11# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #11#))
                                                           (QREFELT $ 251))
                                                          #13#)
                                                         . #22#)))
                                                 (LETT #12# (CDR #12#) . #22#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #13#))))
                                           . #22#)
                                     (LETT |G_den|
                                           (SPADCALL (ELT $ 246) |fl1|
                                                     (|spadConstant| $ 113)
                                                     (QREFELT $ 249))
                                           . #22#)
                                     (LETT |G_num|
                                           (SPADCALL (ELT $ 246) |fl2|
                                                     (|spadConstant| $ 113)
                                                     (QREFELT $ 249))
                                           . #22#)
                                     (LETT G
                                           (SPADCALL
                                            (SPADCALL |G_den| (QREFELT $ 15))
                                            (SPADCALL |G_num| (QREFELT $ 15))
                                            (QREFELT $ 60))
                                           . #22#)
                                     (LETT |unG|
                                           (SPADCALL
                                            (SPADCALL |f_numr| (QREFELT $ 252))
                                            (QREFELT $ 253))
                                           . #22#)
                                     (LETT |kf| (SPADCALL |k| (QREFELT $ 40))
                                           . #22#)
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
                                                      (QREFELT $ 60))
                                                     (QREFELT $ 34))
                                                    . #22#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 1
                                                          (QREFELT $ 59))
                                                |piv| (QREFELT $ 60)))))
                                            (#23#
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
                                                                         254))
                                                      (SPADCALL
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          28))
                                                       G (QREFELT $ 29))
                                                      (QREFELT $ 60))
                                                     (QREFELT $ 26))
                                                    . #22#)
                                              (EXIT
                                               (SPADCALL
                                                (SPADCALL |spec1p| 0
                                                          (QREFELT $ 59))
                                                |piv| (QREFELT $ 60))))))
                                           . #22#)
                                     (LETT |vlst1| NIL . #22#)
                                     (LETT |ulst1| NIL . #22#)
                                     (SEQ (LETT |u| NIL . #22#)
                                          (LETT #8# |ulst| . #22#)
                                          (LETT |v| NIL . #22#)
                                          (LETT #7# |vlst| . #22#) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |v| (CAR #7#) . #22#)
                                                 NIL)
                                                (ATOM #8#)
                                                (PROGN
                                                 (LETT |u| (CAR #8#) . #22#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |v| |kf|
                                                        (QREFELT $ 110))
                                              (SEQ
                                               (LETT |vlst1| (CONS |v| |vlst1|)
                                                     . #22#)
                                               (EXIT
                                                (LETT |ulst1|
                                                      (CONS |u| |ulst1|)
                                                      . #22#)))))))
                                          (LETT #7#
                                                (PROG1 (CDR #7#)
                                                  (LETT #8# (CDR #8#) . #22#))
                                                . #22#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |r4|
                                           (SPADCALL
                                            (SPADCALL 4 (QREFELT $ 28)) |r|
                                            (QREFELT $ 29))
                                           . #22#)
                                     (LETT |c0|
                                           (SPADCALL |t|
                                                     (SPADCALL
                                                      (SPADCALL |s| 2
                                                                (QREFELT $
                                                                         255))
                                                      |r4| (QREFELT $ 60))
                                                     (QREFELT $ 34))
                                           . #22#)
                                     (LETT |c1|
                                           (SPADCALL |s| |r4| (QREFELT $ 60))
                                           . #22#)
                                     (LETT |c2|
                                           (SPADCALL (|spadConstant| $ 35) |r4|
                                                     (QREFELT $ 60))
                                           . #22#)
                                     (LETT |lv|
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |r| |x| (QREFELT $ 43))
                                              (|spadConstant| $ 30)
                                              (QREFELT $ 110))
                                             (SPADCALL (LIST |c1| |c2|) |vlst1|
                                                       (QREFELT $ 256)))
                                            (#23# (CONS |c1| |vlst1|)))
                                           . #22#)
                                     (LETT |vecf|
                                           (SPADCALL
                                            (PROGN
                                             (LETT #6# NIL . #22#)
                                             (SEQ (LETT |v| NIL . #22#)
                                                  (LETT #5# |lv| . #22#) G190
                                                  (COND
                                                   ((OR (ATOM #5#)
                                                        (PROGN
                                                         (LETT |v| (CAR #5#)
                                                               . #22#)
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
                                                          . #22#)))
                                                  (LETT #5# (CDR #5#) . #22#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #6#))))
                                            (QREFELT $ 45))
                                           . #22#)
                                     (LETT |sol_rec|
                                           (SPADCALL |vecf|
                                                     (SPADCALL |c0| |x|
                                                               (QREFELT $ 43))
                                                     (QREFELT $ 116))
                                           . #22#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR (QCAR |sol_rec|) 1)
                                        (VECTOR |a1| |r1| |ansp| 'NIL))
                                       (#23#
                                        (SEQ
                                         (LETT |sol0|
                                               (PROG2
                                                   (LETT #3# (QCAR |sol_rec|)
                                                         . #22#)
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
                                               . #22#)
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
                                                             (QREFELT $ 257))
                                                   2 (QREFELT $ 258))
                                                  (SPADCALL |sol0| 2
                                                            (QREFELT $ 257))
                                                  (QREFELT $ 259))
                                                 (PROGN
                                                  (LETT #2#
                                                        (VECTOR |a1| |r1|
                                                                |ansp| 'NIL)
                                                        . #22#)
                                                  (GO #24#))))))
                                             (LETT |rcu|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |sol0| 1
                                                               (QREFELT $ 257))
                                                     (SPADCALL 2
                                                               (QREFELT $ 118))
                                                     (QREFELT $ 260))
                                                    (QREFELT $ 175))
                                                   . #22#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |rcu| 1)
                                                (VECTOR |a1| |r1| |ansp| 'NIL))
                                               (#23#
                                                (SEQ
                                                 (LETT |ri| (QCDR |rcu|)
                                                       . #22#)
                                                 (LETT |nn|
                                                       (SPADCALL |nf|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |ri|
                                                                   (QREFELT $
                                                                            28))
                                                                  1
                                                                  (QREFELT $
                                                                           62))
                                                                 (QREFELT $
                                                                          63))
                                                       . #22#)
                                                 (LETT |cands|
                                                       (|RDEEFX;gammas1| |nn|
                                                        (QCDR |rcu|)
                                                        (|spadConstant| $ 81)
                                                        (|spadConstant| $ 81) 0
                                                        1 |vlst| |ulst| |k| |x|
                                                        NIL $)
                                                       . #22#)
                                                 (LETT |derivation3|
                                                       (CONS
                                                        #'|RDEEFX;quadratic_log_erf_integrate!0|
                                                        (VECTOR |derivation|
                                                                $))
                                                       . #22#)
                                                 (LETT |scoeffs|
                                                       (|RDEEFX;get_scoeffs|
                                                        |cands|
                                                        (|spadConstant| $ 81)
                                                        |k| |derivation3| $)
                                                       . #22#)
                                                 (LETT |rr1|
                                                       (SPADCALL |spec1p|
                                                                 (QREFELT $
                                                                          99))
                                                       . #22#)
                                                 (LETT |f|
                                                       (SPADCALL
                                                        (SPADCALL |nf|
                                                                  (QREFELT $
                                                                           99))
                                                        |k| (QREFELT $ 101))
                                                       . #22#)
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
                                               (QREFELT $ 70))
                                              (|error| "impossible 11"))
                                             (#23#
                                              (VECTOR |a1| |r1| |ansp| 'NIL))))
                                           ((OR
                                             (EQL (LENGTH (QCDR |sol_rec|)) 1)
                                             #23#)
                                            (VECTOR |a1| |r1| |ansp|
                                                    'NIL))))))))))))))))))))))
          #24# (EXIT #2#)))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;quadratic_log_erf_integrate|))
          (LETT |derivation| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 154)) |derivation|)
                        (SPADCALL |z1| (QREFELT $ 208)) (QREFELT $ 69))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 154))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 208)) |derivation|)
                        (QREFELT $ 69))
              (QREFELT $ 177))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 208))
                       (SPADCALL |z1| (QREFELT $ 208)) (QREFELT $ 69))
             (QREFELT $ 183)))))) 

(SDEFUN |RDEEFX;decompose1|
        ((|num| |SparseUnivariatePolynomial| F)
         (|den| |SparseUnivariatePolynomial| F)
         (|eidens| |List| (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| F)))
          (|f1| (|SparseUnivariatePolynomial| F)) (#1=#:G758 NIL))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT $ 69) |eidens|
                                              (QREFELT $ 261))
                                    (QREFELT $ 80))
                          . #2=(|RDEEFX;decompose1|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   "failed")
                                  #1#))
                . #2#)
          (COND
           ((SPADCALL |f1| (|spadConstant| $ 81) (QREFELT $ 82))
            (LETT |eidens| (CONS |f1| |eidens|) . #2#)))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT $ 263)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |f1| (|spadConstant| $ 81) (QREFELT $ 82)) (CDR |res|))
            ('T |res|)))))) 

(SDEFUN |RDEEFX;get_trace|
        ((|fu| |Fraction| (|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         (|rf1k| |Kernel| F) (|cfac| |SparseUnivariatePolynomial| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|resd| (F)) (|fa| (|SparseUnivariatePolynomial| F)) (|f| (F))
          (|Sae| (|MonogenicAlgebra| F (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (QREFELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            |cfac|)
                . #1=(|RDEEFX;get_trace|))
          (LETT |f| (SPADCALL |fu| |k| (QREFELT $ 101)) . #1#)
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT $ 264)) . #1#)
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
                                        |Sae|))
                . #1#)
          (EXIT (SPADCALL |resd| |k| (QREFELT $ 153)))))) 

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
          (|lp_cor| #1#) (|ansp| (F)) (#2=#:G795 NIL) (|zz| NIL)
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
          (|denf1| (|SparseUnivariatePolynomial| F)) (#5=#:G770 NIL)
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
         (SEQ (LETT |eiden| (QVELT |er| 0) . #8=(|RDEEFX;solve_factor1|))
              (LETT |r0| (QVELT |er| 1) . #8#) (LETT |v0| (QVELT |er| 2) . #8#)
              (LETT |cfac| (QVELT |er| 3) . #8#)
              (LETT |u0| (QVELT |er| 4) . #8#)
              (LETT |u_exp| (QVELT |er| 5) . #8#)
              (LETT |vshift| (QVELT |er| 6) . #8#)
              (LETT |rfc| (|spadConstant| $ 30) . #8#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 265)) . #8#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 266)) . #8#)))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |r0| (QREFELT $ 28)) 1
                                           (QREFELT $ 62))
                                 (SPADCALL |v0| (QREFELT $ 21)) (QREFELT $ 63))
                                (SPADCALL |rfc| (QREFELT $ 21)) (QREFELT $ 63))
                               |denf| (QREFELT $ 69))
                              (QREFELT $ 63))
                    . #8#)
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 99))
                              (SPADCALL |denf| (QREFELT $ 99)) (QREFELT $ 228))
                    . #8#)
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
                              (QREFELT $ 63))
                    . #8#)
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 69)) |u0|
                              (QREFELT $ 267))
                    . #8#)
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 62))
                        (QREFELT $ 99))
                       |u_exp| (QREFELT $ 268))
                      (SPADCALL |coeff1| (QREFELT $ 99)) (QREFELT $ 236))
                     (SPADCALL |eiarg_num| (QREFELT $ 99)) (QREFELT $ 228))
                    . #8#)
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 208)) . #8#)
              (LETT |coeff1_rs| (|spadConstant| $ 184) . #8#)
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 154)) |denf1|
                              (QREFELT $ 270))
                    . #8#)
              (LETT |lnum1| (QCDR |dvr|) . #8#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 38))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT $ 213)) . #8#)
                     (EXIT
                      (COND
                       ((SPADCALL |min_deg| 0 (QREFELT $ 70))
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| $ 35) |min_deg|
                                         (QREFELT $ 62))
                               . #8#)
                         (LETT |denf1|
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT $ 80))
                                         . #8#)
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 7))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  #3#)
                                                 #5#))
                               . #8#)
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT $ 263))
                               . #8#)
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT $ 271))
                               . #8#)
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT $ 271))
                                           (QREFELT $ 99))
                                 (SPADCALL |spec_den| (QREFELT $ 99))
                                 (QREFELT $ 228))
                                . #8#)))))))))
              (LETT |lnum0| |lnum1| . #8#)
              (COND
               ((SPADCALL |bpol| |eiden| (QREFELT $ 82))
                (SEQ
                 (LETT |reml|
                       (|RDEEFX;decompose1| |lnum1| |denf1| (LIST |bpol|) $)
                       . #8#)
                 (EXIT (LETT |lnum1| (|SPADfirst| |reml|) . #8#)))))
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                (SEQ
                 (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 174))
                       . #8#)
                 (LETT |ddf|
                       (SPADCALL (SPADCALL |eiden| (QREFELT $ 176)) |denf1|
                                 (QREFELT $ 174))
                       . #8#)
                 (LETT |ppu| (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 274))
                       . #8#)
                 (EXIT
                  (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                        (#9='T
                         (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #8#)
                              (EXIT
                               (LETT |einum|
                                     (SPADCALL
                                      (SPADCALL |einum|
                                                (SPADCALL |denf1|
                                                          (QREFELT $ 176))
                                                (QREFELT $ 69))
                                      |denf1| (QREFELT $ 174))
                                     . #8#)))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT $ 80)) . #8#)
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                         (|spadConstant| $ 75) (|spadConstant| $ 184)))
                (#9#
                 (SEQ (LETT |cp| (QCDR |cu|) . #8#)
                      (LETT |cu1| (SPADCALL |cp| (QREFELT $ 275)) . #8#)
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                                 (|spadConstant| $ 75) (|spadConstant| $ 184)))
                        (#9#
                         (SEQ (LETT |c| (QCDR |cu1|) . #8#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT $ 276))
                                           (|spadConstant| $ 30)
                                           (QREFELT $ 110))
                                 (VECTOR (|spadConstant| $ 30)
                                         (|spadConstant| $ 184)
                                         (|spadConstant| $ 75)
                                         (|spadConstant| $ 184)))
                                (#9#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT $ 61))
                                                     |rfc| (QREFELT $ 34))
                                                    (QREFELT $ 277))
                                                   (QREFELT $ 29))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT $ 101))
                                          (QREFELT $ 278))
                                         (QREFELT $ 29))
                                        . #8#)
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| $ 75)
                                                    (QREFELT $ 84))
                                          (LIST (|spadConstant| $ 30)))
                                         (#9#
                                          (SPADCALL |cfac| (QREFELT $ 279))))
                                        . #8#)
                                  (LETT |ansp| (|spadConstant| $ 30) . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 75)
                                              (QREFELT $ 84))
                                    (LETT |ansp| |ansp1| . #8#))
                                   (#9#
                                    (SEQ (LETT |zz| NIL . #8#)
                                         (LETT #2# |zzl| . #8#) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |zz| (CAR #2#) . #8#)
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
                                                                              280))
                                                           (QREFELT $ 26))
                                                 . #8#)))
                                         (LETT #2# (CDR #2#) . #8#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT $ 99))
                                                   (SPADCALL |denf1|
                                                             (QREFELT $ 99))
                                                   (QREFELT $ 228))
                                                  (QREFELT $ 225))
                                        . #8#)
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  |coeff1_rs| (QREFELT $ 225))
                                        . #8#)
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (QCAR |dvr|) (QREFELT $ 69))
                                        . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 75)
                                              (QREFELT $ 82))
                                    (SEQ
                                     (LETT |lp_cor|
                                           (|RDEEFX;get_trace| |lp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #8#)
                                     (LETT |sp_cor|
                                           (|RDEEFX;get_trace| |sp_cor| |k|
                                            |rf1k| |cfac| $)
                                           . #8#)
                                     (LETT |poly_cor_rf|
                                           (|RDEEFX;get_trace|
                                            (SPADCALL |poly_cor|
                                                      (QREFELT $ 99))
                                            |k| |rf1k| |cfac| $)
                                           . #8#)
                                     (EXIT
                                      (LETT |poly_cor|
                                            (SPADCALL |poly_cor_rf|
                                                      (QREFELT $ 229))
                                            . #8#)))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| |SparseUnivariatePolynomial| F)
         (|p| |SparseUnivariatePolynomial| F) ($ |Integer|))
        (SPROG
         ((|nn| (|Integer|)) (#1=#:G804 NIL)
          (|nqu| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ (LETT |nn| 0 . #2=(|RDEEFX;p_power_in_q|))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |nqu| (SPADCALL |q| |p| (QREFELT $ 80)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |nqu| 1)
                             (PROGN
                              (LETT #1# |$NoValue| . #2#)
                              (GO #3=#:G801)))
                            ('T
                             (SEQ (LETT |q| (QCDR |nqu|) . #2#)
                                  (EXIT (LETT |nn| (+ |nn| 1) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
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
          (|ansp| (F)) (#2=#:G835 NIL) (|zz| NIL)
          (|lp_cor| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|eiargp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coefi| (F)) (|ansp1| (F)) (|shifti| (F)) (|eiargi| (F))
          (|eiargi_r| #3=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ci| (F)) (|nn| (|Integer|))
          (|einumi| (|SparseUnivariatePolynomial| F)) (|ki| (|Integer|))
          (|kif| (F)) (#4=#:G834 NIL) (|ck| NIL) (|zzl| (|List| F))
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
         (SEQ (LETT |cfac| (QVELT |er| 3) . #6=(|RDEEFX;solve_linear_factor|))
              (LETT |rfc| (|spadConstant| $ 30) . #6#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 265)) . #6#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 266)) . #6#)))))
              (LETT |r0| (QVELT |er| 1) . #6#) (LETT |v0| (QVELT |er| 2) . #6#)
              (LETT |u0| (QVELT |er| 4) . #6#)
              (LETT |lc0|
                    (SPADCALL (SPADCALL |nf| (QREFELT $ 76))
                              (SPADCALL |r0| (QREFELT $ 28)) (QREFELT $ 26))
                    . #6#)
              (COND
               ((OR (SPADCALL (SPADCALL |nf| (QREFELT $ 58)) 1 (QREFELT $ 54))
                    (SPADCALL |denf| (|spadConstant| $ 81) (QREFELT $ 82)))
                (COND
                 ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                  (EXIT (|error| "cfac ~= 0 in nonlinear case"))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |r0| (QREFELT $ 28)) 1
                                          (QREFELT $ 62))
                                (SPADCALL
                                 (SPADCALL |v0|
                                           (SPADCALL |lc0| |rfc|
                                                     (QREFELT $ 29))
                                           (QREFELT $ 26))
                                 (QREFELT $ 21))
                                (QREFELT $ 63))
                               |denf| (QREFELT $ 69))
                              (QREFELT $ 63))
                    . #6#)
              (LETT |fac1| (QVELT |er| 0) . #6#)
              (LETT |nn0|
                    (COND
                     ((SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 58)) 1
                                (QREFELT $ 70))
                      (|RDEEFX;p_power_in_q| |eiarg_num| |fac1| $))
                     (#7='T 1))
                    . #6#)
              (EXIT
               (COND
                ((EQL |nn0| 0)
                 (|error|
                  "impossible, eiarg_num is not divisible by its factor"))
                (#7#
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
                                  (QREFELT $ 63))
                        . #6#)
                  (LETT |coeff1|
                        (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 69))
                                  |u0| (QREFELT $ 267))
                        . #6#)
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT $ 99))
                                  (SPADCALL |eiarg_num| (QREFELT $ 99))
                                  (QREFELT $ 228))
                        . #6#)
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 208)) . #6#)
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 154)) |denf1|
                                  (QREFELT $ 270))
                        . #6#)
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                    (SEQ
                     (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 174))
                           . #6#)
                     (LETT |ddf|
                           (SPADCALL (SPADCALL (QVELT |er| 0) (QREFELT $ 176))
                                     |denf1| (QREFELT $ 174))
                           . #6#)
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 274))
                           . #6#)
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#7#
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)) . #6#)
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT $ 176))
                                                    (QREFELT $ 69))
                                          |denf1| (QREFELT $ 174))
                                         . #6#)))))))))
                  (LETT |lnum1|
                        (COND
                         ((SPADCALL (SPADCALL |fac1| (QREFELT $ 58)) 1
                                    (QREFELT $ 70))
                          (SPADCALL (QCDR |dvr|) (QREFELT $ 193)))
                         (#7#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) $)
                                 . #6#)
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|) (QREFELT $ 193))))))
                        . #6#)
                  (LETT |einum1| (SPADCALL |einum| (QREFELT $ 193)) . #6#)
                  (LETT |u1| (QVELT |er| 10) . #6#)
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT $ 60))
                                  |u1| |x| (QREFELT $ 282))
                        . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                             (|spadConstant| $ 75) (|spadConstant| $ 184)))
                    (#7#
                     (SEQ (LETT |res1| (QCDR |res1u|) . #6#)
                          (LETT |ansp1| (|spadConstant| $ 30) . #6#)
                          (LETT |lp_cor| (|spadConstant| $ 184) . #6#)
                          (LETT |eiarg_inc|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |er| 8) (QREFELT $ 28)) 1
                                   (QREFELT $ 62))
                                  (SPADCALL (QVELT |er| 9) (QREFELT $ 21))
                                  (QREFELT $ 63))
                                 |denf| (QREFELT $ 69))
                                . #6#)
                          (SETELT $ 181 (SPADCALL (QREFELT $ 56)))
                          (LETT |zzl|
                                (COND
                                 ((SPADCALL |cfac| (|spadConstant| $ 75)
                                            (QREFELT $ 84))
                                  (LIST (|spadConstant| $ 30)))
                                 (#7# (SPADCALL |cfac| (QREFELT $ 279))))
                                . #6#)
                          (SEQ (LETT |ck| NIL . #6#) (LETT #4# |res1| . #6#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ck| (CAR #4#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT $ 227))
                                      . #6#)
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT $ 227))
                                      . #6#)
                                (LETT |ki| (SPADCALL |kif| (QREFELT $ 283))
                                      . #6#)
                                (LETT |einumi|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 75)
                                                  (QREFELT $ 84))
                                        (SPADCALL |eiarg_num|
                                                  (SPADCALL |kif| |eiarg_inc|
                                                            (QREFELT $ 114))
                                                  (QREFELT $ 63)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT $ 26))
                                          |lc0| (QREFELT $ 60))
                                         |eiarg_num| (QREFELT $ 114))))
                                      . #6#)
                                (LETT |nn|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |einumi| (QREFELT $ 58)) 1
                                         (QREFELT $ 70))
                                        (|RDEEFX;p_power_in_q| |einumi| |fac1|
                                         $))
                                       ('T 1))
                                      . #6#)
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
                                       (QREFELT $ 60))
                                      . #6#)
                                (LETT |eiargi_r|
                                      (SPADCALL
                                       (SPADCALL |einumi| (QREFELT $ 99))
                                       (SPADCALL |denf| (QREFELT $ 99))
                                       (QREFELT $ 228))
                                      . #6#)
                                (LETT |eiargi|
                                      (SPADCALL |eiargi_r| |k| (QREFELT $ 101))
                                      . #6#)
                                (LETT |shifti|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| $ 75)
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
                                          |lc0| (QREFELT $ 60))
                                         (SPADCALL (QVELT |er| 6)
                                                   (SPADCALL |lc0| |rfc|
                                                             (QREFELT $ 29))
                                                   (QREFELT $ 26))
                                         (QREFELT $ 29))))
                                      . #6#)
                                (LETT |ansp1|
                                      (SPADCALL |ansp1|
                                                (SPADCALL
                                                 (SPADCALL |ci|
                                                           (SPADCALL
                                                            (SPADCALL |shifti|
                                                                      (QREFELT
                                                                       $ 61))
                                                            (QREFELT $ 277))
                                                           (QREFELT $ 29))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT $ 278))
                                                 (QREFELT $ 29))
                                                (QREFELT $ 26))
                                      . #6#)
                                (LETT |coefi|
                                      (SPADCALL
                                       (SPADCALL |ci| |u0| (QREFELT $ 29))
                                       (SPADCALL |u1| |ki| (QREFELT $ 42))
                                       (QREFELT $ 29))
                                      . #6#)
                                (LETT |eiargp|
                                      (SPADCALL |denfp|
                                                (SPADCALL
                                                 (SPADCALL |eiargi| |x|
                                                           (QREFELT $ 43))
                                                 |k| (QREFELT $ 153))
                                                (QREFELT $ 225))
                                      . #6#)
                                (EXIT
                                 (LETT |lp_cor|
                                       (SPADCALL |lp_cor|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |coefi|
                                                              (QREFELT $ 21))
                                                    (QREFELT $ 99))
                                                   |eiargp| (QREFELT $ 236))
                                                  |eiargi_r| (QREFELT $ 228))
                                                 (QREFELT $ 237))
                                       . #6#)))
                               (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |ansp| (|spadConstant| $ 30) . #6#)
                          (COND
                           ((SPADCALL |cfac| (|spadConstant| $ 75)
                                      (QREFELT $ 84))
                            (LETT |ansp| |ansp1| . #6#))
                           (#7#
                            (SEQ
                             (LETT |lp_cor|
                                   (|RDEEFX;get_trace| |lp_cor| |k| |rf1k|
                                    |cfac| $)
                                   . #6#)
                             (EXIT
                              (SEQ (LETT |zz| NIL . #6#) (LETT #2# |zzl| . #6#)
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |zz| (CAR #2#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ansp|
                                           (SPADCALL |ansp|
                                                     (SPADCALL |ansp1| |rf1k|
                                                               |zz|
                                                               (QREFELT $ 280))
                                                     (QREFELT $ 26))
                                           . #6#)))
                                   (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT $ 154))
                                          (SPADCALL |lp_cor| (QREFELT $ 208))
                                          (QREFELT $ 270))
                                . #6#)
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT $ 99))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT $ 208))
                                     (QREFELT $ 99))
                                    (QREFELT $ 228))
                                   (QCAR |dvr2|)
                                   (|spadConstant| $ 184)))))))))))))) 

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
          (#2=#:G845 NIL) (|einum| NIL) (#3=#:G846 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G844 NIL)
          (#5=#:G843 NIL)
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
          (LETT |al| (|RDEEFX;lin_args| |den| |nf| |k| |vlst| |ulst| |x| $)
                . #6=(|RDEEFX;linear_log_case|))
          (EXIT
           (COND
            ((NULL |al|)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                     (|spadConstant| $ 75) (|spadConstant| $ 184)))
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
              (LETT |lp_cor| (|spadConstant| $ 184) . #6#)
              (LETT |sp_cor| (|spadConstant| $ 184) . #6#)
              (LETT |poly_cor| (|spadConstant| $ 75) . #6#)
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
                             (|spadConstant| $ 81) |nfp| (|spadConstant| $ 81)
                             |k| |x| |einum| |er| $))
                           ('T
                            (|RDEEFX;solve_factor1| |nf| (|spadConstant| $ 81)
                             |nfp| (|spadConstant| $ 81) |k| |x| |einum|
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
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT $ 237))
                          . #6#)
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT $ 237))
                          . #6#)
                    (EXIT
                     (LETT |poly_cor|
                           (SPADCALL |poly_cor| (QVELT |ar1| 2) (QREFELT $ 63))
                           . #6#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
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
          (#1=#:G872 NIL) (|er| NIL) (#2=#:G871 NIL) (|r0| (|Integer|))
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
          (|j| NIL) (#3=#:G870 NIL) (|bpol| (|SparseUnivariatePolynomial| F))
          (|poly_cor| (|SparseUnivariatePolynomial| F))
          (|sp_cor| #4=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| #4#) (|ansp| (F)) (#5=#:G867 NIL) (|einum| NIL)
          (#6=#:G868 NIL) (#7=#:G869 NIL)
          (|bpols| (|List| (|SparseUnivariatePolynomial| F)))
          (|j0| (|NonNegativeInteger|)) (#8=#:G866 NIL) (|esum| (|Integer|))
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
                                    (SPADCALL |dtrans| |i| |j| (QREFELT $ 285))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1) . #9#)
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #8# |$NoValue| . #9#)
                                            (GO #10=#:G850)))
                                          ('T (LETT |j0| |j| . #9#)))))))))
                               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                               (EXIT NIL)))
                         #10# (EXIT #8#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT $ 287))
                                        |bpols|)
                                  . #9#)
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT $ 290))
                                         |lei1|)
                                   . #9#)))))))
                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| $ 30) . #9#)
              (LETT |lp_cor| (|spadConstant| $ 184) . #9#)
              (LETT |sp_cor| (|spadConstant| $ 184) . #9#)
              (LETT |poly_cor| (|spadConstant| $ 75) . #9#)
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
                                        (QREFELT $ 237))
                              . #9#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 237))
                              . #9#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 63))
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
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT $ 287)) . #9#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |bpol| (QREFELT $ 58)) 1 (QREFELT $ 294))
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
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT $ 285)) 1)
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
                                   (QREFELT $ 60))
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
                                            (SPADCALL |k| (QREFELT $ 226)) 1
                                            (QREFELT $ 227))
                                           |r1| (QREFELT $ 42))
                                          (QREFELT $ 29))
                                . #9#)
                          (LETT |er2|
                                (VECTOR |bpol| |r0| |v0| (|spadConstant| $ 75)
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
          (#2=#:G905 NIL) (|einum| NIL) (#3=#:G906 NIL) (|er| NIL)
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
          (|neidens| (|List| (|SparseUnivariatePolynomial| F))) (|i| NIL)
          (#6=#:G903 NIL) (|eiden| NIL) (#7=#:G904 NIL)
          (|n| (|NonNegativeInteger|)) (|nidbl| (|List| (|Integer|)))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| F)))
          (|bi| (|SparseUnivariatePolynomial| F)) (|m| (|NonNegativeInteger|))
          (#8=#:G900 NIL) (|lp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|dr| (|Record| (|:| |basis| #5#) (|:| |transform| #4#)))
          (#9=#:G902 NIL) (#10=#:G901 NIL))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 38))
            (COND
             ((SPADCALL |denf| (|spadConstant| $ 81) (QREFELT $ 84))
              (COND
               ((SPADCALL (SPADCALL |nf| (QREFELT $ 58)) 1 (QREFELT $ 295))
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| $))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| $ 81) (QREFELT $ 84))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT $ 58)) 0)
              (EXIT
               (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                       (|spadConstant| $ 75) (|spadConstant| $ 184)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| $)
                . #11=(|RDEEFX;handle_logpart|))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 184)
                     (|spadConstant| $ 75) (|spadConstant| $ 184)))
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
              (LETT |lp_cor| (|spadConstant| $ 184) . #11#)
              (LETT |sp_cor| (|spadConstant| $ 184) . #11#)
              (LETT |poly_cor| (|spadConstant| $ 75) . #11#)
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT $ 38))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT $ 296))
                                  (QREFELT $ 299))
                        . #11#)
                  (LETT |dbasis| (QCAR |dr|) . #11#)
                  (LETT |dtrans| (QCDR |dr|) . #11#)
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT $ 99))
                                  (SPADCALL |den| (QREFELT $ 99))
                                  (QREFELT $ 228))
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
                                          (QREFELT $ 237))
                                . #11#)
                          (LETT |sp_cor|
                                (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                          (QREFELT $ 237))
                                . #11#)
                          (LETT |poly_cor|
                                (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                          (QREFELT $ 63))
                                . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| $ 184)
                                       (QREFELT $ 300))
                             (PROGN
                              (LETT #8# |$NoValue| . #11#)
                              (GO #13=#:G892)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT $ 244))
                                    . #11#)
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| $ 184)
                                           (QREFELT $ 300))
                                 (PROGN
                                  (LETT #8# |$NoValue| . #11#)
                                  (GO #13#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT $ 154))
                                        . #11#)
                                  (LETT |den| (SPADCALL |lp| (QREFELT $ 208))
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
                                                        (QREFELT $ 287))
                                              . #11#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |den| |bi|
                                                      (QREFELT $ 80))
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
                                                          (QREFELT $ 80))
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
                                            (SPADCALL |ndbl| (QREFELT $ 296))
                                            . #11#)
                                      (EXIT
                                       (LETT |dtrans|
                                             (SPADCALL |dtrans| |nidbl| |ninds|
                                                       (QREFELT $ 301))
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
                                        (QREFELT $ 237))
                              . #11#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 237))
                              . #11#)
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT $ 63))
                               . #11#)))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #11#))
                             . #11#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

(SDEFUN |RDEEFX;gamma_denominator|
        ((|denf| . #1=(|SparseUnivariatePolynomial| F)) (|k| |Kernel| F)
         ($ |Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
          (|:| |exponent| (|Integer|))))
        (SPROG
         ((|gden1| (|SparseUnivariatePolynomial| F)) (#2=#:G932 NIL)
          (#3=#:G928 NIL) (#4=#:G940 NIL) (|fac1| NIL) (#5=#:G939 NIL)
          (|l1| (|Integer|)) (|lexp| (|List| #6=(|Integer|))) (#7=#:G938 NIL)
          (#8=#:G937 NIL)
          (|nffacs|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| #6#))))
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| F))) (|denf1| #1#)
          (#9=#:G910 NIL) (#10=#:G908 NIL) (|s_deg| (|Integer|)))
         (SEQ (LETT |s_deg| 0 . #11=(|RDEEFX;gamma_denominator|))
              (LETT |denf1| |denf| . #11#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 38))
                (SEQ (LETT |s_deg| (SPADCALL |denf| (QREFELT $ 213)) . #11#)
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
                                                          (QREFELT $ 62))
                                                (QREFELT $ 80))
                                      . #11#)
                                (QCDR #9#)
                              (|check_union2| (QEQCAR #9# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               "failed")
                                              #9#))
                            . #11#)))))
              (EXIT
               (COND
                ((SPADCALL |denf1| (|spadConstant| $ 81) (QREFELT $ 84))
                 (COND ((EQL |s_deg| 0) (CONS (|spadConstant| $ 81) 0))
                       (#12='T
                        (CONS (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 62))
                              |s_deg|))))
                (#12#
                 (SEQ (LETT |fnf| (SPADCALL |denf1| (QREFELT $ 201)) . #11#)
                      (LETT |nffacs| (SPADCALL |fnf| (QREFELT $ 188)) . #11#)
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
                                     (SPADCALL (ELT $ 69)
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
                                               (QREFELT $ 261))
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
                                                  (QREFELT $ 62))
                                        |gden1| (QREFELT $ 69))
                                       . #11#)))
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
          (|denr| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G947 NIL)
          (|numr| (|SparseUnivariatePolynomial| F))
          (|nfp1| (|SparseUnivariatePolynomial| F))
          (|an| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F))
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#3=#:G944 NIL) (#4=#:G954 NIL)
          (|hh1| (|SparseUnivariatePolynomial| F)) (|ad| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ad|
                  (LETT |denr| (SPADCALL |r| (QREFELT $ 208))
                        . #5=(|RDEEFX;special_Hermite|))
                  . #5#)
            (LETT |numr| (SPADCALL |r| (QREFELT $ 154)) . #5#)
            (LETT |an| (|spadConstant| $ 75) . #5#)
            (LETT |mult| (|spadConstant| $ 81) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |hh1| (SPADCALL |denr| |ndenf| (QREFELT $ 78)) . #5#)
                   (EXIT
                    (COND
                     ((EQL (SPADCALL |hh1| (QREFELT $ 58)) 0)
                      (PROGN
                       (LETT #4#
                             (CONS
                              (SPADCALL (SPADCALL |denfp| |an| (QREFELT $ 69))
                                        |ad| (QREFELT $ 183))
                              (SPADCALL |numr| |denr| (QREFELT $ 183)))
                             . #5#)
                       (GO #6=#:G953)))
                     ('T
                      (SEQ
                       (LETT |ee|
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL |nfp| |hh1| |numr|
                                                 (QREFELT $ 274))
                                       . #5#)
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
                                               #3#))
                             . #5#)
                       (LETT |nn| (SPADCALL (QCAR |ee|) |hh1| (QREFELT $ 174))
                             . #5#)
                       (LETT |an|
                             (SPADCALL |an|
                                       (SPADCALL |mult| |nn| (QREFELT $ 69))
                                       (QREFELT $ 63))
                             . #5#)
                       (LETT |nfp1|
                             (SPADCALL |nfp|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL |denfp|
                                                            (SPADCALL |denr|
                                                                      |deriv|)
                                                            (QREFELT $ 69))
                                                  |denr| (QREFELT $ 80))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 7))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))
                                                          #7="failed")
                                                         #2#))
                                       (QREFELT $ 177))
                             . #5#)
                       (LETT |numr|
                             (SPADCALL
                              (SPADCALL |numr|
                                        (SPADCALL |nfp1| |nn| (QREFELT $ 69))
                                        (QREFELT $ 177))
                              (SPADCALL (SPADCALL |denfp| |nn| (QREFELT $ 69))
                                        |deriv|)
                              (QREFELT $ 177))
                             . #5#)
                       (LETT |numr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |numr| |hh1| (QREFELT $ 80))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                #7#)
                                               #2#))
                             . #5#)
                       (LETT |denr|
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL |denr| |hh1| (QREFELT $ 80))
                                       . #5#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                #7#)
                                               #2#))
                             . #5#)
                       (EXIT
                        (LETT |mult| (SPADCALL |mult| |hh1| (QREFELT $ 69))
                              . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |RDEEFX;ei_int_log|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F) (|x| |Symbol|)
         (|k| |Kernel| F)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         (|ext| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|is_sol| (|Boolean|)) (|rh| (F)) (|r1| (F))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|gm| (F)) (|kfm| (F)) (|am1| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|))))
          (|m| NIL) (|ansp| (F)) (|dk| (F)) (|kf| (F)) (|k1| (|Kernel| F))
          (|lk| (|List| (|Kernel| F))) (|ngu| (F)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 99)) |k| (QREFELT $ 101))
                . #1=(|RDEEFX;ei_int_log|))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 215))
                          (SPADCALL |ngu| (QREFELT $ 215)) (QREFELT $ 217))
                . #1#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 302)) |x|
                          (QREFELT $ 303))
                . #1#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #1#)
          (LETT |dk| (SPADCALL |kf| |x| (QREFELT $ 43)) . #1#)
          (LETT |r1| (|spadConstant| $ 30) . #1#)
          (LETT |ansp| (|spadConstant| $ 30) . #1#) (LETT |is_sol| 'T . #1#)
          (LETT |rh| (|spadConstant| $ 30) . #1#)
          (LETT |am1| (|spadConstant| $ 30) . #1#)
          (SEQ (LETT |m| (SPADCALL |ng| (QREFELT $ 58)) . #1#) G190
               (COND ((< |m| 1) (GO G191)))
               (SEQ
                (LETT |gm|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |m| 1) (QREFELT $ 28)) |dk|
                                  (QREFELT $ 29))
                        |am1| (QREFELT $ 29))
                       (QREFELT $ 61))
                      . #1#)
                (COND
                 ((EQL |m| (SPADCALL |ng| (QREFELT $ 58)))
                  (SEQ
                   (LETT |gm|
                         (SPADCALL |gm| (SPADCALL |ng| (QREFELT $ 76))
                                   (QREFELT $ 26))
                         . #1#)
                   (EXIT (LETT |ng| (SPADCALL |ng| (QREFELT $ 83)) . #1#)))))
                (LETT |res1|
                      (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 308))
                      . #1#)
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 2)) ('T 'NIL))
                      . #1#)
                (LETT |am1| (QVELT |res1| 0) . #1#)
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 309)) . #1#)
                (LETT |r1|
                      (SPADCALL |r1| (SPADCALL |kfm| |am1| (QREFELT $ 29))
                                (QREFELT $ 26))
                      . #1#)
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
                       . #1#)))
               (LETT |m| (+ |m| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |gm|
                (SPADCALL (SPADCALL |ng| (QREFELT $ 193))
                          (SPADCALL |dk| |am1| (QREFELT $ 29)) (QREFELT $ 34))
                . #1#)
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 311))
                . #1#)
          (LETT |r1| (SPADCALL |r1| (QVELT |res2| 0) (QREFELT $ 26)) . #1#)
          (LETT |rh| (SPADCALL |rh| (QVELT |res2| 1) (QREFELT $ 26)) . #1#)
          (LETT |is_sol| (COND (|is_sol| (QVELT |res2| 3)) ('T 'NIL)) . #1#)
          (EXIT (VECTOR |r1| |rh| (QVELT |res2| 2) |is_sol|))))) 

(SDEFUN |RDEEFX;ei_int_exp|
        ((|f| F) (|ng| |SparseUnivariatePolynomial| F)
         (|degs| |NonNegativeInteger|) (|x| |Symbol|) (|k| |Kernel| F)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         (|ext| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F F)
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
                (SPADCALL (SPADCALL |ng| (QREFELT $ 99)) |k| (QREFELT $ 101))
                . #1=(|RDEEFX;ei_int_exp|))
          (LETT |lk|
                (SPADCALL (SPADCALL |f| (QREFELT $ 215))
                          (SPADCALL |ngu| (QREFELT $ 215)) (QREFELT $ 217))
                . #1#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 302)) |x|
                          (QREFELT $ 303))
                . #1#)
          (LETT |ak|
                (SPADCALL (SPADCALL |k| (QREFELT $ 226)) 1 (QREFELT $ 227))
                . #1#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 40)) . #1#)
          (LETT |r1| (|spadConstant| $ 30) . #1#)
          (LETT |ansp| (|spadConstant| $ 30) . #1#) (LETT |is_sol| 'T . #1#)
          (LETT |rh| (|spadConstant| $ 30) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |ng| (|spadConstant| $ 75) (QREFELT $ 82)))
                 (GO G191)))
               (SEQ (LETT |m| (- (SPADCALL |ng| (QREFELT $ 58)) |degs|) . #1#)
                    (LETT |gm| (SPADCALL |ng| (QREFELT $ 76)) . #1#)
                    (LETT |ng| (SPADCALL |ng| (QREFELT $ 83)) . #1#)
                    (LETT |f1|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |m| (QREFELT $ 28))
                                              |ak| (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #1#)
                    (LETT |res1|
                          (SPADCALL 1 |f1| |gm| |x| |lim| |ext|
                                    (QREFELT $ 311))
                          . #1#)
                    (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 42)) . #1#)
                    (LETT |r1|
                          (SPADCALL |r1|
                                    (SPADCALL |kfm| (QVELT |res1| 0)
                                              (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #1#)
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |res1| 2) (QREFELT $ 26))
                          . #1#)
                    (LETT |rh|
                          (SPADCALL |rh|
                                    (SPADCALL |kfm| (QVELT |res1| 1)
                                              (QREFELT $ 29))
                                    (QREFELT $ 26))
                          . #1#)
                    (EXIT
                     (LETT |is_sol|
                           (COND (|is_sol| (QVELT |res1| 3)) ('T 'NIL))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |r1| |rh| |ansp| |is_sol|))))) 

(SDEFUN |RDEEFX;get_scoeff|
        ((|scand| |Record| (|:| |degree| (|Integer|))
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| #1=(|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|res| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|gt| #2=(|Fraction| (|SparseUnivariatePolynomial| F))) (|i| NIL)
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|l1| (|NonNegativeInteger|)) (#3=#:G999 NIL) (|coeff1_r| #2#)
          (|coeff1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|nfp| #1#)
          (|d| (|Integer|)) (|vshift| (F)) (|u_exp| (|Integer|)) (|u0| (F))
          (|ak| (F)) (|nf1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|cfac| (|SparseUnivariatePolynomial| F)) (|v0| (F))
          (|r0| (|Integer|)) (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #4=(|RDEEFX;get_scoeff|))
              (LETT |r0| (QVELT |scand| 3) . #4#)
              (LETT |v0| (QVELT |scand| 4) . #4#)
              (LETT |cfac| (QVELT |scand| 5) . #4#)
              (LETT |u0| (QVELT |scand| 8) . #4#)
              (LETT |nf1| (QVELT |scand| 6) . #4#)
              (COND
               ((SPADCALL |r0| 0 (QREFELT $ 54))
                (SEQ
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT $ 226)) 1
                                 (QREFELT $ 227))
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
                         (SPADCALL |cfac| (|spadConstant| $ 75)
                                   (QREFELT $ 82)))
                        (EXIT (|error| "impossible coeff"))))
                      (LETT |coeff1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u0| (QREFELT $ 21)) |nfp|
                                       (QREFELT $ 225))
                             |nf1| (QREFELT $ 228))
                            . #4#)
                      (LETT |coeff1_r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 35) 1
                                         (QREFELT $ 62))
                               (QREFELT $ 99))
                              |u_exp| (QREFELT $ 268))
                             |coeff1| (QREFELT $ 236))
                            . #4#)
                      (EXIT (CONS |coeff1_r| |res|))))
                ((SPADCALL |d| 1 (QREFELT $ 106))
                 (COND
                  ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
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
                                     (QREFELT $ 312))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 62))
                             (QREFELT $ 99))
                            |u_exp| (QREFELT $ 268))
                           (QREFELT $ 236))
                          . #4#)
                    (SEQ (LETT |i| 1 . #4#) G190
                         (COND ((|greater_SI| |i| |l1|) (GO G191)))
                         (SEQ (LETT |res| (CONS |gt| |res|) . #4#)
                              (EXIT
                               (LETT |gt| (SPADCALL |gt| |nf2| (QREFELT $ 236))
                                     . #4#)))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))))
                (#5# (|error| "unimplemented"))))))) 

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
                    (|:| |shift_part| F)))
         (|denf| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         (|der| |Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |List| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|res| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#1=#:G1010 NIL) (|scand| NIL))
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
          (|:| |factor| (|SparseUnivariatePolynomial| F)) (|:| |coeff| F)
          (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
          (|:| |alg_part| (|SparseUnivariatePolynomial| F))
          (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |u_part| F) (|:| |exponent| (|Integer|)) (|:| |shift_part| F))
         (|denf| |SparseUnivariatePolynomial| F)
         (|denf1| |SparseUnivariatePolynomial| F) (|gexp| |Integer|)
         (|k| |Kernel| F) ($ |List| F))
        (SPROG
         ((|res| (|List| F)) (|f1| (F)) (|ff| (F)) (|c1| (F)) (|j1| (F))
          (|j| NIL) (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lf| (F)) (|l1| (|NonNegativeInteger|)) (#1=#:G1014 NIL)
          (|gpow| (|Integer|)) (#2=#:G1012 NIL) (|d| (|Integer|)) (|f| (F))
          (|nf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|uc| (F))
          (|vshift| (F)) (|cfac| (|SparseUnivariatePolynomial| F))
          (|nn| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |nn| (QVELT |scand| 1) . #3=(|RDEEFX;get_prims|))
              (LETT |cfac| (QVELT |scand| 5) . #3#)
              (LETT |vshift| (QVELT |scand| 10) . #3#)
              (LETT |uc| (QVELT |scand| 2) . #3#)
              (LETT |nf| (QVELT |scand| 6) . #3#)
              (LETT |f| (SPADCALL |nf| |k| (QREFELT $ 101)) . #3#)
              (LETT |d| (QVELT |scand| 0) . #3#)
              (EXIT
               (COND
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |vshift| (QREFELT $ 61))
                             (QREFELT $ 277))
                   (SPADCALL |f| (QREFELT $ 278)) (QREFELT $ 29))))
                ((SPADCALL |d| 1 (QREFELT $ 106))
                 (COND
                  ((SPADCALL |cfac| (|spadConstant| $ 75) (QREFELT $ 82))
                   (|error| "unimplemented"))
                  (#4='T
                   (SEQ
                    (LETT |gpow|
                          (PROG2
                              (LETT #2# (SPADCALL |gexp| |d| (QREFELT $ 91))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #2#))
                          . #3#)
                    (LETT |l1|
                          (PROG1 (LETT #1# (- |d| 1) . #3#)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          . #3#)
                    (LETT |lf| (SPADCALL |d| (QREFELT $ 28)) . #3#)
                    (LETT |res| NIL . #3#) (LETT |nf2| (QVELT |scand| 7) . #3#)
                    (SEQ (LETT |j| 1 . #3#) G190
                         (COND ((|greater_SI| |j| |l1|) (GO G191)))
                         (SEQ
                          (LETT |j1|
                                (SPADCALL (SPADCALL |j| (QREFELT $ 28)) |lf|
                                          (QREFELT $ 60))
                                . #3#)
                          (LETT |c1|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |uc| (QREFELT $ 61))
                                            (SPADCALL |j1| (QREFELT $ 61))
                                            (QREFELT $ 313))
                                  (SPADCALL (SPADCALL |vshift| (QREFELT $ 61))
                                            (QREFELT $ 277))
                                  (QREFELT $ 29))
                                 |lf| (QREFELT $ 60))
                                . #3#)
                          (LETT |f1|
                                (COND
                                 ((EQL (SPADCALL 2 |j| (QREFELT $ 314)) |d|)
                                  (SEQ
                                   (LETT |ff|
                                         (SPADCALL |nf2| |k| (QREFELT $ 101))
                                         . #3#)
                                   (EXIT
                                    (SPADCALL
                                     (SPADCALL |c1|
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 315))
                                                (QREFELT $ 316))
                                               (QREFELT $ 29))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |uc| (QREFELT $ 61))
                                                 (QREFELT $ 316))
                                       |ff| (QREFELT $ 29))
                                      (QREFELT $ 317))
                                     (QREFELT $ 29)))))
                                 ('T
                                  (SPADCALL
                                   (SPADCALL |c1|
                                             (SPADCALL |j1|
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          61))
                                                       (QREFELT $ 318))
                                             (QREFELT $ 29))
                                   (QREFELT $ 61))))
                                . #3#)
                          (EXIT (LETT |res| (CONS |f1| |res|) . #3#)))
                         (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (NREVERSE |res|))))))
                (#4# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         (|lim| |Mapping|
          (|Union|
           (|Record| (|:| |mainpart| F)
                     (|:| |limitedlogs|
                          (|List|
                           (|Record| (|:| |coeff| F) (|:| |logand| F)))))
           "failed")
          F (|List| F))
         (|ext| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F F)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|res6|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|))))
          (|r1| (F)) (|rr1f| (F)) (#1=#:G1134 NIL)
          (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|ansp| (F))
          (|a1| (F))
          (|res4|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|f1| (F)) (|g1| (F)) (|u| (F)) (|rc| (|Integer|))
          (|rcu| (|Union| (|Integer|) "failed")) (|lc| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|spec1u| #2=(|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|base_case| (|Boolean|))
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
                      (|:| |shift_part| F))))
          (|her2|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ndenf| #3=(|SparseUnivariatePolynomial| F))
          (|denf_split|
           (|Record| (|:| |normal| #3#)
                     (|:| |special| (|SparseUnivariatePolynomial| F))))
          (|derivation2|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|gexp| (|Integer|)) (|gden1| (|SparseUnivariatePolynomial| F))
          (|#G409|
           (|Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
                     (|:| |exponent| (|Integer|))))
          (|res5|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|lp1u| #2#) (|lp| #4=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ulst| (|List| F)) (#5=#:G1140 NIL) (|kk| NIL) (#6=#:G1139 NIL)
          (|vlst| (|List| F)) (#7=#:G1138 NIL) (#8=#:G1137 NIL)
          (|lk1| (|List| #9=(|Kernel| F))) (#10=#:G1136 NIL) (#11=#:G1135 NIL)
          (|ng| (|SparseUnivariatePolynomial| F))
          (|degs| (|NonNegativeInteger|))
          (|ds| #12=(|SparseUnivariatePolynomial| F))
          (|nf| #13=(|SparseUnivariatePolynomial| F)) (|denf| #12#)
          (|fu| #14=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lnum| #13#) (|lden| #12#)
          (|her|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| #4#)
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |polypart| (|SparseUnivariatePolynomial| F))))
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|nfp| #13#) (|denfp| #12#) (|dk| #13#) (|dku| #14#) (|gu| #14#)
          (|fpu| #14#) (|k| (|Kernel| F)) (|lk| (|List| #9#)) (|fp| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fp|
                  (SPADCALL (SPADCALL |n| |f| (QREFELT $ 319)) |x|
                            (QREFELT $ 43))
                  . #15=(|RDEEFX;ei_int;I2FSMMR;44|))
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| $ 30) (QREFELT $ 41))
               (SEQ
                (LETT |res5|
                      (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 308))
                      . #15#)
                (EXIT
                 (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                         (|spadConstant| $ 30) (QVELT |res5| 2)))))
              (#16='T
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 215))
                                 (SPADCALL |g| (QREFELT $ 215))
                                 (QREFELT $ 217))
                       |x| (QREFELT $ 302))
                      . #15#)
                (LETT |k| (SPADCALL |lk| (QREFELT $ 320)) . #15#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |k| (QREFELT $ 322)) (QREFELT $ 8)
                             (QREFELT $ 323))
                   (SEQ
                    (LETT |res5|
                          (SPADCALL |n| |f| |g| |x| |lim| |ext|
                                    (QREFELT $ 308))
                          . #15#)
                    (EXIT
                     (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                             (|spadConstant| $ 30) (QVELT |res5| 2)))))
                  (#16#
                   (SEQ (LETT |f| (SPADCALL |n| |f| (QREFELT $ 319)) . #15#)
                        (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 153)) . #15#)
                        (LETT |gu| (SPADCALL |g| |k| (QREFELT $ 153)) . #15#)
                        (LETT |dku|
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 40)) |x|
                                         (QREFELT $ 276))
                               |k| (QREFELT $ 153))
                              . #15#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |dku| (QREFELT $ 208))
                                     (|spadConstant| $ 81) (QREFELT $ 82))
                           (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 30)
                                   (|spadConstant| $ 30) 'NIL))
                          (#16#
                           (SEQ
                            (LETT |dk| (SPADCALL |dku| (QREFELT $ 154)) . #15#)
                            (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 208))
                                  . #15#)
                            (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 154))
                                  . #15#)
                            (LETT |derivation|
                                  (CONS #'|RDEEFX;ei_int;I2FSMMR;44!1|
                                        (VECTOR |dk| |x| $ |denfp|))
                                  . #15#)
                            (LETT |her|
                                  (SPADCALL
                                   (SPADCALL |denfp| |gu| (QREFELT $ 225))
                                   |derivation| |nfp| (QREFELT $ 327))
                                  . #15#)
                            (LETT |lp| (QVELT |her| 1) . #15#)
                            (LETT |a1|
                                  (SPADCALL (QVELT |her| 0) |k|
                                            (QREFELT $ 101))
                                  . #15#)
                            (LETT |rr1|
                                  (SPADCALL
                                   (SPADCALL |lp|
                                             (SPADCALL (QVELT |her| 3)
                                                       (QREFELT $ 99))
                                             (QREFELT $ 237))
                                   (QVELT |her| 2) (QREFELT $ 237))
                                  . #15#)
                            (LETT |rr1|
                                  (SPADCALL |rr1|
                                            (SPADCALL |denfp| (QREFELT $ 99))
                                            (QREFELT $ 228))
                                  . #15#)
                            (LETT |r1|
                                  (SPADCALL |g|
                                            (SPADCALL |rr1| |k|
                                                      (QREFELT $ 101))
                                            (QREFELT $ 34))
                                  . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL |rr1| (|spadConstant| $ 184)
                                         (QREFELT $ 300))
                               (VECTOR |a1| |g| (|spadConstant| $ 30) 'T))
                              (#16#
                               (SEQ
                                (LETT |lden| (SPADCALL |lp| (QREFELT $ 208))
                                      . #15#)
                                (LETT |lnum| (SPADCALL |lp| (QREFELT $ 154))
                                      . #15#)
                                (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 153))
                                      . #15#)
                                (LETT |denf| (SPADCALL |fu| (QREFELT $ 208))
                                      . #15#)
                                (LETT |nf| (SPADCALL |fu| (QREFELT $ 154))
                                      . #15#)
                                (COND
                                 ((SPADCALL |denf| (|spadConstant| $ 81)
                                            (QREFELT $ 84))
                                  (COND
                                   ((EQL (SPADCALL |nf| (QREFELT $ 58)) 0)
                                    (COND
                                     ((SPADCALL |k| '|exp| (QREFELT $ 38))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |lp| (|spadConstant| $ 184)
                                                   (QREFELT $ 328))
                                         (VECTOR |a1| |r1|
                                                 (|spadConstant| $ 30) 'NIL))
                                        (#16#
                                         (SEQ
                                          (LETT |ds|
                                                (SPADCALL (QVELT |her| 2)
                                                          (QREFELT $ 208))
                                                . #15#)
                                          (COND
                                           ((OR
                                             (SPADCALL
                                              (SPADCALL |ds| (QREFELT $ 83))
                                              (|spadConstant| $ 75)
                                              (QREFELT $ 82))
                                             (SPADCALL
                                              (SPADCALL |ds| (QREFELT $ 76))
                                              (|spadConstant| $ 35)
                                              (QREFELT $ 110)))
                                            (EXIT
                                             (|error|
                                              "unexpected special part"))))
                                          (LETT |degs|
                                                (SPADCALL |ds| (QREFELT $ 58))
                                                . #15#)
                                          (LETT |ng|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 35) |degs|
                                                   (QREFELT $ 62))
                                                  (QVELT |her| 3)
                                                  (QREFELT $ 69))
                                                 (SPADCALL (QVELT |her| 2)
                                                           (QREFELT $ 154))
                                                 (QREFELT $ 63))
                                                . #15#)
                                          (LETT |res5|
                                                (|RDEEFX;ei_int_exp| |f| |ng|
                                                 |degs| |x| |k| |lim| |ext| $)
                                                . #15#)
                                          (LETT |a1|
                                                (SPADCALL |a1| (QVELT |res5| 0)
                                                          (QREFELT $ 26))
                                                . #15#)
                                          (LETT |r1|
                                                (SPADCALL |r1| (QVELT |res5| 1)
                                                          (QREFELT $ 26))
                                                . #15#)
                                          (EXIT
                                           (VECTOR |a1| |r1| (QVELT |res5| 2)
                                                   (QVELT |res5| 3)))))))))))))
                                (LETT |lk1|
                                      (PROGN
                                       (LETT #11# NIL . #15#)
                                       (SEQ (LETT |kk| NIL . #15#)
                                            (LETT #10# |lk| . #15#) G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #10#)
                                                         . #15#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((COND
                                                 ((SPADCALL |kk| '|log|
                                                            (QREFELT $ 38))
                                                  'T)
                                                 (#16#
                                                  (SPADCALL |kk| '|exp|
                                                            (QREFELT $ 38))))
                                                (LETT #11# (CONS |kk| #11#)
                                                      . #15#)))))
                                            (LETT #10# (CDR #10#) . #15#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #11#))))
                                      . #15#)
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #8# NIL . #15#)
                                       (SEQ (LETT |kk| NIL . #15#)
                                            (LETT #7# |lk1| . #15#) G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #7#) . #15#)
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
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          40)))
                                                      ('T
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           226))
                                                        1 (QREFELT $ 227))))
                                                     #8#)
                                                    . #15#)))
                                            (LETT #7# (CDR #7#) . #15#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #8#))))
                                      . #15#)
                                (LETT |ulst|
                                      (PROGN
                                       (LETT #6# NIL . #15#)
                                       (SEQ (LETT |kk| NIL . #15#)
                                            (LETT #5# |lk1| . #15#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #5#) . #15#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          38))
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           226))
                                                        1 (QREFELT $ 227)))
                                                      ('T
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          40))))
                                                     #6#)
                                                    . #15#)))
                                            (LETT #5# (CDR #5#) . #15#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      . #15#)
                                (LETT |ar1|
                                      (|RDEEFX;handle_logpart| |lnum| |lden|
                                       |nf| |denf| |nfp| |denfp| |k| |vlst|
                                       |ulst| |x| $)
                                      . #15#)
                                (LETT |ansp| (QVELT |ar1| 0) . #15#)
                                (LETT |lp|
                                      (SPADCALL |lp| (QVELT |ar1| 1)
                                                (QREFELT $ 244))
                                      . #15#)
                                (QSETVELT |her| 2
                                          (SPADCALL (QVELT |her| 2)
                                                    (QVELT |ar1| 3)
                                                    (QREFELT $ 244)))
                                (QSETVELT |her| 3
                                          (SPADCALL (QVELT |her| 3)
                                                    (QVELT |ar1| 2)
                                                    (QREFELT $ 177)))
                                (LETT |lp1u| (SPADCALL |lp| (QREFELT $ 240))
                                      . #15#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |lp1u| 1)
                                   (VECTOR |a1| |r1| (|spadConstant| $ 30)
                                           'NIL))
                                  (#16#
                                   (SEQ
                                    (QSETVELT |her| 3
                                              (SPADCALL (QVELT |her| 3)
                                                        (QCDR |lp1u|)
                                                        (QREFELT $ 63)))
                                    (COND
                                     ((SPADCALL (QVELT |her| 3)
                                                (|spadConstant| $ 75)
                                                (QREFELT $ 84))
                                      (COND
                                       ((SPADCALL (QVELT |her| 2)
                                                  (|spadConstant| $ 184)
                                                  (QREFELT $ 300))
                                        (EXIT (VECTOR |a1| |g| |ansp| 'T))))))
                                    (COND
                                     ((SPADCALL |denf| (|spadConstant| $ 81)
                                                (QREFELT $ 84))
                                      (COND
                                       ((EQL (SPADCALL |nf| (QREFELT $ 58)) 0)
                                        (COND
                                         ((OR
                                           (SPADCALL |k| '|log| (QREFELT $ 38))
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT $ 322))
                                            (QREFELT $ 9) (QREFELT $ 323)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |lp|
                                                       (|spadConstant| $ 184)
                                                       (QREFELT $ 328))
                                             (VECTOR |a1| |r1|
                                                     (|spadConstant| $ 30)
                                                     'NIL))
                                            ((SPADCALL (QVELT |her| 2)
                                                       (|spadConstant| $ 184)
                                                       (QREFELT $ 328))
                                             (|error|
                                              "unexpected special part"))
                                            (#16#
                                             (SEQ
                                              (LETT |res5|
                                                    (|RDEEFX;ei_int_log| |f|
                                                     (QVELT |her| 3) |x| |k|
                                                     |lim| |ext| $)
                                                    . #15#)
                                              (LETT |a1|
                                                    (SPADCALL |a1|
                                                              (QVELT |res5| 0)
                                                              (QREFELT $ 26))
                                                    . #15#)
                                              (LETT |r1|
                                                    (SPADCALL |r1|
                                                              (QVELT |res5| 1)
                                                              (QREFELT $ 26))
                                                    . #15#)
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
                                           (QVELT |her| 2) (QREFELT $ 237))
                                          . #15#)
                                    (LETT |rr1|
                                          (SPADCALL |rr1|
                                                    (SPADCALL |denfp|
                                                              (QREFELT $ 99))
                                                    (QREFELT $ 228))
                                          . #15#)
                                    (PROGN
                                     (LETT |#G409|
                                           (|RDEEFX;gamma_denominator| |denf|
                                            |k| $)
                                           . #15#)
                                     (LETT |gden1| (QCAR |#G409|) . #15#)
                                     (LETT |gexp| (QCDR |#G409|) . #15#)
                                     |#G409|)
                                    (LETT |derivation2|
                                          (CONS #'|RDEEFX;ei_int;I2FSMMR;44!3|
                                                (VECTOR |dk| |x| $))
                                          . #15#)
                                    (LETT |denf_split|
                                          (SPADCALL |denf| |derivation2|
                                                    (QREFELT $ 331))
                                          . #15#)
                                    (LETT |ndenf| (QCAR |denf_split|) . #15#)
                                    (LETT |her2|
                                          (|RDEEFX;special_Hermite| |rr1| |nfp|
                                           |ndenf| |denfp| |derivation2| $)
                                          . #15#)
                                    (LETT |a1|
                                          (SPADCALL |a1|
                                                    (SPADCALL (QCAR |her2|) |k|
                                                              (QREFELT $ 101))
                                                    (QREFELT $ 26))
                                          . #15#)
                                    (LETT |rr1| (QCDR |her2|) . #15#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |rr1| (|spadConstant| $ 184)
                                                 (QREFELT $ 300))
                                       (VECTOR |a1| |g| |ansp| 'T))
                                      (#16#
                                       (SEQ
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 81)
                                                    (QREFELT $ 84))
                                          (COND
                                           ((EQL (SPADCALL |nf| (QREFELT $ 58))
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
                                              . #15#)
                                        (LETT |derivation3|
                                              (CONS
                                               #'|RDEEFX;ei_int;I2FSMMR;44!4|
                                               (VECTOR |derivation2| $))
                                              . #15#)
                                        (LETT |scoeffs|
                                              (|RDEEFX;get_scoeffs| |scands|
                                               |denf| |k| |derivation3| $)
                                              . #15#)
                                        (LETT |base_case|
                                              (QEQCAR
                                               (SPADCALL |k| (QREFELT $ 333))
                                               0)
                                              . #15#)
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| $ 81)
                                                    (QREFELT $ 84))
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |nfp| (QREFELT $ 58)) 0
                                             (QREFELT $ 70))
                                            (EXIT
                                             (|RDEEFX;special_integrate1| |nfp|
                                              |f| |k| |x| |rr1| |a1| |r1| |g|
                                              |ansp| |scoeffs| |scands| |gexp|
                                              |derivation| |lim| $))))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |denf| (QREFELT $ 58)) 0
                                            (QREFELT $ 70))
                                           (SEQ
                                            (LETT |res3|
                                                  (|RDEEFX;special_integrate2|
                                                   |nfp| |denfp| |denf| |ndenf|
                                                   |f| |k| |x| |rr1| |a1| |r1|
                                                   |g| |scoeffs| |scands|
                                                   |gexp| |derivation2| |lim|
                                                   $)
                                                  . #15#)
                                            (EXIT
                                             (VECTOR
                                              (SPADCALL |a1| (QVELT |res3| 0)
                                                        (QREFELT $ 26))
                                              (SPADCALL |r1| (QVELT |res3| 1)
                                                        (QREFELT $ 26))
                                              (SPADCALL |ansp| (QVELT |res3| 2)
                                                        (QREFELT $ 26))
                                              (QVELT |res3| 3)))))
                                          (#16#
                                           (SEQ
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| $ 81)
                                                        (QREFELT $ 84))
                                              (COND
                                               ((SPADCALL |k| '|log|
                                                          (QREFELT $ 38))
                                                (COND
                                                 ((EQL
                                                   (SPADCALL |nf|
                                                             (QREFELT $ 58))
                                                   1)
                                                  (SEQ
                                                   (LETT |spec1u|
                                                         (SPADCALL |rr1|
                                                                   (QREFELT $
                                                                            240))
                                                         . #15#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |spec1u| 1)
                                                      (|error| "impossible 9"))
                                                     (#16#
                                                      (SEQ
                                                       (LETT |spec1p|
                                                             (QCDR |spec1u|)
                                                             . #15#)
                                                       (EXIT
                                                        (COND
                                                         ((EQL
                                                           (SPADCALL |spec1p|
                                                                     (QREFELT $
                                                                              58))
                                                           0)
                                                          (SEQ
                                                           (LETT |lc|
                                                                 (SPADCALL |nf|
                                                                           (QREFELT
                                                                            $
                                                                            76))
                                                                 . #15#)
                                                           (LETT |rcu|
                                                                 (SPADCALL |lc|
                                                                           (QREFELT
                                                                            $
                                                                            112))
                                                                 . #15#)
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |rcu| 1)
                                                              "skip")
                                                             (#16#
                                                              (SEQ
                                                               (LETT |rc|
                                                                     (QCDR
                                                                      |rcu|)
                                                                     . #15#)
                                                               (LETT |u|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |k|
                                                                        (QREFELT
                                                                         $
                                                                         226))
                                                                       1
                                                                       (QREFELT
                                                                        $ 227))
                                                                      |rc|
                                                                      (QREFELT
                                                                       $ 42))
                                                                     . #15#)
                                                               (LETT |g1|
                                                                     (SPADCALL
                                                                      |spec1p|
                                                                      0
                                                                      (QREFELT
                                                                       $ 59))
                                                                     . #15#)
                                                               (LETT |f1|
                                                                     (SPADCALL
                                                                      |nf| 0
                                                                      (QREFELT
                                                                       $ 59))
                                                                     . #15#)
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
                                                                       $ 311))
                                                                     . #15#)
                                                               (LETT |a1|
                                                                     (SPADCALL
                                                                      |a1|
                                                                      (SPADCALL
                                                                       (QVELT
                                                                        |res4|
                                                                        0)
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 60))
                                                                      (QREFELT
                                                                       $ 26))
                                                                     . #15#)
                                                               (LETT |ansp|
                                                                     (SPADCALL
                                                                      |ansp|
                                                                      (QVELT
                                                                       |res4|
                                                                       2)
                                                                      (QREFELT
                                                                       $ 26))
                                                                     . #15#)
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
                                                                          60))
                                                                        (QREFELT
                                                                         $ 21))
                                                                       (QREFELT
                                                                        $ 177))
                                                                      (QREFELT
                                                                       $ 99))
                                                                     . #15#)
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
                                                                     . #15#)
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #1#
                                                                       (VECTOR
                                                                        |a1|
                                                                        |r1|
                                                                        |ansp|
                                                                        (QVELT
                                                                         |res4|
                                                                         3))
                                                                       . #15#)
                                                                 (GO
                                                                  #17=#:G1133))))))))))))))))))))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |rr1|
                                                         (|spadConstant| $ 184)
                                                         (QREFELT $ 300))
                                               (VECTOR |a1| |g| |ansp| 'T))
                                              (#16#
                                               (SEQ
                                                (LETT |rr1f|
                                                      (SPADCALL |rr1| |k|
                                                                (QREFELT $
                                                                         101))
                                                      . #15#)
                                                (LETT |r1|
                                                      (SPADCALL |g| |rr1f|
                                                                (QREFELT $ 34))
                                                      . #15#)
                                                (LETT |res6|
                                                      (SPADCALL 1 |f| |rr1f|
                                                                |x| |lim| |ext|
                                                                (QREFELT $
                                                                         308))
                                                      . #15#)
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
          #17# (EXIT #1#)))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |derivation2|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEEFX;ei_int;I2FSMMR;44|))
          (LETT |derivation2| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z1| (QREFELT $ 154)) |derivation2|)
               (SPADCALL |z1| (QREFELT $ 208)) (QREFELT $ 69))
              (SPADCALL (SPADCALL |z1| (QREFELT $ 154))
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 208))
                                  |derivation2|)
                        (QREFELT $ 69))
              (QREFELT $ 177))
             (SPADCALL (SPADCALL |z1| (QREFELT $ 208))
                       (SPADCALL |z1| (QREFELT $ 208)) (QREFELT $ 69))
             (QREFELT $ 183)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44!3| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEEFX;ei_int;I2FSMMR;44|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEEFX;ei_int;I2FSMMR;44!2|
                                   (VECTOR $ |x|))
                             |dk| (QREFELT $ 324))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44!2| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 276)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| $ |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3) . #1=(|RDEEFX;ei_int;I2FSMMR;44|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2FSMMR;44!0|
                                             (VECTOR $ |x|))
                                       |dk| (QREFELT $ 324))
                             (QREFELT $ 69))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSMMR;44!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 276)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX| (&REST #1=#:G1141)
  (SPROG NIL
         (PROG (#2=#:G1142)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryRischDEX|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryRischDEX;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX|)))))))))) 

(DEFUN |ElementaryRischDEX;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDEX|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryRischDEX| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 334) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 9 '|prim|)
          (QSETREFV $ 181 (SPADCALL (QREFELT $ 56)))
          $))) 

(MAKEPROP '|ElementaryRischDEX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|SparseUnivariatePolynomial| $) (|Kernel| 7)
              (|SparseMultivariatePolynomial| 6 11) (0 . |univariate|)
              (|SparseMultivariatePolynomial| 6 39) (6 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 12)
              (|SparseUnivariatePolynomial| 12)
              (|SparseUnivariatePolynomialFunctions2| 12 7) (11 . |map|)
              (17 . |coerce|) (|SparseUnivariatePolynomial| 16)
              (|Mapping| 16 7) (|SparseUnivariatePolynomialFunctions2| 7 16)
              (22 . |map|) (28 . +) (|Integer|) (34 . |coerce|) (39 . *)
              (45 . |Zero|) (|Mapping| 7 7 7) (|List| 7) (49 . |reduce|)
              (56 . -) (62 . |One|) (|Boolean|) (|Symbol|) (66 . |is?|)
              (|Kernel| $) (72 . |coerce|) (77 . =) (83 . ^) (89 . D)
              (|Vector| 7) (95 . |vector|) (|Union| 50 '"failed")
              (|IntegerLinearDependence| 7) (100 . |particularSolutionOverQ|)
              (|Record| (|:| |num| 85) (|:| |den| 27)) (|Vector| 117)
              (|InnerCommonDenominator| 27 117 85 50)
              (106 . |splitDenominator|) (111 . |One|) (115 . ~=)
              (|SingletonAsOrderedSet|) (121 . |create|) (|NonNegativeInteger|)
              (125 . |degree|) (130 . |coefficient|) (136 . /) (142 . -)
              (147 . |monomial|) (153 . +) (159 . |eval|)
              (166 . |coefficients|) (|Mapping| 36 7) (171 . |every?|)
              (177 . |Zero|) (181 . *) (187 . >) (193 . |monomial|)
              (199 . |coerce|) (204 . +) (210 . |resultant|) (216 . |Zero|)
              (220 . |leadingCoefficient|) (225 . /) (231 . |gcd|)
              (|Union| $ '"failed") (237 . |exquo|) (243 . |One|) (247 . ~=)
              (253 . |reductum|) (258 . =) (|List| 27) (|Vector| 27)
              (264 . |vector|) (|List| $) (269 . |gcd|) (274 . |elt|)
              (280 . |exquo|) (286 . |setelt!|) (293 . |invmod|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (299 . |extendedEuclidean|) (305 . *) (311 . +) (|Fraction| 16)
              (317 . |coerce|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6 12 7)
              (322 . |multivariate|) (328 . |numer|) (|Factored| 12)
              (|DenominatorIntegration| 6 7) (333 . |factor|) (338 . >)
              (|Record| (|:| |factor| 12) (|:| |exponent| 27)) (|List| 107)
              (344 . |factors|) (349 . ~=) (|Union| 27 '#1="failed")
              (355 . |retractIfCan|) (360 . |One|) (364 . *)
              (|Record| (|:| |particular| 46) (|:| |basis| (|List| 50)))
              (370 . |solveLinearlyOverQ|) (|Fraction| 27) (376 . |coerce|)
              (|List| 117) (381 . |entries|) (386 . |vector|) (391 . |entries|)
              (396 . |One|) (400 . |One|) (404 . |One|) (408 . |One|)
              (|Fraction| 138) (|Equation| 127) (412 . |rhs|) (417 . |Zero|)
              (421 . ~=) (427 . |lhs|) (432 . |retract|) (437 . ~=)
              (|Union| 138 '#2="failed") (443 . |retractIfCan|)
              (|Union| 7 '"failed") (|Polynomial| 7) (448 . |retractIfCan|)
              (|Union| 117 '#1#) (453 . |retractIfCan|) (458 . |numer|)
              (|List| 37) (463 . |variables|) (468 . |member?|)
              (474 . |kernel|) (479 . |eval|) (486 . |retract|)
              (|FunctionSpaceRationalRoots| 6 7) (491 . |get_rational_roots|)
              (497 . |coerce|) (|Fraction| 10) (502 . |univariate|)
              (508 . |numer|) (513 . |rest|) (|List| 11) (518 . |rest|)
              (|SparseUnivariatePolynomial| 138) (|Mapping| 138 7)
              (|SparseUnivariatePolynomialFunctions2| 7 138) (523 . |map|)
              (529 . |multivariate|) (535 . |coerce|) (|List| 169) (|List| 127)
              (|SystemSolvePackage| 7) (540 . |solve|) (546 . -) (|List| 128)
              (552 . |last|) (557 . |coerce|) (562 . |univariate|)
              (567 . |new|) (571 . |rem|) (577 . |retractIfCan|)
              (582 . |differentiate|) (587 . -) (593 . |resultant|)
              (599 . |member?|) (605 . *) '|dummy| (611 . ^) (617 . /)
              (623 . |Zero|) (|Record| (|:| |factor| 16) (|:| |exponent| 27))
              (|List| 185) (|Factored| 16) (627 . |factors|)
              (|Mapping| 16 16 16) (|List| 16) (632 . |reduce|) (639 . |unit|)
              (644 . |retract|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 194) (|:| |fctr| 16) (|:| |xpnt| 27))
              (|List| 195) (649 . |makeFR|) (|PositiveInteger|) (655 . *)
              (|Factored| $) (661 . |squareFree|) (|Union| 44 '"failed")
              (|Mapping| 7 7) (|List| 203) (|ConstantLinearDependence| 6 7)
              (666 . |particularSolutionOverConstants|) (673 . |elt|)
              (679 . |denom|) (684 . |max|) (|Mapping| 57 57 57) (|List| 57)
              (690 . |reduce|) (696 . |minimumDegree|) (|List| 39)
              (701 . |tower|) (|IntegrationTools| 6 7) (706 . |union|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 218)))
              (|Union| 219 '"failed") (|Mapping| 220 7 32)
              (|ElementaryRischDE| 6 7) (712 . |boundAt0|) (724 . |boundInf|)
              (737 . *) (743 . |argument|) (748 . |elt|) (754 . /)
              (760 . |retract|) (|Record| (|:| |ans| 16) (|:| |remainder| 16))
              (|Record| (|:| |ans| 190) (|:| |acoeff| 16) (|:| |eegen| 16)
                        (|:| |bpar| 16) (|:| |lcpar| 190) (|:| |dpar| 27))
              (|Union| (|List| 230) 231) (|Mapping| 16 16) (|RDEaux| 7)
              (765 . |multi_SPDE|) (774 . *) (780 . +) (786 . |setelt!|)
              (|Union| 16 '#2#) (793 . |retractIfCan|)
              (|Record| (|:| |ans| 16) (|:| |nosol| 36))
              (|TranscendentalRischDE| 7 16) (798 . |SPDEnocancel1|) (806 . -)
              (812 . |denom|) (817 . *) (|Mapping| 12 12 12) (|List| 12)
              (823 . |reduce|) (830 . *) (836 . ^) (842 . |unit|)
              (847 . |retract|) (852 . *) (858 . ^) (864 . |concat|)
              (870 . |elt|) (876 . ^) (882 . ~=) (888 . /) (894 . |reduce|)
              (|PartialFractionUtilities| 7 16) (900 . |decompose|)
              (906 . |univariate|) (913 . |rootOf|) (918 . |retract|) (923 . *)
              (929 . ^) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (935 . |divide|) (941 . |elt|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 272 '"failed") (947 . |extendedEuclidean|)
              (954 . |retractIfCan|) (959 . |differentiate|) (965 . |exp|)
              (970 . |Ei|) (975 . |zerosOf|) (980 . |eval|)
              (|Union| (|List| 32) '"failed") (987 . |solve_u|)
              (994 . |retract|) (|Matrix| 27) (999 . |elt|) (|Vector| 16)
              (1006 . |elt|)
              (|Record| (|:| |factor| 16) (|:| |ratpart| 27) (|:| |v_part| 7)
                        (|:| |alg_part| 16) (|:| |u_part| 7)
                        (|:| |exponent| 27) (|:| |shift_part| 7))
              (|List| 288) (1012 . |elt|) (1018 . |One|) (|Fraction| 22)
              (1022 . |One|) (1026 . ~=) (1032 . <=) (1038 . |vector|)
              (|Record| (|:| |basis| 286) (|:| |transform| 284))
              (|GcdBasis| 16) (1043 . |gcdDecomposition|) (1048 . =)
              (1054 . |elt|) (1061 . |varselect|) (1067 . |ksec|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 36))
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 305 '"failed") (|Mapping| 306 7 7) (1074 . |rischDE|)
              (1084 . ^)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 36))
              |RDEEFX;ei_int;I2FSMMR;44| (1090 . *) (1096 . ^) (1102 . *)
              (1108 . |pi|) (1112 . |sqrt|) (1117 . |erf|) (1122 . |Gamma|)
              (1128 . *) (1134 . |kmax|) (|BasicOperator|) (1139 . |operator|)
              (1144 . |has?|) (1150 . |differentiate|)
              (|Record| (|:| |answer| 98) (|:| |logpart| 98)
                        (|:| |specpart| 98) (|:| |polypart| 16))
              (|TranscendentalHermiteIntegration| 7 16)
              (1157 . |HermiteIntegrate|) (1164 . ~=)
              (|Record| (|:| |normal| 16) (|:| |special| 16))
              (|MonomialExtensionTools| 7 16) (1170 . |split|)
              (|Union| 37 '"failed") (1176 . |symbolIfCan|))
           '#(|ei_int| 1181) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 333
                                                 '(2 12 10 0 11 13 1 7 0 14 15
                                                   2 19 16 17 18 20 1 16 0 7 21
                                                   2 24 22 23 16 25 2 7 0 0 0
                                                   26 1 7 0 27 28 2 7 0 0 0 29
                                                   0 7 0 30 3 32 7 31 0 7 33 2
                                                   7 0 0 0 34 0 7 0 35 2 11 36
                                                   0 37 38 1 7 0 39 40 2 7 36 0
                                                   0 41 2 7 0 0 27 42 2 7 0 0
                                                   37 43 1 44 0 32 45 2 47 46
                                                   44 7 48 1 51 49 50 52 0 6 0
                                                   53 2 27 36 0 0 54 0 55 0 56
                                                   1 16 57 0 58 2 16 7 0 57 59
                                                   2 7 0 0 0 60 1 7 0 0 61 2 16
                                                   0 7 57 62 2 16 0 0 0 63 3 16
                                                   0 0 55 0 64 1 16 32 0 65 2
                                                   32 36 66 0 67 0 6 0 68 2 16
                                                   0 0 0 69 2 57 36 0 0 70 2 22
                                                   0 16 57 71 1 22 0 16 72 2 22
                                                   0 0 0 73 2 22 16 0 0 74 0 16
                                                   0 75 1 16 7 0 76 2 16 0 0 7
                                                   77 2 16 0 0 0 78 2 16 79 0 0
                                                   80 0 16 0 81 2 16 36 0 0 82
                                                   1 16 0 0 83 2 16 36 0 0 84 1
                                                   86 0 85 87 1 27 0 88 89 2 86
                                                   27 0 27 90 2 27 79 0 0 91 3
                                                   86 27 0 27 27 92 2 27 0 0 0
                                                   93 2 27 94 0 0 95 2 86 0 27
                                                   0 96 2 86 0 0 0 97 1 98 0 16
                                                   99 2 100 7 98 11 101 1 7 14
                                                   0 102 1 104 103 12 105 2 27
                                                   36 0 0 106 1 103 108 0 109 2
                                                   7 36 0 0 110 1 7 111 0 112 0
                                                   12 0 113 2 16 0 7 0 114 2 47
                                                   115 44 7 116 1 117 0 27 118
                                                   1 50 119 0 120 1 50 0 119
                                                   121 1 86 85 0 122 0 22 0 123
                                                   0 98 0 124 0 103 0 125 0 117
                                                   0 126 1 128 127 0 129 0 127
                                                   0 130 2 127 36 0 0 131 1 128
                                                   127 0 132 1 127 37 0 133 2
                                                   37 36 0 0 134 1 127 135 0
                                                   136 1 138 137 0 139 1 7 140
                                                   0 141 1 127 138 0 142 1 138
                                                   143 0 144 2 143 36 37 0 145
                                                   1 11 0 37 146 3 138 0 0 37 7
                                                   147 1 138 7 0 148 2 149 119
                                                   7 11 150 1 138 0 7 151 2 7
                                                   152 0 39 153 1 98 16 0 154 1
                                                   143 0 0 155 1 156 0 0 157 2
                                                   160 158 159 16 161 2 138 0
                                                   10 37 162 1 127 0 138 163 2
                                                   166 164 165 143 167 2 127 0
                                                   0 0 168 1 169 128 0 170 1 7
                                                   0 117 171 1 138 16 0 172 0
                                                   37 0 173 2 16 0 0 0 174 1
                                                   117 111 0 175 1 16 0 0 176 2
                                                   16 0 0 0 177 2 16 7 0 0 178
                                                   2 119 36 117 0 179 2 27 0 57
                                                   0 180 2 16 0 0 57 182 2 98 0
                                                   16 16 183 0 98 0 184 1 187
                                                   186 0 188 3 190 16 189 0 16
                                                   191 1 187 16 0 192 1 16 7 0
                                                   193 2 187 0 16 196 197 2 27
                                                   0 198 0 199 1 16 200 0 201 3
                                                   205 202 44 7 204 206 2 44 7
                                                   0 27 207 1 98 16 0 208 2 57
                                                   0 0 0 209 2 211 57 210 0 212
                                                   1 16 57 0 213 1 7 214 0 215
                                                   2 216 156 156 156 217 8 222
                                                   27 156 156 7 27 27 37 11 221
                                                   223 9 222 27 156 156 7 27 27
                                                   27 37 11 221 224 2 98 0 16 0
                                                   225 1 11 32 0 226 2 32 7 0
                                                   27 227 2 98 0 0 0 228 1 98
                                                   16 0 229 5 234 232 16 16 190
                                                   27 233 235 2 98 0 0 0 236 2
                                                   98 0 0 0 237 3 44 7 0 27 7
                                                   238 1 98 239 0 240 4 242 241
                                                   16 16 27 233 243 2 98 0 0 0
                                                   244 1 7 14 0 245 2 12 0 0 0
                                                   246 3 248 12 247 0 12 249 2
                                                   117 0 0 0 250 2 12 0 0 57
                                                   251 1 103 12 0 252 1 12 6 0
                                                   253 2 7 0 6 0 254 2 7 0 0
                                                   198 255 2 32 0 0 0 256 2 50
                                                   117 0 27 257 2 117 0 0 27
                                                   258 2 117 36 0 0 259 2 117 0
                                                   0 0 260 2 190 16 189 0 261 2
                                                   262 190 16 190 263 3 100 16
                                                   7 11 16 264 1 7 0 10 265 1 7
                                                   39 0 266 2 16 0 0 7 267 2 98
                                                   0 0 27 268 2 16 269 0 0 270
                                                   2 190 16 0 27 271 3 16 273 0
                                                   0 0 274 1 16 137 0 275 2 7 0
                                                   0 37 276 1 7 0 0 277 1 7 0 0
                                                   278 1 7 88 10 279 3 7 0 0 39
                                                   0 280 3 104 281 7 7 37 282 1
                                                   7 27 0 283 3 284 27 0 27 27
                                                   285 2 286 16 0 27 287 2 289
                                                   288 0 27 290 0 138 0 291 0
                                                   292 0 293 2 57 36 0 0 294 2
                                                   27 36 0 0 295 1 286 0 190
                                                   296 1 298 297 286 299 2 98
                                                   36 0 0 300 3 284 0 0 85 85
                                                   301 2 216 156 156 37 302 3
                                                   216 11 11 156 37 303 6 222
                                                   304 27 7 7 37 221 307 308 2
                                                   7 0 0 57 309 2 98 0 0 16 312
                                                   2 7 0 0 0 313 2 57 0 198 0
                                                   314 0 7 0 315 1 7 0 0 316 1
                                                   7 0 0 317 2 7 0 0 0 318 2 7
                                                   0 27 0 319 1 216 11 156 320
                                                   1 11 321 0 322 2 321 36 0 37
                                                   323 3 16 0 0 203 0 324 3 326
                                                   325 98 233 16 327 2 98 36 0
                                                   0 328 2 330 329 16 233 331 1
                                                   11 332 0 333 6 0 310 27 7 7
                                                   37 221 307 311)))))
           '|lookupComplete|)) 
