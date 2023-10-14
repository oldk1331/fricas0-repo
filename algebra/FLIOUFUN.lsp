
(/VERSIONCHECK 2) 

(DEFUN |FLIOUFUN;gamma;C;1| ($)
  (PROG (|nbits| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;gamma;C;1|))
         (QCAR (QREFELT $ 8)) (QREFELT $ 14))
        (SPADCALL (QCDR (QREFELT $ 8)) (|spadConstant| $ 7) (QREFELT $ 16)))
       ('T
        (SEQ
         (LETT |nbits|
               (MAX |obits| (SPADCALL 2 (QCAR (QREFELT $ 8)) (QREFELT $ 17)))
               . #1#)
         (EXIT
          (|finally|
           (SEQ (SPADCALL |nbits| (QREFELT $ 18))
                (PROGN
                 (RPLACD (QREFELT $ 8)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19) (QREFELT $ 21))
                          (QREFELT $ 22)))
                 (QCDR (QREFELT $ 8)))
                (PROGN (RPLACA (QREFELT $ 8) |nbits|) (QCAR (QREFELT $ 8)))
                (EXIT
                 (SPADCALL (QCDR (QREFELT $ 8)) (|spadConstant| $ 7)
                           (QREFELT $ 16))))
           (SPADCALL |obits| (QREFELT $ 18))))))))))) 

(DEFUN |FLIOUFUN;erf_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
            . #1=(|FLIOUFUN;erf_series|))
      (LETT |tk| |z| . #1#) (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 19)
                                 (SPADCALL |k1| (QREFELT $ 28)) (QREFELT $ 31))
                       |tk| (QREFELT $ 33))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (LETT |k2| (+ |i| 1) . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19)
                                    (SPADCALL |k2| (QREFELT $ 28))
                                    (QREFELT $ 31))
                          (QREFELT $ 22))
                         |z2| (QREFELT $ 33))
                        |tk| (QREFELT $ 24))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL 2 (QREFELT $ 28))
                  (SPADCALL (SPADCALL (QREFELT $ 35)) (QREFELT $ 36))
                  (QREFELT $ 31))
        |res| (QREFELT $ 33))))))) 

(DEFUN |FLIOUFUN;erfc_asymptotic| (|z| |prec| $)
  (PROG (|term| |res| |k| |z2_inv| |z2| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;erfc_asymptotic|))
      (LETT |term| (|spadConstant| $ 32) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 32)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                (QREFELT $ 33))
                      (QREFELT $ 38))
            . #1#)
      (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                    (QREFELT $ 28))
                          |z2_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |z2| (QREFELT $ 41)) (QREFELT $ 42))
                  |res| (QREFELT $ 24))
        (SPADCALL |z| (SPADCALL (SPADCALL (QREFELT $ 35)) (QREFELT $ 36))
                  (QREFELT $ 43))
        (QREFELT $ 38))))))) 

