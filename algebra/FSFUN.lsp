
(SDEFUN |FSFUN;bernoulli_gamma_series|
        ((|z| |Complex| (|Float|)) (|n| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|bk| (|Float|)) (|kinv| (|Float|))
          (|zk| #2=(|Complex| (|Float|))) (#3=#:G142 NIL) (|k| NIL)
          (|z2inv| #1#) (|zinv| #2#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 8)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT $ 9)))
              (LETT |s|
                    (SPADCALL |zk|
                              (SPADCALL (SPADCALL 1 12 (QREFELT $ 12))
                                        (QREFELT $ 13))
                              (QREFELT $ 9)))
              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |zk| (SPADCALL |zk| |z2inv| (QREFELT $ 9)))
                        (LETT |kinv|
                              (SPADCALL (|spadConstant| $ 15)
                                        (SPADCALL
                                         (*
                                          (+ (SPADCALL 2 |k| (QREFELT $ 18)) 2)
                                          (+ (SPADCALL 2 |k| (QREFELT $ 18))
                                             1))
                                         (QREFELT $ 19))
                                        (QREFELT $ 20)))
                        (LETT |bk|
                              (SPADCALL
                               (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 18)) 2)
                                         (QREFELT $ 22))
                               (QREFELT $ 23)))
                        (EXIT
                         (LETT |s|
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |bk| |kinv|
                                                     (QREFELT $ 24))
                                           (QREFELT $ 25))
                                          |zk| (QREFELT $ 9))
                                         (QREFELT $ 26)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |FSFUN;logGamma_a1| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z|
                     (SPADCALL (SPADCALL 1 2 (QREFELT $ 12)) (QREFELT $ 13))
                     (QREFELT $ 27))
           (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 9))
          |z| (QREFELT $ 27))
         (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 12)) (QREFELT $ 13))
                   (SPADCALL
                    (SPADCALL (SPADCALL 2 (QREFELT $ 19))
                              (SPADCALL (QREFELT $ 29)) (QREFELT $ 30))
                    (QREFELT $ 28))
                   (QREFELT $ 9))
         (QREFELT $ 26))) 

(SDEFUN |FSFUN;logGamma_asymptotic|
        ((|z| |Complex| (|Float|)) (|n| |Integer|) ($ |Complex| (|Float|)))
        (SPROG ((|lg1| (|Complex| (|Float|))))
               (SEQ (LETT |lg1| (|FSFUN;logGamma_a1| |z| $))
                    (EXIT
                     (SPADCALL |lg1| (|FSFUN;bernoulli_gamma_series| |z| |n| $)
                               (QREFELT $ 26)))))) 

(SDEFUN |FSFUN;gamma_series|
        ((|z| |Complex| (|Float|)) (|l| |Float|) (|n| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|tk| #1#) (#2=#:G150 NIL) (|k| NIL))
         (SEQ
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL |l| (QREFELT $ 31))
                                      (QREFELT $ 25))
                            (QREFELT $ 9))
                  (QREFELT $ 32))
                 |z| (QREFELT $ 8)))
          (LETT |s| |tk|)
          (SEQ (LETT |k| 1) (LETT #2# |n|) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (LETT |tk|
                      (SPADCALL
                       (SPADCALL |tk| (SPADCALL |l| (QREFELT $ 25))
                                 (QREFELT $ 9))
                       (SPADCALL |z| (SPADCALL |k| (QREFELT $ 33))
                                 (QREFELT $ 26))
                       (QREFELT $ 8)))
                (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT $ 26)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |s|
                     (SPADCALL
                      (SPADCALL (SPADCALL |l| (QREFELT $ 34)) (QREFELT $ 35))
                      (QREFELT $ 25))
                     (QREFELT $ 9)))))) 

(SDEFUN |FSFUN;Gamma;2C;5| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|result| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#1=#:G161 NIL) (|llog| (|PositiveInteger|)) (#2=#:G159 NIL)
          (#3=#:G157 NIL) (|l1a| (|Integer|)) (|len| (|Float|))
          (|loss| (|Float|)) (|lz| (|PositiveInteger|)) (#4=#:G156 NIL)
          (|oz| (|PositiveInteger|)) (#5=#:G155 NIL) (|abs_z| #6=(|Float|))
          (|one| (|Complex| (|Float|))) (|c_pi| (|Complex| (|Float|)))
          (|sign| (|Float|)) (|z1| (|Complex| (|Float|))) (|re_zint| (|Float|))
          (|re_z| #6#) (|l| (|PositiveInteger|)) (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT $ 36)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT $ 38)))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                              (QREFELT $ 41))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT $ 43)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT $ 25))
                                         (QREFELT $ 27)))
                         (LETT |sign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT $ 44)))
                                 (SPADCALL (|spadConstant| $ 15)
                                           (QREFELT $ 34)))
                                (#7='T (|spadConstant| $ 15))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| $ 45)
                                      (QREFELT $ 46))
                            (SEQ (SPADCALL |l0| (QREFELT $ 42))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#7#
                            (SEQ (LETT |c_pi| (SPADCALL (QREFELT $ 29)))
                                 (LETT |one| (|spadConstant| $ 7))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL |sign| |c_pi| (QREFELT $ 30))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT $ 27))
                                          (QREFELT $ 47))
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT $ 9))
                                          (QREFELT $ 48))
                                         (QREFELT $ 9))
                                        (QREFELT $ 8)))
                                 (SPADCALL |l0| (QREFELT $ 42))
                                 (EXIT |result|)))))))
                   (#7#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT $ 49))
                                     (QREFELT $ 38)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                                  (SPADCALL 6 |abs_z| (QREFELT $ 50))
                                  (QREFELT $ 51))
                        (SEQ
                         (LETT |oz|
                               (PROG1
                                   (LETT #5#
                                         (MAX (SPADCALL |abs_z| (QREFELT $ 52))
                                              5))
                                 (|check_subtype2| (> #5# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #5#)))
                         (LETT |lz|
                               (PROG1 (LETT #4# (INTEGER-LENGTH |oz|))
                                 (|check_subtype2| (> #4# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #4#)))
                         (SPADCALL (+ (+ |oz| |lz|) 30) (QREFELT $ 42))
                         (LETT |loss|
                               (SPADCALL
                                (SPADCALL
                                 (|FSFUN;logGamma_a1|
                                  (SPADCALL (SPADCALL |z| (QREFELT $ 38))
                                            (QREFELT $ 25))
                                  $)
                                 (QREFELT $ 38))
                                (SPADCALL (|FSFUN;logGamma_a1| |z| $)
                                          (QREFELT $ 38))
                                (QREFELT $ 53)))
                         (LETT |len|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |z| (QREFELT $ 38))
                                           (QREFELT $ 50))
                                 (SPADCALL 2
                                           (SPADCALL |loss|
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 54))
                                                      (SPADCALL |l|
                                                                (QREFELT $ 19))
                                                      (QREFELT $ 24))
                                                     (QREFELT $ 55))
                                           (QREFELT $ 50))
                                 (QREFELT $ 55))
                                (SPADCALL 3 (QREFELT $ 19)) (QREFELT $ 55)))
                         (LETT |l1a|
                               (+
                                (+ (+ |l| (SPADCALL |len| (QREFELT $ 52)))
                                   (SPADCALL
                                    (SPADCALL |loss| (SPADCALL (QREFELT $ 54))
                                              (QREFELT $ 20))
                                    (QREFELT $ 56)))
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
                                                                     (QREFELT $
                                                                              31))
                                                           (QREFELT $ 24))
                                                 (SPADCALL (QREFELT $ 54))
                                                 (QREFELT $ 20))
                                                (QREFELT $ 56))
                                               10)))
                                 (|check_subtype2| (> #3# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #3#)))
                         (SPADCALL |l1| (QREFELT $ 42))
                         (LETT |result|
                               (|FSFUN;gamma_series| |z| |len|
                                (+
                                 (SPADCALL 3 (SPADCALL |len| (QREFELT $ 56))
                                           (QREFELT $ 57))
                                 6)
                                $))
                         (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))
                       (#7#
                        (SEQ
                         (LETT |llog|
                               (PROG1
                                   (LETT #2#
                                         (MAX
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (|FSFUN;logGamma_a1| |z| $)
                                             (QREFELT $ 49))
                                            (QREFELT $ 38))
                                           (QREFELT $ 52))
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
                         (SPADCALL |l1| (QREFELT $ 42))
                         (LETT |result|
                               (SPADCALL
                                (|FSFUN;logGamma_asymptotic| |z|
                                 (+ (QUOTIENT2 |l| 6) 1) $)
                                (QREFELT $ 32)))
                         (SPADCALL |l0| (QREFELT $ 42))
                         (EXIT |result|)))))))))))
           (#7# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;logGamma_lift|
        ((|z| |Complex| (|Float|)) (|lg2| |Complex| (|Float|))
         ($ |Complex| (|Float|)))
        (SPROG ((|k| (|Float|)) (|lg2i| (|Float|)))
               (SEQ (LETT |lg2i| (SPADCALL |lg2| (QREFELT $ 58)))
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|FSFUN;logGamma_a1| |z| $)
                                       (QREFELT $ 58))
                             |lg2i| (QREFELT $ 53))
                            (SPADCALL 2 (SPADCALL (QREFELT $ 59))
                                      (QREFELT $ 50))
                            (QREFELT $ 20))
                           (QREFELT $ 43)))
                    (EXIT
                     (SPADCALL |lg2|
                               (SPADCALL (SPADCALL (QREFELT $ 60))
                                         (SPADCALL
                                          (SPADCALL |k|
                                                    (SPADCALL 2 (QREFELT $ 19))
                                                    (QREFELT $ 24))
                                          (SPADCALL (QREFELT $ 29))
                                          (QREFELT $ 30))
                                         (QREFELT $ 9))
                               (QREFELT $ 26)))))) 

