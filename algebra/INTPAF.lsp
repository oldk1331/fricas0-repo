
(SDEFUN |INTPAF;UPUP2F1|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|t| |Fraction| (|SparseUnivariatePolynomial| F))
         (|cf| |Fraction| (|SparseUnivariatePolynomial| F)) (|kx| |Kernel| F)
         (|k| |Kernel| F) ($ F))
        (|INTPAF;UPUP2F0| (SPADCALL |p| |t| |cf| (QREFELT $ 19)) |kx| |k| $)) 

(SDEFUN |INTPAF;UPUP2F0|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|kx| |Kernel| F) (|k| |Kernel| F) ($ F))
        (SPADCALL |p| |kx| (SPADCALL |k| (QREFELT $ 21)) (QREFELT $ 23))) 

(SDEFUN |INTPAF;chv|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (|INTPAF;chv0| |f| |n| |a| |b| $) (QREFELT $ 14)
                  (QREFELT $ 25))) 

(SDEFUN |INTPAF;RF2UPUP|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|modulus| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|bc|
           (|Record|
            (|:| |coef1|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |coef2|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (#1=#:G177 NIL))
         (SEQ
          (LETT |bc|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (CONS #'|INTPAF;RF2UPUP!0| $)
                                     (SPADCALL |f| (QREFELT $ 29))
                                     (QREFELT $ 32))
                           |modulus| (|spadConstant| $ 34) (QREFELT $ 37)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record|
                                   (|:| |coef1|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7)))))
                                   (|:| |coef2|
                                        (|SparseUnivariatePolynomial|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))))
                                  (|Union|
                                   (|Record|
                                    (|:| |coef1|
                                         (|SparseUnivariatePolynomial|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7)))))
                                    (|:| |coef2|
                                         (|SparseUnivariatePolynomial|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7))))))
                                   "failed")
                                  #1#)))
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (CONS #'|INTPAF;RF2UPUP!1| $)
                       (SPADCALL |f| (QREFELT $ 38)) (QREFELT $ 32))
             (QCAR |bc|) (QREFELT $ 39))
            |modulus| (QREFELT $ 40)))))) 

(SDEFUN |INTPAF;RF2UPUP!1| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 27)) (QREFELT $ 28))) 

(SDEFUN |INTPAF;RF2UPUP!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 27)) (QREFELT $ 28))) 

