
(DEFUN |FS2UPS2;ratIfCan| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 17))) 

(DEFUN |FS2UPS2;check_inverse| (|coef| |opt_rec| $)
  (PROG (#1=#:G285)
    (RETURN
     (COND
      ((QEQCAR (QVELT |opt_rec| 3) 0)
       (SPADCALL |coef|
                 (PROG2 (LETT #1# (QVELT |opt_rec| 3) |FS2UPS2;check_inverse|)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|Mapping| (|Boolean|) (QREFELT $ 7)) #1#))))
      ('T 'T))))) 

(DEFUN |FS2UPS2;check_zero| (|coef| |opt_rec| $)
  (PROG (#1=#:G292)
    (RETURN
     (COND
      ((QEQCAR (QVELT |opt_rec| 4) 0)
       (SPADCALL |coef|
                 (PROG2 (LETT #1# (QVELT |opt_rec| 4) |FS2UPS2;check_zero|)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|Mapping| (|Boolean|) (QREFELT $ 7)) #1#))))
      ('T (SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21))))))) 

(DEFUN |FS2UPS2;carefulNthRootIfCan| (|ups| |n| |opt_rec| |rightOnly?| $)
  (PROG (|ans| #1=#:G318 |signum| #2=#:G303 |coef| |deg| |deg1| |posCheck?|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |posCheck?| (QVELT |opt_rec| 0)
              . #3=(|FS2UPS2;carefulNthRootIfCan|))
        (EXIT
         (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
               (#4='T
                (SEQ (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)) . #3#)
                     (LETT |deg1|
                           (SPADCALL |deg|
                                     (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                                     (QREFELT $ 27))
                           . #3#)
                     (SEQ G190
                          (COND
                           ((NULL
                             (COND
                              ((|FS2UPS2;check_zero|
                                (LETT |coef|
                                      (SPADCALL |ups| |deg| (QREFELT $ 28))
                                      . #3#)
                                |opt_rec| $)
                               (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                              ('T 'NIL)))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (COND
                              ((SPADCALL |coef| (|spadConstant| $ 19)
                                         (QREFELT $ 30))
                               (LETT |ups| (SPADCALL |ups| (QREFELT $ 31))
                                     . #3#)))
                             (LETT |deg| (SPADCALL |ups| |deg1| (QREFELT $ 32))
                                   . #3#)
                             (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                                   . #3#)
                             (EXIT
                              (COND
                               ((SPADCALL |coef| (|spadConstant| $ 19)
                                          (QREFELT $ 21))
                                (PROGN
                                 (LETT #2#
                                       (|error|
                                        "log of series with many leading zero coefficients")
                                       . #3#)
                                 (GO #2#)))))))
                           #2# (EXIT #2#))
                          NIL (GO G190) G191 (EXIT NIL))
                     (COND
                      ((SPADCALL |n| (QREFELT $ 33))
                       (COND
                        (|posCheck?|
                         (SEQ
                          (LETT |signum| (SPADCALL |coef| (QREFELT $ 36))
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |signum| 0)
                             (COND
                              ((EQL (QCDR |signum|) -1)
                               (PROGN
                                (LETT #1#
                                      (|FS2UPS2;stateProblem| "nth root"
                                       "negative leading coefficient" $)
                                      . #3#)
                                (GO #1#)))
                              ((NULL |rightOnly?|)
                               (COND
                                ((NULL (SPADCALL |deg| (QREFELT $ 37)))
                                 (PROGN
                                  (LETT #1#
                                        (|FS2UPS2;stateProblem| "nth root"
                                         "series of non-zero order" $)
                                        . #3#)
                                  (GO #1#))))))))))))))
                     (COND
                      ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                       (EXIT
                        (|FS2UPS2;stateProblem| "nth root"
                         "need to invert bad coefficient" $))))
                     (LETT |ans| (SPADCALL |ups| |n| (QREFELT $ 40)) . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |ans| 1)
                        (|FS2UPS2;stateProblem| "nth root" "no nth root" $))
                       (#4# (CONS 0 (QCDR |ans|)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;stateProblem| (|function| |problem| $)
  (CONS 1 (CONS |function| |problem|))) 

(DEFUN |FS2UPS2;exprToUPS;FEBUU;6| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
           (CONS 1 "none") 'NIL (|spadConstant| $ 19))
   $)) 

(DEFUN |FS2UPS2;exprToPS;FEBUBFEU;7|
       (|fcn| |posCheck?| |atanFlag| |log_flag| |log_val| $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
           (CONS 1 "none") |log_flag| |log_val|)
   $)) 

(DEFUN |FS2UPS2;exprToPS;FEBUBFE3MU;8|
       (|fcn| |posCheck?| |atanFlag| |log_flag| |log_val| |coef_chk| |inv_chk|
        |zero_chk| $)
  (|FS2UPS2;i_expr_to_PS| |fcn|
   (VECTOR |posCheck?| |atanFlag| (CONS 0 |coef_chk|) (CONS 0 |inv_chk|)
           (CONS 0 |zero_chk|) |log_flag| |log_val|)
   $)) 

(DEFUN |FS2UPS2;i_expr_to_PS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 49))
            . #1=(|FS2UPS2;i_expr_to_PS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (|FS2UPS2;polyToUPS|
          (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 53)) |opt_rec| $))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 55)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS2;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS2;i_expr_to_PS|) $) |opt_rec|
                  (|spadConstant| $ 56) (ELT $ 57) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS2;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS2;i_expr_to_PS|) $)
                          |opt_rec| (|spadConstant| $ 59) (ELT $ 60) $))
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
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 62))
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
  (PROG (|ans| #1=#:G421 #2=#:G408 |coef| |deg|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |poly| (QREFELT $ 64)) (CONS 0 (|spadConstant| $ 56)))
             ('T
              (SEQ
               (LETT |deg| (SPADCALL |poly| (QREFELT $ 65))
                     . #3=(|FS2UPS2;polyToUPS|))
               (LETT |coef|
                     (SPADCALL (SPADCALL |poly| (QREFELT $ 66)) (QREFELT $ 67))
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
                     (SPADCALL |coef| (SPADCALL |deg| (QREFELT $ 26))
                               (QREFELT $ 68))
                     . #3#)
               (LETT |poly| (SPADCALL |poly| (QREFELT $ 69)) . #3#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL |poly| (QREFELT $ 64)) 'NIL) ('T 'T)))
                      (GO G191)))
                    (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 65)) . #3#)
                         (LETT |coef|
                               (SPADCALL (SPADCALL |poly| (QREFELT $ 66))
                                         (QREFELT $ 67))
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
                                                             (QREFELT $ 26))
                                                   (QREFELT $ 68))
                                         (QREFELT $ 57))
                               . #3#)
                         (EXIT
                          (LETT |poly| (SPADCALL |poly| (QREFELT $ 69))
                                . #3#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 |ans|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;listToUPS| (|list| |feToUPS| |opt_rec| |ans| |op| $)
  (PROG (#1=#:G430 |term|)
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
      (LETT |expt| (SPADCALL |fcn| (QREFELT $ 72))
            . #1=(|FS2UPS2;isNonTrivPower|))
      (EXIT
       (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |power| (QCDR |expt|) . #1#)
                   (EXIT
                    (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                          (#2# (CONS 0 |power|)))))))))))) 

(DEFUN |FS2UPS2;powerToUPS| (|fcn| |n| |opt_rec| $)
  (PROG (#1=#:G448 |coef| |deg| |ups| |deg1| #2=#:G439 #3=#:G445 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS2;i_expr_to_PS| |fcn| |opt_rec| $)
            . #4=(|FS2UPS2;powerToUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 73))
              (CONS 0
                    (SPADCALL (CDR |b|)
                              (PROG1 (LETT #3# |n| . #4#)
                                (|check_subtype| (> #3# 0) '(|PositiveInteger|)
                                                 #3#))
                              (QREFELT $ 74))))
             ('T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #2# |b| . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                     . #4#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)) . #4#)
               (LETT |deg1|
                     (SPADCALL |deg| (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                               (QREFELT $ 27))
                     . #4#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND
                        ((|FS2UPS2;check_zero|
                          (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                                . #4#)
                          |opt_rec| $)
                         (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                        ('T 'NIL)))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ
                       (COND
                        ((SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 30))
                         (LETT |ups| (SPADCALL |ups| (QREFELT $ 31)) . #4#)))
                       (LETT |deg| (SPADCALL |ups| |deg1| (QREFELT $ 32))
                             . #4#)
                       (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                             . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL |coef| (|spadConstant| $ 19)
                                    (QREFELT $ 21))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "inverse of series with many leading zero coefficients")
                                 . #4#)
                           (GO #1#)))))))
                     #1# (EXIT #1#))
                    NIL (GO G190) G191 (EXIT NIL))
               (COND
                ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                 (EXIT
                  (|FS2UPS2;stateProblem| "power"
                   "need to invert bad coefficient" $))))
               (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75)))))))))))) 

(DEFUN |FS2UPS2;handle_args| (|args| |opt_rec| $)
  (PROG (|lsers| |lsere| |lcoef| |losers| |coef| #1=#:G469 |ups| #2=#:G456
         |nsu| #3=#:G470 |arg|)
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
                      (SPADCALL (QREFELT $ 14) (SPADCALL |arg| (QREFELT $ 78))
                                (QREFELT $ 79)))
                     (SEQ
                      (LETT |losers|
                            (CONS (SPADCALL |arg| (QREFELT $ 80)) |losers|)
                            . #4#)
                      (LETT |lsers| (CONS (|spadConstant| $ 56) |lsers|) . #4#)
                      (LETT |lsere| (CONS (|spadConstant| $ 19) |lsere|) . #4#)
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
                              (SPADCALL |ups| (|spadConstant| $ 81)
                                        (QREFELT $ 32))
                              (|spadConstant| $ 81) (QREFELT $ 29))
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
                                    (SPADCALL |ups| (|spadConstant| $ 81)
                                              (QREFELT $ 28))
                                    . #4#)
                              (LETT |losers| (CONS |ups| |losers|) . #4#)
                              (LETT |lcoef| (CONS |coef| |lcoef|) . #4#)
                              (LETT |lsere|
                                    (CONS (|spadConstant| $ 23) |lsere|) . #4#)
                              (EXIT
                               (LETT |lsers|
                                     (CONS
                                      (SPADCALL |ups|
                                                (SPADCALL |coef|
                                                          (QREFELT $ 80))
                                                (QREFELT $ 82))
                                      |lsers|)
                                     . #4#)))))))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS 0
                   (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                           (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv| (|nf| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G484 |sym| #2=#:G483)
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
      (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT $ 87)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS2;do_taylor_via_deriv!1| (VECTOR $ |lsyms|)) |ups|
              (QREFELT $ 93)))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G480 |sym| #3=#:G479)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 88))
                                             (|spadConstant| $ 19)
                                             (QREFELT $ 90))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 92))))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 83)))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2| (|nk| |lsyms| |lser| $)
  (PROG (|ups| |lders| #1=#:G498 |sym| #2=#:G497)
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
      (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT $ 94)) . #3#)
      (EXIT
       (CONS 0
             (SPADCALL
              (CONS #'|FS2UPS2;do_taylor_via_deriv2!1| (VECTOR $ |lsyms|))
              |ups| (QREFELT $ 93)))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2!1| (|c| $$)
  (PROG (|lsyms| $)
    (LETT |lsyms| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G494 |sym| #3=#:G493)
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
                                   (SPADCALL (SPADCALL |sym| (QREFELT $ 88))
                                             (|spadConstant| $ 19)
                                             (QREFELT $ 90))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 92))))))))) 

(DEFUN |FS2UPS2;do_taylor_via_deriv2!0| (|c| $$)
  (PROG (|sym| $)
    (LETT |sym| (QREFELT $$ 1) . #1=(|FS2UPS2;do_taylor_via_deriv2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 83)))))) 

(DEFUN |FS2UPS2;convert_args| (|lsers| |lsere| |lser0| $)
  (PROG (|nargs| |lser| |lsyms| |nsym| #1=#:G504 |s| #2=#:G505 |e| #3=#:G506
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
                  ((SPADCALL |e| (|spadConstant| $ 19) (QREFELT $ 21))
                   (LETT |nargs| (CONS |c| |nargs|) . #4#))
                  ('T
                   (SEQ (LETT |nsym| (SPADCALL (QREFELT $ 95)) . #4#)
                        (LETT |nargs|
                              (CONS
                               (SPADCALL |c| (SPADCALL |nsym| (QREFELT $ 88))
                                         (QREFELT $ 96))
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
                      (SPADCALL |losers| 1 (QREFELT $ 97)) (QREFELT $ 99))
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
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 100) (QREFELT $ 102))
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
      (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 100) (QREFELT $ 102))
                (SPADCALL |l| 2 (QREFELT $ 102)) |ef|))))) 

(DEFUN |FS2UPS2;besselEq| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;besselEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 107)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                       (SPADCALL |v| 2 (QREFELT $ 107)) (QREFELT $ 108)))))))) 

(DEFUN |FS2UPS2;besselEqm| (|lc| |z0| $)
  (PROG (|zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;besselEqm|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 107)) |zvar|
             (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                       (SPADCALL |v| 2 (QREFELT $ 107)) (QREFELT $ 105)))))))) 

(DEFUN |FS2UPS2;kelvinEq| (|lc| |z0| $)
  (PROG (|v2| |zvar| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;kelvinEq|))
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (LETT |v2|
            (SPADCALL (|spadConstant| $ 109)
                      (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 107))
                                (QREFELT $ 110))
                      (QREFELT $ 105))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 4 (QREFELT $ 107))
             (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 107)) (QREFELT $ 110))
             (SPADCALL
              (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT $ 107))
                        (QREFELT $ 111))
              (QREFELT $ 112))
             (SPADCALL |v2| |zvar| (QREFELT $ 111))
             (SPADCALL
              (SPADCALL (SPADCALL |v| 2 (QREFELT $ 107))
                        (SPADCALL 4 (SPADCALL |v| 2 (QREFELT $ 107))
                                  (QREFELT $ 110))
                        (QREFELT $ 108))
              (SPADCALL |zvar| 4 (QREFELT $ 107)) (QREFELT $ 105)))))))) 

(DEFUN |FS2UPS2;kummerEq| (|lc| |z0| $)
  (PROG (|zvar| |b| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;kummerEq|))
      (LETT |b| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102)) (QREFELT $ 103))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (EXIT
       (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 108))
             (SPADCALL |a| (QREFELT $ 112)))))))) 

(DEFUN |FS2UPS2;legendreEq| (|lc| |z0| $)
  (PROG (|z2| |zvar| |mu| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;legendreEq|))
      (LETT |mu| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102)) (QREFELT $ 103))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (LETT |z2|
            (SPADCALL (|spadConstant| $ 109)
                      (SPADCALL |zvar| 2 (QREFELT $ 107)) (QREFELT $ 108))
            . #1#)
      (EXIT
       (LIST (SPADCALL |z2| 2 (QREFELT $ 107))
             (SPADCALL
              (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 110)) |z2|
                        (QREFELT $ 111))
              (QREFELT $ 112))
             (SPADCALL
              (SPADCALL
               (SPADCALL |nu|
                         (SPADCALL |nu| (|spadConstant| $ 109) (QREFELT $ 105))
                         (QREFELT $ 111))
               |z2| (QREFELT $ 111))
              |mu| (QREFELT $ 108)))))))) 

(DEFUN |FS2UPS2;whittakerEq| (|lc| |z0| $)
  (PROG (|zvar| |o4| |m| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102)) (QREFELT $ 103))
            . #1=(|FS2UPS2;whittakerEq|))
      (LETT |m| (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102)) (QREFELT $ 103))
            . #1#)
      (LETT |o4|
            (SPADCALL (|spadConstant| $ 109)
                      (SPADCALL (SPADCALL 4 (QREFELT $ 114)) (QREFELT $ 115))
                      (QREFELT $ 116))
            . #1#)
      (LETT |zvar|
            (SPADCALL (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                      (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105))
            . #1#)
      (EXIT
       (LIST (SPADCALL |zvar| 2 (QREFELT $ 107)) (|spadConstant| $ 117)
             (SPADCALL
              (SPADCALL
               (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 107)) (QREFELT $ 108))
               (SPADCALL |k| |zvar| (QREFELT $ 111)) (QREFELT $ 105))
              (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                        (SPADCALL (SPADCALL 4 (QREFELT $ 114)) (QREFELT $ 115))
                        (QREFELT $ 116))
              (QREFELT $ 108)))))))) 

(DEFUN |FS2UPS2;do_diff_eq| (|ker| |losers| |lsers| |lsere| |lser0| |getEq| $)
  (PROG (|ups| |lc| #1=#:G542 |c| #2=#:G541 |nker| #3=#:G540 |lsyms| |sym|
         |ecl| #4=#:G539 #5=#:G538 |cn1| |cn1u| |cn| |z0| |nargs| |cargs|)
    (RETURN
     (SEQ
      (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $)
            . #6=(|FS2UPS2;do_diff_eq|))
      (LETT |nargs| (QVELT |cargs| 0) . #6#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| (QREFELT $ 118)) (|spadConstant| $ 19)
                   (QREFELT $ 21))
         (SEQ
          (LETT |nker|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) |nargs|
                          (QREFELT $ 123))
                . #6#)
          (EXIT
           (|FS2UPS2;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))
        (#7='T
         (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 118)) . #6#)
              (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|) . #6#)
              (LETT |cn| (|SPADfirst| |ecl|) . #6#)
              (LETT |cn1u| (SPADCALL |cn| (QREFELT $ 125)) . #6#)
              (EXIT
               (COND
                ((QEQCAR |cn1u| 1)
                 (|error| "do_diff_eq: called at singular point"))
                (#7#
                 (SEQ
                  (LETT |cn1| (SPADCALL (QCDR |cn1u|) (QREFELT $ 112)) . #6#)
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
                                       (SPADCALL |c| |cn1| (QREFELT $ 111))
                                       #5#)
                                      . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        . #6#)
                  (LETT |nker|
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) |nargs|
                                  (QREFELT $ 123))
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
                        (LETT |nker| (SPADCALL |nker| |sym| (QREFELT $ 83))
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
                                                            (QREFELT $ 88))
                                                  (|spadConstant| $ 19)
                                                  (QREFELT $ 90))
                                                 (QREFELT $ 127))
                                       #2#)
                                      . #6#)))
                              (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #6#)
                  (LETT |ups|
                        (SPADCALL (REVERSE |ecl|)
                                  (|SPADfirst| (QVELT |cargs| 1)) |lc|
                                  (QREFELT $ 129))
                        . #6#)
                  (EXIT
                   (|FS2UPS2;do_taylor_via_deriv| |ups| |lsyms| |lsers|
                    $)))))))))))))) 

(DEFUN |FS2UPS2;lambertW0| (|arg| $)
  (SPADCALL (ELT $ 131) |arg| (QREFELT $ 99))) 

(DEFUN |FS2UPS2;do_weierstrass|
       (|losers| |lsers| |lsere| |lser0| |ef| |k| |cz| |opt_rec| $)
  (PROG (#1=#:G553 |nres2| |lsyms| |nres| |nargs| |cargs| |z_inv| |coef| |deg|
         |z_ser|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |lsere| 3 (QREFELT $ 102)) (|spadConstant| $ 19)
                   (QREFELT $ 21))
         (|error| "expansion at 0"))
        (#2='T
         (SEQ
          (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT $ 97))
                . #3=(|FS2UPS2;do_weierstrass|))
          (COND
           ((SPADCALL |cz| 0 (QREFELT $ 132))
            (SEQ
             (LETT |deg|
                   (SPADCALL |z_ser| (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                             (QREFELT $ 32))
                   . #3#)
             (LETT |coef| (SPADCALL |z_ser| |deg| (QREFELT $ 28)) . #3#)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21))
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
                        (SPADCALL |cz| (SPADCALL |z_ser| |k| (QREFELT $ 75))
                                  (QREFELT $ 133))
                        . #3#))))))))
           (#2# (LETT |z_inv| (|spadConstant| $ 56) . #3#)))
          (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $)
                . #3#)
          (LETT |nargs| (QVELT |cargs| 0) . #3#)
          (LETT |nres|
                (SPADCALL
                 (CONS #'|FS2UPS2;do_weierstrass!0| (VECTOR |ef| $ |nargs|))
                 |z_ser| (QREFELT $ 99))
                . #3#)
          (LETT |lsyms| (CDR (QVELT |cargs| 2)) . #3#)
          (LETT |lsers| (CDR (QVELT |cargs| 1)) . #3#)
          (LETT |nres2|
                (|FS2UPS2;do_taylor_via_deriv| |nres| |lsyms| |lsers| $) . #3#)
          (EXIT
           (COND ((QEQCAR |nres2| 1) (PROGN (LETT #1# |nres2| . #3#) (GO #1#)))
                 (#2#
                  (CONS 0
                        (SPADCALL |z_inv| (CDR |nres2|) (QREFELT $ 57))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;do_weierstrass!0| (|f| $$)
  (PROG (|nargs| $ |ef|)
    (LETT |nargs| (QREFELT $$ 2) . #1=(|FS2UPS2;do_weierstrass|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |ef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 134) (QREFELT $ 102))
                (SPADCALL |nargs| 2 (QREFELT $ 102)) |f| |ef|))))) 

(DEFUN |FS2UPS2;spec_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|nker| |nargs| |cargs| #1=#:G676 |nexpr| |narg1| |arg1| |ii| |ir| |nm|
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
                     (LETT |nm| (SPADCALL |ker| (QREFELT $ 135)) . #2#)
                     (COND
                      ((OR (EQUAL |nm| '|besselI|) (EQUAL |nm| '|besselK|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 102))
                                    (|spadConstant| $ 19) (QREFELT $ 21))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0" $))
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
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 102))
                                    (|spadConstant| $ 19) (QREFELT $ 21))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;besselEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|kummerM|) (EQUAL |nm| '|kummerU|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                    (|spadConstant| $ 19) (QREFELT $ 21))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;kummerEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|whittakerM|)
                           (EQUAL |nm| '|whittakerW|))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                    (|spadConstant| $ 19) (QREFELT $ 21))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0" $))
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
                         ((SPADCALL (SPADCALL |lser0| 2 (QREFELT $ 102))
                                    (|spadConstant| $ 19) (QREFELT $ 21))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0" $))
                         (#3#
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;kelvinEq|) $)
                           $))))))
                     (COND
                      ((OR (EQUAL |nm| '|legendreP|) (EQUAL |nm| '|legendreQ|))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                     (|spadConstant| $ 23) (QREFELT $ 21))
                           (SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                     (SPADCALL (|spadConstant| $ 23)
                                               (QREFELT $ 138))
                                     (QREFELT $ 21)))
                          (|FS2UPS2;stateProblem|
                           (SPADCALL |nm| (QREFELT $ 137)) "expansion at +-1"
                           $))
                         ('T
                          (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers| |lsere|
                           |lser0| (CONS (|function| |FS2UPS2;legendreEq|) $)
                           $))))))
                     (COND
                      ((EQUAL |nm| '|lambertW|)
                       (COND
                        ((SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                         (EXIT
                          (CONS 0
                                (|FS2UPS2;lambertW0|
                                 (SPADCALL |losers| 1 (QREFELT $ 97)) $)))))))
                     (EXIT
                      (COND
                       ((EQUAL |nm| '|jacobiSn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 139) $))
                       ((EQUAL |nm| '|jacobiCn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 140) $))
                       ((EQUAL |nm| '|jacobiDn|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 141) $))
                       ((EQUAL |nm| '|ellipticE2|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 142) $))
                       ((EQUAL |nm| '|ellipticF|)
                        (|FS2UPS2;do_ell2| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 143) $))
                       ((EQUAL |nm| '|ellipticPi|)
                        (|FS2UPS2;do_ell3| |losers| |lsers| |lsere| |lser0|
                         (ELT $ 144) $))
                       (#3#
                        (SEQ
                         (COND
                          ((EQUAL |nm| '|weierstrassP|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                       (|spadConstant| $ 19) (QREFELT $ 21))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 145) -2 1 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassPPrime|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                       (|spadConstant| $ 19) (QREFELT $ 21))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 146) -3 -2 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassZeta|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                       (|spadConstant| $ 19) (QREFELT $ 21))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 147) -1 1 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|weierstrassSigma|)
                           (COND
                            ((SPADCALL (SPADCALL |lser0| 3 (QREFELT $ 102))
                                       (|spadConstant| $ 19) (QREFELT $ 21))
                             (EXIT
                              (|FS2UPS2;do_weierstrass| |losers| |lsers|
                               |lsere| |lser0| (ELT $ 148) 0 0 |opt_rec|
                               $))))))
                         (COND
                          ((EQUAL |nm| '|Gamma|)
                           (SEQ
                            (LETT |ir|
                                  (SPADCALL
                                   (SPADCALL |lser0| 1 (QREFELT $ 102))
                                   (QREFELT $ 150))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |ir| 0)
                               (SEQ
                                (LETT |ii|
                                      (SPADCALL (QCDR |ir|) (QREFELT $ 151))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ii| 0)
                                   (COND
                                    ((SPADCALL (QCDR |ii|) 0 (QREFELT $ 152))
                                     (SEQ
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 102))
                                            . #2#)
                                      (LETT |narg1|
                                            (SPADCALL (|spadConstant| $ 23)
                                                      |arg1| (QREFELT $ 153))
                                            . #2#)
                                      (LETT |nker|
                                            (SPADCALL
                                             (SPADCALL |ker| (QREFELT $ 121))
                                             (LIST |narg1|) (QREFELT $ 123))
                                            . #2#)
                                      (LETT |nexpr|
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 154))
                                             (SPADCALL |nker|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 154))
                                                         |arg1|
                                                         (QREFELT $ 155))
                                                        (QREFELT $ 156))
                                                       (QREFELT $ 155))
                                             (QREFELT $ 157))
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
                               (SPADCALL (SPADCALL |ker| (QREFELT $ 121))
                                         |nargs| (QREFELT $ 123))
                               . #2#)
                         (EXIT
                          (|FS2UPS2;do_taylor_via_deriv2| |nker|
                           (QVELT |cargs| 2) (QVELT |cargs| 1) $))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;atan1;2UPS;31| (|ups| $)
  (PROG (|yCoef| |y|)
    (RETURN
     (SEQ
      (LETT |y|
            (SPADCALL (SPADCALL |ups| (QREFELT $ 159))
                      (SPADCALL (|spadConstant| $ 59)
                                (SPADCALL |ups| |ups| (QREFELT $ 60))
                                (QREFELT $ 57))
                      (QREFELT $ 160))
            . #1=(|FS2UPS2;atan1;2UPS;31|))
      (LETT |yCoef|
            (SPADCALL |y| (SPADCALL (|spadConstant| $ 113) (QREFELT $ 161))
                      (QREFELT $ 28))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |yCoef| (QREFELT $ 162)) (|spadConstant| $ 81)
                  (QREFELT $ 68))
        (SPADCALL
         (SPADCALL |y|
                   (SPADCALL |yCoef|
                             (SPADCALL (|spadConstant| $ 113) (QREFELT $ 161))
                             (QREFELT $ 68))
                   (QREFELT $ 82))
         (QREFELT $ 163))
        (QREFELT $ 57))))))) 

(DEFUN |FS2UPS2;integ;2UPS;32| (|f| $) (SPADCALL |f| (QREFELT $ 163))) 

(DEFUN |FS2UPS2;integ_df;3UPS;33| (|f| |xs| $)
  (SPADCALL (SPADCALL (SPADCALL |xs| (QREFELT $ 159)) |f| (QREFELT $ 60))
            (QREFELT $ 163))) 

(PUT '|FS2UPS2;atan1;2UPS;34| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(DEFUN |FS2UPS2;atan1;2UPS;34| (|ups| $)
  (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;35| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(DEFUN |FS2UPS2;integ;2UPS;35| (|f| $)
  (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;36| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(DEFUN |FS2UPS2;integ_df;3UPS;36| (|f| |xs| $)
  (|error| "integ_df called, but no integrate")) 

(PUT '|FS2UPS2;atan1;2UPS;37| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(DEFUN |FS2UPS2;atan1;2UPS;37| (|ups| $)
  (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;38| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(DEFUN |FS2UPS2;integ;2UPS;38| (|f| $)
  (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;39| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(DEFUN |FS2UPS2;integ_df;3UPS;39| (|f| |xs| $)
  (|error| "integ_df called, but no integrate")) 

(DEFUN |FS2UPS2;do_prim| (|ker| |arg0| |opt_rec| $)
  (PROG (#1=#:G689 |ns| |nf| |c0|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QREFELT $ 158)
         (SEQ
          (LETT |c0|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) |arg0|
                          (QREFELT $ 167))
                . #2=(|FS2UPS2;do_prim|))
          (LETT |nf|
                (SPADCALL (SPADCALL |ker| (QREFELT $ 169)) (QREFELT $ 14)
                          (QREFELT $ 83))
                . #2#)
          (LETT |ns| (|FS2UPS2;i_expr_to_PS| |nf| |opt_rec| $) . #2#)
          (EXIT
           (COND ((QEQCAR |ns| 1) (PROGN (LETT #1# |ns| . #2#) (GO #1#)))
                 (#3='T
                  (CONS 0
                        (SPADCALL (SPADCALL |c0| (QREFELT $ 80))
                                  (SPADCALL (CDR |ns|) (QREFELT $ 165))
                                  (QREFELT $ 57))))))))
        (#3#
         (|FS2UPS2;spec_to_UPS| |ker| (SPADCALL |ker| (QREFELT $ 170))
          |opt_rec| $))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;prim_to_UPS| (|ker| |args| |opt_rec| $)
  (PROG (|coef| #1=#:G706 |ups| #2=#:G456 |nsu| |arg| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nm| (SPADCALL |ker| (QREFELT $ 135))
              . #3=(|FS2UPS2;prim_to_UPS|))
        (EXIT
         (COND
          ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 132))
           (|FS2UPS2;stateProblem| (SPADCALL |nm| (QREFELT $ 137))
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
                        (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 32))
                        (|spadConstant| $ 81) (QREFELT $ 29))
                       (PROGN
                        (LETT #1#
                              (|FS2UPS2;stateProblem| "handle_args"
                               "argument not Taylor" $)
                              . #3#)
                        (GO #1#)))
                      (#4#
                       (SEQ
                        (LETT |coef|
                              (SPADCALL |ups| (|spadConstant| $ 81)
                                        (QREFELT $ 28))
                              . #3#)
                        (COND
                         ((OR (EQUAL |nm| '|Ei|)
                              (OR (EQUAL |nm| '|Ci|)
                                  (OR (EQUAL |nm| '|Chi|)
                                      (EQUAL |nm| '|dilog|))))
                          (EXIT
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 19)
                                       (QREFELT $ 21))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0"
                              $))
                            (#4#
                             (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))))))
                        (EXIT
                         (COND
                          ((EQUAL |nm| '|li|)
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 19)
                                       (QREFELT $ 21))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 137)) "expansion at 0"
                              $))
                            ((SPADCALL |coef| (|spadConstant| $ 23)
                                       (QREFELT $ 21))
                             (|FS2UPS2;stateProblem|
                              (SPADCALL |nm| (QREFELT $ 137)) "expansion at 1"
                              $))
                            (#4#
                             (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))))
                          ((OR (EQUAL |nm| '|Si|)
                               (OR (EQUAL |nm| '|Shi|)
                                   (OR (EQUAL |nm| '|erf|)
                                       (OR (EQUAL |nm| '|erfi|)
                                           (OR (EQUAL |nm| '|fresnelS|)
                                               (EQUAL |nm| '|fresnelC|))))))
                           (|FS2UPS2;do_prim| |ker| |coef| |opt_rec| $))
                          ('T
                           (|FS2UPS2;stateProblem|
                            (SPADCALL (SPADCALL |ker| (QREFELT $ 135))
                                      (QREFELT $ 137))
                            "unimplemented" $))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;kernelToUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G720 |n| |arg| |op| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 172))
            . #2=(|FS2UPS2;kernelToUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 14))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 23) (|spadConstant| $ 113)
                           (QREFELT $ 68))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 169))
                           (|spadConstant| $ 81) (QREFELT $ 68))))))
        ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 170)) . #2#))
             (NULL
              (SPADCALL (QREFELT $ 14)
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 169))
                                  (QREFELT $ 78))
                        (QREFELT $ 79))))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 169)) (|spadConstant| $ 81)
                         (QREFELT $ 68))))
        ('T
         (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 121)) . #2#)
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT $ 173))
                 (|FS2UPS2;spec_to_UPS| |ker| |args| |opt_rec| $))
                ((SPADCALL |op| '|prim| (QREFELT $ 173))
                 (|FS2UPS2;prim_to_UPS| |ker| |args| |opt_rec| $))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 174))
                         (|FS2UPS2;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 155)) 2 |opt_rec|
                          $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 174))
                         (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|log| (QREFELT $ 174))
                         (|FS2UPS2;logToUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 174))
                         (|FS2UPS2;applyIfCan| (ELT $ 175) |arg| "exp"
                          |opt_rec| $))
                        (#3# (|FS2UPS2;tranToUPS| |ker| |arg| |opt_rec| $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 174))
                 (SPADCALL |args| |opt_rec| (QREFELT $ 178)))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 174))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 179))
                                  (QREFELT $ 180))
                        . #2#)
                  (EXIT
                   (|FS2UPS2;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #1# |n| . #2#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |opt_rec| $))))
                (#3#
                 (|FS2UPS2;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 135)) (QREFELT $ 137))
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
  (PROG (|logTerm| |lt| #1=#:G749 #2=#:G754 #3=#:G752 |signum| #4=#:G737 |coef|
         |deg| |ups| |deg1| #5=#:G456 |result|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $)
              . #6=(|FS2UPS2;logToUPS|))
        (EXIT
         (COND ((QEQCAR |result| 1) |result|)
               (#7='T
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |ups|
                         (PROG2 (LETT #5# |result| . #6#)
                             (QCDR #5#)
                           (|check_union| (QEQCAR #5# 0) (QREFELT $ 9) #5#))
                         . #6#)
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)) . #6#)
                   (LETT |deg1|
                         (SPADCALL |deg|
                                   (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                                   (QREFELT $ 27))
                         . #6#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((|FS2UPS2;check_zero|
                              (LETT |coef|
                                    (SPADCALL |ups| |deg| (QREFELT $ 28))
                                    . #6#)
                              |opt_rec| $)
                             (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                            ('T 'NIL)))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ
                           (COND
                            ((SPADCALL |coef| (|spadConstant| $ 19)
                                       (QREFELT $ 30))
                             (LETT |ups| (SPADCALL |ups| (QREFELT $ 31))
                                   . #6#)))
                           (LETT |deg| (SPADCALL |ups| |deg1| (QREFELT $ 32))
                                 . #6#)
                           (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                                 . #6#)
                           (EXIT
                            (COND
                             ((SPADCALL |coef| (|spadConstant| $ 19)
                                        (QREFELT $ 21))
                              (PROGN
                               (LETT #4#
                                     (|error|
                                      "log of series with many leading zero coefficients")
                                     . #6#)
                               (GO #4#)))))))
                         #4# (EXIT #4#))
                        NIL (GO G190) G191 (EXIT NIL))
                   (COND
                    ((NULL (QVELT |opt_rec| 5))
                     (COND
                      ((NULL (SPADCALL |deg| (QREFELT $ 37)))
                       (EXIT
                        (|FS2UPS2;stateProblem| "log"
                         "series of non-zero order" $))))))
                   (COND
                    ((QVELT |opt_rec| 0)
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 36)) . #6#)
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
                                         . #6#)
                                   (GO #2#))
                                  . #6#)
                            (GO #3#))))))))))
                   (COND
                    ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                     (PROGN
                      (LETT #2#
                            (|FS2UPS2;stateProblem| "log"
                             "need to invert bad coefficient" $)
                            . #6#)
                      (GO #2#))))
                   (EXIT
                    (COND
                     ((SPADCALL |deg| (QREFELT $ 37))
                      (CONS 0
                            (PROG2
                                (LETT #1# (SPADCALL |ups| (QREFELT $ 181))
                                      . #6#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                             #1#))))
                     (#7#
                      (SEQ
                       (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 68)) . #6#)
                       (LETT |logTerm|
                             (SPADCALL (SPADCALL |coef| (QREFELT $ 162))
                                       (SPADCALL
                                        (SPADCALL |deg| (QREFELT $ 13))
                                        (QVELT |opt_rec| 6) (QREFELT $ 155))
                                       (QREFELT $ 96))
                             . #6#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL |logTerm| (|spadConstant| $ 81)
                                         (QREFELT $ 68))
                               (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 160))
                                         (QREFELT $ 182))
                               (QREFELT $ 57))))))))))
                 #3# (EXIT #3#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FS2UPS2;localAbs;2FE;45| (|fcn| $) (SPADCALL |fcn| (QREFELT $ 183))) 

(DEFUN |FS2UPS2;localAbs;2FE;46| (|fcn| $)
  (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 155)) (QREFELT $ 185))) 

(DEFUN |FS2UPS2;signOfExpression| (|arg| $)
  (SPADCALL (SPADCALL |arg| (QREFELT $ 184)) |arg| (QREFELT $ 157))) 

(DEFUN |FS2UPS2;atanacot2| (|ups| |coef| |ord| |opt_rec| |plusMinus| $)
  (PROG (|cc| |n| |left?| |posNegPi2| |signum| |lc| #1=#:G779 |rn| |atanFlag|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |atanFlag| (QVELT |opt_rec| 1) . #2=(|FS2UPS2;atanacot2|))
            (LETT |cc|
                  (COND
                   ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 29))
                    (COND
                     ((SPADCALL |atanFlag| (CONS 0 "complex") (QREFELT $ 186))
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
                                       (QREFELT $ 186))
                             (COND
                              ((ODDP (SPADCALL (QCDR |rn|) (QREFELT $ 188)))
                               (PROGN
                                (LETT #1#
                                      (|FS2UPS2;stateProblem| "atan"
                                       "branch problem" $)
                                      . #2#)
                                (GO #1#))))))
                           (LETT |lc| (SPADCALL |ups| |ord| (QREFELT $ 28))
                                 . #2#)
                           (LETT |signum| (SPADCALL |lc| (QREFELT $ 36)) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |signum| 1)
                              (COND
                               ((SPADCALL |atanFlag| (CONS 4 "just do it")
                                          (QREFELT $ 186))
                                (COND
                                 ((EQL |plusMinus| 1)
                                  (SPADCALL (SPADCALL (QREFELT $ 154))
                                            (SPADCALL 2 (QREFELT $ 191))
                                            (QREFELT $ 157)))
                                 (#3# (|spadConstant| $ 19))))
                               (#3#
                                (SEQ
                                 (LETT |posNegPi2|
                                       (SPADCALL
                                        (SPADCALL
                                         (|FS2UPS2;signOfExpression| |lc| $)
                                         (SPADCALL (QREFELT $ 154))
                                         (QREFELT $ 155))
                                        (SPADCALL 2 (QREFELT $ 191))
                                        (QREFELT $ 157))
                                       . #2#)
                                 (EXIT
                                  (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                        (#3#
                                         (SPADCALL
                                          (SPADCALL (SPADCALL (QREFELT $ 154))
                                                    (SPADCALL 2
                                                              (QREFELT $ 191))
                                                    (QREFELT $ 157))
                                          |posNegPi2| (QREFELT $ 153)))))))))
                             (#3#
                              (SEQ
                               (LETT |left?|
                                     (SPADCALL |atanFlag|
                                               (CONS 2 "real: left side")
                                               (QREFELT $ 186))
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
                                       (SPADCALL (SPADCALL (QREFELT $ 154))
                                                 (SPADCALL 2 (QREFELT $ 191))
                                                 (QREFELT $ 157))
                                       (QREFELT $ 138)))
                                     (#3# (SPADCALL (QREFELT $ 154))))))
                                  ((NULL |left?|)
                                   (COND
                                    ((EQL |n| -1)
                                     (EXIT
                                      (COND
                                       ((EQL |plusMinus| 1)
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 154))
                                                   (SPADCALL 2 (QREFELT $ 191))
                                                   (QREFELT $ 157))
                                         (QREFELT $ 138)))
                                       (#3# (SPADCALL (QREFELT $ 154))))))))))
                                ((EQL |n| -1)
                                 (EXIT
                                  (COND
                                   ((EQL |plusMinus| 1)
                                    (SPADCALL
                                     (SPADCALL (SPADCALL (QREFELT $ 154))
                                               (SPADCALL 2 (QREFELT $ 191))
                                               (QREFELT $ 157))
                                     (QREFELT $ 138)))
                                   (#3# (SPADCALL (QREFELT $ 154)))))))
                               (EXIT
                                (COND
                                 ((EQL |plusMinus| 1)
                                  (SPADCALL (SPADCALL (QREFELT $ 154))
                                            (SPADCALL 2 (QREFELT $ 191))
                                            (QREFELT $ 157)))
                                 (#3# (|spadConstant| $ 19))))))))))))))))
                   ((EQL |plusMinus| 1) (SPADCALL |coef| (QREFELT $ 192)))
                   (#3# (SPADCALL |coef| (QREFELT $ 193))))
                  . #2#)
            (EXIT
             (CONS 0
                   (SPADCALL (SPADCALL |cc| (QREFELT $ 80))
                             (SPADCALL
                              (SPADCALL |plusMinus|
                                        (SPADCALL (|spadConstant| $ 59)
                                                  (SPADCALL
                                                   (|spadConstant| $ 59)
                                                   (SPADCALL |ups| |ups|
                                                             (QREFELT $ 60))
                                                   (QREFELT $ 57))
                                                  (QREFELT $ 160))
                                        (QREFELT $ 133))
                              |ups| (QREFELT $ 166))
                             (QREFELT $ 57))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS2UPS2;atancotToUPS| (|arg| |opt_rec| |plusMinus| $)
  (PROG (|res1| #1=#:G787 #2=#:G789 |ord| |coef| |ups| #3=#:G456 |result|)
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
                         (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 28))
                         . #4#)
                   (SEQ
                    (LETT |ord|
                          (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 32))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 194))
                       (COND
                        ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 155))
                                   (SPADCALL (|spadConstant| $ 23)
                                             (QREFELT $ 138))
                                   (QREFELT $ 21))
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
                     ((QREFELT $ 158)
                      (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                       |plusMinus| $))
                     ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 29))
                      (|FS2UPS2;stateProblem| "atan"
                       "argument of negative order" $))
                     (#5#
                      (SEQ
                       (LETT |res1|
                             (COND
                              ((EQL |plusMinus| 1)
                               (SPADCALL |ups| (QREFELT $ 195)))
                              (#5# (SPADCALL |ups| (QREFELT $ 196))))
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
   ((SPADCALL |ker| '|sin| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 197) |arg| "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 198) |arg| "cos" |opt_rec| $))
   ((SPADCALL |ker| '|tan| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 199) |arg| "tan" |opt_rec| $))
   ((SPADCALL |ker| '|cot| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 200) |arg| "cot" |opt_rec| $))
   ((SPADCALL |ker| '|sec| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 201) |arg| "sec" |opt_rec| $))
   ((SPADCALL |ker| '|csc| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 202) |arg| "csc" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 203) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 204) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 174))
    (|FS2UPS2;atancotToUPS| |arg| |opt_rec| 1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 174))
    (|FS2UPS2;atancotToUPS| |arg| |opt_rec| -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 205) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 206) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|sinh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 207) |arg| "sinh" |opt_rec| $))
   ((SPADCALL |ker| '|cosh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 208) |arg| "cosh" |opt_rec| $))
   ((SPADCALL |ker| '|tanh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 209) |arg| "tanh" |opt_rec| $))
   ((SPADCALL |ker| '|coth| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 210) |arg| "coth" |opt_rec| $))
   ((SPADCALL |ker| '|sech| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 211) |arg| "sech" |opt_rec| $))
   ((SPADCALL |ker| '|csch| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 212) |arg| "csch" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 213) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 214) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 215) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 216) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 217) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 174))
    (|FS2UPS2;applyIfCan| (ELT $ 218) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS2;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 135)) (QREFELT $ 137))
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
                     (|FS2UPS2;i_expr_to_PS| (SPADCALL |args| (QREFELT $ 179))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL (CDR |expon|) (CDR |logBase|)
                                         (QREFELT $ 60))
                               (QREFELT $ 175))
                              . #1#)
                        (EXIT
                         (COND
                          ((QEQCAR |ans| 1)
                           (|FS2UPS2;stateProblem| "exp"
                            "essential singularity" $))
                          (#2# (CONS 0 (QCDR |ans|))))))))))))))))) 

(DEFUN |FS2UPS2;powToUPS;LRU;53| (|args| |opt_rec| $)
  (PROG (|ans1| |lbu| |b1| |eb| |bs| |pow_base| |ep| |pow|)
    (RETURN
     (SEQ
      (LETT |pow| (SPADCALL |args| (QREFELT $ 179))
            . #1=(|FS2UPS2;powToUPS;LRU;53|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pow| (QREFELT $ 14) (QREFELT $ 83))
                   (|spadConstant| $ 19) (QREFELT $ 30))
         (|FS2UPS2;powToUPS2| |args| |opt_rec| $))
        (#2='T
         (SEQ (LETT |ep| (SPADCALL |pow| (QREFELT $ 219)) . #1#)
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
                               (LETT |eb| (SPADCALL |bs| (QREFELT $ 24)) . #1#)
                               (COND
                                ((SPADCALL (SPADCALL |bs| |eb| (QREFELT $ 28))
                                           (|spadConstant| $ 19)
                                           (QREFELT $ 21))
                                 (SEQ
                                  (LETT |eb|
                                        (SPADCALL |bs|
                                                  (SPADCALL |eb|
                                                            (SPADCALL 1000
                                                                      (QREFELT
                                                                       $ 26))
                                                            (QREFELT $ 27))
                                                  (QREFELT $ 32))
                                        . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |bs| |eb| (QREFELT $ 28))
                                      (|spadConstant| $ 19) (QREFELT $ 21))
                                     (|error|
                                      "powToUPS: series with many zero terms")))))))
                               (LETT |b1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 23)
                                                (SPADCALL |eb| (QREFELT $ 161))
                                                (QREFELT $ 68))
                                      |bs| (QREFELT $ 60))
                                     . #1#)
                               (LETT |lbu| (SPADCALL |b1| (QREFELT $ 181))
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
                                                    (QREFELT $ 220))
                                          (QREFELT $ 175))
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |ans1| 1)
                                      (|FS2UPS2;stateProblem| "pow"
                                       "transcendental exp" $))
                                     (#2#
                                      (CONS 0
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| $ 23)
                                                       (SPADCALL (QCDR |ep|)
                                                                 |eb|
                                                                 (QREFELT $
                                                                          221))
                                                       (QREFELT $ 68))
                                             (QCDR |ans1|)
                                             (QREFELT $ 60))))))))))))))))
                (#2# (|FS2UPS2;powToUPS2| |args| |opt_rec| $)))))))))))) 

(DEFUN |FS2UPS2;powToUPS;LRU;54| (|args| |opt_rec| $)
  (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(DEFUN |FS2UPS2;powToUPS;LRU;55| (|args| |opt_rec| $)
  (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(DEFUN |FS2UPS2;newElem| (|f| $)
  (SPADCALL (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 223)) $)
            (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 224)) $)
            (QREFELT $ 157))) 

(DEFUN |FS2UPS2;smpElem| (|p| $)
  (SPADCALL (CONS (|function| |FS2UPS2;k2Elem|) $) (ELT $ 115) |p|
            (QREFELT $ 229))) 

(DEFUN |FS2UPS2;k2Elem| (|k| $)
  (PROG (|cosz| |sinz| |iez| |ez| |z| |args| #1=#:G892 |a| #2=#:G891)
    (RETURN
     (SEQ
      (LETT |args|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;k2Elem|))
             (SEQ (LETT |a| NIL . #3#)
                  (LETT #1# (SPADCALL |k| (QREFELT $ 170)) . #3#) G190
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
       (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 169)))
             (#4='T
              (SEQ
               (LETT |iez|
                     (SPADCALL
                      (LETT |ez|
                            (SPADCALL (LETT |z| (|SPADfirst| |args|) . #3#)
                                      (QREFELT $ 230))
                            . #3#)
                      (QREFELT $ 231))
                     . #3#)
               (LETT |sinz| (SPADCALL |z| (QREFELT $ 156)) . #3#)
               (LETT |cosz| (SPADCALL |z| (QREFELT $ 232)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL |k| '|tan| (QREFELT $ 174))
                  (SPADCALL |sinz| |cosz| (QREFELT $ 157)))
                 ((SPADCALL |k| '|cot| (QREFELT $ 174))
                  (SPADCALL |cosz| |sinz| (QREFELT $ 157)))
                 ((SPADCALL |k| '|sec| (QREFELT $ 174))
                  (SPADCALL |cosz| (QREFELT $ 231)))
                 ((SPADCALL |k| '|csc| (QREFELT $ 174))
                  (SPADCALL |sinz| (QREFELT $ 231)))
                 ((SPADCALL |k| '|sinh| (QREFELT $ 174))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 153))
                            (SPADCALL 2 (QREFELT $ 191)) (QREFELT $ 157)))
                 ((SPADCALL |k| '|cosh| (QREFELT $ 174))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                            (SPADCALL 2 (QREFELT $ 191)) (QREFELT $ 157)))
                 ((SPADCALL |k| '|tanh| (QREFELT $ 174))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 153))
                            (SPADCALL |ez| |iez| (QREFELT $ 96))
                            (QREFELT $ 157)))
                 ((SPADCALL |k| '|coth| (QREFELT $ 174))
                  (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                            (SPADCALL |ez| |iez| (QREFELT $ 153))
                            (QREFELT $ 157)))
                 ((SPADCALL |k| '|sech| (QREFELT $ 174))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                                      (QREFELT $ 231))
                            (QREFELT $ 233)))
                 ((SPADCALL |k| '|csch| (QREFELT $ 174))
                  (SPADCALL 2
                            (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 153))
                                      (QREFELT $ 231))
                            (QREFELT $ 233)))
                 (#4#
                  (SPADCALL (SPADCALL |k| (QREFELT $ 121)) |args|
                            (QREFELT $ 234))))))))))))) 

(DEFUN |FS2UPS2;contOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 235) (QREFELT $ 238))) 

(DEFUN |FS2UPS2;bddOnReals?| (|fcn| $)
  (SPADCALL |fcn| (QREFELT $ 236) (QREFELT $ 238))) 

(DEFUN |FS2UPS2;exprToGenUPS;FEBUU;61| (|fcn| |posCheck?| |atanFlag| $)
  (|FS2UPS2;iExprToGenUPS| (|FS2UPS2;newElem| |fcn| $)
   (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
           (CONS 1 "none") 'NIL (|spadConstant| $ 19))
   $)) 

(DEFUN |FS2UPS2;iExprToGenUPS| (|fcn| |opt_rec| $)
  (PROG (|ker| |power| |expt| |prod| |sum| |poly|)
    (RETURN
     (SEQ
      (LETT |poly| (SPADCALL |fcn| (QREFELT $ 49))
            . #1=(|FS2UPS2;iExprToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |poly| 0)
         (|FS2UPS2;polyToUPS|
          (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 53)) |opt_rec| $))
        (#2='T
         (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 55)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |sum| 0)
                 (|FS2UPS2;listToUPS| (QCDR |sum|)
                  (CONS (|function| |FS2UPS2;iExprToGenUPS|) $) |opt_rec|
                  (|spadConstant| $ 56) (ELT $ 57) $))
                (#2#
                 (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58)) . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |prod| 0)
                         (|FS2UPS2;listToUPS| (QCDR |prod|)
                          (CONS (|function| |FS2UPS2;iExprToGenUPS|) $)
                          |opt_rec| (|spadConstant| $ 59) (ELT $ 60) $))
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
                              (LETT |ker| (SPADCALL |fcn| (QREFELT $ 62))
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
  (PROG (|opList| |op| #1=#:G936 |k| #2=#:G935)
    (RETURN
     (SEQ
      (LETT |opList|
            (PROGN
             (LETT #2# NIL . #3=(|FS2UPS2;opsInvolvingX|))
             (SEQ (LETT |k| NIL . #3#)
                  (LETT #1# (SPADCALL |fcn| (QREFELT $ 241)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND
                       ((SPADCALL
                         (LETT |op| (SPADCALL |k| (QREFELT $ 121)) . #3#)
                         (QREFELT $ 242))
                        (SPADCALL (QREFELT $ 14)
                                  (SPADCALL
                                   (|SPADfirst| (SPADCALL |k| (QREFELT $ 170)))
                                   (QREFELT $ 78))
                                  (QREFELT $ 79)))
                       ('T 'NIL))
                      (LETT #2# (CONS |op| #2#) . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |opList| (QREFELT $ 244))))))) 

(DEFUN |FS2UPS2;opInOpList?| (|name| |opList| $)
  (PROG (#1=#:G938 #2=#:G940 #3=#:G941 |op|)
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
                  ((SPADCALL |op| |name| (QREFELT $ 245))
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
     (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 62)) |FS2UPS2;exponential?|)
          (EXIT
           (COND
            ((QEQCAR |ker| 0) (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 174)))
            ('T 'NIL))))))) 

(DEFUN |FS2UPS2;productOfNonZeroes?| (|fcn| $)
  (PROG (#1=#:G952 #2=#:G956 #3=#:G957 |term| |prod|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|FS2UPS2;exponential?| |fcn| $) 'T)
             (#4='T
              (SEQ
               (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58))
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
                                               (SPADCALL |term| (QREFELT $ 78))
                                               (QREFELT $ 79))
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
  (PROG (|xOpList| |coef| |deg| |ups| #1=#:G456 #2=#:G962 |b|)
    (RETURN
     (SEQ
      (LETT |b| (|FS2UPS2;iExprToGenUPS| |fcn| |opt_rec| $)
            . #3=(|FS2UPS2;powerToGenUPS|))
      (EXIT
       (COND ((QEQCAR |b| 1) |b|)
             ((SPADCALL |n| 0 (QREFELT $ 73))
              (CONS 0
                    (SPADCALL (CDR |b|)
                              (PROG1 (LETT #2# |n| . #3#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#))
                              (QREFELT $ 74))))
             (#4='T
              (SEQ
               (LETT |ups|
                     (PROG2 (LETT #1# |b| . #3#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                     . #3#)
               (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)) . #3#)
               (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 32))
                              . #3#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 19)
                                     (QREFELT $ 21))
                           (|error|
                            "inverse of series with many leading zero coefficients")))))))))
               (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |coef| $) . #3#)
               (EXIT
                (COND
                 ((NULL |xOpList|)
                  (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75))))
                 (#4#
                  (SEQ
                   (COND
                    ((NULL (CDR |xOpList|))
                     (COND
                      ((SPADCALL (|SPADfirst| |xOpList|) '|log|
                                 (QREFELT $ 245))
                       (EXIT (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75))))))))
                   (EXIT
                    (COND
                     ((|FS2UPS2;productOfNonZeroes?| |coef| $)
                      (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75))))
                     (#4#
                      (|FS2UPS2;stateProblem| "inv"
                       "lowest order coefficient involves x" $)))))))))))))))) 

(DEFUN |FS2UPS2;kernelToGenUPS| (|ker| |opt_rec| $)
  (PROG (#1=#:G979 |n| |arg| |args| |sym|)
    (RETURN
     (SEQ
      (LETT |sym| (SPADCALL |ker| (QREFELT $ 172))
            . #2=(|FS2UPS2;kernelToGenUPS|))
      (EXIT
       (COND
        ((QEQCAR |sym| 0)
         (COND
          ((EQUAL (QCDR |sym|) (QREFELT $ 14))
           (CONS 0
                 (SPADCALL (|spadConstant| $ 23) (|spadConstant| $ 113)
                           (QREFELT $ 68))))
          (#3='T
           (CONS 0
                 (SPADCALL (SPADCALL |ker| (QREFELT $ 169))
                           (|spadConstant| $ 81) (QREFELT $ 68))))))
        ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 170)) . #2#))
         (CONS 0
               (SPADCALL (SPADCALL |ker| (QREFELT $ 169)) (|spadConstant| $ 81)
                         (QREFELT $ 68))))
        ((NULL (CDR |args|))
         (SEQ (LETT |arg| (|SPADfirst| |args|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |ker| '|abs| (QREFELT $ 174))
                 (|FS2UPS2;nthRootToGenUPS|
                  (SPADCALL |arg| |arg| (QREFELT $ 155)) 2 |opt_rec| $))
                ((SPADCALL |ker| '|%paren| (QREFELT $ 174))
                 (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|log| (QREFELT $ 174))
                 (|FS2UPS2;logToGenUPS| |arg| |opt_rec| $))
                ((SPADCALL |ker| '|exp| (QREFELT $ 174))
                 (|FS2UPS2;expToGenUPS| |arg| |opt_rec| $))
                (#3# (|FS2UPS2;tranToGenUPS| |ker| |arg| |opt_rec| $))))))
        ((SPADCALL |ker| '|%power| (QREFELT $ 174))
         (|FS2UPS2;powToGenUPS| |args| |opt_rec| $))
        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 174))
         (SEQ
          (LETT |n|
                (SPADCALL (SPADCALL |args| (QREFELT $ 179)) (QREFELT $ 180))
                . #2#)
          (EXIT
           (|FS2UPS2;nthRootToGenUPS| (|SPADfirst| |args|)
            (PROG1 (LETT #1# |n| . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |opt_rec| $))))
        (#3#
         (|FS2UPS2;stateProblem|
          (SPADCALL (SPADCALL |ker| (QREFELT $ 135)) (QREFELT $ 137))
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
  (PROG (|logTerm| |term1| |pow| |mon| |negRat?| |rat| |cen| |lt| #1=#:G1006
         #2=#:G1008 |signum| |coef| |deg| |ups| #3=#:G456 |result|)
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
                   (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)) . #4#)
                   (SEQ
                    (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21))
                       (SEQ
                        (LETT |deg|
                              (SPADCALL |ups|
                                        (SPADCALL |deg|
                                                  (SPADCALL (QREFELT $ 15)
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 32))
                              . #4#)
                        (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |coef| (|spadConstant| $ 19)
                                     (QREFELT $ 21))
                           (|error|
                            "log of series with many leading zero coefficients")))))))))
                   (COND
                    ((QVELT |opt_rec| 0)
                     (SEQ
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 36)) . #4#)
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
                   (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 68)) . #4#)
                   (LETT |cen| (SPADCALL |lt| (QREFELT $ 246)) . #4#)
                   (LETT |negRat?|
                         (SEQ (LETT |rat| (|FS2UPS2;ratIfCan| |coef| $) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |rat| 0)
                                 (COND
                                  ((SPADCALL (QCDR |rat|)
                                             (|spadConstant| $ 247)
                                             (QREFELT $ 248))
                                   'T)
                                  (#5# 'NIL)))
                                (#5# 'NIL))))
                         . #4#)
                   (LETT |logTerm|
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 14) (QREFELT $ 88)) |cen|
                                 (QREFELT $ 153))
                                . #4#)
                          (LETT |pow|
                                (SPADCALL |mon| (SPADCALL |deg| (QREFELT $ 13))
                                          (QREFELT $ 249))
                                . #4#)
                          (EXIT
                           (COND
                            (|negRat?|
                             (SPADCALL (SPADCALL |coef| |pow| (QREFELT $ 155))
                                       (QREFELT $ 162)))
                            (#5#
                             (SEQ
                              (LETT |term1|
                                    (SPADCALL (SPADCALL |deg| (QREFELT $ 13))
                                              (SPADCALL |mon| (QREFELT $ 162))
                                              (QREFELT $ 155))
                                    . #4#)
                              (EXIT
                               (SPADCALL (SPADCALL |coef| (QREFELT $ 162))
                                         |term1| (QREFELT $ 96))))))))
                         . #4#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (SPADCALL |logTerm| (|spadConstant| $ 81)
                                     (QREFELT $ 68))
                           (SPADCALL (SPADCALL |ups| |lt| (QREFELT $ 160))
                                     (QREFELT $ 182))
                           (QREFELT $ 57))))))
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
      (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 113) (QREFELT $ 32))
            . #1=(|FS2UPS2;expGenUPS|))
      (EXIT
       (COND
        ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 29))
         (|FS2UPS2;stateProblem| "exp" "essential singularity" $))
        ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 250))
         (CONS 0 (SPADCALL |ups| (QREFELT $ 251))))
        (#2='T
         (SEQ
          (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 28))
                . #1#)
          (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| $) . #1#)
          (COND
           ((NULL (|FS2UPS2;opInOpList?| '|log| |xOpList| $))
            (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 251))))))
          (LETT |expCoef|
                (SPADCALL (SPADCALL |lc| (QREFELT $ 230)) (QREFELT $ 14)
                          (QREFELT $ 253))
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
                                                                           81)
                                                           (QREFELT $ 68))
                                                 (QREFELT $ 82))
                                       (QREFELT $ 251))
                                      (QREFELT $ 60)))))))))))))))))) 

(DEFUN |FS2UPS2;atancotToGenUPS| (|fe| |arg| |opt_rec| |plusMinus| $)
  (PROG (#1=#:G1022 |ord| |coef| |ups| #2=#:G456 |trouble| |result|)
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
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 81) (QREFELT $ 68))))
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
            (LETT |coef| (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 28))
                  . #3#)
            (SEQ
             (LETT |ord| (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 32))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 194))
                (COND
                 ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 155))
                            (SPADCALL (|spadConstant| $ 23) (QREFELT $ 138))
                            (QREFELT $ 21))
                  (PROGN
                   (LETT #1# (CONS 0 (SPADCALL |ups| (QREFELT $ 164))) . #3#)
                   (GO #1#))))))))
            (EXIT
             (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec| |plusMinus|
              $))))
          #1# (EXIT #1#))))))))) 

(DEFUN |FS2UPS2;genUPSApplyIfCan| (|fcn| |arg| |fcnName| |opt_rec| $)
  (PROG (#1=#:G1027 |xOpList| |lc| |deg| |ups| #2=#:G456 |series|)
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
                     (SPADCALL |ups| (|spadConstant| $ 113) (QREFELT $ 32))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 29))
                  (|FS2UPS2;stateProblem| |fcnName| "essential singularity" $))
                 ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 250))
                  (CONS 0
                        (PROG2 (LETT #1# (SPADCALL |ups| |fcn|) . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))))
                 (#4#
                  (SEQ
                   (LETT |lc|
                         (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 28))
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
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 81) (QREFELT $ 68))))
                (#2='T |ups|)))))
        (#2#
         (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|) . #1#)
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (CONS 0 (SPADCALL |fe| (|spadConstant| $ 81) (QREFELT $ 68))))
                (#2# (CONS 0 (QCDR |ans|))))))))))))) 

(DEFUN |FS2UPS2;tranToGenUPS| (|ker| |arg| |opt_rec| $)
  (COND
   ((SPADCALL |ker| '|sin| (QREFELT $ 174))
    (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 169)) (ELT $ 197) |arg|
     "sin" |opt_rec| $))
   ((SPADCALL |ker| '|cos| (QREFELT $ 174))
    (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 169)) (ELT $ 198) |arg|
     "cos" |opt_rec| $))
   ((SPADCALL |ker| '|asin| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 203) |arg| "asin" |opt_rec| $))
   ((SPADCALL |ker| '|acos| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 204) |arg| "acos" |opt_rec| $))
   ((SPADCALL |ker| '|atan| (QREFELT $ 174))
    (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 169)) |arg| |opt_rec|
     1 $))
   ((SPADCALL |ker| '|acot| (QREFELT $ 174))
    (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 169)) |arg| |opt_rec|
     -1 $))
   ((SPADCALL |ker| '|asec| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 205) |arg| "asec" |opt_rec| $))
   ((SPADCALL |ker| '|acsc| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 206) |arg| "acsc" |opt_rec| $))
   ((SPADCALL |ker| '|asinh| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 213) |arg| "asinh" |opt_rec| $))
   ((SPADCALL |ker| '|acosh| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 214) |arg| "acosh" |opt_rec| $))
   ((SPADCALL |ker| '|atanh| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 215) |arg| "atanh" |opt_rec| $))
   ((SPADCALL |ker| '|acoth| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 216) |arg| "acoth" |opt_rec| $))
   ((SPADCALL |ker| '|asech| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 217) |arg| "asech" |opt_rec| $))
   ((SPADCALL |ker| '|acsch| (QREFELT $ 174))
    (|FS2UPS2;genUPSApplyIfCan| (ELT $ 218) |arg| "acsch" |opt_rec| $))
   ('T
    (|FS2UPS2;stateProblem|
     (SPADCALL (SPADCALL |ker| (QREFELT $ 135)) (QREFELT $ 137))
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
                     (|FS2UPS2;iExprToGenUPS| (SPADCALL |args| (QREFELT $ 179))
                      |opt_rec| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |expon| 1) |expon|)
                      (#2#
                       (|FS2UPS2;expGenUPS|
                        (SPADCALL (CDR |expon|) (CDR |logBase|) (QREFELT $ 60))
                        |opt_rec| $)))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceToUnivariatePowerSeries2;|)) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2| (&REST #1=#:G1078)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1079)
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
      (LETT $ (GETREFV 254) . #1#)
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
      (QSETREFV $ 76 (|EllipticFunctionsUnivariateTaylorSeries| |#2| |#6|))
      (QSETREFV $ 158 'NIL)
      (COND
       ((|HasSignature| |#4|
                        (LIST '|differentiate|
                              (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
        (COND
         ((|HasSignature| |#4|
                          (LIST '|integrate|
                                (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
          (PROGN
           (SETELT $ 158 'T)
           (QSETREFV $ 164
                     (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;31|) $))
           (QSETREFV $ 165
                     (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;32|) $))
           (QSETREFV $ 166
                     (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;33|)
                           $))))
         ('T
          (PROGN
           (QSETREFV $ 164
                     (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;34|) $))
           (QSETREFV $ 165
                     (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;35|) $))
           (QSETREFV $ 166
                     (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;36|)
                           $))))))
       ('T
        (PROGN
         (QSETREFV $ 164 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;37|) $))
         (QSETREFV $ 165 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;38|) $))
         (QSETREFV $ 166
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;39|) $)))))
      (COND
       ((|HasSignature| |#2|
                        (LIST '|abs|
                              (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
        (QSETREFV $ 184
                  (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;45|) $)))
       ('T
        (QSETREFV $ 184
                  (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;46|) $))))
      (COND
       ((|HasCategory| |#3| (LIST '|RetractableFrom| (|devaluate| |#2|)))
        (COND
         ((|HasCategory| |#3| '(|Ring|))
          (QSETREFV $ 178
                    (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;53|) $)))
         ('T
          (QSETREFV $ 178
                    (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;54|) $)))))
       ('T
        (QSETREFV $ 178
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;55|) $))))
      (QSETREFV $ 235
                (LIST #2="sin" #3="cos" #4="atan" #5="acot" "exp" "asinh"))
      (QSETREFV $ 236 (LIST #2# #3# #4# #5#))
      $)))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) 'ZEROCOUNT
              (|Union| 187 '#1="failed") (0 . |retractIfCan|) (5 . |Zero|)
              (9 . |Zero|) (|Boolean|) (13 . =) (19 . |One|) (23 . |One|)
              (27 . |degree|) (|Integer|) (32 . |coerce|) (37 . +)
              (43 . |coefficient|) (49 . <) (55 . ~=) (61 . |reductum|)
              (66 . |order|) (72 . |even?|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (77 . |sign|) (82 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (87 . |nthRootIfCan|)
              (|Record| (|:| |func| 136) (|:| |prob| 136))
              (|Union| (|:| |%series| 9) (|:| |%problem| 41))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS2;exprToUPS;FEBUU;6| |FS2UPS2;exprToPS;FEBUBFEU;7|
              (|Mapping| 20 7) |FS2UPS2;exprToPS;FEBUBFE3MU;8|
              (|Union| 52 '#1#) (93 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (98 . |univariate|) (|Union| 122 '#2="failed") (104 . |isPlus|)
              (109 . |Zero|) (113 . +) (119 . |isTimes|) (124 . |One|)
              (128 . *) (|Union| 168 '#1#) (134 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 52) (139 . |zero?|)
              (144 . |degree|) (149 . |leadingCoefficient|) (154 . |coerce|)
              (159 . |monomial|) (165 . |reductum|)
              (|Record| (|:| |val| $) (|:| |exponent| 25)) (|Union| 70 '#2#)
              (170 . |isPower|) (175 . >) (181 . ^) (187 . ^) 'ELITS
              (|List| 51) (193 . |variables|) (198 . |member?|)
              (204 . |coerce|) (209 . |Zero|) (213 . -) (219 . |differentiate|)
              (|List| 9) (|Mapping| 7 7) (|List| 85) (225 . |taylor_via_deriv|)
              (232 . |coerce|) (|Equation| 7) (237 . =) (|List| 126)
              (243 . |eval|) (249 . |map|) (255 . |taylor_via_deriv|)
              (262 . |new|) (266 . +) (272 . |elt|) (|Mapping| 11 11)
              (278 . |applyTaylor|) (284 . |One|) (|List| 7) (288 . |elt|)
              (294 . |coerce|) (299 . |monomial|) (305 . +) (|PositiveInteger|)
              (311 . ^) (317 . -) (323 . |One|) (327 . *) (333 . *) (339 . -)
              (344 . |One|) (348 . |coerce|) (353 . |coerce|) (358 . /)
              (364 . |Zero|) (368 . |last|) (|BasicOperator|) (|Kernel| 7)
              (373 . |operator|) (|List| $) (378 . |kernel|)
              (|Union| $ '"failed") (384 . |recip|) (|Equation| $)
              (389 . |eval|) (|List| 11) (395 . |taylor_via_lode|)
              (|SpecialFunctionUnivariateTaylorSeries| 7 11)
              (402 . |lambertW0|) (407 . ~=) (413 . *) (419 . |One|)
              (423 . |name|) (|String|) (428 . |string|) (433 . -)
              (438 . |jacobiSn|) (444 . |jacobiCn|) (450 . |jacobiDn|)
              (456 . |ellipticE|) (462 . |ellipticF|) (468 . |ellipticPi|)
              (475 . |weierstrassP0|) (482 . |weierstrassPPrime0|)
              (489 . |weierstrassZeta0|) (496 . |weierstrassSigma0|)
              (|Union| 6 '#1#) (503 . |retractIfCan|) (508 . |retractIfCan|)
              (513 . <=) (519 . -) (525 . |pi|) (529 . *) (535 . |sin|)
              (540 . /) '|can_integrate| (546 . |differentiate|) (551 . /)
              (557 . -) (562 . |log|) (567 . |integrate|) (572 . |atan1|)
              (577 . |integ|) (582 . |integ_df|) (588 . |elt|) (|Kernel| $)
              (594 . |coerce|) (599 . |argument|) (|Union| 51 '"failed")
              (604 . |symbolIfCan|) (609 . |has?|) (615 . |is?|)
              (621 . |expIfCan|) (|Union| 46 '"none")
              (|Record| (|:| |pos_Check?| 20) (|:| |atan_Flag| 43)
                        (|:| |coeff_check?| 176) (|:| |inv_check?| 176)
                        (|:| |zero_check?| 176) (|:| |log_x_replace| 20)
                        (|:| |log_x_val| 7))
              (626 . |powToUPS|) (632 . |second|) (637 . |retract|)
              (642 . |logIfCan|) (647 . |log|) (652 . |abs|) (657 . |localAbs|)
              (662 . |sqrt|) (667 . =) (|Fraction| 25) (673 . |numer|)
              (678 . |pi|) (682 . |pi|) (686 . |coerce|) (691 . |atan|)
              (696 . |acot|) (701 . =) (707 . |atanIfCan|) (712 . |acotIfCan|)
              (717 . |sinIfCan|) (722 . |cosIfCan|) (727 . |tanIfCan|)
              (732 . |cotIfCan|) (737 . |secIfCan|) (742 . |cscIfCan|)
              (747 . |asinIfCan|) (752 . |acosIfCan|) (757 . |asecIfCan|)
              (762 . |acscIfCan|) (767 . |sinhIfCan|) (772 . |coshIfCan|)
              (777 . |tanhIfCan|) (782 . |cothIfCan|) (787 . |sechIfCan|)
              (792 . |cschIfCan|) (797 . |asinhIfCan|) (802 . |acoshIfCan|)
              (807 . |atanhIfCan|) (812 . |acothIfCan|) (817 . |asechIfCan|)
              (822 . |acschIfCan|) (827 . |retractIfCan|) (832 . *) (838 . *)
              (|SparseMultivariatePolynomial| 6 168) (844 . |numer|)
              (849 . |denom|) (|Mapping| 7 120) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 120)
              (|PolynomialCategoryLifting| (|IndexedExponents| 120) 120 6 227
                                           7)
              (854 . |map|) (861 . |exp|) (866 . |inv|) (871 . |cos|) (876 . *)
              (882 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 136) (888 . |member?|)
              |FS2UPS2;exprToGenUPS;FEBUU;61| (|List| 168) (894 . |tower|)
              (899 . |unary?|) (|List| 119) (904 . |removeDuplicates|)
              (909 . |is?|) (915 . |center|) (920 . |Zero|) (924 . <) (930 . ^)
              (936 . >) (942 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (947 . |normalize|))
           '#(|powToUPS| 953 |localAbs| 959 |integ_df| 964 |integ| 970
              |exprToUPS| 975 |exprToPS| 982 |exprToGenUPS| 1003 |atan1| 1010)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 253
                                                 '(1 7 16 0 17 0 6 0 18 0 7 0
                                                   19 2 7 20 0 0 21 0 6 0 22 0
                                                   7 0 23 1 9 8 0 24 1 8 0 25
                                                   26 2 8 0 0 0 27 2 9 7 0 8 28
                                                   2 8 20 0 0 29 2 7 20 0 0 30
                                                   1 9 0 0 31 2 9 8 0 8 32 1 25
                                                   20 0 33 1 35 34 7 36 1 8 20
                                                   0 37 2 10 38 9 39 40 1 7 48
                                                   0 49 2 52 50 0 51 53 1 7 54
                                                   0 55 0 9 0 56 2 9 0 0 0 57 1
                                                   7 54 0 58 0 9 0 59 2 9 0 0 0
                                                   60 1 7 61 0 62 1 63 20 0 64
                                                   1 63 39 0 65 1 63 52 0 66 1
                                                   7 0 52 67 2 9 0 7 8 68 1 63
                                                   0 0 69 1 7 71 0 72 2 25 20 0
                                                   0 73 2 9 0 0 39 74 2 9 0 0
                                                   25 75 1 7 77 0 78 2 77 20 51
                                                   0 79 1 9 0 7 80 0 8 0 81 2 9
                                                   0 0 0 82 2 7 0 0 51 83 3 12
                                                   9 9 84 86 87 1 7 0 51 88 2
                                                   89 0 7 7 90 2 7 0 0 91 92 2
                                                   9 0 85 0 93 3 12 9 7 84 86
                                                   94 0 51 0 95 2 7 0 0 0 96 2
                                                   84 9 0 25 97 2 12 9 98 9 99
                                                   0 25 0 100 2 101 7 0 25 102
                                                   1 11 0 7 103 2 11 0 7 39 104
                                                   2 11 0 0 0 105 2 11 0 0 106
                                                   107 2 11 0 0 0 108 0 11 0
                                                   109 2 11 0 106 0 110 2 11 0
                                                   0 0 111 1 11 0 0 112 0 8 0
                                                   113 1 6 0 25 114 1 7 0 6 115
                                                   2 11 0 0 7 116 0 11 0 117 1
                                                   101 7 0 118 1 120 119 0 121
                                                   2 7 0 119 122 123 1 11 124 0
                                                   125 2 7 0 0 126 127 3 12 9
                                                   128 9 101 129 1 130 11 11
                                                   131 2 25 20 0 0 132 2 9 0 25
                                                   0 133 0 106 0 134 1 120 51 0
                                                   135 1 51 136 0 137 1 7 0 0
                                                   138 2 76 11 11 7 139 2 76 11
                                                   11 7 140 2 76 11 11 7 141 2
                                                   76 11 11 7 142 2 76 11 11 7
                                                   143 3 76 11 11 7 7 144 3 130
                                                   11 7 7 11 145 3 130 11 7 7
                                                   11 146 3 130 11 7 7 11 147 3
                                                   130 11 7 7 11 148 1 7 149 0
                                                   150 1 6 34 0 151 2 25 20 0 0
                                                   152 2 7 0 0 0 153 0 7 0 154
                                                   2 7 0 0 0 155 1 7 0 0 156 2
                                                   7 0 0 0 157 1 9 0 0 159 2 9
                                                   0 0 0 160 1 8 0 0 161 1 7 0
                                                   0 162 1 9 0 0 163 1 0 9 9
                                                   164 1 0 9 9 165 2 0 9 9 9
                                                   166 2 7 0 119 0 167 1 7 0
                                                   168 169 1 120 101 0 170 1
                                                   120 171 0 172 2 119 20 0 51
                                                   173 2 120 20 0 51 174 1 10
                                                   38 9 175 2 0 42 101 177 178
                                                   1 101 7 0 179 1 7 25 0 180 1
                                                   10 38 9 181 1 9 0 0 182 1 7
                                                   0 0 183 1 0 7 7 184 1 7 0 0
                                                   185 2 43 20 0 0 186 1 187 25
                                                   0 188 0 9 0 189 0 11 0 190 1
                                                   7 0 25 191 1 7 0 0 192 1 7 0
                                                   0 193 2 8 20 0 0 194 1 10 38
                                                   9 195 1 10 38 9 196 1 10 38
                                                   9 197 1 10 38 9 198 1 10 38
                                                   9 199 1 10 38 9 200 1 10 38
                                                   9 201 1 10 38 9 202 1 10 38
                                                   9 203 1 10 38 9 204 1 10 38
                                                   9 205 1 10 38 9 206 1 10 38
                                                   9 207 1 10 38 9 208 1 10 38
                                                   9 209 1 10 38 9 210 1 10 38
                                                   9 211 1 10 38 9 212 1 10 38
                                                   9 213 1 10 38 9 214 1 10 38
                                                   9 215 1 10 38 9 216 1 10 38
                                                   9 217 1 10 38 9 218 1 8 124
                                                   7 219 2 9 0 7 0 220 2 8 0 0
                                                   0 221 1 7 222 0 223 1 7 222
                                                   0 224 3 228 7 225 226 227
                                                   229 1 7 0 0 230 1 7 0 0 231
                                                   1 7 0 0 232 2 7 0 106 0 233
                                                   2 7 0 119 122 234 2 237 20
                                                   136 0 238 1 7 240 0 241 1
                                                   119 20 0 242 1 243 0 0 244 2
                                                   119 20 0 51 245 1 9 7 0 246
                                                   0 187 0 247 2 187 20 0 0 248
                                                   2 7 0 0 0 249 2 8 20 0 0 250
                                                   1 9 0 0 251 2 252 7 7 51 253
                                                   2 0 42 101 177 178 1 0 7 7
                                                   184 2 0 9 9 9 166 1 0 9 9
                                                   165 3 0 42 7 20 43 44 8 0 42
                                                   7 20 43 20 7 46 46 46 47 5 0
                                                   42 7 20 43 20 7 45 3 0 42 7
                                                   20 43 239 1 0 9 9 164)))))
           '|lookupComplete|)) 
