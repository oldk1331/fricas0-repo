
(/VERSIONCHECK 2) 

(DEFUN |FSFUN;bernoulli_gamma_series| (|z| |n| $)
  (PROG (|s| |bk| |kinv| |zk| |k| |z2inv| |zinv|)
    (RETURN
     (SEQ
      (LETT |zinv| (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 8))
            . #1=(|FSFUN;bernoulli_gamma_series|))
      (LETT |zk| |zinv| . #1#)
      (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT $ 9)) . #1#)
      (LETT |s|
            (SPADCALL |zk|
                      (SPADCALL (SPADCALL 1 12 (QREFELT $ 12)) (QREFELT $ 13))
                      (QREFELT $ 9))
            . #1#)
      (SEQ (LETT |k| 1 . #1#) G190 (COND ((|greater_SI| |k| |n|) (GO G191)))
           (SEQ (LETT |zk| (SPADCALL |zk| |z2inv| (QREFELT $ 9)) . #1#)
                (LETT |kinv|
                      (SPADCALL (|spadConstant| $ 15)
                                (SPADCALL
                                 (* (+ (SPADCALL 2 |k| (QREFELT $ 18)) 2)
                                    (+ (SPADCALL 2 |k| (QREFELT $ 18)) 1))
                                 (QREFELT $ 19))
                                (QREFELT $ 20))
                      . #1#)
                (LETT |bk|
                      (SPADCALL
                       (SPADCALL (+ (SPADCALL 2 |k| (QREFELT $ 18)) 2)
                                 (QREFELT $ 22))
                       (QREFELT $ 23))
                      . #1#)
                (EXIT
                 (LETT |s|
                       (SPADCALL |s|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bk| |kinv| (QREFELT $ 24))
                                   (QREFELT $ 25))
                                  |zk| (QREFELT $ 9))
                                 (QREFELT $ 26))
                       . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |FSFUN;logGamma_a1| (|z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL |z| (SPADCALL (SPADCALL 1 2 (QREFELT $ 12)) (QREFELT $ 13))
               (QREFELT $ 27))
     (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 9))
    |z| (QREFELT $ 27))
   (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT $ 12)) (QREFELT $ 13))
             (SPADCALL
              (SPADCALL (SPADCALL 2 (QREFELT $ 19)) (SPADCALL (QREFELT $ 29))
                        (QREFELT $ 30))
              (QREFELT $ 28))
             (QREFELT $ 9))
   (QREFELT $ 26))) 

(DEFUN |FSFUN;logGamma_asymptotic| (|z| |n| $)
  (PROG (|lg1|)
    (RETURN
     (SEQ (LETT |lg1| (|FSFUN;logGamma_a1| |z| $) |FSFUN;logGamma_asymptotic|)
          (EXIT
           (SPADCALL |lg1| (|FSFUN;bernoulli_gamma_series| |z| |n| $)
                     (QREFELT $ 26))))))) 

(DEFUN |FSFUN;gamma_series| (|z| |l| |n| $)
  (PROG (|s| |tk| |k|)
    (RETURN
     (SEQ
      (LETT |tk|
            (SPADCALL
             (SPADCALL
              (SPADCALL |z|
                        (SPADCALL (SPADCALL |l| (QREFELT $ 31)) (QREFELT $ 25))
                        (QREFELT $ 9))
              (QREFELT $ 32))
             |z| (QREFELT $ 8))
            . #1=(|FSFUN;gamma_series|))
      (LETT |s| |tk| . #1#)
      (SEQ (LETT |k| 1 . #1#) G190 (COND ((|greater_SI| |k| |n|) (GO G191)))
           (SEQ
            (LETT |tk|
                  (SPADCALL
                   (SPADCALL |tk| (SPADCALL |l| (QREFELT $ 25)) (QREFELT $ 9))
                   (SPADCALL |z| (SPADCALL |k| (QREFELT $ 33)) (QREFELT $ 26))
                   (QREFELT $ 8))
                  . #1#)
            (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT $ 26)) . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |s|
                 (SPADCALL
                  (SPADCALL (SPADCALL |l| (QREFELT $ 34)) (QREFELT $ 35))
                  (QREFELT $ 25))
                 (QREFELT $ 9))))))) 

(DEFUN |FSFUN;Gamma;2C;5| (|z| $)
  (PROG (|result| |l1| #1=#:G158 |llog| #2=#:G156 #3=#:G154 |l1a| |len| |loss|
         |lz| #4=#:G153 |oz| #5=#:G152 |abs_z| |one| |c_pi| |sign| |z1|
         |re_zint| |re_z| |l| |l0|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL (QREFELT $ 36)) 2)
        (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)) . #6=(|FSFUN;Gamma;2C;5|))
             (LETT |l| (MAX (+ |l0| 5) 20) . #6#)
             (LETT |re_z| (SPADCALL |z| (QREFELT $ 38)) . #6#)
             (EXIT
              (COND
               ((SPADCALL |re_z|
                          (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                          (QREFELT $ 41))
                (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                     (LETT |re_zint| (SPADCALL |re_z| (QREFELT $ 43)) . #6#)
                     (LETT |z1|
                           (SPADCALL |z| (SPADCALL |re_zint| (QREFELT $ 25))
                                     (QREFELT $ 27))
                           . #6#)
                     (LETT |sign|
                           (COND
                            ((ODDP (SPADCALL |re_zint| (QREFELT $ 44)))
                             (SPADCALL (|spadConstant| $ 15) (QREFELT $ 34)))
                            (#7='T (|spadConstant| $ 15)))
                           . #6#)
                     (EXIT
                      (COND
                       ((SPADCALL |z1| (|spadConstant| $ 45) (QREFELT $ 46))
                        (SEQ (SPADCALL |l0| (QREFELT $ 42))
                             (EXIT (|error| "Pole of Gamma"))))
                       (#7#
                        (SEQ (LETT |c_pi| (SPADCALL (QREFELT $ 29)) . #6#)
                             (LETT |one| (|spadConstant| $ 7) . #6#)
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
                                    (QREFELT $ 8))
                                   . #6#)
                             (SPADCALL |l0| (QREFELT $ 42))
                             (EXIT |result|)))))))
               (#7#
                (SEQ
                 (LETT |abs_z|
                       (SPADCALL (SPADCALL |z| (QREFELT $ 49)) (QREFELT $ 38))
                       . #6#)
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                              (SPADCALL 6 |abs_z| (QREFELT $ 50))
                              (QREFELT $ 51))
                    (SEQ
                     (LETT |oz|
                           (PROG1
                               (LETT #5#
                                     (MAX (SPADCALL |abs_z| (QREFELT $ 53)) 5)
                                     . #6#)
                             (|check_subtype| (> #5# 0) '(|PositiveInteger|)
                                              #5#))
                           . #6#)
                     (LETT |lz|
                           (PROG1 (LETT #4# (INTEGER-LENGTH |oz|) . #6#)
                             (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                              #4#))
                           . #6#)
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
                            (QREFELT $ 54))
                           . #6#)
                     (LETT |len|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL |z| (QREFELT $ 38))
                                       (QREFELT $ 50))
                             (SPADCALL 2
                                       (SPADCALL |loss|
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 55))
                                                  (SPADCALL |l| (QREFELT $ 19))
                                                  (QREFELT $ 24))
                                                 (QREFELT $ 56))
                                       (QREFELT $ 50))
                             (QREFELT $ 56))
                            (SPADCALL 3 (QREFELT $ 19)) (QREFELT $ 56))
                           . #6#)
                     (LETT |l1a|
                           (+
                            (+ (+ |l| (SPADCALL |len| (QREFELT $ 53)))
                               (SPADCALL
                                (SPADCALL |loss| (SPADCALL (QREFELT $ 55))
                                          (QREFELT $ 20))
                                (QREFELT $ 57)))
                            12)
                           . #6#)
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
                                             (SPADCALL (QREFELT $ 55))
                                             (QREFELT $ 20))
                                            (QREFELT $ 57))
                                           10))
                                     . #6#)
                             (|check_subtype| (> #3# 0) '(|PositiveInteger|)
                                              #3#))
                           . #6#)
                     (SPADCALL |l1| (QREFELT $ 42))
                     (LETT |result|
                           (|FSFUN;gamma_series| |z| |len|
                            (+
                             (SPADCALL 3 (SPADCALL |len| (QREFELT $ 57))
                                       (QREFELT $ 58))
                             6)
                            $)
                           . #6#)
                     (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))
                   (#7#
                    (SEQ
                     (LETT |llog|
                           (PROG1
                               (LETT #2#
                                     (MAX
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|FSFUN;logGamma_a1| |z| $)
                                                  (QREFELT $ 49))
                                        (QREFELT $ 38))
                                       (QREFELT $ 53))
                                      5)
                                     . #6#)
                             (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                              #2#))
                           . #6#)
                     (LETT |l1|
                           (+
                            (+ (+ |l| |llog|)
                               (PROG1 (LETT #1# (INTEGER-LENGTH |l|) . #6#)
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#)))
                            12)
                           . #6#)
                     (SPADCALL |l1| (QREFELT $ 42))
                     (LETT |result|
                           (SPADCALL
                            (|FSFUN;logGamma_asymptotic| |z|
                             (+ (QUOTIENT2 |l| 6) 1) $)
                            (QREFELT $ 32))
                           . #6#)
                     (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))))))))))
       (#7# (|error| "Gamma can only handle base 2 Float-s"))))))) 

(DEFUN |FSFUN;logGamma_lift| (|z| |lg2| $)
  (PROG (|k| |lg2i|)
    (RETURN
     (SEQ
      (LETT |lg2i| (SPADCALL |lg2| (QREFELT $ 59))
            . #1=(|FSFUN;logGamma_lift|))
      (LETT |k|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (|FSFUN;logGamma_a1| |z| $) (QREFELT $ 59))
                        |lg2i| (QREFELT $ 54))
              (SPADCALL 2 (SPADCALL (QREFELT $ 60)) (QREFELT $ 50))
              (QREFELT $ 20))
             (QREFELT $ 43))
            . #1#)
      (EXIT
       (SPADCALL |lg2|
                 (SPADCALL (SPADCALL (QREFELT $ 61))
                           (SPADCALL
                            (SPADCALL |k| (SPADCALL 2 (QREFELT $ 19))
                                      (QREFELT $ 24))
                            (SPADCALL (QREFELT $ 29)) (QREFELT $ 30))
                           (QREFELT $ 9))
                 (QREFELT $ 26))))))) 

(DEFUN |FSFUN;logGamma;2C;7| (|z| $)
  (PROG (|result| |l1| #1=#:G173 |l| |abs_z| |c_pi| |lsign| |z1| |re_zint|
         |one| |re_z| |l0|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL (QREFELT $ 36)) 2)
        (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)) . #2=(|FSFUN;logGamma;2C;7|))
             (LETT |l| (MAX (+ |l0| 5) 20) . #2#)
             (LETT |re_z| (SPADCALL |z| (QREFELT $ 38)) . #2#)
             (LETT |one| (|spadConstant| $ 7) . #2#)
             (EXIT
              (COND
               ((SPADCALL |re_z|
                          (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                          (QREFELT $ 41))
                (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                     (LETT |re_zint| (SPADCALL |re_z| (QREFELT $ 43)) . #2#)
                     (LETT |z1|
                           (SPADCALL |z| (SPADCALL |re_zint| (QREFELT $ 25))
                                     (QREFELT $ 27))
                           . #2#)
                     (LETT |lsign|
                           (COND
                            ((ODDP (SPADCALL |re_zint| (QREFELT $ 44)))
                             (|spadConstant| $ 15))
                            (#3='T (|spadConstant| $ 62)))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |z1| (|spadConstant| $ 45) (QREFELT $ 46))
                        (SEQ (SPADCALL |l0| (QREFELT $ 42))
                             (EXIT (|error| "Pole of Gamma"))))
                       (#3#
                        (SEQ (SPADCALL (+ |l| 5) (QREFELT $ 42))
                             (LETT |c_pi| (SPADCALL (QREFELT $ 29)) . #2#)
                             (LETT |result|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |c_pi| (QREFELT $ 28))
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 62)
                                                          |lsign|
                                                          (QREFELT $ 63))
                                                |c_pi| (QREFELT $ 9))
                                               (QREFELT $ 26))
                                     (SPADCALL
                                      (SPADCALL |one| |z| (QREFELT $ 27))
                                      (QREFELT $ 64))
                                     (QREFELT $ 27))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |c_pi| |z1| (QREFELT $ 9))
                                      (QREFELT $ 48))
                                     (QREFELT $ 28))
                                    (QREFELT $ 27))
                                   . #2#)
                             (LETT |result|
                                   (|FSFUN;logGamma_lift| |z| |result| $)
                                   . #2#)
                             (SPADCALL |l0| (QREFELT $ 42))
                             (EXIT |result|)))))))
               (#3#
                (SEQ
                 (LETT |abs_z|
                       (SPADCALL (SPADCALL |z| (QREFELT $ 49)) (QREFELT $ 38))
                       . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                              (SPADCALL 6 |abs_z| (QREFELT $ 50))
                              (QREFELT $ 51))
                    (SEQ (LETT |l| (+ |l| 5) . #2#)
                         (COND
                          ((OR
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |one| (QREFELT $ 27))
                                        (QREFELT $ 49))
                              (QREFELT $ 38))
                             (SPADCALL (|spadConstant| $ 15) 4 (QREFELT $ 39))
                             (QREFELT $ 41))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |z| |one| (QREFELT $ 27))
                                         |one| (QREFELT $ 27))
                               (QREFELT $ 49))
                              (QREFELT $ 38))
                             (SPADCALL (|spadConstant| $ 15) 4 (QREFELT $ 39))
                             (QREFELT $ 41)))
                           (LETT |l| (* 2 |l|) . #2#)))
                         (SPADCALL |l| (QREFELT $ 42))
                         (LETT |result|
                               (|FSFUN;logGamma_lift| |z|
                                (SPADCALL (SPADCALL |z| (QREFELT $ 47))
                                          (QREFELT $ 28))
                                $)
                               . #2#)
                         (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))
                   (#3#
                    (SEQ
                     (LETT |l1|
                           (+
                            (+ |l|
                               (PROG1 (LETT #1# (INTEGER-LENGTH |l|) . #2#)
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#)))
                            12)
                           . #2#)
                     (SPADCALL |l1| (QREFELT $ 42))
                     (LETT |result|
                           (|FSFUN;logGamma_asymptotic| |z|
                            (+ (QUOTIENT2 |l| 6) 1) $)
                           . #2#)
                     (SPADCALL |l0| (QREFELT $ 42)) (EXIT |result|)))))))))))
       (#3# (|error| "Gamma can only handle base 2 Float-s"))))))) 

(DEFUN |FSFUN;Gamma;2F;8| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 47))
            (QREFELT $ 38))) 

(DEFUN |FSFUN;logGamma;2F;9| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 62) (QREFELT $ 66))
    (|error| "Argument to logGamma <= 0"))
   ('T
    (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 64))
              (QREFELT $ 38))))) 

(DEFUN |FSFUN;Beta;3C;10| (|x| |y| $)
  (PROG (|res| |l1| |l0|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL (QREFELT $ 36)) 2)
        (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)) . #1=(|FSFUN;Beta;3C;10|))
             (LETT |l1| (MAX 30 (+ |l0| 10)) . #1#)
             (SPADCALL |l1| (QREFELT $ 42))
             (LETT |res|
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT $ 47))
                              (SPADCALL |y| (QREFELT $ 47)) (QREFELT $ 9))
                    (SPADCALL (SPADCALL |x| |y| (QREFELT $ 26)) (QREFELT $ 47))
                    (QREFELT $ 8))
                   . #1#)
             (SPADCALL |l0| (QREFELT $ 42)) (EXIT |res|)))
       ('T (|error| "Beta can only handle base 2 Float-s"))))))) 

(DEFUN |FSFUN;Beta;3F;11| (|x| |y| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
             (QREFELT $ 68))
   (QREFELT $ 38))) 

(DEFUN |FSFUN;rabs;2F;12| (|r| $) (SPADCALL |r| (QREFELT $ 70))) 

(DEFUN |FSFUN;rabs;CF;13| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (QREFELT $ 38))) 

(PUT '|FSFUN;rabs;2Df;14| '|SPADreplace| '(XLAM (|r|) (FLOAT-SIGN 1.0 |r|))) 

(DEFUN |FSFUN;rabs;2Df;14| (|r| $) (FLOAT-SIGN 1.0 |r|)) 

(DEFUN |FSFUN;rabs;CDf;15| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 76)) (QREFELT $ 77))) 

