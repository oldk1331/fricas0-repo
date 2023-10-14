
(/VERSIONCHECK 2) 

(DEFUN |FS2UPS;ratIfCan| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 16))) 

(DEFUN |FS2UPS;carefulNthRootIfCan| (|ups| |n| |posCheck?| |rightOnly?| $)
  (PROG (|ans| #1=#:G293 |signum| |coef| |deg|)
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
  (|FS2UPS;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| 'NIL (|spadConstant| $ 22)) $)) 

(DEFUN |FS2UPS;exprToPS;FEBUBFEU;5|
       (|fcn| |posCheck?| |atanFlag| |log_flag| |log_val| $)
  (|FS2UPS;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| |log_flag| |log_val|) $)) 

(DEFUN |FS2UPS;i_expr_to_PS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 43))
            . #1=(|FS2UPS;i_expr_to_PS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (CONS 0
               (|FS2UPS;polyToUPS|
                (SPADCALL (QCDR |poly|) (QREFELT $ 13) (QREFELT $ 47)) $)))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 49)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS;i_expr_to_PS|) $) |opt_rec|
                  (|spadConstant| $ 50) (ELT $ 51) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 52)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS;i_expr_to_PS|) $) |opt_rec|
                          (|spadConstant| $ 53) (ELT $ 54) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS;isNonTrivPower| |fcn| $) . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS;powerToUPS| (QCAR |power|)
                                    (QCDR |power|) |opt_rec| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 56))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS;kernelToUPS| (QCDR |ker|) |opt_rec|
                                  $))
                                (#2#
                                 (|error|
                                  "exprToUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS;polyToUPS| (|poly| $)
  (PROG (|ans| |coef| |deg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |poly| (QREFELT $ 58)) (|spadConstant| $ 50))
            ('T
             (SEQ
              (LETT |deg| (SPADCALL |poly| (QREFELT $ 59))
                    . #1=(|FS2UPS;polyToUPS|))
              (LETT |coef|
                    (SPADCALL (SPADCALL |poly| (QREFELT $ 60)) (QREFELT $ 61))
                    . #1#)
              (LETT |ans|
                    (SPADCALL |coef| (SPADCALL |deg| (QREFELT $ 26))
                              (QREFELT $ 62))
                    . #1#)
              (LETT |poly| (SPADCALL |poly| (QREFELT $ 63)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |poly| (QREFELT $ 58)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 59)) . #1#)
                        (LETT |coef|
                              (SPADCALL (SPADCALL |poly| (QREFELT $ 60))
                                        (QREFELT $ 61))
                              . #1#)
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL |coef|
                                                  (SPADCALL |deg|
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 62))
                                        (QREFELT $ 51))
                              . #1#)
                        (EXIT
                         (LETT |poly| (SPADCALL |poly| (QREFELT $ 63)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))))))) 

(DEFUN |FS2UPS;listToUPS| (|list| |feToUPS| |opt_rec| |ans| |op| $)
  (PROG (#1=#:G371 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (LETT |term| (SPADCALL (|SPADfirst| |list|) |opt_rec| |feToUPS|)
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
      (LETT |expt| (SPADCALL |fcn| (QREFELT $ 66))
            . #1=(|FS2UPS;isNonTrivPower|))
      (EXIT
       (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |power| (QCDR |expt|) . #1#)
                   (EXIT
                    (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                          (#2# (CONS 0 |power|)))))))))))) 

(DEFUN |FS2UPS;powerToUPS| (|fcn| |n| |opt_rec| $)
  (PROG (|coef| |deg| |ups| #1=#:G380 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS;i_expr_to_PS| |fcn| |opt_rec| $)
            . #2=(|FS2UPS;powerToUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 67))
              (CONS 0 (SPADCALL (CDR |b|) |n| (QREFELT $ 68))))
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
               (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68)))))))))))) 

(DEFUN |FS2UPS;handle_args| (|args| |opt_rec| $)
  (PROG (|lsers| |lsere| |lcoef| |losers| |coef| #1=#:G403 |ups| #2=#:G390
         |nsu| #3=#:G404 |arg|)
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
                      (SPADCALL (QREFELT $ 13) (SPADCALL |arg| (QREFELT $ 71))
                                (QREFELT $ 72)))
                     (SEQ
                      (LETT |losers|
                            (CONS (SPADCALL |arg| (QREFELT $ 73)) |losers|)
                            . #4#)
                      (LETT |lsers| (CONS (|spadConstant| $ 50) |lsers|) . #4#)
                      (LETT |lsere| (CONS (|spadConstant| $ 22) |lsere|) . #4#)
                      (EXIT (LETT |lcoef| (CONS |arg| |lcoef|) . #4#))))
                    ('T
                     (SEQ
                      (LETT |nsu| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $)
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
                              (SPADCALL |ups| (|spadConstant| $ 74)
                                        (QREFELT $ 28))
                              (|spadConstant| $ 74) (QREFELT $ 75))
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
                                    (SPADCALL |ups| (|spadConstant| $ 74)
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
                                                          (QREFELT $ 73))
                                                (QREFELT $ 76))
                                      |lsers|)
                                     . #4#)))))))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS 0
                   (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                           (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv| (|nf| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G418 |sym| #2=#:G417)
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
      (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT $ 81)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS;do_taylor_via_deriv!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 87)))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G414 |sym| #3=#:G413)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 82))
                                             (|spadConstant| $ 22)
                                             (QREFELT $ 84))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 86))))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 77)))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2| (|nk| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G432 |sym| #2=#:G431)
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
      (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT $ 88)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS;do_taylor_via_deriv2!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 87)))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G428 |sym| #3=#:G427)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 82))
                                             (|spadConstant| $ 22)
                                             (QREFELT $ 84))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 86))))))))) 

(DEFUN |FS2UPS;do_taylor_via_deriv2!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 77)))))) 

(DEFUN |FS2UPS;convert_args| (|lsers| |lsere| |lser0| $)
  (PROG (|nargs| |lser| |lsyms| |nsym| #1=#:G438 |s| #2=#:G439 |e| #3=#:G440
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
                   (SEQ (LETT |nsym| (SPADCALL (QREFELT $ 89)) . #4#)
                        (LETT |nargs|
                              (CONS
                               (SPADCALL |c| (SPADCALL |nsym| (QREFELT $ 82))
                                         (QREFELT $ 90))
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
                      (SPADCALL |losers| 1 (QREFELT $ 91)) (QREFELT $ 93))
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
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 94) (QREFELT $ 96))
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
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 94) (QREFELT $ 96))
                (SPADCALL |l| 2 (QREFELT $ 96)) |ef|))))) 

(DEFUN |FS2UPS;besselEq| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;besselEq|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 99)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 99))
                       (SPADCALL |v| 2 (QREFELT $ 99)) (QREFELT $ 76)))))))) 

(DEFUN |FS2UPS;besselEqm| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;besselEqm|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 99)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 99))
                       (SPADCALL |v| 2 (QREFELT $ 99)) (QREFELT $ 51)))))))) 

(DEFUN |FS2UPS;kelvinEq| (|lc| |z0| $)
  (PROG (|v2| |zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;kelvinEq|))
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (LETT |v2|
            (SPADCALL (|spadConstant| $ 53)
                      (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 99))
                                (QREFELT $ 100))
                      (QREFELT $ 51))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 4 (QREFELT $ 99))
             (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 99)) (QREFELT $ 100))
             (SPADCALL
              (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT $ 99)) (QREFELT $ 54))
              (QREFELT $ 101))
             (SPADCALL |v2| |zvar| (QREFELT $ 54))
             (SPADCALL
              (SPADCALL (SPADCALL |v| 2 (QREFELT $ 99))
                        (SPADCALL 4 (SPADCALL |v| 2 (QREFELT $ 99))
                                  (QREFELT $ 100))
                        (QREFELT $ 76))
              (SPADCALL |zvar| 4 (QREFELT $ 99)) (QREFELT $ 51)))))))) 

