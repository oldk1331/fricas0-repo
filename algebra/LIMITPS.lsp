
(/VERSIONCHECK 2) 

(DEFUN |LIMITPS;is_exp_log| (|fcn| |x| $)
  (PROG (#1=#:G264 #2=#:G265 |k| |xk|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xk| (SPADCALL |x| (QREFELT $ 12)) . #3=(|LIMITPS;is_exp_log|))
        (SEQ (LETT |k| NIL . #3#)
             (LETT #2# (SPADCALL |fcn| (QREFELT $ 14)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR
                  (SPADCALL
                   (SPADCALL (SPADCALL |k| (QREFELT $ 16)) |x| (QREFELT $ 17))
                   (|spadConstant| $ 8) (QREFELT $ 19))
                  (OR (SPADCALL |k| |xk| (QREFELT $ 20))
                      (OR (SPADCALL |k| '|log| (QREFELT $ 21))
                          (OR (SPADCALL |k| '|exp| (QREFELT $ 21))
                              (OR (SPADCALL |k| '|%power| (QREFELT $ 21))
                                  (SPADCALL |k| '|nthRoot| (QREFELT $ 21)))))))
                 "iterate")
                ('T (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;noX?| (|fcn| |x| $)
  (COND ((SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 23)) (QREFELT $ 24)) 'NIL)
        ('T 'T))) 

(DEFUN |LIMITPS;constant?| (|fcn| $) (NULL (SPADCALL |fcn| (QREFELT $ 23)))) 

(DEFUN |LIMITPS;firstNonLogPtr| (|fcn| |x| $)
  (PROG (|list| #1=#:G276 |ker|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |list| (SPADCALL |fcn| (QREFELT $ 25))
              . #2=(|LIMITPS;firstNonLogPtr|))
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT |ker| (|SPADfirst| |list|) . #2#)
                  (COND
                   ((NULL (SPADCALL |ker| '|log| (QREFELT $ 21)))
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (SPADCALL |ker| (QREFELT $ 16))
                                          (QREFELT $ 23))
                                (QREFELT $ 24))
                      (COND
                       ((NULL (EQUAL |x| (SPADCALL |ker| (QREFELT $ 26))))
                        (EXIT (PROGN (LETT #1# |list| . #2#) (GO #1#)))))))))
                  (EXIT (LETT |list| (CDR |list|) . #2#)))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;finiteValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|erf| (QREFELT $ 21))
        (OR (SPADCALL |ker| '|sech| (QREFELT $ 21))
            (OR (SPADCALL |ker| '|csch| (QREFELT $ 21))
                (OR (SPADCALL |ker| '|tanh| (QREFELT $ 21))
                    (OR (SPADCALL |ker| '|coth| (QREFELT $ 21))
                        (OR (SPADCALL |ker| '|atan| (QREFELT $ 21))
                            (OR (SPADCALL |ker| '|acot| (QREFELT $ 21))
                                (OR (SPADCALL |ker| '|asec| (QREFELT $ 21))
                                    (OR (SPADCALL |ker| '|acsc| (QREFELT $ 21))
                                        (OR
                                         (SPADCALL |ker| '|acsch|
                                                   (QREFELT $ 21))
                                         (OR
                                          (SPADCALL |ker| '|acoth|
                                                    (QREFELT $ 21))
                                          (OR
                                           (SPADCALL |ker| '|fresnelS|
                                                     (QREFELT $ 21))
                                           (OR
                                            (SPADCALL |ker| '|fresnelC|
                                                      (QREFELT $ 21))
                                            (OR
                                             (SPADCALL |ker| '|Si|
                                                       (QREFELT $ 21))
                                             (SPADCALL |ker| '|airyAi|
                                                       (QREFELT $
                                                                21))))))))))))))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;finiteValueAtPlusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
        (OR (SPADCALL |ker| '|Ci| (QREFELT $ 21))
            (SPADCALL |ker| '|airyAiPrime| (QREFELT $ 21))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;finiteValueAtMinusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
        (SPADCALL |ker| '|airyBi| (QREFELT $ 21)))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|exp| (QREFELT $ 21))
        (OR (SPADCALL |ker| '|sinh| (QREFELT $ 21))
            (OR (SPADCALL |ker| '|cosh| (QREFELT $ 21))
                (SPADCALL |ker| '|Shi| (QREFELT $ 21)))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtPlusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;knownValueAtInfinity?| |ker| $)
        (OR (SPADCALL |ker| '|airyBi| (QREFELT $ 21))
            (OR (SPADCALL |ker| '|airyBiPrime| (QREFELT $ 21))
                (SPADCALL |ker| '|Chi| (QREFELT $ 21)))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtMinusInfinity?| (|ker| $)
  (COND ((|LIMITPS;knownValueAtInfinity?| |ker| $) 'T) ('T 'NIL))) 

(DEFUN |LIMITPS;leftOrRight| (|fcn| |x| |limVal| $)
  (PROG (|inf| |val| |value|)
    (RETURN
     (SEQ
      (LETT |value|
            (|LIMITPS;limitPlus|
             (SPADCALL (SPADCALL |fcn| |limVal| (QREFELT $ 27)) (QREFELT $ 28))
             |x| $)
            . #1=(|LIMITPS;leftOrRight|))
      (EXIT
       (COND ((QEQCAR |value| 1) 0)
             (#2='T
              (SEQ
               (LETT |inf|
                     (SPADCALL (LETT |val| (QCDR |value|) . #1#)
                               (QREFELT $ 31))
                     . #1#)
               (EXIT
                (COND
                 ((|eql_SI| |inf| 0) (|error| "limit package: internal error"))
                 (#2# |inf|))))))))))) 

(DEFUN |LIMITPS;specialLimit| (|fcn| |x| $)
  (PROG (#1=#:G332 |den| |num| |finVal| |valu| |val| |fval| #2=#:G335 |k|
         |xkers| #3=#:G334 #4=#:G333)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xkers|
              (PROGN
               (LETT #4# NIL . #5=(|LIMITPS;specialLimit|))
               (SEQ (LETT |k| NIL . #5#)
                    (LETT #3# (SPADCALL |fcn| (QREFELT $ 25)) . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |x|
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 16))
                                            (QREFELT $ 23))
                                  (QREFELT $ 24))
                        (LETT #4# (CONS |k| #4#) . #5#)))))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #5#)
        (EXIT
         (COND ((EQL (LENGTH |xkers|) 1) (|LIMITPS;specialLimit1| |fcn| |x| $))
               ('T
                (SEQ (LETT |num| (SPADCALL |fcn| (QREFELT $ 34)) . #5#)
                     (LETT |den| (SPADCALL |fcn| (QREFELT $ 35)) . #5#)
                     (SEQ (LETT |k| NIL . #5#) (LETT #2# |xkers| . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |k| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |fval|
                                 (|LIMITPS;limitPlus|
                                  (SPADCALL |k| (QREFELT $ 16)) |x| $)
                                 . #5#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |fval| 1)
                                  (SPADCALL
                                   (SPADCALL (LETT |val| (QCDR |fval|) . #5#)
                                             (QREFELT $ 31))
                                   0 (QREFELT $ 37)))
                              (PROGN
                               (LETT #1#
                                     (|LIMITPS;specialLimitNormalize| |fcn| |x|
                                      $)
                                     . #5#)
                               (GO #1#)))
                             ('T
                              (SEQ
                               (LETT |valu| (SPADCALL |val| (QREFELT $ 39))
                                     . #5#)
                               (EXIT
                                (COND
                                 ((QEQCAR |valu| 1)
                                  (PROGN
                                   (LETT #1#
                                         (|LIMITPS;specialLimitNormalize| |fcn|
                                          |x| $)
                                         . #5#)
                                   (GO #1#)))
                                 ('T
                                  (SEQ (LETT |finVal| (QCDR |valu|) . #5#)
                                       (LETT |num|
                                             (SPADCALL |num| |k| |finVal|
                                                       (QREFELT $ 40))
                                             . #5#)
                                       (LETT |den|
                                             (SPADCALL |den| |k| |finVal|
                                                       (QREFELT $ 40))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |den| (|spadConstant| $ 8)
                                                    (QREFELT $ 19))
                                          (PROGN
                                           (LETT #1#
                                                 (|LIMITPS;specialLimitNormalize|
                                                  |fcn| |x| $)
                                                 . #5#)
                                           (GO #1#))))))))))))))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (CONS 0
                            (SPADCALL (SPADCALL |num| |den| (QREFELT $ 41))
                                      (QREFELT $ 42))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;specialLimitNormalize| (|fcn| |x| $)
  (PROG (|lim| |limm| |limVal| |expKerLim| |cc| |eq| |vv| |fval| |expKer|
         |expKers| #1=#:G359 |k| #2=#:G358 |xkers| #3=#:G357 #4=#:G356 |nfcn|)
    (RETURN
     (SEQ
      (LETT |nfcn| (SPADCALL |fcn| (QREFELT $ 44))
            . #5=(|LIMITPS;specialLimitNormalize|))
      (EXIT
       (COND
        ((SPADCALL |fcn| |nfcn| (QREFELT $ 45))
         (|LIMITPS;limitPlus| |nfcn| |x| $))
        (#6='T
         (SEQ
          (LETT |xkers|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |k| NIL . #5#)
                      (LETT #3# (SPADCALL |fcn| (QREFELT $ 14)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 16))
                                              (QREFELT $ 23))
                                    (QREFELT $ 24))
                          (LETT #4# (CONS |k| #4#) . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |xkers|) 2 (QREFELT $ 47)) (CONS 1 "failed"))
            (#6#
             (SEQ
              (LETT |expKers|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |k| NIL . #5#) (LETT #1# |xkers| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |k| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |k| '|exp| (QREFELT $ 21))
                              (LETT #2# (CONS |k| #2#) . #5#)))))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT
               (COND
                ((SPADCALL (LENGTH |expKers|) 1 (QREFELT $ 47))
                 (CONS 1 "failed"))
                (#6#
                 (SEQ (LETT |expKer| (|SPADfirst| |expKers|) . #5#)
                      (LETT |fval|
                            (|LIMITPS;limitPlus|
                             (SPADCALL |expKer| (QREFELT $ 16)) |x| $)
                            . #5#)
                      (EXIT
                       (COND ((QEQCAR |fval| 1) (CONS 1 "failed"))
                             (#6#
                              (SEQ (LETT |vv| (SPADCALL (QREFELT $ 48)) . #5#)
                                   (LETT |eq|
                                         (SPADCALL
                                          (SPADCALL |expKer| (QREFELT $ 16))
                                          (SPADCALL |vv| (QREFELT $ 49))
                                          (QREFELT $ 51))
                                         . #5#)
                                   (LETT |cc|
                                         (SPADCALL |fcn| |eq| (QREFELT $ 53))
                                         . #5#)
                                   (LETT |expKerLim| (QCDR |fval|) . #5#)
                                   (LETT |limVal|
                                         (|LIMITPS;locallimit| |cc| |vv|
                                          |expKerLim| $)
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((OR (QEQCAR |limVal| 2)
                                          (NULL (QEQCAR |limVal| 0)))
                                      (CONS 1 "failed"))
                                     ('T
                                      (SEQ (LETT |limm| (QCDR |limVal|) . #5#)
                                           (LETT |lim|
                                                 (SPADCALL |limm|
                                                           (QREFELT $ 39))
                                                 . #5#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |lim| 1)
                                              (CONS 1 "failed"))
                                             (#6#
                                              (|LIMITPS;limitPlus| (QCDR |lim|)
                                               |x| $)))))))))))))))))))))))))))) 

(DEFUN |LIMITPS;specialLimit1| (|fcn| |x| $)
  (PROG (|limVal| |argLim| |lim| |cc| |eq| |vv| |ker| |xkers| #1=#:G375 |k|
         #2=#:G374)
    (RETURN
     (SEQ
      (LETT |xkers|
            (PROGN
             (LETT #2# NIL . #3=(|LIMITPS;specialLimit1|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 25)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 16))
                                          (QREFELT $ 23))
                                (QREFELT $ 24))
                      (LETT #2# (CONS |k| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((SPADCALL (LENGTH |xkers|) 1 (QREFELT $ 47)) (CONS 1 "failed"))
             (#4='T
              (SEQ (LETT |ker| (|SPADfirst| |xkers|) . #3#)
                   (LETT |vv| (SPADCALL (QREFELT $ 48)) . #3#)
                   (LETT |eq|
                         (SPADCALL (SPADCALL |ker| (QREFELT $ 16))
                                   (SPADCALL |vv| (QREFELT $ 49))
                                   (QREFELT $ 51))
                         . #3#)
                   (LETT |cc| (SPADCALL |fcn| |eq| (QREFELT $ 53)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |x| (SPADCALL |cc| (QREFELT $ 23))
                                (QREFELT $ 24))
                      (CONS 1 "failed"))
                     (#4#
                      (SEQ
                       (LETT |lim| (|LIMITPS;specialLimitKernel| |ker| |x| $)
                             . #3#)
                       (EXIT
                        (COND ((QEQCAR |lim| 1) |lim|)
                              (#4#
                               (SEQ (LETT |argLim| (QCDR |lim|) . #3#)
                                    (LETT |limVal|
                                          (|LIMITPS;locallimit| |cc| |vv|
                                           |argLim| $)
                                          . #3#)
                                    (EXIT
                                     (COND
                                      ((OR (QEQCAR |limVal| 2)
                                           (NULL (QEQCAR |limVal| 0)))
                                       (CONS 1 "failed"))
                                      ('T
                                       (CONS 0
                                             (QCDR |limVal|))))))))))))))))))))) 

(DEFUN |LIMITPS;specialLimitKernel| (|ker| |x| $)
  (PROG (|val| |kerValue| |inf| |f| |var| |lim| |limm| |arg| |args| |argLim|
         #1=#:G442 |li| #2=#:G381)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |ker| '|log| (QREFELT $ 21))
         (SEQ
          (LETT |args| (SPADCALL |ker| (QREFELT $ 55))
                . #3=(|LIMITPS;specialLimitKernel|))
          (EXIT
           (COND
            ((OR (NULL |args|) (NULL (NULL (CDR |args|)))) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |arg| (|SPADfirst| |args|) . #3#)
                  (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| $) . #3#)
                  (EXIT
                   (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                         (#4='T
                          (SEQ (LETT |lim| (QCDR |limm|) . #3#)
                               (EXIT
                                (COND
                                 ((|eql_SI|
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 31))
                                         . #3#)
                                   -1)
                                  (CONS 1 "failed"))
                                 (#4#
                                  (LETT |argLim|
                                        (CONS 0
                                              (COND ((|eql_SI| |inf| 1) |lim|)
                                                    (#4#
                                                     (SEQ
                                                      (LETT |li|
                                                            (PROG2
                                                                (LETT #2#
                                                                      (SPADCALL
                                                                       |lim|
                                                                       (QREFELT
                                                                        $ 39))
                                                                      . #3#)
                                                                (QCDR #2#)
                                                              (|check_union|
                                                               (QEQCAR #2# 0)
                                                               (QREFELT $ 7)
                                                               #2#))
                                                            . #3#)
                                                      (EXIT
                                                       (COND
                                                        ((SPADCALL |li|
                                                                   (|spadConstant|
                                                                    $ 8)
                                                                   (QREFELT $
                                                                            19))
                                                         (COND
                                                          ((|eql_SI|
                                                            (|LIMITPS;leftOrRight|
                                                             |arg| |x|
                                                             (|spadConstant| $
                                                                             8)
                                                             $)
                                                            1)
                                                           (SPADCALL
                                                            (QREFELT $ 58)))
                                                          (#4#
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #3#)
                                                            (GO #1#)))))
                                                        (#4#
                                                         (SPADCALL
                                                          (SPADCALL |li|
                                                                    (QREFELT $
                                                                             59))
                                                          (QREFELT $
                                                                   42)))))))))
                                        . #3#))))))))))))))
        (#4#
         (SEQ (LETT |args| (SPADCALL |ker| (QREFELT $ 55)) . #3#)
              (EXIT
               (COND
                ((OR (NULL |args|) (NULL (NULL (CDR |args|))))
                 (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #3#)
                      (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| $) . #3#)
                      (EXIT
                       (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                             (#4#
                              (SEQ (LETT |lim| (QCDR |limm|) . #3#)
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |ker| (QREFELT $ 61))
                                          (SPADCALL
                                           (LETT |var|
                                                 (SPADCALL (QREFELT $ 48))
                                                 . #3#)
                                           (QREFELT $ 49))
                                          (QREFELT $ 62))
                                         . #3#)
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 31))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |inf| 0)
                                      (COND
                                       ((SPADCALL |ker| '|erf| (QREFELT $ 21))
                                        (CONS 0
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lim| (QREFELT $ 63))
                                                (QREFELT $ 65))
                                               (QREFELT $ 42))))
                                       (#4#
                                        (SEQ
                                         (LETT |kerValue|
                                               (|LIMITPS;locallimit| |f| |var|
                                                |lim| $)
                                               . #3#)
                                         (EXIT
                                          (COND
                                           ((OR (QEQCAR |kerValue| 2)
                                                (NULL (QEQCAR |kerValue| 0)))
                                            (CONS 1 "failed"))
                                           ('T
                                            (CONS 0 (QCDR |kerValue|)))))))))
                                     ((|eql_SI| |inf| 1)
                                      (COND
                                       ((|LIMITPS;finiteValueAtPlusInfinity?|
                                         |ker| $)
                                        (SEQ
                                         (LETT |val|
                                               (COND
                                                ((SPADCALL |ker| '|erf|
                                                           (QREFELT $ 21))
                                                 (|spadConstant| $ 56))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 21))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 21))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 21))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       21)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 66))
                                                  (SPADCALL 2 (QREFELT $ 67))
                                                  (QREFELT $ 41)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 21))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 66))
                                                  (SPADCALL 2 (QREFELT $ 67))
                                                  (QREFELT $ 41)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsc|
                                                            (QREFELT $ 21))
                                                  (OR
                                                   (SPADCALL |ker| '|acsch|
                                                             (QREFELT $ 21))
                                                   (SPADCALL |ker| '|acoth|
                                                             (QREFELT $ 21))))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 21))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 21)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 66))
                                                   (SPADCALL 8 (QREFELT $ 67))
                                                   (QREFELT $ 41))
                                                  (QREFELT $ 68)))
                                                ((SPADCALL |ker| '|Si|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 66))
                                                  (SPADCALL 2 (QREFELT $ 67))
                                                  (QREFELT $ 41)))
                                                ((OR
                                                  (SPADCALL |ker| '|Ci|
                                                            (QREFELT $ 21))
                                                  (OR
                                                   (SPADCALL |ker| '|airyAi|
                                                             (QREFELT $ 21))
                                                   (SPADCALL |ker|
                                                             '|airyAiPrime|
                                                             (QREFELT $ 21))))
                                                 (|spadConstant| $ 8))
                                                ('T
                                                 (|error|
                                                  "Finite but unknown value at infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 42))))))
                                       ((|LIMITPS;knownValueAtPlusInfinity?|
                                         |ker| $)
                                        (CONS 0 |lim|))
                                       (#4# (CONS 1 "failed"))))
                                     (#4#
                                      (COND
                                       ((|LIMITPS;finiteValueAtMinusInfinity?|
                                         |ker| $)
                                        (SEQ
                                         (LETT |val|
                                               (COND
                                                ((SPADCALL |ker| '|erf|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (|spadConstant| $ 56)
                                                  (QREFELT $ 69)))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 21))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 21))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 21))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       21)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 66))
                                                   (SPADCALL 2 (QREFELT $ 67))
                                                   (QREFELT $ 41))
                                                  (QREFELT $ 69)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 21))
                                                 (SPADCALL (QREFELT $ 66)))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 66))
                                                   (SPADCALL 2 (QREFELT $ 67))
                                                   (QREFELT $ 41))
                                                  (QREFELT $ 69)))
                                                ((SPADCALL |ker| '|acsc|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 66))
                                                  (QREFELT $ 69)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsch|
                                                            (QREFELT $ 21))
                                                  (SPADCALL |ker| '|acoth|
                                                            (QREFELT $ 21)))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 21))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 21)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 66))
                                                    (SPADCALL 8 (QREFELT $ 67))
                                                    (QREFELT $ 41))
                                                   (QREFELT $ 68))
                                                  (QREFELT $ 69)))
                                                ((SPADCALL |ker| '|Si|
                                                           (QREFELT $ 21))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 66))
                                                   (SPADCALL 2 (QREFELT $ 67))
                                                   (QREFELT $ 41))
                                                  (QREFELT $ 69)))
                                                ((OR
                                                  (SPADCALL |ker| '|airyAi|
                                                            (QREFELT $ 21))
                                                  (SPADCALL |ker| '|airyBi|
                                                            (QREFELT $ 21)))
                                                 (|spadConstant| $ 8))
                                                ('T
                                                 (|error|
                                                  "Finite but unknown value at minus infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 42))))))
                                       ((|LIMITPS;knownValueAtMinusInfinity?|
                                         |ker| $)
                                        (COND
                                         ((SPADCALL |ker| '|exp|
                                                    (QREFELT $ 21))
                                          (CONS 0
                                                (SPADCALL (|spadConstant| $ 8)
                                                          (QREFELT $ 42))))
                                         ((SPADCALL |ker| '|sinh|
                                                    (QREFELT $ 21))
                                          (CONS 0 |lim|))
                                         ((SPADCALL |ker| '|cosh|
                                                    (QREFELT $ 21))
                                          (CONS 0 (SPADCALL (QREFELT $ 70))))
                                         (#4#
                                          (|error|
                                           "knownValueAtMinusInfinity? true but value unknown"))))
                                       (#4# (CONS 1 "failed"))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;logOnlyLimit| (|coef| |x| $)
  (PROG (|cc| |eq| |vv|)
    (RETURN
     (SEQ (LETT |vv| (SPADCALL (QREFELT $ 48)) . #1=(|LIMITPS;logOnlyLimit|))
          (LETT |eq|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 59))
                 (SPADCALL
                  (SPADCALL (SPADCALL |vv| (QREFELT $ 49)) (QREFELT $ 28))
                  (QREFELT $ 69))
                 (QREFELT $ 51))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |cc| (SPADCALL |coef| |eq| (QREFELT $ 53)) . #1#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (CONS 1 "failed"))
            ('T (|LIMITPS;limitPlus| |cc| |vv| $)))))))) 

(DEFUN |LIMITPS;locallimit| (|fcn| |x| |a| $)
  (PROG (|u| |n| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 71))
            . #1=(|LIMITPS;locallimit|))
      (LETT |n| (SPADCALL |a| (QREFELT $ 31)) . #1#)
      (EXIT
       (COND
        ((|eql_SI| |n| 0)
         (|LIMITPS;realLimit|
          (|LIMITPS;localsubst| |fcn| |xK| 1 (SPADCALL |a| (QREFELT $ 63)) $)
          |x| $))
        (#2='T
         (SEQ
          (LETT |u|
                (|LIMITPS;limitPlus|
                 (SPADCALL |fcn| |xK|
                           (SPADCALL |n|
                                     (SPADCALL (SPADCALL |xK| (QREFELT $ 16))
                                               (QREFELT $ 28))
                                     (QREFELT $ 72))
                           (QREFELT $ 40))
                 |x| $)
                . #1#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 2 "failed"))
                 (#2# (CONS 0 (QCDR |u|))))))))))))) 

(DEFUN |LIMITPS;localsubst| (|fcn| |k| |n| |a| $)
  (SEQ
   (COND
    ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 19))
     (COND ((EQL |n| 1) (EXIT |fcn|)))))
   (EXIT
    (SPADCALL |fcn| |k|
              (SPADCALL
               (SPADCALL |n| (SPADCALL |k| (QREFELT $ 16)) (QREFELT $ 72)) |a|
               (QREFELT $ 73))
              (QREFELT $ 40))))) 

(DEFUN |LIMITPS;locallimitcomplex| (|fcn| |x| |a| $)
  (PROG (|g| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 71))
            . #1=(|LIMITPS;locallimitcomplex|))
      (LETT |g| (SPADCALL |a| (QREFELT $ 75)) . #1#)
      (EXIT
       (COND
        ((QEQCAR |g| 0)
         (|LIMITPS;complLimit| (|LIMITPS;localsubst| |fcn| |xK| 1 (QCDR |g|) $)
          |x| $))
        ('T
         (|LIMITPS;complLimit|
          (SPADCALL |fcn| |xK|
                    (SPADCALL (SPADCALL |xK| (QREFELT $ 16)) (QREFELT $ 28))
                    (QREFELT $ 40))
          |x| $)))))))) 

(DEFUN |LIMITPS;limit;FEESU;20| (|fcn| |eq| |str| $)
  (PROG (|xK| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 76)) (QREFELT $ 78))
            . #1=(|LIMITPS;limit;FEESU;20|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "limit:left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 79)) . #1#)
              (LETT |xK|
                    (SPADCALL (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 71))
                    . #1#)
              (EXIT
               (|LIMITPS;limitPlus|
                (|LIMITPS;localsubst| |fcn| |xK|
                 (SPADCALL |str| (QREFELT $ 82)) |a| $)
                |x| $)))))))))) 

(DEFUN |LIMITPS;anyRootsOrAtrigs?| (|fcn| $)
  (PROG (#1=#:G481 #2=#:G488 #3=#:G489 |kernel|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |kernel| NIL . #4=(|LIMITPS;anyRootsOrAtrigs?|))
             (LETT #3# (SPADCALL |fcn| (QREFELT $ 14)) . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |kernel| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (SPADCALL |kernel| '|nthRoot| (QREFELT $ 21))
                     (OR (SPADCALL |kernel| '|asin| (QREFELT $ 21))
                         (OR (SPADCALL |kernel| '|acos| (QREFELT $ 21))
                             (SPADCALL |kernel| '|asec| (QREFELT $ 21)))))
                 (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |kernel| '|acsc| (QREFELT $ 21))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |LIMITPS;complLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G516 |uls| |lseries| |lpack| |upxs| |pseries|
         |ppack| |Upx| |Efuls| |Uls| |Uts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lim|
              (SEQ
               (LETT |Uts|
                     (|UnivariateTaylorSeries| (QREFELT $ 7) |x| (QREFELT $ 9))
                     . #2=(|LIMITPS;complLimit|))
               (LETT |Uls|
                     (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                (QREFELT $ 9))
                     . #2#)
               (LETT |Efuls|
                     (|ElementaryFunctionsUnivariateLaurentSeries|
                      (QREFELT $ 7) |Uts| |Uls|)
                     . #2#)
               (EXIT
                (COND
                 ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                  (SEQ
                   (LETT |Upx|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9))
                         . #2#)
                   (LETT |ppack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Fraction|
                                                                  (|Integer|))
                                                                 |Upx|
                                                                 (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                                  (QREFELT $ 7)
                                                                  |Uls| |Upx|
                                                                  |Efuls|)
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionPuiseux|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|
                                                                  |Upx|)
                                                                 |x|)
                         . #2#)
                   (LETT |pseries|
                         (SPADCALL |fcn| 'NIL (CONS 0 "complex")
                                   (|compiledLookupCheck| '|exprToUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Upx|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union|
                                                                 '#3="complex"
                                                                 '#4="real: two sides"
                                                                 '#5="real: left side"
                                                                 '#6="real: right side"
                                                                 '#7="just do it"))
                                                          |ppack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |pseries| 1)
                      (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                     (#8='T
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |upxs| (CDR |pseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Upx|))
                         (LETT |upxs|
                               (SPADCALL (ELT $ 44) |upxs|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Upx|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |upxs|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Upx|))
                          (PROGN
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 85))) . #2#)
                           (GO #1#)))
                         (#8#
                          (SPADCALL |upxs| (|spadConstant| $ 87)
                                    (|compiledLookupCheck| '|coefficient|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            '$
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                           |Upx|)))))))))))
                 (#8#
                  (SEQ
                   (LETT |lpack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Integer|)
                                                                 |Uls| |Efuls|
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionLaurent|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|)
                                                                 |x|)
                         . #2#)
                   (LETT |lseries|
                         (SPADCALL |fcn| 'NIL (CONS 0 "complex")
                                   (|compiledLookupCheck| '|exprToUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Uls|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union| '#3#
                                                                 '#4# '#5# '#6#
                                                                 '#7#))
                                                          |lpack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |lseries| 1)
                      (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                     (#8#
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |uls| (CDR |lseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Uls|))
                         (LETT |uls|
                               (SPADCALL (ELT $ 44) |uls|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Uls|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |uls|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Uls|))
                          (PROGN
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 85))) . #2#)
                           (GO #1#)))
                         (#8#
                          (SPADCALL |uls| 0
                                    (|compiledLookupCheck| '|coefficient|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            '$
                                                            (LIST '|Integer|))
                                                           |Uls|))))))))))))))
              . #2#)
        (EXIT
         (COND
          ((SPADCALL |x| (SPADCALL |lim| (QREFELT $ 23)) (QREFELT $ 24))
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |answer| (SPADCALL |lim| (QREFELT $ 44)) . #2#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (|error| "limit: can't evaluate limit"))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 88))))))
          (#8# (CONS 0 (SPADCALL |lim| (QREFELT $ 88))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;okProblem?| (|function| |problem| $)
  (COND
   ((OR (EQUAL |function| "log") (EQUAL |function| "nth root"))
    (COND ((EQUAL |problem| "series of non-zero order") 'T)
          (#1='T (EQUAL |problem| "negative leading coefficient"))))
   ('T
    (COND ((EQUAL |function| "atan") (EQUAL |problem| "branch problem"))
          ((EQUAL |function| "erf") (EQUAL |problem| "unknown kernel"))
          (#1# (EQUAL |problem| "essential singularity")))))) 

(DEFUN |LIMITPS;poleLimit| (|order| |coef| |x| $)
  (PROG (|rtLim| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 23)) (QREFELT $ 24)))
        (SEQ
         (LETT |s| (SPADCALL |coef| (QREFELT $ 91)) . #1=(|LIMITPS;poleLimit|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (SEQ
             (LETT |rtLim|
                   (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 70))
                             (QREFELT $ 92))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |order| (QREFELT $ 93)) (QREFELT $ 94))
                (CONS 0 |rtLim|))
               ((SPADCALL (SPADCALL |order| (QREFELT $ 95)) (QREFELT $ 94))
                (CONS 1 (CONS (CONS 1 "failed") (CONS 0 |rtLim|))))
               (#2='T
                (CONS 1
                      (CONS (CONS 0 (SPADCALL |rtLim| (QREFELT $ 96)))
                            (CONS 0 |rtLim|))))))))
           (#2# (CONS 2 "failed"))))))
       ('T (|error| "limit: can't evaluate limit"))))))) 

(DEFUN |LIMITPS;poleLimitPlus| (|order| |coef| |x| $)
  (PROG (|tt| |t| |ss| |cclim| |lim| |clim| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 23)) (QREFELT $ 24)))
        (SEQ
         (LETT |s| (SPADCALL |coef| (QREFELT $ 91))
               . #1=(|LIMITPS;poleLimitPlus|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (CONS 0
                  (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 70))
                            (QREFELT $ 92))))
           (#2='T (CONS 1 "failed"))))))
       ('T
        (SEQ (LETT |clim| (|LIMITPS;specialLimit| |coef| |x| $) . #1#)
             (EXIT
              (COND ((QEQCAR |clim| 1) (CONS 1 "failed"))
                    ((SPADCALL (LETT |lim| (QCDR |clim|) . #1#) (QREFELT $ 97))
                     (SEQ
                      (LETT |cclim|
                            (|LIMITPS;specialLimit|
                             (SPADCALL |coef| (QREFELT $ 28)) |x| $)
                            . #1#)
                      (EXIT
                       (COND ((QEQCAR |cclim| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (QCDR |cclim|) (QREFELT $ 31))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((ZEROP |ss|)
                                  (|error| "limit: internal error"))
                                 (#2#
                                  (CONS 0
                                        (SPADCALL |ss|
                                                  (SPADCALL (QREFELT $ 70))
                                                  (QREFELT $ 92))))))))))))
                    (#2#
                     (SEQ (LETT |t| (SPADCALL |lim| (QREFELT $ 31)) . #1#)
                          (EXIT
                           (COND
                            ((ZEROP |t|)
                             (SEQ
                              (LETT |tt| (SPADCALL |coef| (QREFELT $ 91))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |tt| 0)
                                 (CONS 0
                                       (SPADCALL (QCDR |tt|)
                                                 (SPADCALL (QREFELT $ 70))
                                                 (QREFELT $ 92))))
                                (#2# (CONS 1 "failed"))))))
                            (#2#
                             (CONS 0
                                   (SPADCALL |t| (SPADCALL (QREFELT $ 70))
                                             (QREFELT $ 92))))))))))))))))) 

(DEFUN |LIMITPS;realLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G594 |cl| |ordl| |uls| |right| |left| |fcn0| |xK|
         |problem| |function| |trouble| |lseries| |lpack| |cp| |ordp| |upxs|
         |pseries| |ppack| |Upx| |Efuls| |Uls| |Uts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lim|
              (SEQ
               (LETT |Uts|
                     (|UnivariateTaylorSeries| (QREFELT $ 7) |x| (QREFELT $ 9))
                     . #2=(|LIMITPS;realLimit|))
               (LETT |Uls|
                     (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                (QREFELT $ 9))
                     . #2#)
               (LETT |Efuls|
                     (|ElementaryFunctionsUnivariateLaurentSeries|
                      (QREFELT $ 7) |Uts| |Uls|)
                     . #2#)
               (EXIT
                (COND
                 ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                  (SEQ
                   (LETT |Upx|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9))
                         . #2#)
                   (LETT |ppack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Fraction|
                                                                  (|Integer|))
                                                                 |Upx|
                                                                 (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                                  (QREFELT $ 7)
                                                                  |Uls| |Upx|
                                                                  |Efuls|)
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionPuiseux|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|
                                                                  |Upx|)
                                                                 |x|)
                         . #2#)
                   (LETT |pseries|
                         (SPADCALL |fcn| 'T (CONS 1 "real: two sides")
                                   (|compiledLookupCheck| '|exprToUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Upx|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union|
                                                                 '#3="complex"
                                                                 '#4="real: two sides"
                                                                 '#5="real: left side"
                                                                 '#6="real: right side"
                                                                 '#7="just do it"))
                                                          |ppack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |pseries| 1)
                      (SEQ (LETT |trouble| (CDR |pseries|) . #2#)
                           (LETT |function| (QCAR |trouble|) . #2#)
                           (LETT |problem| (QCDR |trouble|) . #2#)
                           (EXIT
                            (COND
                             ((|LIMITPS;okProblem?| |function| |problem| $)
                              (SEQ
                               (LETT |left|
                                     (SEQ
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 12))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          16))
                                                       (QREFELT $ 69))
                                                      (QREFELT $ 40))
                                            . #2#)
                                      (EXIT
                                       (|LIMITPS;limitPlus| |fcn0| |x| $)))
                                     . #2#)
                               (LETT |right| (|LIMITPS;limitPlus| |fcn| |x| $)
                                     . #2#)
                               (COND
                                ((QEQCAR |left| 1)
                                 (COND
                                  ((QEQCAR |right| 1)
                                   (EXIT
                                    (PROGN
                                     (LETT #1# (CONS 2 "failed") . #2#)
                                     (GO #1#)))))))
                               (COND
                                ((QEQCAR |left| 0)
                                 (COND
                                  ((QEQCAR |right| 0)
                                   (COND
                                    ((SPADCALL (QCDR |left|) (QCDR |right|)
                                               (QREFELT $ 98))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# (CONS 0 (QCDR |left|)) . #2#)
                                       (GO #1#)))))))))
                               (EXIT
                                (PROGN
                                 (LETT #1# (CONS 1 (CONS |left| |right|))
                                       . #2#)
                                 (GO #1#)))))
                             (#8='T
                              (PROGN
                               (LETT #1# (CONS 2 "failed") . #2#)
                               (GO #1#)))))))
                     (#8#
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |upxs| (CDR |pseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Upx|))
                         (LETT |upxs|
                               (SPADCALL (ELT $ 44) |upxs|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Upx|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |upxs|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Upx|))
                          (SEQ
                           (LETT |cp|
                                 (SPADCALL |upxs|
                                           (LETT |ordp|
                                                 (SPADCALL |upxs|
                                                           (|compiledLookupCheck|
                                                            '|order|
                                                            (LIST
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|Integer|))
                                                             '$)
                                                            |Upx|))
                                                 . #2#)
                                           (|compiledLookupCheck|
                                            '|coefficient|
                                            (LIST (|devaluate| (ELT $ 7)) '$
                                                  (LIST '|Fraction|
                                                        (LIST '|Integer|)))
                                            |Upx|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1# (|LIMITPS;poleLimit| |ordp| |cp| |x| $)
                                   . #2#)
                             (GO #1#)))))
                         (#8#
                          (CONS 0
                                (SPADCALL |upxs| (|spadConstant| $ 87)
                                          (|compiledLookupCheck| '|coefficient|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  '$
                                                                  (LIST
                                                                   '|Fraction|
                                                                   (LIST
                                                                    '|Integer|)))
                                                                 |Upx|))))))))))))
                 (#8#
                  (SEQ
                   (LETT |lpack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Integer|)
                                                                 |Uls| |Efuls|
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionLaurent|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|)
                                                                 |x|)
                         . #2#)
                   (LETT |lseries|
                         (SPADCALL |fcn| 'T (CONS 1 "real: two sides")
                                   (|compiledLookupCheck| '|exprToUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Uls|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union| '#3#
                                                                 '#4# '#5# '#6#
                                                                 '#7#))
                                                          |lpack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |lseries| 1)
                      (SEQ (LETT |trouble| (CDR |lseries|) . #2#)
                           (LETT |function| (QCAR |trouble|) . #2#)
                           (LETT |problem| (QCDR |trouble|) . #2#)
                           (EXIT
                            (COND
                             ((|LIMITPS;okProblem?| |function| |problem| $)
                              (SEQ
                               (LETT |left|
                                     (SEQ
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 12))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          16))
                                                       (QREFELT $ 69))
                                                      (QREFELT $ 40))
                                            . #2#)
                                      (EXIT
                                       (|LIMITPS;limitPlus| |fcn0| |x| $)))
                                     . #2#)
                               (LETT |right| (|LIMITPS;limitPlus| |fcn| |x| $)
                                     . #2#)
                               (COND
                                ((QEQCAR |left| 1)
                                 (COND
                                  ((QEQCAR |right| 1)
                                   (EXIT
                                    (PROGN
                                     (LETT #1# (CONS 2 "failed") . #2#)
                                     (GO #1#)))))))
                               (COND
                                ((QEQCAR |left| 0)
                                 (COND
                                  ((QEQCAR |right| 0)
                                   (COND
                                    ((SPADCALL (QCDR |left|) (QCDR |right|)
                                               (QREFELT $ 98))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# (CONS 0 (QCDR |left|)) . #2#)
                                       (GO #1#)))))))))
                               (EXIT
                                (PROGN
                                 (LETT #1# (CONS 1 (CONS |left| |right|))
                                       . #2#)
                                 (GO #1#)))))
                             (#8#
                              (PROGN
                               (LETT #1# (CONS 2 "failed") . #2#)
                               (GO #1#)))))))
                     (#8#
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |uls| (CDR |lseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Uls|))
                         (LETT |uls|
                               (SPADCALL (ELT $ 44) |uls|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Uls|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |uls|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Uls|))
                          (SEQ
                           (LETT |cl|
                                 (SPADCALL |uls|
                                           (LETT |ordl|
                                                 (SPADCALL |uls|
                                                           (|compiledLookupCheck|
                                                            '|order|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '$)
                                                            |Uls|))
                                                 . #2#)
                                           (|compiledLookupCheck|
                                            '|coefficient|
                                            (LIST (|devaluate| (ELT $ 7)) '$
                                                  (LIST '|Integer|))
                                            |Uls|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (|LIMITPS;poleLimit|
                                    (SPADCALL |ordl| (QREFELT $ 99)) |cl| |x|
                                    $)
                                   . #2#)
                             (GO #1#)))))
                         (#8#
                          (CONS 0
                                (SPADCALL |uls| 0
                                          (|compiledLookupCheck| '|coefficient|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  '$
                                                                  (LIST
                                                                   '|Integer|))
                                                                 |Uls|)))))))))))))))
              . #2#)
        (EXIT
         (COND ((QEQCAR |lim| 1) (CONS 2 "failed"))
               ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 23))
                          (QREFELT $ 24))
                (COND
                 ((SPADCALL |x|
                            (SPADCALL
                             (LETT |answer|
                                   (SPADCALL (QCDR |lim|) (QREFELT $ 44))
                                   . #2#)
                             (QREFELT $ 23))
                            (QREFELT $ 24))
                  (|error| "limit: can't evaluate limit"))
                 (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 42))))))
               (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 42))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;xxpLimit| (|fcn| |x| $)
  (PROG (|xxp| |xpack|)
    (RETURN
     (SEQ
      (LETT |xpack|
            (|FunctionSpaceToExponentialExpansion| (QREFELT $ 6) (QREFELT $ 7)
                                                   |x| (QREFELT $ 9))
            . #1=(|LIMITPS;xxpLimit|))
      (LETT |xxp|
            (SPADCALL |fcn| 'T
                      (|compiledLookupCheck| '|exprToXXP|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|:| '|%expansion|
                                                          (LIST
                                                           '|ExponentialExpansion|
                                                           (|devaluate|
                                                            (ELT $ 6))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           |x|
                                                           (|devaluate|
                                                            (ELT $ 9))))
                                                    (LIST '|:| '|%problem|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|func|
                                                                      (LIST
                                                                       '|String|))
                                                                (LIST '|:|
                                                                      '|prob|
                                                                      (LIST
                                                                       '|String|)))))
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Boolean|))
                                             |xpack|))
            . #1#)
      (EXIT
       (COND ((QEQCAR |xxp| 1) (CONS 1 "failed"))
             ('T
              (SPADCALL (CDR |xxp|)
                        (|compiledLookupCheck| '|limitPlus|
                                               (LIST
                                                (LIST '|Union|
                                                      (LIST
                                                       '|OrderedCompletion|
                                                       (|devaluate| (ELT $ 7)))
                                                      '"failed")
                                                '$)
                                               (|ExponentialExpansion|
                                                (ELT $ 6) (ELT $ 7) |x|
                                                (ELT $ 9))))))))))) 

(DEFUN |LIMITPS;limitPlus| (|fcn| |x| $)
  (PROG (|xLim| |answer| |lim| #1=#:G639 |cl| |ordl| |uls| |pp| |ff| |trouble|
         |lseries| |lpack| |cp| |ordp| |upxs| |pseries| |ppack| |Upx| |Efuls|
         |Uls| |Uts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lim|
              (SEQ
               (LETT |Uts|
                     (|UnivariateTaylorSeries| (QREFELT $ 7) |x| (QREFELT $ 9))
                     . #2=(|LIMITPS;limitPlus|))
               (LETT |Uls|
                     (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                (QREFELT $ 9))
                     . #2#)
               (LETT |Efuls|
                     (|ElementaryFunctionsUnivariateLaurentSeries|
                      (QREFELT $ 7) |Uts| |Uls|)
                     . #2#)
               (EXIT
                (COND
                 ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                  (SEQ
                   (LETT |Upx|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9))
                         . #2#)
                   (LETT |ppack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Fraction|
                                                                  (|Integer|))
                                                                 |Upx|
                                                                 (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                                  (QREFELT $ 7)
                                                                  |Uls| |Upx|
                                                                  |Efuls|)
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionPuiseux|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|
                                                                  |Upx|)
                                                                 |x|)
                         . #2#)
                   (LETT |pseries|
                         (SPADCALL |fcn| 'T (CONS 3 "real: right side")
                                   (|compiledLookupCheck| '|exprToGenUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Upx|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union|
                                                                 '#3="complex"
                                                                 '#4="real: two sides"
                                                                 '#5="real: left side"
                                                                 '#6="real: right side"
                                                                 '#7="just do it"))
                                                          |ppack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |pseries| 1)
                      (SEQ (LETT |trouble| (CDR |pseries|) . #2#)
                           (LETT |ff| (QCAR |trouble|) . #2#)
                           (LETT |pp| (QCDR |trouble|) . #2#)
                           (EXIT
                            (COND
                             ((EQUAL |pp| "negative leading coefficient")
                              (PROGN
                               (LETT #1# (CONS 1 "failed") . #2#)
                               (GO #1#)))
                             (#8='T (CONS 1 "failed"))))))
                     (#8#
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |upxs| (CDR |pseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Upx|))
                         (LETT |upxs|
                               (SPADCALL (ELT $ 44) |upxs|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Upx|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |upxs|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Upx|))
                          (SEQ
                           (LETT |cp|
                                 (SPADCALL |upxs|
                                           (LETT |ordp|
                                                 (SPADCALL |upxs|
                                                           (|compiledLookupCheck|
                                                            '|order|
                                                            (LIST
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|Integer|))
                                                             '$)
                                                            |Upx|))
                                                 . #2#)
                                           (|compiledLookupCheck|
                                            '|coefficient|
                                            (LIST (|devaluate| (ELT $ 7)) '$
                                                  (LIST '|Fraction|
                                                        (LIST '|Integer|)))
                                            |Upx|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (|LIMITPS;poleLimitPlus| |ordp| |cp| |x| $)
                                   . #2#)
                             (GO #1#)))))
                         (#8#
                          (CONS 0
                                (SPADCALL |upxs| (|spadConstant| $ 87)
                                          (|compiledLookupCheck| '|coefficient|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  '$
                                                                  (LIST
                                                                   '|Fraction|
                                                                   (LIST
                                                                    '|Integer|)))
                                                                 |Upx|))))))))))))
                 (#8#
                  (SEQ
                   (LETT |lpack|
                         (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6)
                                                                 (QREFELT $ 7)
                                                                 (|Integer|)
                                                                 |Uls| |Efuls|
                                                                 |Uts|
                                                                 (|TaylorSeriesExpansionLaurent|
                                                                  (QREFELT $ 7)
                                                                  |Uts| |Uls|)
                                                                 |x|)
                         . #2#)
                   (LETT |lseries|
                         (SPADCALL |fcn| 'T (CONS 3 "real: right side")
                                   (|compiledLookupCheck| '|exprToGenUPS|
                                                          (LIST
                                                           (LIST '|Union|
                                                                 (LIST '|:|
                                                                       '|%series|
                                                                       (|devaluate|
                                                                        |Uls|))
                                                                 (LIST '|:|
                                                                       '|%problem|
                                                                       (LIST
                                                                        '|Record|
                                                                        (LIST
                                                                         '|:|
                                                                         '|func|
                                                                         (LIST
                                                                          '|String|))
                                                                        (LIST
                                                                         '|:|
                                                                         '|prob|
                                                                         (LIST
                                                                          '|String|)))))
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           (LIST '|Boolean|)
                                                           (LIST '|Union| '#3#
                                                                 '#4# '#5# '#6#
                                                                 '#7#))
                                                          |lpack|))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |lseries| 1)
                      (SEQ (LETT |trouble| (CDR |lseries|) . #2#)
                           (LETT |ff| (QCAR |trouble|) . #2#)
                           (LETT |pp| (QCDR |trouble|) . #2#)
                           (EXIT
                            (COND
                             ((EQUAL |pp| "negative leading coefficient")
                              (PROGN
                               (LETT #1# (CONS 1 "failed") . #2#)
                               (GO #1#)))
                             (#8# (CONS 1 "failed"))))))
                     (#8#
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |uls| (CDR |lseries|) . #2#)
                                   (|compiledLookupCheck| '|pole?|
                                                          (LIST
                                                           (LIST '|Boolean|)
                                                           '$)
                                                          |Uls|))
                         (LETT |uls|
                               (SPADCALL (ELT $ 44) |uls|
                                         (|compiledLookupCheck| '|map|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Mapping|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7))
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))
                                                                      '$)
                                                                |Uls|))
                               . #2#)))
                       (EXIT
                        (COND
                         ((SPADCALL |uls|
                                    (|compiledLookupCheck| '|pole?|
                                                           (LIST
                                                            (LIST '|Boolean|)
                                                            '$)
                                                           |Uls|))
                          (SEQ
                           (LETT |cl|
                                 (SPADCALL |uls|
                                           (LETT |ordl|
                                                 (SPADCALL |uls|
                                                           (|compiledLookupCheck|
                                                            '|order|
                                                            (LIST
                                                             (LIST '|Integer|)
                                                             '$)
                                                            |Uls|))
                                                 . #2#)
                                           (|compiledLookupCheck|
                                            '|coefficient|
                                            (LIST (|devaluate| (ELT $ 7)) '$
                                                  (LIST '|Integer|))
                                            |Uls|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (|LIMITPS;poleLimitPlus|
                                    (SPADCALL |ordl| (QREFELT $ 99)) |cl| |x|
                                    $)
                                   . #2#)
                             (GO #1#)))))
                         (#8#
                          (CONS 0
                                (SPADCALL |uls| 0
                                          (|compiledLookupCheck| '|coefficient|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  '$
                                                                  (LIST
                                                                   '|Integer|))
                                                                 |Uls|)))))))))))))))
              . #2#)
        (EXIT
         (COND
          ((QEQCAR |lim| 1)
           (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |fcn| |x| $) . #2#)
                (EXIT
                 (COND ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |fcn| |x| $))
                       (#8# |xLim|)))))
          ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 23)) (QREFELT $ 24))
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |answer| (SPADCALL (QCDR |lim|) (QREFELT $ 44))
                              . #2#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |answer| |x| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |answer| |x| $))
                    (#8# |xLim|)))))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 42))))))
          (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 42))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;limit1| (|fcn| |eq| |do_lim| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 101)) (QREFELT $ 39))
            . #1=(|LIMITPS;limit1|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 78)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 102)) . #1#)
                      (EXIT (SPADCALL |fcn| |x| |a| |do_lim|)))))))))))))) 

(DEFUN |LIMITPS;limit;FEEU;30| (|fcn| |eq| $)
  (PROG ()
    (RETURN
     (|LIMITPS;limit1| |fcn| |eq|
      (CONS #'|LIMITPS;limit;FEEU;30!0| (VECTOR |eq| |fcn| $)) $)))) 

(DEFUN |LIMITPS;limit;FEEU;30!0| (|f| |x| |a| $$)
  (PROG ($ |fcn| |eq|)
    (LETT $ (QREFELT $$ 2) . #1=(|LIMITPS;limit;FEEU;30|))
    (LETT |fcn| (QREFELT $$ 1) . #1#)
    (LETT |eq| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((|LIMITPS;is_exp_log| |f| |x| $) (SPADCALL |fcn| |eq| (QREFELT $ 109)))
       ('T (|LIMITPS;locallimit| |f| |x| |a| $))))))) 

(DEFUN |LIMITPS;limit;FEEU;31| (|fcn| |eq| $)
  (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $) $)) 

(DEFUN |LIMITPS;limit;FEEU;32| (|fcn| |eq| $)
  (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $) $)) 

(DEFUN |LIMITPS;complexLimit;FEEU;33| (|fcn| |eq| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 114)) (QREFELT $ 75))
            . #1=(|LIMITPS;complexLimit;FEEU;33|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 78)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 115)) . #1#)
                      (EXIT
                       (|LIMITPS;locallimitcomplex| |fcn| |x| |a|
                        $)))))))))))))) 

(DEFUN |PowerSeriesLimitPackage| (&REST #1=#:G687)
  (PROG ()
    (RETURN
     (PROG (#2=#:G688)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PowerSeriesLimitPackage|)
                                           '|domainEqualList|)
                . #3=(|PowerSeriesLimitPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PowerSeriesLimitPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PowerSeriesLimitPackage|))))))))))) 

(DEFUN |PowerSeriesLimitPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PowerSeriesLimitPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PowerSeriesLimitPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 118) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PowerSeriesLimitPackage|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|spadConstant| $ 8))
      (COND
       ((|domainEqual| |#1| (|Integer|))
        (COND
         ((|domainEqual| |#2| (|Expression| (|Integer|)))
          (QSETREFV $ 112
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;30|) $)))
         ('T
          (QSETREFV $ 112
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;31|) $)))))
       ('T
        (QSETREFV $ 112
                  (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;32|) $))))
      $)))) 

(MAKEPROP '|PowerSeriesLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) '|zeroFE| (|Symbol|) (|Kernel| 7) (4 . |kernel|)
              (|List| 15) (9 . |tower|) (|Kernel| $) (14 . |coerce|)
              (19 . |differentiate|) (|Boolean|) (25 . =) (31 . =) (37 . |is?|)
              (|List| 10) (43 . |variables|) (48 . |member?|) (54 . |kernels|)
              (59 . |name|) (64 . -) (70 . |inv|) (|SingleInteger|)
              (|OrderedCompletion| 7) (75 . |whatInfinity|) (80 . |Zero|)
              (84 . |One|) (88 . |numerator|) (93 . |denominator|) (|Integer|)
              (98 . ~=) (|Union| 7 '"failed") (104 . |retractIfCan|)
              (109 . |eval|) (116 . /) (122 . |coerce|)
              (|ElementaryFunctionStructurePackage| 6 7) (127 . |normalize|)
              (132 . ~=) (|NonNegativeInteger|) (138 . ~=) (144 . |new|)
              (148 . |coerce|) (|Equation| 7) (153 . |equation|) (|Equation| $)
              (159 . |eval|) (|List| 7) (165 . |argument|) (170 . |One|)
              (174 . -) (179 . |minusInfinity|) (183 . |log|) (|BasicOperator|)
              (188 . |operator|) (193 . |elt|) (199 . |retract|)
              (|LiouvillianFunction| 6 7) (204 . |erf|) (209 . |pi|)
              (213 . |coerce|) (218 . |sqrt|) (223 . -) (228 . |plusInfinity|)
              (232 . |retract|) (237 . *) (243 . +) (|OnePointCompletion| 7)
              (249 . |retractIfCan|) (254 . |lhs|) (|Union| 10 '"failed")
              (259 . |retractIfCan|) (264 . |rhs|) (|String|)
              (|ToolsForSign| 6) (269 . |direction|) (|Union| 30 '"failed")
              |LIMITPS;limit;FEESU;20| (274 . |infinity|) (|Fraction| 36)
              (278 . |Zero|) (282 . |coerce|) (|Union| 36 '"failed")
              (|ElementaryFunctionSign| 6 7) (287 . |sign|) (292 . *)
              (298 . |numer|) (303 . |even?|) (308 . |denom|) (313 . -)
              (318 . |zero?|) (323 . =) (329 . |coerce|) (|Equation| 30)
              (334 . |lhs|) (339 . |rhs|)
              (|Union| (|OrderedCompletion| 106) '"failed")
              (|Record| (|:| |leftHandLimit| 103) (|:| |rightHandLimit| 103))
              (|Union| (|OrderedCompletion| 106) 104 '"failed")
              (|Expression| 36) (|Equation| (|OrderedCompletion| 106))
              (|MrvLimitPackage|) (344 . |mrv_limit|)
              (|Record| (|:| |leftHandLimit| 83) (|:| |rightHandLimit| 83))
              (|Union| 30 110 '"failed") (350 . |limit|) (|Equation| 74)
              (356 . |lhs|) (361 . |rhs|) (|Union| 74 '"failed")
              |LIMITPS;complexLimit;FEEU;33|)
           '#(|limit| 366 |complexLimit| 379) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 117
                                                 '(0 7 0 8 1 11 0 10 12 1 7 13
                                                   0 14 1 7 0 15 16 2 7 0 0 10
                                                   17 2 7 18 0 0 19 2 11 18 0 0
                                                   20 2 11 18 0 10 21 1 7 22 0
                                                   23 2 22 18 10 0 24 1 7 13 0
                                                   25 1 11 10 0 26 2 7 0 0 0 27
                                                   1 7 0 0 28 1 30 29 0 31 0 6
                                                   0 32 0 6 0 33 1 7 0 0 34 1 7
                                                   0 0 35 2 36 18 0 0 37 1 30
                                                   38 0 39 3 7 0 0 15 0 40 2 7
                                                   0 0 0 41 1 30 0 7 42 1 43 7
                                                   7 44 2 7 18 0 0 45 2 46 18 0
                                                   0 47 0 10 0 48 1 7 0 10 49 2
                                                   50 0 7 7 51 2 7 0 0 52 53 1
                                                   11 54 0 55 0 7 0 56 1 6 0 0
                                                   57 0 30 0 58 1 7 0 0 59 1 11
                                                   60 0 61 2 7 0 60 0 62 1 30 7
                                                   0 63 1 64 7 7 65 0 7 0 66 1
                                                   7 0 36 67 1 7 0 0 68 1 7 0 0
                                                   69 0 30 0 70 1 7 15 0 71 2 7
                                                   0 36 0 72 2 7 0 0 0 73 1 74
                                                   38 0 75 1 50 7 0 76 1 7 77 0
                                                   78 1 50 7 0 79 1 81 36 80 82
                                                   0 74 0 85 0 86 0 87 1 74 0 7
                                                   88 1 90 89 7 91 2 30 0 36 0
                                                   92 1 86 36 0 93 1 36 18 0 94
                                                   1 86 36 0 95 1 30 0 0 96 1
                                                   30 18 0 97 2 30 18 0 0 98 1
                                                   86 0 36 99 1 100 30 0 101 1
                                                   100 30 0 102 2 108 105 106
                                                   107 109 2 0 111 7 100 112 1
                                                   113 74 0 114 1 113 74 0 115
                                                   2 0 111 7 100 112 3 0 83 7
                                                   50 80 84 2 0 116 7 113
                                                   117)))))
           '|lookupComplete|)) 
