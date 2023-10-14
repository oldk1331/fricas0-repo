
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
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;besselEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 101)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 101))
                       (SPADCALL |v| 2 (QREFELT $ 101)) (QREFELT $ 102)))))))) 

(DEFUN |FS2UPS;besselEqm| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;besselEqm|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 101)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 101))
                       (SPADCALL |v| 2 (QREFELT $ 101)) (QREFELT $ 99)))))))) 

(DEFUN |FS2UPS;kelvinEq| (|lc| |z0| $)
  (PROG (|v2| |zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;kelvinEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (LETT |v2|
            (SPADCALL (|spadConstant| $ 103)
                      (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 101))
                                (QREFELT $ 104))
                      (QREFELT $ 99))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 4 (QREFELT $ 101))
             (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 101)) (QREFELT $ 104))
             (SPADCALL
              (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT $ 101))
                        (QREFELT $ 105))
              (QREFELT $ 106))
             (SPADCALL |v2| |zvar| (QREFELT $ 105))
             (SPADCALL
              (SPADCALL (SPADCALL |v| 2 (QREFELT $ 101))
                        (SPADCALL 4 (SPADCALL |v| 2 (QREFELT $ 101))
                                  (QREFELT $ 104))
                        (QREFELT $ 102))
              (SPADCALL |zvar| 4 (QREFELT $ 101)) (QREFELT $ 99)))))))) 

(DEFUN |FS2UPS;kummerEq| (|lc| |z0| $)
  (PROG (|zvar| |b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;kummerEq|))
      (LETT |b| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 97))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (EXIT
       (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 102))
             (SPADCALL |a| (QREFELT $ 106)))))))) 

(DEFUN |FS2UPS;legendreEq| (|lc| |z0| $)
  (PROG (|z2| |zvar| |mu| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;legendreEq|))
      (LETT |mu| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 97))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (LETT |z2|
            (SPADCALL (|spadConstant| $ 103)
                      (SPADCALL |zvar| 2 (QREFELT $ 101)) (QREFELT $ 102))
            . #1#)
      (EXIT
       (LIST (SPADCALL |z2| 2 (QREFELT $ 101))
             (SPADCALL
              (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 104)) |z2|
                        (QREFELT $ 105))
              (QREFELT $ 106))
             (SPADCALL
              (SPADCALL
               (SPADCALL |nu|
                         (SPADCALL |nu| (|spadConstant| $ 103) (QREFELT $ 99))
                         (QREFELT $ 105))
               |z2| (QREFELT $ 105))
              |mu| (QREFELT $ 102)))))))) 

(DEFUN |FS2UPS;whittakerEq| (|lc| |z0| $)
  (PROG (|zvar| |o4| |m| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 96)) (QREFELT $ 97))
            . #1=(|FS2UPS;whittakerEq|))
      (LETT |m| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 96)) (QREFELT $ 97))
            . #1#)
      (LETT |o4|
            (SPADCALL (|spadConstant| $ 103)
                      (SPADCALL (SPADCALL 4 (QREFELT $ 108)) (QREFELT $ 109))
                      (QREFELT $ 110))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 98))
                      (SPADCALL |z0| (QREFELT $ 97)) (QREFELT $ 99))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 101)) (|spadConstant| $ 111)
             (SPADCALL
              (SPADCALL
               (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 101)) (QREFELT $ 102))
               (SPADCALL |k| |zvar| (QREFELT $ 105)) (QREFELT $ 99))
              (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 101))
                        (SPADCALL (SPADCALL 4 (QREFELT $ 108)) (QREFELT $ 109))
                        (QREFELT $ 110))
              (QREFELT $ 102)))))))) 

