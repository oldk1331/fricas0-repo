
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
               (MAX |obits| (SPADCALL 2 (QCAR (QREFELT $ 8)) (QREFELT $ 18)))
               . #1#)
         (EXIT
          (|finally|
           (SEQ (SPADCALL |nbits| (QREFELT $ 19))
                (PROGN
                 (RPLACD (QREFELT $ 8)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20) (QREFELT $ 22))
                          (QREFELT $ 23)))
                 (QCDR (QREFELT $ 8)))
                (PROGN (RPLACA (QREFELT $ 8) |nbits|) (QCAR (QREFELT $ 8)))
                (EXIT
                 (SPADCALL (QCDR (QREFELT $ 8)) (|spadConstant| $ 7)
                           (QREFELT $ 16))))
           (SPADCALL |obits| (QREFELT $ 19))))))))))) 

(DEFUN |FLIOUFUN;erf_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25))
            . #1=(|FLIOUFUN;erf_series|))
      (LETT |tk| |z| . #1#) (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 28)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 20)
                                 (SPADCALL |k1| (QREFELT $ 29)) (QREFELT $ 32))
                       |tk| (QREFELT $ 34))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (LETT |k2| (+ |i| 1) . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20)
                                    (SPADCALL |k2| (QREFELT $ 29))
                                    (QREFELT $ 32))
                          (QREFELT $ 23))
                         |z2| (QREFELT $ 34))
                        |tk| (QREFELT $ 25))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL 2 (QREFELT $ 29))
                  (SPADCALL (SPADCALL (QREFELT $ 36)) (QREFELT $ 37))
                  (QREFELT $ 32))
        |res| (QREFELT $ 34))))))) 

(DEFUN |FLIOUFUN;erfc_asymptotic| (|z| |prec| $)
  (PROG (|term| |res| |k| |z2_inv| |z2| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;erfc_asymptotic|))
      (LETT |term| (|spadConstant| $ 33) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 33)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 29)) |z2|
                                (QREFELT $ 34))
                      (QREFELT $ 39))
            . #1#)
      (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 28)) 1)
                                    (QREFELT $ 29))
                          |z2_inv| (QREFELT $ 34))
                         |term| (QREFELT $ 25))
                        (QREFELT $ 42))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |z2| (QREFELT $ 42)) (QREFELT $ 43))
                  |res| (QREFELT $ 25))
        (SPADCALL |z| (SPADCALL (SPADCALL (QREFELT $ 36)) (QREFELT $ 37))
                  (QREFELT $ 44))
        (QREFELT $ 39))))))) 

(DEFUN |FLIOUFUN;erf_z| (|z| $)
  (PROG (#1=#:G158 #2=#:G161 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz| |prec|
         |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;erf_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 500)
                  (SEQ
                   (EXIT
                    (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 48)) . #3#)
                         (LETT |sp|
                               (|mul_DF_I|
                                (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                          (QREFELT $ 50))
                                |prec|)
                               . #3#)
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT $ 49))
                                             (QREFELT $ 50))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #3#)
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT $ 52))
                                           (QREFELT $ 53))
                                          . #3#)
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|)
                                          . #3#)
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT $ 52))
                                           (QREFELT $ 53))
                                          . #3#)
                                    (SPADCALL |np| (QREFELT $ 19))
                                    (LETT |res|
                                          (|FLIOUFUN;erf_series| |z| |n| $)
                                          . #3#)
                                    (SPADCALL |obits| (QREFELT $ 19))
                                    (EXIT
                                     (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                                   . #3#)
                             (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 19))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 54)) (|spadConstant| $ 7)
                             (QREFELT $ 41))
                   (SPADCALL (|spadConstant| $ 33)
                             (|FLIOUFUN;erfc_asymptotic| |z| (+ |obits| 5) $)
                             (QREFELT $ 55)))
                  (#4#
                   (SPADCALL
                    (|FLIOUFUN;erfc_asymptotic| (SPADCALL |z| (QREFELT $ 42))
                     (+ |obits| 5) $)
                    (|spadConstant| $ 33) (QREFELT $ 55)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;erf;2C;5| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;erf;2C;5|)
          (EXIT
           (|finally| (|FLIOUFUN;erf_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;erf;2F;6| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 56))
   (QREFELT $ 54))) 

