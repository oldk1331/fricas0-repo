
(SDEFUN |FSFUN;bernoulli_gamma_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|bk| (|Float|)) (|kinv| (|Float|))
          (|zk| #2=(|Complex| (|Float|))) (#3=#:G39 NIL) (|k| NIL)
          (|z2inv| #1#) (|zinv| #2#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 8)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 9)))
              (LETT |s|
                    (SPADCALL |zk|
                              (SPADCALL (|spadConstant| % 7)
                                        (SPADCALL 12 (QREFELT % 11))
                                        (QREFELT % 8))
                              (QREFELT % 9)))
              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |zk| (SPADCALL |zk| |z2inv| (QREFELT % 9)))
                        (LETT |kinv|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL
                                         (* (+ (* 2 |k|) 2) (+ (* 2 |k|) 1))
                                         (QREFELT % 16))
                                        (QREFELT % 17)))
                        (LETT |bk|
                              (SPADCALL
                               (SPADCALL (+ (* 2 |k|) 2) (QREFELT % 19))
                               (QREFELT % 20)))
                        (EXIT
                         (LETT |s|
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |bk| |kinv|
                                                     (QREFELT % 21))
                                           (QREFELT % 22))
                                          |zk| (QREFELT % 9))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |FSFUN;logGamma_a1|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z|
                     (SPADCALL (|spadConstant| % 7) (SPADCALL 2 (QREFELT % 11))
                               (QREFELT % 8))
                     (QREFELT % 24))
           (SPADCALL |z| (QREFELT % 25)) (QREFELT % 9))
          |z| (QREFELT % 24))
         (SPADCALL
          (SPADCALL (|spadConstant| % 15) (SPADCALL 2 (QREFELT % 16))
                    (QREFELT % 17))
          (SPADCALL
           (SPADCALL (SPADCALL 2 (QREFELT % 16)) (SPADCALL (QREFELT % 26))
                     (QREFELT % 27))
           (QREFELT % 25))
          (QREFELT % 27))
         (QREFELT % 23))) 

(SDEFUN |FSFUN;logGamma_asymptotic|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|lg1| (|Complex| (|Float|))))
               (SEQ (LETT |lg1| (|FSFUN;logGamma_a1| |z| %))
                    (EXIT
                     (SPADCALL |lg1| (|FSFUN;bernoulli_gamma_series| |z| |n| %)
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;gamma_series|
        ((|z| (|Complex| (|Float|))) (|l| (|Float|)) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|tk| #1#) (#2=#:G48 NIL) (|k| NIL))
         (SEQ
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL |l| (QREFELT % 28))
                                      (QREFELT % 22))
                            (QREFELT % 9))
                  (QREFELT % 29))
                 |z| (QREFELT % 8)))
          (LETT |s| |tk|)
          (SEQ (LETT |k| 1) (LETT #2# |n|) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (LETT |tk|
                      (SPADCALL
                       (SPADCALL |tk| (SPADCALL |l| (QREFELT % 22))
                                 (QREFELT % 9))
                       (SPADCALL |z| (SPADCALL |k| (QREFELT % 11))
                                 (QREFELT % 23))
                       (QREFELT % 8)))
                (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT % 23)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |s|
                     (SPADCALL
                      (SPADCALL (SPADCALL |l| (QREFELT % 30)) (QREFELT % 31))
                      (QREFELT % 22))
                     (QREFELT % 9)))))) 

