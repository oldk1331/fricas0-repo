
(SDEFUN |SOLVETRA;solve;EL;1|
        ((|oside| |Expression| R) ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |oside| (QREFELT $ 9))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ (LETT |lv| (SPADCALL |oside| (QREFELT $ 11)))
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
                                (SPADCALL |equ| (QREFELT $ 21))
                                (QREFELT $ 22)))
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
                 (LETT #2# NIL)
                 (SEQ (LETT |sol| NIL)
                      (LETT #1# (|SOLVETRA;solveInner| |lside| |x| $)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|SOLVETRA;testZero?| |lside| |sol| $)
                          (LETT #2# (CONS |sol| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
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
             (|:| |flag| (|Union| #3="nil" #4="sqfr" #5="irred" #6="prime"))
             (|:| |factor|
                  (|SparseMultivariatePolynomial| R
                                                  (|Kernel| (|Expression| R))))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|listofkernels| #7=(|List| (|Expression| R)))
          (|newlside| (|Expression| R))
          (|newlist| (|List| (|Equation| (|Expression| R)))) (#8=#:G249 NIL)
          (|j| NIL) (|secondsol| #9=(|List| (|Expression| R))) (#10=#:G229 NIL)
          (#11=#:G228 #9#) (#12=#:G230 #9#) (#13=#:G248 NIL) (|ff| NIL)
          (|lfatt|
           (|List|
            (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#))
                      (|:| |factor|
                           (|SparseUnivariatePolynomial| (|Expression| R)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|elR| (|Expression| R)) (#14=#:G247 NIL) (|i| NIL) (#15=#:G224 NIL)
          (#16=#:G223 #17=(|List| (|Equation| (|Expression| R))))
          (#18=#:G225 #17#) (#19=#:G246 NIL) (|ri| NIL)
          (|bigX_back| (|Expression| R)) (#20=#:G219 NIL)
          (|r1| (|List| (|Expression| R)))
          (|finv| (|Union| (|Expression| R) #21="failed")) (#22=#:G245 NIL)
          (|lr| #9#) (#23=#:G216 NIL) (#24=#:G215 #9#) (#25=#:G217 #9#)
          (#26=#:G244 NIL) (|fatt| NIL) (|eq1| (|Expression| R))
          (|bigX| (|Expression| R)) (Y (|Expression| R)) (X (|Symbol|))
          (|ausgabe1| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |lside| (|SOLVETRA;eliminateRoot| |lside| |x| $))
                (LETT |ausgabe1| (|SOLVETRA;tableXkernels| |lside| |x| $))
                (LETT X (SPADCALL (QREFELT $ 33)))
                (LETT Y (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)))
                (EXIT
                 (COND
                  ((EQL (LENGTH |ausgabe1|) 1)
                   (SEQ (LETT |bigX| (|SPADfirst| |ausgabe1|))
                        (LETT |eq1|
                              (SPADCALL |lside|
                                        (SPADCALL |bigX|
                                                  (SPADCALL X (QREFELT $ 34))
                                                  (QREFELT $ 35))
                                        (QREFELT $ 30)))
                        (LETT |f|
                              (SPADCALL |eq1| (SPADCALL X (QREFELT $ 38))
                                        (QREFELT $ 41)))
                        (LETT |lfatt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                         (QREFELT $ 47))
                               (QREFELT $ 51)))
                        (LETT |lr|
                              (PROGN
                               (LETT #23# NIL)
                               (SEQ (LETT |fatt| NIL) (LETT #26# |lfatt|) G190
                                    (COND
                                     ((OR (ATOM #26#)
                                          (PROGN (LETT |fatt| (CAR #26#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #25#
                                             (SPADCALL (QVELT |fatt| 1) |x|
                                                       (QREFELT $ 54)))
                                       (COND
                                        (#23#
                                         (LETT #24#
                                               (SPADCALL #24# #25#
                                                         (QREFELT $ 56))))
                                        ('T
                                         (PROGN
                                          (LETT #24# #25#)
                                          (LETT #23# 'T)))))))
                                    (LETT #26# (CDR #26#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#23# #24#) (#27='T NIL))))
                        (LETT |r1| NIL)
                        (SEQ (LETT |i| 1) (LETT #22# (LENGTH |lr|)) G190
                             (COND ((|greater_SI| |i| #22#) (GO G191)))
                             (SEQ
                              (LETT |finv|
                                    (|SOLVETRA;funcinv| |bigX|
                                     (SPADCALL |lr| |i| (QREFELT $ 58)) $))
                              (EXIT
                               (COND
                                ((QEQCAR |finv| 0)
                                 (LETT |r1| (CONS (QCDR |finv|) |r1|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |bigX_back|
                              (PROG2
                                  (LETT #20#
                                        (|SOLVETRA;funcinv| |bigX| |bigX| $))
                                  (QCDR #20#)
                                (|check_union2| (QEQCAR #20# 0)
                                                (|Expression| (QREFELT $ 6))
                                                (|Union|
                                                 (|Expression| (QREFELT $ 6))
                                                 #21#)
                                                #20#)))
                        (COND
                         ((NULL (|SOLVETRA;testkernel| |bigX_back| |x| $))
                          (SEQ
                           (COND
                            ((SPADCALL |bigX| |bigX_back| (QREFELT $ 36))
                             (PROGN (LETT #1# NIL) (GO #28=#:G242))))
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (PROGN
                                    (LETT #15# NIL)
                                    (SEQ (LETT |ri| NIL) (LETT #19# |r1|) G190
                                         (COND
                                          ((OR (ATOM #19#)
                                               (PROGN
                                                (LETT |ri| (CAR #19#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #18#
                                                  (SPADCALL
                                                   (SPADCALL |bigX_back| |ri|
                                                             (QREFELT $ 22))
                                                   |x| (QREFELT $ 17)))
                                            (COND
                                             (#15#
                                              (LETT #16#
                                                    (SPADCALL #16# #18#
                                                              (QREFELT $ 59))))
                                             ('T
                                              (PROGN
                                               (LETT #16# #18#)
                                               (LETT #15# 'T)))))))
                                         (LETT #19# (CDR #19#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#15# #16#) (#27# NIL))))
                             (GO #28#))))))
                        (LETT |newlist| NIL)
                        (SEQ (LETT |i| 1) (LETT #14# (LENGTH |r1|)) G190
                             (COND ((|greater_SI| |i| #14#) (GO G191)))
                             (SEQ
                              (LETT |elR|
                                    (|SOLVETRA;eliminateRoot|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |bigX_back|
                                                 (SPADCALL |r1| |i|
                                                           (QREFELT $ 58))
                                                 (QREFELT $ 22))
                                       (QREFELT $ 61))
                                      (QREFELT $ 62))
                                     |x| $))
                              (LETT |f|
                                    (SPADCALL |elR|
                                              (SPADCALL |x| (QREFELT $ 38))
                                              (QREFELT $ 41)))
                              (LETT |lfatt|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                               (QREFELT $ 64))
                                     (QREFELT $ 51)))
                              (LETT |secondsol|
                                    (PROGN
                                     (LETT #10# NIL)
                                     (SEQ (LETT |ff| NIL) (LETT #13# |lfatt|)
                                          G190
                                          (COND
                                           ((OR (ATOM #13#)
                                                (PROGN
                                                 (LETT |ff| (CAR #13#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #12#
                                                   (SPADCALL (QVELT |ff| 1) |x|
                                                             (QREFELT $ 54)))
                                             (COND
                                              (#10#
                                               (LETT #11#
                                                     (SPADCALL #11# #12#
                                                               (QREFELT $
                                                                        56))))
                                              ('T
                                               (PROGN
                                                (LETT #11# #12#)
                                                (LETT #10# 'T)))))))
                                          (LETT #13# (CDR #13#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#10# #11#) ('T NIL))))
                              (EXIT
                               (SEQ (LETT |j| 1)
                                    (LETT #8# (LENGTH |secondsol|)) G190
                                    (COND ((|greater_SI| |j| #8#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |newlist|
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT $ 34))
                                              (SPADCALL
                                               (SPADCALL |secondsol| |j|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 66))
                                              (QREFELT $ 35))
                                             |newlist|))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |newlist|)))
                  (#27#
                   (SEQ (LETT |newlside| (|SOLVETRA;tryToTrans| |lside| |x| $))
                        (LETT |listofkernels|
                              (|SOLVETRA;tableXkernels| |newlside| |x| $))
                        (EXIT
                         (COND
                          ((EQL (LENGTH |listofkernels|) 1)
                           (SPADCALL |newlside| |x| (QREFELT $ 17)))
                          (#27#
                           (SEQ
                            (LETT |lfacts|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |lside| (QREFELT $ 61))
                                             (QREFELT $ 70))
                                   (QREFELT $ 73)))
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |lfacts|) 1 (QREFELT $ 14))
                               (SEQ (LETT |sols| NIL)
                                    (SEQ (LETT |frec| NIL) (LETT #2# |lfacts|)
                                         G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |frec| (CAR #2#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |sols|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QVELT |frec| 1)
                                                             (QREFELT $ 62))
                                                   |x| (QREFELT $ 17))
                                                  |sols| (QREFELT $ 59)))))
                                         (LETT #2# (CDR #2#)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT |sols|)))
                              (#27#
                               (PROGN (LETT #1# NIL) (GO #28#)))))))))))))))
          #28# (EXIT #1#)))) 

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
         (SEQ (LETT |u| (SPADCALL |f| '|exp| (QREFELT $ 76)))
              (EXIT
               (COND
                ((QEQCAR |u| 0)
                 (SEQ (LETT |rec| (QCDR |u|))
                      (EXIT
                       (SPADCALL (QCDR |rec|)
                                 (|SPADfirst|
                                  (SPADCALL (QCAR |rec|) (QREFELT $ 77)))
                                 (QREFELT $ 78)))))
                ('T (SPADCALL |f| (QREFELT $ 79)))))))) 

(SDEFUN |SOLVETRA;testkernel|
        ((|var1| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG ((|listvar1| (|List| (|Expression| R))))
               (SEQ (LETT |var1| (|SOLVETRA;eliminateRoot| |var1| |y| $))
                    (LETT |listvar1| (|SOLVETRA;tableXkernels| |var1| |y| $))
                    (EXIT
                     (COND
                      ((EQL (LENGTH |listvar1|) 1)
                       (COND
                        ((OR
                          (SPADCALL (SPADCALL |listvar1| 1 (QREFELT $ 58))
                                    (SPADCALL |y| (QREFELT $ 34))
                                    (QREFELT $ 36))
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
           (SEQ (LETT |nlexpr| NIL)
                (SEQ (LETT |expr| NIL) (LETT #2# |lexpr|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |expr| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT $ 83)))
                          (EXIT
                           (COND
                            ((QEQCAR |rf| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed"))
                              (GO #3=#:G272)))
                            ('T (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT $ 87))))))
          #3# (EXIT #1#)))) 

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
            (SEQ (LETT |convLside| (SPADCALL |lside| (QREFELT $ 89)))
                 (LETT |resultLside| |convLside|)
                 (LETT |listConvLside|
                       (|SOLVETRA;tableXkernels| |convLside| |x| $))
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                    (SEQ
                     (LETT |NormConvLside|
                           (SPADCALL |convLside| |x| (QREFELT $ 90)))
                     (LETT |NormConvLside| |NormConvLside|)
                     (EXIT
                      (LETT |resultLside|
                            (|SOLVETRA;subsTan| |NormConvLside| |x| $)))))))))
           ((|SOLVETRA;testLog| |lside| |x| $)
            (SEQ
             (LETT |numlside|
                   (SPADCALL (SPADCALL |lside| (QREFELT $ 61)) (QREFELT $ 62)))
             (EXIT
              (LETT |resultLside| (|SOLVETRA;combineLog| |numlside| |x| $)))))
           ('T
            (SEQ (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT $ 90)))
                 (LETT |NormConvLside| |NormConvLside|)
                 (LETT |resultLside| |NormConvLside|)
                 (LETT |listConvLside|
                       (|SOLVETRA;tableXkernels| |NormConvLside| |x| $))
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                    (SEQ
                     (LETT |cnormConvLside|
                           (SPADCALL |lside| |x| (QREFELT $ 92)))
                     (LETT |cnormConvLside| |cnormConvLside|)
                     (LETT |resultLside| |cnormConvLside|)
                     (LETT |listcnorm|
                           (|SOLVETRA;tableXkernels| |cnormConvLside| |x| $))
                     (EXIT
                      (COND
                       ((SPADCALL (LENGTH |listcnorm|) 1 (QREFELT $ 14))
                        (COND
                         ((|SOLVETRA;testLog| |cnormConvLside| |x| $)
                          (SEQ
                           (LETT |numlside|
                                 (SPADCALL
                                  (SPADCALL |cnormConvLside| (QREFELT $ 61))
                                  (QREFELT $ 62)))
                           (EXIT
                            (LETT |resultLside|
                                  (|SOLVETRA;combineLog| |numlside| |x|
                                   $))))))))))))))))
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
           (SEQ (LETT Z (SPADCALL (QREFELT $ 33)))
                (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| $))
                (LETT |varkern| (|SPADfirst| |listofkern|))
                (LETT Y
                      (SPADCALL
                       (|SPADfirst|
                        (SPADCALL
                         (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 94)))
                         (QREFELT $ 77)))
                       (QREFELT $ 95)))
                (LETT |test|
                      (SPADCALL |varkern|
                                (SPADCALL
                                 (SPADCALL Y (SPADCALL 2 (QREFELT $ 96))
                                           (QREFELT $ 97))
                                 (QREFELT $ 98))
                                (QREFELT $ 36)))
                (COND
                 ((EQL (LENGTH |listofkern|) 1)
                  (COND
                   ((NULL |test|)
                    (PROGN (LETT #1# |exprvar|) (GO #5=#:G292)))))
                 (#6='T (PROGN (LETT #1# |exprvar|) (GO #5#))))
                (LETT |fZ|
                      (SPADCALL |exprvar|
                                (SPADCALL |varkern| (SPADCALL Z (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 30)))
                (LETT |fN| (SPADCALL |fZ| (QREFELT $ 95)))
                (LETT |f|
                      (SPADCALL |fN| (SPADCALL Z (QREFELT $ 38))
                                (QREFELT $ 41)))
                (LETT |secondfun|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 Y (QREFELT $ 100))
                                 (SPADCALL (SPADCALL Y 2 (QREFELT $ 101))
                                           (|spadConstant| $ 104)
                                           (QREFELT $ 22))
                                 (QREFELT $ 97))
                       (QREFELT $ 105)))
                (LETT |g|
                      (SPADCALL |secondfun| (SPADCALL |y| (QREFELT $ 38))
                                (QREFELT $ 41)))
                (LETT H (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)))
                (LETT |newH|
                      (SPADCALL H (SPADCALL Z (QREFELT $ 38)) (QREFELT $ 41)))
                (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT $ 107)))
                (EXIT
                 (COND
                  ((SPADCALL |result| |f| (QREFELT $ 108))
                   (SEQ (LETT |result1| (SPADCALL |result| H (QREFELT $ 110)))
                        (EXIT
                         (LETT |resultnew|
                               (SPADCALL |result1|
                                         (SPADCALL H
                                                   (SPADCALL Y (QREFELT $ 98))
                                                   (QREFELT $ 35))
                                         (QREFELT $ 30))))))
                  (#6# (PROGN (LETT #1# |exprvar|) (GO #5#)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;eliminateKernRoot|
        ((|var| |Expression| R) (|varkern| |Kernel| (|Expression| R))
         ($ |Expression| R))
        (SPROG
         ((|resultvar| (|Expression| R))
          (|var3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G302 NIL)
          (|var2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|var1| (|Expression| R)) (X (|Symbol|)))
         (SEQ (LETT X (SPADCALL (QREFELT $ 33)))
              (LETT |var1|
                    (SPADCALL |var|
                              (SPADCALL (SPADCALL |varkern| (QREFELT $ 111))
                                        (SPADCALL X (QREFELT $ 34))
                                        (QREFELT $ 35))
                              (QREFELT $ 30)))
              (LETT |var2|
                    (SPADCALL
                     (SPADCALL |var1| (SPADCALL X (QREFELT $ 38))
                               (QREFELT $ 41))
                     (QREFELT $ 44)))
              (LETT |var3|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 104)
                               (PROG1
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |varkern| (QREFELT $ 77))
                                           (QREFELT $ 112))
                                          (QREFELT $ 113)))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT $ 114))
                     (SPADCALL
                      (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 77))) 0
                      (QREFELT $ 114))
                     (QREFELT $ 115)))
              (EXIT
               (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT $ 116))))))) 

(SDEFUN |SOLVETRA;eliminateRoot|
        ((|var| . #1=(|Expression| R)) (|y| |Symbol|) ($ |Expression| R))
        (SPROG
         ((|var1| #1#) (#2=#:G311 NIL) (|i| NIL)
          (|varlistk1| (|List| (|Expression| R))))
         (SEQ (LETT |var1| |var|)
              (SEQ G190
                   (COND
                    ((NULL (|SOLVETRA;testRootk| |var1| |y| $)) (GO G191)))
                   (SEQ
                    (LETT |varlistk1| (|SOLVETRA;tableXkernels| |var1| |y| $))
                    (EXIT
                     (SEQ (LETT |i| NIL) (LETT #2# |varlistk1|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| '|nthRoot| (QREFELT $ 117))
                              (LETT |var1|
                                    (|SOLVETRA;eliminateKernRoot| |var1|
                                     (|SPADfirst|
                                      (SPADCALL |i| (QREFELT $ 94)))
                                     $))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
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
         (SEQ (LETT |listofexpr| (SPADCALL |var| (QREFELT $ 119)))
              (EXIT
               (COND ((QEQCAR |listofexpr| 1) |var|)
                     ('T
                      (SEQ (LETT |listofexpr| (CONS 0 (QCDR |listofexpr|)))
                           (LETT |listforgcd| NIL)
                           (SEQ (LETT |i| NIL) (LETT #3# (QCDR |listofexpr|))
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |i| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |exprcoeff|
                                       (SPADCALL (SPADCALL |i| (QREFELT $ 61))
                                                 (QREFELT $ 120)))
                                 (EXIT
                                  (LETT |listforgcd|
                                        (CONS |exprcoeff| |listforgcd|))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (LETT |gcdcoeff|
                                 (SPADCALL
                                  (SPADCALL |listforgcd| (QREFELT $ 121))
                                  (QREFELT $ 122)))
                           (LETT |newexpr| (|spadConstant| $ 123))
                           (SEQ (LETT |i| NIL) (LETT #2# (QCDR |listofexpr|))
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |i| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |exprlist| (|SOLVETRA;splitExpr| |i| $))
                                 (EXIT
                                  (LETT |newexpr|
                                        (SPADCALL |newexpr|
                                                  (|SOLVETRA;logexpp|
                                                   (SPADCALL |exprlist| 2
                                                             (QREFELT $ 58))
                                                   (SPADCALL
                                                    (SPADCALL |exprlist| 1
                                                              (QREFELT $ 58))
                                                    |gcdcoeff| (QREFELT $ 97))
                                                   $)
                                                  (QREFELT $ 124)))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (LETT |kernelofvar|
                                 (SPADCALL |newexpr| (QREFELT $ 94)))
                           (LETT |var2| (|spadConstant| $ 104))
                           (SEQ (LETT |i| NIL) (LETT #1# |kernelofvar|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |i| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |var2|
                                        (SPADCALL |var2|
                                                  (|SPADfirst|
                                                   (SPADCALL |i|
                                                             (QREFELT $ 77)))
                                                  (QREFELT $ 125)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL |gcdcoeff|
                                      (SPADCALL |var2| (QREFELT $ 79))
                                      (QREFELT $ 125)))))))))) 

(SDEFUN |SOLVETRA;testLog| ((|expr| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G332 NIL) (#2=#:G333 NIL) (|i| NIL)
          (|kernelofexpr| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|log|))
                (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z $))
                (COND
                 ((EQL (LENGTH |kernelofexpr|) 0)
                  (PROGN (LETT #1# NIL) (GO #3=#:G331))))
                (SEQ (LETT |i| NIL) (LETT #2# |kernelofexpr|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 94)))
                                    (QREFELT $ 127))
                          |testList| (QREFELT $ 128))
                         (COND
                          ((NULL
                            (|SOLVETRA;testkernel|
                             (|SPADfirst|
                              (SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 94)))
                               (QREFELT $ 77)))
                             Z $))
                           (PROGN (LETT #1# NIL) (GO #3#)))))
                        ('T (PROGN (LETT #1# NIL) (GO #3#))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;splitExpr|
        ((|expr| . #1=(|Expression| R)) ($ |List| (|Expression| R)))
        (SPROG
         ((|listexpr| (|Union| (|List| (|Expression| R)) "failed"))
          (|exprwcoeff| #1#) (|lcoeff| (R)))
         (SEQ
          (LETT |lcoeff|
                (SPADCALL (SPADCALL |expr| (QREFELT $ 61)) (QREFELT $ 120)))
          (LETT |exprwcoeff| |expr|)
          (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT $ 129)))
          (EXIT
           (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| $ 104) |expr|))
                 ('T
                  (SEQ
                   (LETT |listexpr|
                         (CONS 0
                               (SPADCALL (SPADCALL |lcoeff| (QREFELT $ 122))
                                         (QCDR |listexpr|) (QREFELT $ 130))))
                   (EXIT
                    (CONS (SPADCALL |lcoeff| (QREFELT $ 122))
                          (QCDR |listexpr|)))))))))) 

(SDEFUN |SOLVETRA;buildnexpr|
        ((|expr| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|ansmant| (|Expression| R)) (|anscoeff| (|Expression| R))
          (#1=#:G348 NIL) (|i| NIL) (|n2list| (|List| (|Expression| R)))
          (|nlist| (|List| (|Expression| R))))
         (SEQ (LETT |nlist| (|SOLVETRA;splitExpr| |expr| $))
              (LETT |n2list|
                    (SPADCALL (SPADCALL |nlist| 1 (QREFELT $ 58)) |nlist|
                              (QREFELT $ 130)))
              (LETT |anscoeff| (|spadConstant| $ 104))
              (LETT |ansmant| (|spadConstant| $ 123))
              (SEQ (LETT |i| NIL) (LETT #1# |n2list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| Z (QREFELT $ 132))
                       (LETT |anscoeff|
                             (SPADCALL |i| |anscoeff| (QREFELT $ 125))))
                      ('T (LETT |ansmant| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (LIST |anscoeff|
                     (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT $ 58))
                               (QREFELT $ 125))))))) 

(SDEFUN |SOLVETRA;logexpp|
        ((|expr1| |Expression| R) (|expr2| |Expression| R) ($ |Expression| R))
        (SPADCALL
         (SPADCALL
          (|SPADfirst|
           (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT $ 94)))
                     (QREFELT $ 77)))
          |expr2| (QREFELT $ 133))
         (QREFELT $ 79))) 

(SDEFUN |SOLVETRA;combineLog|
        ((|expr| |Expression| R) (Y |Symbol|) ($ |Expression| R))
        (SPROG
         ((|ansexpr| #1=(|Expression| R)) (#2=#:G366 NIL) (|i| NIL) (|ans| #1#)
          (|exprr| (|List| (|Expression| R))) (|loopexpr| (|Expression| R))
          (|exprtable| (|Table| (|Expression| R) (|Expression| R))))
         (SEQ (LETT |exprtable| (SPADCALL (QREFELT $ 135)))
              (EXIT
               (COND ((QEQCAR (SPADCALL |expr| (QREFELT $ 119)) 1) |expr|)
                     ('T
                      (SEQ (LETT |ans| (|spadConstant| $ 123))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL |expr| (|spadConstant| $ 123)
                                             (QREFELT $ 137)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |loopexpr|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |expr| (QREFELT $ 61))
                                         (QREFELT $ 138))
                                        (QREFELT $ 62)))
                                 (COND
                                  ((|SOLVETRA;testLog| |loopexpr| Y $)
                                   (COND
                                    ((EQL
                                      (LENGTH
                                       (|SOLVETRA;tableXkernels| |loopexpr| Y
                                        $))
                                      1)
                                     (SEQ
                                      (LETT |exprr|
                                            (|SOLVETRA;buildnexpr| |loopexpr| Y
                                             $))
                                      (COND
                                       ((QEQCAR
                                         (SPADCALL
                                          (SPADCALL |exprr| 1 (QREFELT $ 58))
                                          |exprtable| (QREFELT $ 140))
                                         1)
                                        (SPADCALL |exprtable|
                                                  (SPADCALL |exprr| 1
                                                            (QREFELT $ 58))
                                                  (|spadConstant| $ 123)
                                                  (QREFELT $ 141))))
                                      (EXIT
                                       (SPADCALL |exprtable|
                                                 (SPADCALL |exprr| 1
                                                           (QREFELT $ 58))
                                                 (SPADCALL
                                                  (SPADCALL |exprtable|
                                                            (SPADCALL |exprr| 1
                                                                      (QREFELT
                                                                       $ 58))
                                                            (QREFELT $ 142))
                                                  (SPADCALL |exprr| 2
                                                            (QREFELT $ 58))
                                                  (QREFELT $ 124))
                                                 (QREFELT $ 141)))))
                                    ('T
                                     (LETT |ans|
                                           (SPADCALL |ans| |loopexpr|
                                                     (QREFELT $ 124))))))
                                  ('T
                                   (LETT |ans|
                                         (SPADCALL |ans| |loopexpr|
                                                   (QREFELT $ 124)))))
                                 (EXIT
                                  (LETT |expr|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |expr| (QREFELT $ 61))
                                          (QREFELT $ 143))
                                         (QREFELT $ 62)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |ansexpr| (|spadConstant| $ 123))
                           (SEQ (LETT |i| NIL)
                                (LETT #2#
                                      (SPADCALL |exprtable| (QREFELT $ 144)))
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |i| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |ansexpr|
                                        (SPADCALL |ansexpr|
                                                  (SPADCALL
                                                   (|SOLVETRA;logsumtolog|
                                                    (SPADCALL |exprtable| |i|
                                                              (QREFELT $ 142))
                                                    $)
                                                   |i| (QREFELT $ 125))
                                                  (QREFELT $ 124)))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (LETT |ansexpr|
                                  (SPADCALL |ansexpr| |ans|
                                            (QREFELT $ 124))))))))))) 

(SDEFUN |SOLVETRA;testRootk|
        ((|varlistk| |Expression| R) (|y| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G372 NIL) (#2=#:G373 NIL) (|i| NIL)
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |varlistk| |y| $))
            (EXIT
             (COND ((NULL |kernelofeqnvar|) NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| NIL) (LETT #2# |kernelofeqnvar|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT $ 94)))
                               '|nthRoot| (QREFELT $ 145))
                              (PROGN (LETT #1# 'T) (GO #3=#:G371))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                     (EXIT NIL)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;tableXkernels|
        ((|evar| |Expression| R) (Z |Symbol|) ($ |List| (|Expression| R)))
        (SPROG
         ((|listkOfvar| (|List| (|Expression| R))) (#1=#:G378 NIL) (|i| NIL)
          (|kOfvar| (|List| (|Kernel| (|Expression| R)))))
         (SEQ (LETT |kOfvar| (SPADCALL |evar| (QREFELT $ 94)))
              (LETT |listkOfvar| NIL)
              (SEQ (LETT |i| NIL) (LETT #1# |kOfvar|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |i| (QREFELT $ 111)) Z
                                  (QREFELT $ 132)))
                       (LETT |listkOfvar|
                             (CONS (SPADCALL |i| (QREFELT $ 111))
                                   |listkOfvar|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |listkOfvar|)))) 

(SDEFUN |SOLVETRA;testTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G385 NIL) (#2=#:G386 NIL) (|i| NIL)
          (|testList| (|List| (|Symbol|)))
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $))
                (EXIT
                 (COND ((NULL |kernelofeqnvar|) NIL)
                       ('T
                        (SEQ
                         (LETT |testList|
                               (LIST '|sin| '|cos| '|tan| '|cot| '|sec|
                                     '|csc|))
                         (SEQ (LETT |i| NIL) (LETT #2# |kernelofeqnvar|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |i| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT $ 94)))
                                    (QREFELT $ 127))
                                   |testList| (QREFELT $ 128))
                                  (COND
                                   ((NULL
                                     (|SOLVETRA;testkernel|
                                      (|SPADfirst|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL |i| (QREFELT $ 94)))
                                        (QREFELT $ 77)))
                                      Z $))
                                    (PROGN (LETT #1# NIL) (GO #3=#:G384)))))
                                 ('T (PROGN (LETT #1# NIL) (GO #3#))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;testHTrig|
        ((|eqnvar| |Expression| R) (Z |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G393 NIL) (#2=#:G394 NIL) (|i| NIL)
          (|testList| (|List| (|Symbol|)))
          (|kernelofeqnvar| (|List| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $))
                (EXIT
                 (COND ((NULL |kernelofeqnvar|) NIL)
                       ('T
                        (SEQ
                         (LETT |testList|
                               (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech|
                                     '|csch|))
                         (SEQ (LETT |i| NIL) (LETT #2# |kernelofeqnvar|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |i| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT $ 94)))
                                    (QREFELT $ 127))
                                   |testList| (QREFELT $ 128))
                                  (COND
                                   ((NULL
                                     (|SOLVETRA;testkernel|
                                      (|SPADfirst|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL |i| (QREFELT $ 94)))
                                        (QREFELT $ 77)))
                                      Z $))
                                    (PROGN (LETT #1# NIL) (GO #3=#:G392)))))
                                 ('T (PROGN (LETT #1# NIL) (GO #3#))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;makeInterval| ((|l| R) ($ |Complex| (|Interval| (|Float|))))
        (COND
         ((|HasCategory| (QREFELT $ 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SPADCALL (ELT $ 148) (SPADCALL |l| (QREFELT $ 150))
                    (QREFELT $ 154)))
         ('T (|error| "This should never happen")))) 

(SDEFUN |SOLVETRA;dropfun| ((|x| |Expression| R) ($ |Expression| R))
        (SPROG
         ((#1=#:G404 NIL) (|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 156)))
                 (EXIT
                  (COND
                   ((OR (QEQCAR |k| 1)
                        (NULL (SPADCALL (QCDR |k|) (QREFELT $ 77))))
                    (PROGN
                     (LETT #1# (|spadConstant| $ 123))
                     (GO #2=#:G402))))))
            (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 77))))))
          #2# (EXIT #1#)))) 

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
           ((SPADCALL |k| '|sin| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|sin| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1='T (CONS 0 (SPADCALL |l| (QREFELT $ 157))))))
           ((SPADCALL |k| '|cos| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|cos| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 158))))))
           ((SPADCALL |k| '|tan| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|tan| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 159))))))
           ((SPADCALL |k| '|cot| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|cot| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 160))))))
           ((SPADCALL |k| '|sec| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|sec| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 161))))))
           ((SPADCALL |k| '|csc| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|csc| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 162))))))
           ((SPADCALL |k| '|sinh| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|sinh| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 163))))))
           ((SPADCALL |k| '|cosh| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|cosh| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 164))))))
           ((SPADCALL |k| '|tanh| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|tanh| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 165))))))
           ((SPADCALL |k| '|coth| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|coth| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 166))))))
           ((SPADCALL |k| '|sech| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|sech| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 167))))))
           ((SPADCALL |k| '|csch| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| '|csch| (QREFELT $ 117))
              (CONS 0 (|SOLVETRA;dropfun| |l| $)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 168))))))
           ((SPADCALL |k| '|atan| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 98))))
           ((SPADCALL |k| '|acot| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 169))))))
           ((SPADCALL |k| '|asin| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 170))))
           ((SPADCALL |k| '|acos| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 171))))
           ((SPADCALL |k| '|asec| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 172))))
           ((SPADCALL |k| '|acsc| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 173))))))
           ((SPADCALL |k| '|asinh| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 174))))
           ((SPADCALL |k| '|acosh| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 175))))
           ((SPADCALL |k| '|atanh| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 176))))
           ((SPADCALL |k| '|acoth| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 177))))))
           ((SPADCALL |k| '|asech| (QREFELT $ 117))
            (CONS 0 (SPADCALL |l| (QREFELT $ 178))))
           ((SPADCALL |k| '|acsch| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 179))))))
           ((SPADCALL |k| '|exp| (QREFELT $ 117))
            (COND
             ((SPADCALL |l| (|spadConstant| $ 123) (QREFELT $ 36))
              (CONS 1 "failed"))
             (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| $)))))
           ((SPADCALL |k| '|log| (QREFELT $ 117))
            (COND
             ((|HasCategory| (QREFELT $ 6)
                             (LIST '|ConvertibleTo|
                                   (LIST '|Complex| '(|Float|))))
              (SEQ
               (LETT |ze|
                     (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) $)
                               |l| (QREFELT $ 183)))
               (LETT |z| (SPADCALL |ze| (QREFELT $ 185)))
               (EXIT
                (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT $ 186))))
                      (#1#
                       (SEQ (LETT |im| (SPADCALL (QCDR |z|) (QREFELT $ 187)))
                            (LETT |fpi| (SPADCALL (QREFELT $ 188)))
                            (COND
                             ((SPADCALL (SPADCALL |fpi| (QREFELT $ 189))
                                        (SPADCALL |im| (QREFELT $ 190))
                                        (QREFELT $ 191))
                              (COND
                               ((SPADCALL (SPADCALL |im| (QREFELT $ 192)) |fpi|
                                          (QREFELT $ 193))
                                (EXIT
                                 (CONS 0 (SPADCALL |l| (QREFELT $ 186))))))))
                            (EXIT (CONS 1 "failed"))))))))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 186))))))
           ((SPADCALL |k| '|%power| (QREFELT $ 117))
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 32)))
                 (EXIT
                  (COND
                   ((SPADCALL |t| (|spadConstant| $ 123) (QREFELT $ 36))
                    (CONS 1 "failed"))
                   (#1# (CONS 0 (SPADCALL |t| (QREFELT $ 79))))))))
           (#1# (CONS 0 |l|)))))) 

(SDEFUN |SOLVETRA;ker2Poly|
        ((|k| |Kernel| (|Expression| R)) (|lvar| |List| (|Symbol|))
         ($ |Polynomial| (|Expression| R)))
        (SPROG ((|nm| (|Symbol|)))
               (COND
                ((SPADCALL (LETT |nm| (SPADCALL |k| (QREFELT $ 127))) |lvar|
                           (QREFELT $ 128))
                 (SPADCALL |nm| (QREFELT $ 195)))
                ('T
                 (SPADCALL (SPADCALL |k| (QREFELT $ 111)) (QREFELT $ 196)))))) 

(SDEFUN |SOLVETRA;smp2Poly|
        ((|pol| |SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))
         (|lvar| |List| (|Symbol|)) ($ |Polynomial| (|Expression| R)))
        (SPROG NIL
               (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR $ |lvar|))
                         (CONS #'|SOLVETRA;smp2Poly!1| $) |pol|
                         (QREFELT $ 200)))) 

(SDEFUN |SOLVETRA;smp2Poly!1| ((|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |y| (QREFELT $ 122)) (QREFELT $ 196))) 

(SDEFUN |SOLVETRA;smp2Poly!0| ((|x| NIL) ($$ NIL))
        (PROG (|lvar| $)
          (LETT |lvar| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SOLVETRA;ker2Poly| |x| |lvar| $))))) 

(SDEFUN |SOLVETRA;makeFracPoly|
        ((|expr| |Expression| R) (|lvar| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Expression| R))))
        (SPADCALL
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 61)) |lvar| $)
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 201)) |lvar| $)
         (QREFELT $ 203))) 

(SDEFUN |SOLVETRA;makeREpol|
        ((|pol| |Polynomial| (|Expression| R)) ($ |Expression| R))
        (SPROG
         ((|lval| (|List| (|Expression| R))) (#1=#:G467 NIL) (|v| NIL)
          (#2=#:G466 NIL) (|lvar| (|List| (|Symbol|))))
         (SEQ (LETT |lvar| (SPADCALL |pol| (QREFELT $ 204)))
              (LETT |lval|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |v| NIL) (LETT #1# |lvar|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |v| (QREFELT $ 34)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT
               (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT $ 205))
                         (QREFELT $ 206)))))) 

(SDEFUN |SOLVETRA;makeRE|
        ((|frac| |Fraction| (|Polynomial| (|Expression| R)))
         ($ |Expression| R))
        (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 207)) $)
                  (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 208)) $)
                  (QREFELT $ 97))) 

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
                (SPADCALL (|SOLVETRA;makeREpol| |pol| $) |sol|
                          (QREFELT $ 210)))
          (LETT |vsols| (SPADCALL |repol| |var| (QREFELT $ 17)))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |vsol| NIL) (LETT #1# |vsols|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |vsol| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (CONS |vsol| |sol|) #2#))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

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
         (SEQ (LETT |rplist| (REVERSE |plist|)) (LETT |rlvar| (REVERSE |lvar|))
              (LETT |sols| (SPADCALL NIL (QREFELT $ 211)))
              (SEQ (LETT |v| NIL) (LETT #7# |rlvar|) (LETT |p| NIL)
                   (LETT #6# |rplist|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL) (ATOM #7#)
                         (PROGN (LETT |v| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |sols|
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |sol| NIL) (LETT #5# |sols|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |sol| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|SOLVETRA;solve1Pol| |p| |v| |sol|
                                           $))
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4#
                                                      (QREFELT $ 212))))
                                     ('T
                                      (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T NIL))))))
                   (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |sols|)))) 

(SDEFUN |SOLVETRA;frac_to_expr|
        ((|q| |Fraction|
          (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
         ($ |Expression| R))
        (SPADCALL (SPADCALL |q| (QREFELT $ 214)) (SPADCALL |q| (QREFELT $ 215))
                  (QREFELT $ 216))) 

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
                   (LETT #29# NIL)
                   (SEQ (LETT |v| NIL) (LETT #28# |lvar|) G190
                        (COND
                         ((OR (ATOM #28#) (PROGN (LETT |v| (CAR #28#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #29#
                                (CONS (SPADCALL |v| (QREFELT $ 38)) #29#))))
                        (LETT #28# (CDR #28#)) (GO G190) G191
                        (EXIT (NREVERSE #29#)))))
            (EXIT
             (COND
              ((OR
                (PROGN
                 (LETT #23# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #27# |lexpr|) G190
                      (COND
                       ((OR (ATOM #27#) (PROGN (LETT |expr| (CAR #27#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #26#
                               (SPADCALL
                                (SPADCALL (SPADCALL |expr| (QREFELT $ 61))
                                          |lvk| (QREFELT $ 218))
                                1 (QREFELT $ 14)))
                         (COND (#23# (LETT #24# (COND (#24# 'T) ('T #26#))))
                               ('T (PROGN (LETT #24# #26#) (LETT #23# 'T)))))))
                      (LETT #27# (CDR #27#)) (GO G190) G191 (EXIT NIL))
                 (COND (#23# #24#) (#30='T NIL)))
                (PROGN
                 (LETT #18# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #22# |lexpr|) G190
                      (COND
                       ((OR (ATOM #22#) (PROGN (LETT |expr| (CAR #22#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #21#
                               (NULL
                                (NULL
                                 (SPADCALL |lvk|
                                           (SPADCALL
                                            (SPADCALL |expr| (QREFELT $ 201))
                                            (QREFELT $ 219))
                                           (QREFELT $ 220)))))
                         (COND (#18# (LETT #19# (COND (#19# 'T) ('T #21#))))
                               ('T (PROGN (LETT #19# #21#) (LETT #18# 'T)))))))
                      (LETT #22# (CDR #22#)) (GO G190) G191 (EXIT NIL))
                 (COND (#18# #19#) (#30# NIL))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |llk|
                      (PROGN
                       (LETT #17# NIL)
                       (SEQ (LETT |expr| NIL) (LETT #16# |lexpr|) G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |expr| (CAR #16#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (SPADCALL |expr| (QREFELT $ 221))
                                          #17#))))
                            (LETT #16# (CDR #16#)) (GO G190) G191
                            (EXIT (NREVERSE #17#)))))
                (LETT |kers| (SPADCALL (ELT $ 223) |llk| (QREFELT $ 226)))
                (SEQ (LETT |ker| NIL) (LETT #15# |kers|) G190
                     (COND
                      ((OR (ATOM #15#) (PROGN (LETT |ker| (CAR #15#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |ker| (QREFELT $ 228)) 0) "iterate")
                        ((NULL
                          (NULL
                           (SPADCALL |lvar|
                                     (SPADCALL (SPADCALL |ker| (QREFELT $ 111))
                                               (QREFELT $ 11))
                                     (QREFELT $ 229))))
                         (PROGN
                          (LETT #14# (CONS 1 "failed"))
                          (GO #31=#:G528))))))
                     (LETT #15# (CDR #15#)) (GO G190) G191 (EXIT NIL))
                (LETT |ps|
                      (PROGN
                       (LETT #13# NIL)
                       (SEQ (LETT |expr| NIL) (LETT #12# |lexpr|) G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |expr| (CAR #12#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |expr| (QREFELT $ 61))
                                          #13#))))
                            (LETT #12# (CDR #12#)) (GO G190) G191
                            (EXIT (NREVERSE #13#)))))
                (LETT |r| (SPADCALL |ps| |lvk| (QREFELT $ 233)))
                (LETT |mate|
                      (SPADCALL
                       (PROGN
                        (LETT #11# NIL)
                        (SEQ (LETT |row| NIL)
                             (LETT #10# (SPADCALL (QCAR |r|) (QREFELT $ 236)))
                             G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |row| (CAR #10#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #11#
                                     (CONS
                                      (PROGN
                                       (LETT #9# NIL)
                                       (SEQ (LETT |q| NIL) (LETT #8# |row|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |q| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (|SOLVETRA;frac_to_expr|
                                                      |q| $)
                                                     #9#))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT (NREVERSE #9#))))
                                      #11#))))
                             (LETT #10# (CDR #10#)) (GO G190) G191
                             (EXIT (NREVERSE #11#))))
                       (QREFELT $ 239)))
                (LETT |vece|
                      (SPADCALL
                       (PROGN
                        (LETT #7# NIL)
                        (SEQ (LETT |q| NIL)
                             (LETT #6# (SPADCALL (QCDR |r|) (QREFELT $ 242)))
                             G190
                             (COND
                              ((OR (ATOM #6#) (PROGN (LETT |q| (CAR #6#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (|SOLVETRA;frac_to_expr| |q| $)
                                           #7#))))
                             (LETT #6# (CDR #6#)) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       (QREFELT $ 244)))
                (LETT |sol| (SPADCALL |mate| |vece| (QREFELT $ 248)))
                (EXIT
                 (COND ((QEQCAR (QCAR |sol|) 1) (CONS 0 NIL))
                       (#30#
                        (SEQ
                         (LETT |rhs|
                               (PROG2 (LETT #4# (QCAR |sol|))
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|Vector|
                                                  (|Expression| (QREFELT $ 6)))
                                                 (|Union|
                                                  (|Vector|
                                                   (|Expression|
                                                    (QREFELT $ 6)))
                                                  #5#)
                                                 #4#)))
                         (LETT |zeron|
                               (SPADCALL (LENGTH |lvar|) (QREFELT $ 249)))
                         (SEQ (LETT |p| NIL) (LETT #3# (QCDR |sol|)) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |p| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |p| |zeron| (QREFELT $ 252))
                                  (SEQ
                                   (LETT |sym|
                                         (SPADCALL (SPADCALL (QREFELT $ 33))
                                                   (QREFELT $ 34)))
                                   (EXIT
                                    (SEQ (LETT |i| 1)
                                         (LETT #2# (LENGTH |lvar|)) G190
                                         (COND
                                          ((|greater_SI| |i| #2#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SPADCALL |rhs| |i|
                                                     (SPADCALL
                                                      (SPADCALL |rhs| |i|
                                                                (QREFELT $
                                                                         253))
                                                      (SPADCALL |sym|
                                                                (SPADCALL |p|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           253))
                                                                (QREFELT $
                                                                         125))
                                                      (QREFELT $ 124))
                                                     (QREFELT $ 254))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT NIL))))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (LETT |eqs| NIL)
                         (SEQ (LETT |i| 1) (LETT #1# (LENGTH |lvar|)) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |eqs|
                                      (SPADCALL |eqs|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lvar| |i|
                                                             (QREFELT $ 255))
                                                   (QREFELT $ 34))
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT $ 253))
                                                  (QREFELT $ 35)))
                                                (QREFELT $ 59)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 (LIST |eqs|)))))))))))))
          #31# (EXIT #14#)))) 

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
         (SEQ (LETT |ans1| (|SOLVETRA;solveRetract| |lexpr| |lvar| $))
              (EXIT
               (COND
                ((QEQCAR |ans1| 1)
                 (SEQ (LETT |ans1| (|SOLVETRA;tryLinear| |lexpr| |lvar| $))
                      (EXIT
                       (COND
                        ((QEQCAR |ans1| 1)
                         (SEQ
                          (LETT |lfrac|
                                (PROGN
                                 (LETT #4# NIL)
                                 (SEQ (LETT |expr| NIL) (LETT #3# |lexpr|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |expr| (CAR #3#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4#
                                              (CONS
                                               (|SOLVETRA;makeFracPoly| |expr|
                                                |lvar| $)
                                               #4#))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT (NREVERSE #4#)))))
                          (LETT |trianglist|
                                (SPADCALL |lfrac| |lvar| (QREFELT $ 259)))
                          (LETT |l|
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |plist| NIL)
                                      (LETT #1# |trianglist|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |plist| (CAR #1#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (|SOLVETRA;solve1Sys| |plist|
                                                |lvar| $)
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (EXIT
                           (SPADCALL (ELT $ 212) |l| NIL (QREFELT $ 262)))))
                        (#5='T (QCDR |ans1|))))))
                (#5# (QCDR |ans1|))))))) 

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
                 (LETT #2# NIL)
                 (SEQ (LETT |eq| NIL) (LETT #1# |leqs|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 20))
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 22))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
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
                 (LETT #16# NIL)
                 (SEQ (LETT |eq| NIL) (LETT #15# |leqs|) G190
                      (COND
                       ((OR (ATOM #15#) (PROGN (LETT |eq| (CAR #15#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 20))
                                         (SPADCALL |eq| (QREFELT $ 21))
                                         (QREFELT $ 22))
                               #16#))))
                      (LETT #15# (CDR #15#)) (GO G190) G191
                      (EXIT (NREVERSE #16#)))))
          (LETT |lvar|
                (PROGN
                 (LETT #14# NIL)
                 (SEQ (LETT |k| NIL) (LETT #13# |lker|) G190
                      (COND
                       ((OR (ATOM #13#) (PROGN (LETT |k| (CAR #13#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14# (CONS (SPADCALL (QREFELT $ 33)) #14#))))
                      (LETT #13# (CDR #13#)) (GO G190) G191
                      (EXIT (NREVERSE #14#)))))
          (LETT |lval|
                (PROGN
                 (LETT #12# NIL)
                 (SEQ (LETT |v| NIL) (LETT #11# |lvar|) G190
                      (COND
                       ((OR (ATOM #11#) (PROGN (LETT |v| (CAR #11#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12# (CONS (SPADCALL |v| (QREFELT $ 34)) #12#))))
                      (LETT #11# (CDR #11#)) (GO G190) G191
                      (EXIT (NREVERSE #12#)))))
          (LETT |nlexpr|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #9# |lexpr|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |expr| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL |expr| |lker| |lval| (QREFELT $ 264))
                               #10#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #10#)))))
          (LETT |ans| (|SOLVETRA;solveList| |nlexpr| |lvar| $))
          (LETT |lker2|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |v| NIL) (LETT #7# |lvar|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |v| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (SPADCALL |v| (QREFELT $ 38)) #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |lval2|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |k| NIL) (LETT #5# |lker|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |k| (QREFELT $ 111)) #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (EXIT
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |sol| NIL) (LETT #3# |ans|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |sol| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |neq| NIL) (LETT #1# |sol|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |neq| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (CONS #'|SOLVETRA;solve;LLL;38!0|
                                                (VECTOR $ |lval2| |lker2|))
                                          |neq| (QREFELT $ 266))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SOLVETRA;solve;LLL;38!0| ((|e| NIL) ($$ NIL))
        (PROG (|lker2| |lval2| $)
          (LETT |lker2| (QREFELT $$ 2))
          (LETT |lval2| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |lker2| |lval2| (QREFELT $ 264)))))) 

(SDEFUN |SOLVETRA;retract2|
        ((|e| |Expression| R) ($ |Kernel| (|Expression| R)))
        (SPROG ((|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
               (SEQ (LETT |k| (SPADCALL |e| (QREFELT $ 156)))
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
                 (LETT #2# NIL)
                 (SEQ (LETT |e| NIL) (LETT #1# |lexpr|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SOLVETRA;retract2| |e| $) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |leqs| |lker| (QREFELT $ 267)))))) 

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
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TransSolvePackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TransSolvePackage|)))))))))) 

(DEFUN |TransSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TransSolvePackage| DV$1))
          (LETT $ (GETREFV 269))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Union| 57 '#1="failed") (36 . |retractIfCan|)
              (|Union| (|Fraction| 57) '#1#) (41 . |retractIfCan|)
              (|Equation| $) (46 . |eval|)
              (|ElementaryFunctionStructurePackage| 6 8) (52 . |normalize|)
              (57 . |new|) (61 . |coerce|) (66 . =) (72 . =) (|Kernel| 8)
              (78 . |kernel|) (|Fraction| 53) (|Kernel| $) (83 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 42) (89 . |numer|)
              (|Factored| 42) (|ExpressionFactorPolynomial| 6 8)
              (94 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 48) (|:| |factor| 42) (|:| |exponent| 13))
              (|List| 49) (99 . |factorList|) (|List| $)
              (|SparseUnivariatePolynomial| $) (104 . |zerosOf|) (|List| 8)
              (110 . |append|) (|Integer|) (116 . |elt|) (122 . |append|)
              (|SparseMultivariatePolynomial| 6 40) (128 . |numer|)
              (133 . |coerce|) (|Factored| 53) (138 . |factorPolynomial|)
              (|AlgebraicManipulations| 6 8) (143 . |rootSimp|) (|Factored| 68)
              (|SparseMultivariatePolynomial| 6 37)
              (|MultivariateFactorize| 37 (|IndexedExponents| 37) 6 68)
              (148 . |factor|)
              (|Record| (|:| |flag| 48) (|:| |factor| 68) (|:| |exponent| 13))
              (|List| 71) (153 . |factorList|)
              (|Record| (|:| |var| 40) (|:| |exponent| 57))
              (|Union| 74 '"failed") (158 . |isExpt|) (164 . |argument|)
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
              (315 . |resultant|) (321 . |is?|) (|Union| 52 '"failed")
              (327 . |isPlus|) (332 . |leadingCoefficient|) (337 . |gcd|)
              (342 . |coerce|) (347 . |Zero|) (351 . +) (357 . *)
              (363 . |Zero|) (367 . |name|) (372 . |member?|) (378 . |isTimes|)
              (383 . |remove!|) (389 . |One|) (393 . |freeOf?|) (399 . ^)
              (|Table| 8 8) (405 . |table|) (409 . |Zero|) (413 . ~=)
              (419 . |leadingMonomial|) (|Union| 8 '"failed") (424 . |search|)
              (430 . |setelt!|) (437 . |elt|) (443 . |reductum|) (448 . |keys|)
              (453 . |is?|) (|Float|) (|Interval| 146) (459 . |interval|)
              (|Complex| 146) (464 . |convert|) (|Complex| 147)
              (|Mapping| 147 146) (|ComplexFunctions2| 146 147) (469 . |map|)
              (|Union| 40 '#1#) (475 . |retractIfCan|) (480 . |asin|)
              (485 . |acos|) (490 . |atan|) (495 . |acot|) (500 . |asec|)
              (505 . |acsc|) (510 . |asinh|) (515 . |acosh|) (520 . |atanh|)
              (525 . |acoth|) (530 . |asech|) (535 . |acsch|) (540 . |cot|)
              (545 . |sin|) (550 . |cos|) (555 . |sec|) (560 . |csc|)
              (565 . |sinh|) (570 . |cosh|) (575 . |tanh|) (580 . |coth|)
              (585 . |sech|) (590 . |csch|) (|Expression| 151)
              (|Mapping| 151 6) (|ExpressionFunctions2| 6 151) (595 . |map|)
              (|Union| 151 '#1#) (601 . |retractIfCan|) (606 . |exp|)
              (611 . |imag|) (616 . |pi|) (620 . -) (625 . |inf|) (630 . <)
              (636 . |sup|) (641 . <=) (|Polynomial| 8) (647 . |coerce|)
              (652 . |coerce|) (|Mapping| 194 37) (|Mapping| 194 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 37) 37 6 68 194)
              (657 . |map|) (664 . |denom|) (|Fraction| 194) (669 . /)
              (675 . |variables|) (680 . |eval|) (687 . |ground|)
              (692 . |numer|) (697 . |denom|) (|List| 29) (702 . |eval|)
              (708 . |list|) (713 . |append|) (|Fraction| 68) (719 . |numer|)
              (724 . |denom|) (729 . /) (|List| 37) (735 . |totalDegree|)
              (741 . |variables|) (746 . |setIntersection|) (752 . |tower|)
              (757 . |setUnion|) (763 . |setUnion|) (|Mapping| 217 217 217)
              (|List| 217) (769 . |reduce|) (|Union| 16 '"failed")
              (775 . |symbolIfCan|) (780 . |setIntersection|)
              (|Record| (|:| |mat| 235) (|:| |vec| 241)) (|List| 68)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 37) 37 68)
              (786 . |intoMatrix|) (|List| 240) (|Matrix| 213)
              (792 . |listOfLists|) (|List| 55) (|Matrix| 8) (797 . |matrix|)
              (|List| 213) (|Vector| 213) (802 . |parts|) (|Vector| 8)
              (807 . |vector|) (|Union| 243 '"failed")
              (|Record| (|:| |particular| 245) (|:| |basis| (|List| 243)))
              (|LinearSystemMatrixPackage| 8 243 243 238) (812 . |solve|)
              (818 . |zero|) (|Vector| $) (823 . |basis|) (827 . ~=)
              (833 . |elt|) (839 . |setelt!|) (846 . |elt|)
              (|List| (|List| 194)) (|List| 202) (|SystemSolvePackage| 8)
              (852 . |triangularSystems|) (|Mapping| 84 84 84) (|List| 84)
              (858 . |reduce|) |SOLVETRA;solve;LLL;37| (865 . |eval|)
              (|Mapping| 8 8) (872 . |map|) |SOLVETRA;solve;LLL;38|
              |SOLVETRA;solve;LLL;40|)
           '#(|solve| 878) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 268
                                                 '(1 8 7 0 9 1 8 10 0 11 0 6 0
                                                   12 2 13 7 0 0 14 1 19 8 0 20
                                                   1 19 8 0 21 2 8 0 0 0 22 1 8
                                                   25 0 26 1 8 27 0 28 2 8 0 0
                                                   29 30 1 31 8 8 32 0 16 0 33
                                                   1 8 0 16 34 2 19 0 8 8 35 2
                                                   8 7 0 0 36 1 37 0 16 38 2 8
                                                   39 0 40 41 1 43 42 0 44 1 46
                                                   45 42 47 1 45 50 0 51 2 8 52
                                                   53 16 54 2 55 0 0 0 56 2 55
                                                   8 0 57 58 2 15 0 0 0 59 1 8
                                                   60 0 61 1 8 0 60 62 1 8 63
                                                   53 64 1 65 8 8 66 1 69 67 68
                                                   70 1 67 72 0 73 2 8 75 0 16
                                                   76 1 37 55 0 77 2 8 0 57 0
                                                   78 1 8 0 0 79 0 80 0 81 1 8
                                                   82 0 83 2 86 84 85 10 87 1
                                                   88 8 8 89 2 31 8 8 16 90 2
                                                   91 8 8 16 92 1 8 93 0 94 1 8
                                                   0 0 95 1 8 0 57 96 2 8 0 0 0
                                                   97 1 8 0 0 98 2 8 0 99 0 100
                                                   2 8 0 0 99 101 0 19 0 102 2
                                                   19 0 8 0 103 0 8 0 104 1 8 0
                                                   0 105 3 106 43 43 43 43 107
                                                   2 43 7 0 0 108 2 42 8 109 8
                                                   110 1 8 0 40 111 1 55 8 0
                                                   112 1 8 57 0 113 2 42 0 8 13
                                                   114 2 42 0 0 0 115 2 42 8 0
                                                   0 116 2 8 7 0 16 117 1 8 118
                                                   0 119 1 68 6 0 120 1 6 0 52
                                                   121 1 8 0 6 122 0 8 0 123 2
                                                   8 0 0 0 124 2 8 0 0 0 125 0
                                                   6 0 126 1 37 16 0 127 2 10 7
                                                   16 0 128 1 8 118 0 129 2 55
                                                   0 8 0 130 0 57 0 131 2 8 7 0
                                                   16 132 2 8 0 0 0 133 0 134 0
                                                   135 0 80 0 136 2 8 7 0 0 137
                                                   1 68 0 0 138 2 134 139 8 0
                                                   140 3 134 8 0 8 8 141 2 134
                                                   8 0 8 142 1 68 0 0 143 1 134
                                                   55 0 144 2 37 7 0 16 145 1
                                                   147 0 146 148 1 6 149 0 150
                                                   2 153 151 152 149 154 1 8
                                                   155 0 156 1 8 0 0 157 1 8 0
                                                   0 158 1 8 0 0 159 1 8 0 0
                                                   160 1 8 0 0 161 1 8 0 0 162
                                                   1 8 0 0 163 1 8 0 0 164 1 8
                                                   0 0 165 1 8 0 0 166 1 8 0 0
                                                   167 1 8 0 0 168 1 8 0 0 169
                                                   1 8 0 0 170 1 8 0 0 171 1 8
                                                   0 0 172 1 8 0 0 173 1 8 0 0
                                                   174 1 8 0 0 175 1 8 0 0 176
                                                   1 8 0 0 177 1 8 0 0 178 1 8
                                                   0 0 179 2 182 180 181 8 183
                                                   1 180 184 0 185 1 8 0 0 186
                                                   1 151 147 0 187 0 146 0 188
                                                   1 146 0 0 189 1 147 146 0
                                                   190 2 146 7 0 0 191 1 147
                                                   146 0 192 2 146 7 0 0 193 1
                                                   194 0 16 195 1 194 0 8 196 3
                                                   199 194 197 198 68 200 1 8
                                                   60 0 201 2 202 0 194 194 203
                                                   1 194 10 0 204 3 194 0 0 10
                                                   55 205 1 194 8 0 206 1 202
                                                   194 0 207 1 202 194 0 208 2
                                                   8 0 0 209 210 1 84 0 15 211
                                                   2 84 0 0 0 212 1 213 68 0
                                                   214 1 213 68 0 215 2 8 0 60
                                                   60 216 2 68 13 0 217 218 1
                                                   68 217 0 219 2 217 0 0 0 220
                                                   1 8 93 0 221 2 15 0 0 0 222
                                                   2 217 0 0 0 223 2 225 217
                                                   224 0 226 1 37 227 0 228 2
                                                   10 0 0 0 229 2 232 230 231
                                                   217 233 1 235 234 0 236 1
                                                   238 0 237 239 1 241 240 0
                                                   242 1 243 0 55 244 2 247 246
                                                   238 243 248 1 243 0 13 249 0
                                                   151 250 251 2 243 7 0 0 252
                                                   2 243 8 0 57 253 3 243 8 0
                                                   57 8 254 2 10 16 0 57 255 2
                                                   258 256 257 10 259 3 261 84
                                                   260 0 84 262 3 8 0 0 93 52
                                                   264 2 19 0 265 0 266 1 0 15
                                                   8 18 2 0 15 19 16 24 1 0 15
                                                   19 23 2 0 84 15 10 263 2 0
                                                   15 8 16 17 2 0 84 15 55 268
                                                   2 0 84 15 217 267)))))
           '|lookupComplete|)) 
