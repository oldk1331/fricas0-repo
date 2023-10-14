
(/VERSIONCHECK 2) 

(DEFUN |FS2UPS2;ratIfCan| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 17))) 

(DEFUN |FS2UPS2;check_inverse| (|coef| |opt_rec| $)
  (PROG (#1=#:G301)
    (RETURN
     (COND
      ((QEQCAR (QVELT |opt_rec| 3) 0)
       (SPADCALL |coef|
                 (PROG2 (LETT #1# (QVELT |opt_rec| 3) |FS2UPS2;check_inverse|)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|Mapping| (|Boolean|) (QREFELT $ 7)) #1#))))
      ('T 'T))))) 

(DEFUN |FS2UPS2;carefulNthRootIfCan| (|ups| |n| |opt_rec| |rightOnly?| $)
  (PROG (|ans| #1=#:G325 |signum| |coef| |deg| |posCheck?|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |posCheck?| (QVELT |opt_rec| 0)
              . #2=(|FS2UPS2;carefulNthRootIfCan|))
        (EXIT
         (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
               (#3='T
                (SEQ (LETT |deg| (SPADCALL |ups| (QREFELT $ 20)) . #2#)
                     (SEQ
                      (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21)) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                         (SEQ
                          (LETT |deg|
                                (SPADCALL |ups|
                                          (SPADCALL |deg|
                                                    (SPADCALL (QREFELT $ 15)
                                                              (QREFELT $ 27))
                                                    (QREFELT $ 28))
                                          (QREFELT $ 29))
                                . #2#)
                          (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 23)
                                       (QREFELT $ 25))
                             (|error|
                              "log of series with many leading zero coefficients")))))))))
                     (COND
                      ((SPADCALL |n| (QREFELT $ 30))
                       (COND
                        (|posCheck?|
                         (SEQ
                          (LETT |signum| (SPADCALL |coef| (QREFELT $ 33))
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |signum| 0)
                             (COND
                              ((EQL (QCDR |signum|) -1)
                               (PROGN
                                (LETT #1#
                                      (|FS2UPS2;stateProblem| "nth root"
                                       "negative leading coefficient" $)
                                      . #2#)
                                (GO #1#)))
                              ((NULL |rightOnly?|)
                               (COND
                                ((NULL (SPADCALL |deg| (QREFELT $ 34)))
                                 (PROGN
                                  (LETT #1#
                                        (|FS2UPS2;stateProblem| "nth root"
                                         "series of non-zero order" $)
                                        . #2#)
                                  (GO #1#))))))))))))))
                     (COND
                      ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                       (EXIT
                        (|FS2UPS2;stateProblem| "nth root"
                         "need to invert bad coefficient" $))))
                     (LETT |ans| (SPADCALL |ups| |n| (QREFELT $ 37)) . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |ans| 1)
                        (|FS2UPS2;stateProblem| "nth root" "no nth root" $))
                       (#3# (CONS 0 (QCDR |ans|)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;stateProblem| (|function| |problem| $)
  (CONS 1 (CONS |function| |problem|))) 

(DEFUN |FS2UPS2;exprToUPS;FEBUU;5| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none") 'NIL
           (|spadConstant| $ 23))
   $)) 

(DEFUN |FS2UPS2;exprToPS;FEBUBFEU;6|
       (|fcn| |posCheck?| |atanFlag| |log_flag| |log_val| $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none") |log_flag|
           |log_val|)
   $)) 

(DEFUN |FS2UPS2;exprToPS;FEBUBFE2MU;7|
       (|fcn| |posCheck?| |atanFlag| |log_flag| |log_val| |coef_chk| |inv_chk|
        $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 0 |coef_chk|) (CONS 0 |inv_chk|)
           |log_flag| |log_val|)
   $)) 

(DEFUN |FS2UPS2;i_expr_to_PS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 46))
            . #1=(|FS2UPS2;i_expr_to_PS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (|FS2UPS2;polyToUPS|
          (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 50)) |opt_rec| $))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 52)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS2;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS2;i_expr_to_PS|) $) |opt_rec|
                  (|spadConstant| $ 53) (ELT $ 54) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 55)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS2;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS2;i_expr_to_PS|) $)
                          |opt_rec| (|spadConstant| $ 56) (ELT $ 57) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS2;isNonTrivPower| |fcn| $)
                                . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS2;powerToUPS| (QCAR |power|)
                                    (QCDR |power|) |opt_rec| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 59))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS2;kernelToUPS| (QCDR |ker|) |opt_rec|
                                  $))
                                (#2#
                                 (|error|
                                  "exprToUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS2;polyToUPS| (|poly| |opt_rec| $)
  (PROG (|ans| #1=#:G428 #2=#:G415 |coef| |deg|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |poly| (QREFELT $ 61)) (CONS 0 (|spadConstant| $ 53)))
             ('T
              (SEQ
               (LETT |deg| (SPADCALL |poly| (QREFELT $ 62))
                     . #3=(|FS2UPS2;polyToUPS|))
               (LETT |coef|
                     (SPADCALL (SPADCALL |poly| (QREFELT $ 63)) (QREFELT $ 64))
                     . #3#)
               (COND
                ((QEQCAR (QVELT |opt_rec| 2) 0)
                 (COND
                  ((NULL
                    (SPADCALL |coef|
                              (PROG2 (LETT #2# (QVELT |opt_rec| 2) . #3#)
                                  (QCDR #2#)
                                (|check_union| (QEQCAR #2# 0)
                                               (|Mapping| (|Boolean|)
                                                          (QREFELT $ 7))
                                               #2#))))
                   (PROGN
                    (LETT #1#
                          (|FS2UPS2;stateProblem| "polyToUPS" "bad coeff" $)
                          . #3#)
                    (GO #1#))))))
               (LETT |ans|
                     (SPADCALL |coef| (SPADCALL |deg| (QREFELT $ 27))
                               (QREFELT $ 65))
                     . #3#)
               (LETT |poly| (SPADCALL |poly| (QREFELT $ 66)) . #3#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL |poly| (QREFELT $ 61)) 'NIL) ('T 'T)))
                      (GO G191)))
                    (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 62)) . #3#)
                         (LETT |coef|
                               (SPADCALL (SPADCALL |poly| (QREFELT $ 63))
                                         (QREFELT $ 64))
                               . #3#)
                         (COND
                          ((QEQCAR (QVELT |opt_rec| 2) 0)
                           (COND
                            ((NULL
                              (SPADCALL |coef|
                                        (PROG2
                                            (LETT #2# (QVELT |opt_rec| 2)
                                                  . #3#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (|Mapping| (|Boolean|)
                                                                    (QREFELT $
                                                                             7))
                                                         #2#))))
                             (PROGN
                              (LETT #1#
                                    (|FS2UPS2;stateProblem| "polyToUPS"
                                     "bad coeff" $)
                                    . #3#)
                              (GO #1#))))))
                         (LETT |ans|
                               (SPADCALL |ans|
                                         (SPADCALL |coef|
                                                   (SPADCALL |deg|
                                                             (QREFELT $ 27))
                                                   (QREFELT $ 65))
                                         (QREFELT $ 54))
                               . #3#)
                         (EXIT
                          (LETT |poly| (SPADCALL |poly| (QREFELT $ 66))
                                . #3#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 |ans|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;listToUPS| (|list| |feToUPS| |opt_rec| |ans| |op| $)
  (PROG (#1=#:G437 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190 (COND ((NULL (COND ((NULL |list|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ
              (LETT |term| (SPADCALL (|SPADfirst| |list|) |opt_rec| |feToUPS|)
                    . #2=(|FS2UPS2;listToUPS|))
              (EXIT
               (COND
                ((QEQCAR |term| 1) (PROGN (LETT #1# |term| . #2#) (GO #1#)))
                ('T
                 (SEQ (LETT |ans| (SPADCALL |ans| (CDR |term|) |op|) . #2#)
                      (EXIT (LETT |list| (CDR |list|) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;isNonTrivPower| (|fcn| $)
  (PROG (|power| |expt|)
    (RETURN
     (SEQ
      (LETT |expt| (SPADCALL |fcn| (QREFELT $ 69))
            . #1=(|FS2UPS2;isNonTrivPower|))
      (EXIT
       (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |power| (QCDR |expt|) . #1#)
                   (EXIT
                    (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                          (#2# (CONS 0 |power|)))))))))))) 

(DEFUN |FS2UPS2;powerToUPS| (|fcn| |n| |opt_rec| $)
  (PROG (|coef| |deg| |ups| #1=#:G446 #2=#:G452 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS2;i_expr_to_PS| |fcn| |opt_rec| $)
            . #3=(|FS2UPS2;powerToUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 70))
              (CONS 0
                    (SPADCALL (CDR |b|)
                              (PROG1 (LETT #2# |n| . #3#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#))
                              (QREFELT $ 71))))
             ('T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #1# |b| . #3#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                     . #3#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 20)) . #3#)
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 27))
                                                  (QREFELT $ 28))
                                        (QREFELT $ 29))
                              . #3#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 23)
                                     (QREFELT $ 25))
                           (|error|
                            "inverse of series with many leading zero coefficients")))))))))
               (COND
                ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                 (EXIT
                  (|FS2UPS2;stateProblem| "power"
                   "need to invert bad coefficient" $))))
               (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 72)))))))))))) 

(DEFUN |FS2UPS2;handle_args| (|args| |opt_rec| $)
  (PROG (|lsers| |lsere| |lcoef| |losers| |coef| #1=#:G474 |ups| #2=#:G461
         |nsu| #3=#:G475 |arg|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |losers| NIL . #4=(|FS2UPS2;handle_args|))
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
                      (SPADCALL (QREFELT $ 14) (SPADCALL |arg| (QREFELT $ 75))
                                (QREFELT $ 76)))
                     (SEQ
                      (LETT |losers|
                            (CONS (SPADCALL |arg| (QREFELT $ 77)) |losers|)
                            . #4#)
                      (LETT |lsers| (CONS (|spadConstant| $ 53) |lsers|) . #4#)
                      (LETT |lsere| (CONS (|spadConstant| $ 23) |lsere|) . #4#)
                      (EXIT (LETT |lcoef| (CONS |arg| |lcoef|) . #4#))))
                    ('T
                     (SEQ
                      (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
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
                              (SPADCALL |ups| (|spadConstant| $ 78)
                                        (QREFELT $ 29))
                              (|spadConstant| $ 78) (QREFELT $ 79))
                             (PROGN
                              (LETT #1#
                                    (CONS 1
                                          (|FS2UPS2;stateProblem| "handle_args"
                                           "argument not Taylor" $))
                                    . #4#)
                              (GO #1#)))
                            ('T
                             (SEQ
                              (LETT |coef|
                                    (SPADCALL |ups| (|spadConstant| $ 78)
                                              (QREFELT $ 21))
                                    . #4#)
                              (LETT |losers| (CONS |ups| |losers|) . #4#)
                              (LETT |lcoef| (CONS |coef| |lcoef|) . #4#)
                              (LETT |lsere|
                                    (CONS (|spadConstant| $ 19) |lsere|) . #4#)
                              (EXIT
                               (LETT |lsers|
                                     (CONS
                                      (SPADCALL |ups|
                                                (SPADCALL |coef|
                                                          (QREFELT $ 77))
                                                (QREFELT $ 80))
                                      |lsers|)
                                     . #4#)))))))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS 0
                   (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                           (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv| (|nf| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G489 |sym| #2=#:G488)
    (RETURN
     (SEQ
      (LETT |lders|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;do_taylor_via_deriv|))
             (SEQ (LETT |sym| NIL . #3#) (LETT #1# |lsyms| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS #'|FS2UPS2;do_taylor_via_deriv!0|
                                 (VECTOR $ |sym|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT $ 85)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS2;do_taylor_via_deriv!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 91)))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G485 |sym| #3=#:G484)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 86))
                                             (|spadConstant| $ 23)
                                             (QREFELT $ 88))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 90))))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 81)))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2| (|nk| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G503 |sym| #2=#:G502)
    (RETURN
     (SEQ
      (LETT |lders|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;do_taylor_via_deriv2|))
             (SEQ (LETT |sym| NIL . #3#) (LETT #1# |lsyms| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS #'|FS2UPS2;do_taylor_via_deriv2!0|
                                 (VECTOR $ |sym|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT $ 92)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS2;do_taylor_via_deriv2!1| (VECTOR $ |lsyms|))
              |ups| (QREFELT $ 91)))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G499 |sym| #3=#:G498)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 86))
                                             (|spadConstant| $ 23)
                                             (QREFELT $ 88))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 90))))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 81)))))) 

(DEFUN |FS2UPS2;convert_args| (|lsers| |lsere| |lser0| $)
  (PROG (|nargs| |lser| |lsyms| |nsym| #1=#:G509 |s| #2=#:G510 |e| #3=#:G511
         |c|)
    (RETURN
     (SEQ (LETT |lsyms| NIL . #4=(|FS2UPS2;convert_args|))
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
                  ((SPADCALL |e| (|spadConstant| $ 23) (QREFELT $ 25))
                   (LETT |nargs| (CONS |c| |nargs|) . #4#))
                  ('T
                   (SEQ (LETT |nsym| (SPADCALL (QREFELT $ 93)) . #4#)
                        (LETT |nargs|
                              (CONS
                               (SPADCALL |c| (SPADCALL |nsym| (QREFELT $ 86))
                                         (QREFELT $ 94))
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

(DEFUN |FS2UPS2;do_ell| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG (|nres| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs|
            (|FS2UPS2;convert_args| (CDR |lsers|) (CDR |lsere|) (CDR |lser0|)
             $)
            . #1=(|FS2UPS2;do_ell|))
      (LETT |nres|
            (SPADCALL (CONS #'|FS2UPS2;do_ell!0| (VECTOR |ef| |cargs|))
                      (SPADCALL |losers| 1 (QREFELT $ 95)) (QREFELT $ 97))
            . #1#)
      (EXIT
       (|FS2UPS2;do_taylor_via_deriv| |nres| (QVELT |cargs| 2)
        (QVELT |cargs| 1) $)))))) 

(DEFUN |FS2UPS2;do_ell!0| (|f| $$)
  (PROG (|cargs| |ef|)
    (LETT |cargs| (QREFELT $$ 1) . #1=(|FS2UPS2;do_ell|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| (QVELT |cargs| 0) |ef|))))) 

(DEFUN |FS2UPS2;do_ell2| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG ()
    (RETURN
     (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
      (CONS #'|FS2UPS2;do_ell2!0| (VECTOR |ef| $)) $)))) 

(DEFUN |FS2UPS2;do_ell2!0| (|f| |l| $$)
  (PROG ($ |ef|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS2UPS2;do_ell2|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 98) (QREFELT $ 100))
                |ef|))))) 

(DEFUN |FS2UPS2;do_ell3| (|losers| |lsers| |lsere| |lser0| |ef| $)
  (PROG ()
    (RETURN
     (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
      (CONS #'|FS2UPS2;do_ell3!0| (VECTOR |ef| $)) $)))) 

(DEFUN |FS2UPS2;do_ell3!0| (|f| |l| $$)
  (PROG ($ |ef|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS2UPS2;do_ell3|))
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 98) (QREFELT $ 100))
                (SPADCALL |l| 2 (QREFELT $ 100)) |ef|))))) 

(DEFUN |FS2UPS2;besselEq| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;besselEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 105)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 105))
                       (SPADCALL |v| 2 (QREFELT $ 105)) (QREFELT $ 106)))))))) 

(DEFUN |FS2UPS2;besselEqm| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;besselEqm|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 105)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 105))
                       (SPADCALL |v| 2 (QREFELT $ 105)) (QREFELT $ 103)))))))) 

(DEFUN |FS2UPS2;kelvinEq| (|lc| |z0| $)
  (PROG (|v2| |zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;kelvinEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (LETT |v2|
            (SPADCALL (|spadConstant| $ 107)
                      (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 105))
                                (QREFELT $ 108))
                      (QREFELT $ 103))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 4 (QREFELT $ 105))
             (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 105)) (QREFELT $ 108))
             (SPADCALL
              (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT $ 105))
                        (QREFELT $ 109))
              (QREFELT $ 110))
             (SPADCALL |v2| |zvar| (QREFELT $ 109))
             (SPADCALL
              (SPADCALL (SPADCALL |v| 2 (QREFELT $ 105))
                        (SPADCALL 4 (SPADCALL |v| 2 (QREFELT $ 105))
                                  (QREFELT $ 108))
                        (QREFELT $ 106))
              (SPADCALL |zvar| 4 (QREFELT $ 105)) (QREFELT $ 103)))))))) 

(DEFUN |FS2UPS2;kummerEq| (|lc| |z0| $)
  (PROG (|zvar| |b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;kummerEq|))
      (LETT |b| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 100)) (QREFELT $ 101))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (EXIT
       (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 106))
             (SPADCALL |a| (QREFELT $ 110)))))))) 

(DEFUN |FS2UPS2;legendreEq| (|lc| |z0| $)
  (PROG (|z2| |zvar| |mu| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;legendreEq|))
      (LETT |mu| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 100)) (QREFELT $ 101))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (LETT |z2|
            (SPADCALL (|spadConstant| $ 107)
                      (SPADCALL |zvar| 2 (QREFELT $ 105)) (QREFELT $ 106))
            . #1#)
      (EXIT
       (LIST (SPADCALL |z2| 2 (QREFELT $ 105))
             (SPADCALL
              (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 108)) |z2|
                        (QREFELT $ 109))
              (QREFELT $ 110))
             (SPADCALL
              (SPADCALL
               (SPADCALL |nu|
                         (SPADCALL |nu| (|spadConstant| $ 107) (QREFELT $ 103))
                         (QREFELT $ 109))
               |z2| (QREFELT $ 109))
              |mu| (QREFELT $ 106)))))))) 

(DEFUN |FS2UPS2;whittakerEq| (|lc| |z0| $)
  (PROG (|zvar| |o4| |m| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 100)) (QREFELT $ 101))
            . #1=(|FS2UPS2;whittakerEq|))
      (LETT |m| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 100)) (QREFELT $ 101))
            . #1#)
      (LETT |o4|
            (SPADCALL (|spadConstant| $ 107)
                      (SPADCALL (SPADCALL 4 (QREFELT $ 112)) (QREFELT $ 113))
                      (QREFELT $ 114))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 102))
                      (SPADCALL |z0| (QREFELT $ 101)) (QREFELT $ 103))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 105)) (|spadConstant| $ 115)
             (SPADCALL
              (SPADCALL
               (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 105)) (QREFELT $ 106))
               (SPADCALL |k| |zvar| (QREFELT $ 109)) (QREFELT $ 103))
              (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 105))
                        (SPADCALL (SPADCALL 4 (QREFELT $ 112)) (QREFELT $ 113))
                        (QREFELT $ 114))
              (QREFELT $ 106)))))))) 

(DEFUN |FS2UPS2;do_diff_eq| (|ker| |losers| |lsers| |lsere| |lser0| |getEq| $)
  (PROG (|ups| |lc| #1=#:G547 |c| #2=#:G546 |nker| #3=#:G545 |lsyms| |sym|
         |ecl| #4=#:G544 #5=#:G543 |cn1| |cn1u| |cn| |z0| |nargs| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $)
            . #6=(|FS2UPS2;do_diff_eq|))
      (LETT |nargs| (QVELT |cargs| 0) . #6#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| (QREFELT $ 116)) (|spadConstant| $ 23)
                   (QREFELT $ 25))
         (SEQ
          (LETT |nker|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 119)) |nargs|
                          (QREFELT $ 121))
                . #6#)
          (EXIT
           (|FS2UPS2;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))
        (#7='T
         (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 116)) . #6#)
              (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|) . #6#)
              (LETT |cn| (|SPADfirst| |ecl|) . #6#)
              (LETT |cn1u| (SPADCALL |cn| (QREFELT $ 123)) . #6#)
              (EXIT
               (COND
                ((QEQCAR |cn1u| 1)
                 (|error| "do_diff_eq: called at singular point"))
                (#7#
                 (SEQ
                  (LETT |cn1| (SPADCALL (QCDR |cn1u|) (QREFELT $ 110)) . #6#)
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
                                       (SPADCALL |c| |cn1| (QREFELT $ 109))
                                       #5#)
                                      . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        . #6#)
                  (LETT |nker|
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 119)) |nargs|
                                  (QREFELT $ 121))
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
                        (LETT |nker| (SPADCALL |nker| |sym| (QREFELT $ 81))
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
                                                            (QREFELT $ 86))
                                                  (|spadConstant| $ 23)
                                                  (QREFELT $ 88))
                                                 (QREFELT $ 125))
                                       #2#)
                                      . #6#)))
                              (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #6#)
                  (LETT |ups|
                        (SPADCALL (REVERSE |ecl|)
                                  (|SPADfirst| (QVELT |cargs| 1)) |lc|
                                  (QREFELT $ 127))
                        . #6#)
                  (EXIT
                   (|FS2UPS2;do_taylor_via_deriv| |ups| |lsyms| |lsers|
                    $)))))))))))))) 

