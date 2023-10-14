
(/VERSIONCHECK 2) 

(DEFUN |FS2EXPXP;ratIfCan| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 16))) 

(DEFUN |FS2EXPXP;stateSeriesProblem| (|function| |problem| $)
  (CONS 1 (CONS |function| |problem|))) 

(DEFUN |FS2EXPXP;stateProblem| (|function| |problem| $)
  (CONS 1 (CONS |function| |problem|))) 

(DEFUN |FS2EXPXP;newElem| (|f| $)
  (SPADCALL (|FS2EXPXP;smpElem| (SPADCALL |f| (QREFELT $ 18)) $)
            (|FS2EXPXP;smpElem| (SPADCALL |f| (QREFELT $ 19)) $)
            (QREFELT $ 20))) 

(DEFUN |FS2EXPXP;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2EXPXP;k2Elem|) $) (ELT $ 21) |p|
            (QREFELT $ 26))) 

(DEFUN |FS2EXPXP;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G217 |a| #2=#:G216)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2EXPXP;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 29)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (|FS2EXPXP;newElem| |a| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 31)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 32))
                            . #3#)
                      (QREFELT $ 33))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 34)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 35)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 38))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 20)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 38))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 20)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 38))
                  (SPADCALL |cosz| (QREFELT $ 33)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 38))
                  (SPADCALL |sinz| (QREFELT $ 33)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 38))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 39))
                            (SPADCALL 2 (QREFELT $ 40)) (QREFELT $ 20)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 38))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 41))
                            (SPADCALL 2 (QREFELT $ 40)) (QREFELT $ 20)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 38))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 39))
                            (SPADCALL |ez| |iez| (QREFELT $ 41))
                            (QREFELT $ 20)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 38))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 41))
                            (SPADCALL |ez| |iez| (QREFELT $ 39))
                            (QREFELT $ 20)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 38))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 41))
                                      (QREFELT $ 33))
                            (QREFELT $ 43)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 38))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 39))
                                      (QREFELT $ 33))
                            (QREFELT $ 43)))
                 ((SPADCALL |k| '|acosh| (QREFELT $ 38))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |z| 2 (QREFELT $ 44))
                               (|spadConstant| $ 10) (QREFELT $ 39))
                     (QREFELT $ 45))
                    |z| (QREFELT $ 41))
                   (QREFELT $ 46)))
                 ((SPADCALL |k| '|atanh| (QREFELT $ 38))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL |z| (|spadConstant| $ 10) (QREFELT $ 41))
                     (SPADCALL (|spadConstant| $ 10) |z| (QREFELT $ 39))
                     (QREFELT $ 20))
                    (QREFELT $ 46))
                   (SPADCALL 2 (QREFELT $ 40)) (QREFELT $ 20)))
                 ((SPADCALL |k| '|acoth| (QREFELT $ 38))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL |z| (|spadConstant| $ 10) (QREFELT $ 41))
                     (SPADCALL |z| (|spadConstant| $ 10) (QREFELT $ 39))
                     (QREFELT $ 20))
                    (QREFELT $ 46))
                   (SPADCALL 2 (QREFELT $ 40)) (QREFELT $ 20)))
                 ((SPADCALL |k| '|asech| (QREFELT $ 38))
                  (SPADCALL
                   (SPADCALL (SPADCALL |z| (QREFELT $ 33))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |z| 2 (QREFELT $ 44))
                                         (QREFELT $ 33))
                               (|spadConstant| $ 10) (QREFELT $ 39))
                              (QREFELT $ 45))
                             (QREFELT $ 41))
                   (QREFELT $ 46)))
                 ((SPADCALL |k| '|acsch| (QREFELT $ 38))
                  (SPADCALL
                   (SPADCALL (SPADCALL |z| (QREFELT $ 33))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 10)
                                        (SPADCALL
                                         (SPADCALL |z| 2 (QREFELT $ 44))
                                         (QREFELT $ 33))
                                        (QREFELT $ 41))
                              (QREFELT $ 45))
                             (QREFELT $ 41))
                   (QREFELT $ 46)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 48)) |args|
                            (QREFELT $ 50))))))))))))) 

(DEFUN |FS2EXPXP;exprToXXP;FEBU;7| (|fcn| |posCheck?| $)
  (|FS2EXPXP;iExprToXXP| (|FS2EXPXP;newElem| |fcn| $) |posCheck?| $)) 