(DEFUN |FLIOUFUN;fresnel_c_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z4| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25))
            . #1=(|FLIOUFUN;fresnel_c_series|))
      (LETT |tk| |z| . #1#)
      (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 25)) . #1#)
      (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 28)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 20)
                                 (SPADCALL |k1| (QREFELT $ 29)) (QREFELT $ 32))
                       |tk| (QREFELT $ 34))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 28)) 1)
                         (+ (SPADCALL 2 |i| (QREFELT $ 28)) 2))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20)
                                    (SPADCALL |k2| (QREFELT $ 29))
                                    (QREFELT $ 32))
                          (QREFELT $ 23))
                         |z4| (QREFELT $ 34))
                        |tk| (QREFELT $ 25))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;fresnel_c_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_c| |res_s| |k| |z2_inv| |z2| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;fresnel_c_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 33) |z| (QREFELT $ 39)) . #1#)
      (LETT |term| (|spadConstant| $ 33) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 33)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 29)) |z2|
                                (QREFELT $ 34))
                      (QREFELT $ 39))
            . #1#)
      (LETT |res_c| (|spadConstant| $ 26) . #1#)
      (LETT |res_s| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 55)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 28)) 1)
                                  (QREFELT $ 29))
                        |z2_inv| (QREFELT $ 34))
                       |term| (QREFELT $ 25))
                      . #1#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 28)) 3)
                                    (QREFELT $ 29))
                          |z2_inv| (QREFELT $ 34))
                         |term| (QREFELT $ 25))
                        (QREFELT $ 42))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 49)) (QREFELT $ 58))
                  |z_inv| (QREFELT $ 34))
        (SPADCALL
         (SPADCALL (SPADCALL |z2| (QREFELT $ 59)) |res_c| (QREFELT $ 25))
         (SPADCALL (SPADCALL |z2| (QREFELT $ 60)) |res_s| (QREFELT $ 25))
         (QREFELT $ 35))
        (QREFELT $ 25))))))) 

(DEFUN |FLIOUFUN;fresnel_c_z| (|z| $)
  (PROG (|im_z| |re_z| |pi_fac| #1=#:G174 #2=#:G180 |res| |n| |nf| |np| |npf|
         |sp| |dnz| |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;fresnel_c_z|))
        (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
        (LETT |prec| (+ |obits| 10) . #3#)
        (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
        (EXIT
         (COND
          ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
           (|error| "reqested too high precision"))
          (#4='T
           (SEQ
            (COND
             ((< |oz| 500)
              (SEQ
               (EXIT
                (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 48)) . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                      (QREFELT $ 50))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 49))
                                         (QREFELT $ 50))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 52))
                                                (QREFELT $ 53))
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
                                        (QREFELT $ 52))
                                       (QREFELT $ 53))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 19))
                                (LETT |res|
                                      (|FLIOUFUN;fresnel_c_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 19))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
               #1# (EXIT #1#))))
            (SPADCALL |prec| (QREFELT $ 19))
            (LETT |pi_fac|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 36))
                             (SPADCALL 8 (QREFELT $ 29)) (QREFELT $ 32))
                   (QREFELT $ 37))
                  . #3#)
            (LETT |re_z| (SPADCALL |z| (QREFELT $ 54)) . #3#)
            (LETT |im_z| (SPADCALL |z| (QREFELT $ 61)) . #3#)
            (EXIT
             (COND
              ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 41))
               (COND
                ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 41))
                 (COND
                  ((SPADCALL |re_z| |im_z| (QREFELT $ 41))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                    (QREFELT $ 55)))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                    (QREFELT $ 55)))))
                ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 23))
                           (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 23)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))
              ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 41))
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 23)) |im_z|
                           (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 23))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))
              (#4#
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 23))
                           (SPADCALL |im_z| (QREFELT $ 23)) (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 23))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 23)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;fresnelC;2C;10| (|z| $)
  (PROG (|res| |pi_fac| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;fresnelC;2C;10|))
      (EXIT
       (|finally|
        (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 19))
             (LETT |pi_fac|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 36))
                              (SPADCALL 2 (QREFELT $ 29)) (QREFELT $ 32))
                    (QREFELT $ 37))
                   . #1#)
             (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 34)) . #1#)
             (LETT |res| (|FLIOUFUN;fresnel_c_z| |z| $) . #1#)
             (SPADCALL (+ |obits| 10) (QREFELT $ 19))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 20) |pi_fac| (QREFELT $ 32)) |res|
               (QREFELT $ 34))))
        (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;fresnelC;2F;11| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 62))
   (QREFELT $ 54))) 

