
(/VERSIONCHECK 2) 

(DEFUN |LIMITPS;is_exp_log| (|fcn| |x| $)
  (PROG (#1=#:G242 |nm| #2=#:G243 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |k| NIL . #3=(|LIMITPS;is_exp_log|))
             (LETT #2# (SPADCALL |fcn| (QREFELT $ 11)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (LETT |nm|
                    (SPADCALL (SPADCALL |k| (QREFELT $ 14)) (QREFELT $ 16))
                    . #3#)
              (COND
               ((OR (EQUAL |nm| |x|)
                    (OR (EQUAL |nm| '|log|)
                        (OR (EQUAL |nm| '|exp|)
                            (OR (EQUAL |nm| '|%power|)
                                (EQUAL |nm| '|nthRoot|)))))
                (EXIT "iterate")))
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |k| (QREFELT $ 18)) |x| (QREFELT $ 19))
                  (|spadConstant| $ 8) (QREFELT $ 21))
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
  (PROG (|list| #1=#:G254 |ker|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |list| (SPADCALL |fcn| (QREFELT $ 25))
              . #2=(|LIMITPS;firstNonLogPtr|))
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT |ker| (|SPADfirst| |list|) . #2#)
                  (COND
                   ((NULL (SPADCALL |ker| '|log| (QREFELT $ 26)))
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (SPADCALL |ker| (QREFELT $ 18))
                                          (QREFELT $ 23))
                                (QREFELT $ 24))
                      (COND
                       ((NULL (EQUAL |x| (SPADCALL |ker| (QREFELT $ 27))))
                        (EXIT (PROGN (LETT #1# |list| . #2#) (GO #1#)))))))))
                  (EXIT (LETT |list| (CDR |list|) . #2#)))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;finiteValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|erf| (QREFELT $ 26))
        (OR (SPADCALL |ker| '|sech| (QREFELT $ 26))
            (OR (SPADCALL |ker| '|csch| (QREFELT $ 26))
                (OR (SPADCALL |ker| '|tanh| (QREFELT $ 26))
                    (OR (SPADCALL |ker| '|coth| (QREFELT $ 26))
                        (OR (SPADCALL |ker| '|atan| (QREFELT $ 26))
                            (OR (SPADCALL |ker| '|acot| (QREFELT $ 26))
                                (OR (SPADCALL |ker| '|asec| (QREFELT $ 26))
                                    (OR (SPADCALL |ker| '|acsc| (QREFELT $ 26))
                                        (OR
                                         (SPADCALL |ker| '|acsch|
                                                   (QREFELT $ 26))
                                         (OR
                                          (SPADCALL |ker| '|acoth|
                                                    (QREFELT $ 26))
                                          (OR
                                           (SPADCALL |ker| '|fresnelS|
                                                     (QREFELT $ 26))
                                           (OR
                                            (SPADCALL |ker| '|fresnelC|
                                                      (QREFELT $ 26))
                                            (OR
                                             (SPADCALL |ker| '|Si|
                                                       (QREFELT $ 26))
                                             (SPADCALL |ker| '|airyAi|
                                                       (QREFELT $
                                                                26))))))))))))))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;finiteValueAtPlusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
        (OR (SPADCALL |ker| '|Ci| (QREFELT $ 26))
            (SPADCALL |ker| '|airyAiPrime| (QREFELT $ 26))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;finiteValueAtMinusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
        (SPADCALL |ker| '|airyBi| (QREFELT $ 26)))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|exp| (QREFELT $ 26))
        (OR (SPADCALL |ker| '|sinh| (QREFELT $ 26))
            (OR (SPADCALL |ker| '|cosh| (QREFELT $ 26))
                (SPADCALL |ker| '|Shi| (QREFELT $ 26)))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtPlusInfinity?| (|ker| $)
  (COND
   ((OR (|LIMITPS;knownValueAtInfinity?| |ker| $)
        (OR (SPADCALL |ker| '|airyBi| (QREFELT $ 26))
            (OR (SPADCALL |ker| '|airyBiPrime| (QREFELT $ 26))
                (SPADCALL |ker| '|Chi| (QREFELT $ 26)))))
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
             (SPADCALL (SPADCALL |fcn| |limVal| (QREFELT $ 28)) (QREFELT $ 29))
             |x| $)
            . #1=(|LIMITPS;leftOrRight|))
      (EXIT
       (COND ((QEQCAR |value| 1) 0)
             (#2='T
              (SEQ
               (LETT |inf|
                     (SPADCALL (LETT |val| (QCDR |value|) . #1#)
                               (QREFELT $ 32))
                     . #1#)
               (EXIT
                (COND
                 ((|eql_SI| |inf| 0) (|error| "limit package: internal error"))
                 (#2# |inf|))))))))))) 

(DEFUN |LIMITPS;specialLimit| (|fcn| |x| $)
  (PROG (#1=#:G310 |den| |num| |finVal| |valu| |val| |fval| #2=#:G313 |k|
         |xkers| #3=#:G312 #4=#:G311)
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
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                            (QREFELT $ 23))
                                  (QREFELT $ 24))
                        (LETT #4# (CONS |k| #4#) . #5#)))))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #5#)
        (EXIT
         (COND ((EQL (LENGTH |xkers|) 1) (|LIMITPS;specialLimit1| |fcn| |x| $))
               ('T
                (SEQ (LETT |num| (SPADCALL |fcn| (QREFELT $ 35)) . #5#)
                     (LETT |den| (SPADCALL |fcn| (QREFELT $ 36)) . #5#)
                     (SEQ (LETT |k| NIL . #5#) (LETT #2# |xkers| . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |k| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |fval|
                                 (|LIMITPS;limitPlus|
                                  (SPADCALL |k| (QREFELT $ 18)) |x| $)
                                 . #5#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |fval| 1)
                                  (SPADCALL
                                   (SPADCALL (LETT |val| (QCDR |fval|) . #5#)
                                             (QREFELT $ 32))
                                   0 (QREFELT $ 38)))
                              (PROGN
                               (LETT #1#
                                     (|LIMITPS;specialLimitNormalize| |fcn| |x|
                                      $)
                                     . #5#)
                               (GO #1#)))
                             ('T
                              (SEQ
                               (LETT |valu| (SPADCALL |val| (QREFELT $ 40))
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
                                                       (QREFELT $ 41))
                                             . #5#)
                                       (LETT |den|
                                             (SPADCALL |den| |k| |finVal|
                                                       (QREFELT $ 41))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |den| (|spadConstant| $ 8)
                                                    (QREFELT $ 21))
                                          (PROGN
                                           (LETT #1#
                                                 (|LIMITPS;specialLimitNormalize|
                                                  |fcn| |x| $)
                                                 . #5#)
                                           (GO #1#))))))))))))))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (CONS 0
                            (SPADCALL (SPADCALL |num| |den| (QREFELT $ 42))
                                      (QREFELT $ 43))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;specialLimitNormalize| (|fcn| |x| $)
  (PROG (|lim| |limm| |limVal| |expKerLim| |cc| |eq| |vv| |fval| |expKer|
         |expKers| #1=#:G337 |k| #2=#:G336 |xkers| #3=#:G335 #4=#:G334 |nfcn|)
    (RETURN
     (SEQ
      (LETT |nfcn| (SPADCALL |fcn| (QREFELT $ 45))
            . #5=(|LIMITPS;specialLimitNormalize|))
      (EXIT
       (COND
        ((SPADCALL |fcn| |nfcn| (QREFELT $ 46))
         (|LIMITPS;limitPlus| |nfcn| |x| $))
        (#6='T
         (SEQ
          (LETT |xkers|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |k| NIL . #5#)
                      (LETT #3# (SPADCALL |fcn| (QREFELT $ 11)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                              (QREFELT $ 23))
                                    (QREFELT $ 24))
                          (LETT #4# (CONS |k| #4#) . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |xkers|) 2 (QREFELT $ 48)) (CONS 1 "failed"))
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
                             ((SPADCALL |k| '|exp| (QREFELT $ 26))
                              (LETT #2# (CONS |k| #2#) . #5#)))))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT
               (COND
                ((SPADCALL (LENGTH |expKers|) 1 (QREFELT $ 48))
                 (CONS 1 "failed"))
                (#6#
                 (SEQ (LETT |expKer| (|SPADfirst| |expKers|) . #5#)
                      (LETT |fval|
                            (|LIMITPS;limitPlus|
                             (SPADCALL |expKer| (QREFELT $ 18)) |x| $)
                            . #5#)
                      (EXIT
                       (COND ((QEQCAR |fval| 1) (CONS 1 "failed"))
                             (#6#
                              (SEQ (LETT |vv| (SPADCALL (QREFELT $ 49)) . #5#)
                                   (LETT |eq|
                                         (SPADCALL
                                          (SPADCALL |expKer| (QREFELT $ 18))
                                          (SPADCALL |vv| (QREFELT $ 50))
                                          (QREFELT $ 52))
                                         . #5#)
                                   (LETT |cc|
                                         (SPADCALL |fcn| |eq| (QREFELT $ 54))
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
                                                           (QREFELT $ 40))
                                                 . #5#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |lim| 1)
                                              (CONS 1 "failed"))
                                             (#6#
                                              (|LIMITPS;limitPlus| (QCDR |lim|)
                                               |x| $)))))))))))))))))))))))))))) 

(DEFUN |LIMITPS;specialLimit1| (|fcn| |x| $)
  (PROG (|limVal| |argLim| |lim| |cc| |eq| |vv| |ker| |xkers| #1=#:G353 |k|
         #2=#:G352)
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
                                (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                          (QREFELT $ 23))
                                (QREFELT $ 24))
                      (LETT #2# (CONS |k| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((SPADCALL (LENGTH |xkers|) 1 (QREFELT $ 48)) (CONS 1 "failed"))
             (#4='T
              (SEQ (LETT |ker| (|SPADfirst| |xkers|) . #3#)
                   (LETT |vv| (SPADCALL (QREFELT $ 49)) . #3#)
                   (LETT |eq|
                         (SPADCALL (SPADCALL |ker| (QREFELT $ 18))
                                   (SPADCALL |vv| (QREFELT $ 50))
                                   (QREFELT $ 52))
                         . #3#)
                   (LETT |cc| (SPADCALL |fcn| |eq| (QREFELT $ 54)) . #3#)
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
         #1=#:G420 |li| #2=#:G359)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |ker| '|log| (QREFELT $ 26))
         (SEQ
          (LETT |args| (SPADCALL |ker| (QREFELT $ 56))
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
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 32))
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
                                                                        $ 40))
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
                                                                            21))
                                                         (COND
                                                          ((|eql_SI|
                                                            (|LIMITPS;leftOrRight|
                                                             |arg| |x|
                                                             (|spadConstant| $
                                                                             8)
                                                             $)
                                                            1)
                                                           (SPADCALL
                                                            (QREFELT $ 59)))
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
                                                                             60))
                                                          (QREFELT $
                                                                   43)))))))))
                                        . #3#))))))))))))))
        (#4#
         (SEQ (LETT |args| (SPADCALL |ker| (QREFELT $ 56)) . #3#)
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
                                          (SPADCALL |ker| (QREFELT $ 14))
                                          (SPADCALL
                                           (LETT |var|
                                                 (SPADCALL (QREFELT $ 49))
                                                 . #3#)
                                           (QREFELT $ 50))
                                          (QREFELT $ 61))
                                         . #3#)
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 32))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |inf| 0)
                                      (COND
                                       ((SPADCALL |ker| '|erf| (QREFELT $ 26))
                                        (CONS 0
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lim| (QREFELT $ 62))
                                                (QREFELT $ 64))
                                               (QREFELT $ 43))))
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
                                                           (QREFELT $ 26))
                                                 (|spadConstant| $ 57))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 26))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 26))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 26))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       26)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 65))
                                                  (SPADCALL 2 (QREFELT $ 66))
                                                  (QREFELT $ 42)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 26))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 65))
                                                  (SPADCALL 2 (QREFELT $ 66))
                                                  (QREFELT $ 42)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsc|
                                                            (QREFELT $ 26))
                                                  (OR
                                                   (SPADCALL |ker| '|acsch|
                                                             (QREFELT $ 26))
                                                   (SPADCALL |ker| '|acoth|
                                                             (QREFELT $ 26))))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 26))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 26)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 65))
                                                   (SPADCALL 8 (QREFELT $ 66))
                                                   (QREFELT $ 42))
                                                  (QREFELT $ 67)))
                                                ((SPADCALL |ker| '|Si|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 65))
                                                  (SPADCALL 2 (QREFELT $ 66))
                                                  (QREFELT $ 42)))
                                                ((OR
                                                  (SPADCALL |ker| '|Ci|
                                                            (QREFELT $ 26))
                                                  (OR
                                                   (SPADCALL |ker| '|airyAi|
                                                             (QREFELT $ 26))
                                                   (SPADCALL |ker|
                                                             '|airyAiPrime|
                                                             (QREFELT $ 26))))
                                                 (|spadConstant| $ 8))
                                                ('T
                                                 (|error|
                                                  "Finite but unknown value at infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 43))))))
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
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (|spadConstant| $ 57)
                                                  (QREFELT $ 68)))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 26))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 26))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 26))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       26)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 65))
                                                   (SPADCALL 2 (QREFELT $ 66))
                                                   (QREFELT $ 42))
                                                  (QREFELT $ 68)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 26))
                                                 (SPADCALL (QREFELT $ 65)))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 65))
                                                   (SPADCALL 2 (QREFELT $ 66))
                                                   (QREFELT $ 42))
                                                  (QREFELT $ 68)))
                                                ((SPADCALL |ker| '|acsc|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 65))
                                                  (QREFELT $ 68)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsch|
                                                            (QREFELT $ 26))
                                                  (SPADCALL |ker| '|acoth|
                                                            (QREFELT $ 26)))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 26))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 26)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 65))
                                                    (SPADCALL 8 (QREFELT $ 66))
                                                    (QREFELT $ 42))
                                                   (QREFELT $ 67))
                                                  (QREFELT $ 68)))
                                                ((SPADCALL |ker| '|Si|
                                                           (QREFELT $ 26))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 65))
                                                   (SPADCALL 2 (QREFELT $ 66))
                                                   (QREFELT $ 42))
                                                  (QREFELT $ 68)))
                                                ((OR
                                                  (SPADCALL |ker| '|airyAi|
                                                            (QREFELT $ 26))
                                                  (SPADCALL |ker| '|airyBi|
                                                            (QREFELT $ 26)))
                                                 (|spadConstant| $ 8))
                                                ('T
                                                 (|error|
                                                  "Finite but unknown value at minus infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 43))))))
                                       ((|LIMITPS;knownValueAtMinusInfinity?|
                                         |ker| $)
                                        (COND
                                         ((SPADCALL |ker| '|exp|
                                                    (QREFELT $ 26))
                                          (CONS 0
                                                (SPADCALL (|spadConstant| $ 8)
                                                          (QREFELT $ 43))))
                                         ((SPADCALL |ker| '|sinh|
                                                    (QREFELT $ 26))
                                          (CONS 0 |lim|))
                                         ((SPADCALL |ker| '|cosh|
                                                    (QREFELT $ 26))
                                          (CONS 0 (SPADCALL (QREFELT $ 69))))
                                         (#4#
                                          (|error|
                                           "knownValueAtMinusInfinity? true but value unknown"))))
                                       (#4# (CONS 1 "failed"))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;logOnlyLimit| (|coef| |x| $)
  (PROG (|cc| |eq| |vv|)
    (RETURN
     (SEQ (LETT |vv| (SPADCALL (QREFELT $ 49)) . #1=(|LIMITPS;logOnlyLimit|))
          (LETT |eq|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 60))
                 (SPADCALL
                  (SPADCALL (SPADCALL |vv| (QREFELT $ 50)) (QREFELT $ 29))
                  (QREFELT $ 68))
                 (QREFELT $ 52))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |cc| (SPADCALL |coef| |eq| (QREFELT $ 54)) . #1#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (CONS 1 "failed"))
            ('T (|LIMITPS;limitPlus| |cc| |vv| $)))))))) 

(DEFUN |LIMITPS;locallimit| (|fcn| |x| |a| $)
  (PROG (|u| |n| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70))
            . #1=(|LIMITPS;locallimit|))
      (LETT |n| (SPADCALL |a| (QREFELT $ 32)) . #1#)
      (EXIT
       (COND
        ((|eql_SI| |n| 0)
         (|LIMITPS;realLimit|
          (|LIMITPS;localsubst| |fcn| |xK| 1 (SPADCALL |a| (QREFELT $ 62)) $)
          |x| $))
        (#2='T
         (SEQ
          (LETT |u|
                (|LIMITPS;limitPlus|
                 (SPADCALL |fcn| |xK|
                           (SPADCALL |n|
                                     (SPADCALL (SPADCALL |xK| (QREFELT $ 18))
                                               (QREFELT $ 29))
                                     (QREFELT $ 71))
                           (QREFELT $ 41))
                 |x| $)
                . #1#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 2 "failed"))
                 (#2# (CONS 0 (QCDR |u|))))))))))))) 

(DEFUN |LIMITPS;localsubst| (|fcn| |k| |n| |a| $)
  (SEQ
   (COND
    ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 21))
     (COND ((EQL |n| 1) (EXIT |fcn|)))))
   (EXIT
    (SPADCALL |fcn| |k|
              (SPADCALL
               (SPADCALL |n| (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 71)) |a|
               (QREFELT $ 72))
              (QREFELT $ 41))))) 

(DEFUN |LIMITPS;locallimitcomplex| (|fcn| |x| |a| $)
  (PROG (|g| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70))
            . #1=(|LIMITPS;locallimitcomplex|))
      (LETT |g| (SPADCALL |a| (QREFELT $ 74)) . #1#)
      (EXIT
       (COND
        ((QEQCAR |g| 0)
         (|LIMITPS;complLimit| (|LIMITPS;localsubst| |fcn| |xK| 1 (QCDR |g|) $)
          |x| $))
        ('T
         (|LIMITPS;complLimit|
          (SPADCALL |fcn| |xK|
                    (SPADCALL (SPADCALL |xK| (QREFELT $ 18)) (QREFELT $ 29))
                    (QREFELT $ 41))
          |x| $)))))))) 

(DEFUN |LIMITPS;limit2| (|fcn| |eq| |str| |do_lim| $)
  (PROG (|a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 75)) (QREFELT $ 77))
            . #1=(|LIMITPS;limit2|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "limit:left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 78)) . #1#)
              (EXIT (SPADCALL |fcn| |x| |a| |str| |do_lim|)))))))))) 

(DEFUN |LIMITPS;limit3| (|fcn| |x| |a| |str| $)
  (PROG (|xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70))
            |LIMITPS;limit3|)
      (EXIT
       (|LIMITPS;limitPlus|
        (|LIMITPS;localsubst| |fcn| |xK| (SPADCALL |str| (QREFELT $ 81)) |a| $)
        |x| $)))))) 

(DEFUN |LIMITPS;limit;FEESU;22| (|fcn| |eq| |str| $)
  (PROG ()
    (RETURN
     (|LIMITPS;limit2| |fcn| |eq| |str|
      (CONS #'|LIMITPS;limit;FEESU;22!0| (VECTOR |str| |eq| |fcn| $)) $)))) 

(DEFUN |LIMITPS;limit;FEESU;22!0| (|f| |x| |a| |s| $$)
  (PROG ($ |fcn| |eq| |str|)
    (LETT $ (QREFELT $$ 3) . #1=(|LIMITPS;limit;FEESU;22|))
    (LETT |fcn| (QREFELT $$ 2) . #1#)
    (LETT |eq| (QREFELT $$ 1) . #1#)
    (LETT |str| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((|LIMITPS;is_exp_log| |f| |x| $)
        (SPADCALL |fcn| |eq| |str| (QREFELT $ 86)))
       ('T (|LIMITPS;limit3| |f| |x| |a| |s| $))))))) 

(DEFUN |LIMITPS;limit;FEESU;23| (|fcn| |eq| |str| $)
  (|LIMITPS;limit2| |fcn| |eq| |str| (CONS (|function| |LIMITPS;limit3|) $) $)) 

(DEFUN |LIMITPS;limit;FEESU;24| (|fcn| |eq| |str| $)
  (|LIMITPS;limit2| |fcn| |eq| |str| (CONS (|function| |LIMITPS;limit3|) $) $)) 

(DEFUN |LIMITPS;anyRootsOrAtrigs?| (|fcn| $)
  (PROG (#1=#:G474 #2=#:G481 #3=#:G482 |kernel|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |kernel| NIL . #4=(|LIMITPS;anyRootsOrAtrigs?|))
             (LETT #3# (SPADCALL |fcn| (QREFELT $ 11)) . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |kernel| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (SPADCALL |kernel| '|nthRoot| (QREFELT $ 26))
                     (OR (SPADCALL |kernel| '|asin| (QREFELT $ 26))
                         (OR (SPADCALL |kernel| '|acos| (QREFELT $ 26))
                             (SPADCALL |kernel| '|asec| (QREFELT $ 26)))))
                 (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |kernel| '|acsc| (QREFELT $ 26))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |LIMITPS;complLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G509 |uls| |lseries| |lpack| |upxs| |pseries|
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
                               (SPADCALL (ELT $ 45) |upxs|
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
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 89))) . #2#)
                           (GO #1#)))
                         (#8#
                          (SPADCALL |upxs| (|spadConstant| $ 91)
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
                               (SPADCALL (ELT $ 45) |uls|
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
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 89))) . #2#)
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
                        (LETT |answer| (SPADCALL |lim| (QREFELT $ 45)) . #2#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (|error| "limit: can't evaluate limit"))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 92))))))
          (#8# (CONS 0 (SPADCALL |lim| (QREFELT $ 92))))))))
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
         (LETT |s| (SPADCALL |coef| (QREFELT $ 95)) . #1=(|LIMITPS;poleLimit|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (SEQ
             (LETT |rtLim|
                   (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 69))
                             (QREFELT $ 96))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |order| (QREFELT $ 97)) (QREFELT $ 98))
                (CONS 0 |rtLim|))
               ((SPADCALL (SPADCALL |order| (QREFELT $ 99)) (QREFELT $ 98))
                (CONS 1 (CONS (CONS 1 "failed") (CONS 0 |rtLim|))))
               (#2='T
                (CONS 1
                      (CONS (CONS 0 (SPADCALL |rtLim| (QREFELT $ 100)))
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
         (LETT |s| (SPADCALL |coef| (QREFELT $ 95))
               . #1=(|LIMITPS;poleLimitPlus|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (CONS 0
                  (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 69))
                            (QREFELT $ 96))))
           (#2='T (CONS 1 "failed"))))))
       ('T
        (SEQ (LETT |clim| (|LIMITPS;specialLimit| |coef| |x| $) . #1#)
             (EXIT
              (COND ((QEQCAR |clim| 1) (CONS 1 "failed"))
                    ((SPADCALL (LETT |lim| (QCDR |clim|) . #1#)
                               (QREFELT $ 101))
                     (SEQ
                      (LETT |cclim|
                            (|LIMITPS;specialLimit|
                             (SPADCALL |coef| (QREFELT $ 29)) |x| $)
                            . #1#)
                      (EXIT
                       (COND ((QEQCAR |cclim| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (QCDR |cclim|) (QREFELT $ 32))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((ZEROP |ss|)
                                  (|error| "limit: internal error"))
                                 (#2#
                                  (CONS 0
                                        (SPADCALL |ss|
                                                  (SPADCALL (QREFELT $ 69))
                                                  (QREFELT $ 96))))))))))))
                    (#2#
                     (SEQ (LETT |t| (SPADCALL |lim| (QREFELT $ 32)) . #1#)
                          (EXIT
                           (COND
                            ((ZEROP |t|)
                             (SEQ
                              (LETT |tt| (SPADCALL |coef| (QREFELT $ 95))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |tt| 0)
                                 (CONS 0
                                       (SPADCALL (QCDR |tt|)
                                                 (SPADCALL (QREFELT $ 69))
                                                 (QREFELT $ 96))))
                                (#2# (CONS 1 "failed"))))))
                            (#2#
                             (CONS 0
                                   (SPADCALL |t| (SPADCALL (QREFELT $ 69))
                                             (QREFELT $ 96))))))))))))))))) 

(DEFUN |LIMITPS;realLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G578 |cl| |ordl| |uls| |right| |left| |fcn0| |xK|
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
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 102))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          18))
                                                       (QREFELT $ 68))
                                                      (QREFELT $ 41))
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
                                               (QREFELT $ 103))
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
                               (SPADCALL (ELT $ 45) |upxs|
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
                                (SPADCALL |upxs| (|spadConstant| $ 91)
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
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 102))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          18))
                                                       (QREFELT $ 68))
                                                      (QREFELT $ 41))
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
                                               (QREFELT $ 103))
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
                               (SPADCALL (ELT $ 45) |uls|
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
                                    (SPADCALL |ordl| (QREFELT $ 104)) |cl| |x|
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
                                   (SPADCALL (QCDR |lim|) (QREFELT $ 45))
                                   . #2#)
                             (QREFELT $ 23))
                            (QREFELT $ 24))
                  (|error| "limit: can't evaluate limit"))
                 (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 43))))))
               (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 43))))))))
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
  (PROG (|xLim| |answer| |lim| #1=#:G617 |cl| |ordl| |uls| |pp| |ff| |trouble|
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
                               (SPADCALL (ELT $ 45) |upxs|
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
                                (SPADCALL |upxs| (|spadConstant| $ 91)
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
                               (SPADCALL (ELT $ 45) |uls|
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
                                    (SPADCALL |ordl| (QREFELT $ 104)) |cl| |x|
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
                        (LETT |answer| (SPADCALL (QCDR |lim|) (QREFELT $ 45))
                              . #2#)
                        (QREFELT $ 23))
                       (QREFELT $ 24))
             (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |answer| |x| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |answer| |x| $))
                    (#8# |xLim|)))))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 43))))))
          (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 43))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;limit1| (|fcn| |eq| |do_lim| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 106)) (QREFELT $ 40))
            . #1=(|LIMITPS;limit1|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 77)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 107)) . #1#)
                      (EXIT (SPADCALL |fcn| |x| |a| |do_lim|)))))))))))))) 