(DEFUN |FLIOUFUN;erf_z| (|z| $)
  (PROG (#1=#:G160 #2=#:G163 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz| |prec|
         |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;erf_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 500)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #3#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                          (QREFELT $ 49))
                                |prec|)
                               . #3#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 48))
                                             (QREFELT $ 49))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #3#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #3#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #3#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT $ 51))
                                           (QREFELT $ 52))
                                          . #3#)
                                    (SPADCALL |np| (QREFELT $ 18))
                                    (LETT |res|
                                          (|FLIOUFUN;erf_series| |z| |n| $)
                                          . #3#)
                                    (SPADCALL |obits| (QREFELT $ 18))
                                    (EXIT
                                     (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                                   . #3#)
                             (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) (|spadConstant| $ 7)
                             (QREFELT $ 40))
                   (SPADCALL (|spadConstant| $ 32)
                             (|FLIOUFUN;erfc_asymptotic| |z| (+ |obits| 5) $)
                             (QREFELT $ 54)))
                  (#4#
                   (SPADCALL
                    (|FLIOUFUN;erfc_asymptotic| (SPADCALL |z| (QREFELT $ 41))
                     (+ |obits| 5) $)
                    (|spadConstant| $ 32) (QREFELT $ 54)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;erf;2C;5| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;erf;2C;5|)
          (EXIT
           (|finally| (|FLIOUFUN;erf_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;erf;2F;6| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 55))
   (QREFELT $ 53))) 

(DEFUN |FLIOUFUN;fresnel_c_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z4| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
            . #1=(|FLIOUFUN;fresnel_c_series|))
      (LETT |tk| |z| . #1#)
      (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 24)) . #1#)
      (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 27)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 19)
                                 (SPADCALL |k1| (QREFELT $ 28)) (QREFELT $ 31))
                       |tk| (QREFELT $ 33))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1)
                         (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19)
                                    (SPADCALL |k2| (QREFELT $ 28))
                                    (QREFELT $ 31))
                          (QREFELT $ 22))
                         |z4| (QREFELT $ 33))
                        |tk| (QREFELT $ 24))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;fresnel_c_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_c| |res_s| |k| |z2_inv| |z2| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;fresnel_c_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38)) . #1#)
      (LETT |term| (|spadConstant| $ 32) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 32)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                (QREFELT $ 33))
                      (QREFELT $ 38))
            . #1#)
      (LETT |res_c| (|spadConstant| $ 25) . #1#)
      (LETT |res_s| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 54)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z2_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #1#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 3)
                                    (QREFELT $ 28))
                          |z2_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 48)) (QREFELT $ 57))
                  |z_inv| (QREFELT $ 33))
        (SPADCALL
         (SPADCALL (SPADCALL |z2| (QREFELT $ 58)) |res_c| (QREFELT $ 24))
         (SPADCALL (SPADCALL |z2| (QREFELT $ 59)) |res_s| (QREFELT $ 24))
         (QREFELT $ 34))
        (QREFELT $ 24))))))) 

(DEFUN |FLIOUFUN;fresnel_c_z| (|z| $)
  (PROG (|im_z| |re_z| |pi_fac| #1=#:G176 #2=#:G182 |res| |n| |nf| |np| |npf|
         |sp| |dnz| |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;fresnel_c_z|))
        (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
        (LETT |prec| (+ |obits| 10) . #3#)
        (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
        (EXIT
         (COND
          ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
           (|error| "reqested too high precision"))
          (#4='T
           (SEQ
            (COND
             ((< |oz| 500)
              (SEQ
               (EXIT
                (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                      (QREFELT $ 49))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 48))
                                         (QREFELT $ 49))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL
                                       (SPADCALL
                                        (|div_DF| |nf|
                                                  (FLOAT 2
                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                        (QREFELT $ 51))
                                       (QREFELT $ 52))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 18))
                                (LETT |res|
                                      (|FLIOUFUN;fresnel_c_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 18))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
               #1# (EXIT #1#))))
            (SPADCALL |prec| (QREFELT $ 18))
            (LETT |pi_fac|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 35))
                             (SPADCALL 8 (QREFELT $ 28)) (QREFELT $ 31))
                   (QREFELT $ 36))
                  . #3#)
            (LETT |re_z| (SPADCALL |z| (QREFELT $ 53)) . #3#)
            (LETT |im_z| (SPADCALL |z| (QREFELT $ 60)) . #3#)
            (EXIT
             (COND
              ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 40))
               (COND
                ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                 (COND
                  ((SPADCALL |re_z| |im_z| (QREFELT $ 40))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                    (QREFELT $ 54)))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                    (QREFELT $ 54)))))
                ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 22))
                           (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 22)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))
              ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22)) |im_z|
                           (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))
              (#4#
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22))
                           (SPADCALL |im_z| (QREFELT $ 22)) (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 22)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;fresnelC;2C;10| (|z| $)
  (PROG (|res| |pi_fac| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;fresnelC;2C;10|))
      (EXIT
       (|finally|
        (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 18))
             (LETT |pi_fac|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 35))
                              (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                    (QREFELT $ 36))
                   . #1#)
             (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 33)) . #1#)
             (LETT |res| (|FLIOUFUN;fresnel_c_z| |z| $) . #1#)
             (SPADCALL (+ |obits| 10) (QREFELT $ 18))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 19) |pi_fac| (QREFELT $ 31)) |res|
               (QREFELT $ 33))))
        (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;fresnelC;2F;11| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 61))
   (QREFELT $ 53))) 

