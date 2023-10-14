
(DEFUN |RDEEF;prim?| (|k| |x| $)
  (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
        ('T
         (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                   (QREFELT $ 16))))) 

(DEFUN |RDEEF;RF2GP| (|f| $)
  (PROG (#1=#:G159)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 21))
                (SPADCALL (SPADCALL |f| (QREFELT $ 22)) (QREFELT $ 21))
                (QREFELT $ 24))
               |RDEEF;RF2GP|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0)
                      (|LaurentPolynomial| (QREFELT $ 7)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7)))
                      #1#))))) 

(DEFUN |RDEEF;logdiff| (|twr| |bad| $)
  (PROG (#1=#:G167 |u| #2=#:G166)
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
                 ((SPADCALL |u| '|log| (QREFELT $ 13))
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
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 8) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 38))
                         (SPADCALL |k| (QREFELT $ 38)) (QREFELT $ 41))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 43)) . #1#)
         (LETT |lk| (LIST |kx| |k|) . #1#)
         (LETT |lv|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 44))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 44)))
               . #1#)
         (LETT |rc|
               (SPADCALL |n| (SPADCALL |f| |lk| |lv| (QREFELT $ 47))
                         (SPADCALL |g| |lk| |lv| (QREFELT $ 47)) |x| |limint|
                         |extint| (QREFELT $ 57))
               . #1#)
         (EXIT
          (COND
           ((QVELT |rc| 2)
            (VECTOR
             (SPADCALL (QVELT |rc| 0) (SPADCALL |y| (QREFELT $ 58))
                       (QVELT |rec| 0) (QREFELT $ 59))
             (QVELT |rc| 1) 'T))
           (#2# (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))))))
       (#2# (|error| "Function not supported by Risch d.e."))))))) 

(DEFUN |RDEEF;rischDEalg!0| (|z1| |z2| |z3| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|RDEEF;rischDEalg|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|RDEEF;normal0| |n| |z1| |z2| |z3| $))))) 

(DEFUN |RDEEF;rischDE;I2FSMMR;5| (|n| |f| |g| |x| |limitedint| |extendedint| $)
  (PROG (|k| |vl| |y| |u| |nfp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |g| (QREFELT $ 60)) (VECTOR (|spadConstant| $ 36) |g| 'T))
       ((SPADCALL
         (LETT |nfp|
               (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 61)) (QREFELT $ 62))
               . #1=(|RDEEF;rischDE;I2FSMMR;5|))
         (QREFELT $ 60))
        (SEQ (LETT |u| (SPADCALL |g| NIL |limitedint|) . #1#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (VECTOR (|spadConstant| $ 36) (|spadConstant| $ 36) 'NIL))
               (#2='T (VECTOR (QCAR (QCDR |u|)) |g| 'T))))))
       ((SPADCALL (LETT |y| (SPADCALL |g| |nfp| (QREFELT $ 63)) . #1#) |x|
                  (QREFELT $ 64))
        (VECTOR |y| |g| 'T))
       (#2#
        (SEQ
         (LETT |vl|
               (SPADCALL
                (SPADCALL (SPADCALL |nfp| (QREFELT $ 65))
                          (SPADCALL |g| (QREFELT $ 65)) (QREFELT $ 66))
                |x| (QREFELT $ 67))
               . #1#)
         (EXIT
          (COND
           ((QEQCAR
             (SPADCALL (LETT |k| (SPADCALL |vl| (QREFELT $ 68)) . #1#)
                       (QREFELT $ 30))
             0)
            (|RDEEF;normalise0| |n| |f| |g| |x| $))
           ((OR (|RDEEF;prim?| |k| |x| $) (SPADCALL |k| '|exp| (QREFELT $ 13)))
            (|RDEEF;normalise| |n| |nfp| |f| |g| |x| |k| |limitedint|
             |extendedint| $))
           ('T
            (COND
             ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                        (QREFELT $ 16))
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
  (PROG (|y| |rec| |f'| |p| #1=#:G241 |m| |mu| |mq| #2=#:G248 |v| |nfprime|
         |data| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 69)) . #3=(|RDEEF;normalise0|))
          (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #3#)
          (LETT |f'|
                (LETT |nfprime|
                      (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 61))
                                (QREFELT $ 62))
                      . #3#)
                . #3#)
          (LETT |p| (|spadConstant| $ 71) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |data| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |mq| (SPADCALL |n| (QCAR |v|) (QREFELT $ 73)) . #3#)
                    (|spadConstant| $ 74) (QREFELT $ 75))
                   (SEQ (LETT |mu| (SPADCALL |mq| (QREFELT $ 77)) . #3#)
                        (EXIT
                         (COND ((QEQCAR |mu| 1) "iterate")
                               ('T
                                (SEQ (LETT |m| (QCDR |mu|) . #3#)
                                     (LETT |p|
                                           (SPADCALL |p|
                                                     (SPADCALL (QCDR |v|)
                                                               (PROG1
                                                                   (LETT #1#
                                                                         |m|
                                                                         . #3#)
                                                                 (|check_subtype|
                                                                  (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                                               (QREFELT $ 79))
                                                     (QREFELT $ 80))
                                           . #3#)
                                     (EXIT
                                      (LETT |f'|
                                            (SPADCALL |f'|
                                                      (SPADCALL
                                                       (SPADCALL |m|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QCDR |v|)
                                                                   (QREFELT $
                                                                            82))
                                                                  |x|
                                                                  (QREFELT $
                                                                           61))
                                                                 (QREFELT $
                                                                          62))
                                                       (SPADCALL (QCDR |v|)
                                                                 (QREFELT $
                                                                          82))
                                                       (QREFELT $ 63))
                                                      (QREFELT $ 83))
                                            . #3#)))))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL (SPADCALL |f'| |k| (QREFELT $ 85))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 82)) |g|
                                     (QREFELT $ 86))
                           |k| (QREFELT $ 85))
                          (QREFELT $ 89))
                . #3#)
          (LETT |y|
                (SPADCALL (SPADCALL (QCAR |rec|) |k| (QREFELT $ 91))
                          (SPADCALL |p| (QREFELT $ 82)) (QREFELT $ 63))
                . #3#)
          (EXIT
           (COND
            ((QCDR |rec|)
             (VECTOR |y|
                     (SPADCALL (SPADCALL |y| |x| (QREFELT $ 61))
                               (SPADCALL |nfprime| |y| (QREFELT $ 86))
                               (QREFELT $ 92))
                     'NIL))
            ('T (VECTOR |y| |g| 'T)))))))) 

(DEFUN |RDEEF;normalise|
       (|n| |nfp| |f| |g| |x| |k| |limitedint| |extendedint| $)
  (PROG (|ans1| #1=#:G284 |ftwr| |twr| |newg| |newf| |p| #2=#:G257 |m| |mu|
         |mq| #3=#:G288 |v| |data|)
    (RETURN
     (SEQ
      (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #4=(|RDEEF;normalise|))
      (LETT |p| (|spadConstant| $ 71) . #4#)
      (SEQ (LETT |v| NIL . #4#) (LETT #3# |data| . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL
                (LETT |mq| (SPADCALL |n| (QCAR |v|) (QREFELT $ 73)) . #4#)
                (|spadConstant| $ 74) (QREFELT $ 75))
               (SEQ (LETT |mu| (SPADCALL |mq| (QREFELT $ 77)) . #4#)
                    (EXIT
                     (COND ((QEQCAR |mu| 1) "iterate")
                           ('T
                            (SEQ (LETT |m| (QCDR |mu|) . #4#)
                                 (LETT |p|
                                       (SPADCALL |p|
                                                 (SPADCALL (QCDR |v|)
                                                           (PROG1
                                                               (LETT #2# |m|
                                                                     . #4#)
                                                             (|check_subtype|
                                                              (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              #2#))
                                                           (QREFELT $ 79))
                                                 (QREFELT $ 80))
                                       . #4#)
                                 (LETT |f|
                                       (SPADCALL |f|
                                                 (SPADCALL (QCAR |v|)
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QCDR |v|)
                                                             (QREFELT $ 82))
                                                            (QREFELT $ 93))
                                                           (QREFELT $ 94))
                                                 (QREFELT $ 83))
                                       . #4#)
                                 (EXIT
                                  (LETT |nfp|
                                        (SPADCALL |nfp|
                                                  (SPADCALL
                                                   (SPADCALL |m|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QCDR |v|)
                                                               (QREFELT $ 82))
                                                              |x|
                                                              (QREFELT $ 61))
                                                             (QREFELT $ 62))
                                                   (SPADCALL (QCDR |v|)
                                                             (QREFELT $ 82))
                                                   (QREFELT $ 63))
                                                  (QREFELT $ 83))
                                        . #4#)))))))))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |newf| (SPADCALL |nfp| |k| (QREFELT $ 85)) . #4#)
      (LETT |newg|
            (SPADCALL
             (SPADCALL (SPADCALL |p| (QREFELT $ 82)) |g| (QREFELT $ 86)) |k|
             (QREFELT $ 85))
            . #4#)
      (LETT |twr|
            (SPADCALL (|RDEEF;logdiff| (SPADCALL |f| (QREFELT $ 95)) NIL $)
                      (|RDEEF;logdiff| (SPADCALL |g| (QREFELT $ 95)) NIL $)
                      (QREFELT $ 66))
            . #4#)
      (LETT |ftwr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 95))
                      (SPADCALL |g| (QREFELT $ 95)) (QREFELT $ 66))
            . #4#)
      (LETT |ans1|
            (COND
             ((|RDEEF;prim?| |k| |x| $)
              (|RDEEF;rischDElog| |twr| |newf| |newg| |x| |k|
               (CONS #'|RDEEF;normalise!1| (VECTOR |k| |x| $)) |limitedint|
               |extendedint| $))
             (#5='T
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT $ 13))
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
          (SPADCALL (SPADCALL (QCDR |ans1|) |k| (QREFELT $ 91))
                    (SPADCALL |p| (QREFELT $ 82)) (QREFELT $ 63))
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
                     (SPADCALL (SPADCALL |k| (QREFELT $ 100)) (QREFELT $ 101))
                     |x| (QREFELT $ 61))
                    (|spadConstant| $ 103) (QREFELT $ 104))
                   (QREFELT $ 98)))))))) 

(DEFUN |RDEEF;normalise!2| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 61)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 38)) |x| (QREFELT $ 61))
                    (QREFELT $ 96))
                   (QREFELT $ 98)))))))) 

(DEFUN |RDEEF;normalise!0| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 61)))))) 

(DEFUN |RDEEF;makeData| (|f| |x| |k| $)
  (PROG (|disasters| |n| |cf| |num| |logand| #1=#:G301 |u| |fden| |fnum|)
    (RETURN
     (SEQ (LETT |disasters| NIL . #2=(|RDEEF;makeData|))
          (LETT |fnum| (SPADCALL |f| (QREFELT $ 105)) . #2#)
          (LETT |fden| (SPADCALL |f| (QREFELT $ 106)) . #2#)
          (SEQ (LETT |u| NIL . #2#)
               (LETT #1#
                     (SPADCALL (SPADCALL |f| (QREFELT $ 65)) |x|
                               (QREFELT $ 67))
                     . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |u| '|log| (QREFELT $ 13))
                   (SEQ
                    (LETT |logand| (|SPADfirst| (SPADCALL |u| (QREFELT $ 100)))
                          . #2#)
                    (EXIT
                     (COND
                      ((ZEROP
                        (SPADCALL (SPADCALL |fden| |u| (QREFELT $ 107))
                                  (QREFELT $ 109)))
                       (COND
                        ((EQL
                          (SPADCALL
                           (LETT |num| (SPADCALL |fnum| |u| (QREFELT $ 107))
                                 . #2#)
                           (QREFELT $ 109))
                          1)
                         (SEQ
                          (LETT |cf|
                                (SPADCALL (SPADCALL |num| (QREFELT $ 110))
                                          |fden| (QREFELT $ 111))
                                . #2#)
                          (LETT |n| (SPADCALL |cf| (QREFELT $ 113)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |n| 0)
                             (SEQ
                              (COND
                               ((SPADCALL
                                 (SPADCALL (SPADCALL |logand| (QREFELT $ 105))
                                           |k| (QREFELT $ 114))
                                 0 (QREFELT $ 115))
                                (LETT |disasters|
                                      (CONS
                                       (CONS (QCDR |n|)
                                             (SPADCALL |logand|
                                                       (QREFELT $ 105)))
                                       |disasters|)
                                      . #2#)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL (SPADCALL |logand| (QREFELT $ 106))
                                            |k| (QREFELT $ 114))
                                  0 (QREFELT $ 115))
                                 (LETT |disasters|
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCDR |n|) (QREFELT $ 116))
                                         (SPADCALL |logand| (QREFELT $ 106)))
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
  (PROG (|u3| |u2| |w| #1=#:G395 |v| |n| |nn| |r| |i| #2=#:G379 #3=#:G410
         |ans1| |alph| |if0| #4=#:G412 |u| #5=#:G411 |lk1| |lk0| |f0| |da| |db|
         |t'|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |cc| (QREFELT $ 126)) (CONS 0 (|spadConstant| $ 127)))
             (#6='T
              (SEQ
               (LETT |t'|
                     (SPADCALL (SPADCALL |t| (QREFELT $ 38)) |x|
                               (QREFELT $ 61))
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
                            ((SPADCALL |da| 0 (QREFELT $ 134))
                             (SEQ
                              (LETT |lk0|
                                    (SPADCALL
                                     (LETT |f0|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |bb| (QREFELT $ 135))
                                             (SPADCALL |aa| (QREFELT $ 135))
                                             (QREFELT $ 63))
                                            (QREFELT $ 136))
                                           . #7#)
                                     (QREFELT $ 95))
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
                                                                         100)))
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
                                                    |x| (QREFELT $ 138))
                                          . #7#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |alph| 0)
                                       (PROGN
                                        (LETT #2#
                                              (PROGN
                                               (LETT #3#
                                                     (SEQ
                                                      (LETT |ans1|
                                                            (|RDEEF;polyDElog|
                                                             |twr|
                                                             (SPADCALL
                                                              (QCDR |alph|)
                                                              |aa|
                                                              (QREFELT $ 139))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QCDR |alph|)
                                                                |x|
                                                                (QREFELT $ 61))
                                                               |aa|
                                                               (QREFELT $ 139))
                                                              (SPADCALL
                                                               (QCDR |alph|)
                                                               |bb|
                                                               (QREFELT $ 139))
                                                              (QREFELT $ 140))
                                                             |cc| |x| |t|
                                                             |driv| |limint|
                                                             |extint| $)
                                                            . #7#)
                                                      (EXIT
                                                       (COND
                                                        ((QEQCAR |ans1| 1)
                                                         (CONS 1 "failed"))
                                                        (#6#
                                                         (CONS 0
                                                               (SPADCALL
                                                                (QCDR |alph|)
                                                                (QCDR |ans1|)
                                                                (QREFELT $
                                                                         139)))))))
                                                     . #7#)
                                               (GO #3#))
                                              . #7#)
                                        (GO #2#)))))))
                                  #2# (EXIT #2#))))))))))))
                   (COND
                    ((SPADCALL |da| (+ |db| 1) (QREFELT $ 134))
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
                              (SPADCALL (SPADCALL |bb| (QREFELT $ 135))
                                        (SPADCALL |aa| (QREFELT $ 135))
                                        (QREFELT $ 63))
                              (QREFELT $ 136))
                             (LIST
                              (|SPADfirst| (SPADCALL |t| (QREFELT $ 100))))
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
                          (LETT |nn| (SPADCALL |r| (QREFELT $ 143)) . #7#)
                          (EXIT
                           (COND
                            ((QEQCAR |nn| 0)
                             (LETT |n| (MAX (QCDR |nn|) |n|) . #7#)))))))))))
                   (LETT |v|
                         (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 147))
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
                                      (QVELT |w| 2) (QREFELT $ 134))
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
                                     (QVELT |w| 2) (QREFELT $ 134)))
                                (CONS 1 "failed"))
                               ('T
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL (QVELT |w| 3) (QCDR |u2|)
                                                 (QREFELT $ 148))
                                       (QVELT |w| 4) (QREFELT $ 140))))))))))
                         (#6#
                          (SEQ
                           (LETT |u3|
                                 (|RDEEF;logdegrad| |twr|
                                  (SPADCALL (QVELT |w| 0) (QREFELT $ 149))
                                  (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                                  |extint| $)
                                 . #7#)
                           (EXIT
                            (COND ((QEQCAR |u3| 1) (CONS 1 "failed"))
                                  (#6#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL (QVELT |w| 3) (QCDR |u3|)
                                                    (QREFELT $ 148))
                                          (QVELT |w| 4)
                                          (QREFELT $ 140))))))))))))))))))))))
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
  (PROG (|v| |tm| #1=#:G433 |m| |lb| |nc| |nb| |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (QREFELT $ 150)) (CONS 0 (|spadConstant| $ 151)))
            ((SPADCALL |b| (QREFELT $ 150))
             (SEQ
              (LETT |u|
                    (SPADCALL |c| (SPADCALL |a| (QREFELT $ 21)) (QREFELT $ 24))
                    . #2=(|RDEEF;gpolDEexp|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#3='T
                      (SPADCALL (QCDR |u|)
                                (CONS #'|RDEEF;gpolDEexp!0|
                                      (VECTOR |extint| |limint| |x| $ |t|))
                                (QREFELT $ 154)))))))
            (#3#
             (SEQ
              (LETT |lb|
                    (|RDEEF;boundAt0| |twr| |ftwr|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| 0 (QREFELT $ 155))
                                (SPADCALL |a| 0 (QREFELT $ 156))
                                (QREFELT $ 63))
                      (QREFELT $ 136))
                     (LETT |nb| (SPADCALL |b| (QREFELT $ 157)) . #2#)
                     (LETT |nc| (SPADCALL |c| (QREFELT $ 157)) . #2#) |x| |t|
                     |limint| $)
                    . #2#)
              (LETT |tm|
                    (SPADCALL (|spadConstant| $ 142)
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
                              (QREFELT $ 104))
                    . #2#)
              (LETT |v|
                    (|RDEEF;polyDEexp| |twr| |ftwr|
                     (SPADCALL |a| |tm| (QREFELT $ 148))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |lb|
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 100)))
                                   |x| (QREFELT $ 61))
                                  (QREFELT $ 62))
                        |a| (QREFELT $ 139))
                       |tm| (QREFELT $ 148))
                      (SPADCALL
                       (SPADCALL |b| (SPADCALL |tm| (QREFELT $ 21))
                                 (QREFELT $ 159))
                       (QREFELT $ 160))
                      (QREFELT $ 140))
                     (SPADCALL
                      (SPADCALL |c|
                                (SPADCALL (|spadConstant| $ 142) (- |m| |lb|)
                                          (QREFELT $ 161))
                                (QREFELT $ 159))
                      (QREFELT $ 160))
                     |x| |t| |driv| |limint| |extint| $)
                    . #2#)
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                     (#3#
                      (CONS 0
                            (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 21))
                                      (SPADCALL (|spadConstant| $ 142) |lb|
                                                (QREFELT $ 161))
                                      (QREFELT $ 159))))))))))))) 

(DEFUN |RDEEF;gpolDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;gpolDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 100)) (QREFELT $ 101))
                |z2| |x| |limint| |extint| (QREFELT $ 57)))))) 

(DEFUN |RDEEF;polyDEexp|
       (|twr| |ftwr| |aa| |bb| |cc| |x| |t| |driv| |limint| |extint| $)
  (PROG (|u| |w| #1=#:G470 |v| |n|)
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
                      (SPADCALL (SPADCALL |bb| (QREFELT $ 135))
                                (SPADCALL |aa| (QREFELT $ 135)) (QREFELT $ 63))
                      (QREFELT $ 136))
                     (SPADCALL |aa| (QREFELT $ 133))
                     (SPADCALL |bb| (QREFELT $ 133))
                     (SPADCALL |cc| (QREFELT $ 133)) |x| |t| |limint| $)
                    . #2#)
              (LETT |v| (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 147))
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
                                 (QVELT |w| 2) (QREFELT $ 134))
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
                                                 (QREFELT $ 148))
                                       (QVELT |w| 4) (QREFELT $ 140))))))))))
                    (#3#
                     (SEQ
                      (LETT |u|
                            (|RDEEF;expdegrad| |twr|
                             (SPADCALL (QVELT |w| 0) (QREFELT $ 149))
                             (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                             |extint| $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                             (#3#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (QVELT |w| 3) (QCDR |u|)
                                               (QREFELT $ 148))
                                     (QVELT |w| 4)
                                     (QREFELT $ 140))))))))))))))))))))) 