(SDEFUN |FSFUN;logGamma;2C;7|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|result| #1=(|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#2=#:G176 NIL) (|l| (|PositiveInteger|)) (|abs_z| #3=(|Float|))
          (|c_pi| (|Complex| (|Float|))) (|lsign| (|Float|)) (|z1| #1#)
          (|re_zint| (|Float|)) (|one| (|Complex| (|Float|))) (|re_z| #3#)
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT $ 36)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT $ 38)))
                 (LETT |one| (|spadConstant| $ 7))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                              (QREFELT $ 41))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT $ 43)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT $ 25))
                                         (QREFELT $ 27)))
                         (LETT |lsign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT $ 44)))
                                 (|spadConstant| $ 15))
                                (#4='T (|spadConstant| $ 61))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| $ 45)
                                      (QREFELT $ 46))
                            (SEQ (SPADCALL |l0| (QREFELT $ 42))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#4#
                            (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                                 (LETT |c_pi| (SPADCALL (QREFELT $ 29)))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| (QREFELT $ 28))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| $ 61)
                                                     |lsign| (QREFELT $ 62))
                                           |c_pi| (QREFELT $ 9))
                                          (QREFELT $ 26))
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT $ 27))
                                          (QREFELT $ 63))
                                         (QREFELT $ 27))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT $ 9))
                                          (QREFELT $ 48))
                                         (QREFELT $ 28))
                                        (QREFELT $ 27)))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z| |result| $))
                                 (SPADCALL |l0| (QREFELT $ 42))
                                 (EXIT |result|)))))))
                   (#4#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT $ 49))
                                     (QREFELT $ 38)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                                  (SPADCALL 6 |abs_z| (QREFELT $ 50))
                                  (QREFELT $ 51))
                        (SEQ (LETT |l| (+ |l| 5))
                             (COND
                              ((OR
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |one| (QREFELT $ 27))
                                            (QREFELT $ 49))
                                  (QREFELT $ 38))
                                 (SPADCALL (|spadConstant| $ 15) 4
                                           (QREFELT $ 39))
                                 (QREFELT $ 41))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |z| |one| (QREFELT $ 27)) |one|
                                    (QREFELT $ 27))
                                   (QREFELT $ 49))
                                  (QREFELT $ 38))
                                 (SPADCALL (|spadConstant| $ 15) 4
                                           (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (LETT |l| (* 2 |l|))))
                             (SPADCALL |l| (QREFELT $ 42))
                             (LETT |result|
                                   (|FSFUN;logGamma_lift| |z|
                                    (SPADCALL (SPADCALL |z| (QREFELT $ 47))
                                              (QREFELT $ 28))
                                    $))
                             (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))
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
                         (SPADCALL |l1| (QREFELT $ 42))
                         (LETT |result|
                               (|FSFUN;logGamma_asymptotic| |z|
                                (+ (QUOTIENT2 |l| 6) 1) $))
                         (SPADCALL |l0| (QREFELT $ 42))
                         (EXIT |result|)))))))))))
           (#4# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Gamma;2F;8| ((|x| |Float|) ($ |Float|))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 47))
                  (QREFELT $ 38))) 

(SDEFUN |FSFUN;logGamma;2F;9| ((|x| |Float|) ($ |Float|))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 61) (QREFELT $ 65))
          (|error| "Argument to logGamma <= 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 63))
                    (QREFELT $ 38))))) 

(SDEFUN |FSFUN;Beta;3C;10|
        ((|x| |Complex| (|Float|)) (|y| |Complex| (|Float|))
         ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT $ 36)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)))
                 (LETT |l1| (MAX 30 (+ |l0| 10)))
                 (SPADCALL |l1| (QREFELT $ 42))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                                  (SPADCALL |y| (QREFELT $ 47)) (QREFELT $ 9))
                        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 26))
                                  (QREFELT $ 47))
                        (QREFELT $ 8)))
                 (SPADCALL |l0| (QREFELT $ 42)) (EXIT |res|)))
           ('T (|error| "Beta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Beta;3F;11| ((|x| |Float|) (|y| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
                   (QREFELT $ 67))
         (QREFELT $ 38))) 

(SDEFUN |FSFUN;rabs;2F;12| ((|r| |Float|) ($ |Float|))
        (SPADCALL |r| (QREFELT $ 69))) 

(SDEFUN |FSFUN;rabs;CF;13| ((|r| |Complex| (|Float|)) ($ |Float|))
        (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (QREFELT $ 38))) 