(DEFUN |FS2UPS;kummerEq| (|lc| |z0| $)
  (PROG (|zvar| |b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;kummerEq|))
      (LETT |b| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 73))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (EXIT
       (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 76))
             (SPADCALL |a| (QREFELT $ 101)))))))) 

(DEFUN |FS2UPS;legendreEq| (|lc| |z0| $)
  (PROG (|z2| |zvar| |mu| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;legendreEq|))
      (LETT |mu| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 73))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (LETT |z2|
            (SPADCALL (|spadConstant| $ 53) (SPADCALL |zvar| 2 (QREFELT $ 99))
                      (QREFELT $ 76))
            . #1#)
      (EXIT
       (LIST (SPADCALL |z2| 2 (QREFELT $ 99))
             (SPADCALL
              (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 100)) |z2|
                        (QREFELT $ 54))
              (QREFELT $ 101))
             (SPADCALL
              (SPADCALL
               (SPADCALL |nu|
                         (SPADCALL |nu| (|spadConstant| $ 53) (QREFELT $ 51))
                         (QREFELT $ 54))
               |z2| (QREFELT $ 54))
              |mu| (QREFELT $ 76)))))))) 

(DEFUN |FS2UPS;whittakerEq| (|lc| |z0| $)
  (PROG (|zvar| |o4| |m| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 73))
            . #1=(|FS2UPS;whittakerEq|))
      (LETT |m| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 73))
            . #1#)
      (LETT |o4|
            (SPADCALL (|spadConstant| $ 53)
                      (SPADCALL (SPADCALL 4 (QREFELT $ 102)) (QREFELT $ 103))
                      (QREFELT $ 104))
            . #1#)
      (LETT |zvar|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                       (QREFELT $ 62))
             (SPADCALL |z0| (QREFELT $ 73)) (QREFELT $ 51))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 99)) (|spadConstant| $ 50)
             (SPADCALL
              (SPADCALL
               (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 99)) (QREFELT $ 76))
               (SPADCALL |k| |zvar| (QREFELT $ 54)) (QREFELT $ 51))
              (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 99))
                        (SPADCALL (SPADCALL 4 (QREFELT $ 102)) (QREFELT $ 103))
                        (QREFELT $ 104))
              (QREFELT $ 76)))))))) 

(DEFUN |FS2UPS;do_diff_eq| (|ker| |losers| |lsers| |lsere| |lser0| |getEq| $)
  (PROG (|ups| |lc| #1=#:G472 |c| #2=#:G471 |nker| #3=#:G470 |lsyms| |sym|
         |ecl| #4=#:G469 #5=#:G468 |cn1| |cn| |z0| |nargs| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs| (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
            . #6=(|FS2UPS;do_diff_eq|))
      (LETT |nargs| (QVELT |cargs| 0) . #6#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| (QREFELT $ 105)) (|spadConstant| $ 22)
                   (QREFELT $ 24))
         (SEQ
          (LETT |nker|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 108)) |nargs|
                          (QREFELT $ 110))
                . #6#)
          (EXIT
           (|FS2UPS;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))
        ('T
         (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 105)) . #6#)
              (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|) . #6#)
              (LETT |cn| (|SPADfirst| |ecl|) . #6#)
              (LETT |cn1|
                    (SPADCALL
                     (SPADCALL |cn|
                               (SPADCALL (|spadConstant| $ 53) (QREFELT $ 101))
                               (QREFELT $ 112))
                     (QREFELT $ 101))
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
                                  (CONS (SPADCALL |c| |cn1| (QREFELT $ 54))
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |nker|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 108)) |nargs|
                              (QREFELT $ 110))
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
                    (LETT |nker| (SPADCALL |nker| |sym| (QREFELT $ 77)) . #6#)
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
                                              (SPADCALL |sym| (QREFELT $ 82))
                                              (|spadConstant| $ 22)
                                              (QREFELT $ 84))
                                             (QREFELT $ 114))
                                   #2#)
                                  . #6#)))
                          (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #6#)
              (LETT |ups|
                    (SPADCALL (REVERSE |ecl|) (|SPADfirst| (QVELT |cargs| 1))
                              |lc| (QREFELT $ 115))
                    . #6#)
              (EXIT
               (|FS2UPS;do_taylor_via_deriv| |ups| |lsyms| |lsers| $)))))))))) 

(DEFUN |FS2UPS;lambertW0| (|arg| $) (SPADCALL (ELT $ 117) |arg| (QREFELT $ 93))) 

