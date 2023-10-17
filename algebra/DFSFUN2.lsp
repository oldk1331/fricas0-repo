
(SDEFUN |DFSFUN2;bernoulli_gamma_series_CDF|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|s| (|Complex| (|DoubleFloat|))) (|k| NIL)
          (|z2inv| (|Complex| (|DoubleFloat|)))
          (|zk| #1=(|Complex| (|DoubleFloat|))) (|zinv| #1#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| $ 11) |z| (QREFELT $ 12)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT $ 13)))
              (LETT |s| (SPADCALL (DELT (QREFELT $ 9) 10) 0.0 (QREFELT $ 15)))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |z2inv| |s| (QREFELT $ 13))
                                     (SPADCALL (DELT (QREFELT $ 9) |k|) 0.0
                                               (QREFELT $ 15))
                                     (QREFELT $ 16)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |zinv| |s| (QREFELT $ 13)))))) 

(SDEFUN |DFSFUN2;bernoulli_gamma_series_DF|
        ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|s| (|DoubleFloat|)) (|k| NIL) (|z2inv| (|DoubleFloat|))
          (|zk| #1=(|DoubleFloat|)) (|zinv| #1#))
         (SEQ (LETT |zinv| (|div_DF| 1.0 |z|)) (LETT |zk| |zinv|)
              (LETT |z2inv| (|mul_DF| |zinv| |zinv|))
              (LETT |s| (DELT (QREFELT $ 9) 10))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (|add_DF| (|mul_DF| |z2inv| |s|)
                                     (DELT (QREFELT $ 9) |k|)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (|mul_DF| |zinv| |s|))))) 

(SDEFUN |DFSFUN2;logGamma_a1_CDF|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z| (SPADCALL (|mk_DF| 5 -1) 0.0 (QREFELT $ 15))
                     (QREFELT $ 20))
           (SPADCALL |z| (QREFELT $ 21)) (QREFELT $ 13))
          |z| (QREFELT $ 20))
         (SPADCALL (QREFELT $ 17) 0.0 (QREFELT $ 15)) (QREFELT $ 16))) 

(SDEFUN |DFSFUN2;logGamma_a1_DF| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (|add_DF|
         (|sub_DF|
          (|mul_DF| (|sub_DF| |z| (|mk_DF| 5 -1))
                    (SPADCALL |z| (QREFELT $ 23)))
          |z|)
         (QREFELT $ 17))) 

(SDEFUN |DFSFUN2;logGamma1_CDF|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPADCALL (|DFSFUN2;logGamma_a1_CDF| |z| $)
                  (|DFSFUN2;bernoulli_gamma_series_CDF| |z| $) (QREFELT $ 16))) 

(SDEFUN |DFSFUN2;logGamma1_DF| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (|add_DF| (|DFSFUN2;logGamma_a1_DF| |z| $)
                  (|DFSFUN2;bernoulli_gamma_series_DF| |z| $))) 

(SDEFUN |DFSFUN2;Gamma_taylor| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
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
                                                (DELT (QREFELT $ 24)
                                                      (+ |i| 1))))
                            (DELT (QREFELT $ 24) |i|)))))
                   (LETT |i| (+ |i| -2)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|div_DF| 1.0
                         (|add_DF| 1.0
                                   (|mul_DF| (|mul_DF| |s| (|sub_DF| |z| 1.0))
                                             (|sub_DF| |z|
                                                       (FLOAT 2
                                                              MOST-POSITIVE-DOUBLE-FLOAT))))))))) 

(SDEFUN |DFSFUN2;Gamma1a_DF| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (|exp_DF| (|DFSFUN2;logGamma1_DF| |z| $))) 