(DEFUN |RDEEF;polyDEexp!1| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 100)) (QREFELT $ 101))
                |z2| |x| |limint| |extint| (QREFELT $ 57)))))) 

(DEFUN |RDEEF;polyDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 100)) (QREFELT $ 101))
                |z2| |x| |limint| |extint| (QREFELT $ 57)))))) 

(DEFUN |RDEEF;exppolyint| (|p| |rischdiffeq| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |rischdiffeq|
                      (QREFELT $ 154))
            |RDEEF;exppolyint|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (SPADCALL (QCDR |u|) (QREFELT $ 162))))))))) 

(DEFUN |RDEEF;boundInf|
       (|twr| |ftwr| |f0| |da| |db| |dc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G516 |u| #2=#:G515 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((< |da| |db|) (- |dc| |db|))
            ((SPADCALL |da| |db| (QREFELT $ 134)) (MAX 0 (- |dc| |da|)))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 95))
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
                                              (SPADCALL |u| (QREFELT $ 100)))
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
                                       |x| (QREFELT $ 138))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 85))
                                  (QREFELT $ 164))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 165))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 166))
                               (EXIT
                                (MAX 0
                                     (MAX
                                      (SPADCALL (QCAR |al|) (QREFELT $ 167))
                                      (- |dc| |db|))))))))
                           (EXIT (- |dc| |db|))))
                         (#3# (- |dc| |db|))))))))))))))) 

(DEFUN |RDEEF;boundAt0| (|twr| |ftwr| |f0| |nb| |nc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G534 |u| #2=#:G533 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |nb| 0 (QREFELT $ 168)) (MIN 0 (- |nc| (MIN 0 |nb|))))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 95))
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
                                              (SPADCALL |u| (QREFELT $ 100)))
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
                                       |x| (QREFELT $ 138))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 85))
                                  (QREFELT $ 164))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 165))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 166))
                               (EXIT
                                (MIN 0
                                     (MIN
                                      (SPADCALL (QCAR |al|) (QREFELT $ 167))
                                      |nc|)))))))
                           (EXIT (MIN 0 |nc|))))
                         (#3# (MIN 0 |nc|))))))))))))))) 

(DEFUN |RDEEF;logdegrad| (|twr| |b| |c| |n| |x| |t| |limitedint| |extint| $)
  (PROG (#1=#:G555 #2=#:G554 #3=#:G556 #4=#:G566 |v| |u1| |alpha| |if0|
         #5=#:G565 |u| #6=#:G564 |lk1| |lk0| |f0| |t'|)
    (RETURN
     (SEQ
      (LETT |t'| (SPADCALL (SPADCALL |t| (QREFELT $ 38)) |x| (QREFELT $ 61))
            . #7=(|RDEEF;logdegrad|))
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL (LETT |f0| (SPADCALL |b| (QREFELT $ 136)) . #7#)
                             (QREFELT $ 95))
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
                                      (SPADCALL |u| (QREFELT $ 100)))
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
                               (QREFELT $ 138))
                     . #7#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |u1|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCDR |alpha|) (QREFELT $ 169))
                                    |c| (QREFELT $ 139))
                          (CONS #'|RDEEF;logdegrad!0| (VECTOR |extint| |t'|))
                          |t'| (QREFELT $ 132))
                         . #7#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |u1| 1)
                          (SPADCALL (SPADCALL (QCDR |u1|) (QREFELT $ 133)) |n|
                                    (QREFELT $ 134)))
                      (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL (QCDR |alpha|) (QCDR |u1|)
                                      (QREFELT $ 139))))))))
                 (#8#
                  (|RDEEF;logdeg| |c|
                   (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 136))
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
                                                                (QREFELT $ 93))
                                                      (QREFELT $ 86))
                                            . #7#)
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #3# (QREFELT $ 92))
                                              . #7#))
                                       ('T
                                        (PROGN
                                         (LETT #2# #3# . #7#)
                                         (LETT #1# 'T . #7#)))))))
                                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#8# (|spadConstant| $ 36))))
                             (QREFELT $ 83))
                   |n| |x| |t'| |limitedint| |extint| $)))))))))))) 

(DEFUN |RDEEF;logdegrad!0| (|z1| $$)
  (PROG (|t'| |extint|)
    (LETT |t'| (QREFELT $$ 1) . #1=(|RDEEF;logdegrad|))
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |t'| |extint|))))) 

(DEFUN |RDEEF;logdeg| (|c| |f| |n| |x| |t'| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G584 #2=#:G591 |u| #3=#:G587 |m|)
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
                                  ((SPADCALL |m| |n| (QREFELT $ 134))
                                   (PROGN
                                    (LETT #3#
                                          (PROGN
                                           (LETT #2# (CONS 1 #5#) . #4#)
                                           (GO #2#))
                                          . #4#)
                                    (GO #3#))))))))
                         (LETT |u|
                               (SPADCALL 1 |f| (SPADCALL |c| (QREFELT $ 135))
                                         |x| |limitedint| |extint|
                                         (QREFELT $ 57))
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
                                                             (QREFELT $ 96))
                                                   (QREFELT $ 140)))
                                   . #4#)
                             (GO #2#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #4#)
                                 (LETT |c|
                                       (SPADCALL (SPADCALL |c| (QREFELT $ 170))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |m| |t'|
                                                             (QREFELT $ 62))
                                                   (QVELT |u| 0)
                                                   (QREFELT $ 86))
                                                  (PROG1
                                                      (LETT #1# (- |m| 1)
                                                            . #4#)
                                                    (|check_subtype| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                  (QREFELT $ 104))
                                                 (QREFELT $ 171))
                                       . #4#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 104))
                                                  (QREFELT $ 140))
                                        . #4#))))))))
                       #3# (EXIT #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |RDEEF;expdegrad| (|twr| |b| |c| |n| |x| |t| |limint| |extint| $)
  (PROG (|u1| #1=#:G609 |al| |alpha| |intf0| #2=#:G602 #3=#:G601 #4=#:G603
         #5=#:G640 |v| |if0| #6=#:G639 |u| #7=#:G638 |lk1| |lk0| |f0|)
    (RETURN
     (SEQ
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL
                    (LETT |f0| (SPADCALL |b| (QREFELT $ 136))
                          . #8=(|RDEEF;expdegrad|))
                    (QREFELT $ 95))
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
                                      (SPADCALL |u| (QREFELT $ 100)))
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
                     (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 136))
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
                                                                           93))
                                                        (QREFELT $ 86))
                                              . #8#)
                                        (COND
                                         (#2#
                                          (LETT #3#
                                                (SPADCALL #3# #4#
                                                          (QREFELT $ 92))
                                                . #8#))
                                         ('T
                                          (PROGN
                                           (LETT #3# #4# . #8#)
                                           (LETT #2# 'T . #8#)))))))
                                     (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#2# #3#) (#9# (|spadConstant| $ 36))))
                               (QREFELT $ 83))
                     . #8#)
               (LETT |alpha|
                     (SPADCALL (CONS |t| |lk0|) (|RDEEF;RRF2F| (QCDR |if0|) $)
                               |x| (QREFELT $ 138))
                     . #8#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |al|
                         (SPADCALL (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 85))
                                   (QREFELT $ 164))
                         . #8#)
                   (COND
                    ((SPADCALL (QCDR |al|) (QREFELT $ 165))
                     (COND
                      ((SPADCALL (QCAR |al|) (QREFELT $ 166))
                       (COND
                        ((>= (SPADCALL (QCAR |al|) (QREFELT $ 167)) 0)
                         (EXIT
                          (SEQ
                           (LETT |u1|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c| (QREFELT $ 21))
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL (QCAR |al|)
                                                                (QREFELT $
                                                                         172))
                                                      . #8#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (|LaurentPolynomial|
                                                              (QREFELT $ 7)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 7)))
                                                             #1#))
                                            (QREFELT $ 159))
                                  (CONS #'|RDEEF;expdegrad!0|
                                        (VECTOR |extint| |limint| |x| $ |t|))
                                  (QREFELT $ 154))
                                 . #8#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |u1| 1)
                                  (SPADCALL
                                   (SPADCALL (QCDR |u1|) (QREFELT $ 167)) |n|
                                   (QREFELT $ 134)))
                              (CONS 1 "failed"))
                             ('T
                              (SPADCALL
                               (SPADCALL (QCAR |al|) (QCDR |u1|)
                                         (QREFELT $ 159))
                               (QREFELT $ 162)))))))))))))
                   (EXIT
                    (|RDEEF;expdeg| |c| |intf0| |n| |x|
                     (|SPADfirst| (SPADCALL |t| (QREFELT $ 100))) |limint|
                     |extint| $))))
                 (#9#
                  (|RDEEF;expdeg| |c| |intf0| |n| |x|
                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 100))) |limint|
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
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 100)) (QREFELT $ 101))
                |z2| |x| |limint| |extint| (QREFELT $ 57)))))) 