(DEFUN |FS2UPS;do_weierstrass|
       (|losers| |lsers| |lsere| |lser0| |ef| |k| |cz| $)
  (PROG (#1=#:G480 |nres2| |lsyms| |nres| |nargs| |cargs| |z_inv| |coef| |deg|
         |z_ser|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| 3 (QREFELT $ 96)) (|spadConstant| $ 22)
                   (QREFELT $ 24))
         (|error| "expansion at 0"))
        (#2='T
         (SEQ
          (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT $ 91))
                . #3=(|FS2UPS;do_weierstrass|))
          (COND
           ((SPADCALL |cz| 0 (QREFELT $ 118))
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
                      (SPADCALL |cz| (SPADCALL |z_ser| |k| (QREFELT $ 68))
                                (QREFELT $ 119))
                      . #3#))))))
           (#2# (LETT |z_inv| (|spadConstant| $ 50) . #3#)))
          (LETT |cargs| (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
                . #3#)
          (LETT |nargs| (QVELT |cargs| 0) . #3#)
          (LETT |nres|
                (SPADCALL
                 (CONS #'|FS2UPS;do_weierstrass!0| (VECTOR |ef| $ |nargs|))
                 |z_ser| (QREFELT $ 93))
                . #3#)
          (LETT |lsyms| (CDR (QVELT |cargs| 2)) . #3#)
          (LETT |lsers| (CDR (QVELT |cargs| 1)) . #3#)
          (LETT |nres2| (|FS2UPS;do_taylor_via_deriv| |nres| |lsyms| |lsers| $)
                . #3#)
          (EXIT
           (COND ((QEQCAR |nres2| 1) (PROGN (LETT #1# |nres2| . #3#) (GO #1#)))
                 (#2#
                  (CONS 0
                        (SPADCALL |z_inv| (CDR |nres2|) (QREFELT $ 51))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_weierstrass!0| (|f| $$)
  (PROG (|nargs| $ |ef|)
    (LETT |nargs| (QREFELT $$ 2) . #1=(|FS2UPS;do_weierstrass|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 120) (QREFELT $ 96))
                (SPADCALL |nargs| 2 (QREFELT $ 96)) |f| |ef|))))) 

(DEFUN |FS2UPS;spec_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|nker| |nargs| |cargs| #1=#:G592 |nexpr| |narg1| |arg1| |ii| |ir| |nm|
         |lser0| |lsere| |lsers| |losers| |ares| |aresu|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |aresu| (|FS2UPS;handle_args| |args| |opt_rec| $)
              . #2=(|FS2UPS;spec_to_UPS|))
        (EXIT
         (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
               (#3='T
                (SEQ (LETT |ares| (QCDR |aresu|) . #2#)
                     (LETT |losers| (QVELT |ares| 0) . #2#)
                     (LETT |lsers| (QVELT |ares| 1) . #2#)
                     (LETT |lsere| (QVELT |ares| 2) . #2#)
                     (LETT |lser0| (QVELT |ares| 3) . #2#)
                     (LETT |nm| (SPADCALL |ker| (QREFELT $ 121)) . #2#)
                     (COND
                      ((OR (EQUAL |nm| '|besselI|) (EQUAL |nm| '|besselK|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0" $))
                         (#3#
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
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS;besselEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|kummerM|) (EQUAL |nm| '|kummerU|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS;kummerEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|whittakerM|)
                           (EQUAL |nm| '|whittakerW|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS;whittakerEq|) $)
                           $))))))
                     (COND
                      ((OR
                        (OR
                         (OR (EQUAL |nm| '|kelvinBer|)
                             (EQUAL |nm| '|kelvinBei|))
                         (EQUAL |nm| '|kelvinKer|))
                        (EQUAL |nm| '|kelvinKei|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS;kelvinEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|legendreP|) (EQUAL |nm| '|legendreQ|))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                     (|spadConstant| $ 18) (QREFELT $ 24))
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                     (SPADCALL (|spadConstant| $ 18)
                                               (QREFELT $ 124))
                                     (QREFELT $ 24)))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 123)) "expansion at +-1"
                           $))
                         ('T
                          (|FS2UPS;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS;legendreEq|) $)
                           $))))))
                     (COND
                      ((EQUAL |nm| '|lambertW|)
                       (COND
                        ((SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 96))
                                   (|spadConstant| $ 22) (QREFELT $ 24))
                         (EXIT
                          (CONS 0
                                (|FS2UPS;lambertW0|
                                 (SPADCALL |losers| 1 (QREFELT $ 91)) $)))))))
                     (EXIT
                      (COND
                       ((EQUAL |nm| '|jacobiSn|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 125) $))
                       ((EQUAL |nm| '|jacobiCn|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 126) $))
                       ((EQUAL |nm| '|jacobiDn|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 127) $))
                       ((EQUAL |nm| '|ellipticE2|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 128) $))
                       ((EQUAL |nm| '|ellipticF|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 129) $))
                       ((EQUAL |nm| '|ellipticPi|)
                        (|FS2UPS;do_ell3| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 130) $))
                       (#3#
                        (SEQ
                         (COND
                          ((EQUAL |nm| '|weierstrassP|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 131) -2 1 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassPPrime|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 132) -3 -2 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassZeta|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 133) -1 1 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassSigma|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 134) 0 0 $))))))
                         (COND
                          ((EQUAL |nm| '|Gamma|)
                           (SEQ
                            (LETT |ir|
                                  (SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 96))
                                            (QREFELT $ 136))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |ir| 0)
                               (SEQ
                                (LETT |ii|
                                      (SPADCALL (QCDR |ir|) (QREFELT $ 137))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ii| 0)
                                   (COND
                                    ((SPADCALL (QCDR |ii|) 0 (QREFELT $ 138))
                                     (SEQ
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 96))
                                            . #2#)
                                      (LETT |narg1|
                                            (SPADCALL (|spadConstant| $ 18)
                                                      |arg1| (QREFELT $ 139))
                                            . #2#)
                                      (LETT |nker|
                                            (SPADCALL
                                             (SPADCALL |ker| (QREFELT $ 108))
                                             (LIST |narg1|) (QREFELT $ 110))
                                            . #2#)
                                      (LETT |nexpr|
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 140))
                                             (SPADCALL |nker|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 140))
                                                         |arg1|
                                                         (QREFELT $ 141))
                                                        (QREFELT $ 142))
                                                       (QREFELT $ 141))
                                             (QREFELT $ 143))
                                            . #2#)
                                      (EXIT
                                       (PROGN
                                        (LETT #1#
                                              (|FS2UPS;i_expr_to_PS| |nexpr|
                                               |opt_rec| $)
                                              . #2#)
                                        (GO #1#))))))))))))))))
                         (LETT |cargs|
                               (|FS2UPS;convert_args| |lsers| |lsere| |lser0|
                                $)
                               . #2#)
                         (LETT |nargs| (QVELT |cargs| 0) . #2#)
                         (LETT |nker|
                               (SPADCALL (SPADCALL |ker| (QREFELT $ 108))
                                         |nargs| (QREFELT $ 110))
                               . #2#)
                         (EXIT
                          (|FS2UPS;do_taylor_via_deriv2| |nker|
                           (QVELT |cargs| 2) (QVELT |cargs| 1) $))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_prim| (|ker| |arg0| |opt_rec| $)
  (PROG (#1=#:G595 |ns| |nf| |c0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c0|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 108)) |arg0|
                        (QREFELT $ 144))
              . #2=(|FS2UPS;do_prim|))
        (LETT |nf|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 146)) (QREFELT $ 13)
                        (QREFELT $ 77))
              . #2#)
        (LETT |ns| (|FS2UPS;i_expr_to_PS| |nf| |opt_rec| $) . #2#)
        (EXIT
         (COND ((QEQCAR |ns| 1) (PROGN (LETT #1# |ns| . #2#) (GO #1#)))
               ('T
                (CONS 0
                      (SPADCALL (SPADCALL |c0| (QREFELT $ 73))
                                (SPADCALL (CDR |ns|) (QREFELT $ 147))
                                (QREFELT $ 51))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;prim_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|coef| #1=#:G611 |ups| #2=#:G390 |nsu| |arg| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nm| (SPADCALL |ker| (QREFELT $ 121))
              . #3=(|FS2UPS;prim_to_UPS|))
        (EXIT
         (COND
          ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 118))
           (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 123))
            "multivariate primitive" $))
          (#4='T
           (SEQ (LETT |arg| (|SPADfirst| |args|) . #3#)
                (LETT |nsu| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $) . #3#)
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
                        (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 28))
                        (|spadConstant| $ 74) (QREFELT $ 75))
                       (PROGN
                        (LETT #1#
                              (|FS2UPS;stateProblem| "handle_args"
                               "argument not Taylor" $)
                              . #3#)
                        (GO #1#)))
                      (#4#
                       (SEQ
                        (LETT |coef|
                              (SPADCALL |ups| (|spadConstant| $ 74)
                                        (QREFELT $ 20))
                              . #3#)
                        (COND
                         ((OR (EQUAL |nm| '|Ei|)
                              (OR (EQUAL |nm| '|Ci|) (EQUAL |nm| '|Chi|)))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0"
                              $))
                            (#4#
                             (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))))))
                        (COND
                         ((OR (EQUAL |nm| '|dilog|) (EQUAL |nm| '|li|))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 123)) "expansion at 0"
                              $))
                            ((SPADCALL |coef| (|spadConstant| $ 18)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 123)) "expansion at 1"
                              $))
                            (#4#
                             (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))))))
                        (COND
                         ((OR (EQUAL |nm| '|Si|)
                              (OR (EQUAL |nm| '|Shi|)
                                  (OR (EQUAL |nm| '|erf|)
                                      (OR (EQUAL |nm| '|fresnelS|)
                                          (EQUAL |nm| '|fresnelC|)))))
                          (EXIT (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))))
                        (EXIT
                         (|FS2UPS;stateProblem|
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 121))
                                    (QREFELT $ 123))
                          "unimplemented" $))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;kernelToUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G625 |n| |arg| |op| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 149)) . #2=(|FS2UPS;kernelToUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                           (QREFELT $ 62))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 146))
                           (|spadConstant| $ 74) (QREFELT $ 62))))))
        ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 150)) . #2#))
             (NULL
              (SPADCALL (QREFELT $ 13)
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 146))
                                  (QREFELT $ 71))
                        (QREFELT $ 72))))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 146)) (|spadConstant| $ 74)
                         (QREFELT $ 62))))
        ('T
         (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 108)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT $ 151))
                 (|FS2UPS;spec_to_UPS| |ker| |args| |opt_rec| $))
                ((SPADCALL |op| '|prim| (QREFELT $ 151))
                 (|FS2UPS;prim_to_UPS| |ker| |args| |opt_rec| $))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 152))
                         (|FS2UPS;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 141)) 2 |opt_rec|
                          $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 152))
                         (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|log| (QREFELT $ 152))
                         (|FS2UPS;logToUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 152))
                         (|FS2UPS;applyIfCan| (ELT $ 153) |arg| "exp" |opt_rec|
                          $))
                        (#3# (|FS2UPS;tranToUPS| |ker| |arg| |opt_rec| $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 152))
                 (|FS2UPS;powToUPS| |args| |opt_rec| $))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 152))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 154))
                                  (QREFELT $ 155))
                        . #2#)
                  (EXIT
                   (|FS2UPS;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #1# |n| . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |opt_rec| $))))
                (#3#
                 (|FS2UPS;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) (QREFELT $ 123))
                  "unknown kernel" $)))))))))))) 

(DEFUN |FS2UPS;nthRootToUPS| (|arg| |n| |opt_rec| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $)
            . #1=(|FS2UPS;nthRootToUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS;carefulNthRootIfCan| (CDR |result|) |n|
                      (QVELT |opt_rec| 0) 'NIL $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS;logToUPS| (|arg| |opt_rec| $)
  (PROG (|logTerm| |lt| #1=#:G651 #2=#:G654 #3=#:G656 |signum| |coef| |deg|
         |ups| #4=#:G390 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $)
              . #5=(|FS2UPS;logToUPS|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               (#6='T
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |ups|
                         (PROG2 (LETT #4# |result| . #5#)
                             (QCDR #4#)
                           (|check_union| (QEQCAR #4# 0) (QREFELT $ 9) #4#))
                         . #5#)
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 19)) . #5#)
                   (SEQ
                    (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20)) . #5#)
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
                              . #5#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 20))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 22)
                                     (QREFELT $ 24))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
                   (COND
                    ((NULL (QVELT |opt_rec| 2))
                     (COND
                      ((NULL (SPADCALL |deg| (QREFELT $ 33)))
                       (EXIT
                        (|FS2UPS;stateProblem| "log" "series of non-zero order"
                         $))))))
                   (COND
                    ((QVELT |opt_rec| 0)
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
                    (COND
                     ((SPADCALL |deg| (QREFELT $ 33))
                      (CONS 0
                            (PROG2
                                (LETT #1# (SPADCALL |ups| (QREFELT $ 156))
                                      . #5#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#6#
                      (SEQ
                       (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 62)) . #5#)
                       (LETT |logTerm|
                             (SPADCALL (SPADCALL |coef| (QREFELT $ 157))
                                       (SPADCALL
                                        (SPADCALL |deg| (QREFELT $ 158))
                                        (QVELT |opt_rec| 3) (QREFELT $ 141))
                                       (QREFELT $ 90))
                             . #5#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL |logTerm| (|spadConstant| $ 74)
                                         (QREFELT $ 62))
                               (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 159))
                                         (QREFELT $ 160))
                               (QREFELT $ 51))))))))))
                 #2# (EXIT #2#)))))))
      #3# (EXIT #3#))))) 

(DEFUN |FS2UPS;localAbs;2FE;33| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 161))) 

(DEFUN |FS2UPS;localAbs;2FE;34| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 141)) (QREFELT $ 163))) 

(DEFUN |FS2UPS;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 162)) |arg| (QREFELT $ 143))) 

(DEFUN |FS2UPS;atancotToUPS| (|arg| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G684 |rn| |atanFlag|
         #2=#:G682 |ord| |coef| |ups| #3=#:G390 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $)
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
                         (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 20))
                         . #4#)
                   (SEQ
                    (LETT |ord|
                          (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 28))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 164))
                       (COND
                        ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 141))
                                   (SPADCALL (|spadConstant| $ 18)
                                             (QREFELT $ 124))
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
                   (LETT |atanFlag| (QVELT |opt_rec| 1) . #4#)
                   (LETT |cc|
                         (COND
                          ((SPADCALL |ord| (|spadConstant| $ 74)
                                     (QREFELT $ 75))
                           (COND
                            ((SPADCALL |atanFlag| (CONS 0 "complex")
                                       (QREFELT $ 165))
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
                                     (SPADCALL |ord| (QREFELT $ 158)) $)
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
                                              (QREFELT $ 165))
                                    (COND
                                     ((ODDP
                                       (SPADCALL (QCDR |rn|) (QREFELT $ 167)))
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
                                                 (QREFELT $ 165))
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 140))
                                                   (SPADCALL 2 (QREFELT $ 170))
                                                   (QREFELT $ 143)))
                                        (#5# (|spadConstant| $ 22))))
                                      (#5#
                                       (SEQ
                                        (LETT |posNegPi2|
                                              (SPADCALL
                                               (SPADCALL
                                                (|FS2UPS;signOfExpression| |lc|
                                                 $)
                                                (SPADCALL (QREFELT $ 140))
                                                (QREFELT $ 141))
                                               (SPADCALL 2 (QREFELT $ 170))
                                               (QREFELT $ 143))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 140))
                                             (SPADCALL 2 (QREFELT $ 170))
                                             (QREFELT $ 143))
                                            |posNegPi2| (QREFELT $ 139)))))))))
                                    (#5#
                                     (SEQ
                                      (LETT |left?|
                                            (SPADCALL |atanFlag|
                                                      (CONS 2
                                                            "real: left side")
                                                      (QREFELT $ 165))
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
                                               (SPADCALL (QREFELT $ 140))
                                               (SPADCALL 2 (QREFELT $ 170))
                                               (QREFELT $ 143))
                                              (QREFELT $ 124)))
                                            (#5# (SPADCALL (QREFELT $ 140))))))
                                         ((NULL |left?|)
                                          (COND
                                           ((EQL |n| -1)
                                            (EXIT
                                             (COND
                                              ((EQL |plusMinus| 1)
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL (QREFELT $ 140))
                                                 (SPADCALL 2 (QREFELT $ 170))
                                                 (QREFELT $ 143))
                                                (QREFELT $ 124)))
                                              (#5#
                                               (SPADCALL
                                                (QREFELT $ 140))))))))))
                                       ((EQL |n| -1)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1)
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 140))
                                             (SPADCALL 2 (QREFELT $ 170))
                                             (QREFELT $ 143))
                                            (QREFELT $ 124)))
                                          (#5# (SPADCALL (QREFELT $ 140)))))))
                                      (EXIT
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 140))
                                                   (SPADCALL 2 (QREFELT $ 170))
                                                   (QREFELT $ 143)))
                                        (#5#
                                         (|spadConstant| $ 22))))))))))))))))
                          (#5# (SPADCALL |coef| (QREFELT $ 171))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 73))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |plusMinus|
                                                (SPADCALL |ups|
                                                          (QREFELT $ 172))
                                                (QREFELT $ 119))
                                      (SPADCALL (|spadConstant| $ 53)
                                                (SPADCALL |ups| |ups|
                                                          (QREFELT $ 54))
                                                (QREFELT $ 51))
                                      (QREFELT $ 159))
                                     (QREFELT $ 147))
                                    (QREFELT $ 51))))))
                 #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;applyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (|ans| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $)
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

