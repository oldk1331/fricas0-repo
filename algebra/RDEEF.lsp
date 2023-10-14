
(/VERSIONCHECK 2) 

(DEFUN |RDEEF;RF2GP| (|f| $)
  (PROG (#1=#:G181)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 15)) (QREFELT $ 17))
                (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 17))
                (QREFELT $ 20))
               |RDEEF;RF2GP|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0)
                      (|LaurentPolynomial| (QREFELT $ 7)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7)))
                      #1#))))) 

(DEFUN |RDEEF;logdiff| (|twr| |bad| $)
  (PROG (#1=#:G189 |u| #2=#:G188)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|RDEEF;logdiff|))
       (SEQ (LETT |u| NIL . #3#) (LETT #1# |twr| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND
                 ((SPADCALL |u| '|log| (QREFELT $ 24))
                  (COND ((SPADCALL |u| |bad| (QREFELT $ 26)) 'NIL) (#4='T 'T)))
                 (#4# 'NIL))
                (LETT #2# (CONS |u| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |RDEEF;rischDEalg| (|n| |nfp| |f| |g| |k| |l| |x| |limint| |extint| $)
  (PROG (|rc| |lv| |lk| |y| |rec| |u| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 28))
                . #1=(|RDEEF;rischDEalg|))
          (QREFELT $ 30))
         0)
        (SEQ
         (LETT |u|
               (SPADCALL |nfp| |f| |g| |kx| |k|
                         (CONS #'|RDEEF;rischDEalg!0| (VECTOR $ |n|))
                         (QREFELT $ 34))
               . #1#)
         (EXIT
          (COND
           ((QEQCAR |u| 1)
            (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))
           (#2='T (VECTOR (QCDR |u|) |g| 'T))))))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 38)) (QREFELT $ 8) (QREFELT $ 39))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 41))
                         (SPADCALL |k| (QREFELT $ 41)) (QREFELT $ 44))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 46)) . #1#)
         (LETT |lk| (LIST |kx| |k|) . #1#)
         (LETT |lv|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 47))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 47)))
               . #1#)
         (LETT |rc|
               (SPADCALL |n| (SPADCALL |f| |lk| |lv| (QREFELT $ 50))
                         (SPADCALL |g| |lk| |lv| (QREFELT $ 50)) |x| |limint|
                         |extint| (QREFELT $ 60))
               . #1#)
         (EXIT
          (COND
           ((QVELT |rc| 2)
            (VECTOR
             (SPADCALL (QVELT |rc| 0) (SPADCALL |y| (QREFELT $ 61))
                       (QVELT |rec| 0) (QREFELT $ 62))
             (QVELT |rc| 1) 'T))
           (#2# (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))))))
       (#2# (|error| "Function not supported by Risch d.e."))))))) 

(DEFUN |RDEEF;rischDEalg!0| (|z1| |z2| |z3| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|RDEEF;rischDEalg|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|RDEEF;normal0| |n| |z1| |z2| |z3| $))))) 

(DEFUN |RDEEF;rischDE;I2FSMMR;4| (|n| |f| |g| |x| |limitedint| |extendedint| $)
  (PROG (|k| |vl| |y| |u| |nfp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |g| (QREFELT $ 63)) (VECTOR (|spadConstant| $ 36) |g| 'T))
       ((SPADCALL
         (LETT |nfp|
               (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 64)) (QREFELT $ 65))
               . #1=(|RDEEF;rischDE;I2FSMMR;4|))
         (QREFELT $ 63))
        (SEQ (LETT |u| (SPADCALL |g| NIL |limitedint|) . #1#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))
               (#2='T (VECTOR (QCAR (QCDR |u|)) |g| 'T))))))
       ((SPADCALL (LETT |y| (SPADCALL |g| |nfp| (QREFELT $ 66)) . #1#) |x|
                  (QREFELT $ 67))
        (VECTOR |y| |g| 'T))
       (#2#
        (SEQ
         (LETT |vl|
               (SPADCALL
                (SPADCALL (SPADCALL |nfp| (QREFELT $ 68))
                          (SPADCALL |g| (QREFELT $ 68)) (QREFELT $ 69))
                |x| (QREFELT $ 70))
               . #1#)
         (EXIT
          (COND
           ((QEQCAR
             (SPADCALL (LETT |k| (SPADCALL |vl| (QREFELT $ 71)) . #1#)
                       (QREFELT $ 30))
             0)
            (|RDEEF;normalise0| |n| |f| |g| |x| $))
           ((OR (SPADCALL |k| '|log| (QREFELT $ 24))
                (SPADCALL |k| '|exp| (QREFELT $ 24)))
            (|RDEEF;normalise| |n| |nfp| |f| |g| |x| |k| |limitedint|
             |extendedint| $))
           ('T
            (COND
             ((SPADCALL (SPADCALL |k| (QREFELT $ 38)) (QREFELT $ 8)
                        (QREFELT $ 39))
              (|RDEEF;rischDEalg| |n| |nfp| |f| |g| |k| |vl| |x| |limitedint|
               |extendedint| $))
             (#2# (|error| "Function not supported by Risch d.e."))))))))))))) 

(DEFUN |RDEEF;normal0| (|n| |f| |g| |x| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|RDEEF;normalise0| |n| |f| |g| |x| $) |RDEEF;normal0|)
          (EXIT
           (COND ((QVELT |rec| 2) (CONS 0 (QVELT |rec| 0)))
                 ('T (CONS 1 "failed")))))))) 

(DEFUN |RDEEF;normalise0| (|n| |f| |g| |x| $)
  (PROG (|y| |rec| |f'| |p| #1=#:G264 |m| #2=#:G270 |v| |nfprime| |data|
         |data1| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 72)) . #3=(|RDEEF;normalise0|))
          (SEQ
           (LETT |data1| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 74)) . #3#)
           (EXIT
            (COND
             ((QEQCAR |data1| 1)
              (SPADCALL (QREFELT $ 12) |f|
                        (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #3#)
                        (QREFELT $ 76)))
             (#4='T (LETT |data| (QCDR |data1|) . #3#)))))
          (LETT |f'|
                (LETT |nfprime|
                      (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 64))
                                (QREFELT $ 65))
                      . #3#)
                . #3#)
          (LETT |p| (|spadConstant| $ 78) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |data| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LETT |m| (* |n| (QCAR |v|)) . #3#) 0
                             (QREFELT $ 79))
                   (SEQ
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL (QCDR |v|)
                                              (PROG1 (LETT #1# |m| . #3#)
                                                (|check_subtype| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                              (QREFELT $ 81))
                                    (QREFELT $ 82))
                          . #3#)
                    (EXIT
                     (LETT |f'|
                           (SPADCALL |f'|
                                     (SPADCALL
                                      (SPADCALL |m|
                                                (SPADCALL
                                                 (SPADCALL (QCDR |v|)
                                                           (QREFELT $ 84))
                                                 |x| (QREFELT $ 64))
                                                (QREFELT $ 65))
                                      (SPADCALL (QCDR |v|) (QREFELT $ 84))
                                      (QREFELT $ 66))
                                     (QREFELT $ 85))
                           . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL (SPADCALL |f'| |k| (QREFELT $ 87))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 84)) |g|
                                     (QREFELT $ 88))
                           |k| (QREFELT $ 87))
                          (QREFELT $ 91))
                . #3#)
          (LETT |y|
                (SPADCALL (SPADCALL (QCAR |rec|) |k| (QREFELT $ 93))
                          (SPADCALL |p| (QREFELT $ 84)) (QREFELT $ 66))
                . #3#)
          (EXIT
           (COND
            ((QCDR |rec|)
             (VECTOR |y|
                     (SPADCALL (SPADCALL |y| |x| (QREFELT $ 64))
                               (SPADCALL |nfprime| |y| (QREFELT $ 88))
                               (QREFELT $ 94))
                     'NIL))
            (#4# (VECTOR |y| |g| 'T)))))))) 

(DEFUN |RDEEF;normalise|
       (|n| |nfp| |f| |g| |x| |k| |limitedint| |extendedint| $)
  (PROG (|ans1| #1=#:G306 |ftwr| |twr| |newg| |newf| |p| #2=#:G280 |m|
         #3=#:G310 |v| |data| |data1|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |data1| (SPADCALL |f| (QREFELT $ 12) (QREFELT $ 74))
             . #4=(|RDEEF;normalise|))
       (EXIT
        (COND
         ((QEQCAR |data1| 1)
          (SPADCALL (QREFELT $ 12) |f|
                    (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #4#)
                    (QREFELT $ 76)))
         (#5='T (LETT |data| (QCDR |data1|) . #4#)))))
      (LETT |p| (|spadConstant| $ 78) . #4#)
      (SEQ (LETT |v| NIL . #4#) (LETT #3# |data| . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (LETT |m| (* |n| (QCAR |v|)) . #4#) 0 (QREFELT $ 79))
               (SEQ
                (LETT |p|
                      (SPADCALL |p|
                                (SPADCALL (QCDR |v|)
                                          (PROG1 (LETT #2# |m| . #4#)
                                            (|check_subtype| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                          (QREFELT $ 81))
                                (QREFELT $ 82))
                      . #4#)
                (LETT |f|
                      (SPADCALL |f|
                                (SPADCALL (QCAR |v|)
                                          (SPADCALL
                                           (SPADCALL (QCDR |v|) (QREFELT $ 84))
                                           (QREFELT $ 95))
                                          (QREFELT $ 65))
                                (QREFELT $ 85))
                      . #4#)
                (EXIT
                 (LETT |nfp|
                       (SPADCALL |nfp|
                                 (SPADCALL
                                  (SPADCALL |m|
                                            (SPADCALL
                                             (SPADCALL (QCDR |v|)
                                                       (QREFELT $ 84))
                                             |x| (QREFELT $ 64))
                                            (QREFELT $ 65))
                                  (SPADCALL (QCDR |v|) (QREFELT $ 84))
                                  (QREFELT $ 66))
                                 (QREFELT $ 85))
                       . #4#)))))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |newf| (SPADCALL |nfp| |k| (QREFELT $ 87)) . #4#)
      (LETT |newg|
            (SPADCALL
             (SPADCALL (SPADCALL |p| (QREFELT $ 84)) |g| (QREFELT $ 88)) |k|
             (QREFELT $ 87))
            . #4#)
      (LETT |twr|
            (SPADCALL (|RDEEF;logdiff| (SPADCALL |f| (QREFELT $ 96)) NIL $)
                      (|RDEEF;logdiff| (SPADCALL |g| (QREFELT $ 96)) NIL $)
                      (QREFELT $ 69))
            . #4#)
      (LETT |ftwr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 96))
                      (SPADCALL |g| (QREFELT $ 96)) (QREFELT $ 69))
            . #4#)
      (LETT |ans1|
            (COND
             ((SPADCALL |k| '|log| (QREFELT $ 24))
              (|RDEEF;rischDElog| |twr| |newf| |newg| |x| |k|
               (CONS #'|RDEEF;normalise!1| (VECTOR |k| |x| $)) |limitedint|
               |extendedint| $))
             (#5#
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 24))
                  (PROGN
                   (LETT #1#
                         (|RDEEF;rischDEexp| |twr| |ftwr| |newf| |newg| |x| |k|
                          (CONS #'|RDEEF;normalise!3| (VECTOR |k| |x| $))
                          |limitedint| |extendedint| $)
                         . #4#)
                   (GO #1#)))))
               #1# (EXIT #1#))))
            . #4#)
      (EXIT
       (COND
        ((QEQCAR |ans1| 1)
         (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))
        (#5#
         (VECTOR
          (SPADCALL (SPADCALL (QCDR |ans1|) |k| (QREFELT $ 93))
                    (SPADCALL |p| (QREFELT $ 84)) (QREFELT $ 66))
          |g| 'T)))))))) 

(DEFUN |RDEEF;normalise!3| (|z1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|RDEEF;normalise|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |z1| (CONS #'|RDEEF;normalise!2| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT $ 101)) (QREFELT $ 102))
                     |x| (QREFELT $ 64))
                    (|spadConstant| $ 104) (QREFELT $ 105))
                   (QREFELT $ 99)))))))) 

(DEFUN |RDEEF;normalise!2| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 64)))))) 

(DEFUN |RDEEF;normalise!1| (|z1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|RDEEF;normalise|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |z1| (CONS #'|RDEEF;normalise!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 41)) |x| (QREFELT $ 64))
                    (QREFELT $ 97))
                   (QREFELT $ 99)))))))) 

(DEFUN |RDEEF;normalise!0| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 64)))))) 

(DEFUN |RDEEF;makeData| (|f| |x| |k| $)
  (PROG (|disasters| |n| |cf| |num| |logand| #1=#:G323 |u| |fden| |fnum|)
    (RETURN
     (SEQ (LETT |disasters| NIL . #2=(|RDEEF;makeData|))
          (LETT |fnum| (SPADCALL |f| (QREFELT $ 106)) . #2#)
          (LETT |fden| (SPADCALL |f| (QREFELT $ 107)) . #2#)
          (SEQ (LETT |u| NIL . #2#)
               (LETT #1#
                     (SPADCALL (SPADCALL |f| (QREFELT $ 68)) |x|
                               (QREFELT $ 70))
                     . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |u| '|log| (QREFELT $ 24))
                   (SEQ
                    (LETT |logand| (|SPADfirst| (SPADCALL |u| (QREFELT $ 101)))
                          . #2#)
                    (EXIT
                     (COND
                      ((ZEROP
                        (SPADCALL (SPADCALL |fden| |u| (QREFELT $ 108))
                                  (QREFELT $ 110)))
                       (COND
                        ((EQL
                          (SPADCALL
                           (LETT |num| (SPADCALL |fnum| |u| (QREFELT $ 108))
                                 . #2#)
                           (QREFELT $ 110))
                          1)
                         (SEQ
                          (LETT |cf|
                                (SPADCALL (SPADCALL |num| (QREFELT $ 111))
                                          |fden| (QREFELT $ 112))
                                . #2#)
                          (LETT |n| (SPADCALL |cf| (QREFELT $ 114)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |n| 0)
                             (SEQ
                              (COND
                               ((SPADCALL
                                 (SPADCALL (SPADCALL |logand| (QREFELT $ 106))
                                           |k| (QREFELT $ 115))
                                 0 (QREFELT $ 116))
                                (LETT |disasters|
                                      (CONS
                                       (CONS (QCDR |n|)
                                             (SPADCALL |logand|
                                                       (QREFELT $ 106)))
                                       |disasters|)
                                      . #2#)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL (SPADCALL |logand| (QREFELT $ 107))
                                            |k| (QREFELT $ 115))
                                  0 (QREFELT $ 116))
                                 (LETT |disasters|
                                       (CONS
                                        (CONS (- (QCDR |n|))
                                              (SPADCALL |logand|
                                                        (QREFELT $ 107)))
                                        |disasters|)
                                       . #2#)))))))))))))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |disasters|))))) 

(DEFUN |RDEEF;rischDElog|
       (|twr| |f| |g| |x| |theta| |driv| |limint| |extint| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |g| |driv| (QREFELT $ 120))
            . #1=(|RDEEF;rischDElog|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |v|
                     (|RDEEF;polyDElog| |twr| (QVELT (QCDR |u|) 0)
                      (SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 121))
                      (SPADCALL (QVELT (QCDR |u|) 2) (QREFELT $ 121)) |x|
                      |theta| |driv| |limint| |extint| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |v|) (QVELT (QCDR |u|) 3)
                                       (QREFELT $ 122)))))))))))))) 

(DEFUN |RDEEF;rischDEexp|
       (|twr| |ftwr| |f| |g| |x| |theta| |driv| |limint| |extint| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |g| |driv| (QREFELT $ 120))
            . #1=(|RDEEF;rischDEexp|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |v|
                     (|RDEEF;gpolDEexp| |twr| |ftwr| (QVELT (QCDR |u|) 0)
                      (|RDEEF;RF2GP| (QVELT (QCDR |u|) 1) $)
                      (|RDEEF;RF2GP| (QVELT (QCDR |u|) 2) $) |x| |theta| |driv|
                      |limint| |extint| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 123))
                                       (SPADCALL (QVELT (QCDR |u|) 3)
                                                 (QREFELT $ 124))
                                       (QREFELT $ 125)))))))))))))) 

(DEFUN |RDEEF;polyDElog|
       (|twr| |aa| |bb| |cc| |x| |t| |driv| |limint| |extint| $)
  (PROG (|u3| |u2| |w| #1=#:G417 |v| |n| |nn| |r| |i| #2=#:G401 #3=#:G432 |ans|
         |alph| |if0| #4=#:G434 |u| #5=#:G433 |lk1| |lk0| |f0| |da| |db| |t'|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |cc| (QREFELT $ 126)) (CONS 0 (|spadConstant| $ 127)))
             (#6='T
              (SEQ
               (LETT |t'|
                     (SPADCALL (SPADCALL |t| (QREFELT $ 41)) |x|
                               (QREFELT $ 64))
                     . #7=(|RDEEF;polyDElog|))
               (EXIT
                (COND
                 ((SPADCALL |bb| (QREFELT $ 126))
                  (SEQ (LETT |u| (SPADCALL |cc| |aa| (QREFELT $ 128)) . #7#)
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#6#
                               (SPADCALL (QCDR |u|)
                                         (CONS #'|RDEEF;polyDElog!0|
                                               (VECTOR |extint| |t'|))
                                         |t'| (QREFELT $ 132)))))))
                 (#6#
                  (SEQ
                   (LETT |n|
                         (- (SPADCALL |cc| (QREFELT $ 133))
                            (LETT |db| (SPADCALL |bb| (QREFELT $ 133)) . #7#))
                         . #7#)
                   (SEQ (LETT |da| (SPADCALL |aa| (QREFELT $ 133)) . #7#)
                        (EXIT
                         (COND
                          ((EQL |da| |db|)
                           (COND
                            ((SPADCALL |da| 0 (QREFELT $ 79))
                             (SEQ
                              (LETT |lk0|
                                    (SPADCALL
                                     (LETT |f0|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |bb| (QREFELT $ 134))
                                             (SPADCALL |aa| (QREFELT $ 134))
                                             (QREFELT $ 66))
                                            (QREFELT $ 135))
                                           . #7#)
                                     (QREFELT $ 96))
                                    . #7#)
                              (LETT |lk1| (|RDEEF;logdiff| |twr| |lk0| $)
                                    . #7#)
                              (LETT |if0|
                                    (SPADCALL |f0|
                                              (PROGN
                                               (LETT #5# NIL . #7#)
                                               (SEQ (LETT |u| NIL . #7#)
                                                    (LETT #4# |lk1| . #7#) G190
                                                    (COND
                                                     ((OR (ATOM #4#)
                                                          (PROGN
                                                           (LETT |u| (CAR #4#)
                                                                 . #7#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #5#
                                                            (CONS
                                                             (|SPADfirst|
                                                              (SPADCALL |u|
                                                                        (QREFELT
                                                                         $
                                                                         101)))
                                                             #5#)
                                                            . #7#)))
                                                    (LETT #4# (CDR #4#) . #7#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #5#))))
                                              |limint|)
                                    . #7#)
                              (EXIT
                               (COND
                                ((QEQCAR |if0| 1)
                                 (|error| "Risch's theorem violated"))
                                (#6#
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |alph|
                                          (SPADCALL |lk0|
                                                    (|RDEEF;RRF2F| (QCDR |if0|)
                                                     $)
                                                    |x| (QREFELT $ 137))
                                          . #7#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |alph| 0)
                                       (PROGN
                                        (LETT #2#
                                              (PROGN
                                               (LETT #3#
                                                     (SEQ
                                                      (LETT |ans|
                                                            (|RDEEF;polyDElog|
                                                             |twr|
                                                             (SPADCALL
                                                              (QCDR |alph|)
                                                              |aa|
                                                              (QREFELT $ 138))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QCDR |alph|)
                                                                |x|
                                                                (QREFELT $ 64))
                                                               |aa|
                                                               (QREFELT $ 138))
                                                              (SPADCALL
                                                               (QCDR |alph|)
                                                               |bb|
                                                               (QREFELT $ 138))
                                                              (QREFELT $ 139))
                                                             |cc| |x| |t|
                                                             |driv| |limint|
                                                             |extint| $)
                                                            . #7#)
                                                      (EXIT
                                                       (COND
                                                        ((QEQCAR |ans| 1)
                                                         (CONS 1 "failed"))
                                                        (#6#
                                                         (CONS 0
                                                               (SPADCALL
                                                                (QCDR |alph|)
                                                                (QCDR |ans|)
                                                                (QREFELT $
                                                                         138)))))))
                                                     . #7#)
                                               (GO #3#))
                                              . #7#)
                                        (GO #2#)))))))
                                  #2# (EXIT #2#))))))))))))
                   (COND
                    ((SPADCALL |da| (+ |db| 1) (QREFELT $ 79))
                     (LETT |n|
                           (MAX 0
                                (+ (- (SPADCALL |cc| (QREFELT $ 133)) |da|) 1))
                           . #7#)))
                   (COND
                    ((EQL |da| (+ |db| 1))
                     (SEQ
                      (LETT |i|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |bb| (QREFELT $ 134))
                                        (SPADCALL |aa| (QREFELT $ 134))
                                        (QREFELT $ 66))
                              (QREFELT $ 135))
                             (LIST
                              (|SPADfirst| (SPADCALL |t| (QREFELT $ 101))))
                             |limint|)
                            . #7#)
                      (EXIT
                       (COND
                        ((NULL (QEQCAR |i| 1))
                         (SEQ
                          (LETT |r|
                                (COND
                                 ((NULL (QCDR (QCDR |i|)))
                                  (|spadConstant| $ 36))
                                 (#6# (QCAR (|SPADfirst| (QCDR (QCDR |i|))))))
                                . #7#)
                          (LETT |nn| (SPADCALL |r| (QREFELT $ 114)) . #7#)
                          (EXIT
                           (COND
                            ((QEQCAR |nn| 0)
                             (LETT |n| (MAX (QCDR |nn|) |n|) . #7#)))))))))))
                   (LETT |v|
                         (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 145))
                         . #7#)
                   (EXIT
                    (COND
                     ((QEQCAR |v| 0)
                      (COND ((QCDR (CDR |v|)) (CONS 1 "failed"))
                            (#6# (CONS 0 (QCAR (CDR |v|))))))
                     (#6#
                      (SEQ
                       (LETT |w|
                             (PROG2 (LETT #1# |v| . #7#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 1)
                                              (|Record|
                                               (|:| |b|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7)))
                                               (|:| |c|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7)))
                                               (|:| |m| (|Integer|))
                                               (|:| |alpha|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7)))
                                               (|:| |beta|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                              #1#))
                             . #7#)
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |w| 0) (QREFELT $ 126))
                          (COND
                           ((SPADCALL (SPADCALL (QVELT |w| 1) (QREFELT $ 133))
                                      (QVELT |w| 2) (QREFELT $ 79))
                            (CONS 1 "failed"))
                           (#6#
                            (SEQ
                             (LETT |u2|
                                   (SPADCALL (QVELT |w| 1)
                                             (CONS #'|RDEEF;polyDElog!1|
                                                   (VECTOR |extint| |t'|))
                                             |t'| (QREFELT $ 132))
                                   . #7#)
                             (EXIT
                              (COND
                               ((OR (QEQCAR |u2| 1)
                                    (SPADCALL
                                     (SPADCALL (QCDR |u2|) (QREFELT $ 133))
                                     (QVELT |w| 2) (QREFELT $ 79)))
                                (CONS 1 "failed"))
                               ('T
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL (QVELT |w| 3) (QCDR |u2|)
                                                 (QREFELT $ 146))
                                       (QVELT |w| 4) (QREFELT $ 139))))))))))
                         (#6#
                          (SEQ
                           (LETT |u3|
                                 (|RDEEF;logdegrad| |twr|
                                  (SPADCALL (QVELT |w| 0) (QREFELT $ 147))
                                  (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                                  |extint| $)
                                 . #7#)
                           (EXIT
                            (COND ((QEQCAR |u3| 1) (CONS 1 "failed"))
                                  (#6#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL (QVELT |w| 3) (QCDR |u3|)
                                                    (QREFELT $ 146))
                                          (QVELT |w| 4)
                                          (QREFELT $ 139))))))))))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |RDEEF;polyDElog!1| (|z1| $$)
  (PROG (|t'| |extint|)
    (LETT |t'| (QREFELT $$ 1) . #1=(|RDEEF;polyDElog|))
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |t'| |extint|))))) 

(DEFUN |RDEEF;polyDElog!0| (|z1| $$)
  (PROG (|t'| |extint|)
    (LETT |t'| (QREFELT $$ 1) . #1=(|RDEEF;polyDElog|))
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |t'| |extint|))))) 

(DEFUN |RDEEF;gpolDEexp|
       (|twr| |ftwr| |a| |b| |c| |x| |t| |driv| |limint| |extint| $)
  (PROG (|v| |tm| #1=#:G455 |m| |lb| |nc| |nb| |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (QREFELT $ 148)) (CONS 0 (|spadConstant| $ 149)))
            ((SPADCALL |b| (QREFELT $ 148))
             (SEQ
              (LETT |u|
                    (SPADCALL |c| (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 20))
                    . #2=(|RDEEF;gpolDEexp|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#3='T
                      (SPADCALL (QCDR |u|)
                                (CONS #'|RDEEF;gpolDEexp!0|
                                      (VECTOR |extint| |limint| |x| $ |t|))
                                (QREFELT $ 152)))))))
            (#3#
             (SEQ
              (LETT |lb|
                    (|RDEEF;boundAt0| |twr| |ftwr|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| 0 (QREFELT $ 153))
                                (SPADCALL |a| 0 (QREFELT $ 154))
                                (QREFELT $ 66))
                      (QREFELT $ 135))
                     (LETT |nb| (SPADCALL |b| (QREFELT $ 155)) . #2#)
                     (LETT |nc| (SPADCALL |c| (QREFELT $ 155)) . #2#) |x| |t|
                     |limint| $)
                    . #2#)
              (LETT |tm|
                    (SPADCALL (|spadConstant| $ 141)
                              (PROG1
                                  (LETT #1#
                                        (LETT |m|
                                              (MAX 0
                                                   (MAX (- |nb|)
                                                        (- |lb| |nc|)))
                                              . #2#)
                                        . #2#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 105))
                    . #2#)
              (LETT |v|
                    (|RDEEF;polyDEexp| |twr| |ftwr|
                     (SPADCALL |a| |tm| (QREFELT $ 146))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |lb|
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 101)))
                                   |x| (QREFELT $ 64))
                                  (QREFELT $ 65))
                        |a| (QREFELT $ 138))
                       |tm| (QREFELT $ 146))
                      (SPADCALL
                       (SPADCALL |b| (SPADCALL |tm| (QREFELT $ 17))
                                 (QREFELT $ 157))
                       (QREFELT $ 158))
                      (QREFELT $ 139))
                     (SPADCALL
                      (SPADCALL |c|
                                (SPADCALL (|spadConstant| $ 141) (- |m| |lb|)
                                          (QREFELT $ 159))
                                (QREFELT $ 157))
                      (QREFELT $ 158))
                     |x| |t| |driv| |limint| |extint| $)
                    . #2#)
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                     (#3#
                      (CONS 0
                            (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 17))
                                      (SPADCALL (|spadConstant| $ 141) |lb|
                                                (QREFELT $ 159))
                                      (QREFELT $ 157))))))))))))) 

(DEFUN |RDEEF;gpolDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;gpolDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 101)) (QREFELT $ 102))
                |z2| |x| |limint| |extint| (QREFELT $ 60)))))) 

(DEFUN |RDEEF;polyDEexp|
       (|twr| |ftwr| |aa| |bb| |cc| |x| |t| |driv| |limint| |extint| $)
  (PROG (|u| |w| #1=#:G492 |v| |n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |cc| (QREFELT $ 126)) (CONS 0 (|spadConstant| $ 127)))
            ((SPADCALL |bb| (QREFELT $ 126))
             (SEQ
              (LETT |u| (SPADCALL |cc| |aa| (QREFELT $ 128))
                    . #2=(|RDEEF;polyDEexp|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#3='T
                      (|RDEEF;exppolyint| (QCDR |u|)
                       (CONS #'|RDEEF;polyDEexp!0|
                             (VECTOR |extint| |limint| |x| $ |t|))
                       $))))))
            (#3#
             (SEQ
              (LETT |n|
                    (|RDEEF;boundInf| |twr| |ftwr|
                     (SPADCALL
                      (SPADCALL (SPADCALL |bb| (QREFELT $ 134))
                                (SPADCALL |aa| (QREFELT $ 134)) (QREFELT $ 66))
                      (QREFELT $ 135))
                     (SPADCALL |aa| (QREFELT $ 133))
                     (SPADCALL |bb| (QREFELT $ 133))
                     (SPADCALL |cc| (QREFELT $ 133)) |x| |t| |limint| $)
                    . #2#)
              (LETT |v| (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 145))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((QCDR (CDR |v|)) (CONS 1 "failed"))
                       (#3# (CONS 0 (QCAR (CDR |v|))))))
                (#3#
                 (SEQ
                  (LETT |w|
                        (PROG2 (LETT #1# |v| . #2#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 1)
                                         (|Record|
                                          (|:| |b|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7)))
                                          (|:| |c|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7)))
                                          (|:| |m| (|Integer|))
                                          (|:| |alpha|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7)))
                                          (|:| |beta|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))))
                                         #1#))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT |w| 0) (QREFELT $ 126))
                     (COND
                      ((SPADCALL (SPADCALL (QVELT |w| 1) (QREFELT $ 133))
                                 (QVELT |w| 2) (QREFELT $ 79))
                       (CONS 1 "failed"))
                      (#3#
                       (SEQ
                        (LETT |u|
                              (|RDEEF;exppolyint| (QVELT |w| 1)
                               (CONS #'|RDEEF;polyDEexp!1|
                                     (VECTOR |extint| |limint| |x| $ |t|))
                               $)
                              . #2#)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#3#
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL (QVELT |w| 3) (QCDR |u|)
                                                 (QREFELT $ 146))
                                       (QVELT |w| 4) (QREFELT $ 139))))))))))
                    (#3#
                     (SEQ
                      (LETT |u|
                            (|RDEEF;expdegrad| |twr|
                             (SPADCALL (QVELT |w| 0) (QREFELT $ 147))
                             (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                             |extint| $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                             (#3#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (QVELT |w| 3) (QCDR |u|)
                                               (QREFELT $ 146))
                                     (QVELT |w| 4)
                                     (QREFELT $ 139))))))))))))))))))))) 

(DEFUN |RDEEF;polyDEexp!1| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 101)) (QREFELT $ 102))
                |z2| |x| |limint| |extint| (QREFELT $ 60)))))) 

(DEFUN |RDEEF;polyDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 101)) (QREFELT $ 102))
                |z2| |x| |limint| |extint| (QREFELT $ 60)))))) 

(DEFUN |RDEEF;exppolyint| (|p| |rischdiffeq| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (SPADCALL |p| (QREFELT $ 17)) |rischdiffeq|
                      (QREFELT $ 152))
            |RDEEF;exppolyint|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (SPADCALL (QCDR |u|) (QREFELT $ 160))))))))) 

(DEFUN |RDEEF;boundInf|
       (|twr| |ftwr| |f0| |da| |db| |dc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G538 |u| #2=#:G537 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((< |da| |db|) (- |dc| |db|))
            ((SPADCALL |da| |db| (QREFELT $ 79)) (MAX 0 (- |dc| |da|)))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 96))
                           . #4=(|RDEEF;boundInf|))
                     $)
                    . #4#)
              (LETT |if0|
                    (SPADCALL |f0|
                              (PROGN
                               (LETT #2# NIL . #4#)
                               (SEQ (LETT |u| NIL . #4#) (LETT #1# |l1| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |u| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|SPADfirst|
                                              (SPADCALL |u| (QREFELT $ 101)))
                                             #2#)
                                            . #4#)))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              |limitedint|)
                    . #4#)
              (EXIT
               (COND ((QEQCAR |if0| 1) (|error| "Risch's theorem violated"))
                     (#3#
                      (SEQ
                       (LETT |alpha|
                             (SPADCALL |ftwr| (|RDEEF;RRF2F| (QCDR |if0|) $)
                                       |x| (QREFELT $ 137))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 87))
                                  (QREFELT $ 162))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 163))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 164))
                               (EXIT
                                (MAX 0
                                     (MAX
                                      (SPADCALL (QCAR |al|) (QREFELT $ 165))
                                      (- |dc| |db|))))))))
                           (EXIT (- |dc| |db|))))
                         (#3# (- |dc| |db|))))))))))))))) 

(DEFUN |RDEEF;boundAt0| (|twr| |ftwr| |f0| |nb| |nc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G556 |u| #2=#:G555 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |nb| 0 (QREFELT $ 166)) (MIN 0 (- |nc| (MIN 0 |nb|))))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 96))
                           . #4=(|RDEEF;boundAt0|))
                     $)
                    . #4#)
              (LETT |if0|
                    (SPADCALL |f0|
                              (PROGN
                               (LETT #2# NIL . #4#)
                               (SEQ (LETT |u| NIL . #4#) (LETT #1# |l1| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |u| (CAR #1#) . #4#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|SPADfirst|
                                              (SPADCALL |u| (QREFELT $ 101)))
                                             #2#)
                                            . #4#)))
                                    (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              |limitedint|)
                    . #4#)
              (EXIT
               (COND ((QEQCAR |if0| 1) (|error| "Risch's theorem violated"))
                     (#3#
                      (SEQ
                       (LETT |alpha|
                             (SPADCALL |ftwr| (|RDEEF;RRF2F| (QCDR |if0|) $)
                                       |x| (QREFELT $ 137))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 87))
                                  (QREFELT $ 162))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 163))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 164))
                               (EXIT
                                (MIN 0
                                     (MIN
                                      (SPADCALL (QCAR |al|) (QREFELT $ 165))
                                      |nc|)))))))
                           (EXIT (MIN 0 |nc|))))
                         (#3# (MIN 0 |nc|))))))))))))))) 

(DEFUN |RDEEF;logdegrad| (|twr| |b| |c| |n| |x| |t| |limitedint| |extint| $)
  (PROG (#1=#:G577 #2=#:G576 #3=#:G578 #4=#:G588 |v| |u1| |alpha| |if0|
         #5=#:G587 |u| #6=#:G586 |lk1| |lk0| |f0| |t'|)
    (RETURN
     (SEQ
      (LETT |t'| (SPADCALL (SPADCALL |t| (QREFELT $ 41)) |x| (QREFELT $ 64))
            . #7=(|RDEEF;logdegrad|))
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL (LETT |f0| (SPADCALL |b| (QREFELT $ 135)) . #7#)
                             (QREFELT $ 96))
                   . #7#)
             $)
            . #7#)
      (LETT |if0|
            (SPADCALL |f0|
                      (PROGN
                       (LETT #6# NIL . #7#)
                       (SEQ (LETT |u| NIL . #7#) (LETT #5# |lk1| . #7#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (|SPADfirst|
                                      (SPADCALL |u| (QREFELT $ 101)))
                                     #6#)
                                    . #7#)))
                            (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      |limitedint|)
            . #7#)
      (EXIT
       (COND ((QEQCAR |if0| 1) (|error| "Risch's theorem violated"))
             (#8='T
              (SEQ
               (LETT |alpha|
                     (SPADCALL |lk0| (|RDEEF;RRF2F| (QCDR |if0|) $) |x|
                               (QREFELT $ 137))
                     . #7#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |u1|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCDR |alpha|) (QREFELT $ 167))
                                    |c| (QREFELT $ 138))
                          (CONS #'|RDEEF;logdegrad!0| (VECTOR |extint| |t'|))
                          |t'| (QREFELT $ 132))
                         . #7#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |u1| 1)
                          (SPADCALL (SPADCALL (QCDR |u1|) (QREFELT $ 133)) |n|
                                    (QREFELT $ 79)))
                      (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL (QCDR |alpha|) (QCDR |u1|)
                                      (QREFELT $ 138))))))))
                 (#8#
                  (|RDEEF;logdeg| |c|
                   (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 135))
                             (PROGN
                              (LETT #1# NIL . #7#)
                              (SEQ (LETT |v| NIL . #7#)
                                   (LETT #4# (QCDR (QCDR |if0|)) . #7#) G190
                                   (COND
                                    ((OR (ATOM #4#)
                                         (PROGN
                                          (LETT |v| (CAR #4#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #3#
                                            (SPADCALL (QCAR |v|)
                                                      (SPADCALL (QCDR |v|)
                                                                (QREFELT $ 95))
                                                      (QREFELT $ 88))
                                            . #7#)
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #3# (QREFELT $ 94))
                                              . #7#))
                                       ('T
                                        (PROGN
                                         (LETT #2# #3# . #7#)
                                         (LETT #1# 'T . #7#)))))))
                                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#8# (|spadConstant| $ 36))))
                             (QREFELT $ 85))
                   |n| |x| |t'| |limitedint| |extint| $)))))))))))) 

(DEFUN |RDEEF;logdegrad!0| (|z1| $$)
  (PROG (|t'| |extint|)
    (LETT |t'| (QREFELT $$ 1) . #1=(|RDEEF;logdegrad|))
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |t'| |extint|))))) 

(DEFUN |RDEEF;logdeg| (|c| |f| |n| |x| |t'| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G606 #2=#:G613 |u| #3=#:G609 |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |answr| (|spadConstant| $ 127) . #4=(|RDEEF;logdeg|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |c| (QREFELT $ 126))
                      (PROGN (LETT #2# (CONS 0 |answr|) . #4#) (GO #2#)))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ
                         (COND
                          ((< |n| 0)
                           (EXIT
                            (PROGN
                             (LETT #2# (CONS 1 #5="failed") . #4#)
                             (GO #2#))))
                          ('T
                           (SEQ (LETT |m| (SPADCALL |c| (QREFELT $ 133)) . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |m| |n| (QREFELT $ 79))
                                   (PROGN
                                    (LETT #3#
                                          (PROGN
                                           (LETT #2# (CONS 1 #5#) . #4#)
                                           (GO #2#))
                                          . #4#)
                                    (GO #3#))))))))
                         (LETT |u|
                               (SPADCALL 1 |f| (SPADCALL |c| (QREFELT $ 134))
                                         |x| |limitedint| |extint|
                                         (QREFELT $ 60))
                               . #4#)
                         (EXIT
                          (COND
                           ((NOT (QVELT |u| 2))
                            (PROGN
                             (LETT #2# (CONS 1 "failed") . #4#)
                             (GO #2#)))
                           ((ZEROP |m|)
                            (PROGN
                             (LETT #2#
                                   (CONS 0
                                         (SPADCALL |answr|
                                                   (SPADCALL (QVELT |u| 0)
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 139)))
                                   . #4#)
                             (GO #2#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #4#)
                                 (LETT |c|
                                       (SPADCALL (SPADCALL |c| (QREFELT $ 168))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |m| |t'|
                                                             (QREFELT $ 65))
                                                   (QVELT |u| 0)
                                                   (QREFELT $ 88))
                                                  (PROG1
                                                      (LETT #1# (- |m| 1)
                                                            . #4#)
                                                    (|check_subtype| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                  (QREFELT $ 105))
                                                 (QREFELT $ 169))
                                       . #4#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 105))
                                                  (QREFELT $ 139))
                                        . #4#))))))))
                       #3# (EXIT #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |RDEEF;expdegrad| (|twr| |b| |c| |n| |x| |t| |limint| |extint| $)
  (PROG (|u1| #1=#:G631 |al| |alpha| |intf0| #2=#:G624 #3=#:G623 #4=#:G625
         #5=#:G662 |v| |if0| #6=#:G661 |u| #7=#:G660 |lk1| |lk0| |f0|)
    (RETURN
     (SEQ
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL
                    (LETT |f0| (SPADCALL |b| (QREFELT $ 135))
                          . #8=(|RDEEF;expdegrad|))
                    (QREFELT $ 96))
                   . #8#)
             $)
            . #8#)
      (LETT |if0|
            (SPADCALL |f0|
                      (PROGN
                       (LETT #7# NIL . #8#)
                       (SEQ (LETT |u| NIL . #8#) (LETT #6# |lk1| . #8#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |u| (CAR #6#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (|SPADfirst|
                                      (SPADCALL |u| (QREFELT $ 101)))
                                     #7#)
                                    . #8#)))
                            (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      |limint|)
            . #8#)
      (EXIT
       (COND ((QEQCAR |if0| 1) (|error| "Risch's theorem violated"))
             (#9='T
              (SEQ
               (LETT |intf0|
                     (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 135))
                               (PROGN
                                (LETT #2# NIL . #8#)
                                (SEQ (LETT |v| NIL . #8#)
                                     (LETT #5# (QCDR (QCDR |if0|)) . #8#) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN
                                            (LETT |v| (CAR #5#) . #8#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4#
                                              (SPADCALL (QCAR |v|)
                                                        (SPADCALL (QCDR |v|)
                                                                  (QREFELT $
                                                                           95))
                                                        (QREFELT $ 88))
                                              . #8#)
                                        (COND
                                         (#2#
                                          (LETT #3#
                                                (SPADCALL #3# #4#
                                                          (QREFELT $ 94))
                                                . #8#))
                                         ('T
                                          (PROGN
                                           (LETT #3# #4# . #8#)
                                           (LETT #2# 'T . #8#)))))))
                                     (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#2# #3#) (#9# (|spadConstant| $ 36))))
                               (QREFELT $ 85))
                     . #8#)
               (LETT |alpha|
                     (SPADCALL (CONS |t| |lk0|) (|RDEEF;RRF2F| (QCDR |if0|) $)
                               |x| (QREFELT $ 137))
                     . #8#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |al|
                         (SPADCALL (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 87))
                                   (QREFELT $ 162))
                         . #8#)
                   (COND
                    ((SPADCALL (QCDR |al|) (QREFELT $ 163))
                     (COND
                      ((SPADCALL (QCAR |al|) (QREFELT $ 164))
                       (COND
                        ((>= (SPADCALL (QCAR |al|) (QREFELT $ 165)) 0)
                         (EXIT
                          (SEQ
                           (LETT |u1|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c| (QREFELT $ 17))
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL (QCAR |al|)
                                                                (QREFELT $
                                                                         170))
                                                      . #8#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (|LaurentPolynomial|
                                                              (QREFELT $ 7)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 7)))
                                                             #1#))
                                            (QREFELT $ 157))
                                  (CONS #'|RDEEF;expdegrad!0|
                                        (VECTOR |extint| |limint| |x| $ |t|))
                                  (QREFELT $ 152))
                                 . #8#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |u1| 1)
                                  (SPADCALL
                                   (SPADCALL (QCDR |u1|) (QREFELT $ 165)) |n|
                                   (QREFELT $ 79)))
                              (CONS 1 "failed"))
                             ('T
                              (SPADCALL
                               (SPADCALL (QCAR |al|) (QCDR |u1|)
                                         (QREFELT $ 157))
                               (QREFELT $ 160)))))))))))))
                   (EXIT
                    (|RDEEF;expdeg| |c| |intf0| |n| |x|
                     (|SPADfirst| (SPADCALL |t| (QREFELT $ 101))) |limint|
                     |extint| $))))
                 (#9#
                  (|RDEEF;expdeg| |c| |intf0| |n| |x|
                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 101))) |limint|
                   |extint| $)))))))))))) 

(DEFUN |RDEEF;expdegrad!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;expdegrad|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 101)) (QREFELT $ 102))
                |z2| |x| |limint| |extint| (QREFELT $ 60)))))) 

(DEFUN |RDEEF;expdeg| (|c| |f| |n| |x| |eta| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G686 |u| #2=#:G682 |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |answr| (|spadConstant| $ 127) . #3=(|RDEEF;expdeg|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |c| (QREFELT $ 126))
                      (PROGN (LETT #1# (CONS 0 |answr|) . #3#) (GO #1#)))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ
                         (COND
                          ((< |n| 0)
                           (EXIT
                            (PROGN
                             (LETT #1# (CONS 1 #4="failed") . #3#)
                             (GO #1#))))
                          ('T
                           (SEQ (LETT |m| (SPADCALL |c| (QREFELT $ 133)) . #3#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |m| |n| (QREFELT $ 79))
                                   (PROGN
                                    (LETT #2#
                                          (PROGN
                                           (LETT #1# (CONS 1 #4#) . #3#)
                                           (GO #1#))
                                          . #3#)
                                    (GO #2#))))))))
                         (LETT |u|
                               (SPADCALL 1
                                         (SPADCALL |f|
                                                   (SPADCALL |m| |eta|
                                                             (QREFELT $ 171))
                                                   (QREFELT $ 94))
                                         (SPADCALL |c| (QREFELT $ 134)) |x|
                                         |limitedint| |extint| (QREFELT $ 60))
                               . #3#)
                         (EXIT
                          (COND
                           ((NOT (QVELT |u| 2))
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #3#)
                             (GO #1#)))
                           ((ZEROP |m|)
                            (PROGN
                             (LETT #1#
                                   (CONS 0
                                         (SPADCALL |answr|
                                                   (SPADCALL (QVELT |u| 0)
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 139)))
                                   . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #3#)
                                 (LETT |c| (SPADCALL |c| (QREFELT $ 168))
                                       . #3#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 105))
                                                  (QREFELT $ 139))
                                        . #3#))))))))
                       #2# (EXIT #2#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |RDEEF;RRF2F| (|rrf| $)
  (PROG (#1=#:G690 #2=#:G689 #3=#:G691 #4=#:G693 |v|)
    (RETURN
     (SEQ
      (SPADCALL (QCAR |rrf|)
                (PROGN
                 (LETT #1# NIL . #5=(|RDEEF;RRF2F|))
                 (SEQ (LETT |v| NIL . #5#) (LETT #4# (QCDR |rrf|) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (QCAR |v|)
                                         (SPADCALL (QCDR |v|) (QREFELT $ 95))
                                         (QREFELT $ 88))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 94)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 36))))
                (QREFELT $ 94)))))) 

(DEFUN |ElementaryRischDE| (&REST #1=#:G694)
  (PROG ()
    (RETURN
     (PROG (#2=#:G695)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryRischDE|)
                                           '|domainEqualList|)
                . #3=(|ElementaryRischDE|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryRischDE;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryRischDE|))))))))))) 

(DEFUN |ElementaryRischDE;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDE|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryRischDE| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 172) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryRischDE| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|%alg|)
      (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
      $)))) 

(MAKEPROP '|ElementaryRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Record| (|:| |coeff| 52) (|:| |argument| 77))
              (|AssociationList| 7 75) (0 . |table|) '|tab|
              (|SparseUnivariatePolynomial| 7) (|Fraction| 13) (4 . |numer|)
              (|LaurentPolynomial| 7 13) (9 . |coerce|) (14 . |denom|)
              (|Union| $ '"failed") (19 . |exquo|) (|Boolean|) (|Symbol|)
              (|Kernel| 7) (25 . |is?|) (|List| 23) (31 . |member?|)
              (|IntegrationTools| 6 7) (37 . |ksec|) (|Union| 22 '"failed")
              (44 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 31 7 7 22)
              (|PureAlgebraicIntegration| 6 7 7) (49 . |palgRDE|) (59 . |Zero|)
              (63 . |Zero|) (|BasicOperator|) (67 . |operator|) (72 . |has?|)
              (|Kernel| $) (78 . |coerce|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 13) (|:| |pol2| 13)
                        (|:| |prim| 13))
              (|FunctionSpacePrimitiveElement| 6 7) (83 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (89 . |rootOf|) (94 . |elt|)
              (|List| 40) (|List| $) (100 . |eval|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 21))
              (|Integer|) (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 53)))
              (|Union| 54 '"failed") (|Mapping| 55 7 100)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 57 '"failed") (|Mapping| 58 7 7)
              |RDEEF;rischDE;I2FSMMR;4| (107 . |retract|) (112 . |eval|)
              (119 . |zero?|) (124 . |differentiate|) (130 . *) (136 . /)
              (142 . |freeOf?|) (148 . |kernels|) (153 . |union|)
              (159 . |varselect|) (165 . |kmax|) (170 . |kernel|)
              (|Union| 75 '"failed") (175 . |search|) (|List| 9)
              (181 . |setelt|) (|SparseMultivariatePolynomial| 6 23)
              (188 . |One|) (192 . >) (|NonNegativeInteger|) (198 . ^)
              (204 . *) (|SparseMultivariatePolynomial| 6 40) (210 . |coerce|)
              (215 . -) (|Fraction| 45) (221 . |univariate|) (227 . *)
              (|Record| (|:| |ans| 14) (|:| |nosol| 21))
              (|TranscendentalRischDE| 7 13) (233 . |baseRDE|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     6 77 7)
              (239 . |multivariate|) (245 . +) (251 . |log|) (256 . |tower|)
              (261 . |coerce|) (|Mapping| 7 7) (266 . |differentiate|)
              (|List| 7) (273 . |argument|) (278 . |first|) (|PositiveInteger|)
              (283 . |One|) (287 . |monomial|) (293 . |numer|) (298 . |denom|)
              (303 . |univariate|) (|SparseUnivariatePolynomial| 77)
              (309 . |degree|) (314 . |leadingCoefficient|) (319 . /)
              (|Union| 52 '"failed") (325 . |retractIfCan|) (330 . |degree|)
              (336 . >)
              (|Record| (|:| |a| 13) (|:| |b| 14) (|:| |c| 14) (|:| |t| 13))
              (|Union| 117 '"failed") (|Mapping| 13 13) (342 . |monomRDE|)
              (349 . |retract|) (354 . /) (360 . |convert|) (365 . |coerce|)
              (370 . /) (376 . |zero?|) (381 . |Zero|) (385 . |exquo|)
              (|Union| 13 '"failed") (|Mapping| 58 7)
              (|TranscendentalIntegration| 7 13) (391 . |primintfldpoly|)
              (398 . |degree|) (403 . |leadingCoefficient|) (408 . -)
              (|ElementaryFunctionStructurePackage| 6 7)
              (413 . |validExponential|) (420 . *) (426 . +) (432 . |One|)
              (436 . |One|) (|Record| (|:| |ans| 13) (|:| |nosol| 21))
              (|Record| (|:| |b| 13) (|:| |c| 13) (|:| |m| 52) (|:| |alpha| 13)
                        (|:| |beta| 13))
              (|Union| (|:| |ans| 142) (|:| |eq| 143)) (440 . |polyRDE|)
              (449 . *) (455 . |retract|) (460 . |zero?|) (465 . |Zero|)
              (|Union| 16 '"failed") (|Mapping| 51 52 7)
              (469 . |expintfldpoly|) (475 . |coefficient|)
              (481 . |coefficient|) (487 . |order|) (492 . |Zero|) (496 . *)
              (502 . |retract|) (507 . |monomial|) (513 . |retractIfCan|)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 14))
              (518 . |separate|) (523 . |zero?|) (528 . |monomial?|)
              (533 . |degree|) (538 . ~=) (544 . |inv|) (549 . |reductum|)
              (554 . -) (560 . |recip|) (565 . *))
           '#(|rischDE| 571) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 171
                                                 '(0 10 0 11 1 14 13 0 15 1 16
                                                   0 13 17 1 14 13 0 18 2 16 19
                                                   0 0 20 2 23 21 0 22 24 2 25
                                                   21 23 0 26 3 27 23 23 25 22
                                                   28 1 23 29 0 30 6 33 31 7 7
                                                   7 23 23 32 34 0 6 0 35 0 7 0
                                                   36 1 23 37 0 38 2 37 21 0 22
                                                   39 1 7 0 40 41 2 43 42 7 7
                                                   44 1 7 0 45 46 2 13 7 0 7 47
                                                   3 7 0 0 48 49 50 1 7 40 0 61
                                                   3 7 0 0 40 0 62 1 7 21 0 63
                                                   2 7 0 0 22 64 2 7 0 52 0 65
                                                   2 7 0 0 0 66 2 7 21 0 22 67
                                                   1 7 48 0 68 2 27 25 25 25 69
                                                   2 27 25 25 22 70 1 27 23 25
                                                   71 1 23 0 22 72 2 10 73 7 0
                                                   74 3 10 75 0 7 75 76 0 77 0
                                                   78 2 52 21 0 0 79 2 77 0 0
                                                   80 81 2 77 0 0 0 82 1 7 0 83
                                                   84 2 7 0 0 0 85 2 7 86 0 40
                                                   87 2 7 0 0 0 88 2 90 89 14
                                                   14 91 2 92 7 14 23 93 2 7 0
                                                   0 0 94 1 7 0 0 95 1 7 48 0
                                                   96 1 13 0 7 97 3 13 0 0 98 0
                                                   99 1 23 100 0 101 1 100 7 0
                                                   102 0 103 0 104 2 13 0 7 80
                                                   105 1 7 83 0 106 1 7 83 0
                                                   107 2 77 45 0 23 108 1 109
                                                   80 0 110 1 109 77 0 111 2 7
                                                   0 83 83 112 1 7 113 0 114 2
                                                   77 80 0 23 115 2 80 21 0 0
                                                   116 3 90 118 14 14 119 120 1
                                                   14 13 0 121 2 14 0 13 13 122
                                                   1 16 14 0 123 1 14 0 13 124
                                                   2 14 0 0 0 125 1 13 21 0 126
                                                   0 13 0 127 2 13 19 0 0 128 3
                                                   131 129 13 130 7 132 1 13 80
                                                   0 133 1 13 7 0 134 1 7 0 0
                                                   135 3 136 31 25 7 22 137 2
                                                   13 0 7 0 138 2 13 0 0 0 139
                                                   0 6 0 140 0 7 0 141 5 90 144
                                                   13 13 13 52 119 145 2 13 0 0
                                                   0 146 1 13 7 0 147 1 16 21 0
                                                   148 0 16 0 149 2 131 150 16
                                                   151 152 2 16 7 0 52 153 2 13
                                                   7 0 80 154 1 16 52 0 155 0
                                                   77 0 156 2 16 0 0 0 157 1 16
                                                   13 0 158 2 16 0 7 52 159 1
                                                   16 129 0 160 1 16 161 14 162
                                                   1 14 21 0 163 1 16 21 0 164
                                                   1 16 52 0 165 2 52 21 0 0
                                                   166 1 7 0 0 167 1 13 0 0 168
                                                   2 13 0 0 0 169 1 16 19 0 170
                                                   2 7 0 80 0 171 6 0 51 52 7 7
                                                   22 56 59 60)))))
           '|lookupComplete|)) 