(DEFUN |FS2UPS2;lambertW0| (|arg| $)
  (SPADCALL (ELT $ 129) |arg| (QREFELT $ 97))) 

(DEFUN |FS2UPS2;do_weierstrass|
       (|losers| |lsers| |lsere| |lser0| |ef| |k| |cz| |opt_rec| $)
  (PROG (#1=#:G558 |nres2| |lsyms| |nres| |nargs| |cargs| |z_inv| |coef| |deg|
         |z_ser|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| 3 (QREFELT $ 100)) (|spadConstant| $ 23)
                   (QREFELT $ 25))
         (|error| "expansion at 0"))
        (#2='T
         (SEQ
          (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT $ 95))
                . #3=(|FS2UPS2;do_weierstrass|))
          (COND
           ((SPADCALL |cz| 0 (QREFELT $ 130))
            (SEQ
             (LETT |deg|
                   (SPADCALL |z_ser| (SPADCALL (QREFELT $ 15) (QREFELT $ 27))
                             (QREFELT $ 29))
                   . #3#)
             (LETT |coef| (SPADCALL |z_ser| |deg| (QREFELT $ 21)) . #3#)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                (|error|
                 "inverse of series with many leading zero coefficients"))
               (#2#
                (SEQ
                 (COND
                  ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                   (PROGN
                    (LETT #1#
                          (|FS2UPS2;stateProblem| "weierstrass"
                           "need to invert bad coefficient" $)
                          . #3#)
                    (GO #1#))))
                 (EXIT
                  (LETT |z_inv|
                        (SPADCALL |cz| (SPADCALL |z_ser| |k| (QREFELT $ 72))
                                  (QREFELT $ 131))
                        . #3#))))))))
           (#2# (LETT |z_inv| (|spadConstant| $ 53) . #3#)))
          (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $)
                . #3#)
          (LETT |nargs| (QVELT |cargs| 0) . #3#)
          (LETT |nres|
                (SPADCALL
                 (CONS #'|FS2UPS2;do_weierstrass!0| (VECTOR |ef| $ |nargs|))
                 |z_ser| (QREFELT $ 97))
                . #3#)
          (LETT |lsyms| (CDR (QVELT |cargs| 2)) . #3#)
          (LETT |lsers| (CDR (QVELT |cargs| 1)) . #3#)
          (LETT |nres2|
                (|FS2UPS2;do_taylor_via_deriv| |nres| |lsyms| |lsers| $) . #3#)
          (EXIT
           (COND ((QEQCAR |nres2| 1) (PROGN (LETT #1# |nres2| . #3#) (GO #1#)))
                 (#2#
                  (CONS 0
                        (SPADCALL |z_inv| (CDR |nres2|) (QREFELT $ 54))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;do_weierstrass!0| (|f| $$)
  (PROG (|nargs| $ |ef|)
    (LETT |nargs| (QREFELT $$ 2) . #1=(|FS2UPS2;do_weierstrass|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 132) (QREFELT $ 100))
                (SPADCALL |nargs| 2 (QREFELT $ 100)) |f| |ef|))))) 

(DEFUN |FS2UPS2;spec_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|nker| |nargs| |cargs| #1=#:G681 |nexpr| |narg1| |arg1| |ii| |ir| |nm|
         |lser0| |lsere| |lsers| |losers| |ares| |aresu|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |aresu| (|FS2UPS2;handle_args| |args| |opt_rec| $)
              . #2=(|FS2UPS2;spec_to_UPS|))
        (EXIT
         (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
               (#3='T
                (SEQ (LETT |ares| (QCDR |aresu|) . #2#)
                     (LETT |losers| (QVELT |ares| 0) . #2#)
                     (LETT |lsers| (QVELT |ares| 1) . #2#)
                     (LETT |lsere| (QVELT |ares| 2) . #2#)
                     (LETT |lser0| (QVELT |ares| 3) . #2#)
                     (LETT |nm| (SPADCALL |ker| (QREFELT $ 133)) . #2#)
                     (COND
                      ((OR (EQUAL |nm| '|besselI|) (EQUAL |nm| '|besselK|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 100))
                                    (|spadConstant| $ 23) (QREFELT $ 25))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;besselEqm|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|besselJ|)
                           (OR (EQUAL |nm| '|besselY|)
                               (OR (EQUAL |nm| '|hankelH1|)
                                   (EQUAL |nm| '|hankelH2|))))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 100))
                                    (|spadConstant| $ 23) (QREFELT $ 25))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;besselEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|kummerM|) (EQUAL |nm| '|kummerU|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                    (|spadConstant| $ 23) (QREFELT $ 25))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;kummerEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|whittakerM|)
                           (EQUAL |nm| '|whittakerW|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                    (|spadConstant| $ 23) (QREFELT $ 25))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;whittakerEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|kelvinBer|)
                           (OR (EQUAL |nm| '|kelvinBei|)
                               (OR (EQUAL |nm| '|kelvinKer|)
                                   (EQUAL |nm| '|kelvinKei|))))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 100))
                                    (|spadConstant| $ 23) (QREFELT $ 25))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;kelvinEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|legendreP|) (EQUAL |nm| '|legendreQ|))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                     (|spadConstant| $ 19) (QREFELT $ 25))
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                     (SPADCALL (|spadConstant| $ 19)
                                               (QREFELT $ 136))
                                     (QREFELT $ 25)))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 135)) "expansion at +-1"
                           $))
                         ('T
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;legendreEq|) $)
                           $))))))
                     (COND
                      ((EQUAL |nm| '|lambertW|)
                       (COND
                        ((SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 100))
                                   (|spadConstant| $ 23) (QREFELT $ 25))
                         (EXIT
                          (CONS 0
                                (|FS2UPS2;lambertW0|
                                 (SPADCALL |losers| 1 (QREFELT $ 95)) $)))))))
                     (EXIT
                      (COND
                       ((EQUAL |nm| '|jacobiSn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 137) $))
                       ((EQUAL |nm| '|jacobiCn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 138) $))
                       ((EQUAL |nm| '|jacobiDn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 139) $))
                       ((EQUAL |nm| '|ellipticE2|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 140) $))
                       ((EQUAL |nm| '|ellipticF|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 141) $))
                       ((EQUAL |nm| '|ellipticPi|)
                        (|FS2UPS2;do_ell3| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 142) $))
                       (#3#
                        (SEQ
                         (COND
                          ((EQUAL |nm| '|weierstrassP|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                       (|spadConstant| $ 23) (QREFELT $ 25))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 143) -2 1 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassPPrime|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                       (|spadConstant| $ 23) (QREFELT $ 25))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 144) -3 -2 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassZeta|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                       (|spadConstant| $ 23) (QREFELT $ 25))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 145) -1 1 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassSigma|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 100))
                                       (|spadConstant| $ 23) (QREFELT $ 25))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 146) 0 0 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|Gamma|)
                           (SEQ
                            (LETT |ir|
                                  (SPADCALL
                                   (SPADCALL |lser0| 1 (QREFELT $ 100))
                                   (QREFELT $ 148))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |ir| 0)
                               (SEQ
                                (LETT |ii|
                                      (SPADCALL (QCDR |ir|) (QREFELT $ 149))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ii| 0)
                                   (COND
                                    ((SPADCALL (QCDR |ii|) 0 (QREFELT $ 150))
                                     (SEQ
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 100))
                                            . #2#)
                                      (LETT |narg1|
                                            (SPADCALL (|spadConstant| $ 19)
                                                      |arg1| (QREFELT $ 151))
                                            . #2#)
                                      (LETT |nker|
                                            (SPADCALL
                                             (SPADCALL |ker| (QREFELT $ 119))
                                             (LIST |narg1|) (QREFELT $ 121))
                                            . #2#)
                                      (LETT |nexpr|
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 152))
                                             (SPADCALL |nker|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 152))
                                                         |arg1|
                                                         (QREFELT $ 153))
                                                        (QREFELT $ 154))
                                                       (QREFELT $ 153))
                                             (QREFELT $ 155))
                                            . #2#)
                                      (EXIT
                                       (PROGN
                                        (LETT #1#
                                              (|FS2UPS2;i_expr_to_PS| |nexpr|
                                               |opt_rec| $)
                                              . #2#)
                                        (GO #1#))))))))))))))))
                         (LETT |cargs|
                               (|FS2UPS2;convert_args| |lsers| |lsere| |lser0|
                                $)
                               . #2#)
                         (LETT |nargs| (QVELT |cargs| 0) . #2#)
                         (LETT |nker|
                               (SPADCALL (SPADCALL |ker| (QREFELT $ 119))
                                         |nargs| (QREFELT $ 121))
                               . #2#)
                         (EXIT
                          (|FS2UPS2;do_taylor_via_deriv2| |nker|
                           (QVELT |cargs| 2) (QVELT |cargs| 1) $))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;atan1;2UPS;30| (|ups| $)
  (PROG (|yCoef| |y|)
    (RETURN
     (SEQ
      (LETT |y|
            (SPADCALL (SPADCALL |ups| (QREFELT $ 157))
                      (SPADCALL (|spadConstant| $ 56)
                                (SPADCALL |ups| |ups| (QREFELT $ 57))
                                (QREFELT $ 54))
                      (QREFELT $ 158))
            . #1=(|FS2UPS2;atan1;2UPS;30|))
      (LETT |yCoef|
            (SPADCALL |y| (SPADCALL (|spadConstant| $ 111) (QREFELT $ 159))
                      (QREFELT $ 21))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |yCoef| (QREFELT $ 160)) (|spadConstant| $ 78)
                  (QREFELT $ 65))
        (SPADCALL
         (SPADCALL |y|
                   (SPADCALL |yCoef|
                             (SPADCALL (|spadConstant| $ 111) (QREFELT $ 159))
                             (QREFELT $ 65))
                   (QREFELT $ 80))
         (QREFELT $ 161))
        (QREFELT $ 54))))))) 

(DEFUN |FS2UPS2;integ;2UPS;31| (|f| $) (SPADCALL |f| (QREFELT $ 161))) 

(DEFUN |FS2UPS2;integ_df;3UPS;32| (|f| |xs| $)
  (SPADCALL (SPADCALL (SPADCALL |xs| (QREFELT $ 157)) |f| (QREFELT $ 57))
            (QREFELT $ 161))) 

(PUT '|FS2UPS2;atan1;2UPS;33| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(DEFUN |FS2UPS2;atan1;2UPS;33| (|ups| $)
  (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;34| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(DEFUN |FS2UPS2;integ;2UPS;34| (|f| $)
  (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;35| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(DEFUN |FS2UPS2;integ_df;3UPS;35| (|f| |xs| $)
  (|error| "integ_df called, but no integrate")) 

(PUT '|FS2UPS2;atan1;2UPS;36| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(DEFUN |FS2UPS2;atan1;2UPS;36| (|ups| $)
  (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;37| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(DEFUN |FS2UPS2;integ;2UPS;37| (|f| $)
  (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;38| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(DEFUN |FS2UPS2;integ_df;3UPS;38| (|f| |xs| $)
  (|error| "integ_df called, but no integrate")) 

(DEFUN |FS2UPS2;do_prim| (|ker| |arg0| |opt_rec| $)
  (PROG (#1=#:G694 |ns| |nf| |c0|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QREFELT $ 156)
         (SEQ
          (LETT |c0|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 119)) |arg0|
                          (QREFELT $ 165))
                . #2=(|FS2UPS2;do_prim|))
          (LETT |nf|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 167)) (QREFELT $ 14)
                          (QREFELT $ 81))
                . #2#)
          (LETT |ns| (|FS2UPS2;i_expr_to_PS| |nf| |opt_rec| $) . #2#)
          (EXIT
           (COND ((QEQCAR |ns| 1) (PROGN (LETT #1# |ns| . #2#) (GO #1#)))
                 (#3='T
                  (CONS 0
                        (SPADCALL (SPADCALL |c0| (QREFELT $ 77))
                                  (SPADCALL (CDR |ns|) (QREFELT $ 163))
                                  (QREFELT $ 54))))))))
        (#3#
         (|FS2UPS2;spec_to_UPS| |ker| (SPADCALL |ker| (QREFELT $ 168))
          |opt_rec| $))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;prim_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|coef| #1=#:G710 |ups| #2=#:G461 |nsu| |arg| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nm| (SPADCALL |ker| (QREFELT $ 133))
              . #3=(|FS2UPS2;prim_to_UPS|))
        (EXIT
         (COND
          ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 130))
           (|FS2UPS2;stateProblem| (SPADCALL |nm| (QREFELT $ 135))
            "multivariate primitive" $))
          (#4='T
           (SEQ (LETT |arg| (|SPADfirst| |args|) . #3#)
                (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $) . #3#)
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
                        (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 29))
                        (|spadConstant| $ 78) (QREFELT $ 79))
                       (PROGN
                        (LETT #1#
                              (|FS2UPS2;stateProblem| "handle_args"
                               "argument not Taylor" $)
                              . #3#)
                        (GO #1#)))
                      (#4#
                       (SEQ
                        (LETT |coef|
                              (SPADCALL |ups| (|spadConstant| $ 78)
                                        (QREFELT $ 21))
                              . #3#)
                        (COND
                         ((OR (EQUAL |nm| '|Ei|)
                              (OR (EQUAL |nm| '|Ci|)
                                  (OR (EQUAL |nm| '|Chi|)
                                      (EQUAL |nm| '|dilog|))))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 23)
                                       (QREFELT $ 25))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0"
                              $))
                            (#4#
                             (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))))))
                        (EXIT
                         (COND
                          ((EQUAL |nm| '|li|)
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 23)
                                       (QREFELT $ 25))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 135)) "expansion at 0"
                              $))
                            ((SPADCALL |coef| (|spadConstant| $ 19)
                                       (QREFELT $ 25))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 135)) "expansion at 1"
                              $))
                            (#4#
                             (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))))
                          ((OR (EQUAL |nm| '|Si|)
                               (OR (EQUAL |nm| '|Shi|)
                                   (OR (EQUAL |nm| '|erf|)
                                       (OR (EQUAL |nm| '|fresnelS|)
                                           (EQUAL |nm| '|fresnelC|)))))
                           (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))
                          ('T
                           (|FS2UPS2;stateProblem|
                            (SPADCALL (SPADCALL |ker| (QREFELT $ 133))
                                      (QREFELT $ 135))
                            "unimplemented" $))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;kernelToUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G724 |n| |arg| |op| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 170))
            . #2=(|FS2UPS2;kernelToUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 14))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 111)
                           (QREFELT $ 65))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 167))
                           (|spadConstant| $ 78) (QREFELT $ 65))))))
        ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 168)) . #2#))
             (NULL
              (SPADCALL (QREFELT $ 14)
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 167))
                                  (QREFELT $ 75))
                        (QREFELT $ 76))))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 167)) (|spadConstant| $ 78)
                         (QREFELT $ 65))))
        ('T
         (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 119)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT $ 171))
                 (|FS2UPS2;spec_to_UPS| |ker| |args| |opt_rec| $))
                ((SPADCALL |op| '|prim| (QREFELT $ 171))
                 (|FS2UPS2;prim_to_UPS| |ker| |args| |opt_rec| $))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 172))
                         (|FS2UPS2;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 153)) 2 |opt_rec|
                          $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 172))
                         (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|log| (QREFELT $ 172))
                         (|FS2UPS2;logToUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 172))
                         (|FS2UPS2;applyIfCan| (ELT $ 173) |arg| "exp"
                          |opt_rec| $))
                        (#3# (|FS2UPS2;tranToUPS| |ker| |arg| |opt_rec| $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 172))
                 (SPADCALL |args| |opt_rec| (QREFELT $ 176)))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 172))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 177))
                                  (QREFELT $ 178))
                        . #2#)
                  (EXIT
                   (|FS2UPS2;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #1# |n| . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |opt_rec| $))))
                (#3#
                 (|FS2UPS2;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 133)) (QREFELT $ 135))
                  "unknown kernel" $)))))))))))) 

(DEFUN |FS2UPS2;nthRootToUPS| (|arg| |n| |opt_rec| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
            . #1=(|FS2UPS2;nthRootToUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                      |opt_rec| 'NIL $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS2;logToUPS| (|arg| |opt_rec| $)
  (PROG (|logTerm| |lt| #1=#:G751 #2=#:G756 #3=#:G754 |signum| |coef| |deg|
         |ups| #4=#:G461 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
              . #5=(|FS2UPS2;logToUPS|))
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
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 20)) . #5#)
                   (SEQ
                    (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 27))
                                                  (QREFELT $ 28))
                                        (QREFELT $ 29))
                              . #5#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 23)
                                     (QREFELT $ 25))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
                   (COND
                    ((NULL (QVELT |opt_rec| 4))
                     (COND
                      ((NULL (SPADCALL |deg| (QREFELT $ 34)))
                       (EXIT
                        (|FS2UPS2;stateProblem| "log"
                         "series of non-zero order" $))))))
                   (COND
                    ((QVELT |opt_rec| 0)
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 33)) . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 0)
                         (COND
                          ((EQL (QCDR |signum|) -1)
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #2#
                                         (|FS2UPS2;stateProblem| "log"
                                          "negative leading coefficient" $)
                                         . #5#)
                                   (GO #2#))
                                  . #5#)
                            (GO #3#))))))))))
                   (COND
                    ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                     (PROGN
                      (LETT #2#
                            (|FS2UPS2;stateProblem| "log"
                             "need to invert bad coefficient" $)
                            . #5#)
                      (GO #2#))))
                   (EXIT
                    (COND
                     ((SPADCALL |deg| (QREFELT $ 34))
                      (CONS 0
                            (PROG2
                                (LETT #1# (SPADCALL |ups| (QREFELT $ 179))
                                      . #5#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#6#
                      (SEQ
                       (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 65)) . #5#)
                       (LETT |logTerm|
                             (SPADCALL (SPADCALL |coef| (QREFELT $ 160))
                                       (SPADCALL
                                        (SPADCALL |deg| (QREFELT $ 13))
                                        (QVELT |opt_rec| 5) (QREFELT $ 153))
                                       (QREFELT $ 94))
                             . #5#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL |logTerm| (|spadConstant| $ 78)
                                         (QREFELT $ 65))
                               (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 158))
                                         (QREFELT $ 180))
                               (QREFELT $ 54))))))))))
                 #3# (EXIT #3#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS2;localAbs;2FE;44| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 181))) 

(DEFUN |FS2UPS2;localAbs;2FE;45| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 153)) (QREFELT $ 183))) 

(DEFUN |FS2UPS2;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 182)) |arg| (QREFELT $ 155))) 

(DEFUN |FS2UPS2;atanacot2| (|ups| |coef| |ord| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G781 |rn| |atanFlag|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |atanFlag| (QVELT |opt_rec| 1) . #2=(|FS2UPS2;atanacot2|))
            (LETT |cc|
                  (COND
                   ((SPADCALL |ord| (|spadConstant| $ 78) (QREFELT $ 79))
                    (COND
                     ((SPADCALL |atanFlag| (CONS 0 "complex") (QREFELT $ 184))
                      (PROGN
                       (LETT #1#
                             (|FS2UPS2;stateProblem| "atan"
                              "essential singularity" $)
                             . #2#)
                       (GO #1#)))
                     (#3='T
                      (SEQ
                       (LETT |rn|
                             (|FS2UPS2;ratIfCan|
                              (SPADCALL |ord| (QREFELT $ 13)) $)
                             . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |rn| 1)
                          (PROGN
                           (LETT #1#
                                 (|FS2UPS2;stateProblem| "atan"
                                  "branch problem" $)
                                 . #2#)
                           (GO #1#)))
                         (#3#
                          (SEQ
                           (COND
                            ((SPADCALL |atanFlag| (CONS 1 "real: two sides")
                                       (QREFELT $ 184))
                             (COND
                              ((ODDP (SPADCALL (QCDR |rn|) (QREFELT $ 186)))
                               (PROGN
                                (LETT #1#
                                      (|FS2UPS2;stateProblem| "atan"
                                       "branch problem" $)
                                      . #2#)
                                (GO #1#))))))
                           (LETT |lc| (SPADCALL |ups| |ord| (QREFELT $ 21))
                                 . #2#)
                           (LETT |signum| (SPADCALL |lc| (QREFELT $ 33)) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |signum| 1)
                              (COND
                               ((SPADCALL |atanFlag| (CONS 4 "just do it")
                                          (QREFELT $ 184))
                                (COND
                                 ((EQL |plusMinus| 1)
                                  (SPADCALL (SPADCALL (QREFELT $ 152))
                                            (SPADCALL 2 (QREFELT $ 189))
                                            (QREFELT $ 155)))
                                 (#3# (|spadConstant| $ 23))))
                               (#3#
                                (SEQ
                                 (LETT |posNegPi2|
                                       (SPADCALL
                                        (SPADCALL
                                         (|FS2UPS2;signOfExpression| |lc| $)
                                         (SPADCALL (QREFELT $ 152))
                                         (QREFELT $ 153))
                                        (SPADCALL 2 (QREFELT $ 189))
                                        (QREFELT $ 155))
                                       . #2#)
                                 (EXIT
                                  (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                        (#3#
                                         (SPADCALL
                                          (SPADCALL (SPADCALL (QREFELT $ 152))
                                                    (SPADCALL 2
                                                              (QREFELT $ 189))
                                                    (QREFELT $ 155))
                                          |posNegPi2| (QREFELT $ 151)))))))))
                             (#3#
                              (SEQ
                               (LETT |left?|
                                     (SPADCALL |atanFlag|
                                               (CONS 2 "real: left side")
                                               (QREFELT $ 184))
                                     . #2#)
                               (LETT |n| (QCDR |signum|) . #2#)
                               (COND
                                (|left?|
                                 (COND
                                  ((EQL |n| 1)
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL
                                       (SPADCALL (SPADCALL (QREFELT $ 152))
                                                 (SPADCALL 2 (QREFELT $ 189))
                                                 (QREFELT $ 155))
                                       (QREFELT $ 136)))
                                     (#3# (SPADCALL (QREFELT $ 152))))))
                                  ((NULL |left?|)
                                   (COND
                                    ((EQL |n| -1)
                                     (EXIT
                                      (COND
                                       ((EQL |plusMinus| 1)
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 152))
                                                   (SPADCALL 2 (QREFELT $ 189))
                                                   (QREFELT $ 155))
                                         (QREFELT $ 136)))
                                       (#3# (SPADCALL (QREFELT $ 152))))))))))
                                ((EQL |n| -1)
                                 (EXIT
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL
                                     (SPADCALL (SPADCALL (QREFELT $ 152))
                                               (SPADCALL 2 (QREFELT $ 189))
                                               (QREFELT $ 155))
                                     (QREFELT $ 136)))
                                   (#3# (SPADCALL (QREFELT $ 152)))))))
                               (EXIT
                                (COND
                                 ((EQL |plusMinus| 1)
                                  (SPADCALL (SPADCALL (QREFELT $ 152))
                                            (SPADCALL 2 (QREFELT $ 189))
                                            (QREFELT $ 155)))
                                 (#3# (|spadConstant| $ 23))))))))))))))))
                   ((EQL |plusMinus| 1) (SPADCALL |coef| (QREFELT $ 190)))
                   (#3# (SPADCALL |coef| (QREFELT $ 191))))
                  . #2#)
            (EXIT
             (CONS 0
                   (SPADCALL (SPADCALL |cc| (QREFELT $ 77))
                             (SPADCALL
                              (SPADCALL |plusMinus|
                                        (SPADCALL (|spadConstant| $ 56)
                                                  (SPADCALL
                                                   (|spadConstant| $ 56)
                                                   (SPADCALL |ups| |ups|
                                                             (QREFELT $ 57))
                                                   (QREFELT $ 54))
                                                  (QREFELT $ 158))
                                        (QREFELT $ 131))
                              |ups| (QREFELT $ 164))
                             (QREFELT $ 54))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;atancotToUPS| (|arg| |opt_rec| |plusMinus| $)
  (PROG (|res1| #1=#:G789 #2=#:G791 |ord| |coef| |ups| #3=#:G461 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
              . #4=(|FS2UPS2;atancotToUPS|))
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
                         (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 21))
                         . #4#)
                   (SEQ
                    (LETT |ord|
                          (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 29))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |ord| (|spadConstant| $ 78) (QREFELT $ 192))
                       (COND
                        ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 153))
                                   (SPADCALL (|spadConstant| $ 19)
                                             (QREFELT $ 136))
                                   (QREFELT $ 25))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2#
                                       (|FS2UPS2;stateProblem| "atan"
                                        "logarithmic singularity" $)
                                       . #4#)
                                 (GO #2#))
                                . #4#)
                          (GO #1#))))))))
                   (EXIT
                    (COND
                     ((QREFELT $ 156)
                      (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                       |plusMinus| $))
                     ((SPADCALL |ord| (|spadConstant| $ 78) (QREFELT $ 79))
                      (|FS2UPS2;stateProblem| "atan"
                       "argument of negative order" $))
                     (#5#
                      (SEQ
                       (LETT |res1|
                             (COND
                              ((EQL |plusMinus| 1)
                               (SPADCALL |ups| (QREFELT $ 193)))
                              (#5# (SPADCALL |ups| (QREFELT $ 194))))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |res1| 1)
                          (|FS2UPS2;stateProblem| "atan" "failed" $))
                         (#5# (CONS 0 (QCDR |res1|)))))))))))
                 #1# (EXIT #1#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS2;applyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (|ans| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
            . #1=(|FS2UPS2;applyIfCan|))
      (EXIT
       (COND ((QEQCAR |ups| 1) |ups|)
             (#2='T
              (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
                   (EXIT
                    (COND
                     ((QEQCAR |ans| 1)
                      (|FS2UPS2;stateProblem| |fcnName| "essential singularity"
                       $))
                     (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS2;tranToUPS| (|ker| |arg| |opt_rec| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 195) |arg| "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 196) |arg| "cos" |opt_rec| $))
   ((SPADCALL |ker| '|tan| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 197) |arg| "tan" |opt_rec| $))
   ((SPADCALL |ker| '|cot| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 198) |arg| "cot" |opt_rec| $))
   ((SPADCALL |ker| '|sec| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 199) |arg| "sec" |opt_rec| $))
   ((SPADCALL |ker| '|csc| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 200) |arg| "csc" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 201) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 202) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 172))
    (|FS2UPS2;atancotToUPS| |arg| |opt_rec| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 172))
    (|FS2UPS2;atancotToUPS| |arg| |opt_rec| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 203) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 204) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|sinh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 205) |arg| "sinh" |opt_rec| $))
   ((SPADCALL |ker| '|cosh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 206) |arg| "cosh" |opt_rec| $))
   ((SPADCALL |ker| '|tanh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 207) |arg| "tanh" |opt_rec| $))
   ((SPADCALL |ker| '|coth| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 208) |arg| "coth" |opt_rec| $))
   ((SPADCALL |ker| '|sech| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 209) |arg| "sech" |opt_rec| $))
   ((SPADCALL |ker| '|csch| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 210) |arg| "csch" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 211) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 212) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 213) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 214) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 215) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 172))
    (|FS2UPS2;applyIfCan| (ELT $ 216) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS2;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 133)) (QREFELT $ 135))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS2;powToUPS2| (|args| |opt_rec| $)
  (PROG (|ans| |expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase| (|FS2UPS2;logToUPS| (|SPADfirst| |args|) |opt_rec| $)
            . #1=(|FS2UPS2;powToUPS2|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2UPS2;i_expr_to_PS| (SPADCALL |args| (QREFELT $ 177))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL (CDR |expon|) (CDR |logBase|)
                                         (QREFELT $ 57))
                               (QREFELT $ 173))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans| 1)
                           (|FS2UPS2;stateProblem| "exp"
                            "essential singularity" $))
                          (#2# (CONS 0 (QCDR |ans|))))))))))))))))) 

(DEFUN |FS2UPS2;powToUPS;LRU;52| (|args| |opt_rec| $)
  (PROG (|ans1| |lbu| |b1| |eb| |bs| |pow_base| |ep| |pow|)
    (RETURN
     (SEQ
      (LETT |pow| (SPADCALL |args| (QREFELT $ 177))
            . #1=(|FS2UPS2;powToUPS;LRU;52|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pow| (QREFELT $ 14) (QREFELT $ 81))
                   (|spadConstant| $ 23) (QREFELT $ 217))
         (|FS2UPS2;powToUPS2| |args| |opt_rec| $))
        (#2='T
         (SEQ (LETT |ep| (SPADCALL |pow| (QREFELT $ 218)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |ep| 0)
                 (SEQ
                  (LETT |pow_base|
                        (|FS2UPS2;i_expr_to_PS| (|SPADfirst| |args|) |opt_rec|
                         $)
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |pow_base| 1) |pow_base|)
                         (#2#
                          (SEQ (LETT |bs| (CDR |pow_base|) . #1#)
                               (LETT |eb| (SPADCALL |bs| (QREFELT $ 20)) . #1#)
                               (COND
                                ((SPADCALL (SPADCALL |bs| |eb| (QREFELT $ 21))
                                           (|spadConstant| $ 23)
                                           (QREFELT $ 25))
                                 (SEQ
                                  (LETT |eb|
                                        (SPADCALL |bs|
                                                  (SPADCALL |eb|
                                                            (SPADCALL 1000
                                                                      (QREFELT
                                                                       $ 27))
                                                            (QREFELT $ 28))
                                                  (QREFELT $ 29))
                                        . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |bs| |eb| (QREFELT $ 21))
                                      (|spadConstant| $ 23) (QREFELT $ 25))
                                     (|error|
                                      "powToUPS: series with many zero terms")))))))
                               (LETT |b1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 19)
                                                (SPADCALL |eb| (QREFELT $ 159))
                                                (QREFELT $ 65))
                                      |bs| (QREFELT $ 57))
                                     . #1#)
                               (LETT |lbu| (SPADCALL |b1| (QREFELT $ 179))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((QEQCAR |lbu| 1)
                                  (|FS2UPS2;stateProblem| "pow"
                                   "transcendental log" $))
                                 (#2#
                                  (SEQ
                                   (LETT |ans1|
                                         (SPADCALL
                                          (SPADCALL |pow| (QCDR |lbu|)
                                                    (QREFELT $ 219))
                                          (QREFELT $ 173))
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |ans1| 1)
                                      (|FS2UPS2;stateProblem| "pow"
                                       "transcendental exp" $))
                                     (#2#
                                      (CONS 0
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| $ 19)
                                                       (SPADCALL (QCDR |ep|)
                                                                 |eb|
                                                                 (QREFELT $
                                                                          220))
                                                       (QREFELT $ 65))
                                             (QCDR |ans1|)
                                             (QREFELT $ 57))))))))))))))))
                (#2# (|FS2UPS2;powToUPS2| |args| |opt_rec| $)))))))))))) 

(DEFUN |FS2UPS2;powToUPS;LRU;53| (|args| |opt_rec| $)
  (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(DEFUN |FS2UPS2;powToUPS;LRU;54| (|args| |opt_rec| $)
  (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(DEFUN |FS2UPS2;newElem| (|f| $)
  (SPADCALL (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 222)) $)
            (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 223)) $)
            (QREFELT $ 155))) 

(DEFUN |FS2UPS2;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2UPS2;k2Elem|) $) (ELT $ 113) |p|
            (QREFELT $ 228))) 

(DEFUN |FS2UPS2;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G894 |a| #2=#:G893)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 168)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (|FS2UPS2;newElem| |a| $) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 167)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 229))
                            . #3#)
                      (QREFELT $ 230))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 154)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 231)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 172))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 155)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 172))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 155)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 172))
                  (SPADCALL |cosz| (QREFELT $ 230)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 172))
                  (SPADCALL |sinz| (QREFELT $ 230)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 172))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 151))
                            (SPADCALL 2 (QREFELT $ 189)) (QREFELT $ 155)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 172))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 94))
                            (SPADCALL 2 (QREFELT $ 189)) (QREFELT $ 155)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 172))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 151))
                            (SPADCALL |ez| |iez| (QREFELT $ 94))
                            (QREFELT $ 155)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 172))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 94))
                            (SPADCALL |ez| |iez| (QREFELT $ 151))
                            (QREFELT $ 155)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 172))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 94))
                                      (QREFELT $ 230))
                            (QREFELT $ 232)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 172))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 151))
                                      (QREFELT $ 230))
                            (QREFELT $ 232)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 119)) |args|
                            (QREFELT $ 233))))))))))))) 

(DEFUN |FS2UPS2;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 234) (QREFELT $ 237))) 

(DEFUN |FS2UPS2;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 235) (QREFELT $ 237))) 

(DEFUN |FS2UPS2;exprToGenUPS;FEBUU;60| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS2;iExprToGenUPS| (|FS2UPS2;newElem| |fcn| $)
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none") 'NIL
           (|spadConstant| $ 23))
   $)) 

(DEFUN |FS2UPS2;iExprToGenUPS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 46))
            . #1=(|FS2UPS2;iExprToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (|FS2UPS2;polyToUPS|
          (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 50)) |opt_rec| $))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 52)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS2;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS2;iExprToGenUPS|) $) |opt_rec|
                  (|spadConstant| $ 53) (ELT $ 54) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 55)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS2;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS2;iExprToGenUPS|) $)
                          |opt_rec| (|spadConstant| $ 56) (ELT $ 57) $))
                        (#2#
                         (SEQ
                          (LETT |expt| (|FS2UPS2;isNonTrivPower| |fcn| $)
                                . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |expt| 0)
                             (SEQ (LETT |power| (QCDR |expt|) . #1#)
                                  (EXIT
                                   (|FS2UPS2;powerToGenUPS| (QCAR |power|)
                                    (QCDR |power|) |opt_rec| $))))
                            (#2#
                             (SEQ
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 59))
                                    . #1#)
                              (EXIT
                               (COND
                                ((QEQCAR |ker| 0)
                                 (|FS2UPS2;kernelToGenUPS| (QCDR |ker|)
                                  |opt_rec| $))
                                (#2#
                                 (|error|
                                  "exprToGenUPS: neither a sum, product, power, nor kernel")))))))))))))))))))))))) 