(DEFUN |FS2UPS;tranToUPS| (|ker| |arg| |opt_rec| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 173) |arg| "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 174) |arg| "cos" |opt_rec| $))
   ((SPADCALL |ker| '|tan| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 175) |arg| "tan" |opt_rec| $))
   ((SPADCALL |ker| '|cot| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 176) |arg| "cot" |opt_rec| $))
   ((SPADCALL |ker| '|sec| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 177) |arg| "sec" |opt_rec| $))
   ((SPADCALL |ker| '|csc| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 178) |arg| "csc" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 179) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 180) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 152))
    (|FS2UPS;atancotToUPS| |arg| |opt_rec| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 152))
    (|FS2UPS;atancotToUPS| |arg| |opt_rec| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 181) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 182) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|sinh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 183) |arg| "sinh" |opt_rec| $))
   ((SPADCALL |ker| '|cosh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 184) |arg| "cosh" |opt_rec| $))
   ((SPADCALL |ker| '|tanh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 185) |arg| "tanh" |opt_rec| $))
   ((SPADCALL |ker| '|coth| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 186) |arg| "coth" |opt_rec| $))
   ((SPADCALL |ker| '|sech| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 187) |arg| "sech" |opt_rec| $))
   ((SPADCALL |ker| '|csch| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 188) |arg| "csch" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 189) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 190) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 191) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 192) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 193) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 152))
    (|FS2UPS;applyIfCan| (ELT $ 194) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) (QREFELT $ 123))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS;powToUPS| (|args| |opt_rec| $)
  (PROG (|ans| |expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase| (|FS2UPS;logToUPS| (|SPADfirst| |args|) |opt_rec| $)
            . #1=(|FS2UPS;powToUPS|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2UPS;i_expr_to_PS| (SPADCALL |args| (QREFELT $ 154))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL (CDR |expon|) (CDR |logBase|)
                                         (QREFELT $ 54))
                               (QREFELT $ 153))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans| 1)
                           (|FS2UPS;stateProblem| "exp" "essential singularity"
                            $))
                          (#2# (CONS 0 (QCDR |ans|))))))))))))))))) 

(DEFUN |FS2UPS;newElem| (|f| $)
  (SPADCALL (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 196)) $)
            (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 197)) $)
            (QREFELT $ 143))) 

(DEFUN |FS2UPS;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2UPS;k2Elem|) $) (ELT $ 103) |p|
            (QREFELT $ 202))) 

(DEFUN |FS2UPS;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G768 |a| #2=#:G767)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 150)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #2# (CONS (|FS2UPS;newElem| |a| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 146)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 203))
                            . #3#)
                      (QREFELT $ 204))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 142)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 205)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 152))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 143)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 152))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 143)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 152))
                  (SPADCALL |cosz| (QREFELT $ 204)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 152))
                  (SPADCALL |sinz| (QREFELT $ 204)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 152))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                            (SPADCALL 2 (QREFELT $ 170)) (QREFELT $ 143)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 152))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (SPADCALL 2 (QREFELT $ 170)) (QREFELT $ 143)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 152))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                            (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (QREFELT $ 143)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 152))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (SPADCALL |ez| |iez| (QREFELT $ 139))
                            (QREFELT $ 143)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 152))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                                      (QREFELT $ 204))
                            (QREFELT $ 206)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 152))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                                      (QREFELT $ 204))
                            (QREFELT $ 206)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 108)) |args|
                            (QREFELT $ 207))))))))))))) 