(SDEFUN |INTPAF;split_power|
        ((|p1| |SparseUnivariatePolynomial| F) (|deg_p| |NonNegativeInteger|)
         ($ |Record| (|:| |pfac| (|SparseUnivariatePolynomial| F))
          (|:| |cofactor| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|p_fac| #1=(|SparseUnivariatePolynomial| F))
          (|e2| #2=(|NonNegativeInteger|)) (|e3| #3=(|NonNegativeInteger|))
          (|cofac| #1#)
          (|#G22| (|Record| (|:| |quotient| #2#) (|:| |remainder| #3#)))
          (|f1| #4=(|SparseUnivariatePolynomial| F))
          (|e1| #5=(|NonNegativeInteger|)) (#6=#:G205 NIL) (|fac| NIL)
          (|facl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #4#) (|:| |exponent| #5#))))
          (|fc0| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |fc0| (SPADCALL |p1| (QREFELT $ 42)))
              (LETT |facl| (SPADCALL |fc0| (QREFELT $ 47)))
              (LETT |p_fac| (|spadConstant| $ 48))
              (LETT |cofac| (|spadConstant| $ 48))
              (SEQ (LETT |fac| NIL) (LETT #6# |facl|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |fac| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |e1| (QVELT |fac| 2)) (LETT |f1| (QVELT |fac| 1))
                        (PROGN
                         (LETT |#G22| (DIVIDE2 |e1| |deg_p|))
                         (LETT |e2| (QCAR |#G22|))
                         (LETT |e3| (QCDR |#G22|))
                         |#G22|)
                        (COND
                         ((EQL |e3| (- |deg_p| 1))
                          (SEQ
                           (LETT |cofac|
                                 (SPADCALL |f1| |cofac| (QREFELT $ 50)))
                           (LETT |e3| 0) (EXIT (LETT |e2| (+ |e2| 1))))))
                        (EXIT
                         (LETT |p_fac|
                               (SPADCALL (SPADCALL |f1| |e2| (QREFELT $ 52))
                                         |p_fac| (QREFELT $ 50)))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |p_fac| |cofac|))))) 

(SDEFUN |INTPAF;linearInXIfCan|
        ((|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |xsub| F)
                    (|:| |dxsub| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |ycoeff| F))
          "failed"))
        (SPROG
         ((|xx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|b| #1=(|SparseUnivariatePolynomial| F)) (|a| #1#)
          (|d| #2=(|NonNegativeInteger|)) (#3=#:G235 NIL)
          (|q| #4=(|SparseUnivariatePolynomial| F))
          (|y_coeff| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ppow| (|SparseUnivariatePolynomial| F))
          (|np1|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ui| (|Union| (|SparseUnivariatePolynomial| F) "failed")) (|ci| #4#)
          (|i| NIL) (|cofac| (|SparseUnivariatePolynomial| F))
          (|p_fac| (|SparseUnivariatePolynomial| F))
          (|#G27|
           #5=(|Record| (|:| |pfac| (|SparseUnivariatePolynomial| F))
                        (|:| |cofactor| (|SparseUnivariatePolynomial| F))))
          (|c0| #4#) (#6=#:G236 NIL) (|#G25| #5#) (|deg_p| #2#) (|lc| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |p|
                  (SPADCALL
                   (SPADCALL (SPADCALL |y| (QREFELT $ 54)) |x| (QREFELT $ 55))
                   (QREFELT $ 57)))
            (LETT |lc| (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 38)))
            (LETT |deg_p| (SPADCALL |p| (QREFELT $ 59)))
            (LETT |y_coeff| (|spadConstant| $ 60))
            (COND
             ((SPADCALL (SPADCALL |lc| (QREFELT $ 61)) 1 (QREFELT $ 63))
              (SEQ
               (PROGN
                (LETT |#G25| (|INTPAF;split_power| |lc| |deg_p| $))
                (LETT |p_fac| (QCAR |#G25|))
                (LETT |cofac| (QCDR |#G25|))
                |#G25|)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |cofac| (QREFELT $ 61)) 1 (QREFELT $ 63))
                  (PROGN (LETT #3# (CONS 1 "failed")) (GO #7=#:G234)))
                 (#8='T
                  (SEQ
                   (LETT |p|
                         (SPADCALL (SPADCALL |cofac| (QREFELT $ 28)) |p|
                                   (QREFELT $ 64)))
                   (LETT |np1| (|spadConstant| $ 65))
                   (LETT |ppow| (|spadConstant| $ 48))
                   (SEQ (LETT |i| 0) (LETT #6# |deg_p|) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ
                         (LETT |ci|
                               (SPADCALL (SPADCALL |p| |i| (QREFELT $ 66))
                                         (QREFELT $ 38)))
                         (LETT |ui| (SPADCALL |ci| |ppow| (QREFELT $ 68)))
                         (EXIT
                          (COND
                           ((QEQCAR |ui| 1)
                            (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#)))
                           ('T
                            (SEQ
                             (LETT |np1|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCDR |ui|) (QREFELT $ 28)) |i|
                                     (QREFELT $ 69))
                                    |np1| (QREFELT $ 70)))
                             (EXIT
                              (LETT |ppow|
                                    (SPADCALL |p_fac| |ppow|
                                              (QREFELT $ 50)))))))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (LETT |p| |np1|)
                   (LETT |y_coeff|
                         (SPADCALL |y_coeff| (SPADCALL |p_fac| (QREFELT $ 28))
                                   (QREFELT $ 71)))
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 38))
                        (QREFELT $ 61))
                       1 (QREFELT $ 63))
                      (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#))))))))))))
            (LETT |c0|
                  (SPADCALL (SPADCALL |p| 0 (QREFELT $ 66)) (QREFELT $ 38)))
            (COND
             ((SPADCALL (SPADCALL |c0| (QREFELT $ 61)) 1 (QREFELT $ 63))
              (SEQ
               (PROGN
                (LETT |#G27| (|INTPAF;split_power| |c0| |deg_p| $))
                (LETT |p_fac| (QCAR |#G27|))
                (LETT |cofac| (QCDR |#G27|))
                |#G27|)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |cofac| (QREFELT $ 61)) 1 (QREFELT $ 63))
                  (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#)))
                 (#8#
                  (SEQ
                   (LETT |p|
                         (SPADCALL (SPADCALL |cofac| (QREFELT $ 28)) |p|
                                   (QREFELT $ 64)))
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 38))
                        (QREFELT $ 61))
                       1 (QREFELT $ 63))
                      (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#)))
                     (#8#
                      (SEQ (LETT |np1| (|spadConstant| $ 65))
                           (LETT |ppow| (|spadConstant| $ 48))
                           (SEQ (LETT |i| |deg_p|) G190
                                (COND ((< |i| 0) (GO G191)))
                                (SEQ
                                 (COND
                                  ((EQL |i| (SPADCALL |p| (QREFELT $ 59)))
                                   (SEQ
                                    (LETT |ci|
                                          (SPADCALL
                                           (SPADCALL |p| (QREFELT $ 58))
                                           (QREFELT $ 38)))
                                    (LETT |ui|
                                          (SPADCALL |ci| |ppow|
                                                    (QREFELT $ 68)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ui| 1)
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed"))
                                        (GO #7#)))
                                      ('T
                                       (SEQ
                                        (LETT |np1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (QCDR |ui|)
                                                          (QREFELT $ 28))
                                                |i| (QREFELT $ 69))
                                               |np1| (QREFELT $ 70)))
                                        (EXIT
                                         (LETT |p|
                                               (SPADCALL |p|
                                                         (QREFELT $
                                                                  74)))))))))))
                                 (EXIT
                                  (LETT |ppow|
                                        (SPADCALL |p_fac| |ppow|
                                                  (QREFELT $ 50)))))
                                (LETT |i| (+ |i| -1)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |p| |np1|)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| 0 (QREFELT $ 66))
                                          (QREFELT $ 38))
                                (QREFELT $ 61))
                               1 (QREFELT $ 63))
                              (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#)))
                             (#8#
                              (LETT |y_coeff|
                                    (SPADCALL |p_fac| |y_coeff|
                                              (QREFELT $ 75)))))))))))))))))
            (LETT |a| (LETT |b| (|spadConstant| $ 76)))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 65) (QREFELT $ 77)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (LETT |q|
                             (SPADCALL (SPADCALL |p| (QREFELT $ 58))
                                       (QREFELT $ 38)))
                       (QREFELT $ 61))
                      1 (QREFELT $ 63))
                     (PROGN (LETT #3# (CONS 1 "failed")) (GO #7#)))
                    ('T
                     (SEQ
                      (LETT |a|
                            (SPADCALL |a|
                                      (SPADCALL (SPADCALL |q| 1 (QREFELT $ 78))
                                                (LETT |d|
                                                      (SPADCALL |p|
                                                                (QREFELT $
                                                                         59)))
                                                (QREFELT $ 79))
                                      (QREFELT $ 80)))
                      (LETT |b|
                            (SPADCALL |b|
                                      (SPADCALL (SPADCALL |q| 0 (QREFELT $ 78))
                                                |d| (QREFELT $ 79))
                                      (QREFELT $ 81)))
                      (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 74)))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |a| (|spadConstant| $ 76) (QREFELT $ 82))
               (CONS 1 "failed"))
              (#8#
               (SEQ (LETT |xx| (SPADCALL |b| |a| (QREFELT $ 83)))
                    (EXIT
                     (CONS 0
                           (VECTOR
                            (SPADCALL |xx|
                                      (SPADCALL (QREFELT $ 15) (QREFELT $ 21))
                                      (QREFELT $ 85))
                            (SPADCALL |xx| (ELT $ 86) (QREFELT $ 88))
                            (SPADCALL |y_coeff| (SPADCALL |x| (QREFELT $ 21))
                                      (QREFELT $ 85)))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |INTPAF;prootintegrate|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((#1=#:G245 NIL)
          (|r|
           (|Union| (|Fraction| (|SparseUnivariatePolynomial| F)) "failed"))
          (|rf|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL (LETT |p| (SPADCALL |y| (QREFELT $ 54))) |x|
                            (QREFELT $ 55)))
            (LETT |rf|
                  (SPADCALL
                   (LETT |ff| (SPADCALL |f| |x| |y| |p| (QREFELT $ 89)))
                   (QREFELT $ 74)))
            (SEQ (LETT |r| (SPADCALL |rf| (QREFELT $ 91)))
                 (EXIT
                  (COND
                   ((QEQCAR |r| 0)
                    (COND
                     ((SPADCALL |rf| (|spadConstant| $ 65) (QREFELT $ 77))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL
                               (CONS #'|INTPAF;prootintegrate!0|
                                     (VECTOR $ |x|))
                               (SPADCALL (QCDR |r|) (QREFELT $ 94))
                               (QREFELT $ 98))
                              (|INTPAF;prootintegrate1|
                               (SPADCALL |ff| (QREFELT $ 99)) |x| |y| |modulus|
                               $)
                              (QREFELT $ 100)))
                       (GO #2=#:G243))))))))
            (EXIT (|INTPAF;prootintegrate1| |ff| |x| |y| |modulus| $))))
          #2# (EXIT #1#)))) 

(SDEFUN |INTPAF;prootintegrate!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 85)))))) 

(SDEFUN |INTPAF;prootintegrate1|
        ((|ff| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| |Kernel| F)
         (|modulus| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |IntegrationResult| F))
        (SPROG
         ((|dcv| (F))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#1=#:G269 NIL)
          (|m|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|qprime| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| (|SparseUnivariatePolynomial| F))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#2=#:G249 NIL)
          (|cv|
           (|Record|
            (|:| |func|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |poly|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |c1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |c2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|vz| (F)) (|vu| (F)) (|newf| (F)) (|ku| (|Kernel| F))
          (|kz| (|Kernel| F)) (|newalg| (F)) (|op_root| (|BasicOperator|))
          (|chv|
           (|Record|
            (|:| |int|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |left| (|SparseUnivariatePolynomial| F))
            (|:| |right| (|SparseUnivariatePolynomial| F))
            (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|uu|
           (|Union|
            (|Record|
             (|:| |int|
                  (|SparseUnivariatePolynomial|
                   (|Fraction| (|SparseUnivariatePolynomial| F))))
             (|:| |left| (|SparseUnivariatePolynomial| F))
             (|:| |right| (|SparseUnivariatePolynomial| F))
             (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |deg| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |r|
                (PROG2 (LETT #2# (SPADCALL |modulus| (QREFELT $ 103)))
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0)
                                  (|Record|
                                   (|:| |radicand|
                                        (|Fraction|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7))))
                                   (|:| |deg| (|NonNegativeInteger|)))
                                  (|Union|
                                   (|Record|
                                    (|:| |radicand|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    (|:| |deg| (|NonNegativeInteger|)))
                                   #3="failed")
                                  #2#)))
          (LETT |uu| (|INTPAF;changeVarIfCan| |ff| (QCAR |r|) (QCDR |r|) $))
          (EXIT
           (COND
            ((QEQCAR |uu| 0)
             (SEQ (LETT |chv| (QCDR |uu|))
                  (LETT |op_root| (SPADCALL |y| (QREFELT $ 105)))
                  (LETT |newalg|
                        (SPADCALL |op_root|
                                  (LIST
                                   (SPADCALL (QVELT |chv| 1)
                                             (SPADCALL (QREFELT $ 14)
                                                       (QREFELT $ 21))
                                             (QREFELT $ 106))
                                   (SPADCALL (QVELT |chv| 4) (QREFELT $ 108)))
                                  (QREFELT $ 110)))
                  (LETT |kz| (SPADCALL |newalg| (QREFELT $ 111)))
                  (LETT |newf|
                        (SPADCALL (QVELT |chv| 0) (LETT |ku| (QREFELT $ 14))
                                  |newalg| (QREFELT $ 23)))
                  (LETT |vu|
                        (SPADCALL (QVELT |chv| 2) (SPADCALL |x| (QREFELT $ 21))
                                  (QREFELT $ 106)))
                  (LETT |vz|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QVELT |chv| 3)
                                    (SPADCALL |x| (QREFELT $ 21))
                                    (QREFELT $ 85))
                          (SPADCALL |y| (QREFELT $ 21)) (QREFELT $ 112))
                         (SPADCALL (SPADCALL |newalg| (QREFELT $ 114))
                                   (QREFELT $ 115))
                         (QREFELT $ 112)))
                  (EXIT
                   (SPADCALL
                    (CONS #'|INTPAF;prootintegrate1!0|
                          (VECTOR $ |vz| |vu| |kz| |ku|))
                    (SPADCALL |newf| |ku| |kz| (QREFELT $ 118))
                    (QREFELT $ 121)))))
            ('T
             (SEQ
              (EXIT
               (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 123)))
                    (LETT |r|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (QVELT |cv| 1) (QREFELT $ 103)))
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|Record|
                                             (|:| |radicand|
                                                  (|Fraction|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))))
                                             (|:| |deg|
                                                  (|NonNegativeInteger|)))
                                            (|Union|
                                             (|Record|
                                              (|:| |radicand|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                              (|:| |deg|
                                                   (|NonNegativeInteger|)))
                                             #3#)
                                            #2#)))
                    (LETT |qprime|
                          (SPADCALL
                           (SPADCALL
                            (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 124)))
                            (QREFELT $ 86))
                           (QREFELT $ 28)))
                    (COND
                     ((NULL (SPADCALL |qprime| (QREFELT $ 125)))
                      (SEQ
                       (LETT |u|
                             (|INTPAF;chvarIfCan| (QVELT |cv| 0)
                              (|spadConstant| $ 60) |q|
                              (SPADCALL |qprime| (QREFELT $ 126)) $))
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |m|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 60)
                                                   (QCDR |r|) (QREFELT $ 69))
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 28))
                                          (QREFELT $ 127))
                                         (QREFELT $ 128)))
                                  (EXIT
                                   (SPADCALL
                                    (CONS #'|INTPAF;prootintegrate1!1|
                                          (VECTOR |y| |x| |cv| $ |m|))
                                    (|INTPAF;rationalInt| (QCDR |u|) (QCDR |r|)
                                     (SPADCALL (|spadConstant| $ 49) 1
                                               (QREFELT $ 79))
                                     $)
                                    (QREFELT $ 98)))))
                           (GO #4=#:G266))))))))
                    (LETT |curve|
                          (|RadicalFunctionField| (QREFELT $ 7)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|SparseUnivariatePolynomial|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                                  (SPADCALL |q| (QREFELT $ 28))
                                                  (QCDR |r|)))
                    (LETT |dcv|
                          (SPADCALL (SPADCALL (QVELT |cv| 2) (QREFELT $ 129))
                                    |x| (QREFELT $ 131)))
                    (EXIT
                     (|INTPAF;algaddx|
                      (SPADCALL
                       (CONS #'|INTPAF;prootintegrate1!2|
                             (VECTOR |y| |x| |cv| |curve| $))
                       (SPADCALL
                        (SPADCALL (QVELT |cv| 0)
                                  (|compiledLookupCheck| '|reduce|
                                                         (LIST '$
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        7))))))
                                                         |curve|))
                        (ELT $ 86)
                        (|compiledLookupCheck| '|palgintegrate|
                                               (LIST
                                                (LIST '|IntegrationResult|
                                                      (|devaluate| |curve|))
                                                (|devaluate| |curve|)
                                                (LIST '|Mapping|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| (ELT $ 7)))
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               (|AlgebraicIntegrate| (ELT $ 6)
                                                                     (ELT $ 7)
                                                                     (|SparseUnivariatePolynomial|
                                                                      (ELT $
                                                                           7))
                                                                     (|SparseUnivariatePolynomial|
                                                                      (|Fraction|
                                                                       (|SparseUnivariatePolynomial|
                                                                        (ELT $
                                                                             7))))
                                                                     |curve|)))
                       (|compiledLookupCheck| '|map|
                                              (LIST
                                               (LIST '|IntegrationResult|
                                                     (|devaluate| (ELT $ 7)))
                                               (LIST '|Mapping|
                                                     (|devaluate| (ELT $ 7))
                                                     (|devaluate| |curve|))
                                               (LIST '|IntegrationResult|
                                                     (|devaluate| |curve|)))
                                              (|IntegrationResultFunctions2|
                                               |curve| (ELT $ 7))))
                      |dcv| (SPADCALL |x| (QREFELT $ 21)) $))))
              #4# (EXIT #1#)))))))) 

(SDEFUN |INTPAF;prootintegrate1!2| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |y|)
          (LETT $ (QREFELT $$ 4))
          (LETT |curve| (QREFELT $$ 3))
          (LETT |cv| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1|
             (SPADCALL |x1|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|Fraction|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               '$)
                                              |curve|))
             (QVELT |cv| 2) (QVELT |cv| 3) |x| |y| $))))) 

(SDEFUN |INTPAF;prootintegrate1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|m| $ |cv| |x| |y|)
          (LETT |m| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |cv| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1| (|INTPAF;RF2UPUP| |x1| |m| $) (QVELT |cv| 2)
             (QVELT |cv| 3) |x| |y| $))))) 

(SDEFUN |INTPAF;prootintegrate1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|ku| |kz| |vu| |vz| $)
          (LETT |ku| (QREFELT $$ 4))
          (LETT |kz| (QREFELT $$ 3))
          (LETT |vu| (QREFELT $$ 2))
          (LETT |vz| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| (LIST |ku| |kz|) (LIST |vu| |vz|)
                      (QREFELT $ 117)))))) 

(SDEFUN |INTPAF;rationalInt|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|g| |SparseUnivariatePolynomial| F)
         ($ |IntegrationResult| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG ((#1=#:G278 NIL) (|a| (F)))
               (SEQ
                (COND
                 ((NULL (EQL (SPADCALL |g| (QREFELT $ 61)) 1))
                  (|error| "rationalInt: radicand must be linear"))
                 ('T
                  (SEQ (LETT |a| (SPADCALL |g| (QREFELT $ 132)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |n|
                                    (SPADCALL (SPADCALL |a| (QREFELT $ 133))
                                              (PROG1 (LETT #1# (- |n| 1))
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 79))
                                    (QREFELT $ 134))
                          (|INTPAF;chv| |f| |n| |a|
                           (SPADCALL (SPADCALL |g| (QREFELT $ 135))
                                     (QREFELT $ 132))
                           $)
                          (QREFELT $ 75))
                         (QREFELT $ 94))))))))) 

(SDEFUN |INTPAF;chv0|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F) ($ F))
        (SPROG ((|d| (F)))
               (SEQ (LETT |d| (SPADCALL (QREFELT $ 14) (QREFELT $ 21)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |d| (QREFELT $ 27))
                                          (QREFELT $ 28))
                                (QREFELT $ 136))
                      (SPADCALL
                       (SPADCALL (SPADCALL |d| |n| (QREFELT $ 137)) |b|
                                 (QREFELT $ 138))
                       |a| (QREFELT $ 139))
                      (QREFELT $ 85)))))) 