(DEFUN |FSFUN;digamma_euler_maclaurin| (|a| |n| |m| $)
  (PROG (|res| |bk| |ns1| |kfac| |k| |n2_inv| |ns| |na| |n1| |ck|)
    (RETURN
     (SEQ
      (LETT |res| (|spadConstant| $ 45) . #1=(|FSFUN;digamma_euler_maclaurin|))
      (SEQ (LETT |k| 0 . #1#) G190 (COND ((|greater_SI| |k| |n|) (GO G191)))
           (SEQ
            (LETT |ck|
                  (SPADCALL (|spadConstant| $ 7)
                            (SPADCALL (SPADCALL |k| (QREFELT $ 33)) |a|
                                      (QREFELT $ 26))
                            (QREFELT $ 8))
                  . #1#)
            (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT $ 26)) . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (LETT |n1| (+ |n| 1) . #1#)
      (LETT |na| (SPADCALL (SPADCALL |n1| (QREFELT $ 33)) |a| (QREFELT $ 26))
            . #1#)
      (LETT |ns| (SPADCALL (|spadConstant| $ 7) |na| (QREFELT $ 8)) . #1#)
      (LETT |ns1| (|spadConstant| $ 7) . #1#)
      (LETT |res|
            (SPADCALL
             (SPADCALL |res|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39)) |ns|
                        (QREFELT $ 30))
                       (QREFELT $ 26))
             (SPADCALL |na| (QREFELT $ 28)) (QREFELT $ 27))
            . #1#)
      (LETT |n2_inv|
            (SPADCALL (|spadConstant| $ 7) (SPADCALL |na| |na| (QREFELT $ 9))
                      (QREFELT $ 8))
            . #1#)
      (SEQ (LETT |k| 1 . #1#) G190 (COND ((|greater_SI| |k| |m|) (GO G191)))
           (SEQ
            (LETT |kfac|
                  (SPADCALL (SPADCALL 2 |k| (QREFELT $ 18)) (QREFELT $ 19))
                  . #1#)
            (LETT |ns1| (SPADCALL |n2_inv| |ns1| (QREFELT $ 9)) . #1#)
            (LETT |bk|
                  (SPADCALL
                   (SPADCALL (SPADCALL 2 |k| (QREFELT $ 18)) (QREFELT $ 22))
                   (QREFELT $ 23))
                  . #1#)
            (EXIT
             (LETT |res|
                   (SPADCALL |res|
                             (SPADCALL (SPADCALL |bk| |kfac| (QREFELT $ 20))
                                       |ns1| (QREFELT $ 30))
                             (QREFELT $ 26))
                   . #1#)))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |res| (QREFELT $ 79))))))) 

(DEFUN |FSFUN;digamma_aux| (|a| |l| $)
  (PROG (|abs_a|)
    (RETURN
     (SEQ
      (LETT |abs_a| (SPADCALL (SPADCALL |a| (QREFELT $ 80)) (QREFELT $ 81))
            |FSFUN;digamma_aux|)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |l| (QREFELT $ 19))
                   (SPADCALL 6 |abs_a| (QREFELT $ 50)) (QREFELT $ 51))
         (|FSFUN;digamma_euler_maclaurin| |a| (+ (QUOTIENT2 |l| 6) 1)
          (+ (QUOTIENT2 |l| 6) 1) $))
        ('T
         (|FSFUN;digamma_euler_maclaurin| |a| -1 (+ (QUOTIENT2 |l| 6) 1)
          $)))))))) 

(DEFUN |FSFUN;digamma;2C;18| (|a| $)
  (PROG (|ap| |r_pi| |a1| |re_aint| |l| |re_a| |l0|)
    (RETURN
     (SEQ (LETT |l0| (SPADCALL (QREFELT $ 37)) . #1=(|FSFUN;digamma;2C;18|))
          (LETT |l| (MAX (+ |l0| 10) 61) . #1#)
          (EXIT
           (|finally|
            (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT $ 38)) . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL |re_a|
                              (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                              (QREFELT $ 41))
                    (SEQ (LETT |l| (+ |l| 5) . #1#)
                         (SPADCALL
                          (+
                           (+ |l|
                              (SPADCALL 3 (INTEGER-LENGTH |l|) (QREFELT $ 58)))
                           10)
                          (QREFELT $ 42))
                         (LETT |re_aint| (SPADCALL |re_a| (QREFELT $ 43))
                               . #1#)
                         (LETT |a1|
                               (SPADCALL |a|
                                         (SPADCALL |re_aint|
                                                   (|spadConstant| $ 62)
                                                   (QREFELT $ 63))
                                         (QREFELT $ 27))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |a1| (|spadConstant| $ 45)
                                      (QREFELT $ 46))
                            (|error| "Pole of Gamma"))
                           (#2='T
                            (SEQ (LETT |r_pi| (SPADCALL (QREFELT $ 60)) . #1#)
                                 (LETT |ap|
                                       (SPADCALL |r_pi| |a1| (QREFELT $ 30))
                                       . #1#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |r_pi|
                                               (SPADCALL |ap| (QREFELT $ 82))
                                               (QREFELT $ 30))
                                     (SPADCALL |ap| (QREFELT $ 48))
                                     (QREFELT $ 8))
                                    (QREFELT $ 79))
                                   (|FSFUN;digamma_aux|
                                    (SPADCALL (|spadConstant| $ 7) |a|
                                              (QREFELT $ 27))
                                    |l| $)
                                   (QREFELT $ 26)))))))))
                   (#2#
                    (SEQ
                     (SPADCALL
                      (+
                       (+ |l| (SPADCALL 3 (INTEGER-LENGTH |l|) (QREFELT $ 58)))
                       10)
                      (QREFELT $ 42))
                     (EXIT (|FSFUN;digamma_aux| |a| |l| $)))))))
            (SPADCALL |l0| (QREFELT $ 42)))))))) 

(DEFUN |FSFUN;digamma;2F;19| (|z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 63))
             (QREFELT $ 83))
   (QREFELT $ 38))) 

(DEFUN |FSFUN;li2_series| (|z| |prec| $)
  (PROG (|res| |ck| |k2| |k| |i| |n| |oz| |nz|)
    (RETURN
     (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 80)) . #1=(|FSFUN;li2_series|))
          (LETT |oz| (SPADCALL |nz| (QREFELT $ 53)) . #1#)
          (LETT |n|
                (COND
                 ((< |oz| -200)
                  (+
                   (QUOTIENT2 (SPADCALL 2 |prec| (QREFELT $ 58))
                              (- (- |oz|) 1))
                   1))
                 ('T
                  (+
                   (SPADCALL
                    (SPADCALL
                     (|mul_DF|
                      (FLOAT (SPADCALL 2 |prec| (QREFELT $ 58))
                             MOST-POSITIVE-DOUBLE-FLOAT)
                      (|minus_DF|
                       (|div_DF|
                        (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                  (QREFELT $ 85))
                        (SPADCALL (SPADCALL |nz| (QREFELT $ 86))
                                  (QREFELT $ 85)))))
                     (QREFELT $ 87))
                    (QREFELT $ 88))
                   1)))
                . #1#)
          (LETT |res| (|spadConstant| $ 45) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |k| (- (+ |n| 2) |i|) . #1#)
                    (LETT |k2| (* |k| |k|) . #1#)
                    (LETT |ck|
                          (SPADCALL (|spadConstant| $ 15)
                                    (SPADCALL |k2| (QREFELT $ 19))
                                    (QREFELT $ 20))
                          . #1#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |z|
                                     (SPADCALL |res|
                                               (SPADCALL |ck|
                                                         (|spadConstant| $ 62)
                                                         (QREFELT $ 63))
                                               (QREFELT $ 26))
                                     (QREFELT $ 9))
                           . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |z| (SPADCALL (|spadConstant| $ 7) |res| (QREFELT $ 26))
                     (QREFELT $ 9))))))) 

(DEFUN |FSFUN;li2_aux| (|z| |prec| $)
  (PROG (|lz1| |nz1| |lz| |lmz| |pi_fac| |rpi| |z1| |nz| |dd| |w| |siz| |iz|
         |rz|)
    (RETURN
     (SEQ (LETT |rz| (SPADCALL |z| (QREFELT $ 38)) . #1=(|FSFUN;li2_aux|))
          (LETT |iz| (SPADCALL |z| (QREFELT $ 59)) . #1#)
          (LETT |siz|
                (COND
                 ((SPADCALL |iz| (|spadConstant| $ 62) (QREFELT $ 51))
                  (|spadConstant| $ 15))
                 (#2='T (SPADCALL (|spadConstant| $ 15) (QREFELT $ 34))))
                . #1#)
          (LETT |w|
                (SPADCALL (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                          (SPADCALL
                           (SPADCALL |siz|
                                     (SPADCALL (|spadConstant| $ 15) 2
                                               (QREFELT $ 39))
                                     (QREFELT $ 24))
                           (SPADCALL (SPADCALL 3 (QREFELT $ 19))
                                     (QREFELT $ 81))
                           (QREFELT $ 24))
                          (QREFELT $ 63))
                . #1#)
          (LETT |dd|
                (SPADCALL (SPADCALL |z| |w| (QREFELT $ 27)) (QREFELT $ 80))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |dd| (SPADCALL (|spadConstant| $ 15) 8 (QREFELT $ 39))
                       (QREFELT $ 41))
             (SPADCALL
              (SPADCALL (SPADCALL (|spadConstant| $ 15) 2 (QREFELT $ 39))
                        (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT $ 9))
                         (+ |prec| 2) $)
                        (QREFELT $ 30))
              (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT $ 79)) (+ |prec| 2) $)
              (QREFELT $ 27)))
            (#2#
             (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 80)) . #1#)
                  (LETT |z1| (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 27))
                        . #1#)
                  (LETT |rpi| (SPADCALL (QREFELT $ 60)) . #1#)
                  (LETT |pi_fac|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 15) 6 (QREFELT $ 39))
                          |rpi| (QREFELT $ 24))
                         |rpi| (QREFELT $ 24))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |rz|
                               (SPADCALL (|spadConstant| $ 15) 2
                                         (QREFELT $ 39))
                               (QREFELT $ 51))
                     (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT $ 80)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |nz1| (|spadConstant| $ 15)
                                       (QREFELT $ 90))
                             (SEQ
                              (LETT |lmz|
                                    (SPADCALL (SPADCALL |z| (QREFELT $ 79))
                                              (QREFELT $ 28))
                                    . #1#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 25))
                                           (QREFELT $ 79))
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
                            (#2#
                             (SEQ
                              (LETT |lz| (SPADCALL |z| (QREFELT $ 28)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL |z1| (|spadConstant| $ 45)
                                           (QREFELT $ 46))
                                 (SPADCALL |pi_fac| (QREFELT $ 25)))
                                (#2#
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT $ 28))
                                        . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |nz| (|spadConstant| $ 15)
                                               (QREFELT $ 90))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT $ 25))
                                       (SPADCALL |lz|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (|spadConstant| $ 15) 2
                                                    (QREFELT $ 39))
                                                   |lz| (QREFELT $ 30))
                                                  |lz1| (QREFELT $ 27))
                                                 (QREFELT $ 9))
                                       (QREFELT $ 26))
                                      (|FSFUN;li2_series|
                                       (SPADCALL
                                        (SPADCALL |z1| |z| (QREFELT $ 8))
                                        (QREFELT $ 79))
                                       |prec| $)
                                      (QREFELT $ 26)))
                                    (#2#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT $ 25))
                                       (SPADCALL |lz| |lz1| (QREFELT $ 9))
                                       (QREFELT $ 27))
                                      (|FSFUN;li2_series| |z1| |prec| $)
                                      (QREFELT $ 27)))))))))))))))
                    ((SPADCALL |nz| (|spadConstant| $ 15) (QREFELT $ 90))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 25))
                                 (QREFELT $ 79))
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
                    (#2#
                     (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT $ 80)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |nz1| (|spadConstant| $ 15)
                                       (QREFELT $ 90))
                             (SEQ
                              (LETT |lz1| (SPADCALL |z1| (QREFELT $ 28)) . #1#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 15) 2
                                             (QREFELT $ 39))
                                   |lz1| (QREFELT $ 30))
                                  |lz1| (QREFELT $ 9))
                                 (QREFELT $ 79))
                                (|FSFUN;li2_series|
                                 (SPADCALL (SPADCALL |z| |z1| (QREFELT $ 8))
                                           (QREFELT $ 79))
                                 |prec| $)
                                (QREFELT $ 27)))))
                            (#2#
                             (|FSFUN;li2_series| |z| |prec| $)))))))))))))))) 