(SDEFUN |FSFUN;Gamma;2C;5|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#1=#:G59 NIL) (|llog| (|PositiveInteger|)) (#2=#:G57 NIL)
          (#3=#:G55 NIL) (|l1a| (|Integer|)) (|len| (|Float|))
          (|loss| (|Float|)) (|lz| (|PositiveInteger|)) (#4=#:G54 NIL)
          (|oz| (|PositiveInteger|)) (#5=#:G53 NIL) (|abs_z| #6=(|Float|))
          (|one| (|Complex| (|Float|))) (|c_pi| (|Complex| (|Float|)))
          (|sign| (|Float|)) (|z1| (|Complex| (|Float|))) (|re_zint| (|Float|))
          (|re_z| #6#) (|l| (|PositiveInteger|)) (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |sign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (SPADCALL (|spadConstant| % 15)
                                           (QREFELT % 30)))
                                (#7='T (|spadConstant| % 15))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#7#
                            (SEQ (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |one| (|spadConstant| % 7))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL |sign| |c_pi| (QREFELT % 27))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 44))
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 9))
                                        (QREFELT % 8)))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#7#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 46))
                                     (QREFELT % 35)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 47))
                                  (QREFELT % 48))
                        (SEQ
                         (LETT |oz|
                               (PROG1
                                   (LETT #5#
                                         (MAX (SPADCALL |abs_z| (QREFELT % 49))
                                              5))
                                 (|check_subtype2| (> #5# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #5#)))
                         (LETT |lz|
                               (PROG1 (LETT #4# (INTEGER-LENGTH |oz|))
                                 (|check_subtype2| (> #4# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #4#)))
                         (SPADCALL (+ (+ |oz| |lz|) 30) (QREFELT % 39))
                         (LETT |loss|
                               (SPADCALL
                                (SPADCALL
                                 (|FSFUN;logGamma_a1|
                                  (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                            (QREFELT % 22))
                                  %)
                                 (QREFELT % 35))
                                (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                          (QREFELT % 35))
                                (QREFELT % 50)))
                         (LETT |len|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |z| (QREFELT % 35))
                                           (QREFELT % 47))
                                 (SPADCALL 2
                                           (SPADCALL |loss|
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 51))
                                                      (SPADCALL |l|
                                                                (QREFELT % 16))
                                                      (QREFELT % 21))
                                                     (QREFELT % 52))
                                           (QREFELT % 47))
                                 (QREFELT % 52))
                                (SPADCALL 3 (QREFELT % 16)) (QREFELT % 52)))
                         (LETT |l1a|
                               (+
                                (+ (+ |l| (SPADCALL |len| (QREFELT % 49)))
                                   (SPADCALL
                                    (SPADCALL |loss| (SPADCALL (QREFELT % 51))
                                              (QREFELT % 17))
                                    (QREFELT % 53)))
                                12))
                         (LETT |l1|
                               (PROG1
                                   (LETT #3#
                                         (MAX |l1a|
                                              (+
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |abs_z|
                                                           (SPADCALL |len|
                                                                     (QREFELT %
                                                                              28))
                                                           (QREFELT % 21))
                                                 (SPADCALL (QREFELT % 51))
                                                 (QREFELT % 17))
                                                (QREFELT % 53))
                                               10)))
                                 (|check_subtype2| (> #3# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #3#)))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (|FSFUN;gamma_series| |z| |len|
                                (+ (* 3 (SPADCALL |len| (QREFELT % 53))) 6) %))
                         (SPADCALL |l0| (QREFELT % 39)) (EXIT |result|)))
                       (#7#
                        (SEQ
                         (LETT |llog|
                               (PROG1
                                   (LETT #2#
                                         (MAX
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (|FSFUN;logGamma_a1| |z| %)
                                             (QREFELT % 46))
                                            (QREFELT % 35))
                                           (QREFELT % 49))
                                          5))
                                 (|check_subtype2| (> #2# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #2#)))
                         (LETT |l1|
                               (+
                                (+ (+ |l| |llog|)
                                   (PROG1 (LETT #1# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (SPADCALL
                                (|FSFUN;logGamma_asymptotic| |z|
                                 (+ (QUOTIENT2 |l| 6) 1) %)
                                (QREFELT % 29)))
                         (SPADCALL |l0| (QREFELT % 39))
                         (EXIT |result|)))))))))))
           (#7# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;logGamma_lift|
        ((|z| (|Complex| (|Float|))) (|lg2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|k| (|Float|)) (|lg2i| (|Float|)))
               (SEQ (LETT |lg2i| (SPADCALL |lg2| (QREFELT % 54)))
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                       (QREFELT % 54))
                             |lg2i| (QREFELT % 50))
                            (SPADCALL 2 (SPADCALL (QREFELT % 55))
                                      (QREFELT % 47))
                            (QREFELT % 17))
                           (QREFELT % 40)))
                    (EXIT
                     (SPADCALL |lg2|
                               (SPADCALL (SPADCALL (QREFELT % 56))
                                         (SPADCALL
                                          (SPADCALL |k|
                                                    (SPADCALL 2 (QREFELT % 16))
                                                    (QREFELT % 21))
                                          (SPADCALL (QREFELT % 26))
                                          (QREFELT % 27))
                                         (QREFELT % 9))
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;logGamma;2C;7|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| #1=(|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#2=#:G74 NIL) (|l| (|PositiveInteger|)) (|abs_z| #3=(|Float|))
          (|c_pi| (|Complex| (|Float|))) (|lsign| (|Float|)) (|z1| #1#)
          (|re_zint| (|Float|)) (|one| (|Complex| (|Float|))) (|re_z| #3#)
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (LETT |one| (|spadConstant| % 7))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |lsign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (|spadConstant| % 15))
                                (#4='T (|spadConstant| % 57))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#4#
                            (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                                 (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| (QREFELT % 25))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| % 57)
                                                     |lsign| (QREFELT % 58))
                                           |c_pi| (QREFELT % 9))
                                          (QREFELT % 23))
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 59))
                                         (QREFELT % 24))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 25))
                                        (QREFELT % 24)))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z| |result| %))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#4#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 46))
                                     (QREFELT % 35)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 47))
                                  (QREFELT % 48))
                        (SEQ (LETT |l| (+ |l| 5))
                             (COND
                              ((OR
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |one| (QREFELT % 24))
                                            (QREFELT % 46))
                                  (QREFELT % 35))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 36))
                                 (QREFELT % 38))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |z| |one| (QREFELT % 24)) |one|
                                    (QREFELT % 24))
                                   (QREFELT % 46))
                                  (QREFELT % 35))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 36))
                                 (QREFELT % 38)))
                               (LETT |l| (* 2 |l|))))
                             (SPADCALL |l| (QREFELT % 39))
                             (LETT |result|
                                   (|FSFUN;logGamma_lift| |z|
                                    (SPADCALL (SPADCALL |z| (QREFELT % 44))
                                              (QREFELT % 25))
                                    %))
                             (SPADCALL |l0| (QREFELT % 39)) (EXIT |result|)))
                       (#4#
                        (SEQ
                         (LETT |l1|
                               (+
                                (+ |l|
                                   (PROG1 (LETT #2# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 39))
                         (LETT |result|
                               (|FSFUN;logGamma_asymptotic| |z|
                                (+ (QUOTIENT2 |l| 6) 1) %))
                         (SPADCALL |l0| (QREFELT % 39))
                         (EXIT |result|)))))))))))
           (#4# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Gamma;2F;8| ((|x| (|Float|)) (% (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 44))
                  (QREFELT % 35))) 

(SDEFUN |FSFUN;logGamma;2F;9| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 61))
          (|error| "Argument to logGamma <= 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 59))
                    (QREFELT % 35))))) 

(SDEFUN |FSFUN;Beta;3C;10|
        ((|x| (|Complex| (|Float|))) (|y| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l1| (MAX 30 (+ |l0| 10)))
                 (SPADCALL |l1| (QREFELT % 39))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 44))
                                  (SPADCALL |y| (QREFELT % 44)) (QREFELT % 9))
                        (SPADCALL (SPADCALL |x| |y| (QREFELT % 23))
                                  (QREFELT % 44))
                        (QREFELT % 8)))
                 (SPADCALL |l0| (QREFELT % 39)) (EXIT |res|)))
           ('T (|error| "Beta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Beta;3F;11| ((|x| (|Float|)) (|y| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 22)) (SPADCALL |y| (QREFELT % 22))
                   (QREFELT % 63))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;rabs;2F;12| ((|r| (|Float|)) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 65))) 

(SDEFUN |FSFUN;rabs;CF;13| ((|r| (|Complex| (|Float|))) (% (|Float|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 46)) (QREFELT % 35))) 