(DEFUN |FLIOUFUN;fresnel_s_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z4| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24))
            . #1=(|FLIOUFUN;fresnel_s_series|))
      (LETT |tk| (SPADCALL |z2| |z| (QREFELT $ 24)) . #1#)
      (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 24)) . #1#)
      (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 27)) 3) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 19)
                                 (SPADCALL |k1| (QREFELT $ 28)) (QREFELT $ 31))
                       |tk| (QREFELT $ 33))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2)
                         (+ (SPADCALL 2 |i| (QREFELT $ 27)) 3))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19)
                                    (SPADCALL |k2| (QREFELT $ 28))
                                    (QREFELT $ 31))
                          (QREFELT $ 22))
                         |z4| (QREFELT $ 33))
                        |tk| (QREFELT $ 24))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;fresnel_s_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_s| |res_c| |k| |z2_inv| |z2| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;fresnel_s_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38)) . #1#)
      (LETT |term| (|spadConstant| $ 32) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 32)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 28)) |z2|
                                (QREFELT $ 33))
                      (QREFELT $ 38))
            . #1#)
      (LETT |res_c| (|spadConstant| $ 25) . #1#)
      (LETT |res_s| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z2_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #1#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 27)) 3)
                                    (QREFELT $ 28))
                          |z2_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 48)) (QREFELT $ 57))
                  |z_inv| (QREFELT $ 33))
        (SPADCALL
         (SPADCALL (SPADCALL |z2| (QREFELT $ 58)) |res_c| (QREFELT $ 24))
         (SPADCALL (SPADCALL |z2| (QREFELT $ 59)) |res_s| (QREFELT $ 24))
         (QREFELT $ 34))
        (QREFELT $ 24))))))) 

(DEFUN |FLIOUFUN;fresnel_s_z| (|z| $)
  (PROG (|im_z| |re_z| |pi_fac| #1=#:G196 #2=#:G202 |res| |n| |nf| |np| |npf|
         |sp| |dnz| |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;fresnel_s_z|))
        (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
        (LETT |prec| (+ |obits| 10) . #3#)
        (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
        (EXIT
         (COND
          ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
           (|error| "reqested too high precision"))
          (#4='T
           (SEQ
            (COND
             ((< |oz| 500)
              (SEQ
               (EXIT
                (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 47)) . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                      (QREFELT $ 49))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 48))
                                         (QREFELT $ 49))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL
                                       (SPADCALL
                                        (|div_DF| |nf|
                                                  (FLOAT 2
                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                        (QREFELT $ 51))
                                       (QREFELT $ 52))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 18))
                                (LETT |res|
                                      (|FLIOUFUN;fresnel_s_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 18))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
               #1# (EXIT #1#))))
            (SPADCALL |prec| (QREFELT $ 18))
            (LETT |pi_fac|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 35))
                             (SPADCALL 8 (QREFELT $ 28)) (QREFELT $ 31))
                   (QREFELT $ 36))
                  . #3#)
            (LETT |re_z| (SPADCALL |z| (QREFELT $ 53)) . #3#)
            (LETT |im_z| (SPADCALL |z| (QREFELT $ 60)) . #3#)
            (EXIT
             (COND
              ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 40))
               (COND
                ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
                 (COND
                  ((SPADCALL |re_z| |im_z| (QREFELT $ 40))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                    (QREFELT $ 54)))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7)
                              (SPADCALL |pi_fac| (QREFELT $ 22))
                              (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                    (QREFELT $ 54)))))
                ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 22))
                           (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))
              ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 40))
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22)) |im_z|
                           (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 22)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))
              (#4#
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 22))
                           (SPADCALL |im_z| (QREFELT $ 22)) (QREFELT $ 40))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 22))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 54)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;fresnelS;2C;15| (|z| $)
  (PROG (|res| |pi_fac| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;fresnelS;2C;15|))
      (EXIT
       (|finally|
        (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 18))
             (LETT |pi_fac|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 35))
                              (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                    (QREFELT $ 36))
                   . #1#)
             (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 33)) . #1#)
             (LETT |res| (|FLIOUFUN;fresnel_s_z| |z| $) . #1#)
             (SPADCALL (+ |obits| 10) (QREFELT $ 18))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 19) |pi_fac| (QREFELT $ 31)) |res|
               (QREFELT $ 33))))
        (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;fresnelS;2F;16| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 63))
   (QREFELT $ 53))) 