(DEFUN |FS2EXPXP;iExprToXXP| (|fcn| |posCheck?| $)
  (PROG (|ker| |power| |expt| |prod| |sum| #1=#:G237 |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 55))
            . #2=(|FS2EXPXP;iExprToXXP|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (CONS 0
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL |fcn| 'NIL (CONS 1 "real: two sides")
                                    (QREFELT $ 59))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|UnivariatePuiseuxSeries| (QREFELT $ 7)
                                                            (QREFELT $ 8)
                                                            (QREFELT $ 9))
                                 #1#))
                (QREFELT $ 62))))
        (#3='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 64)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2EXPXP;listToXXP| (QCDR |sum|) |posCheck?|
                  (|spadConstant| $ 65) (ELT $ 66) $))
                (#3#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 67)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2EXPXP;listToXXP| (QCDR |prod|) |posCheck?|
                          (|spadConstant| $ 68) (ELT $ 69) $))
                        (#3#
                         (SEQ
                          (LETT |expt| (|FS2EXPXP;isNonTrivPower| |fcn| $)
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #2#)
                                  (EXIT
                                   (|FS2EXPXP;powerToXXP| (QCAR |power|)
                                    (QCDR |power|) |posCheck?| $))))
                            (#3#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 71))
                                    . #2#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2EXPXP;kernelToXXP| (QCDR |ker|)
                                  |posCheck?| $))
                                (#3#
                                 (|error|
                                  "exprToXXP: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2EXPXP;listToXXP| (|list| |posCheck?| |ans| |op| $)
  (PROG (#1=#:G263 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (LETT |term|
                    (|FS2EXPXP;iExprToXXP| (|SPADfirst| |list|) |posCheck?| $)
                    . #2=(|FS2EXPXP;listToXXP|))
              (EXIT
               (COND
                ((QEQCAR |term| 1) (PROGN (LETT #1# |term| . #2#) (GO #1#)))
                ('T
                 (SEQ (LETT |ans| (SPADCALL |ans| (CDR |term|) |op|) . #2#)
                      (EXIT (LETT |list| (CDR |list|) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2EXPXP;isNonTrivPower| (|fcn| $)
  (PROG (|power| |expt|)
    (RETURN
     (SEQ
      (LETT |expt| (SPADCALL |fcn| (QREFELT $ 74))
            . #1=(|FS2EXPXP;isNonTrivPower|))
      (EXIT
       (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |power| (QCDR |expt|) . #1#)
                   (EXIT
                    (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                          (#2# (CONS 0 |power|)))))))))))) 

(DEFUN |FS2EXPXP;negativePowerOK?| (|upxs| $)
  (PROG (|xOpList| |coef| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL |upxs| (QREFELT $ 75))
            . #1=(|FS2EXPXP;negativePowerOK?|))
      (SEQ (LETT |coef| (SPADCALL |upxs| |deg| (QREFELT $ 76)) . #1#)
           (EXIT
            (COND
             ((SPADCALL |coef| (|spadConstant| $ 77) (QREFELT $ 78))
              (SEQ
               (LETT |deg|
                     (SPADCALL |upxs|
                               (SPADCALL |deg| (QREFELT $ 14) (QREFELT $ 79))
                               (QREFELT $ 80))
                     . #1#)
               (LETT |coef| (SPADCALL |upxs| |deg| (QREFELT $ 76)) . #1#)
               (EXIT
                (COND
                 ((SPADCALL |coef| (|spadConstant| $ 77) (QREFELT $ 78))
                  (|error|
                   "inverse of series with many leading zero coefficients")))))))))
      (LETT |xOpList| (|FS2EXPXP;opsInvolvingX| |coef| $) . #1#)
      (EXIT
       (COND ((NULL |xOpList|) 'T)
             (#2='T
              (SEQ
               (COND
                ((NULL (CDR |xOpList|))
                 (COND
                  ((SPADCALL (|SPADfirst| |xOpList|) '|log| (QREFELT $ 81))
                   (EXIT 'T)))))
               (EXIT
                (COND ((|FS2EXPXP;productOfNonZeroes?| |coef| $) 'T)
                      (#2# 'NIL))))))))))) 

(DEFUN |FS2EXPXP;powerToXXP| (|fcn| |n| |posCheck?| $)
  (PROG (|nn| #1=#:G284 |rec| |num| |xxp| #2=#:G279 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2EXPXP;iExprToXXP| |fcn| |posCheck?| $)
            . #3=(|FS2EXPXP;powerToXXP|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             (#4='T
              (SEQ
               (LETT |xxp|
                     (PROG2 (LETT #2# |b| . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|ExponentialExpansion| (QREFELT $ 6)
                                                              (QREFELT $ 7)
                                                              (QREFELT $ 8)
                                                              (QREFELT $ 9))
                                      #2#))
                     . #3#)
               (EXIT
                (COND
                 ((OR (SPADCALL |n| 0 (QREFELT $ 82))
                      (SPADCALL
                       (SPADCALL
                        (LETT |num| (SPADCALL |xxp| (QREFELT $ 85)) . #3#)
                        (QREFELT $ 87))
                       1 (QREFELT $ 88)))
                  (CONS 0 (SPADCALL |xxp| |n| (QREFELT $ 83))))
                 ((|FS2EXPXP;negativePowerOK?| (SPADCALL |num| (QREFELT $ 89))
                   $)
                  (SEQ (LETT |rec| (SPADCALL |num| (QREFELT $ 91)) . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |rec| 1) (|error| "FS2EXPXP: can't happen"))
                         (#4#
                          (SEQ
                           (LETT |nn|
                                 (PROG1 (LETT #1# (- |n|) . #3#)
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 . #3#)
                           (EXIT
                            (CONS 0
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |xxp| (QREFELT $ 92))
                                              |nn| (QREFELT $ 93))
                                    (SPADCALL (QCDR |rec|) |nn| (QREFELT $ 93))
                                    (QREFELT $ 94))
                                   (QREFELT $ 95))))))))))
                 (#4#
                  (|FS2EXPXP;stateProblem| "inv"
                   "lowest order coefficient involves x" $)))))))))))) 

(DEFUN |FS2EXPXP;carefulNthRootIfCan| (|ups| |n| |posCheck?| $)
  (PROG (|ans| #1=#:G306 #2=#:G307 |signum| |coef| |deg|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
             (#3='T
              (SEQ
               (EXIT
                (SEQ
                 (LETT |deg| (SPADCALL |ups| (QREFELT $ 75))
                       . #4=(|FS2EXPXP;carefulNthRootIfCan|))
                 (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 76)) . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |coef| (|spadConstant| $ 77) (QREFELT $ 78))
                         (SEQ
                          (LETT |deg|
                                (SPADCALL |ups|
                                          (SPADCALL |deg| (QREFELT $ 14)
                                                    (QREFELT $ 79))
                                          (QREFELT $ 80))
                                . #4#)
                          (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 76))
                                . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 77)
                                       (QREFELT $ 78))
                             (|error|
                              "log of series with many leading zero coefficients")))))))))
                 (COND
                  ((SPADCALL |n| (QREFELT $ 96))
                   (COND
                    (|posCheck?|
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 99)) . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 0)
                         (COND
                          ((EQL (QCDR |signum|) -1)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2#
                                         (|FS2EXPXP;stateSeriesProblem|
                                          "nth root" "root of negative number"
                                          $)
                                         . #4#)
                                   (GO #2#))
                                  . #4#)
                            (GO #1#))))))))))))
                 (LETT |ans| (SPADCALL |ups| |n| (QREFELT $ 102)) . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |ans| 1)
                    (|FS2EXPXP;stateSeriesProblem| "nth root" "no nth root" $))
                   (#3# (CONS 0 (QCDR |ans|)))))))
               #1# (EXIT #1#)))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;nthRootXXPIfCan| (|xxp| |n| |posCheck?| $)
  (PROG (|newDen| |deg| |coef| #1=#:G313 #2=#:G320 #3=#:G314 |root| |newNum|
         |nInv| |den| |num|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |num| (SPADCALL |xxp| (QREFELT $ 85))
              . #4=(|FS2EXPXP;nthRootXXPIfCan|))
        (LETT |den| (SPADCALL |xxp| (QREFELT $ 92)) . #4#)
        (COND
         ((SPADCALL (SPADCALL |num| (QREFELT $ 103)) (QREFELT $ 104))
          (COND
           ((NULL (SPADCALL (SPADCALL |den| (QREFELT $ 103)) (QREFELT $ 104)))
            (EXIT
             (|FS2EXPXP;stateProblem| #5="nth root"
              #6="several monomials in numerator or denominator" $)))))
         (#7='T (EXIT (|FS2EXPXP;stateProblem| #5# #6# $))))
        (LETT |nInv| (SPADCALL 1 |n| (QREFELT $ 13)) . #4#)
        (LETT |newNum|
              (SEQ
               (LETT |coef|
                     (SEQ
                      (LETT |root|
                            (|FS2EXPXP;carefulNthRootIfCan|
                             (SPADCALL |num| (QREFELT $ 89)) |n| |posCheck?| $)
                            . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |root| 1)
                         (PROGN
                          (LETT #2# (CONS 1 (CDR |root|)) . #4#)
                          (GO #2#)))
                        (#7# (CDR |root|)))))
                     . #4#)
               (LETT |deg|
                     (SPADCALL (SPADCALL |nInv| (QREFELT $ 105))
                               (SPADCALL |num| (QREFELT $ 107))
                               (QREFELT $ 108))
                     . #4#)
               (EXIT (SPADCALL |coef| |deg| (QREFELT $ 109))))
              . #4#)
        (LETT |newDen|
              (SEQ
               (LETT |coef|
                     (SEQ
                      (LETT |root|
                            (|FS2EXPXP;carefulNthRootIfCan|
                             (SPADCALL |den| (QREFELT $ 89)) |n| |posCheck?| $)
                            . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |root| 1)
                         (PROGN
                          (LETT #2#
                                (CONS 1
                                      (PROG2 (LETT #3# |root| . #4#)
                                          (QCDR #3#)
                                        (|check_union| (QEQCAR #3# 1)
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))
                                                       #3#)))
                                . #4#)
                          (GO #2#)))
                        (#7#
                         (PROG2 (LETT #1# |root| . #4#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|UnivariatePuiseuxSeries|
                                           (QREFELT $ 7) (QREFELT $ 8)
                                           (QREFELT $ 9))
                                          #1#))))))
                     . #4#)
               (LETT |deg|
                     (SPADCALL (SPADCALL |nInv| (QREFELT $ 105))
                               (SPADCALL |den| (QREFELT $ 107))
                               (QREFELT $ 108))
                     . #4#)
               (EXIT (SPADCALL |coef| |deg| (QREFELT $ 109))))
              . #4#)
        (EXIT (CONS 0 (SPADCALL |newNum| |newDen| (QREFELT $ 110))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;nthRootToXXP| (|arg| |n| |posCheck?| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $)
            . #1=(|FS2EXPXP;nthRootToXXP|))
      (EXIT
       (COND ((QEQCAR |result| 1) (CONS 1 (CDR |result|)))
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2EXPXP;nthRootXXPIfCan| (CDR |result|) |n| |posCheck?|
                      $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) (CONS 1 (CDR |ans|)))
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2EXPXP;genPowerToXXP| (|args| |posCheck?| $)
  (PROG (|f| |xxp| |expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase| (|FS2EXPXP;logToXXP| (|SPADfirst| |args|) |posCheck?| $)
            . #1=(|FS2EXPXP;genPowerToXXP|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2EXPXP;iExprToXXP| (SPADCALL |args| (QREFELT $ 111))
                      |posCheck?| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (SEQ
                        (LETT |xxp|
                              (SPADCALL (CDR |expon|) (CDR |logBase|)
                                        (QREFELT $ 69))
                              . #1#)
                        (LETT |f| (SPADCALL |xxp| (QREFELT $ 112)) . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |f| 1)
                           (|FS2EXPXP;stateProblem| "exp"
                            "multiply nested exponential" $))
                          (#2#
                           (|FS2EXPXP;exponential| (QCDR |f|) |posCheck?|
                            $)))))))))))))))) 

(DEFUN |FS2EXPXP;kernelToXXP| (|ker| |posCheck?| $)
  (PROG (#1=#:G346 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 114))
            . #2=(|FS2EXPXP;kernelToXXP|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 8))
           (CONS 0
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 10) (|spadConstant| $ 115)
                            (QREFELT $ 116))
                  (QREFELT $ 62))))
          (#3='T
           (CONS 0
                 (SPADCALL
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 31))
                            (|spadConstant| $ 117) (QREFELT $ 116))
                  (QREFELT $ 62))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 29)) . #2#))
         (CONS 0
               (SPADCALL
                (SPADCALL (SPADCALL |ker| (QREFELT $ 31))
                          (|spadConstant| $ 117) (QREFELT $ 116))
                (QREFELT $ 62))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|%paren| (QREFELT $ 38))
                 (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 38))
                 (|FS2EXPXP;logToXXP| |arg| |posCheck?| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 38))
                 (|FS2EXPXP;expToXXP| |arg| |posCheck?| $))
                (#3# (|FS2EXPXP;tranToXXP| |ker| |arg| |posCheck?| $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 38))
         (|FS2EXPXP;genPowerToXXP| |args| |posCheck?| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 38))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 111)) (QREFELT $ 118))
                . #2#)
          (EXIT
           (|FS2EXPXP;nthRootToXXP| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |posCheck?| $))))
        (#3#
         (|FS2EXPXP;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 119)) (QREFELT $ 121))
          "unknown kernel" $)))))))) 

(DEFUN |FS2EXPXP;genExp| (|ups| |posCheck?| $)
  (PROG (|result| |expCoef| |varOpList| |lc| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 115) (QREFELT $ 80))
            . #1=(|FS2EXPXP;genExp|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 117) (QREFELT $ 122))
         (|error| "exp of function with sigularity"))
        ((SPADCALL |deg| (|spadConstant| $ 117) (QREFELT $ 123))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 124))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 117) (QREFELT $ 76))
                . #1#)
          (LETT |varOpList| (|FS2EXPXP;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2EXPXP;opInOpList?| '|log| |varOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 124))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 32)) (QREFELT $ 8)
                          (QREFELT $ 126))
                . #1#)
          (LETT |result|
                (SPADCALL |expCoef| |posCheck?| (CONS 3 "real: right side")
                          (QREFELT $ 127))
                . #1#)
          (EXIT
           (COND ((QEQCAR |result| 1) |result|)
                 (#2#
                  (CONS 0
                        (SPADCALL (CDR |result|)
                                  (SPADCALL
                                   (SPADCALL |ups|
                                             (SPADCALL |lc|
                                                       (|spadConstant| $ 117)
                                                       (QREFELT $ 116))
                                             (QREFELT $ 128))
                                   (QREFELT $ 124))
                                  (QREFELT $ 129)))))))))))))) 

(DEFUN |FS2EXPXP;exponential| (|f| |posCheck?| $)
  (PROG (|coef| |expon| |taylorPart| |singPart|)
    (RETURN
     (SEQ
      (LETT |singPart|
            (SPADCALL (SPADCALL |f| (|spadConstant| $ 117) (QREFELT $ 130))
                      (SPADCALL
                       (SPADCALL |f| (|spadConstant| $ 117) (QREFELT $ 76))
                       (QREFELT $ 131))
                      (QREFELT $ 128))
            . #1=(|FS2EXPXP;exponential|))
      (LETT |taylorPart| (SPADCALL |f| |singPart| (QREFELT $ 128)) . #1#)
      (LETT |expon| (SPADCALL |singPart| (QREFELT $ 132)) . #1#)
      (LETT |coef| (|FS2EXPXP;genExp| |taylorPart| |posCheck?| $) . #1#)
      (EXIT
       (COND ((QEQCAR |coef| 1) (CONS 1 (CDR |coef|)))
             ('T
              (CONS 0
                    (SPADCALL (SPADCALL (CDR |coef|) |expon| (QREFELT $ 109))
                              (QREFELT $ 95)))))))))) 

(DEFUN |FS2EXPXP;expToXXP| (|arg| |posCheck?| $)
  (PROG (|f| |xxp| #1=#:G375 |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $)
            . #2=(|FS2EXPXP;expToXXP|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#3='T
              (SEQ
               (LETT |xxp|
                     (PROG2 (LETT #1# |result| . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0)
                                      (|ExponentialExpansion| (QREFELT $ 6)
                                                              (QREFELT $ 7)
                                                              (QREFELT $ 8)
                                                              (QREFELT $ 9))
                                      #1#))
                     . #2#)
               (LETT |f| (SPADCALL |xxp| (QREFELT $ 112)) . #2#)
               (EXIT
                (COND
                 ((QEQCAR |f| 1)
                  (|FS2EXPXP;stateProblem| "exp" "multiply nested exponential"
                   $))
                 (#3#
                  (|FS2EXPXP;exponential| (QCDR |f|) |posCheck?| $)))))))))))) 

(DEFUN |FS2EXPXP;genLog| (|ups| |posCheck?| $)
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |lt| #1=#:G399 #2=#:G400
         |signum| |coef| |deg|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (LETT |deg| (SPADCALL |ups| (QREFELT $ 75)) . #3=(|FS2EXPXP;genLog|))
          (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 76)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |coef| (|spadConstant| $ 77) (QREFELT $ 78))
                  (SEQ
                   (LETT |deg|
                         (SPADCALL |ups|
                                   (SPADCALL |deg| (QREFELT $ 14)
                                             (QREFELT $ 79))
                                   (QREFELT $ 80))
                         . #3#)
                   (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 76)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |coef| (|spadConstant| $ 77) (QREFELT $ 78))
                      (|error|
                       "log of series with many leading zero coefficients")))))))))
          (COND
           (|posCheck?|
            (SEQ (LETT |signum| (SPADCALL |coef| (QREFELT $ 99)) . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |signum| 0)
                    (COND
                     ((EQL (QCDR |signum|) -1)
                      (PROGN
                       (LETT #1#
                             (PROGN
                              (LETT #2#
                                    (|FS2EXPXP;stateSeriesProblem| "log"
                                     "negative leading coefficient" $)
                                    . #3#)
                              (GO #2#))
                             . #3#)
                       (GO #1#))))))))))
          (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 116)) . #3#)
          (LETT |negRat?|
                (SEQ (LETT |rat| (|FS2EXPXP;ratIfCan| |coef| $) . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |rat| 0)
                        (COND
                         ((SPADCALL (QCDR |rat|) (|spadConstant| $ 117)
                                    (QREFELT $ 122))
                          'T)
                         (#4='T 'NIL)))
                       (#4# 'NIL))))
                . #3#)
          (LETT |logTerm|
                (SEQ
                 (LETT |mon|
                       (SPADCALL (SPADCALL (QREFELT $ 8) (QREFELT $ 133))
                                 (QREFELT $ 9) (QREFELT $ 39))
                       . #3#)
                 (LETT |pow|
                       (SPADCALL |mon| (SPADCALL |deg| (QREFELT $ 105))
                                 (QREFELT $ 134))
                       . #3#)
                 (EXIT
                  (COND
                   (|negRat?|
                    (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 135))
                              (QREFELT $ 46)))
                   (#4#
                    (SEQ
                     (LETT |term1|
                           (SPADCALL (SPADCALL |deg| (QREFELT $ 105))
                                     (SPADCALL |mon| (QREFELT $ 46))
                                     (QREFELT $ 135))
                           . #3#)
                     (EXIT
                      (SPADCALL (SPADCALL |coef| (QREFELT $ 46)) |term1|
                                (QREFELT $ 41))))))))
                . #3#)
          (EXIT
           (CONS 0
                 (SPADCALL
                  (SPADCALL |logTerm| (|spadConstant| $ 117) (QREFELT $ 116))
                  (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 136))
                            (QREFELT $ 137))
                  (QREFELT $ 138))))))
        #1# (EXIT #1#)))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;logToXXP| (|arg| |posCheck?| $)
  (PROG (|denLog| |numLog| |denCoefLog| #1=#:G406 #2=#:G412 #3=#:G407 |res|
         |numCoefLog| |den| |num| |xxp| #4=#:G402 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $)
              . #5=(|FS2EXPXP;logToXXP|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               (#6='T
                (SEQ
                 (LETT |xxp|
                       (PROG2 (LETT #4# |result| . #5#)
                           (QCDR #4#)
                         (|check_union| (QEQCAR #4# 0)
                                        (|ExponentialExpansion| (QREFELT $ 6)
                                                                (QREFELT $ 7)
                                                                (QREFELT $ 8)
                                                                (QREFELT $ 9))
                                        #4#))
                       . #5#)
                 (LETT |num| (SPADCALL |xxp| (QREFELT $ 85)) . #5#)
                 (LETT |den| (SPADCALL |xxp| (QREFELT $ 92)) . #5#)
                 (COND
                  ((SPADCALL (SPADCALL |num| (QREFELT $ 103)) (QREFELT $ 104))
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |den| (QREFELT $ 103))
                                (QREFELT $ 104)))
                     (EXIT
                      (|FS2EXPXP;stateProblem| #7="log"
                       #8="several monomials in numerator or denominator"
                       $)))))
                  (#6# (EXIT (|FS2EXPXP;stateProblem| #7# #8# $))))
                 (LETT |numCoefLog|
                       (SEQ
                        (LETT |res|
                              (|FS2EXPXP;genLog|
                               (SPADCALL |num| (QREFELT $ 89)) |posCheck?| $)
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |res| 1)
                           (PROGN
                            (LETT #2# (CONS 1 (CDR |res|)) . #5#)
                            (GO #2#)))
                          (#6# (CDR |res|)))))
                       . #5#)
                 (LETT |denCoefLog|
                       (SEQ
                        (LETT |res|
                              (|FS2EXPXP;genLog|
                               (SPADCALL |den| (QREFELT $ 89)) |posCheck?| $)
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |res| 1)
                           (PROGN
                            (LETT #2#
                                  (CONS 1
                                        (PROG2 (LETT #3# |res| . #5#)
                                            (QCDR #3#)
                                          (|check_union| (QEQCAR #3# 1)
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))
                                                         #3#)))
                                  . #5#)
                            (GO #2#)))
                          (#6#
                           (PROG2 (LETT #1# |res| . #5#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0)
                                            (|UnivariatePuiseuxSeries|
                                             (QREFELT $ 7) (QREFELT $ 8)
                                             (QREFELT $ 9))
                                            #1#))))))
                       . #5#)
                 (LETT |numLog|
                       (SPADCALL
                        (SPADCALL (SPADCALL |num| (QREFELT $ 107))
                                  (QREFELT $ 139))
                        |numCoefLog| (QREFELT $ 138))
                       . #5#)
                 (LETT |denLog|
                       (SPADCALL
                        (SPADCALL (SPADCALL |den| (QREFELT $ 107))
                                  (QREFELT $ 139))
                        |denCoefLog| (QREFELT $ 138))
                       . #5#)
                 (EXIT
                  (CONS 0
                        (SPADCALL (SPADCALL |numLog| |denLog| (QREFELT $ 128))
                                  (QREFELT $ 62))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;applyIfCan| (|fcn| |arg| |fcnName| |posCheck?| $)
  (PROG (#1=#:G417 |xOpList| |lc| |deg| |upxs| |f| |xxp| #2=#:G414 |xxpArg|)
    (RETURN
     (SEQ
      (LETT |xxpArg| (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $)
            . #3=(|FS2EXPXP;applyIfCan|))
      (EXIT
       (COND ((QEQCAR |xxpArg| 1) |xxpArg|)
             (#4='T
              (SEQ
               (LETT |xxp|
                     (PROG2 (LETT #2# |xxpArg| . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|ExponentialExpansion| (QREFELT $ 6)
                                                              (QREFELT $ 7)
                                                              (QREFELT $ 8)
                                                              (QREFELT $ 9))
                                      #2#))
                     . #3#)
               (LETT |f| (SPADCALL |xxp| (QREFELT $ 112)) . #3#)
               (EXIT
                (COND
                 ((QEQCAR |f| 1)
                  (|FS2EXPXP;stateProblem| |fcnName|
                   "multiply nested exponential" $))
                 (#4#
                  (SEQ (LETT |upxs| (QCDR |f|) . #3#)
                       (LETT |deg|
                             (SPADCALL |upxs| (|spadConstant| $ 115)
                                       (QREFELT $ 80))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |deg| (|spadConstant| $ 117)
                                    (QREFELT $ 122))
                          (|FS2EXPXP;stateProblem| |fcnName|
                           "essential singularity" $))
                         ((SPADCALL |deg| (|spadConstant| $ 117)
                                    (QREFELT $ 123))
                          (CONS 0
                                (SPADCALL
                                 (PROG2
                                     (LETT #1# (SPADCALL |upxs| |fcn|) . #3#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0)
                                                  (|UnivariatePuiseuxSeries|
                                                   (QREFELT $ 7) (QREFELT $ 8)
                                                   (QREFELT $ 9))
                                                  #1#))
                                 (QREFELT $ 62))))
                         (#4#
                          (SEQ
                           (LETT |lc|
                                 (SPADCALL |upxs| (|spadConstant| $ 117)
                                           (QREFELT $ 76))
                                 . #3#)
                           (LETT |xOpList| (|FS2EXPXP;opsInvolvingX| |lc| $)
                                 . #3#)
                           (EXIT
                            (COND
                             ((NULL |xOpList|)
                              (CONS 0
                                    (SPADCALL
                                     (PROG2
                                         (LETT #1# (SPADCALL |upxs| |fcn|)
                                               . #3#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|UnivariatePuiseuxSeries|
                                                       (QREFELT $ 7)
                                                       (QREFELT $ 8)
                                                       (QREFELT $ 9))
                                                      #1#))
                                     (QREFELT $ 62))))
                             ((|FS2EXPXP;opInOpList?| '|log| |xOpList| $)
                              (|FS2EXPXP;stateProblem| |fcnName|
                               "logs in constant coefficient" $))
                             ((|FS2EXPXP;contOnReals?| |fcnName| $)
                              (CONS 0
                                    (SPADCALL
                                     (PROG2
                                         (LETT #1# (SPADCALL |upxs| |fcn|)
                                               . #3#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|UnivariatePuiseuxSeries|
                                                       (QREFELT $ 7)
                                                       (QREFELT $ 8)
                                                       (QREFELT $ 9))
                                                      #1#))
                                     (QREFELT $ 62))))
                             (#4#
                              (|FS2EXPXP;stateProblem| |fcnName|
                               "x in constant coefficient" $)))))))))))))))))))) 

(DEFUN |FS2EXPXP;applyBddIfCan| (|fe| |fcn| |arg| |fcnName| |posCheck?| $)
  (PROG (|ans| |f| |xxp| #1=#:G427 |trouble| |xxpArg|)
    (RETURN
     (SEQ
      (LETT |xxpArg| (|FS2EXPXP;iExprToXXP| |arg| |posCheck?| $)
            . #2=(|FS2EXPXP;applyBddIfCan|))
      (EXIT
       (COND
        ((QEQCAR |xxpArg| 1)
         (SEQ (LETT |trouble| (CDR |xxpArg|) . #2#)
              (EXIT
               (COND
                ((EQUAL (QCDR |trouble|) "essential singularity")
                 (CONS 0
                       (SPADCALL
                        (SPADCALL |fe| (|spadConstant| $ 117) (QREFELT $ 116))
                        (QREFELT $ 62))))
                (#3='T |xxpArg|)))))
        (#3#
         (SEQ
          (LETT |xxp|
                (PROG2 (LETT #1# |xxpArg| . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|ExponentialExpansion| (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9))
                                 #1#))
                . #2#)
          (LETT |f| (SPADCALL |xxp| (QREFELT $ 112)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |f| 1)
             (|FS2EXPXP;stateProblem| "exp" "multiply nested exponential" $))
            (#3#
             (SEQ (LETT |ans| (SPADCALL (QCDR |f|) |fcn|) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |ans| 1)
                     (CONS 0
                           (SPADCALL
                            (SPADCALL |fe| (|spadConstant| $ 117)
                                      (QREFELT $ 116))
                            (QREFELT $ 62))))
                    (#3#
                     (CONS 0
                           (SPADCALL (QCDR |ans|)
                                     (QREFELT $ 62)))))))))))))))))) 

(DEFUN |FS2EXPXP;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 140) (QREFELT $ 143))) 

(DEFUN |FS2EXPXP;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 141) (QREFELT $ 143))) 

(DEFUN |FS2EXPXP;opsInvolvingX| (|fcn| $)
  (PROG (|opList| |op| #1=#:G444 |k| #2=#:G443)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2EXPXP;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 145)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 48)) . #3#)
                         (QREFELT $ 146))
                        (SPADCALL (QREFELT $ 8)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 29)))
                                   (QREFELT $ 148))
                                  (QREFELT $ 149)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 151))))))) 

(DEFUN |FS2EXPXP;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G446 #2=#:G448 #3=#:G449 |op|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |op| NIL . #4=(|FS2EXPXP;opInOpList?|))
               (LETT #3# |opList| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |op| |name| (QREFELT $ 81))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;exponential?| (|fcn| $)
  (PROG (|ker|)
    (RETURN
     (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 71)) |FS2EXPXP;exponential?|)
          (EXIT
           (COND
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 38)))
            ('T 'NIL))))))) 

(DEFUN |FS2EXPXP;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G460 #2=#:G464 #3=#:G465 |term| |prod|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|FS2EXPXP;exponential?| |fcn| $) 'T)
             (#4='T
              (SEQ
               (LETT |prod| (SPADCALL |fcn| (QREFELT $ 67))
                     . #5=(|FS2EXPXP;productOfNonZeroes?|))
               (EXIT
                (COND ((QEQCAR |prod| 1) 'NIL)
                      (#4#
                       (SEQ
                        (SEQ
                         (EXIT
                          (SEQ (LETT |term| NIL . #5#)
                               (LETT #3# (QCDR |prod|) . #5#) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |term| (CAR #3#) . #5#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL (|FS2EXPXP;exponential?| |term| $))
                                   (COND
                                    ((SPADCALL (QREFELT $ 8)
                                               (SPADCALL |term|
                                                         (QREFELT $ 148))
                                               (QREFELT $ 149))
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# 'NIL . #5#)
                                             (GO #2#))
                                            . #5#)
                                      (GO #1#))))))))
                               (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                               (EXIT NIL)))
                         #1# (EXIT #1#))
                        (EXIT 'T)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2EXPXP;tranToXXP| (|ker| |arg| |posCheck?| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 38))
    (|FS2EXPXP;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 31)) (ELT $ 152) |arg|
     "sin" |posCheck?| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 38))
    (|FS2EXPXP;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 31)) (ELT $ 153) |arg|
     "cos" |posCheck?| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 38))
    (|FS2EXPXP;applyIfCan| (ELT $ 154) |arg| "asin" |posCheck?| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 38))
    (|FS2EXPXP;applyIfCan| (ELT $ 155) |arg| "acos" |posCheck?| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 38))
    (|FS2EXPXP;atancotToXXP| (SPADCALL |ker| (QREFELT $ 31)) |arg| |posCheck?|
     1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 38))
    (|FS2EXPXP;atancotToXXP| (SPADCALL |ker| (QREFELT $ 31)) |arg| |posCheck?|
     -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 38))
    (|FS2EXPXP;applyIfCan| (ELT $ 156) |arg| "asec" |posCheck?| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 38))
    (|FS2EXPXP;applyIfCan| (ELT $ 157) |arg| "acsc" |posCheck?| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 38))
    (|FS2EXPXP;applyIfCan| (ELT $ 158) |arg| "asinh" |posCheck?| $))
   ('T
    (|FS2EXPXP;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 119)) (QREFELT $ 121))
     "unknown kernel" $)))) 

(DEFUN |FS2EXPXP;localAbs;2FE;32| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 159))) 

(DEFUN |FS2EXPXP;localAbs;2FE;33| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 135)) (QREFELT $ 45))) 

(DEFUN |FS2EXPXP;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 160)) |arg| (QREFELT $ 20))) 

(DEFUN |FS2EXPXP;atancotToXXP| (|fe| |arg| |posCheck?| |plusMinus| $)
  (PROG (|cc| |n| |posNegPi2| |signum| |lc| #1=#:G519 |rn| #2=#:G517 |yCoef|
         |y| |ord| |coef| |ups| #3=#:G501 |trouble| |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |posCheck?| 'T . #4=(|FS2EXPXP;atancotToXXP|))
            (LETT |result|
                  (SPADCALL |arg| |posCheck?| (CONS 3 "real: right side")
                            (QREFELT $ 127))
                  . #4#)
            (EXIT
             (COND
              ((QEQCAR |result| 1)
               (SEQ (LETT |trouble| (CDR |result|) . #4#)
                    (EXIT
                     (COND
                      ((EQUAL (QCDR |trouble|) "essential singularity")
                       (CONS 0
                             (SPADCALL
                              (SPADCALL |fe| (|spadConstant| $ 117)
                                        (QREFELT $ 116))
                              (QREFELT $ 62))))
                      (#5='T (CONS 1 (CDR |result|)))))))
              (#5#
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |ups|
                        (PROG2 (LETT #3# |result| . #4#)
                            (QCDR #3#)
                          (|check_union| (QEQCAR #3# 0)
                                         (|UnivariatePuiseuxSeries|
                                          (QREFELT $ 7) (QREFELT $ 8)
                                          (QREFELT $ 9))
                                         #3#))
                        . #4#)
                  (LETT |coef|
                        (SPADCALL |ups| (|spadConstant| $ 117) (QREFELT $ 76))
                        . #4#)
                  (SEQ
                   (LETT |ord|
                         (SPADCALL |ups| (|spadConstant| $ 117) (QREFELT $ 80))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL |ord| (|spadConstant| $ 117) (QREFELT $ 161))
                      (COND
                       ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 135))
                                  (SPADCALL (|spadConstant| $ 10)
                                            (QREFELT $ 162))
                                  (QREFELT $ 78))
                        (PROGN
                         (LETT #2#
                               (SEQ
                                (LETT |y|
                                      (SPADCALL
                                       (SPADCALL |ups| (QREFELT $ 163))
                                       (SPADCALL (|spadConstant| $ 164)
                                                 (SPADCALL |ups| |ups|
                                                           (QREFELT $ 129))
                                                 (QREFELT $ 138))
                                       (QREFELT $ 136))
                                      . #4#)
                                (LETT |yCoef|
                                      (SPADCALL |y|
                                                (SPADCALL
                                                 (|spadConstant| $ 115)
                                                 (QREFELT $ 165))
                                                (QREFELT $ 76))
                                      . #4#)
                                (EXIT
                                 (CONS 0
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |yCoef| (QREFELT $ 46))
                                          (|spadConstant| $ 117)
                                          (QREFELT $ 116))
                                         (SPADCALL
                                          (SPADCALL |y|
                                                    (SPADCALL |yCoef|
                                                              (SPADCALL
                                                               (|spadConstant|
                                                                $ 115)
                                                               (QREFELT $ 165))
                                                              (QREFELT $ 116))
                                                    (QREFELT $ 128))
                                          (QREFELT $ 166))
                                         (QREFELT $ 138))
                                        (QREFELT $ 62)))))
                               . #4#)
                         (GO #2#))))))))
                  (LETT |cc|
                        (COND
                         ((SPADCALL |ord| (|spadConstant| $ 117)
                                    (QREFELT $ 122))
                          (SEQ
                           (LETT |rn|
                                 (|FS2EXPXP;ratIfCan|
                                  (SPADCALL |ord| (QREFELT $ 105)) $)
                                 . #4#)
                           (EXIT
                            (COND
                             ((QEQCAR |rn| 1)
                              (PROGN
                               (LETT #1#
                                     (|FS2EXPXP;stateProblem| "atan"
                                      "branch problem" $)
                                     . #4#)
                               (GO #1#)))
                             (#5#
                              (SEQ
                               (LETT |lc| (SPADCALL |ups| |ord| (QREFELT $ 76))
                                     . #4#)
                               (LETT |signum| (SPADCALL |lc| (QREFELT $ 99))
                                     . #4#)
                               (EXIT
                                (COND
                                 ((QEQCAR |signum| 1)
                                  (SEQ
                                   (LETT |posNegPi2|
                                         (SPADCALL
                                          (SPADCALL
                                           (|FS2EXPXP;signOfExpression| |lc| $)
                                           (SPADCALL (QREFELT $ 167))
                                           (QREFELT $ 135))
                                          (SPADCALL 2 (QREFELT $ 40))
                                          (QREFELT $ 20))
                                         . #4#)
                                   (EXIT
                                    (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 167))
                                             (SPADCALL 2 (QREFELT $ 40))
                                             (QREFELT $ 20))
                                            |posNegPi2| (QREFELT $ 39)))))))
                                 ((EQL (LETT |n| (QCDR |signum|) . #4#) -1)
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL
                                     (SPADCALL (SPADCALL (QREFELT $ 167))
                                               (SPADCALL 2 (QREFELT $ 40))
                                               (QREFELT $ 20))
                                     (QREFELT $ 162)))
                                   (#5# (SPADCALL (QREFELT $ 167)))))
                                 ((EQL |plusMinus| 1)
                                  (SPADCALL (SPADCALL (QREFELT $ 167))
                                            (SPADCALL 2 (QREFELT $ 40))
                                            (QREFELT $ 20)))
                                 (#5# (|spadConstant| $ 77))))))))))
                         (#5# (SPADCALL |coef| (QREFELT $ 169))))
                        . #4#)
                  (EXIT
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 131))
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |ups| (QREFELT $ 163))
                                               (SPADCALL (|spadConstant| $ 164)
                                                         (SPADCALL |ups| |ups|
                                                                   (QREFELT $
                                                                            129))
                                                         (QREFELT $ 138))
                                               (QREFELT $ 136))
                                     (QREFELT $ 166))
                                    (QREFELT $ 138))
                          (QREFELT $ 62))))))
                #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FunctionSpaceToExponentialExpansion| (&REST #1=#:G520)
  (PROG ()
    (RETURN
     (PROG (#2=#:G521)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceToExponentialExpansion|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceToExponentialExpansion|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FunctionSpaceToExponentialExpansion;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FunctionSpaceToExponentialExpansion|))))))))))) 

(DEFUN |FunctionSpaceToExponentialExpansion;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|FunctionSpaceToExponentialExpansion|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|FunctionSpaceToExponentialExpansion| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 170) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceToExponentialExpansion|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 14 (SPADCALL 1000 1 (QREFELT $ 13)))
      (QSETREFV $ 140
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 141 (LIST #2# #3# #4# #5#))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|abs|
                              (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
        (QSETREFV $ 160
                  (CONS (|dispatchFunction| |FS2EXPXP;localAbs;2FE;32|) $)))
       ('T
        (QSETREFV $ 160
                  (CONS (|dispatchFunction| |FS2EXPXP;localAbs;2FE;33|) $))))
      $)))) 

(MAKEPROP '|FunctionSpaceToExponentialExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (|Integer|)
              (|Fraction| 11) (4 . /) 'ZEROCOUNT (|Union| 12 '#1="failed")
              (10 . |retractIfCan|) (|SparseMultivariatePolynomial| 6 30)
              (15 . |numer|) (20 . |denom|) (25 . /) (31 . |coerce|)
              (|Mapping| 7 28) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 28)
              (|PolynomialCategoryLifting| (|IndexedExponents| 28) 28 6 24 7)
              (36 . |map|) (|List| 7) (|Kernel| 7) (43 . |argument|)
              (|Kernel| $) (48 . |coerce|) (53 . |exp|) (58 . |inv|)
              (63 . |sin|) (68 . |cos|) (|Boolean|) (|Symbol|) (73 . |is?|)
              (79 . -) (85 . |coerce|) (90 . +) (|PositiveInteger|) (96 . *)
              (102 . ^) (108 . |sqrt|) (113 . |log|) (|BasicOperator|)
              (118 . |operator|) (|List| $) (123 . |elt|)
              (|Record| (|:| |func| 120) (|:| |prob| 120))
              (|Union| (|:| |%expansion| 61) (|:| |%problem| 51))
              |FS2EXPXP;exprToXXP;FEBU;7| (|Union| (|Polynomial| 6) '#1#)
              (129 . |retractIfCan|)
              (|Union| (|:| |%series| 60) (|:| |%problem| 51))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              (|FunctionSpaceToUnivariatePowerSeries| 6 7 12 60 101
                                                      (|UnivariateTaylorSeries|
                                                       7 8 9)
                                                      (|TaylorSeriesExpansionPuiseux|
                                                       7
                                                       (|UnivariateTaylorSeries|
                                                        7 8 9)
                                                       (|UnivariateLaurentSeries|
                                                        7 8 9)
                                                       60)
                                                      8)
              (134 . |exprToUPS|) (|UnivariatePuiseuxSeries| 7 8 9)
              (|ExponentialExpansion| 6 7 8 9) (141 . |coerce|)
              (|Union| 49 '#2="failed") (146 . |isPlus|) (151 . |Zero|)
              (155 . +) (161 . |isTimes|) (166 . |One|) (170 . *)
              (|Union| 30 '#1#) (176 . |retractIfCan|)
              (|Record| (|:| |val| $) (|:| |exponent| 11)) (|Union| 72 '#2#)
              (181 . |isPower|) (186 . |degree|) (191 . |coefficient|)
              (197 . |Zero|) (201 . =) (207 . +) (213 . |order|) (219 . |is?|)
              (225 . >) (231 . ^)
              (|UnivariatePuiseuxSeriesWithExponentialSingularity| 6 7 8 9)
              (237 . |numer|) (|NonNegativeInteger|)
              (242 . |numberOfMonomials|) (247 . >)
              (253 . |leadingCoefficient|) (|Union| $ '"failed")
              (258 . |recip|) (263 . |denom|) (268 . ^) (274 . *)
              (280 . |coerce|) (285 . |even?|) (|Union| 11 '"failed")
              (|ElementaryFunctionSign| 6 7) (290 . |sign|)
              (|Union| 60 '"failed")
              (|ElementaryFunctionsUnivariatePuiseuxSeries| 7
                                                            (|UnivariateLaurentSeries|
                                                             7 8 9)
                                                            60
                                                            (|ElementaryFunctionsUnivariateLaurentSeries|
                                                             7
                                                             (|UnivariateTaylorSeries|
                                                              7 8 9)
                                                             (|UnivariateLaurentSeries|
                                                              7 8 9)))
              (295 . |nthRootIfCan|) (301 . |reductum|) (306 . |zero?|)
              (311 . |coerce|) (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9)
              (316 . |degree|) (321 . *) (327 . |monomial|) (333 . /)
              (339 . |second|) (344 . |retractIfCan|) (|Union| 37 '"failed")
              (349 . |symbolIfCan|) (354 . |One|) (358 . |monomial|)
              (364 . |Zero|) (368 . |retract|) (373 . |name|) (|String|)
              (378 . |string|) (383 . <) (389 . >) (395 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (400 . |normalize|)
              (406 . |exprToGenUPS|) (413 . -) (419 . *) (425 . |truncate|)
              (431 . |coerce|) (436 . |exponential|) (441 . |coerce|) (446 . ^)
              (452 . *) (458 . /) (464 . |log|) (469 . +) (475 . |exponent|)
              'CONTFCNS 'BDDFCNS (|List| 120) (480 . |member?|) (|List| 30)
              (486 . |tower|) (491 . |unary?|) (|List| 37) (496 . |variables|)
              (501 . |member?|) (|List| 47) (507 . |removeDuplicates|)
              (512 . |sinIfCan|) (517 . |cosIfCan|) (522 . |asinIfCan|)
              (527 . |acosIfCan|) (532 . |asecIfCan|) (537 . |acscIfCan|)
              (542 . |asinhIfCan|) (547 . |abs|) (552 . |localAbs|) (557 . =)
              (563 . -) (568 . |differentiate|) (573 . |One|) (577 . -)
              (582 . |integrate|) (587 . |pi|) (591 . |pi|) (595 . |atan|))
           '#(|localAbs| 600 |exprToXXP| 605) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 169
                                                 '(0 7 0 10 2 12 0 11 11 13 1 7
                                                   15 0 16 1 7 17 0 18 1 7 17 0
                                                   19 2 7 0 0 0 20 1 7 0 6 21 3
                                                   25 7 22 23 24 26 1 28 27 0
                                                   29 1 7 0 30 31 1 7 0 0 32 1
                                                   7 0 0 33 1 7 0 0 34 1 7 0 0
                                                   35 2 28 36 0 37 38 2 7 0 0 0
                                                   39 1 7 0 11 40 2 7 0 0 0 41
                                                   2 7 0 42 0 43 2 7 0 0 42 44
                                                   1 7 0 0 45 1 7 0 0 46 1 28
                                                   47 0 48 2 7 0 47 49 50 1 7
                                                   54 0 55 3 58 56 7 36 57 59 1
                                                   61 0 60 62 1 7 63 0 64 0 61
                                                   0 65 2 61 0 0 0 66 1 7 63 0
                                                   67 0 61 0 68 2 61 0 0 0 69 1
                                                   7 70 0 71 1 7 73 0 74 1 60
                                                   12 0 75 2 60 7 0 12 76 0 7 0
                                                   77 2 7 36 0 0 78 2 12 0 0 0
                                                   79 2 60 12 0 12 80 2 47 36 0
                                                   37 81 2 11 36 0 0 82 2 61 0
                                                   0 11 83 1 61 84 0 85 1 84 86
                                                   0 87 2 86 36 0 0 88 1 84 60
                                                   0 89 1 84 90 0 91 1 61 84 0
                                                   92 2 84 0 0 86 93 2 84 0 0 0
                                                   94 1 61 0 84 95 1 11 36 0 96
                                                   1 98 97 7 99 2 101 100 60 86
                                                   102 1 84 0 0 103 1 84 36 0
                                                   104 1 7 0 12 105 1 84 106 0
                                                   107 2 106 0 7 0 108 2 84 0
                                                   60 106 109 2 61 0 84 84 110
                                                   1 27 7 0 111 1 61 100 0 112
                                                   1 28 113 0 114 0 12 0 115 2
                                                   60 0 7 12 116 0 12 0 117 1 7
                                                   11 0 118 1 28 37 0 119 1 37
                                                   120 0 121 2 12 36 0 0 122 2
                                                   12 36 0 0 123 1 101 60 60
                                                   124 2 125 7 7 37 126 3 58 56
                                                   7 36 57 127 2 60 0 0 0 128 2
                                                   60 0 0 0 129 2 60 0 0 12 130
                                                   1 60 0 7 131 1 106 0 60 132
                                                   1 7 0 37 133 2 7 0 0 0 134 2
                                                   7 0 0 0 135 2 60 0 0 0 136 1
                                                   101 60 60 137 2 60 0 0 0 138
                                                   1 106 60 0 139 2 142 36 120
                                                   0 143 1 7 144 0 145 1 47 36
                                                   0 146 1 7 147 0 148 2 147 36
                                                   37 0 149 1 150 0 0 151 1 101
                                                   100 60 152 1 101 100 60 153
                                                   1 101 100 60 154 1 101 100
                                                   60 155 1 101 100 60 156 1
                                                   101 100 60 157 1 101 100 60
                                                   158 1 7 0 0 159 1 0 7 7 160
                                                   2 12 36 0 0 161 1 7 0 0 162
                                                   1 60 0 0 163 0 60 0 164 1 12
                                                   0 0 165 1 60 0 0 166 0 7 0
                                                   167 0 60 0 168 1 7 0 0 169 1
                                                   0 7 7 160 2 0 52 7 36
                                                   53)))))
           '|lookupComplete|)) 