(DEFUN |FSFUN;li2;2C;22| (|z| $)
  (PROG (|prec| |obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 37)) . #1=(|FSFUN;li2;2C;22|))
          (LETT |prec| (+ |obits| 5) . #1#)
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 42))
                 (EXIT (|FSFUN;li2_aux| |z| |prec| $)))
            (SPADCALL |obits| (QREFELT $ 42)))))))) 

(DEFUN |FSFUN;dilog_aux| (|z| |prec| $)
  (PROG (|res| |lz1| |lz| |pi_fac| |rpi| |nz|)
    (RETURN
     (SEQ (LETT |nz| (SPADCALL |z| (QREFELT $ 80)) . #1=(|FSFUN;dilog_aux|))
          (EXIT
           (COND
            ((SPADCALL |nz| (SPADCALL (|spadConstant| $ 15) 4 (QREFELT $ 39))
                       (QREFELT $ 41))
             (SEQ (LETT |rpi| (SPADCALL (QREFELT $ 60)) . #1#)
                  (LETT |pi_fac|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 15) 6 (QREFELT $ 39))
                          |rpi| (QREFELT $ 24))
                         |rpi| (QREFELT $ 24))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |z| (|spadConstant| $ 45) (QREFELT $ 46))
                     (SPADCALL |pi_fac| (QREFELT $ 25)))
                    (#2='T
                     (SEQ (LETT |lz| (SPADCALL |z| (QREFELT $ 28)) . #1#)
                          (LETT |lz1|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 7) |z|
                                           (QREFELT $ 27))
                                 (QREFELT $ 28))
                                . #1#)
                          (EXIT
                           (LETT |res|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |pi_fac| (QREFELT $ 25))
                                            (SPADCALL |lz| |lz1| (QREFELT $ 9))
                                            (QREFELT $ 27))
                                  (|FSFUN;li2_series| |z| |prec| $)
                                  (QREFELT $ 27))
                                 . #1#))))))))
            (#2#
             (|FSFUN;li2_aux|
              (SPADCALL (|spadConstant| $ 7) |z| (QREFELT $ 27)) |prec|
              $)))))))) 