(DEFUN |FS2UPS2;opsInvolvingX| (|fcn| $)
  (PROG (|opList| |op| #1=#:G938 |k| #2=#:G937)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 240)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 119)) . #3#)
                         (QREFELT $ 241))
                        (SPADCALL (QREFELT $ 14)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 168)))
                                   (QREFELT $ 75))
                                  (QREFELT $ 76)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 243))))))) 

(DEFUN |FS2UPS2;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G940 #2=#:G942 #3=#:G943 |op|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |op| NIL . #4=(|FS2UPS2;opInOpList?|))
               (LETT #3# |opList| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |op| |name| (QREFELT $ 244))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS2;exponential?| (|fcn| $)
  (PROG (|ker|)
    (RETURN
     (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 59)) |FS2UPS2;exponential?|)
          (EXIT
           (COND
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 172)))
            ('T 'NIL))))))) 

(DEFUN |FS2UPS2;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G954 #2=#:G958 #3=#:G959 |term| |prod|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|FS2UPS2;exponential?| |fcn| $) 'T)
             (#4='T
              (SEQ
               (LETT |prod| (SPADCALL |fcn| (QREFELT $ 55))
                     . #5=(|FS2UPS2;productOfNonZeroes?|))
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
                                  ((NULL (|FS2UPS2;exponential?| |term| $))
                                   (COND
                                    ((SPADCALL (QREFELT $ 14)
                                               (SPADCALL |term| (QREFELT $ 75))
                                               (QREFELT $ 76))
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

(DEFUN |FS2UPS2;powerToGenUPS| (|fcn| |n| |opt_rec| $)
  (PROG (|xOpList| |coef| |deg| |ups| #1=#:G461 #2=#:G964 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS2;iExprToGenUPS| |fcn| |opt_rec| $)
            . #3=(|FS2UPS2;powerToGenUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 70))
              (CONS 0
                    (SPADCALL (CDR |b|)
                              (PROG1 (LETT #2# |n| . #3#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#))
                              (QREFELT $ 71))))
             (#4='T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #1# |b| . #3#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                     . #3#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 20)) . #3#)
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 27))
                                                  (QREFELT $ 28))
                                        (QREFELT $ 29))
                              . #3#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 23)
                                     (QREFELT $ 25))
                           (|error|
                            "inverse of series with many leading zero coefficients")))))))))
               (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |coef| $) . #3#)
               (EXIT
                (COND
                 ((NULL |xOpList|)
                  (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 72))))
                 (#4#
                  (SEQ
                   (COND
                    ((NULL (CDR |xOpList|))
                     (COND
                      ((SPADCALL (|SPADfirst| |xOpList|) '|log|
                                 (QREFELT $ 244))
                       (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 72))))))))
                   (EXIT
                    (COND
                     ((|FS2UPS2;productOfNonZeroes?| |coef| $)
                      (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 72))))
                     (#4#
                      (|FS2UPS2;stateProblem| "inv"
                       "lowest order coefficient involves x" $)))))))))))))))) 

