
(/VERSIONCHECK 2) 

(DEFUN |FS2UPS;ratIfCan| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 16))) 

(DEFUN |FS2UPS;carefulNthRootIfCan| (|ups| |n| |posCheck?| |rightOnly?| $)
  (PROG (|ans| #1=#:G286 |signum| |coef| |deg|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
             (#2='T
              (SEQ
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 19))
                     . #3=(|FS2UPS;carefulNthRootIfCan|))
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 22) (QREFELT $ 24))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 14)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              . #3#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 22)
                                     (QREFELT $ 24))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
               (COND
                ((SPADCALL |n| (QREFELT $ 29))
                 (COND
                  (|posCheck?|
                   (SEQ (LETT |signum| (SPADCALL |coef| (QREFELT $ 32)) . #3#)
                        (EXIT
                         (COND
                          ((QEQCAR |signum| 0)
                           (COND
                            ((EQL (QCDR |signum|) -1)
                             (PROGN
                              (LETT #1#
                                    (|FS2UPS;stateProblem| "nth root"
                                     "negative leading coefficient" $)
                                    . #3#)
                              (GO #1#)))
                            ((NULL |rightOnly?|)
                             (COND
                              ((NULL (SPADCALL |deg| (QREFELT $ 33)))
                               (PROGN
                                (LETT #1#
                                      (|FS2UPS;stateProblem| "nth root"
                                       "series of non-zero order" $)
                                      . #3#)
                                (GO #1#))))))))))))))
               (LETT |ans| (SPADCALL |ups| |n| (QREFELT $ 36)) . #3#)
               (EXIT
                (COND
                 ((QEQCAR |ans| 1)
                  (|FS2UPS;stateProblem| "nth root" "no nth root" $))
                 (#2# (CONS 0 (QCDR |ans|)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;stateProblem| (|function| |problem| $)
  (CONS 1 (CONS |function| |problem|))) 

(DEFUN |FS2UPS;exprToUPS;FEBUU;4| (|fcn| |posCheck?| |atanFlag| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 38))
            . #1=(|FS2UPS;exprToUPS;FEBUU;4|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (CONS 0
               (|FS2UPS;polyToUPS|
                (SPADCALL (QCDR |poly|) (QREFELT $ 13) (QREFELT $ 42)) $)))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 44)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS;listToUPS| (QCDR |sum|) (ELT $ 48) |posCheck?|
                  |atanFlag| (|spadConstant| $ 49) (ELT $ 50) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 51)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS;listToUPS| (QCDR |prod|) (ELT $ 48)
                          |posCheck?| |atanFlag| (|spadConstant| $ 52)
                          (ELT $ 53) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS;isNonTrivPower| |fcn| $) . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS;powerToUPS| (QCAR |power|)
                                    (QCDR |power|) |posCheck?| |atanFlag| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 55))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS;kernelToUPS| (QCDR |ker|) |posCheck?|
                                  |atanFlag| $))
                                (#2#
                                 (|error|
                                  "exprToUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS;polyToUPS| (|poly| $)
  (PROG (|ans| |coef| |deg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |poly| (QREFELT $ 57)) (|spadConstant| $ 49))
            ('T
             (SEQ
              (LETT |deg| (SPADCALL |poly| (QREFELT $ 58))
                    . #1=(|FS2UPS;polyToUPS|))
              (LETT |coef|
                    (SPADCALL (SPADCALL |poly| (QREFELT $ 59)) (QREFELT $ 60))
                    . #1#)
              (LETT |ans|
                    (SPADCALL |coef| (SPADCALL |deg| (QREFELT $ 26))
                              (QREFELT $ 61))
                    . #1#)
              (LETT |poly| (SPADCALL |poly| (QREFELT $ 62)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |poly| (QREFELT $ 57)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 58)) . #1#)
                        (LETT |coef|
                              (SPADCALL (SPADCALL |poly| (QREFELT $ 59))
                                        (QREFELT $ 60))
                              . #1#)
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL |coef|
                                                  (SPADCALL |deg|
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 61))
                                        (QREFELT $ 50))
                              . #1#)
                        (EXIT
                         (LETT |poly| (SPADCALL |poly| (QREFELT $ 62)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))))))) 

(DEFUN |FS2UPS;listToUPS|
       (|list| |feToUPS| |posCheck?| |atanFlag| |ans| |op| $)
  (PROG (#1=#:G345 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (LETT |term|
                    (SPADCALL (|SPADfirst| |list|) |posCheck?| |atanFlag|
                              |feToUPS|)
                    . #2=(|FS2UPS;listToUPS|))
              (EXIT
               (COND
                ((QEQCAR |term| 1) (PROGN (LETT #1# |term| . #2#) (GO #1#)))
                ('T
                 (SEQ (LETT |ans| (SPADCALL |ans| (CDR |term|) |op|) . #2#)
                      (EXIT (LETT |list| (CDR |list|) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;isNonTrivPower| (|fcn| $)
  (PROG (|power| |expt|)
    (RETURN
     (SEQ
      (LETT |expt| (SPADCALL |fcn| (QREFELT $ 65))
            . #1=(|FS2UPS;isNonTrivPower|))
      (EXIT
       (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |power| (QCDR |expt|) . #1#)
                   (EXIT
                    (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                          (#2# (CONS 0 |power|)))))))))))) 

(DEFUN |FS2UPS;powerToUPS| (|fcn| |n| |posCheck?| |atanFlag| $)
  (PROG (|coef| |deg| |ups| #1=#:G354 |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL |fcn| |posCheck?| |atanFlag| (QREFELT $ 48))
            . #2=(|FS2UPS;powerToUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 66))
              (CONS 0 (SPADCALL (CDR |b|) |n| (QREFELT $ 67))))
             ('T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #1# |b| . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                     . #2#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 19)) . #2#)
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 22) (QREFELT $ 24))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 14)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              . #2#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 22)
                                     (QREFELT $ 24))
                           (|error|
                            "inverse of series with many leading zero coefficients")))))))))
               (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 67)))))))))))) 

(DEFUN |FS2UPS;handle_args| (|args| |posCheck?| |atanFlag| $)
  (PROG (|lsers| |lsere| |lcoef| |losers| |coef| #1=#:G387 |ups| #2=#:G369
         |nsu| #3=#:G388 |arg|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |losers| NIL . #4=(|FS2UPS;handle_args|))
            (LETT |lsers| NIL . #4#) (LETT |lsere| NIL . #4#)
            (LETT |lcoef| NIL . #4#)
            (SEQ (LETT |arg| NIL . #4#) (LETT #3# |args| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arg| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL
                      (SPADCALL (QREFELT $ 13) (SPADCALL |arg| (QREFELT $ 70))
                                (QREFELT $ 71)))
                     (SEQ
                      (LETT |losers|
                            (CONS (SPADCALL |arg| (QREFELT $ 72)) |losers|)
                            . #4#)
                      (LETT |lsers| (CONS (|spadConstant| $ 49) |lsers|) . #4#)
                      (LETT |lsere| (CONS (|spadConstant| $ 22) |lsere|) . #4#)
                      (EXIT (LETT |lcoef| (CONS |arg| |lcoef|) . #4#))))
                    ('T
                     (SEQ
                      (LETT |nsu|
                            (SPADCALL |arg| |posCheck?| |atanFlag|
                                      (QREFELT $ 48))
                            . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |nsu| 1)
                         (PROGN (LETT #1# (CONS 1 |nsu|) . #4#) (GO #1#)))
                        ('T
                         (SEQ
                          (LETT |ups|
                                (PROG2 (LETT #2# |nsu| . #4#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0) (QREFELT $ 9)
                                                 #2#))
                                . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL |ups| (|spadConstant| $ 73)
                                        (QREFELT $ 28))
                              (|spadConstant| $ 73) (QREFELT $ 74))
                             (PROGN
                              (LETT #1#
                                    (CONS 1
                                          (|FS2UPS;stateProblem| "handle_args"
                                           "argument not Taylor" $))
                                    . #4#)
                              (GO #1#)))
                            ('T
                             (SEQ
                              (LETT |coef|
                                    (SPADCALL |ups| (|spadConstant| $ 73)
                                              (QREFELT $ 20))
                                    . #4#)
                              (LETT |losers| (CONS |ups| |losers|) . #4#)
                              (LETT |lcoef| (CONS |coef| |lcoef|) . #4#)
                              (LETT |lsere|
                                    (CONS (|spadConstant| $ 18) |lsere|) . #4#)
                              (EXIT
                               (LETT |lsers|
                                     (CONS
                                      (SPADCALL |ups|
                                                (SPADCALL |coef|
                                                          (QREFELT $ 72))
                                                (QREFELT $ 75))
                                      |lsers|)
                                     . #4#)))))))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS 0
                   (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                           (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv| (|nf| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G402 |sym| #2=#:G401)
    (RETURN
     (SEQ
      (LETT |lders|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;do_taylor_via_deriv|))
             (SEQ (LETT |sym| NIL . #3#) (LETT #1# |lsyms| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS #'|FS2UPS;do_taylor_via_deriv!0|
                                 (VECTOR $ |sym|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT $ 80)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS;do_taylor_via_deriv!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 86)))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G398 |sym| #3=#:G397)
        (RETURN
         (SEQ
          (SPADCALL |c|
                    (PROGN
                     (LETT #3# NIL NIL)
                     (SEQ (LETT |sym| NIL NIL) (LETT #2# |lsyms| NIL) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |sym| (CAR #2#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 81))
                                             (|spadConstant| $ 22)
                                             (QREFELT $ 83))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 85))))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 76)))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2| (|nk| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G416 |sym| #2=#:G415)
    (RETURN
     (SEQ
      (LETT |lders|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;do_taylor_via_deriv2|))
             (SEQ (LETT |sym| NIL . #3#) (LETT #1# |lsyms| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS #'|FS2UPS;do_taylor_via_deriv2!0|
                                 (VECTOR $ |sym|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT $ 87)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS;do_taylor_via_deriv2!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 86)))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G412 |sym| #3=#:G411)
        (RETURN
         (SEQ
          (SPADCALL |c|
                    (PROGN
                     (LETT #3# NIL NIL)
                     (SEQ (LETT |sym| NIL NIL) (LETT #2# |lsyms| NIL) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |sym| (CAR #2#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 81))
                                             (|spadConstant| $ 22)
                                             (QREFELT $ 83))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 85))))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 76)))))) 

(DEFUN |FS2UPS;convert_args| (|lsers| |lsere| |lser0| $)
  (PROG (|nargs| |lser| |lsyms| |nsym| #1=#:G422 |s| #2=#:G423 |e| #3=#:G424
         |c|)
    (RETURN
     (SEQ (LETT |lsyms| NIL . #4=(|FS2UPS;convert_args|))
          (LETT |lser| NIL . #4#) (LETT |nargs| NIL . #4#)
          (SEQ (LETT |c| NIL . #4#) (LETT #3# |lser0| . #4#)
               (LETT |e| NIL . #4#) (LETT #2# |lsere| . #4#)
               (LETT |s| NIL . #4#) (LETT #1# |lsers| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #4#) NIL)
                     (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |e| (|spadConstant| $ 22) (QREFELT $ 24))
                   (LETT |nargs| (CONS |c| |nargs|) . #4#))
                  ('T
                   (SEQ (LETT |nsym| (SPADCALL (QREFELT $ 88)) . #4#)
                        (LETT |nargs|
                              (CONS
                               (SPADCALL |c| (SPADCALL |nsym| (QREFELT $ 81))
                                         (QREFELT $ 89))
                               |nargs|)
                              . #4#)
                        (LETT |lsyms| (CONS |nsym| |lsyms|) . #4#)
                        (EXIT (LETT |lser| (CONS |s| |lser|) . #4#)))))))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                             . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (LETT |nargs| (NREVERSE |nargs|) . #4#)
          (EXIT (VECTOR |nargs| |lser| |lsyms|)))))) 

(DEFUN |FS2UPS;do_ell| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG (|nres| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs|
            (|FS2UPS;convert_args| (CDR |lsers|) (CDR |lsere|) (CDR |lser0|) $)
            . #1=(|FS2UPS;do_ell|))
      (LETT |nres|
            (SPADCALL (CONS #'|FS2UPS;do_ell!0| (VECTOR |ef| |cargs|))
                      (SPADCALL |losers| 1 (QREFELT $ 90)) (QREFELT $ 92))
            . #1#)
      (EXIT
       (|FS2UPS;do_taylor_via_deriv| |nres| (QVELT |cargs| 2) (QVELT |cargs| 1)
        $)))))) 

(DEFUN |FS2UPS;do_ell!0| (|f| $$)
  (PROG (|cargs| |ef|)
    (LETT |cargs| (QREFELT $$ 1) . #1=(|FS2UPS;do_ell|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| (QVELT |cargs| 0) |ef|))))) 

(DEFUN |FS2UPS;do_ell2| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG ()
    (RETURN
     (|FS2UPS;do_ell| |losers| |lsers| |lsere| |lser0|
      (CONS #'|FS2UPS;do_ell2!0| (VECTOR |ef| $)) $)))) 

(DEFUN |FS2UPS;do_ell2!0| (|f| |l| $$)
  (PROG ($ |ef|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS2UPS;do_ell2|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 93) (QREFELT $ 95))
                |ef|))))) 

(DEFUN |FS2UPS;do_ell3| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG ()
    (RETURN
     (|FS2UPS;do_ell| |losers| |lsers| |lsere| |lser0|
      (CONS #'|FS2UPS;do_ell3!0| (VECTOR |ef| $)) $)))) 

(DEFUN |FS2UPS;do_ell3!0| (|f| |l| $$)
  (PROG ($ |ef|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS2UPS;do_ell3|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 93) (QREFELT $ 95))
                (SPADCALL |l| 2 (QREFELT $ 95)) |ef|))))) 

(DEFUN |FS2UPS;besselEq| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;besselEq|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 98)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 98))
                       (SPADCALL |v| 2 (QREFELT $ 98)) (QREFELT $ 75)))))))) 

(DEFUN |FS2UPS;besselEqm| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;besselEqm|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 98)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 98))
                       (SPADCALL |v| 2 (QREFELT $ 98)) (QREFELT $ 50)))))))) 

(DEFUN |FS2UPS;kelvinEq| (|lc| |z0| $)
  (PROG (|v2| |zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;kelvinEq|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (LETT |v2|
            (SPADCALL (|spadConstant| $ 52)
                      (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 98))
                                (QREFELT $ 99))
                      (QREFELT $ 50))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 4 (QREFELT $ 98))
             (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 98)) (QREFELT $ 99))
             (SPADCALL
              (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT $ 98)) (QREFELT $ 53))
              (QREFELT $ 100))
             (SPADCALL |v2| |zvar| (QREFELT $ 53))
             (SPADCALL
              (SPADCALL (SPADCALL |v| 2 (QREFELT $ 98))
                        (SPADCALL 4 (SPADCALL |v| 2 (QREFELT $ 98))
                                  (QREFELT $ 99))
                        (QREFELT $ 75))
              (SPADCALL |zvar| 4 (QREFELT $ 98)) (QREFELT $ 50)))))))) 

(DEFUN |FS2UPS;kummerEq| (|lc| |z0| $)
  (PROG (|zvar| |b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;kummerEq|))
      (LETT |b| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 95)) (QREFELT $ 72))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (EXIT
       (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 75))
             (SPADCALL |a| (QREFELT $ 100)))))))) 

(DEFUN |FS2UPS;legendreEq| (|lc| |z0| $)
  (PROG (|z2| |zvar| |mu| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;legendreEq|))
      (LETT |mu| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 95)) (QREFELT $ 72))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (LETT |z2|
            (SPADCALL (|spadConstant| $ 52) (SPADCALL |zvar| 2 (QREFELT $ 98))
                      (QREFELT $ 75))
            . #1#)
      (EXIT
       (LIST (SPADCALL |z2| 2 (QREFELT $ 98))
             (SPADCALL
              (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 99)) |z2| (QREFELT $ 53))
              (QREFELT $ 100))
             (SPADCALL
              (SPADCALL
               (SPADCALL |nu|
                         (SPADCALL |nu| (|spadConstant| $ 52) (QREFELT $ 50))
                         (QREFELT $ 53))
               |z2| (QREFELT $ 53))
              |mu| (QREFELT $ 75)))))))) 

(DEFUN |FS2UPS;whittakerEq| (|lc| |z0| $)
  (PROG (|zvar| |o4| |m| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 95)) (QREFELT $ 72))
            . #1=(|FS2UPS;whittakerEq|))
      (LETT |m| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 95)) (QREFELT $ 72))
            . #1#)
      (LETT |o4|
            (SPADCALL (|spadConstant| $ 52)
                      (SPADCALL (SPADCALL 4 (QREFELT $ 101)) (QREFELT $ 102))
                      (QREFELT $ 103))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                       (QREFELT $ 61))
             (SPADCALL |z0| (QREFELT $ 72)) (QREFELT $ 50))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 98)) (|spadConstant| $ 49)
             (SPADCALL
              (SPADCALL
               (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 98)) (QREFELT $ 75))
               (SPADCALL |k| |zvar| (QREFELT $ 53)) (QREFELT $ 50))
              (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 98))
                        (SPADCALL (SPADCALL 4 (QREFELT $ 101)) (QREFELT $ 102))
                        (QREFELT $ 103))
              (QREFELT $ 75)))))))) 

(DEFUN |FS2UPS;do_diff_eq| (|ker| |losers| |lsers| |lsere| |lser0| |getEq| $)
  (PROG (|ups| |lc| #1=#:G456 |c| #2=#:G455 |nker| #3=#:G454 |lsyms| |sym|
         |ecl| #4=#:G453 #5=#:G452 |cn1| |cn| |z0| |nargs| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs| (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
            . #6=(|FS2UPS;do_diff_eq|))
      (LETT |nargs| (QVELT |cargs| 0) . #6#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| (QREFELT $ 104)) (|spadConstant| $ 22)
                   (QREFELT $ 24))
         (SEQ
          (LETT |nker|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 107)) |nargs|
                          (QREFELT $ 109))
                . #6#)
          (EXIT
           (|FS2UPS;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))
        ('T
         (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 104)) . #6#)
              (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|) . #6#)
              (LETT |cn| (|SPADfirst| |ecl|) . #6#)
              (LETT |cn1|
                    (SPADCALL
                     (SPADCALL |cn|
                               (SPADCALL (|spadConstant| $ 52) (QREFELT $ 100))
                               (QREFELT $ 111))
                     (QREFELT $ 100))
                    . #6#)
              (LETT |ecl|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (CDR |ecl|) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |c| |cn1| (QREFELT $ 53))
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |nker|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 107)) |nargs|
                              (QREFELT $ 109))
                    . #6#)
              (LETT |lc| (LIST |nker|) . #6#)
              (LETT |lsyms| (QVELT |cargs| 2) . #6#)
              (LETT |sym| (|SPADfirst| |lsyms|) . #6#)
              (LETT |lsyms| (CDR |lsyms|) . #6#)
              (LETT |lsers| (CDR (QVELT |cargs| 1)) . #6#)
              (SEQ (LETT |c| NIL . #6#) (LETT #3# (CDR |ecl|) . #6#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |nker| (SPADCALL |nker| |sym| (QREFELT $ 76)) . #6#)
                    (EXIT (LETT |lc| (CONS |nker| |lc|) . #6#)))
                   (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |lc|
                    (PROGN
                     (LETT #2# NIL . #6#)
                     (SEQ (LETT |c| NIL . #6#) (LETT #1# (NREVERSE |lc|) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |c| (CAR #1#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |c|
                                             (SPADCALL
                                              (SPADCALL |sym| (QREFELT $ 81))
                                              (|spadConstant| $ 22)
                                              (QREFELT $ 83))
                                             (QREFELT $ 113))
                                   #2#)
                                  . #6#)))
                          (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #6#)
              (LETT |ups|
                    (SPADCALL (REVERSE |ecl|) (|SPADfirst| (QVELT |cargs| 1))
                              |lc| (QREFELT $ 114))
                    . #6#)
              (EXIT
               (|FS2UPS;do_taylor_via_deriv| |ups| |lsyms| |lsers| $)))))))))) 

(DEFUN |FS2UPS;lambertW0| (|arg| $) (SPADCALL (ELT $ 116) |arg| (QREFELT $ 92))) 

(DEFUN |FS2UPS;do_weierstrass|
       (|losers| |lsers| |lsere| |lser0| |ef| |k| |cz| $)
  (PROG (#1=#:G464 |nres2| |lsyms| |nres| |nargs| |cargs| |z_inv| |coef| |deg|
         |z_ser|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| 3 (QREFELT $ 95)) (|spadConstant| $ 22)
                   (QREFELT $ 24))
         (|error| "expansion at 0"))
        (#2='T
         (SEQ
          (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT $ 90))
                . #3=(|FS2UPS;do_weierstrass|))
          (COND
           ((SPADCALL |cz| 0 (QREFELT $ 117))
            (SEQ
             (LETT |deg|
                   (SPADCALL |z_ser| (SPADCALL (QREFELT $ 14) (QREFELT $ 26))
                             (QREFELT $ 28))
                   . #3#)
             (LETT |coef| (SPADCALL |z_ser| |deg| (QREFELT $ 20)) . #3#)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 22) (QREFELT $ 24))
                (|error|
                 "inverse of series with many leading zero coefficients"))
               (#2#
                (LETT |z_inv|
                      (SPADCALL |cz| (SPADCALL |z_ser| |k| (QREFELT $ 67))
                                (QREFELT $ 118))
                      . #3#))))))
           (#2# (LETT |z_inv| (|spadConstant| $ 49) . #3#)))
          (LETT |cargs| (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
                . #3#)
          (LETT |nargs| (QVELT |cargs| 0) . #3#)
          (LETT |nres|
                (SPADCALL
                 (CONS #'|FS2UPS;do_weierstrass!0| (VECTOR |ef| $ |nargs|))
                 |z_ser| (QREFELT $ 92))
                . #3#)
          (LETT |lsyms| (CDR (QVELT |cargs| 2)) . #3#)
          (LETT |lsers| (CDR (QVELT |cargs| 1)) . #3#)
          (LETT |nres2| (|FS2UPS;do_taylor_via_deriv| |nres| |lsyms| |lsers| $)
                . #3#)
          (EXIT
           (COND ((QEQCAR |nres2| 1) (PROGN (LETT #1# |nres2| . #3#) (GO #1#)))
                 (#2#
                  (CONS 0
                        (SPADCALL |z_inv| (CDR |nres2|) (QREFELT $ 50))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_weierstrass!0| (|f| $$)
  (PROG (|nargs| $ |ef|)
    (LETT |nargs| (QREFELT $$ 2) . #1=(|FS2UPS;do_weierstrass|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 119) (QREFELT $ 95))
                (SPADCALL |nargs| 2 (QREFELT $ 95)) |f| |ef|))))) 

(DEFUN |FS2UPS;spec_to_UPS| (|ker| |args| |posCheck?| |atanFlag| $)
  (PROG (|nker| |nargs| |cargs| |nm| |lser0| |lsere| |lsers| |losers| |ares|
         |aresu|)
    (RETURN
     (SEQ
      (LETT |aresu| (|FS2UPS;handle_args| |args| |posCheck?| |atanFlag| $)
            . #1=(|FS2UPS;spec_to_UPS|))
      (EXIT
       (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
             (#2='T
              (SEQ (LETT |ares| (QCDR |aresu|) . #1#)
                   (LETT |losers| (QVELT |ares| 0) . #1#)
                   (LETT |lsers| (QVELT |ares| 1) . #1#)
                   (LETT |lsere| (QVELT |ares| 2) . #1#)
                   (LETT |lser0| (QVELT |ares| 3) . #1#)
                   (LETT |nm| (SPADCALL |ker| (QREFELT $ 120)) . #1#)
                   (COND
                    ((OR (EQUAL |nm| '|besselI|) (EQUAL |nm| '|besselK|))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 95))
                                  (|spadConstant| $ 22) (QREFELT $ 24))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at 0" $))
                       (#2#
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;besselEqm|) $)
                         $))))))
                   (COND
                    ((OR (EQUAL |nm| '|besselJ|)
                         (OR (EQUAL |nm| '|besselY|)
                             (OR (EQUAL |nm| '|hankelH1|)
                                 (EQUAL |nm| '|hankelH2|))))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 95))
                                  (|spadConstant| $ 22) (QREFELT $ 24))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at 0" $))
                       (#2#
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;besselEq|) $)
                         $))))))
                   (COND
                    ((OR (EQUAL |nm| '|kummerM|) (EQUAL |nm| '|kummerU|))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                  (|spadConstant| $ 22) (QREFELT $ 24))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at 0" $))
                       (#2#
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;kummerEq|) $)
                         $))))))
                   (COND
                    ((OR (EQUAL |nm| '|whittakerM|) (EQUAL |nm| '|whittakerW|))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                  (|spadConstant| $ 22) (QREFELT $ 24))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at 0" $))
                       (#2#
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;whittakerEq|) $)
                         $))))))
                   (COND
                    ((OR
                      (OR
                       (OR (EQUAL |nm| '|kelvinBer|) (EQUAL |nm| '|kelvinBei|))
                       (EQUAL |nm| '|kelvinKer|))
                      (EQUAL |nm| '|kelvinKei|))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 95))
                                  (|spadConstant| $ 22) (QREFELT $ 24))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at 0" $))
                       (#2#
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;kelvinEq|) $)
                         $))))))
                   (COND
                    ((OR (EQUAL |nm| '|legendreP|) (EQUAL |nm| '|legendreQ|))
                     (EXIT
                      (COND
                       ((OR
                         (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                   (|spadConstant| $ 18) (QREFELT $ 24))
                         (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                   (SPADCALL (|spadConstant| $ 18)
                                             (QREFELT $ 123))
                                   (QREFELT $ 24)))
                        (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
                         "expansion at +-1" $))
                       ('T
                        (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                         |lser0| (CONS (|function| |FS2UPS;legendreEq|) $)
                         $))))))
                   (COND
                    ((EQUAL |nm| '|lambertW|)
                     (COND
                      ((SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 95))
                                 (|spadConstant| $ 22) (QREFELT $ 24))
                       (EXIT
                        (CONS 0
                              (|FS2UPS;lambertW0|
                               (SPADCALL |losers| 1 (QREFELT $ 90)) $)))))))
                   (EXIT
                    (COND
                     ((EQUAL |nm| '|jacobiSn|)
                      (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 124) $))
                     ((EQUAL |nm| '|jacobiCn|)
                      (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 125) $))
                     ((EQUAL |nm| '|jacobiDn|)
                      (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 126) $))
                     ((EQUAL |nm| '|ellipticE2|)
                      (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 127) $))
                     ((EQUAL |nm| '|ellipticF|)
                      (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 128) $))
                     ((EQUAL |nm| '|ellipticPi|)
                      (|FS2UPS;do_ell3| |losers| |lsers| |lsere| |lser0|
                       (ELT $ 129) $))
                     (#2#
                      (SEQ
                       (COND
                        ((EQUAL |nm| '|weierstrassP|)
                         (COND
                          ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                     (|spadConstant| $ 22) (QREFELT $ 24))
                           (EXIT
                            (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                             |lser0| (ELT $ 130) -2 1 $))))))
                       (COND
                        ((EQUAL |nm| '|weierstrassPPrime|)
                         (COND
                          ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                     (|spadConstant| $ 22) (QREFELT $ 24))
                           (EXIT
                            (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                             |lser0| (ELT $ 131) -3 -2 $))))))
                       (COND
                        ((EQUAL |nm| '|weierstrassZeta|)
                         (COND
                          ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                     (|spadConstant| $ 22) (QREFELT $ 24))
                           (EXIT
                            (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                             |lser0| (ELT $ 132) -1 1 $))))))
                       (COND
                        ((EQUAL |nm| '|weierstrassSigma|)
                         (COND
                          ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 95))
                                     (|spadConstant| $ 22) (QREFELT $ 24))
                           (EXIT
                            (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                             |lser0| (ELT $ 133) 0 0 $))))))
                       (LETT |cargs|
                             (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
                             . #1#)
                       (LETT |nargs| (QVELT |cargs| 0) . #1#)
                       (LETT |nker|
                             (SPADCALL (SPADCALL |ker| (QREFELT $ 107)) |nargs|
                                       (QREFELT $ 109))
                             . #1#)
                       (EXIT
                        (|FS2UPS;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
                         (QVELT |cargs| 1) $)))))))))))))) 

(DEFUN |FS2UPS;do_prim| (|ker| |arg0| |posCheck?| |atanFlag| $)
  (PROG (#1=#:G579 |ns| |nf| |c0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c0|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 107)) |arg0|
                        (QREFELT $ 134))
              . #2=(|FS2UPS;do_prim|))
        (LETT |nf|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 136)) (QREFELT $ 13)
                        (QREFELT $ 76))
              . #2#)
        (LETT |ns| (SPADCALL |nf| |posCheck?| |atanFlag| (QREFELT $ 48)) . #2#)
        (EXIT
         (COND ((QEQCAR |ns| 1) (PROGN (LETT #1# |ns| . #2#) (GO #1#)))
               ('T
                (CONS 0
                      (SPADCALL (SPADCALL |c0| (QREFELT $ 72))
                                (SPADCALL (CDR |ns|) (QREFELT $ 137))
                                (QREFELT $ 50))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;prim_to_UPS| (|ker| |args| |posCheck?| |atanFlag| $)
  (PROG (|coef| #1=#:G598 |ups| #2=#:G369 |nsu| |arg| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nm| (SPADCALL |ker| (QREFELT $ 120))
              . #3=(|FS2UPS;prim_to_UPS|))
        (EXIT
         (COND
          ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 117))
           (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 122))
            "multivariate primitive" $))
          (#4='T
           (SEQ (LETT |arg| (|SPADfirst| |args|) . #3#)
                (LETT |nsu|
                      (SPADCALL |arg| |posCheck?| |atanFlag| (QREFELT $ 48))
                      . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |nsu| 1) (PROGN (LETT #1# |nsu| . #3#) (GO #1#)))
                  (#4#
                   (SEQ
                    (LETT |ups|
                          (PROG2 (LETT #2# |nsu| . #3#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                          . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 28))
                        (|spadConstant| $ 73) (QREFELT $ 74))
                       (PROGN
                        (LETT #1#
                              (|FS2UPS;stateProblem| "handle_args"
                               "argument not Taylor" $)
                              . #3#)
                        (GO #1#)))
                      (#4#
                       (SEQ
                        (LETT |coef|
                              (SPADCALL |ups| (|spadConstant| $ 73)
                                        (QREFELT $ 20))
                              . #3#)
                        (COND
                         ((OR (EQUAL |nm| '|Ei|) (EQUAL |nm| '|Ci|))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 122)) "expansion at 0"
                              $))
                            (#4#
                             (|FS2UPS;do_prim| |ker| |coef| |posCheck?|
                              |atanFlag| $))))))
                        (COND
                         ((OR (EQUAL |nm| '|dilog|) (EQUAL |nm| '|li|))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 122)) "expansion at 0"
                              $))
                            ((SPADCALL |coef| (|spadConstant| $ 18)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 122)) "expansion at 1"
                              $))
                            (#4#
                             (|FS2UPS;do_prim| |ker| |coef| |posCheck?|
                              |atanFlag| $))))))
                        (COND
                         ((OR (EQUAL |nm| '|Si|)
                              (OR (EQUAL |nm| '|erf|)
                                  (OR (EQUAL |nm| '|fresnelS|)
                                      (EQUAL |nm| '|fresnelC|))))
                          (EXIT
                           (|FS2UPS;do_prim| |ker| |coef| |posCheck?|
                            |atanFlag| $))))
                        (EXIT
                         (|FS2UPS;stateProblem|
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 120))
                                    (QREFELT $ 122))
                          "unimplemented" $))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;kernelToUPS| (|ker| |posCheck?| |atanFlag| $)
  (PROG (#1=#:G617 |n| |arg| |op| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 139)) . #2=(|FS2UPS;kernelToUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                           (QREFELT $ 61))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 136))
                           (|spadConstant| $ 73) (QREFELT $ 61))))))
        ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 140)) . #2#))
             (NULL
              (SPADCALL (QREFELT $ 13)
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 136))
                                  (QREFELT $ 70))
                        (QREFELT $ 71))))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 136)) (|spadConstant| $ 73)
                         (QREFELT $ 61))))
        ('T
         (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 107)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT $ 141))
                 (|FS2UPS;spec_to_UPS| |ker| |args| |posCheck?| |atanFlag| $))
                ((SPADCALL |op| '|prim| (QREFELT $ 141))
                 (|FS2UPS;prim_to_UPS| |ker| |args| |posCheck?| |atanFlag| $))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 142))
                         (|FS2UPS;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 143)) 2 |posCheck?|
                          |atanFlag| $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 142))
                         (SPADCALL |arg| |posCheck?| |atanFlag|
                                   (QREFELT $ 48)))
                        ((SPADCALL |ker| '|log| (QREFELT $ 142))
                         (|FS2UPS;logToUPS| |arg| |posCheck?| |atanFlag| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 142))
                         (|FS2UPS;applyIfCan| (ELT $ 144) |arg| "exp"
                          |posCheck?| |atanFlag| $))
                        (#3#
                         (|FS2UPS;tranToUPS| |ker| |arg| |posCheck?| |atanFlag|
                          $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 142))
                 (|FS2UPS;powToUPS| |args| |posCheck?| |atanFlag| $))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 142))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 145))
                                  (QREFELT $ 146))
                        . #2#)
                  (EXIT
                   (|FS2UPS;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #1# |n| . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |posCheck?| |atanFlag| $))))
                (#3#
                 (|FS2UPS;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 120)) (QREFELT $ 122))
                  "unknown kernel" $)))))))))))) 