(PUT '|FSFUN;rabs;2Df;14| '|SPADreplace| '|abs_DF|) 

(SDEFUN |FSFUN;rabs;2Df;14| ((|r| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|abs_DF| |r|)) 

(SDEFUN |FSFUN;rabs;CDf;15|
        ((|r| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 71)) (QREFELT % 72))) 

(SDEFUN |FSFUN;digamma_euler_maclaurin|
        ((|a| (|Complex| (|Float|))) (|n| (|Integer|)) (|m| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|bk| (|Float|))
          (|ns1| (|Complex| (|Float|))) (|kfac| (|Float|)) (#1=#:G97 NIL)
          (|k| NIL) (|n2_inv| #2=(|Complex| (|Float|))) (|ns| #2#)
          (|na| (|Complex| (|Float|))) (|n1| (|Integer|)) (|ck| #2#)
          (#3=#:G96 NIL))
         (SEQ (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |k| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (LETT |ck|
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL (SPADCALL |k| (QREFELT % 11)) |a|
                                              (QREFELT % 23))
                                    (QREFELT % 8)))
                    (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |n1| (+ |n| 1))
              (LETT |na|
                    (SPADCALL (SPADCALL |n1| (QREFELT % 11)) |a|
                              (QREFELT % 23)))
              (LETT |ns| (SPADCALL (|spadConstant| % 7) |na| (QREFELT % 8)))
              (LETT |ns1| (|spadConstant| % 7))
              (LETT |res|
                    (SPADCALL
                     (SPADCALL |res|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) 2
                                          (QREFELT % 36))
                                |ns| (QREFELT % 27))
                               (QREFELT % 23))
                     (SPADCALL |na| (QREFELT % 25)) (QREFELT % 24)))
              (LETT |n2_inv|
                    (SPADCALL (|spadConstant| % 7)
                              (SPADCALL |na| |na| (QREFELT % 9))
                              (QREFELT % 8)))
              (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |kfac| (SPADCALL (* 2 |k|) (QREFELT % 16)))
                        (LETT |ns1| (SPADCALL |n2_inv| |ns1| (QREFELT % 9)))
                        (LETT |bk|
                              (SPADCALL (SPADCALL (* 2 |k|) (QREFELT % 19))
                                        (QREFELT % 20)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL
                                          (SPADCALL |bk| |kfac| (QREFELT % 17))
                                          |ns1| (QREFELT % 27))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 74)))))) 

(SDEFUN |FSFUN;digamma_aux|
        ((|a| (|Complex| (|Float|))) (|l| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|abs_a| (|Float|)))
               (SEQ
                (LETT |abs_a|
                      (SPADCALL (SPADCALL |a| (QREFELT % 75)) (QREFELT % 76)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                             (SPADCALL 6 |abs_a| (QREFELT % 47))
                             (QREFELT % 48))
                   (|FSFUN;digamma_euler_maclaurin| |a| (+ (QUOTIENT2 |l| 6) 1)
                    (+ (QUOTIENT2 |l| 6) 1) %))
                  ('T
                   (|FSFUN;digamma_euler_maclaurin| |a| -1
                    (+ (QUOTIENT2 |l| 6) 1) %))))))) 

(SDEFUN |FSFUN;digamma;2C;18|
        ((|a| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|ap| (|Complex| (|Float|))) (|r_pi| (|Float|))
          (|a1| (|Complex| (|Float|))) (|re_aint| (|Float|))
          (|l| (|PositiveInteger|)) (|re_a| (|Float|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 10) 61))
                 (EXIT
                  (|finally|
                   (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT % 35)))
                        (EXIT
                         (COND
                          ((SPADCALL |re_a|
                                     (SPADCALL (|spadConstant| % 15) 2
                                               (QREFELT % 36))
                                     (QREFELT % 38))
                           (SEQ (LETT |l| (+ |l| 5))
                                (SPADCALL
                                 (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                 (QREFELT % 39))
                                (LETT |re_aint|
                                      (SPADCALL |re_a| (QREFELT % 40)))
                                (LETT |a1|
                                      (SPADCALL |a|
                                                (SPADCALL |re_aint|
                                                          (|spadConstant| % 57)
                                                          (QREFELT % 58))
                                                (QREFELT % 24)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |a1| (|spadConstant| % 42)
                                             (QREFELT % 43))
                                   (|error| "Pole of Gamma"))
                                  (#1='T
                                   (SEQ (LETT |r_pi| (SPADCALL (QREFELT % 55)))
                                        (LETT |ap|
                                              (SPADCALL |r_pi| |a1|
                                                        (QREFELT % 27)))
                                        (EXIT
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |r_pi|
                                                      (SPADCALL |ap|
                                                                (QREFELT % 77))
                                                      (QREFELT % 27))
                                            (SPADCALL |ap| (QREFELT % 45))
                                            (QREFELT % 8))
                                           (QREFELT % 74))
                                          (|FSFUN;digamma_aux|
                                           (SPADCALL (|spadConstant| % 7) |a|
                                                     (QREFELT % 24))
                                           |l| %)
                                          (QREFELT % 23)))))))))
                          (#1#
                           (SEQ
                            (SPADCALL (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                      (QREFELT % 39))
                            (EXIT (|FSFUN;digamma_aux| |a| |l| %)))))))
                   (SPADCALL |l0| (QREFELT % 39))))))
           (#1# (|error| "digamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;digamma;2F;19| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                   (QREFELT % 78))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;li2_series|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|ck| (|Float|)) (|k2| (|Integer|))
          (|k| (|Integer|)) (#1=#:G113 NIL) (|i| NIL) (|n| (|Integer|))
          (|oz| (|Integer|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
              (LETT |oz| (SPADCALL |nz| (QREFELT % 49)))
              (LETT |n|
                    (COND
                     ((< |oz| -200)
                      (+ (QUOTIENT2 (* 2 |prec|) (- (- |oz|) 1)) 1))
                     ('T
                      (+
                       (SPADCALL
                        (SPADCALL
                         (|mul_DF|
                          (FLOAT (* 2 |prec|) MOST-POSITIVE-DOUBLE-FLOAT)
                          (|minus_DF|
                           (|div_DF|
                            (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |nz| (QREFELT % 81))
                                      (QREFELT % 80)))))
                         (QREFELT % 82))
                        (QREFELT % 83))
                       1))))
              (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |k| (- (+ |n| 2) |i|)) (LETT |k2| (* |k| |k|))
                        (LETT |ck|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL |k2| (QREFELT % 16))
                                        (QREFELT % 17)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |z|
                                         (SPADCALL |res|
                                                   (SPADCALL |ck|
                                                             (|spadConstant| %
                                                                             57)
                                                             (QREFELT % 58))
                                                   (QREFELT % 23))
                                         (QREFELT % 9)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z|
                         (SPADCALL (|spadConstant| % 7) |res| (QREFELT % 23))
                         (QREFELT % 9)))))) 