(DEFUN |FLIOUFUN;fresnel_s_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z4| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25))
            . #1=(|FLIOUFUN;fresnel_s_series|))
      (LETT |tk| (SPADCALL |z2| |z| (QREFELT $ 25)) . #1#)
      (LETT |z4| (SPADCALL |z2| |z2| (QREFELT $ 25)) . #1#)
      (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 4 |i| (QREFELT $ 28)) 3) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 20)
                                 (SPADCALL |k1| (QREFELT $ 29)) (QREFELT $ 32))
                       |tk| (QREFELT $ 34))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 28)) 2)
                         (+ (SPADCALL 2 |i| (QREFELT $ 28)) 3))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20)
                                    (SPADCALL |k2| (QREFELT $ 29))
                                    (QREFELT $ 32))
                          (QREFELT $ 23))
                         |z4| (QREFELT $ 34))
                        |tk| (QREFELT $ 25))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;fresnel_s_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_s| |res_c| |k| |z2_inv| |z2| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;fresnel_s_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 33) |z| (QREFELT $ 39)) . #1#)
      (LETT |term| (|spadConstant| $ 33) . #1#)
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25)) . #1#)
      (LETT |z2_inv|
            (SPADCALL (|spadConstant| $ 33)
                      (SPADCALL (SPADCALL 2 (QREFELT $ 29)) |z2|
                                (QREFELT $ 34))
                      (QREFELT $ 39))
            . #1#)
      (LETT |res_c| (|spadConstant| $ 26) . #1#)
      (LETT |res_s| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 35)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 28)) 1)
                                  (QREFELT $ 29))
                        |z2_inv| (QREFELT $ 34))
                       |term| (QREFELT $ 25))
                      . #1#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 4 |k| (QREFELT $ 28)) 3)
                                    (QREFELT $ 29))
                          |z2_inv| (QREFELT $ 34))
                         |term| (QREFELT $ 25))
                        (QREFELT $ 42))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 49)) (QREFELT $ 58))
                  |z_inv| (QREFELT $ 34))
        (SPADCALL
         (SPADCALL (SPADCALL |z2| (QREFELT $ 59)) |res_c| (QREFELT $ 25))
         (SPADCALL (SPADCALL |z2| (QREFELT $ 60)) |res_s| (QREFELT $ 25))
         (QREFELT $ 35))
        (QREFELT $ 25))))))) 

