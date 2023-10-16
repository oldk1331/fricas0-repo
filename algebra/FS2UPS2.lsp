
(SDEFUN |FS2UPS2;ratIfCan|
        ((|fcn| FE) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |fcn| (QREFELT $ 17))) 

(SDEFUN |FS2UPS2;check_inverse|
        ((|coef| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Boolean|))
        (SPROG ((#2=#:G305 NIL))
               (COND
                ((QEQCAR (QVELT |opt_rec| 3) 0)
                 (SPADCALL |coef|
                           (PROG2 (LETT #2# (QVELT |opt_rec| 3))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Mapping| (|Boolean|)
                                                        (QREFELT $ 7))
                                             (|Union|
                                              (|Mapping| (|Boolean|)
                                                         (QREFELT $ 7))
                                              #1#)
                                             #2#))))
                ('T 'T)))) 

(SDEFUN |FS2UPS2;check_zero|
        ((|coef| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Boolean|))
        (SPROG ((#2=#:G312 NIL))
               (COND
                ((QEQCAR (QVELT |opt_rec| 4) 0)
                 (SPADCALL |coef|
                           (PROG2 (LETT #2# (QVELT |opt_rec| 4))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Mapping| (|Boolean|)
                                                        (QREFELT $ 7))
                                             (|Union|
                                              (|Mapping| (|Boolean|)
                                                         (QREFELT $ 7))
                                              #1#)
                                             #2#))))
                ('T (SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21)))))) 

(SDEFUN |FS2UPS2;carefulNthRootIfCan|
        ((|ups| UPS) (|n| |NonNegativeInteger|)
         (|opt_rec| |Record| (|:| |pos_Check?| #1=(|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         (|rightOnly?| |Boolean|)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans| (|Union| UPS "failed")) (#3=#:G340 NIL)
          (|signum| (|Union| (|Integer|) "failed")) (#4=#:G339 NIL)
          (|coef| (FE)) (|deg| (|Expon|)) (|deg1| (|Expon|)) (|posCheck?| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |posCheck?| (QVELT |opt_rec| 0))
                (EXIT
                 (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
                       (#5='T
                        (SEQ (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)))
                             (LETT |deg1|
                                   (SPADCALL |deg|
                                             (SPADCALL (QREFELT $ 15)
                                                       (QREFELT $ 26))
                                             (QREFELT $ 27)))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((|FS2UPS2;check_zero|
                                        (LETT |coef|
                                              (SPADCALL |ups| |deg|
                                                        (QREFELT $ 28)))
                                        |opt_rec| $)
                                       (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (COND
                                      ((SPADCALL |coef| (|spadConstant| $ 19)
                                                 (QREFELT $ 30))
                                       (LETT |ups|
                                             (SPADCALL |ups| (QREFELT $ 31)))))
                                     (LETT |deg|
                                           (SPADCALL |ups| |deg1|
                                                     (QREFELT $ 32)))
                                     (LETT |coef|
                                           (SPADCALL |ups| |deg|
                                                     (QREFELT $ 28)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |coef| (|spadConstant| $ 19)
                                                  (QREFELT $ 21))
                                        (PROGN
                                         (LETT #4#
                                               (|error|
                                                "log of series with many leading zero coefficients"))
                                         (GO #6=#:G323)))))))
                                   #6# (EXIT #4#))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (COND
                              ((SPADCALL |n| (QREFELT $ 33))
                               (COND
                                (|posCheck?|
                                 (SEQ
                                  (LETT |signum|
                                        (SPADCALL |coef| (QREFELT $ 36)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |signum| 0)
                                     (COND
                                      ((EQL (QCDR |signum|) -1)
                                       (PROGN
                                        (LETT #3#
                                              (|FS2UPS2;stateProblem|
                                               "nth root"
                                               "negative leading coefficient"
                                               $))
                                        (GO #7=#:G338)))
                                      ((NULL |rightOnly?|)
                                       (COND
                                        ((NULL (SPADCALL |deg| (QREFELT $ 37)))
                                         (PROGN
                                          (LETT #3#
                                                (|FS2UPS2;stateProblem|
                                                 "nth root"
                                                 "series of non-zero order" $))
                                          (GO #7#))))))))))))))
                             (COND
                              ((NULL
                                (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                               (EXIT
                                (|FS2UPS2;stateProblem| "nth root"
                                 "need to invert bad coefficient" $))))
                             (LETT |ans| (SPADCALL |ups| |n| (QREFELT $ 40)))
                             (EXIT
                              (COND
                               ((QEQCAR |ans| 1)
                                (|FS2UPS2;stateProblem| "nth root"
                                 "no nth root" $))
                               (#5# (CONS 0 (QCDR |ans|)))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;stateProblem|
        ((|function| |String|) (|problem| |String|)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (CONS 1 (CONS |function| |problem|))) 

(SDEFUN |FS2UPS2;exprToUPS;FEBUU;6|
        ((|fcn| FE) (|posCheck?| |Boolean|)
         (|atanFlag| |Union| "complex" "real: two sides" "real: left side"
          "real: right side" "just do it")
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") NIL (|spadConstant| $ 19))
         $)) 

(SDEFUN |FS2UPS2;exprToPS;FEBUBFEU;7|
        ((|fcn| FE) (|posCheck?| |Boolean|)
         (|atanFlag| |Union| "complex" "real: two sides" "real: left side"
          "real: right side" "just do it")
         (|log_flag| |Boolean|) (|log_val| FE)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") |log_flag| |log_val|)
         $)) 

(SDEFUN |FS2UPS2;exprToPS;FEBUBFE3MU;8|
        ((|fcn| FE) (|posCheck?| |Boolean|)
         (|atanFlag| |Union| "complex" "real: two sides" "real: left side"
          "real: right side" "just do it")
         (|log_flag| |Boolean|) (|log_val| FE)
         (|coef_chk| |Mapping| (|Boolean|) FE)
         (|inv_chk| |Mapping| (|Boolean|) FE)
         (|zero_chk| |Mapping| (|Boolean|) FE)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 0 |coef_chk|) (CONS 0 |inv_chk|)
                 (CONS 0 |zero_chk|) |log_flag| |log_val|)
         $)) 

(SDEFUN |FS2UPS2;i_expr_to_PS|
        ((|fcn| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ker| (|Union| (|Kernel| FE) #2="failed"))
          (|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed"))
          (|prod| (|Union| (|List| FE) #3="failed"))
          (|sum| (|Union| (|List| FE) #3#))
          (|poly| (|Union| (|Polynomial| R) #2#)))
         (SEQ (LETT |poly| (SPADCALL |fcn| (QREFELT $ 49)))
              (EXIT
               (COND
                ((QEQCAR |poly| 0)
                 (|FS2UPS2;polyToUPS|
                  (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 53))
                  |opt_rec| $))
                (#4='T
                 (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 55)))
                      (EXIT
                       (COND
                        ((QEQCAR |sum| 0)
                         (|FS2UPS2;listToUPS| (QCDR |sum|)
                          (CONS (|function| |FS2UPS2;i_expr_to_PS|) $)
                          |opt_rec| (|spadConstant| $ 56) (ELT $ 57) $))
                        (#4#
                         (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58)))
                              (EXIT
                               (COND
                                ((QEQCAR |prod| 0)
                                 (|FS2UPS2;listToUPS| (QCDR |prod|)
                                  (CONS (|function| |FS2UPS2;i_expr_to_PS|) $)
                                  |opt_rec| (|spadConstant| $ 59) (ELT $ 60)
                                  $))
                                (#4#
                                 (SEQ
                                  (LETT |expt|
                                        (|FS2UPS2;isNonTrivPower| |fcn| $))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |expt| 0)
                                     (SEQ (LETT |power| (QCDR |expt|))
                                          (EXIT
                                           (|FS2UPS2;powerToUPS| (QCAR |power|)
                                            (QCDR |power|) |opt_rec| $))))
                                    (#4#
                                     (SEQ
                                      (LETT |ker|
                                            (SPADCALL |fcn| (QREFELT $ 62)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |ker| 0)
                                         (|FS2UPS2;kernelToUPS| (QCDR |ker|)
                                          |opt_rec| $))
                                        (#4#
                                         (|error|
                                          "exprToUPS: neither a sum, product, power, nor kernel"))))))))))))))))))))))) 

(SDEFUN |FS2UPS2;polyToUPS|
        ((|poly| |SparseUnivariatePolynomial| (|Polynomial| R))
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans| (UPS)) (#2=#:G444 NIL) (#3=#:G430 NIL) (|coef| (FE))
          (|deg| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |poly| (QREFELT $ 64)) (CONS 0 (|spadConstant| $ 56)))
            ('T
             (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 65)))
                  (LETT |coef|
                        (SPADCALL (SPADCALL |poly| (QREFELT $ 66))
                                  (QREFELT $ 67)))
                  (COND
                   ((QEQCAR (QVELT |opt_rec| 2) 0)
                    (COND
                     ((NULL
                       (SPADCALL |coef|
                                 (PROG2 (LETT #3# (QVELT |opt_rec| 2))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|Mapping| (|Boolean|)
                                                              (QREFELT $ 7))
                                                   (|Union|
                                                    (|Mapping| (|Boolean|)
                                                               (QREFELT $ 7))
                                                    #1#)
                                                   #3#))))
                      (PROGN
                       (LETT #2#
                             (|FS2UPS2;stateProblem| "polyToUPS" "bad coeff"
                              $))
                       (GO #4=#:G443))))))
                  (LETT |ans|
                        (SPADCALL |coef| (SPADCALL |deg| (QREFELT $ 26))
                                  (QREFELT $ 68)))
                  (LETT |poly| (SPADCALL |poly| (QREFELT $ 69)))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |poly| (QREFELT $ 64))))
                         (GO G191)))
                       (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT $ 65)))
                            (LETT |coef|
                                  (SPADCALL (SPADCALL |poly| (QREFELT $ 66))
                                            (QREFELT $ 67)))
                            (COND
                             ((QEQCAR (QVELT |opt_rec| 2) 0)
                              (COND
                               ((NULL
                                 (SPADCALL |coef|
                                           (PROG2
                                               (LETT #3# (QVELT |opt_rec| 2))
                                               (QCDR #3#)
                                             (|check_union2| (QEQCAR #3# 0)
                                                             (|Mapping|
                                                              (|Boolean|)
                                                              (QREFELT $ 7))
                                                             (|Union|
                                                              (|Mapping|
                                                               (|Boolean|)
                                                               (QREFELT $ 7))
                                                              #1#)
                                                             #3#))))
                                (PROGN
                                 (LETT #2#
                                       (|FS2UPS2;stateProblem| "polyToUPS"
                                        "bad coeff" $))
                                 (GO #4#))))))
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL |coef|
                                                      (SPADCALL |deg|
                                                                (QREFELT $ 26))
                                                      (QREFELT $ 68))
                                            (QREFELT $ 57)))
                            (EXIT
                             (LETT |poly| (SPADCALL |poly| (QREFELT $ 69)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;listToUPS|
        ((|list| |List| FE)
         (|feToUPS| |Mapping|
          #1=(|Union| (|:| |%series| UPS)
                      (|:| |%problem|
                           (|Record| (|:| |func| (|String|))
                                     (|:| |prob| (|String|)))))
          FE
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| #2="complex" #3="real: two sides"
                                  #4="real: left side" #5="real: right side"
                                  #6="just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #7="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #7#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #7#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)))
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag| (|Union| #2# #3# #4# #5# #6#))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #7#))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #7#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #7#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         (|ans| UPS) (|op| |Mapping| UPS UPS UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG ((#8=#:G455 NIL) (|term| #1#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190 (COND ((NULL (NULL (NULL |list|))) (GO G191)))
                       (SEQ
                        (LETT |term|
                              (SPADCALL (|SPADfirst| |list|) |opt_rec|
                                        |feToUPS|))
                        (EXIT
                         (COND
                          ((QEQCAR |term| 1)
                           (PROGN (LETT #8# |term|) (GO #9=#:G454)))
                          ('T
                           (SEQ (LETT |ans| (SPADCALL |ans| (CDR |term|) |op|))
                                (EXIT (LETT |list| (CDR |list|))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))
                #9# (EXIT #8#)))) 

(SDEFUN |FS2UPS2;isNonTrivPower|
        ((|fcn| FE)
         ($ |Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed")))
         (SEQ (LETT |expt| (SPADCALL |fcn| (QREFELT $ 72)))
              (EXIT
               (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ (LETT |power| (QCDR |expt|))
                           (EXIT
                            (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                                  (#1# (CONS 0 |power|))))))))))) 

(SDEFUN |FS2UPS2;powerToUPS|
        ((|fcn| FE) (|n| |Integer|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G479 NIL) (|coef| (FE)) (|deg| (|Expon|)) (|ups| (UPS))
          (|deg1| (|Expon|)) (#3=#:G464 NIL) (#4=#:G470 NIL)
          (|b|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |b| (|FS2UPS2;i_expr_to_PS| |fcn| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |b| 1) |b|)
                     ((SPADCALL |n| 0 (QREFELT $ 73))
                      (CONS 0
                            (SPADCALL (CDR |b|)
                                      (PROG1 (LETT #4# |n|)
                                        (|check_subtype2| (> #4# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #4#))
                                      (QREFELT $ 74))))
                     ('T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #3# |b|)
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT $ 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #3#)))
                       (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)))
                       (LETT |deg1|
                             (SPADCALL |deg|
                                       (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                                       (QREFELT $ 27)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((|FS2UPS2;check_zero|
                                  (LETT |coef|
                                        (SPADCALL |ups| |deg| (QREFELT $ 28)))
                                  |opt_rec| $)
                                 (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                                ('T NIL)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (COND
                                ((SPADCALL |coef| (|spadConstant| $ 19)
                                           (QREFELT $ 30))
                                 (LETT |ups| (SPADCALL |ups| (QREFELT $ 31)))))
                               (LETT |deg|
                                     (SPADCALL |ups| |deg1| (QREFELT $ 32)))
                               (LETT |coef|
                                     (SPADCALL |ups| |deg| (QREFELT $ 28)))
                               (EXIT
                                (COND
                                 ((SPADCALL |coef| (|spadConstant| $ 19)
                                            (QREFELT $ 21))
                                  (PROGN
                                   (LETT #2#
                                         (|error|
                                          "inverse of series with many leading zero coefficients"))
                                   (GO #5=#:G473)))))))
                             #5# (EXIT #2#))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                         (EXIT
                          (|FS2UPS2;stateProblem| "power"
                           "need to invert bad coefficient" $))))
                       (EXIT
                        (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75))))))))))) 

(SDEFUN |FS2UPS2;handle_args|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union|
          (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                    (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE)))
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|lsers| (|List| UPS)) (|lsere| (|List| FE)) (|lcoef| (|List| FE))
          (|losers| (|List| UPS)) (|coef| (FE)) (#2=#:G496 NIL) (|ups| (UPS))
          (#3=#:G482 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (#4=#:G497 NIL) (|arg| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |losers| NIL) (LETT |lsers| NIL) (LETT |lsere| NIL)
                (LETT |lcoef| NIL)
                (SEQ (LETT |arg| NIL) (LETT #4# |args|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |arg| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (QREFELT $ 14)
                                    (SPADCALL |arg| (QREFELT $ 78))
                                    (QREFELT $ 79)))
                         (SEQ
                          (LETT |losers|
                                (CONS (SPADCALL |arg| (QREFELT $ 80))
                                      |losers|))
                          (LETT |lsers| (CONS (|spadConstant| $ 56) |lsers|))
                          (LETT |lsere| (CONS (|spadConstant| $ 19) |lsere|))
                          (EXIT (LETT |lcoef| (CONS |arg| |lcoef|)))))
                        ('T
                         (SEQ
                          (LETT |nsu|
                                (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                          (EXIT
                           (COND
                            ((QEQCAR |nsu| 1)
                             (PROGN (LETT #2# (CONS 1 |nsu|)) (GO #5=#:G495)))
                            ('T
                             (SEQ
                              (LETT |ups|
                                    (PROG2 (LETT #3# |nsu|)
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT $ 9)
                                                      (|Union|
                                                       (|:| |%series|
                                                            (QREFELT $ 9))
                                                       (|:| |%problem|
                                                            (|Record|
                                                             (|:| |func|
                                                                  (|String|))
                                                             (|:| |prob|
                                                                  (|String|)))))
                                                      #3#)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL |ups| (|spadConstant| $ 81)
                                            (QREFELT $ 32))
                                  (|spadConstant| $ 81) (QREFELT $ 29))
                                 (PROGN
                                  (LETT #2#
                                        (CONS 1
                                              (|FS2UPS2;stateProblem|
                                               "handle_args"
                                               "argument not Taylor" $)))
                                  (GO #5#)))
                                ('T
                                 (SEQ
                                  (LETT |coef|
                                        (SPADCALL |ups| (|spadConstant| $ 81)
                                                  (QREFELT $ 28)))
                                  (LETT |losers| (CONS |ups| |losers|))
                                  (LETT |lcoef| (CONS |coef| |lcoef|))
                                  (LETT |lsere|
                                        (CONS (|spadConstant| $ 23) |lsere|))
                                  (EXIT
                                   (LETT |lsers|
                                         (CONS
                                          (SPADCALL |ups|
                                                    (SPADCALL |coef|
                                                              (QREFELT $ 80))
                                                    (QREFELT $ 82))
                                          |lsers|))))))))))))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                               (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv|
        ((|nf| UPS) (|lsyms| |List| (|Symbol|)) (|lser| |List| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ups| (UPS)) (|lders| (|List| (|Mapping| FE FE))) (#1=#:G511 NIL)
          (|sym| NIL) (#2=#:G510 NIL))
         (SEQ
          (LETT |lders|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sym| NIL) (LETT #1# |lsyms|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|FS2UPS2;do_taylor_via_deriv!0|
                                     (VECTOR $ |sym|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT $ 87)))
          (EXIT
           (CONS 0
                 (SPADCALL
                  (CONS #'|FS2UPS2;do_taylor_via_deriv!1| (VECTOR $ |lsyms|))
                  |ups| (QREFELT $ 93))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv!1| ((|c| NIL) ($$ NIL))
        (PROG (|lsyms| $)
          (LETT |lsyms| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G507 NIL) (|sym| NIL) (#2=#:G506 NIL))
                   (SEQ
                    (SPADCALL |c|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |sym| NIL) (LETT #1# |lsyms|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |sym| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |sym| (QREFELT $ 88))
                                              (|spadConstant| $ 19)
                                              (QREFELT $ 90))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 92)))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv!0| ((|c| NIL) ($$ NIL))
        (PROG (|sym| $)
          (LETT |sym| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 83)))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2|
        ((|nk| FE) (|lsyms| |List| (|Symbol|)) (|lser| |List| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ups| (UPS)) (|lders| (|List| (|Mapping| FE FE))) (#1=#:G525 NIL)
          (|sym| NIL) (#2=#:G524 NIL))
         (SEQ
          (LETT |lders|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sym| NIL) (LETT #1# |lsyms|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|FS2UPS2;do_taylor_via_deriv2!0|
                                     (VECTOR $ |sym|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT $ 94)))
          (EXIT
           (CONS 0
                 (SPADCALL
                  (CONS #'|FS2UPS2;do_taylor_via_deriv2!1| (VECTOR $ |lsyms|))
                  |ups| (QREFELT $ 93))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2!1| ((|c| NIL) ($$ NIL))
        (PROG (|lsyms| $)
          (LETT |lsyms| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G521 NIL) (|sym| NIL) (#2=#:G520 NIL))
                   (SEQ
                    (SPADCALL |c|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |sym| NIL) (LETT #1# |lsyms|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |sym| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |sym| (QREFELT $ 88))
                                              (|spadConstant| $ 19)
                                              (QREFELT $ 90))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 92)))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2!0| ((|c| NIL) ($$ NIL))
        (PROG (|sym| $)
          (LETT |sym| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT $ 83)))))) 

(SDEFUN |FS2UPS2;convert_args|
        ((|lsers| |List| UPS) (|lsere| |List| FE) (|lser0| |List| FE)
         ($ |Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
          (|:| |syms| (|List| (|Symbol|)))))
        (SPROG
         ((|nargs| (|List| FE)) (|lser| (|List| UPS))
          (|lsyms| (|List| (|Symbol|))) (|nsym| (|Symbol|)) (#1=#:G531 NIL)
          (|s| NIL) (#2=#:G532 NIL) (|e| NIL) (#3=#:G533 NIL) (|c| NIL))
         (SEQ (LETT |lsyms| NIL) (LETT |lser| NIL) (LETT |nargs| NIL)
              (SEQ (LETT |c| NIL) (LETT #3# |lser0|) (LETT |e| NIL)
                   (LETT #2# |lsere|) (LETT |s| NIL) (LETT #1# |lsers|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |e| (CAR #2#)) NIL) (ATOM #3#)
                         (PROGN (LETT |c| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |e| (|spadConstant| $ 19) (QREFELT $ 21))
                       (LETT |nargs| (CONS |c| |nargs|)))
                      ('T
                       (SEQ (LETT |nsym| (SPADCALL (QREFELT $ 95)))
                            (LETT |nargs|
                                  (CONS
                                   (SPADCALL |c|
                                             (SPADCALL |nsym| (QREFELT $ 88))
                                             (QREFELT $ 96))
                                   |nargs|))
                            (LETT |lsyms| (CONS |nsym| |lsyms|))
                            (EXIT (LETT |lser| (CONS |s| |lser|))))))))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |nargs| (NREVERSE |nargs|))
              (EXIT (VECTOR |nargs| |lser| |lsyms|))))) 

(SDEFUN |FS2UPS2;do_ell|
        ((|losers| |List| UPS) (|lsers| |List| UPS) (|lsere| |List| FE)
         (|lser0| |List| FE) (|ef| |Mapping| UTS UTS (|List| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|nres| (UPS))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|))))))
         (SEQ
          (LETT |cargs|
                (|FS2UPS2;convert_args| (CDR |lsers|) (CDR |lsere|)
                 (CDR |lser0|) $))
          (LETT |nres|
                (SPADCALL (CONS #'|FS2UPS2;do_ell!0| (VECTOR |ef| |cargs|))
                          (SPADCALL |losers| 1 (QREFELT $ 97)) (QREFELT $ 99)))
          (EXIT
           (|FS2UPS2;do_taylor_via_deriv| |nres| (QVELT |cargs| 2)
            (QVELT |cargs| 1) $))))) 

(SDEFUN |FS2UPS2;do_ell!0| ((|f| NIL) ($$ NIL))
        (PROG (|cargs| |ef|)
          (LETT |cargs| (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f| (QVELT |cargs| 0) |ef|))))) 

(SDEFUN |FS2UPS2;do_ell2|
        ((|losers| |List| UPS) (|lsers| |List| UPS) (|lsere| |List| FE)
         (|lser0| |List| FE) (|ef| |Mapping| UTS UTS FE)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG NIL
               (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
                (CONS #'|FS2UPS2;do_ell2!0| (VECTOR |ef| $)) $))) 

(SDEFUN |FS2UPS2;do_ell2!0| ((|f| NIL) (|l| NIL) ($$ NIL))
        (PROG ($ |ef|)
          (LETT $ (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 100) (QREFELT $ 102))
                      |ef|))))) 

(SDEFUN |FS2UPS2;do_ell3|
        ((|losers| |List| UPS) (|lsers| |List| UPS) (|lsere| |List| FE)
         (|lser0| |List| FE) (|ef| |Mapping| UTS UTS FE FE)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG NIL
               (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
                (CONS #'|FS2UPS2;do_ell3!0| (VECTOR |ef| $)) $))) 

(SDEFUN |FS2UPS2;do_ell3!0| ((|f| NIL) (|l| NIL) ($$ NIL))
        (PROG ($ |ef|)
          (LETT $ (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f| (SPADCALL |l| (|spadConstant| $ 100) (QREFELT $ 102))
                      (SPADCALL |l| 2 (QREFELT $ 102)) |ef|))))) 

(SDEFUN |FS2UPS2;besselEq| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT $ 107)) |zvar|
                       (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                                 (SPADCALL |v| 2 (QREFELT $ 107))
                                 (QREFELT $ 108))))))) 

(SDEFUN |FS2UPS2;besselEqm| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT $ 107)) |zvar|
                       (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                                 (SPADCALL |v| 2 (QREFELT $ 107))
                                 (QREFELT $ 105))))))) 

(SDEFUN |FS2UPS2;kelvinEq| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|v2| (UTS)) (|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (LETT |v2|
                      (SPADCALL (|spadConstant| $ 109)
                                (SPADCALL 2 (SPADCALL |v| 2 (QREFELT $ 107))
                                          (QREFELT $ 110))
                                (QREFELT $ 105)))
                (EXIT
                 (LIST (SPADCALL |zvar| 4 (QREFELT $ 107))
                       (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT $ 107))
                                 (QREFELT $ 110))
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
                        (SPADCALL |zvar| 4 (QREFELT $ 107))
                        (QREFELT $ 105))))))) 

(SDEFUN |FS2UPS2;kummerEq| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|zvar| (UTS)) (|b| (UTS)) (|a| (UTS)))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |b|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (EXIT
                 (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT $ 108))
                       (SPADCALL |a| (QREFELT $ 112))))))) 

(SDEFUN |FS2UPS2;legendreEq| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|z2| (UTS)) (|zvar| (UTS)) (|mu| (UTS)) (|nu| (UTS)))
               (SEQ
                (LETT |nu|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |mu|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (LETT |z2|
                      (SPADCALL (|spadConstant| $ 109)
                                (SPADCALL |zvar| 2 (QREFELT $ 107))
                                (QREFELT $ 108)))
                (EXIT
                 (LIST (SPADCALL |z2| 2 (QREFELT $ 107))
                       (SPADCALL
                        (SPADCALL (SPADCALL 2 |zvar| (QREFELT $ 110)) |z2|
                                  (QREFELT $ 111))
                        (QREFELT $ 112))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |nu|
                                   (SPADCALL |nu| (|spadConstant| $ 109)
                                             (QREFELT $ 105))
                                   (QREFELT $ 111))
                         |z2| (QREFELT $ 111))
                        |mu| (QREFELT $ 108))))))) 

(SDEFUN |FS2UPS2;whittakerEq| ((|lc| |List| FE) (|z0| FE) ($ |List| UTS))
        (SPROG ((|zvar| (UTS)) (|o4| (UTS)) (|m| (UTS)) (|k| (UTS)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |m|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT $ 102))
                                (QREFELT $ 103)))
                (LETT |o4|
                      (SPADCALL (|spadConstant| $ 109)
                                (SPADCALL (SPADCALL 4 (QREFELT $ 114))
                                          (QREFELT $ 115))
                                (QREFELT $ 116)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 104))
                       (SPADCALL |z0| (QREFELT $ 103)) (QREFELT $ 105)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT $ 107))
                       (|spadConstant| $ 117)
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT $ 107))
                                   (QREFELT $ 108))
                         (SPADCALL |k| |zvar| (QREFELT $ 111)) (QREFELT $ 105))
                        (SPADCALL (SPADCALL |zvar| 2 (QREFELT $ 107))
                                  (SPADCALL (SPADCALL 4 (QREFELT $ 114))
                                            (QREFELT $ 115))
                                  (QREFELT $ 116))
                        (QREFELT $ 108))))))) 

(SDEFUN |FS2UPS2;do_diff_eq|
        ((|ker| |Kernel| FE) (|losers| |List| UPS) (|lsers| |List| UPS)
         (|lsere| |List| FE) (|lser0| |List| FE)
         (|getEq| |Mapping| #1=(|List| UTS) (|List| FE) FE)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ups| (UPS)) (|lc| (|List| FE)) (#2=#:G569 NIL) (|c| NIL)
          (#3=#:G568 NIL) (|nker| (FE)) (#4=#:G567 NIL)
          (|lsyms| (|List| (|Symbol|))) (|sym| (|Symbol|)) (|ecl| #1#)
          (#5=#:G566 NIL) (#6=#:G565 NIL) (|cn1| (UTS))
          (|cn1u| (|Union| UTS "failed")) (|cn| (UTS)) (|z0| (FE))
          (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|))))))
         (SEQ (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $))
              (LETT |nargs| (QVELT |cargs| 0))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |lsere| (QREFELT $ 118))
                           (|spadConstant| $ 19) (QREFELT $ 21))
                 (SEQ
                  (LETT |nker|
                        (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) |nargs|
                                  (QREFELT $ 123)))
                  (EXIT
                   (|FS2UPS2;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
                    (QVELT |cargs| 1) $))))
                (#7='T
                 (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT $ 118)))
                      (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|))
                      (LETT |cn| (|SPADfirst| |ecl|))
                      (LETT |cn1u| (SPADCALL |cn| (QREFELT $ 125)))
                      (EXIT
                       (COND
                        ((QEQCAR |cn1u| 1)
                         (|error| "do_diff_eq: called at singular point"))
                        (#7#
                         (SEQ
                          (LETT |cn1| (SPADCALL (QCDR |cn1u|) (QREFELT $ 112)))
                          (LETT |ecl|
                                (PROGN
                                 (LETT #6# NIL)
                                 (SEQ (LETT |c| NIL) (LETT #5# (CDR |ecl|))
                                      G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |c| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #6#
                                              (CONS
                                               (SPADCALL |c| |cn1|
                                                         (QREFELT $ 111))
                                               #6#))))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT (NREVERSE #6#)))))
                          (LETT |nker|
                                (SPADCALL (SPADCALL |ker| (QREFELT $ 121))
                                          |nargs| (QREFELT $ 123)))
                          (LETT |lc| (LIST |nker|))
                          (LETT |lsyms| (QVELT |cargs| 2))
                          (LETT |sym| (|SPADfirst| |lsyms|))
                          (LETT |lsyms| (CDR |lsyms|))
                          (LETT |lsers| (CDR (QVELT |cargs| 1)))
                          (SEQ (LETT |c| NIL) (LETT #4# (CDR |ecl|)) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |c| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |nker|
                                      (SPADCALL |nker| |sym| (QREFELT $ 83)))
                                (EXIT (LETT |lc| (CONS |nker| |lc|))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (LETT |lc|
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |c| NIL) (LETT #2# (NREVERSE |lc|))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |c| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (SPADCALL |c|
                                                         (SPADCALL
                                                          (SPADCALL |sym|
                                                                    (QREFELT $
                                                                             88))
                                                          (|spadConstant| $ 19)
                                                          (QREFELT $ 90))
                                                         (QREFELT $ 127))
                                               #3#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (LETT |ups|
                                (SPADCALL (REVERSE |ecl|)
                                          (|SPADfirst| (QVELT |cargs| 1)) |lc|
                                          (QREFELT $ 129)))
                          (EXIT
                           (|FS2UPS2;do_taylor_via_deriv| |ups| |lsyms| |lsers|
                            $))))))))))))) 

(SDEFUN |FS2UPS2;lambertW0| ((|arg| UPS) ($ UPS))
        (SPADCALL (ELT $ 131) |arg| (QREFELT $ 99))) 

(SDEFUN |FS2UPS2;do_weierstrass|
        ((|losers| |List| UPS) (|lsers| |List| UPS) (|lsere| |List| FE)
         (|lser0| |List| FE) (|ef| |Mapping| UTS FE FE UTS) (|k| |Integer|)
         (|cz| |Integer|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G581 NIL)
          (|nres2|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|lsyms| (|List| (|Symbol|))) (|nres| (UPS)) (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (|z_inv| (UPS)) (|coef| (FE)) (|deg| (|Expon|)) (|z_ser| (UPS)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lsere| 3 (QREFELT $ 102))
                       (|spadConstant| $ 19) (QREFELT $ 21))
             (|error| "expansion at 0"))
            (#3='T
             (SEQ (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT $ 97)))
                  (COND
                   ((SPADCALL |cz| 0 (QREFELT $ 132))
                    (SEQ
                     (LETT |deg|
                           (SPADCALL |z_ser|
                                     (SPADCALL (QREFELT $ 15) (QREFELT $ 26))
                                     (QREFELT $ 32)))
                     (LETT |coef| (SPADCALL |z_ser| |deg| (QREFELT $ 28)))
                     (EXIT
                      (COND
                       ((SPADCALL |coef| (|spadConstant| $ 19) (QREFELT $ 21))
                        (|error|
                         "inverse of series with many leading zero coefficients"))
                       (#3#
                        (SEQ
                         (COND
                          ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                           (PROGN
                            (LETT #2#
                                  (|FS2UPS2;stateProblem| "weierstrass"
                                   "need to invert bad coefficient" $))
                            (GO #4=#:G580))))
                         (EXIT
                          (LETT |z_inv|
                                (SPADCALL |cz|
                                          (SPADCALL |z_ser| |k| (QREFELT $ 75))
                                          (QREFELT $ 133))))))))))
                   (#3# (LETT |z_inv| (|spadConstant| $ 56))))
                  (LETT |cargs|
                        (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| $))
                  (LETT |nargs| (QVELT |cargs| 0))
                  (LETT |nres|
                        (SPADCALL
                         (CONS #'|FS2UPS2;do_weierstrass!0|
                               (VECTOR |ef| $ |nargs|))
                         |z_ser| (QREFELT $ 99)))
                  (LETT |lsyms| (CDR (QVELT |cargs| 2)))
                  (LETT |lsers| (CDR (QVELT |cargs| 1)))
                  (LETT |nres2|
                        (|FS2UPS2;do_taylor_via_deriv| |nres| |lsyms| |lsers|
                         $))
                  (EXIT
                   (COND
                    ((QEQCAR |nres2| 1) (PROGN (LETT #2# |nres2|) (GO #4#)))
                    (#3#
                     (CONS 0
                           (SPADCALL |z_inv| (CDR |nres2|)
                                     (QREFELT $ 57))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;do_weierstrass!0| ((|f| NIL) ($$ NIL))
        (PROG (|nargs| $ |ef|)
          (LETT |nargs| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |nargs| (|spadConstant| $ 134) (QREFELT $ 102))
                      (SPADCALL |nargs| 2 (QREFELT $ 102)) |f| |ef|))))) 

(SDEFUN |FS2UPS2;make_taylor| ((|f| |Mapping| FE (|Integer|)) ($ UTS))
        (SPROG
         ((|sc| (|Stream| FE)) (|genc| (|Mapping| FE FE))
          (|rn| (|Reference| (|Integer|))))
         (SEQ (LETT |rn| (SPADCALL 1 (QREFELT $ 136)))
              (LETT |genc|
                    (CONS #'|FS2UPS2;make_taylor!0| (VECTOR |f| $ |rn|)))
              (LETT |sc| (SPADCALL |genc| (SPADCALL 0 |f|) (QREFELT $ 141)))
              (EXIT (SPADCALL |sc| (QREFELT $ 142)))))) 

(SDEFUN |FS2UPS2;make_taylor!0| ((|s| NIL) ($$ NIL))
        (PROG (|rn| $ |f|)
          (LETT |rn| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|val| NIL) (|n| NIL))
                   (SEQ (LETT |n| (SPADCALL |rn| (QREFELT $ 137)))
                        (LETT |val| (SPADCALL |n| |f|))
                        (SPADCALL |rn|
                                  (SPADCALL |n| (|spadConstant| $ 100)
                                            (QREFELT $ 138))
                                  (QREFELT $ 139))
                        (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;gen_erfs| ((|i| |Integer|) (|rv| |Reference| FE) ($ FE))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 1) (|spadConstant| $ 23))
                      ((SPADCALL |i| (QREFELT $ 33)) (|spadConstant| $ 19))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL
                               (SPADCALL (SPADCALL (- 2 |i|) (QREFELT $ 143))
                                         (SPADCALL 2 (QREFELT $ 143))
                                         (QREFELT $ 147))
                               (SPADCALL |rv| (QREFELT $ 154))
                               (QREFELT $ 145)))
                        (SPADCALL |rv| |val| (QREFELT $ 155)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_erfs|
        ((|iups| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG ((|lerfs| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| $ 23) (QREFELT $ 156)))
                (LETT |lerfs|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_erfs!0| (VECTOR $ |rv|)) $))
                (EXIT
                 (CONS 0
                       (SPADCALL (QREFELT $ 152)
                                 (SPADCALL |lerfs| |iups| (QREFELT $ 157))
                                 (QREFELT $ 158))))))) 

(SDEFUN |FS2UPS2;do_erfs!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| $)
          (LETT |rv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_erfs| |i| |rv| $))))) 

(SDEFUN |FS2UPS2;gen_erfis| ((|i| |Integer|) (|rv| |Reference| FE) ($ FE))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 1) (|spadConstant| $ 23))
                      ((SPADCALL |i| (QREFELT $ 33)) (|spadConstant| $ 19))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL
                               (SPADCALL (SPADCALL (- |i| 2) (QREFELT $ 143))
                                         (SPADCALL 2 (QREFELT $ 143))
                                         (QREFELT $ 147))
                               (SPADCALL |rv| (QREFELT $ 154))
                               (QREFELT $ 145)))
                        (SPADCALL |rv| |val| (QREFELT $ 155)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_erfis|
        ((|iups| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG ((|lerfs| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| $ 23) (QREFELT $ 156)))
                (LETT |lerfs|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_erfis!0| (VECTOR $ |rv|)) $))
                (EXIT
                 (CONS 0
                       (SPADCALL (QREFELT $ 152)
                                 (SPADCALL |lerfs| |iups| (QREFELT $ 157))
                                 (QREFELT $ 158))))))) 

(SDEFUN |FS2UPS2;do_erfis!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| $)
          (LETT |rv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_erfis| |i| |rv| $))))) 

(SDEFUN |FS2UPS2;gen_eis| ((|i| |Integer|) (|rv| |Reference| FE) ($ FE))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 0) (|spadConstant| $ 19))
                      ((EQL |i| 1) (|spadConstant| $ 23))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL (SPADCALL (- |i| 1) (QREFELT $ 143))
                                        (SPADCALL |rv| (QREFELT $ 154))
                                        (QREFELT $ 145)))
                        (SPADCALL |rv| |val| (QREFELT $ 155)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_eis|
        ((|iups| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG ((|leis| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| $ 23) (QREFELT $ 156)))
                (LETT |leis|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_eis!0| (VECTOR $ |rv|)) $))
                (EXIT (CONS 0 (SPADCALL |leis| |iups| (QREFELT $ 157))))))) 

(SDEFUN |FS2UPS2;do_eis!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| $)
          (LETT |rv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_eis| |i| |rv| $))))) 

(SDEFUN |FS2UPS2;gen_lg| ((|i| |Integer|) ($ FE))
        (SPROG ((|k| (|Integer|)))
               (SEQ
                (COND ((EQL |i| 0) (QREFELT $ 148))
                      ((SPADCALL |i| (QREFELT $ 33)) (|spadConstant| $ 19))
                      ('T
                       (SEQ (LETT |k| (+ |i| 1))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT $ 161))
                                        (QREFELT $ 162))
                              (SPADCALL (* |k| |i|) (QREFELT $ 143))
                              (QREFELT $ 147))))))))) 

(SDEFUN |FS2UPS2;do_log_gamma|
        ((|lc| FE) (|k| FE) (|lx| FE) (|ups| UPS) (|ups1| UPS) (|iups| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|r2| (UPS)) (|r1| (UPS)) (|l1| (UPS)) (|c1| (FE)) (|lgs| (UTS)))
         (SEQ
          (LETT |lgs|
                (|FS2UPS2;make_taylor| (CONS (|function| |FS2UPS2;gen_lg|) $)
                 $))
          (LETT |c1|
                (SPADCALL (SPADCALL |k| |lx| (QREFELT $ 145))
                          (SPADCALL |lc| (QREFELT $ 146)) (QREFELT $ 96)))
          (LETT |l1| (SPADCALL |ups1| (QREFELT $ 163)))
          (LETT |r1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |ups|
                            (SPADCALL (|spadConstant| $ 59)
                                      (SPADCALL 2 (QREFELT $ 143))
                                      (QREFELT $ 164))
                            (QREFELT $ 82))
                  (SPADCALL |l1| (SPADCALL |c1| (QREFELT $ 80)) (QREFELT $ 57))
                  (QREFELT $ 60))
                 |ups| (QREFELT $ 82)))
          (LETT |r2| (SPADCALL |lgs| |iups| (QREFELT $ 157)))
          (EXIT (CONS 0 (SPADCALL |r1| |r2| (QREFELT $ 57))))))) 

(SDEFUN |FS2UPS2;do_digamma|
        ((|lc| FE) (|k| FE) (|lx| FE) (|ups1| UPS) (|iups| UPS)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|r2| (UPS)) (|r1| (UPS)) (|c1| (FE)) (|ldig| (UTS)) (|lgs| (UTS)))
         (SEQ
          (LETT |lgs|
                (|FS2UPS2;make_taylor| (CONS (|function| |FS2UPS2;gen_lg|) $)
                 $))
          (LETT |ldig|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 166)) 2
                           (QREFELT $ 104))
                 (SPADCALL |lgs| (QREFELT $ 167)) (QREFELT $ 111)))
          (LETT |c1|
                (SPADCALL (SPADCALL |k| |lx| (QREFELT $ 145))
                          (SPADCALL |lc| (QREFELT $ 146)) (QREFELT $ 96)))
          (LETT |r1|
                (SPADCALL
                 (SPADCALL (SPADCALL |ups1| (QREFELT $ 163))
                           (SPADCALL |c1| (QREFELT $ 80)) (QREFELT $ 57))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 59) (SPADCALL 2 (QREFELT $ 143))
                             (QREFELT $ 164))
                   (QREFELT $ 168))
                  |iups| (QREFELT $ 60))
                 (QREFELT $ 57)))
          (LETT |r2| (SPADCALL |ldig| |iups| (QREFELT $ 157)))
          (EXIT (CONS 0 (SPADCALL |r1| |r2| (QREFELT $ 57))))))) 

(SDEFUN |FS2UPS2;spec_to_UPS|
        ((|ker| |Kernel| FE) (|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|nker| (FE)) (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (#2=#:G791 NIL) (|nexpr| (FE)) (|narg1| (FE)) (|arg1| (FE))
          (|ii| (|Union| (|Integer|) #3="failed")) (|ir| (|Union| R #3#))
          (|nm| (|Symbol|)) (|lser0| (|List| FE)) (|lsere| (|List| FE))
          (|lsers| (|List| UPS)) (|losers| (|List| UPS))
          (|ares|
           (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                     (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE))))
          (|aresu|
           (|Union|
            (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                      (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE)))
            (|Union| (|:| |%series| UPS)
                     (|:| |%problem|
                          (|Record| (|:| |func| (|String|))
                                    (|:| |prob| (|String|)))))))
          (|ups1| (UPS)) (|iups| (UPS))
          (|signum| (|Union| (|Integer|) "failed")) (|lc| (FE))
          (|ord| (|Expon|)) (|ups| (UPS)) (#4=#:G482 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |nm| (SPADCALL |ker| (QREFELT $ 170)))
                (COND
                 ((OR (EQUAL |nm| '|digamma|)
                      (OR (EQUAL |nm| '|%logGamma|)
                          (OR (EQUAL |nm| '|%eis|)
                              (OR (EQUAL |nm| '|%erfs|)
                                  (EQUAL |nm| '|%erfis|)))))
                  (SEQ (LETT |arg1| (SPADCALL |args| 1 (QREFELT $ 102)))
                       (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg1| |opt_rec| $))
                       (EXIT
                        (COND
                         ((QEQCAR |nsu| 1)
                          (PROGN (LETT #2# |nsu|) (GO #5=#:G790)))
                         (#6='T
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |nsu|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT $ 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |ord|
                                 (SPADCALL |ups| (|spadConstant| $ 81)
                                           (QREFELT $ 32)))
                           (EXIT
                            (COND
                             ((SPADCALL |ord| (|spadConstant| $ 81)
                                        (QREFELT $ 29))
                              (PROGN
                               (LETT #2#
                                     (COND
                                      ((NULL (QVELT |opt_rec| 5))
                                       (|FS2UPS2;stateProblem|
                                        (SPADCALL |nm| (QREFELT $ 172))
                                        "argument not Taylor" $))
                                      (#7='T
                                       (SEQ
                                        (LETT |lc|
                                              (SPADCALL |ups| |ord|
                                                        (QREFELT $ 28)))
                                        (LETT |signum|
                                              (SPADCALL |lc| (QREFELT $ 36)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |signum| 1)
                                           (|FS2UPS2;stateProblem|
                                            (SPADCALL |nm| (QREFELT $ 172))
                                            "branch problem" $))
                                          ((SPADCALL |signum| (CONS 0 -1)
                                                     (QREFELT $ 173))
                                           (|FS2UPS2;stateProblem|
                                            (SPADCALL |nm| (QREFELT $ 172))
                                            "expansion at - infinity" $))
                                          (#6#
                                           (SEQ
                                            (LETT |iups|
                                                  (SPADCALL |ups| -1
                                                            (QREFELT $ 75)))
                                            (EXIT
                                             (COND
                                              ((EQUAL |nm| '|%eis|)
                                               (|FS2UPS2;do_eis| |iups| $))
                                              ((EQUAL |nm| '|%erfs|)
                                               (|FS2UPS2;do_erfs| |iups| $))
                                              ((EQUAL |nm| '|%erfis|)
                                               (|FS2UPS2;do_erfis| |iups| $))
                                              (#6#
                                               (SEQ
                                                (LETT |ups1|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|spadConstant| $ 23)
                                                         |lc| (QREFELT $ 147))
                                                        (SPADCALL |ord|
                                                                  (QREFELT $
                                                                           174))
                                                        (QREFELT $ 68))
                                                       |ups| (QREFELT $ 60)))
                                                (EXIT
                                                 (COND
                                                  ((EQUAL |nm| '|digamma|)
                                                   (|FS2UPS2;do_digamma| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT $ 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |iups| $))
                                                  ((EQUAL |nm| '|%logGamma|)
                                                   (|FS2UPS2;do_log_gamma| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT $ 13))
                                                    (QVELT |opt_rec| 6) |ups|
                                                    |ups1| |iups|
                                                    $))))))))))))))))
                               (GO #5#))))))))))))
                (LETT |aresu| (|FS2UPS2;handle_args| |args| |opt_rec| $))
                (EXIT
                 (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
                       (#6#
                        (SEQ (LETT |ares| (QCDR |aresu|))
                             (LETT |losers| (QVELT |ares| 0))
                             (LETT |lsers| (QVELT |ares| 1))
                             (LETT |lsere| (QVELT |ares| 2))
                             (LETT |lser0| (QVELT |ares| 3))
                             (LETT |nm| (SPADCALL |ker| (QREFELT $ 170)))
                             (COND
                              ((OR (EQUAL |nm| '|besselI|)
                                   (EQUAL |nm| '|besselK|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at 0" $))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;besselEqm|) $)
                                   $))))))
                             (COND
                              ((OR (EQUAL |nm| '|besselJ|)
                                   (OR (EQUAL |nm| '|besselY|)
                                       (OR (EQUAL |nm| '|hankelH1|)
                                           (EQUAL |nm| '|hankelH2|))))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at 0" $))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;besselEq|) $)
                                   $))))))
                             (COND
                              ((OR (EQUAL |nm| '|kummerM|)
                                   (EQUAL |nm| '|kummerU|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 3 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at 0" $))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;kummerEq|) $)
                                   $))))))
                             (COND
                              ((OR (EQUAL |nm| '|whittakerM|)
                                   (EQUAL |nm| '|whittakerW|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 3 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at 0" $))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;whittakerEq|) $)
                                   $))))))
                             (COND
                              ((OR (EQUAL |nm| '|kelvinBer|)
                                   (OR (EQUAL |nm| '|kelvinBei|)
                                       (OR (EQUAL |nm| '|kelvinKer|)
                                           (EQUAL |nm| '|kelvinKei|))))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT $ 102))
                                   (|spadConstant| $ 19) (QREFELT $ 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at 0" $))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;kelvinEq|) $)
                                   $))))))
                             (COND
                              ((OR (EQUAL |nm| '|legendreP|)
                                   (EQUAL |nm| '|legendreQ|))
                               (EXIT
                                (COND
                                 ((OR
                                   (SPADCALL
                                    (SPADCALL |lser0| 3 (QREFELT $ 102))
                                    (|spadConstant| $ 23) (QREFELT $ 21))
                                   (SPADCALL
                                    (SPADCALL |lser0| 3 (QREFELT $ 102))
                                    (SPADCALL (|spadConstant| $ 23)
                                              (QREFELT $ 166))
                                    (QREFELT $ 21)))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT $ 172))
                                   "expansion at +-1" $))
                                 (#7#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;legendreEq|) $)
                                   $))))))
                             (COND
                              ((EQUAL |nm| '|lambertW|)
                               (COND
                                ((SPADCALL (SPADCALL |lser0| 1 (QREFELT $ 102))
                                           (|spadConstant| $ 19)
                                           (QREFELT $ 21))
                                 (EXIT
                                  (CONS 0
                                        (|FS2UPS2;lambertW0|
                                         (SPADCALL |losers| 1 (QREFELT $ 97))
                                         $)))))))
                             (EXIT
                              (COND
                               ((EQUAL |nm| '|jacobiSn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 175) $))
                               ((EQUAL |nm| '|jacobiCn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 176) $))
                               ((EQUAL |nm| '|jacobiDn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 177) $))
                               ((EQUAL |nm| '|ellipticE2|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 178) $))
                               ((EQUAL |nm| '|ellipticF|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 179) $))
                               ((EQUAL |nm| '|ellipticPi|)
                                (|FS2UPS2;do_ell3| |losers| |lsers| |lsere|
                                 |lser0| (ELT $ 180) $))
                               (#6#
                                (SEQ
                                 (COND
                                  ((EQUAL |nm| '|weierstrassP|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT $ 102))
                                      (|spadConstant| $ 19) (QREFELT $ 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT $ 181) -2 1
                                       |opt_rec| $))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassPPrime|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT $ 102))
                                      (|spadConstant| $ 19) (QREFELT $ 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT $ 182) -3
                                       -2 |opt_rec| $))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassZeta|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT $ 102))
                                      (|spadConstant| $ 19) (QREFELT $ 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT $ 183) -1 1
                                       |opt_rec| $))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassSigma|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT $ 102))
                                      (|spadConstant| $ 19) (QREFELT $ 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT $ 184) 0 0
                                       |opt_rec| $))))))
                                 (COND
                                  ((EQUAL |nm| '|Gamma|)
                                   (SEQ
                                    (LETT |ir|
                                          (SPADCALL
                                           (SPADCALL |lser0| 1 (QREFELT $ 102))
                                           (QREFELT $ 186)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ir| 0)
                                       (SEQ
                                        (LETT |ii|
                                              (SPADCALL (QCDR |ir|)
                                                        (QREFELT $ 187)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |ii| 0)
                                           (COND
                                            ((SPADCALL (QCDR |ii|) 0
                                                       (QREFELT $ 188))
                                             (SEQ
                                              (LETT |arg1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT $ 102)))
                                              (LETT |narg1|
                                                    (SPADCALL
                                                     (|spadConstant| $ 23)
                                                     |arg1| (QREFELT $ 189)))
                                              (LETT |nker|
                                                    (SPADCALL
                                                     (SPADCALL |ker|
                                                               (QREFELT $ 121))
                                                     (LIST |narg1|)
                                                     (QREFELT $ 123)))
                                              (LETT |nexpr|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 144))
                                                     (SPADCALL |nker|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $
                                                                           144))
                                                                 |arg1|
                                                                 (QREFELT $
                                                                          145))
                                                                (QREFELT $
                                                                         190))
                                                               (QREFELT $ 145))
                                                     (QREFELT $ 147)))
                                              (EXIT
                                               (PROGN
                                                (LETT #2#
                                                      (|FS2UPS2;i_expr_to_PS|
                                                       |nexpr| |opt_rec| $))
                                                (GO #5#))))))))))))))))
                                 (LETT |cargs|
                                       (|FS2UPS2;convert_args| |lsers| |lsere|
                                        |lser0| $))
                                 (LETT |nargs| (QVELT |cargs| 0))
                                 (LETT |nker|
                                       (SPADCALL
                                        (SPADCALL |ker| (QREFELT $ 121))
                                        |nargs| (QREFELT $ 123)))
                                 (EXIT
                                  (|FS2UPS2;do_taylor_via_deriv2| |nker|
                                   (QVELT |cargs| 2) (QVELT |cargs| 1)
                                   $))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;atan1;2UPS;41| ((|ups| UPS) ($ UPS))
        (SPROG ((|yCoef| (FE)) (|y| (UPS)))
               (SEQ
                (LETT |y|
                      (SPADCALL (SPADCALL |ups| (QREFELT $ 192))
                                (SPADCALL (|spadConstant| $ 59)
                                          (SPADCALL |ups| |ups| (QREFELT $ 60))
                                          (QREFELT $ 57))
                                (QREFELT $ 193)))
                (LETT |yCoef|
                      (SPADCALL |y|
                                (SPADCALL (|spadConstant| $ 113)
                                          (QREFELT $ 174))
                                (QREFELT $ 28)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |yCoef| (QREFELT $ 146))
                            (|spadConstant| $ 81) (QREFELT $ 68))
                  (SPADCALL
                   (SPADCALL |y|
                             (SPADCALL |yCoef|
                                       (SPADCALL (|spadConstant| $ 113)
                                                 (QREFELT $ 174))
                                       (QREFELT $ 68))
                             (QREFELT $ 82))
                   (QREFELT $ 194))
                  (QREFELT $ 57)))))) 

(SDEFUN |FS2UPS2;integ;2UPS;42| ((|f| UPS) ($ UPS))
        (SPADCALL |f| (QREFELT $ 194))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;43| ((|f| UPS) (|xs| UPS) ($ UPS))
        (SPADCALL (SPADCALL (SPADCALL |xs| (QREFELT $ 192)) |f| (QREFELT $ 60))
                  (QREFELT $ 194))) 

(PUT '|FS2UPS2;atan1;2UPS;44| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(SDEFUN |FS2UPS2;atan1;2UPS;44| ((|ups| UPS) ($ UPS))
        (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;45| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ;2UPS;45| ((|f| UPS) ($ UPS))
        (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;46| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;46| ((|f| UPS) (|xs| UPS) ($ UPS))
        (|error| "integ_df called, but no integrate")) 

(PUT '|FS2UPS2;atan1;2UPS;47| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(SDEFUN |FS2UPS2;atan1;2UPS;47| ((|ups| UPS) ($ UPS))
        (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;48| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ;2UPS;48| ((|f| UPS) ($ UPS))
        (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;49| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;49| ((|f| UPS) (|xs| UPS) ($ UPS))
        (|error| "integ_df called, but no integrate")) 

(SDEFUN |FS2UPS2;do_prim|
        ((|ker| |Kernel| FE) (|arg0| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G805 NIL)
          (|ns|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|nf| (FE)) (|c0| (FE)))
         (SEQ
          (EXIT
           (COND
            ((QREFELT $ 191)
             (SEQ
              (LETT |c0|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 121)) |arg0|
                              (QREFELT $ 198)))
              (LETT |nf|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 200)) (QREFELT $ 14)
                              (QREFELT $ 83)))
              (LETT |ns| (|FS2UPS2;i_expr_to_PS| |nf| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |ns| 1) (PROGN (LETT #2# |ns|) (GO #3=#:G804)))
                     (#4='T
                      (CONS 0
                            (SPADCALL (SPADCALL |c0| (QREFELT $ 80))
                                      (SPADCALL (CDR |ns|) (QREFELT $ 196))
                                      (QREFELT $ 57))))))))
            (#4#
             (|FS2UPS2;spec_to_UPS| |ker| (SPADCALL |ker| (QREFELT $ 201))
              |opt_rec| $))))
          #3# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;prim_to_UPS|
        ((|ker| |Kernel| FE) (|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|coef| (FE)) (#2=#:G823 NIL) (|ups| (UPS)) (#3=#:G482 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|arg| (FE)) (|nm| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nm| (SPADCALL |ker| (QREFELT $ 170)))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 202))
                   (|FS2UPS2;stateProblem| (SPADCALL |nm| (QREFELT $ 172))
                    "multivariate primitive" $))
                  (#4='T
                   (SEQ (LETT |arg| (|SPADfirst| |args|))
                        (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                        (EXIT
                         (COND
                          ((QEQCAR |nsu| 1)
                           (PROGN (LETT #2# |nsu|) (GO #5=#:G822)))
                          (#4#
                           (SEQ
                            (LETT |ups|
                                  (PROG2 (LETT #3# |nsu|)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (QREFELT $ 9)
                                                    (|Union|
                                                     (|:| |%series|
                                                          (QREFELT $ 9))
                                                     (|:| |%problem|
                                                          (|Record|
                                                           (|:| |func|
                                                                (|String|))
                                                           (|:| |prob|
                                                                (|String|)))))
                                                    #3#)))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL |ups| (|spadConstant| $ 81)
                                          (QREFELT $ 32))
                                (|spadConstant| $ 81) (QREFELT $ 29))
                               (PROGN
                                (LETT #2#
                                      (|FS2UPS2;stateProblem| "handle_args"
                                       "argument not Taylor" $))
                                (GO #5#)))
                              (#4#
                               (SEQ
                                (LETT |coef|
                                      (SPADCALL |ups| (|spadConstant| $ 81)
                                                (QREFELT $ 28)))
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
                                      (SPADCALL |nm| (QREFELT $ 172))
                                      "expansion at 0" $))
                                    (#4#
                                     (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                      $))))))
                                (EXIT
                                 (COND
                                  ((EQUAL |nm| '|li|)
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| $ 19)
                                               (QREFELT $ 21))
                                     (|FS2UPS2;stateProblem|
                                      (SPADCALL |nm| (QREFELT $ 172))
                                      "expansion at 0" $))
                                    ((SPADCALL |coef| (|spadConstant| $ 23)
                                               (QREFELT $ 21))
                                     (|FS2UPS2;stateProblem|
                                      (SPADCALL |nm| (QREFELT $ 172))
                                      "expansion at 1" $))
                                    (#4#
                                     (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                      $))))
                                  ((OR (EQUAL |nm| '|Si|)
                                       (OR (EQUAL |nm| '|Shi|)
                                           (OR (EQUAL |nm| '|erf|)
                                               (OR (EQUAL |nm| '|erfi|)
                                                   (OR (EQUAL |nm| '|fresnelS|)
                                                       (EQUAL |nm|
                                                              '|fresnelC|))))))
                                   (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                    $))
                                  ('T
                                   (|FS2UPS2;stateProblem|
                                    (SPADCALL (SPADCALL |ker| (QREFELT $ 170))
                                              (QREFELT $ 172))
                                    "unimplemented" $))))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;unknown_to_UPS|
        ((|ker| |Kernel| FE) (|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|nker| (FE)) (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (|lser0| (|List| FE)) (|lsere| (|List| FE)) (|lsers| (|List| UPS))
          (|losers| (|List| UPS))
          (|ares|
           (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                     (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE))))
          (|aresu|
           (|Union|
            (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                      (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE)))
            (|Union| (|:| |%series| UPS)
                     (|:| |%problem|
                          (|Record| (|:| |func| (|String|))
                                    (|:| |prob| (|String|))))))))
         (SEQ (LETT |aresu| (|FS2UPS2;handle_args| |args| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
                     ('T
                      (SEQ (LETT |ares| (QCDR |aresu|))
                           (LETT |losers| (QVELT |ares| 0))
                           (LETT |lsers| (QVELT |ares| 1))
                           (LETT |lsere| (QVELT |ares| 2))
                           (LETT |lser0| (QVELT |ares| 3))
                           (LETT |cargs|
                                 (|FS2UPS2;convert_args| |lsers| |lsere|
                                  |lser0| $))
                           (LETT |nargs| (QVELT |cargs| 0))
                           (LETT |nker|
                                 (SPADCALL (SPADCALL |ker| (QREFELT $ 121))
                                           |nargs| (QREFELT $ 123)))
                           (EXIT
                            (|FS2UPS2;do_taylor_via_deriv2| |nker|
                             (QVELT |cargs| 2) (QVELT |cargs| 1) $))))))))) 

(SDEFUN |FS2UPS2;kernelToUPS|
        ((|ker| |Kernel| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G841 NIL) (|n| (|Integer|)) (|arg| (FE))
          (|op| (|BasicOperator|)) (|args| (|List| FE))
          (|sym| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |sym| (SPADCALL |ker| (QREFELT $ 204)))
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
                         (SPADCALL (SPADCALL |ker| (QREFELT $ 200))
                                   (|spadConstant| $ 81) (QREFELT $ 68))))))
                ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 201))))
                     (NULL
                      (SPADCALL (QREFELT $ 14)
                                (SPADCALL (SPADCALL |ker| (QREFELT $ 200))
                                          (QREFELT $ 78))
                                (QREFELT $ 79))))
                 (CONS 0
                       (SPADCALL (SPADCALL |ker| (QREFELT $ 200))
                                 (|spadConstant| $ 81) (QREFELT $ 68))))
                ('T
                 (SEQ (LETT |op| (SPADCALL |ker| (QREFELT $ 121)))
                      (EXIT
                       (COND
                        ((SPADCALL |op| '|special| (QREFELT $ 205))
                         (|FS2UPS2;spec_to_UPS| |ker| |args| |opt_rec| $))
                        ((SPADCALL |op| '|prim| (QREFELT $ 205))
                         (|FS2UPS2;prim_to_UPS| |ker| |args| |opt_rec| $))
                        ((NULL (CDR |args|))
                         (SEQ (LETT |arg| (|SPADfirst| |args|))
                              (EXIT
                               (COND
                                ((SPADCALL |ker| '|abs| (QREFELT $ 206))
                                 (|FS2UPS2;nthRootToUPS|
                                  (SPADCALL |arg| |arg| (QREFELT $ 145)) 2
                                  |opt_rec| $))
                                ((SPADCALL |ker| '|%paren| (QREFELT $ 206))
                                 (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                                ((SPADCALL |ker| '|log| (QREFELT $ 206))
                                 (|FS2UPS2;logToUPS| |arg| |opt_rec| $))
                                ((SPADCALL |ker| '|exp| (QREFELT $ 206))
                                 (|FS2UPS2;applyIfCan| (ELT $ 207) |arg| "exp"
                                  |opt_rec| $))
                                (#3#
                                 (|FS2UPS2;tranToUPS| |ker| |arg| |opt_rec|
                                  $))))))
                        ((SPADCALL |ker| '|%power| (QREFELT $ 206))
                         (SPADCALL |args| |opt_rec| (QREFELT $ 210)))
                        ((SPADCALL |ker| '|nthRoot| (QREFELT $ 206))
                         (SEQ
                          (LETT |n|
                                (SPADCALL (SPADCALL |args| (QREFELT $ 211))
                                          (QREFELT $ 212)))
                          (EXIT
                           (|FS2UPS2;nthRootToUPS| (|SPADfirst| |args|)
                            (PROG1 (LETT #2# |n|)
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            |opt_rec| $))))
                        (#3#
                         (|FS2UPS2;unknown_to_UPS| |ker| |args| |opt_rec|
                          $))))))))))) 

(SDEFUN |FS2UPS2;nthRootToUPS|
        ((|arg| FE) (|n| |NonNegativeInteger|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |result| 1) |result|)
                     (#2='T
                      (SEQ
                       (LETT |ans|
                             (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                              |opt_rec| NIL $))
                       (EXIT
                        (COND ((QEQCAR |ans| 1) |ans|)
                              (#2# (CONS 0 (CDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;logToUPS|
        ((|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|logTerm| (FE)) (|lt| (UPS)) (#2=#:G870 NIL) (#3=#:G878 NIL)
          (#4=#:G877 NIL) (|signum| (|Union| (|Integer|) "failed"))
          (#5=#:G876 NIL) (|coef| (FE)) (|deg| (|Expon|)) (|ups| (UPS))
          (|deg1| (|Expon|)) (#6=#:G482 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#7='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #6# |result|)
                                     (QCDR #6#)
                                   (|check_union2| (QEQCAR #6# 0) (QREFELT $ 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT $ 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #6#)))
                           (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)))
                           (LETT |deg1|
                                 (SPADCALL |deg|
                                           (SPADCALL (QREFELT $ 15)
                                                     (QREFELT $ 26))
                                           (QREFELT $ 27)))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND
                                    ((|FS2UPS2;check_zero|
                                      (LETT |coef|
                                            (SPADCALL |ups| |deg|
                                                      (QREFELT $ 28)))
                                      |opt_rec| $)
                                     (SPADCALL |deg| |deg1| (QREFELT $ 29)))
                                    ('T NIL)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| $ 19)
                                               (QREFELT $ 30))
                                     (LETT |ups|
                                           (SPADCALL |ups| (QREFELT $ 31)))))
                                   (LETT |deg|
                                         (SPADCALL |ups| |deg1|
                                                   (QREFELT $ 32)))
                                   (LETT |coef|
                                         (SPADCALL |ups| |deg| (QREFELT $ 28)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |coef| (|spadConstant| $ 19)
                                                (QREFELT $ 21))
                                      (PROGN
                                       (LETT #5#
                                             (|error|
                                              "log of series with many leading zero coefficients"))
                                       (GO #8=#:G858)))))))
                                 #8# (EXIT #5#))
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
                              (LETT |signum| (SPADCALL |coef| (QREFELT $ 36)))
                              (EXIT
                               (COND
                                ((QEQCAR |signum| 0)
                                 (COND
                                  ((EQL (QCDR |signum|) -1)
                                   (PROGN
                                    (LETT #4#
                                          (PROGN
                                           (LETT #3#
                                                 (|FS2UPS2;stateProblem| "log"
                                                  "negative leading coefficient"
                                                  $))
                                           (GO #9=#:G875)))
                                    (GO #10=#:G873))))))))))
                           (COND
                            ((NULL
                              (|FS2UPS2;check_inverse| |coef| |opt_rec| $))
                             (PROGN
                              (LETT #3#
                                    (|FS2UPS2;stateProblem| "log"
                                     "need to invert bad coefficient" $))
                              (GO #9#))))
                           (EXIT
                            (COND
                             ((SPADCALL |deg| (QREFELT $ 37))
                              (CONS 0
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |ups| (QREFELT $ 213)))
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               "failed")
                                                      #2#))))
                             (#7#
                              (SEQ
                               (LETT |lt|
                                     (SPADCALL |coef| |deg| (QREFELT $ 68)))
                               (LETT |logTerm|
                                     (SPADCALL
                                      (SPADCALL |coef| (QREFELT $ 146))
                                      (SPADCALL (SPADCALL |deg| (QREFELT $ 13))
                                                (QVELT |opt_rec| 6)
                                                (QREFELT $ 145))
                                      (QREFELT $ 96)))
                               (EXIT
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL |logTerm|
                                                 (|spadConstant| $ 81)
                                                 (QREFELT $ 68))
                                       (SPADCALL
                                        (SPADCALL |ups| |lt| (QREFELT $ 193))
                                        (QREFELT $ 163))
                                       (QREFELT $ 57))))))))))
                         #10# (EXIT #4#)))))))
          #9# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;localAbs;2FE;56| ((|fcn| FE) ($ FE))
        (SPADCALL |fcn| (QREFELT $ 214))) 

(SDEFUN |FS2UPS2;localAbs;2FE;57| ((|fcn| FE) ($ FE))
        (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT $ 145)) (QREFELT $ 151))) 

(SDEFUN |FS2UPS2;signOfExpression| ((|arg| FE) ($ FE))
        (SPADCALL (SPADCALL |arg| (QREFELT $ 215)) |arg| (QREFELT $ 147))) 

(SDEFUN |FS2UPS2;atanacot2|
        ((|ups| UPS) (|coef| FE) (|ord| |Expon|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               #1=(|Union| "complex" "real: two sides" "real: left side"
                           "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         (|plusMinus| |Integer|)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|cc| (FE)) (|n| (|Integer|)) (|left?| (|Boolean|))
          (|posNegPi2| (FE)) (|signum| (|Union| (|Integer|) "failed"))
          (|lc| (FE)) (#3=#:G904 NIL)
          (|rn| (|Union| (|Fraction| (|Integer|)) "failed")) (|atanFlag| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |atanFlag| (QVELT |opt_rec| 1))
                (LETT |cc|
                      (COND
                       ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 29))
                        (COND
                         ((SPADCALL |atanFlag| (CONS 0 "complex")
                                    (QREFELT $ 216))
                          (PROGN
                           (LETT #3#
                                 (|FS2UPS2;stateProblem| "atan"
                                  "essential singularity" $))
                           (GO #4=#:G903)))
                         (#5='T
                          (SEQ
                           (LETT |rn|
                                 (|FS2UPS2;ratIfCan|
                                  (SPADCALL |ord| (QREFELT $ 13)) $))
                           (EXIT
                            (COND
                             ((QEQCAR |rn| 1)
                              (PROGN
                               (LETT #3#
                                     (|FS2UPS2;stateProblem| "atan"
                                      "branch problem" $))
                               (GO #4#)))
                             (#5#
                              (SEQ
                               (COND
                                ((SPADCALL |atanFlag|
                                           (CONS 1 "real: two sides")
                                           (QREFELT $ 216))
                                 (COND
                                  ((ODDP
                                    (SPADCALL (QCDR |rn|) (QREFELT $ 217)))
                                   (PROGN
                                    (LETT #3#
                                          (|FS2UPS2;stateProblem| "atan"
                                           "branch problem" $))
                                    (GO #4#))))))
                               (LETT |lc|
                                     (SPADCALL |ups| |ord| (QREFELT $ 28)))
                               (LETT |signum| (SPADCALL |lc| (QREFELT $ 36)))
                               (EXIT
                                (COND
                                 ((QEQCAR |signum| 1)
                                  (COND
                                   ((SPADCALL |atanFlag| (CONS 4 "just do it")
                                              (QREFELT $ 216))
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL (SPADCALL (QREFELT $ 144))
                                                (SPADCALL 2 (QREFELT $ 143))
                                                (QREFELT $ 147)))
                                     (#5# (|spadConstant| $ 19))))
                                   (#5#
                                    (SEQ
                                     (LETT |posNegPi2|
                                           (SPADCALL
                                            (SPADCALL
                                             (|FS2UPS2;signOfExpression| |lc|
                                              $)
                                             (SPADCALL (QREFELT $ 144))
                                             (QREFELT $ 145))
                                            (SPADCALL 2 (QREFELT $ 143))
                                            (QREFELT $ 147)))
                                     (EXIT
                                      (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                            (#5#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QREFELT $ 144))
                                               (SPADCALL 2 (QREFELT $ 143))
                                               (QREFELT $ 147))
                                              |posNegPi2|
                                              (QREFELT $ 189)))))))))
                                 (#5#
                                  (SEQ
                                   (LETT |left?|
                                         (SPADCALL |atanFlag|
                                                   (CONS 2 "real: left side")
                                                   (QREFELT $ 216)))
                                   (LETT |n| (QCDR |signum|))
                                   (COND
                                    (|left?|
                                     (COND
                                      ((EQL |n| 1)
                                       (EXIT
                                        (COND
                                         ((EQL |plusMinus| 1)
                                          (SPADCALL
                                           (SPADCALL (SPADCALL (QREFELT $ 144))
                                                     (SPADCALL 2
                                                               (QREFELT $ 143))
                                                     (QREFELT $ 147))
                                           (QREFELT $ 166)))
                                         (#5# (SPADCALL (QREFELT $ 144))))))
                                      ((NULL |left?|)
                                       (COND
                                        ((EQL |n| -1)
                                         (EXIT
                                          (COND
                                           ((EQL |plusMinus| 1)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 144))
                                              (SPADCALL 2 (QREFELT $ 143))
                                              (QREFELT $ 147))
                                             (QREFELT $ 166)))
                                           (#5#
                                            (SPADCALL (QREFELT $ 144))))))))))
                                    ((EQL |n| -1)
                                     (EXIT
                                      (COND
                                       ((EQL |plusMinus| 1)
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 144))
                                                   (SPADCALL 2 (QREFELT $ 143))
                                                   (QREFELT $ 147))
                                         (QREFELT $ 166)))
                                       (#5# (SPADCALL (QREFELT $ 144)))))))
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL (SPADCALL (QREFELT $ 144))
                                                (SPADCALL 2 (QREFELT $ 143))
                                                (QREFELT $ 147)))
                                     (#5# (|spadConstant| $ 19))))))))))))))))
                       ((EQL |plusMinus| 1) (SPADCALL |coef| (QREFELT $ 218)))
                       (#5# (SPADCALL |coef| (QREFELT $ 219)))))
                (EXIT
                 (CONS 0
                       (SPADCALL (SPADCALL |cc| (QREFELT $ 80))
                                 (SPADCALL
                                  (SPADCALL |plusMinus|
                                            (SPADCALL (|spadConstant| $ 59)
                                                      (SPADCALL
                                                       (|spadConstant| $ 59)
                                                       (SPADCALL |ups| |ups|
                                                                 (QREFELT $
                                                                          60))
                                                       (QREFELT $ 57))
                                                      (QREFELT $ 193))
                                            (QREFELT $ 133))
                                  |ups| (QREFELT $ 197))
                                 (QREFELT $ 57))))))
          #4# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;atancotToUPS|
        ((|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         (|plusMinus| |Integer|)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|res1| (|Union| UPS "failed")) (#2=#:G915 NIL) (#3=#:G916 NIL)
          (|ord| (|Expon|)) (|coef| (FE)) (|ups| (UPS)) (#4=#:G482 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#5='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |result|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT $ 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |coef|
                                 (SPADCALL |ups| (|spadConstant| $ 81)
                                           (QREFELT $ 28)))
                           (SEQ
                            (LETT |ord|
                                  (SPADCALL |ups| (|spadConstant| $ 81)
                                            (QREFELT $ 32)))
                            (EXIT
                             (COND
                              ((SPADCALL |ord| (|spadConstant| $ 81)
                                         (QREFELT $ 220))
                               (COND
                                ((SPADCALL
                                  (SPADCALL |coef| |coef| (QREFELT $ 145))
                                  (SPADCALL (|spadConstant| $ 23)
                                            (QREFELT $ 166))
                                  (QREFELT $ 21))
                                 (PROGN
                                  (LETT #2#
                                        (PROGN
                                         (LETT #3#
                                               (|FS2UPS2;stateProblem| "atan"
                                                "logarithmic singularity" $))
                                         (GO #6=#:G914)))
                                  (GO #7=#:G912))))))))
                           (EXIT
                            (COND
                             ((QREFELT $ 191)
                              (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                               |plusMinus| $))
                             ((SPADCALL |ord| (|spadConstant| $ 81)
                                        (QREFELT $ 29))
                              (|FS2UPS2;stateProblem| "atan"
                               "argument of negative order" $))
                             (#5#
                              (SEQ
                               (LETT |res1|
                                     (COND
                                      ((EQL |plusMinus| 1)
                                       (SPADCALL |ups| (QREFELT $ 221)))
                                      (#5# (SPADCALL |ups| (QREFELT $ 222)))))
                               (EXIT
                                (COND
                                 ((QEQCAR |res1| 1)
                                  (|FS2UPS2;stateProblem| "atan" "failed" $))
                                 (#5# (CONS 0 (QCDR |res1|)))))))))))
                         #7# (EXIT #2#)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;applyIfCan|
        ((|fcn| |Mapping| #1=(|Union| UPS "failed") UPS) (|arg| FE)
         (|fcnName| |String|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans| #1#)
          (|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |ups| 1) |ups|)
                     (#3='T
                      (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|))
                           (EXIT
                            (COND
                             ((QEQCAR |ans| 1)
                              (|FS2UPS2;stateProblem| |fcnName|
                               "essential singularity" $))
                             (#3# (CONS 0 (QCDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;tranToUPS|
        ((|ker| |Kernel| FE) (|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (COND
         ((SPADCALL |ker| '|sin| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 223) |arg| "sin" |opt_rec| $))
         ((SPADCALL |ker| '|cos| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 224) |arg| "cos" |opt_rec| $))
         ((SPADCALL |ker| '|tan| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 225) |arg| "tan" |opt_rec| $))
         ((SPADCALL |ker| '|cot| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 226) |arg| "cot" |opt_rec| $))
         ((SPADCALL |ker| '|sec| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 227) |arg| "sec" |opt_rec| $))
         ((SPADCALL |ker| '|csc| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 228) |arg| "csc" |opt_rec| $))
         ((SPADCALL |ker| '|asin| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 229) |arg| "asin" |opt_rec| $))
         ((SPADCALL |ker| '|acos| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 230) |arg| "acos" |opt_rec| $))
         ((SPADCALL |ker| '|atan| (QREFELT $ 206))
          (|FS2UPS2;atancotToUPS| |arg| |opt_rec| 1 $))
         ((SPADCALL |ker| '|acot| (QREFELT $ 206))
          (|FS2UPS2;atancotToUPS| |arg| |opt_rec| -1 $))
         ((SPADCALL |ker| '|asec| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 231) |arg| "asec" |opt_rec| $))
         ((SPADCALL |ker| '|acsc| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 232) |arg| "acsc" |opt_rec| $))
         ((SPADCALL |ker| '|sinh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 233) |arg| "sinh" |opt_rec| $))
         ((SPADCALL |ker| '|cosh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 234) |arg| "cosh" |opt_rec| $))
         ((SPADCALL |ker| '|tanh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 235) |arg| "tanh" |opt_rec| $))
         ((SPADCALL |ker| '|coth| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 236) |arg| "coth" |opt_rec| $))
         ((SPADCALL |ker| '|sech| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 237) |arg| "sech" |opt_rec| $))
         ((SPADCALL |ker| '|csch| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 238) |arg| "csch" |opt_rec| $))
         ((SPADCALL |ker| '|asinh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 239) |arg| "asinh" |opt_rec| $))
         ((SPADCALL |ker| '|acosh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 240) |arg| "acosh" |opt_rec| $))
         ((SPADCALL |ker| '|atanh| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 241) |arg| "atanh" |opt_rec| $))
         ((SPADCALL |ker| '|acoth| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 242) |arg| "acoth" |opt_rec| $))
         ((SPADCALL |ker| '|asech| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 243) |arg| "asech" |opt_rec| $))
         ((SPADCALL |ker| '|acsch| (QREFELT $ 206))
          (|FS2UPS2;applyIfCan| (ELT $ 244) |arg| "acsch" |opt_rec| $))
         ('T (|FS2UPS2;unknown_to_UPS| |ker| (LIST |arg|) |opt_rec| $)))) 

(SDEFUN |FS2UPS2;powToUPS2|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans| (|Union| UPS "failed"))
          (|expon|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|logBase|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (LETT |logBase|
                (|FS2UPS2;logToUPS| (|SPADfirst| |args|) |opt_rec| $))
          (EXIT
           (COND ((QEQCAR |logBase| 1) |logBase|)
                 (#2='T
                  (SEQ
                   (LETT |expon|
                         (|FS2UPS2;i_expr_to_PS|
                          (SPADCALL |args| (QREFELT $ 211)) |opt_rec| $))
                   (EXIT
                    (COND ((QEQCAR |expon| 1) |expon|)
                          (#2#
                           (SEQ
                            (LETT |ans|
                                  (SPADCALL
                                   (SPADCALL (CDR |expon|) (CDR |logBase|)
                                             (QREFELT $ 60))
                                   (QREFELT $ 207)))
                            (EXIT
                             (COND
                              ((QEQCAR |ans| 1)
                               (|FS2UPS2;stateProblem| "exp"
                                "essential singularity" $))
                              (#2# (CONS 0 (QCDR |ans|)))))))))))))))) 

(SDEFUN |FS2UPS2;powToUPS;LRU;64|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans1| (|Union| UPS #2="failed")) (|lbu| (|Union| UPS #2#))
          (|b1| (UPS)) (|eb| (|Expon|)) (|bs| (UPS))
          (|pow_base|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ep| (|Union| |Expon| "failed")) (|pow| (FE)))
         (SEQ (LETT |pow| (SPADCALL |args| (QREFELT $ 211)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |pow| (QREFELT $ 14) (QREFELT $ 83))
                           (|spadConstant| $ 19) (QREFELT $ 30))
                 (|FS2UPS2;powToUPS2| |args| |opt_rec| $))
                (#3='T
                 (SEQ (LETT |ep| (SPADCALL |pow| (QREFELT $ 245)))
                      (EXIT
                       (COND
                        ((QEQCAR |ep| 0)
                         (SEQ
                          (LETT |pow_base|
                                (|FS2UPS2;i_expr_to_PS| (|SPADfirst| |args|)
                                 |opt_rec| $))
                          (EXIT
                           (COND ((QEQCAR |pow_base| 1) |pow_base|)
                                 (#3#
                                  (SEQ (LETT |bs| (CDR |pow_base|))
                                       (LETT |eb|
                                             (SPADCALL |bs| (QREFELT $ 24)))
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |bs| |eb| (QREFELT $ 28))
                                          (|spadConstant| $ 19) (QREFELT $ 21))
                                         (SEQ
                                          (LETT |eb|
                                                (SPADCALL |bs|
                                                          (SPADCALL |eb|
                                                                    (SPADCALL
                                                                     1000
                                                                     (QREFELT $
                                                                              26))
                                                                    (QREFELT $
                                                                             27))
                                                          (QREFELT $ 32)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |bs| |eb|
                                                        (QREFELT $ 28))
                                              (|spadConstant| $ 19)
                                              (QREFELT $ 21))
                                             (|error|
                                              "powToUPS: series with many zero terms")))))))
                                       (LETT |b1|
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 23)
                                                        (SPADCALL |eb|
                                                                  (QREFELT $
                                                                           174))
                                                        (QREFELT $ 68))
                                              |bs| (QREFELT $ 60)))
                                       (LETT |lbu|
                                             (SPADCALL |b1| (QREFELT $ 213)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |lbu| 1)
                                          (|FS2UPS2;stateProblem| "pow"
                                           "transcendental log" $))
                                         (#3#
                                          (SEQ
                                           (LETT |ans1|
                                                 (SPADCALL
                                                  (SPADCALL |pow| (QCDR |lbu|)
                                                            (QREFELT $ 158))
                                                  (QREFELT $ 207)))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |ans1| 1)
                                              (|FS2UPS2;stateProblem| "pow"
                                               "transcendental exp" $))
                                             (#3#
                                              (CONS 0
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| $ 23)
                                                      (SPADCALL (QCDR |ep|)
                                                                |eb|
                                                                (QREFELT $
                                                                         246))
                                                      (QREFELT $ 68))
                                                     (QCDR |ans1|)
                                                     (QREFELT $
                                                              60))))))))))))))))
                        (#3# (|FS2UPS2;powToUPS2| |args| |opt_rec| $))))))))))) 

(SDEFUN |FS2UPS2;powToUPS;LRU;65|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(SDEFUN |FS2UPS2;powToUPS;LRU;66|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;powToUPS2| |args| |opt_rec| $)) 

(SDEFUN |FS2UPS2;newElem| ((|f| FE) ($ FE))
        (SPADCALL (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 248)) $)
                  (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT $ 249)) $)
                  (QREFELT $ 147))) 

(SDEFUN |FS2UPS2;smpElem|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| FE)) ($ FE))
        (SPADCALL (CONS (|function| |FS2UPS2;k2Elem|) $) (ELT $ 115) |p|
                  (QREFELT $ 253))) 

(SDEFUN |FS2UPS2;k2Elem| ((|k| |Kernel| FE) ($ FE))
        (SPROG
         ((|cosz| (FE)) (|sinz| (FE)) (|iez| (FE)) (|ez| (FE)) (|z| (FE))
          (|args| (|List| FE)) (#1=#:G1019 NIL) (|a| NIL) (#2=#:G1018 NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |args|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |a| NIL)
                         (LETT #1# (SPADCALL |k| (QREFELT $ 201))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|FS2UPS2;newElem| |a| $) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))))
            (SPADCALL |k| (QREFELT $ 200)))
           (#3='T
            (SEQ
             (LETT |iez|
                   (SPADCALL
                    (LETT |ez|
                          (SPADCALL (LETT |z| (|SPADfirst| |args|))
                                    (QREFELT $ 254)))
                    (QREFELT $ 255)))
             (LETT |sinz| (SPADCALL |z| (QREFELT $ 190)))
             (LETT |cosz| (SPADCALL |z| (QREFELT $ 256)))
             (EXIT
              (COND
               ((SPADCALL |k| '|tan| (QREFELT $ 206))
                (SPADCALL |sinz| |cosz| (QREFELT $ 147)))
               ((SPADCALL |k| '|cot| (QREFELT $ 206))
                (SPADCALL |cosz| |sinz| (QREFELT $ 147)))
               ((SPADCALL |k| '|sec| (QREFELT $ 206))
                (SPADCALL |cosz| (QREFELT $ 255)))
               ((SPADCALL |k| '|csc| (QREFELT $ 206))
                (SPADCALL |sinz| (QREFELT $ 255)))
               ((SPADCALL |k| '|sinh| (QREFELT $ 206))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 189))
                          (SPADCALL 2 (QREFELT $ 143)) (QREFELT $ 147)))
               ((SPADCALL |k| '|cosh| (QREFELT $ 206))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                          (SPADCALL 2 (QREFELT $ 143)) (QREFELT $ 147)))
               ((SPADCALL |k| '|tanh| (QREFELT $ 206))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 189))
                          (SPADCALL |ez| |iez| (QREFELT $ 96))
                          (QREFELT $ 147)))
               ((SPADCALL |k| '|coth| (QREFELT $ 206))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                          (SPADCALL |ez| |iez| (QREFELT $ 189))
                          (QREFELT $ 147)))
               ((SPADCALL |k| '|sech| (QREFELT $ 206))
                (SPADCALL 2
                          (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 96))
                                    (QREFELT $ 255))
                          (QREFELT $ 257)))
               ((SPADCALL |k| '|csch| (QREFELT $ 206))
                (SPADCALL 2
                          (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 189))
                                    (QREFELT $ 255))
                          (QREFELT $ 257)))
               (#3#
                (SPADCALL (SPADCALL |k| (QREFELT $ 121)) |args|
                          (QREFELT $ 258))))))))))) 

(SDEFUN |FS2UPS2;contOnReals?| ((|fcn| |String|) ($ |Boolean|))
        (SPADCALL |fcn| (QREFELT $ 259) (QREFELT $ 262))) 

(SDEFUN |FS2UPS2;bddOnReals?| ((|fcn| |String|) ($ |Boolean|))
        (SPADCALL |fcn| (QREFELT $ 260) (QREFELT $ 262))) 

(SDEFUN |FS2UPS2;exprToGenUPS;FEBUU;72|
        ((|fcn| FE) (|posCheck?| |Boolean|)
         (|atanFlag| |Union| "complex" "real: two sides" "real: left side"
          "real: right side" "just do it")
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (|FS2UPS2;iExprToGenUPS| (|FS2UPS2;newElem| |fcn| $)
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") NIL (|spadConstant| $ 19))
         $)) 

(SDEFUN |FS2UPS2;iExprToGenUPS|
        ((|fcn| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ker| (|Union| (|Kernel| FE) #2="failed"))
          (|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed"))
          (|prod| (|Union| (|List| FE) #3="failed"))
          (|sum| (|Union| (|List| FE) #3#))
          (|poly| (|Union| (|Polynomial| R) #2#)))
         (SEQ (LETT |poly| (SPADCALL |fcn| (QREFELT $ 49)))
              (EXIT
               (COND
                ((QEQCAR |poly| 0)
                 (|FS2UPS2;polyToUPS|
                  (SPADCALL (QCDR |poly|) (QREFELT $ 14) (QREFELT $ 53))
                  |opt_rec| $))
                (#4='T
                 (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT $ 55)))
                      (EXIT
                       (COND
                        ((QEQCAR |sum| 0)
                         (|FS2UPS2;listToUPS| (QCDR |sum|)
                          (CONS (|function| |FS2UPS2;iExprToGenUPS|) $)
                          |opt_rec| (|spadConstant| $ 56) (ELT $ 57) $))
                        (#4#
                         (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58)))
                              (EXIT
                               (COND
                                ((QEQCAR |prod| 0)
                                 (|FS2UPS2;listToUPS| (QCDR |prod|)
                                  (CONS (|function| |FS2UPS2;iExprToGenUPS|) $)
                                  |opt_rec| (|spadConstant| $ 59) (ELT $ 60)
                                  $))
                                (#4#
                                 (SEQ
                                  (LETT |expt|
                                        (|FS2UPS2;isNonTrivPower| |fcn| $))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |expt| 0)
                                     (SEQ (LETT |power| (QCDR |expt|))
                                          (EXIT
                                           (|FS2UPS2;powerToGenUPS|
                                            (QCAR |power|) (QCDR |power|)
                                            |opt_rec| $))))
                                    (#4#
                                     (SEQ
                                      (LETT |ker|
                                            (SPADCALL |fcn| (QREFELT $ 62)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |ker| 0)
                                         (|FS2UPS2;kernelToGenUPS| (QCDR |ker|)
                                          |opt_rec| $))
                                        (#4#
                                         (|error|
                                          "exprToGenUPS: neither a sum, product, power, nor kernel"))))))))))))))))))))))) 

(SDEFUN |FS2UPS2;opsInvolvingX| ((|fcn| FE) ($ |List| (|BasicOperator|)))
        (SPROG
         ((|opList| (|List| #1=(|BasicOperator|))) (|op| #1#) (#2=#:G1063 NIL)
          (|k| NIL) (#3=#:G1062 NIL))
         (SEQ
          (LETT |opList|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |k| NIL)
                      (LETT #2# (SPADCALL |fcn| (QREFELT $ 265))) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL
                             (LETT |op| (SPADCALL |k| (QREFELT $ 121)))
                             (QREFELT $ 266))
                            (SPADCALL (QREFELT $ 14)
                                      (SPADCALL
                                       (|SPADfirst|
                                        (SPADCALL |k| (QREFELT $ 201)))
                                       (QREFELT $ 78))
                                      (QREFELT $ 79)))
                           ('T NIL))
                          (LETT #3# (CONS |op| #3#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL |opList| (QREFELT $ 268)))))) 

(SDEFUN |FS2UPS2;opInOpList?|
        ((|name| |Symbol|) (|opList| |List| (|BasicOperator|)) ($ |Boolean|))
        (SPROG ((#1=#:G1068 NIL) (#2=#:G1069 NIL) (#3=#:G1070 NIL) (|op| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |op| NIL) (LETT #3# |opList|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |op| |name| (QREFELT $ 269))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G1067)))
                              (GO #5=#:G1065))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;exponential?| ((|fcn| FE) ($ |Boolean|))
        (SPROG ((|ker| (|Union| (|Kernel| FE) "failed")))
               (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT $ 62)))
                    (EXIT
                     (COND
                      ((QEQCAR |ker| 0)
                       (SPADCALL (QCDR |ker|) '|exp| (QREFELT $ 206)))
                      ('T NIL)))))) 

(SDEFUN |FS2UPS2;productOfNonZeroes?| ((|fcn| FE) ($ |Boolean|))
        (SPROG
         ((#1=#:G1086 NIL) (#2=#:G1087 NIL) (#3=#:G1088 NIL) (|term| NIL)
          (|prod| (|Union| (|List| FE) "failed")))
         (SEQ
          (EXIT
           (COND ((|FS2UPS2;exponential?| |fcn| $) 'T)
                 (#4='T
                  (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT $ 58)))
                       (EXIT
                        (COND ((QEQCAR |prod| 1) NIL)
                              (#4#
                               (SEQ
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |term| NIL)
                                       (LETT #3# (QCDR |prod|)) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |term| (CAR #3#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (|FS2UPS2;exponential?| |term| $))
                                           (COND
                                            ((SPADCALL (QREFELT $ 14)
                                                       (SPADCALL |term|
                                                                 (QREFELT $
                                                                          78))
                                                       (QREFELT $ 79))
                                             (PROGN
                                              (LETT #1#
                                                    (PROGN
                                                     (LETT #2# NIL)
                                                     (GO #5=#:G1085)))
                                              (GO #6=#:G1081))))))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL)))
                                 #6# (EXIT #1#))
                                (EXIT 'T)))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;powerToGenUPS|
        ((|fcn| FE) (|n| |Integer|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|xOpList| (|List| (|BasicOperator|))) (|coef| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#2=#:G482 NIL) (#3=#:G1093 NIL)
          (|b|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |b| (|FS2UPS2;iExprToGenUPS| |fcn| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |b| 1) |b|)
                     ((SPADCALL |n| 0 (QREFELT $ 73))
                      (CONS 0
                            (SPADCALL (CDR |b|)
                                      (PROG1 (LETT #3# |n|)
                                        (|check_subtype2| (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #3#))
                                      (QREFELT $ 74))))
                     (#4='T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #2# |b|)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT $ 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #2#)))
                       (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)))
                       (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28)))
                            (EXIT
                             (COND
                              ((SPADCALL |coef| (|spadConstant| $ 19)
                                         (QREFELT $ 21))
                               (SEQ
                                (LETT |deg|
                                      (SPADCALL |ups|
                                                (SPADCALL |deg|
                                                          (SPADCALL
                                                           (QREFELT $ 15)
                                                           (QREFELT $ 26))
                                                          (QREFELT $ 27))
                                                (QREFELT $ 32)))
                                (LETT |coef|
                                      (SPADCALL |ups| |deg| (QREFELT $ 28)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |coef| (|spadConstant| $ 19)
                                             (QREFELT $ 21))
                                   (|error|
                                    "inverse of series with many leading zero coefficients")))))))))
                       (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |coef| $))
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
                                         (QREFELT $ 269))
                               (EXIT
                                (CONS 0
                                      (SPADCALL |ups| |n| (QREFELT $ 75))))))))
                           (EXIT
                            (COND
                             ((|FS2UPS2;productOfNonZeroes?| |coef| $)
                              (CONS 0 (SPADCALL |ups| |n| (QREFELT $ 75))))
                             (#4#
                              (|FS2UPS2;stateProblem| "inv"
                               "lowest order coefficient involves x"
                               $))))))))))))))) 

(SDEFUN |FS2UPS2;kernelToGenUPS|
        ((|ker| |Kernel| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G1110 NIL) (|n| (|Integer|)) (|arg| (FE)) (|args| (|List| FE))
          (|sym| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |sym| (SPADCALL |ker| (QREFELT $ 204)))
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
                         (SPADCALL (SPADCALL |ker| (QREFELT $ 200))
                                   (|spadConstant| $ 81) (QREFELT $ 68))))))
                ((NULL (LETT |args| (SPADCALL |ker| (QREFELT $ 201))))
                 (CONS 0
                       (SPADCALL (SPADCALL |ker| (QREFELT $ 200))
                                 (|spadConstant| $ 81) (QREFELT $ 68))))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT $ 206))
                         (|FS2UPS2;nthRootToGenUPS|
                          (SPADCALL |arg| |arg| (QREFELT $ 145)) 2 |opt_rec|
                          $))
                        ((SPADCALL |ker| '|%paren| (QREFELT $ 206))
                         (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|log| (QREFELT $ 206))
                         (|FS2UPS2;logToGenUPS| |arg| |opt_rec| $))
                        ((SPADCALL |ker| '|exp| (QREFELT $ 206))
                         (|FS2UPS2;expToGenUPS| |arg| |opt_rec| $))
                        (#3#
                         (|FS2UPS2;tranToGenUPS| |ker| |arg| |opt_rec| $))))))
                ((SPADCALL |ker| '|%power| (QREFELT $ 206))
                 (|FS2UPS2;powToGenUPS| |args| |opt_rec| $))
                ((SPADCALL |ker| '|nthRoot| (QREFELT $ 206))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT $ 211))
                                  (QREFELT $ 212)))
                  (EXIT
                   (|FS2UPS2;nthRootToGenUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #2# |n|)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    |opt_rec| $))))
                (#3#
                 (|FS2UPS2;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 170)) (QREFELT $ 172))
                  "unknown kernel" $))))))) 

(SDEFUN |FS2UPS2;nthRootToGenUPS|
        ((|arg| FE) (|n| |NonNegativeInteger|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |result| 1) |result|)
                     (#2='T
                      (SEQ
                       (LETT |ans|
                             (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                              |opt_rec| 'T $))
                       (EXIT
                        (COND ((QEQCAR |ans| 1) |ans|)
                              (#2# (CONS 0 (CDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;logToGenUPS|
        ((|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|logTerm| (FE)) (|term1| (FE)) (|pow| (FE)) (|mon| (FE))
          (|negRat?| (|Boolean|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|cen| (FE))
          (|lt| (UPS)) (#2=#:G1140 NIL) (#3=#:G1141 NIL)
          (|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#4=#:G482 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#5='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |result|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT $ 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |deg| (SPADCALL |ups| (QREFELT $ 24)))
                           (SEQ
                            (LETT |coef| (SPADCALL |ups| |deg| (QREFELT $ 28)))
                            (EXIT
                             (COND
                              ((SPADCALL |coef| (|spadConstant| $ 19)
                                         (QREFELT $ 21))
                               (SEQ
                                (LETT |deg|
                                      (SPADCALL |ups|
                                                (SPADCALL |deg|
                                                          (SPADCALL
                                                           (QREFELT $ 15)
                                                           (QREFELT $ 26))
                                                          (QREFELT $ 27))
                                                (QREFELT $ 32)))
                                (LETT |coef|
                                      (SPADCALL |ups| |deg| (QREFELT $ 28)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |coef| (|spadConstant| $ 19)
                                             (QREFELT $ 21))
                                   (|error|
                                    "log of series with many leading zero coefficients")))))))))
                           (COND
                            ((QVELT |opt_rec| 0)
                             (SEQ
                              (LETT |signum| (SPADCALL |coef| (QREFELT $ 36)))
                              (EXIT
                               (COND
                                ((QEQCAR |signum| 0)
                                 (COND
                                  ((EQL (QCDR |signum|) -1)
                                   (PROGN
                                    (LETT #2#
                                          (PROGN
                                           (LETT #3#
                                                 (|FS2UPS2;stateProblem| "log"
                                                  "negative leading coefficient"
                                                  $))
                                           (GO #6=#:G1139)))
                                    (GO #7=#:G1137))))))))))
                           (LETT |lt| (SPADCALL |coef| |deg| (QREFELT $ 68)))
                           (LETT |cen| (SPADCALL |lt| (QREFELT $ 270)))
                           (LETT |negRat?|
                                 (SEQ
                                  (LETT |rat| (|FS2UPS2;ratIfCan| |coef| $))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |rat| 0)
                                     (COND
                                      ((SPADCALL (QCDR |rat|)
                                                 (|spadConstant| $ 271)
                                                 (QREFELT $ 272))
                                       'T)
                                      (#5# NIL)))
                                    (#5# NIL)))))
                           (LETT |logTerm|
                                 (SEQ
                                  (LETT |mon|
                                        (SPADCALL
                                         (SPADCALL (QREFELT $ 14)
                                                   (QREFELT $ 88))
                                         |cen| (QREFELT $ 189)))
                                  (LETT |pow|
                                        (SPADCALL |mon|
                                                  (SPADCALL |deg|
                                                            (QREFELT $ 13))
                                                  (QREFELT $ 273)))
                                  (EXIT
                                   (COND
                                    (|negRat?|
                                     (SPADCALL
                                      (SPADCALL |coef| |pow| (QREFELT $ 145))
                                      (QREFELT $ 146)))
                                    (#5#
                                     (SEQ
                                      (LETT |term1|
                                            (SPADCALL
                                             (SPADCALL |deg| (QREFELT $ 13))
                                             (SPADCALL |mon| (QREFELT $ 146))
                                             (QREFELT $ 145)))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL |coef| (QREFELT $ 146))
                                        |term1| (QREFELT $ 96)))))))))
                           (EXIT
                            (CONS 0
                                  (SPADCALL
                                   (SPADCALL |logTerm| (|spadConstant| $ 81)
                                             (QREFELT $ 68))
                                   (SPADCALL
                                    (SPADCALL |ups| |lt| (QREFELT $ 193))
                                    (QREFELT $ 163))
                                   (QREFELT $ 57))))))
                         #7# (EXIT #2#)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;expToGenUPS|
        ((|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |ups| 1) |ups|)
                     ('T (|FS2UPS2;expGenUPS| (CDR |ups|) |opt_rec| $))))))) 

(SDEFUN |FS2UPS2;expGenUPS|
        ((|ups| UPS)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|expCoef| (FE)) (|xOpList| (|List| (|BasicOperator|))) (|lc| (FE))
          (|deg| (|Expon|)))
         (SEQ
          (LETT |deg| (SPADCALL |ups| (|spadConstant| $ 113) (QREFELT $ 32)))
          (EXIT
           (COND
            ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 29))
             (|FS2UPS2;stateProblem| "exp" "essential singularity" $))
            ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 274))
             (CONS 0 (SPADCALL |ups| (QREFELT $ 275))))
            (#2='T
             (SEQ
              (LETT |lc| (SPADCALL |ups| (|spadConstant| $ 81) (QREFELT $ 28)))
              (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| $))
              (COND
               ((NULL (|FS2UPS2;opInOpList?| '|log| |xOpList| $))
                (EXIT (CONS 0 (SPADCALL |ups| (QREFELT $ 275))))))
              (LETT |expCoef|
                    (SPADCALL (SPADCALL |lc| (QREFELT $ 254)) (QREFELT $ 14)
                              (QREFELT $ 277)))
              (EXIT
               (COND
                ((|FS2UPS2;opInOpList?| '|log|
                  (|FS2UPS2;opsInvolvingX| |expCoef| $) $)
                 (|FS2UPS2;stateProblem| "exp" "logs in constant coefficient"
                  $))
                (#2#
                 (SEQ
                  (LETT |result|
                        (|FS2UPS2;iExprToGenUPS|
                         (|FS2UPS2;newElem| |expCoef| $) |opt_rec| $))
                  (EXIT
                   (COND ((QEQCAR |result| 1) |result|)
                         (#2#
                          (CONS 0
                                (SPADCALL (CDR |result|)
                                          (SPADCALL
                                           (SPADCALL |ups|
                                                     (SPADCALL |lc|
                                                               (|spadConstant|
                                                                $ 81)
                                                               (QREFELT $ 68))
                                                     (QREFELT $ 82))
                                           (QREFELT $ 275))
                                          (QREFELT $ 60))))))))))))))))) 

(SDEFUN |FS2UPS2;atancotToGenUPS|
        ((|fe| FE) (|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         (|plusMinus| |Integer|)
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#2=#:G1158 NIL) (|ord| (|Expon|)) (|coef| (FE)) (|ups| (UPS))
          (#3=#:G482 NIL)
          (|trouble|
           (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
              (EXIT
               (COND
                ((QEQCAR |result| 1)
                 (SEQ (LETT |trouble| (CDR |result|))
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |trouble|) "essential singularity")
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| $ 81)
                                         (QREFELT $ 68))))
                        (#4='T |result|)))))
                (#4#
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |ups|
                          (PROG2 (LETT #3# |result|)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (QREFELT $ 9)
                                            (|Union|
                                             (|:| |%series| (QREFELT $ 9))
                                             (|:| |%problem|
                                                  (|Record|
                                                   (|:| |func| (|String|))
                                                   (|:| |prob| (|String|)))))
                                            #3#)))
                    (LETT |coef|
                          (SPADCALL |ups| (|spadConstant| $ 81)
                                    (QREFELT $ 28)))
                    (SEQ
                     (LETT |ord|
                           (SPADCALL |ups| (|spadConstant| $ 81)
                                     (QREFELT $ 32)))
                     (EXIT
                      (COND
                       ((SPADCALL |ord| (|spadConstant| $ 81) (QREFELT $ 220))
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT $ 145))
                                    (SPADCALL (|spadConstant| $ 23)
                                              (QREFELT $ 166))
                                    (QREFELT $ 21))
                          (PROGN
                           (LETT #2# (CONS 0 (SPADCALL |ups| (QREFELT $ 195))))
                           (GO #5=#:G1155))))))))
                    (EXIT
                     (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                      |plusMinus| $))))
                  #5# (EXIT #2#)))))))) 

(SDEFUN |FS2UPS2;genUPSApplyIfCan|
        ((|fcn| |Mapping| (|Union| UPS #1="failed") UPS) (|arg| FE)
         (|fcnName| |String|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((#3=#:G1161 NIL) (|xOpList| (|List| (|BasicOperator|))) (|lc| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#4=#:G482 NIL)
          (|series|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |series| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
              (EXIT
               (COND ((QEQCAR |series| 1) |series|)
                     (#5='T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #4# |series|)
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT $ 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #4#)))
                       (LETT |deg|
                             (SPADCALL |ups| (|spadConstant| $ 113)
                                       (QREFELT $ 32)))
                       (EXIT
                        (COND
                         ((SPADCALL |deg| (|spadConstant| $ 81) (QREFELT $ 29))
                          (|FS2UPS2;stateProblem| |fcnName|
                           "essential singularity" $))
                         ((SPADCALL |deg| (|spadConstant| $ 81)
                                    (QREFELT $ 274))
                          (CONS 0
                                (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) (QREFELT $ 9)
                                                  (|Union| (QREFELT $ 9) #1#)
                                                  #3#))))
                         (#5#
                          (SEQ
                           (LETT |lc|
                                 (SPADCALL |ups| (|spadConstant| $ 81)
                                           (QREFELT $ 28)))
                           (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| $))
                           (EXIT
                            (COND
                             ((NULL |xOpList|)
                              (CONS 0
                                    (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #1#)
                                                      #3#))))
                             ((|FS2UPS2;opInOpList?| '|log| |xOpList| $)
                              (|FS2UPS2;stateProblem| |fcnName|
                               "logs in constant coefficient" $))
                             ((|FS2UPS2;contOnReals?| |fcnName| $)
                              (CONS 0
                                    (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #1#)
                                                      #3#))))
                             (#5#
                              (|FS2UPS2;stateProblem| |fcnName|
                               "x in constant coefficient" $))))))))))))))) 

(SDEFUN |FS2UPS2;applyBddIfCan|
        ((|fe| FE) (|fcn| |Mapping| #1=(|Union| UPS "failed") UPS) (|arg| FE)
         (|fcnName| |String|)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|ans| #1#)
          (|trouble|
           (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))
          (|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| $))
              (EXIT
               (COND
                ((QEQCAR |ups| 1)
                 (SEQ (LETT |trouble| (CDR |ups|))
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |trouble|) "essential singularity")
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| $ 81)
                                         (QREFELT $ 68))))
                        (#3='T |ups|)))))
                (#3#
                 (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|))
                      (EXIT
                       (COND
                        ((QEQCAR |ans| 1)
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| $ 81)
                                         (QREFELT $ 68))))
                        (#3# (CONS 0 (QCDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;tranToGenUPS|
        ((|ker| |Kernel| FE) (|arg| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (COND
         ((SPADCALL |ker| '|sin| (QREFELT $ 206))
          (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 200)) (ELT $ 223)
           |arg| "sin" |opt_rec| $))
         ((SPADCALL |ker| '|cos| (QREFELT $ 206))
          (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT $ 200)) (ELT $ 224)
           |arg| "cos" |opt_rec| $))
         ((SPADCALL |ker| '|asin| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 229) |arg| "asin" |opt_rec| $))
         ((SPADCALL |ker| '|acos| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 230) |arg| "acos" |opt_rec| $))
         ((SPADCALL |ker| '|atan| (QREFELT $ 206))
          (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 200)) |arg|
           |opt_rec| 1 $))
         ((SPADCALL |ker| '|acot| (QREFELT $ 206))
          (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT $ 200)) |arg|
           |opt_rec| -1 $))
         ((SPADCALL |ker| '|asec| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 231) |arg| "asec" |opt_rec| $))
         ((SPADCALL |ker| '|acsc| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 232) |arg| "acsc" |opt_rec| $))
         ((SPADCALL |ker| '|asinh| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 239) |arg| "asinh" |opt_rec| $))
         ((SPADCALL |ker| '|acosh| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 240) |arg| "acosh" |opt_rec| $))
         ((SPADCALL |ker| '|atanh| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 241) |arg| "atanh" |opt_rec| $))
         ((SPADCALL |ker| '|acoth| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 242) |arg| "acoth" |opt_rec| $))
         ((SPADCALL |ker| '|asech| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 243) |arg| "asech" |opt_rec| $))
         ((SPADCALL |ker| '|acsch| (QREFELT $ 206))
          (|FS2UPS2;genUPSApplyIfCan| (ELT $ 244) |arg| "acsch" |opt_rec| $))
         ('T
          (|FS2UPS2;stateProblem|
           (SPADCALL (SPADCALL |ker| (QREFELT $ 170)) (QREFELT $ 172))
           "unknown kernel" $)))) 

(SDEFUN |FS2UPS2;powToGenUPS|
        ((|args| |List| FE)
         (|opt_rec| |Record| (|:| |pos_Check?| (|Boolean|))
          (|:| |atan_Flag|
               (|Union| "complex" "real: two sides" "real: left side"
                        "real: right side" "just do it"))
          (|:| |coeff_check?| (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
          (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |zero_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
          (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE))
         ($ |Union| (|:| |%series| UPS)
          (|:| |%problem|
               (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))))
        (SPROG
         ((|expon|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|logBase|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (LETT |logBase|
                (|FS2UPS2;logToGenUPS| (|SPADfirst| |args|) |opt_rec| $))
          (EXIT
           (COND ((QEQCAR |logBase| 1) |logBase|)
                 (#2='T
                  (SEQ
                   (LETT |expon|
                         (|FS2UPS2;iExprToGenUPS|
                          (SPADCALL |args| (QREFELT $ 211)) |opt_rec| $))
                   (EXIT
                    (COND ((QEQCAR |expon| 1) |expon|)
                          (#2#
                           (|FS2UPS2;expGenUPS|
                            (SPADCALL (CDR |expon|) (CDR |logBase|)
                                      (QREFELT $ 60))
                            |opt_rec| $))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceToUnivariatePowerSeries2;|)) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2| (&REST #1=#:G1212)
  (SPROG NIL
         (PROG (#2=#:G1213)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceToUnivariatePowerSeries2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FunctionSpaceToUnivariatePowerSeries2;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceToUnivariatePowerSeries2|)))))))))) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2;|
       (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8| |#9|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$9 NIL) (DV$8 NIL) (DV$7 NIL) (DV$6 NIL)
    (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT DV$6 (|devaluate| |#6|))
    (LETT DV$7 (|devaluate| |#7|))
    (LETT DV$8 (|devaluate| |#8|))
    (LETT DV$9 (|devaluate| |#9|))
    (LETT |dv$|
          (LIST '|FunctionSpaceToUnivariatePowerSeries2| DV$1 DV$2 DV$3 DV$4
                DV$5 DV$6 DV$7 DV$8 DV$9))
    (LETT $ (GETREFV 278))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|FunctionSpaceToUnivariatePowerSeries2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8 DV$9) (CONS 1 $))
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
    (QSETREFV $ 148
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL 2 (QREFELT $ 143))
                          (SPADCALL (QREFELT $ 144)) (QREFELT $ 145))
                (QREFELT $ 146))
               (SPADCALL 2 (QREFELT $ 143)) (QREFELT $ 147)))
    (QSETREFV $ 152
              (SPADCALL (|spadConstant| $ 23)
                        (SPADCALL (SPADCALL (QREFELT $ 144)) (QREFELT $ 151))
                        (QREFELT $ 147)))
    (QSETREFV $ 191 NIL)
    (COND
     ((|HasSignature| |#4|
                      (LIST '|differentiate|
                            (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
      (COND
       ((|HasSignature| |#4|
                        (LIST '|integrate|
                              (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
        (PROGN
         (SETELT $ 191 'T)
         (QSETREFV $ 195 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;41|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;42|) $))
         (QSETREFV $ 197
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;43|) $))))
       ('T
        (PROGN
         (QSETREFV $ 195 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;44|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;45|) $))
         (QSETREFV $ 197
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;46|)
                         $))))))
     ('T
      (PROGN
       (QSETREFV $ 195 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;47|) $))
       (QSETREFV $ 196 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;48|) $))
       (QSETREFV $ 197
                 (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;49|) $)))))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|abs|
                            (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
      (QSETREFV $ 215 (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;56|) $)))
     ('T
      (QSETREFV $ 215
                (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;57|) $))))
    (COND
     ((|HasCategory| |#3| (LIST '|RetractableFrom| (|devaluate| |#2|)))
      (COND
       ((|HasCategory| |#3| '(|Ring|))
        (QSETREFV $ 210
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;64|) $)))
       ('T
        (QSETREFV $ 210
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;65|) $)))))
     ('T
      (QSETREFV $ 210
                (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;66|) $))))
    (QSETREFV $ 259 (LIST #1="sin" #2="cos" #3="atan" #4="acot" "exp" "asinh"))
    (QSETREFV $ 260 (LIST #1# #2# #3# #4#))
    $))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) 'ZEROCOUNT
              (|Union| 159 '#1="failed") (0 . |retractIfCan|) (5 . |Zero|)
              (9 . |Zero|) (|Boolean|) (13 . =) (19 . |One|) (23 . |One|)
              (27 . |degree|) (|Integer|) (32 . |coerce|) (37 . +)
              (43 . |coefficient|) (49 . <) (55 . ~=) (61 . |reductum|)
              (66 . |order|) (72 . |even?|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (77 . |sign|) (82 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (87 . |nthRootIfCan|)
              (|Record| (|:| |func| 171) (|:| |prob| 171))
              (|Union| (|:| |%series| 9) (|:| |%problem| 41))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              |FS2UPS2;exprToUPS;FEBUU;6| |FS2UPS2;exprToPS;FEBUBFEU;7|
              (|Mapping| 20 7) |FS2UPS2;exprToPS;FEBUBFE3MU;8|
              (|Union| 52 '#1#) (93 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (|Symbol|) (|Polynomial| 6)
              (98 . |univariate|) (|Union| 122 '#2="failed") (104 . |isPlus|)
              (109 . |Zero|) (113 . +) (119 . |isTimes|) (124 . |One|)
              (128 . *) (|Union| 199 '#1#) (134 . |retractIfCan|)
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
              (|Reference| 25) (423 . |ref|) (428 . |deref|) (433 . +)
              (439 . |setref|) (|Stream| 7) (445 . |stream|) (451 . |series|)
              (456 . |coerce|) (461 . |pi|) (465 . *) (471 . |log|) (476 . /)
              '|lpi| (|SparseMultivariatePolynomial| 6 120) (482 . |One|)
              (486 . |sqrt|) '|sqpi| (|Reference| 7) (491 . |deref|)
              (496 . |setref|) (502 . |ref|) (507 . |apply_taylor|) (513 . *)
              (|Fraction| 25) (|IntegerNumberTheoryFunctions|)
              (519 . |bernoulli|) (524 . |coerce|) (529 . |log|) (534 . /)
              (540 . -) (545 . -) (550 . |differentiate|) (555 . -)
              (560 . |One|) (564 . |name|) (|String|) (569 . |string|)
              (574 . =) (580 . -) (585 . |jacobiSn|) (591 . |jacobiCn|)
              (597 . |jacobiDn|) (603 . |ellipticE|) (609 . |ellipticF|)
              (615 . |ellipticPi|) (622 . |weierstrassP0|)
              (629 . |weierstrassPPrime0|) (636 . |weierstrassZeta0|)
              (643 . |weierstrassSigma0|) (|Union| 6 '#1#)
              (650 . |retractIfCan|) (655 . |retractIfCan|) (660 . <=)
              (666 . -) (672 . |sin|) '|can_integrate| (677 . |differentiate|)
              (682 . /) (688 . |integrate|) (693 . |atan1|) (698 . |integ|)
              (703 . |integ_df|) (709 . |elt|) (|Kernel| $) (715 . |coerce|)
              (720 . |argument|) (725 . ~=) (|Union| 51 '"failed")
              (731 . |symbolIfCan|) (736 . |has?|) (742 . |is?|)
              (748 . |expIfCan|) (|Union| 46 '"none")
              (|Record| (|:| |pos_Check?| 20) (|:| |atan_Flag| 43)
                        (|:| |coeff_check?| 208) (|:| |inv_check?| 208)
                        (|:| |zero_check?| 208) (|:| |log_x_replace| 20)
                        (|:| |log_x_val| 7))
              (753 . |powToUPS|) (759 . |second|) (764 . |retract|)
              (769 . |logIfCan|) (774 . |abs|) (779 . |localAbs|) (784 . =)
              (790 . |numer|) (795 . |atan|) (800 . |acot|) (805 . =)
              (811 . |atanIfCan|) (816 . |acotIfCan|) (821 . |sinIfCan|)
              (826 . |cosIfCan|) (831 . |tanIfCan|) (836 . |cotIfCan|)
              (841 . |secIfCan|) (846 . |cscIfCan|) (851 . |asinIfCan|)
              (856 . |acosIfCan|) (861 . |asecIfCan|) (866 . |acscIfCan|)
              (871 . |sinhIfCan|) (876 . |coshIfCan|) (881 . |tanhIfCan|)
              (886 . |cothIfCan|) (891 . |sechIfCan|) (896 . |cschIfCan|)
              (901 . |asinhIfCan|) (906 . |acoshIfCan|) (911 . |atanhIfCan|)
              (916 . |acothIfCan|) (921 . |asechIfCan|) (926 . |acschIfCan|)
              (931 . |retractIfCan|) (936 . *)
              (|SparseMultivariatePolynomial| 6 199) (942 . |numer|)
              (947 . |denom|) (|Mapping| 7 120) (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 120) 120 6 149
                                           7)
              (952 . |map|) (959 . |exp|) (964 . |inv|) (969 . |cos|) (974 . *)
              (980 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 171) (986 . |member?|)
              |FS2UPS2;exprToGenUPS;FEBUU;72| (|List| 199) (992 . |tower|)
              (997 . |unary?|) (|List| 119) (1002 . |removeDuplicates|)
              (1007 . |is?|) (1013 . |center|) (1018 . |Zero|) (1022 . <)
              (1028 . ^) (1034 . >) (1040 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (1045 . |normalize|))
           '#(|powToUPS| 1051 |localAbs| 1057 |integ_df| 1062 |integ| 1068
              |exprToUPS| 1073 |exprToPS| 1080 |exprToGenUPS| 1101 |atan1|
              1108)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 277
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
                                                   0 133 0 106 0 134 1 135 0 25
                                                   136 1 135 25 0 137 2 25 0 0
                                                   0 138 2 135 25 0 25 139 2
                                                   140 0 85 7 141 1 11 0 140
                                                   142 1 7 0 25 143 0 7 0 144 2
                                                   7 0 0 0 145 1 7 0 0 146 2 7
                                                   0 0 0 147 0 149 0 150 1 7 0
                                                   0 151 1 153 7 0 154 2 153 7
                                                   0 7 155 1 153 0 7 156 2 12 9
                                                   11 9 157 2 9 0 7 0 158 1 160
                                                   159 25 161 1 7 0 159 162 1 9
                                                   0 0 163 2 9 0 0 7 164 1 6 0
                                                   0 165 1 7 0 0 166 1 11 0 0
                                                   167 1 9 0 0 168 0 159 0 169
                                                   1 120 51 0 170 1 51 171 0
                                                   172 2 34 20 0 0 173 1 8 0 0
                                                   174 2 76 11 11 7 175 2 76 11
                                                   11 7 176 2 76 11 11 7 177 2
                                                   76 11 11 7 178 2 76 11 11 7
                                                   179 3 76 11 11 7 7 180 3 130
                                                   11 7 7 11 181 3 130 11 7 7
                                                   11 182 3 130 11 7 7 11 183 3
                                                   130 11 7 7 11 184 1 7 185 0
                                                   186 1 6 34 0 187 2 25 20 0 0
                                                   188 2 7 0 0 0 189 1 7 0 0
                                                   190 1 9 0 0 192 2 9 0 0 0
                                                   193 1 9 0 0 194 1 0 9 9 195
                                                   1 0 9 9 196 2 0 9 9 9 197 2
                                                   7 0 119 0 198 1 7 0 199 200
                                                   1 120 101 0 201 2 39 20 0 0
                                                   202 1 120 203 0 204 2 119 20
                                                   0 51 205 2 120 20 0 51 206 1
                                                   10 38 9 207 2 0 42 101 209
                                                   210 1 101 7 0 211 1 7 25 0
                                                   212 1 10 38 9 213 1 7 0 0
                                                   214 1 0 7 7 215 2 43 20 0 0
                                                   216 1 159 25 0 217 1 7 0 0
                                                   218 1 7 0 0 219 2 8 20 0 0
                                                   220 1 10 38 9 221 1 10 38 9
                                                   222 1 10 38 9 223 1 10 38 9
                                                   224 1 10 38 9 225 1 10 38 9
                                                   226 1 10 38 9 227 1 10 38 9
                                                   228 1 10 38 9 229 1 10 38 9
                                                   230 1 10 38 9 231 1 10 38 9
                                                   232 1 10 38 9 233 1 10 38 9
                                                   234 1 10 38 9 235 1 10 38 9
                                                   236 1 10 38 9 237 1 10 38 9
                                                   238 1 10 38 9 239 1 10 38 9
                                                   240 1 10 38 9 241 1 10 38 9
                                                   242 1 10 38 9 243 1 10 38 9
                                                   244 1 8 124 7 245 2 8 0 0 0
                                                   246 1 7 247 0 248 1 7 247 0
                                                   249 3 252 7 250 251 149 253
                                                   1 7 0 0 254 1 7 0 0 255 1 7
                                                   0 0 256 2 7 0 106 0 257 2 7
                                                   0 119 122 258 2 261 20 171 0
                                                   262 1 7 264 0 265 1 119 20 0
                                                   266 1 267 0 0 268 2 119 20 0
                                                   51 269 1 9 7 0 270 0 159 0
                                                   271 2 159 20 0 0 272 2 7 0 0
                                                   0 273 2 8 20 0 0 274 1 9 0 0
                                                   275 2 276 7 7 51 277 2 0 42
                                                   101 209 210 1 0 7 7 215 2 0
                                                   9 9 9 197 1 0 9 9 196 3 0 42
                                                   7 20 43 44 8 0 42 7 20 43 20
                                                   7 46 46 46 47 5 0 42 7 20 43
                                                   20 7 45 3 0 42 7 20 43 263 1
                                                   0 9 9 195)))))
           '|lookupComplete|)) 