(DEFUN |FS2UPS;nthRootToUPS| (|arg| |n| |posCheck?| |atanFlag| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (SPADCALL |arg| |posCheck?| |atanFlag| (QREFELT $ 48))
            . #1=(|FS2UPS;nthRootToUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS;carefulNthRootIfCan| (CDR |result|) |n|
                      |posCheck?| 'NIL $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS;logToUPS| (|arg| |posCheck?| |atanFlag| $)
  (PROG (#1=#:G649 #2=#:G651 #3=#:G653 |signum| |coef| |ups| #4=#:G369
         |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (SPADCALL |arg| |posCheck?| |atanFlag| (QREFELT $ 48))
              . #5=(|FS2UPS;logToUPS|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               ('T
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |ups|
                         (PROG2 (LETT #4# |result| . #5#)
                             (QCDR #4#)
                           (|check_union| (QEQCAR #4# 0) (QREFELT $ 9) #4#))
                         . #5#)
                   (COND
                    ((NULL
                      (SPADCALL
                       (SPADCALL |ups| (|spadConstant| $ 96) (QREFELT $ 28))
                       (QREFELT $ 33)))
                     (EXIT
                      (|FS2UPS;stateProblem| "log" "series of non-zero order"
                       $))))
                   (LETT |coef|
                         (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 20))
                         . #5#)
                   (COND
                    (|posCheck?|
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 32)) . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 0)
                         (COND
                          ((EQL (QCDR |signum|) -1)
                           (PROGN
                            (LETT #2#
                                  (PROGN
                                   (LETT #3#
                                         (|FS2UPS;stateProblem| "log"
                                          "negative leading coefficient" $)
                                         . #5#)
                                   (GO #3#))
                                  . #5#)
                            (GO #2#))))))))))
                   (EXIT
                    (CONS 0
                          (PROG2
                              (LETT #1# (SPADCALL |ups| (QREFELT $ 147)) . #5#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                           #1#))))))
                 #2# (EXIT #2#)))))))
      #3# (EXIT #3#))))) 

(DEFUN |FS2UPS;localAbs;2FE;31| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 148))) 

(DEFUN |FS2UPS;localAbs;2FE;32| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 143)) (QREFELT $ 150))) 

(DEFUN |FS2UPS;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 149)) |arg| (QREFELT $ 151))) 

(DEFUN |FS2UPS;atancotToUPS| (|arg| |posCheck?| |atanFlag| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G680 |rn| #2=#:G678
         |ord| |coef| |ups| #3=#:G369 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (SPADCALL |arg| |posCheck?| |atanFlag| (QREFELT $ 48))
              . #4=(|FS2UPS;atancotToUPS|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               (#5='T
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |ups|
                         (PROG2 (LETT #3# |result| . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                         . #4#)
                   (LETT |coef|
                         (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 20))
                         . #4#)
                   (SEQ
                    (LETT |ord|
                          (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 28))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |ord| (|spadConstant| $ 73) (QREFELT $ 152))
                       (COND
                        ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 143))
                                   (SPADCALL (|spadConstant| $ 18)
                                             (QREFELT $ 123))
                                   (QREFELT $ 24))
                         (PROGN
                          (LETT #2#
                                (PROGN
                                 (LETT #1#
                                       (|FS2UPS;stateProblem| "atan"
                                        "logarithmic singularity" $)
                                       . #4#)
                                 (GO #1#))
                                . #4#)
                          (GO #2#))))))))
                   (LETT |cc|
                         (COND
                          ((SPADCALL |ord| (|spadConstant| $ 73)
                                     (QREFELT $ 74))
                           (COND
                            ((SPADCALL |atanFlag| (CONS 0 "complex")
                                       (QREFELT $ 153))
                             (PROGN
                              (LETT #1#
                                    (|FS2UPS;stateProblem| "atan"
                                     "essential singularity" $)
                                    . #4#)
                              (GO #1#)))
                            (#5#
                             (SEQ
                              (LETT |rn|
                                    (|FS2UPS;ratIfCan|
                                     (SPADCALL |ord| (QREFELT $ 154)) $)
                                    . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rn| 1)
                                 (PROGN
                                  (LETT #1#
                                        (|FS2UPS;stateProblem| "atan"
                                         "branch problem" $)
                                        . #4#)
                                  (GO #1#)))
                                (#5#
                                 (SEQ
                                  (COND
                                   ((SPADCALL |atanFlag|
                                              (CONS 1 "real: two sides")
                                              (QREFELT $ 153))
                                    (COND
                                     ((ODDP
                                       (SPADCALL (QCDR |rn|) (QREFELT $ 156)))
                                      (PROGN
                                       (LETT #1#
                                             (|FS2UPS;stateProblem| "atan"
                                              "branch problem" $)
                                             . #4#)
                                       (GO #1#))))))
                                  (LETT |lc|
                                        (SPADCALL |ups| |ord| (QREFELT $ 20))
                                        . #4#)
                                  (LETT |signum| (SPADCALL |lc| (QREFELT $ 32))
                                        . #4#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |signum| 1)
                                     (COND
                                      ((SPADCALL |atanFlag|
                                                 (CONS 4 "just do it")
                                                 (QREFELT $ 153))
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 157))
                                                   (SPADCALL 2 (QREFELT $ 160))
                                                   (QREFELT $ 151)))
                                        (#5# (|spadConstant| $ 22))))
                                      (#5#
                                       (SEQ
                                        (LETT |posNegPi2|
                                              (SPADCALL
                                               (SPADCALL
                                                (|FS2UPS;signOfExpression| |lc|
                                                 $)
                                                (SPADCALL (QREFELT $ 157))
                                                (QREFELT $ 143))
                                               (SPADCALL 2 (QREFELT $ 160))
                                               (QREFELT $ 151))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 157))
                                             (SPADCALL 2 (QREFELT $ 160))
                                             (QREFELT $ 151))
                                            |posNegPi2| (QREFELT $ 161)))))))))
                                    (#5#
                                     (SEQ
                                      (LETT |left?|
                                            (SPADCALL |atanFlag|
                                                      (CONS 2
                                                            "real: left side")
                                                      (QREFELT $ 153))
                                            . #4#)
                                      (LETT |n| (QCDR |signum|) . #4#)
                                      (COND
                                       (|left?|
                                        (COND
                                         ((EQL |n| 1)
                                          (EXIT
                                           (COND
                                            ((EQL |plusMinus| 1)
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QREFELT $ 157))
                                               (SPADCALL 2 (QREFELT $ 160))
                                               (QREFELT $ 151))
                                              (QREFELT $ 123)))
                                            (#5# (SPADCALL (QREFELT $ 157))))))
                                         ((NULL |left?|)
                                          (COND
                                           ((EQL |n| -1)
                                            (EXIT
                                             (COND
                                              ((EQL |plusMinus| 1)
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL (QREFELT $ 157))
                                                 (SPADCALL 2 (QREFELT $ 160))
                                                 (QREFELT $ 151))
                                                (QREFELT $ 123)))
                                              (#5#
                                               (SPADCALL
                                                (QREFELT $ 157))))))))))
                                       ((EQL |n| -1)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1)
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 157))
                                             (SPADCALL 2 (QREFELT $ 160))
                                             (QREFELT $ 151))
                                            (QREFELT $ 123)))
                                          (#5# (SPADCALL (QREFELT $ 157)))))))
                                      (EXIT
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 157))
                                                   (SPADCALL 2 (QREFELT $ 160))
                                                   (QREFELT $ 151)))
                                        (#5#
                                         (|spadConstant| $ 22))))))))))))))))
                          (#5# (SPADCALL |coef| (QREFELT $ 162))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 72))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |plusMinus|
                                                (SPADCALL |ups|
                                                          (QREFELT $ 163))
                                                (QREFELT $ 118))
                                      (SPADCALL (|spadConstant| $ 52)
                                                (SPADCALL |ups| |ups|
                                                          (QREFELT $ 53))
                                                (QREFELT $ 50))
                                      (QREFELT $ 164))
                                     (QREFELT $ 137))
                                    (QREFELT $ 50))))))
                 #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;applyIfCan| (|fcn| |arg| |fcnName| |posCheck?| |atanFlag| $)
  (PROG (|ans| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (SPADCALL |arg| |posCheck?| |atanFlag| (QREFELT $ 48))
            . #1=(|FS2UPS;applyIfCan|))
      (EXIT
       (COND ((QEQCAR |ups| 1) |ups|)
             (#2='T
              (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
                   (EXIT
                    (COND
                     ((QEQCAR |ans| 1)
                      (|FS2UPS;stateProblem| |fcnName| "essential singularity"
                       $))
                     (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS;tranToUPS| (|ker| |arg| |posCheck?| |atanFlag| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 165) |arg| "sin" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 166) |arg| "cos" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|tan| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 167) |arg| "tan" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|cot| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 168) |arg| "cot" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|sec| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 169) |arg| "sec" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|csc| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 170) |arg| "csc" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 171) |arg| "asin" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 172) |arg| "acos" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 142))
    (|FS2UPS;atancotToUPS| |arg| |posCheck?| |atanFlag| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 142))
    (|FS2UPS;atancotToUPS| |arg| |posCheck?| |atanFlag| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 173) |arg| "asec" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 174) |arg| "acsc" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|sinh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 175) |arg| "sinh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|cosh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 176) |arg| "cosh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|tanh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 177) |arg| "tanh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|coth| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 178) |arg| "coth" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|sech| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 179) |arg| "sech" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|csch| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 180) |arg| "csch" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 181) |arg| "asinh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 182) |arg| "acosh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 183) |arg| "atanh" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 184) |arg| "acoth" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 185) |arg| "asech" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 142))
    (|FS2UPS;applyIfCan| (ELT $ 186) |arg| "acsch" |posCheck?| |atanFlag| $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 120)) (QREFELT $ 122))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS;powToUPS| (|args| |posCheck?| |atanFlag| $)
  (PROG (|ans| |expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase|
            (|FS2UPS;logToUPS| (|SPADfirst| |args|) |posCheck?| |atanFlag| $)
            . #1=(|FS2UPS;powToUPS|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (SPADCALL (SPADCALL |args| (QREFELT $ 145)) |posCheck?|
                               |atanFlag| (QREFELT $ 48))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL (CDR |expon|) (CDR |logBase|)
                                         (QREFELT $ 53))
                               (QREFELT $ 144))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans| 1)
                           (|FS2UPS;stateProblem| "exp" "essential singularity"
                            $))
                          (#2# (CONS 0 (QCDR |ans|))))))))))))))))) 

(DEFUN |FS2UPS;newElem| (|f| $)
  (SPADCALL (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 188)) $)
            (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 189)) $)
            (QREFELT $ 151))) 