(PUT '|FSFUN;rabs;2Df;14| '|SPADreplace| '|abs_DF|) 

(SDEFUN |FSFUN;rabs;2Df;14| ((|r| |DoubleFloat|) ($ |DoubleFloat|))
        (|abs_DF| |r|)) 

(SDEFUN |FSFUN;rabs;CDf;15| ((|r| |Complex| (|DoubleFloat|)) ($ |DoubleFloat|))
        (SPADCALL (SPADCALL |r| (QREFELT $ 75)) (QREFELT $ 76))) 

(SDEFUN |FSFUN;digamma_euler_maclaurin|
        ((|a| |Complex| (|Float|)) (|n| |Integer|) (|m| |Integer|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|bk| (|Float|))
          (|ns1| (|Complex| (|Float|))) (|kfac| (|Float|)) (#1=#:G197 NIL)
          (|k| NIL) (|n2_inv| #2=(|Complex| (|Float|))) (|ns| #2#)
          (|na| (|Complex| (|Float|))) (|n1| (|Integer|)) (|ck| #2#)
          (#3=#:G196 NIL))
         (SEQ (LETT |res| (|spadConstant| $ 45))
              (SEQ (LETT |k| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (LETT |ck|
                          (SPADCALL (|spadConstant| $ 7)
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 33)) |a|
                                              (QREFELT $ 26))
                                    (QREFELT $ 8)))
                    (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT $ 26)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |n1| (+ |n| 1))
              (LETT |na|
                    (SPADCALL (SPADCALL |n1| (QREFELT $ 33)) |a|
                              (QREFELT $ 26)))
              (LETT |ns| (SPADCALL (|spadConstant| $ 7) |na| (QREFELT $ 8)))
              (LETT |ns1| (|spadConstant| $ 7))
              (LETT |res|
                    (SPADCALL
                     (SPADCALL |res|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 15) 2
                                          (QREFELT $ 39))
                                |ns| (QREFELT $ 30))
                               (QREFELT $ 26))
                     (SPADCALL |na| (QREFELT $ 28)) (QREFELT $ 27)))
              (LETT |n2_inv|
                    (SPADCALL (|spadConstant| $ 7)
                              (SPADCALL |na| |na| (QREFELT $ 9))
                              (QREFELT $ 8)))
              (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (LETT |kfac|
                          (SPADCALL (SPADCALL 2 |k| (QREFELT $ 18))
                                    (QREFELT $ 19)))
                    (LETT |ns1| (SPADCALL |n2_inv| |ns1| (QREFELT $ 9)))
                    (LETT |bk|
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |k| (QREFELT $ 18))
                                     (QREFELT $ 22))
                           (QREFELT $ 23)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |bk| |kfac| (QREFELT $ 20))
                                      |ns1| (QREFELT $ 30))
                                     (QREFELT $ 26)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 78)))))) 

(SDEFUN |FSFUN;digamma_aux|
        ((|a| |Complex| (|Float|)) (|l| |Integer|) ($ |Complex| (|Float|)))
        (SPROG ((|abs_a| (|Float|)))
               (SEQ
                (LETT |abs_a|
                      (SPADCALL (SPADCALL |a| (QREFELT $ 79)) (QREFELT $ 80)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                             (SPADCALL 6 |abs_a| (QREFELT $ 50))
                             (QREFELT $ 51))
                   (|FSFUN;digamma_euler_maclaurin| |a| (+ (QUOTIENT2 |l| 6) 1)
                    (+ (QUOTIENT2 |l| 6) 1) $))
                  ('T
                   (|FSFUN;digamma_euler_maclaurin| |a| -1
                    (+ (QUOTIENT2 |l| 6) 1) $))))))) 

(SDEFUN |FSFUN;digamma;2C;18|
        ((|a| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|ap| (|Complex| (|Float|))) (|r_pi| (|Float|))
          (|a1| (|Complex| (|Float|))) (|re_aint| (|Float|))
          (|l| (|PositiveInteger|)) (|re_a| (|Float|))
          (|l0| (|PositiveInteger|)))
         (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)))
              (LETT |l| (MAX (+ |l0| 10) 61))
              (EXIT
               (|finally|
                (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT $ 38)))
                     (EXIT
                      (COND
                       ((SPADCALL |re_a|
                                  (SPADCALL (|spadConstant| $ 15) 2
                                            (QREFELT $ 39))
                                  (QREFELT $ 41))
                        (SEQ (LETT |l| (+ |l| 5))
                             (SPADCALL
                              (+
                               (+ |l|
                                  (SPADCALL 3 (INTEGER-LENGTH |l|)
                                            (QREFELT $ 57)))
                               10)
                              (QREFELT $ 42))
                             (LETT |re_aint| (SPADCALL |re_a| (QREFELT $ 43)))
                             (LETT |a1|
                                   (SPADCALL |a|
                                             (SPADCALL |re_aint|
                                                       (|spadConstant| $ 61)
                                                       (QREFELT $ 62))
                                             (QREFELT $ 27)))
                             (EXIT
                              (COND
                               ((SPADCALL |a1| (|spadConstant| $ 45)
                                          (QREFELT $ 46))
                                (|error| "Pole of Gamma"))
                               (#1='T
                                (SEQ (LETT |r_pi| (SPADCALL (QREFELT $ 59)))
                                     (LETT |ap|
                                           (SPADCALL |r_pi| |a1|
                                                     (QREFELT $ 30)))
                                     (EXIT
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |r_pi|
                                                   (SPADCALL |ap|
                                                             (QREFELT $ 81))
                                                   (QREFELT $ 30))
                                         (SPADCALL |ap| (QREFELT $ 48))
                                         (QREFELT $ 8))
                                        (QREFELT $ 78))
                                       (|FSFUN;digamma_aux|
                                        (SPADCALL (|spadConstant| $ 7) |a|
                                                  (QREFELT $ 27))
                                        |l| $)
                                       (QREFELT $ 26)))))))))
                       (#1#
                        (SEQ
                         (SPADCALL
                          (+
                           (+ |l|
                              (SPADCALL 3 (INTEGER-LENGTH |l|) (QREFELT $ 57)))
                           10)
                          (QREFELT $ 42))
                         (EXIT (|FSFUN;digamma_aux| |a| |l| $)))))))
                (SPADCALL |l0| (QREFELT $ 42))))))) 

(SDEFUN |FSFUN;digamma;2F;19| ((|z| |Float|) ($ |Float|))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| $ 61) (QREFELT $ 62))
                   (QREFELT $ 82))
         (QREFELT $ 38))) 

(SDEFUN |FSFUN;li2_series|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|ck| (|Float|)) (|k2| (|Integer|))
          (|k| (|Integer|)) (#1=#:G212 NIL) (|i| NIL) (|n| (|Integer|))
          (|oz| (|Integer|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 79)))
              (LETT |oz| (SPADCALL |nz| (QREFELT $ 52)))
              (LETT |n|
                    (COND
                     ((< |oz| -200)
                      (+
                       (QUOTIENT2 (SPADCALL 2 |prec| (QREFELT $ 57))
                                  (- (- |oz|) 1))
                       1))
                     ('T
                      (+
                       (SPADCALL
                        (SPADCALL
                         (|mul_DF|
                          (FLOAT (SPADCALL 2 |prec| (QREFELT $ 57))
                                 MOST-POSITIVE-DOUBLE-FLOAT)
                          (|minus_DF|
                           (|div_DF|
                            (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT $ 84))
                            (SPADCALL (SPADCALL |nz| (QREFELT $ 85))
                                      (QREFELT $ 84)))))
                         (QREFELT $ 86))
                        (QREFELT $ 87))
                       1))))
              (LETT |res| (|spadConstant| $ 45))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |k| (- (+ |n| 2) |i|)) (LETT |k2| (* |k| |k|))
                        (LETT |ck|
                              (SPADCALL (|spadConstant| $ 15)
                                        (SPADCALL |k2| (QREFELT $ 19))
                                        (QREFELT $ 20)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |z|
                                         (SPADCALL |res|
                                                   (SPADCALL |ck|
                                                             (|spadConstant| $
                                                                             61)
                                                             (QREFELT $ 62))
                                                   (QREFELT $ 26))
                                         (QREFELT $ 9)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z|
                         (SPADCALL (|spadConstant| $ 7) |res| (QREFELT $ 26))
                         (QREFELT $ 9)))))) 