(SDEFUN |FSFUN;li2_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|lz1| #1=(|Complex| (|Float|))) (|nz1| #2=(|Float|)) (|lz| #1#)
          (|lmz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|))
          (|z1| (|Complex| (|Float|))) (|nz| #2#) (|dd| #2#)
          (|w| (|Complex| (|Float|))) (|siz| (|Float|)) (|iz| (|Float|))
          (|rz| (|Float|)))
         (SEQ (LETT |rz| (SPADCALL |z| (QREFELT % 35)))
              (LETT |iz| (SPADCALL |z| (QREFELT % 54)))
              (LETT |siz|
                    (COND
                     ((SPADCALL |iz| (|spadConstant| % 57) (QREFELT % 48))
                      (|spadConstant| % 15))
                     (#3='T (SPADCALL (|spadConstant| % 15) (QREFELT % 30)))))
              (LETT |w|
                    (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (SPADCALL
                               (SPADCALL |siz|
                                         (SPADCALL (|spadConstant| % 15) 2
                                                   (QREFELT % 36))
                                         (QREFELT % 21))
                               (SPADCALL (SPADCALL 3 (QREFELT % 16))
                                         (QREFELT % 76))
                               (QREFELT % 21))
                              (QREFELT % 58)))
              (LETT |dd|
                    (SPADCALL (SPADCALL |z| |w| (QREFELT % 24))
                              (QREFELT % 75)))
              (EXIT
               (COND
                ((SPADCALL |dd|
                           (SPADCALL (|spadConstant| % 15) 8 (QREFELT % 36))
                           (QREFELT % 38))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                            (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT % 9))
                             (+ |prec| 2) %)
                            (QREFELT % 27))
                  (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT % 74)) (+ |prec| 2)
                   %)
                  (QREFELT % 24)))
                (#3#
                 (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
                      (LETT |z1|
                            (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)))
                      (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |rz|
                                   (SPADCALL (|spadConstant| % 15) 2
                                             (QREFELT % 36))
                                   (QREFELT % 48))
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 84))
                                 (SEQ
                                  (LETT |lmz|
                                        (SPADCALL (SPADCALL |z| (QREFELT % 74))
                                                  (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |pi_fac| (QREFELT % 22))
                                      (QREFELT % 74))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lmz| (QREFELT % 27))
                                      |lmz| (QREFELT % 9))
                                     (QREFELT % 24))
                                    (|FSFUN;li2_series|
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 8))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |z1| (|spadConstant| % 42)
                                                   (QREFELT % 43))
                                         (SPADCALL |pi_fac| (QREFELT % 22)))
                                        (#3#
                                         (SEQ
                                          (LETT |lz1|
                                                (SPADCALL |z1| (QREFELT % 25)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |nz|
                                                       (|spadConstant| % 15)
                                                       (QREFELT % 84))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| %
                                                                            15)
                                                            2 (QREFELT % 36))
                                                           |lz| (QREFELT % 27))
                                                          |lz1| (QREFELT % 24))
                                                         (QREFELT % 9))
                                               (QREFELT % 23))
                                              (|FSFUN;li2_series|
                                               (SPADCALL
                                                (SPADCALL |z1| |z|
                                                          (QREFELT % 8))
                                                (QREFELT % 74))
                                               |prec| %)
                                              (QREFELT % 23)))
                                            (#3#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz| |lz1|
                                                         (QREFELT % 9))
                                               (QREFELT % 24))
                                              (|FSFUN;li2_series| |z1| |prec|
                                               %)
                                              (QREFELT % 24)))))))))))))))
                        ((SPADCALL |nz| (|spadConstant| % 15) (QREFELT % 84))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pi_fac| (QREFELT % 22))
                                     (QREFELT % 74))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                             (SPADCALL |z1| (QREFELT % 25)) (QREFELT % 27))
                            (SPADCALL
                             (SPADCALL |z1| (SPADCALL |z| |z| (QREFELT % 9))
                                       (QREFELT % 8))
                             (QREFELT % 25))
                            (QREFELT % 9))
                           (QREFELT % 23))
                          (|FSFUN;li2_series|
                           (SPADCALL (|spadConstant| % 7) |z1| (QREFELT % 8))
                           |prec| %)
                          (QREFELT % 23)))
                        (#3#
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 84))
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lz1| (QREFELT % 27))
                                      |lz1| (QREFELT % 9))
                                     (QREFELT % 74))
                                    (|FSFUN;li2_series|
                                     (SPADCALL
                                      (SPADCALL |z| |z1| (QREFELT % 8))
                                      (QREFELT % 74))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (|FSFUN;li2_series| |z| |prec| %))))))))))))))) 

(SDEFUN |FSFUN;li2;2C;22|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;li2_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "li2 can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;dilog_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|lz1| #1=(|Complex| (|Float|)))
          (|lz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 75)))
              (EXIT
               (COND
                ((SPADCALL |nz|
                           (SPADCALL (|spadConstant| % 15) 4 (QREFELT % 36))
                           (QREFELT % 38))
                 (SEQ (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43))
                         (SPADCALL |pi_fac| (QREFELT % 22)))
                        (#2='T
                         (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                              (LETT |lz1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 24))
                                     (QREFELT % 25)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT % 22))
                                       (SPADCALL |lz| |lz1| (QREFELT % 9))
                                       (QREFELT % 24))
                                      (|FSFUN;li2_series| |z| |prec| %)
                                      (QREFELT % 24))))))))))
                (#2#
                 (|FSFUN;li2_aux|
                  (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)) |prec|
                  %))))))) 