(DEFUN |FSFUN;dilog;2C;24| (|z| $)
  (PROG (|prec| |obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 37)) . #1=(|FSFUN;dilog;2C;24|))
          (LETT |prec| (+ |obits| 5) . #1#)
          (EXIT
           (|finally|
            (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 42))
                 (EXIT (|FSFUN;dilog_aux| |z| |prec| $)))
            (SPADCALL |obits| (QREFELT $ 42)))))))) 

(DEFUN |FSFUN;lambert_via_newton1;4F;25| (|x| |w| |eps| $)
  (PROG (|odw| #1=#:G229 |dw| |ew|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |odw| (|spadConstant| $ 15)
              . #2=(|FSFUN;lambert_via_newton1;4F;25|))
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 35)) . #2#)
                   (LETT |dw|
                         (SPADCALL
                          (SPADCALL |w| (SPADCALL |x| |ew| (QREFELT $ 20))
                                    (QREFELT $ 54))
                          (SPADCALL |w| (|spadConstant| $ 15) (QREFELT $ 56))
                          (QREFELT $ 20))
                         . #2#)
                   (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 54)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |odw| |eps| (QREFELT $ 41))
                      (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                     ('T (LETT |odw| (SPADCALL |dw| (QREFELT $ 71)) . #2#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_via_newton2;4F;26| (|lz| |w| |eps| $)
  (PROG (|odw| #1=#:G233 |dw| |lw|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |odw| (|spadConstant| $ 15)
              . #2=(|FSFUN;lambert_via_newton2;4F;26|))
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 31)) . #2#)
                   (LETT |dw|
                         (SPADCALL
                          (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 56)) |lz|
                                    (QREFELT $ 54))
                          (SPADCALL (|spadConstant| $ 15)
                                    (SPADCALL (|spadConstant| $ 15) |w|
                                              (QREFELT $ 20))
                                    (QREFELT $ 56))
                          (QREFELT $ 20))
                         . #2#)
                   (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 54)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |odw| |eps| (QREFELT $ 41))
                      (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                     ('T (LETT |odw| (SPADCALL |dw| (QREFELT $ 71)) . #2#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_inverse_series;3F;27| (|h| |h2| $)
  (PROG (|res| |h4| |h3|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL |h|
                      (SPADCALL
                       (SPADCALL (SPADCALL 1 3 (QREFELT $ 12)) (QREFELT $ 23))
                       |h2| (QREFELT $ 24))
                      (QREFELT $ 54))
            . #1=(|FSFUN;lambert_inverse_series;3F;27|))
      (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 24)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                 (QREFELT $ 23))
                       |h3| (QREFELT $ 24))
                      (QREFELT $ 56))
            . #1#)
      (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 24)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                 (QREFELT $ 23))
                       |h4| (QREFELT $ 24))
                      (QREFELT $ 54))
            . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                  (QREFELT $ 23))
                        |h3| (QREFELT $ 24))
                       |h2| (QREFELT $ 24))
                      (QREFELT $ 56))
            . #1#)
      (EXIT
       (SPADCALL |res|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12)) (QREFELT $ 23))
                   |h4| (QREFELT $ 24))
                  |h2| (QREFELT $ 24))
                 (QREFELT $ 54))))))) 

