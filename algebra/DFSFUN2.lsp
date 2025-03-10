
(SDEFUN |DFSFUN2;bernoulli_gamma_series_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|s| (|Complex| (|DoubleFloat|))) (|k| NIL)
          (|z2inv| (|Complex| (|DoubleFloat|)))
          (|zinv| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 11) |z| (QREFELT % 12)))
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 13)))
              (LETT |s| (SPADCALL (DELT (QREFELT % 9) 10) 0.0 (QREFELT % 15)))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |z2inv| |s| (QREFELT % 13))
                                     (SPADCALL (DELT (QREFELT % 9) |k|) 0.0
                                               (QREFELT % 15))
                                     (QREFELT % 16)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |zinv| |s| (QREFELT % 13)))))) 

(SDEFUN |DFSFUN2;bernoulli_gamma_series_DF|
        ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|s| (|DoubleFloat|)) (|k| NIL) (|z2inv| (|DoubleFloat|))
          (|zinv| (|DoubleFloat|)))
         (SEQ (LETT |zinv| (|div_DF| 1.0 |z|))
              (LETT |z2inv| (|mul_DF| |zinv| |zinv|))
              (LETT |s| (DELT (QREFELT % 9) 10))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (|add_DF| (|mul_DF| |z2inv| |s|)
                                     (DELT (QREFELT % 9) |k|)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (|mul_DF| |zinv| |s|))))) 

(SDEFUN |DFSFUN2;logGamma_a1_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z| (SPADCALL (|mk_DF| 5 -1) 0.0 (QREFELT % 15))
                     (QREFELT % 20))
           (SPADCALL |z| (QREFELT % 21)) (QREFELT % 13))
          |z| (QREFELT % 20))
         (SPADCALL (QREFELT % 17) 0.0 (QREFELT % 15)) (QREFELT % 16))) 

(SDEFUN |DFSFUN2;logGamma_a1_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|add_DF|
         (|sub_DF|
          (|mul_DF| (|sub_DF| |z| (|mk_DF| 5 -1))
                    (SPADCALL |z| (QREFELT % 23)))
          |z|)
         (QREFELT % 17))) 

(SDEFUN |DFSFUN2;logGamma1_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL (|DFSFUN2;logGamma_a1_CDF| |z| %)
                  (|DFSFUN2;bernoulli_gamma_series_CDF| |z| %) (QREFELT % 16))) 

(SDEFUN |DFSFUN2;logGamma1_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|add_DF| (|DFSFUN2;logGamma_a1_DF| |z| %)
                  (|DFSFUN2;bernoulli_gamma_series_DF| |z| %))) 

(SDEFUN |DFSFUN2;Gamma_taylor| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|s| (|DoubleFloat|)) (|i| NIL) (|z2| (|DoubleFloat|))
          (|z1| (|DoubleFloat|)))
         (SEQ (LETT |s| 0.0) (LETT |z1| (|sub_DF| |z| (|mk_DF| 15 -1)))
              (LETT |z2| (|mul_DF| |z1| |z1|))
              (SEQ (LETT |i| 18) G190 (COND ((< |i| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (|add_DF|
                            (|add_DF| (|mul_DF| |z2| |s|)
                                      (|mul_DF| |z1|
                                                (DELT (QREFELT % 24)
                                                      (+ |i| 1))))
                            (DELT (QREFELT % 24) |i|)))))
                   (LETT |i| (+ |i| -2)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|div_DF| 1.0
                         (|add_DF| 1.0
                                   (|mul_DF| (|mul_DF| |s| (|sub_DF| |z| 1.0))
                                             (|sub_DF| |z|
                                                       (FLOAT 2
                                                              MOST-POSITIVE-DOUBLE-FLOAT))))))))) 

(SDEFUN |DFSFUN2;Gamma1a_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|exp_DF| (|DFSFUN2;logGamma1_DF| |z| %))) 

(SDEFUN |DFSFUN2;Gamma;2Df;9| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|p| (|DoubleFloat|)) (|sign| (|DoubleFloat|)) (|z1| (|DoubleFloat|))
          (|z_int| (|DoubleFloat|)))
         (SEQ
          (COND
           ((|less_DF| |z| 0.0)
            (SEQ (LETT |z_int| (SPADCALL |z| (QREFELT % 25)))
                 (LETT |z1| (|sub_DF| |z| |z_int|))
                 (EXIT
                  (COND ((|eql_DF| |z1| 0.0) (|error| "Pole of Gamma"))
                        (#1='T
                         (SEQ
                          (LETT |sign|
                                (COND
                                 ((ODDP (SPADCALL |z_int| (QREFELT % 27)))
                                  (|minus_DF| 1.0))
                                 (#1# 1.0)))
                          (EXIT
                           (|div_DF| (|mul_DF| |sign| (QREFELT % 18))
                                     (|mul_DF|
                                      (SPADCALL (|sub_DF| 1.0 |z|)
                                                (QREFELT % 28))
                                      (|sin_DF|
                                       (|mul_DF| (QREFELT % 18) |z1|)))))))))))
           ((|less_DF| |z| 1.0)
            (|div_DF| (|DFSFUN2;Gamma_taylor| (|add_DF| |z| 1.0) %) |z|))
           (#1#
            (COND ((|less_DF| (|mk_DF| 9 0) |z|) (|DFSFUN2;Gamma1a_DF| |z| %))
                  ((|less_DF| (|mk_DF| 2 0) |z|)
                   (SEQ (LETT |p| 1.0)
                        (SEQ G190
                             (COND
                              ((NULL (|less_DF| (|mk_DF| 2 0) |z|)) (GO G191)))
                             (SEQ (LETT |z| (|sub_DF| |z| 1.0))
                                  (EXIT (LETT |p| (|mul_DF| |p| |z|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (|mul_DF| |p| (|DFSFUN2;Gamma_taylor| |z| %)))))
                  (#1# (|DFSFUN2;Gamma_taylor| |z| %)))))))) 

(SDEFUN |DFSFUN2;Beta;3Df;10|
        ((|a| (|DoubleFloat|)) (|b| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|div_DF|
         (|mul_DF| (SPADCALL |a| (QREFELT % 28)) (SPADCALL |b| (QREFELT % 28)))
         (SPADCALL (|add_DF| |a| |b|) (QREFELT % 28)))) 

(SDEFUN |DFSFUN2;logGamma;2Df;11| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (COND
         ((|less_DF| 0.0 |z|)
          (COND ((|less_DF| (|mk_DF| 8 0) |z|) (|DFSFUN2;logGamma1_DF| |z| %))
                (#1='T
                 (SPADCALL (SPADCALL |z| (QREFELT % 28)) (QREFELT % 23)))))
         (#1# (|error| "logGamma: nonpositive z")))) 

(SDEFUN |DFSFUN2;Gamma1a_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL (|DFSFUN2;logGamma1_CDF| |z| %) (QREFELT % 31))) 

(SDEFUN |DFSFUN2;Gamma1b|
        ((|z| #1=(|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|zp| #1#) (|i| NIL))
               (SEQ (LETT |zp| |z|)
                    (SEQ (LETT |i| 1) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |zp|
                                 (SPADCALL |zp|
                                           (SPADCALL |z|
                                                     (SPADCALL
                                                      (FLOAT |i|
                                                             MOST-POSITIVE-DOUBLE-FLOAT)
                                                      0.0 (QREFELT % 15))
                                                     (QREFELT % 16))
                                           (QREFELT % 13)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL
                      (|DFSFUN2;Gamma1a_CDF|
                       (SPADCALL |z|
                                 (SPADCALL (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                                           0.0 (QREFELT % 15))
                                 (QREFELT % 16))
                       %)
                      |zp| (QREFELT % 12)))))) 

(SDEFUN |DFSFUN2;Gamma;2C;14|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|sign| (|DoubleFloat|)) (|z1| (|Complex| (|DoubleFloat|)))
          (|z_int| (|DoubleFloat|)) (|zr| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT % 32)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;Gamma1a_CDF| |z| %))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 33)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;Gamma1a_CDF| |z| %))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ (LETT |z_int| (SPADCALL |zr| (QREFELT % 25)))
                              (LETT |z1|
                                    (SPADCALL |z|
                                              (SPADCALL |z_int| 0.0
                                                        (QREFELT % 15))
                                              (QREFELT % 20)))
                              (EXIT
                               (COND
                                ((SPADCALL |z1| (|spadConstant| % 22)
                                           (QREFELT % 35))
                                 (|error| "Pole of Gamma"))
                                (#1#
                                 (SEQ
                                  (LETT |sign|
                                        (COND
                                         ((ODDP
                                           (SPADCALL |z_int| (QREFELT % 27)))
                                          (|minus_DF| 1.0))
                                         (#1# 1.0)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (|mul_DF| |sign| (QREFELT % 18))
                                              0.0 (QREFELT % 15))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 11) |z|
                                                (QREFELT % 20))
                                      (QREFELT % 36))
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 18) |z1|
                                                (QREFELT % 37))
                                      (QREFELT % 38))
                                     (QREFELT % 13))
                                    (QREFELT % 12)))))))))
                        (#1# (|DFSFUN2;Gamma1b| |z| %))))))))))) 

(SDEFUN |DFSFUN2;logGamma1b|
        ((|z| #1=(|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|lp1| (|Complex| (|DoubleFloat|))) (|p1| #1#) (|i| NIL))
               (SEQ (LETT |p1| |z|)
                    (SEQ (LETT |i| 1) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |p1|
                                 (SPADCALL |p1|
                                           (SPADCALL |z|
                                                     (SPADCALL
                                                      (FLOAT |i|
                                                             MOST-POSITIVE-DOUBLE-FLOAT)
                                                      0.0 (QREFELT % 15))
                                                     (QREFELT % 16))
                                           (QREFELT % 13)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |lp1| (SPADCALL |p1| (QREFELT % 21)))
                    (COND
                     ((|less_DF| (SPADCALL |lp1| (QREFELT % 32)) 0.0)
                      (LETT |lp1|
                            (SPADCALL |lp1|
                                      (SPADCALL 0.0
                                                (|mul_DF| (|mk_DF| 2 0)
                                                          (QREFELT % 18))
                                                (QREFELT % 15))
                                      (QREFELT % 16)))))
                    (EXIT
                     (SPADCALL
                      (|DFSFUN2;logGamma1_CDF|
                       (SPADCALL |z|
                                 (SPADCALL (|mk_DF| 8 0) 0.0 (QREFELT % 15))
                                 (QREFELT % 16))
                       %)
                      |lp1| (QREFELT % 20)))))) 

(SDEFUN |DFSFUN2;log_sin|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res2| (|Complex| (|DoubleFloat|))) (|zr| (|DoubleFloat|))
          (|res1| (|Complex| (|DoubleFloat|))) (|n| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 33)))
              (LETT |zi| (SPADCALL |z| (QREFELT % 32)))
              (LETT |n| (SPADCALL |zr| (QREFELT % 25)))
              (LETT |res1|
                    (COND
                     ((|less_DF| |zi| 0.0)
                      (SPADCALL 0.0 (|mul_DF| |n| (QREFELT % 18))
                                (QREFELT % 15)))
                     (#1='T
                      (SPADCALL 0.0 (|minus_DF| (|mul_DF| |n| (QREFELT % 18)))
                                (QREFELT % 15)))))
              (LETT |zr| (|sub_DF| |zr| |n|))
              (LETT |z|
                    (SPADCALL (|mul_DF| (QREFELT % 18) |zr|)
                              (|mul_DF| (QREFELT % 18) |zi|) (QREFELT % 15)))
              (LETT |res2|
                    (COND
                     ((|less_DF| |zr| 0.0)
                      (COND
                       ((|less_DF| |zi| 0.0)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 39))
                                    (QREFELT % 38))
                          (QREFELT % 21))
                         (SPADCALL 0.0 (QREFELT % 18) (QREFELT % 15))
                         (QREFELT % 20)))
                       (#1#
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 39))
                                    (QREFELT % 38))
                          (QREFELT % 21))
                         (SPADCALL 0.0 (QREFELT % 18) (QREFELT % 15))
                         (QREFELT % 16)))))
                     (#1#
                      (SPADCALL (SPADCALL |z| (QREFELT % 38))
                                (QREFELT % 21)))))
              (EXIT (SPADCALL |res1| |res2| (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;logGamma;2C;17|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res1| (|Complex| (|DoubleFloat|))) (|zr| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT % 32)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;logGamma1_CDF| |z| %))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 33)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;logGamma1_CDF| |z| %))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ
                          (LETT |res1|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1.0 0.0 (QREFELT % 15))
                                           |z| (QREFELT % 20))
                                 (QREFELT % 40)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT % 19) 0.0 (QREFELT % 15))
                             (|DFSFUN2;log_sin| |z| %) (QREFELT % 20))
                            |res1| (QREFELT % 20)))))
                        ((|less_DF| |zi| 0.0)
                         (SPADCALL
                          (|DFSFUN2;logGamma1b| (SPADCALL |z| (QREFELT % 41))
                           %)
                          (QREFELT % 41)))
                        (#1# (|DFSFUN2;logGamma1b| |z| %))))))))))) 

(SDEFUN |DFSFUN2;Beta;3C;18|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 36)) (SPADCALL |y| (QREFELT % 36))
                   (QREFELT % 13))
         (SPADCALL (SPADCALL |x| |y| (QREFELT % 16)) (QREFELT % 36))
         (QREFELT % 12))) 