(DEFUN |FLIOUFUN;fresnel_s_z| (|z| $)
  (PROG (|im_z| |re_z| |pi_fac| #1=#:G194 #2=#:G200 |res| |n| |nf| |np| |npf|
         |sp| |dnz| |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;fresnel_s_z|))
        (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
        (LETT |prec| (+ |obits| 10) . #3#)
        (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
        (EXIT
         (COND
          ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
           (|error| "reqested too high precision"))
          (#4='T
           (SEQ
            (COND
             ((< |oz| 500)
              (SEQ
               (EXIT
                (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT $ 48)) . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                      (QREFELT $ 50))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 49))
                                         (QREFELT $ 50))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 52))
                                                (QREFELT $ 53))
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
                                        (QREFELT $ 52))
                                       (QREFELT $ 53))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 19))
                                (LETT |res|
                                      (|FLIOUFUN;fresnel_s_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 19))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
               #1# (EXIT #1#))))
            (SPADCALL |prec| (QREFELT $ 19))
            (LETT |pi_fac|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 36))
                             (SPADCALL 8 (QREFELT $ 29)) (QREFELT $ 32))
                   (QREFELT $ 37))
                  . #3#)
            (LETT |re_z| (SPADCALL |z| (QREFELT $ 54)) . #3#)
            (LETT |im_z| (SPADCALL |z| (QREFELT $ 61)) . #3#)
            (EXIT
             (COND
              ((SPADCALL |re_z| (|spadConstant| $ 7) (QREFELT $ 41))
               (COND
                ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 41))
                 (COND
                  ((SPADCALL |re_z| |im_z| (QREFELT $ 41))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                    (QREFELT $ 55)))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7)
                              (SPADCALL |pi_fac| (QREFELT $ 23))
                              (QREFELT $ 16))
                    (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                    (QREFELT $ 55)))))
                ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT $ 23))
                           (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))
              ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 41))
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 23)) |im_z|
                           (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 23))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL |pi_fac| (QREFELT $ 23)) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))
              (#4#
               (COND
                ((SPADCALL (SPADCALL |re_z| (QREFELT $ 23))
                           (SPADCALL |im_z| (QREFELT $ 23)) (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 23))
                            (|spadConstant| $ 7) (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))
                (#4#
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 7) |pi_fac| (QREFELT $ 16))
                  (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| $)
                  (QREFELT $ 55)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;fresnelS;2C;15| (|z| $)
  (PROG (|res| |pi_fac| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;fresnelS;2C;15|))
      (EXIT
       (|finally|
        (SEQ (SPADCALL (+ |obits| 10) (QREFELT $ 19))
             (LETT |pi_fac|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 36))
                              (SPADCALL 2 (QREFELT $ 29)) (QREFELT $ 32))
                    (QREFELT $ 37))
                   . #1#)
             (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT $ 34)) . #1#)
             (LETT |res| (|FLIOUFUN;fresnel_s_z| |z| $) . #1#)
             (SPADCALL (+ |obits| 10) (QREFELT $ 19))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 20) |pi_fac| (QREFELT $ 32)) |res|
               (QREFELT $ 34))))
        (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;fresnelS;2F;16| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 64))
   (QREFELT $ 54))) 

(DEFUN |FLIOUFUN;ei_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i|)
    (RETURN
     (SEQ (LETT |tk| |z| . #1=(|FLIOUFUN;ei_series|))
          (LETT |res| (|spadConstant| $ 26) . #1#)
          (SEQ (LETT |i| 0 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |k1| (+ |i| 1) . #1#)
                    (LETT |term|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 20)
                                     (SPADCALL |k1| (QREFELT $ 29))
                                     (QREFELT $ 32))
                           |tk| (QREFELT $ 34))
                          . #1#)
                    (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                    (LETT |k2| (+ |i| 2) . #1#)
                    (EXIT
                     (LETT |tk|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 20)
                                       (SPADCALL |k2| (QREFELT $ 29))
                                       (QREFELT $ 32))
                             |z| (QREFELT $ 34))
                            |tk| (QREFELT $ 25))
                           . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FLIOUFUN;ei_asymptotic| (|z| |prec| $)
  (PROG (|term| |res| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;ei_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 33) |z| (QREFELT $ 39)) . #1#)
      (LETT |term| |z_inv| . #1#) (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |k| 1) (QREFELT $ 29)) |z_inv|
                                  (QREFELT $ 34))
                        |term| (QREFELT $ 25))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (SPADCALL |z| (QREFELT $ 43)) |res| (QREFELT $ 25))))))) 