(SDEFUN |FSFUN;li2_aux|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|lz1| #1=(|Complex| (|Float|))) (|nz1| #2=(|Float|)) (|lz| #1#)
          (|lmz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|))
          (|z1| (|Complex| (|Float|))) (|nz| #2#) (|dd| #2#)
          (|w| (|Complex| (|Float|))) (|siz| (|Float|)) (|iz| (|Float|))
          (|rz| (|Float|)))
         (SEQ (LETT |rz| (SPADCALL |z| (QREFELT $ 38)))
              (LETT |iz| (SPADCALL |z| (QREFELT $ 58)))
              (LETT |siz|
                    (COND
                     ((SPADCALL |iz| (|spadConstant| $ 61) (QREFELT $ 51))
                      (|spadConstant| $ 15))
                     (#3='T (SPADCALL (|spadConstant| $ 15) (QREFELT $ 34)))))
              (LETT |w|
                    (SPADCALL (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                              (SPADCALL
                               (SPADCALL |siz|
                                         (SPADCALL (|spadConstant| $ 15) 2
                                                   (QREFELT $ 39))
                                         (QREFELT $ 24))
                               (SPADCALL (SPADCALL 3 (QREFELT $ 19))
                                         (QREFELT $ 80))
                               (QREFELT $ 24))
                              (QREFELT $ 62)))
              (LETT |dd|
                    (SPADCALL (SPADCALL |z| |w| (QREFELT $ 27))
                              (QREFELT $ 79)))
              (EXIT
               (COND
                ((SPADCALL |dd|
                           (SPADCALL (|spadConstant| $ 15) 8 (QREFELT $ 39))
                           (QREFELT $ 41))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                            (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT $ 9))
                             (+ |prec| 2) $)
                            (QREFELT $ 30))
                  (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT $ 78)) (+ |prec| 2)
                   $)
                  (QREFELT $ 27)))
                (#3#
                 (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 79)))
                      (LETT |z1|
                            (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 27)))
                      (LETT |rpi| (SPADCALL (QREFELT $ 59)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 15) 6 (QREFELT $ 39))
                              |rpi| (QREFELT $ 24))
                             |rpi| (QREFELT $ 24)))
                      (EXIT
                       (COND
                        ((SPADCALL |rz|
                                   (SPADCALL (|spadConstant| $ 15) 2
                                             (QREFELT $ 39))
                                   (QREFELT $ 51))
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT $ 79)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| $ 15)
                                           (QREFELT $ 89))
                                 (SEQ
                                  (LETT |lmz|
                                        (SPADCALL (SPADCALL |z| (QREFELT $ 78))
                                                  (QREFELT $ 28)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |pi_fac| (QREFELT $ 25))
                                      (QREFELT $ 78))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 15) 2
                                                 (QREFELT $ 39))
                                       |lmz| (QREFELT $ 30))
                                      |lmz| (QREFELT $ 9))
                                     (QREFELT $ 27))
                                    (|FSFUN;li2_series|
                                     (SPADCALL (|spadConstant| $ 7) |z|
                                               (QREFELT $ 8))
                                     |prec| $)
                                    (QREFELT $ 27)))))
                                (#3#
                                 (SEQ (LETT |lz| (SPADCALL |z| (QREFELT $ 28)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |z1| (|spadConstant| $ 45)
                                                   (QREFELT $ 46))
                                         (SPADCALL |pi_fac| (QREFELT $ 25)))
                                        (#3#
                                         (SEQ
                                          (LETT |lz1|
                                                (SPADCALL |z1| (QREFELT $ 28)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |nz|
                                                       (|spadConstant| $ 15)
                                                       (QREFELT $ 89))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT $ 25))
                                               (SPADCALL |lz|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            15)
                                                            2 (QREFELT $ 39))
                                                           |lz| (QREFELT $ 30))
                                                          |lz1| (QREFELT $ 27))
                                                         (QREFELT $ 9))
                                               (QREFELT $ 26))
                                              (|FSFUN;li2_series|
                                               (SPADCALL
                                                (SPADCALL |z1| |z|
                                                          (QREFELT $ 8))
                                                (QREFELT $ 78))
                                               |prec| $)
                                              (QREFELT $ 26)))
                                            (#3#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT $ 25))
                                               (SPADCALL |lz| |lz1|
                                                         (QREFELT $ 9))
                                               (QREFELT $ 27))
                                              (|FSFUN;li2_series| |z1| |prec|
                                               $)
                                              (QREFELT $ 27)))))))))))))))
                        ((SPADCALL |nz| (|spadConstant| $ 15) (QREFELT $ 89))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 25))
                                     (QREFELT $ 78))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                             (SPADCALL |z1| (QREFELT $ 28)) (QREFELT $ 30))
                            (SPADCALL
                             (SPADCALL |z1| (SPADCALL |z| |z| (QREFELT $ 9))
                                       (QREFELT $ 8))
                             (QREFELT $ 28))
                            (QREFELT $ 9))
                           (QREFELT $ 26))
                          (|FSFUN;li2_series|
                           (SPADCALL (|spadConstant| $ 7) |z1| (QREFELT $ 8))
                           |prec| $)
                          (QREFELT $ 26)))
                        (#3#
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT $ 79)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| $ 15)
                                           (QREFELT $ 89))
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT $ 28)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 15) 2
                                                 (QREFELT $ 39))
                                       |lz1| (QREFELT $ 30))
                                      |lz1| (QREFELT $ 9))
                                     (QREFELT $ 78))
                                    (|FSFUN;li2_series|
                                     (SPADCALL
                                      (SPADCALL |z| |z1| (QREFELT $ 8))
                                      (QREFELT $ 78))
                                     |prec| $)
                                    (QREFELT $ 27)))))
                                (#3#
                                 (|FSFUN;li2_series| |z| |prec| $))))))))))))))) 

(SDEFUN |FSFUN;li2;2C;22| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 37)))
                    (LETT |prec| (+ |obits| 5))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 42))
                           (EXIT (|FSFUN;li2_aux| |z| |prec| $)))
                      (SPADCALL |obits| (QREFELT $ 42))))))) 

(SDEFUN |FSFUN;dilog_aux|
        ((|z| |Complex| (|Float|)) (|prec| |Integer|) ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|lz1| #1=(|Complex| (|Float|)))
          (|lz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 79)))
              (EXIT
               (COND
                ((SPADCALL |nz|
                           (SPADCALL (|spadConstant| $ 15) 4 (QREFELT $ 39))
                           (QREFELT $ 41))
                 (SEQ (LETT |rpi| (SPADCALL (QREFELT $ 59)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 15) 6 (QREFELT $ 39))
                              |rpi| (QREFELT $ 24))
                             |rpi| (QREFELT $ 24)))
                      (EXIT
                       (COND
                        ((SPADCALL |z| (|spadConstant| $ 45) (QREFELT $ 46))
                         (SPADCALL |pi_fac| (QREFELT $ 25)))
                        (#2='T
                         (SEQ (LETT |lz| (SPADCALL |z| (QREFELT $ 28)))
                              (LETT |lz1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 7) |z|
                                               (QREFELT $ 27))
                                     (QREFELT $ 28)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT $ 25))
                                       (SPADCALL |lz| |lz1| (QREFELT $ 9))
                                       (QREFELT $ 27))
                                      (|FSFUN;li2_series| |z| |prec| $)
                                      (QREFELT $ 27))))))))))
                (#2#
                 (|FSFUN;li2_aux|
                  (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 27)) |prec|
                  $))))))) 