(SDEFUN |FSFUN;dilog;2C;24|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;dilog_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "dilog can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4F;25|
        ((|x| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G138 NIL) (|dw| (|Float|)) (|ew| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 31)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 17))
                                            (QREFELT % 50))
                                  (SPADCALL |w| (|spadConstant| % 15)
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G137)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4F;26|
        ((|lz| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G144 NIL) (|dw| (|Float|)) (|lw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 28)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 52))
                                            |lz| (QREFELT % 50))
                                  (SPADCALL (|spadConstant| % 15)
                                            (SPADCALL (|spadConstant| % 15) |w|
                                                      (QREFELT % 17))
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G143)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3F;27|
        ((|h| (|Float|)) (|h2| (|Float|)) (% (|Float|)))
        (SPROG ((|res| (|Float|)) (|h4| #1=(|Float|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (SPADCALL |h|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 89))
                                           (QREFELT % 20))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 89))
                                           (QREFELT % 20))
                                 |h3| (QREFELT % 21))
                                (QREFELT % 52)))
                (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 89))
                                           (QREFELT % 20))
                                 |h4| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 89))
                                            (QREFELT % 20))
                                  |h3| (QREFELT % 21))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 52)))
                (EXIT
                 (SPADCALL |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 89))
                                       (QREFELT % 20))
                             |h4| (QREFELT % 21))
                            |h2| (QREFELT % 21))
                           (QREFELT % 50)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CFC;28|
        ((|x| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G152 NIL) (|dw| (|Complex| (|Float|)))
          (|ew| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 29)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 8))
                                            (QREFELT % 24))
                                  (SPADCALL |w| (|spadConstant| % 7)
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G151)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CFC;29|
        ((|lz| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G158 NIL) (|dw| (|Complex| (|Float|)))
          (|lw| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 25)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 23))
                                            |lz| (QREFELT % 24))
                                  (SPADCALL (|spadConstant| % 7)
                                            (SPADCALL (|spadConstant| % 7) |w|
                                                      (QREFELT % 8))
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G157)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;30|
        ((|h| (|Complex| (|Float|))) (|h2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|h4| #1=(|Complex| (|Float|)))
          (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 89))
                                     (QREFELT % 93))
                           |h2| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 89))
                                     (QREFELT % 93))
                           |h3| (QREFELT % 9))
                          (QREFELT % 23)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 89))
                                     (QREFELT % 93))
                           |h4| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 89))
                                      (QREFELT % 93))
                            |h3| (QREFELT % 9))
                           |h2| (QREFELT % 9))
                          (QREFELT % 23)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 89))
                                 (QREFELT % 93))
                       |h4| (QREFELT % 9))
                      |h2| (QREFELT % 9))
                     (QREFELT % 24)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4Df;31|
        ((|x| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G166 NIL) (|dw| (|DoubleFloat|))
          (|ew| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (|exp_DF| |w|))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| |w| (|div_DF| |x| |ew|))
                                           (|add_DF| |w| 1.0)))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G165)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4Df;32|
        ((|lz| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G172 NIL) (|dw| (|DoubleFloat|))
          (|lw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 80)))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                           (|add_DF| 1.0 (|div_DF| 1.0 |w|))))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G171)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3Df;33|
        ((|h| (|DoubleFloat|)) (|h2| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|res| (|DoubleFloat|)) (|h4| #1=(|DoubleFloat|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (|sub_DF| |h|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 89))
                                           (QREFELT % 97))
                                 |h2|)))
                (LETT |h3| (|mul_DF| |h| |h2|))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 89))
                                           (QREFELT % 97))
                                 |h3|)))
                (LETT |h4| (|mul_DF| |h2| |h2|))
                (LETT |res|
                      (|sub_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 89))
                                           (QREFELT % 97))
                                 |h4|)))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (|mul_DF|
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 89))
                                            (QREFELT % 97))
                                  |h3|)
                                 |h2|)))
                (EXIT
                 (|sub_DF| |res|
                           (|mul_DF|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 89))
                                       (QREFELT % 97))
                             |h4|)
                            |h2|)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CDfC;34|
        ((|x| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G180 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|ew| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 99)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 100))
                                            (QREFELT % 101))
                                  (SPADCALL |w| (|spadConstant| % 102)
                                            (QREFELT % 103))
                                  (QREFELT % 100)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 101)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G179)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CDfC;35|
        ((|lz| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G186 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|lw| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 105)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 103))
                                            |lz| (QREFELT % 101))
                                  (SPADCALL (|spadConstant| % 102)
                                            (SPADCALL (|spadConstant| % 102)
                                                      |w| (QREFELT % 100))
                                            (QREFELT % 103))
                                  (QREFELT % 100)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 101)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G185)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;36|
        ((|h| (|Complex| (|DoubleFloat|))) (|h2| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res| (|Complex| (|DoubleFloat|)))
          (|h4| #1=(|Complex| (|DoubleFloat|))) (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 89))
                                     (QREFELT % 107))
                           |h2| (QREFELT % 108))
                          (QREFELT % 101)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 108)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 89))
                                     (QREFELT % 107))
                           |h3| (QREFELT % 108))
                          (QREFELT % 103)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 108)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 89))
                                     (QREFELT % 107))
                           |h4| (QREFELT % 108))
                          (QREFELT % 101)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 89))
                                      (QREFELT % 107))
                            |h3| (QREFELT % 108))
                           |h2| (QREFELT % 108))
                          (QREFELT % 103)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 89))
                                 (QREFELT % 107))
                       |h4| (QREFELT % 108))
                      |h2| (QREFELT % 108))
                     (QREFELT % 101)))))) 