(DEFUN |FS2UPS;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2UPS;k2Elem|) $) (ELT $ 102) |p|
            (QREFELT $ 194))) 

(DEFUN |FS2UPS;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G779 |a| #2=#:G778)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 140)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #2# (CONS (|FS2UPS;newElem| |a| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 136)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 195))
                            . #3#)
                      (QREFELT $ 196))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 197)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 198)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 142))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 151)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 142))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 151)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 142))
                  (SPADCALL |cosz| (QREFELT $ 196)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 142))
                  (SPADCALL |sinz| (QREFELT $ 196)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 142))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 161))
                            (SPADCALL 2 (QREFELT $ 160)) (QREFELT $ 151)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 142))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 89))
                            (SPADCALL 2 (QREFELT $ 160)) (QREFELT $ 151)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 142))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 161))
                            (SPADCALL |ez| |iez| (QREFELT $ 89))
                            (QREFELT $ 151)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 142))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 89))
                            (SPADCALL |ez| |iez| (QREFELT $ 161))
                            (QREFELT $ 151)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 142))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 89))
                                      (QREFELT $ 196))
                            (QREFELT $ 199)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 142))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 161))
                                      (QREFELT $ 196))
                            (QREFELT $ 199)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 107)) |args|
                            (QREFELT $ 200))))))))))))) 