(SDEFUN |FSFUN;dilog;2C;24| ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 37)))
                    (LETT |prec| (+ |obits| 5))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 42))
                           (EXIT (|FSFUN;dilog_aux| |z| |prec| $)))
                      (SPADCALL |obits| (QREFELT $ 42))))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4F;25|
        ((|x| |Float|) (|w| |Float|) (|eps| |Float|) ($ |Float|))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G236 NIL) (|dw| (|Float|)) (|ew| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| $ 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 35)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT $ 20))
                                            (QREFELT $ 53))
                                  (SPADCALL |w| (|spadConstant| $ 15)
                                            (QREFELT $ 55))
                                  (QREFELT $ 20)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 53)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT $ 41))
                              (PROGN (LETT #1# |w|) (GO #2=#:G235)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 70)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4F;26|
        ((|lz| |Float|) (|w| |Float|) (|eps| |Float|) ($ |Float|))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G241 NIL) (|dw| (|Float|)) (|lw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| $ 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 31)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 55))
                                            |lz| (QREFELT $ 53))
                                  (SPADCALL (|spadConstant| $ 15)
                                            (SPADCALL (|spadConstant| $ 15) |w|
                                                      (QREFELT $ 20))
                                            (QREFELT $ 55))
                                  (QREFELT $ 20)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 53)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT $ 41))
                              (PROGN (LETT #1# |w|) (GO #2=#:G240)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 70)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3F;27|
        ((|h| |Float|) (|h2| |Float|) ($ |Float|))
        (SPROG ((|res| (|Float|)) (|h4| #1=(|Float|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (SPADCALL |h|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 3 (QREFELT $ 12))
                                           (QREFELT $ 23))
                                 |h2| (QREFELT $ 24))
                                (QREFELT $ 53)))
                (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 24)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                           (QREFELT $ 23))
                                 |h3| (QREFELT $ 24))
                                (QREFELT $ 55)))
                (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 24)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                           (QREFELT $ 23))
                                 |h4| (QREFELT $ 24))
                                (QREFELT $ 53)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                            (QREFELT $ 23))
                                  |h3| (QREFELT $ 24))
                                 |h2| (QREFELT $ 24))
                                (QREFELT $ 55)))
                (EXIT
                 (SPADCALL |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                                       (QREFELT $ 23))
                             |h4| (QREFELT $ 24))
                            |h2| (QREFELT $ 24))
                           (QREFELT $ 53)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CFC;28|
        ((|x| |Complex| (|Float|)) (|w| |Complex| (|Float|)) (|eps| |Float|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G248 NIL) (|dw| (|Complex| (|Float|)))
          (|ew| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| $ 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 32)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT $ 8))
                                            (QREFELT $ 27))
                                  (SPADCALL |w| (|spadConstant| $ 7)
                                            (QREFELT $ 26))
                                  (QREFELT $ 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 27)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT $ 41))
                              (PROGN (LETT #1# |w|) (GO #2=#:G247)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 71)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CFC;29|
        ((|lz| |Complex| (|Float|)) (|w| |Complex| (|Float|)) (|eps| |Float|)
         ($ |Complex| (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G253 NIL) (|dw| (|Complex| (|Float|)))
          (|lw| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| $ 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 28)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 26))
                                            |lz| (QREFELT $ 27))
                                  (SPADCALL (|spadConstant| $ 7)
                                            (SPADCALL (|spadConstant| $ 7) |w|
                                                      (QREFELT $ 8))
                                            (QREFELT $ 26))
                                  (QREFELT $ 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 27)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT $ 41))
                              (PROGN (LETT #1# |w|) (GO #2=#:G252)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 71)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;30|
        ((|h| |Complex| (|Float|)) (|h2| |Complex| (|Float|))
         ($ |Complex| (|Float|)))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|h4| #1=(|Complex| (|Float|)))
          (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT $ 12))
                                     (QREFELT $ 13))
                           |h2| (QREFELT $ 9))
                          (QREFELT $ 27)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                     (QREFELT $ 13))
                           |h3| (QREFELT $ 9))
                          (QREFELT $ 26)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                     (QREFELT $ 13))
                           |h4| (QREFELT $ 9))
                          (QREFELT $ 27)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                      (QREFELT $ 13))
                            |h3| (QREFELT $ 9))
                           |h2| (QREFELT $ 9))
                          (QREFELT $ 26)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                                 (QREFELT $ 13))
                       |h4| (QREFELT $ 9))
                      |h2| (QREFELT $ 9))
                     (QREFELT $ 27)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4Df;31|
        ((|x| |DoubleFloat|) (|w| |DoubleFloat|) (|eps| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G260 NIL) (|dw| (|DoubleFloat|))
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
                              (PROGN (LETT #1# |w|) (GO #2=#:G259)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4Df;32|
        ((|lz| |DoubleFloat|) (|w| |DoubleFloat|) (|eps| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G265 NIL) (|dw| (|DoubleFloat|))
          (|lw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 84)))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                           (|add_DF| 1.0 (|div_DF| 1.0 |w|))))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G264)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 73)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3Df;33|
        ((|h| |DoubleFloat|) (|h2| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG ((|res| (|DoubleFloat|)) (|h4| #1=(|DoubleFloat|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (|sub_DF| |h|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 1 3 (QREFELT $ 12))
                                           (QREFELT $ 100))
                                 |h2|)))
                (LETT |h3| (|mul_DF| |h| |h2|))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                           (QREFELT $ 100))
                                 |h3|)))
                (LETT |h4| (|mul_DF| |h2| |h2|))
                (LETT |res|
                      (|sub_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                           (QREFELT $ 100))
                                 |h4|)))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (|mul_DF|
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                            (QREFELT $ 100))
                                  |h3|)
                                 |h2|)))
                (EXIT
                 (|sub_DF| |res|
                           (|mul_DF|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                                       (QREFELT $ 100))
                             |h4|)
                            |h2|)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CDfC;34|
        ((|x| |Complex| (|DoubleFloat|)) (|w| |Complex| (|DoubleFloat|))
         (|eps| |DoubleFloat|) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G272 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|ew| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 102)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT $ 103))
                                            (QREFELT $ 104))
                                  (SPADCALL |w| (|spadConstant| $ 105)
                                            (QREFELT $ 106))
                                  (QREFELT $ 103)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 104)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G271)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 77)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CDfC;35|
        ((|lz| |Complex| (|DoubleFloat|)) (|w| |Complex| (|DoubleFloat|))
         (|eps| |DoubleFloat|) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G277 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|lw| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 108)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 106))
                                            |lz| (QREFELT $ 104))
                                  (SPADCALL (|spadConstant| $ 105)
                                            (SPADCALL (|spadConstant| $ 105)
                                                      |w| (QREFELT $ 103))
                                            (QREFELT $ 106))
                                  (QREFELT $ 103)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 104)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G276)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT $ 77)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;36|
        ((|h| |Complex| (|DoubleFloat|)) (|h2| |Complex| (|DoubleFloat|))
         ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|res| (|Complex| (|DoubleFloat|)))
          (|h4| #1=(|Complex| (|DoubleFloat|))) (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT $ 12))
                                     (QREFELT $ 110))
                           |h2| (QREFELT $ 111))
                          (QREFELT $ 104)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 111)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                     (QREFELT $ 110))
                           |h3| (QREFELT $ 111))
                          (QREFELT $ 106)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 111)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                     (QREFELT $ 110))
                           |h4| (QREFELT $ 111))
                          (QREFELT $ 104)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                      (QREFELT $ 110))
                            |h3| (QREFELT $ 111))
                           |h2| (QREFELT $ 111))
                          (QREFELT $ 106)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                                 (QREFELT $ 110))
                       |h4| (QREFELT $ 111))
                      |h2| (QREFELT $ 111))
                     (QREFELT $ 104)))))) 