(DEFUN |FLIOUFUN;ei_z| (|z| $)
  (PROG (|im_z| |pii| #1=#:G214 #2=#:G219 |res| |n| |nf| |np| |npf| |sp| |dnz|
         |oz| |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;ei_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 48))
                                     (QREFELT $ 66))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                      (QREFELT $ 50))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 49))
                                         (QREFELT $ 50))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 52))
                                                (QREFELT $ 53))
                                      . #3#)
                                (LETT |nf|
                                      (|add_DF| (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                                |sp|)
                                      . #3#)
                                (LETT |n|
                                      (SPADCALL (SPADCALL |nf| (QREFELT $ 52))
                                                (QREFELT $ 53))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 19))
                                (LETT |res| (|FLIOUFUN;ei_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 19))
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 24))
                                                   (SPADCALL |z|
                                                             (QREFELT $ 67))
                                                   (QREFELT $ 35))
                                         |res| (QREFELT $ 35))
                                        . #3#)
                                  (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 19))
                (LETT |pii| (SPADCALL (QREFELT $ 36)) . #3#)
                (LETT |im_z| (SPADCALL |z| (QREFELT $ 61)) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |im_z| (|spadConstant| $ 7) (QREFELT $ 68))
                   (COND
                    ((SPADCALL (SPADCALL |z| (QREFELT $ 54))
                               (SPADCALL |im_z| (QREFELT $ 23)) (QREFELT $ 41))
                     (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                    (#4#
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 7)
                                (SPADCALL |pii| (QREFELT $ 23)) (QREFELT $ 16))
                      (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                      (QREFELT $ 35)))))
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 54)) |im_z|
                             (QREFELT $ 41))
                   (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $))
                  (#4#
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 7) |pii| (QREFELT $ 16))
                    (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) $)
                    (QREFELT $ 35)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Ei;2C;20| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ei;2C;20|)
          (EXIT
           (|finally| (|FLIOUFUN;ei_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;Ei;2F;21| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 70)) (|error| "Ei: x <= 0"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 69))
     (QREFELT $ 54))))) 

(DEFUN |FLIOUFUN;li;2C;22| (|z| $)
  (PROG (|z1| |obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #1=(|FLIOUFUN;li;2C;22|))
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 5) (QREFELT $ 19))
                 (LETT |z1| (SPADCALL |z| (QREFELT $ 67)) . #1#)
                 (EXIT (SPADCALL |z1| (QREFELT $ 69))))
            (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;li;2F;23| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 20) (QREFELT $ 70)) (|error| "li: x <= 1"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 72))
     (QREFELT $ 54))))) 

(DEFUN |FLIOUFUN;ci_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25)) . #1=(|FLIOUFUN;ci_series|))
      (LETT |tk|
            (SPADCALL
             (SPADCALL
              (SPADCALL (|spadConstant| $ 20) (SPADCALL 2 (QREFELT $ 29))
                        (QREFELT $ 32))
              (QREFELT $ 23))
             |z2| (QREFELT $ 34))
            . #1#)
      (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (SPADCALL 2 |i| (QREFELT $ 28)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 20)
                                 (SPADCALL |k1| (QREFELT $ 29)) (QREFELT $ 32))
                       |tk| (QREFELT $ 34))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 28)) 1)
                         (+ (SPADCALL 2 |i| (QREFELT $ 28)) 2))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20)
                                    (SPADCALL |k2| (QREFELT $ 29))
                                    (QREFELT $ 32))
                          (QREFELT $ 23))
                         |z2| (QREFELT $ 34))
                        |tk| (QREFELT $ 25))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;ci_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_c| |res_s| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;ci_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 33) |z| (QREFELT $ 39)) . #1#)
      (LETT |term| (|spadConstant| $ 33) . #1#)
      (LETT |res_c| (|spadConstant| $ 26) . #1#)
      (LETT |res_s| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 35)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 28)) 1)
                                   (QREFELT $ 29))
                         |z_inv| (QREFELT $ 34))
                        |term| (QREFELT $ 25))
                       (QREFELT $ 42))
                      . #1#)
                (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 28)) 2)
                                   (QREFELT $ 29))
                         |z_inv| (QREFELT $ 34))
                        |term| (QREFELT $ 25))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |z_inv|
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| (QREFELT $ 59)) |res_c|
                            (QREFELT $ 25))
                  (SPADCALL (SPADCALL |z| (QREFELT $ 60)) |res_s|
                            (QREFELT $ 25))
                  (QREFELT $ 35))
                 (QREFELT $ 25))))))) 