(SDEFUN |FSFUN;lambertW;2Df;37| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|ax| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|h2| (|DoubleFloat|)) (|e1| (|DoubleFloat|)) (|w| (|DoubleFloat|))
          (|y| #1=(|DoubleFloat|)) (|lx| #1#) (|ox| (|Integer|)))
         (SEQ
          (COND ((|eql_DF| |x| 0.0) |x|)
                (#2='T
                 (SEQ (LETT |eps| (SPADCALL 1 -35 (QREFELT % 110)))
                      (LETT |ox| (SPADCALL |x| (QREFELT % 111)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((> |ox| 200)
                                 (COND
                                  ((SPADCALL |x| 0.0 (QREFELT % 112))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT % 80)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT % 96)))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |x|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 112))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 80)))
                                        (EXIT
                                         (|sub_DF| |y|
                                                   (SPADCALL |y|
                                                             (QREFELT %
                                                                      80))))))
                                      (#2# (|mul_DF| (|div_DF_I| 1.0 2) |x|))))
                               (EXIT
                                (COND
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190436 517656
                                                         (QREFELT % 89))
                                               (QREFELT % 113))
                                              (QREFELT % 97)))
                                  (|error| "x < -exp(-1)"))
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 231087 628160
                                                         (QREFELT % 89))
                                               (QREFELT % 113))
                                              (QREFELT % 97)))
                                  (SEQ (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2| (|add_DF| |x| |e1|))
                                       (EXIT
                                        (COND
                                         ((|less_DF| |h2| 0.0)
                                          (|error| "x < -exp(-1)"))
                                         (#2#
                                          (SEQ
                                           (LETT |h2|
                                                 (|div_DF|
                                                  (SPADCALL 2 |h2|
                                                            (QREFELT % 114))
                                                  |e1|))
                                           (LETT |h|
                                                 (SPADCALL |h2|
                                                           (QREFELT % 115)))
                                           (EXIT
                                            (|sub_DF|
                                             (SPADCALL |h| |h2| (QREFELT % 98))
                                             1.0))))))))
                                 (#2#
                                  (SEQ
                                   (COND
                                    ((|less_DF| (LETT |ax| (|abs_DF| |x|))
                                                (|div_DF_I| 1.0 2))
                                     (LETT |eps| (|mul_DF| |ax| |eps|))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT % 95))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;38|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|w| #1=(|Complex| (|DoubleFloat|)))
          (|y| (|Complex| (|DoubleFloat|))) (|h| (|Complex| (|DoubleFloat|)))
          (|h2| #1#) (|e1| (|DoubleFloat|)) (|lz| (|Complex| (|DoubleFloat|)))
          (|ox| (|Integer|)) (|ax| (|DoubleFloat|)) (|ix| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 117) (QREFELT % 118)) |x|)
                (#2='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 72)))
                      (LETT |ix| (SPADCALL |x| (QREFELT % 119)))
                      (LETT |ax| (|add_DF| (|abs_DF| |rx|) (|abs_DF| |ix|)))
                      (LETT |eps| (SPADCALL 1 -35 (QREFELT % 110)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT % 111)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             ((> |ox| 200)
                              (SEQ
                               (LETT |lz|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ax| (QREFELT % 80))
                                                0.0 (QREFELT % 120))
                                      (SPADCALL
                                       (SPADCALL (|div_DF| |rx| |ax|)
                                                 (|div_DF| |ix| |ax|)
                                                 (QREFELT % 120))
                                       (QREFELT % 105))
                                      (QREFELT % 103)))
                               (EXIT
                                (SPADCALL |lz| |lz| |eps| (QREFELT % 106)))))
                             (#2#
                              (SEQ
                               (COND
                                ((|less_DF| (|abs_DF| |ix|)
                                            (SPADCALL
                                             (SPADCALL 1 4194304
                                                       (QREFELT % 89))
                                             (QREFELT % 97)))
                                 (COND
                                  ((|less_DF| |rx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 231087 628160
                                                          (QREFELT % 89))
                                                (QREFELT % 113))
                                               (QREFELT % 97)))
                                   (COND
                                    ((|less_DF|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 56258 152925 (QREFELT % 89))
                                        (QREFELT % 113))
                                       (QREFELT % 97))
                                      |rx|)
                                     (EXIT
                                      (SEQ
                                       (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2|
                                             (SPADCALL
                                              (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                        (QREFELT % 114))
                                              (SPADCALL |x|
                                                        (SPADCALL |e1| 0.0
                                                                  (QREFELT %
                                                                           120))
                                                        (QREFELT % 103))
                                              (QREFELT % 121)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT % 122)))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |h| |h2| (QREFELT % 109))
                                         (|spadConstant| % 102)
                                         (QREFELT % 101)))))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |ax|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 112))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 105)))
                                        (EXIT
                                         (SPADCALL |y|
                                                   (SPADCALL |y|
                                                             (QREFELT % 105))
                                                   (QREFELT % 101)))))
                                      (#2#
                                       (SPADCALL (|div_DF_I| 1.0 2) |x|
                                                 (QREFELT % 121)))))
                               (COND
                                ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                                 (LETT |eps| (|mul_DF| |ax| |eps|))))
                               (EXIT
                                (SPADCALL |x| |w| |eps|
                                          (QREFELT % 104))))))))))))) 

