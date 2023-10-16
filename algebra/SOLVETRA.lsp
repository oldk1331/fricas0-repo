
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
        (SPROG ((#1=#:G212 NIL) (|sol| NIL) (#2=#:G211 NIL))
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
         ((#1=#:G242 NIL) (|sols| (|List| (|Equation| (|Expression| R))))
          (#2=#:G249 NIL) (|frec| NIL)
          (|lfacts|
           (|List|
            (|Record|
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|Integer|)))))
          (|listofkernels| #3=(|List| (|Expression| R)))
          (|newlside| (|Expression| R))
          (|newlist| (|List| (|Equation| (|Expression| R)))) (#4=#:G248 NIL)
          (|j| NIL) (|secondsol| #5=(|List| (|Expression| R))) (#6=#:G228 NIL)
          (#7=#:G227 #5#) (#8=#:G229 #5#) (#9=#:G247 NIL) (|ff| NIL)
          (|lfatt|
           (|List|
            (|Record|
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| (|Integer|)))))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elR| (|Expression| R)) (#10=#:G246 NIL) (|i| NIL) (#11=#:G223 NIL)
          (#12=#:G222 #13=(|List| (|Equation| (|Expression| R))))
          (#14=#:G224 #13#) (#15=#:G245 NIL) (|ri| NIL)
          (|bigX_back| (|Expression| R)) (#16=#:G218 NIL)
          (|r1| (|List| (|Expression| R)))
          (|finv| (|Union| (|Expression| R) #17="failed")) (#18=#:G244 NIL)
          (|lr| #5#) (#19=#:G215 NIL) (#20=#:G214 #5#) (#21=#:G216 #5#)
          (#22=#:G243 NIL) (|fatt| NIL) (|eq1| (|Expression| R))
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
                          (SPADCALL |eq1|
                                    (|SPADfirst|
                                     (SPADCALL (SPADCALL X (QREFELT $ 34))
                                               (QREFELT $ 38)))
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
                         (PROGN (LETT #1# NIL . #23#) (GO #25=#:G241))))
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
                                (SPADCALL |elR| (SPADCALL |x| (QREFELT $ 63))
                                          (QREFELT $ 41))
                                . #23#)
                          (LETT |lfatt|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                           (QREFELT $ 65))
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
                                           (QREFELT $ 67))
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
                                     (QREFELT $ 71))
                           (QREFELT $ 74))
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
          (LETT |u| (SPADCALL |f| '|exp| (QREFELT $ 77))
                . #1=(|SOLVETRA;simplifyingLog|))
          (EXIT
           (COND
            ((QEQCAR |u| 0)
             (SEQ (LETT |rec| (QCDR |u|) . #1#)
                  (EXIT
                   (SPADCALL (QCDR |rec|)
                             (|SPADfirst|
                              (SPADCALL (QCAR |rec|) (QREFELT $ 78)))
                             (QREFELT $ 79)))))
            ('T (SPADCALL |f| (QREFELT $ 80)))))))) 

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
         ((|nlexpr| (|List| (|Fraction| (|Polynomial| R)))) (#1=#:G272 NIL)
          (|rf| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (#2=#:G273 NIL) (|expr| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nlexpr| NIL . #3=(|SOLVETRA;solveRetract|))
                (SEQ (LETT |expr| NIL . #3#) (LETT #2# |lexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |expr| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT $ 84)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |rf| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #4=#:G271)))
                            ('T
                             (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|)
                                   . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT $ 88))))))
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
             (LETT |convLside| (SPADCALL |lside| (QREFELT $ 90))
                   . #3=(|SOLVETRA;tryToTrans|))
             (LETT |resultLside| |convLside| . #3#)
             (LETT |listConvLside| (|SOLVETRA;tableXkernels| |convLside| |x| $)
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |NormConvLside|
                       (SPADCALL |convLside| |x| (QREFELT $ 91)) . #3#)
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
             (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT $ 91)) . #3#)
             (LETT |NormConvLside| |NormConvLside| . #3#)
             (LETT |resultLside| |NormConvLside| . #3#)
             (LETT |listConvLside|
                   (|SOLVETRA;tableXkernels| |NormConvLside| |x| $) . #3#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |cnormConvLside| (SPADCALL |lside| |x| (QREFELT $ 93))
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
         ((|resultnew| #1=(|Expression| R)) (|result1| (|Expression| R))
          (#2=#:G292 NIL)
          (|result|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|newH|
           #3=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (H (|Expression| R)) (|g| #3#) (|secondfun| (|Expression| R))
          (|f| #3#) (|fN| (|Expression| R)) (|fZ| #1#) (|test| (|Boolean|))
          (Y (|Expression| R)) (|varkern| (|Expression| R))
          (|listofkern| (|List| (|Expression| R))) (Z (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ (LETT Z (SPADCALL (QREFELT $ 33)) . #4=(|SOLVETRA;subsTan|))
                (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| $)
                      . #4#)
                (LETT |varkern| (|SPADfirst| |listofkern|) . #4#)
                (LETT Y
                      (SPADCALL
                       (SPADCALL
                        (|SPADfirst|
                         (SPADCALL
                          (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 38)))
                          (QREFELT $ 78)))
                        (QREFELT $ 60))
                       (QREFELT $ 61))
                      . #4#)
                (LETT |test|
                      (SPADCALL |varkern|
                                (SPADCALL
                                 (SPADCALL Y (SPADCALL 2 (QREFELT $ 94))
                                           (QREFELT $ 95))
                                 (QREFELT $ 96))
                                (QREFELT $ 36))
                      . #4#)
                (COND
                 ((EQL (LENGTH |listofkern|) 1)
                  (COND
                   ((NULL |test|)
                    (PROGN (LETT #2# |exprvar| . #4#) (GO #5=#:G291)))))
                 (#6='T (PROGN (LETT #2# |exprvar| . #4#) (GO #5#))))
                (LETT |fZ|
                      (SPADCALL |exprvar|
                                (SPADCALL |varkern| (SPADCALL Z (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 30))
                      . #4#)
                (LETT |fN|
                      (SPADCALL (SPADCALL |fZ| (QREFELT $ 60)) (QREFELT $ 61))
                      . #4#)
                (LETT |f|
                      (SPADCALL |fN|
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT |secondfun|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 Y (QREFELT $ 98))
                                 (SPADCALL (SPADCALL Y 2 (QREFELT $ 99))
                                           (|spadConstant| $ 100)
                                           (QREFELT $ 22))
                                 (QREFELT $ 95))
                       (QREFELT $ 101))
                      . #4#)
                (LETT |g|
                      (SPADCALL |secondfun|
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL |y| (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT H (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34))
                      . #4#)
                (LETT |newH|
                      (SPADCALL H
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #4#)
                (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT $ 103)) . #4#)
                (EXIT
                 (COND
                  ((SPADCALL |result| |f| (QREFELT $ 104))
                   (PROGN (LETT #2# |exprvar| . #4#) (GO #5#)))
                  (#6#
                   (SEQ
                    (LETT |result1| (SPADCALL |result| H (QREFELT $ 106))
                          . #4#)
                    (EXIT
                     (LETT |resultnew|
                           (SPADCALL |result1|
                                     (SPADCALL H (SPADCALL Y (QREFELT $ 96))
                                               (QREFELT $ 35))
                                     (QREFELT $ 30))
                           . #4#))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;eliminateKernRoot|
        ((|var| |Expression| R) (|varkern| |Kernel| (|Expression| R))
         ($ |Expression| R))
        (SPROG
         ((|resultvar| (|Expression| R))
          (|var3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G301 NIL)
          (|var2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|var1| (|Expression| R)) (X (|Symbol|)))
         (SEQ
          (LETT X (SPADCALL (QREFELT $ 33))
                . #2=(|SOLVETRA;eliminateKernRoot|))
          (LETT |var1|
                (SPADCALL |var|
                          (SPADCALL (SPADCALL |varkern| (QREFELT $ 107))
                                    (SPADCALL X (QREFELT $ 34)) (QREFELT $ 35))
                          (QREFELT $ 30))
                . #2#)
          (LETT |var2|
                (SPADCALL
                 (SPADCALL |var1|
                           (|SPADfirst|
                            (SPADCALL (SPADCALL X (QREFELT $ 34))
                                      (QREFELT $ 38)))
                           (QREFELT $ 41))
                 (QREFELT $ 44))
                . #2#)
          (LETT |var3|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 100)
                           (PROG1
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |varkern| (QREFELT $ 78))
                                       (QREFELT $ 108))
                                      (QREFELT $ 109))
                                     . #2#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 110))
                 (SPADCALL (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 78))) 0
                           (QREFELT $ 110))
                 (QREFELT $ 111))
                . #2#)
          (EXIT
           (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT $ 112)) . #2#))))) 

(SDEFUN |SOLVETRA;eliminateRoot|
        ((|var| . #1=(|Expression| R)) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|var1| #1#) (#2=#:G310 NIL) (|i| NIL)
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
                             ((SPADCALL |i| '|nthRoot| (QREFELT $ 113))
                              (LETT |var1|
                                    (|SOLVETRA;eliminateKernRoot| |var1|
                                     (|SPADfirst|
                                      (SPADCALL |i| (QREFELT $ 38)))
                                     $)
                                    . #3#)))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |var1|)))) 

(SDEFUN |SOLVETRA;logsumtolog| ((|var| |Expression| R) ($ |Expression| R))
        (SPROG
         ((|var2| (|Expression| R)) (#1=#:G324 NIL) (|i| NIL)
          (|kernelofvar| (|List| (|Kernel| (|Expression| R))))
          (|newexpr| (|Expression| R)) (|exprlist| (|List| (|Expression| R)))
          (#2=#:G323 NIL) (|gcdcoeff| (|Expression| R))
          (|listforgcd| (|List| R)) (|exprcoeff| (R)) (#3=#:G322 NIL)
          (|listofexpr| (|Union| (|List| (|Expression| R)) "failed")))
         (SEQ
          (LETT |listofexpr| (SPADCALL |var| (QREFELT $ 115))
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
                                             (QREFELT $ 116))
                                   . #4#)
                             (EXIT
                              (LETT |listforgcd|
                                    (CONS |exprcoeff| |listforgcd|) . #4#)))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |gcdcoeff|
                             (SPADCALL (SPADCALL |listforgcd| (QREFELT $ 117))
                                       (QREFELT $ 118))
                             . #4#)
                       (LETT |newexpr| (|spadConstant| $ 119) . #4#)
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
                                                |gcdcoeff| (QREFELT $ 95))
                                               $)
                                              (QREFELT $ 120))
                                    . #4#)))
                            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |kernelofvar| (SPADCALL |newexpr| (QREFELT $ 38))
                             . #4#)
                       (LETT |var2| (|spadConstant| $ 100) . #4#)
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
                                               (SPADCALL |i| (QREFELT $ 78)))
                                              (QREFELT $ 121))
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (SPADCALL |gcdcoeff| (SPADCALL |var2| (QREFELT $ 80))
                                  (QREFELT $ 121)))))))))) 

(SDEFUN |SOLVETRA;testLog| ((|expr| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G331 NIL) (#2=#:G332 NIL) (|i| NIL)
          (|kernelofexpr| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|log|) . #3=(|SOLVETRA;testLog|))
                (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z $)
                      . #3#)
                (COND
                 ((EQL (LENGTH |kernelofexpr|) 0)
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G330))))
                (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofexpr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 123))
                          |testList| (QREFELT $ 124))
                         (COND
                          ((NULL
                            (|SOLVETRA;testkernel|
                             (|SPADfirst|
                              (SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                               (QREFELT $ 78)))
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
                (SPADCALL (SPADCALL |expr| (QREFELT $ 60)) (QREFELT $ 116))
                . #2=(|SOLVETRA;splitExpr|))
          (LETT |exprwcoeff| |expr| . #2#)
          (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT $ 125)) . #2#)
          (EXIT
           (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| $ 100) |expr|))
                 ('T
                  (SEQ
                   (LETT |listexpr|
                         (CONS 0
                               (SPADCALL (SPADCALL |lcoeff| (QREFELT $ 118))
                                         (QCDR |listexpr|) (QREFELT $ 126)))
                         . #2#)
                   (EXIT
                    (CONS (SPADCALL |lcoeff| (QREFELT $ 118))
                          (QCDR |listexpr|)))))))))) 

(SDEFUN |SOLVETRA;buildnexpr|
        ((|expr| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|ansmant| (|Expression| R)) (|anscoeff| (|Expression| R))
          (#1=#:G347 NIL) (|i| NIL) (|n2list| (|List| (|Expression| R)))
          (|nlist| (|List| (|Expression| R))))
         (SEQ
          (LETT |nlist| (|SOLVETRA;splitExpr| |expr| $)
                . #2=(|SOLVETRA;buildnexpr|))
          (LETT |n2list|
                (SPADCALL (SPADCALL |nlist| 1 (QREFELT $ 57)) |nlist|
                          (QREFELT $ 126))
                . #2#)
          (LETT |anscoeff| (|spadConstant| $ 100) . #2#)
          (LETT |ansmant| (|spadConstant| $ 119) . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |n2list| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| Z (QREFELT $ 128))
                   (LETT |anscoeff| (SPADCALL |i| |anscoeff| (QREFELT $ 121))
                         . #2#))
                  ('T (LETT |ansmant| |i| . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (LIST |anscoeff|
                 (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT $ 57))
                           (QREFELT $ 121))))))) 

(SDEFUN |SOLVETRA;logexpp|
        ((|expr1| |Expression| R) (|expr2| |Expression| R) ($ |Expression| R))
        (SPADCALL
         (SPADCALL
          (|SPADfirst|
           (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT $ 38)))
                     (QREFELT $ 78)))
          |expr2| (QREFELT $ 129))
         (QREFELT $ 80))) 

(SDEFUN |SOLVETRA;combineLog|
        ((|expr| |Expression| R) (Y |Symbol|) ($ |Expression| R))
        (SPROG
         ((|ansexpr| #1=(|Expression| R)) (#2=#:G365 NIL) (|i| NIL) (|ans| #1#)
          (|exprr| (|List| (|Expression| R))) (|loopexpr| (|Expression| R))
          (|exprtable| (|Table| (|Expression| R) (|Expression| R))))
         (SEQ
          (LETT |exprtable| (SPADCALL (QREFELT $ 131))
                . #3=(|SOLVETRA;combineLog|))
          (EXIT
           (COND ((QEQCAR (SPADCALL |expr| (QREFELT $ 115)) 1) |expr|)
                 ('T
                  (SEQ (LETT |ans| (|spadConstant| $ 119) . #3#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |expr| (|spadConstant| $ 119)
                                         (QREFELT $ 133)))
                              (GO G191)))
                            (SEQ
                             (LETT |loopexpr|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                              (QREFELT $ 134))
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
                                      |exprtable| (QREFELT $ 136))
                                     1)
                                    (SPADCALL |exprtable|
                                              (SPADCALL |exprr| 1
                                                        (QREFELT $ 57))
                                              (|spadConstant| $ 119)
                                              (QREFELT $ 137))))
                                  (EXIT
                                   (SPADCALL |exprtable|
                                             (SPADCALL |exprr| 1
                                                       (QREFELT $ 57))
                                             (SPADCALL
                                              (SPADCALL |exprtable|
                                                        (SPADCALL |exprr| 1
                                                                  (QREFELT $
                                                                           57))
                                                        (QREFELT $ 138))
                                              (SPADCALL |exprr| 2
                                                        (QREFELT $ 57))
                                              (QREFELT $ 120))
                                             (QREFELT $ 137)))))
                                ('T
                                 (LETT |ans|
                                       (SPADCALL |ans| |loopexpr|
                                                 (QREFELT $ 120))
                                       . #3#))))
                              ('T
                               (LETT |ans|
                                     (SPADCALL |ans| |loopexpr|
                                               (QREFELT $ 120))
                                     . #3#)))
                             (EXIT
                              (LETT |expr|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |expr| (QREFELT $ 60))
                                               (QREFELT $ 139))
                                     (QREFELT $ 61))
                                    . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |ansexpr| (|spadConstant| $ 119) . #3#)
                       (SEQ (LETT |i| NIL . #3#)
                            (LETT #2# (SPADCALL |exprtable| (QREFELT $ 140))
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
                                                          (QREFELT $ 138))
                                                $)
                                               |i| (QREFELT $ 121))
                                              (QREFELT $ 120))
                                    . #3#)))
                            (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (LETT |ansexpr|
                              (SPADCALL |ansexpr| |ans| (QREFELT $ 120))
                              . #3#))))))))) 

(SDEFUN |SOLVETRA;testRootk|
        ((|varlistk| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G371 NIL) (#2=#:G372 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|nthRoot|) . #3=(|SOLVETRA;testRootk|))
                (LETT |kernelofeqnvar|
                      (|SOLVETRA;tableXkernels| |varlistk| |y| $) . #3#)
                (COND
                 ((EQL (LENGTH |kernelofeqnvar|) 0)
                  (PROGN (LETT #1# NIL . #3#) (GO #4=#:G370))))
                (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#)
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 123))
                          |testList| (QREFELT $ 124))
                         (PROGN (LETT #1# 'T . #3#) (GO #4#))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tableXkernels|
        ((|evar| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|listkOfvar| (|List| (|Expression| R))) (#1=#:G377 NIL) (|i| NIL)
          (|kOfvar| (|List| (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |kOfvar| (SPADCALL |evar| (QREFELT $ 38))
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
                    (SPADCALL (SPADCALL |i| (QREFELT $ 107)) Z
                              (QREFELT $ 128)))
                   (LETT |listkOfvar|
                         (CONS (SPADCALL |i| (QREFELT $ 107)) |listkOfvar|)
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |listkOfvar|)))) 

(SDEFUN |SOLVETRA;testTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G384 NIL) (#2=#:G385 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |testList| (LIST '|sin| '|cos| '|tan| '|cot| '|sec| '|csc|)
                  . #3=(|SOLVETRA;testTrig|))
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3#)
            (COND
             ((EQL (LENGTH |kernelofeqnvar|) 0)
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G383))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 123))
                      |testList| (QREFELT $ 124))
                     (COND
                      ((NULL
                        (|SOLVETRA;testkernel|
                         (|SPADfirst|
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 78)))
                         Z $))
                       (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;testHTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G392 NIL) (#2=#:G393 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |testList|
                  (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech| '|csch|)
                  . #3=(|SOLVETRA;testHTrig|))
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $)
                  . #3#)
            (COND
             ((EQL (LENGTH |kernelofeqnvar|) 0)
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G391))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 123))
                      |testList| (QREFELT $ 124))
                     (COND
                      ((NULL
                        (|SOLVETRA;testkernel|
                         (|SPADfirst|
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 78)))
                         Z $))
                       (PROGN (LETT #1# NIL . #3#) (GO #4#)))))
                    ('T (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;makeInterval| ((|l| R) ($ |Complex| (|Interval| (|Float|))))
        (COND
         ((|HasCategory| (QREFELT $ 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SPADCALL (ELT $ 143) (SPADCALL |l| (QREFELT $ 145))
                    (QREFELT $ 149)))
         ('T (|error| "This should never happen")))) 

(SDEFUN |SOLVETRA;dropfun| ((|x| |Expression| R) ($ |Expression| R))
        (SPROG
         ((#1=#:G403 NIL) (|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |k| (SPADCALL |x| (QREFELT $ 151))
                   . #2=(|SOLVETRA;dropfun|))
             (EXIT
              (COND
               ((OR (QEQCAR |k| 1) (NULL (SPADCALL (QCDR |k|) (QREFELT $ 78))))
                (PROGN
                 (LETT #1# (|spadConstant| $ 119) . #2#)
                 (GO #3=#:G401))))))
            (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 78))))))
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
           ((SPADCALL |k| '|sin| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|sin| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1='T (CONS 0 (SPADCALL |l| (QREFELT $ 152))))))
           ((SPADCALL |k| '|cos| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|cos| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 153))))))
           ((SPADCALL |k| '|tan| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|tan| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 154))))))
           ((SPADCALL |k| '|cot| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|cot| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 155))))))
           ((SPADCALL |k| '|sec| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|sec| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 156))))))
           ((SPADCALL |k| '|csc| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|csc| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 157))))))
           ((SPADCALL |k| '|sinh| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|sinh| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 158))))))
           ((SPADCALL |k| '|cosh| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|cosh| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 159))))))
           ((SPADCALL |k| '|tanh| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|tanh| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 160))))))
           ((SPADCALL |k| '|coth| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|coth| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 161))))))
           ((SPADCALL |k| '|sech| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|sech| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 162))))))
           ((SPADCALL |k| '|csch| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| '|csch| (QREFELT $ 113))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 163))))))
           ((SPADCALL |k| '|atan| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 96))))
           ((SPADCALL |k| '|acot| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 164))))))
           ((SPADCALL |k| '|asin| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 165))))
           ((SPADCALL |k| '|acos| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 166))))
           ((SPADCALL |k| '|asec| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 167))))
           ((SPADCALL |k| '|acsc| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 168))))))
           ((SPADCALL |k| '|asinh| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 169))))
           ((SPADCALL |k| '|acosh| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 170))))
           ((SPADCALL |k| '|atanh| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 171))))
           ((SPADCALL |k| '|acoth| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 172))))))
           ((SPADCALL |k| '|asech| (QREFELT $ 113))
            (CONS 0 (SPADCALL |l| (QREFELT $ 173))))
           ((SPADCALL |k| '|acsch| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 174))))))
           ((SPADCALL |k| '|exp| (QREFELT $ 113))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 119) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| $)))))
           ((SPADCALL |k| '|log| (QREFELT $ 113))
            (COND
             ((|HasCategory| (QREFELT $ 6)
                             (LIST '|ConvertibleTo|
                                   (LIST '|Complex| '(|Float|))))
              (SEQ
               (LETT |ze|
                     (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) $)
                               |l| (QREFELT $ 178))
                     . #2=(|SOLVETRA;funcinv|))
               (LETT |z| (SPADCALL |ze| (QREFELT $ 180)) . #2#)
               (EXIT
                (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT $ 181))))
                      (#1#
                       (SEQ
                        (LETT |im| (SPADCALL (QCDR |z|) (QREFELT $ 182)) . #2#)
                        (LETT |fpi| (SPADCALL (QREFELT $ 183)) . #2#)
                        (COND
                         ((SPADCALL (SPADCALL |fpi| (QREFELT $ 184))
                                    (SPADCALL |im| (QREFELT $ 185))
                                    (QREFELT $ 186))
                          (COND
                           ((SPADCALL (SPADCALL |im| (QREFELT $ 187)) |fpi|
                                      (QREFELT $ 188))
                            (EXIT (CONS 0 (SPADCALL |l| (QREFELT $ 181))))))))
                        (EXIT (CONS 1 "failed"))))))))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 181))))))
           ((SPADCALL |k| '|%power| (QREFELT $ 113))
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 32)) . #2#)
                 (EXIT
                  (COND
                   ((SPADCALL |t| (|spadConstant| $ 119) (QREFELT $ 36))
                    (CONS 1 "failed"))
                   (#1# (CONS 0 (SPADCALL |t| (QREFELT $ 80))))))))
           (#1# (CONS 0 |l|)))))) 

(SDEFUN |SOLVETRA;ker2Poly|
        ((|k| |Kernel| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Polynomial| (|Expression| R)))
        (SPROG ((|nm| (|Symbol|)))
               (COND
                ((SPADCALL
                  (LETT |nm| (SPADCALL |k| (QREFELT $ 123))
                        |SOLVETRA;ker2Poly|)
                  |lvar| (QREFELT $ 124))
                 (SPADCALL |nm| (QREFELT $ 190)))
                ('T
                 (SPADCALL (SPADCALL |k| (QREFELT $ 107)) (QREFELT $ 191)))))) 

(SDEFUN |SOLVETRA;smp2Poly|
        ((|pol| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|lvar| |List| (|Symbol|)) ($ |Polynomial| (|Expression| R)))
        (SPROG NIL
               (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR $ |lvar|))
                         (CONS #'|SOLVETRA;smp2Poly!1| $) |pol|
                         (QREFELT $ 195)))) 

(SDEFUN |SOLVETRA;smp2Poly!1| ((|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |y| (QREFELT $ 118)) (QREFELT $ 191))) 

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
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 196)) |lvar| $)
         (QREFELT $ 198))) 

(SDEFUN |SOLVETRA;makeREpol|
        ((|pol| |Polynomial| (|Expression| R)) ($ |Expression| R))
        (SPROG
         ((|lval| (|List| (|Expression| R))) (#1=#:G466 NIL) (|v| NIL)
          (#2=#:G465 NIL) (|lvar| (|List| (|Symbol|))))
         (SEQ
          (LETT |lvar| (SPADCALL |pol| (QREFELT $ 199))
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
           (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT $ 200))
                     (QREFELT $ 201)))))) 

(SDEFUN |SOLVETRA;makeRE|
        ((|frac| |Fraction| (|Polynomial| (|Expression| R)))
         ($ |Expression| R))
        (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 202)) $)
                  (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 203)) $)
                  (QREFELT $ 95))) 

(SDEFUN |SOLVETRA;solve1Pol|
        ((|pol| |Polynomial| (|Expression| R)) (|var| |Symbol|)
         (|sol| |List| (|Equation| (|Expression| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G472 NIL) (|vsol| NIL) (#2=#:G471 NIL)
          (|vsols| (|List| (|Equation| (|Expression| R))))
          (|repol| (|Expression| R)))
         (SEQ
          (LETT |repol|
                (SPADCALL (|SOLVETRA;makeREpol| |pol| $) |sol| (QREFELT $ 205))
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
          (#1=#:G474 NIL)
          (#2=#:G473 #3=(|List| (|List| (|Equation| (|Expression| R)))))
          (#4=#:G475 #3#) (#5=#:G481 NIL) (|sol| NIL) (#6=#:G479 NIL) (|p| NIL)
          (#7=#:G480 NIL) (|v| NIL) (|rlvar| (|List| (|Symbol|)))
          (|rplist| (|List| (|Polynomial| (|Expression| R)))))
         (SEQ (LETT |rplist| (REVERSE |plist|) . #8=(|SOLVETRA;solve1Sys|))
              (LETT |rlvar| (REVERSE |lvar|) . #8#)
              (LETT |sols| (SPADCALL NIL (QREFELT $ 206)) . #8#)
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
                                            (SPADCALL #2# #4# (QREFELT $ 207))
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
        (SPADCALL (SPADCALL |q| (QREFELT $ 209)) (SPADCALL |q| (QREFELT $ 210))
                  (QREFELT $ 211))) 

(SDEFUN |SOLVETRA;tryLinear|
        ((|lexpr| |List| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
        (SPROG
         ((|eqs| (|List| (|Equation| (|Expression| R)))) (#1=#:G546 NIL)
          (|i| NIL) (#2=#:G545 NIL) (|sym| (|Expression| R)) (#3=#:G544 NIL)
          (|p| NIL) (|zeron| (|Vector| (|Expression| R)))
          (|rhs| (|Vector| (|Expression| R))) (#4=#:G517 NIL)
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #5="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (|vece| (|Vector| (|Expression| R))) (#6=#:G543 NIL) (|q| NIL)
          (#7=#:G542 NIL) (|mate| (|Matrix| (|Expression| R))) (#8=#:G541 NIL)
          (#9=#:G540 NIL) (#10=#:G539 NIL) (|row| NIL) (#11=#:G538 NIL)
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
          (#12=#:G537 NIL) (|expr| NIL) (#13=#:G536 NIL) (#14=#:G528 NIL)
          (#15=#:G535 NIL) (|ker| NIL)
          (|kers| (|List| (|Kernel| (|Expression| R))))
          (|llk| (|List| (|List| (|Kernel| (|Expression| R)))))
          (#16=#:G534 NIL) (#17=#:G533 NIL) (#18=#:G488 NIL)
          (#19=#:G487 #20=(|Boolean|)) (#21=#:G489 #20#) (#22=#:G532 NIL)
          (#23=#:G485 NIL) (#24=#:G484 #25=(|Boolean|)) (#26=#:G486 #25#)
          (#27=#:G531 NIL) (|lvk| (|List| (|Kernel| (|Expression| R))))
          (#28=#:G530 NIL) (|v| NIL) (#29=#:G529 NIL))
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
                          (LETT #29# (CONS (SPADCALL |v| (QREFELT $ 63)) #29#)
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
                                          |lvk| (QREFELT $ 213))
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
                                            (SPADCALL |expr| (QREFELT $ 196))
                                            (QREFELT $ 214))
                                           (QREFELT $ 215))))
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
                                    (CONS (SPADCALL |expr| (QREFELT $ 216))
                                          #17#)
                                    . #30#)))
                            (LETT #16# (CDR #16#) . #30#) (GO G190) G191
                            (EXIT (NREVERSE #17#))))
                      . #30#)
                (LETT |kers| (SPADCALL (ELT $ 218) |llk| (QREFELT $ 221))
                      . #30#)
                (SEQ (LETT |ker| NIL . #30#) (LETT #15# |kers| . #30#) G190
                     (COND
                      ((OR (ATOM #15#)
                           (PROGN (LETT |ker| (CAR #15#) . #30#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |ker| (QREFELT $ 223)) 0) "iterate")
                        ((NULL
                          (NULL
                           (SPADCALL |lvar|
                                     (SPADCALL (SPADCALL |ker| (QREFELT $ 107))
                                               (QREFELT $ 11))
                                     (QREFELT $ 224))))
                         (PROGN
                          (LETT #14# (CONS 1 "failed") . #30#)
                          (GO #32=#:G527))))))
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
                (LETT |r| (SPADCALL |ps| |lvk| (QREFELT $ 228)) . #30#)
                (LETT |mate|
                      (SPADCALL
                       (PROGN
                        (LETT #11# NIL . #30#)
                        (SEQ (LETT |row| NIL . #30#)
                             (LETT #10# (SPADCALL (QCAR |r|) (QREFELT $ 231))
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
                       (QREFELT $ 234))
                      . #30#)
                (LETT |vece|
                      (SPADCALL
                       (PROGN
                        (LETT #7# NIL . #30#)
                        (SEQ (LETT |q| NIL . #30#)
                             (LETT #6# (SPADCALL (QCDR |r|) (QREFELT $ 237))
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
                       (QREFELT $ 239))
                      . #30#)
                (LETT |sol| (SPADCALL |mate| |vece| (QREFELT $ 243)) . #30#)
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
                               (SPADCALL (LENGTH |lvar|) (QREFELT $ 244))
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
                                 ((SPADCALL |p| |zeron| (QREFELT $ 247))
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
                                                                         248))
                                                      (SPADCALL |sym|
                                                                (SPADCALL |p|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           248))
                                                                (QREFELT $
                                                                         121))
                                                      (QREFELT $ 120))
                                                     (QREFELT $ 249))))
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
                                                             (QREFELT $ 250))
                                                   (QREFELT $ 34))
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT $ 248))
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
          (#1=#:G558 NIL) (|plist| NIL) (#2=#:G557 NIL)
          (|trianglist| (|List| (|List| (|Polynomial| (|Expression| R)))))
          (|lfrac| (|List| (|Fraction| (|Polynomial| (|Expression| R)))))
          (#3=#:G556 NIL) (|expr| NIL) (#4=#:G555 NIL)
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
                            (SPADCALL |lfrac| |lvar| (QREFELT $ 254)) . #5#)
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
                      (EXIT (SPADCALL (ELT $ 207) |l| NIL (QREFELT $ 257)))))
                    (#6='T (QCDR |ans1|))))))
            (#6# (QCDR |ans1|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;37|
        ((|leqs| |List| (|Equation| (|Expression| R)))
         (|lvar| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|lexpr| (|List| (|Expression| R))) (#1=#:G563 NIL) (|eq| NIL)
          (#2=#:G562 NIL))
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
         ((#1=#:G590 NIL) (|neq| NIL) (#2=#:G589 NIL) (#3=#:G588 NIL)
          (|sol| NIL) (#4=#:G587 NIL) (|lval2| (|List| (|Expression| R)))
          (#5=#:G586 NIL) (|k| NIL) (#6=#:G585 NIL)
          (|lker2| (|List| (|Kernel| (|Expression| R)))) (#7=#:G584 NIL)
          (|v| NIL) (#8=#:G583 NIL)
          (|ans| (|List| (|List| (|Equation| (|Expression| R)))))
          (|nlexpr| (|List| (|Expression| R))) (#9=#:G582 NIL) (|expr| NIL)
          (#10=#:G581 NIL) (|lval| (|List| (|Expression| R))) (#11=#:G580 NIL)
          (#12=#:G579 NIL) (|lvar| (|List| (|Symbol|))) (#13=#:G578 NIL)
          (#14=#:G577 NIL) (|lexpr| (|List| (|Expression| R))) (#15=#:G576 NIL)
          (|eq| NIL) (#16=#:G575 NIL))
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
                               (SPADCALL |expr| |lker| |lval| (QREFELT $ 259))
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
                        (LETT #8# (CONS (SPADCALL |v| (QREFELT $ 63)) #8#)
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
                        (LETT #6# (CONS (SPADCALL |k| (QREFELT $ 107)) #6#)
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
                                          |neq| (QREFELT $ 261))
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
          (RETURN (PROGN (SPADCALL |e| |lker2| |lval2| (QREFELT $ 259)))))) 

(SDEFUN |SOLVETRA;retract2|
        ((|e| |Expression| R) ($ |Kernel| (|Expression| R)))
        (SPROG ((|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |e| (QREFELT $ 151)) |SOLVETRA;retract2|)
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
         ((|lker| (|List| (|Kernel| (|Expression| R)))) (#1=#:G600 NIL)
          (|e| NIL) (#2=#:G599 NIL))
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
          (EXIT (SPADCALL |leqs| |lker| (QREFELT $ 262)))))) 

(DECLAIM (NOTINLINE |TransSolvePackage;|)) 

(DEFUN |TransSolvePackage| (#1=#:G601)
  (SPROG NIL
         (PROG (#2=#:G602)
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
          (LETT $ (GETREFV 264) . #1#)
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
              (57 . |new|) (61 . |coerce|) (66 . =) (72 . =) (|List| 40)
              (78 . |kernels|) (|Fraction| 52) (|Kernel| $) (83 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 42) (89 . |numer|)
              (|Factored| 42) (|ExpressionFactorPolynomial| 6 8)
              (94 . |factorPolynomial|)
              (|Record| (|:| |factor| 42) (|:| |exponent| 56)) (|List| 48)
              (99 . |factors|) (|List| $) (|SparseUnivariatePolynomial| $)
              (104 . |zerosOf|) (|List| 8) (110 . |append|) (|Integer|)
              (116 . |elt|) (122 . |append|)
              (|SparseMultivariatePolynomial| 6 40) (128 . |numer|)
              (133 . |coerce|) (|Kernel| 8) (138 . |kernel|) (|Factored| 52)
              (143 . |factorPolynomial|) (|AlgebraicManipulations| 6 8)
              (148 . |rootSimp|) (|Factored| 69)
              (|SparseMultivariatePolynomial| 6 62)
              (|MultivariateFactorize| 62 (|IndexedExponents| 62) 6 69)
              (153 . |factor|) (|Record| (|:| |factor| 69) (|:| |exponent| 56))
              (|List| 72) (158 . |factors|)
              (|Record| (|:| |var| 40) (|:| |exponent| 56))
              (|Union| 75 '"failed") (163 . |isExpt|) (169 . |argument|)
              (174 . *) (180 . |log|) (|SparseUnivariatePolynomial| 6)
              (185 . |One|) (|Union| (|Fraction| (|Polynomial| 6)) '#1#)
              (189 . |retractIfCan|) (|List| 15)
              (|List| (|Fraction| (|Polynomial| 6))) (|RadicalSolvePackage| 6)
              (194 . |radicalSolve|) (|TranscendentalManipulations| 6 8)
              (200 . |simplify|) (205 . |normalize|)
              (|TrigonometricManipulations| 6 8) (211 . |complexNormalize|)
              (217 . |coerce|) (222 . /) (228 . |tan|) (|PositiveInteger|)
              (233 . *) (239 . ^) (245 . |One|) (249 . -)
              (|TransSolvePackageService| 6) (254 . |decomposeFunc|) (261 . =)
              (|Fraction| $) (267 . |elt|) (273 . |coerce|) (278 . |second|)
              (283 . |retract|) (288 . |monomial|) (294 . -)
              (300 . |resultant|) (306 . |is?|) (|Union| 51 '"failed")
              (312 . |isPlus|) (317 . |leadingCoefficient|) (322 . |gcd|)
              (327 . |coerce|) (332 . |Zero|) (336 . +) (342 . *)
              (348 . |Zero|) (352 . |name|) (357 . |member?|) (363 . |isTimes|)
              (368 . |remove!|) (374 . |One|) (378 . |freeOf?|) (384 . ^)
              (|Table| 8 8) (390 . |table|) (394 . |Zero|) (398 . ~=)
              (404 . |leadingMonomial|) (|Union| 8 '"failed") (409 . |search|)
              (415 . |setelt!|) (422 . |elt|) (428 . |reductum|) (433 . |keys|)
              (|Float|) (|Interval| 141) (438 . |interval|) (|Complex| 141)
              (443 . |convert|) (|Complex| 142) (|Mapping| 142 141)
              (|ComplexFunctions2| 141 142) (448 . |map|) (|Union| 40 '#1#)
              (454 . |retractIfCan|) (459 . |asin|) (464 . |acos|)
              (469 . |atan|) (474 . |acot|) (479 . |asec|) (484 . |acsc|)
              (489 . |asinh|) (494 . |acosh|) (499 . |atanh|) (504 . |acoth|)
              (509 . |asech|) (514 . |acsch|) (519 . |cot|) (524 . |sin|)
              (529 . |cos|) (534 . |sec|) (539 . |csc|) (544 . |sinh|)
              (549 . |cosh|) (554 . |tanh|) (559 . |coth|) (564 . |sech|)
              (569 . |csch|) (|Expression| 146) (|Mapping| 146 6)
              (|ExpressionFunctions2| 6 146) (574 . |map|) (|Union| 146 '#1#)
              (580 . |retractIfCan|) (585 . |exp|) (590 . |imag|) (595 . |pi|)
              (599 . -) (604 . |inf|) (609 . <) (615 . |sup|) (620 . <=)
              (|Polynomial| 8) (626 . |coerce|) (631 . |coerce|)
              (|Mapping| 189 62) (|Mapping| 189 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 62) 62 6 69 189)
              (636 . |map|) (643 . |denom|) (|Fraction| 189) (648 . /)
              (654 . |variables|) (659 . |eval|) (666 . |ground|)
              (671 . |numer|) (676 . |denom|) (|List| 29) (681 . |eval|)
              (687 . |list|) (692 . |append|) (|Fraction| 69) (698 . |numer|)
              (703 . |denom|) (708 . /) (|List| 62) (714 . |totalDegree|)
              (720 . |variables|) (725 . |setIntersection|) (731 . |tower|)
              (736 . |setUnion|) (742 . |setUnion|) (|Mapping| 212 212 212)
              (|List| 212) (748 . |reduce|) (|Union| 16 '"failed")
              (754 . |symbolIfCan|) (759 . |setIntersection|)
              (|Record| (|:| |mat| 230) (|:| |vec| 236)) (|List| 69)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 62) 62 69)
              (765 . |intoMatrix|) (|List| 235) (|Matrix| 208)
              (771 . |listOfLists|) (|List| 54) (|Matrix| 8) (776 . |matrix|)
              (|List| 208) (|Vector| 208) (781 . |parts|) (|Vector| 8)
              (786 . |vector|) (|Union| 238 '"failed")
              (|Record| (|:| |particular| 240) (|:| |basis| (|List| 238)))
              (|LinearSystemMatrixPackage| 8 238 238 233) (791 . |solve|)
              (797 . |zero|) (|Vector| $) (802 . |basis|) (806 . ~=)
              (812 . |elt|) (818 . |setelt!|) (825 . |elt|)
              (|List| (|List| 189)) (|List| 197) (|SystemSolvePackage| 8)
              (831 . |triangularSystems|) (|Mapping| 85 85 85) (|List| 85)
              (837 . |reduce|) |SOLVETRA;solve;LLL;37| (844 . |eval|)
              (|Mapping| 8 8) (851 . |map|) |SOLVETRA;solve;LLL;38|
              |SOLVETRA;solve;LLL;40|)
           '#(|solve| 857) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 263
                                                 '(1 8 7 0 9 1 8 10 0 11 0 6 0
                                                   12 2 13 7 0 0 14 1 19 8 0 20
                                                   1 19 8 0 21 2 8 0 0 0 22 1 8
                                                   25 0 26 1 8 27 0 28 2 8 0 0
                                                   29 30 1 31 8 8 32 0 16 0 33
                                                   1 8 0 16 34 2 19 0 8 8 35 2
                                                   8 7 0 0 36 1 8 37 0 38 2 8
                                                   39 0 40 41 1 43 42 0 44 1 46
                                                   45 42 47 1 45 49 0 50 2 8 51
                                                   52 16 53 2 54 0 0 0 55 2 54
                                                   8 0 56 57 2 15 0 0 0 58 1 8
                                                   59 0 60 1 8 0 59 61 1 62 0
                                                   16 63 1 8 64 52 65 1 66 8 8
                                                   67 1 70 68 69 71 1 68 73 0
                                                   74 2 8 76 0 16 77 1 62 54 0
                                                   78 2 8 0 56 0 79 1 8 0 0 80
                                                   0 81 0 82 1 8 83 0 84 2 87
                                                   85 86 10 88 1 89 8 8 90 2 31
                                                   8 8 16 91 2 92 8 8 16 93 1 8
                                                   0 56 94 2 8 0 0 0 95 1 8 0 0
                                                   96 2 8 0 97 0 98 2 8 0 0 97
                                                   99 0 8 0 100 1 8 0 0 101 3
                                                   102 43 43 43 43 103 2 43 7 0
                                                   0 104 2 42 8 105 8 106 1 8 0
                                                   40 107 1 54 8 0 108 1 8 56 0
                                                   109 2 42 0 8 13 110 2 42 0 0
                                                   0 111 2 42 8 0 0 112 2 8 7 0
                                                   16 113 1 8 114 0 115 1 69 6
                                                   0 116 1 6 0 51 117 1 8 0 6
                                                   118 0 8 0 119 2 8 0 0 0 120
                                                   2 8 0 0 0 121 0 6 0 122 1 62
                                                   16 0 123 2 10 7 16 0 124 1 8
                                                   114 0 125 2 54 0 8 0 126 0
                                                   56 0 127 2 8 7 0 16 128 2 8
                                                   0 0 0 129 0 130 0 131 0 81 0
                                                   132 2 8 7 0 0 133 1 69 0 0
                                                   134 2 130 135 8 0 136 3 130
                                                   8 0 8 8 137 2 130 8 0 8 138
                                                   1 69 0 0 139 1 130 54 0 140
                                                   1 142 0 141 143 1 6 144 0
                                                   145 2 148 146 147 144 149 1
                                                   8 150 0 151 1 8 0 0 152 1 8
                                                   0 0 153 1 8 0 0 154 1 8 0 0
                                                   155 1 8 0 0 156 1 8 0 0 157
                                                   1 8 0 0 158 1 8 0 0 159 1 8
                                                   0 0 160 1 8 0 0 161 1 8 0 0
                                                   162 1 8 0 0 163 1 8 0 0 164
                                                   1 8 0 0 165 1 8 0 0 166 1 8
                                                   0 0 167 1 8 0 0 168 1 8 0 0
                                                   169 1 8 0 0 170 1 8 0 0 171
                                                   1 8 0 0 172 1 8 0 0 173 1 8
                                                   0 0 174 2 177 175 176 8 178
                                                   1 175 179 0 180 1 8 0 0 181
                                                   1 146 142 0 182 0 141 0 183
                                                   1 141 0 0 184 1 142 141 0
                                                   185 2 141 7 0 0 186 1 142
                                                   141 0 187 2 141 7 0 0 188 1
                                                   189 0 16 190 1 189 0 8 191 3
                                                   194 189 192 193 69 195 1 8
                                                   59 0 196 2 197 0 189 189 198
                                                   1 189 10 0 199 3 189 0 0 10
                                                   54 200 1 189 8 0 201 1 197
                                                   189 0 202 1 197 189 0 203 2
                                                   8 0 0 204 205 1 85 0 15 206
                                                   2 85 0 0 0 207 1 208 69 0
                                                   209 1 208 69 0 210 2 8 0 59
                                                   59 211 2 69 13 0 212 213 1
                                                   69 212 0 214 2 212 0 0 0 215
                                                   1 8 37 0 216 2 15 0 0 0 217
                                                   2 212 0 0 0 218 2 220 212
                                                   219 0 221 1 62 222 0 223 2
                                                   10 0 0 0 224 2 227 225 226
                                                   212 228 1 230 229 0 231 1
                                                   233 0 232 234 1 236 235 0
                                                   237 1 238 0 54 239 2 242 241
                                                   233 238 243 1 238 0 13 244 0
                                                   146 245 246 2 238 7 0 0 247
                                                   2 238 8 0 56 248 3 238 8 0
                                                   56 8 249 2 10 16 0 56 250 2
                                                   253 251 252 10 254 3 256 85
                                                   255 0 85 257 3 8 0 0 37 51
                                                   259 2 19 0 260 0 261 1 0 15
                                                   8 18 2 0 15 19 16 24 1 0 15
                                                   19 23 2 0 85 15 10 258 2 0
                                                   15 8 16 17 2 0 85 15 54 263
                                                   2 0 85 15 212 262)))))
           '|lookupComplete|)) 