(SDEFUN |INTPAF;candidates|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |List|
          (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                    (|:| |right| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |left| (|SparseUnivariatePolynomial| F))
                      (|:| |right| (|SparseUnivariatePolynomial| F)))))
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|xi| (|SparseUnivariatePolynomial| F)) (#1=#:G292 NIL) (|i| NIL))
         (SEQ (LETT |l| NIL)
              (EXIT
               (COND ((SPADCALL |p| (QREFELT $ 140)) |l|)
                     ('T
                      (SEQ
                       (SEQ (LETT |i| 2)
                            (LETT #1# (SPADCALL |p| (QREFELT $ 61))) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (LETT |u|
                                   (SPADCALL |p|
                                             (LETT |xi|
                                                   (SPADCALL
                                                    (|spadConstant| $ 49) |i|
                                                    (QREFELT $ 79)))
                                             (QREFELT $ 141)))
                             (EXIT
                              (COND
                               ((QEQCAR |u| 0)
                                (LETT |l|
                                      (CONS (CONS (QCDR |u|) |xi|) |l|))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS
                         (CONS
                          (SPADCALL (|spadConstant| $ 49) 1 (QREFELT $ 79))
                          |p|)
                         |l|))))))))) 

(SDEFUN |INTPAF;changeVarIfCan|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|radi| |Fraction| (|SparseUnivariatePolynomial| F))
         (|n| |NonNegativeInteger|)
         ($ |Union|
          (|Record|
           (|:| |int|
                (|SparseUnivariatePolynomial|
                 (|Fraction| (|SparseUnivariatePolynomial| F))))
           (|:| |left| (|SparseUnivariatePolynomial| F))
           (|:| |right| (|SparseUnivariatePolynomial| F))
           (|:| |den| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |deg| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((#1=#:G306 NIL) (#2=#:G307 NIL)
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (#3=#:G308 NIL) (|cnd| NIL)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (EXIT
           (SEQ (LETT |rec| (SPADCALL |radi| |n| (QREFELT $ 143)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |cnd| NIL)
                       (LETT #3# (|INTPAF;candidates| (QVELT |rec| 2) $)) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |cnd| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |u|
                              (|INTPAF;chvarIfCan| |p| (QVELT |rec| 1)
                               (QCDR |cnd|)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |cnd|) (QREFELT $ 86))
                                 (QREFELT $ 28))
                                (QREFELT $ 126))
                               $))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2#
                                         (CONS 0
                                               (VECTOR (QCDR |u|) (QCAR |cnd|)
                                                       (QCDR |cnd|)
                                                       (QVELT |rec| 1)
                                                       (QVELT |rec| 0))))
                                   (GO #4=#:G305)))
                            (GO #5=#:G303))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))
          #4# (EXIT #2#)))) 

(SDEFUN |INTPAF;chvarIfCan|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|d| |Fraction| (|SparseUnivariatePolynomial| F))
         (|u| |SparseUnivariatePolynomial| F)
         (|u1| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union|
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseUnivariatePolynomial| F)))
          "failed"))
        (SPROG
         ((|ans|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#1=#:G320 NIL)
          (|v|
           (|Union| (|Fraction| (|SparseUnivariatePolynomial| F)) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 65))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 65) (QREFELT $ 77)))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |u1| (SPADCALL |p| (QREFELT $ 58))
                                        (QREFELT $ 144))
                              (SPADCALL |d| (SPADCALL |p| (QREFELT $ 59))
                                        (QREFELT $ 145))
                              (QREFELT $ 71))
                             |u| (QREFELT $ 147)))
                      (EXIT
                       (COND
                        ((QEQCAR |v| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #2=#:G319)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |v|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 59))
                                                    (QREFELT $ 69))
                                          (QREFELT $ 70)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 74)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |ans|))))
          #2# (EXIT #1#)))) 