(SDEFUN |FSFUN;lambertW;2F;39| ((|x| (|Float|)) (% (|Float|)))
        (SPROG
         ((|eps| (|Float|)) (|w| (|Float|)) (|y| #1=(|Float|)) (|w1| (|Float|))
          (|h| (|Float|)) (|h2| (|Float|)) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|lx| #1#) (|ox| (|Integer|))
          (|ax| (|Float|)) (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 124)) |x|)
                  (#2='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                        (QREFELT % 125)))
                        (LETT |ax| (SPADCALL |x| (QREFELT % 65)))
                        (LETT |ox| (SPADCALL |ax| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                               (#2#
                                (SEQ
                                 (COND
                                  ((> |ox| 200)
                                   (COND
                                    ((SPADCALL |x| (|spadConstant| % 57)
                                               (QREFELT % 48))
                                     (EXIT
                                      (SEQ
                                       (LETT |lx|
                                             (SPADCALL |x| (QREFELT % 28)))
                                       (EXIT
                                        (SPADCALL |lx| |lx| |eps|
                                                  (QREFELT % 88)))))))))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190436 517656
                                                          (QREFELT % 89))
                                                (QREFELT % 113))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (|error| "x < -exp(-1)"))
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190434 517656
                                                          (QREFELT % 89))
                                                (QREFELT % 113))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (SEQ (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                         (SPADCALL (+ |cbit| |cbit2|)
                                                   (QREFELT % 39))
                                         (LETT |e1|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 15)
                                                          (QREFELT % 30))
                                                (QREFELT % 31)))
                                         (LETT |h2|
                                               (SPADCALL |x| |e1|
                                                         (QREFELT % 52)))
                                         (LETT |h|
                                               (SPADCALL |h2| (QREFELT % 76)))
                                         (SPADCALL |cbit| (QREFELT % 39))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |h2|
                                                      (|spadConstant| % 57)
                                                      (QREFELT % 38))
                                            (|error| "x < -exp(-1)"))
                                           (#2#
                                            (SEQ
                                             (LETT |w1|
                                                   (SPADCALL |h| |h2|
                                                             (QREFELT % 90)))
                                             (EXIT
                                              (COND
                                               ((<
                                                 (SPADCALL |w1| (QREFELT % 49))
                                                 (- |cbit2|))
                                                (SPADCALL |w1|
                                                          (|spadConstant| % 15)
                                                          (QREFELT % 50)))
                                               (#2#
                                                (SPADCALL |x|
                                                          (SPADCALL |w1|
                                                                    (|spadConstant|
                                                                     % 15)
                                                                    (QREFELT %
                                                                             50))
                                                          |eps|
                                                          (QREFELT %
                                                                   87)))))))))))
                                   (#2#
                                    (SEQ
                                     (LETT |w|
                                           (COND
                                            ((SPADCALL |x|
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          16))
                                                       (QREFELT % 48))
                                             (SEQ
                                              (LETT |y|
                                                    (SPADCALL |x|
                                                              (QREFELT % 28)))
                                              (EXIT
                                               (SPADCALL |y|
                                                         (SPADCALL |y|
                                                                   (QREFELT %
                                                                            28))
                                                         (QREFELT % 50)))))
                                            (#2#
                                             (SPADCALL
                                              (SPADCALL 5 -1 10
                                                        (QREFELT % 126))
                                              |x| (QREFELT % 21)))))
                                     (COND
                                      ((SPADCALL (SPADCALL |x| (QREFELT % 65))
                                                 (SPADCALL
                                                  (SPADCALL 1 2 (QREFELT % 89))
                                                  (QREFELT % 20))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |ax| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |x| |w| |eps|
                                                (QREFELT % 87)))))))))))))))
           (#2# (|error| "lambertW can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;lambertW;2C;40|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|w1| (|Complex| (|Float|))) (|h| (|Complex| (|Float|)))
          (|h2| (|Complex| (|Float|))) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|eps| (|Float|))
          (|w| (|Complex| (|Float|))) (|wd| (|Complex| (|DoubleFloat|)))
          (|izd| (|DoubleFloat|)) (|rzd| (|DoubleFloat|))
          (|lz| (|Complex| (|Float|))) (|oz| (|Integer|)) (|abs_z| (|Float|))
          (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43)) |z|)
                  (#1='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                        (QREFELT % 125)))
                        (LETT |abs_z| (SPADCALL |z| (QREFELT % 67)))
                        (LETT |oz| (SPADCALL |abs_z| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                               ((> |oz| 200)
                                (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                     (EXIT
                                      (SPADCALL |lz| |lz| |eps|
                                                (QREFELT % 92)))))
                               (#1#
                                (SEQ
                                 (LETT |rzd|
                                       (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                                 (QREFELT % 128)))
                                 (COND
                                  ((OR
                                    (SPADCALL (SPADCALL |z| (QREFELT % 54))
                                              (SPADCALL (|spadConstant| % 15)
                                                        1000000 (QREFELT % 36))
                                              (QREFELT % 48))
                                    (OR
                                     (|less_DF| |rzd|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL 190436 517656
                                                            (QREFELT % 89))
                                                  (QREFELT % 113))
                                                 (QREFELT % 97)))
                                     (SPADCALL |rzd|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL 190434 517656
                                                           (QREFELT % 89))
                                                 (QREFELT % 113))
                                                (QREFELT % 97))
                                               (QREFELT % 112))))
                                   (EXIT
                                    (SEQ
                                     (LETT |izd|
                                           (SPADCALL
                                            (SPADCALL |z| (QREFELT % 54))
                                            (QREFELT % 128)))
                                     (LETT |wd|
                                           (SPADCALL
                                            (SPADCALL |rzd| |izd|
                                                      (QREFELT % 120))
                                            (QREFELT % 123)))
                                     (LETT |w|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 72))
                                             (QREFELT % 129))
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 119))
                                             (QREFELT % 129))
                                            (QREFELT % 58)))
                                     (COND
                                      ((SPADCALL |abs_z|
                                                 (SPADCALL
                                                  (|spadConstant| % 15) 2
                                                  (QREFELT % 36))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |abs_z| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |z| |w| |eps|
                                                (QREFELT % 91)))))))
                                 (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                 (SPADCALL (+ |cbit| |cbit2|) (QREFELT % 39))
                                 (LETT |e1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 15)
                                                  (QREFELT % 30))
                                        (QREFELT % 31)))
                                 (LETT |h2|
                                       (SPADCALL |z|
                                                 (SPADCALL |e1|
                                                           (|spadConstant| %
                                                                           57)
                                                           (QREFELT % 58))
                                                 (QREFELT % 23)))
                                 (LETT |h| (SPADCALL |h2| (QREFELT % 130)))
                                 (SPADCALL |cbit| (QREFELT % 39))
                                 (LETT |w1| (SPADCALL |h| |h2| (QREFELT % 94)))
                                 (EXIT
                                  (COND
                                   ((<
                                     (SPADCALL (SPADCALL |h2| (QREFELT % 67))
                                               (QREFELT % 49))
                                     (- |cbit2|))
                                    (SPADCALL |w1| (|spadConstant| % 7)
                                              (QREFELT % 24)))
                                   (#1#
                                    (SPADCALL |z|
                                              (SPADCALL |w1|
                                                        (|spadConstant| % 7)
                                                        (QREFELT % 24))
                                              |eps| (QREFELT % 91)))))))))))))
           (#1# (|error| "lambertW can only handle base 2 Float-s")))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G233)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatSpecialFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatSpecialFunctions|
                             (LIST
                              (CONS NIL (CONS 1 (|FloatSpecialFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatSpecialFunctions|)))))))))) 