(SDEFUN |FSFUN;lambertW;2Df;37| ((|x| |DoubleFloat|) ($ |DoubleFloat|))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|ax| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|h2| (|DoubleFloat|)) (|e1| (|DoubleFloat|)) (|w| (|DoubleFloat|))
          (|y| #1=(|DoubleFloat|)) (|lx| #1#) (|ox| (|Integer|)))
         (SEQ
          (COND ((|eql_DF| |x| 0.0) |x|)
                (#2='T
                 (SEQ (LETT |eps| (SPADCALL 1 -35 (QREFELT $ 113)))
                      (LETT |ox| (SPADCALL |x| (QREFELT $ 114)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((SPADCALL |ox| 200 (QREFELT $ 115))
                                 (COND
                                  ((SPADCALL |x| 0.0 (QREFELT $ 116))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT $ 84)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT $ 99)))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |x|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT $ 116))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT $ 84)))
                                        (EXIT
                                         (|sub_DF| |y|
                                                   (SPADCALL |y|
                                                             (QREFELT $
                                                                      84))))))
                                      (#2# (|mul_DF| (|div_DF_I| 1.0 2) |x|))))
                               (EXIT
                                (COND
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190436 517656
                                                         (QREFELT $ 12))
                                               (QREFELT $ 117))
                                              (QREFELT $ 100)))
                                  (|error| "x < -exp(-1)"))
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 231087 628160
                                                         (QREFELT $ 12))
                                               (QREFELT $ 117))
                                              (QREFELT $ 100)))
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
                                                            (QREFELT $ 118))
                                                  |e1|))
                                           (LETT |h|
                                                 (SPADCALL |h2|
                                                           (QREFELT $ 119)))
                                           (EXIT
                                            (|sub_DF|
                                             (SPADCALL |h| |h2|
                                                       (QREFELT $ 101))
                                             1.0))))))))
                                 (#2#
                                  (SEQ
                                   (COND
                                    ((|less_DF| (LETT |ax| (|abs_DF| |x|))
                                                (|div_DF_I| 1.0 2))
                                     (LETT |eps| (|mul_DF| |ax| |eps|))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT $ 98))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;38|
        ((|x| |Complex| (|DoubleFloat|)) ($ |Complex| (|DoubleFloat|)))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|w| #1=(|Complex| (|DoubleFloat|)))
          (|y| (|Complex| (|DoubleFloat|))) (|h| (|Complex| (|DoubleFloat|)))
          (|h2| #1#) (|e1| (|DoubleFloat|)) (|lz| (|Complex| (|DoubleFloat|)))
          (|ox| (|Integer|)) (|ax| (|DoubleFloat|)) (|ix| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| $ 121) (QREFELT $ 122)) |x|)
                (#2='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 76)))
                      (LETT |ix| (SPADCALL |x| (QREFELT $ 123)))
                      (LETT |ax| (|add_DF| (|abs_DF| |rx|) (|abs_DF| |ix|)))
                      (LETT |eps| (SPADCALL 1 -35 (QREFELT $ 113)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT $ 114)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             ((SPADCALL |ox| 200 (QREFELT $ 115))
                              (SEQ
                               (LETT |lz|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ax| (QREFELT $ 84))
                                                0.0 (QREFELT $ 124))
                                      (SPADCALL
                                       (SPADCALL (|div_DF| |rx| |ax|)
                                                 (|div_DF| |ix| |ax|)
                                                 (QREFELT $ 124))
                                       (QREFELT $ 108))
                                      (QREFELT $ 106)))
                               (EXIT
                                (SPADCALL |lz| |lz| |eps| (QREFELT $ 109)))))
                             (#2#
                              (SEQ
                               (COND
                                ((|less_DF| (|abs_DF| |ix|)
                                            (SPADCALL
                                             (SPADCALL 1 4194304
                                                       (QREFELT $ 12))
                                             (QREFELT $ 100)))
                                 (COND
                                  ((|less_DF| |rx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 231087 628160
                                                          (QREFELT $ 12))
                                                (QREFELT $ 117))
                                               (QREFELT $ 100)))
                                   (COND
                                    ((|less_DF|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 56258 152925 (QREFELT $ 12))
                                        (QREFELT $ 117))
                                       (QREFELT $ 100))
                                      |rx|)
                                     (EXIT
                                      (SEQ
                                       (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2|
                                             (SPADCALL
                                              (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                        (QREFELT $ 118))
                                              (SPADCALL |x|
                                                        (SPADCALL |e1| 0.0
                                                                  (QREFELT $
                                                                           124))
                                                        (QREFELT $ 106))
                                              (QREFELT $ 125)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT $ 126)))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |h| |h2| (QREFELT $ 112))
                                         (|spadConstant| $ 105)
                                         (QREFELT $ 104)))))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |ax|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT $ 116))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT $ 108)))
                                        (EXIT
                                         (SPADCALL |y|
                                                   (SPADCALL |y|
                                                             (QREFELT $ 108))
                                                   (QREFELT $ 104)))))
                                      (#2#
                                       (SPADCALL (|div_DF_I| 1.0 2) |x|
                                                 (QREFELT $ 125)))))
                               (COND
                                ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                                 (LETT |eps| (|mul_DF| |ax| |eps|))))
                               (EXIT
                                (SPADCALL |x| |w| |eps|
                                          (QREFELT $ 107))))))))))))) 