(SDEFUN |DFSFUN2;psi_W2_DF|
        ((|x| (|DoubleFloat|)) (|s| (|DoubleFloat|))
         (|n| (|NonNegativeInteger|)) (|m| (|Integer|)) (% (|DoubleFloat|)))
        (SPROG
         ((|xm| (|DoubleFloat|)) (#1=#:G93 NIL) (|i| NIL) (|nn| (|Integer|)))
         (SEQ (LETT |nn| (- -1 |n|))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |xm|
                          (|add_DF| |x|
                                    (FLOAT (- |m| |i|)
                                           MOST-POSITIVE-DOUBLE-FLOAT)))
                    (EXIT (LETT |s| (|add_DF| |s| (|expt_DF_I| |xm| |nn|)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling1_DF|
        ((|t| (|DoubleFloat|)) (|x2_inv| (|DoubleFloat|))
         (|r_eps| (|DoubleFloat|)) (|df_n| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|df_k| (|DoubleFloat|)) (|s| (|DoubleFloat|)) (#1=#:G100 NIL)
          (|tk| (|DoubleFloat|)) (|ccn| (|DoubleFloat|)) (|k| NIL))
         (SEQ (LETT |s| 0.0) (LETT |df_k| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
              (SEQ
               (EXIT
                (SEQ (LETT |k| 2) G190 (COND ((|greater_SI| |k| 21) (GO G191)))
                     (SEQ
                      (LETT |ccn|
                            (|div_DF|
                             (|mul_DF| (|add_DF| (|add_DF| |df_k| 1.0) |df_n|)
                                       (|add_DF| |df_k| |df_n|))
                             (|mul_DF| (|add_DF| |df_k| 1.0)
                                       (|add_DF| |df_k|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)))))
                      (LETT |t| (|mul_DF| (|mul_DF| |ccn| |t|) |x2_inv|))
                      (LETT |tk| (|mul_DF| (DELT (QREFELT % 43) |k|) |t|))
                      (EXIT
                       (COND
                        ((|less_DF| (|abs_DF| |tk|) |r_eps|)
                         (PROGN (LETT #1# 1) (GO #2=#:G97)))
                        ('T
                         (SEQ (LETT |s| (|add_DF| |s| |tk|))
                              (EXIT
                               (LETT |df_k|
                                     (|add_DF| |df_k|
                                               (FLOAT 2
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling_DF|
        ((|xm| (|DoubleFloat|)) (|n| (|NonNegativeInteger|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|s| (|DoubleFloat|)) (|t1| #1=(|DoubleFloat|)) (|t0| #1#)
          (|r_eps| #1#) (|t| #1#) (|df_n| (|DoubleFloat|)) (|x2_inv| #1#)
          (|xm_inv| (|DoubleFloat|)))
         (SEQ (LETT |xm_inv| (|div_DF| 1.0 |xm|))
              (LETT |x2_inv| (|mul_DF| |xm_inv| |xm_inv|))
              (LETT |df_n| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
              (LETT |t0| (|mul_DF| (|mk_DF| 5 -1) |xm_inv|))
              (LETT |t|
                    (|mul_DF| (|mul_DF| (|add_DF| |df_n| 1.0) (|mk_DF| 5 -1))
                              |x2_inv|))
              (LETT |r_eps| (|mul_DF| (|mk_DF| 1 -18) (|abs_DF| |t0|)))
              (COND
               ((> |n| 0) (LETT |t0| (|add_DF| |t0| (|div_DF| 1.0 |df_n|)))))
              (LETT |t1| (|mul_DF| (DELT (QREFELT % 43) 1) |t|))
              (LETT |s|
                    (COND ((|less_DF| (|abs_DF| |t1|) |r_eps|) 0.0)
                          ('T
                           (|add_DF| |t1|
                                     (|DFSFUN2;W_stirling1_DF| |t| |x2_inv|
                                      |r_eps| |df_n| %)))))
              (EXIT (|add_DF| |t0| |s|))))) 

(SDEFUN |DFSFUN2;psi_W1_DF|
        ((|x| (|DoubleFloat|)) (|n| (|NonNegativeInteger|)) (|m| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG ((|s| (|DoubleFloat|)) (|xm| (|DoubleFloat|)))
               (SEQ
                (LETT |xm|
                      (|add_DF| |x| (FLOAT |m| MOST-POSITIVE-DOUBLE-FLOAT)))
                (LETT |s|
                      (|mul_DF| (|expt_DF_I| |xm| (- |n|))
                                (|DFSFUN2;W_stirling_DF| |xm| |n| %)))
                (COND
                 ((EQL |n| 0)
                  (LETT |s| (|sub_DF| |s| (SPADCALL |xm| (QREFELT % 23))))))
                (EXIT (|DFSFUN2;psi_W2_DF| |x| |s| |n| |m| %))))) 

(SDEFUN |DFSFUN2;cabs| ((|z| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL (SPADCALL |z| (QREFELT % 44)) (QREFELT % 45))) 

(SDEFUN |DFSFUN2;psi_W2_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (|s| (|Complex| (|DoubleFloat|)))
         (|n| (|NonNegativeInteger|)) (|m| (|Integer|))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xm| (|Complex| (|DoubleFloat|))) (#1=#:G112 NIL) (|i| NIL)
          (|nn| (|Integer|)))
         (SEQ (LETT |nn| (- -1 |n|))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |xm|
                          (SPADCALL |x|
                                    (SPADCALL
                                     (FLOAT (- |m| |i|)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (QREFELT % 46))
                                    (QREFELT % 16)))
                    (EXIT
                     (LETT |s|
                           (SPADCALL |s| (SPADCALL |xm| |nn| (QREFELT % 47))
                                     (QREFELT % 16)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling1_CDF|
        ((|t| (|Complex| (|DoubleFloat|)))
         (|x2_inv| (|Complex| (|DoubleFloat|))) (|r_eps| (|DoubleFloat|))
         (|df_n| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|df_k| (|DoubleFloat|)) (|s| (|Complex| (|DoubleFloat|)))
          (#1=#:G119 NIL) (|tk| (|Complex| (|DoubleFloat|)))
          (|ccn| (|DoubleFloat|)) (|k| NIL))
         (SEQ (LETT |s| (|spadConstant| % 22))
              (LETT |df_k| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
              (SEQ
               (EXIT
                (SEQ (LETT |k| 2) G190 (COND ((|greater_SI| |k| 21) (GO G191)))
                     (SEQ
                      (LETT |ccn|
                            (|div_DF|
                             (|mul_DF| (|add_DF| (|add_DF| |df_k| 1.0) |df_n|)
                                       (|add_DF| |df_k| |df_n|))
                             (|mul_DF| (|add_DF| |df_k| 1.0)
                                       (|add_DF| |df_k|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)))))
                      (LETT |t|
                            (SPADCALL (SPADCALL |ccn| |t| (QREFELT % 37))
                                      |x2_inv| (QREFELT % 13)))
                      (LETT |tk|
                            (SPADCALL (DELT (QREFELT % 43) |k|) |t|
                                      (QREFELT % 37)))
                      (EXIT
                       (COND
                        ((|less_DF| (|DFSFUN2;cabs| |tk| %) |r_eps|)
                         (PROGN (LETT #1# 1) (GO #2=#:G116)))
                        ('T
                         (SEQ (LETT |s| (SPADCALL |s| |tk| (QREFELT % 16)))
                              (EXIT
                               (LETT |df_k|
                                     (|add_DF| |df_k|
                                               (FLOAT 2
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling_CDF|
        ((|xm| (|Complex| (|DoubleFloat|))) (|n| (|NonNegativeInteger|))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|s| (|Complex| (|DoubleFloat|)))
          (|t1| #1=(|Complex| (|DoubleFloat|))) (|t0| #1#)
          (|r_eps| (|DoubleFloat|)) (|t| #1#) (|df_n| (|DoubleFloat|))
          (|x2_inv| (|Complex| (|DoubleFloat|)))
          (|xm_inv| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |xm_inv| (SPADCALL (|spadConstant| % 11) |xm| (QREFELT % 12)))
          (LETT |x2_inv| (SPADCALL |xm_inv| |xm_inv| (QREFELT % 13)))
          (LETT |df_n| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
          (LETT |t0| (SPADCALL (|mk_DF| 5 -1) |xm_inv| (QREFELT % 37)))
          (LETT |t|
                (SPADCALL (|mul_DF| (|add_DF| |df_n| 1.0) (|mk_DF| 5 -1))
                          |x2_inv| (QREFELT % 37)))
          (LETT |r_eps| (|mul_DF| (|mk_DF| 1 -18) (|DFSFUN2;cabs| |t0| %)))
          (COND
           ((> |n| 0)
            (LETT |t0|
                  (SPADCALL |t0|
                            (SPADCALL (|div_DF| 1.0 |df_n|) (QREFELT % 46))
                            (QREFELT % 16)))))
          (LETT |t1| (SPADCALL (DELT (QREFELT % 43) 1) |t| (QREFELT % 37)))
          (LETT |s|
                (COND
                 ((|less_DF| (|DFSFUN2;cabs| |t1| %) |r_eps|)
                  (|spadConstant| % 22))
                 ('T
                  (SPADCALL |t1|
                            (|DFSFUN2;W_stirling1_CDF| |t| |x2_inv| |r_eps|
                             |df_n| %)
                            (QREFELT % 16)))))
          (EXIT (SPADCALL |t0| |s| (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;psi_W1_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (|n| (|NonNegativeInteger|))
         (|m| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|s| (|Complex| (|DoubleFloat|))) (|xm| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |xm|
                (SPADCALL |x|
                          (SPADCALL (FLOAT |m| MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT % 46))
                          (QREFELT % 16)))
          (LETT |s|
                (SPADCALL (SPADCALL |xm| (- |n|) (QREFELT % 47))
                          (|DFSFUN2;W_stirling_CDF| |xm| |n| %)
                          (QREFELT % 13)))
          (COND
           ((EQL |n| 0)
            (LETT |s|
                  (SPADCALL |s| (SPADCALL |xm| (QREFELT % 21))
                            (QREFELT % 20)))))
          (EXIT (|DFSFUN2;psi_W2_CDF| |x| |s| |n| |m| %))))) 

(SDEFUN |DFSFUN2;min_asymp| ((|n| (|NonNegativeInteger|)) (% (|DoubleFloat|)))
        (SPROG ((|xm| #1=(|DoubleFloat|)) (|slope| #1#))
               (SEQ
                (LETT |slope|
                      (|add_DF| (|mk_DF| 21 -2)
                                (|mul_DF| (QREFELT % 48)
                                          (|add_DF|
                                           (|mul_DF| (|mk_DF| 6038 -7)
                                                     (QREFELT % 48))
                                           (|mk_DF| 8677 -6)))))
                (EXIT
                 (LETT |xm|
                       (|add_DF|
                        (|add_DF| (|mk_DF| 350 -2)
                                  (|mul_DF| (QREFELT % 48) (|mk_DF| 40 -2)))
                        (SPADCALL |n| |slope| (QREFELT % 50)))))))) 

(SDEFUN |DFSFUN2;cot_diff|
        ((|x| (|DoubleFloat|)) (|n| (|NonNegativeInteger|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|res| #1=(|DoubleFloat|)) (|i| NIL) (|u| #2=(|DoubleFloat|))
          (|r0| (|DoubleFloat|)) (|t| #1#) (|t1| #2#) (#3=#:G141 NIL) (|k| NIL)
          (|j1| (|Integer|)) (|j| #4=(|NonNegativeInteger|)) (#5=#:G140 NIL)
          (|v| (|DoubleFloatVector|)) (|nn| #4#) (|cot_x| (|DoubleFloat|)))
         (SEQ (LETT |cot_x| (COT |x|))
              (EXIT
               (COND ((EQL |n| 0) |cot_x|)
                     (#6='T
                      (SEQ (LETT |nn| (QUOTIENT2 (+ |n| 1) 2))
                           (LETT |v| (MAKE_DOUBLE_VECTOR1 (+ |nn| 1) 0.0))
                           (DSETELT |v| 0 (DSETELT |v| 1 1.0))
                           (SEQ (LETT |i| 2) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |i| #5#) (GO G191)))
                                (SEQ (LETT |j| (QUOTIENT2 (+ |i| 1) 2))
                                     (LETT |t| 0.0)
                                     (LETT |j1| (COND ((ODDP |i|) 1) ('T 0)))
                                     (SEQ (LETT |k| |j|) (LETT #3# |j1|) G190
                                          (COND ((< |k| #3#) (GO G191)))
                                          (SEQ
                                           (LETT |t1|
                                                 (|mul_DF|
                                                  (FLOAT (- (* 2 |k|) |j1|)
                                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                                  (DELT |v| (- |k| |j1|))))
                                           (DSETELT |v| |k|
                                                    (|add_DF| |t| |t1|))
                                           (EXIT (LETT |t| |t1|)))
                                          (LETT |k| (+ |k| -1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (COND ((ODDP |i|) (DSETELT |v| 0 |t|)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |r0|
                                 (COND ((ODDP |n|) (|minus_DF| 1.0))
                                       (#6# |cot_x|)))
                           (LETT |u| (|mul_DF| |cot_x| |cot_x|))
                           (LETT |res| 0.0)
                           (SEQ (LETT |i| |nn|) G190
                                (COND ((< |i| 0) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (|add_DF| (|mul_DF| |u| |res|)
                                                  (DELT |v| |i|)))))
                                (LETT |i| (+ |i| -1)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (|mul_DF| |r0| |res|))))))))) 

(SDEFUN |DFSFUN2;polygamma;Nni2Df;30|
        ((|n| (|NonNegativeInteger|)) (|x| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|res1| (|DoubleFloat|)) (|m| (|Integer|)) (|x_min| (|DoubleFloat|))
          (|x1| (|DoubleFloat|)) (|x_int| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |x| 0.0 (QREFELT % 51))
            (SEQ (LETT |x_int| (SPADCALL |x| (QREFELT % 25)))
                 (LETT |x1| (|sub_DF| |x| |x_int|))
                 (EXIT
                  (COND ((|eql_DF| |x1| 0.0) (|error| "pole of polygamma"))
                        (#1='T
                         (SEQ
                          (LETT |res1|
                                (SPADCALL |n| (|sub_DF| 1.0 |x|)
                                          (QREFELT % 52)))
                          (COND ((ODDP |n|) (LETT |res1| (|minus_DF| |res1|))))
                          (EXIT
                           (|sub_DF| |res1|
                                     (|mul_DF|
                                      (|expt_DF_I| (QREFELT % 18) (+ |n| 1))
                                      (|DFSFUN2;cot_diff|
                                       (|mul_DF| (QREFELT % 18) |x1|) |n|
                                       %))))))))))
           (#1#
            (SEQ (LETT |x_min| (|DFSFUN2;min_asymp| |n| %))
                 (LETT |m|
                       (COND ((|less_DF| |x_min| |x|) 0)
                             (#1#
                              (SPADCALL
                               (SPADCALL (|sub_DF| |x_min| |x|) (QREFELT % 53))
                               (QREFELT % 27)))))
                 (LETT |res1|
                       (|mul_DF|
                        (SPADCALL
                         (|add_DF| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT) 1.0)
                         (QREFELT % 28))
                        (|DFSFUN2;psi_W1_DF| |x| |n| |m| %)))
                 (COND ((EVENP |n|) (LETT |res1| (|minus_DF| |res1|))))
                 (EXIT |res1|))))))) 

(SDEFUN |DFSFUN2;digamma;2Df;31| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPADCALL 0 |x| (QREFELT % 52))) 

(SDEFUN |DFSFUN2;polygamma;Nni2C;32|
        ((|n| (|NonNegativeInteger|)) (|x| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res1| (|Complex| (|DoubleFloat|))) (|m| (|Integer|))
          (|nrx| (|DoubleFloat|)) (|ax| (|DoubleFloat|))
          (|x_min| (|DoubleFloat|)) (|cot_d| #1=(|Complex| (|DoubleFloat|)))
          (|cv1| #1#) (|cv| (|Complex| (|DoubleFloat|)))
          (|x1| (|Complex| (|DoubleFloat|))) (|rx_int| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)) (|ix| (|DoubleFloat|)))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 32)))
              (EXIT
               (COND
                ((|eql_DF| |ix| 0.0)
                 (SPADCALL
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 33)) (QREFELT % 52))
                  0.0 (QREFELT % 15)))
                ((|less_DF| (LETT |rx| (SPADCALL |x| (QREFELT % 33)))
                            (|minus_DF| 1.0))
                 (COND
                  ((< 2 |n|)
                   (|error|
                    "polygamma not implemented for x with real(x) < -1"))
                  (#2='T
                   (SEQ (LETT |rx_int| (SPADCALL |rx| (QREFELT % 25)))
                        (LETT |x1|
                              (SPADCALL |x|
                                        (SPADCALL |rx_int| 0.0 (QREFELT % 15))
                                        (QREFELT % 20)))
                        (EXIT
                         (COND
                          ((SPADCALL |x1| (|spadConstant| % 22) (QREFELT % 35))
                           (|error| "pole of polygamma"))
                          (#2#
                           (SEQ
                            (LETT |res1|
                                  (SPADCALL |n|
                                            (SPADCALL (|spadConstant| % 11) |x|
                                                      (QREFELT % 20))
                                            (QREFELT % 55)))
                            (COND
                             ((ODDP |n|)
                              (LETT |res1| (SPADCALL |res1| (QREFELT % 39)))))
                            (LETT |cot_d|
                                  (SEQ
                                   (LETT |cv|
                                         (SPADCALL
                                          (SPADCALL (QREFELT % 18) |x1|
                                                    (QREFELT % 37))
                                          (QREFELT % 56)))
                                   (EXIT
                                    (COND
                                     ((EQL |n| 0)
                                      (SPADCALL (QREFELT % 18) |cv|
                                                (QREFELT % 37)))
                                     (#2#
                                      (SEQ
                                       (LETT |cv1|
                                             (SPADCALL (QREFELT % 18)
                                                       (SPADCALL
                                                        (|spadConstant| % 11)
                                                        (SPADCALL |cv| |cv|
                                                                  (QREFELT %
                                                                           13))
                                                        (QREFELT % 16))
                                                       (QREFELT % 37)))
                                       (EXIT
                                        (COND
                                         ((EQL |n| 1)
                                          (SPADCALL
                                           (SPADCALL (QREFELT % 18) |cv1|
                                                     (QREFELT % 37))
                                           (QREFELT % 39)))
                                         ((EQL |n| 2)
                                          (SPADCALL
                                           (SPADCALL
                                            (|mul_DF|
                                             (SPADCALL 2 (QREFELT % 18)
                                                       (QREFELT % 60))
                                             (QREFELT % 18))
                                            |cv| (QREFELT % 37))
                                           |cv1| (QREFELT % 13)))
                                         (#2#
                                          (|error| "unimplemented"))))))))))
                            (EXIT
                             (SPADCALL |res1| |cot_d| (QREFELT % 20)))))))))))
                (#2#
                 (SEQ (LETT |x_min| (|DFSFUN2;min_asymp| |n| %))
                      (LETT |m|
                            (SEQ (LETT |ax| (|DFSFUN2;cabs| |x| %))
                                 (EXIT
                                  (COND ((|less_DF| |x_min| |ax|) 0)
                                        (#2#
                                         (SEQ
                                          (LETT |nrx|
                                                (SPADCALL
                                                 (|sub_DF|
                                                  (|add_DF|
                                                   (|mul_DF| |x_min| |x_min|)
                                                   (|mk_DF| 5 -1))
                                                  (|mul_DF| |ix| |ix|))
                                                 (QREFELT % 45)))
                                          (EXIT
                                           (SPADCALL
                                            (SPADCALL (|sub_DF| |nrx| |rx|)
                                                      (QREFELT % 53))
                                            (QREFELT % 27)))))))))
                      (LETT |res1|
                            (SPADCALL
                             (SPADCALL
                              (|add_DF| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                        1.0)
                              (QREFELT % 28))
                             (|DFSFUN2;psi_W1_CDF| |x| |n| |m| %)
                             (QREFELT % 37)))
                      (COND
                       ((EVENP |n|)
                        (LETT |res1| (SPADCALL |res1| (QREFELT % 39)))))
                      (EXIT |res1|)))))))) 

(SDEFUN |DFSFUN2;digamma;2C;33|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL 0 |x| (QREFELT % 55))) 

(SDEFUN |DFSFUN2;erf;2Df;34| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 67))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;erfi;2Df;35| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 70))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;fresnelC;2Df;36| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 72))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;fresnelS;2Df;37| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 74))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;Ei;2Df;38| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 76))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;li;2Df;39| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 78))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;Ci;2Df;40| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 80))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;Si;2Df;41| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 82))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;Chi;2Df;42| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 84))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;Shi;2Df;43| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 63)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 64))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 65))
                                       (QREFELT % 86))
                             (QREFELT % 68))))
                      (SPADCALL |obits| (QREFELT % 64))))))) 

(SDEFUN |DFSFUN2;sum_c_DF|
        ((|uv| (|DoubleFloat|)) (|u2| (|DoubleFloat|)) (|l| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|res| #1=(|DoubleFloat|)) (|a_k1| #1#) (|a_k2| #2=(|DoubleFloat|))
          (|a_k3| #3=(|DoubleFloat|)) (|ak| #1#) (|k21| (|Integer|))
          (#4=#:G197 NIL) (|k| NIL) (|r1| #2#) (|r0| #3#))
         (SEQ (LETT |r0| (LETT |a_k3| 1.0))
              (LETT |r1|
                    (LETT |a_k2|
                          (|minus_DF|
                           (|div_DF| |uv|
                                     (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))))
              (LETT |res|
                    (LETT |a_k1|
                          (|div_DF|
                           (|mul_DF| (SPADCALL 9 |uv| (QREFELT % 60)) |uv|)
                           (FLOAT 128 MOST-POSITIVE-DOUBLE-FLOAT))))
              (SEQ (LETT |k| 3) (LETT #4# |l|) G190
                   (COND ((> |k| #4#) (GO G191)))
                   (SEQ (LETT |k21| (- (* 2 |k|) 1))
                        (LETT |ak|
                              (|div_DF|
                               (|mul_DF| |uv|
                                         (|add_DF|
                                          (|minus_DF|
                                           (|mul_DF_I| |a_k1| (* |k21| |k21|)))
                                          (|mul_DF|
                                           (|mul_DF_I| |u2|
                                                       (* |k21| (- |k21| 4)))
                                           |a_k3|)))
                               (FLOAT (* 8 |k|) MOST-POSITIVE-DOUBLE-FLOAT)))
                        (LETT |res| (|add_DF| |res| |ak|)) (LETT |a_k3| |a_k2|)
                        (LETT |a_k2| |a_k1|) (EXIT (LETT |a_k1| |ak|)))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (|add_DF| |r1| |res|)) (EXIT (|add_DF| |r0| |res|))))) 

(SDEFUN |DFSFUN2;sum_c_CDF|
        ((|uv| (|Complex| (|DoubleFloat|))) (|u2| (|Complex| (|DoubleFloat|)))
         (|l| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res| #1=(|Complex| (|DoubleFloat|))) (|a_k1| #1#)
          (|a_k2| #2=(|Complex| (|DoubleFloat|)))
          (|a_k3| #3=(|Complex| (|DoubleFloat|))) (|ak| #1#)
          (|k21| (|Integer|)) (#4=#:G203 NIL) (|k| NIL) (|r1| #2#) (|r0| #3#))
         (SEQ (LETT |r0| (LETT |a_k3| (|spadConstant| % 11)))
              (LETT |r1|
                    (LETT |a_k2|
                          (SPADCALL
                           (SPADCALL |uv| (SPADCALL 8 (QREFELT % 101))
                                     (QREFELT % 12))
                           (QREFELT % 39))))
              (LETT |res|
                    (LETT |a_k1|
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 |uv| (QREFELT % 102)) |uv|
                                     (QREFELT % 13))
                           (SPADCALL 128 (QREFELT % 101)) (QREFELT % 12))))
              (SEQ (LETT |k| 3) (LETT #4# |l|) G190
                   (COND ((> |k| #4#) (GO G191)))
                   (SEQ (LETT |k21| (- (* 2 |k|) 1))
                        (LETT |ak|
                              (SPADCALL
                               (SPADCALL |uv|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (* |k21| |k21|) |a_k1|
                                                     (QREFELT % 103))
                                           (QREFELT % 39))
                                          (SPADCALL
                                           (SPADCALL (* |k21| (- |k21| 4)) |u2|
                                                     (QREFELT % 103))
                                           |a_k3| (QREFELT % 13))
                                          (QREFELT % 16))
                                         (QREFELT % 13))
                               (SPADCALL (* 8 |k|) (QREFELT % 101))
                               (QREFELT % 12)))
                        (LETT |res| (SPADCALL |res| |ak| (QREFELT % 16)))
                        (LETT |a_k3| |a_k2|) (LETT |a_k2| |a_k1|)
                        (EXIT (LETT |a_k1| |ak|)))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |r1| |res| (QREFELT % 16)))
              (EXIT (SPADCALL |r0| |res| (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;bessKa_DF|
        ((|v| (|DoubleFloat|)) (|z| (|DoubleFloat|)) (|zs| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|sc| (|DoubleFloat|)) (|vzeta| (|DoubleFloat|))
          (|uv| #1=(|DoubleFloat|)) (|u| #1#) (|s| (|DoubleFloat|)) (|vz| #1#))
         (SEQ (LETT |vz| (|div_DF| |v| |z|))
              (LETT |s|
                    (SPADCALL (|add_DF| 1.0 (SPADCALL |vz| 2 (QREFELT % 104)))
                              (QREFELT % 45)))
              (LETT |u| (|div_DF| |vz| |s|))
              (LETT |uv| (|div_DF| 1.0 (|mul_DF| |z| |s|)))
              (LETT |vzeta|
                    (|add_DF| (|mul_DF| |z| |s|)
                              (|mul_DF| |v|
                                        (SPADCALL
                                         (|div_DF| 1.0 (|add_DF| |s| |vz|))
                                         (QREFELT % 23)))))
              (LETT |sc| (|DFSFUN2;sum_c_DF| |uv| (|mul_DF| |u| |u|) 30 %))
              (EXIT
               (|mul_DF|
                (|mul_DF|
                 (|mul_DF| (|div_DF| 1.0 |zs|)
                           (SPADCALL
                            (|mul_DF| (QREFELT % 18)
                                      (|div_DF| 1.0
                                                (|mul_DF|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |s|)))
                            (QREFELT % 45)))
                 (|exp_DF| (|minus_DF| |vzeta|)))
                |sc|))))) 

(SDEFUN |DFSFUN2;bessKa_CDF|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (|zs| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|sc| (|Complex| (|DoubleFloat|)))
          (|vzeta| (|Complex| (|DoubleFloat|)))
          (|uv| #1=(|Complex| (|DoubleFloat|))) (|u| #1#)
          (|s| (|Complex| (|DoubleFloat|))) (|vz| #1#))
         (SEQ (LETT |vz| (SPADCALL |v| |z| (QREFELT % 12)))
              (LETT |s|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 11)
                               (SPADCALL |vz| 2 (QREFELT % 105))
                               (QREFELT % 16))
                     (QREFELT % 106)))
              (LETT |u| (SPADCALL |vz| |s| (QREFELT % 12)))
              (LETT |uv|
                    (SPADCALL (|spadConstant| % 11)
                              (SPADCALL |z| |s| (QREFELT % 13))
                              (QREFELT % 12)))
              (LETT |vzeta|
                    (SPADCALL (SPADCALL |z| |s| (QREFELT % 13))
                              (SPADCALL |v|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 11)
                                                   (SPADCALL |s| |vz|
                                                             (QREFELT % 16))
                                                   (QREFELT % 12))
                                         (QREFELT % 21))
                                        (QREFELT % 13))
                              (QREFELT % 16)))
              (LETT |sc|
                    (|DFSFUN2;sum_c_CDF| |uv| (SPADCALL |u| |u| (QREFELT % 13))
                     30 %))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 11) |zs| (QREFELT % 12))
                           (SPADCALL
                            (SPADCALL (QREFELT % 18)
                                      (SPADCALL (|spadConstant| % 11)
                                                (SPADCALL
                                                 (SPADCALL 2 (QREFELT % 101))
                                                 |s| (QREFELT % 13))
                                                (QREFELT % 12))
                                      (QREFELT % 37))
                            (QREFELT % 106))
                           (QREFELT % 13))
                 (SPADCALL (SPADCALL |vzeta| (QREFELT % 39)) (QREFELT % 31))
                 (QREFELT % 13))
                |sc| (QREFELT % 13)))))) 

(SDEFUN |DFSFUN2;hyp_ser_DF|
        ((|a| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (|n| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|s| (|DoubleFloat|)) (|fac| (|DoubleFloat|)) (#1=#:G213 NIL)
          (|i| NIL))
         (SEQ (LETT |s| 0.0) (LETT |fac| 1.0)
              (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |fac|
                          (|div_DF| (|mul_DF| |fac| |x|)
                                    (|mul_DF|
                                     (FLOAT (+ |i| 1)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (|add_DF| |a|
                                               (FLOAT |i|
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))
                    (EXIT (LETT |s| (|add_DF| |s| |fac|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (|add_DF| |s| 1.0))))) 

(SDEFUN |DFSFUN2;hyp_ser_CDF|
        ((|a| (|Complex| (|DoubleFloat|))) (|x| (|Complex| (|DoubleFloat|)))
         (|n| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|s| (|Complex| (|DoubleFloat|))) (|fac| (|Complex| (|DoubleFloat|)))
          (#1=#:G219 NIL) (|i| NIL))
         (SEQ (LETT |s| (|spadConstant| % 22))
              (LETT |fac| (|spadConstant| % 11))
              (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |fac|
                          (SPADCALL (SPADCALL |fac| |x| (QREFELT % 13))
                                    (SPADCALL
                                     (FLOAT (+ |i| 1)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (SPADCALL |a|
                                               (SPADCALL |i| (QREFELT % 101))
                                               (QREFELT % 16))
                                     (QREFELT % 37))
                                    (QREFELT % 12)))
                    (EXIT (LETT |s| (SPADCALL |s| |fac| (QREFELT % 16)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (|spadConstant| % 11) (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;airyAia_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|rx| #1=(|DoubleFloat|)) (|abs_x| #1#)
          (|c13| (|Complex| (|DoubleFloat|)))
          (|x3s| (|Complex| (|DoubleFloat|)))
          (|x3| (|Complex| (|DoubleFloat|)))
          (|x2| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 106)))
              (LETT |x3|
                    (SPADCALL (QREFELT % 90) (SPADCALL |x| |x2| (QREFELT % 13))
                              (QREFELT % 37)))
              (LETT |x3s|
                    (SPADCALL |x2|
                              (SPADCALL
                               (SPADCALL (QREFELT % 90) |x2| (QREFELT % 37))
                               (QREFELT % 106))
                              (QREFELT % 13)))
              (LETT |c13| (SPADCALL (QREFELT % 89) 0.0 (QREFELT % 15)))
              (LETT |abs_x|
                    (SPADCALL (SPADCALL |x| (QREFELT % 107)) (QREFELT % 33)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 33)))
              (EXIT
               (COND
                ((|less_DF| (|mul_DF| (|minus_DF| (|mk_DF| 19 -1)) |rx|)
                            |abs_x|)
                 (SPADCALL (SPADCALL (QREFELT % 95) |x2| (QREFELT % 37))
                           (|DFSFUN2;bessKa_CDF| |c13| |x3| |x3s| %)
                           (QREFELT % 13)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT % 95) |x2| (QREFELT % 37))
                            (SPADCALL
                             (|DFSFUN2;bessKa_CDF| |c13| |x3|
                              (SPADCALL |x3s| (QREFELT % 39)) %)
                             (|DFSFUN2;bessKa_CDF| |c13|
                              (SPADCALL |x3| (QREFELT % 39))
                              (SPADCALL (SPADCALL |x3| (QREFELT % 39))
                                        (QREFELT % 106))
                              %)
                             (QREFELT % 20))
                            (QREFELT % 13))
                  (QREFELT % 39)))))))) 

(SDEFUN |DFSFUN2;airyAia_DF| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|x3s| (|DoubleFloat|)) (|x2| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((|less_DF| 0.0 |x|)
                  (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 45)))
                       (LETT |x3s|
                             (|mul_DF| |x2|
                                       (SPADCALL (|mul_DF| (QREFELT % 90) |x2|)
                                                 (QREFELT % 45))))
                       (EXIT
                        (|mul_DF| (QREFELT % 95)
                                  (|DFSFUN2;bessKa_DF| (QREFELT % 89)
                                   (|mul_DF| (|mul_DF| (QREFELT % 90) |x|)
                                             |x2|)
                                   |x3s| %)))))
                 ('T
                  (SPADCALL
                   (|DFSFUN2;airyAia_CDF| (SPADCALL |x| 0.0 (QREFELT % 15)) %)
                   (QREFELT % 33))))))) 

(SDEFUN |DFSFUN2;airyAipa_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|bv1| (|Complex| (|DoubleFloat|))) (|rx| #1=(|DoubleFloat|))
          (|abs_x| #1#) (|c23| (|Complex| (|DoubleFloat|)))
          (|x3s| (|Complex| (|DoubleFloat|)))
          (|x3| (|Complex| (|DoubleFloat|)))
          (|x2| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 106)))
              (LETT |x3|
                    (SPADCALL (QREFELT % 90) (SPADCALL |x| |x2| (QREFELT % 13))
                              (QREFELT % 37)))
              (LETT |x3s|
                    (SPADCALL |x2|
                              (SPADCALL
                               (SPADCALL (QREFELT % 90) |x2| (QREFELT % 37))
                               (QREFELT % 106))
                              (QREFELT % 13)))
              (LETT |c23| (SPADCALL (QREFELT % 90) 0.0 (QREFELT % 15)))
              (LETT |abs_x|
                    (SPADCALL (SPADCALL |x| (QREFELT % 107)) (QREFELT % 33)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 33)))
              (EXIT
               (COND
                ((|less_DF| (|mul_DF| (|minus_DF| (|mk_DF| 2 0)) |rx|) |abs_x|)
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT % 95) |x| (QREFELT % 37))
                            (|DFSFUN2;bessKa_CDF| |c23| |x3| |x3s| %)
                            (QREFELT % 13))
                  (QREFELT % 39)))
                ('T
                 (SEQ
                  (LETT |bv1|
                        (|DFSFUN2;bessKa_CDF| |c23| |x3|
                         (SPADCALL |x3s| (QREFELT % 39)) %))
                  (EXIT
                   (SPADCALL (SPADCALL (QREFELT % 95) |x| (QREFELT % 37))
                             (SPADCALL |bv1|
                                       (|DFSFUN2;bessKa_CDF| |c23|
                                        (SPADCALL |x3| (QREFELT % 39))
                                        (SPADCALL
                                         (SPADCALL |x3| (QREFELT % 39))
                                         (QREFELT % 106))
                                        %)
                                       (QREFELT % 16))
                             (QREFELT % 13)))))))))) 

(SDEFUN |DFSFUN2;airyAipa_DF| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|x3s| (|DoubleFloat|)) (|x2| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((|less_DF| 0.0 |x|)
                  (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 45)))
                       (LETT |x3s|
                             (|mul_DF| |x2|
                                       (SPADCALL (|mul_DF| (QREFELT % 90) |x2|)
                                                 (QREFELT % 45))))
                       (EXIT
                        (|minus_DF|
                         (|mul_DF| (|mul_DF| (QREFELT % 95) |x|)
                                   (|DFSFUN2;bessKa_DF| (QREFELT % 90)
                                    (|mul_DF| (|mul_DF| (QREFELT % 90) |x|)
                                              |x2|)
                                    |x3s| %))))))
                 ('T
                  (SPADCALL
                   (|DFSFUN2;airyAipa_CDF| (SPADCALL |x| 0.0 (QREFELT % 15)) %)
                   (QREFELT % 33))))))) 

(SDEFUN |DFSFUN2;airyAi;2Df;54| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|x2| (|DoubleFloat|)) (|xx| (|DoubleFloat|))
          (|abs_x| (|DoubleFloat|)))
         (SEQ (LETT |abs_x| (|abs_DF| |x|))
              (EXIT
               (COND
                ((|less_DF| |abs_x| 1.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 93)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 90) |xx| 14 %))
                    (|mul_DF| (|mul_DF| (QREFELT % 94) |x|)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 91) |xx| 14
                               %))))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAia_DF| |x| %))
                ((|less_DF| |x| 0.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 93)
                              (SPADCALL (QREFELT % 90) |xx| (QREFELT % 108)))
                    (|mul_DF| (|mul_DF| (QREFELT % 94) |x|)
                              (SPADCALL (QREFELT % 91) |xx|
                                        (QREFELT % 108)))))))
                ('T
                 (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 45)))
                      (EXIT
                       (|mul_DF| (|mul_DF| (QREFELT % 95) |x2|)
                                 (SPADCALL (QREFELT % 89)
                                           (|mul_DF|
                                            (|mul_DF| (QREFELT % 90) |x|) |x2|)
                                           (QREFELT % 109))))))))))) 

(SDEFUN |DFSFUN2;airyAi;2C;55|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xx| (|Complex| (|DoubleFloat|))) (|x3| (|Complex| (|DoubleFloat|)))
          (|x2| (|Complex| (|DoubleFloat|))) (|rx| #1=(|DoubleFloat|))
          (|abs_x| #1#))
         (SEQ
          (LETT |abs_x|
                (SPADCALL (SPADCALL |x| (QREFELT % 107)) (QREFELT % 33)))
          (EXIT
           (COND
            ((|less_DF| |abs_x| 1.0)
             (SEQ
              (LETT |xx|
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 88) |x| (QREFELT % 37)) |x|
                               (QREFELT % 13))
                     |x| (QREFELT % 13)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 93)
                          (|DFSFUN2;hyp_ser_CDF|
                           (SPADCALL (QREFELT % 90) 0.0 (QREFELT % 15)) |xx| 24
                           %)
                          (QREFELT % 37))
                (SPADCALL (SPADCALL (QREFELT % 94) |x| (QREFELT % 37))
                          (|DFSFUN2;hyp_ser_CDF|
                           (SPADCALL (QREFELT % 91) 0.0 (QREFELT % 15)) |xx| 24
                           %)
                          (QREFELT % 13))
                (QREFELT % 16)))))
            ((|less_DF| (|mk_DF| 12 0) |abs_x|) (|DFSFUN2;airyAia_CDF| |x| %))
            (#2='T
             (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 33)))
                  (EXIT
                   (COND
                    ((|less_DF|
                      (|mul_DF| (|minus_DF| (|mk_DF| 20000000001 -10)) |rx|)
                      |abs_x|)
                     (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 106)))
                          (LETT |x3|
                                (SPADCALL (QREFELT % 90)
                                          (SPADCALL |x| |x2| (QREFELT % 13))
                                          (QREFELT % 37)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (QREFELT % 95) |x2| (QREFELT % 37))
                            (SPADCALL
                             (SPADCALL (QREFELT % 89) 0.0 (QREFELT % 15)) |x3|
                             (QREFELT % 112))
                            (QREFELT % 13)))))
                    (#2#
                     (SEQ
                      (LETT |xx|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 88) 0.0 (QREFELT % 15)) |x|
                               (QREFELT % 13))
                              |x| (QREFELT % 13))
                             |x| (QREFELT % 13)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (QREFELT % 93)
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 90) 0.0 (QREFELT % 15))
                                   |xx| (QREFELT % 113))
                                  (QREFELT % 37))
                        (SPADCALL (SPADCALL (QREFELT % 94) |x| (QREFELT % 37))
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 91) 0.0 (QREFELT % 15))
                                   |xx| (QREFELT % 113))
                                  (QREFELT % 13))
                        (QREFELT % 16)))))))))))))) 