(DEFUN |FloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatSpecialFunctions|))
          (LETT % (GETREFV 132))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 14) (0 . |One|) (4 . /)
              (10 . *) (|Integer|) (16 . |coerce|) (|Fraction| 10) (21 . |One|)
              (|Float|) (25 . |One|) (29 . |coerce|) (34 . /)
              (|IntegerNumberTheoryFunctions|) (40 . |bernoulli|)
              (45 . |coerce|) (50 . *) (56 . |coerce|) (61 . +) (67 . -)
              (73 . |log|) (78 . |pi|) (82 . *) (88 . |log|) (93 . |exp|)
              (98 . -) (103 . |exp|) (|PositiveInteger|) (108 . |base|)
              (112 . |bits|) (116 . |real|) (121 . /) (|Boolean|) (127 . <)
              (133 . |bits|) (138 . |round|) (143 . |retract|) (148 . |Zero|)
              (152 . =) |FSFUN;Gamma;2C;5| (158 . |sin|) (163 . |abs|)
              (168 . *) (174 . >) (180 . |order|) (185 . -) (191 . |log2|)
              (195 . +) (201 . |wholePart|) (206 . |imag|) (211 . |pi|)
              (215 . |imaginary|) (219 . |Zero|) (223 . |complex|)
              |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8| (229 . <=)
              |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10| |FSFUN;Beta;3F;11|
              (235 . |abs|) |FSFUN;rabs;2F;12| |FSFUN;rabs;CF;13|
              (|DoubleFloat|) |FSFUN;rabs;2Df;14| (|Complex| 68) (240 . |abs|)
              (245 . |real|) |FSFUN;rabs;CDf;15| (250 . -) (255 . |norm|)
              (260 . |sqrt|) (265 . |cos|) |FSFUN;digamma;2C;18|
              |FSFUN;digamma;2F;19| (270 . |log|) (275 . |convert|)
              (280 . |round|) (285 . |retract|) (290 . >=) |FSFUN;li2;2C;22|
              |FSFUN;dilog;2C;24| |FSFUN;lambert_via_newton1;4F;25|
              |FSFUN;lambert_via_newton2;4F;26| (296 . /)
              |FSFUN;lambert_inverse_series;3F;27|
              |FSFUN;lambert_via_newton1;2CFC;28|
              |FSFUN;lambert_via_newton2;2CFC;29| (302 . |coerce|)
              |FSFUN;lambert_inverse_series;3C;30|
              |FSFUN;lambert_via_newton1;4Df;31|
              |FSFUN;lambert_via_newton2;4Df;32| (307 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;33| (312 . |exp|) (317 . /)
              (323 . -) (329 . |One|) (333 . +)
              |FSFUN;lambert_via_newton1;2CDfC;34| (339 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;35| (344 . |coerce|) (349 . *)
              |FSFUN;lambert_inverse_series;3C;36| (355 . |float|)
              (361 . |order|) (366 . >) (372 . -) (377 . *) (383 . |sqrt|)
              |FSFUN;lambertW;2Df;37| (388 . |Zero|) (392 . =) (398 . |imag|)
              (403 . |complex|) (409 . *) (415 . |sqrt|) |FSFUN;lambertW;2C;38|
              (420 . =) (426 . |float|) (432 . |float|) |FSFUN;lambertW;2F;39|
              (439 . |coerce|) (444 . |convert|) (449 . |sqrt|)
              |FSFUN;lambertW;2C;40|)
           '#(|rabs| 454 |logGamma| 474 |li2| 484 |lambert_via_newton2| 489
              |lambert_via_newton1| 517 |lambert_inverse_series| 545 |lambertW|
              569 |dilog| 589 |digamma| 594 |Gamma| 604 |Beta| 614)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|logGamma| ((|Float|) (|Float|))) T)
                                   '((|logGamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Gamma| ((|Float|) (|Float|))) T)
                                   '((|Gamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|digamma| ((|Float|) (|Float|))) T)
                                   '((|digamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Beta| ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|Beta|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW| ((|Float|) (|Float|))) T)
                                   '((|lambertW|
                                      ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|dilog|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|li2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|Float|) (|Float|))) T)
                                   '((|rabs| ((|Float|) (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|rabs|
                                      ((|DoubleFloat|)
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 131
                                            '(0 6 0 7 2 6 0 0 0 8 2 6 0 0 0 9 1
                                              6 0 10 11 0 12 0 13 0 14 0 15 1
                                              14 0 10 16 2 14 0 0 0 17 1 18 12
                                              10 19 1 14 0 12 20 2 14 0 0 0 21
                                              1 6 0 14 22 2 6 0 0 0 23 2 6 0 0
                                              0 24 1 6 0 0 25 0 6 0 26 2 6 0 14
                                              0 27 1 14 0 0 28 1 6 0 0 29 1 14
                                              0 0 30 1 14 0 0 31 0 14 32 33 0
                                              14 32 34 1 6 14 0 35 2 14 0 0 10
                                              36 2 14 37 0 0 38 1 14 32 32 39 1
                                              14 0 0 40 1 14 10 0 41 0 6 0 42 2
                                              6 37 0 0 43 1 6 0 0 45 1 6 0 0 46
                                              2 14 0 32 0 47 2 14 37 0 0 48 1
                                              14 10 0 49 2 14 0 0 0 50 0 14 0
                                              51 2 14 0 0 0 52 1 14 10 0 53 1 6
                                              14 0 54 0 14 0 55 0 6 0 56 0 14 0
                                              57 2 6 0 14 14 58 2 14 37 0 0 61
                                              1 14 0 0 65 1 70 0 0 71 1 70 68 0
                                              72 1 6 0 0 74 1 6 14 0 75 1 14 0
                                              0 76 1 6 0 0 77 1 68 0 0 80 1 14
                                              68 0 81 1 68 0 0 82 1 68 10 0 83
                                              2 14 37 0 0 84 2 12 0 10 10 89 1
                                              6 0 12 93 1 68 0 12 97 1 70 0 0
                                              99 2 70 0 0 0 100 2 70 0 0 0 101
                                              0 70 0 102 2 70 0 0 0 103 1 70 0
                                              0 105 1 70 0 12 107 2 70 0 0 0
                                              108 2 68 0 10 10 110 1 68 10 0
                                              111 2 68 37 0 0 112 1 12 0 0 113
                                              2 68 0 32 0 114 1 68 0 0 115 0 70
                                              0 117 2 70 37 0 0 118 1 70 68 0
                                              119 2 70 0 68 68 120 2 70 0 68 0
                                              121 1 70 0 0 122 2 14 37 0 0 124
                                              2 14 0 10 10 125 3 14 0 10 10 32
                                              126 1 14 68 0 128 1 14 0 68 129 1
                                              6 0 0 130 1 0 68 68 69 1 0 68 70
                                              73 1 0 14 6 67 1 0 14 14 66 1 0 6
                                              6 59 1 0 14 14 62 1 0 6 6 85 3 0
                                              6 6 6 14 92 3 0 70 70 70 68 106 3
                                              0 14 14 14 14 88 3 0 68 68 68 68
                                              96 3 0 6 6 6 14 91 3 0 70 70 70
                                              68 104 3 0 14 14 14 14 87 3 0 68
                                              68 68 68 95 2 0 6 6 6 94 2 0 70
                                              70 70 109 2 0 14 14 14 90 2 0 68
                                              68 68 98 1 0 70 70 123 1 0 68 68
                                              116 1 0 6 6 131 1 0 14 14 127 1 0
                                              6 6 86 1 0 6 6 78 1 0 14 14 79 1
                                              0 6 6 44 1 0 14 14 60 2 0 6 6 6
                                              63 2 0 14 14 14 64)))))
           '|lookupComplete|)) 