(DEFUN |FS2UPS;do_diff_eq| (|ker| |losers| |lsers| |lsere| |lser0| |getEq| $)
  (PROG (|ups| |lc| #1=#:G476 |c| #2=#:G475 |nker| #3=#:G474 |lsyms| |sym|
         |ecl| #4=#:G473 #5=#:G472 |cn1| |cn1u| |cn| |z0| |nargs| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs| (|FS2UPS;convert_args| |lsers| |lsere| |lser0| $)
            . #6=(|FS2UPS;do_diff_eq|))
      (LETT |nargs| (QVELT |cargs| 0) . #6#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| (QREFELT $ 112)) (|spadConstant| $ 22)
                   (QREFELT $ 24))
         (SEQ
          (LETT |nker|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 115)) |nargs|
                          (QREFELT $ 117))
                . #6#)
          (EXIT
           (|FS2UPS;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))
        (#7='T
         (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 112)) . #6#)
              (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|) . #6#)
              (LETT |cn| (|SPADfirst| |ecl|) . #6#)
              (LETT |cn1u| (SPADCALL |cn| (QREFELT $ 119)) . #6#)
              (EXIT
               (COND
                ((QEQCAR |cn1u| 1)
                 (|error| "do_diff_eq: called at singular point"))
                (#7#
                 (SEQ
                  (LETT |cn1| (SPADCALL (QCDR |cn1u|) (QREFELT $ 106)) . #6#)
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
                                      (CONS
                                       (SPADCALL |c| |cn1| (QREFELT $ 105))
                                       #5#)
                                      . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        . #6#)
                  (LETT |nker|
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 115)) |nargs|
                                  (QREFELT $ 117))
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
                        (LETT |nker| (SPADCALL |nker| |sym| (QREFELT $ 77))
                              . #6#)
                        (EXIT (LETT |lc| (CONS |nker| |lc|) . #6#)))
                       (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                  (LETT |lc|
                        (PROGN
                         (LETT #2# NIL . #6#)
                         (SEQ (LETT |c| NIL . #6#)
                              (LETT #1# (NREVERSE |lc|) . #6#) G190
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
                                                  (SPADCALL |sym|
                                                            (QREFELT $ 82))
                                                  (|spadConstant| $ 22)
                                                  (QREFELT $ 84))
                                                 (QREFELT $ 121))
                                       #2#)
                                      . #6#)))
                              (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #6#)
                  (LETT |ups|
                        (SPADCALL (REVERSE |ecl|)
                                  (|SPADfirst| (QVELT |cargs| 1)) |lc|
                                  (QREFELT $ 123))
                        . #6#)
                  (EXIT
                   (|FS2UPS;do_taylor_via_deriv| |ups| |lsyms| |lsers|
                    $)))))))))))))) 

(DEFUN |FS2UPS;lambertW0| (|arg| $) (SPADCALL (ELT $ 125) |arg| (QREFELT $ 93))) 

(DEFUN |FS2UPS;do_weierstrass|
       (|losers| |lsers| |lsere| |lser0| |ef| |k| |cz| $)
  (PROG (#1=#:G484 |nres2| |lsyms| |nres| |nargs| |cargs| |z_inv| |coef| |deg|
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
           ((SPADCALL |cz| 0 (QREFELT $ 126))
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
                                (QREFELT $ 127))
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
      (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 128) (QREFELT $ 96))
                (SPADCALL |nargs| 2 (QREFELT $ 96)) |f| |ef|))))) 

(DEFUN |FS2UPS;spec_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|nker| |nargs| |cargs| #1=#:G596 |nexpr| |narg1| |arg1| |ii| |ir| |nm|
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
                     (LETT |nm| (SPADCALL |ker| (QREFELT $ 129)) . #2#)
                     (COND
                      ((OR (EQUAL |nm| '|besselI|) (EQUAL |nm| '|besselK|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 96))
                                    (|spadConstant| $ 22) (QREFELT $ 24))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0" $))
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
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0" $))
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
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0" $))
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
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0" $))
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
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0" $))
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
                                               (QREFELT $ 132))
                                     (QREFELT $ 24)))
                          (|FS2UPS;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 131)) "expansion at +-1"
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
                         (ELT $ 133) $))
                       ((EQUAL |nm| '|jacobiCn|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 134) $))
                       ((EQUAL |nm| '|jacobiDn|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 135) $))
                       ((EQUAL |nm| '|ellipticE2|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 136) $))
                       ((EQUAL |nm| '|ellipticF|)
                        (|FS2UPS;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 137) $))
                       ((EQUAL |nm| '|ellipticPi|)
                        (|FS2UPS;do_ell3| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 138) $))
                       (#3#
                        (SEQ
                         (COND
                          ((EQUAL |nm| '|weierstrassP|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 139) -2 1 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassPPrime|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 140) -3 -2 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassZeta|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 141) -1 1 $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassSigma|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 96))
                                       (|spadConstant| $ 22) (QREFELT $ 24))
                             (EXIT
                              (|FS2UPS;do_weierstrass| |losers| |lsers| |lsere|
                               |lser0| (ELT $ 142) 0 0 $))))))
                         (COND
                          ((EQUAL |nm| '|Gamma|)
                           (SEQ
                            (LETT |ir|
                                  (SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 96))
                                            (QREFELT $ 144))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |ir| 0)
                               (SEQ
                                (LETT |ii|
                                      (SPADCALL (QCDR |ir|) (QREFELT $ 145))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ii| 0)
                                   (COND
                                    ((SPADCALL (QCDR |ii|) 0 (QREFELT $ 146))
                                     (SEQ
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 96))
                                            . #2#)
                                      (LETT |narg1|
                                            (SPADCALL (|spadConstant| $ 18)
                                                      |arg1| (QREFELT $ 147))
                                            . #2#)
                                      (LETT |nker|
                                            (SPADCALL
                                             (SPADCALL |ker| (QREFELT $ 115))
                                             (LIST |narg1|) (QREFELT $ 117))
                                            . #2#)
                                      (LETT |nexpr|
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 148))
                                             (SPADCALL |nker|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 148))
                                                         |arg1|
                                                         (QREFELT $ 149))
                                                        (QREFELT $ 150))
                                                       (QREFELT $ 149))
                                             (QREFELT $ 151))
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
                               (SPADCALL (SPADCALL |ker| (QREFELT $ 115))
                                         |nargs| (QREFELT $ 117))
                               . #2#)
                         (EXIT
                          (|FS2UPS;do_taylor_via_deriv2| |nker|
                           (QVELT |cargs| 2) (QVELT |cargs| 1) $))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;do_prim| (|ker| |arg0| |opt_rec| $)
  (PROG (#1=#:G599 |ns| |nf| |c0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c0|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 115)) |arg0|
                        (QREFELT $ 152))
              . #2=(|FS2UPS;do_prim|))
        (LETT |nf|
              (SPADCALL (SPADCALL |ker| (QREFELT $ 154)) (QREFELT $ 13)
                        (QREFELT $ 77))
              . #2#)
        (LETT |ns| (|FS2UPS;i_expr_to_PS| |nf| |opt_rec| $) . #2#)
        (EXIT
         (COND ((QEQCAR |ns| 1) (PROGN (LETT #1# |ns| . #2#) (GO #1#)))
               ('T
                (CONS 0
                      (SPADCALL (SPADCALL |c0| (QREFELT $ 73))
                                (SPADCALL (CDR |ns|) (QREFELT $ 155))
                                (QREFELT $ 51))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;prim_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|coef| #1=#:G615 |ups| #2=#:G390 |nsu| |arg| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nm| (SPADCALL |ker| (QREFELT $ 129))
              . #3=(|FS2UPS;prim_to_UPS|))
        (EXIT
         (COND
          ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 126))
           (|FS2UPS;stateProblem| (SPADCALL |nm| (QREFELT $ 131))
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
                              (OR (EQUAL |nm| '|Ci|)
                                  (OR (EQUAL |nm| '|Chi|)
                                      (EQUAL |nm| '|dilog|))))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0"
                              $))
                            (#4#
                             (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))))))
                        (EXIT
                         (COND
                          ((EQUAL |nm| '|li|)
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 22)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 131)) "expansion at 0"
                              $))
                            ((SPADCALL |coef| (|spadConstant| $ 18)
                                       (QREFELT $ 24))
                             (|FS2UPS;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 131)) "expansion at 1"
                              $))
                            (#4# (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))))
                          ((OR (EQUAL |nm| '|Si|)
                               (OR (EQUAL |nm| '|Shi|)
                                   (OR (EQUAL |nm| '|erf|)
                                       (OR (EQUAL |nm| '|fresnelS|)
                                           (EQUAL |nm| '|fresnelC|)))))
                           (|FS2UPS;do_prim| |ker| |coef| |opt_rec| $))
                          ('T
                           (|FS2UPS;stateProblem|
                            (SPADCALL (SPADCALL |ker| (QREFELT $ 129))
                                      (QREFELT $ 131))
                            "unimplemented" $))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;kernelToUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G629 |n| |arg| |op| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 157)) . #2=(|FS2UPS;kernelToUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 107)
                           (QREFELT $ 62))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 154))
                           (|spadConstant| $ 74) (QREFELT $ 62))))))
        ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 158)) . #2#))
             (NULL
              (SPADCALL (QREFELT $ 13)
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 154))
                                  (QREFELT $ 71))
                        (QREFELT $ 72))))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 154)) (|spadConstant| $ 74)
                         (QREFELT $ 62))))
        ('T
         (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 115)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT $ 159))
                 (|FS2UPS;spec_to_UPS| |ker| |args| |opt_rec| $))
                ((SPADCALL |op| '|prim| (QREFELT $ 159))
                 (|FS2UPS;prim_to_UPS| |ker| |args| |opt_rec| $))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 160))
                         (|FS2UPS;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 149)) 2 |opt_rec|
                          $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 160))
                         (|FS2UPS;i_expr_to_PS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|log| (QREFELT $ 160))
                         (|FS2UPS;logToUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 160))
                         (|FS2UPS;applyIfCan| (ELT $ 161) |arg| "exp" |opt_rec|
                          $))
                        (#3# (|FS2UPS;tranToUPS| |ker| |arg| |opt_rec| $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 160))
                 (|FS2UPS;powToUPS| |args| |opt_rec| $))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 160))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 162))
                                  (QREFELT $ 163))
                        . #2#)
                  (EXIT
                   (|FS2UPS;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #1# |n| . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |opt_rec| $))))
                (#3#
                 (|FS2UPS;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 129)) (QREFELT $ 131))
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
  (PROG (|logTerm| |lt| #1=#:G655 #2=#:G658 #3=#:G660 |signum| |coef| |deg|
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
                                (LETT #1# (SPADCALL |ups| (QREFELT $ 164))
                                      . #5#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#6#
                      (SEQ
                       (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 62)) . #5#)
                       (LETT |logTerm|
                             (SPADCALL (SPADCALL |coef| (QREFELT $ 165))
                                       (SPADCALL
                                        (SPADCALL |deg| (QREFELT $ 166))
                                        (QVELT |opt_rec| 3) (QREFELT $ 149))
                                       (QREFELT $ 90))
                             . #5#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL |logTerm| (|spadConstant| $ 74)
                                         (QREFELT $ 62))
                               (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 167))
                                         (QREFELT $ 168))
                               (QREFELT $ 51))))))))))
                 #2# (EXIT #2#)))))))
      #3# (EXIT #3#))))) 