(DEFUN |FLIOUFUN;ei_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i|)
    (RETURN
     (SEQ (LETT |tk| |z| . #1=(|FLIOUFUN;ei_series|))
          (LETT |res| (|spadConstant| $ 25) . #1#)
          (SEQ (LETT |i| 0 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |k1| (+ |i| 1) . #1#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 19)
                                     (SPADCALL |k1| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |tk| (QREFELT $ 33))
                          . #1#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                    (LETT |k2| (+ |i| 2) . #1#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 19)
                                       (SPADCALL |k2| (QREFELT $ 28))
                                       (QREFELT $ 31))
                             |z| (QREFELT $ 33))
                            |tk| (QREFELT $ 24))
                           . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FLIOUFUN;ei_asymptotic| (|z| |prec| $)
  (PROG (|term| |res| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;ei_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38)) . #1#)
      (LETT |term| |z_inv| . #1#) (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |k| 1) (QREFELT $ 28)) |z_inv|
                                  (QREFELT $ 33))
                        |term| (QREFELT $ 24))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (SPADCALL |z| (QREFELT $ 42)) |res| (QREFELT $ 24))))))) 

(DEFUN |FLIOUFUN;ei_z| (|z| $)
  (PROG (|im_z| |pii| #1=#:G216 #2=#:G221 |res| |n| |nf| |np| |npf| |sp| |dnz|
         |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;ei_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                     (QREFELT $ 65))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                      (QREFELT $ 49))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 48))
                                         (QREFELT $ 49))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL (SPADCALL |nf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 18))
                                (LETT |res| (|FLIOUFUN;ei_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 18))
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 23))
                                                   (SPADCALL |z|
                                                             (QREFELT $ 66))
                                                   (QREFELT $ 34))
                                         |res| (QREFELT $ 34))
                                        . #3#)
                                  (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (LETT |pii| (SPADCALL (QREFELT $ 35)) . #3#)
                (LETT |im_z| (SPADCALL |z| (QREFELT $ 60)) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 67))
                   (COND
                    ((SPADCALL (SPADCALL |z| (QREFELT $ 53))
                               (SPADCALL |im_z| (QREFELT $ 22)) (QREFELT $ 40))
                     (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                    (#4#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7)
                                (SPADCALL |pii| (QREFELT $ 22)) (QREFELT $ 16))
                      (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                      (QREFELT $ 34)))))
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) |im_z|
                             (QREFELT $ 40))
                   (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7) |pii| (QREFELT $ 16))
                    (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                    (QREFELT $ 34)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Ei;2C;20| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ei;2C;20|)
          (EXIT
           (|finally| (|FLIOUFUN;ei_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;Ei;2F;21| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 69)) (|error| "Ei: x <= 0"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 68))
     (QREFELT $ 53))))) 

(DEFUN |FLIOUFUN;li;2C;22| (|z| $)
  (PROG (|z1| |obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;li;2C;22|))
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 5) (QREFELT $ 18))
                 (LETT |z1| (SPADCALL |z| (QREFELT $ 66)) . #1#)
                 (EXIT (SPADCALL |z1| (QREFELT $ 68))))
            (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;li;2F;23| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 19) (QREFELT $ 69)) (|error| "li: x <= 1"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 71))
     (QREFELT $ 53))))) 