(DEFUN |FS2UPS;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 208) (QREFELT $ 211))) 

(DEFUN |FS2UPS;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 209) (QREFELT $ 211))) 

(DEFUN |FS2UPS;exprToGenUPS;FEBUU;45| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS;iExprToGenUPS| (|FS2UPS;newElem| |fcn| $)
   (VECTOR |posCheck?| |atanFlag| 'NIL (|spadConstant| $ 22)) $)) 

(DEFUN |FS2UPS;iExprToGenUPS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 43))
            . #1=(|FS2UPS;iExprToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (CONS 0
               (|FS2UPS;polyToUPS|
                (SPADCALL (QCDR |poly|) (QREFELT $ 13) (QREFELT $ 47)) $)))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 49)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS;iExprToGenUPS|) $) |opt_rec|
                  (|spadConstant| $ 50) (ELT $ 51) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 52)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS;iExprToGenUPS|) $)
                          |opt_rec| (|spadConstant| $ 53) (ELT $ 54) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS;isNonTrivPower| |fcn| $) . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS;powerToGenUPS| (QCAR |power|)
                                    (QCDR |power|) |opt_rec| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 56))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS;kernelToGenUPS| (QCDR |ker|)
                                  |opt_rec| $))
                                (#2#
                                 (|error|
                                  "exprToGenUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS;opsInvolvingX| (|fcn| $)
  (PROG (|opList| |op| #1=#:G809 |k| #2=#:G808)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 214)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 108)) . #3#)
                         (QREFELT $ 215))
                        (SPADCALL (QREFELT $ 13)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 150)))
                                   (QREFELT $ 71))
                                  (QREFELT $ 72)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 217))))))) 

(DEFUN |FS2UPS;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G811 #2=#:G813 #3=#:G814 |op|)
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
                  ((SPADCALL |op| |name| (QREFELT $ 218))
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
     (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 56)) |FS2UPS;exponential?|)
          (EXIT
           (COND
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 152)))
            ('T 'NIL))))))) 

(DEFUN |FS2UPS;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G825 #2=#:G829 #3=#:G830 |term| |prod|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|FS2UPS;exponential?| |fcn| $) 'T)
             (#4='T
              (SEQ
               (LETT |prod| (SPADCALL |fcn| (QREFELT $ 52))
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
                                               (SPADCALL |term| (QREFELT $ 71))
                                               (QREFELT $ 72))
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

(DEFUN |FS2UPS;powerToGenUPS| (|fcn| |n| |opt_rec| $)
  (PROG (|xOpList| |coef| |deg| |ups| #1=#:G390 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS;iExprToGenUPS| |fcn| |opt_rec| $)
            . #2=(|FS2UPS;powerToGenUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 67))
              (CONS 0 (SPADCALL (CDR |b|) |n| (QREFELT $ 68))))
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
                  (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68))))
                 (#3#
                  (SEQ
                   (COND
                    ((NULL (CDR |xOpList|))
                     (COND
                      ((SPADCALL (|SPADfirst| |xOpList|) '|log|
                                 (QREFELT $ 218))
                       (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68))))))))
                   (EXIT
                    (COND
                     ((|FS2UPS;productOfNonZeroes?| |coef| $)
                      (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68))))
                     (#3#
                      (|FS2UPS;stateProblem| "inv"
                       "lowest order coefficient involves x" $)))))))))))))))) 

