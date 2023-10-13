
(/VERSIONCHECK 2) 

(DEFUN |LIMITPS;noX?| (|fcn| |x| $)
  (COND ((SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 11)) (QREFELT $ 14)) 'NIL)
        ('T 'T))) 

(DEFUN |LIMITPS;constant?| (|fcn| $) (NULL (SPADCALL |fcn| (QREFELT $ 11)))) 

(DEFUN |LIMITPS;firstNonLogPtr| (|fcn| |x| $)
  (PROG (|list| #1=#:G240 |ker|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |list| (SPADCALL |fcn| (QREFELT $ 16))
              . #2=(|LIMITPS;firstNonLogPtr|))
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT |ker| (|SPADfirst| |list|) . #2#)
                  (COND
                   ((NULL (SPADCALL |ker| '|log| (QREFELT $ 18)))
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (SPADCALL |ker| (QREFELT $ 20))
                                          (QREFELT $ 11))
                                (QREFELT $ 14))
                      (COND
                       ((NULL (EQUAL |x| (SPADCALL |ker| (QREFELT $ 21))))
                        (EXIT (PROGN (LETT #1# |list| . #2#) (GO #1#)))))))))
                  (EXIT (LETT |list| (CDR |list|) . #2#)))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;finiteValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|erf| (QREFELT $ 18))
        (OR (SPADCALL |ker| '|sech| (QREFELT $ 18))
            (OR (SPADCALL |ker| '|csch| (QREFELT $ 18))
                (OR (SPADCALL |ker| '|tanh| (QREFELT $ 18))
                    (OR (SPADCALL |ker| '|coth| (QREFELT $ 18))
                        (OR (SPADCALL |ker| '|atan| (QREFELT $ 18))
                            (OR (SPADCALL |ker| '|acot| (QREFELT $ 18))
                                (OR (SPADCALL |ker| '|asec| (QREFELT $ 18))
                                    (OR (SPADCALL |ker| '|acsc| (QREFELT $ 18))
                                        (OR
                                         (SPADCALL |ker| '|acsch|
                                                   (QREFELT $ 18))
                                         (OR
                                          (SPADCALL |ker| '|acoth|
                                                    (QREFELT $ 18))
                                          (OR
                                           (SPADCALL |ker| '|fresnelS|
                                                     (QREFELT $ 18))
                                           (SPADCALL |ker| '|fresnelC|
                                                     (QREFELT $
                                                              18))))))))))))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;knownValueAtInfinity?| (|ker| $)
  (COND
   ((OR (SPADCALL |ker| '|exp| (QREFELT $ 18))
        (OR (SPADCALL |ker| '|sinh| (QREFELT $ 18))
            (SPADCALL |ker| '|cosh| (QREFELT $ 18))))
    'T)
   ('T 'NIL))) 

(DEFUN |LIMITPS;leftOrRight| (|fcn| |x| |limVal| $)
  (PROG (|inf| |val| |value|)
    (RETURN
     (SEQ
      (LETT |value|
            (|LIMITPS;limitPlus|
             (SPADCALL (SPADCALL |fcn| |limVal| (QREFELT $ 22)) (QREFELT $ 23))
             |x| $)
            . #1=(|LIMITPS;leftOrRight|))
      (EXIT
       (COND ((QEQCAR |value| 1) 0)
             (#2='T
              (SEQ
               (LETT |inf|
                     (SPADCALL (LETT |val| (QCDR |value|) . #1#)
                               (QREFELT $ 26))
                     . #1#)
               (EXIT
                (COND
                 ((|eql_SI| |inf| 0) (|error| "limit package: internal error"))
                 (#2# |inf|))))))))))) 

(DEFUN |LIMITPS;specialLimit| (|fcn| |x| $)
  (PROG (#1=#:G279 |den| |num| |finVal| |valu| |val| |fval| #2=#:G282 |k|
         |xkers| #3=#:G281 #4=#:G280)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xkers|
              (PROGN
               (LETT #4# NIL . #5=(|LIMITPS;specialLimit|))
               (SEQ (LETT |k| NIL . #5#)
                    (LETT #3# (SPADCALL |fcn| (QREFELT $ 16)) . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |x|
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 20))
                                            (QREFELT $ 11))
                                  (QREFELT $ 14))
                        (LETT #4# (CONS |k| #4#) . #5#)))))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #5#)
        (EXIT
         (COND ((EQL (LENGTH |xkers|) 1) (|LIMITPS;specialLimit1| |fcn| |x| $))
               ('T
                (SEQ (LETT |num| (SPADCALL |fcn| (QREFELT $ 29)) . #5#)
                     (LETT |den| (SPADCALL |fcn| (QREFELT $ 30)) . #5#)
                     (SEQ (LETT |k| NIL . #5#) (LETT #2# |xkers| . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |k| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |fval|
                                 (|LIMITPS;limitPlus|
                                  (SPADCALL |k| (QREFELT $ 20)) |x| $)
                                 . #5#)
                           (EXIT
                            (COND
                             ((OR (QEQCAR |fval| 1)
                                  (SPADCALL
                                   (SPADCALL (LETT |val| (QCDR |fval|) . #5#)
                                             (QREFELT $ 26))
                                   0 (QREFELT $ 32)))
                              (PROGN
                               (LETT #1#
                                     (|LIMITPS;specialLimitNormalize| |fcn| |x|
                                      $)
                                     . #5#)
                               (GO #1#)))
                             ('T
                              (SEQ
                               (LETT |valu| (SPADCALL |val| (QREFELT $ 34))
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
                                                       (QREFELT $ 35))
                                             . #5#)
                                       (LETT |den|
                                             (SPADCALL |den| |k| |finVal|
                                                       (QREFELT $ 35))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |den| (|spadConstant| $ 8)
                                                    (QREFELT $ 36))
                                          (PROGN
                                           (LETT #1#
                                                 (|LIMITPS;specialLimitNormalize|
                                                  |fcn| |x| $)
                                                 . #5#)
                                           (GO #1#))))))))))))))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (CONS 0
                            (SPADCALL (SPADCALL |num| |den| (QREFELT $ 37))
                                      (QREFELT $ 38))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;specialLimitNormalize| (|fcn| |x| $)
  (PROG (|lim| |limm| |limVal| |expKerLim| |cc| |eq| |vv| |fval| |expKer|
         |expKers| #1=#:G306 |k| #2=#:G305 |xkers| #3=#:G304 #4=#:G303 |nfcn|)
    (RETURN
     (SEQ
      (LETT |nfcn| (SPADCALL |fcn| (QREFELT $ 40))
            . #5=(|LIMITPS;specialLimitNormalize|))
      (EXIT
       (COND
        ((SPADCALL |fcn| |nfcn| (QREFELT $ 41))
         (|LIMITPS;limitPlus| |nfcn| |x| $))
        (#6='T
         (SEQ
          (LETT |xkers|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |k| NIL . #5#)
                      (LETT #3# (SPADCALL |fcn| (QREFELT $ 42)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 20))
                                              (QREFELT $ 11))
                                    (QREFELT $ 14))
                          (LETT #4# (CONS |k| #4#) . #5#)))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |xkers|) 2 (QREFELT $ 44)) (CONS 1 "failed"))
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
                             ((SPADCALL |k| '|exp| (QREFELT $ 18))
                              (LETT #2# (CONS |k| #2#) . #5#)))))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT
               (COND
                ((SPADCALL (LENGTH |expKers|) 1 (QREFELT $ 44))
                 (CONS 1 "failed"))
                (#6#
                 (SEQ (LETT |expKer| (|SPADfirst| |expKers|) . #5#)
                      (LETT |fval|
                            (|LIMITPS;limitPlus|
                             (SPADCALL |expKer| (QREFELT $ 20)) |x| $)
                            . #5#)
                      (EXIT
                       (COND ((QEQCAR |fval| 1) (CONS 1 "failed"))
                             (#6#
                              (SEQ (LETT |vv| (SPADCALL (QREFELT $ 45)) . #5#)
                                   (LETT |eq|
                                         (SPADCALL
                                          (SPADCALL |expKer| (QREFELT $ 20))
                                          (SPADCALL |vv| (QREFELT $ 46))
                                          (QREFELT $ 48))
                                         . #5#)
                                   (LETT |cc|
                                         (SPADCALL |fcn| |eq| (QREFELT $ 50))
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
                                                           (QREFELT $ 34))
                                                 . #5#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |lim| 1)
                                              (CONS 1 "failed"))
                                             (#6#
                                              (|LIMITPS;limitPlus| (QCDR |lim|)
                                               |x| $)))))))))))))))))))))))))))) 

(DEFUN |LIMITPS;specialLimit1| (|fcn| |x| $)
  (PROG (|limVal| |argLim| |lim| |cc| |eq| |vv| |ker| |xkers| #1=#:G322 |k|
         #2=#:G321)
    (RETURN
     (SEQ
      (LETT |xkers|
            (PROGN
             (LETT #2# NIL . #3=(|LIMITPS;specialLimit1|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 16)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 20))
                                          (QREFELT $ 11))
                                (QREFELT $ 14))
                      (LETT #2# (CONS |k| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((SPADCALL (LENGTH |xkers|) 1 (QREFELT $ 44)) (CONS 1 "failed"))
             (#4='T
              (SEQ (LETT |ker| (|SPADfirst| |xkers|) . #3#)
                   (LETT |vv| (SPADCALL (QREFELT $ 45)) . #3#)
                   (LETT |eq|
                         (SPADCALL (SPADCALL |ker| (QREFELT $ 20))
                                   (SPADCALL |vv| (QREFELT $ 46))
                                   (QREFELT $ 48))
                         . #3#)
                   (LETT |cc| (SPADCALL |fcn| |eq| (QREFELT $ 50)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |x| (SPADCALL |cc| (QREFELT $ 11))
                                (QREFELT $ 14))
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
         #1=#:G382 |li| #2=#:G328)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |ker| '|log| (QREFELT $ 18))
         (SEQ
          (LETT |args| (SPADCALL |ker| (QREFELT $ 52))
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
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 26))
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
                                                                        $ 34))
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
                                                                            36))
                                                         (COND
                                                          ((|eql_SI|
                                                            (|LIMITPS;leftOrRight|
                                                             |arg| |x|
                                                             (|spadConstant| $
                                                                             8)
                                                             $)
                                                            1)
                                                           (SPADCALL
                                                            (QREFELT $ 55)))
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
                                                                             56))
                                                          (QREFELT $
                                                                   38)))))))))
                                        . #3#))))))))))))))
        (#4#
         (SEQ (LETT |args| (SPADCALL |ker| (QREFELT $ 52)) . #3#)
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
                                          (SPADCALL |ker| (QREFELT $ 58))
                                          (SPADCALL
                                           (LETT |var|
                                                 (SPADCALL (QREFELT $ 45))
                                                 . #3#)
                                           (QREFELT $ 46))
                                          (QREFELT $ 59))
                                         . #3#)
                                   (LETT |inf| (SPADCALL |lim| (QREFELT $ 26))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |inf| 0)
                                      (COND
                                       ((SPADCALL |ker| '|erf| (QREFELT $ 18))
                                        (CONS 0
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lim| (QREFELT $ 60))
                                                (QREFELT $ 62))
                                               (QREFELT $ 38))))
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
                                       ((|LIMITPS;finiteValueAtInfinity?| |ker|
                                         $)
                                        (SEQ
                                         (LETT |val|
                                               (COND
                                                ((SPADCALL |ker| '|erf|
                                                           (QREFELT $ 18))
                                                 (|spadConstant| $ 53))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 18))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 18))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 18))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       18)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 63))
                                                  (SPADCALL 2 (QREFELT $ 64))
                                                  (QREFELT $ 37)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 18))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 63))
                                                  (SPADCALL 2 (QREFELT $ 64))
                                                  (QREFELT $ 37)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsc|
                                                            (QREFELT $ 18))
                                                  (OR
                                                   (SPADCALL |ker| '|acsch|
                                                             (QREFELT $ 18))
                                                   (SPADCALL |ker| '|acoth|
                                                             (QREFELT $ 18))))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 18))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 18)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 63))
                                                   (SPADCALL 8 (QREFELT $ 64))
                                                   (QREFELT $ 37))
                                                  (QREFELT $ 65)))
                                                ('T
                                                 (|error|
                                                  "finiteValueAtInfinity? true, but unknown value at infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 38))))))
                                       ((|LIMITPS;knownValueAtInfinity?| |ker|
                                         $)
                                        (CONS 0 |lim|))
                                       (#4# (CONS 1 "failed"))))
                                     (#4#
                                      (COND
                                       ((|LIMITPS;finiteValueAtInfinity?| |ker|
                                         $)
                                        (SEQ
                                         (LETT |val|
                                               (COND
                                                ((SPADCALL |ker| '|erf|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (|spadConstant| $ 53)
                                                  (QREFELT $ 66)))
                                                ((OR
                                                  (SPADCALL |ker| '|sech|
                                                            (QREFELT $ 18))
                                                  (OR
                                                   (SPADCALL |ker| '|csch|
                                                             (QREFELT $ 18))
                                                   (OR
                                                    (SPADCALL |ker| '|tanh|
                                                              (QREFELT $ 18))
                                                    (SPADCALL |ker| '|coth|
                                                              (QREFELT $
                                                                       18)))))
                                                 (|spadConstant| $ 8))
                                                ((SPADCALL |ker| '|atan|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 63))
                                                   (SPADCALL 2 (QREFELT $ 64))
                                                   (QREFELT $ 37))
                                                  (QREFELT $ 66)))
                                                ((SPADCALL |ker| '|acot|
                                                           (QREFELT $ 18))
                                                 (SPADCALL (QREFELT $ 63)))
                                                ((SPADCALL |ker| '|asec|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 63))
                                                   (SPADCALL 2 (QREFELT $ 64))
                                                   (QREFELT $ 37))
                                                  (QREFELT $ 66)))
                                                ((SPADCALL |ker| '|acsc|
                                                           (QREFELT $ 18))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 63))
                                                  (QREFELT $ 66)))
                                                ((OR
                                                  (SPADCALL |ker| '|acsch|
                                                            (QREFELT $ 18))
                                                  (SPADCALL |ker| '|acoth|
                                                            (QREFELT $ 18)))
                                                 (|spadConstant| $ 8))
                                                ((OR
                                                  (SPADCALL |ker| '|fresnelS|
                                                            (QREFELT $ 18))
                                                  (SPADCALL |ker| '|fresnelC|
                                                            (QREFELT $ 18)))
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 63))
                                                    (SPADCALL 8 (QREFELT $ 64))
                                                    (QREFELT $ 37))
                                                   (QREFELT $ 65))
                                                  (QREFELT $ 66)))
                                                ('T
                                                 (|error|
                                                  "finiteValueAtInfinity? true, but unknown value at -infinity")))
                                               . #3#)
                                         (EXIT
                                          (CONS 0
                                                (SPADCALL |val|
                                                          (QREFELT $ 38))))))
                                       ((|LIMITPS;knownValueAtInfinity?| |ker|
                                         $)
                                        (COND
                                         ((SPADCALL |ker| '|exp|
                                                    (QREFELT $ 18))
                                          (CONS 0
                                                (SPADCALL (|spadConstant| $ 8)
                                                          (QREFELT $ 38))))
                                         ((SPADCALL |ker| '|sinh|
                                                    (QREFELT $ 18))
                                          (CONS 0 |lim|))
                                         ((SPADCALL |ker| '|cosh|
                                                    (QREFELT $ 18))
                                          (CONS 0 (SPADCALL (QREFELT $ 67))))
                                         (#4# (CONS 1 "failed"))))
                                       (#4# (CONS 1 "failed"))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;logOnlyLimit| (|coef| |x| $)
  (PROG (|cc| |eq| |vv|)
    (RETURN
     (SEQ (LETT |vv| (SPADCALL (QREFELT $ 45)) . #1=(|LIMITPS;logOnlyLimit|))
          (LETT |eq|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 46)) (QREFELT $ 56))
                 (SPADCALL
                  (SPADCALL (SPADCALL |vv| (QREFELT $ 46)) (QREFELT $ 23))
                  (QREFELT $ 66))
                 (QREFELT $ 48))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |cc| (SPADCALL |coef| |eq| (QREFELT $ 50)) . #1#)
                        (QREFELT $ 11))
                       (QREFELT $ 14))
             (CONS 1 "failed"))
            ('T (|LIMITPS;limitPlus| |cc| |vv| $)))))))) 

(DEFUN |LIMITPS;locallimit| (|fcn| |x| |a| $)
  (PROG (|u| |n| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 46)) (QREFELT $ 68))
            . #1=(|LIMITPS;locallimit|))
      (LETT |n| (SPADCALL |a| (QREFELT $ 26)) . #1#)
      (EXIT
       (COND
        ((|eql_SI| |n| 0)
         (|LIMITPS;realLimit|
          (|LIMITPS;localsubst| |fcn| |xK| 1 (SPADCALL |a| (QREFELT $ 60)) $)
          |x| $))
        (#2='T
         (SEQ
          (LETT |u|
                (|LIMITPS;limitPlus|
                 (SPADCALL |fcn| |xK|
                           (SPADCALL |n|
                                     (SPADCALL (SPADCALL |xK| (QREFELT $ 20))
                                               (QREFELT $ 23))
                                     (QREFELT $ 69))
                           (QREFELT $ 35))
                 |x| $)
                . #1#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 2 "failed"))
                 (#2# (CONS 0 (QCDR |u|))))))))))))) 

(DEFUN |LIMITPS;localsubst| (|fcn| |k| |n| |a| $)
  (SEQ
   (COND
    ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 36))
     (COND ((EQL |n| 1) (EXIT |fcn|)))))
   (EXIT
    (SPADCALL |fcn| |k|
              (SPADCALL
               (SPADCALL |n| (SPADCALL |k| (QREFELT $ 20)) (QREFELT $ 69)) |a|
               (QREFELT $ 70))
              (QREFELT $ 35))))) 

(DEFUN |LIMITPS;locallimitcomplex| (|fcn| |x| |a| $)
  (PROG (|g| |xK|)
    (RETURN
     (SEQ
      (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 46)) (QREFELT $ 68))
            . #1=(|LIMITPS;locallimitcomplex|))
      (LETT |g| (SPADCALL |a| (QREFELT $ 72)) . #1#)
      (EXIT
       (COND
        ((QEQCAR |g| 0)
         (|LIMITPS;complLimit| (|LIMITPS;localsubst| |fcn| |xK| 1 (QCDR |g|) $)
          |x| $))
        ('T
         (|LIMITPS;complLimit|
          (SPADCALL |fcn| |xK|
                    (SPADCALL (SPADCALL |xK| (QREFELT $ 20)) (QREFELT $ 23))
                    (QREFELT $ 35))
          |x| $)))))))) 

(DEFUN |LIMITPS;limit;FEESU;15| (|fcn| |eq| |str| $)
  (PROG (|xK| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 73)) (QREFELT $ 75))
            . #1=(|LIMITPS;limit;FEESU;15|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "limit:left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 76)) . #1#)
              (LETT |xK|
                    (SPADCALL (SPADCALL |x| (QREFELT $ 46)) (QREFELT $ 68))
                    . #1#)
              (EXIT
               (|LIMITPS;limitPlus|
                (|LIMITPS;localsubst| |fcn| |xK|
                 (SPADCALL |str| (QREFELT $ 79)) |a| $)
                |x| $)))))))))) 

(DEFUN |LIMITPS;anyRootsOrAtrigs?| (|fcn| $)
  (PROG (#1=#:G421 #2=#:G428 #3=#:G429 |kernel|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |kernel| NIL . #4=(|LIMITPS;anyRootsOrAtrigs?|))
             (LETT #3# (SPADCALL |fcn| (QREFELT $ 42)) . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |kernel| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR (SPADCALL |kernel| '|nthRoot| (QREFELT $ 18))
                     (OR (SPADCALL |kernel| '|asin| (QREFELT $ 18))
                         (OR (SPADCALL |kernel| '|acos| (QREFELT $ 18))
                             (SPADCALL |kernel| '|asec| (QREFELT $ 18)))))
                 (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |kernel| '|acsc| (QREFELT $ 18))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |LIMITPS;complLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G456 |uls| |lseries| |lpack| |upxs| |pseries|
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
                               (SPADCALL (ELT $ 40) |upxs|
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
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 82))) . #2#)
                           (GO #1#)))
                         (#8#
                          (SPADCALL |upxs| (|spadConstant| $ 84)
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
                               (SPADCALL (ELT $ 40) |uls|
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
                           (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 82))) . #2#)
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
          ((SPADCALL |x| (SPADCALL |lim| (QREFELT $ 11)) (QREFELT $ 14))
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |answer| (SPADCALL |lim| (QREFELT $ 40)) . #2#)
                        (QREFELT $ 11))
                       (QREFELT $ 14))
             (|error| "limit: can't evaluate limit"))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 85))))))
          (#8# (CONS 0 (SPADCALL |lim| (QREFELT $ 85))))))))
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
       ((NULL (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 11)) (QREFELT $ 14)))
        (SEQ
         (LETT |s| (SPADCALL |coef| (QREFELT $ 88)) . #1=(|LIMITPS;poleLimit|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (SEQ
             (LETT |rtLim|
                   (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 67))
                             (QREFELT $ 89))
                   . #1#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |order| (QREFELT $ 90)) (QREFELT $ 91))
                (CONS 0 |rtLim|))
               ((SPADCALL (SPADCALL |order| (QREFELT $ 92)) (QREFELT $ 91))
                (CONS 1 (CONS (CONS 1 "failed") (CONS 0 |rtLim|))))
               (#2='T
                (CONS 1
                      (CONS (CONS 0 (SPADCALL |rtLim| (QREFELT $ 93)))
                            (CONS 0 |rtLim|))))))))
           (#2# (CONS 2 "failed"))))))
       ('T (|error| "limit: can't evaluate limit"))))))) 

(DEFUN |LIMITPS;poleLimitPlus| (|order| |coef| |x| $)
  (PROG (|tt| |t| |ss| |cclim| |lim| |clim| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 11)) (QREFELT $ 14)))
        (SEQ
         (LETT |s| (SPADCALL |coef| (QREFELT $ 88))
               . #1=(|LIMITPS;poleLimitPlus|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (CONS 0
                  (SPADCALL (QCDR |s|) (SPADCALL (QREFELT $ 67))
                            (QREFELT $ 89))))
           (#2='T (CONS 1 "failed"))))))
       ('T
        (SEQ (LETT |clim| (|LIMITPS;specialLimit| |coef| |x| $) . #1#)
             (EXIT
              (COND ((QEQCAR |clim| 1) (CONS 1 "failed"))
                    ((SPADCALL (LETT |lim| (QCDR |clim|) . #1#) (QREFELT $ 94))
                     (SEQ
                      (LETT |cclim|
                            (|LIMITPS;specialLimit|
                             (SPADCALL |coef| (QREFELT $ 23)) |x| $)
                            . #1#)
                      (EXIT
                       (COND ((QEQCAR |cclim| 1) (CONS 1 "failed"))
                             (#2#
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (QCDR |cclim|) (QREFELT $ 26))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((ZEROP |ss|)
                                  (|error| "limit: internal error"))
                                 (#2#
                                  (CONS 0
                                        (SPADCALL |ss|
                                                  (SPADCALL (QREFELT $ 67))
                                                  (QREFELT $ 89))))))))))))
                    (#2#
                     (SEQ (LETT |t| (SPADCALL |lim| (QREFELT $ 26)) . #1#)
                          (EXIT
                           (COND
                            ((ZEROP |t|)
                             (SEQ
                              (LETT |tt| (SPADCALL |coef| (QREFELT $ 88))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |tt| 0)
                                 (CONS 0
                                       (SPADCALL (QCDR |tt|)
                                                 (SPADCALL (QREFELT $ 67))
                                                 (QREFELT $ 89))))
                                (#2# (CONS 1 "failed"))))))
                            (#2#
                             (CONS 0
                                   (SPADCALL |t| (SPADCALL (QREFELT $ 67))
                                             (QREFELT $ 89))))))))))))))))) 

(DEFUN |LIMITPS;realLimit| (|fcn| |x| $)
  (PROG (|answer| |lim| #1=#:G534 |cl| |ordl| |uls| |right| |left| |fcn0| |xK|
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
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 95))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          20))
                                                       (QREFELT $ 66))
                                                      (QREFELT $ 35))
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
                                               (QREFELT $ 96))
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
                               (SPADCALL (ELT $ 40) |upxs|
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
                                (SPADCALL |upxs| (|spadConstant| $ 84)
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
                                      (LETT |xK| (SPADCALL |x| (QREFELT $ 95))
                                            . #2#)
                                      (LETT |fcn0|
                                            (SPADCALL |fcn| |xK|
                                                      (SPADCALL
                                                       (SPADCALL |xK|
                                                                 (QREFELT $
                                                                          20))
                                                       (QREFELT $ 66))
                                                      (QREFELT $ 35))
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
                                               (QREFELT $ 96))
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
                               (SPADCALL (ELT $ 40) |uls|
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
                                    (SPADCALL |ordl| (QREFELT $ 97)) |cl| |x|
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
               ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 11))
                          (QREFELT $ 14))
                (COND
                 ((SPADCALL |x|
                            (SPADCALL
                             (LETT |answer|
                                   (SPADCALL (QCDR |lim|) (QREFELT $ 40))
                                   . #2#)
                             (QREFELT $ 11))
                            (QREFELT $ 14))
                  (|error| "limit: can't evaluate limit"))
                 (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 38))))))
               (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 38))))))))
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
  (PROG (|xLim| |answer| |lim| #1=#:G579 |cl| |ordl| |uls| |pp| |ff| |trouble|
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
                               (SPADCALL (ELT $ 40) |upxs|
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
                                (SPADCALL |upxs| (|spadConstant| $ 84)
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
                               (SPADCALL (ELT $ 40) |uls|
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
                                    (SPADCALL |ordl| (QREFELT $ 97)) |cl| |x|
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
          ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 11)) (QREFELT $ 14))
           (COND
            ((SPADCALL |x|
                       (SPADCALL
                        (LETT |answer| (SPADCALL (QCDR |lim|) (QREFELT $ 40))
                              . #2#)
                        (QREFELT $ 11))
                       (QREFELT $ 14))
             (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |answer| |x| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |answer| |x| $))
                    (#8# |xLim|)))))
            (#8# (CONS 0 (SPADCALL |answer| (QREFELT $ 38))))))
          (#8# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 38))))))))
      #1# (EXIT #1#))))) 

(DEFUN |LIMITPS;limit;FEEU;24| (|fcn| |eq| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 99)) (QREFELT $ 34))
            . #1=(|LIMITPS;limit;FEEU;24|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 75)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 100)) . #1#)
                      (EXIT (|LIMITPS;locallimit| |fcn| |x| |a| $)))))))))))))) 

(DEFUN |LIMITPS;complexLimit;FEEU;25| (|fcn| |eq| $)
  (PROG (|a| |x| |xx| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 105)) (QREFELT $ 72))
            . #1=(|LIMITPS;complexLimit;FEEU;25|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 75)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |x| (QCDR |xx|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 106)) . #1#)
                      (EXIT
                       (|LIMITPS;locallimitcomplex| |fcn| |x| |a|
                        $)))))))))))))) 

(DEFUN |PowerSeriesLimitPackage| (&REST #1=#:G616)
  (PROG ()
    (RETURN
     (PROG (#2=#:G617)
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
      (LETT $ (GETREFV 109) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PowerSeriesLimitPackage|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|spadConstant| $ 8))
      $)))) 

(MAKEPROP '|PowerSeriesLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) '|zeroFE| (|List| 13) (4 . |variables|) (|Boolean|)
              (|Symbol|) (9 . |member?|) (|List| 19) (15 . |kernels|)
              (|Kernel| 7) (20 . |is?|) (|Kernel| $) (26 . |coerce|)
              (31 . |name|) (36 . -) (42 . |inv|) (|SingleInteger|)
              (|OrderedCompletion| 7) (47 . |whatInfinity|) (52 . |Zero|)
              (56 . |One|) (60 . |numerator|) (65 . |denominator|) (|Integer|)
              (70 . ~=) (|Union| 7 '"failed") (76 . |retractIfCan|)
              (81 . |eval|) (88 . =) (94 . /) (100 . |coerce|)
              (|ElementaryFunctionStructurePackage| 6 7) (105 . |normalize|)
              (110 . ~=) (116 . |tower|) (|NonNegativeInteger|) (121 . ~=)
              (127 . |new|) (131 . |coerce|) (|Equation| 7) (136 . |equation|)
              (|Equation| $) (142 . |eval|) (|List| 7) (148 . |argument|)
              (153 . |One|) (157 . -) (162 . |minusInfinity|) (166 . |log|)
              (|BasicOperator|) (171 . |operator|) (176 . |elt|)
              (182 . |retract|) (|LiouvillianFunction| 6 7) (187 . |erf|)
              (192 . |pi|) (196 . |coerce|) (201 . |sqrt|) (206 . -)
              (211 . |plusInfinity|) (215 . |retract|) (220 . *) (226 . +)
              (|OnePointCompletion| 7) (232 . |retractIfCan|) (237 . |lhs|)
              (|Union| 13 '"failed") (242 . |retractIfCan|) (247 . |rhs|)
              (|String|) (|ToolsForSign| 6) (252 . |direction|)
              (|Union| 25 '"failed") |LIMITPS;limit;FEESU;15|
              (257 . |infinity|) (|Fraction| 31) (261 . |Zero|)
              (265 . |coerce|) (|Union| 31 '"failed")
              (|ElementaryFunctionSign| 6 7) (270 . |sign|) (275 . *)
              (281 . |numer|) (286 . |even?|) (291 . |denom|) (296 . -)
              (301 . |zero?|) (306 . |kernel|) (311 . =) (317 . |coerce|)
              (|Equation| 25) (322 . |lhs|) (327 . |rhs|)
              (|Record| (|:| |leftHandLimit| 80) (|:| |rightHandLimit| 80))
              (|Union| 25 101 '"failed") |LIMITPS;limit;FEEU;24|
              (|Equation| 71) (332 . |lhs|) (337 . |rhs|)
              (|Union| 71 '"failed") |LIMITPS;complexLimit;FEEU;25|)
           '#(|limit| 342 |complexLimit| 355) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 108
                                                 '(0 7 0 8 1 7 10 0 11 2 10 12
                                                   13 0 14 1 7 15 0 16 2 17 12
                                                   0 13 18 1 7 0 19 20 1 17 13
                                                   0 21 2 7 0 0 0 22 1 7 0 0 23
                                                   1 25 24 0 26 0 6 0 27 0 6 0
                                                   28 1 7 0 0 29 1 7 0 0 30 2
                                                   31 12 0 0 32 1 25 33 0 34 3
                                                   7 0 0 19 0 35 2 7 12 0 0 36
                                                   2 7 0 0 0 37 1 25 0 7 38 1
                                                   39 7 7 40 2 7 12 0 0 41 1 7
                                                   15 0 42 2 43 12 0 0 44 0 13
                                                   0 45 1 7 0 13 46 2 47 0 7 7
                                                   48 2 7 0 0 49 50 1 17 51 0
                                                   52 0 7 0 53 1 6 0 0 54 0 25
                                                   0 55 1 7 0 0 56 1 17 57 0 58
                                                   2 7 0 57 0 59 1 25 7 0 60 1
                                                   61 7 7 62 0 7 0 63 1 7 0 31
                                                   64 1 7 0 0 65 1 7 0 0 66 0
                                                   25 0 67 1 7 19 0 68 2 7 0 31
                                                   0 69 2 7 0 0 0 70 1 71 33 0
                                                   72 1 47 7 0 73 1 7 74 0 75 1
                                                   47 7 0 76 1 78 31 77 79 0 71
                                                   0 82 0 83 0 84 1 71 0 7 85 1
                                                   87 86 7 88 2 25 0 31 0 89 1
                                                   83 31 0 90 1 31 12 0 91 1 83
                                                   31 0 92 1 25 0 0 93 1 25 12
                                                   0 94 1 17 0 13 95 2 25 12 0
                                                   0 96 1 83 0 31 97 1 98 25 0
                                                   99 1 98 25 0 100 1 104 71 0
                                                   105 1 104 71 0 106 2 0 102 7
                                                   98 103 3 0 80 7 47 77 81 2 0
                                                   107 7 104 108)))))
           '|lookupComplete|)) 