(DEFUN |FLIOUFUN;ci_z| (|z| $)
  (PROG (|pi_fac| #1=#:G236 #2=#:G240 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz|
         |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;ci_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 48))
                                     (QREFELT $ 66))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                      (QREFELT $ 50))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 49))
                                         (QREFELT $ 50))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 52))
                                                (QREFELT $ 53))
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
                                        (QREFELT $ 52))
                                       (QREFELT $ 53))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 19))
                                (LETT |res| (|FLIOUFUN;ci_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 19))
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL |res|
                                                   (SPADCALL (QREFELT $ 24))
                                                   (QREFELT $ 35))
                                         (SPADCALL |z| (QREFELT $ 67))
                                         (QREFELT $ 35))
                                        . #3#)
                                  (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 19))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 54)) (|spadConstant| $ 7)
                             (QREFELT $ 41))
                   (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $))
                  (#4#
                   (SEQ (LETT |pi_fac| (SPADCALL (QREFELT $ 36)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |z| (QREFELT $ 61))
                                     (|spadConstant| $ 7) (QREFELT $ 68))
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 7)
                                      (SPADCALL |pi_fac| (QREFELT $ 23))
                                      (QREFELT $ 16))
                            (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                            (QREFELT $ 35)))
                          (#4#
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 7) |pi_fac|
                                      (QREFELT $ 16))
                            (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) $)
                            (QREFELT $ 35)))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Ci;2C;27| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Ci;2C;27|)
          (EXIT
           (|finally| (|FLIOUFUN;ci_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;Ci;2F;28| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 70)) (|error| "Ci: x <= 0"))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 16))
               (QREFELT $ 74))
     (QREFELT $ 54))))) 

(DEFUN |FLIOUFUN;si_series| (|z| |n| $)
  (PROG (|tk| |k2| |res| |term| |k1| |i| |z2|)
    (RETURN
     (SEQ
      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 25)) . #1=(|FLIOUFUN;si_series|))
      (LETT |tk| |z| . #1#) (LETT |res| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (+ (SPADCALL 2 |i| (QREFELT $ 28)) 1) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 20)
                                 (SPADCALL |k1| (QREFELT $ 29)) (QREFELT $ 32))
                       |tk| (QREFELT $ 34))
                      . #1#)
                (LETT |res| (SPADCALL |res| |term| (QREFELT $ 35)) . #1#)
                (LETT |k2|
                      (* (+ (SPADCALL 2 |i| (QREFELT $ 28)) 2)
                         (+ (SPADCALL 2 |i| (QREFELT $ 28)) 3))
                      . #1#)
                (EXIT
                 (LETT |tk|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 20)
                                    (SPADCALL |k2| (QREFELT $ 29))
                                    (QREFELT $ 32))
                          (QREFELT $ 23))
                         |z2| (QREFELT $ 34))
                        |tk| (QREFELT $ 25))
                       . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FLIOUFUN;si_asymptotic| (|z| |prec| $)
  (PROG (|term| |res_s| |res_c| |k| |z_inv| |eps|)
    (RETURN
     (SEQ
      (LETT |eps|
            (SPADCALL 1 (- (SPADCALL 2 |prec| (QREFELT $ 18))) 2
                      (QREFELT $ 38))
            . #1=(|FLIOUFUN;si_asymptotic|))
      (LETT |z_inv| (SPADCALL (|spadConstant| $ 33) |z| (QREFELT $ 39)) . #1#)
      (LETT |term| (|spadConstant| $ 33) . #1#)
      (LETT |res_c| (|spadConstant| $ 26) . #1#)
      (LETT |res_s| (|spadConstant| $ 26) . #1#)
      (SEQ (LETT |k| 0 . #1#) G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |term| (QREFELT $ 40)) |eps| (QREFELT $ 41)))
             (GO G191)))
           (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT $ 35)) . #1#)
                (LETT |term|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 28)) 1)
                                  (QREFELT $ 29))
                        |z_inv| (QREFELT $ 34))
                       |term| (QREFELT $ 25))
                      . #1#)
                (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT $ 35)) . #1#)
                (EXIT
                 (LETT |term|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 28)) 2)
                                    (QREFELT $ 29))
                          |z_inv| (QREFELT $ 34))
                         |term| (QREFELT $ 25))
                        (QREFELT $ 42))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |z_inv|
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| (QREFELT $ 59)) |res_c|
                            (QREFELT $ 25))
                  (SPADCALL (SPADCALL |z| (QREFELT $ 60)) |res_s|
                            (QREFELT $ 25))
                  (QREFELT $ 35))
                 (QREFELT $ 25))))))) 