(DEFUN |FSFUN;lambert_via_newton1;2CFC;28| (|x| |w| |eps| $)
  (PROG (|odw| #1=#:G239 |dw| |ew|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |odw| (|spadConstant| $ 15)
              . #2=(|FSFUN;lambert_via_newton1;2CFC;28|))
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 32)) . #2#)
                   (LETT |dw|
                         (SPADCALL
                          (SPADCALL |w| (SPADCALL |x| |ew| (QREFELT $ 8))
                                    (QREFELT $ 27))
                          (SPADCALL |w| (|spadConstant| $ 7) (QREFELT $ 26))
                          (QREFELT $ 8))
                         . #2#)
                   (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 27)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |odw| |eps| (QREFELT $ 41))
                      (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                     ('T (LETT |odw| (SPADCALL |dw| (QREFELT $ 72)) . #2#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_via_newton2;2CFC;29| (|lz| |w| |eps| $)
  (PROG (|odw| #1=#:G243 |dw| |lw|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |odw| (|spadConstant| $ 15)
              . #2=(|FSFUN;lambert_via_newton2;2CFC;29|))
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 28)) . #2#)
                   (LETT |dw|
                         (SPADCALL
                          (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 26)) |lz|
                                    (QREFELT $ 27))
                          (SPADCALL (|spadConstant| $ 7)
                                    (SPADCALL (|spadConstant| $ 7) |w|
                                              (QREFELT $ 8))
                                    (QREFELT $ 26))
                          (QREFELT $ 8))
                         . #2#)
                   (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 27)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |odw| |eps| (QREFELT $ 41))
                      (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                     ('T (LETT |odw| (SPADCALL |dw| (QREFELT $ 72)) . #2#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_inverse_series;3C;30| (|h| |h2| $)
  (PROG (|res| |h4| |h3|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL |h|
                      (SPADCALL
                       (SPADCALL (SPADCALL 1 3 (QREFELT $ 12)) (QREFELT $ 13))
                       |h2| (QREFELT $ 9))
                      (QREFELT $ 27))
            . #1=(|FSFUN;lambert_inverse_series;3C;30|))
      (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 9)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                 (QREFELT $ 13))
                       |h3| (QREFELT $ 9))
                      (QREFELT $ 26))
            . #1#)
      (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 9)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                 (QREFELT $ 13))
                       |h4| (QREFELT $ 9))
                      (QREFELT $ 27))
            . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                  (QREFELT $ 13))
                        |h3| (QREFELT $ 9))
                       |h2| (QREFELT $ 9))
                      (QREFELT $ 26))
            . #1#)
      (EXIT
       (SPADCALL |res|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12)) (QREFELT $ 13))
                   |h4| (QREFELT $ 9))
                  |h2| (QREFELT $ 9))
                 (QREFELT $ 27))))))) 