(SDEFUN |INTPAF;algaddx|
        ((|i| |IntegrationResult| F) (|dxx| F) (|xx| F)
         ($ |IntegrationResult| F))
        (SPROG ((#1=#:G327 NIL) (|ne| NIL) (#2=#:G326 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 148)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 149))
                                 (SPADCALL |i| (QREFELT $ 152))
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |ne| NIL)
                                       (LETT #1#
                                             (SPADCALL |i| (QREFELT $ 155)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |ne| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |ne|) |dxx|
                                                           (QREFELT $ 112))
                                                 |xx|)
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 156))))))) 

(SDEFUN |INTPAF;prootRDE|
        ((|nfp| F) (|f| F) (|g| F) (|x| |Kernel| F) (|k| |Kernel| F)
         (|rde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         ($ |Union| F #2#))
        (SPROG
         ((#3=#:G348 NIL)
          (|rc|
           (|Record| (|:| |particular| (|Union| |curve| #4="failed"))
                     (|:| |basis| (|List| |curve|))))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#5=#:G353 NIL) (|c1| (F)) (|u| #1#) (#6=#:G340 NIL)
          (|ug|
           #7=(|Union|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|SparseUnivariatePolynomial| F)))
               "failed"))
          (|gg|
           #8=(|SparseUnivariatePolynomial|
               (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|uf| #7#) (|ff| #8#)
          (|dqdx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| #9=(|SparseUnivariatePolynomial| F))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| #9#)))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#10=#:G333 NIL)
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL (LETT |p| (SPADCALL |k| (QREFELT $ 54))) |x|
                            (QREFELT $ 55)))
            (LETT |r|
                  (PROG2 (LETT #10# (SPADCALL |modulus| (QREFELT $ 103)))
                      (QCDR #10#)
                    (|check_union2| (QEQCAR #10# 0)
                                    (|Record|
                                     (|:| |radicand|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 7))))
                                     (|:| |deg| (|NonNegativeInteger|)))
                                    (|Union|
                                     (|Record|
                                      (|:| |radicand|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                      (|:| |deg| (|NonNegativeInteger|)))
                                     "failed")
                                    #10#)))
            (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 143)))
            (LETT |dqdx|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (LETT |q| (QVELT |rec| 2)) (QREFELT $ 86))
                    (QREFELT $ 28))
                   (QREFELT $ 126)))
            (SEQ
             (LETT |uf|
                   (|INTPAF;chvarIfCan|
                    (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 89)))
                    (QVELT |rec| 1) |q| (|spadConstant| $ 60) $))
             (EXIT
              (COND
               ((QEQCAR |uf| 0)
                (SEQ
                 (LETT |ug|
                       (|INTPAF;chvarIfCan|
                        (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 89)))
                        (QVELT |rec| 1) |q| |dqdx| $))
                 (EXIT
                  (COND
                   ((QEQCAR |ug| 0)
                    (PROGN
                     (LETT #5#
                           (SEQ
                            (LETT |u|
                                  (SPADCALL
                                   (|INTPAF;chv0| (QCDR |uf|) (QVELT |rec| 0)
                                    (|spadConstant| $ 49) (|spadConstant| $ 73)
                                    $)
                                   (SPADCALL
                                    (SPADCALL (QVELT |rec| 0)
                                              (SPADCALL
                                               (SPADCALL (QREFELT $ 14)
                                                         (QREFELT $ 21))
                                               (SPADCALL (QVELT |rec| 0)
                                                         (- (QVELT |rec| 0) 1)
                                                         (QREFELT $ 157))
                                               (QREFELT $ 158))
                                              (QREFELT $ 159))
                                    (|INTPAF;chv0| (QCDR |ug|) (QVELT |rec| 0)
                                     (|spadConstant| $ 49)
                                     (|spadConstant| $ 73) $)
                                    (QREFELT $ 112))
                                   (PROG2
                                       (LETT #6#
                                             (SPADCALL (QREFELT $ 14)
                                                       (QREFELT $ 161)))
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 0) (|Symbol|)
                                                     (|Union| (|Symbol|)
                                                              "failed")
                                                     #6#))
                                   |rde|))
                            (EXIT
                             (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                   (#11='T
                                    (SEQ
                                     (LETT |c1|
                                           (SPADCALL (QVELT |rec| 1) |x|
                                                     (QREFELT $ 131)))
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL (QCDR |u|) (QREFELT $ 14)
                                                      (SPADCALL |c1|
                                                                (SPADCALL |k|
                                                                          (QREFELT
                                                                           $
                                                                           21))
                                                                (QREFELT $
                                                                         112))
                                                      (QREFELT $ 162))))))))))
                     (GO #12=#:G351))))))))))
            (EXIT
             (COND
              ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 60) (QREFELT $ 163))
               (SEQ
                (LETT |curve|
                      (|RadicalFunctionField| (QREFELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|SparseUnivariatePolynomial|
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))))
                                              (SPADCALL |q| (QREFELT $ 28))
                                              (QVELT |rec| 0)))
                (LETT |rc|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (|compiledLookupCheck| 'D (LIST '$)
                                                (|LinearOrdinaryDifferentialOperator1|
                                                 |curve|)))
                        (SPADCALL
                         (SPADCALL (SPADCALL |nfp| |x| |k| |p| (QREFELT $ 89))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '$ (|devaluate| |curve|))
                                                (|LinearOrdinaryDifferentialOperator1|
                                                 |curve|)))
                        (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                               (|LinearOrdinaryDifferentialOperator1|
                                                |curve|)))
                       (SPADCALL (SPADCALL |g| |x| |k| |p| (QREFELT $ 89))
                                 (|compiledLookupCheck| '|reduce|
                                                        (LIST '$
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $
                                                                       7))))))
                                                        |curve|))
                       (|compiledLookupCheck| '|algDsolve|
                                              (LIST
                                               (LIST '|Record|
                                                     (LIST '|:| '|particular|
                                                           (LIST '|Union|
                                                                 (|devaluate|
                                                                  |curve|)
                                                                 '#4#))
                                                     (LIST '|:| '|basis|
                                                           (LIST '|List|
                                                                 (|devaluate|
                                                                  |curve|))))
                                               (LIST
                                                '|LinearOrdinaryDifferentialOperator1|
                                                (|devaluate| |curve|))
                                               (|devaluate| |curve|))
                                              (|PureAlgebraicLODE| (ELT $ 7)
                                                                   (|SparseUnivariatePolynomial|
                                                                    (ELT $ 7))
                                                                   (|SparseUnivariatePolynomial|
                                                                    (|Fraction|
                                                                     (|SparseUnivariatePolynomial|
                                                                      (ELT $
                                                                           7))))
                                                                   |curve|))))
                (EXIT
                 (COND ((QEQCAR (QCAR |rc|) 1) (CONS 1 "failed"))
                       (#11#
                        (CONS 0
                              (|INTPAF;UPUP2F0|
                               (SPADCALL
                                (PROG2 (LETT #3# (QCAR |rc|))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) |curve|
                                                  (|Union| |curve| #4#) #3#))
                                (|compiledLookupCheck| '|lift|
                                                       (LIST
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST '|Fraction|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 (ELT $ 7)))))
                                                        '$)
                                                       |curve|))
                               |x| |k| $)))))))
              (#11# (|INTPAF;palgRDE1| |nfp| |g| |x| |k| $))))))
          #12# (EXIT #5#)))) 

(SDEFUN |INTPAF;change_back|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F)) (|x| |Kernel| F)
         (|k| |Kernel| F) (|cc| |Fraction| (|SparseUnivariatePolynomial| F))
         (|m| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ F))
        (SPROG
         ((|fu2|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|fu|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |fu| (|INTPAF;RF2UPUP| |f| |m| $))
              (LETT |fu2|
                    (SPADCALL |fu| (QREFELT $ 166)
                              (SPADCALL |cc| 1 (QREFELT $ 69))
                              (QREFELT $ 167)))
              (EXIT (|INTPAF;UPUP2F0| |fu2| |x| |k| $))))) 

(SDEFUN |INTPAF;palgRDE1|
        ((|nfp| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union| F "failed"))
        (SPROG ((#1=#:G360 NIL))
               (QCAR
                (|INTPAF;palgLODE1| (LIST |nfp| (|spadConstant| $ 49)) |g| |x|
                 |y|
                 (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 161)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                   (|Union| (|Symbol|) "failed") #1#))
                 $)))) 

(SDEFUN |INTPAF;param_RDE;FL2KR;18|
        ((|fp| F) (|lg| |List| F) (|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| F))))
        (SPADCALL (LIST |fp| (|spadConstant| $ 49)) |lg| |x| |y|
                  (QREFELT $ 171))) 

(SDEFUN |INTPAF;param_LODE;2L2KR;19|
        ((|eq| |List| F) (|lg| |List| F) (|kx| |Kernel| F) (|y| |Kernel| F)
         ($ |Record|
          (|:| |particular|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|:| |basis| (|List| F))))
        (SPROG
         ((|part1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#1=#:G382 NIL) (|be| NIL) (#2=#:G381 NIL) (|bas1| (|List| F))
          (#3=#:G380 NIL) (|h| NIL) (#4=#:G379 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| |curve|)
                            (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| |curve|))))
          (#5=#:G378 NIL) (|g| NIL) (#6=#:G377 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator1| |curve|))
          (#7=#:G376 NIL) (|f| NIL) (|i| NIL)
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL (LETT |p| (SPADCALL |y| (QREFELT $ 54))) |kx|
                          (QREFELT $ 55)))
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          |modulus|))
          (LETT |neq|
                (SPADCALL
                 (|compiledLookupCheck| '|Zero| (LIST '$)
                                        (|LinearOrdinaryDifferentialOperator1|
                                         |curve|))))
          (SEQ (LETT |i| 0) (LETT |f| NIL) (LETT #7# |eq|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |neq|
                       (SPADCALL |neq|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |f| |kx| |y| |p| (QREFELT $ 89))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                                  |i|
                                  (|compiledLookupCheck| '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                |curve|)
                                                               (LIST
                                                                '|NonNegativeInteger|))
                                                         (|LinearOrdinaryDifferentialOperator1|
                                                          |curve|)))
                                 (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                        (|LinearOrdinaryDifferentialOperator1|
                                                         |curve|))))))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|)))) (GO G190)
               G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |neq|
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |g| NIL) (LETT #5# |lg|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |g| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |g| |kx| |y| |p|
                                                    (QREFELT $ 89))
                                          (|compiledLookupCheck| '|reduce|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (LIST
                                                                         '|Fraction|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            7))))))
                                                                 |curve|))
                                         #6#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          (|compiledLookupCheck| '|algDsolve|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:|
                                                              '|particular|
                                                              (LIST '|List|
                                                                    (LIST
                                                                     '|Record|
                                                                     (LIST '|:|
                                                                           '|ratpart|
                                                                           (|devaluate|
                                                                            |curve|))
                                                                     (LIST '|:|
                                                                           '|coeffs|
                                                                           (LIST
                                                                            '|Vector|
                                                                            (|devaluate|
                                                                             (ELT
                                                                              $
                                                                              7)))))))
                                                        (LIST '|:| '|basis|
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |curve|))))
                                                  (LIST
                                                   '|LinearOrdinaryDifferentialOperator1|
                                                   (|devaluate| |curve|))
                                                  (LIST '|List|
                                                        (|devaluate| |curve|)))
                                                 (|PureAlgebraicLODE| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SparseUnivariatePolynomial|
                                                                       (|Fraction|
                                                                        (|SparseUnivariatePolynomial|
                                                                         (ELT $
                                                                              7))))
                                                                      |curve|))))
          (LETT |bas1|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |h| NIL) (LETT #3# (QCDR |rec|)) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (|INTPAF;UPUP2F0|
                                (SPADCALL |h|
                                          (|compiledLookupCheck| '|lift|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           7)))))
                                                                  '$)
                                                                 |curve|))
                                |kx| |y| $)
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |part1|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |be| NIL) (LETT #1# (QCAR |rec|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |be| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS
                                (|INTPAF;UPUP2F0|
                                 (SPADCALL (QCAR |be|)
                                           (|compiledLookupCheck| '|lift|
                                                                  (LIST
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|SparseUnivariatePolynomial|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))))
                                                                   '$)
                                                                  |curve|))
                                 |kx| |y| $)
                                (QCDR |be|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (CONS |part1| |bas1|))))) 