(DEFUN |FS2UPS;localAbs;2FE;33| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 169))) 

(DEFUN |FS2UPS;localAbs;2FE;34| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 149)) (QREFELT $ 171))) 

(DEFUN |FS2UPS;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 170)) |arg| (QREFELT $ 151))) 

(DEFUN |FS2UPS;atancotToUPS| (|arg| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G688 |rn| |atanFlag|
         #2=#:G686 |ord| |coef| |ups| #3=#:G390 |result|)
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
                      ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 172))
                       (COND
                        ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 149))
                                   (SPADCALL (|spadConstant| $ 18)
                                             (QREFELT $ 132))
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
                                       (QREFELT $ 173))
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
                                     (SPADCALL |ord| (QREFELT $ 166)) $)
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
                                              (QREFELT $ 173))
                                    (COND
                                     ((ODDP
                                       (SPADCALL (QCDR |rn|) (QREFELT $ 175)))
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
                                                 (QREFELT $ 173))
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 148))
                                                   (SPADCALL 2 (QREFELT $ 178))
                                                   (QREFELT $ 151)))
                                        (#5# (|spadConstant| $ 22))))
                                      (#5#
                                       (SEQ
                                        (LETT |posNegPi2|
                                              (SPADCALL
                                               (SPADCALL
                                                (|FS2UPS;signOfExpression| |lc|
                                                 $)
                                                (SPADCALL (QREFELT $ 148))
                                                (QREFELT $ 149))
                                               (SPADCALL 2 (QREFELT $ 178))
                                               (QREFELT $ 151))
                                              . #4#)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 148))
                                             (SPADCALL 2 (QREFELT $ 178))
                                             (QREFELT $ 151))
                                            |posNegPi2| (QREFELT $ 147)))))))))
                                    (#5#
                                     (SEQ
                                      (LETT |left?|
                                            (SPADCALL |atanFlag|
                                                      (CONS 2
                                                            "real: left side")
                                                      (QREFELT $ 173))
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
                                               (SPADCALL (QREFELT $ 148))
                                               (SPADCALL 2 (QREFELT $ 178))
                                               (QREFELT $ 151))
                                              (QREFELT $ 132)))
                                            (#5# (SPADCALL (QREFELT $ 148))))))
                                         ((NULL |left?|)
                                          (COND
                                           ((EQL |n| -1)
                                            (EXIT
                                             (COND
                                              ((EQL |plusMinus| 1)
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL (QREFELT $ 148))
                                                 (SPADCALL 2 (QREFELT $ 178))
                                                 (QREFELT $ 151))
                                                (QREFELT $ 132)))
                                              (#5#
                                               (SPADCALL
                                                (QREFELT $ 148))))))))))
                                       ((EQL |n| -1)
                                        (EXIT
                                         (COND
                                          ((EQL |plusMinus| 1)
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 148))
                                             (SPADCALL 2 (QREFELT $ 178))
                                             (QREFELT $ 151))
                                            (QREFELT $ 132)))
                                          (#5# (SPADCALL (QREFELT $ 148)))))))
                                      (EXIT
                                       (COND
                                        ((EQL |plusMinus| 1)
                                         (SPADCALL (SPADCALL (QREFELT $ 148))
                                                   (SPADCALL 2 (QREFELT $ 178))
                                                   (QREFELT $ 151)))
                                        (#5#
                                         (|spadConstant| $ 22))))))))))))))))
                          ((EQL |plusMinus| 1)
                           (SPADCALL |coef| (QREFELT $ 179)))
                          (#5# (SPADCALL |coef| (QREFELT $ 180))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 73))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |plusMinus|
                                                (SPADCALL |ups|
                                                          (QREFELT $ 181))
                                                (QREFELT $ 127))
                                      (SPADCALL (|spadConstant| $ 53)
                                                (SPADCALL |ups| |ups|
                                                          (QREFELT $ 54))
                                                (QREFELT $ 51))
                                      (QREFELT $ 167))
                                     (QREFELT $ 155))
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
   ((SPADCALL |ker| '|sin| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 182) |arg| "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 183) |arg| "cos" |opt_rec| $))
   ((SPADCALL |ker| '|tan| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 184) |arg| "tan" |opt_rec| $))
   ((SPADCALL |ker| '|cot| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 185) |arg| "cot" |opt_rec| $))
   ((SPADCALL |ker| '|sec| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 186) |arg| "sec" |opt_rec| $))
   ((SPADCALL |ker| '|csc| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 187) |arg| "csc" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 188) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 189) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 160))
    (|FS2UPS;atancotToUPS| |arg| |opt_rec| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 160))
    (|FS2UPS;atancotToUPS| |arg| |opt_rec| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 190) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 191) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|sinh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 192) |arg| "sinh" |opt_rec| $))
   ((SPADCALL |ker| '|cosh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 193) |arg| "cosh" |opt_rec| $))
   ((SPADCALL |ker| '|tanh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 194) |arg| "tanh" |opt_rec| $))
   ((SPADCALL |ker| '|coth| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 195) |arg| "coth" |opt_rec| $))
   ((SPADCALL |ker| '|sech| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 196) |arg| "sech" |opt_rec| $))
   ((SPADCALL |ker| '|csch| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 197) |arg| "csch" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 198) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 199) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 200) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 201) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 202) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 160))
    (|FS2UPS;applyIfCan| (ELT $ 203) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 129)) (QREFELT $ 131))
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
                     (|FS2UPS;i_expr_to_PS| (SPADCALL |args| (QREFELT $ 162))
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
                               (QREFELT $ 161))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans| 1)
                           (|FS2UPS;stateProblem| "exp" "essential singularity"
                            $))
                          (#2# (CONS 0 (QCDR |ans|))))))))))))))))) 

(DEFUN |FS2UPS;newElem| (|f| $)
  (SPADCALL (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 205)) $)
            (|FS2UPS;smpElem| (SPADCALL |f| (QREFELT $ 206)) $)
            (QREFELT $ 151))) 

(DEFUN |FS2UPS;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2UPS;k2Elem|) $) (ELT $ 109) |p|
            (QREFELT $ 211))) 

(DEFUN |FS2UPS;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G772 |a| #2=#:G771)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 158)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #2# (CONS (|FS2UPS;newElem| |a| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 154)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 212))
                            . #3#)
                      (QREFELT $ 213))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 150)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 214)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 160))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 151)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 160))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 151)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 160))
                  (SPADCALL |cosz| (QREFELT $ 213)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 160))
                  (SPADCALL |sinz| (QREFELT $ 213)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 160))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 147))
                            (SPADCALL 2 (QREFELT $ 178)) (QREFELT $ 151)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 160))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (SPADCALL 2 (QREFELT $ 178)) (QREFELT $ 151)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 160))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 147))
                            (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (QREFELT $ 151)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 160))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                            (SPADCALL |ez| |iez| (QREFELT $ 147))
                            (QREFELT $ 151)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 160))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 90))
                                      (QREFELT $ 213))
                            (QREFELT $ 215)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 160))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 147))
                                      (QREFELT $ 213))
                            (QREFELT $ 215)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 115)) |args|
                            (QREFELT $ 216))))))))))))) 