(DEFUN |FS2UPS2;kernelToGenUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G981 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 170))
            . #2=(|FS2UPS2;kernelToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 14))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 111)
                           (QREFELT $ 65))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 167))
                           (|spadConstant| $ 78) (QREFELT $ 65))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 168)) . #2#))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 167)) (|spadConstant| $ 78)
                         (QREFELT $ 65))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|abs| (QREFELT $ 172))
                 (|FS2UPS2;nthRootToGenUPS|
                  (SPADCALL |arg| |arg| (QREFELT $ 153)) 2 |opt_rec| $))
                ((SPADCALL |ker| '|%paren| (QREFELT $ 172))
                 (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 172))
                 (|FS2UPS2;logToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 172))
                 (|FS2UPS2;expToGenUPS| |arg| |opt_rec| $))
                (#3# (|FS2UPS2;tranToGenUPS| |ker| |arg| |opt_rec| $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 172))
         (|FS2UPS2;powToGenUPS| |args| |opt_rec| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 172))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 177)) (QREFELT $ 178))
                . #2#)
          (EXIT
           (|FS2UPS2;nthRootToGenUPS| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |opt_rec| $))))
        (#3#
         (|FS2UPS2;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 133)) (QREFELT $ 135))
          "unknown kernel" $)))))))) 

