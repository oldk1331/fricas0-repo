
(/VERSIONCHECK 2) 

(DEFUN |RDEEF;prim?| (|k| |x| $)
  (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
        ('T
         (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                   (QREFELT $ 16))))) 

(DEFUN |RDEEF;RF2GP| (|f| $)
  (PROG (#1=#:G162)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 25))
                (SPADCALL (SPADCALL |f| (QREFELT $ 26)) (QREFELT $ 25))
                (QREFELT $ 28))
               |RDEEF;RF2GP|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0)
                      (|LaurentPolynomial| (QREFELT $ 7)
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7)))
                      #1#))))) 

(DEFUN |RDEEF;logdiff| (|twr| |bad| $)
  (PROG (#1=#:G170 |u| #2=#:G169)
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
                  (COND ((SPADCALL |u| |bad| (QREFELT $ 30)) 'NIL) (#4='T 'T)))
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
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 32))
                . #1=(|RDEEF;rischDEalg|))
          (QREFELT $ 34))
         0)
        (SEQ
         (LETT |u|
               (SPADCALL |nfp| |f| |g| |kx| |k|
                         (CONS #'|RDEEF;rischDEalg!0| (VECTOR $ |n|))
                         (QREFELT $ 38))
               . #1#)
         (EXIT
          (COND
           ((QEQCAR |u| 1)
            (VECTOR (|spadConstant| $ 40) (|spadConstant| $ 40) 'NIL))
           (#2='T (VECTOR (QCDR |u|) |g| 'T))))))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 8) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 42))
                         (SPADCALL |k| (QREFELT $ 42)) (QREFELT $ 45))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 47)) . #1#)
         (LETT |lk| (LIST |kx| |k|) . #1#)
         (LETT |lv|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 48))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 48)))
               . #1#)
         (LETT |rc|
               (SPADCALL |n| (SPADCALL |f| |lk| |lv| (QREFELT $ 51))
                         (SPADCALL |g| |lk| |lv| (QREFELT $ 51)) |x| |limint|
                         |extint| (QREFELT $ 61))
               . #1#)
         (EXIT
          (COND
           ((QVELT |rc| 2)
            (VECTOR
             (SPADCALL (QVELT |rc| 0) (SPADCALL |y| (QREFELT $ 62))
                       (QVELT |rec| 0) (QREFELT $ 63))
             (QVELT |rc| 1) 'T))
           (#2# (VECTOR (|spadConstant| $ 40) (|spadConstant| $ 40) 'NIL))))))
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
       ((SPADCALL |g| (QREFELT $ 64)) (VECTOR (|spadConstant| $ 40) |g| 'T))
       ((SPADCALL
         (LETT |nfp|
               (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 65)) (QREFELT $ 66))
               . #1=(|RDEEF;rischDE;I2FSMMR;5|))
         (QREFELT $ 64))
        (SEQ (LETT |u| (SPADCALL |g| NIL |limitedint|) . #1#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (VECTOR (|spadConstant| $ 40) (|spadConstant| $ 40) 'NIL))
               (#2='T (VECTOR (QCAR (QCDR |u|)) |g| 'T))))))
       ((SPADCALL (LETT |y| (SPADCALL |g| |nfp| (QREFELT $ 67)) . #1#) |x|
                  (QREFELT $ 68))
        (VECTOR |y| |g| 'T))
       (#2#
        (SEQ
         (LETT |vl|
               (SPADCALL
                (SPADCALL (SPADCALL |nfp| (QREFELT $ 69))
                          (SPADCALL |g| (QREFELT $ 69)) (QREFELT $ 70))
                |x| (QREFELT $ 71))
               . #1#)
         (EXIT
          (COND
           ((QEQCAR
             (SPADCALL (LETT |k| (SPADCALL |vl| (QREFELT $ 72)) . #1#)
                       (QREFELT $ 34))
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
  (PROG (|y| |rec| |f'| |p| #1=#:G248 |m| |mu| |mq| #2=#:G255 |v| |nfprime|
         |data| |data1| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 73)) . #3=(|RDEEF;normalise0|))
          (SEQ
           (LETT |data1| (SPADCALL |f| (QREFELT $ 20) (QREFELT $ 75)) . #3#)
           (EXIT
            (COND
             ((QEQCAR |data1| 1)
              (SPADCALL (QREFELT $ 20) |f|
                        (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #3#)
                        (QREFELT $ 77)))
             (#4='T (LETT |data| (QCDR |data1|) . #3#)))))
          (LETT |f'|
                (LETT |nfprime|
                      (SPADCALL |n| (SPADCALL |f| |x| (QREFELT $ 65))
                                (QREFELT $ 66))
                      . #3#)
                . #3#)
          (LETT |p| (|spadConstant| $ 79) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |data| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |mq| (SPADCALL |n| (QCAR |v|) (QREFELT $ 81)) . #3#)
                    (|spadConstant| $ 82) (QREFELT $ 83))
                   (SEQ (LETT |mu| (SPADCALL |mq| (QREFELT $ 85)) . #3#)
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
                                                               (QREFELT $ 87))
                                                     (QREFELT $ 88))
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
                                                                            90))
                                                                  |x|
                                                                  (QREFELT $
                                                                           65))
                                                                 (QREFELT $
                                                                          66))
                                                       (SPADCALL (QCDR |v|)
                                                                 (QREFELT $
                                                                          90))
                                                       (QREFELT $ 67))
                                                      (QREFELT $ 91))
                                            . #3#)))))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL (SPADCALL |f'| |k| (QREFELT $ 93))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 90)) |g|
                                     (QREFELT $ 94))
                           |k| (QREFELT $ 93))
                          (QREFELT $ 97))
                . #3#)
          (LETT |y|
                (SPADCALL (SPADCALL (QCAR |rec|) |k| (QREFELT $ 99))
                          (SPADCALL |p| (QREFELT $ 90)) (QREFELT $ 67))
                . #3#)
          (EXIT
           (COND
            ((QCDR |rec|)
             (VECTOR |y|
                     (SPADCALL (SPADCALL |y| |x| (QREFELT $ 65))
                               (SPADCALL |nfprime| |y| (QREFELT $ 94))
                               (QREFELT $ 100))
                     'NIL))
            (#4# (VECTOR |y| |g| 'T)))))))) 

(DEFUN |RDEEF;normalise|
       (|n| |nfp| |f| |g| |x| |k| |limitedint| |extendedint| $)
  (PROG (|ans1| #1=#:G295 |ftwr| |twr| |newg| |newf| |p| #2=#:G268 |m| |mu|
         |mq| #3=#:G299 |v| |data| |data1|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |data1| (SPADCALL |f| (QREFELT $ 20) (QREFELT $ 75))
             . #4=(|RDEEF;normalise|))
       (EXIT
        (COND
         ((QEQCAR |data1| 1)
          (SPADCALL (QREFELT $ 20) |f|
                    (LETT |data| (|RDEEF;makeData| |f| |x| |k| $) . #4#)
                    (QREFELT $ 77)))
         (#5='T (LETT |data| (QCDR |data1|) . #4#)))))
      (LETT |p| (|spadConstant| $ 79) . #4#)
      (SEQ (LETT |v| NIL . #4#) (LETT #3# |data| . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL
                (LETT |mq| (SPADCALL |n| (QCAR |v|) (QREFELT $ 81)) . #4#)
                (|spadConstant| $ 82) (QREFELT $ 83))
               (SEQ (LETT |mu| (SPADCALL |mq| (QREFELT $ 85)) . #4#)
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
                                                           (QREFELT $ 87))
                                                 (QREFELT $ 88))
                                       . #4#)
                                 (LETT |f|
                                       (SPADCALL |f|
                                                 (SPADCALL (QCAR |v|)
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QCDR |v|)
                                                             (QREFELT $ 90))
                                                            (QREFELT $ 101))
                                                           (QREFELT $ 102))
                                                 (QREFELT $ 91))
                                       . #4#)
                                 (EXIT
                                  (LETT |nfp|
                                        (SPADCALL |nfp|
                                                  (SPADCALL
                                                   (SPADCALL |m|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QCDR |v|)
                                                               (QREFELT $ 90))
                                                              |x|
                                                              (QREFELT $ 65))
                                                             (QREFELT $ 66))
                                                   (SPADCALL (QCDR |v|)
                                                             (QREFELT $ 90))
                                                   (QREFELT $ 67))
                                                  (QREFELT $ 91))
                                        . #4#)))))))))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |newf| (SPADCALL |nfp| |k| (QREFELT $ 93)) . #4#)
      (LETT |newg|
            (SPADCALL
             (SPADCALL (SPADCALL |p| (QREFELT $ 90)) |g| (QREFELT $ 94)) |k|
             (QREFELT $ 93))
            . #4#)
      (LETT |twr|
            (SPADCALL (|RDEEF;logdiff| (SPADCALL |f| (QREFELT $ 103)) NIL $)
                      (|RDEEF;logdiff| (SPADCALL |g| (QREFELT $ 103)) NIL $)
                      (QREFELT $ 70))
            . #4#)
      (LETT |ftwr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 103))
                      (SPADCALL |g| (QREFELT $ 103)) (QREFELT $ 70))
            . #4#)
      (LETT |ans1|
            (COND
             ((|RDEEF;prim?| |k| |x| $)
              (|RDEEF;rischDElog| |twr| |newf| |newg| |x| |k|
               (CONS #'|RDEEF;normalise!1| (VECTOR |k| |x| $)) |limitedint|
               |extendedint| $))
             (#5#
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
         (VECTOR (|spadConstant| $ 40) (|spadConstant| $ 40) 'NIL))
        (#5#
         (VECTOR
          (SPADCALL (SPADCALL (QCDR |ans1|) |k| (QREFELT $ 99))
                    (SPADCALL |p| (QREFELT $ 90)) (QREFELT $ 67))
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
                     (SPADCALL (SPADCALL |k| (QREFELT $ 108)) (QREFELT $ 109))
                     |x| (QREFELT $ 65))
                    (|spadConstant| $ 111) (QREFELT $ 112))
                   (QREFELT $ 106)))))))) 

(DEFUN |RDEEF;normalise!2| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 65)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 42)) |x| (QREFELT $ 65))
                    (QREFELT $ 104))
                   (QREFELT $ 106)))))))) 

(DEFUN |RDEEF;normalise!0| (|z2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 65)))))) 

(DEFUN |RDEEF;makeData| (|f| |x| |k| $)
  (PROG (|disasters| |n| |cf| |num| |logand| #1=#:G312 |u| |fden| |fnum|)
    (RETURN
     (SEQ (LETT |disasters| NIL . #2=(|RDEEF;makeData|))
          (LETT |fnum| (SPADCALL |f| (QREFELT $ 113)) . #2#)
          (LETT |fden| (SPADCALL |f| (QREFELT $ 114)) . #2#)
          (SEQ (LETT |u| NIL . #2#)
               (LETT #1#
                     (SPADCALL (SPADCALL |f| (QREFELT $ 69)) |x|
                               (QREFELT $ 71))
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
                    (LETT |logand| (|SPADfirst| (SPADCALL |u| (QREFELT $ 108)))
                          . #2#)
                    (EXIT
                     (COND
                      ((ZEROP
                        (SPADCALL (SPADCALL |fden| |u| (QREFELT $ 115))
                                  (QREFELT $ 117)))
                       (COND
                        ((EQL
                          (SPADCALL
                           (LETT |num| (SPADCALL |fnum| |u| (QREFELT $ 115))
                                 . #2#)
                           (QREFELT $ 117))
                          1)
                         (SEQ
                          (LETT |cf|
                                (SPADCALL (SPADCALL |num| (QREFELT $ 118))
                                          |fden| (QREFELT $ 119))
                                . #2#)
                          (LETT |n| (SPADCALL |cf| (QREFELT $ 121)) . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |n| 0)
                             (SEQ
                              (COND
                               ((SPADCALL
                                 (SPADCALL (SPADCALL |logand| (QREFELT $ 113))
                                           |k| (QREFELT $ 122))
                                 0 (QREFELT $ 123))
                                (LETT |disasters|
                                      (CONS
                                       (CONS (QCDR |n|)
                                             (SPADCALL |logand|
                                                       (QREFELT $ 113)))
                                       |disasters|)
                                      . #2#)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL (SPADCALL |logand| (QREFELT $ 114))
                                            |k| (QREFELT $ 122))
                                  0 (QREFELT $ 123))
                                 (LETT |disasters|
                                       (CONS
                                        (CONS
                                         (SPADCALL (QCDR |n|) (QREFELT $ 124))
                                         (SPADCALL |logand| (QREFELT $ 114)))
                                        |disasters|)
                                       . #2#)))))))))))))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |disasters|))))) 

(DEFUN |RDEEF;rischDElog|
       (|twr| |f| |g| |x| |theta| |driv| |limint| |extint| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |g| |driv| (QREFELT $ 128))
            . #1=(|RDEEF;rischDElog|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |v|
                     (|RDEEF;polyDElog| |twr| (QVELT (QCDR |u|) 0)
                      (SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 129))
                      (SPADCALL (QVELT (QCDR |u|) 2) (QREFELT $ 129)) |x|
                      |theta| |driv| |limint| |extint| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |v|) (QVELT (QCDR |u|) 3)
                                       (QREFELT $ 130)))))))))))))) 

(DEFUN |RDEEF;rischDEexp|
       (|twr| |ftwr| |f| |g| |x| |theta| |driv| |limint| |extint| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |g| |driv| (QREFELT $ 128))
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
                             (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 131))
                                       (SPADCALL (QVELT (QCDR |u|) 3)
                                                 (QREFELT $ 132))
                                       (QREFELT $ 133)))))))))))))) 

(DEFUN |RDEEF;polyDElog|
       (|twr| |aa| |bb| |cc| |x| |t| |driv| |limint| |extint| $)
  (PROG (|u3| |u2| |w| #1=#:G406 |v| |n| |nn| |r| |i| #2=#:G390 #3=#:G421
         |ans1| |alph| |if0| #4=#:G423 |u| #5=#:G422 |lk1| |lk0| |f0| |da| |db|
         |t'|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |cc| (QREFELT $ 134)) (CONS 0 (|spadConstant| $ 135)))
             (#6='T
              (SEQ
               (LETT |t'|
                     (SPADCALL (SPADCALL |t| (QREFELT $ 42)) |x|
                               (QREFELT $ 65))
                     . #7=(|RDEEF;polyDElog|))
               (EXIT
                (COND
                 ((SPADCALL |bb| (QREFELT $ 134))
                  (SEQ (LETT |u| (SPADCALL |cc| |aa| (QREFELT $ 136)) . #7#)
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#6#
                               (SPADCALL (QCDR |u|)
                                         (CONS #'|RDEEF;polyDElog!0|
                                               (VECTOR |extint| |t'|))
                                         |t'| (QREFELT $ 140)))))))
                 (#6#
                  (SEQ
                   (LETT |n|
                         (- (SPADCALL |cc| (QREFELT $ 141))
                            (LETT |db| (SPADCALL |bb| (QREFELT $ 141)) . #7#))
                         . #7#)
                   (SEQ (LETT |da| (SPADCALL |aa| (QREFELT $ 141)) . #7#)
                        (EXIT
                         (COND
                          ((EQL |da| |db|)
                           (COND
                            ((SPADCALL |da| 0 (QREFELT $ 142))
                             (SEQ
                              (LETT |lk0|
                                    (SPADCALL
                                     (LETT |f0|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |bb| (QREFELT $ 143))
                                             (SPADCALL |aa| (QREFELT $ 143))
                                             (QREFELT $ 67))
                                            (QREFELT $ 144))
                                           . #7#)
                                     (QREFELT $ 103))
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
                                                                         108)))
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
                                                    |x| (QREFELT $ 146))
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
                                                              (QREFELT $ 147))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QCDR |alph|)
                                                                |x|
                                                                (QREFELT $ 65))
                                                               |aa|
                                                               (QREFELT $ 147))
                                                              (SPADCALL
                                                               (QCDR |alph|)
                                                               |bb|
                                                               (QREFELT $ 147))
                                                              (QREFELT $ 148))
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
                                                                         147)))))))
                                                     . #7#)
                                               (GO #3#))
                                              . #7#)
                                        (GO #2#)))))))
                                  #2# (EXIT #2#))))))))))))
                   (COND
                    ((SPADCALL |da| (+ |db| 1) (QREFELT $ 142))
                     (LETT |n|
                           (MAX 0
                                (+ (- (SPADCALL |cc| (QREFELT $ 141)) |da|) 1))
                           . #7#)))
                   (COND
                    ((EQL |da| (+ |db| 1))
                     (SEQ
                      (LETT |i|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |bb| (QREFELT $ 143))
                                        (SPADCALL |aa| (QREFELT $ 143))
                                        (QREFELT $ 67))
                              (QREFELT $ 144))
                             (LIST
                              (|SPADfirst| (SPADCALL |t| (QREFELT $ 108))))
                             |limint|)
                            . #7#)
                      (EXIT
                       (COND
                        ((NULL (QEQCAR |i| 1))
                         (SEQ
                          (LETT |r|
                                (COND
                                 ((NULL (QCDR (QCDR |i|)))
                                  (|spadConstant| $ 40))
                                 (#6# (QCAR (|SPADfirst| (QCDR (QCDR |i|))))))
                                . #7#)
                          (LETT |nn| (SPADCALL |r| (QREFELT $ 151)) . #7#)
                          (EXIT
                           (COND
                            ((QEQCAR |nn| 0)
                             (LETT |n| (MAX (QCDR |nn|) |n|) . #7#)))))))))))
                   (LETT |v|
                         (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 155))
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
                         ((SPADCALL (QVELT |w| 0) (QREFELT $ 134))
                          (COND
                           ((SPADCALL (SPADCALL (QVELT |w| 1) (QREFELT $ 141))
                                      (QVELT |w| 2) (QREFELT $ 142))
                            (CONS 1 "failed"))
                           (#6#
                            (SEQ
                             (LETT |u2|
                                   (SPADCALL (QVELT |w| 1)
                                             (CONS #'|RDEEF;polyDElog!1|
                                                   (VECTOR |extint| |t'|))
                                             |t'| (QREFELT $ 140))
                                   . #7#)
                             (EXIT
                              (COND
                               ((OR (QEQCAR |u2| 1)
                                    (SPADCALL
                                     (SPADCALL (QCDR |u2|) (QREFELT $ 141))
                                     (QVELT |w| 2) (QREFELT $ 142)))
                                (CONS 1 "failed"))
                               ('T
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL (QVELT |w| 3) (QCDR |u2|)
                                                 (QREFELT $ 156))
                                       (QVELT |w| 4) (QREFELT $ 148))))))))))
                         (#6#
                          (SEQ
                           (LETT |u3|
                                 (|RDEEF;logdegrad| |twr|
                                  (SPADCALL (QVELT |w| 0) (QREFELT $ 157))
                                  (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                                  |extint| $)
                                 . #7#)
                           (EXIT
                            (COND ((QEQCAR |u3| 1) (CONS 1 "failed"))
                                  (#6#
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL (QVELT |w| 3) (QCDR |u3|)
                                                    (QREFELT $ 156))
                                          (QVELT |w| 4)
                                          (QREFELT $ 148))))))))))))))))))))))
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
  (PROG (|v| |tm| #1=#:G444 |m| |lb| |nc| |nb| |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (QREFELT $ 158)) (CONS 0 (|spadConstant| $ 159)))
            ((SPADCALL |b| (QREFELT $ 158))
             (SEQ
              (LETT |u|
                    (SPADCALL |c| (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 28))
                    . #2=(|RDEEF;gpolDEexp|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#3='T
                      (SPADCALL (QCDR |u|)
                                (CONS #'|RDEEF;gpolDEexp!0|
                                      (VECTOR |extint| |limint| |x| $ |t|))
                                (QREFELT $ 162)))))))
            (#3#
             (SEQ
              (LETT |lb|
                    (|RDEEF;boundAt0| |twr| |ftwr|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| 0 (QREFELT $ 163))
                                (SPADCALL |a| 0 (QREFELT $ 164))
                                (QREFELT $ 67))
                      (QREFELT $ 144))
                     (LETT |nb| (SPADCALL |b| (QREFELT $ 165)) . #2#)
                     (LETT |nc| (SPADCALL |c| (QREFELT $ 165)) . #2#) |x| |t|
                     |limint| $)
                    . #2#)
              (LETT |tm|
                    (SPADCALL (|spadConstant| $ 150)
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
                              (QREFELT $ 112))
                    . #2#)
              (LETT |v|
                    (|RDEEF;polyDEexp| |twr| |ftwr|
                     (SPADCALL |a| |tm| (QREFELT $ 156))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |lb|
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 108)))
                                   |x| (QREFELT $ 65))
                                  (QREFELT $ 66))
                        |a| (QREFELT $ 147))
                       |tm| (QREFELT $ 156))
                      (SPADCALL
                       (SPADCALL |b| (SPADCALL |tm| (QREFELT $ 25))
                                 (QREFELT $ 167))
                       (QREFELT $ 168))
                      (QREFELT $ 148))
                     (SPADCALL
                      (SPADCALL |c|
                                (SPADCALL (|spadConstant| $ 150) (- |m| |lb|)
                                          (QREFELT $ 169))
                                (QREFELT $ 167))
                      (QREFELT $ 168))
                     |x| |t| |driv| |limint| |extint| $)
                    . #2#)
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                     (#3#
                      (CONS 0
                            (SPADCALL (SPADCALL (QCDR |v|) (QREFELT $ 25))
                                      (SPADCALL (|spadConstant| $ 150) |lb|
                                                (QREFELT $ 169))
                                      (QREFELT $ 167))))))))))))) 

(DEFUN |RDEEF;gpolDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;gpolDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 108)) (QREFELT $ 109))
                |z2| |x| |limint| |extint| (QREFELT $ 61)))))) 

(DEFUN |RDEEF;polyDEexp|
       (|twr| |ftwr| |aa| |bb| |cc| |x| |t| |driv| |limint| |extint| $)
  (PROG (|u| |w| #1=#:G481 |v| |n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |cc| (QREFELT $ 134)) (CONS 0 (|spadConstant| $ 135)))
            ((SPADCALL |bb| (QREFELT $ 134))
             (SEQ
              (LETT |u| (SPADCALL |cc| |aa| (QREFELT $ 136))
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
                      (SPADCALL (SPADCALL |bb| (QREFELT $ 143))
                                (SPADCALL |aa| (QREFELT $ 143)) (QREFELT $ 67))
                      (QREFELT $ 144))
                     (SPADCALL |aa| (QREFELT $ 141))
                     (SPADCALL |bb| (QREFELT $ 141))
                     (SPADCALL |cc| (QREFELT $ 141)) |x| |t| |limint| $)
                    . #2#)
              (LETT |v| (SPADCALL |aa| |bb| |cc| |n| |driv| (QREFELT $ 155))
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
                    ((SPADCALL (QVELT |w| 0) (QREFELT $ 134))
                     (COND
                      ((SPADCALL (SPADCALL (QVELT |w| 1) (QREFELT $ 141))
                                 (QVELT |w| 2) (QREFELT $ 142))
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
                                                 (QREFELT $ 156))
                                       (QVELT |w| 4) (QREFELT $ 148))))))))))
                    (#3#
                     (SEQ
                      (LETT |u|
                            (|RDEEF;expdegrad| |twr|
                             (SPADCALL (QVELT |w| 0) (QREFELT $ 157))
                             (QVELT |w| 1) (QVELT |w| 2) |x| |t| |limint|
                             |extint| $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                             (#3#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (QVELT |w| 3) (QCDR |u|)
                                               (QREFELT $ 156))
                                     (QVELT |w| 4)
                                     (QREFELT $ 148))))))))))))))))))))) 