(DEFUN |LIMITPS;limit;FEEU;34| (|fcn| |eq| $)
  (PROG ()
    (RETURN
     (|LIMITPS;limit1| |fcn| |eq|
      (CONS #'|LIMITPS;limit;FEEU;34!0| (VECTOR |eq| |fcn| $)) $)))) 

(DEFUN |LIMITPS;limit;FEEU;34!0| (|f| |x| |a| $$)
  (PROG ($ |fcn| |eq|)
    (LETT $ (QREFELT $$ 2) . #1=(|LIMITPS;limit;FEEU;34|))
    (LETT |fcn| (QREFELT $$ 1) . #1#)
    (LETT |eq| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((|LIMITPS;is_exp_log| |f| |x| $) (SPADCALL |fcn| |eq| (QREFELT $ 111)))
       ('T (|LIMITPS;locallimit| |f| |x| |a| $))))))) 

(DEFUN |LIMITPS;limit;FEEU;35| (|fcn| |eq| $)
  (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $) $)) 

(DEFUN |LIMITPS;limit;FEEU;36| (|fcn| |eq| $)
  (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $) $)) 

(DEFUN |LIMITPS;complexLimit;FEEU;37| (|fcn| |eq| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 116)) (QREFELT $ 74))
            . #1=(|LIMITPS;complexLimit;FEEU;37|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 77)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 117)) . #1#)
                      (EXIT
                       (|LIMITPS;locallimitcomplex| |fcn| |x| |a|
                        $)))))))))))))) 