(SDEFUN |INTPAF;palgLODE1|
        ((|eq| |List| F) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F)
         (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G407 NIL) (|h| NIL) (#2=#:G406 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Union| |curve| #3="failed"))
                     (|:| |basis| (|List| |curve|))))
          (#4=#:G393 NIL) (|bas| (|List| F)) (#5=#:G405 NIL) (#6=#:G404 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator1| |curve|))
          (#7=#:G403 NIL) (|f| NIL) (|i| NIL)
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL (LETT |p| (SPADCALL |y| (QREFELT $ 54))) |kx|
                          (QREFELT $ 55)))
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          |modulus|))
          (LETT |neq|
                (SPADCALL
                 (|compiledLookupCheck| '|Zero| (LIST '$)
                                        (|LinearOrdinaryDifferentialOperator1|
                                         |curve|))))
          (SEQ (LETT |i| 0) (LETT |f| NIL) (LETT #7# |eq|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |neq|
                       (SPADCALL |neq|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |f| |kx| |y| |p| (QREFELT $ 89))
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                          |curve|))
                                  |i|
                                  (|compiledLookupCheck| '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                |curve|)
                                                               (LIST
                                                                '|NonNegativeInteger|))
                                                         (|LinearOrdinaryDifferentialOperator1|
                                                          |curve|)))
                                 (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                        (|LinearOrdinaryDifferentialOperator1|
                                                         |curve|))))))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|)))) (GO G190)
               G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL
              (SPADCALL |y|
                        (SPADCALL |kx|
                                  (SPADCALL (SPADCALL |g| (QREFELT $ 173)) |x|
                                            (QREFELT $ 176))
                                  (QREFELT $ 177))
                        (QREFELT $ 177)))
             (SEQ
              (LETT |rec|
                    (SPADCALL |neq|
                              (SPADCALL
                               (SPADCALL |g| |kx| |y| |p| (QREFELT $ 89))
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '$
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                      |curve|))
                              (|compiledLookupCheck| '|algDsolve|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:|
                                                                  '|particular|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    |curve|)
                                                                   '#3#))
                                                            (LIST '|:| '|basis|
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |curve|))))
                                                      (LIST
                                                       '|LinearOrdinaryDifferentialOperator1|
                                                       (|devaluate| |curve|))
                                                      (|devaluate| |curve|))
                                                     (|PureAlgebraicLODE|
                                                      (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|))))
              (LETT |bas|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |h| NIL) (LETT #5# (QCDR |rec|)) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |h| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (|INTPAF;UPUP2F0|
                                    (SPADCALL |h|
                                              (|compiledLookupCheck| '|lift|
                                                                     (LIST
                                                                      (LIST
                                                                       '|SparseUnivariatePolynomial|
                                                                       (LIST
                                                                        '|Fraction|
                                                                        (LIST
                                                                         '|SparseUnivariatePolynomial|
                                                                         (|devaluate|
                                                                          (ELT
                                                                           $
                                                                           7)))))
                                                                      '$)
                                                                     |curve|))
                                    |kx| |y| $)
                                   #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (EXIT
               (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                     (#8='T
                      (CONS
                       (CONS 0
                             (|INTPAF;UPUP2F0|
                              (SPADCALL
                               (PROG2 (LETT #4# (QCAR |rec|))
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0) |curve|
                                                 (|Union| |curve| #3#) #4#))
                               (|compiledLookupCheck| '|lift|
                                                      (LIST
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate|
                                                                (ELT $ 7)))))
                                                       '$)
                                                      |curve|))
                              |kx| |y| $))
                       |bas|))))))
            (#8#
             (SEQ
              (LETT |rec|
                    (SPADCALL |neq|
                              (SPADCALL
                               (|compiledLookupCheck| '|Zero| (LIST '$)
                                                      |curve|))
                              (|compiledLookupCheck| '|algDsolve|
                                                     (LIST
                                                      (LIST '|Record|
                                                            (LIST '|:|
                                                                  '|particular|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    |curve|)
                                                                   '#3#))
                                                            (LIST '|:| '|basis|
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         |curve|))))
                                                      (LIST
                                                       '|LinearOrdinaryDifferentialOperator1|
                                                       (|devaluate| |curve|))
                                                      (|devaluate| |curve|))
                                                     (|PureAlgebraicLODE|
                                                      (ELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (ELT $ 7))
                                                      (|SparseUnivariatePolynomial|
                                                       (|Fraction|
                                                        (|SparseUnivariatePolynomial|
                                                         (ELT $ 7))))
                                                      |curve|))))
              (EXIT
               (CONS (CONS 1 "failed")
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |h| NIL) (LETT #1# (QCDR |rec|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|INTPAF;UPUP2F0|
                                     (SPADCALL |h|
                                               (|compiledLookupCheck| '|lift|
                                                                      (LIST
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (LIST
                                                                         '|Fraction|
                                                                         (LIST
                                                                          '|SparseUnivariatePolynomial|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            7)))))
                                                                       '$)
                                                                      |curve|))
                                     |kx| |y| $)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))))))) 