(SDEFUN |DFSFUN2;airyAiPrime;2Df;56|
        ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|x2| (|DoubleFloat|)) (|xx| (|DoubleFloat|))
          (|abs_x| (|DoubleFloat|)))
         (SEQ (LETT |abs_x| (|abs_DF| |x|))
              (EXIT
               (COND
                ((|less_DF| |abs_x| (|mk_DF| 1 0))
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 94)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 89) |xx| 24 %))
                    (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 96) |x|) |x|)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 92) |xx| 24
                               %))))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAipa_DF| |x| %))
                ((|less_DF| |x| 0.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 94)
                              (SPADCALL (QREFELT % 89) |xx| (QREFELT % 108)))
                    (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 96) |x|) |x|)
                              (SPADCALL (QREFELT % 92) |xx|
                                        (QREFELT % 108)))))))
                ('T
                 (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 45)))
                      (EXIT
                       (|minus_DF|
                        (|mul_DF| (|mul_DF| (QREFELT % 95) |x|)
                                  (SPADCALL (QREFELT % 90)
                                            (|mul_DF|
                                             (|mul_DF| (QREFELT % 90) |x|)
                                             |x2|)
                                            (QREFELT % 109)))))))))))) 

(SDEFUN |DFSFUN2;airyAiPrime;2C;57|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xx| (|Complex| (|DoubleFloat|))) (|x2| (|Complex| (|DoubleFloat|)))
          (|rx| #1=(|DoubleFloat|)) (|abs_x| #1#))
         (SEQ
          (LETT |abs_x|
                (SPADCALL (SPADCALL |x| (QREFELT % 107)) (QREFELT % 33)))
          (EXIT
           (COND
            ((|less_DF| |abs_x| 1.0)
             (SEQ
              (LETT |xx|
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 88) |x| (QREFELT % 37)) |x|
                               (QREFELT % 13))
                     |x| (QREFELT % 13)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 94)
                          (|DFSFUN2;hyp_ser_CDF|
                           (SPADCALL (QREFELT % 89) 0.0 (QREFELT % 15)) |xx| 14
                           %)
                          (QREFELT % 37))
                (SPADCALL
                 (SPADCALL (SPADCALL (QREFELT % 96) |x| (QREFELT % 37)) |x|
                           (QREFELT % 13))
                 (|DFSFUN2;hyp_ser_CDF|
                  (SPADCALL (QREFELT % 92) 0.0 (QREFELT % 15)) |xx| 14 %)
                 (QREFELT % 13))
                (QREFELT % 16)))))
            ((|less_DF| (|mk_DF| 12 0) |abs_x|) (|DFSFUN2;airyAipa_CDF| |x| %))
            (#2='T
             (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 33)))
                  (EXIT
                   (COND
                    ((|less_DF|
                      (|mul_DF| (|minus_DF| (|mk_DF| 20000000001 -10)) |rx|)
                      |abs_x|)
                     (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 106)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT % 95) |x| (QREFELT % 37))
                             (SPADCALL
                              (SPADCALL (QREFELT % 90) 0.0 (QREFELT % 15))
                              (SPADCALL
                               (SPADCALL (QREFELT % 90) |x| (QREFELT % 37))
                               |x2| (QREFELT % 13))
                              (QREFELT % 112))
                             (QREFELT % 13))
                            (QREFELT % 39)))))
                    (#2#
                     (SEQ
                      (LETT |xx|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QREFELT % 88) |x| (QREFELT % 37)) |x|
                              (QREFELT % 13))
                             |x| (QREFELT % 13)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (QREFELT % 94)
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 89) 0.0 (QREFELT % 15))
                                   |xx| (QREFELT % 113))
                                  (QREFELT % 37))
                        (SPADCALL
                         (SPADCALL (SPADCALL (QREFELT % 96) |x| (QREFELT % 37))
                                   |x| (QREFELT % 13))
                         (SPADCALL (SPADCALL (QREFELT % 92) 0.0 (QREFELT % 15))
                                   |xx| (QREFELT % 113))
                         (QREFELT % 13))
                        (QREFELT % 16)))))))))))))) 