(DEFUN |FS2UPS;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 201) (QREFELT $ 204))) 

(DEFUN |FS2UPS;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 202) (QREFELT $ 204))) 

(DEFUN |FS2UPS;exprToGenUPS;FEBUU;43| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS;iExprToGenUPS| (|FS2UPS;newElem| |fcn| $) |posCheck?| |atanFlag| $)) 

(DEFUN |FS2UPS;iExprToGenUPS| (|fcn| |posCheck?| |atanFlag| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 38))
            . #1=(|FS2UPS;iExprToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (CONS 0
               (|FS2UPS;polyToUPS|
                (SPADCALL (QCDR |poly|) (QREFELT $ 13) (QREFELT $ 42)) $)))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 44)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS;iExprToGenUPS|) $) |posCheck?|
                  |atanFlag| (|spadConstant| $ 49) (ELT $ 50) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 51)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS;iExprToGenUPS|) $)
                          |posCheck?| |atanFlag| (|spadConstant| $ 52)
                          (ELT $ 53) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS;isNonTrivPower| |fcn| $) . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS;powerToGenUPS| (QCAR |power|)
                                    (QCDR |power|) |posCheck?| |atanFlag| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 55))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS;kernelToGenUPS| (QCDR |ker|)
                                  |posCheck?| |atanFlag| $))
                                (#2#
                                 (|error|
                                  "exprToGenUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS;opsInvolvingX| (|fcn| $)
  (PROG (|opList| |op| #1=#:G826 |k| #2=#:G825)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 207)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 107)) . #3#)
                         (QREFELT $ 208))
                        (SPADCALL (QREFELT $ 13)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 140)))
                                   (QREFELT $ 70))
                                  (QREFELT $ 71)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 210))))))) 