(DEFUN |RDEEF;expdeg| (|c| |f| |n| |x| |eta| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G664 |u| #2=#:G660 |m|)
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
                                  ((SPADCALL |m| |n| (QREFELT $ 134))
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
                                                             (QREFELT $ 173))
                                                   (QREFELT $ 92))
                                         (SPADCALL |c| (QREFELT $ 135)) |x|
                                         |limitedint| |extint| (QREFELT $ 57))
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
                                                             (QREFELT $ 96))
                                                   (QREFELT $ 140)))
                                   . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #3#)
                                 (LETT |c| (SPADCALL |c| (QREFELT $ 170))
                                       . #3#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 104))
                                                  (QREFELT $ 140))
                                        . #3#))))))))
                       #2# (EXIT #2#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |RDEEF;RRF2F| (|rrf| $)
  (PROG (#1=#:G668 #2=#:G667 #3=#:G669 #4=#:G671 |v|)
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
                                         (SPADCALL (QCDR |v|) (QREFELT $ 93))
                                         (QREFELT $ 86))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 92)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 36))))
                (QREFELT $ 92)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDE;|)) 

(DEFUN |ElementaryRischDE| (&REST #1=#:G672)
  (PROG ()
    (RETURN
     (PROG (#2=#:G673)
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
      (LETT $ (GETREFV 174) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryRischDE| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|%alg|)
      (QSETREFV $ 9 '|prim|)
      $)))) 

(MAKEPROP '|ElementaryRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 17) (17 . |numer|)
              (|LaurentPolynomial| 7 17) (22 . |coerce|) (27 . |denom|)
              (|Union| $ '"failed") (32 . |exquo|) (|List| 12) (38 . |member?|)
              (|IntegrationTools| 6 7) (44 . |ksec|) (|Union| 11 '"failed")
              (51 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 31 7 7 11)
              (|PureAlgebraicIntegration| 6 7 7) (56 . |palgRDE|) (66 . |Zero|)
              (70 . |Zero|) (|Kernel| $) (74 . |coerce|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 17) (|:| |pol2| 17)
                        (|:| |prim| 17))
              (|FunctionSpacePrimitiveElement| 6 7) (79 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (85 . |rootOf|) (90 . |elt|)
              (|List| 37) (|List| $) (96 . |eval|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|Integer|) (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 50)))
              (|Union| 51 '"failed") (|Mapping| 52 7 99)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 54 '"failed") (|Mapping| 55 7 7)
              |RDEEF;rischDE;I2FSMMR;5| (103 . |retract|) (108 . |eval|)
              (115 . |zero?|) (120 . |differentiate|) (126 . *) (132 . /)
              (138 . |freeOf?|) (144 . |kernels|) (149 . |union|)
              (155 . |varselect|) (161 . |kmax|) (166 . |kernel|)
              (|SparseMultivariatePolynomial| 6 12) (171 . |One|)
              (|Fraction| 49) (175 . *) (181 . |Zero|) (185 . >)
              (|Union| 49 '"failed") (191 . |retractIfCan|)
              (|NonNegativeInteger|) (196 . ^) (202 . *)
              (|SparseMultivariatePolynomial| 6 37) (208 . |coerce|) (213 . -)
              (|Fraction| 42) (219 . |univariate|) (225 . *)
              (|Record| (|:| |ans| 18) (|:| |nosol| 10))
              (|TranscendentalRischDE| 7 17) (231 . |baseRDE|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 70 7)
              (237 . |multivariate|) (243 . +) (249 . |log|) (254 . *)
              (260 . |tower|) (265 . |coerce|) (|Mapping| 7 7)
              (270 . |differentiate|) (|List| 7) (277 . |argument|)
              (282 . |first|) (|PositiveInteger|) (287 . |One|)
              (291 . |monomial|) (297 . |numer|) (302 . |denom|)
              (307 . |univariate|) (|SparseUnivariatePolynomial| 70)
              (313 . |degree|) (318 . |leadingCoefficient|) (323 . /)
              (|Union| 72 '"failed") (329 . |retractIfCan|) (334 . |degree|)
              (340 . >) (346 . -)
              (|Record| (|:| |a| 17) (|:| |b| 18) (|:| |c| 18) (|:| |t| 17))
              (|Union| 117 '"failed") (|Mapping| 17 17) (351 . |monomRDE|)
              (358 . |retract|) (363 . /) (369 . |convert|) (374 . |coerce|)
              (379 . /) (385 . |zero?|) (390 . |Zero|) (394 . |exquo|)
              (|Union| 17 '"failed") (|Mapping| 55 7)
              (|TranscendentalIntegration| 7 17) (400 . |primintfldpoly|)
              (407 . |degree|) (412 . >) (418 . |leadingCoefficient|) (423 . -)
              (|ElementaryFunctionStructurePackage| 6 7)
              (428 . |validExponential|) (435 . *) (441 . +) (447 . |One|)
              (451 . |One|) (455 . |retractIfCan|)
              (|Record| (|:| |ans| 17) (|:| |nosol| 10))
              (|Record| (|:| |b| 17) (|:| |c| 17) (|:| |m| 49) (|:| |alpha| 17)
                        (|:| |beta| 17))
              (|Union| (|:| |ans| 144) (|:| |eq| 145)) (460 . |polyRDE|)
              (469 . *) (475 . |retract|) (480 . |zero?|) (485 . |Zero|)
              (|Union| 20 '"failed") (|Mapping| 48 49 7)
              (489 . |expintfldpoly|) (495 . |coefficient|)
              (501 . |coefficient|) (507 . |order|) (512 . |Zero|) (516 . *)
              (522 . |retract|) (527 . |monomial|) (533 . |retractIfCan|)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 18))
              (538 . |separate|) (543 . |zero?|) (548 . |monomial?|)
              (553 . |degree|) (558 . ~=) (564 . |inv|) (569 . |reductum|)
              (574 . -) (580 . |recip|) (585 . *))
           '#(|rischDE| 591) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 173
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 1 18 17 0 19
                                                   1 20 0 17 21 1 18 17 0 22 2
                                                   20 23 0 0 24 2 25 10 12 0 26
                                                   3 27 12 12 25 11 28 1 12 29
                                                   0 30 6 33 31 7 7 7 12 12 32
                                                   34 0 6 0 35 0 7 0 36 1 7 0
                                                   37 38 2 40 39 7 7 41 1 7 0
                                                   42 43 2 17 7 0 7 44 3 7 0 0
                                                   45 46 47 1 7 37 0 58 3 7 0 0
                                                   37 0 59 1 7 10 0 60 2 7 0 0
                                                   11 61 2 7 0 49 0 62 2 7 0 0
                                                   0 63 2 7 10 0 11 64 1 7 45 0
                                                   65 2 27 25 25 25 66 2 27 25
                                                   25 11 67 1 27 12 25 68 1 12
                                                   0 11 69 0 70 0 71 2 72 0 49
                                                   0 73 0 72 0 74 2 72 10 0 0
                                                   75 1 72 76 0 77 2 70 0 0 78
                                                   79 2 70 0 0 0 80 1 7 0 81 82
                                                   2 7 0 0 0 83 2 7 84 0 37 85
                                                   2 7 0 0 0 86 2 88 87 18 18
                                                   89 2 90 7 18 12 91 2 7 0 0 0
                                                   92 1 7 0 0 93 2 7 0 72 0 94
                                                   1 7 45 0 95 1 17 0 7 96 3 17
                                                   0 0 97 0 98 1 12 99 0 100 1
                                                   99 7 0 101 0 102 0 103 2 17
                                                   0 7 78 104 1 7 81 0 105 1 7
                                                   81 0 106 2 70 42 0 12 107 1
                                                   108 78 0 109 1 108 70 0 110
                                                   2 7 0 81 81 111 1 7 112 0
                                                   113 2 70 78 0 12 114 2 78 10
                                                   0 0 115 1 72 0 0 116 3 88
                                                   118 18 18 119 120 1 18 17 0
                                                   121 2 18 0 17 17 122 1 20 18
                                                   0 123 1 18 0 17 124 2 18 0 0
                                                   0 125 1 17 10 0 126 0 17 0
                                                   127 2 17 23 0 0 128 3 131
                                                   129 17 130 7 132 1 17 78 0
                                                   133 2 49 10 0 0 134 1 17 7 0
                                                   135 1 7 0 0 136 3 137 31 25
                                                   7 11 138 2 17 0 7 0 139 2 17
                                                   0 0 0 140 0 6 0 141 0 7 0
                                                   142 1 7 76 0 143 5 88 146 17
                                                   17 17 49 119 147 2 17 0 0 0
                                                   148 1 17 7 0 149 1 20 10 0
                                                   150 0 20 0 151 2 131 152 20
                                                   153 154 2 20 7 0 49 155 2 17
                                                   7 0 78 156 1 20 49 0 157 0
                                                   70 0 158 2 20 0 0 0 159 1 20
                                                   17 0 160 2 20 0 7 49 161 1
                                                   20 129 0 162 1 20 163 18 164
                                                   1 18 10 0 165 1 20 10 0 166
                                                   1 20 49 0 167 2 49 10 0 0
                                                   168 1 7 0 0 169 1 17 0 0 170
                                                   2 17 0 0 0 171 1 20 23 0 172
                                                   2 7 0 78 0 173 6 0 48 49 7 7
                                                   11 53 56 57)))))
           '|lookupComplete|)) 