(DEFUN |FS2UPS2;nthRootToGenUPS| (|arg| |n| |opt_rec| $)
  (PROG (|ans| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
            . #1=(|FS2UPS2;nthRootToGenUPS|))
      (EXIT
       (COND ((QEQCAR |result| 1) |result|)
             (#2='T
              (SEQ
               (LETT |ans|
                     (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                      |opt_rec| 'T $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ans| 1) |ans|)
                      (#2# (CONS 0 (CDR |ans|))))))))))))) 

(DEFUN |FS2UPS2;logToGenUPS| (|arg| |opt_rec| $)
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |cen| |lt| #1=#:G1008
         #2=#:G1010 |signum| |coef| |deg| |ups| #3=#:G461 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
              . #4=(|FS2UPS2;logToGenUPS|))
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
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 20)) . #4#)
                   (SEQ
                    (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 25))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 27))
                                                  (QREFELT $ 28))
                                        (QREFELT $ 29))
                              . #4#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 21))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 23)
                                     (QREFELT $ 25))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
                   (COND
                    ((QVELT |opt_rec| 0)
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 33)) . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 0)
                         (COND
                          ((EQL (QCDR |signum|) -1)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2#
                                         (|FS2UPS2;stateProblem| "log"
                                          "negative leading coefficient" $)
                                         . #4#)
                                   (GO #2#))
                                  . #4#)
                            (GO #1#))))))))))
                   (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 65)) . #4#)
                   (LETT |cen| (SPADCALL |lt| (QREFELT $ 245)) . #4#)
                   (LETT |negRat?|
                         (SEQ (LETT |rat| (|FS2UPS2;ratIfCan| |coef| $) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rat| 0)
                                 (COND
                                  ((SPADCALL (QCDR |rat|)
                                             (|spadConstant| $ 246)
                                             (QREFELT $ 247))
                                   'T)
                                  (#5# 'NIL)))
                                (#5# 'NIL))))
                         . #4#)
                   (LETT |logTerm|
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 14) (QREFELT $ 86)) |cen|
                                 (QREFELT $ 151))
                                . #4#)
                          (LETT |pow|
                                (SPADCALL |mon| (SPADCALL |deg| (QREFELT $ 13))
                                          (QREFELT $ 248))
                                . #4#)
                          (EXIT
                           (COND
                            (|negRat?|
                             (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 153))
                                       (QREFELT $ 160)))
                            (#5#
                             (SEQ
                              (LETT |term1|
                                    (SPADCALL (SPADCALL |deg| (QREFELT $ 13))
                                              (SPADCALL |mon| (QREFELT $ 160))
                                              (QREFELT $ 153))
                                    . #4#)
                              (EXIT
                               (SPADCALL (SPADCALL |coef| (QREFELT $ 160))
                                         |term1| (QREFELT $ 94))))))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL |logTerm| (|spadConstant| $ 78)
                                     (QREFELT $ 65))
                           (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 158))
                                     (QREFELT $ 180))
                           (QREFELT $ 54))))))
                 #1# (EXIT #1#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS2;expToGenUPS| (|arg| |opt_rec| $)
  (PROG (|ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
            |FS2UPS2;expToGenUPS|)
      (EXIT
       (COND ((QEQCAR |ups| 1) |ups|)
             ('T (|FS2UPS2;expGenUPS| (CDR |ups|) |opt_rec| $)))))))) 

(DEFUN |FS2UPS2;expGenUPS| (|ups| |opt_rec| $)
  (PROG (|result| |expCoef| |xOpList| |lc| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 111) (QREFELT $ 29))
            . #1=(|FS2UPS2;expGenUPS|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 78) (QREFELT $ 79))
         (|FS2UPS2;stateProblem| "exp" "essential singularity" $))
        ((SPADCALL |deg| (|spadConstant| $ 78) (QREFELT $ 249))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 250))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 21))
                . #1#)
          (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2UPS2;opInOpList?| '|log| |xOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 250))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 229)) (QREFELT $ 14)
                          (QREFELT $ 252))
                . #1#)
          (EXIT
           (COND
            ((|FS2UPS2;opInOpList?| '|log|
              (|FS2UPS2;opsInvolvingX| |expCoef| $) $)
             (|FS2UPS2;stateProblem| "exp" "logs in constant coefficient" $))
            (#2#
             (SEQ
              (LETT |result|
                    (|FS2UPS2;iExprToGenUPS| (|FS2UPS2;newElem| |expCoef| $)
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
                                                                           78)
                                                           (QREFELT $ 65))
                                                 (QREFELT $ 80))
                                       (QREFELT $ 250))
                                      (QREFELT $ 57)))))))))))))))))) 