(DEFUN |FSFUN;lambert_via_newton1;4Df;31| (|x| |w| |eps| $)
  (PROG (|odw| #1=#:G249 |dw| |ew|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |odw| 1.0 . #2=(|FSFUN;lambert_via_newton1;4Df;31|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |ew| (|exp_DF| |w|) . #2#)
                       (LETT |dw|
                             (|div_DF| (|sub_DF| |w| (|div_DF| |x| |ew|))
                                       (|add_DF| |w| 1.0))
                             . #2#)
                       (LETT |w| (|sub_DF| |w| |dw|) . #2#)
                       (EXIT
                        (COND
                         ((|less_DF| |odw| |eps|)
                          (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                         ('T
                          (LETT |odw| (SPADCALL |dw| (QREFELT $ 74)) . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_via_newton2;4Df;32| (|lz| |w| |eps| $)
  (PROG (|odw| #1=#:G253 |dw| |lw|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |odw| 1.0 . #2=(|FSFUN;lambert_via_newton2;4Df;32|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 85)) . #2#)
                       (LETT |dw|
                             (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                       (|add_DF| 1.0 (|div_DF| 1.0 |w|)))
                             . #2#)
                       (LETT |w| (|sub_DF| |w| |dw|) . #2#)
                       (EXIT
                        (COND
                         ((|less_DF| |odw| |eps|)
                          (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                         ('T
                          (LETT |odw| (SPADCALL |dw| (QREFELT $ 74)) . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_inverse_series;3Df;33| (|h| |h2| $)
  (PROG (|res| |h4| |h3|)
    (RETURN
     (SEQ
      (LETT |res|
            (|sub_DF| |h|
                      (|mul_DF|
                       (SPADCALL (SPADCALL 1 3 (QREFELT $ 12)) (QREFELT $ 101))
                       |h2|))
            . #1=(|FSFUN;lambert_inverse_series;3Df;33|))
      (LETT |h3| (|mul_DF| |h| |h2|) . #1#)
      (LETT |res|
            (|add_DF| |res|
                      (|mul_DF|
                       (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                 (QREFELT $ 101))
                       |h3|))
            . #1#)
      (LETT |h4| (|mul_DF| |h2| |h2|) . #1#)
      (LETT |res|
            (|sub_DF| |res|
                      (|mul_DF|
                       (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                 (QREFELT $ 101))
                       |h4|))
            . #1#)
      (LETT |res|
            (|add_DF| |res|
                      (|mul_DF|
                       (|mul_DF|
                        (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                  (QREFELT $ 101))
                        |h3|)
                       |h2|))
            . #1#)
      (EXIT
       (|sub_DF| |res|
                 (|mul_DF|
                  (|mul_DF|
                   (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                             (QREFELT $ 101))
                   |h4|)
                  |h2|))))))) 

(DEFUN |FSFUN;lambert_via_newton1;2CDfC;34| (|x| |w| |eps| $)
  (PROG (|odw| #1=#:G259 |dw| |ew|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |odw| 1.0 . #2=(|FSFUN;lambert_via_newton1;2CDfC;34|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |ew| (SPADCALL |w| (QREFELT $ 103)) . #2#)
                       (LETT |dw|
                             (SPADCALL
                              (SPADCALL |w| (SPADCALL |x| |ew| (QREFELT $ 104))
                                        (QREFELT $ 105))
                              (SPADCALL |w| (|spadConstant| $ 106)
                                        (QREFELT $ 107))
                              (QREFELT $ 104))
                             . #2#)
                       (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 105)) . #2#)
                       (EXIT
                        (COND
                         ((|less_DF| |odw| |eps|)
                          (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                         ('T
                          (LETT |odw| (SPADCALL |dw| (QREFELT $ 78)) . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_via_newton2;2CDfC;35| (|lz| |w| |eps| $)
  (PROG (|odw| #1=#:G263 |dw| |lw|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |odw| 1.0 . #2=(|FSFUN;lambert_via_newton2;2CDfC;35|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |lw| (SPADCALL |w| (QREFELT $ 109)) . #2#)
                       (LETT |dw|
                             (SPADCALL
                              (SPADCALL (SPADCALL |w| |lw| (QREFELT $ 107))
                                        |lz| (QREFELT $ 105))
                              (SPADCALL (|spadConstant| $ 106)
                                        (SPADCALL (|spadConstant| $ 106) |w|
                                                  (QREFELT $ 104))
                                        (QREFELT $ 107))
                              (QREFELT $ 104))
                             . #2#)
                       (LETT |w| (SPADCALL |w| |dw| (QREFELT $ 105)) . #2#)
                       (EXIT
                        (COND
                         ((|less_DF| |odw| |eps|)
                          (PROGN (LETT #1# |w| . #2#) (GO #1#)))
                         ('T
                          (LETT |odw| (SPADCALL |dw| (QREFELT $ 78)) . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSFUN;lambert_inverse_series;3C;36| (|h| |h2| $)
  (PROG (|res| |h4| |h3|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL |h|
                      (SPADCALL
                       (SPADCALL (SPADCALL 1 3 (QREFELT $ 12)) (QREFELT $ 111))
                       |h2| (QREFELT $ 112))
                      (QREFELT $ 105))
            . #1=(|FSFUN;lambert_inverse_series;3C;36|))
      (LETT |h3| (SPADCALL |h| |h2| (QREFELT $ 112)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 11 72 (QREFELT $ 12))
                                 (QREFELT $ 111))
                       |h3| (QREFELT $ 112))
                      (QREFELT $ 107))
            . #1#)
      (LETT |h4| (SPADCALL |h2| |h2| (QREFELT $ 112)) . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL (SPADCALL 43 540 (QREFELT $ 12))
                                 (QREFELT $ 111))
                       |h4| (QREFELT $ 112))
                      (QREFELT $ 105))
            . #1#)
      (LETT |res|
            (SPADCALL |res|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 769 17280 (QREFELT $ 12))
                                  (QREFELT $ 111))
                        |h3| (QREFELT $ 112))
                       |h2| (QREFELT $ 112))
                      (QREFELT $ 107))
            . #1#)
      (EXIT
       (SPADCALL |res|
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL 221 8505 (QREFELT $ 12))
                             (QREFELT $ 111))
                   |h4| (QREFELT $ 112))
                  |h2| (QREFELT $ 112))
                 (QREFELT $ 105))))))) 

(DEFUN |FSFUN;lambertW;2Df;37| (|x| $)
  (PROG (|eps| |ax| |h| |h2| |e1| |w| |y| |lx| |ox|)
    (RETURN
     (SEQ
      (COND ((|eql_DF| |x| 0.0) |x|)
            (#1='T
             (SEQ
              (LETT |eps| (SPADCALL 1 -35 (QREFELT $ 114))
                    . #2=(|FSFUN;lambertW;2Df;37|))
              (LETT |ox| (SPADCALL |x| (QREFELT $ 115)) . #2#)
              (EXIT
               (COND ((< |ox| -70) |x|)
                     (#1#
                      (SEQ
                       (COND
                        ((SPADCALL |ox| 200 (QREFELT $ 116))
                         (COND
                          ((SPADCALL |x| 0.0 (QREFELT $ 117))
                           (EXIT
                            (SEQ
                             (LETT |lx| (SPADCALL |x| (QREFELT $ 85)) . #2#)
                             (EXIT
                              (SPADCALL |lx| |lx| |eps| (QREFELT $ 100)))))))))
                       (LETT |w|
                             (COND
                              ((SPADCALL |x|
                                         (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                         (QREFELT $ 117))
                               (SEQ
                                (LETT |y| (SPADCALL |x| (QREFELT $ 85)) . #2#)
                                (EXIT
                                 (|sub_DF| |y|
                                           (SPADCALL |y| (QREFELT $ 85))))))
                              (#1# (|mul_DF| (|div_DF_I| 1.0 2) |x|)))
                             . #2#)
                       (EXIT
                        (COND
                         ((|less_DF| |x|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 190436 517656 (QREFELT $ 12))
                                       (QREFELT $ 118))
                                      (QREFELT $ 101)))
                          (|error| "x < -exp(-1)"))
                         ((|less_DF| |x|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 231087 628160 (QREFELT $ 12))
                                       (QREFELT $ 118))
                                      (QREFELT $ 101)))
                          (SEQ (LETT |e1| (|exp_DF| (|minus_DF| 1.0)) . #2#)
                               (LETT |h2| (|add_DF| |x| |e1|) . #2#)
                               (EXIT
                                (COND
                                 ((|less_DF| |h2| 0.0)
                                  (|error| "x < -exp(-1)"))
                                 (#1#
                                  (SEQ
                                   (LETT |h2|
                                         (|div_DF|
                                          (SPADCALL 2 |h2| (QREFELT $ 119))
                                          |e1|)
                                         . #2#)
                                   (LETT |h| (SPADCALL |h2| (QREFELT $ 120))
                                         . #2#)
                                   (EXIT
                                    (|sub_DF|
                                     (SPADCALL |h| |h2| (QREFELT $ 102))
                                     1.0))))))))
                         (#1#
                          (SEQ
                           (COND
                            ((|less_DF| (LETT |ax| (FLOAT-SIGN 1.0 |x|) . #2#)
                                        (|div_DF_I| 1.0 2))
                             (LETT |eps| (|mul_DF| |ax| |eps|) . #2#)))
                           (EXIT
                            (SPADCALL |x| |w| |eps|
                                      (QREFELT $ 99)))))))))))))))))) 

(DEFUN |FSFUN;lambertW;2C;38| (|x| $)
  (PROG (|eps| |w| |y| |h| |h2| |e1| |lz| |ox| |ax| |ix| |rx|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (|spadConstant| $ 122) (QREFELT $ 123)) |x|)
            (#1='T
             (SEQ
              (LETT |rx| (SPADCALL |x| (QREFELT $ 77))
                    . #2=(|FSFUN;lambertW;2C;38|))
              (LETT |ix| (SPADCALL |x| (QREFELT $ 124)) . #2#)
              (LETT |ax| (|add_DF| (FLOAT-SIGN 1.0 |rx|) (FLOAT-SIGN 1.0 |ix|))
                    . #2#)
              (LETT |eps| (SPADCALL 1 -35 (QREFELT $ 114)) . #2#)
              (LETT |ox| (SPADCALL |ax| (QREFELT $ 115)) . #2#)
              (EXIT
               (COND ((< |ox| -70) |x|)
                     ((SPADCALL |ox| 200 (QREFELT $ 116))
                      (SEQ
                       (LETT |lz|
                             (SPADCALL
                              (SPADCALL (SPADCALL |ax| (QREFELT $ 85)) 0.0
                                        (QREFELT $ 125))
                              (SPADCALL
                               (SPADCALL (|div_DF| |rx| |ax|)
                                         (|div_DF| |ix| |ax|) (QREFELT $ 125))
                               (QREFELT $ 109))
                              (QREFELT $ 107))
                             . #2#)
                       (EXIT (SPADCALL |lz| |lz| |eps| (QREFELT $ 110)))))
                     (#1#
                      (SEQ
                       (COND
                        ((|less_DF| (FLOAT-SIGN 1.0 |ix|)
                                    (SPADCALL
                                     (SPADCALL 1 4194304 (QREFELT $ 12))
                                     (QREFELT $ 101)))
                         (COND
                          ((|less_DF| |rx|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 231087 628160 (QREFELT $ 12))
                                        (QREFELT $ 118))
                                       (QREFELT $ 101)))
                           (COND
                            ((|less_DF|
                              (SPADCALL
                               (SPADCALL (SPADCALL 56258 152925 (QREFELT $ 12))
                                         (QREFELT $ 118))
                               (QREFELT $ 101))
                              |rx|)
                             (EXIT
                              (SEQ
                               (LETT |e1| (|exp_DF| (|minus_DF| 1.0)) . #2#)
                               (LETT |h2|
                                     (SPADCALL
                                      (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                (QREFELT $ 119))
                                      (SPADCALL |x|
                                                (SPADCALL |e1| 0.0
                                                          (QREFELT $ 125))
                                                (QREFELT $ 107))
                                      (QREFELT $ 126))
                                     . #2#)
                               (LETT |h| (SPADCALL |h2| (QREFELT $ 127)) . #2#)
                               (EXIT
                                (SPADCALL (SPADCALL |h| |h2| (QREFELT $ 113))
                                          (|spadConstant| $ 106)
                                          (QREFELT $ 105)))))))))))
                       (LETT |w|
                             (COND
                              ((SPADCALL |ax|
                                         (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                         (QREFELT $ 117))
                               (SEQ
                                (LETT |y| (SPADCALL |x| (QREFELT $ 109)) . #2#)
                                (EXIT
                                 (SPADCALL |y| (SPADCALL |y| (QREFELT $ 109))
                                           (QREFELT $ 105)))))
                              (#1#
                               (SPADCALL (|div_DF_I| 1.0 2) |x|
                                         (QREFELT $ 126))))
                             . #2#)
                       (COND
                        ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                         (LETT |eps| (|mul_DF| |ax| |eps|) . #2#)))
                       (EXIT
                        (SPADCALL |x| |w| |eps| (QREFELT $ 108)))))))))))))) 

(DEFUN |FSFUN;lambertW;2F;39| (|x| $)
  (PROG (|eps| |w| |y| |w1| |h| |h2| |e1| |cbit2| |lx| |ox| |ax| |cbit|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (|spadConstant| $ 62) (QREFELT $ 129)) |x|)
            (#1='T
             (SEQ
              (LETT |cbit| (SPADCALL (QREFELT $ 37))
                    . #2=(|FSFUN;lambertW;2F;39|))
              (LETT |eps|
                    (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3)) (QREFELT $ 130))
                    . #2#)
              (LETT |ax| (SPADCALL |x| (QREFELT $ 70)) . #2#)
              (LETT |ox| (SPADCALL |ax| (QREFELT $ 53)) . #2#)
              (EXIT
               (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                     (#1#
                      (SEQ
                       (COND
                        ((SPADCALL |ox| 200 (QREFELT $ 116))
                         (COND
                          ((SPADCALL |x| (|spadConstant| $ 62) (QREFELT $ 51))
                           (EXIT
                            (SEQ
                             (LETT |lx| (SPADCALL |x| (QREFELT $ 31)) . #2#)
                             (EXIT
                              (SPADCALL |lx| |lx| |eps| (QREFELT $ 94)))))))))
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL 190436 517656 (QREFELT $ 12))
                                      (QREFELT $ 118))
                                     (QREFELT $ 23))
                                    (QREFELT $ 41))
                          (|error| "x < -exp(-1)"))
                         ((SPADCALL |x|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL 190434 517656 (QREFELT $ 12))
                                      (QREFELT $ 118))
                                     (QREFELT $ 23))
                                    (QREFELT $ 41))
                          (SEQ (LETT |cbit2| (QUOTIENT2 |cbit| 2) . #2#)
                               (SPADCALL (+ |cbit| |cbit2|) (QREFELT $ 42))
                               (LETT |e1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 15)
                                                (QREFELT $ 34))
                                      (QREFELT $ 35))
                                     . #2#)
                               (LETT |h2| (SPADCALL |x| |e1| (QREFELT $ 56))
                                     . #2#)
                               (LETT |h| (SPADCALL |h2| (QREFELT $ 81)) . #2#)
                               (SPADCALL |cbit| (QREFELT $ 42))
                               (EXIT
                                (COND
                                 ((SPADCALL |h2| (|spadConstant| $ 62)
                                            (QREFELT $ 41))
                                  (|error| "x < -exp(-1)"))
                                 (#1#
                                  (SEQ
                                   (LETT |w1|
                                         (SPADCALL |h| |h2| (QREFELT $ 95))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((< (SPADCALL |w1| (QREFELT $ 53))
                                         (- |cbit2|))
                                      (SPADCALL |w1| (|spadConstant| $ 15)
                                                (QREFELT $ 54)))
                                     (#1#
                                      (SPADCALL |x|
                                                (SPADCALL |w1|
                                                          (|spadConstant| $ 15)
                                                          (QREFELT $ 54))
                                                |eps| (QREFELT $ 93)))))))))))
                         (#1#
                          (SEQ
                           (LETT |w|
                                 (COND
                                  ((SPADCALL |x| (SPADCALL 2 (QREFELT $ 19))
                                             (QREFELT $ 51))
                                   (SEQ
                                    (LETT |y| (SPADCALL |x| (QREFELT $ 31))
                                          . #2#)
                                    (EXIT
                                     (SPADCALL |y|
                                               (SPADCALL |y| (QREFELT $ 31))
                                               (QREFELT $ 54)))))
                                  (#1#
                                   (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 131))
                                             |x| (QREFELT $ 24))))
                                 . #2#)
                           (COND
                            ((SPADCALL (SPADCALL |x| (QREFELT $ 70))
                                       (SPADCALL (SPADCALL 1 2 (QREFELT $ 12))
                                                 (QREFELT $ 23))
                                       (QREFELT $ 41))
                             (LETT |eps| (SPADCALL |ax| |eps| (QREFELT $ 24))
                                   . #2#)))
                           (EXIT
                            (SPADCALL |x| |w| |eps|
                                      (QREFELT $ 93)))))))))))))))))) 

(DEFUN |FSFUN;lambertW;2C;40| (|z| $)
  (PROG (|w1| |h| |h2| |e1| |cbit2| |eps| |w| |wd| |izd| |rzd| |lz| |oz|
         |abs_z| |cbit|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |z| (|spadConstant| $ 45) (QREFELT $ 46)) |z|)
            (#1='T
             (SEQ
              (LETT |cbit| (SPADCALL (QREFELT $ 37))
                    . #2=(|FSFUN;lambertW;2C;40|))
              (LETT |eps|
                    (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3)) (QREFELT $ 130))
                    . #2#)
              (LETT |abs_z| (SPADCALL |z| (QREFELT $ 72)) . #2#)
              (LETT |oz| (SPADCALL |abs_z| (QREFELT $ 53)) . #2#)
              (EXIT
               (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                     ((SPADCALL |oz| 200 (QREFELT $ 116))
                      (SEQ (LETT |lz| (SPADCALL |z| (QREFELT $ 28)) . #2#)
                           (EXIT (SPADCALL |lz| |lz| |eps| (QREFELT $ 97)))))
                     (#1#
                      (SEQ
                       (LETT |rzd|
                             (SPADCALL (SPADCALL |z| (QREFELT $ 38))
                                       (QREFELT $ 133))
                             . #2#)
                       (COND
                        ((OR
                          (SPADCALL (SPADCALL |z| (QREFELT $ 59))
                                    (SPADCALL (|spadConstant| $ 15) 1000000
                                              (QREFELT $ 39))
                                    (QREFELT $ 51))
                          (OR
                           (|less_DF| |rzd|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 190436 517656 (QREFELT $ 12))
                                        (QREFELT $ 118))
                                       (QREFELT $ 101)))
                           (SPADCALL |rzd|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 190434 517656 (QREFELT $ 12))
                                       (QREFELT $ 118))
                                      (QREFELT $ 101))
                                     (QREFELT $ 117))))
                         (EXIT
                          (SEQ
                           (LETT |izd|
                                 (SPADCALL (SPADCALL |z| (QREFELT $ 59))
                                           (QREFELT $ 133))
                                 . #2#)
                           (LETT |wd|
                                 (SPADCALL
                                  (SPADCALL |rzd| |izd| (QREFELT $ 125))
                                  (QREFELT $ 128))
                                 . #2#)
                           (LETT |w|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |wd| (QREFELT $ 77))
                                            (QREFELT $ 134))
                                  (SPADCALL (SPADCALL |wd| (QREFELT $ 124))
                                            (QREFELT $ 134))
                                  (QREFELT $ 63))
                                 . #2#)
                           (COND
                            ((SPADCALL |abs_z|
                                       (SPADCALL (|spadConstant| $ 15) 2
                                                 (QREFELT $ 39))
                                       (QREFELT $ 41))
                             (LETT |eps|
                                   (SPADCALL |abs_z| |eps| (QREFELT $ 24))
                                   . #2#)))
                           (EXIT (SPADCALL |z| |w| |eps| (QREFELT $ 96)))))))
                       (LETT |cbit2| (QUOTIENT2 |cbit| 2) . #2#)
                       (SPADCALL (+ |cbit| |cbit2|) (QREFELT $ 42))
                       (LETT |e1|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 15) (QREFELT $ 34))
                              (QREFELT $ 35))
                             . #2#)
                       (LETT |h2|
                             (SPADCALL |z|
                                       (SPADCALL |e1| (|spadConstant| $ 62)
                                                 (QREFELT $ 63))
                                       (QREFELT $ 26))
                             . #2#)
                       (LETT |h| (SPADCALL |h2| (QREFELT $ 135)) . #2#)
                       (SPADCALL |cbit| (QREFELT $ 42))
                       (LETT |w1| (SPADCALL |h| |h2| (QREFELT $ 98)) . #2#)
                       (EXIT
                        (COND
                         ((<
                           (SPADCALL (SPADCALL |h2| (QREFELT $ 72))
                                     (QREFELT $ 53))
                           (- |cbit2|))
                          (SPADCALL |w1| (|spadConstant| $ 7) (QREFELT $ 27)))
                         (#1#
                          (SPADCALL |z|
                                    (SPADCALL |w1| (|spadConstant| $ 7)
                                              (QREFELT $ 27))
                                    |eps| (QREFELT $ 96)))))))))))))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G310)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FloatSpecialFunctions|)
                . #2=(|FloatSpecialFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FloatSpecialFunctions|
                         (LIST
                          (CONS NIL (CONS 1 (|FloatSpecialFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FloatSpecialFunctions|))))))))))) 

(DEFUN |FloatSpecialFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FloatSpecialFunctions|) . #1=(|FloatSpecialFunctions|))
      (LETT $ (GETREFV 137) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

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
              (181 . *) (187 . >) (193 . |max|) (197 . |order|) (202 . -)
              (208 . |log2|) (212 . +) (218 . |wholePart|) (223 . *)
              (229 . |imag|) (234 . |pi|) (238 . |imaginary|) (242 . |Zero|)
              (246 . |complex|) |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8|
              (252 . <=) |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10|
              |FSFUN;Beta;3F;11| (258 . |abs|) |FSFUN;rabs;2F;12|
              |FSFUN;rabs;CF;13| (|DoubleFloat|) |FSFUN;rabs;2Df;14|
              (|Complex| 73) (263 . |abs|) (268 . |real|) |FSFUN;rabs;CDf;15|
              (273 . -) (278 . |norm|) (283 . |sqrt|) (288 . |cos|)
              |FSFUN;digamma;2C;18| |FSFUN;digamma;2F;19| (293 . |log|)
              (298 . |convert|) (303 . |round|) (308 . |retract|) (313 . |One|)
              (317 . >=) |FSFUN;li2;2C;22| |FSFUN;dilog;2C;24|
              |FSFUN;lambert_via_newton1;4F;25|
              |FSFUN;lambert_via_newton2;4F;26|
              |FSFUN;lambert_inverse_series;3F;27|
              |FSFUN;lambert_via_newton1;2CFC;28|
              |FSFUN;lambert_via_newton2;2CFC;29|
              |FSFUN;lambert_inverse_series;3C;30|
              |FSFUN;lambert_via_newton1;4Df;31|
              |FSFUN;lambert_via_newton2;4Df;32| (323 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;33| (328 . |exp|) (333 . /)
              (339 . -) (345 . |One|) (349 . +)
              |FSFUN;lambert_via_newton1;2CDfC;34| (355 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;35| (360 . |coerce|) (365 . *)
              |FSFUN;lambert_inverse_series;3C;36| (371 . |float|)
              (377 . |order|) (382 . >) (388 . >) (394 . -) (399 . *)
              (405 . |sqrt|) |FSFUN;lambertW;2Df;37| (410 . |Zero|) (414 . =)
              (420 . |imag|) (425 . |complex|) (431 . *) (437 . |sqrt|)
              |FSFUN;lambertW;2C;38| (442 . =) (448 . |float|) (454 . |float|)
              |FSFUN;lambertW;2F;39| (461 . |coerce|) (466 . |convert|)
              (471 . |sqrt|) |FSFUN;lambertW;2C;40|)
           '#(|rabs| 476 |logGamma| 496 |li2| 506 |lambert_via_newton2| 511
              |lambert_via_newton1| 539 |lambert_inverse_series| 567 |lambertW|
              591 |dilog| 611 |digamma| 616 |Gamma| 626 |Beta| 636)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 136
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
                                                   40 0 0 51 0 14 0 52 1 14 10
                                                   0 53 2 14 0 0 0 54 0 14 0 55
                                                   2 14 0 0 0 56 1 14 10 0 57 2
                                                   10 0 16 0 58 1 6 14 0 59 0
                                                   14 0 60 0 6 0 61 0 14 0 62 2
                                                   6 0 14 14 63 2 14 40 0 0 66
                                                   1 14 0 0 70 1 75 0 0 76 1 75
                                                   73 0 77 1 6 0 0 79 1 6 14 0
                                                   80 1 14 0 0 81 1 6 0 0 82 1
                                                   73 0 0 85 1 14 73 0 86 1 73
                                                   0 0 87 1 73 10 0 88 0 11 0
                                                   89 2 14 40 0 0 90 1 73 0 11
                                                   101 1 75 0 0 103 2 75 0 0 0
                                                   104 2 75 0 0 0 105 0 75 0
                                                   106 2 75 0 0 0 107 1 75 0 0
                                                   109 1 75 0 11 111 2 75 0 0 0
                                                   112 2 73 0 10 10 114 1 73 10
                                                   0 115 2 10 40 0 0 116 2 73
                                                   40 0 0 117 1 11 0 0 118 2 73
                                                   0 16 0 119 1 73 0 0 120 0 75
                                                   0 122 2 75 40 0 0 123 1 75
                                                   73 0 124 2 75 0 73 73 125 2
                                                   75 0 73 0 126 1 75 0 0 127 2
                                                   14 40 0 0 129 2 14 0 10 10
                                                   130 3 14 0 10 10 16 131 1 14
                                                   73 0 133 1 14 0 73 134 1 6 0
                                                   0 135 1 0 14 14 71 1 0 14 6
                                                   72 1 0 73 75 78 1 0 73 73 74
                                                   1 0 14 14 67 1 0 6 6 64 1 0
                                                   6 6 91 3 0 73 73 73 73 100 3
                                                   0 14 14 14 14 94 3 0 75 75
                                                   75 73 110 3 0 6 6 6 14 97 3
                                                   0 73 73 73 73 99 3 0 14 14
                                                   14 14 93 3 0 75 75 75 73 108
                                                   3 0 6 6 6 14 96 2 0 73 73 73
                                                   102 2 0 14 14 14 95 2 0 75
                                                   75 75 113 2 0 6 6 6 98 1 0
                                                   14 14 132 1 0 6 6 136 1 0 73
                                                   73 121 1 0 75 75 128 1 0 6 6
                                                   92 1 0 14 14 84 1 0 6 6 83 1
                                                   0 14 14 65 1 0 6 6 47 2 0 14
                                                   14 14 69 2 0 6 6 6 68)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatSpecialFunctions| 'NILADIC T) 
