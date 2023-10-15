
(SDEFUN |TRMANIP;expandTrigProducts;2F;1| ((|e| F) ($ F))
        (SPADCALL (LIST (QREFELT $ 28) (QREFELT $ 29) (QREFELT $ 30)) |e| 10
                  (QREFELT $ 34))) 

(SDEFUN |TRMANIP;logArgs| ((|l| |List| F) ($ F))
        (SPROG
         ((|sum| (F)) (|arg| (F))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            "failed"))
          (#1=#:G151 NIL) (|term| NIL))
         (SEQ (LETT |sum| (|spadConstant| $ 36) . #2=(|TRMANIP;logArgs|))
              (LETT |arg| (|spadConstant| $ 37) . #2#)
              (SEQ (LETT |term| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |term| '|log| (QREFELT $ 39))
                       (LETT |arg|
                             (SPADCALL |arg|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL
                                          (|SPADfirst|
                                           (SPADCALL |term| (QREFELT $ 41)))
                                          (QREFELT $ 44)))
                                        (QREFELT $ 45))
                                       (QREFELT $ 20))
                             . #2#))
                      ('T
                       (SEQ
                        (LETT |prod| (SPADCALL |term| (QREFELT $ 48)) . #2#)
                        (COND
                         ((QEQCAR |prod| 0)
                          (COND
                           ((SPADCALL (QCDR (QCDR |prod|)) '|log|
                                      (QREFELT $ 49))
                            (EXIT
                             (LETT |arg|
                                   (SPADCALL |arg|
                                             (SPADCALL
                                              (SPADCALL
                                               (|SPADfirst|
                                                (SPADCALL (QCDR (QCDR |prod|))
                                                          (QREFELT $ 44)))
                                               (QCAR (QCDR |prod|))
                                               (QREFELT $ 50))
                                              (QREFELT $ 45))
                                             (QREFELT $ 20))
                                   . #2#))))))
                        (EXIT
                         (LETT |sum| (SPADCALL |sum| |term| (QREFELT $ 21))
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |sum| (SPADCALL |arg| (QREFELT $ 51))
                         (QREFELT $ 21)))))) 

(SDEFUN |TRMANIP;simplifyLog;2F;3| ((|e| F) ($ F))
        (SPADCALL (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 52)) $)
                  (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT $ 53)) $)
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;simplifyLog1| ((|e| F) ($ F))
        (SPROG
         ((#1=#:G185 NIL) (#2=#:G184 (F)) (#3=#:G186 (F)) (#4=#:G197 NIL)
          (#5=#:G105 NIL) (|terms| (|List| F)) (|foundLog| (|Boolean|))
          (#6=#:G177 NIL) (#7=#:G176 (F)) (#8=#:G178 (F)) (#9=#:G196 NIL)
          (#10=#:G104 NIL) (|args| (|List| F)) (|i| (|NonNegativeInteger|))
          (|nterms| (|List| F)) (|exprs| (|List| F)) (#11=#:G195 NIL)
          (|term| NIL) (#12=#:G194 NIL) (#13=#:G193 NIL) (#14=#:G192 NIL)
          (|u| NIL) (#15=#:G191 NIL) (|kers| (|List| (|Kernel| F)))
          (|expt|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #16="failed"))
          (|termList| (|Union| (|List| F) #16#))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            #16#)))
         (SEQ
          (COND ((SPADCALL |e| '|log| (QREFELT $ 54)) |e|)
                (#17='T
                 (SEQ
                  (LETT |prod| (SPADCALL |e| (QREFELT $ 48))
                        . #18=(|TRMANIP;simplifyLog1|))
                  (COND
                   ((QEQCAR |prod| 0)
                    (COND
                     ((SPADCALL (QCDR (QCDR |prod|)) '|log| (QREFELT $ 49))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (|SPADfirst|
                           (SPADCALL (QCDR (QCDR |prod|)) (QREFELT $ 44)))
                          (QCAR (QCDR |prod|)) (QREFELT $ 50))
                         (QREFELT $ 45))
                        (QREFELT $ 51)))))))
                  (LETT |termList| (SPADCALL |e| (QREFELT $ 56)) . #18#)
                  (EXIT
                   (COND
                    ((QEQCAR |termList| 1)
                     (SEQ (LETT |terms| (SPADCALL |e| (QREFELT $ 57)) . #18#)
                          (EXIT
                           (COND
                            ((QEQCAR |terms| 1)
                             (SEQ
                              (LETT |expt| (SPADCALL |e| (QREFELT $ 60))
                                    . #18#)
                              (COND
                               ((QEQCAR |expt| 0)
                                (COND
                                 ((NULL (EQL (QCDR (QCDR |expt|)) 1))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (QCAR (QCDR |expt|))
                                              (QREFELT $ 45))
                                    (QCDR (QCDR |expt|)) (QREFELT $ 50)))))))
                              (LETT |kers| (SPADCALL |e| (QREFELT $ 41))
                                    . #18#)
                              (COND
                               ((NULL (EQL (LENGTH |kers|) 1)) (EXIT |e|)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (|SPADfirst| |kers|) (QREFELT $ 61))
                                (PROGN
                                 (LETT #15# NIL . #18#)
                                 (SEQ (LETT |u| NIL . #18#)
                                      (LETT #14#
                                            (SPADCALL (|SPADfirst| |kers|)
                                                      (QREFELT $ 44))
                                            . #18#)
                                      G190
                                      (COND
                                       ((OR (ATOM #14#)
                                            (PROGN
                                             (LETT |u| (CAR #14#) . #18#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #15#
                                              (CONS
                                               (SPADCALL |u| (QREFELT $ 45))
                                               #15#)
                                              . #18#)))
                                      (LETT #14# (CDR #14#) . #18#) (GO G190)
                                      G191 (EXIT (NREVERSE #15#))))
                                (QREFELT $ 63)))))
                            (#17# (|TRMANIP;logArgs| (QCDR |terms|) $))))))
                    (#17#
                     (SEQ
                      (LETT |terms|
                            (PROGN
                             (LETT #13# NIL . #18#)
                             (SEQ (LETT |term| NIL . #18#)
                                  (LETT #12# (QCDR |termList|) . #18#) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |term| (CAR #12#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (SPADCALL |term| (QREFELT $ 45))
                                           #13#)
                                          . #18#)))
                                  (LETT #12# (CDR #12#) . #18#) (GO G190) G191
                                  (EXIT (NREVERSE #13#))))
                            . #18#)
                      (LETT |exprs| NIL . #18#) (LETT |nterms| NIL . #18#)
                      (SEQ (LETT |term| NIL . #18#) (LETT #11# |terms| . #18#)
                           G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |term| (CAR #11#) . #18#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((QEQCAR (SPADCALL |term| (QREFELT $ 65)) 0)
                               (LETT |exprs| (CONS |term| |exprs|) . #18#))
                              ('T
                               (LETT |nterms| (CONS |term| |nterms|)
                                     . #18#)))))
                           (LETT #11# (CDR #11#) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |terms| |nterms| . #18#)
                      (COND
                       ((NULL (NULL |exprs|))
                        (SEQ (LETT |foundLog| NIL . #18#) (LETT |i| 0 . #18#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND (|foundLog| NIL)
                                           ('T (< |i| (LENGTH |terms|)))))
                                    (GO G191)))
                                  (SEQ (LETT |i| (+ |i| 1) . #18#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |terms| |i|
                                                     (QREFELT $ 67))
                                           '|log| (QREFELT $ 39))
                                          (SEQ
                                           (LETT |args|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |terms| |i|
                                                             (QREFELT $ 67))
                                                   (QREFELT $ 69))
                                                  (QREFELT $ 44))
                                                 . #18#)
                                           (SPADCALL |terms| |i|
                                                     (SPADCALL
                                                      (|TRMANIP;simplifyLog1|
                                                       (SPADCALL
                                                        (|SPADfirst| |args|)
                                                        (PROGN
                                                         (LETT #6# NIL . #18#)
                                                         (SEQ
                                                          (LETT #10# NIL
                                                                . #18#)
                                                          (LETT #9# |exprs|
                                                                . #18#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #9#)
                                                                (PROGN
                                                                 (LETT #10#
                                                                       (CAR
                                                                        #9#)
                                                                       . #18#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #8# #10#
                                                                   . #18#)
                                                             (COND
                                                              (#6#
                                                               (LETT #7#
                                                                     (SPADCALL
                                                                      #7# #8#
                                                                      (QREFELT
                                                                       $ 20))
                                                                     . #18#))
                                                              ('T
                                                               (PROGN
                                                                (LETT #7# #8#
                                                                      . #18#)
                                                                (LETT #6# 'T
                                                                      . #18#)))))))
                                                          (LETT #9# (CDR #9#)
                                                                . #18#)
                                                          (GO G190) G191
                                                          (EXIT NIL))
                                                         (COND (#6# #7#)
                                                               ('T
                                                                (|spadConstant|
                                                                 $ 37))))
                                                        (QREFELT $ 70))
                                                       $)
                                                      (QREFELT $ 51))
                                                     (QREFELT $ 71))
                                           (EXIT
                                            (LETT |foundLog| 'T . #18#)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((NULL |foundLog|)
                                (LETT |terms|
                                      (SPADCALL |exprs| |terms| (QREFELT $ 72))
                                      . #18#)))))))
                      (EXIT
                       (PROGN
                        (LETT #1# NIL . #18#)
                        (SEQ (LETT #5# NIL . #18#) (LETT #4# |terms| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT #5# (CAR #4#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3# #5# . #18#)
                                (COND
                                 (#1#
                                  (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20))
                                        . #18#))
                                 ('T
                                  (PROGN
                                   (LETT #2# #3# . #18#)
                                   (LETT #1# 'T . #18#)))))))
                             (LETT #4# (CDR #4#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#)
                              (#17# (|spadConstant| $ 37))))))))))))))) 

(SDEFUN |TRMANIP;simplify;2F;5| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;simplify0| |x| $) (QREFELT $ 74))) 

(SDEFUN |TRMANIP;simplify;2F;6| ((|x| F) ($ F)) (|TRMANIP;simplify0| |x| $)) 

(SDEFUN |TRMANIP;expandpow| ((|k| |Kernel| F) (|f| |Mapping| F F) ($ F))
        (SPROG ((|de| (F)) (|ne| (F)) (|b| (F)) (|a| (F)) (|arg| (|List| F)))
               (SEQ
                (LETT |a|
                      (SPADCALL
                       (|SPADfirst|
                        (LETT |arg| (SPADCALL |k| (QREFELT $ 44))
                              . #1=(|TRMANIP;expandpow|)))
                       |f|)
                      . #1#)
                (LETT |b| (SPADCALL (SPADCALL |arg| (QREFELT $ 76)) |f|) . #1#)
                (LETT |ne|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 78))
                                  (|spadConstant| $ 80) (QREFELT $ 81))
                        (|spadConstant| $ 37))
                       (#2='T
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT $ 78))
                                   (QREFELT $ 82))
                         |b| (QREFELT $ 70))))
                      . #1#)
                (LETT |de|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 83))
                                  (|spadConstant| $ 80) (QREFELT $ 81))
                        (|spadConstant| $ 37))
                       (#2#
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT $ 83))
                                   (QREFELT $ 82))
                         (SPADCALL |b| (QREFELT $ 84)) (QREFELT $ 70))))
                      . #1#)
                (EXIT (SPADCALL |ne| |de| (QREFELT $ 20)))))) 

(SDEFUN |TRMANIP;termexp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG
         ((|coef| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#1=#:G220 NIL) (|u| NIL) (#2=#:G219 NIL) (|exponent| (F))
          (|d| (|NonNegativeInteger|)) (#3=#:G218 NIL) (|k| NIL)
          (|lpow| (|List| (|Kernel| F))) (|lk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk| (SPADCALL |p| (QREFELT $ 86)) . #4=(|TRMANIP;termexp|))
          (EXIT
           (COND ((NULL |lk|) (SPADCALL |p| (QREFELT $ 82)))
                 ('T
                  (SEQ (LETT |exponent| (|spadConstant| $ 36) . #4#)
                       (LETT |coef|
                             (SPADCALL (SPADCALL |p| (QREFELT $ 87))
                                       (QREFELT $ 88))
                             . #4#)
                       (LETT |lpow|
                             (SPADCALL (CONS #'|TRMANIP;termexp!0| $) |lk|
                                       (QREFELT $ 90))
                             . #4#)
                       (SEQ (LETT |k| NIL . #4#) (LETT #3# |lk| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |d| (SPADCALL |p| |k| (QREFELT $ 92)) . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 93))
                                (LETT |exponent|
                                      (SPADCALL |exponent|
                                                (SPADCALL |d|
                                                          (|SPADfirst|
                                                           (SPADCALL |k|
                                                                     (QREFELT $
                                                                              44)))
                                                          (QREFELT $ 94))
                                                (QREFELT $ 21))
                                      . #4#))
                               ((NULL (SPADCALL |k| '|%power| (QREFELT $ 49)))
                                (LETT |coef|
                                      (SPADCALL |coef|
                                                (SPADCALL (|spadConstant| $ 80)
                                                          (SPADCALL
                                                           (SPADCALL |k|
                                                                     (QREFELT $
                                                                              61))
                                                           (PROGN
                                                            (LETT #2# NIL
                                                                  . #4#)
                                                            (SEQ
                                                             (LETT |u| NIL
                                                                   . #4#)
                                                             (LETT #1#
                                                                   (SPADCALL
                                                                    |k|
                                                                    (QREFELT $
                                                                             44))
                                                                   . #4#)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #1#)
                                                                   (PROGN
                                                                    (LETT |u|
                                                                          (CAR
                                                                           #1#)
                                                                          . #4#)
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #2#
                                                                     (CONS
                                                                      (SPADCALL
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 95))
                                                                      #2#)
                                                                     . #4#)))
                                                             (LETT #1#
                                                                   (CDR #1#)
                                                                   . #4#)
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE #2#))))
                                                           (SPADCALL |k|
                                                                     (QREFELT $
                                                                              96))
                                                           (QREFELT $ 97))
                                                          |d| (QREFELT $ 98))
                                                (QREFELT $ 99))
                                      . #4#)))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |coef| (QREFELT $ 82))
                                   (SPADCALL
                                    (SPADCALL |exponent| (QREFELT $ 95))
                                    (QREFELT $ 100))
                                   (QREFELT $ 20))
                         (|TRMANIP;powersimp| |p| |lpow| $)
                         (QREFELT $ 20)))))))))) 

(SDEFUN |TRMANIP;termexp!0| ((|z1| NIL) ($ NIL))
        (SPADCALL |z1| '|%power| (QREFELT $ 49))) 

(SDEFUN |TRMANIP;expandPower;2F;9| ((|f| F) ($ F))
        (SPROG
         ((#1=#:G227 NIL) (|k| NIL) (#2=#:G226 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (SPADCALL (CONS #'|TRMANIP;expandPower;2F;9!0| $)
                          (SPADCALL |f| (QREFELT $ 41)) (QREFELT $ 90))
                . #3=(|TRMANIP;expandPower;2F;9|))
          (EXIT
           (SPADCALL |f| |l|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|TRMANIP;expandpow| |k| (ELT $ 101) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 102)))))) 

(SDEFUN |TRMANIP;expandPower;2F;9!0| ((|z1| NIL) ($ NIL))
        (SPADCALL |z1| '|%power| (QREFELT $ 49))) 

(SDEFUN |TRMANIP;powersimp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|l| |List| (|Kernel| F)) ($ F))
        (SPROG
         ((|exponent| (F)) (#1=#:G235 NIL) (|k0| NIL)
          (|lk| (|List| (|Kernel| F))) (|a| (F)) (|arg| (|List| F))
          (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) (|spadConstant| $ 37))
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|) . #2=(|TRMANIP;powersimp|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT $ 44)) . #2#))
                            . #2#)
                      (LETT |exponent|
                            (SPADCALL (SPADCALL |p| |k| (QREFELT $ 92))
                                      (SPADCALL |arg| (QREFELT $ 76))
                                      (QREFELT $ 103))
                            . #2#)
                      (LETT |lk|
                            (SPADCALL
                             (CONS #'|TRMANIP;powersimp!0| (VECTOR $ |a|))
                             (CDR |l|) (QREFELT $ 90))
                            . #2#)
                      (SEQ (LETT |k0| NIL . #2#) (LETT #1# |lk| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k0| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |exponent|
                                   (SPADCALL |exponent|
                                             (SPADCALL
                                              (SPADCALL |p| |k0|
                                                        (QREFELT $ 92))
                                              (SPADCALL
                                               (SPADCALL |k0| (QREFELT $ 44))
                                               (QREFELT $ 76))
                                              (QREFELT $ 103))
                                             (QREFELT $ 21))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (SPADCALL
                        (SPADCALL |a| (SPADCALL |exponent| (QREFELT $ 95))
                                  (QREFELT $ 70))
                        (|TRMANIP;powersimp| |p|
                         (SPADCALL (CDR |l|) |lk| (QREFELT $ 106)) $)
                        (QREFELT $ 20))))))))) 

(SDEFUN |TRMANIP;powersimp!0| ((|z1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|TRMANIP;powersimp|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |a|
                      (SPADCALL (SPADCALL |z1| (QREFELT $ 44)) (QREFELT $ 104))
                      (QREFELT $ 105)))))) 

(SDEFUN |TRMANIP;t2t| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (SPADCALL |x| (QREFELT $ 18))
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;c2t| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |x| (QREFELT $ 19))
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;c2s| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;s2c| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;s2c2| ((|x| F) ($ F))
        (SPADCALL (|spadConstant| $ 37)
                  (SPADCALL (SPADCALL |x| (QREFELT $ 18)) 2 (QREFELT $ 50))
                  (QREFELT $ 22))) 

(SDEFUN |TRMANIP;th2th| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 108)) (SPADCALL |x| (QREFELT $ 109))
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;ch2th| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 109)) (SPADCALL |x| (QREFELT $ 108))
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;ch2sh| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 108)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;sh2ch| ((|x| F) ($ F))
        (SPADCALL (SPADCALL |x| (QREFELT $ 109)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;sh2ch2| ((|x| F) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 109)) 2 (QREFELT $ 50))
                  (|spadConstant| $ 37) (QREFELT $ 22))) 

(SDEFUN |TRMANIP;ueval| ((|x| F) (|s| |Symbol|) (|f| |Mapping| F F) ($ F))
        (SPADCALL |x| |s| |f| (QREFELT $ 111))) 

(SDEFUN |TRMANIP;ueval2| ((|x| F) (|s| |Symbol|) (|f| |Mapping| F F) ($ F))
        (SPADCALL |x| |s| 2 |f| (QREFELT $ 112))) 

(SDEFUN |TRMANIP;cos2sec;2F;23| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cos| (CONS #'|TRMANIP;cos2sec;2F;23!0| $) $)) 

(SDEFUN |TRMANIP;cos2sec;2F;23!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 113)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;sin2csc;2F;24| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sin| (CONS #'|TRMANIP;sin2csc;2F;24!0| $) $)) 

(SDEFUN |TRMANIP;sin2csc;2F;24!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 115)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;csc2sin;2F;25| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|csc| (CONS (|function| |TRMANIP;c2s|) $) $)) 

(SDEFUN |TRMANIP;sec2cos;2F;26| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sec| (CONS (|function| |TRMANIP;s2c|) $) $)) 

(SDEFUN |TRMANIP;tan2cot;2F;27| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tan| (CONS #'|TRMANIP;tan2cot;2F;27!0| $) $)) 

(SDEFUN |TRMANIP;tan2cot;2F;27!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 119)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;cot2tan;2F;28| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cot| (CONS #'|TRMANIP;cot2tan;2F;28!0| $) $)) 

(SDEFUN |TRMANIP;cot2tan;2F;28!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 121)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;tan2trig;2F;29| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tan| (CONS (|function| |TRMANIP;t2t|) $) $)) 

(SDEFUN |TRMANIP;cot2trig;2F;30| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cot| (CONS (|function| |TRMANIP;c2t|) $) $)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|cosh| (CONS #'|TRMANIP;cosh2sech;2F;31!0| $) $)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 125)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;sinh2csch;2F;32| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sinh| (CONS #'|TRMANIP;sinh2csch;2F;32!0| $) $)) 

(SDEFUN |TRMANIP;sinh2csch;2F;32!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 127)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;csch2sinh;2F;33| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|csch| (CONS (|function| |TRMANIP;ch2sh|) $) $)) 

(SDEFUN |TRMANIP;sech2cosh;2F;34| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|sech| (CONS (|function| |TRMANIP;sh2ch|) $) $)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tanh| (CONS #'|TRMANIP;tanh2coth;2F;35!0| $) $)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 131)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;coth2tanh;2F;36| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|coth| (CONS #'|TRMANIP;coth2tanh;2F;36!0| $) $)) 

(SDEFUN |TRMANIP;coth2tanh;2F;36!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 133)) (QREFELT $ 107))) 

(SDEFUN |TRMANIP;tanh2trigh;2F;37| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|tanh| (CONS (|function| |TRMANIP;th2th|) $) $)) 

(SDEFUN |TRMANIP;coth2trigh;2F;38| ((|x| F) ($ F))
        (|TRMANIP;ueval| |x| '|coth| (CONS (|function| |TRMANIP;ch2th|) $) $)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|cos| (CONS #'|TRMANIP;removeCosSq;2F;39!0| $)
         $)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (|spadConstant| $ 37)
                  (SPADCALL (SPADCALL |z1| (QREFELT $ 19)) 2 (QREFELT $ 50))
                  (QREFELT $ 22))) 

(SDEFUN |TRMANIP;removeSinSq;2F;40| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|sin| (CONS (|function| |TRMANIP;s2c2|) $) $)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|cosh| (CONS #'|TRMANIP;removeCoshSq;2F;41!0| $)
         $)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (|spadConstant| $ 37)
                  (SPADCALL (SPADCALL |z1| (QREFELT $ 108)) 2 (QREFELT $ 50))
                  (QREFELT $ 21))) 

(SDEFUN |TRMANIP;removeSinhSq;2F;42| ((|x| F) ($ F))
        (|TRMANIP;ueval2| |x| '|sinh| (CONS (|function| |TRMANIP;sh2ch2|) $) $)) 

(SDEFUN |TRMANIP;expandLog;2F;43| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 78)) $)
                  (|TRMANIP;smplog| (SPADCALL |x| (QREFELT $ 83)) $)
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;expand;2F;44| ((|x| F) ($ F))
        (SPADCALL (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 78)) $)
                  (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT $ 83)) $)
                  (QREFELT $ 25))) 

(SDEFUN |TRMANIP;smpexpand|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS (|function| |TRMANIP;kerexpand|) $) (ELT $ 143) |p|
                  (QREFELT $ 147))) 

(SDEFUN |TRMANIP;smplog|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS (|function| |TRMANIP;logexpand|) $) (ELT $ 143) |p|
                  (QREFELT $ 147))) 

(SDEFUN |TRMANIP;smp2htrigs|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL (CONS #'|TRMANIP;smp2htrigs!0| $) (ELT $ 143) |p|
                  (QREFELT $ 147))) 

(SDEFUN |TRMANIP;smp2htrigs!0| ((|k1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |k1| (QREFELT $ 148)) (QREFELT $ 149))) 

(SDEFUN |TRMANIP;simplifyExp;2F;48| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G312 NIL) (|term| (F)) (#2=#:G316 NIL) (|k1| NIL)
          (#3=#:G313 NIL) (#4=#:G315 NIL) (|h| (|NonNegativeInteger|))
          (|args| (|List| F)) (|op| (|BasicOperator|)) (#5=#:G314 NIL)
          (|k2| NIL) (|lk2| #6=(|List| (|Kernel| F))) (|lk1| #6#)
          (|q1| #7=(|SparseMultivariatePolynomial| R (|Kernel| F))) (|p1| #7#)
          (|q| (F)) (|p| (F)))
         (SEQ
          (LETT |p| (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 78)) $)
                . #8=(|TRMANIP;simplifyExp;2F;48|))
          (LETT |q| (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT $ 83)) $) . #8#)
          (COND
           ((SPADCALL (LETT |p1| (SPADCALL |p| (QREFELT $ 78)) . #8#)
                      (QREFELT $ 150))
            (COND
             ((NULL
               (SPADCALL (LETT |q1| (SPADCALL |q| (QREFELT $ 78)) . #8#)
                         (QREFELT $ 150)))
              (EXIT (SPADCALL |p| |q| (QREFELT $ 25))))))
           ('T (EXIT (SPADCALL |p| |q| (QREFELT $ 25)))))
          (LETT |lk1| (SPADCALL |p1| (QREFELT $ 86)) . #8#)
          (LETT |lk2| (SPADCALL |q1| (QREFELT $ 86)) . #8#)
          (LETT |term| (|spadConstant| $ 37) . #8#)
          (SEQ (LETT |k2| NIL . #8#) (LETT #5# |lk2| . #8#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |k2| (CAR #5#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |op| (SPADCALL |k2| (QREFELT $ 61)) . #8#)
                    (LETT |args| (SPADCALL |k2| (QREFELT $ 44)) . #8#)
                    (LETT |h| (SPADCALL |k2| (QREFELT $ 96)) . #8#)
                    (COND
                     ((SPADCALL |op| (QREFELT $ 13) (QREFELT $ 151))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k1| NIL . #8#) (LETT #4# |lk1| . #8#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |k1| (CAR #4#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| (QREFELT $ 13) (QREFELT $ 93))
                                 (SEQ
                                  (LETT |term|
                                        (SPADCALL |term|
                                                  (SPADCALL
                                                   (SPADCALL |op|
                                                             (LIST
                                                              (SPADCALL
                                                               (SPADCALL |args|
                                                                         1
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                               (QREFELT $ 84)))
                                                             |h|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 148))
                                                  (QREFELT $ 20))
                                        . #8#)
                                  (EXIT
                                   (PROGN
                                    (LETT #3# |$NoValue| . #8#)
                                    (GO #9=#:G303))))))))
                             (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                             (EXIT NIL)))
                       #9# (EXIT #3#))))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT $ 152))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k1| NIL . #8#) (LETT #2# |lk1| . #8#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |k1| (CAR #2#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| '|%power| (QREFELT $ 49))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |args| 1 (QREFELT $ 67))
                                     (|SPADfirst|
                                      (SPADCALL |k1| (QREFELT $ 44)))
                                     (QREFELT $ 105))
                                    (SEQ
                                     (LETT |term|
                                           (SPADCALL |term|
                                                     (SPADCALL
                                                      (SPADCALL |op|
                                                                (LIST
                                                                 (SPADCALL
                                                                  |args| 1
                                                                  (QREFELT $
                                                                           67))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |args| 2
                                                                   (QREFELT $
                                                                            67))
                                                                  (QREFELT $
                                                                           84)))
                                                                |h|
                                                                (QREFELT $ 97))
                                                      (QREFELT $ 148))
                                                     (QREFELT $ 20))
                                           . #8#)
                                     (EXIT
                                      (PROGN
                                       (LETT #1# |$NoValue| . #8#)
                                       (GO #10=#:G307))))))))))
                              (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                              (EXIT NIL)))
                        #10# (EXIT #1#))))))
               (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (|TRMANIP;termexp|
             (SPADCALL (SPADCALL |p| |term| (QREFELT $ 20)) (QREFELT $ 78)) $)
            (|TRMANIP;termexp|
             (SPADCALL (SPADCALL |q| |term| (QREFELT $ 20)) (QREFELT $ 78)) $)
            (QREFELT $ 25)))))) 

(SDEFUN |TRMANIP;htrigs;2F;49| ((|f| F) ($ F))
        (SPROG
         ((|g1| (F)) (|b| (|Integer|)) (|g2| (F)) (|a| (F))
          (|den|
           #1=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|num| #1#) (|arg| (|List| F)) (#2=#:G326 NIL) (|x| NIL)
          (#3=#:G325 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| F))
          (|m| (|Union| (|Kernel| F) "failed")))
         (SEQ
          (LETT |m| (SPADCALL |f| (QREFELT $ 154))
                . #4=(|TRMANIP;htrigs;2F;49|))
          (EXIT
           (COND ((QEQCAR |m| 1) |f|)
                 (#5='T
                  (SEQ
                   (LETT |op|
                         (SPADCALL (LETT |k| (QCDR |m|) . #4#) (QREFELT $ 61))
                         . #4#)
                   (LETT |arg|
                         (PROGN
                          (LETT #3# NIL . #4#)
                          (SEQ (LETT |x| NIL . #4#)
                               (LETT #2# (SPADCALL |k| (QREFELT $ 44)) . #4#)
                               G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS (SPADCALL |x| (QREFELT $ 149))
                                             #3#)
                                       . #4#)))
                               (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         . #4#)
                   (LETT |num|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 78)) |k|
                                   (QREFELT $ 156))
                         . #4#)
                   (LETT |den|
                         (SPADCALL (SPADCALL |f| (QREFELT $ 83)) |k|
                                   (QREFELT $ 156))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL |op| (QREFELT $ 13) (QREFELT $ 151))
                      (SEQ
                       (LETT |g1|
                             (SPADCALL
                              (SPADCALL (LETT |a| (|SPADfirst| |arg|) . #4#)
                                        (QREFELT $ 109))
                              (SPADCALL |a| (QREFELT $ 108)) (QREFELT $ 21))
                             . #4#)
                       (LETT |g2|
                             (SPADCALL (SPADCALL |a| (QREFELT $ 109))
                                       (SPADCALL |a| (QREFELT $ 108))
                                       (QREFELT $ 22))
                             . #4#)
                       (EXIT
                        (SPADCALL
                         (|TRMANIP;supexp| |num| |g1| |g2|
                          (LETT |b|
                                (QUOTIENT2 (SPADCALL |num| (QREFELT $ 158)) 2)
                                . #4#)
                          $)
                         (|TRMANIP;supexp| |den| |g1| |g2| |b| $)
                         (QREFELT $ 25)))))
                     (#5#
                      (SPADCALL
                       (|TRMANIP;sup2htrigs| |num|
                        (LETT |g1| (SPADCALL |op| |arg| (QREFELT $ 159)) . #4#)
                        $)
                       (|TRMANIP;sup2htrigs| |den| |g1| $)
                       (QREFELT $ 25)))))))))))) 

(SDEFUN |TRMANIP;supexp|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|f1| F) (|f2| F) (|bse| |Integer|) ($ F))
        (SPROG ((|ans| (F)) (|d| (|Integer|)) (|g| (F)))
               (SEQ (LETT |ans| (|spadConstant| $ 36) . #1=(|TRMANIP;supexp|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 161)
                                      (QREFELT $ 162)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 163))
                                           (QREFELT $ 82))
                                 (QREFELT $ 149))
                                . #1#)
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT $ 158)) |bse|)
                                 . #1#)
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT $
                                                                           50))
                                                        (QREFELT $ 20))
                                              (QREFELT $ 21))
                                    . #1#))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT $
                                                                           50))
                                                        (QREFELT $ 20))
                                              (QREFELT $ 21))
                                    . #1#)))))
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 164)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;sup2htrigs|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|f| F) ($ F))
        (SPADCALL
         (SPADCALL (CONS (|function| |TRMANIP;smp2htrigs|) $) |p|
                   (QREFELT $ 168))
         |f| (QREFELT $ 169))) 

(SDEFUN |TRMANIP;exlog|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG
         ((#1=#:G337 NIL) (#2=#:G336 (F)) (#3=#:G338 (F)) (#4=#:G340 NIL)
          (|r| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|TRMANIP;exlog|))
           (SEQ (LETT |r| NIL . #5#)
                (LETT #4#
                      (SPADCALL (SPADCALL |p| (QREFELT $ 171)) (QREFELT $ 176))
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
                                   (SPADCALL
                                    (SPADCALL (QCDR |r|) (QREFELT $ 82))
                                    (QREFELT $ 51))
                                   (QREFELT $ 103))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 36))))))) 

(SDEFUN |TRMANIP;logexpand| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G346 NIL) (|x| (F)) (#2=#:G345 NIL) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |op| (SPADCALL |k| (QREFELT $ 61))
                   . #3=(|TRMANIP;logexpand|))
             (QREFELT $ 177))
            (SPADCALL |k| (QREFELT $ 148)))
           ((SPADCALL |op| '|log| (QREFELT $ 152))
            (SPADCALL
             (|TRMANIP;exlog|
              (SPADCALL
               (LETT |x|
                     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 44)))
                               (QREFELT $ 141))
                     . #3#)
               (QREFELT $ 78))
              $)
             (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 83)) $) (QREFELT $ 22)))
           ('T
            (SPADCALL |op|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |x| NIL . #3#)
                            (LETT #1# (SPADCALL |k| (QREFELT $ 44)) . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |x| (QREFELT $ 141)) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 159))))))) 

(SDEFUN |TRMANIP;kerexpand| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G367 NIL) (|x| (F)) (#2=#:G366 NIL) (#3=#:G365 NIL)
          (#4=#:G364 NIL) (|ctb| (F)) (|cta| (F)) (|tb| (F)) (|ta| (F))
          (|a| (F)) (|b| (F))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|arg| (F))
          (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |op| (SPADCALL |k| (QREFELT $ 61))
                   . #5=(|TRMANIP;kerexpand|))
             (QREFELT $ 177))
            (SPADCALL |k| (QREFELT $ 148)))
           ((SPADCALL |op| '|%power| (QREFELT $ 152))
            (|TRMANIP;expandpow| |k| (ELT $ 142) $))
           (#6='T
            (SEQ (LETT |arg| (|SPADfirst| (SPADCALL |k| (QREFELT $ 44))) . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|sec| (QREFELT $ 152))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT $ 18)) (QREFELT $ 142))
                     (QREFELT $ 107)))
                   ((SPADCALL |op| '|csc| (QREFELT $ 152))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT $ 19)) (QREFELT $ 142))
                     (QREFELT $ 107)))
                   ((SPADCALL |op| '|log| (QREFELT $ 152))
                    (SPADCALL
                     (|TRMANIP;exlog|
                      (SPADCALL
                       (LETT |x| (SPADCALL |arg| (QREFELT $ 142)) . #5#)
                       (QREFELT $ 78))
                      $)
                     (|TRMANIP;exlog| (SPADCALL |x| (QREFELT $ 83)) $)
                     (QREFELT $ 22)))
                   (#6#
                    (SEQ (LETT |num| (SPADCALL |arg| (QREFELT $ 78)) . #5#)
                         (LETT |den| (SPADCALL |arg| (QREFELT $ 83)) . #5#)
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |b|
                                   (SPADCALL (SPADCALL |num| (QREFELT $ 178))
                                             |den| (QREFELT $ 179))
                                   . #5#)
                             (|spadConstant| $ 36) (QREFELT $ 180))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (SPADCALL |num| (QREFELT $ 181))
                                             |den| (QREFELT $ 179))
                                   . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |op| '|exp| (QREFELT $ 152))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                           (QREFELT $ 100))
                                 (SPADCALL (SPADCALL |b| (QREFELT $ 100))
                                           (QREFELT $ 142))
                                 (QREFELT $ 20)))
                               ((SPADCALL |op| '|sin| (QREFELT $ 152))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                            (QREFELT $ 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 18))
                                            (QREFELT $ 142))
                                  (QREFELT $ 20))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                            (QREFELT $ 18))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 19))
                                            (QREFELT $ 142))
                                  (QREFELT $ 20))
                                 (QREFELT $ 21)))
                               ((SPADCALL |op| '|cos| (QREFELT $ 152))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                            (QREFELT $ 18))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 18))
                                            (QREFELT $ 142))
                                  (QREFELT $ 20))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                            (QREFELT $ 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 19))
                                            (QREFELT $ 142))
                                  (QREFELT $ 20))
                                 (QREFELT $ 22)))
                               ((SPADCALL |op| '|tan| (QREFELT $ 152))
                                (SEQ
                                 (LETT |ta|
                                       (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                                 (QREFELT $ 121))
                                       . #5#)
                                 (LETT |tb|
                                       (SPADCALL (SPADCALL |b| (QREFELT $ 121))
                                                 (QREFELT $ 142))
                                       . #5#)
                                 (EXIT
                                  (SPADCALL (SPADCALL |ta| |tb| (QREFELT $ 21))
                                            (SPADCALL (|spadConstant| $ 37)
                                                      (SPADCALL |ta| |tb|
                                                                (QREFELT $ 20))
                                                      (QREFELT $ 22))
                                            (QREFELT $ 25)))))
                               ((SPADCALL |op| '|cot| (QREFELT $ 152))
                                (SEQ
                                 (LETT |cta|
                                       (SPADCALL (SPADCALL |a| (QREFELT $ 142))
                                                 (QREFELT $ 119))
                                       . #5#)
                                 (LETT |ctb|
                                       (SPADCALL (SPADCALL |b| (QREFELT $ 119))
                                                 (QREFELT $ 142))
                                       . #5#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |cta| |ctb| (QREFELT $ 20))
                                    (|spadConstant| $ 37) (QREFELT $ 22))
                                   (SPADCALL |ctb| |cta| (QREFELT $ 21))
                                   (QREFELT $ 25)))))
                               (#6#
                                (SPADCALL |op|
                                          (PROGN
                                           (LETT #4# NIL . #5#)
                                           (SEQ (LETT |x| NIL . #5#)
                                                (LETT #3#
                                                      (SPADCALL |k|
                                                                (QREFELT $ 44))
                                                      . #5#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |x| (CAR #3#)
                                                             . #5#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #4#
                                                        (CONS
                                                         (SPADCALL |x|
                                                                   (QREFELT $
                                                                            142))
                                                         #4#)
                                                        . #5#)))
                                                (LETT #3# (CDR #3#) . #5#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #4#))))
                                          (QREFELT $ 159)))))))
                           (#6#
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #2# NIL . #5#)
                                       (SEQ (LETT |x| NIL . #5#)
                                            (LETT #1#
                                                  (SPADCALL |k| (QREFELT $ 44))
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
                                                     (SPADCALL |x|
                                                               (QREFELT $ 142))
                                                     #2#)
                                                    . #5#)))
                                            (LETT #1# (CDR #1#) . #5#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 159))))))))))))))) 

(SDEFUN |TRMANIP;smpexp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPROG ((|ans| (F)))
               (SEQ (LETT |ans| (|spadConstant| $ 36) . #1=(|TRMANIP;smpexp|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 182)
                                      (QREFELT $ 183)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (|TRMANIP;termexp|
                                           (SPADCALL |p| (QREFELT $ 181)) $)
                                          (QREFELT $ 21))
                                . #1#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 178)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;simplify0| ((|x| F) ($ F))
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
                    (QREFELT $ 186))
          (LIST '|sin| '|sinh|) (LIST 2 2)
          (LIST (CONS (|function| |TRMANIP;s2c2|) $)
                (CONS (|function| |TRMANIP;sh2ch2|) $))
          (QREFELT $ 188))
         (QREFELT $ 95))) 

(DECLAIM (NOTINLINE |TranscendentalManipulations;|)) 

(DEFUN |TranscendentalManipulations| (&REST #1=#:G406)
  (SPROG NIL
         (PROG (#2=#:G407)
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
                  (PROG1
                      (APPLY (|function| |TranscendentalManipulations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalManipulations|)))))))))) 

(DEFUN |TranscendentalManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalManipulations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalManipulations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 189) . #1#)
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
                                                               (|devaluate|
                                                                |#1|)))
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
          (QSETREFV $ 13
                    (SPADCALL (SPADCALL '|exp| (QREFELT $ 11)) (QREFELT $ 12)))
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
                   (QSETREFV $ 16
                             (SPADCALL (SPADCALL (QREFELT $ 14))
                                       (QREFELT $ 15)))
                   (QSETREFV $ 17
                             (SPADCALL (SPADCALL (QREFELT $ 14))
                                       (QREFELT $ 15)))
                   (QSETREFV $ 28
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 16) (QREFELT $ 18))
                               (SPADCALL (QREFELT $ 17) (QREFELT $ 19))
                               (QREFELT $ 20))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 21))
                                 (QREFELT $ 19))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 22))
                                 (QREFELT $ 19))
                                (QREFELT $ 22))
                               (SPADCALL 2 (QREFELT $ 24)) (QREFELT $ 25))
                              (QREFELT $ 27)))
                   (QSETREFV $ 29
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 16) (QREFELT $ 19))
                               (SPADCALL (QREFELT $ 17) (QREFELT $ 19))
                               (QREFELT $ 20))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 22))
                                 (QREFELT $ 18))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 21))
                                 (QREFELT $ 18))
                                (QREFELT $ 22))
                               (SPADCALL 2 (QREFELT $ 24)) (QREFELT $ 25))
                              (QREFELT $ 27)))
                   (QSETREFV $ 30
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT $ 16) (QREFELT $ 18))
                               (SPADCALL (QREFELT $ 17) (QREFELT $ 18))
                               (QREFELT $ 20))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 22))
                                 (QREFELT $ 18))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 16) (QREFELT $ 17)
                                           (QREFELT $ 21))
                                 (QREFELT $ 18))
                                (QREFELT $ 21))
                               (SPADCALL 2 (QREFELT $ 24)) (QREFELT $ 25))
                              (QREFELT $ 27)))
                   (QSETREFV $ 35
                             (CONS
                              (|dispatchFunction|
                               |TRMANIP;expandTrigProducts;2F;1|)
                              $)))))))))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV $ 75
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;5|) $)))
           ('T
            (QSETREFV $ 75
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;6|) $))))
          $))) 

(MAKEPROP '|TranscendentalManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              (5 . |operator|) '|opexp| (10 . |new|) (14 . |coerce|) 'XX 'YY
              (19 . |cos|) (24 . |sin|) (29 . *) (35 . +) (41 . -) (|Integer|)
              (47 . |coerce|) (52 . /) (|RewriteRule| 6 6 7) (58 . |rule|)
              '|sinCosRule| '|sinSinRule| '|cosCosRule| (|List| 26)
              (|PositiveInteger|) (|ApplyRules| 6 6 7) (64 . |applyRules|)
              (71 . |expandTrigProducts|) (76 . |Zero|) (80 . |One|)
              (|Boolean|) (84 . |is?|) (|List| 68) (90 . |kernels|) (|List| 7)
              (|Kernel| 7) (95 . |argument|) |TRMANIP;simplifyLog;2F;3|
              (|Record| (|:| |coef| 23) (|:| |var| 68))
              (|Union| 46 '#1="failed") (100 . |isMult|) (105 . |is?|)
              (111 . ^) (117 . |log|) (122 . |numerator|) (127 . |denominator|)
              (132 . |freeOf?|) (|Union| 62 '#1#) (138 . |isTimes|)
              (143 . |isPlus|) (|Record| (|:| |val| $) (|:| |exponent| 23))
              (|Union| 58 '#1#) (148 . |isPower|) (153 . |operator|) (|List| $)
              (158 . |kernel|)
              (|Union| (|Fraction| (|Polynomial| 6)) '"failed")
              (164 . |retractIfCan|) (169 . |One|) (173 . |elt|) (|Kernel| $)
              (179 . |retract|) (184 . ^) (190 . |setelt!|) (197 . |append|)
              (|AlgebraicManipulations| 6 7) (203 . |rootProduct|)
              (208 . |simplify|) (213 . |second|)
              (|SparseMultivariatePolynomial| 6 68) (218 . |numer|)
              (|SparseMultivariatePolynomial| 6 43) (223 . |One|) (227 . =)
              (233 . |coerce|) (238 . |denom|) (243 . -) (|List| 43)
              (248 . |variables|) (253 . |leadingCoefficient|) (258 . |coerce|)
              (|Mapping| 38 43) (263 . |select|) (|NonNegativeInteger|)
              (269 . |degree|) (275 . |is?|) (281 . *)
              |TRMANIP;simplifyExp;2F;48| (287 . |height|) (292 . |kernel|)
              (299 . |monomial|) (306 . *) (312 . |exp|)
              |TRMANIP;expandPower;2F;9| (317 . |eval|) (324 . *)
              (330 . |first|) (335 . =) (341 . |setDifference|) (347 . |inv|)
              (352 . |sinh|) (357 . |cosh|) (|Mapping| $ $) (362 . |eval|)
              (369 . |eval|) (377 . |sec|) |TRMANIP;cos2sec;2F;23|
              (382 . |csc|) |TRMANIP;sin2csc;2F;24| |TRMANIP;csc2sin;2F;25|
              |TRMANIP;sec2cos;2F;26| (387 . |cot|) |TRMANIP;tan2cot;2F;27|
              (392 . |tan|) |TRMANIP;cot2tan;2F;28| |TRMANIP;tan2trig;2F;29|
              |TRMANIP;cot2trig;2F;30| (397 . |sech|) |TRMANIP;cosh2sech;2F;31|
              (402 . |csch|) |TRMANIP;sinh2csch;2F;32|
              |TRMANIP;csch2sinh;2F;33| |TRMANIP;sech2cosh;2F;34|
              (407 . |coth|) |TRMANIP;tanh2coth;2F;35| (412 . |tanh|)
              |TRMANIP;coth2tanh;2F;36| |TRMANIP;tanh2trigh;2F;37|
              |TRMANIP;coth2trigh;2F;38| |TRMANIP;removeCosSq;2F;39|
              |TRMANIP;removeSinSq;2F;40| |TRMANIP;removeCoshSq;2F;41|
              |TRMANIP;removeSinhSq;2F;42| |TRMANIP;expandLog;2F;43|
              |TRMANIP;expand;2F;44| (417 . |coerce|) (|Mapping| 7 43)
              (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 6 79 7)
              (422 . |map|) (429 . |coerce|) |TRMANIP;htrigs;2F;49|
              (434 . |monomial?|) (439 . =) (445 . |is?|)
              (|Union| 68 '"failed") (451 . |mainKernel|)
              (|SparseUnivariatePolynomial| $) (456 . |univariate|)
              (|SparseUnivariatePolynomial| 79) (462 . |degree|) (467 . |elt|)
              (473 . |Zero|) (477 . |Zero|) (481 . ~=)
              (487 . |leadingCoefficient|) (492 . |reductum|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 79)
              (|SparseUnivariatePolynomialFunctions2| 79 7) (497 . |map|)
              (503 . |elt|) (|Factored| $) (509 . |squareFree|)
              (|Record| (|:| |coef| 91) (|:| |logand| 79)) (|List| 172)
              (|Factored| 79) (|FactoredFunctions| 79) (514 . |log|)
              (519 . |nullary?|) (524 . |reductum|) (529 . /) (535 . ~=)
              (541 . |leadingMonomial|) (546 . |Zero|) (550 . ~=) (|List| 9)
              (|List| 110) (556 . |eval|) (|List| 91) (563 . |eval|))
           '#(|tanh2trigh| 571 |tanh2coth| 576 |tan2trig| 581 |tan2cot| 586
              |sinh2csch| 591 |sin2csc| 596 |simplifyLog| 601 |simplifyExp| 606
              |simplify| 611 |sech2cosh| 616 |sec2cos| 621 |removeSinhSq| 626
              |removeSinSq| 631 |removeCoshSq| 636 |removeCosSq| 641 |htrigs|
              646 |expandTrigProducts| 651 |expandPower| 656 |expandLog| 661
              |expand| 666 |csch2sinh| 671 |csc2sin| 676 |coth2trigh| 681
              |coth2tanh| 686 |cot2trig| 691 |cot2tan| 696 |cosh2sech| 701
              |cos2sec| 706)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 188
                                                 '(1 10 8 9 11 1 7 8 8 12 0 9 0
                                                   14 1 7 0 9 15 1 7 0 0 18 1 7
                                                   0 0 19 2 7 0 0 0 20 2 7 0 0
                                                   0 21 2 7 0 0 0 22 1 7 0 23
                                                   24 2 7 0 0 0 25 2 26 0 7 7
                                                   27 3 33 7 31 7 32 34 1 0 7 7
                                                   35 0 7 0 36 0 7 0 37 2 7 38
                                                   0 9 39 1 7 40 0 41 1 43 42 0
                                                   44 1 7 47 0 48 2 43 38 0 9
                                                   49 2 7 0 0 23 50 1 7 0 0 51
                                                   1 7 0 0 52 1 7 0 0 53 2 7 38
                                                   0 9 54 1 7 55 0 56 1 7 55 0
                                                   57 1 7 59 0 60 1 43 8 0 61 2
                                                   7 0 8 62 63 1 7 64 0 65 0 6
                                                   0 66 2 42 7 0 23 67 1 7 68 0
                                                   69 2 7 0 0 0 70 3 42 7 0 23
                                                   7 71 2 42 0 0 0 72 1 73 7 7
                                                   74 1 0 7 7 75 1 42 7 0 76 1
                                                   7 77 0 78 0 79 0 80 2 79 38
                                                   0 0 81 1 7 0 77 82 1 7 77 0
                                                   83 1 7 0 0 84 1 79 85 0 86 1
                                                   79 6 0 87 1 79 0 6 88 2 85 0
                                                   89 0 90 2 79 91 0 43 92 2 43
                                                   38 0 8 93 2 7 0 91 0 94 1 43
                                                   91 0 96 3 43 0 8 42 91 97 3
                                                   79 0 0 43 91 98 2 79 0 0 0
                                                   99 1 7 0 0 100 3 7 0 0 40 62
                                                   102 2 7 0 23 0 103 1 42 7 0
                                                   104 2 7 38 0 0 105 2 85 0 0
                                                   0 106 1 7 0 0 107 1 7 0 0
                                                   108 1 7 0 0 109 3 7 0 0 9
                                                   110 111 4 7 0 0 9 91 110 112
                                                   1 7 0 0 113 1 7 0 0 115 1 7
                                                   0 0 119 1 7 0 0 121 1 7 0 0
                                                   125 1 7 0 0 127 1 7 0 0 131
                                                   1 7 0 0 133 1 7 0 6 143 3
                                                   146 7 144 145 79 147 1 7 0
                                                   68 148 1 79 38 0 150 2 8 38
                                                   0 0 151 2 8 38 0 9 152 1 7
                                                   153 0 154 2 79 155 0 43 156
                                                   1 157 91 0 158 2 7 0 8 62
                                                   159 0 6 0 160 0 157 0 161 2
                                                   157 38 0 0 162 1 157 79 0
                                                   163 1 157 0 0 164 2 167 165
                                                   166 157 168 2 165 7 0 7 169
                                                   1 79 170 0 171 1 175 173 174
                                                   176 1 8 38 0 177 1 79 0 0
                                                   178 2 7 0 77 77 179 2 7 38 0
                                                   0 180 1 79 0 0 181 0 79 0
                                                   182 2 79 38 0 0 183 3 7 0 0
                                                   184 185 186 4 7 0 0 184 187
                                                   185 188 1 0 7 7 135 1 0 7 7
                                                   132 1 0 7 7 123 1 0 7 7 120
                                                   1 0 7 7 128 1 0 7 7 116 1 0
                                                   7 7 45 1 0 7 7 95 1 0 7 7 75
                                                   1 0 7 7 130 1 0 7 7 118 1 0
                                                   7 7 140 1 0 7 7 138 1 0 7 7
                                                   139 1 0 7 7 137 1 0 7 7 149
                                                   1 1 7 7 35 1 0 7 7 101 1 0 7
                                                   7 141 1 0 7 7 142 1 0 7 7
                                                   129 1 0 7 7 117 1 0 7 7 136
                                                   1 0 7 7 134 1 0 7 7 124 1 0
                                                   7 7 122 1 0 7 7 126 1 0 7 7
                                                   114)))))
           '|lookupComplete|)) 