(DEFUN |FLIOUFUN;si_z| (|z| $)
  (PROG (|pi_fac| #1=#:G253 #2=#:G256 |res| |n| |nf| |np| |npf| |sp| |dnz| |oz|
         |prec| |nz| |obits|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) . #3=(|FLIOUFUN;si_z|))
            (LETT |nz| (SPADCALL |z| (QREFELT $ 40)) . #3#)
            (LETT |prec| (+ |obits| 20) . #3#)
            (LETT |oz| (SPADCALL |nz| (QREFELT $ 45)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (INTEGER-LENGTH |prec|) 500 (QREFELT $ 46))
               (|error| "reqested too high precision"))
              (#4='T
               (SEQ
                (COND
                 ((< |oz| 1000)
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |dnz|
                           (SPADCALL (SPADCALL |nz| (QREFELT $ 48))
                                     (QREFELT $ 66))
                           . #3#)
                     (LETT |sp|
                           (|mul_DF_I|
                            (SPADCALL (SPADCALL 694 1000 (QREFELT $ 49))
                                      (QREFELT $ 50))
                            |prec|)
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |sp| |dnz| (QREFELT $ 51))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (LETT |npf|
                                      (|add_DF|
                                       (|mul_DF|
                                        (SPADCALL
                                         (SPADCALL 2000 693 (QREFELT $ 49))
                                         (QREFELT $ 50))
                                        |dnz|)
                                       (FLOAT |prec|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #3#)
                                (LETT |np|
                                      (SPADCALL (SPADCALL |npf| (QREFELT $ 52))
                                                (QREFELT $ 53))
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
                                        (QREFELT $ 52))
                                       (QREFELT $ 53))
                                      . #3#)
                                (SPADCALL |np| (QREFELT $ 19))
                                (LETT |res| (|FLIOUFUN;si_series| |z| |n| $)
                                      . #3#)
                                (SPADCALL |obits| (QREFELT $ 19))
                                (EXIT (PROGN (LETT #2# |res| . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#)))))))
                   #1# (EXIT #1#))))
                (SPADCALL |prec| (QREFELT $ 19))
                (LETT |pi_fac|
                      (SPADCALL (SPADCALL (QREFELT $ 36))
                                (SPADCALL 2 (QREFELT $ 29)) (QREFELT $ 32))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 54)) (|spadConstant| $ 7)
                             (QREFELT $ 41))
                   (SPADCALL
                    (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                    (|FLIOUFUN;si_asymptotic| |z| (+ |obits| 5) $)
                    (QREFELT $ 55)))
                  (#4#
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL |pi_fac| (|spadConstant| $ 7) (QREFELT $ 16))
                     (|FLIOUFUN;si_asymptotic| (SPADCALL |z| (QREFELT $ 42))
                      (+ |obits| 5) $)
                     (QREFELT $ 55))
                    (QREFELT $ 42)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FLIOUFUN;Si;2C;32| (|z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 10)) |FLIOUFUN;Si;2C;32|)
          (EXIT
           (|finally| (|FLIOUFUN;si_z| |z| $)
                      (SPADCALL |obits| (QREFELT $ 19)))))))) 

(DEFUN |FLIOUFUN;Si;2F;33| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 7) (QREFELT $ 16)) (QREFELT $ 76))
   (QREFELT $ 54))) 

(DEFUN |FloatLiouvilianFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G261)
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
      (LETT $ (GETREFV 78) . #1#)
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
              (|Integer|) (12 . <=) (|Complex| 6) (18 . |complex|) (24 . |max|)
              (28 . *) (34 . |bits|) (39 . |One|) (|FloatSpecialFunctions|)
              (43 . |digamma|) (48 . -) |FLIOUFUN;gamma;C;1| (53 . *)
              (59 . |Zero|) (|NonNegativeInteger|) (63 . *) (69 . |coerce|)
              (|Fraction| 13) (74 . |One|) (78 . /) (84 . |One|) (88 . *)
              (94 . +) (100 . |pi|) (104 . |sqrt|) (109 . |float|) (116 . /)
              (122 . |norm|) (127 . >) (133 . -) (138 . |exp|) (143 . *)
              (149 . |order|) (154 . >) (|DoubleFloat|) (160 . |coerce|)
              (165 . /) (171 . |coerce|) (176 . >) (182 . |round|)
              (187 . |retract|) (192 . |real|) (197 . -) |FLIOUFUN;erf;2C;5|
              |FLIOUFUN;erf;2F;6| (203 . |coerce|) (208 . |cos|) (213 . |sin|)
              (218 . |imag|) |FLIOUFUN;fresnelC;2C;10|
              |FLIOUFUN;fresnelC;2F;11| |FLIOUFUN;fresnelS;2C;15|
              |FLIOUFUN;fresnelS;2F;16| (223 . |sqrt|) (228 . |log|) (233 . <)
              |FLIOUFUN;Ei;2C;20| (239 . <=) |FLIOUFUN;Ei;2F;21|
              |FLIOUFUN;li;2C;22| |FLIOUFUN;li;2F;23| |FLIOUFUN;Ci;2C;27|
              |FLIOUFUN;Ci;2F;28| |FLIOUFUN;Si;2C;32| |FLIOUFUN;Si;2F;33|)
           '#(|li| 245 |gamma| 255 |fresnelS| 259 |fresnelC| 269 |erf| 279 |Si|
              289 |Ei| 299 |Ci| 309)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 77
                                                 '(0 6 0 7 0 6 9 10 0 6 9 11 2
                                                   13 12 0 0 14 2 15 0 6 6 16 0
                                                   6 0 17 2 13 0 9 0 18 1 6 9 9
                                                   19 0 6 0 20 1 21 6 6 22 1 6
                                                   0 0 23 2 15 0 0 0 25 0 15 0
                                                   26 2 27 0 9 0 28 1 6 0 13 29
                                                   0 30 0 31 2 6 0 0 0 32 0 15
                                                   0 33 2 15 0 6 0 34 2 15 0 0
                                                   0 35 0 6 0 36 1 6 0 0 37 3 6
                                                   0 13 13 9 38 2 15 0 0 0 39 1
                                                   15 6 0 40 2 6 12 0 0 41 1 15
                                                   0 0 42 1 15 0 0 43 2 15 0 0
                                                   6 44 1 6 13 0 45 2 13 12 0 0
                                                   46 1 6 47 0 48 2 30 0 13 13
                                                   49 1 47 0 30 50 2 47 12 0 0
                                                   51 1 47 0 0 52 1 47 13 0 53
                                                   1 15 6 0 54 2 15 0 0 0 55 1
                                                   6 0 30 58 1 15 0 0 59 1 15 0
                                                   0 60 1 15 6 0 61 1 47 0 0 66
                                                   1 15 0 0 67 2 6 12 0 0 68 2
                                                   6 12 0 0 70 1 0 15 15 72 1 0
                                                   6 6 73 0 0 15 24 1 0 15 15
                                                   64 1 0 6 6 65 1 0 15 15 62 1
                                                   0 6 6 63 1 0 15 15 56 1 0 6
                                                   6 57 1 0 15 15 76 1 0 6 6 77
                                                   1 0 15 15 69 1 0 6 6 71 1 0
                                                   15 15 74 1 0 6 6 75)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatLiouvilianFunctions| 'NILADIC T) 
