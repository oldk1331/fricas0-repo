
(SDEFUN |FS2UPS2;ratIfCan|
        ((|fcn| (FE)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |fcn| (QREFELT % 17))) 

(SDEFUN |FS2UPS2;check_inverse|
        ((|coef| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (% (|Boolean|)))
        (SPROG ((#2=#:G224 NIL))
               (COND
                ((QEQCAR (QVELT |opt_rec| 3) 0)
                 (SPADCALL |coef|
                           (PROG2 (LETT #2# (QVELT |opt_rec| 3))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Mapping| (|Boolean|)
                                                        (QREFELT % 7))
                                             (|Union|
                                              (|Mapping| (|Boolean|)
                                                         (QREFELT % 7))
                                              #1#)
                                             #2#))))
                ('T 'T)))) 

(SDEFUN |FS2UPS2;check_zero|
        ((|coef| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (% (|Boolean|)))
        (SPROG ((#2=#:G231 NIL))
               (COND
                ((QEQCAR (QVELT |opt_rec| 4) 0)
                 (SPADCALL |coef|
                           (PROG2 (LETT #2# (QVELT |opt_rec| 4))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Mapping| (|Boolean|)
                                                        (QREFELT % 7))
                                             (|Union|
                                              (|Mapping| (|Boolean|)
                                                         (QREFELT % 7))
                                              #1#)
                                             #2#))))
                ('T (SPADCALL |coef| (|spadConstant| % 19) (QREFELT % 21)))))) 

(SDEFUN |FS2UPS2;carefulNthRootIfCan|
        ((|ups| (UPS)) (|n| (|NonNegativeInteger|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| #1=(|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (|rightOnly?| (|Boolean|))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ans| (|Union| UPS "failed")) (#3=#:G260 NIL)
          (|signum| (|Union| (|Integer|) "failed")) (#4=#:G259 NIL)
          (|coef| (FE)) (|deg| (|Expon|)) (|deg1| (|Expon|)) (|posCheck?| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |posCheck?| (QVELT |opt_rec| 0))
                (EXIT
                 (COND ((< |n| 1) (|error| "nthRoot: n must be positive"))
                       (#5='T
                        (SEQ (LETT |deg| (SPADCALL |ups| (QREFELT % 24)))
                             (LETT |deg1|
                                   (SPADCALL |deg|
                                             (SPADCALL (QREFELT % 15)
                                                       (QREFELT % 26))
                                             (QREFELT % 27)))
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((|FS2UPS2;check_zero|
                                        (LETT |coef|
                                              (SPADCALL |ups| |deg|
                                                        (QREFELT % 28)))
                                        |opt_rec| %)
                                       (SPADCALL |deg| |deg1| (QREFELT % 29)))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (COND
                                      ((SPADCALL |coef| (|spadConstant| % 19)
                                                 (QREFELT % 30))
                                       (LETT |ups|
                                             (SPADCALL |ups| (QREFELT % 31)))))
                                     (LETT |deg|
                                           (SPADCALL |ups| |deg1|
                                                     (QREFELT % 32)))
                                     (LETT |coef|
                                           (SPADCALL |ups| |deg|
                                                     (QREFELT % 28)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |coef| (|spadConstant| % 19)
                                                  (QREFELT % 21))
                                        (PROGN
                                         (LETT #4#
                                               (|error|
                                                "log of series with many leading zero coefficients"))
                                         (GO #6=#:G243)))))))
                                   #6# (EXIT #4#))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (COND
                              ((EVENP |n|)
                               (COND
                                (|posCheck?|
                                 (SEQ
                                  (LETT |signum|
                                        (SPADCALL |coef| (QREFELT % 35)))
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
                                               %))
                                        (GO #7=#:G258)))
                                      ((NULL |rightOnly?|)
                                       (COND
                                        ((NULL (SPADCALL |deg| (QREFELT % 36)))
                                         (PROGN
                                          (LETT #3#
                                                (|FS2UPS2;stateProblem|
                                                 "nth root"
                                                 "series of non-zero order" %))
                                          (GO #7#))))))))))))))
                             (COND
                              ((NULL
                                (|FS2UPS2;check_inverse| |coef| |opt_rec| %))
                               (EXIT
                                (|FS2UPS2;stateProblem| "nth root"
                                 "need to invert bad coefficient" %))))
                             (LETT |ans| (SPADCALL |ups| |n| (QREFELT % 39)))
                             (EXIT
                              (COND
                               ((QEQCAR |ans| 1)
                                (|FS2UPS2;stateProblem| "nth root"
                                 "no nth root" %))
                               (#5# (CONS 0 (QCDR |ans|)))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;stateProblem|
        ((|function| (|String|)) (|problem| (|String|))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (CONS 1 (CONS |function| |problem|))) 

(SDEFUN |FS2UPS2;exprToUPS;FEBUU;6|
        ((|fcn| (FE)) (|posCheck?| (|Boolean|))
         (|atanFlag|
          (|Union| "complex" "real: two sides" "real: left side"
                   "real: right side" "just do it"))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") NIL (|spadConstant| % 19) NIL)
         %)) 

(SDEFUN |FS2UPS2;exprToPS;FEBUBFEU;7|
        ((|fcn| (FE)) (|posCheck?| (|Boolean|))
         (|atanFlag|
          (|Union| "complex" "real: two sides" "real: left side"
                   "real: right side" "just do it"))
         (|log_flag| (|Boolean|)) (|log_val| (FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") |log_flag| |log_val| NIL)
         %)) 

(SDEFUN |FS2UPS2;exprToPS;FEBUBFE3MU;8|
        ((|fcn| (FE)) (|posCheck?| (|Boolean|))
         (|atanFlag|
          (|Union| "complex" "real: two sides" "real: left side"
                   "real: right side" "just do it"))
         (|log_flag| (|Boolean|)) (|log_val| (FE))
         (|coef_chk| (|Mapping| (|Boolean|) FE))
         (|inv_chk| (|Mapping| (|Boolean|) FE))
         (|zero_chk| (|Mapping| (|Boolean|) FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;i_expr_to_PS| |fcn|
         (VECTOR |posCheck?| |atanFlag| (CONS 0 |coef_chk|) (CONS 0 |inv_chk|)
                 (CONS 0 |zero_chk|) |log_flag| |log_val| NIL)
         %)) 

(SDEFUN |FS2UPS2;i_expr_to_PS|
        ((|fcn| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ker| (|Union| (|Kernel| FE) #2="failed"))
          (|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed"))
          (|prod| (|Union| (|List| FE) #3="failed"))
          (|sum| (|Union| (|List| FE) #3#))
          (|poly| (|Union| (|Polynomial| R) #2#)))
         (SEQ (LETT |poly| (SPADCALL |fcn| (QREFELT % 48)))
              (EXIT
               (COND
                ((QEQCAR |poly| 0)
                 (|FS2UPS2;polyToUPS|
                  (SPADCALL (QCDR |poly|) (QREFELT % 14) (QREFELT % 52))
                  |opt_rec| %))
                (#4='T
                 (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT % 54)))
                      (EXIT
                       (COND
                        ((QEQCAR |sum| 0)
                         (|FS2UPS2;listToUPS| (QCDR |sum|)
                          (CONS (|function| |FS2UPS2;i_expr_to_PS|) %)
                          |opt_rec| (|spadConstant| % 55) (ELT % 56) %))
                        (#4#
                         (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT % 57)))
                              (EXIT
                               (COND
                                ((QEQCAR |prod| 0)
                                 (|FS2UPS2;listToUPS| (QCDR |prod|)
                                  (CONS (|function| |FS2UPS2;i_expr_to_PS|) %)
                                  |opt_rec| (|spadConstant| % 58) (ELT % 59)
                                  %))
                                (#4#
                                 (SEQ
                                  (LETT |expt|
                                        (|FS2UPS2;isNonTrivPower| |fcn| %))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |expt| 0)
                                     (SEQ (LETT |power| (QCDR |expt|))
                                          (EXIT
                                           (|FS2UPS2;powerToUPS| (QCAR |power|)
                                            (QCDR |power|) |opt_rec| %))))
                                    (#4#
                                     (SEQ
                                      (LETT |ker|
                                            (SPADCALL |fcn| (QREFELT % 61)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |ker| 0)
                                         (|FS2UPS2;kernelToUPS| (QCDR |ker|)
                                          |opt_rec| %))
                                        (#4#
                                         (|error|
                                          "exprToUPS: neither a sum, product, power, nor kernel"))))))))))))))))))))))) 

(SDEFUN |FS2UPS2;polyToUPS|
        ((|poly| (|SparseUnivariatePolynomial| (|Polynomial| R)))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ans| (UPS)) (#2=#:G368 NIL) (#3=#:G353 NIL) (|coef| (FE))
          (|deg| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |poly| (QREFELT % 63)) (CONS 0 (|spadConstant| % 55)))
            ('T
             (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT % 64)))
                  (LETT |coef|
                        (SPADCALL (SPADCALL |poly| (QREFELT % 65))
                                  (QREFELT % 66)))
                  (COND
                   ((QEQCAR (QVELT |opt_rec| 2) 0)
                    (COND
                     ((NULL
                       (SPADCALL |coef|
                                 (PROG2 (LETT #3# (QVELT |opt_rec| 2))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|Mapping| (|Boolean|)
                                                              (QREFELT % 7))
                                                   (|Union|
                                                    (|Mapping| (|Boolean|)
                                                               (QREFELT % 7))
                                                    #1#)
                                                   #3#))))
                      (PROGN
                       (LETT #2#
                             (|FS2UPS2;stateProblem| "polyToUPS" "bad coeff"
                              %))
                       (GO #4=#:G367))))))
                  (LETT |ans|
                        (SPADCALL |coef| (SPADCALL |deg| (QREFELT % 26))
                                  (QREFELT % 67)))
                  (LETT |poly| (SPADCALL |poly| (QREFELT % 68)))
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |poly| (QREFELT % 63))))
                         (GO G191)))
                       (SEQ (LETT |deg| (SPADCALL |poly| (QREFELT % 64)))
                            (LETT |coef|
                                  (SPADCALL (SPADCALL |poly| (QREFELT % 65))
                                            (QREFELT % 66)))
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
                                                              (QREFELT % 7))
                                                             (|Union|
                                                              (|Mapping|
                                                               (|Boolean|)
                                                               (QREFELT % 7))
                                                              #1#)
                                                             #3#))))
                                (PROGN
                                 (LETT #2#
                                       (|FS2UPS2;stateProblem| "polyToUPS"
                                        "bad coeff" %))
                                 (GO #4#))))))
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL |coef|
                                                      (SPADCALL |deg|
                                                                (QREFELT % 26))
                                                      (QREFELT % 67))
                                            (QREFELT % 56)))
                            (EXIT
                             (LETT |poly| (SPADCALL |poly| (QREFELT % 68)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;listToUPS|
        ((|list| (|List| FE))
         (|feToUPS|
          (|Mapping|
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
                     (|:| |inv_check?|
                          (|Union| (|Mapping| (|Boolean|) FE) #7#))
                     (|:| |zero_check?|
                          (|Union| (|Mapping| (|Boolean|) FE) #7#))
                     (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                     (|:| |cache|
                          (|List|
                           (|Record| (|:| |ker| (|Kernel| FE))
                                     (|:| |ser|
                                          (|Union| (|:| |%series| UPS)
                                                   (|:| |%problem|
                                                        (|Record|
                                                         (|:| |func|
                                                              (|String|))
                                                         (|:| |prob|
                                                              (|String|))))))))))))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag| (|Union| #2# #3# #4# #5# #6#))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #7#))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #7#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #7#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (|ans| (UPS)) (|op| (|Mapping| UPS UPS UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((#8=#:G380 NIL) (|term| #1#))
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
                           (PROGN (LETT #8# |term|) (GO #9=#:G379)))
                          ('T
                           (SEQ (LETT |ans| (SPADCALL |ans| (CDR |term|) |op|))
                                (EXIT (LETT |list| (CDR |list|))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |ans|))))
                #9# (EXIT #8#)))) 

(SDEFUN |FS2UPS2;isNonTrivPower|
        ((|fcn| (FE))
         (%
          (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed")))
         (SEQ (LETT |expt| (SPADCALL |fcn| (QREFELT % 71)))
              (EXIT
               (COND ((QEQCAR |expt| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ (LETT |power| (QCDR |expt|))
                           (EXIT
                            (COND ((EQL (QCDR |power|) 1) (CONS 1 "failed"))
                                  (#1# (CONS 0 |power|))))))))))) 

(SDEFUN |FS2UPS2;powerToUPS|
        ((|fcn| (FE)) (|n| (|Integer|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G405 NIL) (|coef| (FE)) (|deg| (|Expon|)) (|ups| (UPS))
          (|deg1| (|Expon|)) (#3=#:G389 NIL) (#4=#:G395 NIL)
          (|b|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |b| (|FS2UPS2;i_expr_to_PS| |fcn| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |b| 1) |b|)
                     ((> |n| 0)
                      (CONS 0
                            (SPADCALL (CDR |b|)
                                      (PROG1 (LETT #4# |n|)
                                        (|check_subtype2| (> #4# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #4#))
                                      (QREFELT % 72))))
                     ('T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #3# |b|)
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT % 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #3#)))
                       (LETT |deg| (SPADCALL |ups| (QREFELT % 24)))
                       (LETT |deg1|
                             (SPADCALL |deg|
                                       (SPADCALL (QREFELT % 15) (QREFELT % 26))
                                       (QREFELT % 27)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((|FS2UPS2;check_zero|
                                  (LETT |coef|
                                        (SPADCALL |ups| |deg| (QREFELT % 28)))
                                  |opt_rec| %)
                                 (SPADCALL |deg| |deg1| (QREFELT % 29)))
                                ('T NIL)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (COND
                                ((SPADCALL |coef| (|spadConstant| % 19)
                                           (QREFELT % 30))
                                 (LETT |ups| (SPADCALL |ups| (QREFELT % 31)))))
                               (LETT |deg|
                                     (SPADCALL |ups| |deg1| (QREFELT % 32)))
                               (LETT |coef|
                                     (SPADCALL |ups| |deg| (QREFELT % 28)))
                               (EXIT
                                (COND
                                 ((SPADCALL |coef| (|spadConstant| % 19)
                                            (QREFELT % 21))
                                  (PROGN
                                   (LETT #2#
                                         (|error|
                                          "inverse of series with many leading zero coefficients"))
                                   (GO #5=#:G399)))))))
                             #5# (EXIT #2#))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| %))
                         (EXIT
                          (|FS2UPS2;stateProblem| "power"
                           "need to invert bad coefficient" %))))
                       (EXIT
                        (CONS 0 (SPADCALL |ups| |n| (QREFELT % 73))))))))))) 

(SDEFUN |FS2UPS2;handle_args|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union|
           (|Record| (|:| |osers| (|List| UPS)) (|:| |sers| (|List| UPS))
                     (|:| |sere| (|List| FE)) (|:| |sers0| (|List| FE)))
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))))
        (SPROG
         ((|lsers| (|List| UPS)) (|lsere| (|List| FE)) (|lcoef| (|List| FE))
          (|losers| (|List| UPS)) (|coef| (FE)) (#2=#:G423 NIL) (|ups| (UPS))
          (#3=#:G408 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (#4=#:G424 NIL) (|arg| NIL))
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
                          (SPADCALL (QREFELT % 14)
                                    (SPADCALL |arg| (QREFELT % 76))
                                    (QREFELT % 77)))
                         (SEQ
                          (LETT |losers|
                                (CONS (SPADCALL |arg| (QREFELT % 78))
                                      |losers|))
                          (LETT |lsers| (CONS (|spadConstant| % 55) |lsers|))
                          (LETT |lsere| (CONS (|spadConstant| % 19) |lsere|))
                          (EXIT (LETT |lcoef| (CONS |arg| |lcoef|)))))
                        ('T
                         (SEQ
                          (LETT |nsu|
                                (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
                          (EXIT
                           (COND
                            ((QEQCAR |nsu| 1)
                             (PROGN (LETT #2# (CONS 1 |nsu|)) (GO #5=#:G422)))
                            ('T
                             (SEQ
                              (LETT |ups|
                                    (PROG2 (LETT #3# |nsu|)
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT % 9)
                                                      (|Union|
                                                       (|:| |%series|
                                                            (QREFELT % 9))
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
                                  (SPADCALL |ups| (|spadConstant| % 79)
                                            (QREFELT % 32))
                                  (|spadConstant| % 79) (QREFELT % 29))
                                 (PROGN
                                  (LETT #2#
                                        (CONS 1
                                              (|FS2UPS2;stateProblem|
                                               "handle_args"
                                               "argument not Taylor" %)))
                                  (GO #5#)))
                                ('T
                                 (SEQ
                                  (LETT |coef|
                                        (SPADCALL |ups| (|spadConstant| % 79)
                                                  (QREFELT % 28)))
                                  (LETT |losers| (CONS |ups| |losers|))
                                  (LETT |lcoef| (CONS |coef| |lcoef|))
                                  (LETT |lsere|
                                        (CONS (|spadConstant| % 23) |lsere|))
                                  (EXIT
                                   (LETT |lsers|
                                         (CONS
                                          (SPADCALL |ups|
                                                    (SPADCALL |coef|
                                                              (QREFELT % 78))
                                                    (QREFELT % 80))
                                          |lsers|))))))))))))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (VECTOR (NREVERSE |losers|) (NREVERSE |lsers|)
                               (NREVERSE |lsere|) (NREVERSE |lcoef|))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv|
        ((|nf| (UPS)) (|lsyms| (|List| (|Symbol|))) (|lser| (|List| UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ups| (UPS)) (|lders| (|List| (|Mapping| FE FE))) (#1=#:G441 NIL)
          (|sym| NIL) (#2=#:G440 NIL))
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
                                     (VECTOR % |sym|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |ups| (SPADCALL |nf| |lser| |lders| (QREFELT % 85)))
          (EXIT
           (CONS 0
                 (SPADCALL
                  (CONS #'|FS2UPS2;do_taylor_via_deriv!1| (VECTOR % |lsyms|))
                  |ups| (QREFELT % 91))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv!1| ((|c| NIL) ($$ NIL))
        (PROG (|lsyms| %)
          (LETT |lsyms| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G437 NIL) (|sym| NIL) (#2=#:G436 NIL))
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
                                              (SPADCALL |sym| (QREFELT % 86))
                                              (|spadConstant| % 19)
                                              (QREFELT % 88))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 90)))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv!0| ((|c| NIL) ($$ NIL))
        (PROG (|sym| %)
          (LETT |sym| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT % 81)))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2|
        ((|nk| (FE)) (|lsyms| (|List| (|Symbol|))) (|lser| (|List| UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ups| (UPS)) (|lders| (|List| (|Mapping| FE FE))) (#1=#:G458 NIL)
          (|sym| NIL) (#2=#:G457 NIL))
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
                                     (VECTOR % |sym|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |ups| (SPADCALL |nk| |lser| |lders| (QREFELT % 92)))
          (EXIT
           (CONS 0
                 (SPADCALL
                  (CONS #'|FS2UPS2;do_taylor_via_deriv2!1| (VECTOR % |lsyms|))
                  |ups| (QREFELT % 91))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2!1| ((|c| NIL) ($$ NIL))
        (PROG (|lsyms| %)
          (LETT |lsyms| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G454 NIL) (|sym| NIL) (#2=#:G453 NIL))
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
                                              (SPADCALL |sym| (QREFELT % 86))
                                              (|spadConstant| % 19)
                                              (QREFELT % 88))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 90)))))))) 

(SDEFUN |FS2UPS2;do_taylor_via_deriv2!0| ((|c| NIL) ($$ NIL))
        (PROG (|sym| %)
          (LETT |sym| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |sym| (QREFELT % 81)))))) 

(SDEFUN |FS2UPS2;convert_args|
        ((|lsers| (|List| UPS)) (|lsere| (|List| FE)) (|lser0| (|List| FE))
         (%
          (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                    (|:| |syms| (|List| (|Symbol|))))))
        (SPROG
         ((|nargs| (|List| FE)) (|lser| (|List| UPS))
          (|lsyms| (|List| (|Symbol|))) (|nsym| (|Symbol|)) (#1=#:G465 NIL)
          (|s| NIL) (#2=#:G466 NIL) (|e| NIL) (#3=#:G467 NIL) (|c| NIL))
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
                      ((SPADCALL |e| (|spadConstant| % 19) (QREFELT % 21))
                       (LETT |nargs| (CONS |c| |nargs|)))
                      ('T
                       (SEQ (LETT |nsym| (SPADCALL (QREFELT % 93)))
                            (LETT |nargs|
                                  (CONS
                                   (SPADCALL |c|
                                             (SPADCALL |nsym| (QREFELT % 86))
                                             (QREFELT % 94))
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
        ((|losers| (|List| UPS)) (|lsers| (|List| UPS)) (|lsere| (|List| FE))
         (|lser0| (|List| FE)) (|ef| (|Mapping| UTS UTS (|List| FE)))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|nres| (UPS))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|))))))
         (SEQ
          (LETT |cargs|
                (|FS2UPS2;convert_args| (CDR |lsers|) (CDR |lsere|)
                 (CDR |lser0|) %))
          (LETT |nres|
                (SPADCALL (CONS #'|FS2UPS2;do_ell!0| (VECTOR |ef| |cargs|))
                          (SPADCALL |losers| 1 (QREFELT % 95)) (QREFELT % 97)))
          (EXIT
           (|FS2UPS2;do_taylor_via_deriv| |nres| (QVELT |cargs| 2)
            (QVELT |cargs| 1) %))))) 

(SDEFUN |FS2UPS2;do_ell!0| ((|f| NIL) ($$ NIL))
        (PROG (|cargs| |ef|)
          (LETT |cargs| (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f| (QVELT |cargs| 0) |ef|))))) 

(SDEFUN |FS2UPS2;do_ell2|
        ((|losers| (|List| UPS)) (|lsers| (|List| UPS)) (|lsere| (|List| FE))
         (|lser0| (|List| FE)) (|ef| (|Mapping| UTS UTS FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG NIL
               (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
                (CONS #'|FS2UPS2;do_ell2!0| (VECTOR |ef| %)) %))) 

(SDEFUN |FS2UPS2;do_ell2!0| ((|f| NIL) (|l| NIL) ($$ NIL))
        (PROG (% |ef|)
          (LETT % (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f| (SPADCALL |l| (|spadConstant| % 98) (QREFELT % 100))
                      |ef|))))) 

(SDEFUN |FS2UPS2;do_ell3|
        ((|losers| (|List| UPS)) (|lsers| (|List| UPS)) (|lsere| (|List| FE))
         (|lser0| (|List| FE)) (|ef| (|Mapping| UTS UTS FE FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG NIL
               (|FS2UPS2;do_ell| |losers| |lsers| |lsere| |lser0|
                (CONS #'|FS2UPS2;do_ell3!0| (VECTOR |ef| %)) %))) 

(SDEFUN |FS2UPS2;do_ell3!0| ((|f| NIL) (|l| NIL) ($$ NIL))
        (PROG (% |ef|)
          (LETT % (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f| (SPADCALL |l| (|spadConstant| % 98) (QREFELT % 100))
                      (SPADCALL |l| 2 (QREFELT % 100)) |ef|))))) 

(SDEFUN |FS2UPS2;besselEq| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT % 105)) |zvar|
                       (SPADCALL (SPADCALL |zvar| 2 (QREFELT % 105))
                                 (SPADCALL |v| 2 (QREFELT % 105))
                                 (QREFELT % 106))))))) 

(SDEFUN |FS2UPS2;besselEqm| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT % 105)) |zvar|
                       (SPADCALL (SPADCALL |zvar| 2 (QREFELT % 105))
                                 (SPADCALL |v| 2 (QREFELT % 105))
                                 (QREFELT % 103))))))) 

(SDEFUN |FS2UPS2;kelvinEq| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|v2| (UTS)) (|zvar| (UTS)) (|v| (UTS)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (LETT |v2|
                      (SPADCALL (|spadConstant| % 107)
                                (SPADCALL 2 (SPADCALL |v| 2 (QREFELT % 105))
                                          (QREFELT % 108))
                                (QREFELT % 103)))
                (EXIT
                 (LIST (SPADCALL |zvar| 4 (QREFELT % 105))
                       (SPADCALL 2 (SPADCALL |zvar| 3 (QREFELT % 105))
                                 (QREFELT % 108))
                       (SPADCALL
                        (SPADCALL |v2| (SPADCALL |zvar| 2 (QREFELT % 105))
                                  (QREFELT % 109))
                        (QREFELT % 110))
                       (SPADCALL |v2| |zvar| (QREFELT % 109))
                       (SPADCALL
                        (SPADCALL (SPADCALL |v| 2 (QREFELT % 105))
                                  (SPADCALL 4 (SPADCALL |v| 2 (QREFELT % 105))
                                            (QREFELT % 108))
                                  (QREFELT % 106))
                        (SPADCALL |zvar| 4 (QREFELT % 105))
                        (QREFELT % 103))))))) 

(SDEFUN |FS2UPS2;kummerEq| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|zvar| (UTS)) (|b| (UTS)) (|a| (UTS)))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |b|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (EXIT
                 (LIST |zvar| (SPADCALL |b| |zvar| (QREFELT % 106))
                       (SPADCALL |a| (QREFELT % 110))))))) 

(SDEFUN |FS2UPS2;legendreEq| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|z2| (UTS)) (|zvar| (UTS)) (|mu| (UTS)) (|nu| (UTS)))
               (SEQ
                (LETT |nu|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |mu|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (LETT |z2|
                      (SPADCALL (|spadConstant| % 107)
                                (SPADCALL |zvar| 2 (QREFELT % 105))
                                (QREFELT % 106)))
                (EXIT
                 (LIST (SPADCALL |z2| 2 (QREFELT % 105))
                       (SPADCALL
                        (SPADCALL (SPADCALL 2 |zvar| (QREFELT % 108)) |z2|
                                  (QREFELT % 109))
                        (QREFELT % 110))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |nu|
                                   (SPADCALL |nu| (|spadConstant| % 107)
                                             (QREFELT % 103))
                                   (QREFELT % 109))
                         |z2| (QREFELT % 109))
                        |mu| (QREFELT % 106))))))) 

(SDEFUN |FS2UPS2;whittakerEq| ((|lc| (|List| FE)) (|z0| (FE)) (% (|List| UTS)))
        (SPROG ((|zvar| (UTS)) (|o4| (UTS)) (|m| (UTS)) (|k| (UTS)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |lc| 1 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |m|
                      (SPADCALL (SPADCALL |lc| 2 (QREFELT % 100))
                                (QREFELT % 101)))
                (LETT |o4|
                      (SPADCALL (|spadConstant| % 107)
                                (SPADCALL (SPADCALL 4 (QREFELT % 112))
                                          (QREFELT % 113))
                                (QREFELT % 114)))
                (LETT |zvar|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                       (SPADCALL |z0| (QREFELT % 101)) (QREFELT % 103)))
                (EXIT
                 (LIST (SPADCALL |zvar| 2 (QREFELT % 105))
                       (|spadConstant| % 115)
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |o4| (SPADCALL |m| 2 (QREFELT % 105))
                                   (QREFELT % 106))
                         (SPADCALL |k| |zvar| (QREFELT % 109)) (QREFELT % 103))
                        (SPADCALL (SPADCALL |zvar| 2 (QREFELT % 105))
                                  (SPADCALL (SPADCALL 4 (QREFELT % 112))
                                            (QREFELT % 113))
                                  (QREFELT % 114))
                        (QREFELT % 106))))))) 

(SDEFUN |FS2UPS2;do_diff_eq|
        ((|ker| (|Kernel| FE)) (|losers| (|List| UPS)) (|lsers| (|List| UPS))
         (|lsere| (|List| FE)) (|lser0| (|List| FE))
         (|getEq| (|Mapping| #1=(|List| UTS) (|List| FE) FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ups| (UPS)) (|lc| (|List| FE)) (#2=#:G506 NIL) (|c| NIL)
          (#3=#:G505 NIL) (|nker| (FE)) (#4=#:G504 NIL)
          (|lsyms| (|List| (|Symbol|))) (|sym| (|Symbol|)) (|ecl| #1#)
          (#5=#:G503 NIL) (#6=#:G502 NIL) (|cn1| (UTS))
          (|cn1u| (|Union| UTS "failed")) (|cn| (UTS)) (|z0| (FE))
          (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|))))))
         (SEQ (LETT |cargs| (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| %))
              (LETT |nargs| (QVELT |cargs| 0))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |lsere| (QREFELT % 116))
                           (|spadConstant| % 19) (QREFELT % 21))
                 (SEQ
                  (LETT |nker|
                        (SPADCALL (SPADCALL |ker| (QREFELT % 119)) |nargs|
                                  (QREFELT % 121)))
                  (EXIT
                   (|FS2UPS2;do_taylor_via_deriv2| |nker| (QVELT |cargs| 2)
                    (QVELT |cargs| 1) %))))
                (#7='T
                 (SEQ (LETT |z0| (SPADCALL |lser0| (QREFELT % 116)))
                      (LETT |ecl| (SPADCALL |nargs| |z0| |getEq|))
                      (LETT |cn| (|SPADfirst| |ecl|))
                      (LETT |cn1u| (SPADCALL |cn| (QREFELT % 123)))
                      (EXIT
                       (COND
                        ((QEQCAR |cn1u| 1)
                         (|error| "do_diff_eq: called at singular point"))
                        (#7#
                         (SEQ
                          (LETT |cn1| (SPADCALL (QCDR |cn1u|) (QREFELT % 110)))
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
                                                         (QREFELT % 109))
                                               #6#))))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT (NREVERSE #6#)))))
                          (LETT |nker|
                                (SPADCALL (SPADCALL |ker| (QREFELT % 119))
                                          |nargs| (QREFELT % 121)))
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
                                      (SPADCALL |nker| |sym| (QREFELT % 81)))
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
                                                                    (QREFELT %
                                                                             86))
                                                          (|spadConstant| % 19)
                                                          (QREFELT % 88))
                                                         (QREFELT % 125))
                                               #3#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (LETT |ups|
                                (SPADCALL (REVERSE |ecl|)
                                          (|SPADfirst| (QVELT |cargs| 1)) |lc|
                                          (QREFELT % 127)))
                          (EXIT
                           (|FS2UPS2;do_taylor_via_deriv| |ups| |lsyms| |lsers|
                            %))))))))))))) 

(SDEFUN |FS2UPS2;lambertW0| ((|arg| (UPS)) (% (UPS)))
        (SPADCALL (ELT % 129) |arg| (QREFELT % 97))) 

(SDEFUN |FS2UPS2;do_weierstrass|
        ((|losers| (|List| UPS)) (|lsers| (|List| UPS)) (|lsere| (|List| FE))
         (|lser0| (|List| FE)) (|ef| (|Mapping| UTS FE FE UTS))
         (|k| (|Integer|)) (|cz| (|Integer|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G518 NIL)
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
            ((SPADCALL (SPADCALL |lsere| 3 (QREFELT % 100))
                       (|spadConstant| % 19) (QREFELT % 21))
             (|error| "expansion at 0"))
            (#3='T
             (SEQ (LETT |z_ser| (SPADCALL |losers| 3 (QREFELT % 95)))
                  (COND
                   ((SPADCALL |cz| 0 (QREFELT % 130))
                    (SEQ
                     (LETT |deg|
                           (SPADCALL |z_ser|
                                     (SPADCALL (QREFELT % 15) (QREFELT % 26))
                                     (QREFELT % 32)))
                     (LETT |coef| (SPADCALL |z_ser| |deg| (QREFELT % 28)))
                     (EXIT
                      (COND
                       ((SPADCALL |coef| (|spadConstant| % 19) (QREFELT % 21))
                        (|error|
                         "inverse of series with many leading zero coefficients"))
                       (#3#
                        (SEQ
                         (COND
                          ((NULL (|FS2UPS2;check_inverse| |coef| |opt_rec| %))
                           (PROGN
                            (LETT #2#
                                  (|FS2UPS2;stateProblem| "weierstrass"
                                   "need to invert bad coefficient" %))
                            (GO #4=#:G517))))
                         (EXIT
                          (LETT |z_inv|
                                (SPADCALL |cz|
                                          (SPADCALL |z_ser| |k| (QREFELT % 73))
                                          (QREFELT % 131))))))))))
                   (#3# (LETT |z_inv| (|spadConstant| % 55))))
                  (LETT |cargs|
                        (|FS2UPS2;convert_args| |lsers| |lsere| |lser0| %))
                  (LETT |nargs| (QVELT |cargs| 0))
                  (LETT |nres|
                        (SPADCALL
                         (CONS #'|FS2UPS2;do_weierstrass!0|
                               (VECTOR |ef| % |nargs|))
                         |z_ser| (QREFELT % 97)))
                  (LETT |lsyms| (CDR (QVELT |cargs| 2)))
                  (LETT |lsers| (CDR (QVELT |cargs| 1)))
                  (LETT |nres2|
                        (|FS2UPS2;do_taylor_via_deriv| |nres| |lsyms| |lsers|
                         %))
                  (EXIT
                   (COND
                    ((QEQCAR |nres2| 1) (PROGN (LETT #2# |nres2|) (GO #4#)))
                    (#3#
                     (CONS 0
                           (SPADCALL |z_inv| (CDR |nres2|)
                                     (QREFELT % 56))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;do_weierstrass!0| ((|f| NIL) ($$ NIL))
        (PROG (|nargs| % |ef|)
          (LETT |nargs| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |ef| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |nargs| (|spadConstant| % 132) (QREFELT % 100))
                      (SPADCALL |nargs| 2 (QREFELT % 100)) |f| |ef|))))) 

(SDEFUN |FS2UPS2;make_taylor| ((|f| (|Mapping| FE (|Integer|))) (% (UTS)))
        (SPROG
         ((|sc| (|Stream| FE)) (|genc| (|Mapping| FE FE))
          (|rn| (|Reference| (|Integer|))))
         (SEQ (LETT |rn| (SPADCALL 1 (QREFELT % 134)))
              (LETT |genc|
                    (CONS #'|FS2UPS2;make_taylor!0| (VECTOR |f| % |rn|)))
              (LETT |sc| (SPADCALL |genc| (SPADCALL 0 |f|) (QREFELT % 139)))
              (EXIT (SPADCALL |sc| (QREFELT % 140)))))) 

(SDEFUN |FS2UPS2;make_taylor!0| ((|s| NIL) ($$ NIL))
        (PROG (|rn| % |f|)
          (LETT |rn| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|val| NIL) (|n| NIL))
                   (SEQ (LETT |n| (SPADCALL |rn| (QREFELT % 135)))
                        (LETT |val| (SPADCALL |n| |f|))
                        (SPADCALL |rn|
                                  (SPADCALL |n| (|spadConstant| % 98)
                                            (QREFELT % 136))
                                  (QREFELT % 137))
                        (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;gen_erfs| ((|i| (|Integer|)) (|rv| (|Reference| FE)) (% (FE)))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 1) (|spadConstant| % 23))
                      ((EVENP |i|) (|spadConstant| % 19))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL
                               (SPADCALL (SPADCALL (- 2 |i|) (QREFELT % 143))
                                         (SPADCALL 2 (QREFELT % 143))
                                         (QREFELT % 146))
                               (SPADCALL |rv| (QREFELT % 153))
                               (QREFELT % 144)))
                        (SPADCALL |rv| |val| (QREFELT % 154)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_erfs|
        ((|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|lerfs| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| % 23) (QREFELT % 155)))
                (LETT |lerfs|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_erfs!0| (VECTOR % |rv|)) %))
                (EXIT
                 (CONS 0
                       (SPADCALL (QREFELT % 151)
                                 (SPADCALL |lerfs| |iups| (QREFELT % 156))
                                 (QREFELT % 157))))))) 

(SDEFUN |FS2UPS2;do_erfs!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| %)
          (LETT |rv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_erfs| |i| |rv| %))))) 

(SDEFUN |FS2UPS2;gen_erfis|
        ((|i| (|Integer|)) (|rv| (|Reference| FE)) (% (FE)))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 1) (|spadConstant| % 23))
                      ((EVENP |i|) (|spadConstant| % 19))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL
                               (SPADCALL (SPADCALL (- |i| 2) (QREFELT % 143))
                                         (SPADCALL 2 (QREFELT % 143))
                                         (QREFELT % 146))
                               (SPADCALL |rv| (QREFELT % 153))
                               (QREFELT % 144)))
                        (SPADCALL |rv| |val| (QREFELT % 154)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_erfis|
        ((|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|lerfs| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| % 23) (QREFELT % 155)))
                (LETT |lerfs|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_erfis!0| (VECTOR % |rv|)) %))
                (EXIT
                 (CONS 0
                       (SPADCALL (QREFELT % 151)
                                 (SPADCALL |lerfs| |iups| (QREFELT % 156))
                                 (QREFELT % 157))))))) 

(SDEFUN |FS2UPS2;do_erfis!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| %)
          (LETT |rv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_erfis| |i| |rv| %))))) 

(SDEFUN |FS2UPS2;gen_eis| ((|i| (|Integer|)) (|rv| (|Reference| FE)) (% (FE)))
        (SPROG ((|val| (FE)))
               (SEQ
                (COND ((EQL |i| 0) (|spadConstant| % 19))
                      ((EQL |i| 1) (|spadConstant| % 23))
                      ('T
                       (SEQ
                        (LETT |val|
                              (SPADCALL (SPADCALL (- |i| 1) (QREFELT % 143))
                                        (SPADCALL |rv| (QREFELT % 153))
                                        (QREFELT % 144)))
                        (SPADCALL |rv| |val| (QREFELT % 154)) (EXIT |val|))))))) 

(SDEFUN |FS2UPS2;do_eis|
        ((|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|leis| (UTS)) (|rv| (|Reference| FE)))
               (SEQ
                (LETT |rv| (SPADCALL (|spadConstant| % 23) (QREFELT % 155)))
                (LETT |leis|
                      (|FS2UPS2;make_taylor|
                       (CONS #'|FS2UPS2;do_eis!0| (VECTOR % |rv|)) %))
                (EXIT (CONS 0 (SPADCALL |leis| |iups| (QREFELT % 156))))))) 

(SDEFUN |FS2UPS2;do_eis!0| ((|i| NIL) ($$ NIL))
        (PROG (|rv| %)
          (LETT |rv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_eis| |i| |rv| %))))) 

(SDEFUN |FS2UPS2;replace_log|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (% (UPS)))
        (SPROG ((|c1| (FE)))
               (SEQ
                (LETT |c1|
                      (SPADCALL (SPADCALL |k| |lx| (QREFELT % 144))
                                (SPADCALL |lc| (QREFELT % 145))
                                (QREFELT % 94)))
                (EXIT
                 (SPADCALL (SPADCALL |c1| (QREFELT % 78))
                           (SPADCALL |ups1| (QREFELT % 158)) (QREFELT % 56)))))) 

(SDEFUN |FS2UPS2;integt;2UTS;38| ((|f| (UTS)) (% (UTS)))
        (SPADCALL |f| (QREFELT % 160))) 

(PUT '|FS2UPS2;integt;2UTS;39| '|SPADreplace|
     '(XLAM (|f|) (|error| "can not integrate"))) 

(SDEFUN |FS2UPS2;integt;2UTS;39| ((|f| (UTS)) (% (UTS)))
        (|error| "can not integrate")) 

(SDEFUN |FS2UPS2;my_digamma;2FE;40| ((|xx| (FE)) (% (FE)))
        (SPADCALL |xx| (QREFELT % 162))) 

(PUT '|FS2UPS2;my_digamma;2FE;41| '|SPADreplace|
     '(XLAM (|xx|) (|error| "need digamma"))) 

(SDEFUN |FS2UPS2;my_digamma;2FE;41| ((|xx| (FE)) (% (FE)))
        (|error| "need digamma")) 

(SDEFUN |FS2UPS2;do_Ei00|
        ((|xx| (UTS)) (|exx| (UTS)) (|lc| (FE)) (|k| (FE)) (|lx| (FE))
         (|ups1| (UPS)) (|ups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|r2| (UPS)) (|r1| (UPS)) (|ei0| (UTS)) (|d_ei| (UTS))
          (|d_eiu| (|Union| UTS "failed")))
         (SEQ
          (LETT |d_eiu|
                (SPADCALL
                 (SPADCALL |exx| (|spadConstant| % 107) (QREFELT % 106)) |xx|
                 (QREFELT % 164)))
          (EXIT
           (COND ((QEQCAR |d_eiu| 1) (|error| "impossible: exquo failed"))
                 ('T
                  (SEQ (LETT |d_ei| (QCDR |d_eiu|))
                       (LETT |ei0| (SPADCALL |d_ei| (QREFELT % 161)))
                       (LETT |r1|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 23)
                                          (QREFELT % 163))
                                (QREFELT % 78))
                               (QREFELT % 165))
                              (|FS2UPS2;replace_log| |lc| |k| |lx| |ups1| %)
                              (QREFELT % 56)))
                       (LETT |r2| (SPADCALL |ei0| |ups| (QREFELT % 156)))
                       (EXIT
                        (CONS 0 (SPADCALL |r1| |r2| (QREFELT % 56))))))))))) 

(SDEFUN |FS2UPS2;do_Ei0|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (|ups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|exx| (UTS)) (|xx| (UTS)))
               (SEQ
                (LETT |xx| (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102)))
                (LETT |exx| (SPADCALL |xx| (QREFELT % 166)))
                (EXIT
                 (|FS2UPS2;do_Ei00| |xx| |exx| |lc| |k| |lx| |ups1| |ups| %))))) 

(SDEFUN |FS2UPS2;do_Ci0|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (|ups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|cxx| (UTS)) (|xx| (UTS)))
               (SEQ
                (LETT |xx| (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102)))
                (LETT |cxx| (SPADCALL |xx| (QREFELT % 166)))
                (EXIT
                 (|FS2UPS2;do_Ei00| |xx| |cxx| |lc| |k| |lx| |ups1| |ups| %))))) 

(SDEFUN |FS2UPS2;do_Chi0|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (|ups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|chxx| (UTS)) (|xx| (UTS)))
               (SEQ
                (LETT |xx| (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102)))
                (LETT |chxx| (SPADCALL |xx| (QREFELT % 167)))
                (EXIT
                 (|FS2UPS2;do_Ei00| |xx| |chxx| |lc| |k| |lx| |ups1| |ups|
                  %))))) 

(SDEFUN |FS2UPS2;do_dilog0|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (|ups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|r2| (UPS)) (|lx2| (UTS)) (|lx1| (UTS))
          (|lx1u| (|Union| UTS "failed")) (|r1| (UPS)) (|l1| (UPS))
          (|lxx| (UTS)) (|xx| (UTS)))
         (SEQ (LETT |xx| (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102)))
              (LETT |lxx|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 107) |xx| (QREFELT % 106))
                     (QREFELT % 168)))
              (LETT |l1| (SPADCALL |lxx| |ups| (QREFELT % 156)))
              (LETT |r1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 141)) 2 (QREFELT % 169))
                       (SPADCALL 6 (QREFELT % 143)) (QREFELT % 146))
                      (QREFELT % 78))
                     (SPADCALL (|FS2UPS2;replace_log| |lc| |k| |lx| |ups1| %)
                               |l1| (QREFELT % 59))
                     (QREFELT % 80)))
              (LETT |lx1u| (SPADCALL |lxx| |xx| (QREFELT % 164)))
              (EXIT
               (COND ((QEQCAR |lx1u| 1) (|error| "impossible: exquo failed"))
                     ('T
                      (SEQ (LETT |lx1| (QCDR |lx1u|))
                           (LETT |lx2| (SPADCALL |lx1| (QREFELT % 161)))
                           (LETT |r2| (SPADCALL |lx2| |ups| (QREFELT % 156)))
                           (EXIT
                            (CONS 0 (SPADCALL |r1| |r2| (QREFELT % 56))))))))))) 

(SDEFUN |FS2UPS2;gen_lg| ((|i| (|Integer|)) (% (FE)))
        (SPROG ((|k| (|Integer|)))
               (SEQ
                (COND ((EQL |i| 0) (QREFELT % 147))
                      ((EVENP |i|) (|spadConstant| % 19))
                      ('T
                       (SEQ (LETT |k| (+ |i| 1))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT % 172))
                                        (QREFELT % 173))
                              (SPADCALL (* |k| |i|) (QREFELT % 143))
                              (QREFELT % 146))))))))) 

(SDEFUN |FS2UPS2;do_log_gamma|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups| (UPS)) (|ups1| (UPS))
         (|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|r2| (UPS)) (|r1| (UPS)) (|l1| (UPS)) (|lgs| (UTS)))
               (SEQ
                (LETT |lgs|
                      (|FS2UPS2;make_taylor|
                       (CONS (|function| |FS2UPS2;gen_lg|) %) %))
                (LETT |l1| (|FS2UPS2;replace_log| |lc| |k| |lx| |ups1| %))
                (LETT |r1|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |ups|
                                  (SPADCALL (|spadConstant| % 58)
                                            (SPADCALL 2 (QREFELT % 143))
                                            (QREFELT % 174))
                                  (QREFELT % 80))
                        |l1| (QREFELT % 59))
                       |ups| (QREFELT % 80)))
                (LETT |r2| (SPADCALL |lgs| |iups| (QREFELT % 156)))
                (EXIT (CONS 0 (SPADCALL |r1| |r2| (QREFELT % 56))))))) 

(SDEFUN |FS2UPS2;do_digamma|
        ((|lc| (FE)) (|k| (FE)) (|lx| (FE)) (|ups1| (UPS)) (|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|r2| (UPS)) (|r1| (UPS)) (|l1| (UPS)) (|ldig| (UTS)) (|lgs| (UTS)))
         (SEQ
          (LETT |lgs|
                (|FS2UPS2;make_taylor| (CONS (|function| |FS2UPS2;gen_lg|) %)
                 %))
          (LETT |ldig|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 23) (QREFELT % 176)) 2
                           (QREFELT % 102))
                 (SPADCALL |lgs| (QREFELT % 177)) (QREFELT % 109)))
          (LETT |l1| (|FS2UPS2;replace_log| |lc| |k| |lx| |ups1| %))
          (LETT |r1|
                (SPADCALL |l1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 58)
                                      (SPADCALL 2 (QREFELT % 143))
                                      (QREFELT % 174))
                            (QREFELT % 165))
                           |iups| (QREFELT % 59))
                          (QREFELT % 56)))
          (LETT |r2| (SPADCALL |ldig| |iups| (QREFELT % 156)))
          (EXIT (CONS 0 (SPADCALL |r1| |r2| (QREFELT % 56))))))) 

(SDEFUN |FS2UPS2;do_polygamma_n|
        ((|n| (|Integer|)) (|iups| (UPS))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG ((|lpol| (UTS)) (#1=#:G579 NIL) (|i| NIL))
               (SEQ
                (LETT |lpol|
                      (|FS2UPS2;make_taylor|
                       (CONS (|function| |FS2UPS2;gen_lg|) %) %))
                (LETT |lpol|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 23) (QREFELT % 176)) 2
                        (QREFELT % 102))
                       (SPADCALL |lpol| (QREFELT % 177)) (QREFELT % 109)))
                (LETT |lpol|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 102))
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 23)
                                   (SPADCALL 2 (QREFELT % 143))
                                   (QREFELT % 146))
                         2 (QREFELT % 102))
                        (QREFELT % 103))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 23) (QREFELT % 176)) 2
                         (QREFELT % 102))
                        (SPADCALL |lpol| (QREFELT % 177)) (QREFELT % 109))
                       (QREFELT % 103)))
                (SEQ (LETT |i| 2) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |lpol|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 23) (QREFELT % 176))
                               2 (QREFELT % 102))
                              (SPADCALL |lpol| (QREFELT % 177))
                              (QREFELT % 109)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |lpol| |iups| (QREFELT % 156))))))) 