(DECLAIM (NOTINLINE |PowerSeriesLimitPackage;|)) 

(DEFUN |PowerSeriesLimitPackage| (&REST #1=#:G665)
  (PROG ()
    (RETURN
     (PROG (#2=#:G666)
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
      (LETT $ (GETREFV 120) . #1#)
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
          (QSETREFV $ 88
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;22|) $)))
         ('T
          (QSETREFV $ 88
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;23|) $)))))
       ('T
        (QSETREFV $ 88
                  (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;24|) $))))
      (COND
       ((|domainEqual| |#1| (|Integer|))
        (COND
         ((|domainEqual| |#2| (|Expression| (|Integer|)))
          (QSETREFV $ 114
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;34|) $)))
         ('T
          (QSETREFV $ 114
                    (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;35|) $)))))
       ('T
        (QSETREFV $ 114
                  (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;36|) $))))
      $)))) 

(MAKEPROP '|PowerSeriesLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) '|zeroFE| (|List| 17) (4 . |tower|)
              (|BasicOperator|) (|Kernel| 7) (9 . |operator|) (|Symbol|)
              (14 . |name|) (|Kernel| $) (19 . |coerce|) (24 . |differentiate|)
              (|Boolean|) (30 . =) (|List| 15) (36 . |variables|)
              (41 . |member?|) (47 . |kernels|) (52 . |is?|) (58 . |name|)
              (63 . -) (69 . |inv|) (|SingleInteger|) (|OrderedCompletion| 7)
              (74 . |whatInfinity|) (79 . |Zero|) (83 . |One|)
              (87 . |numerator|) (92 . |denominator|) (|Integer|) (97 . ~=)
              (|Union| 7 '"failed") (103 . |retractIfCan|) (108 . |eval|)
              (115 . /) (121 . |coerce|)
              (|ElementaryFunctionStructurePackage| 6 7) (126 . |normalize|)
              (131 . ~=) (|NonNegativeInteger|) (137 . ~=) (143 . |new|)
              (147 . |coerce|) (|Equation| 7) (152 . |equation|) (|Equation| $)
              (158 . |eval|) (|List| 7) (164 . |argument|) (169 . |One|)
              (173 . -) (178 . |minusInfinity|) (182 . |log|) (187 . |elt|)
              (193 . |retract|) (|LiouvillianFunction| 6 7) (198 . |erf|)
              (203 . |pi|) (207 . |coerce|) (212 . |sqrt|) (217 . -)
              (222 . |plusInfinity|) (226 . |retract|) (231 . *) (237 . +)
              (|OnePointCompletion| 7) (243 . |retractIfCan|) (248 . |lhs|)
              (|Union| 15 '"failed") (253 . |retractIfCan|) (258 . |rhs|)
              (|String|) (|ToolsForSign| 6) (263 . |direction|)
              (|Union| (|OrderedCompletion| 83) '"failed") (|Expression| 37)
              (|Equation| 83) (|MrvLimitPackage|) (268 . |mrv_limit|)
              (|Union| 31 '"failed") (275 . |limit|) (282 . |infinity|)
              (|Fraction| 37) (286 . |Zero|) (290 . |coerce|)
              (|Union| 37 '"failed") (|ElementaryFunctionSign| 6 7)
              (295 . |sign|) (300 . *) (306 . |numer|) (311 . |even?|)
              (316 . |denom|) (321 . -) (326 . |zero?|) (331 . |kernel|)
              (336 . =) (342 . |coerce|) (|Equation| 31) (347 . |lhs|)
              (352 . |rhs|)
              (|Record| (|:| |leftHandLimit| 82) (|:| |rightHandLimit| 82))
              (|Union| (|OrderedCompletion| 83) 108 '"failed")
              (|Equation| (|OrderedCompletion| 83)) (357 . |mrv_limit|)
              (|Record| (|:| |leftHandLimit| 87) (|:| |rightHandLimit| 87))
              (|Union| 31 112 '"failed") (363 . |limit|) (|Equation| 73)
              (369 . |lhs|) (374 . |rhs|) (|Union| 73 '"failed")
              |LIMITPS;complexLimit;FEEU;37|)
           '#(|limit| 379 |complexLimit| 392) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 119
                                                 '(0 7 0 8 1 7 10 0 11 1 13 12
                                                   0 14 1 12 15 0 16 1 7 0 17
                                                   18 2 7 0 0 15 19 2 7 20 0 0
                                                   21 1 7 22 0 23 2 22 20 15 0
                                                   24 1 7 10 0 25 2 13 20 0 15
                                                   26 1 13 15 0 27 2 7 0 0 0 28
                                                   1 7 0 0 29 1 31 30 0 32 0 6
                                                   0 33 0 6 0 34 1 7 0 0 35 1 7
                                                   0 0 36 2 37 20 0 0 38 1 31
                                                   39 0 40 3 7 0 0 17 0 41 2 7
                                                   0 0 0 42 1 31 0 7 43 1 44 7
                                                   7 45 2 7 20 0 0 46 2 47 20 0
                                                   0 48 0 15 0 49 1 7 0 15 50 2
                                                   51 0 7 7 52 2 7 0 0 53 54 1
                                                   13 55 0 56 0 7 0 57 1 6 0 0
                                                   58 0 31 0 59 1 7 0 0 60 2 7
                                                   0 12 0 61 1 31 7 0 62 1 63 7
                                                   7 64 0 7 0 65 1 7 0 37 66 1
                                                   7 0 0 67 1 7 0 0 68 0 31 0
                                                   69 1 7 17 0 70 2 7 0 37 0 71
                                                   2 7 0 0 0 72 1 73 39 0 74 1
                                                   51 7 0 75 1 7 76 0 77 1 51 7
                                                   0 78 1 80 37 79 81 3 85 82
                                                   83 84 79 86 3 0 87 7 51 79
                                                   88 0 73 0 89 0 90 0 91 1 73
                                                   0 7 92 1 94 93 7 95 2 31 0
                                                   37 0 96 1 90 37 0 97 1 37 20
                                                   0 98 1 90 37 0 99 1 31 0 0
                                                   100 1 31 20 0 101 1 13 0 15
                                                   102 2 31 20 0 0 103 1 90 0
                                                   37 104 1 105 31 0 106 1 105
                                                   31 0 107 2 85 109 83 110 111
                                                   2 0 113 7 105 114 1 115 73 0
                                                   116 1 115 73 0 117 2 0 113 7
                                                   105 114 3 0 87 7 51 79 88 2
                                                   0 118 7 115 119)))))
           '|lookupComplete|)) 