(SDEFUN |INTPAF;palgintegrate|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|dcv| (F))
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|cv|
           (|Record|
            (|:| |func|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |poly|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |c1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |c2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL (LETT |p| (SPADCALL |k| (QREFELT $ 54))) |x|
                          (QREFELT $ 55)))
          (LETT |cv|
                (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 89)) |modulus|
                          (QREFELT $ 123)))
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (QVELT |cv| 1)))
          (LETT |dcv|
                (SPADCALL (SPADCALL (QVELT |cv| 2) (QREFELT $ 129)) |x|
                          (QREFELT $ 131)))
          (SPADCALL (QVELT |cv| 4)
                    (|compiledLookupCheck| '|knownInfBasis|
                                           (LIST (LIST '|Void|)
                                                 (LIST '|NonNegativeInteger|))
                                           |curve|))
          (EXIT
           (|INTPAF;algaddx|
            (SPADCALL
             (CONS #'|INTPAF;palgintegrate!0| (VECTOR |k| |x| |cv| |curve| $))
             (SPADCALL
              (SPADCALL (QVELT |cv| 0)
                        (|compiledLookupCheck| '|reduce|
                                               (LIST '$
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Fraction|
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              (ELT $ 7))))))
                                               |curve|))
              (ELT $ 86)
              (|compiledLookupCheck| '|palgintegrate|
                                     (LIST
                                      (LIST '|IntegrationResult|
                                            (|devaluate| |curve|))
                                      (|devaluate| |curve|)
                                      (LIST '|Mapping|
                                            (LIST '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))
                                            (LIST '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))))
                                     (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                           (|SparseUnivariatePolynomial|
                                                            (ELT $ 7))
                                                           (|SparseUnivariatePolynomial|
                                                            (|Fraction|
                                                             (|SparseUnivariatePolynomial|
                                                              (ELT $ 7))))
                                                           |curve|)))
             (|compiledLookupCheck| '|map|
                                    (LIST
                                     (LIST '|IntegrationResult|
                                           (|devaluate| (ELT $ 7)))
                                     (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                           (|devaluate| |curve|))
                                     (LIST '|IntegrationResult|
                                           (|devaluate| |curve|)))
                                    (|IntegrationResultFunctions2| |curve|
                                                                   (ELT $ 7))))
            |dcv| (SPADCALL |x| (QREFELT $ 21)) $))))) 

(SDEFUN |INTPAF;palgintegrate!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |k|)
          (LETT $ (QREFELT $$ 4))
          (LETT |curve| (QREFELT $$ 3))
          (LETT |cv| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1|
             (SPADCALL |x1|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|Fraction|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate|
                                                        (ELT $ 7)))))
                                               '$)
                                              |curve|))
             (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $))))) 