(SDEFUN |DFSFUN2;airyBi;2Df;58| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|xx| (|DoubleFloat|)))
               (SEQ
                (LETT |xx|
                      (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                |x|))
                (EXIT
                 (|add_DF|
                  (|mul_DF| (QREFELT % 97)
                            (SPADCALL (QREFELT % 90) |xx| (QREFELT % 108)))
                  (|mul_DF| (|mul_DF| (QREFELT % 98) |x|)
                            (SPADCALL (QREFELT % 91) |xx| (QREFELT % 108)))))))) 

(SDEFUN |DFSFUN2;airyBi;2C;59|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|xx| (|Complex| (|DoubleFloat|))))
               (SEQ
                (LETT |xx|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 88) |x| (QREFELT % 37))
                                 |x| (QREFELT % 13))
                       |x| (QREFELT % 13)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT % 97)
                            (SPADCALL
                             (SPADCALL (QREFELT % 90) 0.0 (QREFELT % 15)) |xx|
                             (QREFELT % 113))
                            (QREFELT % 37))
                  (SPADCALL (SPADCALL (QREFELT % 98) |x| (QREFELT % 37))
                            (SPADCALL
                             (SPADCALL (QREFELT % 91) 0.0 (QREFELT % 15)) |xx|
                             (QREFELT % 113))
                            (QREFELT % 13))
                  (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;airyBiPrime;2Df;60|
        ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|xx| (|DoubleFloat|)))
               (SEQ
                (LETT |xx|
                      (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 88) |x|) |x|)
                                |x|))
                (EXIT
                 (|add_DF|
                  (|mul_DF| (QREFELT % 98)
                            (SPADCALL (QREFELT % 89) |xx| (QREFELT % 108)))
                  (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 99) |x|) |x|)
                            (SPADCALL (QREFELT % 92) |xx| (QREFELT % 108)))))))) 