(DEFUN |FS2UPS2;atancotToGenUPS| (|fe| |arg| |opt_rec| |plusMinus| $)
  (PROG (#1=#:G1024 |ord| |coef| |ups| #2=#:G461 |trouble| |result|)
    (RETURN
     (SEQ
      (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
            . #3=(|FS2UPS2;atancotToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |result| 1)
         (SEQ (LETT |trouble| (CDR |result|) . #3#)
              (EXIT
               (COND
                ((EQUAL (QCDR |trouble|) "essential singularity")
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 78) (QREFELT $ 65))))
                (#4='T |result|)))))
        (#4#
         (SEQ
          (EXIT
           (SEQ
            (LETT |ups|
                  (PROG2 (LETT #2# |result| . #3#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                  . #3#)
            (LETT |coef| (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 21))
                  . #3#)
            (SEQ
             (LETT |ord| (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 29))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |ord| (|spadConstant| $ 78) (QREFELT $ 192))
                (COND
                 ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 153))
                            (SPADCALL (|spadConstant| $ 19) (QREFELT $ 136))
                            (QREFELT $ 25))
                  (PROGN
                   (LETT #1# (CONS 0 (SPADCALL |ups| (QREFELT $ 162))) . #3#)
                   (GO #1#))))))))
            (EXIT
             (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec| |plusMinus|
              $))))
          #1# (EXIT #1#))))))))) 

(DEFUN |FS2UPS2;genUPSApplyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (#1=#:G1029 |xOpList| |lc| |deg| |ups| #2=#:G461 |series|)
    (RETURN
     (SEQ
      (LETT |series| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
            . #3=(|FS2UPS2;genUPSApplyIfCan|))
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
                     (SPADCALL |ups| (|spadConstant| $ 111) (QREFELT $ 29))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |deg| (|spadConstant| $ 78) (QREFELT $ 79))
                  (|FS2UPS2;stateProblem| |fcnName| "essential singularity" $))
                 ((SPADCALL |deg| (|spadConstant| $ 78) (QREFELT $ 249))
                  (CONS 0
                        (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))))
                 (#4#
                  (SEQ
                   (LETT |lc|
                         (SPADCALL |ups| (|spadConstant| $ 78) (QREFELT $ 21))
                         . #3#)
                   (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| $) . #3#)
                   (EXIT
                    (COND
                     ((NULL |xOpList|)
                      (CONS 0
                            (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     ((|FS2UPS2;opInOpList?| '|log| |xOpList| $)
                      (|FS2UPS2;stateProblem| |fcnName|
                       "logs in constant coefficient" $))
                     ((|FS2UPS2;contOnReals?| |fcnName| $)
                      (CONS 0
                            (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#4#
                      (|FS2UPS2;stateProblem| |fcnName|
                       "x in constant coefficient" $)))))))))))))))) 

(DEFUN |FS2UPS2;applyBddIfCan| (|fe| |fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (|ans| |trouble| |ups|)
    (RETURN
     (SEQ
      (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $)
            . #1=(|FS2UPS2;applyBddIfCan|))
      (EXIT
       (COND
        ((QEQCAR |ups| 1)
         (SEQ (LETT |trouble| (CDR |ups|) . #1#)
              (EXIT
               (COND
                ((EQUAL (QCDR |trouble|) "essential singularity")
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 78) (QREFELT $ 65))))
                (#2='T |ups|)))))
        (#2#
         (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 78) (QREFELT $ 65))))
                (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS2;tranToGenUPS| (|ker| |arg| |opt_rec| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 172))
    (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 167)) (ELT $ 195) |arg|
     "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 172))
    (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 167)) (ELT $ 196) |arg|
     "cos" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 201) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 202) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 172))
    (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 167)) |arg| |opt_rec|
     1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 172))
    (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 167)) |arg| |opt_rec|
     -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 203) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 204) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 211) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 212) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 213) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 214) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 215) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 172))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 216) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS2;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 133)) (QREFELT $ 135))
     "unknown kernel" $)))) 