(SDEFUN |INTPAF;palgint;F2KIr;22|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (COND
                          ((SPADCALL |y| '|nthRoot| (QREFELT $ 178))
                           (|INTPAF;prootintegrate| |f| |x| |y| $))
                          ((SPADCALL |y| '|rootOf| (QREFELT $ 178))
                           (|INTPAF;palgintegrate| |f| |x| |y| $))
                          (#1='T
                           (|error| "failed - cannot handle that integrand"))))
                        (#1#
                         (SPADCALL |f| |x| |y| (QCAR (QCDR |u|))
                                   (QCDR (QCDR |u|)) (QREFELT $ 179)))))))
                (#1#
                 (SPADCALL |f| |x| |y| (QREFELT $ 15) (QVELT (QCDR |v|) 0)
                           (QVELT (QCDR |v|) 1) (QVELT (QCDR |v|) 2)
                           (QREFELT $ 180)))))))) 

(SDEFUN |INTPAF;palgRDE;3F2KMU;23|
        ((|nfp| F) (|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rde| |Mapping| (|Union| F #1="failed") F F (|Symbol|))
         ($ |Union| F #1#))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (COND
                          ((SPADCALL |y| '|nthRoot| (QREFELT $ 178))
                           (|INTPAF;prootRDE| |nfp| |f| |g| |x| |y| |rde| $))
                          (#2='T (|INTPAF;palgRDE1| |nfp| |g| |x| |y| $))))
                        (#2#
                         (SPADCALL |f| |g| |x| |y| |rde| (QCAR (QCDR |u|))
                                   (QCDR (QCDR |u|)) (QREFELT $ 183)))))))
                (#2#
                 (SPADCALL |f| |g| |x| |y| |rde| (QREFELT $ 15)
                           (QVELT (QCDR |v|) 0) (QVELT (QCDR |v|) 1)
                           (QVELT (QCDR |v|) 2) (QREFELT $ 184)))))))) 

(SDEFUN |INTPAF;quadIfCan|
        ((|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |coef| F)
                    (|:| |poly| (|SparseUnivariatePolynomial| F)))
          "failed"))
        (SPROG
         ((|radi| (|SparseUnivariatePolynomial| F))
          (|d| (|SparseUnivariatePolynomial| F))
          (|ff| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((EQL
             (SPADCALL (LETT |p| (SPADCALL |y| (QREFELT $ 54))) (QREFELT $ 61))
             2)
            (COND
             ((SPADCALL (SPADCALL |p| 1 (QREFELT $ 78)) (QREFELT $ 186))
              (EXIT
               (SEQ
                (LETT |d|
                      (SPADCALL
                       (LETT |ff|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |p| 0 (QREFELT $ 78))
                                         (SPADCALL |p| 2 (QREFELT $ 78))
                                         (QREFELT $ 139))
                               (QREFELT $ 187))
                              |x| (QREFELT $ 25)))
                       (QREFELT $ 29)))
                (EXIT
                 (COND
                  ((EQL
                    (SPADCALL
                     (LETT |radi|
                           (SPADCALL |d| (SPADCALL |ff| (QREFELT $ 38))
                                     (QREFELT $ 50)))
                     (QREFELT $ 61))
                    2)
                   (CONS 0
                         (CONS
                          (SPADCALL |d| (SPADCALL |x| (QREFELT $ 21))
                                    (QREFELT $ 106))
                          |radi|)))
                  ('T (CONS 1 "failed"))))))))))
          (EXIT (CONS 1 "failed"))))) 

(SDEFUN |INTPAF;palgLODE;LF2KSR;25|
        ((|eq| L) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G473 NIL) (|i| NIL) (#2=#:G472 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |ycoeff| F))
            "failed")))
         (SEQ (LETT |v| (|INTPAF;linearInXIfCan| |kx| |y| $))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ (LETT |u| (|INTPAF;quadIfCan| |kx| |y| $))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (|INTPAF;palgLODE1|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |i| 0)
                                (LETT #1# (SPADCALL |eq| (QREFELT $ 188))) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL |eq| |i| (QREFELT $ 189))
                                         #2#))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          |g| |kx| |y| |x| $))
                        (#3='T
                         (SPADCALL |eq| |g| |kx| |y| (QCAR (QCDR |u|))
                                   (QCDR (QCDR |u|)) (QREFELT $ 191)))))))
                (#3#
                 (SPADCALL |eq| |g| |kx| |y| (QREFELT $ 15)
                           (QVELT (QCDR |v|) 0) (QVELT (QCDR |v|) 1)
                           (QVELT (QCDR |v|) 2) (QREFELT $ 192)))))))) 

(DECLAIM (NOTINLINE |PureAlgebraicIntegration;|)) 

(DEFUN |PureAlgebraicIntegration| (&REST #1=#:G474)
  (SPROG NIL
         (PROG (#2=#:G475)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PureAlgebraicIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PureAlgebraicIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PureAlgebraicIntegration|)))))))))) 

(DEFUN |PureAlgebraicIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|PureAlgebraicIntegration| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 194))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))))
          (|haddProp| |$ConstructorCache| '|PureAlgebraicIntegration|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 14 (SPADCALL (QREFELT $ 11) (QREFELT $ 13)))
          (QSETREFV $ 15 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 13)))
          (QSETREFV $ 166 (SPADCALL (QREFELT $ 165)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 193
                      (CONS (|dispatchFunction| |INTPAF;palgLODE;LF2KSR;25|)
                            $))))
          $))) 

