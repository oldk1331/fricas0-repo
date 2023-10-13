
(/VERSIONCHECK 2) 

(DEFUN |TRMANIP;expandTrigProducts;2F;1| (|e| $)
  (SPADCALL (LIST (QREFELT $ 23) (QREFELT $ 24) (QREFELT $ 25)) |e| 10
            (QREFELT $ 29))) 

(DEFUN |TRMANIP;logArgs| (|l| $)
  (PROG (|sum| |arg| |prod| #1=#:G167 |term|)
    (RETURN
     (SEQ (LETT |sum| (|spadConstant| $ 31) . #2=(|TRMANIP;logArgs|))
          (LETT |arg| (|spadConstant| $ 32) . #2#)
          (SEQ (LETT |term| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |term| '|log| (QREFELT $ 34))
                   (LETT |arg|
                         (SPADCALL |arg|
                                   (SPADCALL
                                    (|SPADfirst|
                                     (SPADCALL
                                      (|SPADfirst|
                                       (SPADCALL |term| (QREFELT $ 36)))
                                      (QREFELT $ 39)))
                                    (QREFELT $ 40))
                                   (QREFELT $ 15))
                         . #2#))
                  ('T
                   (SEQ (LETT |prod| (SPADCALL |term| (QREFELT $ 43)) . #2#)
                        (COND
                         ((QEQCAR |prod| 0)
                          (COND
                           ((SPADCALL (QCDR (QCDR |prod|)) '|log|
                                      (QREFELT $ 44))
                            (EXIT
                             (LETT |arg|
                                   (SPADCALL |arg|
                                             (SPADCALL
                                              (SPADCALL
                                               (|SPADfirst|
                                                (SPADCALL (QCDR (QCDR |prod|))
                                                          (QREFELT $ 39)))
                                               (QCAR (QCDR |prod|))
                                               (QREFELT $ 45))
                                              (QREFELT $ 40))
                                             (QREFELT $ 15))
                                   . #2#))))))
                        (EXIT
                         (LETT |sum| (SPADCALL |sum| |term| (QREFELT $ 16))
                               . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |sum| (SPADCALL |arg| (QREFELT $ 46)) (QREFELT $ 16))))))) 

(DEFUN |TRMANIP;simplifyLog;2F;3| (|e| $)
  (SPADCALL (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 47)) $)
            (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 48)) $)
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;simplifyLog1| (|e| $)
  (PROG (#1=#:G201 #2=#:G200 #3=#:G202 #4=#:G213 #5=#:G126 |terms| |foundLog|
         #6=#:G193 #7=#:G192 #8=#:G194 #9=#:G212 #10=#:G125 |args| |i| |nterms|
         |exprs| #11=#:G211 |term| #12=#:G210 #13=#:G209 #14=#:G208 |u|
         #15=#:G207 |kers| |expt| |termList| |prod|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |e| '|log| (QREFELT $ 49)) |e|)
            (#16='T
             (SEQ
              (LETT |prod| (SPADCALL |e| (QREFELT $ 43))
                    . #17=(|TRMANIP;simplifyLog1|))
              (COND
               ((QEQCAR |prod| 0)
                (COND
                 ((SPADCALL (QCDR (QCDR |prod|)) '|log| (QREFELT $ 44))
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SPADfirst|
                       (SPADCALL (QCDR (QCDR |prod|)) (QREFELT $ 39)))
                      (QCAR (QCDR |prod|)) (QREFELT $ 45))
                     (QREFELT $ 40))
                    (QREFELT $ 46)))))))
              (LETT |termList| (SPADCALL |e| (QREFELT $ 51)) . #17#)
              (EXIT
               (COND
                ((QEQCAR |termList| 1)
                 (SEQ (LETT |terms| (SPADCALL |e| (QREFELT $ 52)) . #17#)
                      (EXIT
                       (COND
                        ((QEQCAR |terms| 1)
                         (SEQ
                          (LETT |expt| (SPADCALL |e| (QREFELT $ 55)) . #17#)
                          (COND
                           ((QEQCAR |expt| 0)
                            (COND
                             ((NULL (EQL (QCDR (QCDR |expt|)) 1))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (QCAR (QCDR |expt|)) (QREFELT $ 40))
                                (QCDR (QCDR |expt|)) (QREFELT $ 45)))))))
                          (LETT |kers| (SPADCALL |e| (QREFELT $ 36)) . #17#)
                          (COND ((NULL (EQL (LENGTH |kers|) 1)) (EXIT |e|)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |kers|) (QREFELT $ 57))
                            (PROGN
                             (LETT #15# NIL . #17#)
                             (SEQ (LETT |u| NIL . #17#)
                                  (LETT #14#
                                        (SPADCALL (|SPADfirst| |kers|)
                                                  (QREFELT $ 39))
                                        . #17#)
                                  G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN
                                         (LETT |u| (CAR #14#) . #17#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #15#
                                          (CONS (SPADCALL |u| (QREFELT $ 40))
                                                #15#)
                                          . #17#)))
                                  (LETT #14# (CDR #14#) . #17#) (GO G190) G191
                                  (EXIT (NREVERSE #15#))))
                            (QREFELT $ 59)))))
                        (#16# (|TRMANIP;logArgs| (QCDR |terms|) $))))))
                (#16#
                 (SEQ
                  (LETT |terms|
                        (PROGN
                         (LETT #13# NIL . #17#)
                         (SEQ (LETT |term| NIL . #17#)
                              (LETT #12# (QCDR |termList|) . #17#) G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN
                                     (LETT |term| (CAR #12#) . #17#)
                                     NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #13#
                                      (CONS (SPADCALL |term| (QREFELT $ 40))
                                            #13#)
                                      . #17#)))
                              (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #17#)
                  (LETT |exprs| NIL . #17#) (LETT |nterms| NIL . #17#)
                  (SEQ (LETT |term| NIL . #17#) (LETT #11# |terms| . #17#) G190
                       (COND
                        ((OR (ATOM #11#)
                             (PROGN (LETT |term| (CAR #11#) . #17#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((QEQCAR (SPADCALL |term| (QREFELT $ 61)) 0)
                           (LETT |exprs| (CONS |term| |exprs|) . #17#))
                          ('T (LETT |nterms| (CONS |term| |nterms|) . #17#)))))
                       (LETT #11# (CDR #11#) . #17#) (GO G190) G191 (EXIT NIL))
                  (LETT |terms| |nterms| . #17#)
                  (COND
                   ((NULL (NULL |exprs|))
                    (SEQ (LETT |foundLog| 'NIL . #17#) (LETT |i| 0 . #17#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND (|foundLog| 'NIL)
                                       ('T (< |i| (LENGTH |terms|)))))
                                (GO G191)))
                              (SEQ (LETT |i| (+ |i| 1) . #17#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |terms| |i| (QREFELT $ 63))
                                       '|log| (QREFELT $ 34))
                                      (SEQ
                                       (LETT |args|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |terms| |i|
                                                         (QREFELT $ 63))
                                               (QREFELT $ 65))
                                              (QREFELT $ 39))
                                             . #17#)
                                       (SPADCALL |terms| |i|
                                                 (SPADCALL
                                                  (|TRMANIP;simplifyLog1|
                                                   (SPADCALL
                                                    (|SPADfirst| |args|)
                                                    (PROGN
                                                     (LETT #6# NIL . #17#)
                                                     (SEQ
                                                      (LETT #10# NIL . #17#)
                                                      (LETT #9# |exprs| . #17#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #9#)
                                                            (PROGN
                                                             (LETT #10#
                                                                   (CAR #9#)
                                                                   . #17#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #8# #10# . #17#)
                                                         (COND
                                                          (#6#
                                                           (LETT #7#
                                                                 (SPADCALL #7#
                                                                           #8#
                                                                           (QREFELT
                                                                            $
                                                                            15))
                                                                 . #17#))
                                                          ('T
                                                           (PROGN
                                                            (LETT #7# #8#
                                                                  . #17#)
                                                            (LETT #6# 'T
                                                                  . #17#)))))))
                                                      (LETT #9# (CDR #9#)
                                                            . #17#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                     (COND (#6# #7#)
                                                           ('T
                                                            (|spadConstant| $
                                                                            32))))
                                                    (QREFELT $ 66))
                                                   $)
                                                  (QREFELT $ 46))
                                                 (QREFELT $ 67))
                                       (EXIT (LETT |foundLog| 'T . #17#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (COND
                           ((NULL |foundLog|)
                            (LETT |terms| (APPEND |exprs| |terms|)
                                  . #17#)))))))
                  (EXIT
                   (PROGN
                    (LETT #1# NIL . #17#)
                    (SEQ (LETT #5# NIL . #17#) (LETT #4# |terms| . #17#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT #5# (CAR #4#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3# #5# . #17#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #3# (QREFELT $ 15))
                                    . #17#))
                             ('T
                              (PROGN
                               (LETT #2# #3# . #17#)
                               (LETT #1# 'T . #17#)))))))
                         (LETT #4# (CDR #4#) . #17#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#16# (|spadConstant| $ 32)))))))))))))))) 

(DEFUN |TRMANIP;simplify;2F;5| (|x| $)
  (SPADCALL (|TRMANIP;simplify0| |x| $) (QREFELT $ 69))) 

(DEFUN |TRMANIP;simplify;2F;6| (|x| $) (|TRMANIP;simplify0| |x| $)) 

(DEFUN |TRMANIP;expandpow| (|k| $)
  (PROG (|de| |ne| |b| |a| |arg|)
    (RETURN
     (SEQ
      (LETT |a|
            (SPADCALL
             (|SPADfirst|
              (LETT |arg| (SPADCALL |k| (QREFELT $ 39))
                    . #1=(|TRMANIP;expandpow|)))
             (QREFELT $ 71))
            . #1#)
      (LETT |b| (SPADCALL (SPADCALL |arg| (QREFELT $ 72)) (QREFELT $ 71))
            . #1#)
      (LETT |ne|
            (COND
             ((SPADCALL (SPADCALL |a| (QREFELT $ 74)) (|spadConstant| $ 76)
                        (QREFELT $ 77))
              (|spadConstant| $ 32))
             (#2='T
              (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 74)) (QREFELT $ 78))
                        |b| (QREFELT $ 66))))
            . #1#)
      (LETT |de|
            (COND
             ((SPADCALL (SPADCALL |a| (QREFELT $ 79)) (|spadConstant| $ 76)
                        (QREFELT $ 77))
              (|spadConstant| $ 32))
             (#2#
              (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 79)) (QREFELT $ 78))
                        (SPADCALL |b| (QREFELT $ 80)) (QREFELT $ 66))))
            . #1#)
      (EXIT (SPADCALL |ne| |de| (QREFELT $ 15))))))) 

(DEFUN |TRMANIP;termexp| (|p| $)
  (PROG (|coef| #1=#:G233 |u| #2=#:G232 |exponent| |d| #3=#:G231 |k| |lpow|
         |lk|)
    (RETURN
     (SEQ (LETT |exponent| (|spadConstant| $ 31) . #4=(|TRMANIP;termexp|))
          (LETT |coef| (SPADCALL (SPADCALL |p| (QREFELT $ 81)) (QREFELT $ 82))
                . #4#)
          (LETT |lpow|
                (SPADCALL (CONS #'|TRMANIP;termexp!0| $)
                          (LETT |lk| (SPADCALL |p| (QREFELT $ 84)) . #4#)
                          (QREFELT $ 86))
                . #4#)
          (SEQ (LETT |k| NIL . #4#) (LETT #3# |lk| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |p| |k| (QREFELT $ 88)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|exp| (QREFELT $ 44))
                       (LETT |exponent|
                             (SPADCALL |exponent|
                                       (SPADCALL |d|
                                                 (|SPADfirst|
                                                  (SPADCALL |k|
                                                            (QREFELT $ 39)))
                                                 (QREFELT $ 89))
                                       (QREFELT $ 16))
                             . #4#))
                      ((NULL (SPADCALL |k| '|%power| (QREFELT $ 44)))
                       (LETT |coef|
                             (SPADCALL |coef|
                                       (SPADCALL (|spadConstant| $ 76)
                                                 (SPADCALL
                                                  (SPADCALL |k| (QREFELT $ 57))
                                                  (PROGN
                                                   (LETT #2# NIL . #4#)
                                                   (SEQ (LETT |u| NIL . #4#)
                                                        (LETT #1#
                                                              (SPADCALL |k|
                                                                        (QREFELT
                                                                         $ 39))
                                                              . #4#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #1#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #1#)
                                                                     . #4#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #2#
                                                                (CONS
                                                                 (SPADCALL |u|
                                                                           (QREFELT
                                                                            $
                                                                            90))
                                                                 #2#)
                                                                . #4#)))
                                                        (LETT #1# (CDR #1#)
                                                              . #4#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #2#))))
                                                  (SPADCALL |k| (QREFELT $ 91))
                                                  (QREFELT $ 92))
                                                 |d| (QREFELT $ 93))
                                       (QREFELT $ 94))
                             . #4#)))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |coef| (QREFELT $ 78))
                      (SPADCALL |exponent| (QREFELT $ 95)) (QREFELT $ 15))
            (|TRMANIP;powersimp| |p| |lpow| $) (QREFELT $ 15))))))) 

(DEFUN |TRMANIP;termexp!0| (|z1| $) (SPADCALL |z1| '|%power| (QREFELT $ 44))) 

(DEFUN |TRMANIP;expandPower;2F;9| (|f| $)
  (PROG (#1=#:G239 |k| #2=#:G238 |l|)
    (RETURN
     (SEQ
      (LETT |l|
            (SPADCALL (CONS #'|TRMANIP;expandPower;2F;9!0| $)
                      (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 86))
            . #3=(|TRMANIP;expandPower;2F;9|))
      (EXIT
       (SPADCALL |f| |l|
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|TRMANIP;expandpow| |k| $) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 96))))))) 

(DEFUN |TRMANIP;expandPower;2F;9!0| (|z1| $)
  (SPADCALL |z1| '|%power| (QREFELT $ 44))) 

(DEFUN |TRMANIP;powersimp| (|p| |l| $)
  (PROG (|exponent| #1=#:G254 |k0| |lk| |a| |arg| |k|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (|spadConstant| $ 32))
            (#2='T
             (SEQ (LETT |k| (|SPADfirst| |l|) . #3=(|TRMANIP;powersimp|))
                  (LETT |a|
                        (|SPADfirst|
                         (LETT |arg| (SPADCALL |k| (QREFELT $ 39)) . #3#))
                        . #3#)
                  (LETT |exponent|
                        (SPADCALL (SPADCALL |p| |k| (QREFELT $ 88))
                                  (SPADCALL |arg| (QREFELT $ 72))
                                  (QREFELT $ 97))
                        . #3#)
                  (EXIT
                   (COND
                    ((NULL
                      (LETT |lk|
                            (SPADCALL
                             (CONS #'|TRMANIP;powersimp!0| (VECTOR $ |a|))
                             (CDR |l|) (QREFELT $ 86))
                            . #3#))
                     (SPADCALL (SPADCALL |a| |exponent| (QREFELT $ 66))
                               (|TRMANIP;powersimp| |p| (CDR |l|) $)
                               (QREFELT $ 15)))
                    (#2#
                     (SEQ
                      (SEQ (LETT |k0| NIL . #3#) (LETT #1# |lk| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k0| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |exponent|
                                   (SPADCALL |exponent|
                                             (SPADCALL
                                              (SPADCALL |p| |k0|
                                                        (QREFELT $ 88))
                                              (SPADCALL
                                               (SPADCALL |k0| (QREFELT $ 39))
                                               (QREFELT $ 72))
                                              (QREFELT $ 97))
                                             (QREFELT $ 16))
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL (SPADCALL |a| |exponent| (QREFELT $ 66))
                                 (|TRMANIP;powersimp| |p|
                                  (SPADCALL (CDR |l|) |lk| (QREFELT $ 100)) $)
                                 (QREFELT $ 15)))))))))))))) 

(DEFUN |TRMANIP;powersimp!0| (|z1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|TRMANIP;powersimp|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |a| (SPADCALL (SPADCALL |z1| (QREFELT $ 39)) (QREFELT $ 98))
                (QREFELT $ 99)))))) 

(DEFUN |TRMANIP;t2t| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (SPADCALL |x| (QREFELT $ 13))
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;c2t| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14))
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;c2s| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;s2c| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;s2c2| (|x| $)
  (SPADCALL (|spadConstant| $ 32)
            (SPADCALL (SPADCALL |x| (QREFELT $ 13)) 2 (QREFELT $ 45))
            (QREFELT $ 17))) 

(DEFUN |TRMANIP;th2th| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 102)) (SPADCALL |x| (QREFELT $ 103))
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;ch2th| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 103)) (SPADCALL |x| (QREFELT $ 102))
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;ch2sh| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 102)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;sh2ch| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 103)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;sh2ch2| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 103)) 2 (QREFELT $ 45))
            (|spadConstant| $ 32) (QREFELT $ 17))) 

(DEFUN |TRMANIP;ueval| (|x| |s| |f| $) (SPADCALL |x| |s| |f| (QREFELT $ 105))) 

(DEFUN |TRMANIP;ueval2| (|x| |s| |f| $)
  (SPADCALL |x| |s| 2 |f| (QREFELT $ 106))) 

(DEFUN |TRMANIP;cos2sec;2F;23| (|x| $)
  (|TRMANIP;ueval| |x| '|cos| (CONS #'|TRMANIP;cos2sec;2F;23!0| $) $)) 

(DEFUN |TRMANIP;cos2sec;2F;23!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 107)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;sin2csc;2F;24| (|x| $)
  (|TRMANIP;ueval| |x| '|sin| (CONS #'|TRMANIP;sin2csc;2F;24!0| $) $)) 

(DEFUN |TRMANIP;sin2csc;2F;24!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 109)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;csc2sin;2F;25| (|x| $)
  (|TRMANIP;ueval| |x| '|csc| (CONS (|function| |TRMANIP;c2s|) $) $)) 

(DEFUN |TRMANIP;sec2cos;2F;26| (|x| $)
  (|TRMANIP;ueval| |x| '|sec| (CONS (|function| |TRMANIP;s2c|) $) $)) 

(DEFUN |TRMANIP;tan2cot;2F;27| (|x| $)
  (|TRMANIP;ueval| |x| '|tan| (CONS #'|TRMANIP;tan2cot;2F;27!0| $) $)) 

(DEFUN |TRMANIP;tan2cot;2F;27!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 113)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;cot2tan;2F;28| (|x| $)
  (|TRMANIP;ueval| |x| '|cot| (CONS #'|TRMANIP;cot2tan;2F;28!0| $) $)) 

(DEFUN |TRMANIP;cot2tan;2F;28!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 115)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;tan2trig;2F;29| (|x| $)
  (|TRMANIP;ueval| |x| '|tan| (CONS (|function| |TRMANIP;t2t|) $) $)) 

(DEFUN |TRMANIP;cot2trig;2F;30| (|x| $)
  (|TRMANIP;ueval| |x| '|cot| (CONS (|function| |TRMANIP;c2t|) $) $)) 

(DEFUN |TRMANIP;cosh2sech;2F;31| (|x| $)
  (|TRMANIP;ueval| |x| '|cosh| (CONS #'|TRMANIP;cosh2sech;2F;31!0| $) $)) 

(DEFUN |TRMANIP;cosh2sech;2F;31!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 119)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;sinh2csch;2F;32| (|x| $)
  (|TRMANIP;ueval| |x| '|sinh| (CONS #'|TRMANIP;sinh2csch;2F;32!0| $) $)) 

(DEFUN |TRMANIP;sinh2csch;2F;32!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 121)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;csch2sinh;2F;33| (|x| $)
  (|TRMANIP;ueval| |x| '|csch| (CONS (|function| |TRMANIP;ch2sh|) $) $)) 

(DEFUN |TRMANIP;sech2cosh;2F;34| (|x| $)
  (|TRMANIP;ueval| |x| '|sech| (CONS (|function| |TRMANIP;sh2ch|) $) $)) 

(DEFUN |TRMANIP;tanh2coth;2F;35| (|x| $)
  (|TRMANIP;ueval| |x| '|tanh| (CONS #'|TRMANIP;tanh2coth;2F;35!0| $) $)) 

(DEFUN |TRMANIP;tanh2coth;2F;35!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 125)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;coth2tanh;2F;36| (|x| $)
  (|TRMANIP;ueval| |x| '|coth| (CONS #'|TRMANIP;coth2tanh;2F;36!0| $) $)) 

(DEFUN |TRMANIP;coth2tanh;2F;36!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 127)) (QREFELT $ 101))) 

(DEFUN |TRMANIP;tanh2trigh;2F;37| (|x| $)
  (|TRMANIP;ueval| |x| '|tanh| (CONS (|function| |TRMANIP;th2th|) $) $)) 

(DEFUN |TRMANIP;coth2trigh;2F;38| (|x| $)
  (|TRMANIP;ueval| |x| '|coth| (CONS (|function| |TRMANIP;ch2th|) $) $)) 

(DEFUN |TRMANIP;removeCosSq;2F;39| (|x| $)
  (|TRMANIP;ueval2| |x| '|cos| (CONS #'|TRMANIP;removeCosSq;2F;39!0| $) $)) 

(DEFUN |TRMANIP;removeCosSq;2F;39!0| (|z1| $)
  (SPADCALL (|spadConstant| $ 32)
            (SPADCALL (SPADCALL |z1| (QREFELT $ 14)) 2 (QREFELT $ 45))
            (QREFELT $ 17))) 

(DEFUN |TRMANIP;removeSinSq;2F;40| (|x| $)
  (|TRMANIP;ueval2| |x| '|sin| (CONS (|function| |TRMANIP;s2c2|) $) $)) 

(DEFUN |TRMANIP;removeCoshSq;2F;41| (|x| $)
  (|TRMANIP;ueval2| |x| '|cosh| (CONS #'|TRMANIP;removeCoshSq;2F;41!0| $) $)) 

(DEFUN |TRMANIP;removeCoshSq;2F;41!0| (|z1| $)
  (SPADCALL (|spadConstant| $ 32)
            (SPADCALL (SPADCALL |z1| (QREFELT $ 102)) 2 (QREFELT $ 45))
            (QREFELT $ 16))) 

(DEFUN |TRMANIP;removeSinhSq;2F;42| (|x| $)
  (|TRMANIP;ueval2| |x| '|sinh| (CONS (|function| |TRMANIP;sh2ch2|) $) $)) 

(DEFUN |TRMANIP;expandLog;2F;43| (|x| $)
  (SPADCALL (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 74)) $)
            (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 79)) $) (QREFELT $ 20))) 

(DEFUN |TRMANIP;simplifyExp;2F;44| (|x| $)
  (SPADCALL (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 74)) $)
            (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 79)) $) (QREFELT $ 20))) 

(DEFUN |TRMANIP;expand;2F;45| (|x| $)
  (SPADCALL (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 74)) $)
            (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 79)) $)
            (QREFELT $ 20))) 

(DEFUN |TRMANIP;smpexpand| (|p| $)
  (SPADCALL (CONS (|function| |TRMANIP;kerexpand|) $) (ELT $ 137) |p|
            (QREFELT $ 141))) 

(DEFUN |TRMANIP;smplog| (|p| $)
  (SPADCALL (CONS (|function| |TRMANIP;logexpand|) $) (ELT $ 137) |p|
            (QREFELT $ 141))) 

(DEFUN |TRMANIP;smp2htrigs| (|p| $)
  (SPADCALL (CONS #'|TRMANIP;smp2htrigs!0| $) (ELT $ 137) |p| (QREFELT $ 141))) 

(DEFUN |TRMANIP;smp2htrigs!0| (|k1| $)
  (SPADCALL (SPADCALL |k1| (QREFELT $ 142)) (QREFELT $ 143))) 

(DEFUN |TRMANIP;htrigs;2F;49| (|f| $)
  (PROG (|g1| |b| |g2| |a| |den| |num| |arg| #1=#:G328 |x| #2=#:G327 |op| |k|
         |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |f| (QREFELT $ 145)) . #3=(|TRMANIP;htrigs;2F;49|))
      (EXIT
       (COND ((QEQCAR |m| 1) |f|)
             (#4='T
              (SEQ
               (LETT |op| (SPADCALL (LETT |k| (QCDR |m|) . #3#) (QREFELT $ 57))
                     . #3#)
               (LETT |arg|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |x| NIL . #3#)
                           (LETT #1# (SPADCALL |k| (QREFELT $ 39)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |x| (QREFELT $ 143)) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #3#)
               (LETT |num|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 74)) |k|
                               (QREFELT $ 147))
                     . #3#)
               (LETT |den|
                     (SPADCALL (SPADCALL |f| (QREFELT $ 79)) |k|
                               (QREFELT $ 147))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |op| '|exp| (QREFELT $ 148))
                  (SEQ
                   (LETT |g1|
                         (SPADCALL
                          (SPADCALL (LETT |a| (|SPADfirst| |arg|) . #3#)
                                    (QREFELT $ 103))
                          (SPADCALL |a| (QREFELT $ 102)) (QREFELT $ 16))
                         . #3#)
                   (LETT |g2|
                         (SPADCALL (SPADCALL |a| (QREFELT $ 103))
                                   (SPADCALL |a| (QREFELT $ 102))
                                   (QREFELT $ 17))
                         . #3#)
                   (EXIT
                    (SPADCALL
                     (|TRMANIP;supexp| |num| |g1| |g2|
                      (LETT |b| (QUOTIENT2 (SPADCALL |num| (QREFELT $ 150)) 2)
                            . #3#)
                      $)
                     (|TRMANIP;supexp| |den| |g1| |g2| |b| $)
                     (QREFELT $ 20)))))
                 (#4#
                  (SPADCALL
                   (|TRMANIP;sup2htrigs| |num|
                    (LETT |g1| (SPADCALL |op| |arg| (QREFELT $ 151)) . #3#) $)
                   (|TRMANIP;sup2htrigs| |den| |g1| $)
                   (QREFELT $ 20))))))))))))) 

(DEFUN |TRMANIP;supexp| (|p| |f1| |f2| |bse| $)
  (PROG (|ans| |d| |g|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 31) . #1=(|TRMANIP;supexp|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 153) (QREFELT $ 154)))
                 (GO G191)))
               (SEQ
                (LETT |g|
                      (SPADCALL
                       (SPADCALL (SPADCALL |p| (QREFELT $ 155)) (QREFELT $ 78))
                       (QREFELT $ 143))
                      . #1#)
                (SEQ (LETT |d| (- (SPADCALL |p| (QREFELT $ 150)) |bse|) . #1#)
                     (EXIT
                      (COND
                       ((>= |d| 0)
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL |g|
                                                  (SPADCALL |f1| |d|
                                                            (QREFELT $ 45))
                                                  (QREFELT $ 15))
                                        (QREFELT $ 16))
                              . #1#))
                       ('T
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL |g|
                                                  (SPADCALL |f2| (- |d|)
                                                            (QREFELT $ 45))
                                                  (QREFELT $ 15))
                                        (QREFELT $ 16))
                              . #1#)))))
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 156)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |TRMANIP;sup2htrigs| (|p| |f| $)
  (SPADCALL
   (SPADCALL (CONS (|function| |TRMANIP;smp2htrigs|) $) |p| (QREFELT $ 160))
   |f| (QREFELT $ 161))) 

(DEFUN |TRMANIP;exlog| (|p| $)
  (PROG (#1=#:G339 #2=#:G338 #3=#:G340 #4=#:G342 |r|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|TRMANIP;exlog|))
       (SEQ (LETT |r| NIL . #5#)
            (LETT #4# (SPADCALL (SPADCALL |p| (QREFELT $ 163)) (QREFELT $ 168))
                  . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCAR |r|)
                               (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 78))
                                         (QREFELT $ 46))
                               (QREFELT $ 97))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 16)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 31)))))))) 

(DEFUN |TRMANIP;logexpand| (|k| $)
  (PROG (#1=#:G348 |x| #2=#:G347 |op|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |op| (SPADCALL |k| (QREFELT $ 57)) . #3=(|TRMANIP;logexpand|))
         (QREFELT $ 169))
        (SPADCALL |k| (QREFELT $ 142)))
       ((SPADCALL |op| '|log| (QREFELT $ 148))
        (SPADCALL
         (|TRMANIP;exlog|
          (SPADCALL
           (LETT |x|
                 (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 39)))
                           (QREFELT $ 135))
                 . #3#)
           (QREFELT $ 74))
          $)
         (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 79)) $) (QREFELT $ 17)))
       ('T
        (SPADCALL |op|
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |x| NIL . #3#)
                        (LETT #1# (SPADCALL |k| (QREFELT $ 39)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 135)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 151)))))))) 

(DEFUN |TRMANIP;kerexpand| (|k| $)
  (PROG (#1=#:G368 |x| #2=#:G367 #3=#:G366 #4=#:G365 |ctb| |cta| |tb| |ta| |a|
         |b| |den| |num| |arg| |op|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |op| (SPADCALL |k| (QREFELT $ 57)) . #5=(|TRMANIP;kerexpand|))
         (QREFELT $ 169))
        (SPADCALL |k| (QREFELT $ 142)))
       ((SPADCALL |op| '|%power| (QREFELT $ 148)) (|TRMANIP;expandpow| |k| $))
       (#6='T
        (SEQ (LETT |arg| (|SPADfirst| (SPADCALL |k| (QREFELT $ 39))) . #5#)
             (EXIT
              (COND
               ((SPADCALL |op| '|sec| (QREFELT $ 148))
                (SPADCALL
                 (SPADCALL (SPADCALL |arg| (QREFELT $ 13)) (QREFELT $ 136))
                 (QREFELT $ 101)))
               ((SPADCALL |op| '|csc| (QREFELT $ 148))
                (SPADCALL
                 (SPADCALL (SPADCALL |arg| (QREFELT $ 14)) (QREFELT $ 136))
                 (QREFELT $ 101)))
               ((SPADCALL |op| '|log| (QREFELT $ 148))
                (SPADCALL
                 (|TRMANIP;exlog|
                  (SPADCALL (LETT |x| (SPADCALL |arg| (QREFELT $ 136)) . #5#)
                            (QREFELT $ 74))
                  $)
                 (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 79)) $)
                 (QREFELT $ 17)))
               (#6#
                (SEQ (LETT |num| (SPADCALL |arg| (QREFELT $ 74)) . #5#)
                     (LETT |den| (SPADCALL |arg| (QREFELT $ 79)) . #5#)
                     (EXIT
                      (COND
                       ((SPADCALL
                         (LETT |b|
                               (SPADCALL (SPADCALL |num| (QREFELT $ 170)) |den|
                                         (QREFELT $ 171))
                               . #5#)
                         (|spadConstant| $ 31) (QREFELT $ 172))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (SPADCALL |num| (QREFELT $ 173)) |den|
                                         (QREFELT $ 171))
                               . #5#)
                         (EXIT
                          (COND
                           ((SPADCALL |op| '|exp| (QREFELT $ 148))
                            (SPADCALL
                             (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                       (QREFELT $ 95))
                             (SPADCALL (SPADCALL |b| (QREFELT $ 95))
                                       (QREFELT $ 136))
                             (QREFELT $ 15)))
                           ((SPADCALL |op| '|sin| (QREFELT $ 148))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                        (QREFELT $ 14))
                              (SPADCALL (SPADCALL |b| (QREFELT $ 13))
                                        (QREFELT $ 136))
                              (QREFELT $ 15))
                             (SPADCALL
                              (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                        (QREFELT $ 13))
                              (SPADCALL (SPADCALL |b| (QREFELT $ 14))
                                        (QREFELT $ 136))
                              (QREFELT $ 15))
                             (QREFELT $ 16)))
                           ((SPADCALL |op| '|cos| (QREFELT $ 148))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                        (QREFELT $ 13))
                              (SPADCALL (SPADCALL |b| (QREFELT $ 13))
                                        (QREFELT $ 136))
                              (QREFELT $ 15))
                             (SPADCALL
                              (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                        (QREFELT $ 14))
                              (SPADCALL (SPADCALL |b| (QREFELT $ 14))
                                        (QREFELT $ 136))
                              (QREFELT $ 15))
                             (QREFELT $ 17)))
                           ((SPADCALL |op| '|tan| (QREFELT $ 148))
                            (SEQ
                             (LETT |ta|
                                   (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                             (QREFELT $ 115))
                                   . #5#)
                             (LETT |tb|
                                   (SPADCALL (SPADCALL |b| (QREFELT $ 115))
                                             (QREFELT $ 136))
                                   . #5#)
                             (EXIT
                              (SPADCALL (SPADCALL |ta| |tb| (QREFELT $ 16))
                                        (SPADCALL (|spadConstant| $ 32)
                                                  (SPADCALL |ta| |tb|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 17))
                                        (QREFELT $ 20)))))
                           ((SPADCALL |op| '|cot| (QREFELT $ 148))
                            (SEQ
                             (LETT |cta|
                                   (SPADCALL (SPADCALL |a| (QREFELT $ 136))
                                             (QREFELT $ 113))
                                   . #5#)
                             (LETT |ctb|
                                   (SPADCALL (SPADCALL |b| (QREFELT $ 113))
                                             (QREFELT $ 136))
                                   . #5#)
                             (EXIT
                              (SPADCALL
                               (SPADCALL (SPADCALL |cta| |ctb| (QREFELT $ 15))
                                         (|spadConstant| $ 32) (QREFELT $ 17))
                               (SPADCALL |ctb| |cta| (QREFELT $ 16))
                               (QREFELT $ 20)))))
                           (#6#
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #4# NIL . #5#)
                                       (SEQ (LETT |x| NIL . #5#)
                                            (LETT #3#
                                                  (SPADCALL |k| (QREFELT $ 39))
                                                  . #5#)
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |x| (CAR #3#) . #5#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |x|
                                                               (QREFELT $ 136))
                                                     #4#)
                                                    . #5#)))
                                            (LETT #3# (CDR #3#) . #5#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT $ 151)))))))
                       (#6#
                        (SPADCALL |op|
                                  (PROGN
                                   (LETT #2# NIL . #5#)
                                   (SEQ (LETT |x| NIL . #5#)
                                        (LETT #1# (SPADCALL |k| (QREFELT $ 39))
                                              . #5#)
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |x| (CAR #1#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |x| (QREFELT $ 136))
                                                 #2#)
                                                . #5#)))
                                        (LETT #1# (CDR #1#) . #5#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 151)))))))))))))))) 

(DEFUN |TRMANIP;smpexp| (|p| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 31) . #1=(|TRMANIP;smpexp|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 174) (QREFELT $ 175)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (|TRMANIP;termexp|
                                 (SPADCALL |p| (QREFELT $ 173)) $)
                                (QREFELT $ 16))
                      . #1#)
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 170)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |TRMANIP;simplify0| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL |x|
              (LIST '|tan| '|cot| '|sec| '|csc| '|tanh| '|coth| '|sech|
                    '|csch|)
              (LIST (CONS (|function| |TRMANIP;t2t|) $)
                    (CONS (|function| |TRMANIP;c2t|) $)
                    (CONS (|function| |TRMANIP;s2c|) $)
                    (CONS (|function| |TRMANIP;c2s|) $)
                    (CONS (|function| |TRMANIP;th2th|) $)
                    (CONS (|function| |TRMANIP;ch2th|) $)
                    (CONS (|function| |TRMANIP;sh2ch|) $)
                    (CONS (|function| |TRMANIP;ch2sh|) $))
              (QREFELT $ 178))
    (LIST '|sin| '|sinh|) (LIST 2 2)
    (LIST (CONS (|function| |TRMANIP;s2c2|) $)
          (CONS (|function| |TRMANIP;sh2ch2|) $))
    (QREFELT $ 180))
   (QREFELT $ 90))) 

(DEFUN |TranscendentalManipulations| (&REST #1=#:G407)
  (PROG ()
    (RETURN
     (PROG (#2=#:G408)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TranscendentalManipulations|)
                                           '|domainEqualList|)
                . #3=(|TranscendentalManipulations|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TranscendentalManipulations;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TranscendentalManipulations|))))))))))) 

(DEFUN |TranscendentalManipulations;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalManipulations|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|TranscendentalManipulations| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 181) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST
                                                           '|ConvertibleTo|
                                                           (LIST '|Pattern|
                                                                 (|devaluate|
                                                                  |#1|))))
                                           (|HasCategory| |#1|
                                                          (LIST
                                                           '|PatternMatchable|
                                                           (|devaluate| |#1|)))
                                           (|HasCategory| |#2|
                                                          (LIST
                                                           '|ConvertibleTo|
                                                           (LIST '|Pattern|
                                                                 (|devaluate|
                                                                  |#1|))))
                                           (|HasCategory| |#2|
                                                          (LIST
                                                           '|PatternMatchable|
                                                           (|devaluate|
                                                            |#1|))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|TranscendentalManipulations|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| (LIST '|PatternMatchable| (|devaluate| |#1|)))
        (COND
         ((|HasCategory| |#1|
                         (LIST '|ConvertibleTo|
                               (LIST '|Pattern| (|devaluate| |#1|))))
          (COND
           ((|HasCategory| |#2|
                           (LIST '|ConvertibleTo|
                                 (LIST '|Pattern| (|devaluate| |#1|))))
            (COND
             ((|HasCategory| |#2|
                             (LIST '|PatternMatchable| (|devaluate| |#1|)))
              (PROGN
               (QSETREFV $ 11
                         (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 10)))
               (QSETREFV $ 12
                         (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 10)))
               (QSETREFV $ 23
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 11) (QREFELT $ 13))
                                    (SPADCALL (QREFELT $ 12) (QREFELT $ 14))
                                    (QREFELT $ 15))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 16))
                             (QREFELT $ 14))
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 17))
                             (QREFELT $ 14))
                            (QREFELT $ 17))
                           (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                          (QREFELT $ 22)))
               (QSETREFV $ 24
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 11) (QREFELT $ 14))
                                    (SPADCALL (QREFELT $ 12) (QREFELT $ 14))
                                    (QREFELT $ 15))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 17))
                             (QREFELT $ 13))
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 16))
                             (QREFELT $ 13))
                            (QREFELT $ 17))
                           (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                          (QREFELT $ 22)))
               (QSETREFV $ 25
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 11) (QREFELT $ 13))
                                    (SPADCALL (QREFELT $ 12) (QREFELT $ 13))
                                    (QREFELT $ 15))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 17))
                             (QREFELT $ 13))
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) (QREFELT $ 12)
                                       (QREFELT $ 16))
                             (QREFELT $ 13))
                            (QREFELT $ 16))
                           (SPADCALL 2 (QREFELT $ 19)) (QREFELT $ 20))
                          (QREFELT $ 22)))
               (QSETREFV $ 30
                         (CONS
                          (|dispatchFunction|
                           |TRMANIP;expandTrigProducts;2F;1|)
                          $)))))))))))
      (COND
       ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
        (QSETREFV $ 70 (CONS (|dispatchFunction| |TRMANIP;simplify;2F;5|) $)))
       ('T
        (QSETREFV $ 70 (CONS (|dispatchFunction| |TRMANIP;simplify;2F;6|) $))))
      $)))) 

(MAKEPROP '|TranscendentalManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (4 . |coerce|) 'XX 'YY (9 . |cos|) (14 . |sin|)
              (19 . *) (25 . +) (31 . -) (|Integer|) (37 . |coerce|) (42 . /)
              (|RewriteRule| 6 6 7) (48 . |rule|) '|sinCosRule| '|sinSinRule|
              '|cosCosRule| (|List| 21) (|PositiveInteger|)
              (|ApplyRules| 6 6 7) (54 . |applyRules|)
              (61 . |expandTrigProducts|) (66 . |Zero|) (70 . |One|)
              (|Boolean|) (74 . |is?|) (|List| 64) (80 . |kernels|) (|List| 7)
              (|Kernel| 7) (85 . |argument|) |TRMANIP;simplifyLog;2F;3|
              (|Record| (|:| |coef| 18) (|:| |var| 64))
              (|Union| 41 '#1="failed") (90 . |isMult|) (95 . |is?|) (101 . ^)
              (107 . |log|) (112 . |numerator|) (117 . |denominator|)
              (122 . |freeOf?|) (|Union| 58 '#1#) (128 . |isTimes|)
              (133 . |isPlus|) (|Record| (|:| |val| $) (|:| |exponent| 18))
              (|Union| 53 '#1#) (138 . |isPower|) (|BasicOperator|)
              (143 . |operator|) (|List| $) (148 . |kernel|)
              (|Union| (|Fraction| (|Polynomial| 6)) '"failed")
              (154 . |retractIfCan|) (159 . |One|) (163 . |elt|) (|Kernel| $)
              (169 . |retract|) (174 . ^) (180 . |setelt|)
              (|AlgebraicManipulations| 6 7) (187 . |rootProduct|)
              (192 . |simplify|) |TRMANIP;expandPower;2F;9| (197 . |second|)
              (|SparseMultivariatePolynomial| 6 64) (202 . |numer|)
              (|SparseMultivariatePolynomial| 6 38) (207 . |One|) (211 . =)
              (217 . |coerce|) (222 . |denom|) (227 . -)
              (232 . |leadingCoefficient|) (237 . |coerce|) (|List| 38)
              (242 . |variables|) (|Mapping| 33 38) (247 . |select|)
              (|NonNegativeInteger|) (253 . |degree|) (259 . *)
              |TRMANIP;simplifyExp;2F;44| (265 . |height|) (270 . |kernel|)
              (277 . |monomial|) (284 . *) (290 . |exp|) (295 . |eval|)
              (302 . *) (308 . |first|) (313 . =) (319 . |setDifference|)
              (325 . |inv|) (330 . |sinh|) (335 . |cosh|) (|Mapping| $ $)
              (340 . |eval|) (347 . |eval|) (355 . |sec|)
              |TRMANIP;cos2sec;2F;23| (360 . |csc|) |TRMANIP;sin2csc;2F;24|
              |TRMANIP;csc2sin;2F;25| |TRMANIP;sec2cos;2F;26| (365 . |cot|)
              |TRMANIP;tan2cot;2F;27| (370 . |tan|) |TRMANIP;cot2tan;2F;28|
              |TRMANIP;tan2trig;2F;29| |TRMANIP;cot2trig;2F;30| (375 . |sech|)
              |TRMANIP;cosh2sech;2F;31| (380 . |csch|)
              |TRMANIP;sinh2csch;2F;32| |TRMANIP;csch2sinh;2F;33|
              |TRMANIP;sech2cosh;2F;34| (385 . |coth|)
              |TRMANIP;tanh2coth;2F;35| (390 . |tanh|)
              |TRMANIP;coth2tanh;2F;36| |TRMANIP;tanh2trigh;2F;37|
              |TRMANIP;coth2trigh;2F;38| |TRMANIP;removeCosSq;2F;39|
              |TRMANIP;removeSinSq;2F;40| |TRMANIP;removeCoshSq;2F;41|
              |TRMANIP;removeSinhSq;2F;42| |TRMANIP;expandLog;2F;43|
              |TRMANIP;expand;2F;45| (395 . |coerce|) (|Mapping| 7 38)
              (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 38) 38 6 75 7)
              (400 . |map|) (407 . |coerce|) |TRMANIP;htrigs;2F;49|
              (|Union| 64 '"failed") (412 . |mainKernel|)
              (|SparseUnivariatePolynomial| $) (417 . |univariate|)
              (423 . |is?|) (|SparseUnivariatePolynomial| 75) (429 . |degree|)
              (434 . |elt|) (440 . |Zero|) (444 . |Zero|) (448 . ~=)
              (454 . |leadingCoefficient|) (459 . |reductum|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 75)
              (|SparseUnivariatePolynomialFunctions2| 75 7) (464 . |map|)
              (470 . |elt|) (|Factored| $) (476 . |squareFree|)
              (|Record| (|:| |coef| 87) (|:| |logand| 75)) (|List| 164)
              (|Factored| 75) (|FactoredFunctions| 75) (481 . |log|)
              (486 . |nullary?|) (491 . |reductum|) (496 . /) (502 . ~=)
              (508 . |leadingMonomial|) (513 . |Zero|) (517 . ~=) (|List| 8)
              (|List| 104) (523 . |eval|) (|List| 87) (530 . |eval|))
           '#(|tanh2trigh| 538 |tanh2coth| 543 |tan2trig| 548 |tan2cot| 553
              |sinh2csch| 558 |sin2csc| 563 |simplifyLog| 568 |simplifyExp| 573
              |simplify| 578 |sech2cosh| 583 |sec2cos| 588 |removeSinhSq| 593
              |removeSinSq| 598 |removeCoshSq| 603 |removeCosSq| 608 |htrigs|
              613 |expandTrigProducts| 618 |expandPower| 623 |expandLog| 628
              |expand| 633 |csch2sinh| 638 |csc2sin| 643 |coth2trigh| 648
              |coth2tanh| 653 |cot2trig| 658 |cot2tan| 663 |cosh2sech| 668
              |cos2sec| 673)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 180
                                                 '(0 8 0 9 1 7 0 8 10 1 7 0 0
                                                   13 1 7 0 0 14 2 7 0 0 0 15 2
                                                   7 0 0 0 16 2 7 0 0 0 17 1 7
                                                   0 18 19 2 7 0 0 0 20 2 21 0
                                                   7 7 22 3 28 7 26 7 27 29 1 0
                                                   7 7 30 0 7 0 31 0 7 0 32 2 7
                                                   33 0 8 34 1 7 35 0 36 1 38
                                                   37 0 39 1 7 42 0 43 2 38 33
                                                   0 8 44 2 7 0 0 18 45 1 7 0 0
                                                   46 1 7 0 0 47 1 7 0 0 48 2 7
                                                   33 0 8 49 1 7 50 0 51 1 7 50
                                                   0 52 1 7 54 0 55 1 38 56 0
                                                   57 2 7 0 56 58 59 1 7 60 0
                                                   61 0 6 0 62 2 37 7 0 18 63 1
                                                   7 64 0 65 2 7 0 0 0 66 3 37
                                                   7 0 18 7 67 1 68 7 7 69 1 0
                                                   7 7 70 1 37 7 0 72 1 7 73 0
                                                   74 0 75 0 76 2 75 33 0 0 77
                                                   1 7 0 73 78 1 7 73 0 79 1 7
                                                   0 0 80 1 75 6 0 81 1 75 0 6
                                                   82 1 75 83 0 84 2 83 0 85 0
                                                   86 2 75 87 0 38 88 2 7 0 87
                                                   0 89 1 38 87 0 91 3 38 0 56
                                                   37 87 92 3 75 0 0 38 87 93 2
                                                   75 0 0 0 94 1 7 0 0 95 3 7 0
                                                   0 35 58 96 2 7 0 18 0 97 1
                                                   37 7 0 98 2 7 33 0 0 99 2 83
                                                   0 0 0 100 1 7 0 0 101 1 7 0
                                                   0 102 1 7 0 0 103 3 7 0 0 8
                                                   104 105 4 7 0 0 8 87 104 106
                                                   1 7 0 0 107 1 7 0 0 109 1 7
                                                   0 0 113 1 7 0 0 115 1 7 0 0
                                                   119 1 7 0 0 121 1 7 0 0 125
                                                   1 7 0 0 127 1 7 0 6 137 3
                                                   140 7 138 139 75 141 1 7 0
                                                   64 142 1 7 144 0 145 2 75
                                                   146 0 38 147 2 56 33 0 8 148
                                                   1 149 87 0 150 2 7 0 56 58
                                                   151 0 6 0 152 0 149 0 153 2
                                                   149 33 0 0 154 1 149 75 0
                                                   155 1 149 0 0 156 2 159 157
                                                   158 149 160 2 157 7 0 7 161
                                                   1 75 162 0 163 1 167 165 166
                                                   168 1 56 33 0 169 1 75 0 0
                                                   170 2 7 0 73 73 171 2 7 33 0
                                                   0 172 1 75 0 0 173 0 75 0
                                                   174 2 75 33 0 0 175 3 7 0 0
                                                   176 177 178 4 7 0 0 176 179
                                                   177 180 1 0 7 7 129 1 0 7 7
                                                   126 1 0 7 7 117 1 0 7 7 114
                                                   1 0 7 7 122 1 0 7 7 110 1 0
                                                   7 7 40 1 0 7 7 90 1 0 7 7 70
                                                   1 0 7 7 124 1 0 7 7 112 1 0
                                                   7 7 134 1 0 7 7 132 1 0 7 7
                                                   133 1 0 7 7 131 1 0 7 7 143
                                                   1 1 7 7 30 1 0 7 7 71 1 0 7
                                                   7 135 1 0 7 7 136 1 0 7 7
                                                   123 1 0 7 7 111 1 0 7 7 130
                                                   1 0 7 7 128 1 0 7 7 118 1 0
                                                   7 7 116 1 0 7 7 120 1 0 7 7
                                                   108)))))
           '|lookupComplete|)) 
