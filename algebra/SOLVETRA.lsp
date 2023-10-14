
(DEFUN |SOLVETRA;solve;EL;1| (|oside| $)
  (PROG (|lv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |oside| (QREFELT $ 9))
        (|error| "equation is always satisfied"))
       (#1='T
        (SEQ
         (LETT |lv| (SPADCALL |oside| (QREFELT $ 11)) |SOLVETRA;solve;EL;1|)
         (EXIT
          (COND ((NULL |lv|) (|error| "inconsistent equation"))
                ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 14))
                 (|error| "too many variables"))
                (#1#
                 (SPADCALL |oside| (|SPADfirst| |lv|) (QREFELT $ 17)))))))))))) 

(DEFUN |SOLVETRA;solve;EL;2| (|equ| $)
  (SPADCALL
   (SPADCALL (SPADCALL |equ| (QREFELT $ 20)) (SPADCALL |equ| (QREFELT $ 21))
             (QREFELT $ 22))
   (QREFELT $ 18))) 

(DEFUN |SOLVETRA;solve;ESL;3| (|equ| |x| $)
  (PROG (|oneside|)
    (RETURN
     (SEQ
      (LETT |oneside|
            (SPADCALL (SPADCALL |equ| (QREFELT $ 20))
                      (SPADCALL |equ| (QREFELT $ 21)) (QREFELT $ 22))
            |SOLVETRA;solve;ESL;3|)
      (EXIT (SPADCALL |oneside| |x| (QREFELT $ 17))))))) 

(DEFUN |SOLVETRA;testZero?| (|lside| |sol| $)
  (SEQ
   (COND
    ((|HasCategory| (QREFELT $ 6) (LIST '|QuotientFieldCategory| '(|Integer|)))
     (COND
      ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 26)) 1)
       (EXIT 'T))))
    ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT $ 21)) (QREFELT $ 28)) 1)
     (EXIT 'T)))
   (EXIT
    (COND
     ((SPADCALL
       (SPADCALL (SPADCALL |lside| |sol| (QREFELT $ 30)) (QREFELT $ 32))
       (QREFELT $ 9))
      'T)
     ('T 'NIL))))) 