(MAKEPROP '|PureAlgebraicIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) '|dummy| (|Kernel| 7)
              (4 . |kernel|) '|dumk| '|dumk2| (|SparseUnivariatePolynomial| 17)
              (|Fraction| 26) (|ChangeOfVariable| 7 26 16) (9 . |eval|)
              (|Kernel| $) (16 . |coerce|) (|GenusZeroIntegration| 6 7 8)
              (21 . |multivariate|) (|Fraction| 53) (28 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (34 . |coerce|) (39 . |coerce|)
              (44 . |denom|) (|Mapping| 17 7)
              (|SparseUnivariatePolynomialFunctions2| 7 17) (49 . |map|)
              (55 . |One|) (59 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 35 '"failed")
              (63 . |extendedEuclidean|) (70 . |numer|) (75 . *) (81 . |rem|)
              (|Factored| $) (87 . |squareFree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 43) (|:| |factor| 26) (|:| |exponent| 51))
              (|List| 44) (|Factored| 26) (92 . |factorList|) (97 . |One|)
              (101 . |One|) (105 . *) (|NonNegativeInteger|) (111 . ^)
              (|SparseUnivariatePolynomial| $) (117 . |minPoly|) (122 . |lift|)
              (|UnivariatePolynomialCommonDenominator| 26 17 16)
              (128 . |clearDenominator|) (133 . |leadingCoefficient|)
              (138 . |degree|) (143 . |One|) (147 . |degree|) (|Boolean|)
              (152 . >) (158 . *) (164 . |Zero|) (168 . |coefficient|)
              (|Union| $ '"failed") (174 . |exquo|) (180 . |monomial|)
              (186 . +) (192 . /) (198 . |Zero|) (202 . |Zero|)
              (206 . |reductum|) (211 . *) (217 . |Zero|) (221 . ~=)
              (227 . |coefficient|) (233 . |monomial|) (239 . +) (245 . -)
              (251 . =) (257 . /) (|Fraction| $) (263 . |elt|)
              (269 . |differentiate|) (|Mapping| 26 26) (274 . |differentiate|)
              (280 . |univariate|) (|Union| 17 '"failed")
              (288 . |retractIfCan|) (|IntegrationResult| 17)
              (|RationalIntegration| 7 26) (293 . |integrate|)
              (|IntegrationResult| 7) (|Mapping| 7 17)
              (|IntegrationResultFunctions2| 17 7) (298 . |map|)
              (304 . |leadingMonomial|) (309 . +)
              (|Record| (|:| |radicand| 17) (|:| |deg| 51))
              (|Union| 101 '"failed") (315 . |radPoly|) (|BasicOperator|)
              (320 . |operator|) (325 . |elt|) (|Integer|) (331 . |coerce|)
              (|List| $) (336 . |kernel|) (342 . |retract|) (347 . *)
              (|SparseMultivariatePolynomial| 6 20) (353 . |denom|)
              (358 . |coerce|) (|List| 20) (363 . |eval|)
              |INTPAF;palgint;F2KIr;22| (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (370 . |map|)
              (|Record| (|:| |func| 16) (|:| |poly| 16) (|:| |c1| 17)
                        (|:| |c2| 17) (|:| |deg| 51))
              (376 . |chvar|) (382 . |retract|) (387 . |zero?|) (392 . |inv|)
              (397 . |coerce|) (402 . -) (408 . |differentiate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 12)
                                                     7)
              (413 . |multivariate|) (419 . |leadingCoefficient|) (424 . |inv|)
              (429 . *) (435 . |reductum|) (440 . |elt|) (446 . ^) (452 . -)
              (458 . /) (464 . |ground?|) (469 . |composite|)
              (|Record| (|:| |exponent| 51) (|:| |coef| 17)
                        (|:| |radicand| 26))
              (475 . |rootPoly|) (481 . *) (487 . ^) (|Union| 84 '"failed")
              (493 . |composite|) (499 . |elem?|) (504 . |ratpart|)
              (|Record| (|:| |scalar| (|Fraction| 107)) (|:| |coeff| 26)
                        (|:| |logand| 26))
              (|List| 150) (509 . |logpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 153)
              (514 . |notelem|) (519 . |mkAnswer|) (526 . *) (532 . ^)
              (538 . *) (|Union| 9 '"failed") (544 . |symbolIfCan|)
              (549 . |eval|) (556 . =) (|SingletonAsOrderedSet|)
              (562 . |create|) '|sdummy| (566 . |eval|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| (|Vector| 7)))
              (|Record| (|:| |particular| (|List| 168)) (|:| |basis| 170))
              (|List| 7) |INTPAF;param_LODE;2L2KR;19|
              |INTPAF;param_RDE;FL2KR;18| (573 . |kernels|) (|List| 12)
              (|IntegrationTools| 6 7) (578 . |varselect|) (584 . |remove!|)
              (590 . |is?|) (596 . |palgint0|) (605 . |palgint0|)
              (|Union| 7 '"failed") (|Mapping| 181 7 7 9) (616 . |palgRDE0|)
              (627 . |palgRDE0|) |INTPAF;palgRDE;3F2KMU;23| (640 . |zero?|)
              (645 . -) (650 . |degree|) (655 . |coefficient|)
              (|Record| (|:| |particular| 181) (|:| |basis| 170))
              (661 . |palgLODE0|) (671 . |palgLODE0|) (683 . |palgLODE|))
           '#(|param_RDE| 692 |param_LODE| 700 |palgint| 708 |palgRDE| 715
              |palgLODE| 725)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|palgint|
                                 ((|IntegrationResult| |#2|) |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|)))
                                T)
                              '((|palgRDE|
                                 ((|Union| |#2| #1="failed") |#2| |#2| |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Mapping| (|Union| |#2| #1#) |#2| |#2|
                                             (|Symbol|))))
                                T)
                              '((|param_RDE|
                                 ((|Record|
                                   (|:| |particular|
                                        (|List|
                                         (|Record| (|:| |ratpart| |#2|)
                                                   (|:| |coeffs|
                                                        (|Vector| |#2|)))))
                                   (|:| |basis| (|List| |#2|)))
                                  |#2| (|List| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|)))
                                T)
                              '((|param_LODE|
                                 ((|Record|
                                   (|:| |particular|
                                        (|List|
                                         (|Record| (|:| |ratpart| |#2|)
                                                   (|:| |coeffs|
                                                        (|Vector| |#2|)))))
                                   (|:| |basis| (|List| |#2|)))
                                  (|List| |#2|) (|List| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|)))
                                T)
                              '((|palgLODE|
                                 ((|Record|
                                   (|:| |particular| (|Union| |#2| #1#))
                                   (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Symbol|)))
                                (|has| 8
                                       (|LinearOrdinaryDifferentialOperatorCategory|
                                        7))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 193
                                            '(0 9 0 10 1 12 0 9 13 3 18 16 16
                                              17 17 19 1 7 0 20 21 3 22 7 16 12
                                              7 23 2 7 24 0 20 25 1 26 0 7 27 1
                                              17 0 26 28 1 17 26 0 29 2 31 16
                                              30 26 32 0 6 0 33 0 16 0 34 3 16
                                              36 0 0 0 37 1 17 26 0 38 2 16 0 0
                                              0 39 2 16 0 0 0 40 1 26 41 0 42 1
                                              46 45 0 47 0 26 0 48 0 7 0 49 2
                                              26 0 0 0 50 2 26 0 0 51 52 1 7 53
                                              20 54 2 22 16 26 12 55 1 56 16 16
                                              57 1 16 17 0 58 1 16 51 0 59 0 17
                                              0 60 1 26 51 0 61 2 51 62 0 0 63
                                              2 16 0 17 0 64 0 16 0 65 2 16 17
                                              0 51 66 2 26 67 0 0 68 2 16 0 17
                                              51 69 2 16 0 0 0 70 2 17 0 0 0 71
                                              0 6 0 72 0 7 0 73 1 16 0 0 74 2
                                              17 0 26 0 75 0 26 0 76 2 16 62 0
                                              0 77 2 26 7 0 51 78 2 26 0 7 51
                                              79 2 26 0 0 0 80 2 26 0 0 0 81 2
                                              26 62 0 0 82 2 17 0 26 26 83 2 26
                                              7 84 7 85 1 26 0 0 86 2 17 0 0 87
                                              88 4 22 16 7 12 12 26 89 1 16 90
                                              0 91 1 93 92 17 94 2 97 95 96 92
                                              98 1 16 0 0 99 2 95 0 0 0 100 1
                                              18 102 16 103 1 12 104 0 105 2 26
                                              7 0 7 106 1 7 0 107 108 2 7 0 104
                                              109 110 1 7 20 0 111 2 7 0 0 0
                                              112 1 7 113 0 114 1 7 0 113 115 3
                                              7 0 0 116 109 117 2 120 95 119 95
                                              121 2 18 122 16 16 123 1 17 26 0
                                              124 1 17 62 0 125 1 17 0 0 126 1
                                              16 0 17 127 2 16 0 0 0 128 1 17 0
                                              0 129 2 130 7 17 12 131 1 26 7 0
                                              132 1 7 0 0 133 2 26 0 51 0 134 1
                                              26 0 0 135 2 16 17 0 17 136 2 7 0
                                              0 51 137 2 7 0 0 0 138 2 7 0 0 0
                                              139 1 26 62 0 140 2 26 67 0 0 141
                                              2 18 142 17 51 143 2 17 0 0 0 144
                                              2 17 0 0 107 145 2 26 146 84 0
                                              147 1 95 62 0 148 1 95 7 0 149 1
                                              95 151 0 152 1 95 154 0 155 3 95
                                              0 7 151 154 156 2 107 0 51 0 157
                                              2 7 0 0 107 158 2 7 0 107 0 159 1
                                              12 160 0 161 3 7 0 0 20 0 162 2
                                              17 62 0 0 163 0 164 0 165 3 16 0
                                              0 164 0 167 1 7 116 0 173 2 175
                                              174 174 9 176 2 174 0 12 0 177 2
                                              12 62 0 9 178 5 22 95 7 12 12 7
                                              26 179 7 22 95 7 12 12 12 7 17 7
                                              180 7 22 181 7 7 12 12 182 7 26
                                              183 9 22 181 7 7 12 12 182 12 7
                                              17 7 184 1 7 62 0 186 1 7 0 0 187
                                              1 8 51 0 188 2 8 7 0 51 189 6 22
                                              190 8 7 12 12 7 26 191 8 22 190 8
                                              7 12 12 12 7 17 7 192 5 0 190 8 7
                                              12 12 9 193 4 0 169 7 170 12 12
                                              172 4 0 169 170 170 12 12 171 3 0
                                              95 7 12 12 118 6 0 181 7 7 7 12
                                              12 182 185 5 1 190 8 7 12 12 9
                                              193)))))
           '|lookupComplete|)) 