(DEFUN |FS2UPS;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G828 #2=#:G830 #3=#:G831 |op|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |op| NIL . #4=(|FS2UPS;opInOpList?|))
               (LETT #3# |opList| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |op| |name| (QREFELT $ 211))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS;exponential?| (|fcn| $)
  (PROG (|ker|)
    (RETURN
     (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 55)) |FS2UPS;exponential?|)
          (EXIT
           (COND
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 142)))
            ('T 'NIL))))))) 

(DEFUN |FS2UPS;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G842 #2=#:G846 #3=#:G847 |term| |prod|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|FS2UPS;exponential?| |fcn| $) 'T)
             (#4='T
              (SEQ
               (LETT |prod| (SPADCALL |fcn| (QREFELT $ 51))
                     . #5=(|FS2UPS;productOfNonZeroes?|))
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
                                  ((NULL (|FS2UPS;exponential?| |term| $))
                                   (COND
                                    ((SPADCALL (QREFELT $ 13)
                                               (SPADCALL |term| (QREFELT $ 70))
                                               (QREFELT $ 71))
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

(DEFUN |FS2UPS;powerToGenUPS| (|fcn| |n| |posCheck?| |atanFlag| $)
  (PROG (|xOpList| |coef| |deg| |ups| #1=#:G369 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS;iExprToGenUPS| |fcn| |posCheck?| |atanFlag| $)
            . #2=(|FS2UPS;powerToGenUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 66))
              (CONS 0 (SPADCALL (CDR |b|) |n| (QREFELT $ 67))))
             (#3='T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #1# |b| . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                     . #2#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 19)) . #2#)
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 22) (QREFELT $ 24))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 14)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              . #2#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 22)
                                     (QREFELT $ 24))
                           (|error|
                            "inverse of series with many leading zero coefficients")))))))))
               (LETT |xOpList| (|FS2UPS;opsInvolvingX| |coef| $) . #2#)
               (EXIT
                (COND
                 ((NULL |xOpList|)
                  (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 67))))
                 (#3#
                  (SEQ
                   (COND
                    ((NULL (CDR |xOpList|))
                     (COND
                      ((SPADCALL (|SPADfirst| |xOpList|) '|log|
                                 (QREFELT $ 211))
                       (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 67))))))))
                   (EXIT
                    (COND
                     ((|FS2UPS;productOfNonZeroes?| |coef| $)
                      (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 67))))
                     (#3#
                      (|FS2UPS;stateProblem| "inv"
                       "lowest order coefficient involves x" $)))))))))))))))) 