(DEFUN |SOLVETRA;solve;ESL;5| (|lside| |x| $)
  (PROG (#1=#:G211 |sol| #2=#:G210)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SOLVETRA;solve;ESL;5|))
       (SEQ (LETT |sol| NIL . #3#)
            (LETT #1# (|SOLVETRA;solveInner| |lside| |x| $) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((|SOLVETRA;testZero?| |lside| |sol| $)
                (LETT #2# (CONS |sol| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SOLVETRA;solveInner| (|lside| |x| $)
  (PROG (#1=#:G240 |sols| #2=#:G247 |frec| |lfacts| |listofkernels| |newlside|
         |newlist| #3=#:G246 |j| |secondsol| #4=#:G227 #5=#:G226 #6=#:G228
         #7=#:G245 |ff| |lfatt| |f| |elR| #8=#:G244 |i| #9=#:G222 #10=#:G221
         #11=#:G223 #12=#:G243 |ri| |bigX_back| #13=#:G217 |r1| |finv|
         #14=#:G242 |lr| #15=#:G214 #16=#:G213 #17=#:G215 #18=#:G241 |fatt|
         |eq1| |bigX| Y X |ausgabe1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lside| (|SOLVETRA;eliminateRoot| |lside| |x| $)
              . #19=(|SOLVETRA;solveInner|))
        (LETT |ausgabe1| (|SOLVETRA;tableXkernels| |lside| |x| $) . #19#)
        (LETT X (SPADCALL (QREFELT $ 33)) . #19#)
        (LETT Y (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)) . #19#)
        (EXIT
         (COND
          ((EQL (LENGTH |ausgabe1|) 1)
           (SEQ (LETT |bigX| (|SPADfirst| |ausgabe1|) . #19#)
                (LETT |eq1|
                      (SPADCALL |lside|
                                (SPADCALL |bigX| (SPADCALL X (QREFELT $ 34))
                                          (QREFELT $ 35))
                                (QREFELT $ 30))
                      . #19#)
                (LETT |f|
                      (SPADCALL |eq1|
                                (|SPADfirst|
                                 (SPADCALL (SPADCALL X (QREFELT $ 34))
                                           (QREFELT $ 38)))
                                (QREFELT $ 41))
                      . #19#)
                (LETT |lfatt|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 44)) (QREFELT $ 47))
                       (QREFELT $ 51))
                      . #19#)
                (LETT |lr|
                      (PROGN
                       (LETT #15# NIL . #19#)
                       (SEQ (LETT |fatt| NIL . #19#) (LETT #18# |lfatt| . #19#)
                            G190
                            (COND
                             ((OR (ATOM #18#)
                                  (PROGN (LETT |fatt| (CAR #18#) . #19#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #17#
                                     (SPADCALL (QCAR |fatt|) |x|
                                               (QREFELT $ 53))
                                     . #19#)
                               (COND
                                (#15# (LETT #16# (APPEND #16# #17#) . #19#))
                                ('T
                                 (PROGN
                                  (LETT #16# #17# . #19#)
                                  (LETT #15# 'T . #19#)))))))
                            (LETT #18# (CDR #18#) . #19#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#15# #16#) (#20='T NIL)))
                      . #19#)
                (LETT |r1| NIL . #19#)
                (SEQ (LETT |i| 1 . #19#) (LETT #14# (LENGTH |lr|) . #19#) G190
                     (COND ((|greater_SI| |i| #14#) (GO G191)))
                     (SEQ
                      (LETT |finv|
                            (|SOLVETRA;funcinv| |bigX|
                             (SPADCALL |lr| |i| (QREFELT $ 56)) $)
                            . #19#)
                      (EXIT
                       (COND
                        ((QEQCAR |finv| 0)
                         (LETT |r1| (CONS (QCDR |finv|) |r1|) . #19#)))))
                     (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                     (EXIT NIL))
                (LETT |bigX_back|
                      (PROG2
                          (LETT #13# (|SOLVETRA;funcinv| |bigX| |bigX| $)
                                . #19#)
                          (QCDR #13#)
                        (|check_union| (QEQCAR #13# 0)
                                       (|Expression| (QREFELT $ 6)) #13#))
                      . #19#)
                (COND
                 ((NULL (|SOLVETRA;testkernel| |bigX_back| |x| $))
                  (SEQ
                   (COND
                    ((SPADCALL |bigX| |bigX_back| (QREFELT $ 36))
                     (PROGN (LETT #1# NIL . #19#) (GO #1#))))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (PROGN
                            (LETT #9# NIL . #19#)
                            (SEQ (LETT |ri| NIL . #19#) (LETT #12# |r1| . #19#)
                                 G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |ri| (CAR #12#) . #19#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #11#
                                          (SPADCALL
                                           (SPADCALL |bigX_back| |ri|
                                                     (QREFELT $ 22))
                                           |x| (QREFELT $ 17))
                                          . #19#)
                                    (COND
                                     (#9#
                                      (LETT #10# (APPEND #10# #11#) . #19#))
                                     ('T
                                      (PROGN
                                       (LETT #10# #11# . #19#)
                                       (LETT #9# 'T . #19#)))))))
                                 (LETT #12# (CDR #12#) . #19#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#9# #10#) (#20# NIL)))
                           . #19#)
                     (GO #1#))))))
                (LETT |newlist| NIL . #19#)
                (SEQ (LETT |i| 1 . #19#) (LETT #8# (LENGTH |r1|) . #19#) G190
                     (COND ((|greater_SI| |i| #8#) (GO G191)))
                     (SEQ
                      (LETT |elR|
                            (|SOLVETRA;eliminateRoot|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |bigX_back|
                                         (SPADCALL |r1| |i| (QREFELT $ 56))
                                         (QREFELT $ 22))
                               (QREFELT $ 58))
                              (QREFELT $ 59))
                             |x| $)
                            . #19#)
                      (LETT |f|
                            (SPADCALL |elR| (SPADCALL |x| (QREFELT $ 61))
                                      (QREFELT $ 41))
                            . #19#)
                      (LETT |lfatt|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f| (QREFELT $ 44))
                                       (QREFELT $ 47))
                             (QREFELT $ 51))
                            . #19#)
                      (LETT |secondsol|
                            (PROGN
                             (LETT #4# NIL . #19#)
                             (SEQ (LETT |ff| NIL . #19#)
                                  (LETT #7# |lfatt| . #19#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |ff| (CAR #7#) . #19#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #6#
                                           (SPADCALL (QCAR |ff|) |x|
                                                     (QREFELT $ 53))
                                           . #19#)
                                     (COND
                                      (#4# (LETT #5# (APPEND #5# #6#) . #19#))
                                      ('T
                                       (PROGN
                                        (LETT #5# #6# . #19#)
                                        (LETT #4# 'T . #19#)))))))
                                  (LETT #7# (CDR #7#) . #19#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#4# #5#) ('T NIL)))
                            . #19#)
                      (EXIT
                       (SEQ (LETT |j| 1 . #19#)
                            (LETT #3# (LENGTH |secondsol|) . #19#) G190
                            (COND ((|greater_SI| |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |newlist|
                                    (CONS
                                     (SPADCALL (SPADCALL |x| (QREFELT $ 34))
                                               (SPADCALL
                                                (SPADCALL |secondsol| |j|
                                                          (QREFELT $ 56))
                                                (QREFELT $ 63))
                                               (QREFELT $ 35))
                                     |newlist|)
                                    . #19#)))
                            (LETT |j| (|inc_SI| |j|) . #19#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |newlist|)))
          (#20#
           (SEQ (LETT |newlside| (|SOLVETRA;tryToTrans| |lside| |x| $) . #19#)
                (LETT |listofkernels|
                      (|SOLVETRA;tableXkernels| |newlside| |x| $) . #19#)
                (EXIT
                 (COND
                  ((EQL (LENGTH |listofkernels|) 1)
                   (SPADCALL |newlside| |x| (QREFELT $ 17)))
                  (#20#
                   (SEQ
                    (LETT |lfacts|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lside| (QREFELT $ 58))
                                     (QREFELT $ 67))
                           (QREFELT $ 70))
                          . #19#)
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |lfacts|) 1 (QREFELT $ 14))
                       (SEQ (LETT |sols| NIL . #19#)
                            (SEQ (LETT |frec| NIL . #19#)
                                 (LETT #2# |lfacts| . #19#) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |frec| (CAR #2#) . #19#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |sols|
                                         (APPEND
                                          (SPADCALL
                                           (SPADCALL (QCAR |frec|)
                                                     (QREFELT $ 59))
                                           |x| (QREFELT $ 17))
                                          |sols|)
                                         . #19#)))
                                 (LETT #2# (CDR #2#) . #19#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |sols|)))
                      (#20# (PROGN (LETT #1# NIL . #19#) (GO #1#)))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;simplifyingLog| (|f| $)
  (PROG (|rec| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| '|exp| (QREFELT $ 73))
            . #1=(|SOLVETRA;simplifyingLog|))
      (EXIT
       (COND
        ((QEQCAR |u| 0)
         (SEQ (LETT |rec| (QCDR |u|) . #1#)
              (EXIT
               (SPADCALL (QCDR |rec|)
                         (|SPADfirst| (SPADCALL (QCAR |rec|) (QREFELT $ 74)))
                         (QREFELT $ 75)))))
        ('T (SPADCALL |f| (QREFELT $ 76))))))))) 

(DEFUN |SOLVETRA;testkernel| (|var1| |y| $)
  (PROG (|listvar1|)
    (RETURN
     (SEQ
      (LETT |var1| (|SOLVETRA;eliminateRoot| |var1| |y| $)
            . #1=(|SOLVETRA;testkernel|))
      (LETT |listvar1| (|SOLVETRA;tableXkernels| |var1| |y| $) . #1#)
      (EXIT
       (COND
        ((EQL (LENGTH |listvar1|) 1)
         (COND
          ((OR
            (SPADCALL (SPADCALL |listvar1| 1 (QREFELT $ 56))
                      (SPADCALL |y| (QREFELT $ 34)) (QREFELT $ 36))
            (EQL (LENGTH |listvar1|) 0))
           'T)
          ('T 'NIL)))
        ((EQL (LENGTH |listvar1|) 0) 'T) ('T 'NIL))))))) 

(DEFUN |SOLVETRA;solveRetract| (|lexpr| |lvar| $)
  (PROG (|nlexpr| #1=#:G269 |rf| #2=#:G270 |expr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nlexpr| NIL . #3=(|SOLVETRA;solveRetract|))
            (SEQ (LETT |expr| NIL . #3#) (LETT #2# |lexpr| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |expr| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT $ 80)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |rf| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                        ('T
                         (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|) . #3#)))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT $ 84))))))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;tryToTrans| (|lside| |x| $)
  (PROG (|resultLside| |numlside| |listcnorm| |cnormConvLside| |listConvLside|
         |NormConvLside| |convLside|)
    (RETURN
     (SEQ
      (COND
       ((OR (|SOLVETRA;testTrig| |lside| |x| $)
            (|SOLVETRA;testHTrig| |lside| |x| $))
        (SEQ
         (LETT |convLside| (SPADCALL |lside| (QREFELT $ 86))
               . #1=(|SOLVETRA;tryToTrans|))
         (LETT |resultLside| |convLside| . #1#)
         (LETT |listConvLside| (|SOLVETRA;tableXkernels| |convLside| |x| $)
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
            (SEQ
             (LETT |NormConvLside| (SPADCALL |convLside| |x| (QREFELT $ 87))
                   . #1#)
             (LETT |NormConvLside| |NormConvLside| . #1#)
             (EXIT
              (LETT |resultLside| (|SOLVETRA;subsTan| |NormConvLside| |x| $)
                    . #1#))))))))
       ((|SOLVETRA;testLog| |lside| |x| $)
        (SEQ
         (LETT |numlside|
               (SPADCALL (SPADCALL |lside| (QREFELT $ 58)) (QREFELT $ 59))
               . #1#)
         (EXIT
          (LETT |resultLside| (|SOLVETRA;combineLog| |numlside| |x| $)
                . #1#))))
       ('T
        (SEQ (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT $ 87)) . #1#)
             (LETT |NormConvLside| |NormConvLside| . #1#)
             (LETT |resultLside| |NormConvLside| . #1#)
             (LETT |listConvLside|
                   (|SOLVETRA;tableXkernels| |NormConvLside| |x| $) . #1#)
             (EXIT
              (COND
               ((SPADCALL (LENGTH |listConvLside|) 1 (QREFELT $ 14))
                (SEQ
                 (LETT |cnormConvLside| (SPADCALL |lside| |x| (QREFELT $ 89))
                       . #1#)
                 (LETT |cnormConvLside| |cnormConvLside| . #1#)
                 (LETT |resultLside| |cnormConvLside| . #1#)
                 (LETT |listcnorm|
                       (|SOLVETRA;tableXkernels| |cnormConvLside| |x| $) . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |listcnorm|) 1 (QREFELT $ 14))
                    (COND
                     ((|SOLVETRA;testLog| |cnormConvLside| |x| $)
                      (SEQ
                       (LETT |numlside|
                             (SPADCALL
                              (SPADCALL |cnormConvLside| (QREFELT $ 58))
                              (QREFELT $ 59))
                             . #1#)
                       (EXIT
                        (LETT |resultLside|
                              (|SOLVETRA;combineLog| |numlside| |x| $)
                              . #1#)))))))))))))))
      (EXIT |resultLside|))))) 

(DEFUN |SOLVETRA;subsTan| (|exprvar| |y| $)
  (PROG (|resultnew| |result1| #1=#:G288 |result| |newH| H |g| |secondfun| |f|
         |fN| |fZ| |test| Y |varkern| |listofkern| Z)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT Z (SPADCALL (QREFELT $ 33)) . #2=(|SOLVETRA;subsTan|))
            (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| $)
                  . #2#)
            (LETT |varkern| (|SPADfirst| |listofkern|) . #2#)
            (LETT Y
                  (SPADCALL
                   (SPADCALL
                    (|SPADfirst|
                     (SPADCALL
                      (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 38)))
                      (QREFELT $ 74)))
                    (QREFELT $ 58))
                   (QREFELT $ 59))
                  . #2#)
            (LETT |test|
                  (SPADCALL |varkern|
                            (SPADCALL
                             (SPADCALL Y (SPADCALL 2 (QREFELT $ 90))
                                       (QREFELT $ 91))
                             (QREFELT $ 92))
                            (QREFELT $ 36))
                  . #2#)
            (COND
             ((EQL (LENGTH |listofkern|) 1)
              (COND
               ((NULL |test|) (PROGN (LETT #1# |exprvar| . #2#) (GO #1#)))))
             (#3='T (PROGN (LETT #1# |exprvar| . #2#) (GO #1#))))
            (LETT |fZ|
                  (SPADCALL |exprvar|
                            (SPADCALL |varkern| (SPADCALL Z (QREFELT $ 34))
                                      (QREFELT $ 35))
                            (QREFELT $ 30))
                  . #2#)
            (LETT |fN| (SPADCALL (SPADCALL |fZ| (QREFELT $ 58)) (QREFELT $ 59))
                  . #2#)
            (LETT |f|
                  (SPADCALL |fN|
                            (|SPADfirst|
                             (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                       (QREFELT $ 38)))
                            (QREFELT $ 41))
                  . #2#)
            (LETT |secondfun|
                  (SPADCALL
                   (SPADCALL (SPADCALL 2 Y (QREFELT $ 94))
                             (SPADCALL (SPADCALL Y 2 (QREFELT $ 95))
                                       (|spadConstant| $ 96) (QREFELT $ 22))
                             (QREFELT $ 91))
                   (QREFELT $ 97))
                  . #2#)
            (LETT |g|
                  (SPADCALL |secondfun|
                            (|SPADfirst|
                             (SPADCALL (SPADCALL |y| (QREFELT $ 34))
                                       (QREFELT $ 38)))
                            (QREFELT $ 41))
                  . #2#)
            (LETT H (SPADCALL (SPADCALL (QREFELT $ 33)) (QREFELT $ 34)) . #2#)
            (LETT |newH|
                  (SPADCALL H
                            (|SPADfirst|
                             (SPADCALL (SPADCALL Z (QREFELT $ 34))
                                       (QREFELT $ 38)))
                            (QREFELT $ 41))
                  . #2#)
            (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT $ 99)) . #2#)
            (EXIT
             (COND
              ((SPADCALL |result| |f| (QREFELT $ 100))
               (PROGN (LETT #1# |exprvar| . #2#) (GO #1#)))
              (#3#
               (SEQ
                (LETT |result1| (SPADCALL |result| H (QREFELT $ 102)) . #2#)
                (EXIT
                 (LETT |resultnew|
                       (SPADCALL |result1|
                                 (SPADCALL H (SPADCALL Y (QREFELT $ 92))
                                           (QREFELT $ 35))
                                 (QREFELT $ 30))
                       . #2#))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;eliminateKernRoot| (|var| |varkern| $)
  (PROG (|resultvar| |var3| #1=#:G297 |var2| |var1| X)
    (RETURN
     (SEQ
      (LETT X (SPADCALL (QREFELT $ 33)) . #2=(|SOLVETRA;eliminateKernRoot|))
      (LETT |var1|
            (SPADCALL |var|
                      (SPADCALL (SPADCALL |varkern| (QREFELT $ 103))
                                (SPADCALL X (QREFELT $ 34)) (QREFELT $ 35))
                      (QREFELT $ 30))
            . #2#)
      (LETT |var2|
            (SPADCALL
             (SPADCALL |var1|
                       (|SPADfirst|
                        (SPADCALL (SPADCALL X (QREFELT $ 34)) (QREFELT $ 38)))
                       (QREFELT $ 41))
             (QREFELT $ 44))
            . #2#)
      (LETT |var3|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 96)
                       (PROG1
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |varkern| (QREFELT $ 74))
                                            (QREFELT $ 104))
                                  (QREFELT $ 105))
                                 . #2#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       (QREFELT $ 106))
             (SPADCALL (|SPADfirst| (SPADCALL |varkern| (QREFELT $ 74))) 0
                       (QREFELT $ 106))
             (QREFELT $ 107))
            . #2#)
      (EXIT
       (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT $ 108)) . #2#)))))) 

(DEFUN |SOLVETRA;eliminateRoot| (|var| |y| $)
  (PROG (|var1| #1=#:G306 |i| |varlistk1|)
    (RETURN
     (SEQ (LETT |var1| |var| . #2=(|SOLVETRA;eliminateRoot|))
          (SEQ G190
               (COND ((NULL (|SOLVETRA;testRootk| |var1| |y| $)) (GO G191)))
               (SEQ
                (LETT |varlistk1| (|SOLVETRA;tableXkernels| |var1| |y| $)
                      . #2#)
                (EXIT
                 (SEQ (LETT |i| NIL . #2#) (LETT #1# |varlistk1| . #2#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| '|nthRoot| (QREFELT $ 109))
                          (LETT |var1|
                                (|SOLVETRA;eliminateKernRoot| |var1|
                                 (|SPADfirst| (SPADCALL |i| (QREFELT $ 38))) $)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |var1|))))) 

(DEFUN |SOLVETRA;logsumtolog| (|var| $)
  (PROG (|var2| #1=#:G320 |i| |kernelofvar| |newexpr| |exprlist| #2=#:G319
         |gcdcoeff| |listforgcd| |exprcoeff| #3=#:G318 |listofexpr|)
    (RETURN
     (SEQ
      (LETT |listofexpr| (SPADCALL |var| (QREFELT $ 111))
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
                               (SPADCALL (SPADCALL |i| (QREFELT $ 58))
                                         (QREFELT $ 112))
                               . #4#)
                         (EXIT
                          (LETT |listforgcd| (CONS |exprcoeff| |listforgcd|)
                                . #4#)))
                        (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                   (LETT |gcdcoeff|
                         (SPADCALL (SPADCALL |listforgcd| (QREFELT $ 113))
                                   (QREFELT $ 114))
                         . #4#)
                   (LETT |newexpr| (|spadConstant| $ 115) . #4#)
                   (SEQ (LETT |i| NIL . #4#)
                        (LETT #2# (QCDR |listofexpr|) . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |i| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |exprlist| (|SOLVETRA;splitExpr| |i| $) . #4#)
                         (EXIT
                          (LETT |newexpr|
                                (SPADCALL |newexpr|
                                          (|SOLVETRA;logexpp|
                                           (SPADCALL |exprlist| 2
                                                     (QREFELT $ 56))
                                           (SPADCALL
                                            (SPADCALL |exprlist| 1
                                                      (QREFELT $ 56))
                                            |gcdcoeff| (QREFELT $ 91))
                                           $)
                                          (QREFELT $ 116))
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                   (LETT |kernelofvar| (SPADCALL |newexpr| (QREFELT $ 38))
                         . #4#)
                   (LETT |var2| (|spadConstant| $ 96) . #4#)
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
                                           (SPADCALL |i| (QREFELT $ 74)))
                                          (QREFELT $ 117))
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL |gcdcoeff| (SPADCALL |var2| (QREFELT $ 76))
                              (QREFELT $ 117))))))))))) 

(DEFUN |SOLVETRA;testLog| (|expr| Z $)
  (PROG (#1=#:G326 #2=#:G327 |i| |kernelofexpr| |testList|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |testList| (LIST '|log|) . #3=(|SOLVETRA;testLog|))
            (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z $) . #3#)
            (COND
             ((EQL (LENGTH |kernelofexpr|) 0)
              (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofexpr| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 119))
                      |testList| (QREFELT $ 120))
                     (COND
                      ((NULL
                        (|SOLVETRA;testkernel|
                         (|SPADfirst|
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                    (QREFELT $ 74)))
                         Z $))
                       (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))))
                    ('T (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;splitExpr| (|expr| $)
  (PROG (|listexpr| |exprwcoeff| |lcoeff|)
    (RETURN
     (SEQ
      (LETT |lcoeff|
            (SPADCALL (SPADCALL |expr| (QREFELT $ 58)) (QREFELT $ 112))
            . #1=(|SOLVETRA;splitExpr|))
      (LETT |exprwcoeff| |expr| . #1#)
      (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT $ 121)) . #1#)
      (EXIT
       (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| $ 96) |expr|))
             ('T
              (SEQ
               (LETT |listexpr|
                     (CONS 0
                           (SPADCALL (SPADCALL |lcoeff| (QREFELT $ 114))
                                     (QCDR |listexpr|) (QREFELT $ 122)))
                     . #1#)
               (EXIT
                (CONS (SPADCALL |lcoeff| (QREFELT $ 114))
                      (QCDR |listexpr|))))))))))) 

(DEFUN |SOLVETRA;buildnexpr| (|expr| Z $)
  (PROG (|ansmant| |anscoeff| #1=#:G342 |i| |n2list| |nlist|)
    (RETURN
     (SEQ
      (LETT |nlist| (|SOLVETRA;splitExpr| |expr| $)
            . #2=(|SOLVETRA;buildnexpr|))
      (LETT |n2list|
            (SPADCALL (SPADCALL |nlist| 1 (QREFELT $ 56)) |nlist|
                      (QREFELT $ 122))
            . #2#)
      (LETT |anscoeff| (|spadConstant| $ 96) . #2#)
      (LETT |ansmant| (|spadConstant| $ 115) . #2#)
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |n2list| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |i| Z (QREFELT $ 124))
               (LETT |anscoeff| (SPADCALL |i| |anscoeff| (QREFELT $ 117))
                     . #2#))
              ('T (LETT |ansmant| |i| . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (LIST |anscoeff|
             (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT $ 56))
                       (QREFELT $ 117)))))))) 

(DEFUN |SOLVETRA;logexpp| (|expr1| |expr2| $)
  (SPADCALL
   (SPADCALL
    (|SPADfirst|
     (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT $ 38))) (QREFELT $ 74)))
    |expr2| (QREFELT $ 125))
   (QREFELT $ 76))) 

(DEFUN |SOLVETRA;combineLog| (|expr| Y $)
  (PROG (|ansexpr| #1=#:G360 |i| |ans| |exprr| |loopexpr| |exprtable|)
    (RETURN
     (SEQ
      (LETT |exprtable| (SPADCALL (QREFELT $ 127))
            . #2=(|SOLVETRA;combineLog|))
      (EXIT
       (COND ((QEQCAR (SPADCALL |expr| (QREFELT $ 111)) 1) |expr|)
             ('T
              (SEQ (LETT |ans| (|spadConstant| $ 115) . #2#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |expr| (|spadConstant| $ 115)
                                     (QREFELT $ 129)))
                          (GO G191)))
                        (SEQ
                         (LETT |loopexpr|
                               (SPADCALL
                                (SPADCALL (SPADCALL |expr| (QREFELT $ 58))
                                          (QREFELT $ 130))
                                (QREFELT $ 59))
                               . #2#)
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
                                    . #2#)
                              (COND
                               ((QEQCAR
                                 (SPADCALL (SPADCALL |exprr| 1 (QREFELT $ 56))
                                           |exprtable| (QREFELT $ 132))
                                 1)
                                (SPADCALL |exprtable|
                                          (SPADCALL |exprr| 1 (QREFELT $ 56))
                                          (|spadConstant| $ 115)
                                          (QREFELT $ 133))))
                              (EXIT
                               (SPADCALL |exprtable|
                                         (SPADCALL |exprr| 1 (QREFELT $ 56))
                                         (SPADCALL
                                          (SPADCALL |exprtable|
                                                    (SPADCALL |exprr| 1
                                                              (QREFELT $ 56))
                                                    (QREFELT $ 134))
                                          (SPADCALL |exprr| 2 (QREFELT $ 56))
                                          (QREFELT $ 116))
                                         (QREFELT $ 133)))))
                            ('T
                             (LETT |ans|
                                   (SPADCALL |ans| |loopexpr| (QREFELT $ 116))
                                   . #2#))))
                          ('T
                           (LETT |ans|
                                 (SPADCALL |ans| |loopexpr| (QREFELT $ 116))
                                 . #2#)))
                         (EXIT
                          (LETT |expr|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |expr| (QREFELT $ 58))
                                           (QREFELT $ 135))
                                 (QREFELT $ 59))
                                . #2#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |ansexpr| (|spadConstant| $ 115) . #2#)
                   (SEQ (LETT |i| NIL . #2#)
                        (LETT #1# (SPADCALL |exprtable| (QREFELT $ 136)) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |ansexpr|
                                (SPADCALL |ansexpr|
                                          (SPADCALL
                                           (|SOLVETRA;logsumtolog|
                                            (SPADCALL |exprtable| |i|
                                                      (QREFELT $ 134))
                                            $)
                                           |i| (QREFELT $ 117))
                                          (QREFELT $ 116))
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (LETT |ansexpr| (SPADCALL |ansexpr| |ans| (QREFELT $ 116))
                          . #2#)))))))))) 

(DEFUN |SOLVETRA;testRootk| (|varlistk| |y| $)
  (PROG (#1=#:G365 #2=#:G366 |i| |kernelofeqnvar| |testList|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |testList| (LIST '|nthRoot|) . #3=(|SOLVETRA;testRootk|))
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |varlistk| |y| $)
                  . #3#)
            (COND
             ((EQL (LENGTH |kernelofeqnvar|) 0)
              (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
            (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 119))
                      |testList| (QREFELT $ 120))
                     (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;tableXkernels| (|evar| Z $)
  (PROG (|listkOfvar| #1=#:G371 |i| |kOfvar|)
    (RETURN
     (SEQ
      (LETT |kOfvar| (SPADCALL |evar| (QREFELT $ 38))
            . #2=(|SOLVETRA;tableXkernels|))
      (LETT |listkOfvar| NIL . #2#)
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |kOfvar| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((NULL
                (SPADCALL (SPADCALL |i| (QREFELT $ 103)) Z (QREFELT $ 124)))
               (LETT |listkOfvar|
                     (CONS (SPADCALL |i| (QREFELT $ 103)) |listkOfvar|)
                     . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |listkOfvar|))))) 

(DEFUN |SOLVETRA;testTrig| (|eqnvar| Z $)
  (PROG (#1=#:G377 #2=#:G378 |i| |kernelofeqnvar| |testList|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |testList| (LIST '|sin| '|cos| '|tan| '|cot| '|sec| '|csc|)
              . #3=(|SOLVETRA;testTrig|))
        (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $) . #3#)
        (COND
         ((EQL (LENGTH |kernelofeqnvar|) 0)
          (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
        (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                            (QREFELT $ 119))
                  |testList| (QREFELT $ 120))
                 (COND
                  ((NULL
                    (|SOLVETRA;testkernel|
                     (|SPADfirst|
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 74)))
                     Z $))
                   (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))))
                ('T (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;testHTrig| (|eqnvar| Z $)
  (PROG (#1=#:G384 #2=#:G385 |i| |kernelofeqnvar| |testList|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |testList| (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech| '|csch|)
              . #3=(|SOLVETRA;testHTrig|))
        (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z $) . #3#)
        (COND
         ((EQL (LENGTH |kernelofeqnvar|) 0)
          (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
        (SEQ (LETT |i| NIL . #3#) (LETT #2# |kernelofeqnvar| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                            (QREFELT $ 119))
                  |testList| (QREFELT $ 120))
                 (COND
                  ((NULL
                    (|SOLVETRA;testkernel|
                     (|SPADfirst|
                      (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT $ 38)))
                                (QREFELT $ 74)))
                     Z $))
                   (PROGN (LETT #1# 'NIL . #3#) (GO #1#)))))
                ('T (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;makeInterval| (|l| $)
  (COND
   ((|HasCategory| (QREFELT $ 6)
                   (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
    (SPADCALL (ELT $ 139) (SPADCALL |l| (QREFELT $ 141)) (QREFELT $ 145)))
   ('T (|error| "This should never happen")))) 

(DEFUN |SOLVETRA;dropfun| (|x| $)
  (PROG (#1=#:G393 |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |k| (SPADCALL |x| (QREFELT $ 147)) . #2=(|SOLVETRA;dropfun|))
         (EXIT
          (COND
           ((OR (QEQCAR |k| 1) (NULL (SPADCALL (QCDR |k|) (QREFELT $ 74))))
            (PROGN (LETT #1# (|spadConstant| $ 115) . #2#) (GO #1#))))))
        (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 74))))))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVETRA;funcinv| (|k| |l| $)
  (PROG (|t| |fpi| |im| |z| |ze|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |k| '|sin| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|sin| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1='T (CONS 0 (SPADCALL |l| (QREFELT $ 148))))))
       ((SPADCALL |k| '|cos| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|cos| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 149))))))
       ((SPADCALL |k| '|tan| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|tan| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 150))))))
       ((SPADCALL |k| '|cot| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|cot| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 151))))))
       ((SPADCALL |k| '|sec| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         ((SPADCALL |l| '|sec| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 152))))))
       ((SPADCALL |k| '|csc| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         ((SPADCALL |l| '|csc| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 153))))))
       ((SPADCALL |k| '|sinh| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|sinh| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 154))))))
       ((SPADCALL |k| '|cosh| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|cosh| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 155))))))
       ((SPADCALL |k| '|tanh| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|tanh| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 156))))))
       ((SPADCALL |k| '|coth| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|coth| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 157))))))
       ((SPADCALL |k| '|sech| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|sech| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 158))))))
       ((SPADCALL |k| '|csch| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| '|csch| (QREFELT $ 109))
          (CONS 0 (|SOLVETRA;dropfun| |l| $)))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 159))))))
       ((SPADCALL |k| '|atan| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 92))))
       ((SPADCALL |k| '|acot| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 160))))))
       ((SPADCALL |k| '|asin| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 161))))
       ((SPADCALL |k| '|acos| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 162))))
       ((SPADCALL |k| '|asec| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 163))))
       ((SPADCALL |k| '|acsc| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 164))))))
       ((SPADCALL |k| '|asinh| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 165))))
       ((SPADCALL |k| '|acosh| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 166))))
       ((SPADCALL |k| '|atanh| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 167))))
       ((SPADCALL |k| '|acoth| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 168))))))
       ((SPADCALL |k| '|asech| (QREFELT $ 109))
        (CONS 0 (SPADCALL |l| (QREFELT $ 169))))
       ((SPADCALL |k| '|acsch| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 170))))))
       ((SPADCALL |k| '|exp| (QREFELT $ 109))
        (COND
         ((SPADCALL |l| (|spadConstant| $ 115) (QREFELT $ 36))
          (CONS 1 "failed"))
         (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| $)))))
       ((SPADCALL |k| '|log| (QREFELT $ 109))
        (COND
         ((|HasCategory| (QREFELT $ 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SEQ
           (LETT |ze|
                 (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) $) |l|
                           (QREFELT $ 174))
                 . #2=(|SOLVETRA;funcinv|))
           (LETT |z| (SPADCALL |ze| (QREFELT $ 176)) . #2#)
           (EXIT
            (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT $ 177))))
                  (#1#
                   (SEQ (LETT |im| (SPADCALL (QCDR |z|) (QREFELT $ 178)) . #2#)
                        (LETT |fpi| (SPADCALL (QREFELT $ 179)) . #2#)
                        (COND
                         ((SPADCALL (SPADCALL |fpi| (QREFELT $ 180))
                                    (SPADCALL |im| (QREFELT $ 181))
                                    (QREFELT $ 182))
                          (COND
                           ((SPADCALL (SPADCALL |im| (QREFELT $ 183)) |fpi|
                                      (QREFELT $ 184))
                            (EXIT (CONS 0 (SPADCALL |l| (QREFELT $ 177))))))))
                        (EXIT (CONS 1 "failed"))))))))
         (#1# (CONS 0 (SPADCALL |l| (QREFELT $ 177))))))
       ((SPADCALL |k| '|%power| (QREFELT $ 109))
        (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 32)) . #2#)
             (EXIT
              (COND
               ((SPADCALL |t| (|spadConstant| $ 115) (QREFELT $ 36))
                (CONS 1 "failed"))
               (#1# (CONS 0 (SPADCALL |t| (QREFELT $ 76))))))))
       (#1# (CONS 0 |l|))))))) 

(DEFUN |SOLVETRA;ker2Poly| (|k| |lvar| $)
  (PROG (|nm|)
    (RETURN
     (COND
      ((SPADCALL (LETT |nm| (SPADCALL |k| (QREFELT $ 119)) |SOLVETRA;ker2Poly|)
                 |lvar| (QREFELT $ 120))
       (SPADCALL |nm| (QREFELT $ 186)))
      ('T (SPADCALL (SPADCALL |k| (QREFELT $ 103)) (QREFELT $ 187))))))) 

(DEFUN |SOLVETRA;smp2Poly| (|pol| |lvar| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR $ |lvar|))
               (CONS #'|SOLVETRA;smp2Poly!1| $) |pol| (QREFELT $ 191))))) 

(DEFUN |SOLVETRA;smp2Poly!1| (|y| $)
  (SPADCALL (SPADCALL |y| (QREFELT $ 114)) (QREFELT $ 187))) 

(DEFUN |SOLVETRA;smp2Poly!0| (|x| $$)
  (PROG (|lvar| $)
    (LETT |lvar| (QREFELT $$ 1) . #1=(|SOLVETRA;smp2Poly|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|SOLVETRA;ker2Poly| |x| |lvar| $))))) 

(DEFUN |SOLVETRA;makeFracPoly| (|expr| |lvar| $)
  (SPADCALL (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 58)) |lvar| $)
            (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT $ 192)) |lvar| $)
            (QREFELT $ 194))) 

(DEFUN |SOLVETRA;makeREpol| (|pol| $)
  (PROG (|lval| #1=#:G457 |v| #2=#:G456 |lvar|)
    (RETURN
     (SEQ
      (LETT |lvar| (SPADCALL |pol| (QREFELT $ 195))
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
                    (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 34)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT $ 196))
                 (QREFELT $ 197))))))) 

(DEFUN |SOLVETRA;makeRE| (|frac| $)
  (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 198)) $)
            (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT $ 199)) $)
            (QREFELT $ 91))) 

(DEFUN |SOLVETRA;solve1Pol| (|pol| |var| |sol| $)
  (PROG (#1=#:G463 |vsol| #2=#:G462 |vsols| |repol|)
    (RETURN
     (SEQ
      (LETT |repol|
            (SPADCALL (|SOLVETRA;makeREpol| |pol| $) |sol| (QREFELT $ 201))
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
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SOLVETRA;solve1Sys| (|plist| |lvar| $)
  (PROG (|sols| #1=#:G465 #2=#:G464 #3=#:G466 #4=#:G472 |sol| #5=#:G470 |p|
         #6=#:G471 |v| |rlvar| |rplist|)
    (RETURN
     (SEQ (LETT |rplist| (REVERSE |plist|) . #7=(|SOLVETRA;solve1Sys|))
          (LETT |rlvar| (REVERSE |lvar|) . #7#)
          (LETT |sols| (SPADCALL NIL (QREFELT $ 202)) . #7#)
          (SEQ (LETT |v| NIL . #7#) (LETT #6# |rlvar| . #7#)
               (LETT |p| NIL . #7#) (LETT #5# |rplist| . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #7#) NIL)
                     (ATOM #6#) (PROGN (LETT |v| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |sols|
                       (PROGN
                        (LETT #1# NIL . #7#)
                        (SEQ (LETT |sol| NIL . #7#) (LETT #4# |sols| . #7#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |sol| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3#
                                      (|SOLVETRA;solve1Pol| |p| |v| |sol| $)
                                      . #7#)
                                (COND (#1# (LETT #2# (APPEND #2# #3#) . #7#))
                                      ('T
                                       (PROGN
                                        (LETT #2# #3# . #7#)
                                        (LETT #1# 'T . #7#)))))))
                             (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#) ('T NIL)))
                       . #7#)))
               (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |sols|))))) 

(DEFUN |SOLVETRA;frac_to_expr| (|q| $)
  (SPADCALL (SPADCALL |q| (QREFELT $ 204)) (SPADCALL |q| (QREFELT $ 205))
            (QREFELT $ 206))) 

(DEFUN |SOLVETRA;tryLinear| (|lexpr| |lvar| $)
  (PROG (|eqs| #1=#:G536 |i| #2=#:G535 |sym| #3=#:G534 |p| |zeron| |rhs|
         #4=#:G508 |sol| |vece| #5=#:G533 |q| #6=#:G532 |mate| #7=#:G531
         #8=#:G530 #9=#:G529 |row| #10=#:G528 |r| |ps| #11=#:G527 |expr|
         #12=#:G526 #13=#:G518 #14=#:G525 |ker| |kers| |llk| #15=#:G524
         #16=#:G523 #17=#:G479 #18=#:G478 #19=#:G480 #20=#:G522 #21=#:G476
         #22=#:G475 #23=#:G477 #24=#:G521 |lvk| #25=#:G520 |v| #26=#:G519)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lvk|
              (PROGN
               (LETT #26# NIL . #27=(|SOLVETRA;tryLinear|))
               (SEQ (LETT |v| NIL . #27#) (LETT #25# |lvar| . #27#) G190
                    (COND
                     ((OR (ATOM #25#) (PROGN (LETT |v| (CAR #25#) . #27#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #26# (CONS (SPADCALL |v| (QREFELT $ 61)) #26#)
                            . #27#)))
                    (LETT #25# (CDR #25#) . #27#) (GO G190) G191
                    (EXIT (NREVERSE #26#))))
              . #27#)
        (EXIT
         (COND
          ((OR
            (PROGN
             (LETT #21# NIL . #27#)
             (SEQ (LETT |expr| NIL . #27#) (LETT #24# |lexpr| . #27#) G190
                  (COND
                   ((OR (ATOM #24#)
                        (PROGN (LETT |expr| (CAR #24#) . #27#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #23#
                           (SPADCALL
                            (SPADCALL (SPADCALL |expr| (QREFELT $ 58)) |lvk|
                                      (QREFELT $ 208))
                            1 (QREFELT $ 14))
                           . #27#)
                     (COND (#21# (LETT #22# (COND (#22# 'T) ('T #23#)) . #27#))
                           ('T
                            (PROGN
                             (LETT #22# #23# . #27#)
                             (LETT #21# 'T . #27#)))))))
                  (LETT #24# (CDR #24#) . #27#) (GO G190) G191 (EXIT NIL))
             (COND (#21# #22#) (#28='T 'NIL)))
            (PROGN
             (LETT #17# NIL . #27#)
             (SEQ (LETT |expr| NIL . #27#) (LETT #20# |lexpr| . #27#) G190
                  (COND
                   ((OR (ATOM #20#)
                        (PROGN (LETT |expr| (CAR #20#) . #27#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #19#
                           (COND
                            ((NULL
                              (SPADCALL |lvk|
                                        (SPADCALL
                                         (SPADCALL |expr| (QREFELT $ 192))
                                         (QREFELT $ 209))
                                        (QREFELT $ 210)))
                             'NIL)
                            ('T 'T))
                           . #27#)
                     (COND (#17# (LETT #18# (COND (#18# 'T) ('T #19#)) . #27#))
                           ('T
                            (PROGN
                             (LETT #18# #19# . #27#)
                             (LETT #17# 'T . #27#)))))))
                  (LETT #20# (CDR #20#) . #27#) (GO G190) G191 (EXIT NIL))
             (COND (#17# #18#) (#28# 'NIL))))
           (CONS 1 "failed"))
          ('T
           (SEQ
            (LETT |llk|
                  (PROGN
                   (LETT #16# NIL . #27#)
                   (SEQ (LETT |expr| NIL . #27#) (LETT #15# |lexpr| . #27#)
                        G190
                        (COND
                         ((OR (ATOM #15#)
                              (PROGN (LETT |expr| (CAR #15#) . #27#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #16#
                                (CONS (SPADCALL |expr| (QREFELT $ 211)) #16#)
                                . #27#)))
                        (LETT #15# (CDR #15#) . #27#) (GO G190) G191
                        (EXIT (NREVERSE #16#))))
                  . #27#)
            (LETT |kers| (SPADCALL (ELT $ 213) |llk| (QREFELT $ 216)) . #27#)
            (SEQ (LETT |ker| NIL . #27#) (LETT #14# |kers| . #27#) G190
                 (COND
                  ((OR (ATOM #14#) (PROGN (LETT |ker| (CAR #14#) . #27#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((QEQCAR (SPADCALL |ker| (QREFELT $ 218)) 0) "iterate")
                    ((NULL
                      (NULL
                       (SPADCALL |lvar|
                                 (SPADCALL (SPADCALL |ker| (QREFELT $ 103))
                                           (QREFELT $ 11))
                                 (QREFELT $ 219))))
                     (PROGN (LETT #13# (CONS 1 "failed") . #27#) (GO #13#))))))
                 (LETT #14# (CDR #14#) . #27#) (GO G190) G191 (EXIT NIL))
            (LETT |ps|
                  (PROGN
                   (LETT #12# NIL . #27#)
                   (SEQ (LETT |expr| NIL . #27#) (LETT #11# |lexpr| . #27#)
                        G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |expr| (CAR #11#) . #27#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS (SPADCALL |expr| (QREFELT $ 58)) #12#)
                                . #27#)))
                        (LETT #11# (CDR #11#) . #27#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  . #27#)
            (LETT |r| (SPADCALL |ps| |lvk| (QREFELT $ 223)) . #27#)
            (LETT |mate|
                  (SPADCALL
                   (PROGN
                    (LETT #10# NIL . #27#)
                    (SEQ (LETT |row| NIL . #27#)
                         (LETT #9# (SPADCALL (QCAR |r|) (QREFELT $ 226))
                               . #27#)
                         G190
                         (COND
                          ((OR (ATOM #9#)
                               (PROGN (LETT |row| (CAR #9#) . #27#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #10#
                                 (CONS
                                  (PROGN
                                   (LETT #8# NIL . #27#)
                                   (SEQ (LETT |q| NIL . #27#)
                                        (LETT #7# |row| . #27#) G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |q| (CAR #7#) . #27#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #8#
                                                (CONS
                                                 (|SOLVETRA;frac_to_expr| |q|
                                                  $)
                                                 #8#)
                                                . #27#)))
                                        (LETT #7# (CDR #7#) . #27#) (GO G190)
                                        G191 (EXIT (NREVERSE #8#))))
                                  #10#)
                                 . #27#)))
                         (LETT #9# (CDR #9#) . #27#) (GO G190) G191
                         (EXIT (NREVERSE #10#))))
                   (QREFELT $ 229))
                  . #27#)
            (LETT |vece|
                  (SPADCALL
                   (PROGN
                    (LETT #6# NIL . #27#)
                    (SEQ (LETT |q| NIL . #27#)
                         (LETT #5# (SPADCALL (QCDR |r|) (QREFELT $ 232))
                               . #27#)
                         G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |q| (CAR #5#) . #27#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6# (CONS (|SOLVETRA;frac_to_expr| |q| $) #6#)
                                 . #27#)))
                         (LETT #5# (CDR #5#) . #27#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   (QREFELT $ 234))
                  . #27#)
            (LETT |sol| (SPADCALL |mate| |vece| (QREFELT $ 238)) . #27#)
            (EXIT
             (COND ((QEQCAR (QCAR |sol|) 1) (CONS 0 NIL))
                   (#28#
                    (SEQ
                     (LETT |rhs|
                           (PROG2 (LETT #4# (QCAR |sol|) . #27#)
                               (QCDR #4#)
                             (|check_union| (QEQCAR #4# 0)
                                            (|Vector|
                                             (|Expression| (QREFELT $ 6)))
                                            #4#))
                           . #27#)
                     (LETT |zeron| (SPADCALL (LENGTH |lvar|) (QREFELT $ 239))
                           . #27#)
                     (SEQ (LETT |p| NIL . #27#) (LETT #3# (QCDR |sol|) . #27#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |p| (CAR #3#) . #27#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |p| |zeron| (QREFELT $ 242))
                              (SEQ
                               (LETT |sym|
                                     (SPADCALL (SPADCALL (QREFELT $ 33))
                                               (QREFELT $ 34))
                                     . #27#)
                               (EXIT
                                (SEQ (LETT |i| 1 . #27#)
                                     (LETT #2# (LENGTH |lvar|) . #27#) G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SPADCALL |rhs| |i|
                                                 (SPADCALL
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT $ 243))
                                                  (SPADCALL |sym|
                                                            (SPADCALL |p| |i|
                                                                      (QREFELT
                                                                       $ 243))
                                                            (QREFELT $ 117))
                                                  (QREFELT $ 116))
                                                 (QREFELT $ 244))))
                                     (LETT |i| (|inc_SI| |i|) . #27#) (GO G190)
                                     G191 (EXIT NIL))))))))
                          (LETT #3# (CDR #3#) . #27#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |eqs| NIL . #27#)
                     (SEQ (LETT |i| 1 . #27#) (LETT #1# (LENGTH |lvar|) . #27#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |eqs|
                                  (APPEND |eqs|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |lvar| |i|
                                                       (QREFELT $ 245))
                                             (QREFELT $ 34))
                                            (SPADCALL |rhs| |i|
                                                      (QREFELT $ 243))
                                            (QREFELT $ 35))))
                                  . #27#)))
                          (LETT |i| (|inc_SI| |i|) . #27#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (CONS 0 (LIST |eqs|)))))))))))))
      #13# (EXIT #13#))))) 

(DEFUN |SOLVETRA;solveList| (|lexpr| |lvar| $)
  (PROG (|l| #1=#:G548 |plist| #2=#:G547 |trianglist| |lfrac| #3=#:G546 |expr|
         #4=#:G545 |ans1|)
    (RETURN
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
                         (SEQ (LETT |expr| NIL . #5#) (LETT #3# |lexpr| . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |expr| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (|SOLVETRA;makeFracPoly| |expr| |lvar|
                                        $)
                                       #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (LETT |trianglist| (SPADCALL |lfrac| |lvar| (QREFELT $ 249))
                        . #5#)
                  (LETT |l|
                        (PROGN
                         (LETT #2# NIL . #5#)
                         (SEQ (LETT |plist| NIL . #5#)
                              (LETT #1# |trianglist| . #5#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |plist| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (|SOLVETRA;solve1Sys| |plist| |lvar| $)
                                       #2#)
                                      . #5#)))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #5#)
                  (EXIT (SPADCALL (ELT $ 250) |l| NIL (QREFELT $ 253)))))
                (#6='T (QCDR |ans1|))))))
        (#6# (QCDR |ans1|)))))))) 

(DEFUN |SOLVETRA;solve;LLL;37| (|leqs| |lvar| $)
  (PROG (|lexpr| #1=#:G553 |eq| #2=#:G552)
    (RETURN
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
      (EXIT (|SOLVETRA;solveList| |lexpr| |lvar| $)))))) 

(DECLAIM (NOTINLINE |TransSolvePackage;|)) 

(DEFUN |TransSolvePackage| (#1=#:G554)
  (PROG ()
    (RETURN
     (PROG (#2=#:G555)
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
          (UNWIND-PROTECT (PROG1 (|TransSolvePackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|TransSolvePackage|))))))))))) 

(DEFUN |TransSolvePackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TransSolvePackage|))
      (LETT |dv$| (LIST '|TransSolvePackage| DV$1) . #1#)
      (LETT $ (GETREFV 255) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TransSolvePackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TransSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Expression| 6) (0 . |zero?|) (|List| 16) (5 . |variables|)
              (10 . |One|) (|NonNegativeInteger|) (14 . >) (|List| 19)
              (|Symbol|) |SOLVETRA;solve;ESL;5| |SOLVETRA;solve;EL;1|
              (|Equation| 8) (20 . |lhs|) (25 . |rhs|) (30 . -)
              |SOLVETRA;solve;EL;2| |SOLVETRA;solve;ESL;3|
              (|Union| 54 '#1="failed") (36 . |retractIfCan|)
              (|Union| (|Fraction| 54) '#1#) (41 . |retractIfCan|)
              (|Equation| $) (46 . |eval|)
              (|ElementaryFunctionStructurePackage| 6 8) (52 . |normalize|)
              (57 . |new|) (61 . |coerce|) (66 . =) (72 . =) (|List| 40)
              (78 . |kernels|) (|Fraction| 46) (|Kernel| $) (83 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 42) (89 . |numer|)
              (|Factored| 46) (|SparseUnivariatePolynomial| $)
              (94 . |factorPolynomial|)
              (|Record| (|:| |factor| 42) (|:| |exponent| 54)) (|List| 48)
              (|Factored| 42) (99 . |factors|) (|List| $) (104 . |zerosOf|)
              (|Integer|) (|List| 8) (110 . |elt|)
              (|SparseMultivariatePolynomial| 6 40) (116 . |numer|)
              (121 . |coerce|) (|Kernel| 8) (126 . |kernel|)
              (|AlgebraicManipulations| 6 8) (131 . |rootSimp|) (|Factored| 65)
              (|SparseMultivariatePolynomial| 6 60)
              (|MultivariateFactorize| 60 (|IndexedExponents| 60) 6 65)
              (136 . |factor|) (|Record| (|:| |factor| 65) (|:| |exponent| 54))
              (|List| 68) (141 . |factors|)
              (|Record| (|:| |var| 40) (|:| |exponent| 54))
              (|Union| 71 '"failed") (146 . |isExpt|) (152 . |argument|)
              (157 . *) (163 . |log|) (|SparseUnivariatePolynomial| 6)
              (168 . |One|) (|Union| (|Fraction| (|Polynomial| 6)) '#1#)
              (172 . |retractIfCan|) (|List| 15)
              (|List| (|Fraction| (|Polynomial| 6))) (|RadicalSolvePackage| 6)
              (177 . |radicalSolve|) (|TranscendentalManipulations| 6 8)
              (183 . |simplify|) (188 . |normalize|)
              (|TrigonometricManipulations| 6 8) (194 . |complexNormalize|)
              (200 . |coerce|) (205 . /) (211 . |tan|) (|PositiveInteger|)
              (216 . *) (222 . ^) (228 . |One|) (232 . -)
              (|TransSolvePackageService| 6) (237 . |decomposeFunc|) (244 . =)
              (|Fraction| $) (250 . |elt|) (256 . |coerce|) (261 . |second|)
              (266 . |retract|) (271 . |monomial|) (277 . -)
              (283 . |resultant|) (289 . |is?|) (|Union| 52 '"failed")
              (295 . |isPlus|) (300 . |leadingCoefficient|) (305 . |gcd|)
              (310 . |coerce|) (315 . |Zero|) (319 . +) (325 . *)
              (331 . |Zero|) (335 . |name|) (340 . |member?|) (346 . |isTimes|)
              (351 . |remove!|) (357 . |One|) (361 . |freeOf?|) (367 . ^)
              (|Table| 8 8) (373 . |table|) (377 . |Zero|) (381 . ~=)
              (387 . |leadingMonomial|) (|Union| 8 '"failed") (392 . |search|)
              (398 . |setelt|) (405 . |elt|) (411 . |reductum|) (416 . |keys|)
              (|Float|) (|Interval| 137) (421 . |interval|) (|Complex| 137)
              (426 . |convert|) (|Complex| 138) (|Mapping| 138 137)
              (|ComplexFunctions2| 137 138) (431 . |map|) (|Union| 40 '#1#)
              (437 . |retractIfCan|) (442 . |asin|) (447 . |acos|)
              (452 . |atan|) (457 . |acot|) (462 . |asec|) (467 . |acsc|)
              (472 . |asinh|) (477 . |acosh|) (482 . |atanh|) (487 . |acoth|)
              (492 . |asech|) (497 . |acsch|) (502 . |cot|) (507 . |sin|)
              (512 . |cos|) (517 . |sec|) (522 . |csc|) (527 . |sinh|)
              (532 . |cosh|) (537 . |tanh|) (542 . |coth|) (547 . |sech|)
              (552 . |csch|) (|Expression| 142) (|Mapping| 142 6)
              (|ExpressionFunctions2| 6 142) (557 . |map|) (|Union| 142 '#1#)
              (563 . |retractIfCan|) (568 . |exp|) (573 . |imag|) (578 . |pi|)
              (582 . -) (587 . |inf|) (592 . <) (598 . |sup|) (603 . <=)
              (|Polynomial| 8) (609 . |coerce|) (614 . |coerce|)
              (|Mapping| 185 60) (|Mapping| 185 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 60) 60 6 65 185)
              (619 . |map|) (626 . |denom|) (|Fraction| 185) (631 . /)
              (637 . |variables|) (642 . |eval|) (649 . |ground|)
              (654 . |numer|) (659 . |denom|) (|List| 29) (664 . |eval|)
              (670 . |list|) (|Fraction| 65) (675 . |numer|) (680 . |denom|)
              (685 . /) (|List| 60) (691 . |totalDegree|) (697 . |variables|)
              (702 . |setIntersection|) (708 . |tower|) (713 . |setUnion|)
              (719 . |setUnion|) (|Mapping| 207 207 207) (|List| 207)
              (725 . |reduce|) (|Union| 16 '"failed") (731 . |symbolIfCan|)
              (736 . |setIntersection|)
              (|Record| (|:| |mat| 225) (|:| |vec| 231)) (|List| 65)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 60) 60 65)
              (742 . |intoMatrix|) (|List| 230) (|Matrix| 203)
              (748 . |listOfLists|) (|List| 55) (|Matrix| 8) (753 . |matrix|)
              (|List| 203) (|Vector| 203) (758 . |parts|) (|Vector| 8)
              (763 . |vector|) (|Union| 233 '"failed")
              (|Record| (|:| |particular| 235) (|:| |basis| (|List| 233)))
              (|LinearSystemMatrixPackage| 8 233 233 228) (768 . |solve|)
              (774 . |zero|) (|Vector| $) (779 . |basis|) (783 . ~=)
              (789 . |elt|) (795 . |setelt|) (802 . |elt|)
              (|List| (|List| 185)) (|List| 193) (|SystemSolvePackage| 8)
              (808 . |triangularSystems|) (814 . |append|) (|Mapping| 81 81 81)
              (|List| 81) (820 . |reduce|) |SOLVETRA;solve;LLL;37|)
           '#(|solve| 827) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 254
                                                 '(1 8 7 0 9 1 8 10 0 11 0 6 0
                                                   12 2 13 7 0 0 14 1 19 8 0 20
                                                   1 19 8 0 21 2 8 0 0 0 22 1 8
                                                   25 0 26 1 8 27 0 28 2 8 0 0
                                                   29 30 1 31 8 8 32 0 16 0 33
                                                   1 8 0 16 34 2 19 0 8 8 35 2
                                                   8 7 0 0 36 1 8 37 0 38 2 8
                                                   39 0 40 41 1 43 42 0 44 1 8
                                                   45 46 47 1 50 49 0 51 2 8 52
                                                   46 16 53 2 55 8 0 54 56 1 8
                                                   57 0 58 1 8 0 57 59 1 60 0
                                                   16 61 1 62 8 8 63 1 66 64 65
                                                   67 1 64 69 0 70 2 8 72 0 16
                                                   73 1 60 55 0 74 2 8 0 54 0
                                                   75 1 8 0 0 76 0 77 0 78 1 8
                                                   79 0 80 2 83 81 82 10 84 1
                                                   85 8 8 86 2 31 8 8 16 87 2
                                                   88 8 8 16 89 1 8 0 54 90 2 8
                                                   0 0 0 91 1 8 0 0 92 2 8 0 93
                                                   0 94 2 8 0 0 93 95 0 8 0 96
                                                   1 8 0 0 97 3 98 43 43 43 43
                                                   99 2 43 7 0 0 100 2 42 8 101
                                                   8 102 1 8 0 40 103 1 55 8 0
                                                   104 1 8 54 0 105 2 42 0 8 13
                                                   106 2 42 0 0 0 107 2 42 8 0
                                                   0 108 2 8 7 0 16 109 1 8 110
                                                   0 111 1 65 6 0 112 1 6 0 52
                                                   113 1 8 0 6 114 0 8 0 115 2
                                                   8 0 0 0 116 2 8 0 0 0 117 0
                                                   6 0 118 1 60 16 0 119 2 10 7
                                                   16 0 120 1 8 110 0 121 2 55
                                                   0 8 0 122 0 54 0 123 2 8 7 0
                                                   16 124 2 8 0 0 0 125 0 126 0
                                                   127 0 77 0 128 2 8 7 0 0 129
                                                   1 65 0 0 130 2 126 131 8 0
                                                   132 3 126 8 0 8 8 133 2 126
                                                   8 0 8 134 1 65 0 0 135 1 126
                                                   55 0 136 1 138 0 137 139 1 6
                                                   140 0 141 2 144 142 143 140
                                                   145 1 8 146 0 147 1 8 0 0
                                                   148 1 8 0 0 149 1 8 0 0 150
                                                   1 8 0 0 151 1 8 0 0 152 1 8
                                                   0 0 153 1 8 0 0 154 1 8 0 0
                                                   155 1 8 0 0 156 1 8 0 0 157
                                                   1 8 0 0 158 1 8 0 0 159 1 8
                                                   0 0 160 1 8 0 0 161 1 8 0 0
                                                   162 1 8 0 0 163 1 8 0 0 164
                                                   1 8 0 0 165 1 8 0 0 166 1 8
                                                   0 0 167 1 8 0 0 168 1 8 0 0
                                                   169 1 8 0 0 170 2 173 171
                                                   172 8 174 1 171 175 0 176 1
                                                   8 0 0 177 1 142 138 0 178 0
                                                   137 0 179 1 137 0 0 180 1
                                                   138 137 0 181 2 137 7 0 0
                                                   182 1 138 137 0 183 2 137 7
                                                   0 0 184 1 185 0 16 186 1 185
                                                   0 8 187 3 190 185 188 189 65
                                                   191 1 8 57 0 192 2 193 0 185
                                                   185 194 1 185 10 0 195 3 185
                                                   0 0 10 55 196 1 185 8 0 197
                                                   1 193 185 0 198 1 193 185 0
                                                   199 2 8 0 0 200 201 1 81 0
                                                   15 202 1 203 65 0 204 1 203
                                                   65 0 205 2 8 0 57 57 206 2
                                                   65 13 0 207 208 1 65 207 0
                                                   209 2 207 0 0 0 210 1 8 37 0
                                                   211 2 15 0 0 0 212 2 207 0 0
                                                   0 213 2 215 207 214 0 216 1
                                                   60 217 0 218 2 10 0 0 0 219
                                                   2 222 220 221 207 223 1 225
                                                   224 0 226 1 228 0 227 229 1
                                                   231 230 0 232 1 233 0 55 234
                                                   2 237 236 228 233 238 1 233
                                                   0 13 239 0 142 240 241 2 233
                                                   7 0 0 242 2 233 8 0 54 243 3
                                                   233 8 0 54 8 244 2 10 16 0
                                                   54 245 2 248 246 247 10 249
                                                   2 81 0 0 0 250 3 252 81 251
                                                   0 81 253 1 0 15 19 23 1 0 15
                                                   8 18 2 0 15 19 16 24 2 0 81
                                                   15 10 254 2 0 15 8 16
                                                   17)))))
           '|lookupComplete|)) 