(DEFUN |RDEEF;polyDEexp!1| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 108)) (QREFELT $ 109))
                |z2| |x| |limint| |extint| (QREFELT $ 61)))))) 

(DEFUN |RDEEF;polyDEexp!0| (|z1| |z2| $$)
  (PROG (|t| $ |x| |limint| |extint|)
    (LETT |t| (QREFELT $$ 4) . #1=(|RDEEF;polyDEexp|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |x| (QREFELT $$ 2) . #1#)
    (LETT |limint| (QREFELT $$ 1) . #1#)
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 108)) (QREFELT $ 109))
                |z2| |x| |limint| |extint| (QREFELT $ 61)))))) 

(DEFUN |RDEEF;exppolyint| (|p| |rischdiffeq| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (SPADCALL |p| (QREFELT $ 25)) |rischdiffeq|
                      (QREFELT $ 162))
            |RDEEF;exppolyint|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (SPADCALL (QCDR |u|) (QREFELT $ 170))))))))) 

(DEFUN |RDEEF;boundInf|
       (|twr| |ftwr| |f0| |da| |db| |dc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G527 |u| #2=#:G526 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((< |da| |db|) (- |dc| |db|))
            ((SPADCALL |da| |db| (QREFELT $ 142)) (MAX 0 (- |dc| |da|)))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 103))
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
                                              (SPADCALL |u| (QREFELT $ 108)))
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
                                       |x| (QREFELT $ 146))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 93))
                                  (QREFELT $ 172))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 173))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 174))
                               (EXIT
                                (MAX 0
                                     (MAX
                                      (SPADCALL (QCAR |al|) (QREFELT $ 175))
                                      (- |dc| |db|))))))))
                           (EXIT (- |dc| |db|))))
                         (#3# (- |dc| |db|))))))))))))))) 

(DEFUN |RDEEF;boundAt0| (|twr| |ftwr| |f0| |nb| |nc| |x| |t| |limitedint| $)
  (PROG (|al| |alpha| |if0| #1=#:G545 |u| #2=#:G544 |l1| |l0|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |nb| 0 (QREFELT $ 176)) (MIN 0 (- |nc| (MIN 0 |nb|))))
            (#3='T
             (SEQ
              (LETT |l1|
                    (|RDEEF;logdiff| |twr|
                     (LETT |l0| (SPADCALL |f0| (QREFELT $ 103))
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
                                              (SPADCALL |u| (QREFELT $ 108)))
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
                                       |x| (QREFELT $ 146))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |alpha| 0)
                          (SEQ
                           (LETT |al|
                                 (SPADCALL
                                  (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 93))
                                  (QREFELT $ 172))
                                 . #4#)
                           (COND
                            ((SPADCALL (QCDR |al|) (QREFELT $ 173))
                             (COND
                              ((SPADCALL (QCAR |al|) (QREFELT $ 174))
                               (EXIT
                                (MIN 0
                                     (MIN
                                      (SPADCALL (QCAR |al|) (QREFELT $ 175))
                                      |nc|)))))))
                           (EXIT (MIN 0 |nc|))))
                         (#3# (MIN 0 |nc|))))))))))))))) 

(DEFUN |RDEEF;logdegrad| (|twr| |b| |c| |n| |x| |t| |limitedint| |extint| $)
  (PROG (#1=#:G566 #2=#:G565 #3=#:G567 #4=#:G577 |v| |u1| |alpha| |if0|
         #5=#:G576 |u| #6=#:G575 |lk1| |lk0| |f0| |t'|)
    (RETURN
     (SEQ
      (LETT |t'| (SPADCALL (SPADCALL |t| (QREFELT $ 42)) |x| (QREFELT $ 65))
            . #7=(|RDEEF;logdegrad|))
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL (LETT |f0| (SPADCALL |b| (QREFELT $ 144)) . #7#)
                             (QREFELT $ 103))
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
                                      (SPADCALL |u| (QREFELT $ 108)))
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
                               (QREFELT $ 146))
                     . #7#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |u1|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCDR |alpha|) (QREFELT $ 177))
                                    |c| (QREFELT $ 147))
                          (CONS #'|RDEEF;logdegrad!0| (VECTOR |extint| |t'|))
                          |t'| (QREFELT $ 140))
                         . #7#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |u1| 1)
                          (SPADCALL (SPADCALL (QCDR |u1|) (QREFELT $ 141)) |n|
                                    (QREFELT $ 142)))
                      (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL (QCDR |alpha|) (QCDR |u1|)
                                      (QREFELT $ 147))))))))
                 (#8#
                  (|RDEEF;logdeg| |c|
                   (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 144))
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
                                                                (QREFELT $
                                                                         101))
                                                      (QREFELT $ 94))
                                            . #7#)
                                      (COND
                                       (#1#
                                        (LETT #2#
                                              (SPADCALL #2# #3#
                                                        (QREFELT $ 100))
                                              . #7#))
                                       ('T
                                        (PROGN
                                         (LETT #2# #3# . #7#)
                                         (LETT #1# 'T . #7#)))))))
                                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#1# #2#) (#8# (|spadConstant| $ 40))))
                             (QREFELT $ 91))
                   |n| |x| |t'| |limitedint| |extint| $)))))))))))) 

(DEFUN |RDEEF;logdegrad!0| (|z1| $$)
  (PROG (|t'| |extint|)
    (LETT |t'| (QREFELT $$ 1) . #1=(|RDEEF;logdegrad|))
    (LETT |extint| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |t'| |extint|))))) 

(DEFUN |RDEEF;logdeg| (|c| |f| |n| |x| |t'| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G595 #2=#:G602 |u| #3=#:G598 |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |answr| (|spadConstant| $ 135) . #4=(|RDEEF;logdeg|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |c| (QREFELT $ 134))
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
                           (SEQ (LETT |m| (SPADCALL |c| (QREFELT $ 141)) . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |m| |n| (QREFELT $ 142))
                                   (PROGN
                                    (LETT #3#
                                          (PROGN
                                           (LETT #2# (CONS 1 #5#) . #4#)
                                           (GO #2#))
                                          . #4#)
                                    (GO #3#))))))))
                         (LETT |u|
                               (SPADCALL 1 |f| (SPADCALL |c| (QREFELT $ 143))
                                         |x| |limitedint| |extint|
                                         (QREFELT $ 61))
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
                                                             (QREFELT $ 104))
                                                   (QREFELT $ 148)))
                                   . #4#)
                             (GO #2#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #4#)
                                 (LETT |c|
                                       (SPADCALL (SPADCALL |c| (QREFELT $ 178))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |m| |t'|
                                                             (QREFELT $ 66))
                                                   (QVELT |u| 0)
                                                   (QREFELT $ 94))
                                                  (PROG1
                                                      (LETT #1# (- |m| 1)
                                                            . #4#)
                                                    (|check_subtype| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #1#))
                                                  (QREFELT $ 112))
                                                 (QREFELT $ 179))
                                       . #4#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 112))
                                                  (QREFELT $ 148))
                                        . #4#))))))))
                       #3# (EXIT #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |RDEEF;expdegrad| (|twr| |b| |c| |n| |x| |t| |limint| |extint| $)
  (PROG (|u1| #1=#:G620 |al| |alpha| |intf0| #2=#:G613 #3=#:G612 #4=#:G614
         #5=#:G651 |v| |if0| #6=#:G650 |u| #7=#:G649 |lk1| |lk0| |f0|)
    (RETURN
     (SEQ
      (LETT |lk1|
            (|RDEEF;logdiff| |twr|
             (LETT |lk0|
                   (SPADCALL
                    (LETT |f0| (SPADCALL |b| (QREFELT $ 144))
                          . #8=(|RDEEF;expdegrad|))
                    (QREFELT $ 103))
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
                                      (SPADCALL |u| (QREFELT $ 108)))
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
                     (SPADCALL (SPADCALL (QCAR (QCDR |if0|)) (QREFELT $ 144))
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
                                                                           101))
                                                        (QREFELT $ 94))
                                              . #8#)
                                        (COND
                                         (#2#
                                          (LETT #3#
                                                (SPADCALL #3# #4#
                                                          (QREFELT $ 100))
                                                . #8#))
                                         ('T
                                          (PROGN
                                           (LETT #3# #4# . #8#)
                                           (LETT #2# 'T . #8#)))))))
                                     (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#2# #3#) (#9# (|spadConstant| $ 40))))
                               (QREFELT $ 91))
                     . #8#)
               (LETT |alpha|
                     (SPADCALL (CONS |t| |lk0|) (|RDEEF;RRF2F| (QCDR |if0|) $)
                               |x| (QREFELT $ 146))
                     . #8#)
               (EXIT
                (COND
                 ((QEQCAR |alpha| 0)
                  (SEQ
                   (LETT |al|
                         (SPADCALL (SPADCALL (QCDR |alpha|) |t| (QREFELT $ 93))
                                   (QREFELT $ 172))
                         . #8#)
                   (COND
                    ((SPADCALL (QCDR |al|) (QREFELT $ 173))
                     (COND
                      ((SPADCALL (QCAR |al|) (QREFELT $ 174))
                       (COND
                        ((>= (SPADCALL (QCAR |al|) (QREFELT $ 175)) 0)
                         (EXIT
                          (SEQ
                           (LETT |u1|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c| (QREFELT $ 25))
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL (QCAR |al|)
                                                                (QREFELT $
                                                                         180))
                                                      . #8#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (|LaurentPolynomial|
                                                              (QREFELT $ 7)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 7)))
                                                             #1#))
                                            (QREFELT $ 167))
                                  (CONS #'|RDEEF;expdegrad!0|
                                        (VECTOR |extint| |limint| |x| $ |t|))
                                  (QREFELT $ 162))
                                 . #8#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |u1| 1)
                                  (SPADCALL
                                   (SPADCALL (QCDR |u1|) (QREFELT $ 175)) |n|
                                   (QREFELT $ 142)))
                              (CONS 1 "failed"))
                             ('T
                              (SPADCALL
                               (SPADCALL (QCAR |al|) (QCDR |u1|)
                                         (QREFELT $ 167))
                               (QREFELT $ 170)))))))))))))
                   (EXIT
                    (|RDEEF;expdeg| |c| |intf0| |n| |x|
                     (|SPADfirst| (SPADCALL |t| (QREFELT $ 108))) |limint|
                     |extint| $))))
                 (#9#
                  (|RDEEF;expdeg| |c| |intf0| |n| |x|
                   (|SPADfirst| (SPADCALL |t| (QREFELT $ 108))) |limint|
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
      (SPADCALL |z1| (SPADCALL (SPADCALL |t| (QREFELT $ 108)) (QREFELT $ 109))
                |z2| |x| |limint| |extint| (QREFELT $ 61)))))) 

(DEFUN |RDEEF;expdeg| (|c| |f| |n| |x| |eta| |limitedint| |extint| $)
  (PROG (|answr| #1=#:G675 |u| #2=#:G671 |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |answr| (|spadConstant| $ 135) . #3=(|RDEEF;expdeg|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |c| (QREFELT $ 134))
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
                           (SEQ (LETT |m| (SPADCALL |c| (QREFELT $ 141)) . #3#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |m| |n| (QREFELT $ 142))
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
                                                             (QREFELT $ 181))
                                                   (QREFELT $ 100))
                                         (SPADCALL |c| (QREFELT $ 143)) |x|
                                         |limitedint| |extint| (QREFELT $ 61))
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
                                                             (QREFELT $ 104))
                                                   (QREFELT $ 148)))
                                   . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ (LETT |n| (- |m| 1) . #3#)
                                 (LETT |c| (SPADCALL |c| (QREFELT $ 178))
                                       . #3#)
                                 (EXIT
                                  (LETT |answr|
                                        (SPADCALL |answr|
                                                  (SPADCALL (QVELT |u| 0) |m|
                                                            (QREFELT $ 112))
                                                  (QREFELT $ 148))
                                        . #3#))))))))
                       #2# (EXIT #2#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |RDEEF;RRF2F| (|rrf| $)
  (PROG (#1=#:G679 #2=#:G678 #3=#:G680 #4=#:G682 |v|)
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
                                         (SPADCALL (QCDR |v|) (QREFELT $ 101))
                                         (QREFELT $ 94))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 100)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 40))))
                (QREFELT $ 100)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDE;|)) 

(DEFUN |ElementaryRischDE| (&REST #1=#:G683)
  (PROG ()
    (RETURN
     (PROG (#2=#:G684)
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
      (LETT $ (GETREFV 182) . #1#)
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
      (QSETREFV $ 20 (SPADCALL (QREFELT $ 19)))
      $)))) 

(MAKEPROP '|ElementaryRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|)
              (|Record| (|:| |coeff| 80) (|:| |argument| 78))
              (|AssociationList| 7 76) (17 . |table|) '|tab|
              (|SparseUnivariatePolynomial| 7) (|Fraction| 21) (21 . |numer|)
              (|LaurentPolynomial| 7 21) (26 . |coerce|) (31 . |denom|)
              (|Union| $ '"failed") (36 . |exquo|) (|List| 12) (42 . |member?|)
              (|IntegrationTools| 6 7) (48 . |ksec|) (|Union| 11 '"failed")
              (55 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 35 7 7 11)
              (|PureAlgebraicIntegration| 6 7 7) (60 . |palgRDE|) (70 . |Zero|)
              (74 . |Zero|) (|Kernel| $) (78 . |coerce|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 21) (|:| |pol2| 21)
                        (|:| |prim| 21))
              (|FunctionSpacePrimitiveElement| 6 7) (83 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (89 . |rootOf|) (94 . |elt|)
              (|List| 41) (|List| $) (100 . |eval|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|Integer|) (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 54)))
              (|Union| 55 '"failed") (|Mapping| 56 7 107)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 58 '"failed") (|Mapping| 59 7 7)
              |RDEEF;rischDE;I2FSMMR;5| (107 . |retract|) (112 . |eval|)
              (119 . |zero?|) (124 . |differentiate|) (130 . *) (136 . /)
              (142 . |freeOf?|) (148 . |kernels|) (153 . |union|)
              (159 . |varselect|) (165 . |kmax|) (170 . |kernel|)
              (|Union| 76 '"failed") (175 . |search|) (|List| 17)
              (181 . |setelt|) (|SparseMultivariatePolynomial| 6 12)
              (188 . |One|) (|Fraction| 53) (192 . *) (198 . |Zero|) (202 . >)
              (|Union| 53 '"failed") (208 . |retractIfCan|)
              (|NonNegativeInteger|) (213 . ^) (219 . *)
              (|SparseMultivariatePolynomial| 6 41) (225 . |coerce|) (230 . -)
              (|Fraction| 46) (236 . |univariate|) (242 . *)
              (|Record| (|:| |ans| 22) (|:| |nosol| 10))
              (|TranscendentalRischDE| 7 21) (248 . |baseRDE|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 78 7)
              (254 . |multivariate|) (260 . +) (266 . |log|) (271 . *)
              (277 . |tower|) (282 . |coerce|) (|Mapping| 7 7)
              (287 . |differentiate|) (|List| 7) (294 . |argument|)
              (299 . |first|) (|PositiveInteger|) (304 . |One|)
              (308 . |monomial|) (314 . |numer|) (319 . |denom|)
              (324 . |univariate|) (|SparseUnivariatePolynomial| 78)
              (330 . |degree|) (335 . |leadingCoefficient|) (340 . /)
              (|Union| 80 '"failed") (346 . |retractIfCan|) (351 . |degree|)
              (357 . >) (363 . -)
              (|Record| (|:| |a| 21) (|:| |b| 22) (|:| |c| 22) (|:| |t| 21))
              (|Union| 125 '"failed") (|Mapping| 21 21) (368 . |monomRDE|)
              (375 . |retract|) (380 . /) (386 . |convert|) (391 . |coerce|)
              (396 . /) (402 . |zero?|) (407 . |Zero|) (411 . |exquo|)
              (|Union| 21 '"failed") (|Mapping| 59 7)
              (|TranscendentalIntegration| 7 21) (417 . |primintfldpoly|)
              (424 . |degree|) (429 . >) (435 . |leadingCoefficient|) (440 . -)
              (|ElementaryFunctionStructurePackage| 6 7)
              (445 . |validExponential|) (452 . *) (458 . +) (464 . |One|)
              (468 . |One|) (472 . |retractIfCan|)
              (|Record| (|:| |ans| 21) (|:| |nosol| 10))
              (|Record| (|:| |b| 21) (|:| |c| 21) (|:| |m| 53) (|:| |alpha| 21)
                        (|:| |beta| 21))
              (|Union| (|:| |ans| 152) (|:| |eq| 153)) (477 . |polyRDE|)
              (486 . *) (492 . |retract|) (497 . |zero?|) (502 . |Zero|)
              (|Union| 24 '"failed") (|Mapping| 52 53 7)
              (506 . |expintfldpoly|) (512 . |coefficient|)
              (518 . |coefficient|) (524 . |order|) (529 . |Zero|) (533 . *)
              (539 . |retract|) (544 . |monomial|) (550 . |retractIfCan|)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 22))
              (555 . |separate|) (560 . |zero?|) (565 . |monomial?|)
              (570 . |degree|) (575 . ~=) (581 . |inv|) (586 . |reductum|)
              (591 . -) (597 . |recip|) (602 . *))
           '#(|rischDE| 608) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 181
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 0 18 0 19 1
                                                   22 21 0 23 1 24 0 21 25 1 22
                                                   21 0 26 2 24 27 0 0 28 2 29
                                                   10 12 0 30 3 31 12 12 29 11
                                                   32 1 12 33 0 34 6 37 35 7 7
                                                   7 12 12 36 38 0 6 0 39 0 7 0
                                                   40 1 7 0 41 42 2 44 43 7 7
                                                   45 1 7 0 46 47 2 21 7 0 7 48
                                                   3 7 0 0 49 50 51 1 7 41 0 62
                                                   3 7 0 0 41 0 63 1 7 10 0 64
                                                   2 7 0 0 11 65 2 7 0 53 0 66
                                                   2 7 0 0 0 67 2 7 10 0 11 68
                                                   1 7 49 0 69 2 31 29 29 29 70
                                                   2 31 29 29 11 71 1 31 12 29
                                                   72 1 12 0 11 73 2 18 74 7 0
                                                   75 3 18 76 0 7 76 77 0 78 0
                                                   79 2 80 0 53 0 81 0 80 0 82
                                                   2 80 10 0 0 83 1 80 84 0 85
                                                   2 78 0 0 86 87 2 78 0 0 0 88
                                                   1 7 0 89 90 2 7 0 0 0 91 2 7
                                                   92 0 41 93 2 7 0 0 0 94 2 96
                                                   95 22 22 97 2 98 7 22 12 99
                                                   2 7 0 0 0 100 1 7 0 0 101 2
                                                   7 0 80 0 102 1 7 49 0 103 1
                                                   21 0 7 104 3 21 0 0 105 0
                                                   106 1 12 107 0 108 1 107 7 0
                                                   109 0 110 0 111 2 21 0 7 86
                                                   112 1 7 89 0 113 1 7 89 0
                                                   114 2 78 46 0 12 115 1 116
                                                   86 0 117 1 116 78 0 118 2 7
                                                   0 89 89 119 1 7 120 0 121 2
                                                   78 86 0 12 122 2 86 10 0 0
                                                   123 1 80 0 0 124 3 96 126 22
                                                   22 127 128 1 22 21 0 129 2
                                                   22 0 21 21 130 1 24 22 0 131
                                                   1 22 0 21 132 2 22 0 0 0 133
                                                   1 21 10 0 134 0 21 0 135 2
                                                   21 27 0 0 136 3 139 137 21
                                                   138 7 140 1 21 86 0 141 2 53
                                                   10 0 0 142 1 21 7 0 143 1 7
                                                   0 0 144 3 145 35 29 7 11 146
                                                   2 21 0 7 0 147 2 21 0 0 0
                                                   148 0 6 0 149 0 7 0 150 1 7
                                                   84 0 151 5 96 154 21 21 21
                                                   53 127 155 2 21 0 0 0 156 1
                                                   21 7 0 157 1 24 10 0 158 0
                                                   24 0 159 2 139 160 24 161
                                                   162 2 24 7 0 53 163 2 21 7 0
                                                   86 164 1 24 53 0 165 0 78 0
                                                   166 2 24 0 0 0 167 1 24 21 0
                                                   168 2 24 0 7 53 169 1 24 137
                                                   0 170 1 24 171 22 172 1 22
                                                   10 0 173 1 24 10 0 174 1 24
                                                   53 0 175 2 53 10 0 0 176 1 7
                                                   0 0 177 1 21 0 0 178 2 21 0
                                                   0 0 179 1 24 27 0 180 2 7 0
                                                   86 0 181 6 0 52 53 7 7 11 57
                                                   60 61)))))
           '|lookupComplete|)) 