(SDEFUN |DFSFUN2;Gamma;2Df;9| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|p| (|DoubleFloat|)) (|sign| (|DoubleFloat|)) (|z1| (|DoubleFloat|))
          (|z_int| (|DoubleFloat|)))
         (SEQ
          (COND
           ((|less_DF| |z| 0.0)
            (SEQ (LETT |z_int| (SPADCALL |z| (QREFELT $ 25)))
                 (LETT |z1| (|sub_DF| |z| |z_int|))
                 (EXIT
                  (COND ((|eql_DF| |z1| 0.0) (|error| "Pole of Gamma"))
                        (#1='T
                         (SEQ
                          (LETT |sign|
                                (COND
                                 ((ODDP (SPADCALL |z_int| (QREFELT $ 27)))
                                  (|minus_DF| 1.0))
                                 (#1# 1.0)))
                          (EXIT
                           (|div_DF| (|mul_DF| |sign| (QREFELT $ 18))
                                     (|mul_DF|
                                      (SPADCALL (|sub_DF| 1.0 |z|)
                                                (QREFELT $ 28))
                                      (|sin_DF|
                                       (|mul_DF| (QREFELT $ 18) |z1|)))))))))))
           ((|less_DF| |z| 1.0)
            (|div_DF| (|DFSFUN2;Gamma_taylor| (|add_DF| |z| 1.0) $) |z|))
           (#1#
            (COND ((|less_DF| (|mk_DF| 9 0) |z|) (|DFSFUN2;Gamma1a_DF| |z| $))
                  ((|less_DF| (|mk_DF| 2 0) |z|)
                   (SEQ (LETT |p| 1.0)
                        (SEQ G190
                             (COND
                              ((NULL (|less_DF| (|mk_DF| 2 0) |z|)) (GO G191)))
                             (SEQ (LETT |z| (|sub_DF| |z| 1.0))
                                  (EXIT (LETT |p| (|mul_DF| |p| |z|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (|mul_DF| |p| (|DFSFUN2;Gamma_taylor| |z| $)))))
                  (#1# (|DFSFUN2;Gamma_taylor| |z| $)))))))) 

(SDEFUN |DFSFUN2;Beta;3Df;10|
        ((|a| |DoubleFloat|) (|b| |DoubleFloat|) ($ |DoubleFloat|))
        (|div_DF|
         (|mul_DF| (SPADCALL |a| (QREFELT $ 28)) (SPADCALL |b| (QREFELT $ 28)))
         (SPADCALL (|add_DF| |a| |b|) (QREFELT $ 28)))) 

(SDEFUN |DFSFUN2;logGamma;2Df;11| ((|z| |DoubleFloat|) ($ |DoubleFloat|))
        (COND
         ((|less_DF| 0.0 |z|)
          (COND ((|less_DF| (|mk_DF| 8 0) |z|) (|DFSFUN2;logGamma1_DF| |z| $))
                (#1='T
                 (SPADCALL (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 23)))))
         (#1# (|error| "logGamma: nonpositive z")))) 

(SDEFUN |DFSFUN2;Gamma1a_CDF|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPADCALL (|DFSFUN2;logGamma1_CDF| |z| $) (QREFELT $ 31))) 

(SDEFUN |DFSFUN2;Gamma1b|
        ((|z| . #1=(|Complex| (|DoubleFloat|))) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|zp| #1#) (|i| NIL) (|zr| (|DoubleFloat|)) (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT $ 32)))
              (LETT |zr| (SPADCALL |z| (QREFELT $ 33))) (LETT |zp| |z|)
              (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 7) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |zp|
                           (SPADCALL |zp|
                                     (SPADCALL |z|
                                               (SPADCALL
                                                (FLOAT |i|
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                0.0 (QREFELT $ 15))
                                               (QREFELT $ 16))
                                     (QREFELT $ 13)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (|DFSFUN2;Gamma1a_CDF|
                 (SPADCALL |z|
                           (SPADCALL (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) 0.0
                                     (QREFELT $ 15))
                           (QREFELT $ 16))
                 $)
                |zp| (QREFELT $ 12)))))) 

(SDEFUN |DFSFUN2;Gamma;2C;14|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|sign| (|DoubleFloat|)) (|z1| (|Complex| (|DoubleFloat|)))
          (|z_int| (|DoubleFloat|)) (|zr| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT $ 32)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;Gamma1a_CDF| |z| $))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT $ 33)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;Gamma1a_CDF| |z| $))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ (LETT |z_int| (SPADCALL |zr| (QREFELT $ 25)))
                              (LETT |z1|
                                    (SPADCALL |z|
                                              (SPADCALL |z_int| 0.0
                                                        (QREFELT $ 15))
                                              (QREFELT $ 20)))
                              (EXIT
                               (COND
                                ((SPADCALL |z1| (|spadConstant| $ 22)
                                           (QREFELT $ 35))
                                 (|error| "Pole of Gamma"))
                                (#1#
                                 (SEQ
                                  (LETT |sign|
                                        (COND
                                         ((ODDP
                                           (SPADCALL |z_int| (QREFELT $ 27)))
                                          (|minus_DF| 1.0))
                                         (#1# 1.0)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (|mul_DF| |sign| (QREFELT $ 18))
                                              0.0 (QREFELT $ 15))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 11) |z|
                                                (QREFELT $ 20))
                                      (QREFELT $ 36))
                                     (SPADCALL
                                      (SPADCALL (QREFELT $ 18) |z1|
                                                (QREFELT $ 37))
                                      (QREFELT $ 38))
                                     (QREFELT $ 13))
                                    (QREFELT $ 12)))))))))
                        (#1# (|DFSFUN2;Gamma1b| |z| $))))))))))) 

(SDEFUN |DFSFUN2;logGamma1b|
        ((|z| . #1=(|Complex| (|DoubleFloat|))) ($ |Complex| (|DoubleFloat|)))
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
                                                      0.0 (QREFELT $ 15))
                                                     (QREFELT $ 16))
                                           (QREFELT $ 13)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |lp1| (SPADCALL |p1| (QREFELT $ 21)))
                    (COND
                     ((|less_DF| (SPADCALL |lp1| (QREFELT $ 32)) 0.0)
                      (LETT |lp1|
                            (SPADCALL |lp1|
                                      (SPADCALL 0.0
                                                (|mul_DF| (|mk_DF| 2 0)
                                                          (QREFELT $ 18))
                                                (QREFELT $ 15))
                                      (QREFELT $ 16)))))
                    (EXIT
                     (SPADCALL
                      (|DFSFUN2;logGamma1_CDF|
                       (SPADCALL |z|
                                 (SPADCALL (|mk_DF| 8 0) 0.0 (QREFELT $ 15))
                                 (QREFELT $ 16))
                       $)
                      |lp1| (QREFELT $ 20)))))) 

(SDEFUN |DFSFUN2;log_sin|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|res2| (|Complex| (|DoubleFloat|))) (|zr| (|DoubleFloat|))
          (|res1| (|Complex| (|DoubleFloat|))) (|n| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zr| (SPADCALL |z| (QREFELT $ 33)))
              (LETT |zi| (SPADCALL |z| (QREFELT $ 32)))
              (LETT |n| (SPADCALL |zr| (QREFELT $ 25)))
              (LETT |res1|
                    (COND
                     ((|less_DF| |zi| 0.0)
                      (SPADCALL 0.0 (|mul_DF| |n| (QREFELT $ 18))
                                (QREFELT $ 15)))
                     (#1='T
                      (SPADCALL 0.0 (|minus_DF| (|mul_DF| |n| (QREFELT $ 18)))
                                (QREFELT $ 15)))))
              (LETT |zr| (|sub_DF| |zr| |n|))
              (LETT |z|
                    (SPADCALL (|mul_DF| (QREFELT $ 18) |zr|)
                              (|mul_DF| (QREFELT $ 18) |zi|) (QREFELT $ 15)))
              (LETT |res2|
                    (COND
                     ((|less_DF| |zr| 0.0)
                      (COND
                       ((|less_DF| |zi| 0.0)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT $ 39))
                                    (QREFELT $ 38))
                          (QREFELT $ 21))
                         (SPADCALL 0.0 (QREFELT $ 18) (QREFELT $ 15))
                         (QREFELT $ 20)))
                       (#1#
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT $ 39))
                                    (QREFELT $ 38))
                          (QREFELT $ 21))
                         (SPADCALL 0.0 (QREFELT $ 18) (QREFELT $ 15))
                         (QREFELT $ 16)))))
                     (#1#
                      (SPADCALL (SPADCALL |z| (QREFELT $ 38))
                                (QREFELT $ 21)))))
              (EXIT (SPADCALL |res1| |res2| (QREFELT $ 16)))))) 

