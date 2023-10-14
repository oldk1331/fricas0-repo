
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
         ((|kc| #1=(|Integer|)) (#2=#:G210 NIL) (|vi| NIL) (#3=#:G211 NIL)
          (|ki| NIL) (|kf| (|Expression| R)) (|u| (|Expression| R))
          (#4=#:G208 NIL) (|ui| NIL) (#5=#:G209 NIL) (#6=#:G207 NIL) (|ku| #1#)
          (#7=#:G205 NIL) (#8=#:G206 NIL) (|v0| (|Expression| R))
          (#9=#:G203 NIL) (#10=#:G204 NIL) (#11=#:G202 NIL))
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
                           (LETT |u| (SPADCALL |u| |ui| (QREFELT $ 29))
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
          (|dvvec| (|Vector| (|Expression| R))) (#2=#:G224 NIL) (|vi| NIL)
          (#3=#:G223 NIL))
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
          (#2=#:G244 NIL)
          (|ff3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#3=#:G234 NIL) (|ff2| #1#)
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
               (PROGN (LETT #2# (CONS 1 "failed") . #6#) (GO #7=#:G243)))))
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
                                (|check_union| (QEQCAR #3# 0)
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (QREFELT $ 6)))
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
                                       (|check_union| (QEQCAR #3# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (|Expression|
                                                        (QREFELT $ 6)))
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
                                (LETT #2# (CONS 1 #9="failed") . #6#)
                                (GO #7#))))))
                           (#8#
                            (EXIT
                             (PROGN
                              (LETT #2# (CONS 1 #9#) . #6#)
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
         ((#1=#:G252 NIL) (|i| NIL) (|av| #2=(|Vector| (|Integer|)))
          (|ki| (|Integer|)) (|di| (|Integer|)) (|g| #3=(|Integer|))
          (|c2| #4=(|Integer|)) (|c1| #5=(|Integer|))
          (|#G44|
           (|Record| (|:| |coef1| #5#) (|:| |coef2| #4#)
                     (|:| |generator| #3#)))
          (|ki1| (|Integer|)) (|di2| (|Integer|)) (|di1| (|Integer|))
          (#6=#:G267 NIL) (|bi| #7=(|Integer|)) (|ai| #7#)
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
                                                        (|check_union|
                                                         (QEQCAR #1# 0)
                                                         (|Integer|) #1#))
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
                                                       (GO #12=#:G266)))
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
                                                               (|check_union|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
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
                                                               (|check_union|
                                                                (QEQCAR #1# 0)
                                                                (|Integer|)
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
                                                                (|check_union|
                                                                 (QEQCAR #1# 0)
                                                                 (|Integer|)
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
          #12# (EXIT #6#)))) 

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
          (|dvs| (|List| #7=(|Expression| R))) (#8=#:G303 NIL) (|v| NIL)
          (#9=#:G302 NIL) (|dv1| #7#) (#10=#:G298 NIL)
          (|no_sol| #11=(|Boolean|))
          (|f2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|r0u| (|Union| (|Integer|) "failed")) (|r0f| (|Expression| R))
          (|b0p| #7#) (|b0| #12=(|Expression| R)) (|has_r0| #11#) (|a1p| #7#)
          (|tt| #6#) (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|deg1| (|NonNegativeInteger|)) (#13=#:G301 NIL) (|fac| NIL)
          (|dummy| (|SingletonAsOrderedSet|))
          (|ulst1| (|List| (|Expression| R)))
          (|vlst1| (|List| (|Expression| R))) (|u0| #1#) (#14=#:G299 NIL)
          (#15=#:G300 NIL) (|u| NIL) (|v0| (|Expression| R)) (|a0| #12#)
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
                                      (GO #18=#:G281)))))))
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
          (|fac| #1=(|SparseUnivariatePolynomial| (|Integer|))) (#2=#:G313 NIL)
          (|facr| NIL)
          (|facl|
           (|List| (|Record| (|:| |factor| #1#) (|:| |exponent| (|Integer|)))))
          (|ff| (|Factored| (|SparseUnivariatePolynomial| (|Integer|))))
          (|eq2z| (|SparseUnivariatePolynomial| (|Integer|)))
          (|pl2| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G312 NIL) (|i| NIL) (#4=#:G311 NIL)
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
          (|val2eq| (|Polynomial| (|Expression| R))) (#1=#:G350 NIL)
          (|val1r| NIL)
          (|eq1| (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))
          (|eq0p| (|Polynomial| (|Expression| R)))
          (|eq0| (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))
          (#2=#:G349 NIL) (|sol0| NIL)
          (|lsol0|
           (|List|
            (|List|
             (|Equation| (|Fraction| (|Polynomial| (|Expression| R)))))))
          (#3=#:G348 NIL) (|ci| NIL) (#4=#:G347 NIL)
          (|eqs0| (|List| (|Polynomial| (|Expression| R)))) (#5=#:G346 NIL)
          (|eqi| NIL) (#6=#:G345 NIL) (|k2| #7=(|Kernel| (|Expression| R)))
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
          (#2=#:G380 NIL)
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
          (#4=#:G379 NIL) (|r0| NIL) (|degn1| (|NonNegativeInteger|))
          (|degn| #5=(|NonNegativeInteger|)) (|degd| #5#)
          (|ratl| (|List| (|Fraction| (|Integer|)))) (|eq1| (|Expression| R))
          (|nnp| #3#) (#6=#:G378 NIL) (|sol| NIL) (|r_bad| (|Integer|))
          (|has_r_bad| (|Boolean|)) (|ccu| (|Union| (|Integer|) "failed"))
          (|cc| (|Expression| R))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part|
                           (|SparseUnivariatePolynomial| (|Expression| R))))))
          (|eqs0| (|List| (|Expression| R))) (#7=#:G377 NIL) (|ci| NIL)
          (#8=#:G376 NIL)
          (|qq| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|b| #9=(|Kernel| (|Expression| R))) (|bs| #10=(|Symbol|)) (|a| #9#)
          (|as| #10#) (|u0| #1#) (|ulst| (|List| (|Expression| R)))
          (|vlst| (|List| (|Expression| R))) (#11=#:G374 NIL) (|v| NIL)
          (#12=#:G375 NIL) (|u| NIL) (|kf| (|Expression| R)))
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
          (#2=#:G389 NIL) (|fac| NIL) (|degg| #1#)
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

(SDEFUN |RDEEFX;decompose1|
        ((|num| |SparseUnivariatePolynomial| (|Expression| R))
         (|den| |SparseUnivariatePolynomial| (|Expression| R))
         (|eidens| |List| (|SparseUnivariatePolynomial| (|Expression| R)))
         ($ |List| (|SparseUnivariatePolynomial| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|f1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G400 NIL))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT $ 71) |eidens|
                                              (QREFELT $ 206))
                                    (QREFELT $ 81))
                          . #2=(|RDEEFX;decompose1|))
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|SparseUnivariatePolynomial|
                                  (|Expression| (QREFELT $ 6)))
                                 #1#))
                . #2#)
          (COND
           ((SPADCALL |f1| (|spadConstant| $ 54) (QREFELT $ 82))
            (LETT |eidens| (CONS |f1| |eidens|) . #2#)))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT $ 207)) . #2#)
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
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT $ 208)) . #1#)
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
          (|lp_cor| #1#) (|ansp| #2=(|Expression| R)) (#3=#:G437 NIL)
          (|zz| NIL) (|zzl| (|List| (|Expression| R)))
          (|ansp1| (|Expression| R)) (|c| (|Expression| R))
          (|cu1| (|Union| (|Expression| R) "failed"))
          (|cp| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|cu|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|ppu|
           (|Union|
            (|Record|
             (|:| |coef1| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |coef2| (|SparseUnivariatePolynomial| (|Expression| R))))
            "failed"))
          (|ddf| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|lnum1| #4=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|reml| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lnum0| #4#)
          (|coeff1_rs|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|auxl| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|denf1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#5=#:G412 NIL)
          (|spec_den| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|min_deg| (|NonNegativeInteger|))
          (|dvr|
           (|Record|
            (|:| |quotient| (|SparseUnivariatePolynomial| (|Expression| R)))
            (|:| |remainder| #4#)))
          (|coeff1_r|
           #6=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|coeff1| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|numfp1| #7=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|ei_arg| #6#) (|eiarg_num| #7#) (|rf1k| (|Kernel| (|Expression| R)))
          (|rfc| #2#) (|vshift| (|Expression| R)) (|u_exp| (|Integer|))
          (|u0| (|Expression| R))
          (|cfac| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|v0| (|Expression| R)) (|r0| (|Integer|))
          (|eiden| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ (LETT |eiden| (QVELT |er| 0) . #8=(|RDEEFX;solve_factor1|))
              (LETT |r0| (QVELT |er| 1) . #8#) (LETT |v0| (QVELT |er| 2) . #8#)
              (LETT |cfac| (QVELT |er| 3) . #8#)
              (LETT |u0| (QVELT |er| 4) . #8#)
              (LETT |u_exp| (QVELT |er| 5) . #8#)
              (LETT |vshift| (QVELT |er| 6) . #8#)
              (LETT |rfc| (|spadConstant| $ 30) . #8#)
              (COND
               ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 209)) . #8#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 210)) . #8#)))))
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
                    . #8#)
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT $ 99))
                              (SPADCALL |denf| (QREFELT $ 99)) (QREFELT $ 211))
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
                              (QREFELT $ 64))
                    . #8#)
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT $ 71)) |u0|
                              (QREFELT $ 212))
                    . #8#)
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 35) 1 (QREFELT $ 63))
                        (QREFELT $ 99))
                       |u_exp| (QREFELT $ 213))
                      (SPADCALL |coeff1| (QREFELT $ 99)) (QREFELT $ 214))
                     (SPADCALL |eiarg_num| (QREFELT $ 99)) (QREFELT $ 211))
                    . #8#)
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 215)) . #8#)
              (LETT |coeff1_rs| (|spadConstant| $ 216) . #8#)
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 128)) |denf1|
                              (QREFELT $ 218))
                    . #8#)
              (LETT |lnum1| (QCDR |dvr|) . #8#)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT $ 38))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT $ 219)) . #8#)
                     (EXIT
                      (COND
                       ((SPADCALL |min_deg| 0 (QREFELT $ 72))
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| $ 35) |min_deg|
                                         (QREFELT $ 63))
                               . #8#)
                         (LETT |denf1|
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT $ 81))
                                         . #8#)
                                   (QCDR #5#)
                                 (|check_union| (QEQCAR #5# 0)
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (QREFELT $ 6)))
                                                #5#))
                               . #8#)
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT $ 207))
                               . #8#)
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT $ 220))
                               . #8#)
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT $ 220))
                                           (QREFELT $ 99))
                                 (SPADCALL |spec_den| (QREFELT $ 99))
                                 (QREFELT $ 211))
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
               ((SPADCALL |cfac| (|spadConstant| $ 70) (QREFELT $ 82))
                (SEQ
                 (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT $ 195))
                       . #8#)
                 (LETT |ddf|
                       (SPADCALL (SPADCALL |eiden| (QREFELT $ 197)) |denf1|
                                 (QREFELT $ 195))
                       . #8#)
                 (LETT |ppu| (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 223))
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
                                                          (QREFELT $ 197))
                                                (QREFELT $ 71))
                                      |denf1| (QREFELT $ 195))
                                     . #8#)))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT $ 81)) . #8#)
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                         (|spadConstant| $ 70) (|spadConstant| $ 216)))
                (#9#
                 (SEQ (LETT |cp| (QCDR |cu|) . #8#)
                      (LETT |cu1| (SPADCALL |cp| (QREFELT $ 224)) . #8#)
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                                 (|spadConstant| $ 70) (|spadConstant| $ 216)))
                        (#9#
                         (SEQ (LETT |c| (QCDR |cu1|) . #8#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT $ 225))
                                           (|spadConstant| $ 30)
                                           (QREFELT $ 110))
                                 (VECTOR (|spadConstant| $ 30)
                                         (|spadConstant| $ 216)
                                         (|spadConstant| $ 70)
                                         (|spadConstant| $ 216)))
                                (#9#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT $ 62))
                                                     |rfc| (QREFELT $ 34))
                                                    (QREFELT $ 226))
                                                   (QREFELT $ 29))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT $ 101))
                                          (QREFELT $ 227))
                                         (QREFELT $ 29))
                                        . #8#)
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| $ 70)
                                                    (QREFELT $ 84))
                                          (LIST (|spadConstant| $ 30)))
                                         (#9#
                                          (SPADCALL |cfac| (QREFELT $ 228))))
                                        . #8#)
                                  (LETT |ansp| (|spadConstant| $ 30) . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 70)
                                              (QREFELT $ 84))
                                    (LETT |ansp| |ansp1| . #8#))
                                   (#9#
                                    (SEQ (LETT |zz| NIL . #8#)
                                         (LETT #3# |zzl| . #8#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |zz| (CAR #3#) . #8#)
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
                                                                              229))
                                                           (QREFELT $ 26))
                                                 . #8#)))
                                         (LETT #3# (CDR #3#) . #8#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT $ 99))
                                                   (SPADCALL |denf1|
                                                             (QREFELT $ 99))
                                                   (QREFELT $ 211))
                                                  (QREFELT $ 230))
                                        . #8#)
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  |coeff1_rs| (QREFELT $ 230))
                                        . #8#)
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                                  (QCAR |dvr|) (QREFELT $ 71))
                                        . #8#)
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| $ 70)
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
                                                      (QREFELT $ 231))
                                            . #8#)))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| |SparseUnivariatePolynomial| (|Expression| R))
         (|p| |SparseUnivariatePolynomial| (|Expression| R)) ($ |Integer|))
        (SPROG
         ((|nn| (|Integer|)) (#1=#:G446 NIL)
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
                              (GO #3=#:G443)))
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
          (|ansp| #2=(|Expression| R)) (#3=#:G477 NIL) (|zz| NIL)
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
          (|ki| (|Integer|)) (|kif| #6#) (#7=#:G476 NIL) (|ck| NIL)
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
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT $ 209)) . #9#)
                     (EXIT
                      (LETT |rf1k| (SPADCALL |rfc| (QREFELT $ 210)) . #9#)))))
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
                                  |u0| (QREFELT $ 212))
                        . #9#)
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT $ 99))
                                  (SPADCALL |eiarg_num| (QREFELT $ 99))
                                  (QREFELT $ 211))
                        . #9#)
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT $ 215)) . #9#)
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT $ 128)) |denf1|
                                  (QREFELT $ 218))
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
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT $ 223))
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
                          (SPADCALL (QCDR |dvr|) (QREFELT $ 232)))
                         (#10#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) $)
                                 . #9#)
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|) (QREFELT $ 232))))))
                        . #9#)
                  (LETT |einum1| (SPADCALL |einum| (QREFELT $ 232)) . #9#)
                  (LETT |u1| (QVELT |er| 10) . #9#)
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT $ 61))
                                  |u1| |x| (QREFELT $ 234))
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                             (|spadConstant| $ 70) (|spadConstant| $ 216)))
                    (#10#
                     (SEQ (LETT |res1| (QCDR |res1u|) . #9#)
                          (LETT |ansp1| (|spadConstant| $ 30) . #9#)
                          (LETT |lp_cor| (|spadConstant| $ 216) . #9#)
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
                                 (#10# (SPADCALL |cfac| (QREFELT $ 228))))
                                . #9#)
                          (SEQ (LETT |ck| NIL . #9#) (LETT #7# |res1| . #9#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |ck| (CAR #7#) . #9#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT $ 235))
                                      . #9#)
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT $ 235))
                                      . #9#)
                                (LETT |ki| (SPADCALL |kif| (QREFELT $ 236))
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
                                       (QREFELT $ 211))
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
                                                            (QREFELT $ 226))
                                                           (QREFELT $ 29))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT $ 227))
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
                                                (QREFELT $ 230))
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
                                                   |eiargp| (QREFELT $ 214))
                                                  |eiargi_r| (QREFELT $ 211))
                                                 (QREFELT $ 237))
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
                                                               (QREFELT $ 229))
                                                     (QREFELT $ 26))
                                           . #9#)))
                                   (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT $ 128))
                                          (SPADCALL |lp_cor| (QREFELT $ 215))
                                          (QREFELT $ 218))
                                . #9#)
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT $ 99))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT $ 215))
                                     (QREFELT $ 99))
                                    (QREFELT $ 211))
                                   (QCAR |dvr2|)
                                   (|spadConstant| $ 216)))))))))))))) 

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
          (#2=#:G487 NIL) (|einum| NIL) (#3=#:G488 NIL) (|er| NIL)
          (|einums| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|eidens| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#4=#:G486 NIL) (#5=#:G485 NIL)
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
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                     (|spadConstant| $ 70) (|spadConstant| $ 216)))
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
              (LETT |lp_cor| (|spadConstant| $ 216) . #6#)
              (LETT |sp_cor| (|spadConstant| $ 216) . #6#)
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
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT $ 237))
                          . #6#)
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT $ 237))
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
          (|ril| (|List| (|Integer|))) (#1=#:G514 NIL) (|er| NIL)
          (#2=#:G513 NIL) (|r0| (|Integer|))
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
          (|j| NIL) (#3=#:G512 NIL)
          (|bpol| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|poly_cor| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|sp_cor|
           #4=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lp_cor| #4#) (|ansp| (|Expression| R)) (#5=#:G509 NIL)
          (|einum| NIL) (#6=#:G510 NIL) (#7=#:G511 NIL)
          (|bpols| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|j0| (|NonNegativeInteger|)) (#8=#:G508 NIL) (|esum| (|Integer|))
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
                                    (SPADCALL |dtrans| |i| |j| (QREFELT $ 238))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1) . #9#)
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #8# |$NoValue| . #9#)
                                            (GO #10=#:G492)))
                                          ('T (LETT |j0| |j| . #9#)))))))))
                               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                               (EXIT NIL)))
                         #10# (EXIT #8#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT $ 240))
                                        |bpols|)
                                  . #9#)
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT $ 243))
                                         |lei1|)
                                   . #9#)))))))
                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| $ 30) . #9#)
              (LETT |lp_cor| (|spadConstant| $ 216) . #9#)
              (LETT |sp_cor| (|spadConstant| $ 216) . #9#)
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
                                        (QREFELT $ 237))
                              . #9#)
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT $ 237))
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
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT $ 240)) . #9#)
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
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT $ 238)) 1)
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
                                            (SPADCALL |k| (QREFELT $ 247)) 1
                                            (QREFELT $ 235))
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
          (#2=#:G547 NIL) (|einum| NIL) (#3=#:G548 NIL) (|er| NIL)
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
          (|i| NIL) (#6=#:G545 NIL) (|eiden| NIL) (#7=#:G546 NIL)
          (|n| (|NonNegativeInteger|)) (|nidbl| (|List| (|Integer|)))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|bi| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|m| (|NonNegativeInteger|)) (#8=#:G542 NIL)
          (|lp| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|dr| (|Record| (|:| |basis| #5#) (|:| |transform| #4#)))
          (#9=#:G544 NIL) (#10=#:G543 NIL))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT $ 38))
            (COND
             ((SPADCALL |denf| (|spadConstant| $ 54) (QREFELT $ 84))
              (COND
               ((SPADCALL (SPADCALL |nf| (QREFELT $ 59)) 1 (QREFELT $ 248))
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| $))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| $ 54) (QREFELT $ 84))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
              (EXIT
               (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                       (|spadConstant| $ 70) (|spadConstant| $ 216)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| $)
                . #11=(|RDEEFX;handle_logpart|))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 216)
                     (|spadConstant| $ 70) (|spadConstant| $ 216)))
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
              (LETT |lp_cor| (|spadConstant| $ 216) . #11#)
              (LETT |sp_cor| (|spadConstant| $ 216) . #11#)
              (LETT |poly_cor| (|spadConstant| $ 70) . #11#)
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT $ 38))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT $ 249))
                                  (QREFELT $ 252))
                        . #11#)
                  (LETT |dbasis| (QCAR |dr|) . #11#)
                  (LETT |dtrans| (QCDR |dr|) . #11#)
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT $ 99))
                                  (SPADCALL |den| (QREFELT $ 99))
                                  (QREFELT $ 211))
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
                                          (QREFELT $ 64))
                                . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| $ 216)
                                       (QREFELT $ 253))
                             (PROGN
                              (LETT #8# |$NoValue| . #11#)
                              (GO #13=#:G534)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT $ 254))
                                    . #11#)
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| $ 216)
                                           (QREFELT $ 253))
                                 (PROGN
                                  (LETT #8# |$NoValue| . #11#)
                                  (GO #13#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT $ 128))
                                        . #11#)
                                  (LETT |den| (SPADCALL |lp| (QREFELT $ 215))
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
                                                        (QREFELT $ 240))
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
                                            (SPADCALL |ndbl| (QREFELT $ 249))
                                            . #11#)
                                      (EXIT
                                       (LETT |dtrans|
                                             (SPADCALL |dtrans| |nidbl| |ninds|
                                                       (QREFELT $ 255))
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
                                         (QREFELT $ 64))
                               . #11#)))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #11#))
                             . #11#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

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
                (SPADCALL (SPADCALL |f| (QREFELT $ 257))
                          (SPADCALL |ngu| (QREFELT $ 257)) (QREFELT $ 259))
                . #2#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 260)) |x|
                          (QREFELT $ 261))
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
                      (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 271))
                      . #2#)
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 2)) ('T 'NIL))
                      . #2#)
                (LETT |am1| (QVELT |res1| 0) . #2#)
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT $ 272)) . #2#)
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
                (SPADCALL (SPADCALL |ng| (QREFELT $ 232))
                          (SPADCALL |dk| |am1| (QREFELT $ 29)) (QREFELT $ 34))
                . #2#)
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| |lim| |ext| (QREFELT $ 274))
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
                (SPADCALL (SPADCALL |f| (QREFELT $ 257))
                          (SPADCALL |ngu| (QREFELT $ 257)) (QREFELT $ 259))
                . #2#)
          (LETT |k1|
                (SPADCALL |k| (SPADCALL |lk| |x| (QREFELT $ 260)) |x|
                          (QREFELT $ 261))
                . #2#)
          (LETT |ak|
                (SPADCALL (SPADCALL |k| (QREFELT $ 247)) 1 (QREFELT $ 235))
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
                                    (QREFELT $ 274))
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

(SDEFUN |RDEEFX;ei_int;I2ESMMR;28|
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
          (|r1| (|Expression| R)) (|rr1f| #1=(|Expression| R)) (#2=#:G676 NIL)
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
          (|res5|
           (|Record| (|:| |ans| (|Expression| R))
                     (|:| |right| (|Expression| R))
                     (|:| |primpart| (|Expression| R))
                     (|:| |sol?| (|Boolean|))))
          (|lp1u| #4#)
          (|lp|
           #5=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
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
          (|ulst| (|List| (|Expression| R))) (#6=#:G682 NIL) (|kk| NIL)
          (#7=#:G681 NIL) (|vlst| (|List| (|Expression| R))) (#8=#:G680 NIL)
          (#9=#:G679 NIL) (|lk1| (|List| #10=(|Kernel| (|Expression| R))))
          (#11=#:G678 NIL) (#12=#:G677 NIL)
          (|ng| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|degs| (|NonNegativeInteger|))
          (|ds| #13=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|nf| #14=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|denf| #13#)
          (|fu|
           #15=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lnum| #14#) (|lden| #13#)
          (|her|
           (|Record|
            (|:| |answer|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |logpart| #5#)
            (|:| |specpart|
                 (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
            (|:| |polypart| (|SparseUnivariatePolynomial| (|Expression| R)))))
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| (|Expression| R))
                      (|SparseUnivariatePolynomial| (|Expression| R))))
          (|nfp| #14#) (|denfp| #13#) (|dk| #14#) (|dku| #15#) (|gu| #15#)
          (|fpu| #15#) (|k| (|Kernel| (|Expression| R))) (|lk| (|List| #10#))
          (|fp| (|Expression| R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fp|
                  (SPADCALL (SPADCALL |n| |f| (QREFELT $ 275)) |x|
                            (QREFELT $ 43))
                  . #16=(|RDEEFX;ei_int;I2ESMMR;28|))
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| $ 30) (QREFELT $ 41))
               (SEQ
                (LETT |res5|
                      (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 271))
                      . #16#)
                (EXIT
                 (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                         (|spadConstant| $ 30) (QVELT |res5| 2)))))
              (#17='T
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 257))
                                 (SPADCALL |g| (QREFELT $ 257))
                                 (QREFELT $ 259))
                       |x| (QREFELT $ 260))
                      . #16#)
                (LETT |k| (SPADCALL |lk| (QREFELT $ 276)) . #16#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |k| (QREFELT $ 278)) (QREFELT $ 7)
                             (QREFELT $ 279))
                   (SEQ
                    (LETT |res5|
                          (SPADCALL |n| |f| |g| |x| |lim| |ext|
                                    (QREFELT $ 271))
                          . #16#)
                    (EXIT
                     (VECTOR (QVELT |res5| 0) (QVELT |res5| 1)
                             (|spadConstant| $ 30) (QVELT |res5| 2)))))
                  (#17#
                   (SEQ (LETT |f| (SPADCALL |n| |f| (QREFELT $ 275)) . #16#)
                        (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 127)) . #16#)
                        (LETT |gu| (SPADCALL |g| |k| (QREFELT $ 127)) . #16#)
                        (LETT |dku|
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 40)) |x|
                                         (QREFELT $ 225))
                               |k| (QREFELT $ 127))
                              . #16#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |dku| (QREFELT $ 215))
                                     (|spadConstant| $ 54) (QREFELT $ 82))
                           (VECTOR (|spadConstant| $ 30) (|spadConstant| $ 30)
                                   (|spadConstant| $ 30) 'NIL))
                          (#17#
                           (SEQ
                            (LETT |dk| (SPADCALL |dku| (QREFELT $ 128)) . #16#)
                            (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 215))
                                  . #16#)
                            (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 128))
                                  . #16#)
                            (LETT |derivation|
                                  (CONS #'|RDEEFX;ei_int;I2ESMMR;28!1|
                                        (VECTOR |dk| |x| $ |denfp|))
                                  . #16#)
                            (LETT |her|
                                  (SPADCALL
                                   (SPADCALL |denfp| |gu| (QREFELT $ 230))
                                   |derivation| |nfp| (QREFELT $ 285))
                                  . #16#)
                            (LETT |lp| (QVELT |her| 1) . #16#)
                            (LETT |a1|
                                  (SPADCALL (QVELT |her| 0) |k|
                                            (QREFELT $ 101))
                                  . #16#)
                            (LETT |rr1|
                                  (SPADCALL
                                   (SPADCALL |lp|
                                             (SPADCALL (QVELT |her| 3)
                                                       (QREFELT $ 99))
                                             (QREFELT $ 237))
                                   (QVELT |her| 2) (QREFELT $ 237))
                                  . #16#)
                            (LETT |rr1|
                                  (SPADCALL |rr1|
                                            (SPADCALL |denfp| (QREFELT $ 99))
                                            (QREFELT $ 211))
                                  . #16#)
                            (LETT |r1|
                                  (SPADCALL |g|
                                            (SPADCALL |rr1| |k|
                                                      (QREFELT $ 101))
                                            (QREFELT $ 34))
                                  . #16#)
                            (EXIT
                             (COND
                              ((SPADCALL |rr1| (|spadConstant| $ 216)
                                         (QREFELT $ 253))
                               (VECTOR |a1| |g| (|spadConstant| $ 30) 'T))
                              (#17#
                               (SEQ
                                (LETT |lden| (SPADCALL |lp| (QREFELT $ 215))
                                      . #16#)
                                (LETT |lnum| (SPADCALL |lp| (QREFELT $ 128))
                                      . #16#)
                                (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 127))
                                      . #16#)
                                (LETT |denf| (SPADCALL |fu| (QREFELT $ 215))
                                      . #16#)
                                (LETT |nf| (SPADCALL |fu| (QREFELT $ 128))
                                      . #16#)
                                (COND
                                 ((SPADCALL |denf| (|spadConstant| $ 54)
                                            (QREFELT $ 84))
                                  (COND
                                   ((EQL (SPADCALL |nf| (QREFELT $ 59)) 0)
                                    (COND
                                     ((SPADCALL |k| '|exp| (QREFELT $ 38))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |lp| (|spadConstant| $ 216)
                                                   (QREFELT $ 286))
                                         (VECTOR |a1| |r1|
                                                 (|spadConstant| $ 30) 'NIL))
                                        (#17#
                                         (SEQ
                                          (LETT |ds|
                                                (SPADCALL (QVELT |her| 2)
                                                          (QREFELT $ 215))
                                                . #16#)
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
                                                . #16#)
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
                                                . #16#)
                                          (LETT |res5|
                                                (|RDEEFX;ei_int_exp| |f| |ng|
                                                 |degs| |x| |k| |lim| |ext| $)
                                                . #16#)
                                          (LETT |a1|
                                                (SPADCALL |a1| (QVELT |res5| 0)
                                                          (QREFELT $ 26))
                                                . #16#)
                                          (LETT |r1|
                                                (SPADCALL |r1| (QVELT |res5| 1)
                                                          (QREFELT $ 26))
                                                . #16#)
                                          (EXIT
                                           (VECTOR |a1| |r1| (QVELT |res5| 2)
                                                   (QVELT |res5| 3)))))))))))))
                                (LETT |lk1|
                                      (PROGN
                                       (LETT #12# NIL . #16#)
                                       (SEQ (LETT |kk| NIL . #16#)
                                            (LETT #11# |lk| . #16#) G190
                                            (COND
                                             ((OR (ATOM #11#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #11#)
                                                         . #16#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((COND
                                                 ((SPADCALL |kk| '|log|
                                                            (QREFELT $ 38))
                                                  'T)
                                                 (#17#
                                                  (SPADCALL |kk| '|exp|
                                                            (QREFELT $ 38))))
                                                (LETT #12# (CONS |kk| #12#)
                                                      . #16#)))))
                                            (LETT #11# (CDR #11#) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #12#))))
                                      . #16#)
                                (LETT |vlst|
                                      (PROGN
                                       (LETT #9# NIL . #16#)
                                       (SEQ (LETT |kk| NIL . #16#)
                                            (LETT #8# |lk1| . #16#) G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #8#) . #16#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
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
                                                                           247))
                                                        1 (QREFELT $ 235))))
                                                     #9#)
                                                    . #16#)))
                                            (LETT #8# (CDR #8#) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      . #16#)
                                (LETT |ulst|
                                      (PROGN
                                       (LETT #7# NIL . #16#)
                                       (SEQ (LETT |kk| NIL . #16#)
                                            (LETT #6# |lk1| . #16#) G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |kk| (CAR #6#) . #16#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (COND
                                                      ((SPADCALL |kk| '|log|
                                                                 (QREFELT $
                                                                          38))
                                                       (SPADCALL
                                                        (SPADCALL |kk|
                                                                  (QREFELT $
                                                                           247))
                                                        1 (QREFELT $ 235)))
                                                      ('T
                                                       (SPADCALL |kk|
                                                                 (QREFELT $
                                                                          40))))
                                                     #7#)
                                                    . #16#)))
                                            (LETT #6# (CDR #6#) . #16#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      . #16#)
                                (LETT |ar1|
                                      (|RDEEFX;handle_logpart| |lnum| |lden|
                                       |nf| |denf| |nfp| |denfp| |k| |vlst|
                                       |ulst| |x| $)
                                      . #16#)
                                (LETT |ansp| (QVELT |ar1| 0) . #16#)
                                (LETT |lp|
                                      (SPADCALL |lp| (QVELT |ar1| 1)
                                                (QREFELT $ 254))
                                      . #16#)
                                (QSETVELT |her| 2
                                          (SPADCALL (QVELT |her| 2)
                                                    (QVELT |ar1| 3)
                                                    (QREFELT $ 254)))
                                (QSETVELT |her| 3
                                          (SPADCALL (QVELT |her| 3)
                                                    (QVELT |ar1| 2)
                                                    (QREFELT $ 198)))
                                (LETT |lp1u| (SPADCALL |lp| (QREFELT $ 288))
                                      . #16#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |lp1u| 1)
                                   (VECTOR |a1| |r1| (|spadConstant| $ 30)
                                           'NIL))
                                  (#17#
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
                                                  (|spadConstant| $ 216)
                                                  (QREFELT $ 253))
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
                                            (SPADCALL |k| (QREFELT $ 278))
                                            (QREFELT $ 8) (QREFELT $ 279)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |lp|
                                                       (|spadConstant| $ 216)
                                                       (QREFELT $ 286))
                                             (VECTOR |a1| |r1|
                                                     (|spadConstant| $ 30)
                                                     'NIL))
                                            ((SPADCALL (QVELT |her| 2)
                                                       (|spadConstant| $ 216)
                                                       (QREFELT $ 286))
                                             (|error|
                                              "unexpected special part"))
                                            (#17#
                                             (SEQ
                                              (LETT |res5|
                                                    (|RDEEFX;ei_int_log| |f|
                                                     (QVELT |her| 3) |x| |k|
                                                     |lim| |ext| $)
                                                    . #16#)
                                              (LETT |a1|
                                                    (SPADCALL |a1|
                                                              (QVELT |res5| 0)
                                                              (QREFELT $ 26))
                                                    . #16#)
                                              (LETT |r1|
                                                    (SPADCALL |r1|
                                                              (QVELT |res5| 1)
                                                              (QREFELT $ 26))
                                                    . #16#)
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
                                          . #16#)
                                    (LETT |rr1|
                                          (SPADCALL |rr1|
                                                    (SPADCALL |denfp|
                                                              (QREFELT $ 99))
                                                    (QREFELT $ 211))
                                          . #16#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |rr1| (|spadConstant| $ 216)
                                                 (QREFELT $ 253))
                                       (VECTOR |a1| |g| |ansp| 'T))
                                      (#17#
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
                                               (SPADCALL |nf| (QREFELT $ 59))
                                               1)
                                              (SEQ
                                               (LETT |spec1u|
                                                     (SPADCALL |rr1|
                                                               (QREFELT $ 288))
                                                     . #16#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |spec1u| 1)
                                                  (|error| "impossible 9"))
                                                 (#17#
                                                  (SEQ
                                                   (LETT |spec1p|
                                                         (QCDR |spec1u|)
                                                         . #16#)
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
                                                                        $ 77))
                                                             . #16#)
                                                       (LETT |rcu|
                                                             (SPADCALL |lc|
                                                                       (QREFELT
                                                                        $ 112))
                                                             . #16#)
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |rcu| 1)
                                                          "skip")
                                                         (#17#
                                                          (SEQ
                                                           (LETT |rc|
                                                                 (QCDR |rcu|)
                                                                 . #16#)
                                                           (LETT |u|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |k|
                                                                    (QREFELT $
                                                                             247))
                                                                   1
                                                                   (QREFELT $
                                                                            235))
                                                                  |rc|
                                                                  (QREFELT $
                                                                           42))
                                                                 . #16#)
                                                           (LETT |g1|
                                                                 (SPADCALL
                                                                  |spec1p| 0
                                                                  (QREFELT $
                                                                           60))
                                                                 . #16#)
                                                           (LETT |f1|
                                                                 (SPADCALL |nf|
                                                                           0
                                                                           (QREFELT
                                                                            $
                                                                            60))
                                                                 . #16#)
                                                           (LETT |res4|
                                                                 (SPADCALL 1
                                                                           |f1|
                                                                           (SPADCALL
                                                                            |g1|
                                                                            |u|
                                                                            (QREFELT
                                                                             $
                                                                             29))
                                                                           |x|
                                                                           |lim|
                                                                           |ext|
                                                                           (QREFELT
                                                                            $
                                                                            274))
                                                                 . #16#)
                                                           (LETT |a1|
                                                                 (SPADCALL |a1|
                                                                           (SPADCALL
                                                                            (QVELT
                                                                             |res4|
                                                                             0)
                                                                            |u|
                                                                            (QREFELT
                                                                             $
                                                                             61))
                                                                           (QREFELT
                                                                            $
                                                                            26))
                                                                 . #16#)
                                                           (LETT |ansp|
                                                                 (SPADCALL
                                                                  |ansp|
                                                                  (QVELT |res4|
                                                                         2)
                                                                  (QREFELT $
                                                                           26))
                                                                 . #16#)
                                                           (LETT |rr1|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |spec1p|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (QVELT
                                                                      |res4| 1)
                                                                     |u|
                                                                     (QREFELT $
                                                                              61))
                                                                    (QREFELT $
                                                                             21))
                                                                   (QREFELT $
                                                                            198))
                                                                  (QREFELT $
                                                                           99))
                                                                 . #16#)
                                                           (LETT |r1|
                                                                 (SPADCALL |g|
                                                                           (SPADCALL
                                                                            |rr1|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             101))
                                                                           (QREFELT
                                                                            $
                                                                            34))
                                                                 . #16#)
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #2#
                                                                   (VECTOR |a1|
                                                                           |r1|
                                                                           |ansp|
                                                                           (QVELT
                                                                            |res4|
                                                                            3))
                                                                   . #16#)
                                                             (GO
                                                              #18=#:G675))))))))))))))))))))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |rr1|
                                                     (|spadConstant| $ 216)
                                                     (QREFELT $ 253))
                                           (VECTOR |a1| |g| |ansp| 'T))
                                          (#17#
                                           (SEQ
                                            (LETT |rr1f|
                                                  (SPADCALL |rr1| |k|
                                                            (QREFELT $ 101))
                                                  . #16#)
                                            (LETT |r1|
                                                  (SPADCALL |g| |rr1f|
                                                            (QREFELT $ 34))
                                                  . #16#)
                                            (LETT |res6|
                                                  (SPADCALL 1 |f| |rr1f| |x|
                                                            |lim| |ext|
                                                            (QREFELT $ 271))
                                                  . #16#)
                                            (EXIT
                                             (VECTOR
                                              (SPADCALL |a1| (QVELT |res6| 0)
                                                        (QREFELT $ 26))
                                              (SPADCALL |r1| (QVELT |res6| 1)
                                                        (QREFELT $ 26))
                                              |ansp|
                                              (QVELT |res6|
                                                     2)))))))))))))))))))))))))))))))))
          #18# (EXIT #2#)))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;28!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| $ |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3) . #1=(|RDEEFX;ei_int;I2ESMMR;28|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2ESMMR;28!0|
                                             (VECTOR $ |x|))
                                       |dk| (QREFELT $ 281))
                             (QREFELT $ 71))))))) 

(SDEFUN |RDEEFX;ei_int;I2ESMMR;28!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 225)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX| (#1=#:G683)
  (SPROG NIL
         (PROG (#2=#:G684)
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
          (LETT $ (GETREFV 289) . #1#)
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
              (280 . |exquo|) (286 . |setelt|) (293 . |invmod|)
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
              (673 . |member?|) (679 . *) '|dummy| (685 . ^)
              (|Mapping| 16 16 16) (|List| 16) (691 . |reduce|)
              (697 . |decompose|) (703 . |univariate|) (710 . |rootOf|)
              (715 . |retract|) (720 . /) (726 . *) (732 . ^) (738 . *)
              (744 . |denom|) (749 . |Zero|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (753 . |divide|) (759 . |minimumDegree|) (764 . |elt|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 221 '"failed") (770 . |extendedEuclidean|)
              (777 . |retractIfCan|) (782 . |differentiate|) (788 . |exp|)
              (793 . |Ei|) (798 . |zerosOf|) (803 . |eval|) (810 . *)
              (816 . |retract|) (821 . |retract|) (|Union| 131 '"failed")
              (826 . |solve_u|) (833 . |elt|) (839 . |retract|) (844 . +)
              (850 . |elt|) (|Vector| 16) (857 . |elt|)
              (|Record| (|:| |factor| 16) (|:| |ratpart| 27) (|:| |v_part| 14)
                        (|:| |alg_part| 16) (|:| |u_part| 14)
                        (|:| |exponent| 27) (|:| |shift_part| 14))
              (|List| 241) (863 . |elt|) (869 . |One|) (|Fraction| 22)
              (873 . |One|) (877 . |argument|) (882 . <=) (888 . |vector|)
              (|Record| (|:| |basis| 239) (|:| |transform| 134))
              (|GcdBasis| 16) (893 . |gcdDecomposition|) (898 . =) (904 . -)
              (910 . |elt|) (|List| 39) (917 . |tower|)
              (|IntegrationTools| 6 14) (922 . |union|) (928 . |varselect|)
              (934 . |ksec|)
              (|Record| (|:| |ans| 14) (|:| |right| 14) (|:| |sol?| 36))
              (|Record| (|:| |coeff| 14) (|:| |logand| 14))
              (|Record| (|:| |mainpart| 14) (|:| |limitedlogs| (|List| 263)))
              (|Union| 264 '"failed") (|Mapping| 265 14 32)
              (|Record| (|:| |ratpart| 14) (|:| |coeff| 14))
              (|Union| 267 '"failed") (|Mapping| 268 14 14)
              (|ElementaryRischDE| 6 14) (941 . |rischDE|) (951 . ^)
              (|Record| (|:| |ans| 14) (|:| |right| 14) (|:| |primpart| 14)
                        (|:| |sol?| 36))
              |RDEEFX;ei_int;I2ESMMR;28| (957 . *) (963 . |kmax|)
              (|BasicOperator|) (968 . |operator|) (973 . |has?|)
              (|Mapping| 14 14) (979 . |differentiate|)
              (|Record| (|:| |answer| 98) (|:| |logpart| 98)
                        (|:| |specpart| 98) (|:| |polypart| 16))
              (|Mapping| 16 16) (|TranscendentalHermiteIntegration| 14 16)
              (986 . |HermiteIntegrate|) (993 . ~=) (|Union| 16 '#2#)
              (999 . |retractIfCan|))
           '#(|ei_int| 1004) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 288
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
                                                   0 201 2 16 0 0 58 203 2 205
                                                   16 204 0 206 2 104 205 16
                                                   205 207 3 100 16 14 10 16
                                                   208 1 14 0 9 209 1 14 39 0
                                                   210 2 98 0 0 0 211 2 16 0 0
                                                   14 212 2 98 0 0 27 213 2 98
                                                   0 0 0 214 1 98 16 0 215 0 98
                                                   0 216 2 16 217 0 0 218 1 16
                                                   58 0 219 2 205 16 0 27 220 3
                                                   16 222 0 0 0 223 1 16 163 0
                                                   224 2 14 0 0 37 225 1 14 0 0
                                                   226 1 14 0 0 227 1 14 88 9
                                                   228 3 14 0 0 39 0 229 2 98 0
                                                   16 0 230 1 98 16 0 231 1 16
                                                   14 0 232 3 104 233 14 14 37
                                                   234 2 32 14 0 27 235 1 14 27
                                                   0 236 2 98 0 0 0 237 3 134
                                                   27 0 27 27 238 2 239 16 0 27
                                                   240 2 242 241 0 27 243 0 164
                                                   0 244 0 245 0 246 1 10 32 0
                                                   247 2 27 36 0 0 248 1 239 0
                                                   205 249 1 251 250 239 252 2
                                                   98 36 0 0 253 2 98 0 0 0 254
                                                   3 134 0 0 85 85 255 1 14 256
                                                   0 257 2 258 177 177 177 259
                                                   2 258 177 177 37 260 3 258
                                                   10 10 177 37 261 6 270 262
                                                   27 14 14 37 266 269 271 2 14
                                                   0 0 58 272 2 14 0 27 0 275 1
                                                   258 10 177 276 1 10 277 0
                                                   278 2 277 36 0 37 279 3 16 0
                                                   0 280 0 281 3 284 282 98 283
                                                   16 285 2 98 36 0 0 286 1 98
                                                   287 0 288 6 0 273 27 14 14
                                                   37 266 269 274)))))
           '|lookupComplete|)) 