(SDEFUN |FS2UPS2;gen_plgi| ((|i| (|Integer|)) (|s| (|Integer|)) (% (FE)))
        (COND ((EQL |i| 0) (|spadConstant| % 19))
              ((EQL |i| 1) (|spadConstant| % 23))
              ('T
               (SPADCALL (SPADCALL |i| (QREFELT % 143)) (- |s|)
                         (QREFELT % 169))))) 

(SDEFUN |FS2UPS2;gen_plgf| ((|i| (|Integer|)) (|s| (FE)) (% (FE)))
        (COND ((EQL |i| 0) (|spadConstant| % 19))
              ((EQL |i| 1) (|spadConstant| % 23))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |i| (QREFELT % 143))
                                     (QREFELT % 145))
                           (QREFELT % 144))
                 (QREFELT % 176))
                (QREFELT % 179))))) 

(SDEFUN |FS2UPS2;do_polylog0|
        ((|losers| (|List| UPS)) (|lsers| (|List| UPS)) (|lsere| (|List| FE))
         (|lser0| (|List| FE))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|nres| (UPS)) (|fts| (UTS))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (|its| (UTS)) (|si| (|Integer|))
          (|su| (|Union| (|Integer|) "failed")) (|s0| (FE)))
         (SEQ (LETT |s0| (SPADCALL |lser0| 1 (QREFELT % 100)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |lsere| 1 (QREFELT % 100))
                           (|spadConstant| % 19) (QREFELT % 21))
                 (SEQ (LETT |su| (SPADCALL |s0| (QREFELT % 180)))
                      (EXIT
                       (COND
                        ((QEQCAR |su| 0)
                         (SEQ (LETT |si| (QCDR |su|))
                              (LETT |its|
                                    (|FS2UPS2;make_taylor|
                                     (CONS #'|FS2UPS2;do_polylog0!0|
                                           (VECTOR % |si|))
                                     %))
                              (EXIT
                               (CONS 0
                                     (SPADCALL |its|
                                               (SPADCALL |lsers| 2
                                                         (QREFELT % 95))
                                               (QREFELT % 156))))))
                        (#1='T
                         (SEQ
                          (LETT |fts|
                                (|FS2UPS2;make_taylor|
                                 (CONS #'|FS2UPS2;do_polylog0!1|
                                       (VECTOR % |s0|))
                                 %))
                          (EXIT
                           (CONS 0
                                 (SPADCALL |fts|
                                           (SPADCALL |lsers| 2 (QREFELT % 95))
                                           (QREFELT % 156))))))))))
                (#1#
                 (SEQ
                  (LETT |cargs|
                        (|FS2UPS2;convert_args|
                         (LIST (SPADCALL |lsers| 1 (QREFELT % 95)))
                         (LIST (SPADCALL |lsere| 1 (QREFELT % 100)))
                         (LIST |s0|) %))
                  (LETT |fts|
                        (|FS2UPS2;make_taylor|
                         (CONS #'|FS2UPS2;do_polylog0!2| (VECTOR % |cargs|))
                         %))
                  (LETT |nres|
                        (SPADCALL |fts| (SPADCALL |lsers| 2 (QREFELT % 95))
                                  (QREFELT % 156)))
                  (EXIT
                   (|FS2UPS2;do_taylor_via_deriv| |nres| (QVELT |cargs| 2)
                    (QVELT |cargs| 1) %))))))))) 