(DEFUN |FLIOUFUN;ci_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1=(|FLIOUFUN;ci_series|))
      (LETT |tk|
            (SPADCALL
             (SPADCALL
              (SPADCALL (|spadConstant| $ 19) (SPADCALL 2 (QREFELT $ 28))
                        (QREFELT $ 31))
              (QREFELT $ 22))
             |z2| (QREFELT $ 33))
            . #1#)
      (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (SPADCALL 2 |i| (QREFELT $ 27)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 19)
                                 (SPADCALL |k1| (QREFELT $ 28)) (QREFELT $ 31))
                       |tk| (QREFELT $ 33))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1)
                         (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19)
                                    (SPADCALL |k2| (QREFELT $ 28))
                                    (QREFELT $ 31))
                          (QREFELT $ 22))
                         |z2| (QREFELT $ 33))
                        |tk| (QREFELT $ 24))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;ci_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_c| |res_s| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;ci_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38)) . #1#)
      (LETT |term| (|spadConstant| $ 32) . #1#)
      (LETT |res_c| (|spadConstant| $ 25) . #1#)
      (LETT |res_s| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                   (QREFELT $ 28))
                         |z_inv| (QREFELT $ 33))
                        |term| (QREFELT $ 24))
                       (QREFELT $ 41))
                      . #1#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 2)
                                   (QREFELT $ 28))
                         |z_inv| (QREFELT $ 33))
                        |term| (QREFELT $ 24))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |z_inv|
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| (QREFELT $ 58)) |res_c|
                            (QREFELT $ 24))
                  (SPADCALL (SPADCALL |z| (QREFELT $ 59)) |res_s|
                            (QREFELT $ 24))
                  (QREFELT $ 34))
                 (QREFELT $ 24))))))) 

(DEFUN |FLIOUFUN;ci_z| (|z| $)
  (PROG (|pi_fac| #1=#:G238 #2=#:G242 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz|
         |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;ci_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                     (QREFELT $ 65))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                      (QREFELT $ 49))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 48))
                                         (QREFELT $ 49))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL
                                       (SPADCALL
                                        (|div_DF| |nf|
                                                  (FLOAT 2
                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                        (QREFELT $ 51))
                                       (QREFELT $ 52))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 18))
                                (LETT |res| (|FLIOUFUN;ci_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 18))
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL |res|
                                                   (SPADCALL (QREFELT $ 23))
                                                   (QREFELT $ 34))
                                         (SPADCALL |z| (QREFELT $ 66))
                                         (QREFELT $ 34))
                                        . #3#)
                                  (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) (|spadConstant| $ 7)
                             (QREFELT $ 40))
                   (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $))
                  (#4#
                   (SEQ (LETT |pi_fac| (SPADCALL (QREFELT $ 35)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |z| (QREFELT $ 60))
                                     (|spadConstant| $ 7) (QREFELT $ 67))
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 7)
                                      (SPADCALL |pi_fac| (QREFELT $ 22))
                                      (QREFELT $ 16))
                            (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                            (QREFELT $ 34)))
                          (#4#
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 7) |pi_fac|
                                      (QREFELT $ 16))
                            (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                            (QREFELT $ 34)))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Ci;2C;27| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ci;2C;27|)
          (EXIT
           (|finally| (|FLIOUFUN;ci_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;Ci;2F;28| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 69)) (|error| "Ci: x <= 0"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 73))
     (QREFELT $ 53))))) 

(DEFUN |FLIOUFUN;Chi;2C;29| (|z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16)) |z|
      (QREFELT $ 24))
     (QREFELT $ 73))
    (SPADCALL |z| (QREFELT $ 66)) (QREFELT $ 34))
   (SPADCALL
    (SPADCALL
     (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16)) |z|
     (QREFELT $ 24))
    (QREFELT $ 66))
   (QREFELT $ 54))) 

(DEFUN |FLIOUFUN;Chi;2F;30| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 69)) (|error| "Chi: x <= 0"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 75))
     (QREFELT $ 53))))) 

