
(SDEFUN |LIMITPS;is_exp_log| ((|fcn| FE) (|x| |Symbol|) ($ |Boolean|))
        (SPROG ((#1=#:G284 NIL) (|nm| (|Symbol|)) (#2=#:G285 NIL) (|k| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |k| NIL)
                       (LETT #2# (SPADCALL |fcn| (QREFELT $ 11))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |nm|
                              (SPADCALL (SPADCALL |k| (QREFELT $ 14))
                                        (QREFELT $ 16)))
                        (COND
                         ((OR (EQUAL |nm| |x|)
                              (OR (EQUAL |nm| '|log|)
                                  (OR (EQUAL |nm| '|exp|)
                                      (OR (EQUAL |nm| '|%power|)
                                          (OR (EQUAL |nm| '|nthRoot|)
                                              (OR (EQUAL |nm| '|cosh|)
                                                  (OR (EQUAL |nm| '|coth|)
                                                      (OR (EQUAL |nm| '|sinh|)
                                                          (OR
                                                           (EQUAL |nm| '|tanh|)
                                                           (OR
                                                            (EQUAL |nm|
                                                                   '|sech|)
                                                            (OR
                                                             (EQUAL |nm|
                                                                    '|csch|)
                                                             (OR
                                                              (EQUAL |nm|
                                                                     '|acosh|)
                                                              (OR
                                                               (EQUAL |nm|
                                                                      '|acoth|)
                                                               (OR
                                                                (EQUAL |nm|
                                                                       '|asinh|)
                                                                (OR
                                                                 (EQUAL |nm|
                                                                        '|atanh|)
                                                                 (OR
                                                                  (EQUAL |nm|
                                                                         '|asech|)
                                                                  (OR
                                                                   (EQUAL |nm|
                                                                          '|acsch|)
                                                                   (OR
                                                                    (EQUAL |nm|
                                                                           '|Ei|)
                                                                    (OR
                                                                     (EQUAL
                                                                      |nm|
                                                                      '|erf|)
                                                                     (OR
                                                                      (EQUAL
                                                                       |nm|
                                                                       '|erfi|)
                                                                      (OR
                                                                       (EQUAL
                                                                        |nm|
                                                                        '|li|)
                                                                       (OR
                                                                        (EQUAL
                                                                         |nm|
                                                                         '|Gamma|)
                                                                        (EQUAL
                                                                         |nm|
                                                                         '|digamma|)))))))))))))))))))))))
                          (EXIT "iterate")))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |k| (QREFELT $ 18)) |x|
                                      (QREFELT $ 19))
                            (|spadConstant| $ 8) (QREFELT $ 21))
                           "iterate")
                          ('T (PROGN (LETT #1# NIL) (GO #3=#:G283))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LIMITPS;noX?| ((|fcn| FE) (|x| |Symbol|) ($ |Boolean|))
        (NULL (SPADCALL |x| (SPADCALL |fcn| (QREFELT $ 23)) (QREFELT $ 24)))) 

(SDEFUN |LIMITPS;constant?| ((|fcn| FE) ($ |Boolean|))
        (NULL (SPADCALL |fcn| (QREFELT $ 23)))) 

(SDEFUN |LIMITPS;firstNonLogPtr|
        ((|fcn| FE) (|x| |Symbol|) ($ |List| (|Kernel| FE)))
        (SPROG
         ((|list| (|List| (|Kernel| FE))) (#1=#:G297 NIL)
          (|ker| (|Kernel| FE)))
         (SEQ
          (EXIT
           (SEQ (LETT |list| (SPADCALL |fcn| (QREFELT $ 25)))
                (SEQ G190 (COND ((NULL (NULL (NULL |list|))) (GO G191)))
                     (SEQ (LETT |ker| (|SPADfirst| |list|))
                          (COND
                           ((NULL (SPADCALL |ker| '|log| (QREFELT $ 26)))
                            (COND
                             ((SPADCALL |x|
                                        (SPADCALL
                                         (SPADCALL |ker| (QREFELT $ 18))
                                         (QREFELT $ 23))
                                        (QREFELT $ 24))
                              (COND
                               ((NULL
                                 (EQUAL |x| (SPADCALL |ker| (QREFELT $ 27))))
                                (EXIT
                                 (PROGN
                                  (LETT #1# |list|)
                                  (GO #2=#:G296)))))))))
                          (EXIT (LETT |list| (CDR |list|))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #2# (EXIT #1#)))) 

(SDEFUN |LIMITPS;finiteValueAtInfinity?| ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |ker| '|erf| (QREFELT $ 26))
              (OR (SPADCALL |ker| '|sech| (QREFELT $ 26))
                  (OR (SPADCALL |ker| '|csch| (QREFELT $ 26))
                      (OR (SPADCALL |ker| '|tanh| (QREFELT $ 26))
                          (OR (SPADCALL |ker| '|coth| (QREFELT $ 26))
                              (OR (SPADCALL |ker| '|atan| (QREFELT $ 26))
                                  (OR (SPADCALL |ker| '|acot| (QREFELT $ 26))
                                      (OR
                                       (SPADCALL |ker| '|asec| (QREFELT $ 26))
                                       (OR
                                        (SPADCALL |ker| '|acsc| (QREFELT $ 26))
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
         ('T NIL))) 

(SDEFUN |LIMITPS;finiteValueAtPlusInfinity?|
        ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND
         ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
              (OR (SPADCALL |ker| '|Ci| (QREFELT $ 26))
                  (SPADCALL |ker| '|airyAiPrime| (QREFELT $ 26))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;finiteValueAtMinusInfinity?|
        ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND
         ((OR (|LIMITPS;finiteValueAtInfinity?| |ker| $)
              (SPADCALL |ker| '|airyBi| (QREFELT $ 26)))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtInfinity?| ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |ker| '|exp| (QREFELT $ 26))
              (OR (SPADCALL |ker| '|sinh| (QREFELT $ 26))
                  (OR (SPADCALL |ker| '|cosh| (QREFELT $ 26))
                      (SPADCALL |ker| '|Shi| (QREFELT $ 26)))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtPlusInfinity?| ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND
         ((OR (|LIMITPS;knownValueAtInfinity?| |ker| $)
              (OR (SPADCALL |ker| '|airyBi| (QREFELT $ 26))
                  (OR (SPADCALL |ker| '|airyBiPrime| (QREFELT $ 26))
                      (SPADCALL |ker| '|Chi| (QREFELT $ 26)))))
          'T)
         ('T NIL))) 

(SDEFUN |LIMITPS;knownValueAtMinusInfinity?|
        ((|ker| |Kernel| FE) ($ |Boolean|))
        (COND ((|LIMITPS;knownValueAtInfinity?| |ker| $) 'T) ('T NIL))) 

(SDEFUN |LIMITPS;leftOrRight|
        ((|fcn| FE) (|x| |Symbol|) (|limVal| FE) ($ |SingleInteger|))
        (SPROG
         ((|inf| (|SingleInteger|)) (|val| (|OrderedCompletion| FE))
          (|value| (|Union| (|OrderedCompletion| FE) "failed")))
         (SEQ
          (LETT |value|
                (|LIMITPS;limitPlus|
                 (SPADCALL (SPADCALL |fcn| |limVal| (QREFELT $ 28))
                           (QREFELT $ 29))
                 |x| $))
          (EXIT
           (COND ((QEQCAR |value| 1) 0)
                 (#1='T
                  (SEQ
                   (LETT |inf|
                         (SPADCALL (LETT |val| (QCDR |value|)) (QREFELT $ 32)))
                   (EXIT
                    (COND
                     ((|eql_SI| |inf| 0)
                      (|error| "limit package: internal error"))
                     (#1# |inf|)))))))))) 

(SDEFUN |LIMITPS;specialLimit|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((#2=#:G354 NIL) (|den| (FE)) (|num| (FE)) (|finVal| (FE))
          (|valu| (|Union| FE "failed")) (|val| (|OrderedCompletion| FE))
          (|fval| (|Union| (|OrderedCompletion| FE) #1#)) (#3=#:G357 NIL)
          (|k| NIL) (|xkers| (|List| (|Kernel| FE))) (#4=#:G356 NIL)
          (#5=#:G355 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xkers|
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |k| NIL)
                        (LETT #4# (SPADCALL |fcn| (QREFELT $ 25))) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |x|
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                                (QREFELT $ 23))
                                      (QREFELT $ 24))
                            (LETT #5# (CONS |k| #5#))))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #5#)))))
            (EXIT
             (COND
              ((EQL (LENGTH |xkers|) 1) (|LIMITPS;specialLimit1| |fcn| |x| $))
              ('T
               (SEQ (LETT |num| (SPADCALL |fcn| (QREFELT $ 35)))
                    (LETT |den| (SPADCALL |fcn| (QREFELT $ 36)))
                    (SEQ (LETT |k| NIL) (LETT #3# |xkers|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |fval|
                                (|LIMITPS;limitPlus|
                                 (SPADCALL |k| (QREFELT $ 18)) |x| $))
                          (EXIT
                           (COND
                            ((OR (QEQCAR |fval| 1)
                                 (SPADCALL
                                  (SPADCALL (LETT |val| (QCDR |fval|))
                                            (QREFELT $ 32))
                                  0 (QREFELT $ 38)))
                             (PROGN
                              (LETT #2#
                                    (|LIMITPS;specialLimitNormalize| |fcn| |x|
                                     $))
                              (GO #6=#:G353)))
                            ('T
                             (SEQ (LETT |valu| (SPADCALL |val| (QREFELT $ 40)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |valu| 1)
                                     (PROGN
                                      (LETT #2#
                                            (|LIMITPS;specialLimitNormalize|
                                             |fcn| |x| $))
                                      (GO #6#)))
                                    ('T
                                     (SEQ (LETT |finVal| (QCDR |valu|))
                                          (LETT |num|
                                                (SPADCALL |num| |k| |finVal|
                                                          (QREFELT $ 41)))
                                          (LETT |den|
                                                (SPADCALL |den| |k| |finVal|
                                                          (QREFELT $ 41)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |den|
                                                       (|spadConstant| $ 8)
                                                       (QREFELT $ 21))
                                             (PROGN
                                              (LETT #2#
                                                    (|LIMITPS;specialLimitNormalize|
                                                     |fcn| |x| $))
                                              (GO #6#))))))))))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |num| |den| (QREFELT $ 42))
                                     (QREFELT $ 43))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |LIMITPS;specialLimitNormalize|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((|lim| (|Union| FE "failed")) (|limm| (|OrderedCompletion| FE))
          (|limVal|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed"))
          (|expKerLim| (|OrderedCompletion| FE)) (|cc| (FE))
          (|eq| (|Equation| FE)) (|vv| (|Symbol|))
          (|fval| (|Union| (|OrderedCompletion| FE) #1#))
          (|expKer| (|Kernel| FE)) (|expKers| (|List| #2=(|Kernel| FE)))
          (#3=#:G381 NIL) (|k| NIL) (#4=#:G380 NIL) (|xkers| (|List| #2#))
          (#5=#:G379 NIL) (#6=#:G378 NIL) (|nfcn| (FE)))
         (SEQ (LETT |nfcn| (SPADCALL |fcn| (QREFELT $ 45)))
              (EXIT
               (COND
                ((SPADCALL |fcn| |nfcn| (QREFELT $ 46))
                 (|LIMITPS;limitPlus| |nfcn| |x| $))
                (#7='T
                 (SEQ
                  (LETT |xkers|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |k| NIL)
                              (LETT #5# (SPADCALL |fcn| (QREFELT $ 11))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL |k| (QREFELT $ 18))
                                             (QREFELT $ 23))
                                            (QREFELT $ 24))
                                  (LETT #6# (CONS |k| #6#))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191
                              (EXIT (NREVERSE #6#)))))
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |xkers|) 2 (QREFELT $ 48))
                     (CONS 1 "failed"))
                    (#7#
                     (SEQ
                      (LETT |expKers|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |k| NIL) (LETT #3# |xkers|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |k| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |k| '|exp| (QREFELT $ 26))
                                      (LETT #4# (CONS |k| #4#))))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |expKers|) 1 (QREFELT $ 48))
                         (CONS 1 "failed"))
                        (#7#
                         (SEQ (LETT |expKer| (|SPADfirst| |expKers|))
                              (LETT |fval|
                                    (|LIMITPS;limitPlus|
                                     (SPADCALL |expKer| (QREFELT $ 18)) |x| $))
                              (EXIT
                               (COND ((QEQCAR |fval| 1) (CONS 1 "failed"))
                                     (#7#
                                      (SEQ
                                       (LETT |vv| (SPADCALL (QREFELT $ 49)))
                                       (LETT |eq|
                                             (SPADCALL
                                              (SPADCALL |expKer|
                                                        (QREFELT $ 18))
                                              (SPADCALL |vv| (QREFELT $ 50))
                                              (QREFELT $ 52)))
                                       (LETT |cc|
                                             (SPADCALL |fcn| |eq|
                                                       (QREFELT $ 54)))
                                       (LETT |expKerLim| (QCDR |fval|))
                                       (LETT |limVal|
                                             (|LIMITPS;locallimit| |cc| |vv|
                                              |expKerLim| $))
                                       (EXIT
                                        (COND
                                         ((OR (QEQCAR |limVal| 2)
                                              (NULL (QEQCAR |limVal| 0)))
                                          (CONS 1 "failed"))
                                         ('T
                                          (SEQ (LETT |limm| (QCDR |limVal|))
                                               (LETT |lim|
                                                     (SPADCALL |limm|
                                                               (QREFELT $ 40)))
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |lim| 1)
                                                  (CONS 1 "failed"))
                                                 (#7#
                                                  (|LIMITPS;limitPlus|
                                                   (QCDR |lim|) |x|
                                                   $))))))))))))))))))))))))))) 

(SDEFUN |LIMITPS;specialLimit1|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((|limVal|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed"))
          (|argLim| (|OrderedCompletion| FE))
          (|lim| (|Union| (|OrderedCompletion| FE) #1#)) (|cc| (FE))
          (|eq| (|Equation| FE)) (|vv| (|Symbol|)) (|ker| (|Kernel| FE))
          (|xkers| (|List| (|Kernel| FE))) (#2=#:G397 NIL) (|k| NIL)
          (#3=#:G396 NIL))
         (SEQ
          (LETT |xkers|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |k| NIL) (LETT #2# (SPADCALL |fcn| (QREFELT $ 25)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 18))
                                              (QREFELT $ 23))
                                    (QREFELT $ 24))
                          (LETT #3# (CONS |k| #3#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |xkers|) 1 (QREFELT $ 48)) (CONS 1 "failed"))
            (#4='T
             (SEQ (LETT |ker| (|SPADfirst| |xkers|))
                  (LETT |vv| (SPADCALL (QREFELT $ 49)))
                  (LETT |eq|
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 18))
                                  (SPADCALL |vv| (QREFELT $ 50))
                                  (QREFELT $ 52)))
                  (LETT |cc| (SPADCALL |fcn| |eq| (QREFELT $ 54)))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (SPADCALL |cc| (QREFELT $ 23))
                               (QREFELT $ 24))
                     (CONS 1 "failed"))
                    (#4#
                     (SEQ
                      (LETT |lim| (|LIMITPS;specialLimitKernel| |ker| |x| $))
                      (EXIT
                       (COND ((QEQCAR |lim| 1) |lim|)
                             (#4#
                              (SEQ (LETT |argLim| (QCDR |lim|))
                                   (LETT |limVal|
                                         (|LIMITPS;locallimit| |cc| |vv|
                                          |argLim| $))
                                   (EXIT
                                    (COND
                                     ((OR (QEQCAR |limVal| 2)
                                          (NULL (QEQCAR |limVal| 0)))
                                      (CONS 1 "failed"))
                                     ('T
                                      (CONS 0 (QCDR |limVal|)))))))))))))))))))) 

(SDEFUN |LIMITPS;specialLimitKernel|
        ((|ker| |Kernel| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((|val| (FE))
          (|kerValue|
           (|Union| (|OrderedCompletion| FE)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| FE) #1#)))
                    "failed"))
          (|inf| (|SingleInteger|)) (|f| (FE)) (|var| (|Symbol|))
          (|lim| (|OrderedCompletion| FE))
          (|limm| (|Union| (|OrderedCompletion| FE) #1#)) (|arg| (FE))
          (|args| (|List| FE)) (|argLim| (|OrderedCompletion| FE))
          (#2=#:G465 NIL) (|li| (FE)) (#3=#:G403 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |ker| '|log| (QREFELT $ 26))
             (SEQ (LETT |args| (SPADCALL |ker| (QREFELT $ 56)))
                  (EXIT
                   (COND
                    ((OR (NULL |args|) (NULL (NULL (CDR |args|))))
                     (CONS 1 "failed"))
                    ('T
                     (SEQ (LETT |arg| (|SPADfirst| |args|))
                          (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| $))
                          (EXIT
                           (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                                 (#4='T
                                  (SEQ (LETT |lim| (QCDR |limm|))
                                       (EXIT
                                        (COND
                                         ((|eql_SI|
                                           (LETT |inf|
                                                 (SPADCALL |lim|
                                                           (QREFELT $ 32)))
                                           -1)
                                          (CONS 1 "failed"))
                                         (#4#
                                          (LETT |argLim|
                                                (CONS 0
                                                      (COND
                                                       ((|eql_SI| |inf| 1)
                                                        |lim|)
                                                       (#4#
                                                        (SEQ
                                                         (LETT |li|
                                                               (PROG2
                                                                   (LETT #3#
                                                                         (SPADCALL
                                                                          |lim|
                                                                          (QREFELT
                                                                           $
                                                                           40)))
                                                                   (QCDR #3#)
                                                                 (|check_union2|
                                                                  (QEQCAR #3#
                                                                          0)
                                                                  (QREFELT $ 7)
                                                                  (|Union|
                                                                   (QREFELT $
                                                                            7)
                                                                   "failed")
                                                                  #3#)))
                                                         (EXIT
                                                          (COND
                                                           ((SPADCALL |li|
                                                                      (|spadConstant|
                                                                       $ 8)
                                                                      (QREFELT
                                                                       $ 21))
                                                            (COND
                                                             ((|eql_SI|
                                                               (|LIMITPS;leftOrRight|
                                                                |arg| |x|
                                                                (|spadConstant|
                                                                 $ 8)
                                                                $)
                                                               1)
                                                              (SPADCALL
                                                               (QREFELT $ 59)))
                                                             (#4#
                                                              (PROGN
                                                               (LETT #2#
                                                                     (CONS 1
                                                                           "failed"))
                                                               (GO
                                                                #5=#:G464)))))
                                                           (#4#
                                                            (SPADCALL
                                                             (SPADCALL |li|
                                                                       (QREFELT
                                                                        $ 60))
                                                             (QREFELT $
                                                                      43)))))))))))))))))))))))
            (#4#
             (SEQ (LETT |args| (SPADCALL |ker| (QREFELT $ 56)))
                  (EXIT
                   (COND
                    ((OR (NULL |args|) (NULL (NULL (CDR |args|))))
                     (CONS 1 "failed"))
                    ('T
                     (SEQ (LETT |arg| (|SPADfirst| |args|))
                          (LETT |limm| (|LIMITPS;limitPlus| |arg| |x| $))
                          (EXIT
                           (COND ((QEQCAR |limm| 1) (CONS 1 "failed"))
                                 (#4#
                                  (SEQ (LETT |lim| (QCDR |limm|))
                                       (LETT |f|
                                             (SPADCALL
                                              (SPADCALL |ker| (QREFELT $ 14))
                                              (SPADCALL
                                               (LETT |var|
                                                     (SPADCALL (QREFELT $ 49)))
                                               (QREFELT $ 50))
                                              (QREFELT $ 61)))
                                       (LETT |inf|
                                             (SPADCALL |lim| (QREFELT $ 32)))
                                       (EXIT
                                        (COND
                                         ((|eql_SI| |inf| 0)
                                          (COND
                                           ((SPADCALL |ker| '|erf|
                                                      (QREFELT $ 26))
                                            (CONS 0
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |lim|
                                                              (QREFELT $ 62))
                                                    (QREFELT $ 64))
                                                   (QREFELT $ 43))))
                                           (#4#
                                            (SEQ
                                             (LETT |kerValue|
                                                   (|LIMITPS;locallimit| |f|
                                                    |var| |lim| $))
                                             (EXIT
                                              (COND
                                               ((OR (QEQCAR |kerValue| 2)
                                                    (NULL
                                                     (QEQCAR |kerValue| 0)))
                                                (CONS 1 "failed"))
                                               ('T
                                                (CONS 0
                                                      (QCDR |kerValue|)))))))))
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
                                                                 (QREFELT $
                                                                          26))
                                                       (OR
                                                        (SPADCALL |ker| '|tanh|
                                                                  (QREFELT $
                                                                           26))
                                                        (SPADCALL |ker| '|coth|
                                                                  (QREFELT $
                                                                           26)))))
                                                     (|spadConstant| $ 8))
                                                    ((SPADCALL |ker| '|atan|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 65))
                                                      (SPADCALL 2
                                                                (QREFELT $ 66))
                                                      (QREFELT $ 42)))
                                                    ((SPADCALL |ker| '|acot|
                                                               (QREFELT $ 26))
                                                     (|spadConstant| $ 8))
                                                    ((SPADCALL |ker| '|asec|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 65))
                                                      (SPADCALL 2
                                                                (QREFELT $ 66))
                                                      (QREFELT $ 42)))
                                                    ((OR
                                                      (SPADCALL |ker| '|acsc|
                                                                (QREFELT $ 26))
                                                      (OR
                                                       (SPADCALL |ker| '|acsch|
                                                                 (QREFELT $
                                                                          26))
                                                       (SPADCALL |ker| '|acoth|
                                                                 (QREFELT $
                                                                          26))))
                                                     (|spadConstant| $ 8))
                                                    ((OR
                                                      (SPADCALL |ker|
                                                                '|fresnelS|
                                                                (QREFELT $ 26))
                                                      (SPADCALL |ker|
                                                                '|fresnelC|
                                                                (QREFELT $
                                                                         26)))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT $ 65))
                                                       (SPADCALL 8
                                                                 (QREFELT $
                                                                          66))
                                                       (QREFELT $ 42))
                                                      (QREFELT $ 67)))
                                                    ((SPADCALL |ker| '|Si|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 65))
                                                      (SPADCALL 2
                                                                (QREFELT $ 66))
                                                      (QREFELT $ 42)))
                                                    ((OR
                                                      (SPADCALL |ker| '|Ci|
                                                                (QREFELT $ 26))
                                                      (OR
                                                       (SPADCALL |ker|
                                                                 '|airyAi|
                                                                 (QREFELT $
                                                                          26))
                                                       (SPADCALL |ker|
                                                                 '|airyAiPrime|
                                                                 (QREFELT $
                                                                          26))))
                                                     (|spadConstant| $ 8))
                                                    ('T
                                                     (|error|
                                                      "Finite but unknown value at infinity"))))
                                             (EXIT
                                              (CONS 0
                                                    (SPADCALL |val|
                                                              (QREFELT $
                                                                       43))))))
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
                                                                 (QREFELT $
                                                                          26))
                                                       (OR
                                                        (SPADCALL |ker| '|tanh|
                                                                  (QREFELT $
                                                                           26))
                                                        (SPADCALL |ker| '|coth|
                                                                  (QREFELT $
                                                                           26)))))
                                                     (|spadConstant| $ 8))
                                                    ((SPADCALL |ker| '|atan|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT $ 65))
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          66))
                                                       (QREFELT $ 42))
                                                      (QREFELT $ 68)))
                                                    ((SPADCALL |ker| '|acot|
                                                               (QREFELT $ 26))
                                                     (SPADCALL (QREFELT $ 65)))
                                                    ((SPADCALL |ker| '|asec|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT $ 65))
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          66))
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
                                                                (QREFELT $
                                                                         26)))
                                                     (|spadConstant| $ 8))
                                                    ((OR
                                                      (SPADCALL |ker|
                                                                '|fresnelS|
                                                                (QREFELT $ 26))
                                                      (SPADCALL |ker|
                                                                '|fresnelC|
                                                                (QREFELT $
                                                                         26)))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 65))
                                                        (SPADCALL 8
                                                                  (QREFELT $
                                                                           66))
                                                        (QREFELT $ 42))
                                                       (QREFELT $ 67))
                                                      (QREFELT $ 68)))
                                                    ((SPADCALL |ker| '|Si|
                                                               (QREFELT $ 26))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (QREFELT $ 65))
                                                       (SPADCALL 2
                                                                 (QREFELT $
                                                                          66))
                                                       (QREFELT $ 42))
                                                      (QREFELT $ 68)))
                                                    ((OR
                                                      (SPADCALL |ker| '|airyAi|
                                                                (QREFELT $ 26))
                                                      (SPADCALL |ker| '|airyBi|
                                                                (QREFELT $
                                                                         26)))
                                                     (|spadConstant| $ 8))
                                                    ('T
                                                     (|error|
                                                      "Finite but unknown value at minus infinity"))))
                                             (EXIT
                                              (CONS 0
                                                    (SPADCALL |val|
                                                              (QREFELT $
                                                                       43))))))
                                           ((|LIMITPS;knownValueAtMinusInfinity?|
                                             |ker| $)
                                            (COND
                                             ((SPADCALL |ker| '|exp|
                                                        (QREFELT $ 26))
                                              (CONS 0
                                                    (SPADCALL
                                                     (|spadConstant| $ 8)
                                                     (QREFELT $ 43))))
                                             ((SPADCALL |ker| '|sinh|
                                                        (QREFELT $ 26))
                                              (CONS 0 |lim|))
                                             ((SPADCALL |ker| '|cosh|
                                                        (QREFELT $ 26))
                                              (CONS 0
                                                    (SPADCALL (QREFELT $ 69))))
                                             (#4#
                                              (|error|
                                               "knownValueAtMinusInfinity? true but value unknown"))))
                                           (#4#
                                            (CONS 1 "failed"))))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |LIMITPS;logOnlyLimit|
        ((|coef| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG ((|cc| (FE)) (|eq| (|Equation| FE)) (|vv| (|Symbol|)))
               (SEQ (LETT |vv| (SPADCALL (QREFELT $ 49)))
                    (LETT |eq|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                     (QREFELT $ 60))
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 50))
                                      (QREFELT $ 29))
                            (QREFELT $ 68))
                           (QREFELT $ 52)))
                    (EXIT
                     (COND
                      ((SPADCALL |x|
                                 (SPADCALL
                                  (LETT |cc|
                                        (SPADCALL |coef| |eq| (QREFELT $ 54)))
                                  (QREFELT $ 23))
                                 (QREFELT $ 24))
                       (CONS 1 "failed"))
                      ('T (|LIMITPS;limitPlus| |cc| |vv| $))))))) 

(SDEFUN |LIMITPS;locallimit|
        ((|fcn| FE) (|x| |Symbol|) (|a| |OrderedCompletion| FE)
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (SPROG
         ((|u| (|Union| (|OrderedCompletion| FE) #1#)) (|n| (|SingleInteger|))
          (|xK| (|Kernel| FE)))
         (SEQ
          (LETT |xK| (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70)))
          (LETT |n| (SPADCALL |a| (QREFELT $ 32)))
          (EXIT
           (COND
            ((|eql_SI| |n| 0)
             (|LIMITPS;realLimit|
              (|LIMITPS;localsubst| |fcn| |xK| 1 (SPADCALL |a| (QREFELT $ 62))
               $)
              |x| $))
            (#2='T
             (SEQ
              (LETT |u|
                    (|LIMITPS;limitPlus|
                     (SPADCALL |fcn| |xK|
                               (SPADCALL |n|
                                         (SPADCALL
                                          (SPADCALL |xK| (QREFELT $ 18))
                                          (QREFELT $ 29))
                                         (QREFELT $ 71))
                               (QREFELT $ 41))
                     |x| $))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 2 "failed"))
                     (#2# (CONS 0 (QCDR |u|)))))))))))) 

(SDEFUN |LIMITPS;localsubst|
        ((|fcn| FE) (|k| |Kernel| FE) (|n| |Integer|) (|a| FE) ($ FE))
        (SEQ
         (COND
          ((SPADCALL |a| (|spadConstant| $ 8) (QREFELT $ 21))
           (COND ((EQL |n| 1) (EXIT |fcn|)))))
         (EXIT
          (SPADCALL |fcn| |k|
                    (SPADCALL
                     (SPADCALL |n| (SPADCALL |k| (QREFELT $ 18))
                               (QREFELT $ 71))
                     |a| (QREFELT $ 72))
                    (QREFELT $ 41))))) 

(SDEFUN |LIMITPS;locallimitcomplex|
        ((|fcn| FE) (|x| |Symbol|) (|a| |OnePointCompletion| FE)
         ($ |Union| (|OnePointCompletion| FE) "failed"))
        (SPROG ((|g| (|Union| FE "failed")) (|xK| (|Kernel| FE)))
               (SEQ
                (LETT |xK|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70)))
                (LETT |g| (SPADCALL |a| (QREFELT $ 74)))
                (EXIT
                 (COND
                  ((QEQCAR |g| 0)
                   (|LIMITPS;complLimit|
                    (|LIMITPS;localsubst| |fcn| |xK| 1 (QCDR |g|) $) |x| $))
                  ('T
                   (|LIMITPS;complLimit|
                    (SPADCALL |fcn| |xK|
                              (SPADCALL (SPADCALL |xK| (QREFELT $ 18))
                                        (QREFELT $ 29))
                              (QREFELT $ 41))
                    |x| $))))))) 

(SDEFUN |LIMITPS;subst_in_result|
        ((|r| |Union| (|OrderedCompletion| FE) #1="failed") (|k| |Kernel| FE)
         (|f| FE) ($ |Union| (|OrderedCompletion| FE) #1#))
        (SPROG ((|ru| (|Union| FE "failed")))
               (SEQ
                (COND ((QEQCAR |r| 1) |r|)
                      (#2='T
                       (SEQ (LETT |ru| (SPADCALL (QCDR |r|) (QREFELT $ 40)))
                            (EXIT
                             (COND ((QEQCAR |ru| 1) |r|)
                                   (#2#
                                    (CONS 0
                                          (SPADCALL
                                           (SPADCALL (QCDR |ru|) (LIST |k|)
                                                     (LIST |f|) (QREFELT $ 76))
                                           (QREFELT $ 43)))))))))))) 

(SDEFUN |LIMITPS;limit2|
        ((|fcn| FE) (|eq| |Equation| FE) (|str| |String|)
         (|do_lim| |Mapping| (|Union| (|OrderedCompletion| FE) #1="failed") FE
          (|Symbol|) FE (|String|))
         ($ |Union| (|OrderedCompletion| FE) #1#))
        (SPROG
         ((|a1| (FE)) (|knx| (|Kernel| FE)) (|a| (FE)) (|x| (|Symbol|))
          (|xx| (|Union| (|Symbol|) "failed")))
         (SEQ
          (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 77)) (QREFELT $ 79)))
          (EXIT
           (COND
            ((QEQCAR |xx| 1)
             (|error| "limit:left hand side must be a variable"))
            (#2='T
             (SEQ (LETT |x| (QCDR |xx|))
                  (LETT |a| (SPADCALL |eq| (QREFELT $ 80)))
                  (EXIT
                   (COND
                    ((SPADCALL |x| (SPADCALL |a| (QREFELT $ 23))
                               (QREFELT $ 24))
                     (SEQ
                      (LETT |knx|
                            (SPADCALL (SPADCALL (QREFELT $ 49))
                                      (QREFELT $ 81)))
                      (LETT |a1|
                            (SPADCALL |a| (LIST (SPADCALL |x| (QREFELT $ 81)))
                                      (LIST (SPADCALL |knx| (QREFELT $ 18)))
                                      (QREFELT $ 76)))
                      (EXIT
                       (|LIMITPS;subst_in_result|
                        (SPADCALL |fcn| |x| |a1| |str| |do_lim|) |knx|
                        (SPADCALL |eq| (QREFELT $ 77)) $))))
                    (#2# (SPADCALL |fcn| |x| |a| |str| |do_lim|))))))))))) 

(SDEFUN |LIMITPS;limit3|
        ((|fcn| FE) (|x| |Symbol|) (|a| FE) (|str| |String|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG ((|xK| (|Kernel| FE)))
               (SEQ
                (LETT |xK|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (QREFELT $ 70)))
                (EXIT
                 (|LIMITPS;limitPlus|
                  (|LIMITPS;localsubst| |fcn| |xK|
                   (SPADCALL |str| (QREFELT $ 84)) |a| $)
                  |x| $))))) 

(SDEFUN |LIMITPS;limit;FEESU;23|
        ((|fcn| FE) (|eq| |Equation| FE) (|str| |String|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS #'|LIMITPS;limit;FEESU;23!0| $) $)) 

(SDEFUN |LIMITPS;limit;FEESU;23!0|
        ((|f| NIL) (|x| NIL) (|a| NIL) (|s| NIL) ($ NIL))
        (COND
         ((|LIMITPS;is_exp_log| |f| |x| $)
          (SPADCALL |f| |x| |a| |s| (QREFELT $ 88)))
         ('T (|LIMITPS;limit3| |f| |x| |a| |s| $)))) 

(SDEFUN |LIMITPS;limit;FEESU;24|
        ((|fcn| FE) (|eq| |Equation| FE) (|str| |String|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS (|function| |LIMITPS;limit3|) $) $)) 

(SDEFUN |LIMITPS;limit;FEESU;25|
        ((|fcn| FE) (|eq| |Equation| FE) (|str| |String|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (|LIMITPS;limit2| |fcn| |eq| |str|
         (CONS (|function| |LIMITPS;limit3|) $) $)) 

(SDEFUN |LIMITPS;anyRootsOrAtrigs?| ((|fcn| FE) ($ |Boolean|))
        (SPROG ((#1=#:G533 NIL) (#2=#:G534 NIL) (#3=#:G535 NIL) (|kernel| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |kernel| NIL)
                       (LETT #3# (SPADCALL |fcn| (QREFELT $ 11))) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |kernel| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((OR (SPADCALL |kernel| '|nthRoot| (QREFELT $ 26))
                               (OR (SPADCALL |kernel| '|asin| (QREFELT $ 26))
                                   (OR
                                    (SPADCALL |kernel| '|acos| (QREFELT $ 26))
                                    (SPADCALL |kernel| '|asec|
                                              (QREFELT $ 26)))))
                           (PROGN (LETT #2# 'T) (GO #4=#:G532)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |kernel| '|acsc| (QREFELT $ 26))
                               (PROGN
                                (LETT #1# (PROGN (LETT #2# 'T) (GO #4#)))
                                (GO #5=#:G525)))))
                            #5# (EXIT #1#))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |LIMITPS;complLimit|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OnePointCompletion| FE) "failed"))
        (SPROG
         ((|answer| (FE)) (|lim| (FE)) (#1=#:G563 NIL) (|uls| (|Uls|))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #2=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #3=((|Boolean|)
                    (|Union| #4="complex" #5="real: two sides"
                             #6="real: left side" #7="real: right side"
                             #8="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #9=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE . #10=((|Boolean|) (|Union| #4# #5# #6# #7# #8#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #11=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #12=(|Boolean|) #13=(|Union| #4# #5# #6# #7# #8#)
              #14=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #15=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #16=(|Boolean|) #17=(|Union| #4# #5# #6# #7# #8#)
              #18=(|Boolean|) FE (|Mapping| #19=(|Boolean|) FE)
              (|Mapping| #20=(|Boolean|) FE) (|Mapping| #21=(|Boolean|) FE)))))
          (|upxs| (|Upx|))
          (|pseries|
           (|Union| (|:| |%series| |Upx|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|) . #2#) FE . #3#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|) . #9#) FE . #10#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #11#) FE #12# #13# #14# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #15#) FE #16# #17# #18# FE
              (|Mapping| #19# FE) (|Mapping| #20# FE) (|Mapping| #21# FE)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                                   (QREFELT $ 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT $ 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                        (QREFELT $ 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT $ 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT $ 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
                       (LETT |pseries|
                             (SPADCALL |fcn| NIL (CONS 0 "complex")
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#22="complex"
                                                                     '#23="real: two sides"
                                                                     '#24="real: left side"
                                                                     '#25="real: right side"
                                                                     '#26="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (PROGN (LETT #1# (CONS 1 "failed")) (GO #27=#:G562)))
                         (#28='T
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT $ 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '$)
                                                               |Upx|))
                              (PROGN
                               (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 91))))
                               (GO #27#)))
                             (#28#
                              (SPADCALL |upxs| (|spadConstant| $ 93)
                                        (|compiledLookupCheck| '|coefficient|
                                                               (LIST
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                '$
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|Integer|)))
                                                               |Upx|)))))))))))
                     (#28#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT $ 7)
                                                              |Uts| |Uls|)
                              |x|))
                       (LETT |lseries|
                             (SPADCALL |fcn| NIL (CONS 0 "complex")
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#22#
                                                                     '#23#
                                                                     '#24#
                                                                     '#25#
                                                                     '#26#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (PROGN (LETT #1# (CONS 1 "failed")) (GO #27#)))
                         (#28#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT $ 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
                                                                '$)
                                                               |Uls|))
                              (PROGN
                               (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 91))))
                               (GO #27#)))
                             (#28#
                              (SPADCALL |uls| 0
                                        (|compiledLookupCheck| '|coefficient|
                                                               (LIST
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                '$
                                                                (LIST
                                                                 '|Integer|))
                                                               |Uls|)))))))))))))))
            (EXIT
             (COND
              ((SPADCALL |x| (SPADCALL |lim| (QREFELT $ 23)) (QREFELT $ 24))
               (COND
                ((SPADCALL |x|
                           (SPADCALL
                            (LETT |answer| (SPADCALL |lim| (QREFELT $ 45)))
                            (QREFELT $ 23))
                           (QREFELT $ 24))
                 (|error| "limit: can't evaluate limit"))
                (#28# (CONS 0 (SPADCALL |answer| (QREFELT $ 94))))))
              (#28# (CONS 0 (SPADCALL |lim| (QREFELT $ 94))))))))
          #27# (EXIT #1#)))) 

(SDEFUN |LIMITPS;okProblem?|
        ((|function| |String|) (|problem| |String|) ($ |Boolean|))
        (COND
         ((OR (EQUAL |function| "log") (EQUAL |function| "nth root"))
          (COND ((EQUAL |problem| "series of non-zero order") 'T)
                (#1='T (EQUAL |problem| "negative leading coefficient"))))
         ('T
          (COND ((EQUAL |function| "atan") (EQUAL |problem| "branch problem"))
                ((EQUAL |function| "erf") (EQUAL |problem| "unknown kernel"))
                (#1# (EQUAL |problem| "essential singularity")))))) 

(SDEFUN |LIMITPS;poleLimit|
        ((|order| |Fraction| (|Integer|)) (|coef| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (SPROG
         ((|rtLim| (|OrderedCompletion| FE)) (|si| (|Integer|))
          (|s| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND
           ((NULL
             (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 23)) (QREFELT $ 24)))
            (SEQ (LETT |s| (SPADCALL |coef| (QREFELT $ 97)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (SEQ (LETT |si| (QCDR |s|))
                         (EXIT
                          (COND ((EQL |si| 0) (|error| "poleLimit: coef = 0"))
                                (#2='T
                                 (SEQ
                                  (LETT |rtLim|
                                        (COND
                                         ((SPADCALL |si| 0 (QREFELT $ 98))
                                          (SPADCALL (QREFELT $ 69)))
                                         (#2# (SPADCALL (QREFELT $ 59)))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |order| (QREFELT $ 99))
                                      (QREFELT $ 100))
                                     (CONS 0 |rtLim|))
                                    ((SPADCALL
                                      (SPADCALL |order| (QREFELT $ 101))
                                      (QREFELT $ 100))
                                     (CONS 1
                                           (CONS (CONS 1 "failed")
                                                 (CONS 0 |rtLim|))))
                                    (#2#
                                     (CONS 1
                                           (CONS
                                            (CONS 0
                                                  (SPADCALL |rtLim|
                                                            (QREFELT $ 102)))
                                            (CONS 0 |rtLim|))))))))))))
                   (#2# (CONS 2 "failed"))))))
           ('T (|error| "limit: can't evaluate limit")))))) 

(SDEFUN |LIMITPS;poleLimitPlus|
        ((|order| |Fraction| (|Integer|)) (|coef| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((|tti| (|Integer|)) (|tt| #2=(|Union| (|Integer|) "failed"))
          (|t| (|Integer|)) (|ss| (|Integer|))
          (|cclim| #3=(|Union| (|OrderedCompletion| FE) #1#))
          (|lim| (|OrderedCompletion| FE)) (|clim| #3#) (|si| (|Integer|))
          (|s| #2#))
         (SEQ
          (COND
           ((NULL
             (SPADCALL |x| (SPADCALL |coef| (QREFELT $ 23)) (QREFELT $ 24)))
            (SEQ (LETT |s| (SPADCALL |coef| (QREFELT $ 97)))
                 (EXIT
                  (COND
                   ((QEQCAR |s| 0)
                    (SEQ (LETT |si| (QCDR |s|))
                         (EXIT
                          (COND
                           ((EQL |si| 0) (|error| "poleLimitPlus: coef = 0"))
                           ((SPADCALL |si| 0 (QREFELT $ 98))
                            (CONS 0 (SPADCALL (QREFELT $ 69))))
                           (#4='T (CONS 0 (SPADCALL (QREFELT $ 59))))))))
                   (#4# (CONS 1 "failed"))))))
           ('T
            (SEQ (LETT |clim| (|LIMITPS;specialLimit| |coef| |x| $))
                 (EXIT
                  (COND ((QEQCAR |clim| 1) (CONS 1 "failed"))
                        (#4#
                         (SEQ (LETT |lim| (QCDR |clim|))
                              (COND
                               ((EQL (SPADCALL |lim| (QREFELT $ 32)) 0)
                                (COND
                                 ((SPADCALL (SPADCALL |lim| (QREFELT $ 62))
                                            (QREFELT $ 103))
                                  (EXIT
                                   (SEQ
                                    (LETT |cclim|
                                          (|LIMITPS;specialLimit|
                                           (SPADCALL |coef| (QREFELT $ 29)) |x|
                                           $))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |cclim| 1) (CONS 1 "failed"))
                                      (#4#
                                       (SEQ
                                        (LETT |ss|
                                              (SPADCALL (QCDR |cclim|)
                                                        (QREFELT $ 32)))
                                        (EXIT
                                         (COND
                                          ((ZEROP |ss|)
                                           (|error| "limit: internal error"))
                                          ((SPADCALL |ss| 0 (QREFELT $ 98))
                                           (CONS 0 (SPADCALL (QREFELT $ 69))))
                                          (#4#
                                           (CONS 0
                                                 (SPADCALL
                                                  (QREFELT $ 59))))))))))))))))
                              (LETT |t| (SPADCALL |lim| (QREFELT $ 32)))
                              (EXIT
                               (COND
                                ((ZEROP |t|)
                                 (SEQ
                                  (LETT |tt| (SPADCALL |coef| (QREFELT $ 97)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |tt| 0)
                                     (SEQ (LETT |tti| (QCDR |tt|))
                                          (EXIT
                                           (COND
                                            ((EQL |tti| 0)
                                             (|error|
                                              "poleLimitPlus: coef = 0"))
                                            ((SPADCALL |tti| 0 (QREFELT $ 98))
                                             (CONS 0
                                                   (SPADCALL (QREFELT $ 69))))
                                            (#4#
                                             (CONS 0
                                                   (SPADCALL
                                                    (QREFELT $ 59))))))))
                                    (#4# (CONS 1 "failed"))))))
                                ((SPADCALL |t| 0 (QREFELT $ 98))
                                 (CONS 0 (SPADCALL (QREFELT $ 69))))
                                (#4#
                                 (CONS 0 (SPADCALL (QREFELT $ 59)))))))))))))))) 

(SDEFUN |LIMITPS;realLimit|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (SPROG
         ((|answer| (FE)) (|lim| (|Union| FE "failed")) (#2=#:G637 NIL)
          (|cl| (FE)) (|ordl| (|Integer|)) (|uls| (|Uls|))
          (|right| #3=(|Union| (|OrderedCompletion| FE) #1#)) (|left| #3#)
          (|fcn0| (FE)) (|xK| (|Kernel| FE)) (|problem| #4=(|String|))
          (|function| #5=(|String|))
          (|trouble| #6=(|Record| (|:| |func| #5#) (|:| |prob| #4#)))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #7=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #8=((|Boolean|)
                    (|Union| #9="complex" #10="real: two sides"
                             #11="real: left side" #12="real: right side"
                             #13="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #14=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE . #15=((|Boolean|) (|Union| #9# #10# #11# #12# #13#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #16=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #17=(|Boolean|) #18=(|Union| #9# #10# #11# #12# #13#)
              #19=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #20=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #21=(|Boolean|) #22=(|Union| #9# #10# #11# #12# #13#)
              #23=(|Boolean|) FE (|Mapping| #24=(|Boolean|) FE)
              (|Mapping| #25=(|Boolean|) FE) (|Mapping| #26=(|Boolean|) FE)))))
          (|cp| (FE)) (|ordp| (|Fraction| (|Integer|))) (|upxs| (|Upx|))
          (|pseries| (|Union| (|:| |%series| |Upx|) (|:| |%problem| #6#)))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|) . #7#) FE . #8#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|) . #14#) FE . #15#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #16#) FE #17# #18# #19# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #20#) FE #21# #22# #23# FE
              (|Mapping| #24# FE) (|Mapping| #25# FE) (|Mapping| #26# FE)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                                   (QREFELT $ 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT $ 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                        (QREFELT $ 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT $ 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT $ 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#27="complex"
                                                                     '#28="real: two sides"
                                                                     '#29="real: left side"
                                                                     '#30="real: right side"
                                                                     '#31="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (SEQ (LETT |trouble| (CDR |pseries|))
                               (LETT |function| (QCAR |trouble|))
                               (LETT |problem| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((|LIMITPS;okProblem?| |function| |problem| $)
                                  (SEQ
                                   (LETT |left|
                                         (SEQ
                                          (LETT |xK|
                                                (SPADCALL |x| (QREFELT $ 81)))
                                          (LETT |fcn0|
                                                (SPADCALL |fcn| |xK|
                                                          (SPADCALL
                                                           (SPADCALL |xK|
                                                                     (QREFELT $
                                                                              18))
                                                           (QREFELT $ 68))
                                                          (QREFELT $ 41)))
                                          (EXIT
                                           (|LIMITPS;limitPlus| |fcn0| |x|
                                            $))))
                                   (LETT |right|
                                         (|LIMITPS;limitPlus| |fcn| |x| $))
                                   (COND
                                    ((QEQCAR |left| 1)
                                     (COND
                                      ((QEQCAR |right| 1)
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 2 "failed"))
                                         (GO #32=#:G636)))))))
                                   (COND
                                    ((QEQCAR |left| 0)
                                     (COND
                                      ((QEQCAR |right| 0)
                                       (COND
                                        ((SPADCALL (QCDR |left|) (QCDR |right|)
                                                   (QREFELT $ 104))
                                         (EXIT
                                          (PROGN
                                           (LETT #2# (CONS 0 (QCDR |left|)))
                                           (GO #32#)))))))))
                                   (EXIT
                                    (PROGN
                                     (LETT #2# (CONS 1 (CONS |left| |right|)))
                                     (GO #32#)))))
                                 (#33='T
                                  (PROGN
                                   (LETT #2# (CONS 2 "failed"))
                                   (GO #32#)))))))
                         (#33#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT $ 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
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
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|Integer|))
                                                                 '$)
                                                                |Upx|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT $ 7))
                                                      '$
                                                      (LIST '|Fraction|
                                                            (LIST '|Integer|)))
                                                |Upx|)))
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (|LIMITPS;poleLimit| |ordp| |cp| |x| $))
                                 (GO #32#)))))
                             (#33#
                              (CONS 0
                                    (SPADCALL |upxs| (|spadConstant| $ 93)
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT $ 7)) '$
                                                     (LIST '|Fraction|
                                                           (LIST '|Integer|)))
                                               |Upx|))))))))))))
                     (#33#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT $ 7)
                                                              |Uts| |Uls|)
                              |x|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#27#
                                                                     '#28#
                                                                     '#29#
                                                                     '#30#
                                                                     '#31#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (SEQ (LETT |trouble| (CDR |lseries|))
                               (LETT |function| (QCAR |trouble|))
                               (LETT |problem| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((|LIMITPS;okProblem?| |function| |problem| $)
                                  (SEQ
                                   (LETT |left|
                                         (SEQ
                                          (LETT |xK|
                                                (SPADCALL |x| (QREFELT $ 81)))
                                          (LETT |fcn0|
                                                (SPADCALL |fcn| |xK|
                                                          (SPADCALL
                                                           (SPADCALL |xK|
                                                                     (QREFELT $
                                                                              18))
                                                           (QREFELT $ 68))
                                                          (QREFELT $ 41)))
                                          (EXIT
                                           (|LIMITPS;limitPlus| |fcn0| |x|
                                            $))))
                                   (LETT |right|
                                         (|LIMITPS;limitPlus| |fcn| |x| $))
                                   (COND
                                    ((QEQCAR |left| 1)
                                     (COND
                                      ((QEQCAR |right| 1)
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 2 "failed"))
                                         (GO #32#)))))))
                                   (COND
                                    ((QEQCAR |left| 0)
                                     (COND
                                      ((QEQCAR |right| 0)
                                       (COND
                                        ((SPADCALL (QCDR |left|) (QCDR |right|)
                                                   (QREFELT $ 104))
                                         (EXIT
                                          (PROGN
                                           (LETT #2# (CONS 0 (QCDR |left|)))
                                           (GO #32#)))))))))
                                   (EXIT
                                    (PROGN
                                     (LETT #2# (CONS 1 (CONS |left| |right|)))
                                     (GO #32#)))))
                                 (#33#
                                  (PROGN
                                   (LETT #2# (CONS 2 "failed"))
                                   (GO #32#)))))))
                         (#33#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT $ 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
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
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '$)
                                                                |Uls|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT $ 7))
                                                      '$ (LIST '|Integer|))
                                                |Uls|)))
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (|LIMITPS;poleLimit|
                                        (SPADCALL |ordl| (QREFELT $ 105)) |cl|
                                        |x| $))
                                 (GO #32#)))))
                             (#33#
                              (CONS 0
                                    (SPADCALL |uls| 0
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT $ 7)) '$
                                                     (LIST '|Integer|))
                                               |Uls|))))))))))))))))
            (EXIT
             (COND ((QEQCAR |lim| 1) (CONS 2 "failed"))
                   ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 23))
                              (QREFELT $ 24))
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL
                                 (LETT |answer|
                                       (SPADCALL (QCDR |lim|) (QREFELT $ 45)))
                                 (QREFELT $ 23))
                                (QREFELT $ 24))
                      (|error| "limit: can't evaluate limit"))
                     (#33# (CONS 0 (SPADCALL |answer| (QREFELT $ 43))))))
                   (#33# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 43))))))))
          #32# (EXIT #2#)))) 

(SDEFUN |LIMITPS;xxpLimit|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG
         ((|xxp|
           (|Union|
            (|:| |%expansion| (|ExponentialExpansion| R FE |x| |zeroFE|))
            (|:| |%problem|
                 (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
          (|xpack|
           (CATEGORY |package|
            (SIGNATURE |exprToXXP|
             ((|Union|
               (|:| |%expansion| (|ExponentialExpansion| R FE |x| |zeroFE|))
               (|:| |%problem|
                    (|Record| (|:| |func| (|String|))
                              (|:| |prob| (|String|)))))
              FE (|Boolean|)))
            (SIGNATURE |localAbs| (FE FE)))))
         (SEQ
          (LETT |xpack|
                (|FunctionSpaceToExponentialExpansion| (QREFELT $ 6)
                                                       (QREFELT $ 7) |x|
                                                       (QREFELT $ 9)))
          (LETT |xxp|
                (SPADCALL |fcn| 'T
                          (|compiledLookupCheck| '|exprToXXP|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:|
                                                              '|%expansion|
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
                                                 |xpack|)))
          (EXIT
           (COND ((QEQCAR |xxp| 1) (CONS 1 "failed"))
                 ('T
                  (SPADCALL (CDR |xxp|)
                            (|compiledLookupCheck| '|limitPlus|
                                                   (LIST
                                                    (LIST '|Union|
                                                          (LIST
                                                           '|OrderedCompletion|
                                                           (|devaluate|
                                                            (ELT $ 7)))
                                                          '"failed")
                                                    '$)
                                                   (|ExponentialExpansion|
                                                    (ELT $ 6) (ELT $ 7) |x|
                                                    (ELT $ 9)))))))))) 

(SDEFUN |LIMITPS;limitPlus|
        ((|fcn| FE) (|x| |Symbol|)
         ($ |Union| (|OrderedCompletion| FE) #1="failed"))
        (SPROG
         ((|xLim| (|Union| (|OrderedCompletion| FE) #1#)) (|answer| (FE))
          (|lim| (|Union| FE "failed")) (#2=#:G677 NIL) (|cl| (FE))
          (|ordl| (|Integer|)) (|uls| (|Uls|)) (|pp| #3=(|String|))
          (|ff| #4=(|String|))
          (|trouble| #5=(|Record| (|:| |func| #4#) (|:| |prob| #3#)))
          (|lseries|
           (|Union| (|:| |%series| |Uls|)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|lpack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #6=((|:| |%problem|
                                  (|Record| (|:| |func| (|String|))
                                            (|:| |prob| (|String|))))))
              FE
              . #7=((|Boolean|)
                    (|Union| #8="complex" #9="real: two sides"
                             #10="real: left side" #11="real: right side"
                             #12="just do it"))))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #13=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE . #14=((|Boolean|) (|Union| #8# #9# #10# #11# #12#))))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #15=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #16=(|Boolean|) #17=(|Union| #8# #9# #10# #11# #12#)
              #18=(|Boolean|) FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Uls|)
                       . #19=((|:| |%problem|
                                   (|Record| (|:| |func| (|String|))
                                             (|:| |prob| (|String|))))))
              FE #20=(|Boolean|) #21=(|Union| #8# #9# #10# #11# #12#)
              #22=(|Boolean|) FE (|Mapping| #23=(|Boolean|) FE)
              (|Mapping| #24=(|Boolean|) FE) (|Mapping| #25=(|Boolean|) FE)))))
          (|cp| (FE)) (|ordp| (|Fraction| (|Integer|))) (|upxs| (|Upx|))
          (|pseries| (|Union| (|:| |%series| |Upx|) (|:| |%problem| #5#)))
          (|ppack|
           (CATEGORY |package|
            (SIGNATURE |exprToUPS|
             ((|Union| (|:| |%series| |Upx|) . #6#) FE . #7#))
            (SIGNATURE |exprToGenUPS|
             ((|Union| (|:| |%series| |Upx|) . #13#) FE . #14#))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #15#) FE #16# #17# #18# FE))
            (SIGNATURE |exprToPS|
             ((|Union| (|:| |%series| |Upx|) . #19#) FE #20# #21# #22# FE
              (|Mapping| #23# FE) (|Mapping| #24# FE) (|Mapping| #25# FE)))))
          (|Upx|
           (|Join|
            (|UnivariatePuiseuxSeriesConstructorCategory| FE
                                                          (|UnivariateLaurentSeries|
                                                           FE |x| |zeroFE|))
            (|RetractableTo| (|UnivariateTaylorSeries| FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Efuls|
           (|Join| (|PartialTranscendentalFunctions| |Uls|)
                   (CATEGORY |package|
                    (IF (|has| FE (|Field|))
                        (SIGNATURE ^ (|Uls| |Uls| (|Fraction| (|Integer|))))
                        |noBranch|)
                    (SIGNATURE |exp| (|Uls| |Uls|))
                    (SIGNATURE |log| (|Uls| |Uls|))
                    (SIGNATURE |sin| (|Uls| |Uls|))
                    (SIGNATURE |cos| (|Uls| |Uls|))
                    (SIGNATURE |tan| (|Uls| |Uls|))
                    (SIGNATURE |cot| (|Uls| |Uls|))
                    (SIGNATURE |sec| (|Uls| |Uls|))
                    (SIGNATURE |csc| (|Uls| |Uls|))
                    (SIGNATURE |asin| (|Uls| |Uls|))
                    (SIGNATURE |acos| (|Uls| |Uls|))
                    (SIGNATURE |atan| (|Uls| |Uls|))
                    (SIGNATURE |acot| (|Uls| |Uls|))
                    (SIGNATURE |asec| (|Uls| |Uls|))
                    (SIGNATURE |acsc| (|Uls| |Uls|))
                    (SIGNATURE |sinh| (|Uls| |Uls|))
                    (SIGNATURE |cosh| (|Uls| |Uls|))
                    (SIGNATURE |tanh| (|Uls| |Uls|))
                    (SIGNATURE |coth| (|Uls| |Uls|))
                    (SIGNATURE |sech| (|Uls| |Uls|))
                    (SIGNATURE |csch| (|Uls| |Uls|))
                    (SIGNATURE |asinh| (|Uls| |Uls|))
                    (SIGNATURE |acosh| (|Uls| |Uls|))
                    (SIGNATURE |atanh| (|Uls| |Uls|))
                    (SIGNATURE |acoth| (|Uls| |Uls|))
                    (SIGNATURE |asech| (|Uls| |Uls|))
                    (SIGNATURE |acsch| (|Uls| |Uls|)))))
          (|Uls|
           (|Join|
            (|UnivariateLaurentSeriesConstructorCategory| FE
                                                          (|UnivariateTaylorSeries|
                                                           FE |x| |zeroFE|))
            (CATEGORY |domain| (SIGNATURE |coerce| ($ (|Variable| |x|)))
             (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
             (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                 (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                 |noBranch|))))
          (|Uts|
           (|Join| (|UnivariateTaylorSeriesCategory| FE)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |x| FE)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |x| FE) $
                      (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |x|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |x|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| FE (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |x|)))
                        |noBranch|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lim|
                  (SEQ
                   (LETT |Uts|
                         (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                                   (QREFELT $ 9)))
                   (LETT |Uls|
                         (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                    (QREFELT $ 9)))
                   (LETT |Efuls|
                         (|ElementaryFunctionsUnivariateLaurentSeries|
                          (QREFELT $ 7) |Uts| |Uls|))
                   (EXIT
                    (COND
                     ((|LIMITPS;anyRootsOrAtrigs?| |fcn| $)
                      (SEQ
                       (LETT |Upx|
                             (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                        (QREFELT $ 9)))
                       (LETT |ppack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7)
                              (|Fraction| (|Integer|)) |Upx|
                              (|ElementaryFunctionsUnivariatePuiseuxSeries|
                               (QREFELT $ 7) |Uls| |Upx| |Efuls|)
                              |Uts|
                              (|TaylorSeriesExpansionPuiseux| (QREFELT $ 7)
                                                              |Uts| |Uls|
                                                              |Upx|)
                              |x|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#26="complex"
                                                                     '#27="real: two sides"
                                                                     '#28="real: left side"
                                                                     '#29="real: right side"
                                                                     '#30="just do it"))
                                                              |ppack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |pseries| 1)
                          (SEQ (LETT |trouble| (CDR |pseries|))
                               (LETT |ff| (QCAR |trouble|))
                               (LETT |pp| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((EQUAL |pp| "negative leading coefficient")
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed"))
                                   (GO #31=#:G676)))
                                 (#32='T (CONS 1 "failed"))))))
                         (#32#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |upxs| (CDR |pseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Upx|))
                             (LETT |upxs|
                                   (SPADCALL (ELT $ 45) |upxs|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Upx|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |upxs|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
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
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|Integer|))
                                                                 '$)
                                                                |Upx|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT $ 7))
                                                      '$
                                                      (LIST '|Fraction|
                                                            (LIST '|Integer|)))
                                                |Upx|)))
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (|LIMITPS;poleLimitPlus| |ordp| |cp| |x|
                                        $))
                                 (GO #31#)))))
                             (#32#
                              (CONS 0
                                    (SPADCALL |upxs| (|spadConstant| $ 93)
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT $ 7)) '$
                                                     (LIST '|Fraction|
                                                           (LIST '|Integer|)))
                                               |Upx|))))))))))))
                     (#32#
                      (SEQ
                       (LETT |lpack|
                             (|FunctionSpaceToUnivariatePowerSeries|
                              (QREFELT $ 6) (QREFELT $ 7) (|Integer|) |Uls|
                              |Efuls| |Uts|
                              (|TaylorSeriesExpansionLaurent| (QREFELT $ 7)
                                                              |Uts| |Uls|)
                              |x|))
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
                                                               (LIST
                                                                '|Boolean|)
                                                               (LIST '|Union|
                                                                     '#26#
                                                                     '#27#
                                                                     '#28#
                                                                     '#29#
                                                                     '#30#))
                                                              |lpack|)))
                       (EXIT
                        (COND
                         ((QEQCAR |lseries| 1)
                          (SEQ (LETT |trouble| (CDR |lseries|))
                               (LETT |ff| (QCAR |trouble|))
                               (LETT |pp| (QCDR |trouble|))
                               (EXIT
                                (COND
                                 ((EQUAL |pp| "negative leading coefficient")
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed"))
                                   (GO #31#)))
                                 (#32# (CONS 1 "failed"))))))
                         (#32#
                          (SEQ
                           (COND
                            ((SPADCALL (LETT |uls| (CDR |lseries|))
                                       (|compiledLookupCheck| '|pole?|
                                                              (LIST
                                                               (LIST
                                                                '|Boolean|)
                                                               '$)
                                                              |Uls|))
                             (LETT |uls|
                                   (SPADCALL (ELT $ 45) |uls|
                                             (|compiledLookupCheck| '|map|
                                                                    (LIST '$
                                                                          (LIST
                                                                           '|Mapping|
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7))
                                                                           (|devaluate|
                                                                            (ELT
                                                                             $
                                                                             7)))
                                                                          '$)
                                                                    |Uls|)))))
                           (EXIT
                            (COND
                             ((SPADCALL |uls|
                                        (|compiledLookupCheck| '|pole?|
                                                               (LIST
                                                                (LIST
                                                                 '|Boolean|)
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
                                                                 (LIST
                                                                  '|Integer|)
                                                                 '$)
                                                                |Uls|)))
                                               (|compiledLookupCheck|
                                                '|coefficient|
                                                (LIST (|devaluate| (ELT $ 7))
                                                      '$ (LIST '|Integer|))
                                                |Uls|)))
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (|LIMITPS;poleLimitPlus|
                                        (SPADCALL |ordl| (QREFELT $ 105)) |cl|
                                        |x| $))
                                 (GO #31#)))))
                             (#32#
                              (CONS 0
                                    (SPADCALL |uls| 0
                                              (|compiledLookupCheck|
                                               '|coefficient|
                                               (LIST (|devaluate| (ELT $ 7)) '$
                                                     (LIST '|Integer|))
                                               |Uls|))))))))))))))))
            (EXIT
             (COND
              ((QEQCAR |lim| 1)
               (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |fcn| |x| $))
                    (EXIT
                     (COND
                      ((QEQCAR |xLim| 1) (|LIMITPS;specialLimit| |fcn| |x| $))
                      (#32# |xLim|)))))
              ((SPADCALL |x| (SPADCALL (QCDR |lim|) (QREFELT $ 23))
                         (QREFELT $ 24))
               (COND
                ((SPADCALL |x|
                           (SPADCALL
                            (LETT |answer|
                                  (SPADCALL (QCDR |lim|) (QREFELT $ 45)))
                            (QREFELT $ 23))
                           (QREFELT $ 24))
                 (SEQ (LETT |xLim| (|LIMITPS;xxpLimit| |answer| |x| $))
                      (EXIT
                       (COND
                        ((QEQCAR |xLim| 1)
                         (|LIMITPS;specialLimit| |answer| |x| $))
                        (#32# |xLim|)))))
                (#32# (CONS 0 (SPADCALL |answer| (QREFELT $ 43))))))
              (#32# (CONS 0 (SPADCALL (QCDR |lim|) (QREFELT $ 43))))))))
          #31# (EXIT #2#)))) 

(SDEFUN |LIMITPS;limit1|
        ((|fcn| FE) (|eq| |Equation| (|OrderedCompletion| FE))
         (|do_lim| |Mapping|
          #1=(|Union| (|OrderedCompletion| FE)
                      (|Record|
                       (|:| |leftHandLimit|
                            (|Union| (|OrderedCompletion| FE) #2="failed"))
                       (|:| |rightHandLimit|
                            (|Union| (|OrderedCompletion| FE) #2#)))
                      #3="failed")
          FE (|Symbol|) (|OrderedCompletion| FE))
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #2#))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #2#)))
          #3#))
        (SPROG
         ((#4=#:G697 NIL) (|res2| (|Union| (|OrderedCompletion| FE) #2#))
          (|res1| #1#) (|a1| (FE)) (|knx| (|Kernel| FE))
          (|ae| #5=(|Union| FE "failed")) (|a| (|OrderedCompletion| FE))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")) (|f| #5#))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 107)) (QREFELT $ 40)))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#6='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 79)))
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit:left hand side must be a variable"))
                    (#6#
                     (SEQ
                      (EXIT
                       (SEQ (LETT |x| (QCDR |xx|))
                            (LETT |a| (SPADCALL |eq| (QREFELT $ 108)))
                            (SEQ (LETT |ae| (SPADCALL |a| (QREFELT $ 40)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ae| 0)
                                    (COND
                                     ((SPADCALL |x|
                                                (SPADCALL (QCDR |ae|)
                                                          (QREFELT $ 23))
                                                (QREFELT $ 24))
                                      (PROGN
                                       (LETT #4#
                                             (SEQ
                                              (LETT |knx|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 49))
                                                     (QREFELT $ 81)))
                                              (LETT |a1|
                                                    (SPADCALL (QCDR |ae|)
                                                              (LIST
                                                               (SPADCALL |x|
                                                                         (QREFELT
                                                                          $
                                                                          81)))
                                                              (LIST
                                                               (SPADCALL |knx|
                                                                         (QREFELT
                                                                          $
                                                                          18)))
                                                              (QREFELT $ 76)))
                                              (LETT |res1|
                                                    (SPADCALL |fcn| |x|
                                                              (SPADCALL |a1|
                                                                        (QREFELT
                                                                         $ 43))
                                                              |do_lim|))
                                              (EXIT
                                               (COND ((QEQCAR |res1| 2) |res1|)
                                                     ((QEQCAR |res1| 1)
                                                      (|error| "impossible"))
                                                     (#6#
                                                      (SEQ
                                                       (LETT |res2|
                                                             (|LIMITPS;subst_in_result|
                                                              (CONS 0
                                                                    (QCDR
                                                                     |res1|))
                                                              |knx| (QCDR |f|)
                                                              $))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |res2| 1)
                                                          (|error|
                                                           "impossible"))
                                                         (#6#
                                                          (CONS 0
                                                                (QCDR
                                                                 |res2|)))))))))))
                                       (GO #7=#:G693))))))))
                            (EXIT (SPADCALL |fcn| |x| |a| |do_lim|))))
                      #7# (EXIT #4#)))))))))))) 

(SDEFUN |LIMITPS;limit;FEEU;35|
        ((|fcn| FE) (|eq| |Equation| (|OrderedCompletion| FE))
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (|LIMITPS;limit1| |fcn| |eq| (CONS #'|LIMITPS;limit;FEEU;35!0| $) $)) 

(SDEFUN |LIMITPS;limit;FEEU;35!0| ((|f| NIL) (|x| NIL) (|a| NIL) ($ NIL))
        (COND
         ((|LIMITPS;is_exp_log| |f| |x| $)
          (SPADCALL |f| |x| |a| (QREFELT $ 112)))
         ('T (|LIMITPS;locallimit| |f| |x| |a| $)))) 

(SDEFUN |LIMITPS;limit;FEEU;36|
        ((|fcn| FE) (|eq| |Equation| (|OrderedCompletion| FE))
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $)
         $)) 

(SDEFUN |LIMITPS;limit;FEEU;37|
        ((|fcn| FE) (|eq| |Equation| (|OrderedCompletion| FE))
         ($ |Union| (|OrderedCompletion| FE)
          (|Record|
           (|:| |leftHandLimit| (|Union| (|OrderedCompletion| FE) #1="failed"))
           (|:| |rightHandLimit| (|Union| (|OrderedCompletion| FE) #1#)))
          "failed"))
        (|LIMITPS;limit1| |fcn| |eq| (CONS (|function| |LIMITPS;locallimit|) $)
         $)) 

(SDEFUN |LIMITPS;complexLimit;FEEU;38|
        ((|fcn| FE) (|eq| |Equation| (|OnePointCompletion| FE))
         ($ |Union| (|OnePointCompletion| FE) "failed"))
        (SPROG
         ((#1=#:G734 NIL) (|res2| #2=(|Union| FE "failed"))
          (|res1| (|Union| (|OnePointCompletion| FE) "failed")) (|a1| (FE))
          (|knx| (|Kernel| FE)) (|ae| #2#) (|a| (|OnePointCompletion| FE))
          (|x| (|Symbol|)) (|xx| (|Union| (|Symbol|) "failed")) (|f| #2#))
         (SEQ
          (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 117)) (QREFELT $ 74)))
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|error| "limit:left hand side must be a variable"))
            (#3='T
             (SEQ (LETT |xx| (SPADCALL (QCDR |f|) (QREFELT $ 79)))
                  (EXIT
                   (COND
                    ((QEQCAR |xx| 1)
                     (|error| "limit:left hand side must be a variable"))
                    (#3#
                     (SEQ
                      (EXIT
                       (SEQ (LETT |x| (QCDR |xx|))
                            (LETT |a| (SPADCALL |eq| (QREFELT $ 118)))
                            (SEQ (LETT |ae| (SPADCALL |a| (QREFELT $ 74)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ae| 0)
                                    (COND
                                     ((SPADCALL |x|
                                                (SPADCALL (QCDR |ae|)
                                                          (QREFELT $ 23))
                                                (QREFELT $ 24))
                                      (PROGN
                                       (LETT #1#
                                             (SEQ
                                              (LETT |knx|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 49))
                                                     (QREFELT $ 81)))
                                              (LETT |a1|
                                                    (SPADCALL (QCDR |ae|)
                                                              (LIST
                                                               (SPADCALL |x|
                                                                         (QREFELT
                                                                          $
                                                                          81)))
                                                              (LIST
                                                               (SPADCALL |knx|
                                                                         (QREFELT
                                                                          $
                                                                          18)))
                                                              (QREFELT $ 76)))
                                              (LETT |res1|
                                                    (|LIMITPS;locallimitcomplex|
                                                     |fcn| |x|
                                                     (SPADCALL |a1|
                                                               (QREFELT $ 94))
                                                     $))
                                              (EXIT
                                               (COND ((QEQCAR |res1| 1) |res1|)
                                                     (#3#
                                                      (SEQ
                                                       (LETT |res2|
                                                             (SPADCALL
                                                              (QCDR |res1|)
                                                              (QREFELT $ 74)))
                                                       (EXIT
                                                        (COND
                                                         ((OR (QEQCAR |res2| 1)
                                                              (NULL
                                                               (QEQCAR |res2|
                                                                       0)))
                                                          |res1|)
                                                         ('T
                                                          (CONS 0
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCDR |res2|)
                                                                  (LIST |knx|)
                                                                  (LIST
                                                                   (QCDR |f|))
                                                                  (QREFELT $
                                                                           76))
                                                                 (QREFELT $
                                                                          94))))))))))))
                                       (GO #4=#:G727))))))))
                            (EXIT
                             (|LIMITPS;locallimitcomplex| |fcn| |x| |a| $))))
                      #4# (EXIT #1#)))))))))))) 

(DECLAIM (NOTINLINE |PowerSeriesLimitPackage;|)) 

(DEFUN |PowerSeriesLimitPackage| (&REST #1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PowerSeriesLimitPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PowerSeriesLimitPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PowerSeriesLimitPackage|)))))))))) 

(DEFUN |PowerSeriesLimitPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|PowerSeriesLimitPackage| DV$1 DV$2))
          (LETT $ (GETREFV 121))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (QSETREFV $ 90
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;23|)
                              $)))
             ('T
              (QSETREFV $ 90
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;24|)
                              $)))))
           ('T
            (QSETREFV $ 90
                      (CONS (|dispatchFunction| |LIMITPS;limit;FEESU;25|) $))))
          (COND
           ((|domainEqual| |#1| (|Integer|))
            (COND
             ((|domainEqual| |#2| (|Expression| (|Integer|)))
              (QSETREFV $ 115
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;35|) $)))
             ('T
              (QSETREFV $ 115
                        (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;36|)
                              $)))))
           ('T
            (QSETREFV $ 115
                      (CONS (|dispatchFunction| |LIMITPS;limit;FEEU;37|) $))))
          $))) 

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
              (|OnePointCompletion| 7) (243 . |retractIfCan|) (|List| $)
              (248 . |subst|) (255 . |lhs|) (|Union| 15 '"failed")
              (260 . |retractIfCan|) (265 . |rhs|) (270 . |kernel|) (|String|)
              (|ToolsForSign| 6) (275 . |direction|) (|Union| 111 '"failed")
              (|Expression| 37) (|MrvLimitPackage|) (280 . |mrv_limit|)
              (|Union| 31 '"failed") (288 . |limit|) (295 . |infinity|)
              (|Fraction| 37) (299 . |Zero|) (303 . |coerce|)
              (|Union| 37 '"failed") (|ElementaryFunctionSign| 6 7)
              (308 . |sign|) (313 . >) (319 . |numer|) (324 . |even?|)
              (329 . |denom|) (334 . -) (339 . |zero?|) (344 . =)
              (350 . |coerce|) (|Equation| 31) (355 . |lhs|) (360 . |rhs|)
              (|Record| (|:| |leftHandLimit| 85) (|:| |rightHandLimit| 85))
              (|Union| 111 109 '"failed") (|OrderedCompletion| 86)
              (365 . |mrv_limit|)
              (|Record| (|:| |leftHandLimit| 89) (|:| |rightHandLimit| 89))
              (|Union| 31 113 '"failed") (372 . |limit|) (|Equation| 73)
              (378 . |lhs|) (383 . |rhs|) (|Union| 73 '"failed")
              |LIMITPS;complexLimit;FEEU;38|)
           '#(|limit| 388 |complexLimit| 401) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 120
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
                                                   2 7 0 0 0 72 1 73 39 0 74 3
                                                   7 0 0 10 75 76 1 51 7 0 77 1
                                                   7 78 0 79 1 51 7 0 80 1 13 0
                                                   15 81 1 83 37 82 84 4 87 85
                                                   86 15 86 82 88 3 0 89 7 51
                                                   82 90 0 73 0 91 0 92 0 93 1
                                                   73 0 7 94 1 96 95 7 97 2 37
                                                   20 0 0 98 1 92 37 0 99 1 37
                                                   20 0 100 1 92 37 0 101 1 31
                                                   0 0 102 1 7 20 0 103 2 31 20
                                                   0 0 104 1 92 0 37 105 1 106
                                                   31 0 107 1 106 31 0 108 3 87
                                                   110 86 15 111 112 2 0 114 7
                                                   106 115 1 116 73 0 117 1 116
                                                   73 0 118 2 0 114 7 106 115 3
                                                   0 89 7 51 82 90 2 0 119 7
                                                   116 120)))))
           '|lookupComplete|)) 
