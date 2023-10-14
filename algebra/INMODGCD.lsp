
(/VERSIONCHECK 2) 

(DEFUN |INMODGCD;reduction;BPRBP;1| (|u| |p| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
           ('T
            (SPADCALL (CONS #'|INMODGCD;reduction;BPRBP;1!0| (VECTOR $ |p|))
                      |u| (QREFELT $ 16))))))) 

(DEFUN |INMODGCD;reduction;BPRBP;1!0| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|INMODGCD;reduction;BPRBP;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 14)))))) 

(DEFUN |INMODGCD;reduction;BPRBP;2| (|u| |p| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) |u|)
           ('T
            (SPADCALL (CONS #'|INMODGCD;reduction;BPRBP;2!0| (VECTOR $ |p|))
                      |u| (QREFELT $ 16))))))) 

(DEFUN |INMODGCD;reduction;BPRBP;2!0| (|r1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|INMODGCD;reduction;BPRBP;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT $ 18)))))) 

(DEFUN |INMODGCD;modularGcdPrimitive;LBP;3| (|listf| $)
  (PROG (|g| #1=#:G157 |f|)
    (RETURN
     (SEQ
      (COND ((NULL |listf|) (|spadConstant| $ 11))
            (#2='T
             (SEQ
              (LETT |g| (|SPADfirst| |listf|)
                    . #3=(|INMODGCD;modularGcdPrimitive;LBP;3|))
              (SEQ (LETT |f| NIL . #3#) (LETT #1# (CDR |listf|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL)
                         (NULL
                          (SPADCALL (SPADCALL |g| (QREFELT $ 23)) 0
                                    (QREFELT $ 24))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |f| (QREFELT $ 21)) 'NIL) (#2# 'T))
                       (LETT |g| (|INMODGCD;modGcdPrimitive| |g| |f| $)
                             . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |g|)))))))) 

(DEFUN |INMODGCD;modularGcd;LBP;4| (|listf| $)
  (PROG (|ans| |minpol| #1=#:G162 #2=#:G183 |f| #3=#:G184 |cf| #4=#:G182
         |contgcd| |listCont| #5=#:G181 #6=#:G180 |listdeg| #7=#:G179 #8=#:G178
         #9=#:G177 #10=#:G176 |minpol1| |mdeg| #11=#:G159 #12=#:G158 #13=#:G160
         #14=#:G175)
    (RETURN
     (SEQ
      (LETT |listf| (SPADCALL (|spadConstant| $ 11) |listf| (QREFELT $ 27))
            . #15=(|INMODGCD;modularGcd;LBP;4|))
      (EXIT
       (COND ((NULL |listf|) (|spadConstant| $ 11))
             ((EQL (LENGTH |listf|) 1) (|SPADfirst| |listf|))
             (#16='T
              (SEQ (LETT |minpol| (|spadConstant| $ 29) . #15#)
                   (LETT |mdeg|
                         (PROGN
                          (LETT #11# NIL . #15#)
                          (SEQ (LETT |f| NIL . #15#) (LETT #14# |listf| . #15#)
                               G190
                               (COND
                                ((OR (ATOM #14#)
                                     (PROGN (LETT |f| (CAR #14#) . #15#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #13# (SPADCALL |f| (QREFELT $ 30))
                                        . #15#)
                                  (COND
                                   (#11# (LETT #12# (MIN #12# #13#) . #15#))
                                   ('T
                                    (PROGN
                                     (LETT #12# #13# . #15#)
                                     (LETT #11# 'T . #15#)))))))
                               (LETT #14# (CDR #14#) . #15#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#11# #12#) (#16# (|IdentityError| '|min|))))
                         . #15#)
                   (COND
                    ((SPADCALL |mdeg| 0 (QREFELT $ 24))
                     (SEQ
                      (LETT |minpol1|
                            (SPADCALL (|spadConstant| $ 28) |mdeg|
                                      (QREFELT $ 31))
                            . #15#)
                      (LETT |listf|
                            (PROGN
                             (LETT #10# NIL . #15#)
                             (SEQ (LETT |f| NIL . #15#)
                                  (LETT #9# |listf| . #15#) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN
                                         (LETT |f| (CAR #9#) . #15#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #10#
                                          (CONS
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL |f| |minpol1|
                                                               (QREFELT $ 33))
                                                     . #15#)
                                               (QCDR #1#)
                                             (|check_union| (QEQCAR #1# 0)
                                                            (QREFELT $ 7) #1#))
                                           #10#)
                                          . #15#)))
                                  (LETT #9# (CDR #9#) . #15#) (GO G190) G191
                                  (EXIT (NREVERSE #10#))))
                            . #15#)
                      (EXIT
                       (LETT |minpol|
                             (SPADCALL |minpol| |minpol1| (QREFELT $ 34))
                             . #15#)))))
                   (LETT |listdeg|
                         (PROGN
                          (LETT #8# NIL . #15#)
                          (SEQ (LETT |f| NIL . #15#) (LETT #7# |listf| . #15#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |f| (CAR #7#) . #15#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #8#
                                       (CONS (SPADCALL |f| (QREFELT $ 23)) #8#)
                                       . #15#)))
                               (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #8#))))
                         . #15#)
                   (LETT |listCont|
                         (PROGN
                          (LETT #6# NIL . #15#)
                          (SEQ (LETT |f| NIL . #15#) (LETT #5# |listf| . #15#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |f| (CAR #5#) . #15#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS (SPADCALL |f| (QREFELT $ 35)) #6#)
                                       . #15#)))
                               (LETT #5# (CDR #5#) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #6#))))
                         . #15#)
                   (LETT |contgcd| (SPADCALL |listCont| (QREFELT $ 37)) . #15#)
                   (LETT |listf|
                         (PROGN
                          (LETT #4# NIL . #15#)
                          (SEQ (LETT |cf| NIL . #15#)
                               (LETT #3# |listCont| . #15#)
                               (LETT |f| NIL . #15#) (LETT #2# |listf| . #15#)
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |f| (CAR #2#) . #15#) NIL)
                                     (ATOM #3#)
                                     (PROGN (LETT |cf| (CAR #3#) . #15#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL |f| |cf|
                                                            (QREFELT $ 38))
                                                  . #15#)
                                            (QCDR #1#)
                                          (|check_union| (QEQCAR #1# 0)
                                                         (QREFELT $ 7) #1#))
                                        #4#)
                                       . #15#)))
                               (LETT #2#
                                     (PROG1 (CDR #2#)
                                       (LETT #3# (CDR #3#) . #15#))
                                     . #15#)
                               (GO G190) G191 (EXIT (NREVERSE #4#))))
                         . #15#)
                   (LETT |minpol| (SPADCALL |contgcd| |minpol| (QREFELT $ 39))
                         . #15#)
                   (LETT |ans|
                         (COND
                          ((SPADCALL (|spadConstant| $ 29) |listf|
                                     (QREFELT $ 40))
                           (|spadConstant| $ 29))
                          ((SPADCALL 1 |listdeg| (QREFELT $ 42))
                           (|INMODGCD;lincase| |listdeg| |listf| $))
                          (#16# (SPADCALL |listf| (QREFELT $ 26))))
                         . #15#)
                   (EXIT (SPADCALL |minpol| |ans| (QREFELT $ 34))))))))))) 

(DEFUN |INMODGCD;lincase| (|listdeg| |listf| $)
  (PROG (#1=#:G193 |f1| #2=#:G194 |f| |g| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 45))
              . #3=(|INMODGCD;lincase|))
        (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 46)) . #3#)
        (SEQ (LETT |f| NIL . #3#) (LETT #2# |listf| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 33)) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |f1| 1)
                     (PROGN
                      (LETT #1# (|spadConstant| $ 29) . #3#)
                      (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT |g|)))
      #1# (EXIT #1#))))) 

(DEFUN |INMODGCD;test| (|f| |g| |d| $)
  (PROG (|d0|)
    (RETURN
     (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT $ 47)) |INMODGCD;test|)
          (EXIT
           (COND
            ((OR
              (QEQCAR
               (SPADCALL (SPADCALL |f| 0 (QREFELT $ 47)) |d0| (QREFELT $ 48))
               1)
              (OR
               (QEQCAR
                (SPADCALL (SPADCALL |g| 0 (QREFELT $ 47)) |d0| (QREFELT $ 48))
                1)
               (OR (QEQCAR (SPADCALL |f| |d| (QREFELT $ 33)) 1)
                   (QEQCAR (SPADCALL |g| |d| (QREFELT $ 33)) 1))))
             'NIL)
            ('T 'T))))))) 

(DEFUN |INMODGCD;modGcdPrimitive| (|f| |g| $)
  (PROG (#1=#:G226 |result| |testdeg| |soFar| |soFarModulus| |correctionFactor|
         |ans| #2=#:G209 |cont| |correction| |dp| |ldp| |lcdp| |dgp| |gp| |fp|
         |prime| |bound| |lcd| |lcg| |lcf| |dg| |df|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |df| (SPADCALL |f| (QREFELT $ 23))
              . #3=(|INMODGCD;modGcdPrimitive|))
        (LETT |dg| (SPADCALL |g| (QREFELT $ 23)) . #3#)
        (LETT |lcf| (SPADCALL |f| (QREFELT $ 49)) . #3#)
        (LETT |lcg| (SPADCALL |g| (QREFELT $ 49)) . #3#)
        (LETT |lcd| (SPADCALL |lcf| |lcg| (QREFELT $ 50)) . #3#)
        (LETT |prime| (QREFELT $ 8) . #3#)
        (LETT |bound| (|INMODGCD;mbound| |f| |g| $) . #3#)
        (SEQ G190
             (COND
              ((NULL
                (SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                          (QREFELT $ 51)))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT |prime| (SPADCALL |prime| |bound| (QREFELT $ 9)) . #3#)))
             NIL (GO G190) G191 (EXIT NIL))
        (LETT |soFar|
              (SPADCALL
               (SPADCALL (SPADCALL |f| |prime| (QREFELT $ 52))
                         (SPADCALL |g| |prime| (QREFELT $ 52)) (QREFELT $ 53))
               (QREFELT $ 54))
              . #3#)
        (LETT |testdeg| (SPADCALL |soFar| (QREFELT $ 23)) . #3#)
        (EXIT
         (COND
          ((ZEROP |testdeg|)
           (PROGN (LETT #1# (|spadConstant| $ 29) . #3#) (GO #1#)))
          (#4='T
           (SEQ
            (LETT |ldp|
                  (SEQ (LETT |lcdp| (SPADCALL |soFar| (QREFELT $ 49)) . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |lcdp| (|spadConstant| $ 28)
                                    (QREFELT $ 13))
                          (SPADCALL (SPADCALL |lcd| (QREFELT $ 55)) |prime|
                                    (QREFELT $ 52)))
                         (#4#
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|INMODGCD;modInverse| |lcdp| |prime| $)
                                      |lcd| (QREFELT $ 56))
                            (QREFELT $ 55))
                           |prime| (QREFELT $ 52))))))
                  . #3#)
            (LETT |soFar|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |ldp| (QREFELT $ 54)) |soFar|
                              (QREFELT $ 34))
                    |prime| (QREFELT $ 52))
                   (QREFELT $ 54))
                  . #3#)
            (LETT |soFarModulus| |prime| . #3#)
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |prime| (SPADCALL |prime| |bound| (QREFELT $ 9))
                         . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |lcd| |prime| (QREFELT $ 18))
                                (|spadConstant| $ 10) (QREFELT $ 13))
                      "next prime")
                     ('T
                      (SEQ
                       (LETT |fp| (SPADCALL |f| |prime| (QREFELT $ 52)) . #3#)
                       (LETT |gp| (SPADCALL |g| |prime| (QREFELT $ 52)) . #3#)
                       (LETT |dp| (SPADCALL |fp| |gp| (QREFELT $ 53)) . #3#)
                       (LETT |dgp| (SPADCALL |dp| (QREFELT $ 57)) . #3#)
                       (COND
                        ((EQL |dgp| 0)
                         (PROGN
                          (LETT #1# (|spadConstant| $ 29) . #3#)
                          (GO #1#))))
                       (COND
                        ((EQL |dgp| |dg|)
                         (COND
                          ((NULL (QEQCAR (SPADCALL |f| |g| (QREFELT $ 33)) 1))
                           (PROGN (LETT #1# |g| . #3#) (GO #1#))))))
                       (COND
                        ((EQL |dgp| |df|)
                         (COND
                          ((NULL (QEQCAR (SPADCALL |g| |f| (QREFELT $ 33)) 1))
                           (PROGN (LETT #1# |f| . #3#) (GO #1#))))))
                       (EXIT
                        (COND
                         ((SPADCALL |dgp| |testdeg| (QREFELT $ 24))
                          "next prime")
                         ('T
                          (SEQ
                           (LETT |ldp|
                                 (SEQ
                                  (LETT |lcdp|
                                        (SPADCALL
                                         (SPADCALL |dp| (QREFELT $ 54))
                                         (QREFELT $ 49))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |lcdp| (|spadConstant| $ 28)
                                               (QREFELT $ 13))
                                     (SPADCALL (SPADCALL |lcd| (QREFELT $ 55))
                                               |prime| (QREFELT $ 52)))
                                    ('T
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (|INMODGCD;modInverse| |lcdp| |prime|
                                         $)
                                        |lcd| (QREFELT $ 56))
                                       (QREFELT $ 55))
                                      |prime| (QREFELT $ 52))))))
                                 . #3#)
                           (LETT |dp| (SPADCALL |ldp| |dp| (QREFELT $ 58))
                                 . #3#)
                           (EXIT
                            (COND
                             ((EQL |dgp| |testdeg|)
                              (SEQ
                               (LETT |correction|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |dp| (QREFELT $ 54))
                                                 |soFar| (QREFELT $ 59))
                                       |prime| (QREFELT $ 52))
                                      (QREFELT $ 54))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((SPADCALL |correction| (QREFELT $ 21))
                                  (SEQ
                                   (LETT |ans|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |lcd| (QREFELT $ 55))
                                            |soFar| (QREFELT $ 34))
                                           |soFarModulus| (QREFELT $ 52))
                                          (QREFELT $ 54))
                                         . #3#)
                                   (LETT |cont| (SPADCALL |ans| (QREFELT $ 35))
                                         . #3#)
                                   (LETT |ans|
                                         (PROG2
                                             (LETT #2#
                                                   (SPADCALL |ans| |cont|
                                                             (QREFELT $ 38))
                                                   . #3#)
                                             (QCDR #2#)
                                           (|check_union| (QEQCAR #2# 0)
                                                          (QREFELT $ 7) #2#))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((|INMODGCD;test| |f| |g| |ans| $)
                                      (PROGN (LETT #1# |ans| . #3#) (GO #1#)))
                                     ('T
                                      (LETT |soFarModulus|
                                            (SPADCALL |soFarModulus| |prime|
                                                      (QREFELT $ 56))
                                            . #3#))))))
                                 ('T
                                  (SEQ
                                   (LETT |correctionFactor|
                                         (|INMODGCD;modInverse|
                                          (SPADCALL |soFarModulus| |prime|
                                                    (QREFELT $ 18))
                                          |prime| $)
                                         . #3#)
                                   (LETT |soFar|
                                         (SPADCALL |soFar|
                                                   (SPADCALL |soFarModulus|
                                                             (SPADCALL
                                                              |correctionFactor|
                                                              |correction|
                                                              (QREFELT $ 39))
                                                             (QREFELT $ 39))
                                                   (QREFELT $ 60))
                                         . #3#)
                                   (LETT |soFarModulus|
                                         (SPADCALL |soFarModulus| |prime|
                                                   (QREFELT $ 56))
                                         . #3#)
                                   (EXIT
                                    (LETT |soFar|
                                          (SPADCALL
                                           (SPADCALL |soFar| |soFarModulus|
                                                     (QREFELT $ 52))
                                           (QREFELT $ 54))
                                          . #3#))))))))
                             ((< |dgp| |testdeg|)
                              (SEQ (LETT |soFarModulus| |prime| . #3#)
                                   (LETT |soFar| (SPADCALL |dp| (QREFELT $ 54))
                                         . #3#)
                                   (EXIT (LETT |testdeg| |dgp| . #3#))))
                             ((NULL (QREFELT $ 20))
                              (COND
                               ((SPADCALL (SPADCALL |prime| (QREFELT $ 61)) 1
                                          (QREFELT $ 24))
                                (SEQ
                                 (LETT |result| (SPADCALL |dp| (QREFELT $ 54))
                                       . #3#)
                                 (EXIT
                                  (COND
                                   ((|INMODGCD;test| |f| |g| |result| $)
                                    (PROGN
                                     (LETT #1# |result| . #3#)
                                     (GO #1#))))))))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INMODGCD;merge| (|p| |q| $)
  (COND ((SPADCALL |p| |q| (QREFELT $ 13)) (CONS 0 |p|))
        ((SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 13)) (CONS 0 |q|))
        ((SPADCALL |q| (|spadConstant| $ 10) (QREFELT $ 13)) (CONS 0 |p|))
        ('T (CONS 1 "failed")))) 

(DEFUN |INMODGCD;modInverse| (|c| |p| $)
  (PROG (#1=#:G233)
    (RETURN
     (QCAR
      (PROG2
          (LETT #1# (SPADCALL |c| |p| (|spadConstant| $ 28) (QREFELT $ 64))
                |INMODGCD;modInverse|)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0)
                       (|Record| (|:| |coef1| (QREFELT $ 6))
                                 (|:| |coef2| (QREFELT $ 6)))
                       #1#)))))) 

(DEFUN |INMODGCD;exactquo| (|u| |v| |p| $)
  (PROG (|r| |invlcv|)
    (RETURN
     (SEQ
      (LETT |invlcv|
            (|INMODGCD;modInverse| (SPADCALL |v| (QREFELT $ 49)) |p| $)
            . #1=(|INMODGCD;exactquo|))
      (LETT |r|
            (SPADCALL |u|
                      (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 39)) |p|
                                (QREFELT $ 17))
                      (QREFELT $ 66))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 17))
                   (|spadConstant| $ 11) (QREFELT $ 67))
         (CONS 1 "failed"))
        ('T
         (CONS 0
               (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 39)) |p|
                         (QREFELT $ 17)))))))))) 

(DEFUN |INMODGCD;height| (|f| $)
  (PROG (#1=#:G243 #2=#:G242 #3=#:G244 #4=#:G247 |cc| |degf|)
    (RETURN
     (SEQ (LETT |degf| (SPADCALL |f| (QREFELT $ 23)) . #5=(|INMODGCD;height|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |cc| NIL . #5#)
                 (LETT #4# (SPADCALL |f| (QREFELT $ 69)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |cc| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (SPADCALL |cc| (QREFELT $ 61)) . #5#)
                    (COND (#1# (LETT #2# (MAX #2# #3#) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|IdentityError| '|max|))))))))) 

(DEFUN |INMODGCD;mbound| (|f| |g| $)
  (PROG (|hg| |hf|)
    (RETURN
     (SEQ (LETT |hf| (|INMODGCD;height| |f| $) . #1=(|INMODGCD;mbound|))
          (LETT |hg| (|INMODGCD;height| |g| $) . #1#)
          (EXIT (SPADCALL 2 (MIN |hf| |hg|) (QREFELT $ 71))))))) 

(DECLAIM (NOTINLINE |InnerModularGcd;|)) 

(DEFUN |InnerModularGcd| (&REST #1=#:G250)
  (PROG ()
    (RETURN
     (PROG (#2=#:G251)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerModularGcd|)
                                           '|domainEqualList|)
                . #3=(|InnerModularGcd|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerModularGcd;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|InnerModularGcd|))))))))))) 

(DEFUN |InnerModularGcd;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerModularGcd|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|InnerModularGcd| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 72) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerModularGcd|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|IntegerNumberSystem|))
        (QSETREFV $ 17
                  (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;1|) $)))
       ('T
        (QSETREFV $ 17
                  (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;2|) $))))
      (QSETREFV $ 19
                (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 17)
                                        (CONS (|function| |INMODGCD;merge|) $)
                                        (CONS (|function| |INMODGCD;exactquo|)
                                              $)))
      (QSETREFV $ 20 (|HasCategory| |#1| '(|CharacteristicZero|)))
      $)))) 

(MAKEPROP '|InnerModularGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (|Boolean|) (8 . =) (14 . |symmetricRemainder|) (|Mapping| 6 6)
              (20 . |map|) (26 . |reduction|) (32 . |rem|) 'FP '|zeroChar|
              (38 . |zero?|) (|NonNegativeInteger|) (43 . |degree|) (48 . >)
              (|List| 7) |INMODGCD;modularGcdPrimitive;LBP;3| (54 . |remove!|)
              (60 . |One|) (64 . |One|) (68 . |minimumDegree|)
              (73 . |monomial|) (|Union| $ '"failed") (79 . |exquo|) (85 . *)
              (91 . |content|) (|List| $) (96 . |gcd|) (101 . |exquo|)
              (107 . *) (113 . |member?|) (|List| 22) (119 . |member?|)
              |INMODGCD;modularGcd;LBP;4| (|Integer|) (125 . |position|)
              (131 . |elt|) (137 . |coefficient|) (143 . |exquo|)
              (149 . |leadingCoefficient|) (154 . |gcd|) (160 . |zero?|)
              (165 . |reduce|) (171 . |gcd|) (177 . |coerce|) (182 . |coerce|)
              (187 . *) (193 . |euclideanSize|) (198 . *) (204 . -) (210 . +)
              (216 . |euclideanSize|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 62 '"failed")
              (221 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (228 . |monicDivide|) (234 . ~=) (|List| 6)
              (240 . |coefficients|) (|PositiveInteger|) (245 . *))
           '#(|reduction| 251 |modularGcdPrimitive| 257 |modularGcd| 262) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(0 6 0 10 0 7 0 11 2 6 12 0 0
                                                   13 2 6 0 0 0 14 2 7 0 15 0
                                                   16 2 0 7 7 6 17 2 6 0 0 0 18
                                                   1 7 12 0 21 1 7 22 0 23 2 22
                                                   12 0 0 24 2 25 0 7 0 27 0 6
                                                   0 28 0 7 0 29 1 7 22 0 30 2
                                                   7 0 6 22 31 2 7 32 0 0 33 2
                                                   7 0 0 0 34 1 7 6 0 35 1 6 0
                                                   36 37 2 7 32 0 6 38 2 7 0 6
                                                   0 39 2 25 12 7 0 40 2 41 12
                                                   22 0 42 2 41 44 22 0 45 2 25
                                                   7 0 44 46 2 7 6 0 22 47 2 6
                                                   32 0 0 48 1 7 6 0 49 2 6 0 0
                                                   0 50 1 6 12 0 51 2 19 0 7 6
                                                   52 2 19 0 0 0 53 1 19 7 0 54
                                                   1 7 0 6 55 2 6 0 0 0 56 1 19
                                                   22 0 57 2 19 0 0 0 58 2 7 0
                                                   0 0 59 2 7 0 0 0 60 1 6 22 0
                                                   61 3 6 63 0 0 0 64 2 7 65 0
                                                   0 66 2 7 12 0 0 67 1 7 68 0
                                                   69 2 22 0 70 0 71 2 0 7 7 6
                                                   17 1 0 7 25 26 1 0 7 25
                                                   43)))))
           '|lookupComplete|)) 