(DEFUN |FS2UPS;kernelToGenUPS| (|ker| |posCheck?| |atanFlag| $)
  (PROG (#1=#:G875 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 139))
            . #2=(|FS2UPS;kernelToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 96)
                           (QREFELT $ 61))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 136))
                           (|spadConstant| $ 73) (QREFELT $ 61))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 140)) . #2#))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 136)) (|spadConstant| $ 73)
                         (QREFELT $ 61))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|abs| (QREFELT $ 142))
                 (|FS2UPS;nthRootToGenUPS|
                  (SPADCALL |arg| |arg| (QREFELT $ 143)) 2 |posCheck?|
                  |atanFlag| $))
                ((SPADCALL |ker| '|%paren| (QREFELT $ 142))
                 (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 142))
                 (|FS2UPS;logToGenUPS| |arg| |posCheck?| |atanFlag| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 142))
                 (|FS2UPS;expToGenUPS| |arg| |posCheck?| |atanFlag| $))
                (#3#
                 (|FS2UPS;tranToGenUPS| |ker| |arg| |posCheck?| |atanFlag|
                  $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 142))
         (|FS2UPS;powToGenUPS| |args| |posCheck?| |atanFlag| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 142))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 145)) (QREFELT $ 146))
                . #2#)
          (EXIT
           (|FS2UPS;nthRootToGenUPS| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |posCheck?| |atanFlag| $))))
        (#3#
         (|FS2UPS;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 120)) (QREFELT $ 122))
          "unknown kernel" $)))))))) 

(DEFUN |FS2UPS;nthRootToGenUPS| (|arg| |n| |posCheck?| |atanFlag| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
            . #1=(|FS2UPS;nthRootToGenUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS;carefulNthRootIfCan| (CDR |result|) |n|
                      |posCheck?| 'T $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS;logToGenUPS| (|arg| |posCheck?| |atanFlag| $)
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |cen| |lt| #1=#:G911
         #2=#:G913 |signum| |coef| |deg| |ups| #3=#:G369 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
              . #4=(|FS2UPS;logToGenUPS|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               (#5='T
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |ups|
                         (PROG2 (LETT #3# |result| . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                         . #4#)
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 19)) . #4#)
                   (SEQ
                    (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 22) (QREFELT $ 24))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 14)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 28))
                              . #4#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 22)
                                     (QREFELT $ 24))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
                   (COND
                    (|posCheck?|
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 32)) . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 0)
                         (COND
                          ((EQL (QCDR |signum|) -1)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2#
                                         (|FS2UPS;stateProblem| "log"
                                          "negative leading coefficient" $)
                                         . #4#)
                                   (GO #2#))
                                  . #4#)
                            (GO #1#))))))))))
                   (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 61)) . #4#)
                   (LETT |cen| (SPADCALL |lt| (QREFELT $ 212)) . #4#)
                   (LETT |negRat?|
                         (SEQ (LETT |rat| (|FS2UPS;ratIfCan| |coef| $) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rat| 0)
                                 (COND
                                  ((SPADCALL (QCDR |rat|)
                                             (|spadConstant| $ 213)
                                             (QREFELT $ 214))
                                   'T)
                                  (#5# 'NIL)))
                                (#5# 'NIL))))
                         . #4#)
                   (LETT |logTerm|
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 13) (QREFELT $ 81)) |cen|
                                 (QREFELT $ 161))
                                . #4#)
                          (LETT |pow|
                                (SPADCALL |mon|
                                          (SPADCALL |deg| (QREFELT $ 154))
                                          (QREFELT $ 215))
                                . #4#)
                          (EXIT
                           (COND
                            (|negRat?|
                             (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 143))
                                       (QREFELT $ 216)))
                            (#5#
                             (SEQ
                              (LETT |term1|
                                    (SPADCALL (SPADCALL |deg| (QREFELT $ 154))
                                              (SPADCALL |mon| (QREFELT $ 216))
                                              (QREFELT $ 143))
                                    . #4#)
                              (EXIT
                               (SPADCALL (SPADCALL |coef| (QREFELT $ 216))
                                         |term1| (QREFELT $ 89))))))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL |logTerm| (|spadConstant| $ 73)
                                     (QREFELT $ 61))
                           (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 164))
                                     (QREFELT $ 217))
                           (QREFELT $ 50))))))
                 #1# (EXIT #1#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS;expToGenUPS| (|arg| |posCheck?| |atanFlag| $)
  (PROG (|ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
            |FS2UPS;expToGenUPS|)
      (EXIT
       (COND ((QEQCAR |ups| 1) |ups|)
             ('T
              (|FS2UPS;expGenUPS| (CDR |ups|) |posCheck?| |atanFlag| $)))))))) 

(DEFUN |FS2UPS;expGenUPS| (|ups| |posCheck?| |atanFlag| $)
  (PROG (|result| |expCoef| |xOpList| |lc| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 96) (QREFELT $ 28))
            . #1=(|FS2UPS;expGenUPS|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 73) (QREFELT $ 74))
         (|FS2UPS;stateProblem| "exp" "essential singularity" $))
        ((SPADCALL |deg| (|spadConstant| $ 73) (QREFELT $ 218))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 219))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 20))
                . #1#)
          (LETT |xOpList| (|FS2UPS;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2UPS;opInOpList?| '|log| |xOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 219))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 195)) (QREFELT $ 13)
                          (QREFELT $ 221))
                . #1#)
          (EXIT
           (COND
            ((|FS2UPS;opInOpList?| '|log| (|FS2UPS;opsInvolvingX| |expCoef| $)
              $)
             (|FS2UPS;stateProblem| "exp" "logs in constant coefficient" $))
            (#2#
             (SEQ
              (LETT |result|
                    (SPADCALL |expCoef| |posCheck?| |atanFlag| (QREFELT $ 205))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |result| 1) |result|)
                     (#2#
                      (CONS 0
                            (SPADCALL (CDR |result|)
                                      (SPADCALL
                                       (SPADCALL |ups|
                                                 (SPADCALL |lc|
                                                           (|spadConstant| $
                                                                           73)
                                                           (QREFELT $ 61))
                                                 (QREFELT $ 75))
                                       (QREFELT $ 219))
                                      (QREFELT $ 53)))))))))))))))))) 