(DEFUN |FLIOUFUN;si_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 24)) . #1=(|FLIOUFUN;si_series|))
      (LETT |tk| |z| . #1#) (LETT |res| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 27)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 19)
                                 (SPADCALL |k1| (QREFELT $ 28)) (QREFELT $ 31))
                       |tk| (QREFELT $ 33))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 34)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 27)) 2)
                         (+ (SPADCALL 2 |i| (QREFELT $ 27)) 3))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19)
                                    (SPADCALL |k2| (QREFELT $ 28))
                                    (QREFELT $ 31))
                          (QREFELT $ 22))
                         |z2| (QREFELT $ 33))
                        |tk| (QREFELT $ 24))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;si_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_s| |res_c| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 17))) 2
                      (QREFELT $ 37))
            . #1=(|FLIOUFUN;si_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 32) |z| (QREFELT $ 38)) . #1#)
      (LETT |term| (|spadConstant| $ 32) . #1#)
      (LETT |res_c| (|spadConstant| $ 25) . #1#)
      (LETT |res_s| (|spadConstant| $ 25) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 39)) |eps| (QREFELT $ 40)))
             (GO G191)))
           (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 34)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 1)
                                  (QREFELT $ 28))
                        |z_inv| (QREFELT $ 33))
                       |term| (QREFELT $ 24))
                      . #1#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 34)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 27)) 2)
                                    (QREFELT $ 28))
                          |z_inv| (QREFELT $ 33))
                         |term| (QREFELT $ 24))
                        (QREFELT $ 41))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |z_inv|
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| (QREFELT $ 58)) |res_c|
                            (QREFELT $ 24))
                  (SPADCALL (SPADCALL |z| (QREFELT $ 59)) |res_s|
                            (QREFELT $ 24))
                  (QREFELT $ 34))
                 (QREFELT $ 24))))))) 

(DEFUN |FLIOUFUN;si_z| (|z| $)
  (PROG (|pi_fac| #1=#:G257 #2=#:G260 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz|
         |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;si_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 39)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 44)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 45))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 47))
                                     (QREFELT $ 65))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 48))
                                      (QREFELT $ 49))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 50))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 48))
                                         (QREFELT $ 49))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL
                                       (SPADCALL
                                        (|div_DF| |nf|
                                                  (FLOAT 2
                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                        (QREFELT $ 51))
                                       (QREFELT $ 52))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 18))
                                (LETT |res| (|FLIOUFUN;si_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 18))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 18))
                (LETT |pi_fac|
                      (SPADCALL (SPADCALL (QREFELT $ 35))
                                (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 31))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 53)) (|spadConstant| $ 7)
                             (QREFELT $ 40))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;si_asymptotic| |z| (+ |obits| 5) $)
                    (QREFELT $ 54)))
                  (#4#
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                     (|FLIOUFUN;si_asymptotic| (SPADCALL |z| (QREFELT $ 41))
                      (+ |obits| 5) $)
                     (QREFELT $ 54))
                    (QREFELT $ 41)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Si;2C;34| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Si;2C;34|)
          (EXIT
           (|finally| (|FLIOUFUN;si_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 18)))))))) 

(DEFUN |FLIOUFUN;Si;2F;35| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 77))
   (QREFELT $ 53))) 

(DEFUN |FLIOUFUN;Shi;2C;36| (|z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16))
    (SPADCALL
     (SPADCALL
      (SPADCALL (|spadConstant| $ 7) (|spadConstant| $ 19) (QREFELT $ 16)) |z|
      (QREFELT $ 24))
     (QREFELT $ 77))
    (QREFELT $ 24))
   (QREFELT $ 41))) 

(DEFUN |FLIOUFUN;Shi;2F;37| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 79))
   (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |FloatLiouvilianFunctions;|)) 

(DEFUN |FloatLiouvilianFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G267)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FloatLiouvilianFunctions|)
                . #2=(|FloatLiouvilianFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FloatLiouvilianFunctions|
                         (LIST
                          (CONS NIL (CONS 1 (|FloatLiouvilianFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FloatLiouvilianFunctions|))))))))))) 

(DEFUN |FloatLiouvilianFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FloatLiouvilianFunctions|)
            . #1=(|FloatLiouvilianFunctions|))
      (LETT $ (GETREFV 81) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FloatLiouvilianFunctions| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (CONS -1 (|spadConstant| $ 7)))
      $)))) 