(DEFUN |FS2UPS;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 217) (QREFELT $ 220))) 

(DEFUN |FS2UPS;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 218) (QREFELT $ 220))) 

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
  (PROG (|opList| |op| #1=#:G813 |k| #2=#:G812)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 223)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 115)) . #3#)
                         (QREFELT $ 224))
                        (SPADCALL (QREFELT $ 13)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 158)))
                                   (QREFELT $ 71))
                                  (QREFELT $ 72)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 226))))))) 

(DEFUN |FS2UPS;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G815 #2=#:G817 #3=#:G818 |op|)
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
                  ((SPADCALL |op| |name| (QREFELT $ 227))
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
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 160)))
            ('T 'NIL))))))) 

(DEFUN |FS2UPS;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G829 #2=#:G833 #3=#:G834 |term| |prod|)
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
                                 (QREFELT $ 227))
                       (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68))))))))
                   (EXIT
                    (COND
                     ((|FS2UPS;productOfNonZeroes?| |coef| $)
                      (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 68))))
                     (#3#
                      (|FS2UPS;stateProblem| "inv"
                       "lowest order coefficient involves x" $)))))))))))))))) 

(DEFUN |FS2UPS;kernelToGenUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G852 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 157))
            . #2=(|FS2UPS;kernelToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 13))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 107)
                           (QREFELT $ 62))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 154))
                           (|spadConstant| $ 74) (QREFELT $ 62))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 158)) . #2#))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 154)) (|spadConstant| $ 74)
                         (QREFELT $ 62))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|abs| (QREFELT $ 160))
                 (|FS2UPS;nthRootToGenUPS|
                  (SPADCALL |arg| |arg| (QREFELT $ 149)) 2 |opt_rec| $))
                ((SPADCALL |ker| '|%paren| (QREFELT $ 160))
                 (|FS2UPS;iExprToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 160))
                 (|FS2UPS;logToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 160))
                 (|FS2UPS;expToGenUPS| |arg| |opt_rec| $))
                (#3# (|FS2UPS;tranToGenUPS| |ker| |arg| |opt_rec| $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 160))
         (|FS2UPS;powToGenUPS| |args| |opt_rec| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 160))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 162)) (QREFELT $ 163))
                . #2#)
          (EXIT
           (|FS2UPS;nthRootToGenUPS| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |opt_rec| $))))
        (#3#
         (|FS2UPS;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 129)) (QREFELT $ 131))
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
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |cen| |lt| #1=#:G879
         #2=#:G881 |signum| |coef| |deg| |ups| #3=#:G390 |result|)
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
                   (LETT |cen| (SPADCALL |lt| (QREFELT $ 228)) . #4#)
                   (LETT |negRat?|
                         (SEQ (LETT |rat| (|FS2UPS;ratIfCan| |coef| $) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rat| 0)
                                 (COND
                                  ((SPADCALL (QCDR |rat|)
                                             (|spadConstant| $ 229)
                                             (QREFELT $ 230))
                                   'T)
                                  (#5# 'NIL)))
                                (#5# 'NIL))))
                         . #4#)
                   (LETT |logTerm|
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 13) (QREFELT $ 82)) |cen|
                                 (QREFELT $ 147))
                                . #4#)
                          (LETT |pow|
                                (SPADCALL |mon|
                                          (SPADCALL |deg| (QREFELT $ 166))
                                          (QREFELT $ 231))
                                . #4#)
                          (EXIT
                           (COND
                            (|negRat?|
                             (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 149))
                                       (QREFELT $ 165)))
                            (#5#
                             (SEQ
                              (LETT |term1|
                                    (SPADCALL (SPADCALL |deg| (QREFELT $ 166))
                                              (SPADCALL |mon| (QREFELT $ 165))
                                              (QREFELT $ 149))
                                    . #4#)
                              (EXIT
                               (SPADCALL (SPADCALL |coef| (QREFELT $ 165))
                                         |term1| (QREFELT $ 90))))))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL |logTerm| (|spadConstant| $ 74)
                                     (QREFELT $ 62))
                           (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 167))
                                     (QREFELT $ 168))
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
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 107) (QREFELT $ 28))
            . #1=(|FS2UPS;expGenUPS|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 75))
         (|FS2UPS;stateProblem| "exp" "essential singularity" $))
        ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 232))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 233))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 74) (QREFELT $ 20))
                . #1#)
          (LETT |xOpList| (|FS2UPS;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2UPS;opInOpList?| '|log| |xOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 233))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 212)) (QREFELT $ 13)
                          (QREFELT $ 235))
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
                                       (QREFELT $ 233))
                                      (QREFELT $ 54)))))))))))))))))) 