(SDEFUN |FS2UPS2;do_polylog0!2| ((|i| NIL) ($$ NIL))
        (PROG (|cargs| %)
          (LETT |cargs| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|FS2UPS2;gen_plgf| |i|
             (SPADCALL (QVELT |cargs| 0) (|spadConstant| % 132)
                       (QREFELT % 100))
             %))))) 

(SDEFUN |FS2UPS2;do_polylog0!1| ((|i| NIL) ($$ NIL))
        (PROG (|s0| %)
          (LETT |s0| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_plgf| |i| |s0| %))))) 

(SDEFUN |FS2UPS2;do_polylog0!0| ((|i| NIL) ($$ NIL))
        (PROG (|si| %)
          (LETT |si| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|FS2UPS2;gen_plgi| |i| |si| %))))) 

(SDEFUN |FS2UPS2;spec_to_UPS|
        ((|ker| (|Kernel| FE)) (|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|nker| (FE)) (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (#2=#:G1323 NIL) (|nexpr| (FE)) (|narg1| (FE)) (|arg1| (FE))
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
          (|ups| (UPS)) (|lc| (FE)) (|ups1| (UPS)) (|iups| (UPS))
          (|signum| (|Union| (|Integer|) "failed")) (|ord| (|Expon|))
          (#4=#:G408 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ei_ci_chi| #5=(|Boolean|)) (|polygamma_n| #5#) (|nn| (|Integer|))
          (|nu| (|Union| (|Integer|) #3#)))
         (SEQ
          (EXIT
           (SEQ (LETT |nm| (SPADCALL |ker| (QREFELT % 181)))
                (LETT |polygamma_n|
                      (COND
                       ((EQUAL |nm| '|polygamma|)
                        (SEQ
                         (LETT |nu|
                               (SPADCALL (SPADCALL |args| 1 (QREFELT % 100))
                                         (QREFELT % 180)))
                         (EXIT
                          (COND
                           ((QEQCAR |nu| 0) (>= (LETT |nn| (QCDR |nu|)) 0))
                           (#6='T NIL)))))
                       (#6# NIL)))
                (LETT |ei_ci_chi|
                      (COND ((OR (EQUAL |nm| '|Ei|) (EQUAL |nm| '|Ci|)) 'T)
                            ('T (EQUAL |nm| '|Chi|))))
                (COND
                 ((OR (EQUAL |nm| '|digamma|)
                      (OR (EQUAL |nm| '|%logGamma|)
                          (OR (EQUAL |nm| '|%eis|)
                              (OR (EQUAL |nm| '|%erfs|)
                                  (OR (OR (EQUAL |nm| '|%erfis|) |ei_ci_chi|)
                                      (OR (EQUAL |nm| '|dilog|)
                                          |polygamma_n|))))))
                  (SEQ (LETT |arg1| (SPADCALL |args| 1 (QREFELT % 100)))
                       (COND
                        (|polygamma_n|
                         (LETT |arg1| (SPADCALL |args| 2 (QREFELT % 100)))))
                       (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg1| |opt_rec| %))
                       (EXIT
                        (COND
                         ((QEQCAR |nsu| 1)
                          (PROGN (LETT #2# |nsu|) (GO #7=#:G1322)))
                         (#6#
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |nsu|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT % 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT % 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |ord|
                                 (SPADCALL |ups| (|spadConstant| % 79)
                                           (QREFELT % 32)))
                           (EXIT
                            (COND
                             ((OR |ei_ci_chi| (EQUAL |nm| '|dilog|))
                              (COND
                               ((SPADCALL |ord| (|spadConstant| % 79)
                                          (QREFELT % 182))
                                (SEQ
                                 (LETT |ord|
                                       (SPADCALL |ups| (|spadConstant| % 111)
                                                 (QREFELT % 32)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ord| (|spadConstant| % 79)
                                              (QREFELT % 183))
                                    (PROGN
                                     (LETT #2#
                                           (SEQ
                                            (COND
                                             ((QVELT |opt_rec| 5)
                                              (COND
                                               ((NULL (QREFELT % 159))
                                                (EXIT
                                                 (|FS2UPS2;stateProblem|
                                                  (SPADCALL |nm|
                                                            (QREFELT % 185))
                                                  #8="expansion at 0" %)))))
                                             (#6#
                                              (EXIT
                                               (|FS2UPS2;stateProblem|
                                                (SPADCALL |nm| (QREFELT % 185))
                                                #8# %))))
                                            (LETT |ord|
                                                  (SPADCALL |ups|
                                                            (QREFELT % 186)))
                                            (LETT |lc|
                                                  (SPADCALL |ups| |ord|
                                                            (QREFELT % 28)))
                                            (LETT |signum|
                                                  (SPADCALL |lc|
                                                            (QREFELT % 35)))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |signum| 1)
                                               (|FS2UPS2;stateProblem|
                                                (SPADCALL |nm| (QREFELT % 185))
                                                "branch problem" %))
                                              ((SPADCALL |signum| (CONS 0 -1)
                                                         (QREFELT % 187))
                                               (|FS2UPS2;stateProblem|
                                                (SPADCALL |nm| (QREFELT % 185))
                                                "negative argument" %))
                                              (#6#
                                               (SEQ
                                                (LETT |ups1|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|spadConstant| % 23)
                                                         |lc| (QREFELT % 146))
                                                        (SPADCALL |ord|
                                                                  (QREFELT %
                                                                           188))
                                                        (QREFELT % 67))
                                                       |ups| (QREFELT % 59)))
                                                (EXIT
                                                 (COND
                                                  ((EQUAL |nm| '|Ei|)
                                                   (|FS2UPS2;do_Ei0| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |ups| %))
                                                  ((EQUAL |nm| '|Ci|)
                                                   (|FS2UPS2;do_Ci0| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |ups| %))
                                                  ((EQUAL |nm| '|Chi|)
                                                   (|FS2UPS2;do_Chi0| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |ups| %))
                                                  ((EQUAL |nm| '|dilog|)
                                                   (|FS2UPS2;do_dilog0| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |ups| %))
                                                  (#6#
                                                   (|error|
                                                    "impossible"))))))))))
                                     (GO #7#)))
                                   ((SPADCALL |ord| (|spadConstant| % 79)
                                              (QREFELT % 29))
                                    (PROGN
                                     (LETT #2#
                                           (COND
                                            ((NULL (QVELT |opt_rec| 5))
                                             (|FS2UPS2;stateProblem|
                                              (SPADCALL |nm| (QREFELT % 185))
                                              #9="argument not Taylor" %))
                                            (#10='T
                                             (SEQ
                                              (LETT |lc|
                                                    (SPADCALL |ups| |ord|
                                                              (QREFELT % 28)))
                                              (LETT |signum|
                                                    (SPADCALL |lc|
                                                              (QREFELT % 35)))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |signum| 1)
                                                 (|FS2UPS2;stateProblem|
                                                  (SPADCALL |nm|
                                                            (QREFELT % 185))
                                                  #11="branch problem" %))
                                                ((SPADCALL |signum| (CONS 0 -1)
                                                           (QREFELT % 187))
                                                 (|FS2UPS2;stateProblem|
                                                  (SPADCALL |nm|
                                                            (QREFELT % 185))
                                                  #12="expansion at - infinity"
                                                  %))
                                                (#6#
                                                 (SEQ
                                                  (LETT |iups|
                                                        (SPADCALL |ups| -1
                                                                  (QREFELT %
                                                                           73)))
                                                  (EXIT
                                                   (COND
                                                    ((EQUAL |nm| '|%eis|)
                                                     (|FS2UPS2;do_eis| |iups|
                                                      %))
                                                    ((EQUAL |nm| '|%erfs|)
                                                     (|FS2UPS2;do_erfs| |iups|
                                                      %))
                                                    ((EQUAL |nm| '|%erfis|)
                                                     (|FS2UPS2;do_erfis| |iups|
                                                      %))
                                                    (#6#
                                                     (SEQ
                                                      (LETT |ups1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (|spadConstant|
                                                                % 23)
                                                               |lc|
                                                               (QREFELT % 146))
                                                              (SPADCALL |ord|
                                                                        (QREFELT
                                                                         %
                                                                         188))
                                                              (QREFELT % 67))
                                                             |ups|
                                                             (QREFELT % 59)))
                                                      (COND
                                                       ((EQUAL |nm| '|digamma|)
                                                        (EXIT
                                                         (|FS2UPS2;do_digamma|
                                                          |lc|
                                                          (SPADCALL |ord|
                                                                    (QREFELT %
                                                                             13))
                                                          (QVELT |opt_rec| 6)
                                                          |ups1| |iups| %)))
                                                       (|polygamma_n|
                                                        (COND
                                                         ((EQL |nn| 0)
                                                          (EXIT
                                                           (|FS2UPS2;do_digamma|
                                                            |lc|
                                                            (SPADCALL |ord|
                                                                      (QREFELT
                                                                       % 13))
                                                            (QVELT |opt_rec| 6)
                                                            |ups1| |iups|
                                                            %))))))
                                                      (EXIT
                                                       (COND
                                                        ((EQUAL |nm|
                                                                '|%logGamma|)
                                                         (|FS2UPS2;do_log_gamma|
                                                          |lc|
                                                          (SPADCALL |ord|
                                                                    (QREFELT %
                                                                             13))
                                                          (QVELT |opt_rec| 6)
                                                          |ups| |ups1| |iups|
                                                          %))
                                                        (|polygamma_n|
                                                         (|FS2UPS2;do_polygamma_n|
                                                          |nn| |iups|
                                                          %))))))))))))))))
                                     (GO #7#)))
                                   ((SPADCALL |ord| (|spadConstant| % 79)
                                              (QREFELT % 182))
                                    (COND
                                     ((EQUAL |nm| '|dilog|)
                                      (SEQ
                                       (LETT |lc|
                                             (SPADCALL |ups| |ord|
                                                       (QREFELT % 28)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |lc| (|spadConstant| % 23)
                                                    (QREFELT % 21))
                                          (PROGN
                                           (LETT #2#
                                                 (SEQ
                                                  (LETT |ups|
                                                        (SPADCALL
                                                         (|spadConstant| % 58)
                                                         |ups| (QREFELT % 80)))
                                                  (EXIT
                                                   (|FS2UPS2;do_polylog0|
                                                    (LIST
                                                     (SPADCALL
                                                      (SPADCALL 2
                                                                (QREFELT %
                                                                         143))
                                                      (QREFELT % 78))
                                                     |ups|)
                                                    (LIST (|spadConstant| % 55)
                                                          |ups|)
                                                    (LIST (|spadConstant| % 19)
                                                          (|spadConstant| %
                                                                          23))
                                                    (LIST
                                                     (SPADCALL 2
                                                               (QREFELT % 143))
                                                     (|spadConstant| % 19))
                                                    %))))
                                           (GO #7#)))))))))))))
                               ((SPADCALL |ord| (|spadConstant| % 79)
                                          (QREFELT % 29))
                                (PROGN
                                 (LETT #2#
                                       (COND
                                        ((NULL (QVELT |opt_rec| 5))
                                         (|FS2UPS2;stateProblem|
                                          (SPADCALL |nm| (QREFELT % 185)) #9#
                                          %))
                                        (#10#
                                         (SEQ
                                          (LETT |lc|
                                                (SPADCALL |ups| |ord|
                                                          (QREFELT % 28)))
                                          (LETT |signum|
                                                (SPADCALL |lc| (QREFELT % 35)))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |signum| 1)
                                             (|FS2UPS2;stateProblem|
                                              (SPADCALL |nm| (QREFELT % 185))
                                              #11# %))
                                            ((SPADCALL |signum| (CONS 0 -1)
                                                       (QREFELT % 187))
                                             (|FS2UPS2;stateProblem|
                                              (SPADCALL |nm| (QREFELT % 185))
                                              #12# %))
                                            (#6#
                                             (SEQ
                                              (LETT |iups|
                                                    (SPADCALL |ups| -1
                                                              (QREFELT % 73)))
                                              (EXIT
                                               (COND
                                                ((EQUAL |nm| '|%eis|)
                                                 (|FS2UPS2;do_eis| |iups| %))
                                                ((EQUAL |nm| '|%erfs|)
                                                 (|FS2UPS2;do_erfs| |iups| %))
                                                ((EQUAL |nm| '|%erfis|)
                                                 (|FS2UPS2;do_erfis| |iups| %))
                                                (#6#
                                                 (SEQ
                                                  (LETT |ups1|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|spadConstant| %
                                                                           23)
                                                           |lc|
                                                           (QREFELT % 146))
                                                          (SPADCALL |ord|
                                                                    (QREFELT %
                                                                             188))
                                                          (QREFELT % 67))
                                                         |ups| (QREFELT % 59)))
                                                  (COND
                                                   ((EQUAL |nm| '|digamma|)
                                                    (EXIT
                                                     (|FS2UPS2;do_digamma| |lc|
                                                      (SPADCALL |ord|
                                                                (QREFELT % 13))
                                                      (QVELT |opt_rec| 6)
                                                      |ups1| |iups| %)))
                                                   (|polygamma_n|
                                                    (COND
                                                     ((EQL |nn| 0)
                                                      (EXIT
                                                       (|FS2UPS2;do_digamma|
                                                        |lc|
                                                        (SPADCALL |ord|
                                                                  (QREFELT %
                                                                           13))
                                                        (QVELT |opt_rec| 6)
                                                        |ups1| |iups| %))))))
                                                  (EXIT
                                                   (COND
                                                    ((EQUAL |nm| '|%logGamma|)
                                                     (|FS2UPS2;do_log_gamma|
                                                      |lc|
                                                      (SPADCALL |ord|
                                                                (QREFELT % 13))
                                                      (QVELT |opt_rec| 6) |ups|
                                                      |ups1| |iups| %))
                                                    (|polygamma_n|
                                                     (|FS2UPS2;do_polygamma_n|
                                                      |nn| |iups|
                                                      %))))))))))))))))
                                 (GO #7#)))
                               ((SPADCALL |ord| (|spadConstant| % 79)
                                          (QREFELT % 182))
                                (COND
                                 ((EQUAL |nm| '|dilog|)
                                  (SEQ
                                   (LETT |lc|
                                         (SPADCALL |ups| |ord| (QREFELT % 28)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |lc| (|spadConstant| % 23)
                                                (QREFELT % 21))
                                      (PROGN
                                       (LETT #2#
                                             (SEQ
                                              (LETT |ups|
                                                    (SPADCALL
                                                     (|spadConstant| % 58)
                                                     |ups| (QREFELT % 80)))
                                              (EXIT
                                               (|FS2UPS2;do_polylog0|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL 2 (QREFELT % 143))
                                                  (QREFELT % 78))
                                                 |ups|)
                                                (LIST (|spadConstant| % 55)
                                                      |ups|)
                                                (LIST (|spadConstant| % 19)
                                                      (|spadConstant| % 23))
                                                (LIST
                                                 (SPADCALL 2 (QREFELT % 143))
                                                 (|spadConstant| % 19))
                                                %))))
                                       (GO #7#)))))))))))
                             ((SPADCALL |ord| (|spadConstant| % 79)
                                        (QREFELT % 29))
                              (PROGN
                               (LETT #2#
                                     (COND
                                      ((NULL (QVELT |opt_rec| 5))
                                       (|FS2UPS2;stateProblem|
                                        (SPADCALL |nm| (QREFELT % 185)) #9# %))
                                      (#10#
                                       (SEQ
                                        (LETT |lc|
                                              (SPADCALL |ups| |ord|
                                                        (QREFELT % 28)))
                                        (LETT |signum|
                                              (SPADCALL |lc| (QREFELT % 35)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |signum| 1)
                                           (|FS2UPS2;stateProblem|
                                            (SPADCALL |nm| (QREFELT % 185))
                                            #11# %))
                                          ((SPADCALL |signum| (CONS 0 -1)
                                                     (QREFELT % 187))
                                           (|FS2UPS2;stateProblem|
                                            (SPADCALL |nm| (QREFELT % 185))
                                            #12# %))
                                          (#6#
                                           (SEQ
                                            (LETT |iups|
                                                  (SPADCALL |ups| -1
                                                            (QREFELT % 73)))
                                            (EXIT
                                             (COND
                                              ((EQUAL |nm| '|%eis|)
                                               (|FS2UPS2;do_eis| |iups| %))
                                              ((EQUAL |nm| '|%erfs|)
                                               (|FS2UPS2;do_erfs| |iups| %))
                                              ((EQUAL |nm| '|%erfis|)
                                               (|FS2UPS2;do_erfis| |iups| %))
                                              (#6#
                                               (SEQ
                                                (LETT |ups1|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|spadConstant| % 23)
                                                         |lc| (QREFELT % 146))
                                                        (SPADCALL |ord|
                                                                  (QREFELT %
                                                                           188))
                                                        (QREFELT % 67))
                                                       |ups| (QREFELT % 59)))
                                                (COND
                                                 ((EQUAL |nm| '|digamma|)
                                                  (EXIT
                                                   (|FS2UPS2;do_digamma| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups1|
                                                    |iups| %)))
                                                 (|polygamma_n|
                                                  (COND
                                                   ((EQL |nn| 0)
                                                    (EXIT
                                                     (|FS2UPS2;do_digamma| |lc|
                                                      (SPADCALL |ord|
                                                                (QREFELT % 13))
                                                      (QVELT |opt_rec| 6)
                                                      |ups1| |iups| %))))))
                                                (EXIT
                                                 (COND
                                                  ((EQUAL |nm| '|%logGamma|)
                                                   (|FS2UPS2;do_log_gamma| |lc|
                                                    (SPADCALL |ord|
                                                              (QREFELT % 13))
                                                    (QVELT |opt_rec| 6) |ups|
                                                    |ups1| |iups| %))
                                                  (|polygamma_n|
                                                   (|FS2UPS2;do_polygamma_n|
                                                    |nn| |iups|
                                                    %))))))))))))))))
                               (GO #7#)))
                             ((SPADCALL |ord| (|spadConstant| % 79)
                                        (QREFELT % 182))
                              (COND
                               ((EQUAL |nm| '|dilog|)
                                (SEQ
                                 (LETT |lc|
                                       (SPADCALL |ups| |ord| (QREFELT % 28)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |lc| (|spadConstant| % 23)
                                              (QREFELT % 21))
                                    (PROGN
                                     (LETT #2#
                                           (SEQ
                                            (LETT |ups|
                                                  (SPADCALL
                                                   (|spadConstant| % 58) |ups|
                                                   (QREFELT % 80)))
                                            (EXIT
                                             (|FS2UPS2;do_polylog0|
                                              (LIST
                                               (SPADCALL
                                                (SPADCALL 2 (QREFELT % 143))
                                                (QREFELT % 78))
                                               |ups|)
                                              (LIST (|spadConstant| % 55)
                                                    |ups|)
                                              (LIST (|spadConstant| % 19)
                                                    (|spadConstant| % 23))
                                              (LIST
                                               (SPADCALL 2 (QREFELT % 143))
                                               (|spadConstant| % 19))
                                              %))))
                                     (GO #7#))))))))))))))))))
                (LETT |aresu| (|FS2UPS2;handle_args| |args| |opt_rec| %))
                (EXIT
                 (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
                       (#6#
                        (SEQ (LETT |ares| (QCDR |aresu|))
                             (LETT |losers| (QVELT |ares| 0))
                             (LETT |lsers| (QVELT |ares| 1))
                             (LETT |lsere| (QVELT |ares| 2))
                             (LETT |lser0| (QVELT |ares| 3))
                             (LETT |nm| (SPADCALL |ker| (QREFELT % 181)))
                             (COND
                              ((OR (EQUAL |nm| '|besselI|)
                                   (EQUAL |nm| '|besselK|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT % 100))
                                   (|spadConstant| % 19) (QREFELT % 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at 0" %))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;besselEqm|) %)
                                   %))))))
                             (COND
                              ((OR (EQUAL |nm| '|besselJ|)
                                   (OR (EQUAL |nm| '|besselY|)
                                       (OR (EQUAL |nm| '|hankelH1|)
                                           (EQUAL |nm| '|hankelH2|))))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT % 100))
                                   (|spadConstant| % 19) (QREFELT % 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at 0" %))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;besselEq|) %)
                                   %))))))
                             (COND
                              ((OR (EQUAL |nm| '|kummerM|)
                                   (EQUAL |nm| '|kummerU|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 3 (QREFELT % 100))
                                   (|spadConstant| % 19) (QREFELT % 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at 0" %))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;kummerEq|) %)
                                   %))))))
                             (COND
                              ((OR (EQUAL |nm| '|whittakerM|)
                                   (EQUAL |nm| '|whittakerW|))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 3 (QREFELT % 100))
                                   (|spadConstant| % 19) (QREFELT % 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at 0" %))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;whittakerEq|) %)
                                   %))))))
                             (COND
                              ((OR (EQUAL |nm| '|kelvinBer|)
                                   (OR (EQUAL |nm| '|kelvinBei|)
                                       (OR (EQUAL |nm| '|kelvinKer|)
                                           (EQUAL |nm| '|kelvinKei|))))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |lser0| 2 (QREFELT % 100))
                                   (|spadConstant| % 19) (QREFELT % 21))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at 0" %))
                                 (#6#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;kelvinEq|) %)
                                   %))))))
                             (COND
                              ((OR (EQUAL |nm| '|legendreP|)
                                   (EQUAL |nm| '|legendreQ|))
                               (EXIT
                                (COND
                                 ((OR
                                   (SPADCALL
                                    (SPADCALL |lser0| 3 (QREFELT % 100))
                                    (|spadConstant| % 23) (QREFELT % 21))
                                   (SPADCALL
                                    (SPADCALL |lser0| 3 (QREFELT % 100))
                                    (SPADCALL (|spadConstant| % 23)
                                              (QREFELT % 176))
                                    (QREFELT % 21)))
                                  (|FS2UPS2;stateProblem|
                                   (SPADCALL |nm| (QREFELT % 185))
                                   "expansion at +-1" %))
                                 (#10#
                                  (|FS2UPS2;do_diff_eq| |ker| |losers| |lsers|
                                   |lsere| |lser0|
                                   (CONS (|function| |FS2UPS2;legendreEq|) %)
                                   %))))))
                             (COND
                              ((EQUAL |nm| '|Beta3|)
                               (COND
                                ((SPADCALL (SPADCALL |lser0| 1 (QREFELT % 100))
                                           (|spadConstant| % 19)
                                           (QREFELT % 21))
                                 (EXIT
                                  (|FS2UPS2;stateProblem| "Beta"
                                   "expansion at 0" %))))))
                             (COND
                              ((EQUAL |nm| '|lambertW|)
                               (COND
                                ((SPADCALL (SPADCALL |lser0| 1 (QREFELT % 100))
                                           (|spadConstant| % 19)
                                           (QREFELT % 21))
                                 (EXIT
                                  (CONS 0
                                        (|FS2UPS2;lambertW0|
                                         (SPADCALL |losers| 1 (QREFELT % 95))
                                         %)))))))
                             (EXIT
                              (COND
                               ((EQUAL |nm| '|jacobiSn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 189) %))
                               ((EQUAL |nm| '|jacobiCn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 190) %))
                               ((EQUAL |nm| '|jacobiDn|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 191) %))
                               ((EQUAL |nm| '|ellipticE2|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 192) %))
                               ((EQUAL |nm| '|ellipticF|)
                                (|FS2UPS2;do_ell2| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 193) %))
                               ((EQUAL |nm| '|ellipticPi|)
                                (|FS2UPS2;do_ell3| |losers| |lsers| |lsere|
                                 |lser0| (ELT % 194) %))
                               (#6#
                                (SEQ
                                 (COND
                                  ((EQUAL |nm| '|weierstrassP|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT % 100))
                                      (|spadConstant| % 19) (QREFELT % 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT % 195) -2 1
                                       |opt_rec| %))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassPPrime|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT % 100))
                                      (|spadConstant| % 19) (QREFELT % 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT % 196) -3
                                       -2 |opt_rec| %))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassZeta|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT % 100))
                                      (|spadConstant| % 19) (QREFELT % 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT % 197) -1 1
                                       |opt_rec| %))))))
                                 (COND
                                  ((EQUAL |nm| '|weierstrassSigma|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 3 (QREFELT % 100))
                                      (|spadConstant| % 19) (QREFELT % 21))
                                     (EXIT
                                      (|FS2UPS2;do_weierstrass| |losers|
                                       |lsers| |lsere| |lser0| (ELT % 198) 0 0
                                       |opt_rec| %))))))
                                 (COND
                                  ((EQUAL |nm| '|polylog|)
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |lser0| 2 (QREFELT % 100))
                                      (|spadConstant| % 19) (QREFELT % 21))
                                     (EXIT
                                      (|FS2UPS2;do_polylog0| |losers| |lsers|
                                       |lsere| |lser0| %))))))
                                 (COND
                                  ((EQUAL |nm| '|Gamma|)
                                   (SEQ
                                    (LETT |ir|
                                          (SPADCALL
                                           (SPADCALL |lser0| 1 (QREFELT % 100))
                                           (QREFELT % 200)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ir| 0)
                                       (SEQ
                                        (LETT |ii|
                                              (SPADCALL (QCDR |ir|)
                                                        (QREFELT % 201)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |ii| 0)
                                           (COND
                                            ((<= (QCDR |ii|) 0)
                                             (SEQ
                                              (LETT |arg1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT % 100)))
                                              (LETT |narg1|
                                                    (SPADCALL
                                                     (|spadConstant| % 23)
                                                     |arg1| (QREFELT % 202)))
                                              (LETT |nker|
                                                    (SPADCALL
                                                     (SPADCALL |ker|
                                                               (QREFELT % 119))
                                                     (LIST |narg1|)
                                                     (QREFELT % 121)))
                                              (LETT |nexpr|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT % 141))
                                                     (SPADCALL |nker|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT %
                                                                           141))
                                                                 |arg1|
                                                                 (QREFELT %
                                                                          144))
                                                                (QREFELT %
                                                                         203))
                                                               (QREFELT % 144))
                                                     (QREFELT % 146)))
                                              (EXIT
                                               (PROGN
                                                (LETT #2#
                                                      (|FS2UPS2;i_expr_to_PS|
                                                       |nexpr| |opt_rec| %))
                                                (GO #7#))))))))))))))))
                                 (LETT |cargs|
                                       (|FS2UPS2;convert_args| |lsers| |lsere|
                                        |lser0| %))
                                 (LETT |nargs| (QVELT |cargs| 0))
                                 (LETT |nker|
                                       (SPADCALL
                                        (SPADCALL |ker| (QREFELT % 119))
                                        |nargs| (QREFELT % 121)))
                                 (EXIT
                                  (|FS2UPS2;do_taylor_via_deriv2| |nker|
                                   (QVELT |cargs| 2) (QVELT |cargs| 1)
                                   %))))))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;atan1;2UPS;55| ((|ups| (UPS)) (% (UPS)))
        (SPROG ((|yCoef| (FE)) (|y| (UPS)))
               (SEQ
                (LETT |y|
                      (SPADCALL (SPADCALL |ups| (QREFELT % 205))
                                (SPADCALL (|spadConstant| % 58)
                                          (SPADCALL |ups| |ups| (QREFELT % 59))
                                          (QREFELT % 56))
                                (QREFELT % 206)))
                (LETT |yCoef|
                      (SPADCALL |y|
                                (SPADCALL (|spadConstant| % 111)
                                          (QREFELT % 188))
                                (QREFELT % 28)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |yCoef| (QREFELT % 145))
                            (|spadConstant| % 79) (QREFELT % 67))
                  (SPADCALL
                   (SPADCALL |y|
                             (SPADCALL |yCoef|
                                       (SPADCALL (|spadConstant| % 111)
                                                 (QREFELT % 188))
                                       (QREFELT % 67))
                             (QREFELT % 80))
                   (QREFELT % 207))
                  (QREFELT % 56)))))) 

(SDEFUN |FS2UPS2;integ;2UPS;56| ((|f| (UPS)) (% (UPS)))
        (SPADCALL |f| (QREFELT % 207))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;57| ((|f| (UPS)) (|xs| (UPS)) (% (UPS)))
        (SPADCALL (SPADCALL (SPADCALL |xs| (QREFELT % 205)) |f| (QREFELT % 59))
                  (QREFELT % 207))) 

(PUT '|FS2UPS2;atan1;2UPS;58| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(SDEFUN |FS2UPS2;atan1;2UPS;58| ((|ups| (UPS)) (% (UPS)))
        (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;59| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ;2UPS;59| ((|f| (UPS)) (% (UPS)))
        (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;60| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;60| ((|f| (UPS)) (|xs| (UPS)) (% (UPS)))
        (|error| "integ_df called, but no integrate")) 

(PUT '|FS2UPS2;atan1;2UPS;61| '|SPADreplace|
     '(XLAM (|ups|) (|error| "atan1 called, but no integrate"))) 

(SDEFUN |FS2UPS2;atan1;2UPS;61| ((|ups| (UPS)) (% (UPS)))
        (|error| "atan1 called, but no integrate")) 

(PUT '|FS2UPS2;integ;2UPS;62| '|SPADreplace|
     '(XLAM (|f|) (|error| "integ called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ;2UPS;62| ((|f| (UPS)) (% (UPS)))
        (|error| "integ called, but no integrate")) 

(PUT '|FS2UPS2;integ_df;3UPS;63| '|SPADreplace|
     '(XLAM (|f| |xs|) (|error| "integ_df called, but no integrate"))) 

(SDEFUN |FS2UPS2;integ_df;3UPS;63| ((|f| (UPS)) (|xs| (UPS)) (% (UPS)))
        (|error| "integ_df called, but no integrate")) 

(SDEFUN |FS2UPS2;do_prim|
        ((|ker| (|Kernel| FE)) (|arg0| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G1337 NIL)
          (|ns|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|nf| (FE)) (|c0| (FE)))
         (SEQ
          (EXIT
           (COND
            ((QREFELT % 204)
             (SEQ
              (LETT |c0|
                    (SPADCALL (SPADCALL |ker| (QREFELT % 119)) |arg0|
                              (QREFELT % 211)))
              (LETT |nf|
                    (SPADCALL (SPADCALL |ker| (QREFELT % 213)) (QREFELT % 14)
                              (QREFELT % 81)))
              (LETT |ns| (|FS2UPS2;i_expr_to_PS| |nf| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |ns| 1) (PROGN (LETT #2# |ns|) (GO #3=#:G1336)))
                     (#4='T
                      (CONS 0
                            (SPADCALL (SPADCALL |c0| (QREFELT % 78))
                                      (SPADCALL (CDR |ns|) (QREFELT % 209))
                                      (QREFELT % 56))))))))
            (#4#
             (|FS2UPS2;spec_to_UPS| |ker| (SPADCALL |ker| (QREFELT % 214))
              |opt_rec| %))))
          #3# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;prim_to_UPS|
        ((|ker| (|Kernel| FE)) (|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|coef| (FE)) (#2=#:G1363 NIL) (|ups| (UPS)) (#3=#:G408 NIL)
          (|nsu|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|arg| (FE)) (|nm| (|Symbol|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nm| (SPADCALL |ker| (QREFELT % 181)))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 1 (QREFELT % 215))
                   (|FS2UPS2;stateProblem| (SPADCALL |nm| (QREFELT % 185))
                    "multivariate primitive" %))
                  (#4='T
                   (SEQ (LETT |arg| (|SPADfirst| |args|))
                        (LETT |nsu| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
                        (EXIT
                         (COND
                          ((QEQCAR |nsu| 1)
                           (PROGN (LETT #2# |nsu|) (GO #5=#:G1362)))
                          (#4#
                           (SEQ
                            (LETT |ups|
                                  (PROG2 (LETT #3# |nsu|)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (QREFELT % 9)
                                                    (|Union|
                                                     (|:| |%series|
                                                          (QREFELT % 9))
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
                                (SPADCALL |ups| (|spadConstant| % 79)
                                          (QREFELT % 32))
                                (|spadConstant| % 79) (QREFELT % 29))
                               (PROGN
                                (LETT #2#
                                      (|FS2UPS2;stateProblem| "handle_args"
                                       "argument not Taylor" %))
                                (GO #5#)))
                              (#4#
                               (SEQ
                                (LETT |coef|
                                      (SPADCALL |ups| (|spadConstant| % 79)
                                                (QREFELT % 28)))
                                (COND
                                 ((OR (EQUAL |nm| '|Ei|)
                                      (OR (EQUAL |nm| '|Ci|)
                                          (OR (EQUAL |nm| '|Chi|)
                                              (EQUAL |nm| '|dilog|))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| % 19)
                                               (QREFELT % 21))
                                     (SEQ
                                      (COND
                                       ((QREFELT % 159)
                                        (COND
                                         ((QVELT |opt_rec| 5)
                                          (EXIT
                                           (|FS2UPS2;spec_to_UPS| |ker|
                                            (SPADCALL |ker| (QREFELT % 214))
                                            |opt_rec| %))))))
                                      (EXIT
                                       (|FS2UPS2;stateProblem|
                                        (SPADCALL |nm| (QREFELT % 185))
                                        "expansion at 0" %))))
                                    (#4#
                                     (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                      %))))))
                                (EXIT
                                 (COND
                                  ((EQUAL |nm| '|li|)
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| % 19)
                                               (QREFELT % 21))
                                     (|FS2UPS2;stateProblem|
                                      (SPADCALL |nm| (QREFELT % 185))
                                      "expansion at 0" %))
                                    ((SPADCALL |coef| (|spadConstant| % 23)
                                               (QREFELT % 21))
                                     (|FS2UPS2;stateProblem|
                                      (SPADCALL |nm| (QREFELT % 185))
                                      "expansion at 1" %))
                                    (#4#
                                     (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                      %))))
                                  ((OR (EQUAL |nm| '|Si|)
                                       (OR (EQUAL |nm| '|Shi|)
                                           (OR (EQUAL |nm| '|erf|)
                                               (OR (EQUAL |nm| '|erfi|)
                                                   (OR (EQUAL |nm| '|fresnelS|)
                                                       (EQUAL |nm|
                                                              '|fresnelC|))))))
                                   (|FS2UPS2;do_prim| |ker| |coef| |opt_rec|
                                    %))
                                  ('T
                                   (|FS2UPS2;stateProblem|
                                    (SPADCALL (SPADCALL |ker| (QREFELT % 181))
                                              (QREFELT % 185))
                                    "unimplemented" %))))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;unknown_to_UPS|
        ((|ker| (|Kernel| FE)) (|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|nker| (FE)) (|nargs| (|List| FE))
          (|cargs|
           (|Record| (|:| |nargs0| (|List| FE)) (|:| |sers| (|List| UPS))
                     (|:| |syms| (|List| (|Symbol|)))))
          (|lser0| (|List| FE)) (|lsere| (|List| FE)) (|lsers| (|List| UPS))
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
         (SEQ (LETT |aresu| (|FS2UPS2;handle_args| |args| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |aresu| 1) (QCDR |aresu|))
                     ('T
                      (SEQ (LETT |ares| (QCDR |aresu|))
                           (LETT |lsers| (QVELT |ares| 1))
                           (LETT |lsere| (QVELT |ares| 2))
                           (LETT |lser0| (QVELT |ares| 3))
                           (LETT |cargs|
                                 (|FS2UPS2;convert_args| |lsers| |lsere|
                                  |lser0| %))
                           (LETT |nargs| (QVELT |cargs| 0))
                           (LETT |nker|
                                 (SPADCALL (SPADCALL |ker| (QREFELT % 119))
                                           |nargs| (QREFELT % 121)))
                           (EXIT
                            (|FS2UPS2;do_taylor_via_deriv2| |nker|
                             (QVELT |cargs| 2) (QVELT |cargs| 1) %))))))))) 

(SDEFUN |FS2UPS2;kernel1_to_UPS|
        ((|ker| (|Kernel| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G1377 NIL) (|n| (|Integer|)) (|arg| (FE))
          (|op| (|BasicOperator|)) (|args| (|List| FE)))
         (SEQ (LETT |args| (SPADCALL |ker| (QREFELT % 214)))
              (LETT |op| (SPADCALL |ker| (QREFELT % 119)))
              (EXIT
               (COND
                ((SPADCALL |op| '|special| (QREFELT % 216))
                 (|FS2UPS2;spec_to_UPS| |ker| |args| |opt_rec| %))
                ((SPADCALL |op| '|prim| (QREFELT % 216))
                 (|FS2UPS2;prim_to_UPS| |ker| |args| |opt_rec| %))
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT % 217))
                         (|FS2UPS2;nthRootToUPS|
                          (SPADCALL |arg| |arg| (QREFELT % 144)) 2 |opt_rec|
                          %))
                        ((SPADCALL |ker| '|%paren| (QREFELT % 217))
                         (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
                        ((SPADCALL |ker| '|log| (QREFELT % 217))
                         (|FS2UPS2;logToUPS| |arg| |opt_rec| %))
                        ((SPADCALL |ker| '|exp| (QREFELT % 217))
                         (|FS2UPS2;applyIfCan| (ELT % 218) |arg| "exp"
                          |opt_rec| %))
                        (#3='T
                         (|FS2UPS2;tranToUPS| |ker| |arg| |opt_rec| %))))))
                ((SPADCALL |ker| '|%power| (QREFELT % 217))
                 (SPADCALL |args| |opt_rec| (QREFELT % 222)))
                ((SPADCALL |ker| '|nthRoot| (QREFELT % 217))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT % 223))
                                  (QREFELT % 224)))
                  (EXIT
                   (|FS2UPS2;nthRootToUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #2# |n|)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    |opt_rec| %))))
                (#3# (|FS2UPS2;unknown_to_UPS| |ker| |args| |opt_rec| %))))))) 

(SDEFUN |FS2UPS2;kernelToUPS|
        ((|ker| (|Kernel| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|res1|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (#2=#:G1399 NIL) (#3=#:G1400 NIL) (|cr| NIL) (|args| (|List| FE))
          (|sym| (|Union| (|Symbol|) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |sym| (SPADCALL |ker| (QREFELT % 226)))
                (EXIT
                 (COND
                  ((QEQCAR |sym| 0)
                   (COND
                    ((EQUAL (QCDR |sym|) (QREFELT % 14))
                     (CONS 0
                           (SPADCALL (|spadConstant| % 23)
                                     (|spadConstant| % 111) (QREFELT % 67))))
                    ('T
                     (CONS 0
                           (SPADCALL (SPADCALL |ker| (QREFELT % 213))
                                     (|spadConstant| % 79) (QREFELT % 67))))))
                  ((OR (NULL (LETT |args| (SPADCALL |ker| (QREFELT % 214))))
                       (NULL
                        (SPADCALL (QREFELT % 14)
                                  (SPADCALL (SPADCALL |ker| (QREFELT % 213))
                                            (QREFELT % 76))
                                  (QREFELT % 77))))
                   (CONS 0
                         (SPADCALL (SPADCALL |ker| (QREFELT % 213))
                                   (|spadConstant| % 79) (QREFELT % 67))))
                  ('T
                   (SEQ
                    (SEQ (LETT |cr| NIL) (LETT #3# (QVELT |opt_rec| 7)) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |cr| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ker| (QCAR |cr|) (QREFELT % 227))
                             (PROGN (LETT #2# (QCDR |cr|)) (GO #4=#:G1398))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (LETT |res1| (|FS2UPS2;kernel1_to_UPS| |ker| |opt_rec| %))
                    (QSETVELT |opt_rec| 7
                              (CONS (CONS |ker| |res1|) (QVELT |opt_rec| 7)))
                    (EXIT |res1|)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;nthRootToUPS|
        ((|arg| (FE)) (|n| (|NonNegativeInteger|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
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
         (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |result| 1) |result|)
                     (#2='T
                      (SEQ
                       (LETT |ans|
                             (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                              |opt_rec| NIL %))
                       (EXIT
                        (COND ((QEQCAR |ans| 1) |ans|)
                              (#2# (CONS 0 (CDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;logToUPS|
        ((|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|logTerm| (FE)) (|lt| (UPS)) (#2=#:G1421 NIL) (#3=#:G1429 NIL)
          (#4=#:G1428 NIL) (|signum| (|Union| (|Integer|) "failed"))
          (#5=#:G1427 NIL) (|coef| (FE)) (|deg| (|Expon|)) (|ups| (UPS))
          (|deg1| (|Expon|)) (#6=#:G408 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#7='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #6# |result|)
                                     (QCDR #6#)
                                   (|check_union2| (QEQCAR #6# 0) (QREFELT % 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT % 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #6#)))
                           (LETT |deg| (SPADCALL |ups| (QREFELT % 24)))
                           (LETT |deg1|
                                 (SPADCALL |deg|
                                           (SPADCALL (QREFELT % 15)
                                                     (QREFELT % 26))
                                           (QREFELT % 27)))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND
                                    ((|FS2UPS2;check_zero|
                                      (LETT |coef|
                                            (SPADCALL |ups| |deg|
                                                      (QREFELT % 28)))
                                      |opt_rec| %)
                                     (SPADCALL |deg| |deg1| (QREFELT % 29)))
                                    ('T NIL)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| % 19)
                                               (QREFELT % 30))
                                     (LETT |ups|
                                           (SPADCALL |ups| (QREFELT % 31)))))
                                   (LETT |deg|
                                         (SPADCALL |ups| |deg1|
                                                   (QREFELT % 32)))
                                   (LETT |coef|
                                         (SPADCALL |ups| |deg| (QREFELT % 28)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |coef| (|spadConstant| % 19)
                                                (QREFELT % 21))
                                      (PROGN
                                       (LETT #5#
                                             (|error|
                                              "log of series with many leading zero coefficients"))
                                       (GO #8=#:G1409)))))))
                                 #8# (EXIT #5#))
                                NIL (GO G190) G191 (EXIT NIL))
                           (COND
                            ((NULL (QVELT |opt_rec| 5))
                             (COND
                              ((NULL (SPADCALL |deg| (QREFELT % 36)))
                               (EXIT
                                (|FS2UPS2;stateProblem| "log"
                                 "series of non-zero order" %))))))
                           (COND
                            ((QVELT |opt_rec| 0)
                             (SEQ
                              (LETT |signum| (SPADCALL |coef| (QREFELT % 35)))
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
                                                  %))
                                           (GO #9=#:G1426)))
                                    (GO #10=#:G1424))))))))))
                           (COND
                            ((NULL
                              (|FS2UPS2;check_inverse| |coef| |opt_rec| %))
                             (PROGN
                              (LETT #3#
                                    (|FS2UPS2;stateProblem| "log"
                                     "need to invert bad coefficient" %))
                              (GO #9#))))
                           (EXIT
                            (COND
                             ((SPADCALL |deg| (QREFELT % 36))
                              (CONS 0
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |ups| (QREFELT % 228)))
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT % 9)
                                                      (|Union| (QREFELT % 9)
                                                               "failed")
                                                      #2#))))
                             (#7#
                              (SEQ
                               (LETT |lt|
                                     (SPADCALL |coef| |deg| (QREFELT % 67)))
                               (LETT |logTerm|
                                     (SPADCALL
                                      (SPADCALL |coef| (QREFELT % 145))
                                      (SPADCALL (SPADCALL |deg| (QREFELT % 13))
                                                (QVELT |opt_rec| 6)
                                                (QREFELT % 144))
                                      (QREFELT % 94)))
                               (EXIT
                                (CONS 0
                                      (SPADCALL
                                       (SPADCALL |logTerm|
                                                 (|spadConstant| % 79)
                                                 (QREFELT % 67))
                                       (SPADCALL
                                        (SPADCALL |ups| |lt| (QREFELT % 206))
                                        (QREFELT % 158))
                                       (QREFELT % 56))))))))))
                         #10# (EXIT #4#)))))))
          #9# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;localAbs;2FE;71| ((|fcn| (FE)) (% (FE)))
        (SPADCALL |fcn| (QREFELT % 229))) 

(SDEFUN |FS2UPS2;localAbs;2FE;72| ((|fcn| (FE)) (% (FE)))
        (SPADCALL (SPADCALL |fcn| |fcn| (QREFELT % 144)) (QREFELT % 150))) 

(SDEFUN |FS2UPS2;signOfExpression| ((|arg| (FE)) (% (FE)))
        (SPADCALL (SPADCALL |arg| (QREFELT % 230)) |arg| (QREFELT % 146))) 

(SDEFUN |FS2UPS2;atanacot2|
        ((|ups| (UPS)) (|coef| (FE)) (|ord| (|Expon|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         #1=(|Union| "complex" "real: two sides"
                                     "real: left side" "real: right side"
                                     "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (|plusMinus| (|Integer|))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|cc| (FE)) (|n| (|Integer|)) (|left?| (|Boolean|))
          (|posNegPi2| (FE)) (|signum| (|Union| (|Integer|) "failed"))
          (|lc| (FE)) (#3=#:G1455 NIL)
          (|rn| (|Union| (|Fraction| (|Integer|)) "failed")) (|atanFlag| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |atanFlag| (QVELT |opt_rec| 1))
                (LETT |cc|
                      (COND
                       ((SPADCALL |ord| (|spadConstant| % 79) (QREFELT % 29))
                        (COND
                         ((SPADCALL |atanFlag| (CONS 0 "complex")
                                    (QREFELT % 231))
                          (PROGN
                           (LETT #3#
                                 (|FS2UPS2;stateProblem| "atan"
                                  "essential singularity" %))
                           (GO #4=#:G1454)))
                         (#5='T
                          (SEQ
                           (LETT |rn|
                                 (|FS2UPS2;ratIfCan|
                                  (SPADCALL |ord| (QREFELT % 13)) %))
                           (EXIT
                            (COND
                             ((QEQCAR |rn| 1)
                              (PROGN
                               (LETT #3#
                                     (|FS2UPS2;stateProblem| "atan"
                                      "branch problem" %))
                               (GO #4#)))
                             (#5#
                              (SEQ
                               (COND
                                ((SPADCALL |atanFlag|
                                           (CONS 1 "real: two sides")
                                           (QREFELT % 231))
                                 (COND
                                  ((ODDP
                                    (SPADCALL (QCDR |rn|) (QREFELT % 232)))
                                   (PROGN
                                    (LETT #3#
                                          (|FS2UPS2;stateProblem| "atan"
                                           "branch problem" %))
                                    (GO #4#))))))
                               (LETT |lc|
                                     (SPADCALL |ups| |ord| (QREFELT % 28)))
                               (LETT |signum| (SPADCALL |lc| (QREFELT % 35)))
                               (EXIT
                                (COND
                                 ((QEQCAR |signum| 1)
                                  (COND
                                   ((SPADCALL |atanFlag| (CONS 4 "just do it")
                                              (QREFELT % 231))
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL (SPADCALL (QREFELT % 141))
                                                (SPADCALL 2 (QREFELT % 143))
                                                (QREFELT % 146)))
                                     (#5# (|spadConstant| % 19))))
                                   (#5#
                                    (SEQ
                                     (LETT |posNegPi2|
                                           (SPADCALL
                                            (SPADCALL
                                             (|FS2UPS2;signOfExpression| |lc|
                                              %)
                                             (SPADCALL (QREFELT % 141))
                                             (QREFELT % 144))
                                            (SPADCALL 2 (QREFELT % 143))
                                            (QREFELT % 146)))
                                     (EXIT
                                      (COND ((EQL |plusMinus| 1) |posNegPi2|)
                                            (#5#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QREFELT % 141))
                                               (SPADCALL 2 (QREFELT % 143))
                                               (QREFELT % 146))
                                              |posNegPi2|
                                              (QREFELT % 202)))))))))
                                 (#5#
                                  (SEQ
                                   (LETT |left?|
                                         (SPADCALL |atanFlag|
                                                   (CONS 2 "real: left side")
                                                   (QREFELT % 231)))
                                   (LETT |n| (QCDR |signum|))
                                   (COND
                                    (|left?|
                                     (COND
                                      ((EQL |n| 1)
                                       (EXIT
                                        (COND
                                         ((EQL |plusMinus| 1)
                                          (SPADCALL
                                           (SPADCALL (SPADCALL (QREFELT % 141))
                                                     (SPADCALL 2
                                                               (QREFELT % 143))
                                                     (QREFELT % 146))
                                           (QREFELT % 176)))
                                         (#5# (SPADCALL (QREFELT % 141))))))
                                      ((NULL |left?|)
                                       (COND
                                        ((EQL |n| -1)
                                         (EXIT
                                          (COND
                                           ((EQL |plusMinus| 1)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QREFELT % 141))
                                              (SPADCALL 2 (QREFELT % 143))
                                              (QREFELT % 146))
                                             (QREFELT % 176)))
                                           (#5#
                                            (SPADCALL (QREFELT % 141))))))))))
                                    ((EQL |n| -1)
                                     (EXIT
                                      (COND
                                       ((EQL |plusMinus| 1)
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT % 141))
                                                   (SPADCALL 2 (QREFELT % 143))
                                                   (QREFELT % 146))
                                         (QREFELT % 176)))
                                       (#5# (SPADCALL (QREFELT % 141)))))))
                                   (EXIT
                                    (COND
                                     ((EQL |plusMinus| 1)
                                      (SPADCALL (SPADCALL (QREFELT % 141))
                                                (SPADCALL 2 (QREFELT % 143))
                                                (QREFELT % 146)))
                                     (#5# (|spadConstant| % 19))))))))))))))))
                       ((EQL |plusMinus| 1) (SPADCALL |coef| (QREFELT % 233)))
                       (#5# (SPADCALL |coef| (QREFELT % 234)))))
                (EXIT
                 (CONS 0
                       (SPADCALL (SPADCALL |cc| (QREFELT % 78))
                                 (SPADCALL
                                  (SPADCALL |plusMinus|
                                            (SPADCALL (|spadConstant| % 58)
                                                      (SPADCALL
                                                       (|spadConstant| % 58)
                                                       (SPADCALL |ups| |ups|
                                                                 (QREFELT %
                                                                          59))
                                                       (QREFELT % 56))
                                                      (QREFELT % 206))
                                            (QREFELT % 131))
                                  |ups| (QREFELT % 210))
                                 (QREFELT % 56))))))
          #4# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;atancotToUPS|
        ((|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (|plusMinus| (|Integer|))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|res1| (|Union| UPS "failed")) (#2=#:G1466 NIL) (#3=#:G1467 NIL)
          (|ord| (|Expon|)) (|coef| (FE)) (|ups| (UPS)) (#4=#:G408 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#5='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |result|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT % 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT % 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |coef|
                                 (SPADCALL |ups| (|spadConstant| % 79)
                                           (QREFELT % 28)))
                           (SEQ
                            (LETT |ord|
                                  (SPADCALL |ups| (|spadConstant| % 79)
                                            (QREFELT % 32)))
                            (EXIT
                             (COND
                              ((SPADCALL |ord| (|spadConstant| % 79)
                                         (QREFELT % 182))
                               (COND
                                ((SPADCALL
                                  (SPADCALL |coef| |coef| (QREFELT % 144))
                                  (SPADCALL (|spadConstant| % 23)
                                            (QREFELT % 176))
                                  (QREFELT % 21))
                                 (PROGN
                                  (LETT #2#
                                        (PROGN
                                         (LETT #3#
                                               (|FS2UPS2;stateProblem| "atan"
                                                "logarithmic singularity" %))
                                         (GO #6=#:G1465)))
                                  (GO #7=#:G1463))))))))
                           (EXIT
                            (COND
                             ((QREFELT % 204)
                              (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                               |plusMinus| %))
                             ((SPADCALL |ord| (|spadConstant| % 79)
                                        (QREFELT % 29))
                              (|FS2UPS2;stateProblem| "atan"
                               "argument of negative order" %))
                             (#5#
                              (SEQ
                               (LETT |res1|
                                     (COND
                                      ((EQL |plusMinus| 1)
                                       (SPADCALL |ups| (QREFELT % 235)))
                                      (#5# (SPADCALL |ups| (QREFELT % 236)))))
                               (EXIT
                                (COND
                                 ((QEQCAR |res1| 1)
                                  (|FS2UPS2;stateProblem| "atan" "failed" %))
                                 (#5# (CONS 0 (QCDR |res1|)))))))))))
                         #7# (EXIT #2#)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;applyIfCan|
        ((|fcn| (|Mapping| #1=(|Union| UPS "failed") UPS)) (|arg| (FE))
         (|fcnName| (|String|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ans| #1#)
          (|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;i_expr_to_PS| |arg| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |ups| 1) |ups|)
                     (#3='T
                      (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|))
                           (EXIT
                            (COND
                             ((QEQCAR |ans| 1)
                              (|FS2UPS2;stateProblem| |fcnName|
                               "essential singularity" %))
                             (#3# (CONS 0 (QCDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;tranToUPS|
        ((|ker| (|Kernel| FE)) (|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (COND
         ((SPADCALL |ker| '|sin| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 237) |arg| "sin" |opt_rec| %))
         ((SPADCALL |ker| '|cos| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 238) |arg| "cos" |opt_rec| %))
         ((SPADCALL |ker| '|tan| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 239) |arg| "tan" |opt_rec| %))
         ((SPADCALL |ker| '|cot| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 240) |arg| "cot" |opt_rec| %))
         ((SPADCALL |ker| '|sec| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 241) |arg| "sec" |opt_rec| %))
         ((SPADCALL |ker| '|csc| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 242) |arg| "csc" |opt_rec| %))
         ((SPADCALL |ker| '|asin| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 243) |arg| "asin" |opt_rec| %))
         ((SPADCALL |ker| '|acos| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 244) |arg| "acos" |opt_rec| %))
         ((SPADCALL |ker| '|atan| (QREFELT % 217))
          (|FS2UPS2;atancotToUPS| |arg| |opt_rec| 1 %))
         ((SPADCALL |ker| '|acot| (QREFELT % 217))
          (|FS2UPS2;atancotToUPS| |arg| |opt_rec| -1 %))
         ((SPADCALL |ker| '|asec| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 245) |arg| "asec" |opt_rec| %))
         ((SPADCALL |ker| '|acsc| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 246) |arg| "acsc" |opt_rec| %))
         ((SPADCALL |ker| '|sinh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 247) |arg| "sinh" |opt_rec| %))
         ((SPADCALL |ker| '|cosh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 248) |arg| "cosh" |opt_rec| %))
         ((SPADCALL |ker| '|tanh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 249) |arg| "tanh" |opt_rec| %))
         ((SPADCALL |ker| '|coth| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 250) |arg| "coth" |opt_rec| %))
         ((SPADCALL |ker| '|sech| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 251) |arg| "sech" |opt_rec| %))
         ((SPADCALL |ker| '|csch| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 252) |arg| "csch" |opt_rec| %))
         ((SPADCALL |ker| '|asinh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 253) |arg| "asinh" |opt_rec| %))
         ((SPADCALL |ker| '|acosh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 254) |arg| "acosh" |opt_rec| %))
         ((SPADCALL |ker| '|atanh| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 255) |arg| "atanh" |opt_rec| %))
         ((SPADCALL |ker| '|acoth| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 256) |arg| "acoth" |opt_rec| %))
         ((SPADCALL |ker| '|asech| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 257) |arg| "asech" |opt_rec| %))
         ((SPADCALL |ker| '|acsch| (QREFELT % 217))
          (|FS2UPS2;applyIfCan| (ELT % 258) |arg| "acsch" |opt_rec| %))
         ('T (|FS2UPS2;unknown_to_UPS| |ker| (LIST |arg|) |opt_rec| %)))) 

(SDEFUN |FS2UPS2;powToUPS2|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
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
                (|FS2UPS2;logToUPS| (|SPADfirst| |args|) |opt_rec| %))
          (EXIT
           (COND ((QEQCAR |logBase| 1) |logBase|)
                 (#2='T
                  (SEQ
                   (LETT |expon|
                         (|FS2UPS2;i_expr_to_PS|
                          (SPADCALL |args| (QREFELT % 223)) |opt_rec| %))
                   (EXIT
                    (COND ((QEQCAR |expon| 1) |expon|)
                          (#2#
                           (SEQ
                            (LETT |ans|
                                  (SPADCALL
                                   (SPADCALL (CDR |expon|) (CDR |logBase|)
                                             (QREFELT % 59))
                                   (QREFELT % 218)))
                            (EXIT
                             (COND
                              ((QEQCAR |ans| 1)
                               (|FS2UPS2;stateProblem| "exp"
                                "essential singularity" %))
                              (#2# (CONS 0 (QCDR |ans|)))))))))))))))) 

(SDEFUN |FS2UPS2;powToUPS;LRU;79|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ans1| (|Union| UPS #2="failed")) (|lbu| (|Union| UPS #2#))
          (|b1| (UPS)) (|eb| (|Expon|)) (|bs| (UPS))
          (|pow_base|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|ep| (|Union| |Expon| "failed")) (|pow| (FE)))
         (SEQ (LETT |pow| (SPADCALL |args| (QREFELT % 223)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |pow| (QREFELT % 14) (QREFELT % 81))
                           (|spadConstant| % 19) (QREFELT % 30))
                 (|FS2UPS2;powToUPS2| |args| |opt_rec| %))
                (#3='T
                 (SEQ (LETT |ep| (SPADCALL |pow| (QREFELT % 259)))
                      (EXIT
                       (COND
                        ((QEQCAR |ep| 0)
                         (SEQ
                          (LETT |pow_base|
                                (|FS2UPS2;i_expr_to_PS| (|SPADfirst| |args|)
                                 |opt_rec| %))
                          (EXIT
                           (COND ((QEQCAR |pow_base| 1) |pow_base|)
                                 (#3#
                                  (SEQ (LETT |bs| (CDR |pow_base|))
                                       (LETT |eb|
                                             (SPADCALL |bs| (QREFELT % 24)))
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |bs| |eb| (QREFELT % 28))
                                          (|spadConstant| % 19) (QREFELT % 21))
                                         (SEQ
                                          (LETT |eb|
                                                (SPADCALL |bs|
                                                          (SPADCALL |eb|
                                                                    (SPADCALL
                                                                     1000
                                                                     (QREFELT %
                                                                              26))
                                                                    (QREFELT %
                                                                             27))
                                                          (QREFELT % 32)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |bs| |eb|
                                                        (QREFELT % 28))
                                              (|spadConstant| % 19)
                                              (QREFELT % 21))
                                             (|error|
                                              "powToUPS: series with many zero terms")))))))
                                       (LETT |b1|
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 23)
                                                        (SPADCALL |eb|
                                                                  (QREFELT %
                                                                           188))
                                                        (QREFELT % 67))
                                              |bs| (QREFELT % 59)))
                                       (LETT |lbu|
                                             (SPADCALL |b1| (QREFELT % 228)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |lbu| 1)
                                          (|FS2UPS2;stateProblem| "pow"
                                           "transcendental log" %))
                                         (#3#
                                          (SEQ
                                           (LETT |ans1|
                                                 (SPADCALL
                                                  (SPADCALL |pow| (QCDR |lbu|)
                                                            (QREFELT % 157))
                                                  (QREFELT % 218)))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |ans1| 1)
                                              (|FS2UPS2;stateProblem| "pow"
                                               "transcendental exp" %))
                                             (#3#
                                              (CONS 0
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (|spadConstant| % 23)
                                                      (SPADCALL (QCDR |ep|)
                                                                |eb|
                                                                (QREFELT %
                                                                         260))
                                                      (QREFELT % 67))
                                                     (QCDR |ans1|)
                                                     (QREFELT %
                                                              59))))))))))))))))
                        (#3# (|FS2UPS2;powToUPS2| |args| |opt_rec| %))))))))))) 

(SDEFUN |FS2UPS2;powToUPS;LRU;80|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;powToUPS2| |args| |opt_rec| %)) 

(SDEFUN |FS2UPS2;powToUPS;LRU;81|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;powToUPS2| |args| |opt_rec| %)) 

(SDEFUN |FS2UPS2;newElem| ((|f| (FE)) (% (FE)))
        (SPADCALL (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT % 262)) %)
                  (|FS2UPS2;smpElem| (SPADCALL |f| (QREFELT % 263)) %)
                  (QREFELT % 146))) 

(SDEFUN |FS2UPS2;smpElem|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| FE))) (% (FE)))
        (SPADCALL (CONS (|function| |FS2UPS2;k2Elem|) %) (ELT % 113) |p|
                  (QREFELT % 267))) 

(SDEFUN |FS2UPS2;k2Elem| ((|k| (|Kernel| FE)) (% (FE)))
        (SPROG
         ((|cosz| (FE)) (|sinz| (FE)) (|iez| (FE)) (|ez| (FE)) (|z| (FE))
          (|args| (|List| FE)) (#1=#:G1571 NIL) (|a| NIL) (#2=#:G1570 NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |args|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |a| NIL)
                         (LETT #1# (SPADCALL |k| (QREFELT % 214))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|FS2UPS2;newElem| |a| %) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))))
            (SPADCALL |k| (QREFELT % 213)))
           (#3='T
            (SEQ
             (LETT |iez|
                   (SPADCALL
                    (LETT |ez|
                          (SPADCALL (LETT |z| (|SPADfirst| |args|))
                                    (QREFELT % 179)))
                    (QREFELT % 268)))
             (LETT |sinz| (SPADCALL |z| (QREFELT % 203)))
             (LETT |cosz| (SPADCALL |z| (QREFELT % 269)))
             (EXIT
              (COND
               ((SPADCALL |k| '|tan| (QREFELT % 217))
                (SPADCALL |sinz| |cosz| (QREFELT % 146)))
               ((SPADCALL |k| '|cot| (QREFELT % 217))
                (SPADCALL |cosz| |sinz| (QREFELT % 146)))
               ((SPADCALL |k| '|sec| (QREFELT % 217))
                (SPADCALL |cosz| (QREFELT % 268)))
               ((SPADCALL |k| '|csc| (QREFELT % 217))
                (SPADCALL |sinz| (QREFELT % 268)))
               ((SPADCALL |k| '|sinh| (QREFELT % 217))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 202))
                          (SPADCALL 2 (QREFELT % 143)) (QREFELT % 146)))
               ((SPADCALL |k| '|cosh| (QREFELT % 217))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 94))
                          (SPADCALL 2 (QREFELT % 143)) (QREFELT % 146)))
               ((SPADCALL |k| '|tanh| (QREFELT % 217))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 202))
                          (SPADCALL |ez| |iez| (QREFELT % 94))
                          (QREFELT % 146)))
               ((SPADCALL |k| '|coth| (QREFELT % 217))
                (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 94))
                          (SPADCALL |ez| |iez| (QREFELT % 202))
                          (QREFELT % 146)))
               ((SPADCALL |k| '|sech| (QREFELT % 217))
                (SPADCALL 2
                          (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 94))
                                    (QREFELT % 268))
                          (QREFELT % 270)))
               ((SPADCALL |k| '|csch| (QREFELT % 217))
                (SPADCALL 2
                          (SPADCALL (SPADCALL |ez| |iez| (QREFELT % 202))
                                    (QREFELT % 268))
                          (QREFELT % 270)))
               (#3#
                (SPADCALL (SPADCALL |k| (QREFELT % 119)) |args|
                          (QREFELT % 271))))))))))) 

(SDEFUN |FS2UPS2;contOnReals?| ((|fcn| (|String|)) (% (|Boolean|)))
        (SPADCALL |fcn| (QREFELT % 272) (QREFELT % 275))) 

(SDEFUN |FS2UPS2;bddOnReals?| ((|fcn| (|String|)) (% (|Boolean|)))
        (SPADCALL |fcn| (QREFELT % 273) (QREFELT % 275))) 

(SDEFUN |FS2UPS2;exprToGenUPS;FEBUU;87|
        ((|fcn| (FE)) (|posCheck?| (|Boolean|))
         (|atanFlag|
          (|Union| "complex" "real: two sides" "real: left side"
                   "real: right side" "just do it"))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (|FS2UPS2;iExprToGenUPS| (|FS2UPS2;newElem| |fcn| %)
         (VECTOR |posCheck?| |atanFlag| (CONS 1 "none") (CONS 1 "none")
                 (CONS 1 "none") NIL (|spadConstant| % 19) NIL)
         %)) 

(SDEFUN |FS2UPS2;iExprToGenUPS|
        ((|fcn| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ker| (|Union| (|Kernel| FE) #2="failed"))
          (|power| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|))))
          (|expt|
           (|Union| (|Record| (|:| |val| FE) (|:| |exponent| (|Integer|)))
                    "failed"))
          (|prod| (|Union| (|List| FE) #3="failed"))
          (|sum| (|Union| (|List| FE) #3#))
          (|poly| (|Union| (|Polynomial| R) #2#)))
         (SEQ (LETT |poly| (SPADCALL |fcn| (QREFELT % 48)))
              (EXIT
               (COND
                ((QEQCAR |poly| 0)
                 (|FS2UPS2;polyToUPS|
                  (SPADCALL (QCDR |poly|) (QREFELT % 14) (QREFELT % 52))
                  |opt_rec| %))
                (#4='T
                 (SEQ (LETT |sum| (SPADCALL |fcn| (QREFELT % 54)))
                      (EXIT
                       (COND
                        ((QEQCAR |sum| 0)
                         (|FS2UPS2;listToUPS| (QCDR |sum|)
                          (CONS (|function| |FS2UPS2;iExprToGenUPS|) %)
                          |opt_rec| (|spadConstant| % 55) (ELT % 56) %))
                        (#4#
                         (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT % 57)))
                              (EXIT
                               (COND
                                ((QEQCAR |prod| 0)
                                 (|FS2UPS2;listToUPS| (QCDR |prod|)
                                  (CONS (|function| |FS2UPS2;iExprToGenUPS|) %)
                                  |opt_rec| (|spadConstant| % 58) (ELT % 59)
                                  %))
                                (#4#
                                 (SEQ
                                  (LETT |expt|
                                        (|FS2UPS2;isNonTrivPower| |fcn| %))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |expt| 0)
                                     (SEQ (LETT |power| (QCDR |expt|))
                                          (EXIT
                                           (|FS2UPS2;powerToGenUPS|
                                            (QCAR |power|) (QCDR |power|)
                                            |opt_rec| %))))
                                    (#4#
                                     (SEQ
                                      (LETT |ker|
                                            (SPADCALL |fcn| (QREFELT % 61)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |ker| 0)
                                         (|FS2UPS2;kernelToGenUPS| (QCDR |ker|)
                                          |opt_rec| %))
                                        (#4#
                                         (|error|
                                          "exprToGenUPS: neither a sum, product, power, nor kernel"))))))))))))))))))))))) 

(SDEFUN |FS2UPS2;opsInvolvingX| ((|fcn| (FE)) (% (|List| (|BasicOperator|))))
        (SPROG
         ((|opList| (|List| #1=(|BasicOperator|))) (|op| #1#) (#2=#:G1617 NIL)
          (|k| NIL) (#3=#:G1616 NIL))
         (SEQ
          (LETT |opList|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |k| NIL)
                      (LETT #2# (SPADCALL |fcn| (QREFELT % 278))) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL
                             (LETT |op| (SPADCALL |k| (QREFELT % 119)))
                             (QREFELT % 279))
                            (SPADCALL (QREFELT % 14)
                                      (SPADCALL
                                       (|SPADfirst|
                                        (SPADCALL |k| (QREFELT % 214)))
                                       (QREFELT % 76))
                                      (QREFELT % 77)))
                           ('T NIL))
                          (LETT #3# (CONS |op| #3#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL |opList| (QREFELT % 281)))))) 

(SDEFUN |FS2UPS2;opInOpList?|
        ((|name| (|Symbol|)) (|opList| (|List| (|BasicOperator|)))
         (% (|Boolean|)))
        (SPROG ((#1=#:G1623 NIL) (#2=#:G1624 NIL) (#3=#:G1625 NIL) (|op| NIL))
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
                            ((SPADCALL |op| |name| (QREFELT % 282))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G1622)))
                              (GO #5=#:G1620))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;exponential?| ((|fcn| (FE)) (% (|Boolean|)))
        (SPROG ((|ker| (|Union| (|Kernel| FE) "failed")))
               (SEQ (LETT |ker| (SPADCALL |fcn| (QREFELT % 61)))
                    (EXIT
                     (COND
                      ((QEQCAR |ker| 0)
                       (SPADCALL (QCDR |ker|) '|exp| (QREFELT % 217)))
                      ('T NIL)))))) 

(SDEFUN |FS2UPS2;productOfNonZeroes?| ((|fcn| (FE)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G1642 NIL) (#2=#:G1643 NIL) (#3=#:G1644 NIL) (|term| NIL)
          (|prod| (|Union| (|List| FE) "failed")))
         (SEQ
          (EXIT
           (COND ((|FS2UPS2;exponential?| |fcn| %) 'T)
                 (#4='T
                  (SEQ (LETT |prod| (SPADCALL |fcn| (QREFELT % 57)))
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
                                            (|FS2UPS2;exponential?| |term| %))
                                           (COND
                                            ((SPADCALL (QREFELT % 14)
                                                       (SPADCALL |term|
                                                                 (QREFELT %
                                                                          76))
                                                       (QREFELT % 77))
                                             (PROGN
                                              (LETT #1#
                                                    (PROGN
                                                     (LETT #2# NIL)
                                                     (GO #5=#:G1641)))
                                              (GO #6=#:G1637))))))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL)))
                                 #6# (EXIT #1#))
                                (EXIT 'T)))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;powerToGenUPS|
        ((|fcn| (FE)) (|n| (|Integer|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|xOpList| (|List| (|BasicOperator|))) (|coef| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#2=#:G408 NIL) (#3=#:G1649 NIL)
          (|b|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |b| (|FS2UPS2;iExprToGenUPS| |fcn| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |b| 1) |b|)
                     ((> |n| 0)
                      (CONS 0
                            (SPADCALL (CDR |b|)
                                      (PROG1 (LETT #3# |n|)
                                        (|check_subtype2| (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #3#))
                                      (QREFELT % 72))))
                     (#4='T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #2# |b|)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT % 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #2#)))
                       (LETT |deg| (SPADCALL |ups| (QREFELT % 24)))
                       (SEQ (LETT |coef| (SPADCALL |ups| |deg| (QREFELT % 28)))
                            (EXIT
                             (COND
                              ((SPADCALL |coef| (|spadConstant| % 19)
                                         (QREFELT % 21))
                               (SEQ
                                (LETT |deg|
                                      (SPADCALL |ups|
                                                (SPADCALL |deg|
                                                          (SPADCALL
                                                           (QREFELT % 15)
                                                           (QREFELT % 26))
                                                          (QREFELT % 27))
                                                (QREFELT % 32)))
                                (LETT |coef|
                                      (SPADCALL |ups| |deg| (QREFELT % 28)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |coef| (|spadConstant| % 19)
                                             (QREFELT % 21))
                                   (|error|
                                    "inverse of series with many leading zero coefficients")))))))))
                       (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |coef| %))
                       (EXIT
                        (COND
                         ((NULL |xOpList|)
                          (CONS 0 (SPADCALL |ups| |n| (QREFELT % 73))))
                         (#4#
                          (SEQ
                           (COND
                            ((NULL (CDR |xOpList|))
                             (COND
                              ((SPADCALL (|SPADfirst| |xOpList|) '|log|
                                         (QREFELT % 282))
                               (EXIT
                                (CONS 0
                                      (SPADCALL |ups| |n| (QREFELT % 73))))))))
                           (EXIT
                            (COND
                             ((|FS2UPS2;productOfNonZeroes?| |coef| %)
                              (CONS 0 (SPADCALL |ups| |n| (QREFELT % 73))))
                             (#4#
                              (|FS2UPS2;stateProblem| "inv"
                               "lowest order coefficient involves x"
                               %))))))))))))))) 

(SDEFUN |FS2UPS2;kernel1_to_GenUPS|
        ((|ker| (|Kernel| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G1663 NIL) (|n| (|Integer|)) (|arg| (FE)) (|args| (|List| FE)))
         (SEQ (LETT |args| (SPADCALL |ker| (QREFELT % 214)))
              (EXIT
               (COND
                ((NULL (CDR |args|))
                 (SEQ (LETT |arg| (|SPADfirst| |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |ker| '|abs| (QREFELT % 217))
                         (|FS2UPS2;nthRootToGenUPS|
                          (SPADCALL |arg| |arg| (QREFELT % 144)) 2 |opt_rec|
                          %))
                        ((SPADCALL |ker| '|%paren| (QREFELT % 217))
                         (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
                        ((SPADCALL |ker| '|log| (QREFELT % 217))
                         (|FS2UPS2;logToGenUPS| |arg| |opt_rec| %))
                        ((SPADCALL |ker| '|exp| (QREFELT % 217))
                         (|FS2UPS2;expToGenUPS| |arg| |opt_rec| %))
                        (#3='T
                         (|FS2UPS2;tranToGenUPS| |ker| |arg| |opt_rec| %))))))
                ((SPADCALL |ker| '|%power| (QREFELT % 217))
                 (|FS2UPS2;powToGenUPS| |args| |opt_rec| %))
                ((SPADCALL |ker| '|nthRoot| (QREFELT % 217))
                 (SEQ
                  (LETT |n|
                        (SPADCALL (SPADCALL |args| (QREFELT % 223))
                                  (QREFELT % 224)))
                  (EXIT
                   (|FS2UPS2;nthRootToGenUPS| (|SPADfirst| |args|)
                    (PROG1 (LETT #2# |n|)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    |opt_rec| %))))
                (#3#
                 (|FS2UPS2;stateProblem|
                  (SPADCALL (SPADCALL |ker| (QREFELT % 181)) (QREFELT % 185))
                  "unknown kernel" %))))))) 

(SDEFUN |FS2UPS2;kernelToGenUPS|
        ((|ker| (|Kernel| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|res1|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (#2=#:G1682 NIL) (#3=#:G1683 NIL) (|cr| NIL) (|args| (|List| FE))
          (|sym| (|Union| (|Symbol|) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |sym| (SPADCALL |ker| (QREFELT % 226)))
                (EXIT
                 (COND
                  ((QEQCAR |sym| 0)
                   (COND
                    ((EQUAL (QCDR |sym|) (QREFELT % 14))
                     (CONS 0
                           (SPADCALL (|spadConstant| % 23)
                                     (|spadConstant| % 111) (QREFELT % 67))))
                    (#4='T
                     (CONS 0
                           (SPADCALL (SPADCALL |ker| (QREFELT % 213))
                                     (|spadConstant| % 79) (QREFELT % 67))))))
                  ((NULL (LETT |args| (SPADCALL |ker| (QREFELT % 214))))
                   (CONS 0
                         (SPADCALL (SPADCALL |ker| (QREFELT % 213))
                                   (|spadConstant| % 79) (QREFELT % 67))))
                  (#4#
                   (SEQ
                    (SEQ (LETT |cr| NIL) (LETT #3# (QVELT |opt_rec| 7)) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |cr| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ker| (QCAR |cr|) (QREFELT % 227))
                             (PROGN (LETT #2# (QCDR |cr|)) (GO #5=#:G1681))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (LETT |res1|
                          (|FS2UPS2;kernel1_to_GenUPS| |ker| |opt_rec| %))
                    (QSETVELT |opt_rec| 7
                              (CONS (CONS |ker| |res1|) (QVELT |opt_rec| 7)))
                    (EXIT |res1|)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FS2UPS2;nthRootToGenUPS|
        ((|arg| (FE)) (|n| (|NonNegativeInteger|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
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
         (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |result| 1) |result|)
                     (#2='T
                      (SEQ
                       (LETT |ans|
                             (|FS2UPS2;carefulNthRootIfCan| (CDR |result|) |n|
                              |opt_rec| 'T %))
                       (EXIT
                        (COND ((QEQCAR |ans| 1) |ans|)
                              (#2# (CONS 0 (CDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;logToGenUPS|
        ((|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|logTerm| (FE)) (|term1| (FE)) (|pow| (FE)) (|mon| (FE))
          (|negRat?| (|Boolean|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|cen| (FE))
          (|lt| (UPS)) (#2=#:G1707 NIL) (#3=#:G1708 NIL)
          (|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#4=#:G408 NIL)
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
                (EXIT
                 (COND ((QEQCAR |result| 1) |result|)
                       (#5='T
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |ups|
                                 (PROG2 (LETT #4# |result|)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0) (QREFELT % 9)
                                                   (|Union|
                                                    (|:| |%series|
                                                         (QREFELT % 9))
                                                    (|:| |%problem|
                                                         (|Record|
                                                          (|:| |func|
                                                               (|String|))
                                                          (|:| |prob|
                                                               (|String|)))))
                                                   #4#)))
                           (LETT |deg| (SPADCALL |ups| (QREFELT % 24)))
                           (SEQ
                            (LETT |coef| (SPADCALL |ups| |deg| (QREFELT % 28)))
                            (EXIT
                             (COND
                              ((SPADCALL |coef| (|spadConstant| % 19)
                                         (QREFELT % 21))
                               (SEQ
                                (LETT |deg|
                                      (SPADCALL |ups|
                                                (SPADCALL |deg|
                                                          (SPADCALL
                                                           (QREFELT % 15)
                                                           (QREFELT % 26))
                                                          (QREFELT % 27))
                                                (QREFELT % 32)))
                                (LETT |coef|
                                      (SPADCALL |ups| |deg| (QREFELT % 28)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |coef| (|spadConstant| % 19)
                                             (QREFELT % 21))
                                   (|error|
                                    "log of series with many leading zero coefficients")))))))))
                           (COND
                            ((QVELT |opt_rec| 0)
                             (SEQ
                              (LETT |signum| (SPADCALL |coef| (QREFELT % 35)))
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
                                                  %))
                                           (GO #6=#:G1706)))
                                    (GO #7=#:G1704))))))))))
                           (LETT |lt| (SPADCALL |coef| |deg| (QREFELT % 67)))
                           (LETT |cen| (SPADCALL |lt| (QREFELT % 283)))
                           (LETT |negRat?|
                                 (SEQ
                                  (LETT |rat| (|FS2UPS2;ratIfCan| |coef| %))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |rat| 0)
                                     (COND
                                      ((SPADCALL (QCDR |rat|)
                                                 (|spadConstant| % 284)
                                                 (QREFELT % 285))
                                       'T)
                                      (#5# NIL)))
                                    (#5# NIL)))))
                           (LETT |logTerm|
                                 (SEQ
                                  (LETT |mon|
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 14)
                                                   (QREFELT % 86))
                                         |cen| (QREFELT % 202)))
                                  (LETT |pow|
                                        (SPADCALL |mon|
                                                  (SPADCALL |deg|
                                                            (QREFELT % 13))
                                                  (QREFELT % 286)))
                                  (EXIT
                                   (COND
                                    (|negRat?|
                                     (SPADCALL
                                      (SPADCALL |coef| |pow| (QREFELT % 144))
                                      (QREFELT % 145)))
                                    (#5#
                                     (SEQ
                                      (LETT |term1|
                                            (SPADCALL
                                             (SPADCALL |deg| (QREFELT % 13))
                                             (SPADCALL |mon| (QREFELT % 145))
                                             (QREFELT % 144)))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL |coef| (QREFELT % 145))
                                        |term1| (QREFELT % 94)))))))))
                           (EXIT
                            (CONS 0
                                  (SPADCALL
                                   (SPADCALL |logTerm| (|spadConstant| % 79)
                                             (QREFELT % 67))
                                   (SPADCALL
                                    (SPADCALL |ups| |lt| (QREFELT % 206))
                                    (QREFELT % 158))
                                   (QREFELT % 56))))))
                         #7# (EXIT #2#)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FS2UPS2;expToGenUPS|
        ((|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |ups| 1) |ups|)
                     ('T (|FS2UPS2;expGenUPS| (CDR |ups|) |opt_rec| %))))))) 

(SDEFUN |FS2UPS2;expGenUPS|
        ((|ups| (UPS))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|))))))
          (|expCoef| (FE)) (|xOpList| (|List| (|BasicOperator|))) (|lc| (FE))
          (|deg| (|Expon|)))
         (SEQ
          (LETT |deg| (SPADCALL |ups| (|spadConstant| % 111) (QREFELT % 32)))
          (EXIT
           (COND
            ((SPADCALL |deg| (|spadConstant| % 79) (QREFELT % 29))
             (|FS2UPS2;stateProblem| "exp" "essential singularity" %))
            ((SPADCALL |deg| (|spadConstant| % 79) (QREFELT % 183))
             (CONS 0 (SPADCALL |ups| (QREFELT % 287))))
            (#2='T
             (SEQ
              (LETT |lc| (SPADCALL |ups| (|spadConstant| % 79) (QREFELT % 28)))
              (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| %))
              (COND
               ((NULL (|FS2UPS2;opInOpList?| '|log| |xOpList| %))
                (EXIT (CONS 0 (SPADCALL |ups| (QREFELT % 287))))))
              (LETT |expCoef|
                    (SPADCALL (SPADCALL |lc| (QREFELT % 179)) (QREFELT % 14)
                              (QREFELT % 289)))
              (EXIT
               (COND
                ((|FS2UPS2;opInOpList?| '|log|
                  (|FS2UPS2;opsInvolvingX| |expCoef| %) %)
                 (|FS2UPS2;stateProblem| "exp" "logs in constant coefficient"
                  %))
                (#2#
                 (SEQ
                  (LETT |result|
                        (|FS2UPS2;iExprToGenUPS|
                         (|FS2UPS2;newElem| |expCoef| %) |opt_rec| %))
                  (EXIT
                   (COND ((QEQCAR |result| 1) |result|)
                         (#2#
                          (CONS 0
                                (SPADCALL (CDR |result|)
                                          (SPADCALL
                                           (SPADCALL |ups|
                                                     (SPADCALL |lc|
                                                               (|spadConstant|
                                                                % 79)
                                                               (QREFELT % 67))
                                                     (QREFELT % 80))
                                           (QREFELT % 287))
                                          (QREFELT % 59))))))))))))))))) 

(SDEFUN |FS2UPS2;atancotToGenUPS|
        ((|fe| (FE)) (|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (|plusMinus| (|Integer|))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#2=#:G1725 NIL) (|ord| (|Expon|)) (|coef| (FE)) (|ups| (UPS))
          (#3=#:G408 NIL)
          (|trouble|
           (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))
          (|result|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |result| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
              (EXIT
               (COND
                ((QEQCAR |result| 1)
                 (SEQ (LETT |trouble| (CDR |result|))
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |trouble|) "essential singularity")
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| % 79)
                                         (QREFELT % 67))))
                        (#4='T |result|)))))
                (#4#
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |ups|
                          (PROG2 (LETT #3# |result|)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                            (|Union|
                                             (|:| |%series| (QREFELT % 9))
                                             (|:| |%problem|
                                                  (|Record|
                                                   (|:| |func| (|String|))
                                                   (|:| |prob| (|String|)))))
                                            #3#)))
                    (LETT |coef|
                          (SPADCALL |ups| (|spadConstant| % 79)
                                    (QREFELT % 28)))
                    (SEQ
                     (LETT |ord|
                           (SPADCALL |ups| (|spadConstant| % 79)
                                     (QREFELT % 32)))
                     (EXIT
                      (COND
                       ((SPADCALL |ord| (|spadConstant| % 79) (QREFELT % 182))
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 144))
                                    (SPADCALL (|spadConstant| % 23)
                                              (QREFELT % 176))
                                    (QREFELT % 21))
                          (PROGN
                           (LETT #2# (CONS 0 (SPADCALL |ups| (QREFELT % 208))))
                           (GO #5=#:G1722))))))))
                    (EXIT
                     (|FS2UPS2;atanacot2| |ups| |coef| |ord| |opt_rec|
                      |plusMinus| %))))
                  #5# (EXIT #2#)))))))) 

(SDEFUN |FS2UPS2;genUPSApplyIfCan|
        ((|fcn| (|Mapping| (|Union| UPS #1="failed") UPS)) (|arg| (FE))
         (|fcnName| (|String|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((#3=#:G1728 NIL) (|xOpList| (|List| (|BasicOperator|))) (|lc| (FE))
          (|deg| (|Expon|)) (|ups| (UPS)) (#4=#:G408 NIL)
          (|series|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |series| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
              (EXIT
               (COND ((QEQCAR |series| 1) |series|)
                     (#5='T
                      (SEQ
                       (LETT |ups|
                             (PROG2 (LETT #4# |series|)
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0) (QREFELT % 9)
                                               (|Union|
                                                (|:| |%series| (QREFELT % 9))
                                                (|:| |%problem|
                                                     (|Record|
                                                      (|:| |func| (|String|))
                                                      (|:| |prob|
                                                           (|String|)))))
                                               #4#)))
                       (LETT |deg|
                             (SPADCALL |ups| (|spadConstant| % 111)
                                       (QREFELT % 32)))
                       (EXIT
                        (COND
                         ((SPADCALL |deg| (|spadConstant| % 79) (QREFELT % 29))
                          (|FS2UPS2;stateProblem| |fcnName|
                           "essential singularity" %))
                         ((SPADCALL |deg| (|spadConstant| % 79)
                                    (QREFELT % 183))
                          (CONS 0
                                (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) (QREFELT % 9)
                                                  (|Union| (QREFELT % 9) #1#)
                                                  #3#))))
                         (#5#
                          (SEQ
                           (LETT |lc|
                                 (SPADCALL |ups| (|spadConstant| % 79)
                                           (QREFELT % 28)))
                           (LETT |xOpList| (|FS2UPS2;opsInvolvingX| |lc| %))
                           (EXIT
                            (COND
                             ((NULL |xOpList|)
                              (CONS 0
                                    (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT % 9)
                                                      (|Union| (QREFELT % 9)
                                                               #1#)
                                                      #3#))))
                             ((|FS2UPS2;opInOpList?| '|log| |xOpList| %)
                              (|FS2UPS2;stateProblem| |fcnName|
                               "logs in constant coefficient" %))
                             ((|FS2UPS2;contOnReals?| |fcnName| %)
                              (CONS 0
                                    (PROG2 (LETT #3# (SPADCALL |ups| |fcn|))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (QREFELT % 9)
                                                      (|Union| (QREFELT % 9)
                                                               #1#)
                                                      #3#))))
                             (#5#
                              (|FS2UPS2;stateProblem| |fcnName|
                               "x in constant coefficient" %))))))))))))))) 

(SDEFUN |FS2UPS2;applyBddIfCan|
        ((|fe| (FE)) (|fcn| (|Mapping| #1=(|Union| UPS "failed") UPS))
         (|arg| (FE)) (|fcnName| (|String|))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #2#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (SPROG
         ((|ans| #1#)
          (|trouble|
           (|Record| (|:| |func| (|String|)) (|:| |prob| (|String|))))
          (|ups|
           (|Union| (|:| |%series| UPS)
                    (|:| |%problem|
                         (|Record| (|:| |func| (|String|))
                                   (|:| |prob| (|String|)))))))
         (SEQ (LETT |ups| (|FS2UPS2;iExprToGenUPS| |arg| |opt_rec| %))
              (EXIT
               (COND
                ((QEQCAR |ups| 1)
                 (SEQ (LETT |trouble| (CDR |ups|))
                      (EXIT
                       (COND
                        ((EQUAL (QCDR |trouble|) "essential singularity")
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| % 79)
                                         (QREFELT % 67))))
                        (#3='T |ups|)))))
                (#3#
                 (SEQ (LETT |ans| (SPADCALL (CDR |ups|) |fcn|))
                      (EXIT
                       (COND
                        ((QEQCAR |ans| 1)
                         (CONS 0
                               (SPADCALL |fe| (|spadConstant| % 79)
                                         (QREFELT % 67))))
                        (#3# (CONS 0 (QCDR |ans|)))))))))))) 

(SDEFUN |FS2UPS2;tranToGenUPS|
        ((|ker| (|Kernel| FE)) (|arg| (FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
        (COND
         ((SPADCALL |ker| '|sin| (QREFELT % 217))
          (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT % 213)) (ELT % 237)
           |arg| "sin" |opt_rec| %))
         ((SPADCALL |ker| '|cos| (QREFELT % 217))
          (|FS2UPS2;applyBddIfCan| (SPADCALL |ker| (QREFELT % 213)) (ELT % 238)
           |arg| "cos" |opt_rec| %))
         ((SPADCALL |ker| '|asin| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 243) |arg| "asin" |opt_rec| %))
         ((SPADCALL |ker| '|acos| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 244) |arg| "acos" |opt_rec| %))
         ((SPADCALL |ker| '|atan| (QREFELT % 217))
          (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT % 213)) |arg|
           |opt_rec| 1 %))
         ((SPADCALL |ker| '|acot| (QREFELT % 217))
          (|FS2UPS2;atancotToGenUPS| (SPADCALL |ker| (QREFELT % 213)) |arg|
           |opt_rec| -1 %))
         ((SPADCALL |ker| '|asec| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 245) |arg| "asec" |opt_rec| %))
         ((SPADCALL |ker| '|acsc| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 246) |arg| "acsc" |opt_rec| %))
         ((SPADCALL |ker| '|asinh| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 253) |arg| "asinh" |opt_rec| %))
         ((SPADCALL |ker| '|acosh| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 254) |arg| "acosh" |opt_rec| %))
         ((SPADCALL |ker| '|atanh| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 255) |arg| "atanh" |opt_rec| %))
         ((SPADCALL |ker| '|acoth| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 256) |arg| "acoth" |opt_rec| %))
         ((SPADCALL |ker| '|asech| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 257) |arg| "asech" |opt_rec| %))
         ((SPADCALL |ker| '|acsch| (QREFELT % 217))
          (|FS2UPS2;genUPSApplyIfCan| (ELT % 258) |arg| "acsch" |opt_rec| %))
         ('T
          (|FS2UPS2;stateProblem|
           (SPADCALL (SPADCALL |ker| (QREFELT % 181)) (QREFELT % 185))
           "unknown kernel" %)))) 

(SDEFUN |FS2UPS2;powToGenUPS|
        ((|args| (|List| FE))
         (|opt_rec|
          (|Record| (|:| |pos_Check?| (|Boolean|))
                    (|:| |atan_Flag|
                         (|Union| "complex" "real: two sides" "real: left side"
                                  "real: right side" "just do it"))
                    (|:| |coeff_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1="none"))
                    (|:| |inv_check?| (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |zero_check?|
                         (|Union| (|Mapping| (|Boolean|) FE) #1#))
                    (|:| |log_x_replace| (|Boolean|)) (|:| |log_x_val| FE)
                    (|:| |cache|
                         (|List|
                          (|Record| (|:| |ker| (|Kernel| FE))
                                    (|:| |ser|
                                         (|Union| (|:| |%series| UPS)
                                                  (|:| |%problem|
                                                       (|Record|
                                                        (|:| |func| (|String|))
                                                        (|:| |prob|
                                                             (|String|)))))))))))
         (%
          (|Union| (|:| |%series| UPS)
                   (|:| |%problem|
                        (|Record| (|:| |func| (|String|))
                                  (|:| |prob| (|String|)))))))
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
                (|FS2UPS2;logToGenUPS| (|SPADfirst| |args|) |opt_rec| %))
          (EXIT
           (COND ((QEQCAR |logBase| 1) |logBase|)
                 (#2='T
                  (SEQ
                   (LETT |expon|
                         (|FS2UPS2;iExprToGenUPS|
                          (SPADCALL |args| (QREFELT % 223)) |opt_rec| %))
                   (EXIT
                    (COND ((QEQCAR |expon| 1) |expon|)
                          (#2#
                           (|FS2UPS2;expGenUPS|
                            (SPADCALL (CDR |expon|) (CDR |logBase|)
                                      (QREFELT % 59))
                            |opt_rec| %))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceToUnivariatePowerSeries2;|)) 

(DEFUN |FunctionSpaceToUnivariatePowerSeries2| (&REST #1=#:G1779)
  (SPROG NIL
         (PROG (#2=#:G1780)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T T T T T NIL NIL))
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
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$9 NIL) (DV$8 NIL) (DV$7 NIL) (DV$6 NIL)
    (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT DV$6 (|devaluate| |#6|))
    (LETT DV$7 (|devaluate| |#7|))
    (LETT DV$8 |#8|)
    (LETT DV$9 |#9|)
    (LETT |dv$|
          (LIST '|FunctionSpaceToUnivariatePowerSeries2| DV$1 DV$2 DV$3 DV$4
                DV$5 DV$6 DV$7 DV$8 DV$9))
    (LETT % (GETREFV 290))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|FunctionSpaceToUnivariatePowerSeries2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8 DV$9) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (QSETREFV % 11 |#6|)
    (QSETREFV % 12 |#7|)
    (QSETREFV % 13 |#8|)
    (QSETREFV % 14 |#9|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 15 1000)
    (QSETREFV % 74 (|EllipticFunctionsUnivariateTaylorSeries| |#2| |#6|))
    (QSETREFV % 142 (SPADCALL (QREFELT % 141)))
    (QSETREFV % 147
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL 2 (QREFELT % 143))
                          (SPADCALL (QREFELT % 141)) (QREFELT % 144))
                (QREFELT % 145))
               (SPADCALL 2 (QREFELT % 143)) (QREFELT % 146)))
    (QSETREFV % 151
              (SPADCALL (|spadConstant| % 23)
                        (SPADCALL (SPADCALL (QREFELT % 141)) (QREFELT % 150))
                        (QREFELT % 146)))
    (QSETREFV % 159 NIL)
    (COND
     ((|HasSignature| |#6|
                      (LIST '|integrate|
                            (LIST (|devaluate| |#6|) (|devaluate| |#6|))))
      (PROGN
       (SETELT % 159 'T)
       (QSETREFV % 161
                 (CONS (|dispatchFunction| |FS2UPS2;integt;2UTS;38|) %))))
     ('T
      (QSETREFV % 161 (CONS (|dispatchFunction| |FS2UPS2;integt;2UTS;39|) %))))
    (COND
     ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
      (QSETREFV % 163
                (CONS (|dispatchFunction| |FS2UPS2;my_digamma;2FE;40|) %)))
     ('T
      (QSETREFV % 163
                (CONS (|dispatchFunction| |FS2UPS2;my_digamma;2FE;41|) %))))
    (QSETREFV % 204 NIL)
    (COND
     ((|HasSignature| |#4|
                      (LIST '|differentiate|
                            (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
      (COND
       ((|HasSignature| |#4|
                        (LIST '|integrate|
                              (LIST (|devaluate| |#4|) (|devaluate| |#4|))))
        (PROGN
         (SETELT % 204 'T)
         (QSETREFV % 208 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;55|) %))
         (QSETREFV % 209 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;56|) %))
         (QSETREFV % 210
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;57|) %))))
       ('T
        (PROGN
         (QSETREFV % 208 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;58|) %))
         (QSETREFV % 209 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;59|) %))
         (QSETREFV % 210
                   (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;60|)
                         %))))))
     ('T
      (PROGN
       (QSETREFV % 208 (CONS (|dispatchFunction| |FS2UPS2;atan1;2UPS;61|) %))
       (QSETREFV % 209 (CONS (|dispatchFunction| |FS2UPS2;integ;2UPS;62|) %))
       (QSETREFV % 210
                 (CONS (|dispatchFunction| |FS2UPS2;integ_df;3UPS;63|) %)))))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|abs|
                            (LIST (|devaluate| |#2|) (|devaluate| |#2|))))
      (QSETREFV % 230 (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;71|) %)))
     ('T
      (QSETREFV % 230
                (CONS (|dispatchFunction| |FS2UPS2;localAbs;2FE;72|) %))))
    (COND
     ((|HasCategory| |#3| (LIST '|RetractableFrom| (|devaluate| |#2|)))
      (COND
       ((|HasCategory| |#3| '(|Ring|))
        (QSETREFV % 222
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;79|) %)))
       ('T
        (QSETREFV % 222
                  (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;80|) %)))))
     ('T
      (QSETREFV % 222
                (CONS (|dispatchFunction| |FS2UPS2;powToUPS;LRU;81|) %))))
    (QSETREFV % 272 (LIST #1="sin" #2="cos" #3="atan" #4="acot" "exp" "asinh"))
    (QSETREFV % 273 (LIST #1# #2# #3# #4#))
    %))) 

(MAKEPROP '|FunctionSpaceToUnivariatePowerSeries2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|local| |#9|) 'ZEROCOUNT
              (|Union| 170 '#1="failed") (0 . |retractIfCan|) (5 . |Zero|)
              (9 . |Zero|) (|Boolean|) (13 . =) (19 . |One|) (23 . |One|)
              (27 . |degree|) (|Integer|) (32 . |coerce|) (37 . +)
              (43 . |coefficient|) (49 . <) (55 . ~=) (61 . |reductum|)
              (66 . |order|) (|Union| 25 '"failed")
              (|ElementaryFunctionSign| 6 7) (72 . |sign|) (77 . |zero?|)
              (|Union| 9 '"failed") (|NonNegativeInteger|)
              (82 . |nthRootIfCan|)
              (|Record| (|:| |func| 184) (|:| |prob| 184))
              (|Union| (|:| |%series| 9) (|:| |%problem| 40))
              (|Union| '#2="complex" '#3="real: two sides"
                       '#4="real: left side" '#5="real: right side"
                       '#6="just do it")
              |FS2UPS2;exprToUPS;FEBUU;6| |FS2UPS2;exprToPS;FEBUBFEU;7|
              (|Mapping| 20 7) |FS2UPS2;exprToPS;FEBUBFE3MU;8|
              (|Union| 51 '#1#) (88 . |retractIfCan|)
              (|SparseUnivariatePolynomial| %) (|Symbol|) (|Polynomial| 6)
              (93 . |univariate|) (|Union| 120 '#7="failed") (99 . |isPlus|)
              (104 . |Zero|) (108 . +) (114 . |isTimes|) (119 . |One|)
              (123 . *) (|Union| 212 '#1#) (129 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 51) (134 . |zero?|)
              (139 . |degree|) (144 . |leadingCoefficient|) (149 . |coerce|)
              (154 . |monomial|) (160 . |reductum|)
              (|Record| (|:| |val| %) (|:| |exponent| 25)) (|Union| 69 '#7#)
              (165 . |isPower|) (170 . ^) (176 . ^) 'ELITS (|List| 50)
              (182 . |variables|) (187 . |member?|) (193 . |coerce|)
              (198 . |Zero|) (202 . -) (208 . |differentiate|) (|List| 9)
              (|Mapping| 7 7) (|List| 83) (214 . |taylor_via_deriv|)
              (221 . |coerce|) (|Equation| 7) (226 . =) (|List| 124)
              (232 . |eval|) (238 . |map|) (244 . |taylor_via_deriv|)
              (251 . |new|) (255 . +) (261 . |elt|) (|Mapping| 11 11)
              (267 . |applyTaylor|) (273 . |One|) (|List| 7) (277 . |elt|)
              (283 . |coerce|) (288 . |monomial|) (294 . +) (|PositiveInteger|)
              (300 . ^) (306 . -) (312 . |One|) (316 . *) (322 . *) (328 . -)
              (333 . |One|) (337 . |coerce|) (342 . |coerce|) (347 . /)
              (353 . |Zero|) (357 . |last|) (|BasicOperator|) (|Kernel| 7)
              (362 . |operator|) (|List| %) (367 . |kernel|)
              (|Union| % '"failed") (373 . |recip|) (|Equation| %)
              (378 . |eval|) (|List| 11) (384 . |taylor_via_lode|)
              (|SpecialFunctionUnivariateTaylorSeries| 7 11)
              (391 . |lambertW0|) (396 . ~=) (402 . *) (408 . |One|)
              (|Reference| 25) (412 . |ref|) (417 . |deref|) (422 . +)
              (428 . |setref|) (|Stream| 7) (434 . |stream|) (440 . |series|)
              (445 . |pi|) '|my_pi| (449 . |coerce|) (454 . *) (460 . |log|)
              (465 . /) '|lpi| (|SparseMultivariatePolynomial| 6 118)
              (471 . |One|) (475 . |sqrt|) '|sqrt_pi| (|Reference| 7)
              (480 . |deref|) (485 . |setref|) (491 . |ref|)
              (496 . |apply_taylor|) (502 . *) (508 . |log|)
              '|can_integrate_uts| (513 . |integrate|) (518 . |integt|)
              (523 . |digamma|) (528 . |my_digamma|) (533 . |exquo|) (539 . -)
              (544 . |exp|) (549 . |cosh|) (554 . |log|) (559 . ^)
              (|Fraction| 25) (|IntegerNumberTheoryFunctions|)
              (565 . |bernoulli|) (570 . |coerce|) (575 . /) (581 . -)
              (586 . -) (591 . |differentiate|) (596 . |One|) (600 . |exp|)
              (605 . |retractIfCan|) (610 . |name|) (615 . =) (621 . >)
              (|String|) (627 . |string|) (632 . |order|) (637 . =) (643 . -)
              (648 . |jacobiSn|) (654 . |jacobiCn|) (660 . |jacobiDn|)
              (666 . |ellipticE|) (672 . |ellipticF|) (678 . |ellipticPi|)
              (685 . |weierstrassP0|) (692 . |weierstrassPPrime0|)
              (699 . |weierstrassZeta0|) (706 . |weierstrassSigma0|)
              (|Union| 6 '#1#) (713 . |retractIfCan|) (718 . |retractIfCan|)
              (723 . -) (729 . |sin|) '|can_integrate| (734 . |differentiate|)
              (739 . /) (745 . |integrate|) (750 . |atan1|) (755 . |integ|)
              (760 . |integ_df|) (766 . |elt|) (|Kernel| %) (772 . |coerce|)
              (777 . |argument|) (782 . ~=) (788 . |has?|) (794 . |is?|)
              (800 . |expIfCan|) (|Union| 45 '#8="none")
              (|Record| (|:| |ker| 118) (|:| |ser| 41))
              (|Record| (|:| |pos_Check?| 20) (|:| |atan_Flag| 42)
                        (|:| |coeff_check?| 219) (|:| |inv_check?| 219)
                        (|:| |zero_check?| 219) (|:| |log_x_replace| 20)
                        (|:| |log_x_val| 7) (|:| |cache| (|List| 220)))
              (805 . |powToUPS|) (811 . |second|) (816 . |retract|)
              (|Union| 50 '"failed") (821 . |symbolIfCan|) (826 . =)
              (832 . |logIfCan|) (837 . |abs|) (842 . |localAbs|) (847 . =)
              (853 . |numer|) (858 . |atan|) (863 . |acot|) (868 . |atanIfCan|)
              (873 . |acotIfCan|) (878 . |sinIfCan|) (883 . |cosIfCan|)
              (888 . |tanIfCan|) (893 . |cotIfCan|) (898 . |secIfCan|)
              (903 . |cscIfCan|) (908 . |asinIfCan|) (913 . |acosIfCan|)
              (918 . |asecIfCan|) (923 . |acscIfCan|) (928 . |sinhIfCan|)
              (933 . |coshIfCan|) (938 . |tanhIfCan|) (943 . |cothIfCan|)
              (948 . |sechIfCan|) (953 . |cschIfCan|) (958 . |asinhIfCan|)
              (963 . |acoshIfCan|) (968 . |atanhIfCan|) (973 . |acothIfCan|)
              (978 . |asechIfCan|) (983 . |acschIfCan|) (988 . |retractIfCan|)
              (993 . *) (|SparseMultivariatePolynomial| 6 212) (999 . |numer|)
              (1004 . |denom|) (|Mapping| 7 118) (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 118) 118 6 148
                                           7)
              (1009 . |map|) (1016 . |inv|) (1021 . |cos|) (1026 . *)
              (1032 . |elt|) 'CONTFCNS 'BDDFCNS (|List| 184) (1038 . |member?|)
              |FS2UPS2;exprToGenUPS;FEBUU;87| (|List| 212) (1044 . |tower|)
              (1049 . |unary?|) (|List| 117) (1054 . |removeDuplicates|)
              (1059 . |is?|) (1065 . |center|) (1070 . |Zero|) (1074 . <)
              (1080 . ^) (1086 . |exp|)
              (|ElementaryFunctionStructurePackage| 6 7) (1091 . |normalize|))
           '#(|powToUPS| 1097 |my_digamma| 1103 |localAbs| 1108 |integt| 1113
              |integ_df| 1118 |integ| 1124 |exprToUPS| 1129 |exprToPS| 1136
              |exprToGenUPS| 1157 |atan1| 1164)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|exprToUPS|
                                 ((|Union| (|:| |%series| |#4|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  |#2| (|Boolean|)
                                  (|Union| #2# #3# #4# #5# #6#)))
                                T)
                              '((|exprToGenUPS|
                                 ((|Union| (|:| |%series| |#4|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  |#2| (|Boolean|)
                                  (|Union| #2# #3# #4# #5# #6#)))
                                T)
                              '((|exprToPS|
                                 ((|Union| (|:| |%series| |#4|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  |#2| (|Boolean|)
                                  (|Union| #2# #3# #4# #5# #6#) (|Boolean|)
                                  |#2|))
                                T)
                              '((|exprToPS|
                                 ((|Union| (|:| |%series| |#4|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  |#2| (|Boolean|)
                                  (|Union| #2# #3# #4# #5# #6#) (|Boolean|)
                                  |#2| (|Mapping| (|Boolean|) |#2|)
                                  (|Mapping| (|Boolean|) |#2|)
                                  (|Mapping| (|Boolean|) |#2|)))
                                T)
                              '((|localAbs| (|#2| |#2|)) T)
                              '((|atan1| (|#4| |#4|)) T)
                              '((|integ| (|#4| |#4|)) T)
                              '((|integt| (|#6| |#6|)) T)
                              '((|integ_df| (|#4| |#4| |#4|)) T)
                              '((|powToUPS|
                                 ((|Union| (|:| |%series| |#4|)
                                           (|:| |%problem|
                                                (|Record|
                                                 (|:| |func| (|String|))
                                                 (|:| |prob| (|String|)))))
                                  (|List| |#2|)
                                  (|Record| (|:| |pos_Check?| (|Boolean|))
                                            (|:| |atan_Flag|
                                                 (|Union| #2# #3# #4# #5# #6#))
                                            (|:| |coeff_check?|
                                                 (|Union|
                                                  (|Mapping| (|Boolean|) |#2|)
                                                  #8#))
                                            (|:| |inv_check?|
                                                 (|Union|
                                                  (|Mapping| (|Boolean|) |#2|)
                                                  #8#))
                                            (|:| |zero_check?|
                                                 (|Union|
                                                  (|Mapping| (|Boolean|) |#2|)
                                                  #8#))
                                            (|:| |log_x_replace| (|Boolean|))
                                            (|:| |log_x_val| |#2|)
                                            (|:| |cache|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |ker| (|Kernel| |#2|))
                                                   (|:| |ser|
                                                        (|Union|
                                                         (|:| |%series| |#4|)
                                                         (|:| |%problem|
                                                              (|Record|
                                                               (|:| |func|
                                                                    (|String|))
                                                               (|:| |prob|
                                                                    (|String|))))))))))))
                                T)
                              '((|my_digamma| (|#2| |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 289
                                            '(1 7 16 0 17 0 6 0 18 0 7 0 19 2 7
                                              20 0 0 21 0 6 0 22 0 7 0 23 1 9 8
                                              0 24 1 8 0 25 26 2 8 0 0 0 27 2 9
                                              7 0 8 28 2 8 20 0 0 29 2 7 20 0 0
                                              30 1 9 0 0 31 2 9 8 0 8 32 1 34
                                              33 7 35 1 8 20 0 36 2 10 37 9 38
                                              39 1 7 47 0 48 2 51 49 0 50 52 1
                                              7 53 0 54 0 9 0 55 2 9 0 0 0 56 1
                                              7 53 0 57 0 9 0 58 2 9 0 0 0 59 1
                                              7 60 0 61 1 62 20 0 63 1 62 38 0
                                              64 1 62 51 0 65 1 7 0 51 66 2 9 0
                                              7 8 67 1 62 0 0 68 1 7 70 0 71 2
                                              9 0 0 38 72 2 9 0 0 25 73 1 7 75
                                              0 76 2 75 20 50 0 77 1 9 0 7 78 0
                                              8 0 79 2 9 0 0 0 80 2 7 0 0 50 81
                                              3 12 9 9 82 84 85 1 7 0 50 86 2
                                              87 0 7 7 88 2 7 0 0 89 90 2 9 0
                                              83 0 91 3 12 9 7 82 84 92 0 50 0
                                              93 2 7 0 0 0 94 2 82 9 0 25 95 2
                                              12 9 96 9 97 0 25 0 98 2 99 7 0
                                              25 100 1 11 0 7 101 2 11 0 7 38
                                              102 2 11 0 0 0 103 2 11 0 0 104
                                              105 2 11 0 0 0 106 0 11 0 107 2
                                              11 0 104 0 108 2 11 0 0 0 109 1
                                              11 0 0 110 0 8 0 111 1 6 0 25 112
                                              1 7 0 6 113 2 11 0 0 7 114 0 11 0
                                              115 1 99 7 0 116 1 118 117 0 119
                                              2 7 0 117 120 121 1 11 122 0 123
                                              2 7 0 0 124 125 3 12 9 126 9 99
                                              127 1 128 11 11 129 2 25 20 0 0
                                              130 2 9 0 25 0 131 0 104 0 132 1
                                              133 0 25 134 1 133 25 0 135 2 25
                                              0 0 0 136 2 133 25 0 25 137 2 138
                                              0 83 7 139 1 11 0 138 140 0 7 0
                                              141 1 7 0 25 143 2 7 0 0 0 144 1
                                              7 0 0 145 2 7 0 0 0 146 0 148 0
                                              149 1 7 0 0 150 1 152 7 0 153 2
                                              152 7 0 7 154 1 152 0 7 155 2 12
                                              9 11 9 156 2 9 0 7 0 157 1 9 0 0
                                              158 1 11 0 0 160 1 0 11 11 161 1
                                              7 0 0 162 1 0 7 7 163 2 11 122 0
                                              0 164 1 9 0 0 165 1 11 0 0 166 1
                                              11 0 0 167 1 11 0 0 168 2 7 0 0
                                              25 169 1 171 170 25 172 1 7 0 170
                                              173 2 9 0 0 7 174 1 6 0 0 175 1 7
                                              0 0 176 1 11 0 0 177 0 170 0 178
                                              1 7 0 0 179 1 7 33 0 180 1 118 50
                                              0 181 2 8 20 0 0 182 2 8 20 0 0
                                              183 1 50 184 0 185 1 9 8 0 186 2
                                              33 20 0 0 187 1 8 0 0 188 2 74 11
                                              11 7 189 2 74 11 11 7 190 2 74 11
                                              11 7 191 2 74 11 11 7 192 2 74 11
                                              11 7 193 3 74 11 11 7 7 194 3 128
                                              11 7 7 11 195 3 128 11 7 7 11 196
                                              3 128 11 7 7 11 197 3 128 11 7 7
                                              11 198 1 7 199 0 200 1 6 33 0 201
                                              2 7 0 0 0 202 1 7 0 0 203 1 9 0 0
                                              205 2 9 0 0 0 206 1 9 0 0 207 1 0
                                              9 9 208 1 0 9 9 209 2 0 9 9 9 210
                                              2 7 0 117 0 211 1 7 0 212 213 1
                                              118 99 0 214 2 38 20 0 0 215 2
                                              117 20 0 50 216 2 118 20 0 50 217
                                              1 10 37 9 218 2 0 41 99 221 222 1
                                              99 7 0 223 1 7 25 0 224 1 118 225
                                              0 226 2 118 20 0 0 227 1 10 37 9
                                              228 1 7 0 0 229 1 0 7 7 230 2 42
                                              20 0 0 231 1 170 25 0 232 1 7 0 0
                                              233 1 7 0 0 234 1 10 37 9 235 1
                                              10 37 9 236 1 10 37 9 237 1 10 37
                                              9 238 1 10 37 9 239 1 10 37 9 240
                                              1 10 37 9 241 1 10 37 9 242 1 10
                                              37 9 243 1 10 37 9 244 1 10 37 9
                                              245 1 10 37 9 246 1 10 37 9 247 1
                                              10 37 9 248 1 10 37 9 249 1 10 37
                                              9 250 1 10 37 9 251 1 10 37 9 252
                                              1 10 37 9 253 1 10 37 9 254 1 10
                                              37 9 255 1 10 37 9 256 1 10 37 9
                                              257 1 10 37 9 258 1 8 122 7 259 2
                                              8 0 0 0 260 1 7 261 0 262 1 7 261
                                              0 263 3 266 7 264 265 148 267 1 7
                                              0 0 268 1 7 0 0 269 2 7 0 104 0
                                              270 2 7 0 117 120 271 2 274 20
                                              184 0 275 1 7 277 0 278 1 117 20
                                              0 279 1 280 0 0 281 2 117 20 0 50
                                              282 1 9 7 0 283 0 170 0 284 2 170
                                              20 0 0 285 2 7 0 0 0 286 1 9 0 0
                                              287 2 288 7 7 50 289 2 0 41 99
                                              221 222 1 0 7 7 163 1 0 7 7 230 1
                                              0 11 11 161 2 0 9 9 9 210 1 0 9 9
                                              209 3 0 41 7 20 42 43 8 0 41 7 20
                                              42 20 7 45 45 45 46 5 0 41 7 20
                                              42 20 7 44 3 0 41 7 20 42 276 1 0
                                              9 9 208)))))
           '|lookupComplete|)) 