(SDEFUN |DFSFUN2;airyBiPrime;2C;61|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|xx| (|Complex| (|DoubleFloat|))))
               (SEQ
                (LETT |xx|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 88) |x| (QREFELT % 37))
                                 |x| (QREFELT % 13))
                       |x| (QREFELT % 13)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT % 98)
                            (SPADCALL
                             (SPADCALL (QREFELT % 89) 0.0 (QREFELT % 15)) |xx|
                             (QREFELT % 113))
                            (QREFELT % 37))
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT % 99) |x| (QREFELT % 37)) |x|
                             (QREFELT % 13))
                   (SPADCALL (SPADCALL (QREFELT % 92) 0.0 (QREFELT % 15)) |xx|
                             (QREFELT % 113))
                   (QREFELT % 13))
                  (QREFELT % 16)))))) 

(SDEFUN |DFSFUN2;hypergeometric0F1;3Df;62|
        ((|a| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SEQ
         (COND
          ((|less_DF| 0.0 |a|)
           (COND
            ((|less_DF| (|abs_DF| |x|) 1.0)
             (EXIT (|DFSFUN2;hyp_ser_DF| |a| |x| 14 %))))))
         (EXIT
          (SPADCALL
           (SPADCALL (SPADCALL |a| (QREFELT % 46))
                     (SPADCALL |x| (QREFELT % 46)) (QREFELT % 113))
           (QREFELT % 33))))) 

(SDEFUN |DFSFUN2;hypergeometric0F1;3C;63|
        ((|a| (|Complex| (|DoubleFloat|))) (|x| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SEQ
         (COND
          ((|less_DF| 0.0 (SPADCALL |a| (QREFELT % 33)))
           (COND
            ((|less_DF|
              (SPADCALL (SPADCALL |x| (QREFELT % 107)) (QREFELT % 33)) 1.0)
             (EXIT (|DFSFUN2;hyp_ser_CDF| |a| |x| 14 %))))))
         (EXIT (|c_hyper0f1| |a| |x|)))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions2;|)) 

(DEFUN |DoubleFloatSpecialFunctions2| ()
  (SPROG NIL
         (PROG (#1=#:G272)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions2|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|DoubleFloatSpecialFunctions2|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatSpecialFunctions2;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatSpecialFunctions2|)))))))))) 

(DEFUN |DoubleFloatSpecialFunctions2;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions2|))
          (LETT % (GETREFV 121))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions2| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    (SPADCALL
                     (LIST (|mk_DF| 83333333333333333333333 -24)
                           (|minus_DF| (|mk_DF| 27777777777777777777777 -25))
                           (|mk_DF| 7936507936507936507936507 -28)
                           (|minus_DF| (|mk_DF| 595238095238095238095238 -27))
                           (|mk_DF| 8417508417508417508417508 -28)
                           (|minus_DF| (|mk_DF| 1917526917526917526917526 -27))
                           (|mk_DF| 6410256410256410256410256 -27)
                           (|minus_DF| (|mk_DF| 2955065359477124183006535 -26))
                           (|mk_DF| 17964437236883057316493849 -26)
                           (|minus_DF| (|mk_DF| 139243221690590111642743 -23))
                           (|mk_DF| 13402864044168391994478951 -24))
                     (QREFELT % 8)))
          (QSETREFV % 17 (|mk_DF| 91893853320467274178032 -23))
          (QSETREFV % 18 (|mk_DF| 3141592653589793238462643 -24))
          (QSETREFV % 19 (|mk_DF| 1144729885849400174143427 -24))
          (QSETREFV % 24
                    (SPADCALL
                     (LIST (|minus_DF| (|mk_DF| 513516668382050295584635 -24))
                           (|mk_DF| 164698105781132405800989 -24)
                           (|mk_DF| 525510685739767347142894 -25)
                           (|minus_DF| (|mk_DF| 41615681051208622776535 -24))
                           (|mk_DF| 63368333050826317583644 -25)
                           (|mk_DF| 2157953269307912866601 -24)
                           (|minus_DF| (|mk_DF| 11042580869659820728076 -25))
                           (|mk_DF| 148887306939898122356486 -27)
                           (|mk_DF| 2588867051563457724778606 -29)
                           (|minus_DF| (|mk_DF| 138812553103149992363164 -28))
                           (|mk_DF| 2133862367281647878133 -27)
                           (|mk_DF| 6220163039502714260036 -29)
                           (|minus_DF| (|mk_DF| 8936369293009830129057 -29))
                           (|mk_DF| 1703595941800167023239 -29)
                           (|minus_DF| (|mk_DF| 91272698794856299939 -29))
                           (|minus_DF| (|mk_DF| 27003999165481406771 -29))
                           (|mk_DF| 745666263025086298299 -31)
                           (|minus_DF| (|mk_DF| 79703252793912482429 -31))
                           (|minus_DF| (|mk_DF| 90784122618522708038 -33))
                           (|mk_DF| 16992712809388051214 -32))
                     (QREFELT % 8)))
          (QSETREFV % 43
                    (SPADCALL
                     (LIST 0.0 (|mk_DF| 16666666666666666667 -20)
                           (|minus_DF| (|mk_DF| 33333333333333333333 -21))
                           (|mk_DF| 23809523809523809524 -21)
                           (|minus_DF| (|mk_DF| 33333333333333333333 -21))
                           (|mk_DF| 75757575757575757576 -21)
                           (|minus_DF| (|mk_DF| 25311355311355311355 -20))
                           (|mk_DF| 11666666666666666667 -19)
                           (|minus_DF| (|mk_DF| 70921568627450980392 -19))
                           (|mk_DF| 54971177944862155389 -18)
                           (|minus_DF| (|mk_DF| 52912424242424242424 -17))
                           (|mk_DF| 61921231884057971014 -16)
                           (|minus_DF| (|mk_DF| 86580253113553113553 -15))
                           (|mk_DF| 14255171666666666667 -13)
                           (|minus_DF| (|mk_DF| 27298231067816091954 -12))
                           (|mk_DF| 60158087390064236839 -11)
                           (|minus_DF| (|mk_DF| 15116315767092156863 -9))
                           (|mk_DF| 42961464306116666667 -8)
                           (|minus_DF| (|mk_DF| 13711655205088332772 -6))
                           (|mk_DF| 48833231897359316667 -5)
                           (|minus_DF| (|mk_DF| 19296579341940068149 -3))
                           (|mk_DF| 841693047573682615 0))
                     (QREFELT % 8)))
          (QSETREFV % 48 (FLOAT 15 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV % 88 (|div_DF| 1.0 (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 89 (|div_DF| 1.0 (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 90
                    (|div_DF| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 91
                    (|div_DF| (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 92
                    (|div_DF| (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 93 (|mk_DF| 35502805388781723926 -20))
          (QSETREFV % 94 (|minus_DF| (|mk_DF| 25881940379280679840 -20)))
          (QSETREFV % 95 (|mk_DF| 18377629847393068317 -20))
          (QSETREFV % 96 (|mk_DF| 17751402694390861963 -20))
          (QSETREFV % 97 (|mk_DF| 61492662744600073515 -20))
          (QSETREFV % 98 (|mk_DF| 4482883573538263579148 -22))
          (QSETREFV % 99 (|mk_DF| 3074633137230003675754 -22))
          (QSETREFV % 100 (|mk_DF| 5773502691896257645091 -22))
          %))) 

(MAKEPROP '|DoubleFloatSpecialFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 14) (|DoubleFloatVector|)
              (0 . |construct|) '|bernoulli_coeffs| (|Complex| 14) (5 . |One|)
              (9 . /) (15 . *) (|DoubleFloat|) (21 . |complex|) (27 . +) '|c1|
              '|c_pi| '|c_lpi| (33 . -) (39 . |log|) (44 . |Zero|) (48 . |log|)
              '|gamma_coefs| (53 . |round|) (|Integer|) (58 . |retract|)
              |DFSFUN2;Gamma;2Df;9| |DFSFUN2;Beta;3Df;10|
              |DFSFUN2;logGamma;2Df;11| (63 . |exp|) (68 . |imag|)
              (73 . |real|) (|Boolean|) (78 . =) |DFSFUN2;Gamma;2C;14| (84 . *)
              (90 . |sin|) (95 . -) |DFSFUN2;logGamma;2C;17|
              (100 . |conjugate|) |DFSFUN2;Beta;3C;18| '|ber_coeff|
              (105 . |norm|) (110 . |sqrt|) (115 . |coerce|) (120 . ^)
              '|df_dig| (|NonNegativeInteger|) (126 . *) (132 . <=)
              |DFSFUN2;polygamma;Nni2Df;30| (138 . |ceiling|)
              |DFSFUN2;digamma;2Df;31| |DFSFUN2;polygamma;Nni2C;32|
              (143 . |cot|) (|Fraction| 26) (148 . |One|) (|PositiveInteger|)
              (152 . *) |DFSFUN2;digamma;2C;33| (|Float|) (158 . |bits|)
              (162 . |bits|) (167 . |convert|) (|FloatLiouvilianFunctions|)
              (172 . |erf|) (177 . |convert|) |DFSFUN2;erf;2Df;34|
              (182 . |erfi|) |DFSFUN2;erfi;2Df;35| (187 . |fresnelC|)
              |DFSFUN2;fresnelC;2Df;36| (192 . |fresnelS|)
              |DFSFUN2;fresnelS;2Df;37| (197 . |Ei|) |DFSFUN2;Ei;2Df;38|
              (202 . |li|) |DFSFUN2;li;2Df;39| (207 . |Ci|) |DFSFUN2;Ci;2Df;40|
              (212 . |Si|) |DFSFUN2;Si;2Df;41| (217 . |Chi|)
              |DFSFUN2;Chi;2Df;42| (222 . |Shi|) |DFSFUN2;Shi;2Df;43|
              '|one_over_nine| '|one_over_three| '|two_over_three|
              '|four_over_three| '|five_over_three| '|ai_c1| '|ai_c2| '|ai_c3|
              '|aip_c2| '|bi_c1| '|bi_c2| '|bip_c2| '|s3_inv| (227 . |coerce|)
              (232 . *) (238 . *) (244 . ^) (250 . ^) (256 . |sqrt|)
              (261 . |abs|) |DFSFUN2;hypergeometric0F1;3Df;62|
              (266 . |besselK|) |DFSFUN2;airyAi;2Df;54|
              (|DoubleFloatSpecialFunctions|) (272 . |besselK|)
              |DFSFUN2;hypergeometric0F1;3C;63| |DFSFUN2;airyAi;2C;55|
              |DFSFUN2;airyAiPrime;2Df;56| |DFSFUN2;airyAiPrime;2C;57|
              |DFSFUN2;airyBi;2Df;58| |DFSFUN2;airyBi;2C;59|
              |DFSFUN2;airyBiPrime;2Df;60| |DFSFUN2;airyBiPrime;2C;61|)
           '#(|polygamma| 278 |logGamma| 290 |li| 300 |hypergeometric0F1| 305
              |fresnelS| 317 |fresnelC| 322 |erfi| 327 |erf| 332 |digamma| 337
              |airyBiPrime| 347 |airyBi| 357 |airyAiPrime| 367 |airyAi| 377
              |Si| 387 |Shi| 392 |Gamma| 397 |Ei| 407 |Ci| 412 |Chi| 417 |Beta|
              422)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|Beta|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|Beta|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Gamma| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Gamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|digamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|digamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|logGamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|logGamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|polygamma|
                                 ((|DoubleFloat|) (|NonNegativeInteger|)
                                  (|DoubleFloat|)))
                                T)
                              '((|polygamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|NonNegativeInteger|)
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|erf| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|erfi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|fresnelC| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|fresnelS| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|Ei| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|li| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Ci| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Si| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Chi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Shi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyAi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyAi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyAiPrime|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|airyAiPrime|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyBi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyBi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyBiPrime|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|airyBiPrime|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|hypergeometric0F1|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|hypergeometric0F1|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 120
                                            '(1 7 0 6 8 0 10 0 11 2 10 0 0 0 12
                                              2 10 0 0 0 13 2 10 0 14 14 15 2
                                              10 0 0 0 16 2 10 0 0 0 20 1 10 0
                                              0 21 0 10 0 22 1 14 0 0 23 1 14 0
                                              0 25 1 14 26 0 27 1 10 0 0 31 1
                                              10 14 0 32 1 10 14 0 33 2 10 34 0
                                              0 35 2 10 0 14 0 37 1 10 0 0 38 1
                                              10 0 0 39 1 10 0 0 41 1 10 14 0
                                              44 1 14 0 0 45 1 10 0 14 46 2 10
                                              0 0 26 47 2 14 0 49 0 50 2 14 34
                                              0 0 51 1 14 0 0 53 1 10 0 0 56 0
                                              57 0 58 2 14 0 59 0 60 0 62 59 63
                                              1 62 59 59 64 1 14 62 0 65 1 66
                                              62 62 67 1 62 14 0 68 1 66 62 62
                                              70 1 66 62 62 72 1 66 62 62 74 1
                                              66 62 62 76 1 66 62 62 78 1 66 62
                                              62 80 1 66 62 62 82 1 66 62 62 84
                                              1 66 62 62 86 1 10 0 26 101 2 10
                                              0 59 0 102 2 10 0 26 0 103 2 14 0
                                              0 59 104 2 10 0 0 59 105 1 10 0 0
                                              106 1 10 0 0 107 2 14 0 0 0 109 2
                                              111 10 10 10 112 2 0 10 49 10 55
                                              2 0 14 49 14 52 1 0 10 10 40 1 0
                                              14 14 30 1 0 14 14 79 2 0 14 14
                                              14 108 2 0 10 10 10 113 1 0 14 14
                                              75 1 0 14 14 73 1 0 14 14 71 1 0
                                              14 14 69 1 0 10 10 61 1 0 14 14
                                              54 1 0 14 14 119 1 0 10 10 120 1
                                              0 14 14 117 1 0 10 10 118 1 0 14
                                              14 115 1 0 10 10 116 1 0 14 14
                                              110 1 0 10 10 114 1 0 14 14 83 1
                                              0 14 14 87 1 0 10 10 36 1 0 14 14
                                              28 1 0 14 14 77 1 0 14 14 81 1 0
                                              14 14 85 2 0 10 10 10 42 2 0 14
                                              14 14 29)))))
           '|lookupComplete|)) 