(DEFUN |FS2UPS;atancotToGenUPS| (|fe| |arg| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G917 |rn| |atanFlag|
         #2=#:G915 |yCoef| |y| |ord| |coef| |ups| #3=#:G390 |trouble| |result|)
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
                 ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 172))
                  (COND
                   ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 149))
                              (SPADCALL (|spadConstant| $ 18) (QREFELT $ 132))
                              (QREFELT $ 24))
                    (PROGN
                     (LETT #2#
                           (SEQ
                            (LETT |y|
                                  (SPADCALL (SPADCALL |ups| (QREFELT $ 181))
                                            (SPADCALL (|spadConstant| $ 53)
                                                      (SPADCALL |ups| |ups|
                                                                (QREFELT $ 54))
                                                      (QREFELT $ 51))
                                            (QREFELT $ 167))
                                  . #4#)
                            (LETT |yCoef|
                                  (SPADCALL |y|
                                            (SPADCALL (|spadConstant| $ 107)
                                                      (QREFELT $ 236))
                                            (QREFELT $ 20))
                                  . #4#)
                            (EXIT
                             (CONS 0
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |yCoef| (QREFELT $ 165))
                                     (|spadConstant| $ 74) (QREFELT $ 62))
                                    (SPADCALL
                                     (SPADCALL |y|
                                               (SPADCALL |yCoef|
                                                         (SPADCALL
                                                          (|spadConstant| $
                                                                          107)
                                                          (QREFELT $ 236))
                                                         (QREFELT $ 62))
                                               (QREFELT $ 76))
                                     (QREFELT $ 155))
                                    (QREFELT $ 51)))))
                           . #4#)
                     (GO #2#))))))))
              (LETT |atanFlag| (QVELT |opt_rec| 1) . #4#)
              (LETT |cc|
                    (COND
                     ((SPADCALL |ord| (|spadConstant| $ 74) (QREFELT $ 75))
                      (COND
                       ((SPADCALL |atanFlag| (CONS 0 "complex")
                                  (QREFELT $ 173))
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
                                (SPADCALL |ord| (QREFELT $ 166)) $)
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
                                         (QREFELT $ 173))
                               (COND
                                ((ODDP (SPADCALL (QCDR |rn|) (QREFELT $ 175)))
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
                                            (QREFELT $ 173))
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 148))
                                              (SPADCALL 2 (QREFELT $ 178))
                                              (QREFELT $ 151)))
                                   (#5# (|spadConstant| $ 22))))
                                 (#5#
                                  (SEQ
                                   (LETT |posNegPi2|
                                         (SPADCALL
                                          (SPADCALL
                                           (|FS2UPS;signOfExpression| |lc| $)
                                           (SPADCALL (QREFELT $ 148))
                                           (QREFELT $ 149))
                                          (SPADCALL 2 (QREFELT $ 178))
                                          (QREFELT $ 151))
                                         . #4#)
                                   (EXIT
                                    (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                          (#5#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 148))
                                             (SPADCALL 2 (QREFELT $ 178))
                                             (QREFELT $ 151))
                                            |posNegPi2| (QREFELT $ 147)))))))))
                               (#5#
                                (SEQ
                                 (LETT |left?|
                                       (SPADCALL |atanFlag|
                                                 (CONS 2 "real: left side")
                                                 (QREFELT $ 173))
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
                                         (SPADCALL (SPADCALL (QREFELT $ 148))
                                                   (SPADCALL 2 (QREFELT $ 178))
                                                   (QREFELT $ 151))
                                         (QREFELT $ 132)))
                                       (#5# (SPADCALL (QREFELT $ 148))))))
                                    ((NULL |left?|)
                                     (COND
                                      ((EQL |n| -1)
                                       (EXIT
                                        (COND
                                         ((EQL |plusMinus| 1)
                                          (SPADCALL
                                           (SPADCALL (SPADCALL (QREFELT $ 148))
                                                     (SPADCALL 2
                                                               (QREFELT $ 178))
                                                     (QREFELT $ 151))
                                           (QREFELT $ 132)))
                                         (#5#
                                          (SPADCALL (QREFELT $ 148))))))))))
                                  ((EQL |n| -1)
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL
                                       (SPADCALL (SPADCALL (QREFELT $ 148))
                                                 (SPADCALL 2 (QREFELT $ 178))
                                                 (QREFELT $ 151))
                                       (QREFELT $ 132)))
                                     (#5# (SPADCALL (QREFELT $ 148)))))))
                                 (EXIT
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL (SPADCALL (QREFELT $ 148))
                                              (SPADCALL 2 (QREFELT $ 178))
                                              (QREFELT $ 151)))
                                   (#5# (|spadConstant| $ 22))))))))))))))))
                     (#5# (SPADCALL |coef| (QREFELT $ 179))))
                    . #4#)
              (EXIT
               (CONS 0
                     (SPADCALL (SPADCALL |cc| (QREFELT $ 73))
                               (SPADCALL
                                (SPADCALL (SPADCALL |ups| (QREFELT $ 181))
                                          (SPADCALL (|spadConstant| $ 53)
                                                    (SPADCALL |ups| |ups|
                                                              (QREFELT $ 54))
                                                    (QREFELT $ 51))
                                          (QREFELT $ 167))
                                (QREFELT $ 155))
                               (QREFELT $ 51))))))
            #2# (EXIT #2#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS;genUPSApplyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (#1=#:G920 |xOpList| |lc| |deg| |ups| #2=#:G390 |series|)
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
                     (SPADCALL |ups| (|spadConstant| $ 107) (QREFELT $ 28))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 75))
                  (|FS2UPS;stateProblem| |fcnName| "essential singularity" $))
                 ((SPADCALL |deg| (|spadConstant| $ 74) (QREFELT $ 232))
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
   ((SPADCALL |ker| '|sin| (QREFELT $ 160))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 154)) (ELT $ 182) |arg|
     "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 160))
    (|FS2UPS;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 154)) (ELT $ 183) |arg|
     "cos" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 188) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 189) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 160))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 154)) |arg| |opt_rec|
     1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 160))
    (|FS2UPS;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 154)) |arg| |opt_rec|
     -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 190) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 191) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 198) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 199) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 200) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 201) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 202) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 160))
    (|FS2UPS;genUPSApplyIfCan| (ELT $ 203) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 129)) (QREFELT $ 131))
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
                     (|FS2UPS;iExprToGenUPS| (SPADCALL |args| (QREFELT $ 162))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (|FS2UPS;expGenUPS|
                        (SPADCALL (CDR |expon|) (CDR |logBase|) (QREFELT $ 54))
                        |opt_rec| $)))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries| (&REST #1=#:G971)
  (PROG ()
    (RETURN
     (PROG (#2=#:G972)
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
      (LETT $ (GETREFV 237) . #1#)
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
        (QSETREFV $ 170
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;33|) $)))
       ('T
        (QSETREFV $ 170
                  (CONS (|dispatchFunction| |FS2UPS;localAbs;2FE;34|) $))))
      (QSETREFV $ 217
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 218 (LIST #2# #3# #4# #5#))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) 'ZEROCOUNT
              (|Union| 174 '#1="failed") (0 . |retractIfCan|) (5 . |One|)
              (9 . |One|) (13 . |degree|) (18 . |coefficient|) (24 . |Zero|)
              (28 . |Zero|) (|Boolean|) (32 . =) (|Integer|) (38 . |coerce|)
              (43 . +) (49 . |order|) (55 . |even?|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (60 . |sign|) (65 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (70 . |nthRootIfCan|)
              (|Record| (|:| |func| 130) (|:| |prob| 130))
              (|Union| (|:| |%series| 9) (|:| |%problem| 37))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS;exprToUPS;FEBUU;4| |FS2UPS;exprToPS;FEBUBFEU;5|
              (|Union| 46 '#1#) (76 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (81 . |univariate|) (|Union| 116 '#2="failed") (87 . |isPlus|)
              (92 . |Zero|) (96 . +) (102 . |isTimes|) (107 . |One|) (111 . *)
              (|Union| 153 '#1#) (117 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 46) (122 . |zero?|)
              (127 . |degree|) (132 . |leadingCoefficient|) (137 . |coerce|)
              (142 . |monomial|) (148 . |reductum|)
              (|Record| (|:| |val| $) (|:| |exponent| 25)) (|Union| 64 '#2#)
              (153 . |isPower|) (158 . >) (164 . ^) 'ELITS (|List| 45)
              (170 . |variables|) (175 . |member?|) (181 . |coerce|)
              (186 . |Zero|) (190 . <) (196 . -) (202 . |differentiate|)
              (|List| 9) (|Mapping| 7 7) (|List| 79) (208 . |taylor_via_deriv|)
              (215 . |coerce|) (|Equation| 7) (220 . =) (|List| 120)
              (226 . |eval|) (232 . |map|) (238 . |taylor_via_deriv|)
              (245 . |new|) (249 . +) (255 . |elt|) (|Mapping| 11 11)
              (261 . |applyTaylor|) (267 . |One|) (|List| 7) (271 . |elt|)
              (277 . |coerce|) (282 . |monomial|) (288 . +) (|PositiveInteger|)
              (294 . ^) (300 . -) (306 . |One|) (310 . *) (316 . *) (322 . -)
              (327 . |One|) (331 . |coerce|) (336 . |coerce|) (341 . /)
              (347 . |Zero|) (351 . |last|) (|BasicOperator|) (|Kernel| 7)
              (356 . |operator|) (|List| $) (361 . |kernel|)
              (|Union| $ '"failed") (367 . |recip|) (|Equation| $)
              (372 . |eval|) (|List| 11) (378 . |taylor_via_lode|)
              (|SpecialFunctionUnivariateTaylorSeries| 7 11)
              (385 . |lambertW0|) (390 . ~=) (396 . *) (402 . |One|)
              (406 . |name|) (|String|) (411 . |string|) (416 . -)
              (421 . |jacobiSn|) (427 . |jacobiCn|) (433 . |jacobiDn|)
              (439 . |ellipticE|) (445 . |ellipticF|) (451 . |ellipticPi|)
              (458 . |weierstrassP0|) (465 . |weierstrassPPrime0|)
              (472 . |weierstrassZeta0|) (479 . |weierstrassSigma0|)
              (|Union| 6 '#1#) (486 . |retractIfCan|) (491 . |retractIfCan|)
              (496 . <=) (502 . -) (508 . |pi|) (512 . *) (518 . |sin|)
              (523 . /) (529 . |elt|) (|Kernel| $) (535 . |coerce|)
              (540 . |integrate|) (|Union| 45 '"failed") (545 . |symbolIfCan|)
              (550 . |argument|) (555 . |has?|) (561 . |is?|)
              (567 . |expIfCan|) (572 . |second|) (577 . |retract|)
              (582 . |logIfCan|) (587 . |log|) (592 . |coerce|) (597 . /)
              (603 . |log|) (608 . |abs|) (613 . |localAbs|) (618 . |sqrt|)
              (623 . =) (629 . =) (|Fraction| 25) (635 . |numer|) (640 . |pi|)
              (644 . |pi|) (648 . |coerce|) (653 . |atan|) (658 . |acot|)
              (663 . |differentiate|) (668 . |sinIfCan|) (673 . |cosIfCan|)
              (678 . |tanIfCan|) (683 . |cotIfCan|) (688 . |secIfCan|)
              (693 . |cscIfCan|) (698 . |asinIfCan|) (703 . |acosIfCan|)
              (708 . |asecIfCan|) (713 . |acscIfCan|) (718 . |sinhIfCan|)
              (723 . |coshIfCan|) (728 . |tanhIfCan|) (733 . |cothIfCan|)
              (738 . |sechIfCan|) (743 . |cschIfCan|) (748 . |asinhIfCan|)
              (753 . |acoshIfCan|) (758 . |atanhIfCan|) (763 . |acothIfCan|)
              (768 . |asechIfCan|) (773 . |acschIfCan|)
              (|SparseMultivariatePolynomial| 6 153) (778 . |numer|)
              (783 . |denom|) (|Mapping| 7 114) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 114)
              (|PolynomialCategoryLifting| (|IndexedExponents| 114) 114 6 209
                                           7)
              (788 . |map|) (795 . |exp|) (800 . |inv|) (805 . |cos|) (810 . *)
              (816 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 130) (822 . |member?|)
              |FS2UPS;exprToGenUPS;FEBUU;45| (|List| 153) (828 . |tower|)
              (833 . |unary?|) (|List| 113) (838 . |removeDuplicates|)
              (843 . |is?|) (849 . |center|) (854 . |Zero|) (858 . <) (864 . ^)
              (870 . >) (876 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (881 . |normalize|)
              (887 . -))
           '#(|localAbs| 892 |exprToUPS| 897 |exprToPS| 904 |exprToGenUPS| 913)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 236
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
                                                   95 7 0 25 96 1 11 0 7 97 2
                                                   11 0 7 35 98 2 11 0 0 0 99 2
                                                   11 0 0 100 101 2 11 0 0 0
                                                   102 0 11 0 103 2 11 0 100 0
                                                   104 2 11 0 0 0 105 1 11 0 0
                                                   106 0 8 0 107 1 6 0 25 108 1
                                                   7 0 6 109 2 11 0 0 7 110 0
                                                   11 0 111 1 95 7 0 112 1 114
                                                   113 0 115 2 7 0 113 116 117
                                                   1 11 118 0 119 2 7 0 0 120
                                                   121 3 12 9 122 9 95 123 1
                                                   124 11 11 125 2 25 23 0 0
                                                   126 2 9 0 25 0 127 0 100 0
                                                   128 1 114 45 0 129 1 45 130
                                                   0 131 1 7 0 0 132 2 69 11 11
                                                   7 133 2 69 11 11 7 134 2 69
                                                   11 11 7 135 2 69 11 11 7 136
                                                   2 69 11 11 7 137 3 69 11 11
                                                   7 7 138 3 124 11 7 7 11 139
                                                   3 124 11 7 7 11 140 3 124 11
                                                   7 7 11 141 3 124 11 7 7 11
                                                   142 1 7 143 0 144 1 6 30 0
                                                   145 2 25 23 0 0 146 2 7 0 0
                                                   0 147 0 7 0 148 2 7 0 0 0
                                                   149 1 7 0 0 150 2 7 0 0 0
                                                   151 2 7 0 113 0 152 1 7 0
                                                   153 154 1 9 0 0 155 1 114
                                                   156 0 157 1 114 95 0 158 2
                                                   113 23 0 45 159 2 114 23 0
                                                   45 160 1 10 34 9 161 1 95 7
                                                   0 162 1 7 25 0 163 1 10 34 9
                                                   164 1 7 0 0 165 1 7 0 8 166
                                                   2 9 0 0 0 167 1 9 0 0 168 1
                                                   7 0 0 169 1 0 7 7 170 1 7 0
                                                   0 171 2 8 23 0 0 172 2 39 23
                                                   0 0 173 1 174 25 0 175 0 9 0
                                                   176 0 11 0 177 1 7 0 25 178
                                                   1 7 0 0 179 1 7 0 0 180 1 9
                                                   0 0 181 1 10 34 9 182 1 10
                                                   34 9 183 1 10 34 9 184 1 10
                                                   34 9 185 1 10 34 9 186 1 10
                                                   34 9 187 1 10 34 9 188 1 10
                                                   34 9 189 1 10 34 9 190 1 10
                                                   34 9 191 1 10 34 9 192 1 10
                                                   34 9 193 1 10 34 9 194 1 10
                                                   34 9 195 1 10 34 9 196 1 10
                                                   34 9 197 1 10 34 9 198 1 10
                                                   34 9 199 1 10 34 9 200 1 10
                                                   34 9 201 1 10 34 9 202 1 10
                                                   34 9 203 1 7 204 0 205 1 7
                                                   204 0 206 3 210 7 207 208
                                                   209 211 1 7 0 0 212 1 7 0 0
                                                   213 1 7 0 0 214 2 7 0 100 0
                                                   215 2 7 0 113 116 216 2 219
                                                   23 130 0 220 1 7 222 0 223 1
                                                   113 23 0 224 1 225 0 0 226 2
                                                   113 23 0 45 227 1 9 7 0 228
                                                   0 174 0 229 2 174 23 0 0 230
                                                   2 7 0 0 0 231 2 8 23 0 0 232
                                                   1 9 0 0 233 2 234 7 7 45 235
                                                   1 8 0 0 236 1 0 7 7 170 3 0
                                                   38 7 23 39 40 5 0 38 7 23 39
                                                   23 7 41 3 0 38 7 23 39
                                                   221)))))
           '|lookupComplete|)) 