(MAKEPROP '|FloatLiouvilianFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) 'G
              (|PositiveInteger|) (4 . |bits|) (8 . |precision|) (|Boolean|)
              (|Integer|) (12 . <=) (|Complex| 6) (18 . |complex|) (24 . *)
              (30 . |bits|) (35 . |One|) (|FloatSpecialFunctions|)
              (39 . |digamma|) (44 . -) |FLIOUFUN;gamma;C;1| (49 . *)
              (55 . |Zero|) (|NonNegativeInteger|) (59 . *) (65 . |coerce|)
              (|Fraction| 13) (70 . |One|) (74 . /) (80 . |One|) (84 . *)
              (90 . +) (96 . |pi|) (100 . |sqrt|) (105 . |float|) (112 . /)
              (118 . |norm|) (123 . >) (129 . -) (134 . |exp|) (139 . *)
              (145 . |order|) (150 . >) (|DoubleFloat|) (156 . |coerce|)
              (161 . /) (167 . |coerce|) (172 . >) (178 . |round|)
              (183 . |retract|) (188 . |real|) (193 . -) |FLIOUFUN;erf;2C;5|
              |FLIOUFUN;erf;2F;6| (199 . |coerce|) (204 . |cos|) (209 . |sin|)
              (214 . |imag|) |FLIOUFUN;fresnelC;2C;10|
              |FLIOUFUN;fresnelC;2F;11| |FLIOUFUN;fresnelS;2C;15|
              |FLIOUFUN;fresnelS;2F;16| (219 . |sqrt|) (224 . |log|) (229 . <)
              |FLIOUFUN;Ei;2C;20| (235 . <=) |FLIOUFUN;Ei;2F;21|
              |FLIOUFUN;li;2C;22| |FLIOUFUN;li;2F;23| |FLIOUFUN;Ci;2C;27|
              |FLIOUFUN;Ci;2F;28| |FLIOUFUN;Chi;2C;29| |FLIOUFUN;Chi;2F;30|
              |FLIOUFUN;Si;2C;34| |FLIOUFUN;Si;2F;35| |FLIOUFUN;Shi;2C;36|
              |FLIOUFUN;Shi;2F;37|)
           '#(|li| 241 |gamma| 251 |fresnelS| 255 |fresnelC| 265 |erf| 275 |Si|
              285 |Shi| 295 |Ei| 305 |Ci| 315 |Chi| 325)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 80
                                                 '(0 6 0 7 0 6 9 10 0 6 9 11 2
                                                   13 12 0 0 14 2 15 0 6 6 16 2
                                                   13 0 9 0 17 1 6 9 9 18 0 6 0
                                                   19 1 20 6 6 21 1 6 0 0 22 2
                                                   15 0 0 0 24 0 15 0 25 2 26 0
                                                   9 0 27 1 6 0 13 28 0 29 0 30
                                                   2 6 0 0 0 31 0 15 0 32 2 15
                                                   0 6 0 33 2 15 0 0 0 34 0 6 0
                                                   35 1 6 0 0 36 3 6 0 13 13 9
                                                   37 2 15 0 0 0 38 1 15 6 0 39
                                                   2 6 12 0 0 40 1 15 0 0 41 1
                                                   15 0 0 42 2 15 0 0 6 43 1 6
                                                   13 0 44 2 13 12 0 0 45 1 6
                                                   46 0 47 2 29 0 13 13 48 1 46
                                                   0 29 49 2 46 12 0 0 50 1 46
                                                   0 0 51 1 46 13 0 52 1 15 6 0
                                                   53 2 15 0 0 0 54 1 6 0 29 57
                                                   1 15 0 0 58 1 15 0 0 59 1 15
                                                   6 0 60 1 46 0 0 65 1 15 0 0
                                                   66 2 6 12 0 0 67 2 6 12 0 0
                                                   69 1 0 15 15 71 1 0 6 6 72 0
                                                   0 15 23 1 0 6 6 64 1 0 15 15
                                                   63 1 0 6 6 62 1 0 15 15 61 1
                                                   0 6 6 56 1 0 15 15 55 1 0 6
                                                   6 78 1 0 15 15 77 1 0 15 15
                                                   79 1 0 6 6 80 1 0 15 15 68 1
                                                   0 6 6 70 1 0 6 6 74 1 0 15
                                                   15 73 1 0 6 6 76 1 0 15 15
                                                   75)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatLiouvilianFunctions| 'NILADIC T) 
