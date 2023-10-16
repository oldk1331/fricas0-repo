
(SDEFUN |SOLVETRA;solve;EL;1|
        ((|oside| |Expression| R) ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |oside| (QREFELT $ 9))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv| (SPADCALL |oside| (QREFELT $ 11))
                         |SOLVETRA;solve;EL;1|)
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 14))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |oside| (|SPADfirst| |lv|)
                                     (QREFELT $ 17))))))))))) 

(SDEFUN |SOLVETRA;solve;EL;2|
        ((|equ| |Equation| (|Expression| R))
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |equ| (QREFELT $ 20))
                   (SPADCALL |equ| (QREFELT $ 21)) (QREFELT $ 22))
         (QREFELT $ 18))) 

(SDEFUN |SOLVETRA;solve;ESL;3|
        ((|equ| |Equation| (|Expression| R)) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|oneside| (|Expression| R)))
               (SEQ
                (LETT |oneside|
                      (SPADCALL (SPADCALL |equ| (QREFELT $ 20))
                                (SPADCALL |equ| (QREFELT $ 21)) (QREFELT $ 22))
                      |SOLVETRA;solve;ESL;3|)
                (EXIT (SPADCALL |oneside| |x| (QREFELT $ 17)))))) 

(SDEFUN |SOLVETRA;testZero?|
        ((|lside| |Expression| R) (|sol| |Equation| (|Expression| R))
         ($ |Boolean|))
        (SEQ
         (COND
          ((|HasCategory| (QREFELT $ 6)
                          (LIST '|QuotientFieldCategory| '(|Integer|)))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 26))
                     1)
             (EXIT 'T))))
          ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 28)) 1)
           (EXIT 'T)))
         (EXIT
          (COND
           ((SPADCALL
             (SPADCALL (SPADCALL |lside| |sol| (QREFELT $ 30)) (QREFELT $ 32))
             (QREFELT $ 9))
            'T)
           ('T NIL))))) 

(SDEFUN |SOLVETRA;solve;ESL;5|
        ((|lside| |Expression| R) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((#1=#:G213 NIL) (|sol| NIL) (#2=#:G212 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVETRA;solve;ESL;5|))
                 (SEQ (LETT |sol| NIL . #3#)
                      (LETT #1# (|SOLVETRA;solveInner| |lside| |x| $) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|SOLVETRA;testZero?| |lside| |sol| $)
                          (LETT #2# (CONS |sol| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVETRA;solveInner|
        ((|lside| |Expression| R) (|x| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG
         ((#1=#:G243 NIL) (|sols| (|List| (|Equation| (|Expression| R))))
          (#2=#:G250 NIL) (|frec| NIL)
          (|lfacts|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|listofkernels| #3=(|List| (|Expression| R)))
          (|newlside| (|Expression| R))
          (|newlist| (|List| (|Equation| (|Expression| R)))) (#4=#:G249 NIL)
          (|j| NIL) (|secondsol| #5=(|List| (|Expression| R))) (#6=#:G229 NIL)
          (#7=#:G228 #5#) (#8=#:G230 #5#) (#9=#:G248 NIL) (|ff| NIL)
          (|lfatt|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elR| (|Expression| R)) (#10=#:G247 NIL) (|i| NIL) (#11=#:G224 NIL)
          (#12=#:G223 #13=(|List| (|Equation| (|Expression| R))))
          (#14=#:G225 #13#) (#15=#:G246 NIL) (|ri| NIL)
          (|bigX_back| (|Expression| R)) (#16=#:G219 NIL)
          (|r1| (|List| (|Expression| R)))
          (|finv| (|Union| (|Expression| R) #17="failed")) (#18=#:G245 NIL)
          (|lr| #5#) (#19=#:G216 NIL) (#20=#:G215 #5#) (#21=#:G217 #5#)
          (#22=#:G244 NIL) (|fatt| NIL) (|eq1| (|Expression| R))
          (|bigX| (|Expression| R)) (Y (|Expression| R)) (X (|Symbol|))
          (|ausgabe1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lside| (|SOLVETRA;eliminateRoot| |lside| |x| $)
                  . #23=(|SOLVETRA;solveInner|))
            (LETT |ausgabe1| (|SOLVETRA;tableXkernels| |lside| |x| $) . #23#)
            (LETT X (SPADCALL (QREFELT $ 33)) . #23#)
            (LETT Y (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)) . #23#)
            (EXIT
             (COND
              ((EQL (LENGTH |ausgabe1|) 1)
               (SEQ (LETT |bigX| (|SPADfirst| |ausgabe1|) . #23#)
                    (LETT |eq1|
                          (SPADCALL |lside|
                                    (SPADCALL |bigX|
                                              (SPADCALL X (QREFELT $ 34))
                                              (QREFELT $ 35))
                                    (QREFELT $ 30))
                          . #23#)
                    (LETT |f|
                          (SPADCALL |eq1| (SPADCALL X (QREFELT $ 38))
                                    (QREFELT $ 41))
                          . #23#)
                    (LETT |lfatt|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                     (QREFELT $ 47))
                           (QREFELT $ 50))
                          . #23#)
                    (LETT |lr|
                          (PROGN
                           (LETT #19# NIL . #23#)
                           (SEQ (LETT |fatt| NIL . #23#)
                                (LETT #22# |lfatt| . #23#) G190
                                (COND
                                 ((OR (ATOM #22#)
                                      (PROGN
                                       (LETT |fatt| (CAR #22#) . #23#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #21#
                                         (SPADCALL (QCAR |fatt|) |x|
                                                   (QREFELT $ 53))
                                         . #23#)
                                   (COND
                                    (#19#
                                     (LETT #20#
                                           (SPADCALL #20# #21# (QREFELT $ 55))
                                           . #23#))
                                    ('T
                                     (PROGN
                                      (LETT #20# #21# . #23#)
                                      (LETT #19# 'T . #23#)))))))
                                (LETT #22# (CDR #22#) . #23#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#19# #20#) (#24='T NIL)))
                          . #23#)
                    (LETT |r1| NIL . #23#)
                    (SEQ (LETT |i| 1 . #23#) (LETT #18# (LENGTH |lr|) . #23#)
                         G190 (COND ((|greater_SI| |i| #18#) (GO G191)))
                         (SEQ
                          (LETT |finv|
                                (|SOLVETRA;funcinv| |bigX|
                                 (SPADCALL |lr| |i| (QREFELT $ 57)) $)
                                . #23#)
                          (EXIT
                           (COND
                            ((QEQCAR |finv| 0)
                             (LETT |r1| (CONS (QCDR |finv|) |r1|) . #23#)))))
                         (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |bigX_back|
                          (PROG2
                              (LETT #16# (|SOLVETRA;funcinv| |bigX| |bigX| $)
                                    . #23#)
                              (QCDR #16#)
                            (|check_union2| (QEQCAR #16# 0)
                                            (|Expression| (QREFELT $ 6))
                                            (|Union|
                                             (|Expression| (QREFELT $ 6)) #17#)
                                            #16#))
                          . #23#)
                    (COND
                     ((NULL (|SOLVETRA;testkernel| |bigX_back| |x| $))
                      (SEQ
                       (COND
                        ((SPADCALL |bigX| |bigX_back| (QREFELT $ 36))
                         (PROGN (LETT #1# NIL . #23#) (GO #25=#:G242))))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #11# NIL . #23#)
                                (SEQ (LETT |ri| NIL . #23#)
                                     (LETT #15# |r1| . #23#) G190
                                     (COND
                                      ((OR (ATOM #15#)
                                           (PROGN
                                            (LETT |ri| (CAR #15#) . #23#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #14#
                                              (SPADCALL
                                               (SPADCALL |bigX_back| |ri|
                                                         (QREFELT $ 22))
                                               |x| (QREFELT $ 17))
                                              . #23#)
                                        (COND
                                         (#11#
                                          (LETT #12#
                                                (SPADCALL #12# #14#
                                                          (QREFELT $ 58))
                                                . #23#))
                                         ('T
                                          (PROGN
                                           (LETT #12# #14# . #23#)
                                           (LETT #11# 'T . #23#)))))))
                                     (LETT #15# (CDR #15#) . #23#) (GO G190)
                                     G191 (EXIT NIL))
                                (COND (#11# #12#) (#24# NIL)))
                               . #23#)
                         (GO #25#))))))
                    (LETT |newlist| NIL . #23#)
                    (SEQ (LETT |i| 1 . #23#) (LETT #10# (LENGTH |r1|) . #23#)
                         G190 (COND ((|greater_SI| |i| #10#) (GO G191)))
                         (SEQ
                          (LETT |elR|
                                (|SOLVETRA;eliminateRoot|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bigX_back|
                                             (SPADCALL |r1| |i| (QREFELT $ 57))
                                             (QREFELT $ 22))
                                   (QREFELT $ 60))
                                  (QREFELT $ 61))
                                 |x| $)
                                . #23#)
                          (LETT |f|
                                (SPADCALL |elR| (SPADCALL |x| (QREFELT $ 38))
                                          (QREFELT $ 41))
                                . #23#)
                          (LETT |lfatt|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                           (QREFELT $ 63))
                                 (QREFELT $ 50))
                                . #23#)
                          (LETT |secondsol|
                                (PROGN
                                 (LETT #6# NIL . #23#)
                                 (SEQ (LETT |ff| NIL . #23#)
                                      (LETT #9# |lfatt| . #23#) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |ff| (CAR #9#) . #23#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #8#
                                               (SPADCALL (QCAR |ff|) |x|
                                                         (QREFELT $ 53))
                                               . #23#)
                                         (COND
                                          (#6#
                                           (LETT #7#
                                                 (SPADCALL #7# #8#
                                                           (QREFELT $ 55))
                                                 . #23#))
                                          ('T
                                           (PROGN
                                            (LETT #7# #8# . #23#)
                                            (LETT #6# 'T . #23#)))))))
                                      (LETT #9# (CDR #9#) . #23#) (GO G190)
                                      G191 (EXIT NIL))
                                 (COND (#6# #7#) ('T NIL)))
                                . #23#)
                          (EXIT
                           (SEQ (LETT |j| 1 . #23#)
                                (LETT #4# (LENGTH |secondsol|) . #23#) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |newlist|
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 34))
                                          (SPADCALL
                                           (SPADCALL |secondsol| |j|
                                                     (QREFELT $ 57))
                                           (QREFELT $ 65))
                                          (QREFELT $ 35))
                                         |newlist|)
                                        . #23#)))
                                (LETT |j| (|inc_SI| |j|) . #23#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |newlist|)))
              (#24#
               (SEQ
                (LETT |newlside| (|SOLVETRA;tryToTrans| |lside| |x| $) . #23#)
                (LETT |listofkernels|
                      (|SOLVETRA;tableXkernels| |newlside| |x| $) . #23#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |listofkernels|) 1)
                   (SPADCALL |newlside| |x| (QREFELT $ 17)))
                  (#24#
                   (SEQ
                    (LETT |lfacts|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lside| (QREFELT $ 60))
                                     (QREFELT $ 69))
                           (QREFELT $ 72))
                          . #23#)
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |lfacts|) 1 (QREFELT $ 14))
                       (SEQ (LETT |sols| NIL . #23#)
                            (SEQ (LETT |frec| NIL . #23#)
                                 (LETT #2# |lfacts| . #23#) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |frec| (CAR #2#) . #23#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |sols|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QCAR |frec|)
                                                     (QREFELT $ 61))
                                           |x| (QREFELT $ 17))
                                          |sols| (QREFELT $ 58))
                                         . #23#)))
                                 (LETT #2# (CDR #2#) . #23#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |sols|)))
                      (#24#
                       (PROGN (LETT #1# NIL . #23#) (GO #25#)))))))))))))))
          #25# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;simplifyingLog| ((|f| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|rec|
           (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                     (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                      (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| '|exp| (QREFELT $ 75))
                . #1=(|SOLVETRA;simplifyingLog|))
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SEQ (LETT |rec| (QCDR |u|) . #1#)
                  (EXIT
                   (SPADCALL (QCDR |rec|)
                             (|SPADfirst|
                              (SPADCALL (QCAR |rec|) (QREFELT $ 76)))
                             (QREFELT $ 77)))))
            ('T (SPADCALL |f| (QREFELT $ 78)))))))) 

(SDEFUN |SOLVETRA;testkernel|
        ((|var1| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG ((|listvar1| (|List| (|Expression| R))))
               (SEQ
                (LETT |var1| (|SOLVETRA;eliminateRoot| |var1| |y| $)
                      . #1=(|SOLVETRA;testkernel|))
                (LETT |listvar1| (|SOLVETRA;tableXkernels| |var1| |y| $) . #1#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |listvar1|) 1)
                   (COND
                    ((OR
                      (SPADCALL (SPADCALL |listvar1| 1 (QREFELT $ 57))
                                (SPADCALL |y| (QREFELT $ 34)) (QREFELT $ 36))
                      (EQL (LENGTH |listvar1|) 0))
                     'T)
                    ('T NIL)))
                  ((EQL (LENGTH |listvar1|) 0) 'T) ('T NIL)))))) 

(SDEFUN |SOLVETRA;solveRetract|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
        (SPROG
         ((|nlexpr| (|List| (|Fraction| (|Polynomial| R)))) (#1=#:G273 NIL)
          (|rf| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (#2=#:G274 NIL) (|expr| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nlexpr| NIL . #3=(|SOLVETRA;solveRetract|))
                (SEQ (LETT |expr| NIL . #3#) (LETT #2# |lexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |expr| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT $ 82)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |rf| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #4=#:G272)))
                            ('T
                             (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|)
                                   . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT $ 86))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tryToTrans|
        ((|lside| |Expression| R) (|x| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|resultLside| #1=(|Expression| R)) (|numlside| (|Expression| R))
          (|listcnorm| #2=(|List| (|Expression| R)))
          (|cnormConvLside| (|Expression| R)) (|listConvLside| #2#)
          (|NormConvLside| (|Expression| R)) (|convLside| #1#))
         (SEQ
          (COND
           ((OR (|SOLVETRA;testTrig| |lside| |x| $)
                (|SOLVETRA;testHTrig| |lside| |x| $))
            (SEQ
             (LETT |convLside| (SPADCALL |lside| (QREFELT $ 88))
                   . #3=(|SOLVETRA;tryToTrans|))
             (LETT |resultLside| |convLside| . #3#)
             (LETT |listConvLside| (|SOLVETRA;tableXkernels| |convLside| |x| $)
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |NormConvLside|
                       (SPADCALL |convLside| |x| (QREFELT $ 89)) . #3#)
                 (LETT |NormConvLside| |NormConvLside| . #3#)
                 (EXIT
                  (LETT |resultLside|
                        (|SOLVETRA;subsTan| |NormConvLside| |x| $)
                        . #3#))))))))
           ((|SOLVETRA;testLog| |lside| |x| $)
            (SEQ
             (LETT |numlside|
                   (SPADCALL (SPADCALL |lside| (QREFELT $ 60)) (QREFELT $ 61))
                   . #3#)
             (EXIT
              (LETT |resultLside| (|SOLVETRA;combineLog| |numlside| |x| $)
                    . #3#))))
           ('T
            (SEQ
             (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT $ 89)) . #3#)
             (LETT |NormConvLside| |NormConvLside| . #3#)
             (LETT |resultLside| |NormConvLside| . #3#)
             (LETT |listConvLside|
                   (|SOLVETRA;tableXkernels| |NormConvLside| |x| $) . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |cnormConvLside| (SPADCALL |lside| |x| (QREFELT $ 91))
                       . #3#)
                 (LETT |cnormConvLside| |cnormConvLside| . #3#)
                 (LETT |resultLside| |cnormConvLside| . #3#)
                 (LETT |listcnorm|
                       (|SOLVETRA;tableXkernels| |cnormConvLside| |x| $) . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |listcnorm|) 1 (QREFELT $ 14))
                    (COND
                     ((|SOLVETRA;testLog| |cnormConvLside| |x| $)
                      (SEQ
                       (LETT |numlside|
                             (SPADCALL
                              (SPADCALL |cnormConvLside| (QREFELT $ 60))
                              (QREFELT $ 61))
                             . #3#)
                       (EXIT
                        (LETT |resultLside|
                              (|SOLVETRA;combineLog| |numlside| |x| $)
                              . #3#)))))))))))))))
          (EXIT |resultLside|)))) 

(SDEFUN |SOLVETRA;subsTan|
        ((|exprvar| |Expression| R) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((#1=#:G293 NIL) (|resultnew| #2=(|Expression| R))
          (|result1| (|Expression| R))
          (|result|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|newH|
           #3=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (H (|Expression| R)) (|g| #3#) (|secondfun| (|Expression| R))
          (|f| #3#) (|fN| #4=(|Expression| R)) (|fZ| #2#) (|test| (|Boolean|))
          (Y #4#) (|varkern| (|Expression| R))
          (|listofkern| (|List| (|Expression| R))) (Z (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ (LETT Z (SPADCALL (QREFELT $ 33)) . #5=(|SOLVETRA;subsTan|))
                (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| $)
                      . #5#)
                (LETT |varkern| (|SPADfirst| |listofkern|) . #5#)
                (LETT Y
                      (SPADCALL
                       (|SPADfirst|
                        (SPADCALL
                         (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 93)))
                         (QREFELT $ 76)))
                       (QREFELT $ 94))
                      . #5#)
                (LETT |test|
                      (SPADCALL |varkern|
                                (SPADCALL
                                 (SPADCALL Y (SPADCALL 2 (QREFELT $ 95))
                                           (QREFELT $ 96))
                                 (QREFELT $ 97))
                                (QREFELT $ 36))
                      . #5#)
                (COND
                 ((EQL (LENGTH |listofkern|) 1)
                  (COND
                   ((NULL |test|)
                    (PROGN (LETT #1# |exprvar| . #5#) (GO #6=#:G292)))))
                 (#7='T (PROGN (LETT #1# |exprvar| . #5#) (GO #6#))))
                (LETT |fZ|
                      (SPADCALL |exprvar|
                                (SPADCALL |varkern| (SPADCALL Z (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 30))
                      . #5#)
                (LETT |fN| (SPADCALL |fZ| (QREFELT $ 94)) . #5#)
                (LETT |f|
                      (SPADCALL |fN| (SPADCALL Z (QREFELT $ 38))
                                (QREFELT $ 41))
                      . #5#)
                (LETT |secondfun|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 Y (QREFELT $ 99))
                                 (SPADCALL (SPADCALL Y 2 (QREFELT $ 100))
                                           (|spadConstant| $ 103)
                                           (QREFELT $ 22))
                                 (QREFELT $ 96))
                       (QREFELT $ 104))
                      . #5#)
                (LETT |g|
                      (SPADCALL |secondfun| (SPADCALL |y| (QREFELT $ 38))
                                (QREFELT $ 41))
                      . #5#)
                (LETT H (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34))
                      . #5#)
                (LETT |newH|
                      (SPADCALL H (SPADCALL Z (QREFELT $ 38)) (QREFELT $ 41))
                      . #5#)
                (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT $ 106)) . #5#)
                (EXIT
                 (COND
                  ((SPADCALL |result| |f| (QREFELT $ 107))
                   (SEQ
                    (LETT |result1| (SPADCALL |result| H (QREFELT $ 109))
                          . #5#)
                    (EXIT
                     (LETT |resultnew|
                           (SPADCALL |result1|
                                     (SPADCALL H (SPADCALL Y (QREFELT $ 97))
                                               (QREFELT $ 35))
                                     (QREFELT $ 30))
                           . #5#))))
                  (#7# (PROGN (LETT #1# |exprvar| . #5#) (GO #6#)))))))
          #6# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;eliminateKernRoot|
        ((|var| |Expression| R) (|varkern| |Kernel| (|Expression| R))
         ($ |Expression| R))
        (SPROG
         ((|resultvar| (|Expression| R))
          (|var3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G302 NIL)
          (|var2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|var1| (|Expression| R)) (X (|Symbol|)))
         (SEQ
          (LETT X (SPADCALL (QREFELT $ 33))
                . #2=(|SOLVETRA;eliminateKernRoot|))
          (LETT |var1|
                (SPADCALL |var|
                          (SPADCALL (SPADCALL |varkern| (QREFELT $ 110))
                                    (SPADCALL X (QREFELT $ 34)) (QREFELT $ 35))
                          (QREFELT $ 30))
                . #2#)
          (LETT |var2|
                (SPADCALL
                 (SPADCALL |var1| (SPADCALL X (QREFELT $ 38)) (QREFELT $ 41))
                 (QREFELT $ 44))
                . #2#)
          (LETT |var3|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 103)
                           (PROG1
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |varkern| (QREFELT $ 76))
                                       (QREFELT $ 111))
                                      (QREFELT $ 112))
                                     . #2#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 113))
                 (SPADCALL (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 76))) 0
                           (QREFELT $ 113))
                 (QREFELT $ 114))
                . #2#)
          (EXIT
           (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT $ 115)) . #2#))))) 

(SDEFUN |SOLVETRA;eliminateRoot|
        ((|var| . #1=(|Expression| R)) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|var1| #1#) (#2=#:G311 NIL) (|i| NIL)
          (|varlistk1| (|List| (|Expression| R))))
         (SEQ (LETT |var1| |var| . #3=(|SOLVETRA;eliminateRoot|))
              (SEQ G190
                   (COND
                    ((NULL (|SOLVETRA;testRootk| |var1| |y| $)) (GO G191)))
                   (SEQ
                    (LETT |varlistk1| (|SOLVETRA;tableXkernels| |var1| |y| $)
                          . #3#)
                    (EXIT
                     (SEQ (LETT |i| NIL . #3#) (LETT #2# |varlistk1| . #3#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| '|nthRoot| (QREFELT $ 116))
                              (LETT |var1|
                                    (|SOLVETRA;eliminateKernRoot| |var1|
                                     (|SPADfirst|
                                      (SPADCALL |i| (QREFELT $ 93)))
                                     $)
                                    . #3#)))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |var1|)))) 

(SDEFUN |SOLVETRA;logsumtolog| ((|var| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|var2| (|Expression| R)) (#1=#:G325 NIL) (|i| NIL)
          (|kernelofvar| (|List| (|Kernel| (|Expression| R))))
          (|newexpr| (|Expression| R)) (|exprlist| (|List| (|Expression| R)))
          (#2=#:G324 NIL) (|gcdcoeff| (|Expression| R))
          (|listforgcd| (|List| R)) (|exprcoeff| (R)) (#3=#:G323 NIL)
          (|listofexpr| (|Union| (|List| (|Expression| R)) "failed")))
         (SEQ
          (LETT |listofexpr| (SPADCALL |var| (QREFELT $ 118))
                . #4=(|SOLVETRA;logsumtolog|))
          (EXIT
           (COND ((QEQCAR |listofexpr| 1) |var|)
                 ('T
                  (SEQ (LETT |listofexpr| (CONS 0 (QCDR |listofexpr|)) . #4#)
                       (LETT |listforgcd| NIL . #4#)
                       (SEQ (LETT |i| NIL . #4#)
                            (LETT #3# (QCDR |listofexpr|) . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |exprcoeff|
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 60))
                                             (QREFELT $ 119))
                                   . #4#)
                             (EXIT
                              (LETT |listforgcd|
                                    (CONS |exprcoeff| |listforgcd|) . #4#)))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |gcdcoeff|
                             (SPADCALL (SPADCALL |listforgcd| (QREFELT $ 120))
                                       (QREFELT $ 121))
                             . #4#)
                       (LETT |newexpr| (|spadConstant| $ 122) . #4#)
                       (SEQ (LETT |i| NIL . #4#)
                            (LETT #2# (QCDR |listofexpr|) . #4#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |exprlist| (|SOLVETRA;splitExpr| |i| $)
                                   . #4#)
                             (EXIT
                              (LETT |newexpr|
                                    (SPADCALL |newexpr|
                                              (|SOLVETRA;logexpp|
                                               (SPADCALL |exprlist| 2
                                                         (QREFELT $ 57))
                                               (SPADCALL
                                                (SPADCALL |exprlist| 1
                                                          (QREFELT $ 57))
                                                |gcdcoeff| (QREFELT $ 96))
                                               $)
                                              (QREFELT $ 123))
                                    . #4#)))
                            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |kernelofvar| (SPADCALL |newexpr| (QREFELT $ 93))
                             . #4#)
                       (LETT |var2| (|spadConstant| $ 103) . #4#)
                       (SEQ (LETT |i| NIL . #4#) (LETT #1# |kernelofvar| . #4#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |i| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |var2|
                                    (SPADCALL |var2|
                                              (|SPADfirst|
                                               (SPADCALL |i| (QREFELT $ 76)))
                                              (QREFELT $ 124))
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL |gcdcoeff| (SPADCALL |var2| (QREFELT $ 78))
                                  (QREFELT $ 124)))))))))) 

(SDEFUN |SOLVETRA;testLog| ((|expr| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G332 NIL) (#2=#:G333 NIL) (|i| NIL)
          (|kernelofexpr| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|log|) . #3=(|SOLVETRA;testLog|))
                (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z $)
                      . #3#)
                (COND
                 ((EQL (LENGTH |kernelofexpr|) 0)
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G331))))
                (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                                    (QREFELT $ 126))
                          |testList| (QREFELT $ 127))
                         (COND
                          ((NULL
                            (|SOLVETRA;testkernel|
                             (|SPADfirst|
                              (SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                               (QREFELT $ 76)))
                             Z $))
                           (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                        ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;splitExpr|
        ((|expr| . #1=(|Expression| R)) ($ |List| (|Expression| R)))
        (SPROG
         ((|listexpr| (|Union| (|List| (|Expression| R)) "failed"))
          (|exprwcoeff| #1#) (|lcoeff| (R)))
         (SEQ
          (LETT |lcoeff|
                (SPADCALL (SPADCALL |expr| (QREFELT $ 60)) (QREFELT $ 119))
                . #2=(|SOLVETRA;splitExpr|))
          (LETT |exprwcoeff| |expr| . #2#)
          (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT $ 128)) . #2#)
          (EXIT
           (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| $ 103) |expr|))
                 ('T
                  (SEQ
                   (LETT |listexpr|
                         (CONS 0
                               (SPADCALL (SPADCALL |lcoeff| (QREFELT $ 121))
                                         (QCDR |listexpr|) (QREFELT $ 129)))
                         . #2#)
                   (EXIT
                    (CONS (SPADCALL |lcoeff| (QREFELT $ 121))
                          (QCDR |listexpr|)))))))))) 

(SDEFUN |SOLVETRA;buildnexpr|
        ((|expr| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|ansmant| (|Expression| R)) (|anscoeff| (|Expression| R))
          (#1=#:G348 NIL) (|i| NIL) (|n2list| (|List| (|Expression| R)))
          (|nlist| (|List| (|Expression| R))))
         (SEQ
          (LETT |nlist| (|SOLVETRA;splitExpr| |expr| $)
                . #2=(|SOLVETRA;buildnexpr|))
          (LETT |n2list|
                (SPADCALL (SPADCALL |nlist| 1 (QREFELT $ 57)) |nlist|
                          (QREFELT $ 129))
                . #2#)
          (LETT |anscoeff| (|spadConstant| $ 103) . #2#)
          (LETT |ansmant| (|spadConstant| $ 122) . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |n2list| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| Z (QREFELT $ 131))
                   (LETT |anscoeff| (SPADCALL |i| |anscoeff| (QREFELT $ 124))
                         . #2#))
                  ('T (LETT |ansmant| |i| . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (LIST |anscoeff|
                 (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT $ 57))
                           (QREFELT $ 124))))))) 

(SDEFUN |SOLVETRA;logexpp|
        ((|expr1| |Expression| R) (|expr2| |Expression| R) ($ |Expression| R))
        (SPADCALL
         (SPADCALL
          (|SPADfirst|
           (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT $ 93)))
                     (QREFELT $ 76)))
          |expr2| (QREFELT $ 132))
         (QREFELT $ 78))) 

(SDEFUN |SOLVETRA;combineLog|
        ((|expr| |Expression| R) (Y |Symbol|) ($ |Expression| R))
        (SPROG
         ((|ansexpr| #1=(|Expression| R)) (#2=#:G366 NIL) (|i| NIL) (|ans| #1#)
          (|exprr| (|List| (|Expression| R))) (|loopexpr| (|Expression| R))
          (|exprtable| (|Table| (|Expression| R) (|Expression| R))))
         (SEQ
          (LETT |exprtable| (SPADCALL (QREFELT $ 134))
                . #3=(|SOLVETRA;combineLog|))
          (EXIT
           (COND ((QEQCAR (SPADCALL |expr| (QREFELT $ 118)) 1) |expr|)
                 ('T
                  (SEQ (LETT |ans| (|spadConstant| $ 122) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |expr| (|spadConstant| $ 122)
                                         (QREFELT $ 136)))
                              (GO G191)))
                            (SEQ
                             (LETT |loopexpr|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                              (QREFELT $ 137))
                                    (QREFELT $ 61))
                                   . #3#)
                             (COND
                              ((|SOLVETRA;testLog| |loopexpr| Y $)
                               (COND
                                ((EQL
                                  (LENGTH
                                   (|SOLVETRA;tableXkernels| |loopexpr| Y $))
                                  1)
                                 (SEQ
                                  (LETT |exprr|
                                        (|SOLVETRA;buildnexpr| |loopexpr| Y $)
                                        . #3#)
                                  (COND
                                   ((QEQCAR
                                     (SPADCALL
                                      (SPADCALL |exprr| 1 (QREFELT $ 57))
                                      |exprtable| (QREFELT $ 139))
                                     1)
                                    (SPADCALL |exprtable|
                                              (SPADCALL |exprr| 1
                                                        (QREFELT $ 57))
                                              (|spadConstant| $ 122)
                                              (QREFELT $ 140))))
                                  (EXIT
                                   (SPADCALL |exprtable|
                                             (SPADCALL |exprr| 1
                                                       (QREFELT $ 57))
                                             (SPADCALL
                                              (SPADCALL |exprtable|
                                                        (SPADCALL |exprr| 1
                                                                  (QREFELT $
                                                                           57))
                                                        (QREFELT $ 141))
                                              (SPADCALL |exprr| 2
                                                        (QREFELT $ 57))
                                              (QREFELT $ 123))
                                             (QREFELT $ 140)))))
                                ('T
                                 (LETT |ans|
                                       (SPADCALL |ans| |loopexpr|
                                                 (QREFELT $ 123))
                                       . #3#))))
                              ('T
                               (LETT |ans|
                                     (SPADCALL |ans| |loopexpr|
                                               (QREFELT $ 123))
                                     . #3#)))
                             (EXIT
                              (LETT |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                               (QREFELT $ 142))
                                     (QREFELT $ 61))
                                    . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |ansexpr| (|spadConstant| $ 122) . #3#)
                       (SEQ (LETT |i| NIL . #3#)
                            (LETT #2# (SPADCALL |exprtable| (QREFELT $ 143))
                                  . #3#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |ansexpr|
                                    (SPADCALL |ansexpr|
                                              (SPADCALL
                                               (|SOLVETRA;logsumtolog|
                                                (SPADCALL |exprtable| |i|
                                                          (QREFELT $ 141))
                                                $)
                                               |i| (QREFELT $ 124))
                                              (QREFELT $ 123))
                                    . #3#)))
                            (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (LETT |ansexpr|
                              (SPADCALL |ansexpr| |ans| (QREFELT $ 123))
                              . #3#))))))))) 

(SDEFUN |SOLVETRA;testRootk|
        ((|varlistk| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G372 NIL) (#2=#:G373 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |varlistk| |y| $)
                  . #3=(|SOLVETRA;testRootk|))
            (EXIT
             (COND ((NULL |kernelofeqnvar|) NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| NIL . #3#)
                          (LETT #2# |kernelofeqnvar| . #3#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                               '|nthRoot| (QREFELT $ 144))
                              (PROGN (LETT #1# 'T . #3#) (GO #4=#:G371))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tableXkernels|
        ((|evar| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|listkOfvar| (|List| (|Expression| R))) (#1=#:G378 NIL) (|i| NIL)
          (|kOfvar| (|List| (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |kOfvar| (SPADCALL |evar| (QREFELT $ 93))
                . #2=(|SOLVETRA;tableXkernels|))
          (LETT |listkOfvar| NIL . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |kOfvar| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL |i| (QREFELT $ 110)) Z
                              (QREFELT $ 131)))
                   (LETT |listkOfvar|
                         (CONS (SPADCALL |i| (QREFELT $ 110)) |listkOfvar|)
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |listkOfvar|)))) 

(SDEFUN |SOLVETRA;testTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G385 NIL) (#2=#:G386 NIL) (|i| NIL)
          (|testList| (|List| (|Symbol|)))
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3=(|SOLVETRA;testTrig|))
            (EXIT
             (COND ((NULL |kernelofeqnvar|) NIL)
                   ('T
                    (SEQ
                     (LETT |testList|
                           (LIST '|sin| '|cos| '|tan| '|cot| '|sec| '|csc|)
                           . #3#)
                     (SEQ (LETT |i| NIL . #3#)
                          (LETT #2# |kernelofeqnvar| . #3#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL
                                (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                                (QREFELT $ 126))
                               |testList| (QREFELT $ 127))
                              (COND
                               ((NULL
                                 (|SOLVETRA;testkernel|
                                  (|SPADfirst|
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                                    (QREFELT $ 76)))
                                  Z $))
                                (PROGN (LETT #1# NIL . #3#) (GO #4=#:G384)))))
                             ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;testHTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G393 NIL) (#2=#:G394 NIL) (|i| NIL)
          (|testList| (|List| (|Symbol|)))
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3=(|SOLVETRA;testHTrig|))
            (EXIT
             (COND ((NULL |kernelofeqnvar|) NIL)
                   ('T
                    (SEQ
                     (LETT |testList|
                           (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech|
                                 '|csch|)
                           . #3#)
                     (SEQ (LETT |i| NIL . #3#)
                          (LETT #2# |kernelofeqnvar| . #3#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL
                                (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                                (QREFELT $ 126))
                               |testList| (QREFELT $ 127))
                              (COND
                               ((NULL
                                 (|SOLVETRA;testkernel|
                                  (|SPADfirst|
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT $ 93)))
                                    (QREFELT $ 76)))
                                  Z $))
                                (PROGN (LETT #1# NIL . #3#) (GO #4=#:G392)))))
                             ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;makeInterval| ((|l| R) ($ |Complex| (|Interval| (|Float|))))
        (COND
         ((|HasCategory| (QREFELT $ 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SPADCALL (ELT $ 147) (SPADCALL |l| (QREFELT $ 149))
                    (QREFELT $ 153)))
         ('T (|error| "This should never happen")))) 

(SDEFUN |SOLVETRA;dropfun| ((|x| |Expression| R) ($ |Expression| R))
        (SPROG
         ((#1=#:G404 NIL) (|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |k| (SPADCALL |x| (QREFELT $ 155))
                   . #2=(|SOLVETRA;dropfun|))
             (EXIT
              (COND
               ((OR (QEQCAR |k| 1) (NULL (SPADCALL (QCDR |k|) (QREFELT $ 76))))
                (PROGN
                 (LETT #1# (|spadConstant| $ 122) . #2#)
                 (GO #3=#:G402))))))
            (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 76))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;funcinv|
        ((|k| |Expression| R) (|l| |Expression| R)
         ($ |Union| (|Expression| R) "failed"))
        (SPROG
         ((|t| (|Expression| R)) (|fpi| (|Float|))
          (|im| (|Interval| (|Float|)))
          (|z| (|Union| (|Complex| (|Interval| (|Float|))) "failed"))
          (|ze| (|Expression| (|Complex| (|Interval| (|Float|))))))
         (SEQ
          (COND
           ((SPADCALL |k| '|sin| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|sin| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1='T (CONS 0 (SPADCALL |l| (QREFELT $ 156))))))
           ((SPADCALL |k| '|cos| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|cos| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 157))))))
           ((SPADCALL |k| '|tan| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|tan| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 158))))))
           ((SPADCALL |k| '|cot| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|cot| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 159))))))
           ((SPADCALL |k| '|sec| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|sec| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 160))))))
           ((SPADCALL |k| '|csc| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|csc| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 161))))))
           ((SPADCALL |k| '|sinh| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|sinh| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 162))))))
           ((SPADCALL |k| '|cosh| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|cosh| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 163))))))
           ((SPADCALL |k| '|tanh| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|tanh| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 164))))))
           ((SPADCALL |k| '|coth| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|coth| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 165))))))
           ((SPADCALL |k| '|sech| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|sech| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 166))))))
           ((SPADCALL |k| '|csch| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| '|csch| (QREFELT $ 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 167))))))
           ((SPADCALL |k| '|atan| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 97))))
           ((SPADCALL |k| '|acot| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 168))))))
           ((SPADCALL |k| '|asin| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 169))))
           ((SPADCALL |k| '|acos| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 170))))
           ((SPADCALL |k| '|asec| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 171))))
           ((SPADCALL |k| '|acsc| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 172))))))
           ((SPADCALL |k| '|asinh| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 173))))
           ((SPADCALL |k| '|acosh| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 174))))
           ((SPADCALL |k| '|atanh| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 175))))
           ((SPADCALL |k| '|acoth| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 176))))))
           ((SPADCALL |k| '|asech| (QREFELT $ 116))
            (CONS 0 (SPADCALL |l| (QREFELT $ 177))))
           ((SPADCALL |k| '|acsch| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 178))))))
           ((SPADCALL |k| '|exp| (QREFELT $ 116))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 122) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| $)))))
           ((SPADCALL |k| '|log| (QREFELT $ 116))
            (COND
             ((|HasCategory| (QREFELT $ 6)
                             (LIST '|ConvertibleTo|
                                   (LIST '|Complex| '(|Float|))))
              (SEQ
               (LETT |ze|
                     (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) $)
                               |l| (QREFELT $ 182))
                     . #2=(|SOLVETRA;funcinv|))
               (LETT |z| (SPADCALL |ze| (QREFELT $ 184)) . #2#)
               (EXIT
                (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT $ 185))))
                      (#1#
                       (SEQ
                        (LETT |im| (SPADCALL (QCDR |z|) (QREFELT $ 186)) . #2#)
                        (LETT |fpi| (SPADCALL (QREFELT $ 187)) . #2#)
                        (COND
                         ((SPADCALL (SPADCALL |fpi| (QREFELT $ 188))
                                    (SPADCALL |im| (QREFELT $ 189))
                                    (QREFELT $ 190))
                          (COND
                           ((SPADCALL (SPADCALL |im| (QREFELT $ 191)) |fpi|
                                      (QREFELT $ 192))
                            (EXIT (CONS 0 (SPADCALL |l| (QREFELT $ 185))))))))
                        (EXIT (CONS 1 "failed"))))))))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 185))))))
           ((SPADCALL |k| '|%power| (QREFELT $ 116))
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 32)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL |t| (|spadConstant| $ 122) (QREFELT $ 36))
                    (CONS 1 "failed"))
                   (#1# (CONS 0 (SPADCALL |t| (QREFELT $ 78))))))))
           (#1# (CONS 0 |l|)))))) 

(SDEFUN |SOLVETRA;ker2Poly|
        ((|k| |Kernel| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Polynomial| (|Expression| R)))
        (SPROG ((|nm| (|Symbol|)))
               (COND
                ((SPADCALL
                  (LETT |nm| (SPADCALL |k| (QREFELT $ 126))
                        |SOLVETRA;ker2Poly|)
                  |lvar| (QREFELT $ 127))
                 (SPADCALL |nm| (QREFELT $ 194)))
                ('T
                 (SPADCALL (SPADCALL |k| (QREFELT $ 110)) (QREFELT $ 195)))))) 

(SDEFUN |SOLVETRA;smp2Poly|
        ((|pol| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|lvar| |List| (|Symbol|)) ($ |Polynomial| (|Expression| R)))
        (SPROG NIL
               (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR $ |lvar|))
                         (CONS #'|SOLVETRA;smp2Poly!1| $) |pol|
                         (QREFELT $ 199)))) 

(SDEFUN |SOLVETRA;smp2Poly!1| ((|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |y| (QREFELT $ 121)) (QREFELT $ 195))) 

(SDEFUN |SOLVETRA;smp2Poly!0| ((|x| NIL) ($$ NIL))
        (PROG (|lvar| $)
          (LETT |lvar| (QREFELT $$ 1) . #1=(|SOLVETRA;smp2Poly|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SOLVETRA;ker2Poly| |x| |lvar| $))))) 

(SDEFUN |SOLVETRA;makeFracPoly|
        ((|expr| |Expression| R) (|lvar| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Expression| R))))
        (SPADCALL
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 60)) |lvar| $)
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 200)) |lvar| $)
         (QREFELT $ 202))) 

(SDEFUN |SOLVETRA;makeREpol|
        ((|pol| |Polynomial| (|Expression| R)) ($ |Expression| R))
        (SPROG
         ((|lval| (|List| (|Expression| R))) (#1=#:G467 NIL) (|v| NIL)
          (#2=#:G466 NIL) (|lvar| (|List| (|Symbol|))))
         (SEQ
          (LETT |lvar| (SPADCALL |pol| (QREFELT $ 203))
                . #3=(|SOLVETRA;makeREpol|))
          (LETT |lval|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 34)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT $ 204))
                     (QREFELT $ 205)))))) 

(SDEFUN |SOLVETRA;makeRE|
        ((|frac| |Fraction| (|Polynomial| (|Expression| R)))
         ($ |Expression| R))
        (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 206)) $)
                  (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 207)) $)
                  (QREFELT $ 96))) 

(SDEFUN |SOLVETRA;solve1Pol|
        ((|pol| |Polynomial| (|Expression| R)) (|var| |Symbol|)
         (|sol| |List| (|Equation| (|Expression| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G473 NIL) (|vsol| NIL) (#2=#:G472 NIL)
          (|vsols| (|List| (|Equation| (|Expression| R))))
          (|repol| (|Expression| R)))
         (SEQ
          (LETT |repol|
                (SPADCALL (|SOLVETRA;makeREpol| |pol| $) |sol| (QREFELT $ 209))
                . #3=(|SOLVETRA;solve1Pol|))
          (LETT |vsols| (SPADCALL |repol| |var| (QREFELT $ 17)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |vsol| NIL . #3#) (LETT #1# |vsols| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |vsol| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (CONS |vsol| |sol|) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVETRA;solve1Sys|
        ((|plist| |List| (|Polynomial| (|Expression| R)))
         (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|sols| (|List| (|List| (|Equation| (|Expression| R)))))
          (#1=#:G475 NIL)
          (#2=#:G474 #3=(|List| (|List| (|Equation| (|Expression| R)))))
          (#4=#:G476 #3#) (#5=#:G482 NIL) (|sol| NIL) (#6=#:G480 NIL) (|p| NIL)
          (#7=#:G481 NIL) (|v| NIL) (|rlvar| (|List| (|Symbol|)))
          (|rplist| (|List| (|Polynomial| (|Expression| R)))))
         (SEQ (LETT |rplist| (REVERSE |plist|) . #8=(|SOLVETRA;solve1Sys|))
              (LETT |rlvar| (REVERSE |lvar|) . #8#)
              (LETT |sols| (SPADCALL NIL (QREFELT $ 210)) . #8#)
              (SEQ (LETT |v| NIL . #8#) (LETT #7# |rlvar| . #8#)
                   (LETT |p| NIL . #8#) (LETT #6# |rplist| . #8#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #8#) NIL)
                         (ATOM #7#) (PROGN (LETT |v| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |sols|
                           (PROGN
                            (LETT #1# NIL . #8#)
                            (SEQ (LETT |sol| NIL . #8#) (LETT #5# |sols| . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |sol| (CAR #5#) . #8#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|SOLVETRA;solve1Pol| |p| |v| |sol|
                                           $)
                                          . #8#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 211))
                                            . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                                 (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T NIL)))
                           . #8#)))
                   (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |sols|)))) 

(SDEFUN |SOLVETRA;frac_to_expr|
        ((|q| |Fraction|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
         ($ |Expression| R))
        (SPADCALL (SPADCALL |q| (QREFELT $ 213)) (SPADCALL |q| (QREFELT $ 214))
                  (QREFELT $ 215))) 

(SDEFUN |SOLVETRA;tryLinear|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
        (SPROG
         ((|eqs| (|List| (|Equation| (|Expression| R)))) (#1=#:G547 NIL)
          (|i| NIL) (#2=#:G546 NIL) (|sym| (|Expression| R)) (#3=#:G545 NIL)
          (|p| NIL) (|zeron| (|Vector| (|Expression| R)))
          (|rhs| (|Vector| (|Expression| R))) (#4=#:G518 NIL)
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #5="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (|vece| (|Vector| (|Expression| R))) (#6=#:G544 NIL) (|q| NIL)
          (#7=#:G543 NIL) (|mate| (|Matrix| (|Expression| R))) (#8=#:G542 NIL)
          (#9=#:G541 NIL) (#10=#:G540 NIL) (|row| NIL) (#11=#:G539 NIL)
          (|r|
           (|Record|
            (|:| |mat|
                 (|Matrix|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))
            (|:| |vec|
                 (|Vector|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))))
          (|ps|
           (|List|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (#12=#:G538 NIL) (|expr| NIL) (#13=#:G537 NIL) (#14=#:G529 NIL)
          (#15=#:G536 NIL) (|ker| NIL)
          (|kers| (|List| (|Kernel| (|Expression| R))))
          (|llk| (|List| (|List| (|Kernel| (|Expression| R)))))
          (#16=#:G535 NIL) (#17=#:G534 NIL) (#18=#:G489 NIL)
          (#19=#:G488 #20=(|Boolean|)) (#21=#:G490 #20#) (#22=#:G533 NIL)
          (#23=#:G486 NIL) (#24=#:G485 #25=(|Boolean|)) (#26=#:G487 #25#)
          (#27=#:G532 NIL) (|lvk| (|List| (|Kernel| (|Expression| R))))
          (#28=#:G531 NIL) (|v| NIL) (#29=#:G530 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lvk|
                  (PROGN
                   (LETT #29# NIL . #30=(|SOLVETRA;tryLinear|))
                   (SEQ (LETT |v| NIL . #30#) (LETT #28# |lvar| . #30#) G190
                        (COND
                         ((OR (ATOM #28#)
                              (PROGN (LETT |v| (CAR #28#) . #30#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #29# (CONS (SPADCALL |v| (QREFELT $ 38)) #29#)
                                . #30#)))
                        (LETT #28# (CDR #28#) . #30#) (GO G190) G191
                        (EXIT (NREVERSE #29#))))
                  . #30#)
            (EXIT
             (COND
              ((OR
                (PROGN
                 (LETT #23# NIL . #30#)
                 (SEQ (LETT |expr| NIL . #30#) (LETT #27# |lexpr| . #30#) G190
                      (COND
                       ((OR (ATOM #27#)
                            (PROGN (LETT |expr| (CAR #27#) . #30#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #26#
                               (SPADCALL
                                (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                          |lvk| (QREFELT $ 217))
                                1 (QREFELT $ 14))
                               . #30#)
                         (COND
                          (#23# (LETT #24# (COND (#24# 'T) ('T #26#)) . #30#))
                          ('T
                           (PROGN
                            (LETT #24# #26# . #30#)
                            (LETT #23# 'T . #30#)))))))
                      (LETT #27# (CDR #27#) . #30#) (GO G190) G191 (EXIT NIL))
                 (COND (#23# #24#) (#31='T NIL)))
                (PROGN
                 (LETT #18# NIL . #30#)
                 (SEQ (LETT |expr| NIL . #30#) (LETT #22# |lexpr| . #30#) G190
                      (COND
                       ((OR (ATOM #22#)
                            (PROGN (LETT |expr| (CAR #22#) . #30#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #21#
                               (NULL
                                (NULL
                                 (SPADCALL |lvk|
                                           (SPADCALL
                                            (SPADCALL |expr| (QREFELT $ 200))
                                            (QREFELT $ 218))
                                           (QREFELT $ 219))))
                               . #30#)
                         (COND
                          (#18# (LETT #19# (COND (#19# 'T) ('T #21#)) . #30#))
                          ('T
                           (PROGN
                            (LETT #19# #21# . #30#)
                            (LETT #18# 'T . #30#)))))))
                      (LETT #22# (CDR #22#) . #30#) (GO G190) G191 (EXIT NIL))
                 (COND (#18# #19#) (#31# NIL))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |llk|
                      (PROGN
                       (LETT #17# NIL . #30#)
                       (SEQ (LETT |expr| NIL . #30#) (LETT #16# |lexpr| . #30#)
                            G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |expr| (CAR #16#) . #30#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (SPADCALL |expr| (QREFELT $ 220))
                                          #17#)
                                    . #30#)))
                            (LETT #16# (CDR #16#) . #30#) (GO G190) G191
                            (EXIT (NREVERSE #17#))))
                      . #30#)
                (LETT |kers| (SPADCALL (ELT $ 222) |llk| (QREFELT $ 225))
                      . #30#)
                (SEQ (LETT |ker| NIL . #30#) (LETT #15# |kers| . #30#) G190
                     (COND
                      ((OR (ATOM #15#)
                           (PROGN (LETT |ker| (CAR #15#) . #30#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |ker| (QREFELT $ 227)) 0) "iterate")
                        ((NULL
                          (NULL
                           (SPADCALL |lvar|
                                     (SPADCALL (SPADCALL |ker| (QREFELT $ 110))
                                               (QREFELT $ 11))
                                     (QREFELT $ 228))))
                         (PROGN
                          (LETT #14# (CONS 1 "failed") . #30#)
                          (GO #32=#:G528))))))
                     (LETT #15# (CDR #15#) . #30#) (GO G190) G191 (EXIT NIL))
                (LETT |ps|
                      (PROGN
                       (LETT #13# NIL . #30#)
                       (SEQ (LETT |expr| NIL . #30#) (LETT #12# |lexpr| . #30#)
                            G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |expr| (CAR #12#) . #30#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |expr| (QREFELT $ 60))
                                          #13#)
                                    . #30#)))
                            (LETT #12# (CDR #12#) . #30#) (GO G190) G191
                            (EXIT (NREVERSE #13#))))
                      . #30#)
                (LETT |r| (SPADCALL |ps| |lvk| (QREFELT $ 232)) . #30#)
                (LETT |mate|
                      (SPADCALL
                       (PROGN
                        (LETT #11# NIL . #30#)
                        (SEQ (LETT |row| NIL . #30#)
                             (LETT #10# (SPADCALL (QCAR |r|) (QREFELT $ 235))
                                   . #30#)
                             G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |row| (CAR #10#) . #30#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #11#
                                     (CONS
                                      (PROGN
                                       (LETT #9# NIL . #30#)
                                       (SEQ (LETT |q| NIL . #30#)
                                            (LETT #8# |row| . #30#) G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |q| (CAR #8#) . #30#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (|SOLVETRA;frac_to_expr|
                                                      |q| $)
                                                     #9#)
                                                    . #30#)))
                                            (LETT #8# (CDR #8#) . #30#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      #11#)
                                     . #30#)))
                             (LETT #10# (CDR #10#) . #30#) (GO G190) G191
                             (EXIT (NREVERSE #11#))))
                       (QREFELT $ 238))
                      . #30#)
                (LETT |vece|
                      (SPADCALL
                       (PROGN
                        (LETT #7# NIL . #30#)
                        (SEQ (LETT |q| NIL . #30#)
                             (LETT #6# (SPADCALL (QCDR |r|) (QREFELT $ 241))
                                   . #30#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |q| (CAR #6#) . #30#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (|SOLVETRA;frac_to_expr| |q| $) #7#)
                                     . #30#)))
                             (LETT #6# (CDR #6#) . #30#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       (QREFELT $ 243))
                      . #30#)
                (LETT |sol| (SPADCALL |mate| |vece| (QREFELT $ 247)) . #30#)
                (EXIT
                 (COND ((QEQCAR (QCAR |sol|) 1) (CONS 0 NIL))
                       (#31#
                        (SEQ
                         (LETT |rhs|
                               (PROG2 (LETT #4# (QCAR |sol|) . #30#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|Vector|
                                                  (|Expression| (QREFELT $ 6)))
                                                 (|Union|
                                                  (|Vector|
                                                   (|Expression|
                                                    (QREFELT $ 6)))
                                                  #5#)
                                                 #4#))
                               . #30#)
                         (LETT |zeron|
                               (SPADCALL (LENGTH |lvar|) (QREFELT $ 248))
                               . #30#)
                         (SEQ (LETT |p| NIL . #30#)
                              (LETT #3# (QCDR |sol|) . #30#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |p| (CAR #3#) . #30#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |p| |zeron| (QREFELT $ 251))
                                  (SEQ
                                   (LETT |sym|
                                         (SPADCALL (SPADCALL (QREFELT $ 33))
                                                   (QREFELT $ 34))
                                         . #30#)
                                   (EXIT
                                    (SEQ (LETT |i| 1 . #30#)
                                         (LETT #2# (LENGTH |lvar|) . #30#) G190
                                         (COND
                                          ((|greater_SI| |i| #2#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SPADCALL |rhs| |i|
                                                     (SPADCALL
                                                      (SPADCALL |rhs| |i|
                                                                (QREFELT $
                                                                         252))
                                                      (SPADCALL |sym|
                                                                (SPADCALL |p|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           252))
                                                                (QREFELT $
                                                                         124))
                                                      (QREFELT $ 123))
                                                     (QREFELT $ 253))))
                                         (LETT |i| (|inc_SI| |i|) . #30#)
                                         (GO G190) G191 (EXIT NIL))))))))
                              (LETT #3# (CDR #3#) . #30#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |eqs| NIL . #30#)
                         (SEQ (LETT |i| 1 . #30#)
                              (LETT #1# (LENGTH |lvar|) . #30#) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |eqs|
                                      (SPADCALL |eqs|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lvar| |i|
                                                             (QREFELT $ 254))
                                                   (QREFELT $ 34))
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT $ 252))
                                                  (QREFELT $ 35)))
                                                (QREFELT $ 58))
                                      . #30#)))
                              (LETT |i| (|inc_SI| |i|) . #30#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 (LIST |eqs|)))))))))))))
          #32# (EXIT #14#)))) 

(SDEFUN |SOLVETRA;solveList|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|l| (|List| (|List| (|List| (|Equation| (|Expression| R))))))
          (#1=#:G559 NIL) (|plist| NIL) (#2=#:G558 NIL)
          (|trianglist| (|List| (|List| (|Polynomial| (|Expression| R)))))
          (|lfrac| (|List| (|Fraction| (|Polynomial| (|Expression| R)))))
          (#3=#:G557 NIL) (|expr| NIL) (#4=#:G556 NIL)
          (|ans1|
           (|Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed")))
         (SEQ
          (LETT |ans1| (|SOLVETRA;solveRetract| |lexpr| |lvar| $)
                . #5=(|SOLVETRA;solveList|))
          (EXIT
           (COND
            ((QEQCAR |ans1| 1)
             (SEQ (LETT |ans1| (|SOLVETRA;tryLinear| |lexpr| |lvar| $) . #5#)
                  (EXIT
                   (COND
                    ((QEQCAR |ans1| 1)
                     (SEQ
                      (LETT |lfrac|
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |expr| NIL . #5#)
                                  (LETT #3# |lexpr| . #5#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |expr| (CAR #3#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (|SOLVETRA;makeFracPoly| |expr|
                                            |lvar| $)
                                           #4#)
                                          . #5#)))
                                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            . #5#)
                      (LETT |trianglist|
                            (SPADCALL |lfrac| |lvar| (QREFELT $ 258)) . #5#)
                      (LETT |l|
                            (PROGN
                             (LETT #2# NIL . #5#)
                             (SEQ (LETT |plist| NIL . #5#)
                                  (LETT #1# |trianglist| . #5#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |plist| (CAR #1#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|SOLVETRA;solve1Sys| |plist| |lvar|
                                            $)
                                           #2#)
                                          . #5#)))
                                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            . #5#)
                      (EXIT (SPADCALL (ELT $ 211) |l| NIL (QREFELT $ 261)))))
                    (#6='T (QCDR |ans1|))))))
            (#6# (QCDR |ans1|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;37|
        ((|leqs| |List| (|Equation| (|Expression| R)))
         (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|lexpr| (|List| (|Expression| R))) (#1=#:G564 NIL) (|eq| NIL)
          (#2=#:G563 NIL))
         (SEQ
          (LETT |lexpr|
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVETRA;solve;LLL;37|))
                 (SEQ (LETT |eq| NIL . #3#) (LETT #1# |leqs| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 20))
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 22))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (|SOLVETRA;solveList| |lexpr| |lvar| $))))) 

(SDEFUN |SOLVETRA;solve;LLL;38|
        ((|leqs| |List| (|Equation| (|Expression| R)))
         (|lker| |List| (|Kernel| (|Expression| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G591 NIL) (|neq| NIL) (#2=#:G590 NIL) (#3=#:G589 NIL)
          (|sol| NIL) (#4=#:G588 NIL) (|lval2| (|List| (|Expression| R)))
          (#5=#:G587 NIL) (|k| NIL) (#6=#:G586 NIL)
          (|lker2| (|List| (|Kernel| (|Expression| R)))) (#7=#:G585 NIL)
          (|v| NIL) (#8=#:G584 NIL)
          (|ans| (|List| (|List| (|Equation| (|Expression| R)))))
          (|nlexpr| (|List| (|Expression| R))) (#9=#:G583 NIL) (|expr| NIL)
          (#10=#:G582 NIL) (|lval| (|List| (|Expression| R))) (#11=#:G581 NIL)
          (#12=#:G580 NIL) (|lvar| (|List| (|Symbol|))) (#13=#:G579 NIL)
          (#14=#:G578 NIL) (|lexpr| (|List| (|Expression| R))) (#15=#:G577 NIL)
          (|eq| NIL) (#16=#:G576 NIL))
         (SEQ
          (LETT |lexpr|
                (PROGN
                 (LETT #16# NIL . #17=(|SOLVETRA;solve;LLL;38|))
                 (SEQ (LETT |eq| NIL . #17#) (LETT #15# |leqs| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |eq| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 20))
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 22))
                               #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lvar|
                (PROGN
                 (LETT #14# NIL . #17#)
                 (SEQ (LETT |k| NIL . #17#) (LETT #13# |lker| . #17#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |k| (CAR #13#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14# (CONS (SPADCALL (QREFELT $ 33)) #14#)
                              . #17#)))
                      (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #17#)
          (LETT |lval|
                (PROGN
                 (LETT #12# NIL . #17#)
                 (SEQ (LETT |v| NIL . #17#) (LETT #11# |lvar| . #17#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |v| (CAR #11#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12# (CONS (SPADCALL |v| (QREFELT $ 34)) #12#)
                              . #17#)))
                      (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #17#)
          (LETT |nlexpr|
                (PROGN
                 (LETT #10# NIL . #17#)
                 (SEQ (LETT |expr| NIL . #17#) (LETT #9# |lexpr| . #17#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |expr| (CAR #9#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL |expr| |lker| |lval| (QREFELT $ 263))
                               #10#)
                              . #17#)))
                      (LETT #9# (CDR #9#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #17#)
          (LETT |ans| (|SOLVETRA;solveList| |nlexpr| |lvar| $) . #17#)
          (LETT |lker2|
                (PROGN
                 (LETT #8# NIL . #17#)
                 (SEQ (LETT |v| NIL . #17#) (LETT #7# |lvar| . #17#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |v| (CAR #7#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (SPADCALL |v| (QREFELT $ 38)) #8#)
                              . #17#)))
                      (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #17#)
          (LETT |lval2|
                (PROGN
                 (LETT #6# NIL . #17#)
                 (SEQ (LETT |k| NIL . #17#) (LETT #5# |lker| . #17#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |k| (QREFELT $ 110)) #6#)
                              . #17#)))
                      (LETT #5# (CDR #5#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #17#)
          (EXIT
           (PROGN
            (LETT #4# NIL . #17#)
            (SEQ (LETT |sol| NIL . #17#) (LETT #3# |ans| . #17#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |sol| (CAR #3#) . #17#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #17#)
                           (SEQ (LETT |neq| NIL . #17#) (LETT #1# |sol| . #17#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN
                                       (LETT |neq| (CAR #1#) . #17#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (CONS #'|SOLVETRA;solve;LLL;38!0|
                                                (VECTOR $ |lval2| |lker2|))
                                          |neq| (QREFELT $ 265))
                                         #2#)
                                        . #17#)))
                                (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #17#)))
                 (LETT #3# (CDR #3#) . #17#) (GO G190) G191
                 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SOLVETRA;solve;LLL;38!0| ((|e| NIL) ($$ NIL))
        (PROG (|lker2| |lval2| $)
          (LETT |lker2| (QREFELT $$ 2) . #1=(|SOLVETRA;solve;LLL;38|))
          (LETT |lval2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |e| |lker2| |lval2| (QREFELT $ 263)))))) 

(SDEFUN |SOLVETRA;retract2|
        ((|e| |Expression| R) ($ |Kernel| (|Expression| R)))
        (SPROG ((|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |e| (QREFELT $ 155)) |SOLVETRA;retract2|)
                (EXIT
                 (COND
                  ((QEQCAR |k| 1)
                   (|error|
                    "solve$TransSolvePackage: variable is not a single kernel"))
                  ('T (QCDR |k|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;40|
        ((|leqs| |List| (|Equation| (|Expression| R)))
         (|lexpr| |List| (|Expression| R))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|lker| (|List| (|Kernel| (|Expression| R)))) (#1=#:G601 NIL)
          (|e| NIL) (#2=#:G600 NIL))
         (SEQ
          (LETT |lker|
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVETRA;solve;LLL;40|))
                 (SEQ (LETT |e| NIL . #3#) (LETT #1# |lexpr| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SOLVETRA;retract2| |e| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |leqs| |lker| (QREFELT $ 266)))))) 

(DECLAIM (NOTINLINE |TransSolvePackage;|)) 

(DEFUN |TransSolvePackage| (#1=#:G602)
  (SPROG NIL
         (PROG (#2=#:G603)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TransSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|TransSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TransSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TransSolvePackage|)))))))))) 

(DEFUN |TransSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TransSolvePackage|))
          (LETT |dv$| (LIST '|TransSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 268) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TransSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TransSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Expression| 6) (0 . |zero?|) (|List| 16) (5 . |variables|)
              (10 . |One|) (|NonNegativeInteger|) (14 . >) (|List| 19)
              (|Symbol|) |SOLVETRA;solve;ESL;5| |SOLVETRA;solve;EL;1|
              (|Equation| 8) (20 . |lhs|) (25 . |rhs|) (30 . -)
              |SOLVETRA;solve;EL;2| |SOLVETRA;solve;ESL;3|
              (|Union| 56 '#1="failed") (36 . |retractIfCan|)
              (|Union| (|Fraction| 56) '#1#) (41 . |retractIfCan|)
              (|Equation| $) (46 . |eval|)
              (|ElementaryFunctionStructurePackage| 6 8) (52 . |normalize|)
              (57 . |new|) (61 . |coerce|) (66 . =) (72 . =) (|Kernel| 8)
              (78 . |kernel|) (|Fraction| 52) (|Kernel| $) (83 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 42) (89 . |numer|)
              (|Factored| 42) (|ExpressionFactorPolynomial| 6 8)
              (94 . |factorPolynomial|)
              (|Record| (|:| |factor| 42) (|:| |exponent| 13)) (|List| 48)
              (99 . |factors|) (|List| $) (|SparseUnivariatePolynomial| $)
              (104 . |zerosOf|) (|List| 8) (110 . |append|) (|Integer|)
              (116 . |elt|) (122 . |append|)
              (|SparseMultivariatePolynomial| 6 40) (128 . |numer|)
              (133 . |coerce|) (|Factored| 52) (138 . |factorPolynomial|)
              (|AlgebraicManipulations| 6 8) (143 . |rootSimp|) (|Factored| 67)
              (|SparseMultivariatePolynomial| 6 37)
              (|MultivariateFactorize| 37 (|IndexedExponents| 37) 6 67)
              (148 . |factor|) (|Record| (|:| |factor| 67) (|:| |exponent| 13))
              (|List| 70) (153 . |factors|)
              (|Record| (|:| |var| 40) (|:| |exponent| 56))
              (|Union| 73 '"failed") (158 . |isExpt|) (164 . |argument|)
              (169 . *) (175 . |log|) (|SparseUnivariatePolynomial| 6)
              (180 . |One|) (|Union| (|Fraction| (|Polynomial| 6)) '#1#)
              (184 . |retractIfCan|) (|List| 15)
              (|List| (|Fraction| (|Polynomial| 6))) (|RadicalSolvePackage| 6)
              (189 . |radicalSolve|) (|TranscendentalManipulations| 6 8)
              (195 . |simplify|) (200 . |normalize|)
              (|TrigonometricManipulations| 6 8) (206 . |complexNormalize|)
              (|List| 40) (212 . |kernels|) (217 . |numerator|)
              (222 . |coerce|) (227 . /) (233 . |tan|) (|PositiveInteger|)
              (238 . *) (244 . ^) (250 . |One|) (254 . -) (260 . |One|)
              (264 . -) (|TransSolvePackageService| 6) (269 . |decomposeFunc|)
              (276 . ~=) (|Fraction| $) (282 . |elt|) (288 . |coerce|)
              (293 . |second|) (298 . |retract|) (303 . |monomial|) (309 . -)
              (315 . |resultant|) (321 . |is?|) (|Union| 51 '"failed")
              (327 . |isPlus|) (332 . |leadingCoefficient|) (337 . |gcd|)
              (342 . |coerce|) (347 . |Zero|) (351 . +) (357 . *)
              (363 . |Zero|) (367 . |name|) (372 . |member?|) (378 . |isTimes|)
              (383 . |remove!|) (389 . |One|) (393 . |freeOf?|) (399 . ^)
              (|Table| 8 8) (405 . |table|) (409 . |Zero|) (413 . ~=)
              (419 . |leadingMonomial|) (|Union| 8 '"failed") (424 . |search|)
              (430 . |setelt!|) (437 . |elt|) (443 . |reductum|) (448 . |keys|)
              (453 . |is?|) (|Float|) (|Interval| 145) (459 . |interval|)
              (|Complex| 145) (464 . |convert|) (|Complex| 146)
              (|Mapping| 146 145) (|ComplexFunctions2| 145 146) (469 . |map|)
              (|Union| 40 '#1#) (475 . |retractIfCan|) (480 . |asin|)
              (485 . |acos|) (490 . |atan|) (495 . |acot|) (500 . |asec|)
              (505 . |acsc|) (510 . |asinh|) (515 . |acosh|) (520 . |atanh|)
              (525 . |acoth|) (530 . |asech|) (535 . |acsch|) (540 . |cot|)
              (545 . |sin|) (550 . |cos|) (555 . |sec|) (560 . |csc|)
              (565 . |sinh|) (570 . |cosh|) (575 . |tanh|) (580 . |coth|)
              (585 . |sech|) (590 . |csch|) (|Expression| 150)
              (|Mapping| 150 6) (|ExpressionFunctions2| 6 150) (595 . |map|)
              (|Union| 150 '#1#) (601 . |retractIfCan|) (606 . |exp|)
              (611 . |imag|) (616 . |pi|) (620 . -) (625 . |inf|) (630 . <)
              (636 . |sup|) (641 . <=) (|Polynomial| 8) (647 . |coerce|)
              (652 . |coerce|) (|Mapping| 193 37) (|Mapping| 193 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 37) 37 6 67 193)
              (657 . |map|) (664 . |denom|) (|Fraction| 193) (669 . /)
              (675 . |variables|) (680 . |eval|) (687 . |ground|)
              (692 . |numer|) (697 . |denom|) (|List| 29) (702 . |eval|)
              (708 . |list|) (713 . |append|) (|Fraction| 67) (719 . |numer|)
              (724 . |denom|) (729 . /) (|List| 37) (735 . |totalDegree|)
              (741 . |variables|) (746 . |setIntersection|) (752 . |tower|)
              (757 . |setUnion|) (763 . |setUnion|) (|Mapping| 216 216 216)
              (|List| 216) (769 . |reduce|) (|Union| 16 '"failed")
              (775 . |symbolIfCan|) (780 . |setIntersection|)
              (|Record| (|:| |mat| 234) (|:| |vec| 240)) (|List| 67)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 37) 37 67)
              (786 . |intoMatrix|) (|List| 239) (|Matrix| 212)
              (792 . |listOfLists|) (|List| 54) (|Matrix| 8) (797 . |matrix|)
              (|List| 212) (|Vector| 212) (802 . |parts|) (|Vector| 8)
              (807 . |vector|) (|Union| 242 '"failed")
              (|Record| (|:| |particular| 244) (|:| |basis| (|List| 242)))
              (|LinearSystemMatrixPackage| 8 242 242 237) (812 . |solve|)
              (818 . |zero|) (|Vector| $) (823 . |basis|) (827 . ~=)
              (833 . |elt|) (839 . |setelt!|) (846 . |elt|)
              (|List| (|List| 193)) (|List| 201) (|SystemSolvePackage| 8)
              (852 . |triangularSystems|) (|Mapping| 83 83 83) (|List| 83)
              (858 . |reduce|) |SOLVETRA;solve;LLL;37| (865 . |eval|)
              (|Mapping| 8 8) (872 . |map|) |SOLVETRA;solve;LLL;38|
              |SOLVETRA;solve;LLL;40|)
           '#(|solve| 878) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 267
                                                 '(1 8 7 0 9 1 8 10 0 11 0 6 0
                                                   12 2 13 7 0 0 14 1 19 8 0 20
                                                   1 19 8 0 21 2 8 0 0 0 22 1 8
                                                   25 0 26 1 8 27 0 28 2 8 0 0
                                                   29 30 1 31 8 8 32 0 16 0 33
                                                   1 8 0 16 34 2 19 0 8 8 35 2
                                                   8 7 0 0 36 1 37 0 16 38 2 8
                                                   39 0 40 41 1 43 42 0 44 1 46
                                                   45 42 47 1 45 49 0 50 2 8 51
                                                   52 16 53 2 54 0 0 0 55 2 54
                                                   8 0 56 57 2 15 0 0 0 58 1 8
                                                   59 0 60 1 8 0 59 61 1 8 62
                                                   52 63 1 64 8 8 65 1 68 66 67
                                                   69 1 66 71 0 72 2 8 74 0 16
                                                   75 1 37 54 0 76 2 8 0 56 0
                                                   77 1 8 0 0 78 0 79 0 80 1 8
                                                   81 0 82 2 85 83 84 10 86 1
                                                   87 8 8 88 2 31 8 8 16 89 2
                                                   90 8 8 16 91 1 8 92 0 93 1 8
                                                   0 0 94 1 8 0 56 95 2 8 0 0 0
                                                   96 1 8 0 0 97 2 8 0 98 0 99
                                                   2 8 0 0 98 100 0 19 0 101 2
                                                   19 0 8 0 102 0 8 0 103 1 8 0
                                                   0 104 3 105 43 43 43 43 106
                                                   2 43 7 0 0 107 2 42 8 108 8
                                                   109 1 8 0 40 110 1 54 8 0
                                                   111 1 8 56 0 112 2 42 0 8 13
                                                   113 2 42 0 0 0 114 2 42 8 0
                                                   0 115 2 8 7 0 16 116 1 8 117
                                                   0 118 1 67 6 0 119 1 6 0 51
                                                   120 1 8 0 6 121 0 8 0 122 2
                                                   8 0 0 0 123 2 8 0 0 0 124 0
                                                   6 0 125 1 37 16 0 126 2 10 7
                                                   16 0 127 1 8 117 0 128 2 54
                                                   0 8 0 129 0 56 0 130 2 8 7 0
                                                   16 131 2 8 0 0 0 132 0 133 0
                                                   134 0 79 0 135 2 8 7 0 0 136
                                                   1 67 0 0 137 2 133 138 8 0
                                                   139 3 133 8 0 8 8 140 2 133
                                                   8 0 8 141 1 67 0 0 142 1 133
                                                   54 0 143 2 37 7 0 16 144 1
                                                   146 0 145 147 1 6 148 0 149
                                                   2 152 150 151 148 153 1 8
                                                   154 0 155 1 8 0 0 156 1 8 0
                                                   0 157 1 8 0 0 158 1 8 0 0
                                                   159 1 8 0 0 160 1 8 0 0 161
                                                   1 8 0 0 162 1 8 0 0 163 1 8
                                                   0 0 164 1 8 0 0 165 1 8 0 0
                                                   166 1 8 0 0 167 1 8 0 0 168
                                                   1 8 0 0 169 1 8 0 0 170 1 8
                                                   0 0 171 1 8 0 0 172 1 8 0 0
                                                   173 1 8 0 0 174 1 8 0 0 175
                                                   1 8 0 0 176 1 8 0 0 177 1 8
                                                   0 0 178 2 181 179 180 8 182
                                                   1 179 183 0 184 1 8 0 0 185
                                                   1 150 146 0 186 0 145 0 187
                                                   1 145 0 0 188 1 146 145 0
                                                   189 2 145 7 0 0 190 1 146
                                                   145 0 191 2 145 7 0 0 192 1
                                                   193 0 16 194 1 193 0 8 195 3
                                                   198 193 196 197 67 199 1 8
                                                   59 0 200 2 201 0 193 193 202
                                                   1 193 10 0 203 3 193 0 0 10
                                                   54 204 1 193 8 0 205 1 201
                                                   193 0 206 1 201 193 0 207 2
                                                   8 0 0 208 209 1 83 0 15 210
                                                   2 83 0 0 0 211 1 212 67 0
                                                   213 1 212 67 0 214 2 8 0 59
                                                   59 215 2 67 13 0 216 217 1
                                                   67 216 0 218 2 216 0 0 0 219
                                                   1 8 92 0 220 2 15 0 0 0 221
                                                   2 216 0 0 0 222 2 224 216
                                                   223 0 225 1 37 226 0 227 2
                                                   10 0 0 0 228 2 231 229 230
                                                   216 232 1 234 233 0 235 1
                                                   237 0 236 238 1 240 239 0
                                                   241 1 242 0 54 243 2 246 245
                                                   237 242 247 1 242 0 13 248 0
                                                   150 249 250 2 242 7 0 0 251
                                                   2 242 8 0 56 252 3 242 8 0
                                                   56 8 253 2 10 16 0 56 254 2
                                                   257 255 256 10 258 3 260 83
                                                   259 0 83 261 3 8 0 0 92 51
                                                   263 2 19 0 264 0 265 1 0 15
                                                   8 18 2 0 15 19 16 24 1 0 15
                                                   19 23 2 0 83 15 10 262 2 0
                                                   15 8 16 17 2 0 83 15 54 267
                                                   2 0 83 15 216 266)))))
           '|lookupComplete|)) 