(DEFUN |FS2UPS2;powToGenUPS| (|args| |opt_rec| $)
  (PROG (|expon| |logBase|)
    (RETURN
     (SEQ
      (LETT |logBase| (|FS2UPS2;logToGenUPS| (|SPADfirst| |args|) |opt_rec| $)
            . #1=(|FS2UPS2;powToGenUPS|))
      (EXIT
       (COND ((QEQCAR |logBase| 1) |logBase|)
             (#2='T
              (SEQ
               (LETT |expon|
                     (|FS2UPS2;iExprToGenUPS| (SPADCALL |args| (QREFELT $ 177))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (|FS2UPS2;expGenUPS|
                        (SPADCALL (CDR |expon|) (CDR |logBase|) (QREFELT $ 57))
                        |opt_rec| $)))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceToUnivariatePowerSeries2;|)) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2| (&REST #1=#:G1080)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1081)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FunctionSpaceToUnivariatePowerSeries2|)
                                           '|domainEqualList|)
                . #3=(|FunctionSpaceToUnivariatePowerSeries2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FunctionSpaceToUnivariatePowerSeries2;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FunctionSpaceToUnivariatePowerSeries2|))))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8| |#9|)
  (PROG (|pv$| $ |dv$| DV$9 DV$8 DV$7 DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|FunctionSpaceToUnivariatePowerSeries2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT DV$7 (|devaluate| |#7|) . #1#)
      (LETT DV$8 (|devaluate| |#8|) . #1#)
      (LETT DV$9 (|devaluate| |#9|) . #1#)
      (LETT |dv$|
            (LIST '|FunctionSpaceToUnivariatePowerSeries2| DV$1 DV$2 DV$3 DV$4
                  DV$5 DV$6 DV$7 DV$8 DV$9)
            . #1#)
      (LETT $ (GETREFV 253) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionSpaceToUnivariatePowerSeries2|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8 DV$9)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (QSETREFV $ 12 |#7|)
      (QSETREFV $ 13 |#8|)
      (QSETREFV $ 14 |#9|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 15 1000)
      (QSETREFV $ 73 (|EllipticFunctionsUnivariateTaylorSeries| |#2| |#6|))
      (QSETREFV $ 156 'NIL)
      (COND
       ((|HasSignature| |#4|
                        (LIST '|differentiate|
                              (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
        (COND
         ((|HasSignature| |#4|
                          (LIST '|integrate|
                                (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
          (PROGN
           (SETELT $ 156 'T)
           (QSETREFV $ 162
                     (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;30|) $))
           (QSETREFV $ 163
                     (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;31|) $))
           (QSETREFV $ 164
                     (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;32|)
                           $))))
         ('T
          (PROGN
           (QSETREFV $ 162
                     (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;33|) $))
           (QSETREFV $ 163
                     (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;34|) $))
           (QSETREFV $ 164
                     (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;35|)
                           $))))))
       ('T
        (PROGN
         (QSETREFV $ 162 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;36|) $))
         (QSETREFV $ 163 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;37|) $))
         (QSETREFV $ 164
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;38|) $)))))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|abs|
                              (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
        (QSETREFV $ 182
                  (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;44|) $)))
       ('T
        (QSETREFV $ 182
                  (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;45|) $))))
      (COND
       ((|HasCategory| |#3| (LIST '|RetractableFrom| (|devaluate| |#2|)))
        (COND
         ((|HasCategory| |#3| '(|Ring|))
          (QSETREFV $ 176
                    (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;52|) $)))
         ('T
          (QSETREFV $ 176
                    (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;53|) $)))))
       ('T
        (QSETREFV $ 176
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;54|) $))))
      (QSETREFV $ 234
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 235 (LIST #2# #3# #4# #5#))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) 'ZEROCOUNT
              (|Union| 185 '#1="failed") (0 . |retractIfCan|) (5 . |One|)
              (9 . |One|) (13 . |degree|) (18 . |coefficient|) (24 . |Zero|)
              (28 . |Zero|) (|Boolean|) (32 . =) (|Integer|) (38 . |coerce|)
              (43 . +) (49 . |order|) (55 . |even?|) (|Union| 26 '"failed")
              (|ElementaryFunctionSign| 6 7) (60 . |sign|) (65 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (70 . |nthRootIfCan|)
              (|Record| (|:| |func| 134) (|:| |prob| 134))
              (|Union| (|:| |%series| 9) (|:| |%problem| 38))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS2;exprToUPS;FEBUU;5| |FS2UPS2;exprToPS;FEBUBFEU;6|
              (|Mapping| 24 7) |FS2UPS2;exprToPS;FEBUBFE2MU;7|
              (|Union| 49 '#1#) (76 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (81 . |univariate|) (|Union| 120 '#2="failed") (87 . |isPlus|)
              (92 . |Zero|) (96 . +) (102 . |isTimes|) (107 . |One|) (111 . *)
              (|Union| 166 '#1#) (117 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 49) (122 . |zero?|)
              (127 . |degree|) (132 . |leadingCoefficient|) (137 . |coerce|)
              (142 . |monomial|) (148 . |reductum|)
              (|Record| (|:| |val| $) (|:| |exponent| 26)) (|Union| 67 '#2#)
              (153 . |isPower|) (158 . >) (164 . ^) (170 . ^) 'ELITS
              (|List| 48) (176 . |variables|) (181 . |member?|)
              (187 . |coerce|) (192 . |Zero|) (196 . <) (202 . -)
              (208 . |differentiate|) (|List| 9) (|Mapping| 7 7) (|List| 83)
              (214 . |taylor_via_deriv|) (221 . |coerce|) (|Equation| 7)
              (226 . =) (|List| 124) (232 . |eval|) (238 . |map|)
              (244 . |taylor_via_deriv|) (251 . |new|) (255 . +) (261 . |elt|)
              (|Mapping| 11 11) (267 . |applyTaylor|) (273 . |One|) (|List| 7)
              (277 . |elt|) (283 . |coerce|) (288 . |monomial|) (294 . +)
              (|PositiveInteger|) (300 . ^) (306 . -) (312 . |One|) (316 . *)
              (322 . *) (328 . -) (333 . |One|) (337 . |coerce|)
              (342 . |coerce|) (347 . /) (353 . |Zero|) (357 . |last|)
              (|BasicOperator|) (|Kernel| 7) (362 . |operator|) (|List| $)
              (367 . |kernel|) (|Union| $ '"failed") (373 . |recip|)
              (|Equation| $) (378 . |eval|) (|List| 11)
              (384 . |taylor_via_lode|)
              (|SpecialFunctionUnivariateTaylorSeries| 7 11)
              (391 . |lambertW0|) (396 . ~=) (402 . *) (408 . |One|)
              (412 . |name|) (|String|) (417 . |string|) (422 . -)
              (427 . |jacobiSn|) (433 . |jacobiCn|) (439 . |jacobiDn|)
              (445 . |ellipticE|) (451 . |ellipticF|) (457 . |ellipticPi|)
              (464 . |weierstrassP0|) (471 . |weierstrassPPrime0|)
              (478 . |weierstrassZeta0|) (485 . |weierstrassSigma0|)
              (|Union| 6 '#1#) (492 . |retractIfCan|) (497 . |retractIfCan|)
              (502 . <=) (508 . -) (514 . |pi|) (518 . *) (524 . |sin|)
              (529 . /) '|can_integrate| (535 . |differentiate|) (540 . /)
              (546 . -) (551 . |log|) (556 . |integrate|) (561 . |atan1|)
              (566 . |integ|) (571 . |integ_df|) (577 . |elt|) (|Kernel| $)
              (583 . |coerce|) (588 . |argument|) (|Union| 48 '"failed")
              (593 . |symbolIfCan|) (598 . |has?|) (604 . |is?|)
              (610 . |expIfCan|) (|Union| 43 '"none")
              (|Record| (|:| |pos_Check?| 24) (|:| |atan_Flag| 40)
                        (|:| |coeff_check?| 174) (|:| |inv_check?| 174)
                        (|:| |log_x_replace| 24) (|:| |log_x_val| 7))
              (615 . |powToUPS|) (621 . |second|) (626 . |retract|)
              (631 . |logIfCan|) (636 . |log|) (641 . |abs|) (646 . |localAbs|)
              (651 . |sqrt|) (656 . =) (|Fraction| 26) (662 . |numer|)
              (667 . |pi|) (671 . |pi|) (675 . |coerce|) (680 . |atan|)
              (685 . |acot|) (690 . =) (696 . |atanIfCan|) (701 . |acotIfCan|)
              (706 . |sinIfCan|) (711 . |cosIfCan|) (716 . |tanIfCan|)
              (721 . |cotIfCan|) (726 . |secIfCan|) (731 . |cscIfCan|)
              (736 . |asinIfCan|) (741 . |acosIfCan|) (746 . |asecIfCan|)
              (751 . |acscIfCan|) (756 . |sinhIfCan|) (761 . |coshIfCan|)
              (766 . |tanhIfCan|) (771 . |cothIfCan|) (776 . |sechIfCan|)
              (781 . |cschIfCan|) (786 . |asinhIfCan|) (791 . |acoshIfCan|)
              (796 . |atanhIfCan|) (801 . |acothIfCan|) (806 . |asechIfCan|)
              (811 . |acschIfCan|) (816 . ~=) (822 . |retractIfCan|) (827 . *)
              (833 . *) (|SparseMultivariatePolynomial| 6 166) (839 . |numer|)
              (844 . |denom|) (|Mapping| 7 118) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 118)
              (|PolynomialCategoryLifting| (|IndexedExponents| 118) 118 6 226
                                           7)
              (849 . |map|) (856 . |exp|) (861 . |inv|) (866 . |cos|) (871 . *)
              (877 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 134) (883 . |member?|)
              |FS2UPS2;exprToGenUPS;FEBUU;60| (|List| 166) (889 . |tower|)
              (894 . |unary?|) (|List| 117) (899 . |removeDuplicates|)
              (904 . |is?|) (910 . |center|) (915 . |Zero|) (919 . <) (925 . ^)
              (931 . >) (937 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (942 . |normalize|))
           '#(|powToUPS| 948 |localAbs| 954 |integ_df| 959 |integ| 965
              |exprToUPS| 970 |exprToPS| 977 |exprToGenUPS| 997 |atan1| 1004)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 252
                                                 '(1 7 16 0 17 0 6 0 18 0 7 0
                                                   19 1 9 8 0 20 2 9 7 0 8 21 0
                                                   6 0 22 0 7 0 23 2 7 24 0 0
                                                   25 1 8 0 26 27 2 8 0 0 0 28
                                                   2 9 8 0 8 29 1 26 24 0 30 1
                                                   32 31 7 33 1 8 24 0 34 2 10
                                                   35 9 36 37 1 7 45 0 46 2 49
                                                   47 0 48 50 1 7 51 0 52 0 9 0
                                                   53 2 9 0 0 0 54 1 7 51 0 55
                                                   0 9 0 56 2 9 0 0 0 57 1 7 58
                                                   0 59 1 60 24 0 61 1 60 36 0
                                                   62 1 60 49 0 63 1 7 0 49 64
                                                   2 9 0 7 8 65 1 60 0 0 66 1 7
                                                   68 0 69 2 26 24 0 0 70 2 9 0
                                                   0 36 71 2 9 0 0 26 72 1 7 74
                                                   0 75 2 74 24 48 0 76 1 9 0 7
                                                   77 0 8 0 78 2 8 24 0 0 79 2
                                                   9 0 0 0 80 2 7 0 0 48 81 3
                                                   12 9 9 82 84 85 1 7 0 48 86
                                                   2 87 0 7 7 88 2 7 0 0 89 90
                                                   2 9 0 83 0 91 3 12 9 7 82 84
                                                   92 0 48 0 93 2 7 0 0 0 94 2
                                                   82 9 0 26 95 2 12 9 96 9 97
                                                   0 26 0 98 2 99 7 0 26 100 1
                                                   11 0 7 101 2 11 0 7 36 102 2
                                                   11 0 0 0 103 2 11 0 0 104
                                                   105 2 11 0 0 0 106 0 11 0
                                                   107 2 11 0 104 0 108 2 11 0
                                                   0 0 109 1 11 0 0 110 0 8 0
                                                   111 1 6 0 26 112 1 7 0 6 113
                                                   2 11 0 0 7 114 0 11 0 115 1
                                                   99 7 0 116 1 118 117 0 119 2
                                                   7 0 117 120 121 1 11 122 0
                                                   123 2 7 0 0 124 125 3 12 9
                                                   126 9 99 127 1 128 11 11 129
                                                   2 26 24 0 0 130 2 9 0 26 0
                                                   131 0 104 0 132 1 118 48 0
                                                   133 1 48 134 0 135 1 7 0 0
                                                   136 2 73 11 11 7 137 2 73 11
                                                   11 7 138 2 73 11 11 7 139 2
                                                   73 11 11 7 140 2 73 11 11 7
                                                   141 3 73 11 11 7 7 142 3 128
                                                   11 7 7 11 143 3 128 11 7 7
                                                   11 144 3 128 11 7 7 11 145 3
                                                   128 11 7 7 11 146 1 7 147 0
                                                   148 1 6 31 0 149 2 26 24 0 0
                                                   150 2 7 0 0 0 151 0 7 0 152
                                                   2 7 0 0 0 153 1 7 0 0 154 2
                                                   7 0 0 0 155 1 9 0 0 157 2 9
                                                   0 0 0 158 1 8 0 0 159 1 7 0
                                                   0 160 1 9 0 0 161 1 0 9 9
                                                   162 1 0 9 9 163 2 0 9 9 9
                                                   164 2 7 0 117 0 165 1 7 0
                                                   166 167 1 118 99 0 168 1 118
                                                   169 0 170 2 117 24 0 48 171
                                                   2 118 24 0 48 172 1 10 35 9
                                                   173 2 0 39 99 175 176 1 99 7
                                                   0 177 1 7 26 0 178 1 10 35 9
                                                   179 1 9 0 0 180 1 7 0 0 181
                                                   1 0 7 7 182 1 7 0 0 183 2 40
                                                   24 0 0 184 1 185 26 0 186 0
                                                   9 0 187 0 11 0 188 1 7 0 26
                                                   189 1 7 0 0 190 1 7 0 0 191
                                                   2 8 24 0 0 192 1 10 35 9 193
                                                   1 10 35 9 194 1 10 35 9 195
                                                   1 10 35 9 196 1 10 35 9 197
                                                   1 10 35 9 198 1 10 35 9 199
                                                   1 10 35 9 200 1 10 35 9 201
                                                   1 10 35 9 202 1 10 35 9 203
                                                   1 10 35 9 204 1 10 35 9 205
                                                   1 10 35 9 206 1 10 35 9 207
                                                   1 10 35 9 208 1 10 35 9 209
                                                   1 10 35 9 210 1 10 35 9 211
                                                   1 10 35 9 212 1 10 35 9 213
                                                   1 10 35 9 214 1 10 35 9 215
                                                   1 10 35 9 216 2 7 24 0 0 217
                                                   1 8 122 7 218 2 9 0 7 0 219
                                                   2 8 0 0 0 220 1 7 221 0 222
                                                   1 7 221 0 223 3 227 7 224
                                                   225 226 228 1 7 0 0 229 1 7
                                                   0 0 230 1 7 0 0 231 2 7 0
                                                   104 0 232 2 7 0 117 120 233
                                                   2 236 24 134 0 237 1 7 239 0
                                                   240 1 117 24 0 241 1 242 0 0
                                                   243 2 117 24 0 48 244 1 9 7
                                                   0 245 0 185 0 246 2 185 24 0
                                                   0 247 2 7 0 0 0 248 2 8 24 0
                                                   0 249 1 9 0 0 250 2 251 7 7
                                                   48 252 2 0 39 99 175 176 1 0
                                                   7 7 182 2 0 9 9 9 164 1 0 9
                                                   9 163 3 0 39 7 24 40 41 7 0
                                                   39 7 24 40 24 7 43 43 44 5 0
                                                   39 7 24 40 24 7 42 3 0 39 7
                                                   24 40 238 1 0 9 9 162)))))
           '|lookupComplete|)) 