(DEFUN |FS2UPS;atancotToGenUPS|
       (|fe| |arg| |posCheck?| |atanFlag| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G958 |rn| #2=#:G956
         |yCoef| |y| |ord| |coef| |ups| #3=#:G369 |trouble| |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
              . #4=(|FS2UPS;atancotToGenUPS|))
        (EXIT
         (COND
          ((QEQCAR |result| 1)
           (SEQ (LETT |trouble| (CDR |result|) . #4#)
                (EXIT
                 (COND
                  ((EQUAL (QCDR |trouble|) "essential singularity")
                   (CONS 0
                         (SPADCALL |fe| (|spadConstant| $ 73) (QREFELT $ 61))))
                  (#5='T |result|)))))
          (#5#
           (SEQ
            (EXIT
             (SEQ
              (LETT |ups|
                    (PROG2 (LETT #3# |result| . #4#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                    . #4#)
              (LETT |coef|
                    (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 20))
                    . #4#)
              (SEQ
               (LETT |ord|
                     (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 28))
                     . #4#)
               (EXIT
                (COND
                 ((SPADCALL |ord| (|spadConstant| $ 73) (QREFELT $ 152))
                  (COND
                   ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 143))
                              (SPADCALL (|spadConstant| $ 18) (QREFELT $ 123))
                              (QREFELT $ 24))
                    (PROGN
                     (LETT #2#
                           (SEQ
                            (LETT |y|
                                  (SPADCALL (SPADCALL |ups| (QREFELT $ 163))
                                            (SPADCALL (|spadConstant| $ 52)
                                                      (SPADCALL |ups| |ups|
                                                                (QREFELT $ 53))
                                                      (QREFELT $ 50))
                                            (QREFELT $ 164))
                                  . #4#)
                            (LETT |yCoef|
                                  (SPADCALL |y|
                                            (SPADCALL (|spadConstant| $ 96)
                                                      (QREFELT $ 222))
                                            (QREFELT $ 20))
                                  . #4#)
                            (EXIT
                             (CONS 0
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |yCoef| (QREFELT $ 216))
                                     (|spadConstant| $ 73) (QREFELT $ 61))
                                    (SPADCALL
                                     (SPADCALL |y|
                                               (SPADCALL |yCoef|
                                                         (SPADCALL
                                                          (|spadConstant| $ 96)
                                                          (QREFELT $ 222))
                                                         (QREFELT $ 61))
                                               (QREFELT $ 75))
                                     (QREFELT $ 137))
                                    (QREFELT $ 50)))))
                           . #4#)
                     (GO #2#))))))))
              (LETT |cc|
                    (COND
                     ((SPADCALL |ord| (|spadConstant| $ 73) (QREFELT $ 74))
                      (COND
                       ((SPADCALL |atanFlag| (CONS 0 "complex")
                                  (QREFELT $ 153))
                        (PROGN
                         (LETT #1#
                               (|FS2UPS;stateProblem| "atan"
                                "essential singularity" $)
                               . #4#)
                         (GO #1#)))
                       (#5#
                        (SEQ
                         (LETT |rn|
                               (|FS2UPS;ratIfCan|
                                (SPADCALL |ord| (QREFELT $ 154)) $)
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |rn| 1)
                            (PROGN
                             (LETT #1#
                                   (|FS2UPS;stateProblem| "atan"
                                    "branch problem" $)
                                   . #4#)
                             (GO #1#)))
                           (#5#
                            (SEQ
                             (COND
                              ((SPADCALL |atanFlag| (CONS 1 "real: two sides")
                                         (QREFELT $ 153))
                               (COND
                                ((ODDP (SPADCALL (QCDR |rn|) (QREFELT $ 156)))
                                 (PROGN
                                  (LETT #1#
                                        (|FS2UPS;stateProblem| "atan"
                                         "branch problem" $)
                                        . #4#)
                                  (GO #1#))))))
                             (LETT |lc| (SPADCALL |ups| |ord| (QREFELT $ 20))
                                   . #4#)
                             (LETT |signum| (SPADCALL |lc| (QREFELT $ 32))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |signum| 1)
                                (COND
                                 ((SPADCALL |atanFlag| (CONS 4 "just do it")
                                            (QREFELT $ 153))
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 157))
                                              (SPADCALL 2 (QREFELT $ 160))
                                              (QREFELT $ 151)))
                                   (#5# (|spadConstant| $ 22))))
                                 (#5#
                                  (SEQ
                                   (LETT |posNegPi2|
                                         (SPADCALL
                                          (SPADCALL
                                           (|FS2UPS;signOfExpression| |lc| $)
                                           (SPADCALL (QREFELT $ 157))
                                           (QREFELT $ 143))
                                          (SPADCALL 2 (QREFELT $ 160))
                                          (QREFELT $ 151))
                                         . #4#)
                                   (EXIT
                                    (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 157))
                                             (SPADCALL 2 (QREFELT $ 160))
                                             (QREFELT $ 151))
                                            |posNegPi2| (QREFELT $ 161)))))))))
                               (#5#
                                (SEQ
                                 (LETT |left?|
                                       (SPADCALL |atanFlag|
                                                 (CONS 2 "real: left side")
                                                 (QREFELT $ 153))
                                       . #4#)
                                 (LETT |n| (QCDR |signum|) . #4#)
                                 (COND
                                  (|left?|
                                   (COND
                                    ((EQL |n| 1)
                                     (EXIT
                                      (COND
                                       ((EQL |plusMinus| 1)
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 157))
                                                   (SPADCALL 2 (QREFELT $ 160))
                                                   (QREFELT $ 151))
                                         (QREFELT $ 123)))
                                       (#5# (SPADCALL (QREFELT $ 157))))))
                                    ((NULL |left?|)
                                     (COND
                                      ((EQL |n| -1)
                                       (EXIT
                                        (COND
                                         ((EQL |plusMinus| 1)
                                          (SPADCALL
                                           (SPADCALL (SPADCALL (QREFELT $ 157))
                                                     (SPADCALL 2
                                                               (QREFELT $ 160))
                                                     (QREFELT $ 151))
                                           (QREFELT $ 123)))
                                         (#5#
                                          (SPADCALL (QREFELT $ 157))))))))))
                                  ((EQL |n| -1)
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL
                                       (SPADCALL (SPADCALL (QREFELT $ 157))
                                                 (SPADCALL 2 (QREFELT $ 160))
                                                 (QREFELT $ 151))
                                       (QREFELT $ 123)))
                                     (#5# (SPADCALL (QREFELT $ 157)))))))
                                 (EXIT
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 157))
                                              (SPADCALL 2 (QREFELT $ 160))
                                              (QREFELT $ 151)))
                                   (#5# (|spadConstant| $ 22))))))))))))))))
                     (#5# (SPADCALL |coef| (QREFELT $ 162))))
                    . #4#)
              (EXIT
               (CONS 0
                     (SPADCALL (SPADCALL |cc| (QREFELT $ 72))
                               (SPADCALL
                                (SPADCALL (SPADCALL |ups| (QREFELT $ 163))
                                          (SPADCALL (|spadConstant| $ 52)
                                                    (SPADCALL |ups| |ups|
                                                              (QREFELT $ 53))
                                                    (QREFELT $ 50))
                                          (QREFELT $ 164))
                                (QREFELT $ 137))
                               (QREFELT $ 50))))))
            #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;genUPSApplyIfCan|
       (|fcn| |arg| |fcnName| |posCheck?| |atanFlag| $)
  (PROG (#1=#:G966 |xOpList| |lc| |deg| |ups| #2=#:G369 |series|)
    (RETURN
     (SEQ
      (LETT |series| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
            . #3=(|FS2UPS;genUPSApplyIfCan|))
      (EXIT
       (COND ((QEQCAR |series| 1) |series|)
             (#4='T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #2# |series| . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                     . #3#)
               (LETT |deg|
                     (SPADCALL |ups| (|spadConstant| $ 96) (QREFELT $ 28))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |deg| (|spadConstant| $ 73) (QREFELT $ 74))
                  (|FS2UPS;stateProblem| |fcnName| "essential singularity" $))
                 ((SPADCALL |deg| (|spadConstant| $ 73) (QREFELT $ 218))
                  (CONS 0
                        (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))))
                 (#4#
                  (SEQ
                   (LETT |lc|
                         (SPADCALL |ups| (|spadConstant| $ 73) (QREFELT $ 20))
                         . #3#)
                   (LETT |xOpList| (|FS2UPS;opsInvolvingX| |lc| $) . #3#)
                   (EXIT
                    (COND
                     ((NULL |xOpList|)
                      (CONS 0
                            (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     ((|FS2UPS;opInOpList?| '|log| |xOpList| $)
                      (|FS2UPS;stateProblem| |fcnName|
                       "logs in constant coefficient" $))
                     ((|FS2UPS;contOnReals?| |fcnName| $)
                      (CONS 0
                            (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#4#
                      (|FS2UPS;stateProblem| |fcnName|
                       "x in constant coefficient" $)))))))))))))))) 

(DEFUN |FS2UPS;applyBddIfCan|
       (|fe| |fcn| |arg| |fcnName| |posCheck?| |atanFlag| $)
  (PROG (|ans| |trouble| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS;iExprToGenUPS| |arg| |posCheck?| |atanFlag| $)
            . #1=(|FS2UPS;applyBddIfCan|))
      (EXIT
       (COND
        ((QEQCAR |ups| 1)
         (SEQ (LETT |trouble| (CDR |ups|) . #1#)
              (EXIT
               (COND
                ((EQUAL (QCDR |trouble|) "essential singularity")
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 73) (QREFELT $ 61))))
                (#2='T |ups|)))))
        (#2#
         (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 73) (QREFELT $ 61))))
                (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS;tranToGenUPS| (|ker| |arg| |posCheck?| |atanFlag| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 142))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 136)) (ELT $ 165) |arg|
     "sin" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 142))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 136)) (ELT $ 166) |arg|
     "cos" |posCheck?| |atanFlag| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 171) |arg| "asin" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 172) |arg| "acos" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 142))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 136)) |arg|
     |posCheck?| |atanFlag| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 142))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 136)) |arg|
     |posCheck?| |atanFlag| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 173) |arg| "asec" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 174) |arg| "acsc" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 181) |arg| "asinh" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 182) |arg| "acosh" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 183) |arg| "atanh" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 184) |arg| "acoth" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 185) |arg| "asech" |posCheck?| |atanFlag|
     $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 142))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 186) |arg| "acsch" |posCheck?| |atanFlag|
     $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 120)) (QREFELT $ 122))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS;powToGenUPS| (|args| |posCheck?| |atanFlag| $)
  (PROG (|expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase|
            (|FS2UPS;logToGenUPS| (|SPADfirst| |args|) |posCheck?| |atanFlag|
             $)
            . #1=(|FS2UPS;powToGenUPS|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2UPS;iExprToGenUPS| (SPADCALL |args| (QREFELT $ 145))
                      |posCheck?| |atanFlag| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (|FS2UPS;expGenUPS|
                        (SPADCALL (CDR |expon|) (CDR |logBase|) (QREFELT $ 53))
                        |posCheck?| |atanFlag| $)))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries| (&REST #1=#:G1032)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1033)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceToUnivariatePowerSeries|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceToUnivariatePowerSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FunctionSpaceToUnivariatePowerSeries;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FunctionSpaceToUnivariatePowerSeries|))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8|)
  (PROG (|pv$| $ |dv$| DV$8 DV$7 DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|FunctionSpaceToUnivariatePowerSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT DV$7 (|devaluate| |#7|) . #1#)
      (LETT DV$8 (|devaluate| |#8|) . #1#)
      (LETT |dv$|
            (LIST '|FunctionSpaceToUnivariatePowerSeries| DV$1 DV$2 DV$3 DV$4
                  DV$5 DV$6 DV$7 DV$8)
            . #1#)
      (LETT $ (GETREFV 223) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceToUnivariatePowerSeries|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (QSETREFV $ 12 |#7|)
      (QSETREFV $ 13 |#8|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 14 1000)
      (QSETREFV $ 68 (|EllipticFunctionsUnivariateTaylorSeries| |#2| |#6|))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|abs|
                              (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
        (QSETREFV $ 149
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;31|) $)))
       ('T
        (QSETREFV $ 149
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;32|) $))))
      (QSETREFV $ 201
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 202 (LIST #2# #3# #4# #5#))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) 'ZEROCOUNT
              (|Union| 155 '#1="failed") (0 . |retractIfCan|) (5 . |One|)
              (9 . |One|) (13 . |degree|) (18 . |coefficient|) (24 . |Zero|)
              (28 . |Zero|) (|Boolean|) (32 . =) (|Integer|) (38 . |coerce|)
              (43 . +) (49 . |order|) (55 . |even?|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (60 . |sign|) (65 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (70 . |nthRootIfCan|) (|Union| 41 '#1#) (76 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (81 . |univariate|) (|Union| 108 '#2="failed") (87 . |isPlus|)
              (|Record| (|:| |func| 121) (|:| |prob| 121))
              (|Union| (|:| |%series| 9) (|:| |%problem| 45))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS;exprToUPS;FEBUU;4| (92 . |Zero|) (96 . +)
              (102 . |isTimes|) (107 . |One|) (111 . *) (|Union| 135 '#1#)
              (117 . |retractIfCan|) (|SparseUnivariatePolynomial| 41)
              (122 . |zero?|) (127 . |degree|) (132 . |leadingCoefficient|)
              (137 . |coerce|) (142 . |monomial|) (148 . |reductum|)
              (|Record| (|:| |val| $) (|:| |exponent| 25)) (|Union| 63 '#2#)
              (153 . |isPower|) (158 . >) (164 . ^) 'ELITS (|List| 40)
              (170 . |variables|) (175 . |member?|) (181 . |coerce|)
              (186 . |Zero|) (190 . <) (196 . -) (202 . |differentiate|)
              (|List| 9) (|Mapping| 7 7) (|List| 78) (208 . |taylor_via_deriv|)
              (215 . |coerce|) (|Equation| 7) (220 . =) (|List| 112)
              (226 . |eval|) (232 . |map|) (238 . |taylor_via_deriv|)
              (245 . |new|) (249 . +) (255 . |elt|) (|Mapping| 11 11)
              (261 . |applyTaylor|) (267 . |One|) (|List| 7) (271 . |elt|)
              (277 . |One|) (|PositiveInteger|) (281 . ^) (287 . *) (293 . -)
              (298 . |coerce|) (303 . |coerce|) (308 . /) (314 . |last|)
              (|BasicOperator|) (|Kernel| 7) (319 . |operator|) (|List| $)
              (324 . |kernel|) (330 . -) (335 . ^) (|Equation| $)
              (341 . |eval|) (347 . |taylor_via_lode|)
              (|SpecialFunctionUnivariateTaylorSeries| 7 11)
              (354 . |lambertW0|) (359 . ~=) (365 . *) (371 . |One|)
              (375 . |name|) (|String|) (380 . |string|) (385 . -)
              (390 . |jacobiSn|) (396 . |jacobiCn|) (402 . |jacobiDn|)
              (408 . |ellipticE|) (414 . |ellipticF|) (420 . |ellipticPi|)
              (427 . |weierstrassP0|) (434 . |weierstrassPPrime0|)
              (441 . |weierstrassZeta0|) (448 . |weierstrassSigma0|)
              (455 . |elt|) (|Kernel| $) (461 . |coerce|) (466 . |integrate|)
              (|Union| 40 '"failed") (471 . |symbolIfCan|) (476 . |argument|)
              (481 . |has?|) (487 . |is?|) (493 . *) (499 . |expIfCan|)
              (504 . |second|) (509 . |retract|) (514 . |logIfCan|)
              (519 . |abs|) (524 . |localAbs|) (529 . |sqrt|) (534 . /)
              (540 . =) (546 . =) (552 . |coerce|) (|Fraction| 25)
              (557 . |numer|) (562 . |pi|) (566 . |pi|) (570 . |pi|)
              (574 . |coerce|) (579 . -) (585 . |atan|) (590 . |differentiate|)
              (595 . /) (601 . |sinIfCan|) (606 . |cosIfCan|)
              (611 . |tanIfCan|) (616 . |cotIfCan|) (621 . |secIfCan|)
              (626 . |cscIfCan|) (631 . |asinIfCan|) (636 . |acosIfCan|)
              (641 . |asecIfCan|) (646 . |acscIfCan|) (651 . |sinhIfCan|)
              (656 . |coshIfCan|) (661 . |tanhIfCan|) (666 . |cothIfCan|)
              (671 . |sechIfCan|) (676 . |cschIfCan|) (681 . |asinhIfCan|)
              (686 . |acoshIfCan|) (691 . |atanhIfCan|) (696 . |acothIfCan|)
              (701 . |asechIfCan|) (706 . |acschIfCan|)
              (|SparseMultivariatePolynomial| 6 135) (711 . |numer|)
              (716 . |denom|) (|Mapping| 7 106) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 106)
              (|PolynomialCategoryLifting| (|IndexedExponents| 106) 106 6 192
                                           7)
              (721 . |map|) (728 . |exp|) (733 . |inv|) (738 . |sin|)
              (743 . |cos|) (748 . *) (754 . |elt|) 'CONTFCNS 'BDDFCNS
              (|List| 121) (760 . |member?|) |FS2UPS;exprToGenUPS;FEBUU;43|
              (|List| 135) (766 . |tower|) (771 . |unary?|) (|List| 105)
              (776 . |removeDuplicates|) (781 . |is?|) (787 . |center|)
              (792 . |Zero|) (796 . <) (802 . ^) (808 . |log|) (813 . |log|)
              (818 . >) (824 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (829 . |normalize|)
              (835 . -))
           '#(|localAbs| 840 |exprToUPS| 845 |exprToGenUPS| 852) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 222
                                                 '(1 7 15 0 16 0 6 0 17 0 7 0
                                                   18 1 9 8 0 19 2 9 7 0 8 20 0
                                                   6 0 21 0 7 0 22 2 7 23 0 0
                                                   24 1 8 0 25 26 2 8 0 0 0 27
                                                   2 9 8 0 8 28 1 25 23 0 29 1
                                                   31 30 7 32 1 8 23 0 33 2 10
                                                   34 9 35 36 1 7 37 0 38 2 41
                                                   39 0 40 42 1 7 43 0 44 0 9 0
                                                   49 2 9 0 0 0 50 1 7 43 0 51
                                                   0 9 0 52 2 9 0 0 0 53 1 7 54
                                                   0 55 1 56 23 0 57 1 56 35 0
                                                   58 1 56 41 0 59 1 7 0 41 60
                                                   2 9 0 7 8 61 1 56 0 0 62 1 7
                                                   64 0 65 2 25 23 0 0 66 2 9 0
                                                   0 25 67 1 7 69 0 70 2 69 23
                                                   40 0 71 1 9 0 7 72 0 8 0 73
                                                   2 8 23 0 0 74 2 9 0 0 0 75 2
                                                   7 0 0 40 76 3 12 9 9 77 79
                                                   80 1 7 0 40 81 2 82 0 7 7 83
                                                   2 7 0 0 84 85 2 9 0 78 0 86
                                                   3 12 9 7 77 79 87 0 40 0 88
                                                   2 7 0 0 0 89 2 77 9 0 25 90
                                                   2 12 9 91 9 92 0 25 0 93 2
                                                   94 7 0 25 95 0 8 0 96 2 9 0
                                                   0 97 98 2 9 0 97 0 99 1 9 0
                                                   0 100 1 6 0 25 101 1 7 0 6
                                                   102 2 9 0 0 7 103 1 94 7 0
                                                   104 1 106 105 0 107 2 7 0
                                                   105 108 109 1 6 0 0 110 2 9
                                                   0 0 0 111 2 7 0 0 112 113 3
                                                   12 9 77 9 94 114 1 115 11 11
                                                   116 2 25 23 0 0 117 2 9 0 25
                                                   0 118 0 97 0 119 1 106 40 0
                                                   120 1 40 121 0 122 1 7 0 0
                                                   123 2 68 11 11 7 124 2 68 11
                                                   11 7 125 2 68 11 11 7 126 2
                                                   68 11 11 7 127 2 68 11 11 7
                                                   128 3 68 11 11 7 7 129 3 115
                                                   11 7 7 11 130 3 115 11 7 7
                                                   11 131 3 115 11 7 7 11 132 3
                                                   115 11 7 7 11 133 2 7 0 105
                                                   0 134 1 7 0 135 136 1 9 0 0
                                                   137 1 106 138 0 139 1 106 94
                                                   0 140 2 105 23 0 40 141 2
                                                   106 23 0 40 142 2 7 0 0 0
                                                   143 1 10 34 9 144 1 94 7 0
                                                   145 1 7 25 0 146 1 10 34 9
                                                   147 1 7 0 0 148 1 0 7 7 149
                                                   1 7 0 0 150 2 7 0 0 0 151 2
                                                   8 23 0 0 152 2 47 23 0 0 153
                                                   1 7 0 8 154 1 155 25 0 156 0
                                                   7 0 157 0 9 0 158 0 11 0 159
                                                   1 7 0 25 160 2 7 0 0 0 161 1
                                                   7 0 0 162 1 9 0 0 163 2 9 0
                                                   0 0 164 1 10 34 9 165 1 10
                                                   34 9 166 1 10 34 9 167 1 10
                                                   34 9 168 1 10 34 9 169 1 10
                                                   34 9 170 1 10 34 9 171 1 10
                                                   34 9 172 1 10 34 9 173 1 10
                                                   34 9 174 1 10 34 9 175 1 10
                                                   34 9 176 1 10 34 9 177 1 10
                                                   34 9 178 1 10 34 9 179 1 10
                                                   34 9 180 1 10 34 9 181 1 10
                                                   34 9 182 1 10 34 9 183 1 10
                                                   34 9 184 1 10 34 9 185 1 10
                                                   34 9 186 1 7 187 0 188 1 7
                                                   187 0 189 3 193 7 190 191
                                                   192 194 1 7 0 0 195 1 7 0 0
                                                   196 1 7 0 0 197 1 7 0 0 198
                                                   2 7 0 97 0 199 2 7 0 105 108
                                                   200 2 203 23 121 0 204 1 7
                                                   206 0 207 1 105 23 0 208 1
                                                   209 0 0 210 2 105 23 0 40
                                                   211 1 9 7 0 212 0 155 0 213
                                                   2 155 23 0 0 214 2 7 0 0 0
                                                   215 1 7 0 0 216 1 9 0 0 217
                                                   2 8 23 0 0 218 1 9 0 0 219 2
                                                   220 7 7 40 221 1 8 0 0 222 1
                                                   0 7 7 149 3 0 46 7 23 47 48
                                                   3 0 46 7 23 47 205)))))
           '|lookupComplete|)) 