(DEFUN |FS2UPS;kernelToGenUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G848 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 149))
            . #2=(|FS2UPS;kernelToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 97)
                           (QREFELT $ 62))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 146))
                           (|spadConstant| $ 74) (QREFELT $ 62))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 150)) . #2#))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 146)) (|spadConstant| $ 74)
                         (QREFELT $ 62))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|abs| (QREFELT $ 152))
                 (|FS2UPS;nthRootToGenUPS|
                  (SPADCALL |arg| |arg| (QREFELT $ 141)) 2 |opt_rec| $))
                ((SPADCALL |ker| '|%paren| (QREFELT $ 152))
                 (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 152))
                 (|FS2UPS;logToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 152))
                 (|FS2UPS;expToGenUPS| |arg| |opt_rec| $))
                (#3# (|FS2UPS;tranToGenUPS| |ker| |arg| |opt_rec| $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 152))
         (|FS2UPS;powToGenUPS| |args| |opt_rec| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 152))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 154)) (QREFELT $ 155))
                . #2#)
          (EXIT
           (|FS2UPS;nthRootToGenUPS| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |opt_rec| $))))
        (#3#
         (|FS2UPS;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) (QREFELT $ 123))
          "unknown kernel" $)))))))) 

(DEFUN |FS2UPS;nthRootToGenUPS| (|arg| |n| |opt_rec| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
            . #1=(|FS2UPS;nthRootToGenUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS;carefulNthRootIfCan| (CDR |result|) |n|
                      (QVELT |opt_rec| 0) 'T $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS;logToGenUPS| (|arg| |opt_rec| $)
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |cen| |lt| #1=#:G875
         #2=#:G877 |signum| |coef| |deg| |ups| #3=#:G390 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
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
                    ((QVELT |opt_rec| 0)
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
                   (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 62)) . #4#)
                   (LETT |cen| (SPADCALL |lt| (QREFELT $ 219)) . #4#)
                   (LETT |negRat?|
                         (SEQ (LETT |rat| (|FS2UPS;ratIfCan| |coef| $) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rat| 0)
                                 (COND
                                  ((SPADCALL (QCDR |rat|)
                                             (|spadConstant| $ 220)
                                             (QREFELT $ 221))
                                   'T)
                                  (#5# 'NIL)))
                                (#5# 'NIL))))
                         . #4#)
                   (LETT |logTerm|
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 13) (QREFELT $ 82)) |cen|
                                 (QREFELT $ 139))
                                . #4#)
                          (LETT |pow|
                                (SPADCALL |mon|
                                          (SPADCALL |deg| (QREFELT $ 158))
                                          (QREFELT $ 222))
                                . #4#)
                          (EXIT
                           (COND
                            (|negRat?|
                             (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 141))
                                       (QREFELT $ 157)))
                            (#5#
                             (SEQ
                              (LETT |term1|
                                    (SPADCALL (SPADCALL |deg| (QREFELT $ 158))
                                              (SPADCALL |mon| (QREFELT $ 157))
                                              (QREFELT $ 141))
                                    . #4#)
                              (EXIT
                               (SPADCALL (SPADCALL |coef| (QREFELT $ 157))
                                         |term1| (QREFELT $ 90))))))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL |logTerm| (|spadConstant| $ 74)
                                     (QREFELT $ 62))
                           (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 159))
                                     (QREFELT $ 160))
                           (QREFELT $ 51))))))
                 #1# (EXIT #1#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS;expToGenUPS| (|arg| |opt_rec| $)
  (PROG (|ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
            |FS2UPS;expToGenUPS|)
      (EXIT
       (COND ((QEQCAR |ups| 1) |ups|)
             ('T (|FS2UPS;expGenUPS| (CDR |ups|) |opt_rec| $)))))))) 

(DEFUN |FS2UPS;expGenUPS| (|ups| |opt_rec| $)
  (PROG (|result| |expCoef| |xOpList| |lc| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 97) (QREFELT $ 28))
            . #1=(|FS2UPS;expGenUPS|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 75))
         (|FS2UPS;stateProblem| "exp" "essential singularity" $))
        ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 223))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 224))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 20))
                . #1#)
          (LETT |xOpList| (|FS2UPS;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2UPS;opInOpList?| '|log| |xOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 224))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 203)) (QREFELT $ 13)
                          (QREFELT $ 226))
                . #1#)
          (EXIT
           (COND
            ((|FS2UPS;opInOpList?| '|log| (|FS2UPS;opsInvolvingX| |expCoef| $)
              $)
             (|FS2UPS;stateProblem| "exp" "logs in constant coefficient" $))
            (#2#
             (SEQ
              (LETT |result|
                    (|FS2UPS;iExprToGenUPS| (|FS2UPS;newElem| |expCoef| $)
                     |opt_rec| $)
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
                                                                           74)
                                                           (QREFELT $ 62))
                                                 (QREFELT $ 76))
                                       (QREFELT $ 224))
                                      (QREFELT $ 54)))))))))))))))))) 