(SDEFUN |DFSFUN2;logGamma;2C;17|
        ((|z| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|res1| (|Complex| (|DoubleFloat|))) (|zr| (|DoubleFloat|))
          (|zi| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT $ 32)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;logGamma1_CDF| |z| $))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT $ 33)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;logGamma1_CDF| |z| $))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ
                          (LETT |res1|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1.0 0.0 (QREFELT $ 15))
                                           |z| (QREFELT $ 20))
                                 (QREFELT $ 40)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 19) 0.0 (QREFELT $ 15))
                             (|DFSFUN2;log_sin| |z| $) (QREFELT $ 20))
                            |res1| (QREFELT $ 20)))))
                        ((|less_DF| |zi| 0.0)
                         (SPADCALL
                          (|DFSFUN2;logGamma1b| (SPADCALL |z| (QREFELT $ 41))
                           $)
                          (QREFELT $ 41)))
                        (#1# (|DFSFUN2;logGamma1b| |z| $))))))))))) 

(SDEFUN |DFSFUN2;Beta;3C;18|
        ((|x| |Complex| (|DoubleFloat|)) (|y| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (SPADCALL |y| (QREFELT $ 36))
                   (QREFELT $ 13))
         (SPADCALL (SPADCALL |x| |y| (QREFELT $ 16)) (QREFELT $ 36))
         (QREFELT $ 12))) 

(SDEFUN |DFSFUN2;erf;2Df;19| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 49))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;erfi;2Df;20| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 52))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;fresnelC;2Df;21| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 54))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;fresnelS;2Df;22| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 56))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;Ei;2Df;23| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 58))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;li;2Df;24| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 60))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;Ci;2Df;25| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 62))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;Si;2Df;26| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 64))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;Chi;2Df;27| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 66))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(SDEFUN |DFSFUN2;Shi;2Df;28| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 45)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 46))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                       (QREFELT $ 68))
                             (QREFELT $ 50))))
                      (SPADCALL |obits| (QREFELT $ 46))))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions2;|)) 