(SDEFUN |FSFUN;lambertW;2F;39| ((|x| |Float|) ($ |Float|))
        (SPROG
         ((|eps| (|Float|)) (|w| (|Float|)) (|y| #1=(|Float|)) (|w1| (|Float|))
          (|h| (|Float|)) (|h2| (|Float|)) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|lx| #1#) (|ox| (|Integer|))
          (|ax| (|Float|)) (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| $ 61) (QREFELT $ 128)) |x|)
                (#2='T
                 (SEQ (LETT |cbit| (SPADCALL (QREFELT $ 37)))
                      (LETT |eps|
                            (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                      (QREFELT $ 129)))
                      (LETT |ax| (SPADCALL |x| (QREFELT $ 69)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT $ 52)))
                      (EXIT
                       (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((SPADCALL |ox| 200 (QREFELT $ 115))
                                 (COND
                                  ((SPADCALL |x| (|spadConstant| $ 61)
                                             (QREFELT $ 51))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT $ 31)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT $ 93)))))))))
                               (EXIT
                                (COND
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL 190436 517656
                                                        (QREFELT $ 12))
                                              (QREFELT $ 117))
                                             (QREFELT $ 23))
                                            (QREFELT $ 41))
                                  (|error| "x < -exp(-1)"))
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL 190434 517656
                                                        (QREFELT $ 12))
                                              (QREFELT $ 117))
                                             (QREFELT $ 23))
                                            (QREFELT $ 41))
                                  (SEQ (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                       (SPADCALL (+ |cbit| |cbit2|)
                                                 (QREFELT $ 42))
                                       (LETT |e1|
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 15)
                                                        (QREFELT $ 34))
                                              (QREFELT $ 35)))
                                       (LETT |h2|
                                             (SPADCALL |x| |e1|
                                                       (QREFELT $ 55)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT $ 80)))
                                       (SPADCALL |cbit| (QREFELT $ 42))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |h2| (|spadConstant| $ 61)
                                                    (QREFELT $ 41))
                                          (|error| "x < -exp(-1)"))
                                         (#2#
                                          (SEQ
                                           (LETT |w1|
                                                 (SPADCALL |h| |h2|
                                                           (QREFELT $ 94)))
                                           (EXIT
                                            (COND
                                             ((< (SPADCALL |w1| (QREFELT $ 52))
                                                 (- |cbit2|))
                                              (SPADCALL |w1|
                                                        (|spadConstant| $ 15)
                                                        (QREFELT $ 53)))
                                             (#2#
                                              (SPADCALL |x|
                                                        (SPADCALL |w1|
                                                                  (|spadConstant|
                                                                   $ 15)
                                                                  (QREFELT $
                                                                           53))
                                                        |eps|
                                                        (QREFELT $
                                                                 92)))))))))))
                                 (#2#
                                  (SEQ
                                   (LETT |w|
                                         (COND
                                          ((SPADCALL |x|
                                                     (SPADCALL 2
                                                               (QREFELT $ 19))
                                                     (QREFELT $ 51))
                                           (SEQ
                                            (LETT |y|
                                                  (SPADCALL |x|
                                                            (QREFELT $ 31)))
                                            (EXIT
                                             (SPADCALL |y|
                                                       (SPADCALL |y|
                                                                 (QREFELT $
                                                                          31))
                                                       (QREFELT $ 53)))))
                                          (#2#
                                           (SPADCALL
                                            (SPADCALL 5 -1 10 (QREFELT $ 130))
                                            |x| (QREFELT $ 24)))))
                                   (COND
                                    ((SPADCALL (SPADCALL |x| (QREFELT $ 69))
                                               (SPADCALL
                                                (SPADCALL 1 2 (QREFELT $ 12))
                                                (QREFELT $ 23))
                                               (QREFELT $ 41))
                                     (LETT |eps|
                                           (SPADCALL |ax| |eps|
                                                     (QREFELT $ 24)))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT $ 92))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;40|
        ((|z| |Complex| (|Float|)) ($ |Complex| (|Float|)))
        (SPROG
         ((|w1| (|Complex| (|Float|))) (|h| (|Complex| (|Float|)))
          (|h2| (|Complex| (|Float|))) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|eps| (|Float|))
          (|w| (|Complex| (|Float|))) (|wd| (|Complex| (|DoubleFloat|)))
          (|izd| (|DoubleFloat|)) (|rzd| (|DoubleFloat|))
          (|lz| (|Complex| (|Float|))) (|oz| (|Integer|)) (|abs_z| (|Float|))
          (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |z| (|spadConstant| $ 45) (QREFELT $ 46)) |z|)
                (#1='T
                 (SEQ (LETT |cbit| (SPADCALL (QREFELT $ 37)))
                      (LETT |eps|
                            (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                      (QREFELT $ 129)))
                      (LETT |abs_z| (SPADCALL |z| (QREFELT $ 71)))
                      (LETT |oz| (SPADCALL |abs_z| (QREFELT $ 52)))
                      (EXIT
                       (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                             ((SPADCALL |oz| 200 (QREFELT $ 115))
                              (SEQ (LETT |lz| (SPADCALL |z| (QREFELT $ 28)))
                                   (EXIT
                                    (SPADCALL |lz| |lz| |eps|
                                              (QREFELT $ 96)))))
                             (#1#
                              (SEQ
                               (LETT |rzd|
                                     (SPADCALL (SPADCALL |z| (QREFELT $ 38))
                                               (QREFELT $ 132)))
                               (COND
                                ((OR
                                  (SPADCALL (SPADCALL |z| (QREFELT $ 58))
                                            (SPADCALL (|spadConstant| $ 15)
                                                      1000000 (QREFELT $ 39))
                                            (QREFELT $ 51))
                                  (OR
                                   (|less_DF| |rzd|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190436 517656
                                                          (QREFELT $ 12))
                                                (QREFELT $ 117))
                                               (QREFELT $ 100)))
                                   (SPADCALL |rzd|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190434 517656
                                                         (QREFELT $ 12))
                                               (QREFELT $ 117))
                                              (QREFELT $ 100))
                                             (QREFELT $ 116))))
                                 (EXIT
                                  (SEQ
                                   (LETT |izd|
                                         (SPADCALL
                                          (SPADCALL |z| (QREFELT $ 58))
                                          (QREFELT $ 132)))
                                   (LETT |wd|
                                         (SPADCALL
                                          (SPADCALL |rzd| |izd|
                                                    (QREFELT $ 124))
                                          (QREFELT $ 127)))
                                   (LETT |w|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |wd| (QREFELT $ 76))
                                           (QREFELT $ 133))
                                          (SPADCALL
                                           (SPADCALL |wd| (QREFELT $ 123))
                                           (QREFELT $ 133))
                                          (QREFELT $ 62)))
                                   (COND
                                    ((SPADCALL |abs_z|
                                               (SPADCALL (|spadConstant| $ 15)
                                                         2 (QREFELT $ 39))
                                               (QREFELT $ 41))
                                     (LETT |eps|
                                           (SPADCALL |abs_z| |eps|
                                                     (QREFELT $ 24)))))
                                   (EXIT
                                    (SPADCALL |z| |w| |eps|
                                              (QREFELT $ 95)))))))
                               (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                               (SPADCALL (+ |cbit| |cbit2|) (QREFELT $ 42))
                               (LETT |e1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 15)
                                                (QREFELT $ 34))
                                      (QREFELT $ 35)))
                               (LETT |h2|
                                     (SPADCALL |z|
                                               (SPADCALL |e1|
                                                         (|spadConstant| $ 61)
                                                         (QREFELT $ 62))
                                               (QREFELT $ 26)))
                               (LETT |h| (SPADCALL |h2| (QREFELT $ 134)))
                               (SPADCALL |cbit| (QREFELT $ 42))
                               (LETT |w1| (SPADCALL |h| |h2| (QREFELT $ 97)))
                               (EXIT
                                (COND
                                 ((<
                                   (SPADCALL (SPADCALL |h2| (QREFELT $ 71))
                                             (QREFELT $ 52))
                                   (- |cbit2|))
                                  (SPADCALL |w1| (|spadConstant| $ 7)
                                            (QREFELT $ 27)))
                                 (#1#
                                  (SPADCALL |z|
                                            (SPADCALL |w1| (|spadConstant| $ 7)
                                                      (QREFELT $ 27))
                                            |eps| (QREFELT $ 95))))))))))))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G324)
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
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatSpecialFunctions|))
          (LETT $ (GETREFV 136))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 14) (0 . |One|) (4 . /)
              (10 . *) (|Integer|) (|Fraction| 10) (16 . /) (22 . |coerce|)
              (|Float|) (27 . |One|) (|PositiveInteger|) (|NonNegativeInteger|)
              (31 . *) (37 . |coerce|) (42 . /)
              (|IntegerNumberTheoryFunctions|) (48 . |bernoulli|)
              (53 . |coerce|) (58 . *) (64 . |coerce|) (69 . +) (75 . -)
              (81 . |log|) (86 . |pi|) (90 . *) (96 . |log|) (101 . |exp|)
              (106 . |coerce|) (111 . -) (116 . |exp|) (121 . |base|)
              (125 . |bits|) (129 . |real|) (134 . /) (|Boolean|) (140 . <)
              (146 . |bits|) (151 . |round|) (156 . |retract|) (161 . |Zero|)
              (165 . =) |FSFUN;Gamma;2C;5| (171 . |sin|) (176 . |abs|)
              (181 . *) (187 . >) (193 . |order|) (198 . -) (204 . |log2|)
              (208 . +) (214 . |wholePart|) (219 . *) (225 . |imag|)
              (230 . |pi|) (234 . |imaginary|) (238 . |Zero|) (242 . |complex|)
              |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8| (248 . <=)
              |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10| |FSFUN;Beta;3F;11|
              (254 . |abs|) |FSFUN;rabs;2F;12| |FSFUN;rabs;CF;13|
              (|DoubleFloat|) |FSFUN;rabs;2Df;14| (|Complex| 72) (259 . |abs|)
              (264 . |real|) |FSFUN;rabs;CDf;15| (269 . -) (274 . |norm|)
              (279 . |sqrt|) (284 . |cos|) |FSFUN;digamma;2C;18|
              |FSFUN;digamma;2F;19| (289 . |log|) (294 . |convert|)
              (299 . |round|) (304 . |retract|) (309 . |One|) (313 . >=)
              |FSFUN;li2;2C;22| |FSFUN;dilog;2C;24|
              |FSFUN;lambert_via_newton1;4F;25|
              |FSFUN;lambert_via_newton2;4F;26|
              |FSFUN;lambert_inverse_series;3F;27|
              |FSFUN;lambert_via_newton1;2CFC;28|
              |FSFUN;lambert_via_newton2;2CFC;29|
              |FSFUN;lambert_inverse_series;3C;30|
              |FSFUN;lambert_via_newton1;4Df;31|
              |FSFUN;lambert_via_newton2;4Df;32| (319 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;33| (324 . |exp|) (329 . /)
              (335 . -) (341 . |One|) (345 . +)
              |FSFUN;lambert_via_newton1;2CDfC;34| (351 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;35| (356 . |coerce|) (361 . *)
              |FSFUN;lambert_inverse_series;3C;36| (367 . |float|)
              (373 . |order|) (378 . >) (384 . >) (390 . -) (395 . *)
              (401 . |sqrt|) |FSFUN;lambertW;2Df;37| (406 . |Zero|) (410 . =)
              (416 . |imag|) (421 . |complex|) (427 . *) (433 . |sqrt|)
              |FSFUN;lambertW;2C;38| (438 . =) (444 . |float|) (450 . |float|)
              |FSFUN;lambertW;2F;39| (457 . |coerce|) (462 . |convert|)
              (467 . |sqrt|) |FSFUN;lambertW;2C;40|)
           '#(|rabs| 472 |logGamma| 492 |li2| 502 |lambert_via_newton2| 507
              |lambert_via_newton1| 535 |lambert_inverse_series| 563 |lambertW|
              587 |dilog| 607 |digamma| 612 |Gamma| 622 |Beta| 632)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 135
                                                 '(0 6 0 7 2 6 0 0 0 8 2 6 0 0
                                                   0 9 2 11 0 10 10 12 1 6 0 11
                                                   13 0 14 0 15 2 17 0 16 0 18
                                                   1 14 0 10 19 2 14 0 0 0 20 1
                                                   21 11 10 22 1 14 0 11 23 2
                                                   14 0 0 0 24 1 6 0 14 25 2 6
                                                   0 0 0 26 2 6 0 0 0 27 1 6 0
                                                   0 28 0 6 0 29 2 6 0 14 0 30
                                                   1 14 0 0 31 1 6 0 0 32 1 6 0
                                                   10 33 1 14 0 0 34 1 14 0 0
                                                   35 0 14 16 36 0 14 16 37 1 6
                                                   14 0 38 2 14 0 0 10 39 2 14
                                                   40 0 0 41 1 14 16 16 42 1 14
                                                   0 0 43 1 14 10 0 44 0 6 0 45
                                                   2 6 40 0 0 46 1 6 0 0 48 1 6
                                                   0 0 49 2 14 0 16 0 50 2 14
                                                   40 0 0 51 1 14 10 0 52 2 14
                                                   0 0 0 53 0 14 0 54 2 14 0 0
                                                   0 55 1 14 10 0 56 2 10 0 16
                                                   0 57 1 6 14 0 58 0 14 0 59 0
                                                   6 0 60 0 14 0 61 2 6 0 14 14
                                                   62 2 14 40 0 0 65 1 14 0 0
                                                   69 1 74 0 0 75 1 74 72 0 76
                                                   1 6 0 0 78 1 6 14 0 79 1 14
                                                   0 0 80 1 6 0 0 81 1 72 0 0
                                                   84 1 14 72 0 85 1 72 0 0 86
                                                   1 72 10 0 87 0 11 0 88 2 14
                                                   40 0 0 89 1 72 0 11 100 1 74
                                                   0 0 102 2 74 0 0 0 103 2 74
                                                   0 0 0 104 0 74 0 105 2 74 0
                                                   0 0 106 1 74 0 0 108 1 74 0
                                                   11 110 2 74 0 0 0 111 2 72 0
                                                   10 10 113 1 72 10 0 114 2 10
                                                   40 0 0 115 2 72 40 0 0 116 1
                                                   11 0 0 117 2 72 0 16 0 118 1
                                                   72 0 0 119 0 74 0 121 2 74
                                                   40 0 0 122 1 74 72 0 123 2
                                                   74 0 72 72 124 2 74 0 72 0
                                                   125 1 74 0 0 126 2 14 40 0 0
                                                   128 2 14 0 10 10 129 3 14 0
                                                   10 10 16 130 1 14 72 0 132 1
                                                   14 0 72 133 1 6 0 0 134 1 0
                                                   14 14 70 1 0 14 6 71 1 0 72
                                                   74 77 1 0 72 72 73 1 0 14 14
                                                   66 1 0 6 6 63 1 0 6 6 90 3 0
                                                   72 72 72 72 99 3 0 14 14 14
                                                   14 93 3 0 74 74 74 72 109 3
                                                   0 6 6 6 14 96 3 0 72 72 72
                                                   72 98 3 0 14 14 14 14 92 3 0
                                                   74 74 74 72 107 3 0 6 6 6 14
                                                   95 2 0 72 72 72 101 2 0 14
                                                   14 14 94 2 0 74 74 74 112 2
                                                   0 6 6 6 97 1 0 14 14 131 1 0
                                                   6 6 135 1 0 72 72 120 1 0 74
                                                   74 127 1 0 6 6 91 1 0 14 14
                                                   83 1 0 6 6 82 1 0 14 14 64 1
                                                   0 6 6 47 2 0 14 14 14 68 2 0
                                                   6 6 6 67)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatSpecialFunctions| 'NILADIC T) 