(DEFUN |FS2UPS;atancotToGenUPS| (|fe| |arg| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G913 |rn| |atanFlag|
         #2=#:G911 |yCoef| |y| |ord| |coef| |ups| #3=#:G390 |trouble| |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
              . #4=(|FS2UPS;atancotToGenUPS|))
        (EXIT
         (COND
          ((QEQCAR |result| 1)
           (SEQ (LETT |trouble| (CDR |result|) . #4#)
                (EXIT
                 (COND
                  ((EQUAL (QCDR |trouble|) "essential singularity")
                   (CONS 0
                         (SPADCALL |fe| (|spadConstant| $ 74) (QREFELT $ 62))))
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
                    (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 20))
                    . #4#)
              (SEQ
               (LETT |ord|
                     (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 28))
                     . #4#)
               (EXIT
                (COND
                 ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 164))
                  (COND
                   ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 141))
                              (SPADCALL (|spadConstant| $ 18) (QREFELT $ 124))
                              (QREFELT $ 24))
                    (PROGN
                     (LETT #2#
                           (SEQ
                            (LETT |y|
                                  (SPADCALL (SPADCALL |ups| (QREFELT $ 172))
                                            (SPADCALL (|spadConstant| $ 53)
                                                      (SPADCALL |ups| |ups|
                                                                (QREFELT $ 54))
                                                      (QREFELT $ 51))
                                            (QREFELT $ 159))
                                  . #4#)
                            (LETT |yCoef|
                                  (SPADCALL |y|
                                            (SPADCALL (|spadConstant| $ 97)
                                                      (QREFELT $ 227))
                                            (QREFELT $ 20))
                                  . #4#)
                            (EXIT
                             (CONS 0
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |yCoef| (QREFELT $ 157))
                                     (|spadConstant| $ 74) (QREFELT $ 62))
                                    (SPADCALL
                                     (SPADCALL |y|
                                               (SPADCALL |yCoef|
                                                         (SPADCALL
                                                          (|spadConstant| $ 97)
                                                          (QREFELT $ 227))
                                                         (QREFELT $ 62))
                                               (QREFELT $ 76))
                                     (QREFELT $ 147))
                                    (QREFELT $ 51)))))
                           . #4#)
                     (GO #2#))))))))
              (LETT |atanFlag| (QVELT |opt_rec| 1) . #4#)
              (LETT |cc|
                    (COND
                     ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 75))
                      (COND
                       ((SPADCALL |atanFlag| (CONS 0 "complex")
                                  (QREFELT $ 165))
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
                                (SPADCALL |ord| (QREFELT $ 158)) $)
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
                                         (QREFELT $ 165))
                               (COND
                                ((ODDP (SPADCALL (QCDR |rn|) (QREFELT $ 167)))
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
                                            (QREFELT $ 165))
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 140))
                                              (SPADCALL 2 (QREFELT $ 170))
                                              (QREFELT $ 143)))
                                   (#5# (|spadConstant| $ 22))))
                                 (#5#
                                  (SEQ
                                   (LETT |posNegPi2|
                                         (SPADCALL
                                          (SPADCALL
                                           (|FS2UPS;signOfExpression| |lc| $)
                                           (SPADCALL (QREFELT $ 140))
                                           (QREFELT $ 141))
                                          (SPADCALL 2 (QREFELT $ 170))
                                          (QREFELT $ 143))
                                         . #4#)
                                   (EXIT
                                    (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 140))
                                             (SPADCALL 2 (QREFELT $ 170))
                                             (QREFELT $ 143))
                                            |posNegPi2| (QREFELT $ 139)))))))))
                               (#5#
                                (SEQ
                                 (LETT |left?|
                                       (SPADCALL |atanFlag|
                                                 (CONS 2 "real: left side")
                                                 (QREFELT $ 165))
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
                                         (SPADCALL (SPADCALL (QREFELT $ 140))
                                                   (SPADCALL 2 (QREFELT $ 170))
                                                   (QREFELT $ 143))
                                         (QREFELT $ 124)))
                                       (#5# (SPADCALL (QREFELT $ 140))))))
                                    ((NULL |left?|)
                                     (COND
                                      ((EQL |n| -1)
                                       (EXIT
                                        (COND
                                         ((EQL |plusMinus| 1)
                                          (SPADCALL
                                           (SPADCALL (SPADCALL (QREFELT $ 140))
                                                     (SPADCALL 2
                                                               (QREFELT $ 170))
                                                     (QREFELT $ 143))
                                           (QREFELT $ 124)))
                                         (#5#
                                          (SPADCALL (QREFELT $ 140))))))))))
                                  ((EQL |n| -1)
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL
                                       (SPADCALL (SPADCALL (QREFELT $ 140))
                                                 (SPADCALL 2 (QREFELT $ 170))
                                                 (QREFELT $ 143))
                                       (QREFELT $ 124)))
                                     (#5# (SPADCALL (QREFELT $ 140)))))))
                                 (EXIT
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 140))
                                              (SPADCALL 2 (QREFELT $ 170))
                                              (QREFELT $ 143)))
                                   (#5# (|spadConstant| $ 22))))))))))))))))
                     (#5# (SPADCALL |coef| (QREFELT $ 171))))
                    . #4#)
              (EXIT
               (CONS 0
                     (SPADCALL (SPADCALL |cc| (QREFELT $ 73))
                               (SPADCALL
                                (SPADCALL (SPADCALL |ups| (QREFELT $ 172))
                                          (SPADCALL (|spadConstant| $ 53)
                                                    (SPADCALL |ups| |ups|
                                                              (QREFELT $ 54))
                                                    (QREFELT $ 51))
                                          (QREFELT $ 159))
                                (QREFELT $ 147))
                               (QREFELT $ 51))))))
            #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;genUPSApplyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (#1=#:G916 |xOpList| |lc| |deg| |ups| #2=#:G390 |series|)
    (RETURN
     (SEQ
      (LETT |series| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
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
                     (SPADCALL |ups| (|spadConstant| $ 97) (QREFELT $ 28))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 75))
                  (|FS2UPS;stateProblem| |fcnName| "essential singularity" $))
                 ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 223))
                  (CONS 0
                        (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))))
                 (#4#
                  (SEQ
                   (LETT |lc|
                         (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 20))
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

(DEFUN |FS2UPS;applyBddIfCan| (|fe| |fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (|ans| |trouble| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $)
            . #1=(|FS2UPS;applyBddIfCan|))
      (EXIT
       (COND
        ((QEQCAR |ups| 1)
         (SEQ (LETT |trouble| (CDR |ups|) . #1#)
              (EXIT
               (COND
                ((EQUAL (QCDR |trouble|) "essential singularity")
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 74) (QREFELT $ 62))))
                (#2='T |ups|)))))
        (#2#
         (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 74) (QREFELT $ 62))))
                (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS;tranToGenUPS| (|ker| |arg| |opt_rec| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 152))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 146)) (ELT $ 173) |arg|
     "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 152))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 146)) (ELT $ 174) |arg|
     "cos" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 179) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 180) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 152))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 146)) |arg| |opt_rec|
     1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 152))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 146)) |arg| |opt_rec|
     -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 181) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 182) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 189) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 190) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 191) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 192) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 193) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 152))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 194) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) (QREFELT $ 123))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS;powToGenUPS| (|args| |opt_rec| $)
  (PROG (|expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase| (|FS2UPS;logToGenUPS| (|SPADfirst| |args|) |opt_rec| $)
            . #1=(|FS2UPS;powToGenUPS|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2UPS;iExprToGenUPS| (SPADCALL |args| (QREFELT $ 154))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (|FS2UPS;expGenUPS|
                        (SPADCALL (CDR |expon|) (CDR |logBase|) (QREFELT $ 54))
                        |opt_rec| $)))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries| (&REST #1=#:G967)
  (PROG ()
    (RETURN
     (PROG (#2=#:G968)
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
      (LETT $ (GETREFV 228) . #1#)
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
      (QSETREFV $ 69 (|EllipticFunctionsUnivariateTaylorSeries| |#2| |#6|))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|abs|
                              (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
        (QSETREFV $ 162
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;33|) $)))
       ('T
        (QSETREFV $ 162
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;34|) $))))
      (QSETREFV $ 208
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 209 (LIST #2# #3# #4# #5#))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) 'ZEROCOUNT
              (|Union| 166 '#1="failed") (0 . |retractIfCan|) (5 . |One|)
              (9 . |One|) (13 . |degree|) (18 . |coefficient|) (24 . |Zero|)
              (28 . |Zero|) (|Boolean|) (32 . =) (|Integer|) (38 . |coerce|)
              (43 . +) (49 . |order|) (55 . |even?|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (60 . |sign|) (65 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (70 . |nthRootIfCan|)
              (|Record| (|:| |func| 122) (|:| |prob| 122))
              (|Union| (|:| |%series| 9) (|:| |%problem| 37))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS;exprToUPS;FEBUU;4| |FS2UPS;exprToPS;FEBUBFEU;5|
              (|Union| 46 '#1#) (76 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (81 . |univariate|) (|Union| 109 '#2="failed") (87 . |isPlus|)
              (92 . |Zero|) (96 . +) (102 . |isTimes|) (107 . |One|) (111 . *)
              (|Union| 145 '#1#) (117 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 46) (122 . |zero?|)
              (127 . |degree|) (132 . |leadingCoefficient|) (137 . |coerce|)
              (142 . |monomial|) (148 . |reductum|)
              (|Record| (|:| |val| $) (|:| |exponent| 25)) (|Union| 64 '#2#)
              (153 . |isPower|) (158 . >) (164 . ^) 'ELITS (|List| 45)
              (170 . |variables|) (175 . |member?|) (181 . |coerce|)
              (186 . |Zero|) (190 . <) (196 . -) (202 . |differentiate|)
              (|List| 9) (|Mapping| 7 7) (|List| 79) (208 . |taylor_via_deriv|)
              (215 . |coerce|) (|Equation| 7) (220 . =) (|List| 113)
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
              (|Union| 6 '#1#) (455 . |retractIfCan|) (460 . |retractIfCan|)
              (465 . <=) (471 . -) (477 . |pi|) (481 . *) (487 . |sin|)
              (492 . /) (498 . |elt|) (|Kernel| $) (504 . |coerce|)
              (509 . |integrate|) (|Union| 45 '"failed") (514 . |symbolIfCan|)
              (519 . |argument|) (524 . |has?|) (530 . |is?|)
              (536 . |expIfCan|) (541 . |second|) (546 . |retract|)
              (551 . |logIfCan|) (556 . |log|) (561 . |coerce|) (566 . /)
              (572 . |log|) (577 . |abs|) (582 . |localAbs|) (587 . |sqrt|)
              (592 . =) (598 . =) (|Fraction| 25) (604 . |numer|) (609 . |pi|)
              (613 . |pi|) (617 . |coerce|) (622 . |atan|)
              (627 . |differentiate|) (632 . |sinIfCan|) (637 . |cosIfCan|)
              (642 . |tanIfCan|) (647 . |cotIfCan|) (652 . |secIfCan|)
              (657 . |cscIfCan|) (662 . |asinIfCan|) (667 . |acosIfCan|)
              (672 . |asecIfCan|) (677 . |acscIfCan|) (682 . |sinhIfCan|)
              (687 . |coshIfCan|) (692 . |tanhIfCan|) (697 . |cothIfCan|)
              (702 . |sechIfCan|) (707 . |cschIfCan|) (712 . |asinhIfCan|)
              (717 . |acoshIfCan|) (722 . |atanhIfCan|) (727 . |acothIfCan|)
              (732 . |asechIfCan|) (737 . |acschIfCan|)
              (|SparseMultivariatePolynomial| 6 145) (742 . |numer|)
              (747 . |denom|) (|Mapping| 7 107) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 107)
              (|PolynomialCategoryLifting| (|IndexedExponents| 107) 107 6 200
                                           7)
              (752 . |map|) (759 . |exp|) (764 . |inv|) (769 . |cos|) (774 . *)
              (780 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 122) (786 . |member?|)
              |FS2UPS;exprToGenUPS;FEBUU;45| (|List| 145) (792 . |tower|)
              (797 . |unary?|) (|List| 106) (802 . |removeDuplicates|)
              (807 . |is?|) (813 . |center|) (818 . |Zero|) (822 . <) (828 . ^)
              (834 . >) (840 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (845 . |normalize|)
              (851 . -))
           '#(|localAbs| 856 |exprToUPS| 861 |exprToPS| 868 |exprToGenUPS| 877)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 227
                                                 '(1 7 15 0 16 0 6 0 17 0 7 0
                                                   18 1 9 8 0 19 2 9 7 0 8 20 0
                                                   6 0 21 0 7 0 22 2 7 23 0 0
                                                   24 1 8 0 25 26 2 8 0 0 0 27
                                                   2 9 8 0 8 28 1 25 23 0 29 1
                                                   31 30 7 32 1 8 23 0 33 2 10
                                                   34 9 35 36 1 7 42 0 43 2 46
                                                   44 0 45 47 1 7 48 0 49 0 9 0
                                                   50 2 9 0 0 0 51 1 7 48 0 52
                                                   0 9 0 53 2 9 0 0 0 54 1 7 55
                                                   0 56 1 57 23 0 58 1 57 35 0
                                                   59 1 57 46 0 60 1 7 0 46 61
                                                   2 9 0 7 8 62 1 57 0 0 63 1 7
                                                   65 0 66 2 25 23 0 0 67 2 9 0
                                                   0 25 68 1 7 70 0 71 2 70 23
                                                   45 0 72 1 9 0 7 73 0 8 0 74
                                                   2 8 23 0 0 75 2 9 0 0 0 76 2
                                                   7 0 0 45 77 3 12 9 9 78 80
                                                   81 1 7 0 45 82 2 83 0 7 7 84
                                                   2 7 0 0 85 86 2 9 0 79 0 87
                                                   3 12 9 7 78 80 88 0 45 0 89
                                                   2 7 0 0 0 90 2 78 9 0 25 91
                                                   2 12 9 92 9 93 0 25 0 94 2
                                                   95 7 0 25 96 0 8 0 97 2 9 0
                                                   0 98 99 2 9 0 98 0 100 1 9 0
                                                   0 101 1 6 0 25 102 1 7 0 6
                                                   103 2 9 0 0 7 104 1 95 7 0
                                                   105 1 107 106 0 108 2 7 0
                                                   106 109 110 1 6 0 0 111 2 9
                                                   0 0 0 112 2 7 0 0 113 114 3
                                                   12 9 78 9 95 115 1 116 11 11
                                                   117 2 25 23 0 0 118 2 9 0 25
                                                   0 119 0 98 0 120 1 107 45 0
                                                   121 1 45 122 0 123 1 7 0 0
                                                   124 2 69 11 11 7 125 2 69 11
                                                   11 7 126 2 69 11 11 7 127 2
                                                   69 11 11 7 128 2 69 11 11 7
                                                   129 3 69 11 11 7 7 130 3 116
                                                   11 7 7 11 131 3 116 11 7 7
                                                   11 132 3 116 11 7 7 11 133 3
                                                   116 11 7 7 11 134 1 7 135 0
                                                   136 1 6 30 0 137 2 25 23 0 0
                                                   138 2 7 0 0 0 139 0 7 0 140
                                                   2 7 0 0 0 141 1 7 0 0 142 2
                                                   7 0 0 0 143 2 7 0 106 0 144
                                                   1 7 0 145 146 1 9 0 0 147 1
                                                   107 148 0 149 1 107 95 0 150
                                                   2 106 23 0 45 151 2 107 23 0
                                                   45 152 1 10 34 9 153 1 95 7
                                                   0 154 1 7 25 0 155 1 10 34 9
                                                   156 1 7 0 0 157 1 7 0 8 158
                                                   2 9 0 0 0 159 1 9 0 0 160 1
                                                   7 0 0 161 1 0 7 7 162 1 7 0
                                                   0 163 2 8 23 0 0 164 2 39 23
                                                   0 0 165 1 166 25 0 167 0 9 0
                                                   168 0 11 0 169 1 7 0 25 170
                                                   1 7 0 0 171 1 9 0 0 172 1 10
                                                   34 9 173 1 10 34 9 174 1 10
                                                   34 9 175 1 10 34 9 176 1 10
                                                   34 9 177 1 10 34 9 178 1 10
                                                   34 9 179 1 10 34 9 180 1 10
                                                   34 9 181 1 10 34 9 182 1 10
                                                   34 9 183 1 10 34 9 184 1 10
                                                   34 9 185 1 10 34 9 186 1 10
                                                   34 9 187 1 10 34 9 188 1 10
                                                   34 9 189 1 10 34 9 190 1 10
                                                   34 9 191 1 10 34 9 192 1 10
                                                   34 9 193 1 10 34 9 194 1 7
                                                   195 0 196 1 7 195 0 197 3
                                                   201 7 198 199 200 202 1 7 0
                                                   0 203 1 7 0 0 204 1 7 0 0
                                                   205 2 7 0 98 0 206 2 7 0 106
                                                   109 207 2 210 23 122 0 211 1
                                                   7 213 0 214 1 106 23 0 215 1
                                                   216 0 0 217 2 106 23 0 45
                                                   218 1 9 7 0 219 0 166 0 220
                                                   2 166 23 0 0 221 2 7 0 0 0
                                                   222 2 8 23 0 0 223 1 9 0 0
                                                   224 2 225 7 7 45 226 1 8 0 0
                                                   227 1 0 7 7 162 3 0 38 7 23
                                                   39 40 5 0 38 7 23 39 23 7 41
                                                   3 0 38 7 23 39 212)))))
           '|lookupComplete|)) 