(DEFUN |DoubleFloatSpecialFunctions2| ()
  (SPROG NIL
         (PROG (#1=#:G193)
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
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions2|))
          (LETT $ (GETREFV 70))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions2| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
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
                     (QREFELT $ 8)))
          (QSETREFV $ 17 (|mk_DF| 91893853320467274178032 -23))
          (QSETREFV $ 18 (|mk_DF| 3141592653589793238462643 -24))
          (QSETREFV $ 19 (|mk_DF| 1144729885849400174143427 -24))
          (QSETREFV $ 24
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
                     (QREFELT $ 8)))
          $))) 

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
              (100 . |conjugate|) |DFSFUN2;Beta;3C;18| (|PositiveInteger|)
              (|Float|) (105 . |bits|) (109 . |bits|) (114 . |convert|)
              (|FloatLiouvilianFunctions|) (119 . |erf|) (124 . |convert|)
              |DFSFUN2;erf;2Df;19| (129 . |erfi|) |DFSFUN2;erfi;2Df;20|
              (134 . |fresnelC|) |DFSFUN2;fresnelC;2Df;21| (139 . |fresnelS|)
              |DFSFUN2;fresnelS;2Df;22| (144 . |Ei|) |DFSFUN2;Ei;2Df;23|
              (149 . |li|) |DFSFUN2;li;2Df;24| (154 . |Ci|) |DFSFUN2;Ci;2Df;25|
              (159 . |Si|) |DFSFUN2;Si;2Df;26| (164 . |Chi|)
              |DFSFUN2;Chi;2Df;27| (169 . |Shi|) |DFSFUN2;Shi;2Df;28|)
           '#(|logGamma| 174 |li| 184 |fresnelS| 189 |fresnelC| 194 |erfi| 199
              |erf| 204 |Si| 209 |Shi| 214 |Gamma| 219 |Ei| 229 |Ci| 234 |Chi|
              239 |Beta| 244)
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
                              '((|logGamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|logGamma|
                                 ((|Complex| (|DoubleFloat|))
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
                              '((|Shi| ((|DoubleFloat|) (|DoubleFloat|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 69
                                            '(1 7 0 6 8 0 10 0 11 2 10 0 0 0 12
                                              2 10 0 0 0 13 2 10 0 14 14 15 2
                                              10 0 0 0 16 2 10 0 0 0 20 1 10 0
                                              0 21 0 10 0 22 1 14 0 0 23 1 14 0
                                              0 25 1 14 26 0 27 1 10 0 0 31 1
                                              10 14 0 32 1 10 14 0 33 2 10 34 0
                                              0 35 2 10 0 14 0 37 1 10 0 0 38 1
                                              10 0 0 39 1 10 0 0 41 0 44 43 45
                                              1 44 43 43 46 1 14 44 0 47 1 48
                                              44 44 49 1 44 14 0 50 1 48 44 44
                                              52 1 48 44 44 54 1 48 44 44 56 1
                                              48 44 44 58 1 48 44 44 60 1 48 44
                                              44 62 1 48 44 44 64 1 48 44 44 66
                                              1 48 44 44 68 1 0 10 10 40 1 0 14
                                              14 30 1 0 14 14 61 1 0 14 14 57 1
                                              0 14 14 55 1 0 14 14 53 1 0 14 14
                                              51 1 0 14 14 65 1 0 14 14 69 1 0
                                              10 10 36 1 0 14 14 28 1 0 14 14
                                              59 1 0 14 14 63 1 0 14 14 67 2 0
                                              10 10 10 42 2 0 14 14 14 29)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatSpecialFunctions2| 'NILADIC T) 
