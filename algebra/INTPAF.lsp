
(SDEFUN |INTPAF;UPUP2F1|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|t| |Fraction| (|SparseUnivariatePolynomial| F))
         (|cf| |Fraction| (|SparseUnivariatePolynomial| F)) (|kx| |Kernel| F)
         (|k| |Kernel| F) ($ F))
        (|INTPAF;UPUP2F0| (SPADCALL |p| |t| |cf| (QREFELT $ 18)) |kx| |k| $)) 

(SDEFUN |INTPAF;UPUP2F0|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|kx| |Kernel| F) (|k| |Kernel| F) ($ F))
        (SPADCALL |p| |kx| (SPADCALL |k| (QREFELT $ 20)) (QREFELT $ 22))) 

(SDEFUN |INTPAF;chv|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (|INTPAF;chv0| |f| |n| |a| |b| $) (QREFELT $ 14)
                  (QREFELT $ 24))) 

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
          (#1=#:G173 NIL))
         (SEQ
          (LETT |bc|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (CONS #'|INTPAF;RF2UPUP!0| $)
                                     (SPADCALL |f| (QREFELT $ 28))
                                     (QREFELT $ 31))
                           |modulus| (|spadConstant| $ 33) (QREFELT $ 36))
                          . #2=(|INTPAF;RF2UPUP|))
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
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
                                 #1#))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (CONS #'|INTPAF;RF2UPUP!1| $)
                       (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 31))
             (QCAR |bc|) (QREFELT $ 38))
            |modulus| (QREFELT $ 39)))))) 

(SDEFUN |INTPAF;RF2UPUP!1| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |INTPAF;RF2UPUP!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |INTPAF;linearInXIfCan|
        ((|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |xsub| F)
                    (|:| |dxsub|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))
          "failed"))
        (SPROG
         ((|xx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|b| #1=(|SparseUnivariatePolynomial| F)) (|a| #1#)
          (|d| (|NonNegativeInteger|)) (#2=#:G200 NIL)
          (|q| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a|
                  (LETT |b| (|spadConstant| $ 40)
                        . #3=(|INTPAF;linearInXIfCan|))
                  . #3#)
            (LETT |p|
                  (SPADCALL
                   (SPADCALL (SPADCALL |y| (QREFELT $ 42)) |x| (QREFELT $ 43))
                   (QREFELT $ 45))
                  . #3#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (LETT |q|
                             (SPADCALL (SPADCALL |p| (QREFELT $ 51))
                                       (QREFELT $ 37))
                             . #3#)
                       (QREFELT $ 53))
                      1 (QREFELT $ 54))
                     (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #4=#:G199)))
                    ('T
                     (SEQ
                      (LETT |a|
                            (SPADCALL |a|
                                      (SPADCALL (SPADCALL |q| 1 (QREFELT $ 56))
                                                (LETT |d|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 57))
                                                      . #3#)
                                                (QREFELT $ 58))
                                      (QREFELT $ 59))
                            . #3#)
                      (LETT |b|
                            (SPADCALL |b|
                                      (SPADCALL (SPADCALL |q| 0 (QREFELT $ 56))
                                                |d| (QREFELT $ 58))
                                      (QREFELT $ 60))
                            . #3#)
                      (EXIT
                       (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #3#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |xx| (SPADCALL |b| |a| (QREFELT $ 62)) . #3#)
            (EXIT
             (CONS 0
                   (CONS
                    (SPADCALL |xx| (SPADCALL (QREFELT $ 14) (QREFELT $ 20))
                              (QREFELT $ 64))
                    (SPADCALL |xx| (ELT $ 65) (QREFELT $ 67)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |INTPAF;prootintegrate|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((#1=#:G209 NIL)
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
                  (SPADCALL
                   (LETT |p| (SPADCALL |y| (QREFELT $ 42))
                         . #2=(|INTPAF;prootintegrate|))
                   |x| (QREFELT $ 43))
                  . #2#)
            (LETT |rf|
                  (SPADCALL
                   (LETT |ff| (SPADCALL |f| |x| |y| |p| (QREFELT $ 68)) . #2#)
                   (QREFELT $ 61))
                  . #2#)
            (SEQ (LETT |r| (SPADCALL |rf| (QREFELT $ 70)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |r| 0)
                    (COND
                     ((SPADCALL |rf| (|spadConstant| $ 48) (QREFELT $ 50))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL
                               (CONS #'|INTPAF;prootintegrate!0|
                                     (VECTOR $ |x|))
                               (SPADCALL (QCDR |r|) (QREFELT $ 73))
                               (QREFELT $ 77))
                              (|INTPAF;prootintegrate1|
                               (SPADCALL |ff| (QREFELT $ 78)) |x| |y| |modulus|
                               $)
                              (QREFELT $ 79))
                             . #2#)
                       (GO #3=#:G207))))))))
            (EXIT (|INTPAF;prootintegrate1| |ff| |x| |y| |modulus| $))))
          #3# (EXIT #1#)))) 

(SDEFUN |INTPAF;prootintegrate!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAF;prootintegrate|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 64)))))) 

(SDEFUN |INTPAF;prootintegrate1|
        ((|ff| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| |Kernel| F)
         (|modulus| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         ($ |IntegrationResult| F))
        (SPROG
         ((|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#1=#:G233 NIL)
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
          (#2=#:G213 NIL)
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
          (|kz| (|Kernel| F)) (|newalg| (F))
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
                (PROG2
                    (LETT #2# (SPADCALL |modulus| (QREFELT $ 82))
                          . #3=(|INTPAF;prootintegrate1|))
                    (QCDR #2#)
                  (|check_union| (QEQCAR #2# 0)
                                 (|Record|
                                  (|:| |radicand|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                  (|:| |deg| (|NonNegativeInteger|)))
                                 #2#))
                . #3#)
          (LETT |uu| (|INTPAF;changeVarIfCan| |ff| (QCAR |r|) (QCDR |r|) $)
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |uu| 0)
             (SEQ (LETT |chv| (QCDR |uu|) . #3#)
                  (LETT |newalg|
                        (SPADCALL
                         (SPADCALL (QVELT |chv| 1)
                                   (SPADCALL (QREFELT $ 14) (QREFELT $ 20))
                                   (QREFELT $ 83))
                         (QVELT |chv| 4) (QREFELT $ 85))
                        . #3#)
                  (LETT |kz|
                        (SPADCALL (SPADCALL |newalg| (QREFELT $ 87))
                                  (QREFELT $ 89))
                        . #3#)
                  (LETT |newf|
                        (SPADCALL (QVELT |chv| 0)
                                  (LETT |ku| (QREFELT $ 14) . #3#) |newalg|
                                  (QREFELT $ 22))
                        . #3#)
                  (LETT |vu|
                        (SPADCALL (QVELT |chv| 2) (SPADCALL |x| (QREFELT $ 20))
                                  (QREFELT $ 83))
                        . #3#)
                  (LETT |vz|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QVELT |chv| 3)
                                    (SPADCALL |x| (QREFELT $ 20))
                                    (QREFELT $ 64))
                          (SPADCALL |y| (QREFELT $ 20)) (QREFELT $ 90))
                         (SPADCALL (SPADCALL |newalg| (QREFELT $ 91))
                                   (QREFELT $ 92))
                         (QREFELT $ 90))
                        . #3#)
                  (EXIT
                   (SPADCALL
                    (CONS #'|INTPAF;prootintegrate1!0|
                          (VECTOR $ |vz| |vu| |kz| |ku|))
                    (SPADCALL |newf| |ku| |kz| (QREFELT $ 96))
                    (QREFELT $ 99)))))
            ('T
             (SEQ
              (EXIT
               (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #3#)
                    (LETT |r|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (QVELT |cv| 1) (QREFELT $ 82))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 0)
                                           (|Record|
                                            (|:| |radicand|
                                                 (|Fraction|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))))
                                            (|:| |deg| (|NonNegativeInteger|)))
                                           #2#))
                          . #3#)
                    (LETT |qprime|
                          (SPADCALL
                           (SPADCALL
                            (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 102))
                                  . #3#)
                            (QREFELT $ 65))
                           (QREFELT $ 27))
                          . #3#)
                    (COND
                     ((NULL (SPADCALL |qprime| (QREFELT $ 103)))
                      (SEQ
                       (LETT |u|
                             (|INTPAF;chvarIfCan| (QVELT |cv| 0)
                              (|spadConstant| $ 104) |q|
                              (SPADCALL |qprime| (QREFELT $ 105)) $)
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |m|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 104)
                                                   (QCDR |r|) (QREFELT $ 106))
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 27))
                                          (QREFELT $ 107))
                                         (QREFELT $ 108))
                                        . #3#)
                                  (EXIT
                                   (SPADCALL
                                    (CONS #'|INTPAF;prootintegrate1!1|
                                          (VECTOR |y| |x| |cv| $ |m|))
                                    (|INTPAF;rationalInt| (QCDR |u|) (QCDR |r|)
                                     (SPADCALL (|spadConstant| $ 55) 1
                                               (QREFELT $ 58))
                                     $)
                                    (QREFELT $ 77))))
                                 . #3#)
                           (GO #4=#:G230))))))))
                    (LETT |curve|
                          (|RadicalFunctionField| (QREFELT $ 7)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|SparseUnivariatePolynomial|
                                                   (|Fraction|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 7))))
                                                  (SPADCALL |q| (QREFELT $ 27))
                                                  (QCDR |r|))
                          . #3#)
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
                        (ELT $ 65)
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
                      (SPADCALL |x| (QREFELT $ 20)) $))))
              #4# (EXIT #1#)))))))) 

(SDEFUN |INTPAF;prootintegrate1!2| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |y|)
          (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT |curve| (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
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
          (LETT |m| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|INTPAF;UPUP2F1| (|INTPAF;RF2UPUP| |x1| |m| $) (QVELT |cv| 2)
             (QVELT |cv| 3) |x| |y| $))))) 

(SDEFUN |INTPAF;prootintegrate1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|ku| |kz| |vu| |vz| $)
          (LETT |ku| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
          (LETT |kz| (QREFELT $$ 3) . #1#)
          (LETT |vu| (QREFELT $$ 2) . #1#)
          (LETT |vz| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (LIST |ku| |kz|) (LIST |vu| |vz|) (QREFELT $ 95)))))) 

(SDEFUN |INTPAF;rationalInt|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|g| |SparseUnivariatePolynomial| F)
         ($ |IntegrationResult| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG ((#1=#:G242 NIL) (|a| (F)))
               (SEQ
                (COND
                 ((NULL (EQL (SPADCALL |g| (QREFELT $ 53)) 1))
                  (|error| "rationalInt: radicand must be linear"))
                 ('T
                  (SEQ
                   (LETT |a| (SPADCALL |g| (QREFELT $ 109))
                         . #2=(|INTPAF;rationalInt|))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |n|
                                (SPADCALL (SPADCALL |a| (QREFELT $ 110))
                                          (PROG1 (LETT #1# (- |n| 1) . #2#)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))
                                          (QREFELT $ 58))
                                (QREFELT $ 111))
                      (|INTPAF;chv| |f| |n| |a|
                       (SPADCALL (SPADCALL |g| (QREFELT $ 112))
                                 (QREFELT $ 109))
                       $)
                      (QREFELT $ 113))
                     (QREFELT $ 73))))))))) 

(SDEFUN |INTPAF;chv0|
        ((|f| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|n| |NonNegativeInteger|) (|a| F) (|b| F) ($ F))
        (SPROG ((|d| (F)))
               (SEQ
                (LETT |d| (SPADCALL (QREFELT $ 14) (QREFELT $ 20))
                      |INTPAF;chv0|)
                (EXIT
                 (SPADCALL
                  (SPADCALL |f|
                            (SPADCALL (SPADCALL |d| (QREFELT $ 26))
                                      (QREFELT $ 27))
                            (QREFELT $ 114))
                  (SPADCALL
                   (SPADCALL (SPADCALL |d| |n| (QREFELT $ 115)) |b|
                             (QREFELT $ 116))
                   |a| (QREFELT $ 117))
                  (QREFELT $ 64)))))) 

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
          (|xi| (|SparseUnivariatePolynomial| F)) (#1=#:G256 NIL) (|i| NIL))
         (SEQ (LETT |l| NIL . #2=(|INTPAF;candidates|))
              (EXIT
               (COND ((SPADCALL |p| (QREFELT $ 118)) |l|)
                     ('T
                      (SEQ
                       (SEQ (LETT |i| 2 . #2#)
                            (LETT #1# (SPADCALL |p| (QREFELT $ 53)) . #2#) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (LETT |u|
                                   (SPADCALL |p|
                                             (LETT |xi|
                                                   (SPADCALL
                                                    (|spadConstant| $ 55) |i|
                                                    (QREFELT $ 58))
                                                   . #2#)
                                             (QREFELT $ 120))
                                   . #2#)
                             (EXIT
                              (COND
                               ((QEQCAR |u| 0)
                                (LETT |l| (CONS (CONS (QCDR |u|) |xi|) |l|)
                                      . #2#)))))
                            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (CONS
                         (CONS
                          (SPADCALL (|spadConstant| $ 55) 1 (QREFELT $ 58))
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
         ((#1=#:G270 NIL) (#2=#:G271 NIL)
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (#3=#:G272 NIL) (|cnd| NIL)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (SPADCALL |radi| |n| (QREFELT $ 122))
                  . #4=(|INTPAF;changeVarIfCan|))
            (SEQ
             (EXIT
              (SEQ (LETT |cnd| NIL . #4#)
                   (LETT #3# (|INTPAF;candidates| (QVELT |rec| 2) $) . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |cnd| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |u|
                          (|INTPAF;chvarIfCan| |p| (QVELT |rec| 1) (QCDR |cnd|)
                           (SPADCALL
                            (SPADCALL (SPADCALL (QCDR |cnd|) (QREFELT $ 65))
                                      (QREFELT $ 27))
                            (QREFELT $ 105))
                           $)
                          . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (CONS 0
                                           (VECTOR (QCDR |u|) (QCAR |cnd|)
                                                   (QCDR |cnd|) (QVELT |rec| 1)
                                                   (QVELT |rec| 0)))
                                     . #4#)
                               (GO #5=#:G269))
                              . #4#)
                        (GO #6=#:G267))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #5# (EXIT #2#)))) 

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
          (#1=#:G284 NIL)
          (|v|
           (|Union| (|Fraction| (|SparseUnivariatePolynomial| F)) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (|spadConstant| $ 48) . #2=(|INTPAF;chvarIfCan|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |u1| (SPADCALL |p| (QREFELT $ 51))
                                        (QREFELT $ 123))
                              (SPADCALL |d| (SPADCALL |p| (QREFELT $ 57))
                                        (QREFELT $ 124))
                              (QREFELT $ 125))
                             |u| (QREFELT $ 127))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #2#)
                          (GO #3=#:G283)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (QCDR |v|)
                                                    (SPADCALL |p|
                                                              (QREFELT $ 57))
                                                    (QREFELT $ 106))
                                          (QREFELT $ 128))
                                . #2#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #2#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |ans|))))
          #3# (EXIT #1#)))) 

(SDEFUN |INTPAF;algaddx|
        ((|i| |IntegrationResult| F) (|xx| F) ($ |IntegrationResult| F))
        (SPROG ((#1=#:G291 NIL) (|ne| NIL) (#2=#:G290 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 129)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 130))
                                 (SPADCALL |i| (QREFELT $ 133))
                                 (PROGN
                                  (LETT #2# NIL . #3=(|INTPAF;algaddx|))
                                  (SEQ (LETT |ne| NIL . #3#)
                                       (LETT #1# (SPADCALL |i| (QREFELT $ 136))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ne| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QCAR |ne|)
                                                            (SPADCALL |xx| 2
                                                                      (QREFELT
                                                                       $ 138))
                                                            (QREFELT $ 117))
                                                  (QREFELT $ 139))
                                                 |xx|)
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 140))))))) 

(SDEFUN |INTPAF;prootRDE|
        ((|nfp| F) (|f| F) (|g| F) (|x| |Kernel| F) (|k| |Kernel| F)
         (|rde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         ($ |Union| F #2#))
        (SPROG
         ((#3=#:G312 NIL)
          (|rc|
           (|Record| (|:| |particular| (|Union| |curve| #4="failed"))
                     (|:| |basis| (|List| |curve|))))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (#5=#:G317 NIL) (|c1| (F)) (|u| #1#) (#6=#:G304 NIL)
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
          (#10=#:G297 NIL)
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL
                   (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                         . #11=(|INTPAF;prootRDE|))
                   |x| (QREFELT $ 43))
                  . #11#)
            (LETT |r|
                  (PROG2 (LETT #10# (SPADCALL |modulus| (QREFELT $ 82)) . #11#)
                      (QCDR #10#)
                    (|check_union| (QEQCAR #10# 0)
                                   (|Record|
                                    (|:| |radicand|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    (|:| |deg| (|NonNegativeInteger|)))
                                   #10#))
                  . #11#)
            (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122))
                  . #11#)
            (LETT |dqdx|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (LETT |q| (QVELT |rec| 2) . #11#) (QREFELT $ 65))
                    (QREFELT $ 27))
                   (QREFELT $ 105))
                  . #11#)
            (SEQ
             (LETT |uf|
                   (|INTPAF;chvarIfCan|
                    (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68))
                          . #11#)
                    (QVELT |rec| 1) |q| (|spadConstant| $ 104) $)
                   . #11#)
             (EXIT
              (COND
               ((QEQCAR |uf| 0)
                (SEQ
                 (LETT |ug|
                       (|INTPAF;chvarIfCan|
                        (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68))
                              . #11#)
                        (QVELT |rec| 1) |q| |dqdx| $)
                       . #11#)
                 (EXIT
                  (COND
                   ((QEQCAR |ug| 0)
                    (PROGN
                     (LETT #5#
                           (SEQ
                            (LETT |u|
                                  (SPADCALL
                                   (|INTPAF;chv0| (QCDR |uf|) (QVELT |rec| 0)
                                    (|spadConstant| $ 55) (|spadConstant| $ 47)
                                    $)
                                   (SPADCALL
                                    (SPADCALL (QVELT |rec| 0)
                                              (SPADCALL
                                               (SPADCALL (QREFELT $ 14)
                                                         (QREFELT $ 20))
                                               (* (QVELT |rec| 0)
                                                  (- (QVELT |rec| 0) 1))
                                               (QREFELT $ 141))
                                              (QREFELT $ 142))
                                    (|INTPAF;chv0| (QCDR |ug|) (QVELT |rec| 0)
                                     (|spadConstant| $ 55)
                                     (|spadConstant| $ 47) $)
                                    (QREFELT $ 90))
                                   (PROG2
                                       (LETT #6#
                                             (SPADCALL (QREFELT $ 14)
                                                       (QREFELT $ 144))
                                             . #11#)
                                       (QCDR #6#)
                                     (|check_union| (QEQCAR #6# 0) (|Symbol|)
                                                    #6#))
                                   |rde|)
                                  . #11#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                   (#12='T
                                    (SEQ
                                     (LETT |c1|
                                           (SPADCALL (QVELT |rec| 1) |x|
                                                     (QREFELT $ 146))
                                           . #11#)
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL (QCDR |u|) (QREFELT $ 14)
                                                      (SPADCALL |c1|
                                                                (SPADCALL |k|
                                                                          (QREFELT
                                                                           $
                                                                           20))
                                                                (QREFELT $ 90))
                                                      (QREFELT $ 147)))))))))
                           . #11#)
                     (GO #13=#:G315))))))))))
            (EXIT
             (COND
              ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 104)
                         (QREFELT $ 148))
               (SEQ
                (LETT |curve|
                      (|RadicalFunctionField| (QREFELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|SparseUnivariatePolynomial|
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))))
                                              (SPADCALL |q| (QREFELT $ 27))
                                              (QVELT |rec| 0))
                      . #11#)
                (LETT |rc|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (|compiledLookupCheck| 'D (LIST '$)
                                                (|LinearOrdinaryDifferentialOperator1|
                                                 |curve|)))
                        (SPADCALL
                         (SPADCALL (SPADCALL |nfp| |x| |k| |p| (QREFELT $ 68))
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
                       (SPADCALL (SPADCALL |g| |x| |k| |p| (QREFELT $ 68))
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
                                                                   |curve|)))
                      . #11#)
                (EXIT
                 (COND ((QEQCAR (QCAR |rc|) 1) (CONS 1 "failed"))
                       (#12#
                        (CONS 0
                              (|INTPAF;UPUP2F0|
                               (SPADCALL
                                (PROG2 (LETT #3# (QCAR |rc|) . #11#)
                                    (QCDR #3#)
                                  (|check_union| (QEQCAR #3# 0) |curve| #3#))
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
              (#12# (|INTPAF;palgRDE1| |nfp| |g| |x| |k| $))))))
          #13# (EXIT #5#)))) 

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
         (SEQ
          (LETT |fu| (|INTPAF;RF2UPUP| |f| |m| $) . #1=(|INTPAF;change_back|))
          (LETT |fu2|
                (SPADCALL |fu| (QREFELT $ 151)
                          (SPADCALL |cc| 1 (QREFELT $ 106)) (QREFELT $ 152))
                . #1#)
          (EXIT (|INTPAF;UPUP2F0| |fu2| |x| |k| $))))) 

(SDEFUN |INTPAF;prootlimint|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((|ui| (|Union| |curve| #1="failed"))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (|dqdx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| #2=(|SparseUnivariatePolynomial| F))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#3=#:G326 NIL)
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
          (|m|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|l| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|v|
           #4=(|Union|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|SparseUnivariatePolynomial| F)))
               "failed"))
          (|uu|
           #5=(|SparseUnivariatePolynomial|
               (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#6=#:G363 NIL) (|u| NIL) (|n| (|SparseUnivariatePolynomial| F))
          (#7=#:G344 NIL) (|uf| #4#) (|ff| #5#)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| #2#)))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |modulus|
                (SPADCALL
                 (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                       . #8=(|INTPAF;prootlimint|))
                 |x| (QREFELT $ 43))
                . #8#)
          (LETT |r|
                (PROG2 (LETT #3# (SPADCALL |modulus| (QREFELT $ 82)) . #8#)
                    (QCDR #3#)
                  (|check_union| (QEQCAR #3# 0)
                                 (|Record|
                                  (|:| |radicand|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                  (|:| |deg| (|NonNegativeInteger|)))
                                 #3#))
                . #8#)
          (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122)) . #8#)
          (LETT |dqdx|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (LETT |q| (QVELT |rec| 2) . #8#) (QREFELT $ 65))
                  (QREFELT $ 27))
                 (QREFELT $ 105))
                . #8#)
          (LETT |uf|
                (|INTPAF;chvarIfCan|
                 (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) . #8#)
                 (QVELT |rec| 1) |q| |dqdx| $)
                . #8#)
          (EXIT
           (COND
            ((QEQCAR |uf| 0)
             (SEQ (LETT |l| NIL . #8#)
                  (LETT |n|
                        (SPADCALL (QVELT |rec| 0)
                                  (SPADCALL (|spadConstant| $ 55)
                                            (PROG1
                                                (LETT #7# (- (QVELT |rec| 0) 1)
                                                      . #8#)
                                              (|check_subtype| (>= #7# 0)
                                                               '(|NonNegativeInteger|)
                                                               #7#))
                                            (QREFELT $ 58))
                                  (QREFELT $ 153))
                        . #8#)
                  (SEQ (LETT |u| NIL . #8#) (LETT #6# |lu| . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |v|
                              (|INTPAF;chvarIfCan|
                               (LETT |uu|
                                     (SPADCALL |u| |x| |k| |p| (QREFELT $ 68))
                                     . #8#)
                               (QVELT |rec| 1) |q| |dqdx| $)
                              . #8#)
                        (EXIT
                         (COND
                          ((QEQCAR |v| 0)
                           (LETT |l|
                                 (CONS
                                  (SPADCALL |n|
                                            (|INTPAF;chv| (QCDR |v|)
                                             (QVELT |rec| 0)
                                             (|spadConstant| $ 55)
                                             (|spadConstant| $ 47) $)
                                            (QREFELT $ 113))
                                  |l|)
                                 . #8#))
                          ('T
                           (|error|
                            #9="failed - cannot handle that integrand")))))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                  (LETT |m|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 104) (QVELT |rec| 0)
                                   (QREFELT $ 106))
                         (SPADCALL (SPADCALL |q| (QREFELT $ 27))
                                   (QREFELT $ 107))
                         (QREFELT $ 108))
                        . #8#)
                  (EXIT
                   (SPADCALL
                    (CONS #'|INTPAF;prootlimint!0|
                          (VECTOR $ |m| |rec| |k| |x|))
                    (SPADCALL
                     (SPADCALL |n|
                               (|INTPAF;chv| (QCDR |uf|) (QVELT |rec| 0)
                                (|spadConstant| $ 55) (|spadConstant| $ 47) $)
                               (QREFELT $ 113))
                     (NREVERSE |l|) (QREFELT $ 158))
                    (QREFELT $ 162)))))
            (#10='T
             (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #8#)
                  (LETT |r|
                        (PROG2
                            (LETT #3# (SPADCALL (QVELT |cv| 1) (QREFELT $ 82))
                                  . #8#)
                            (QCDR #3#)
                          (|check_union| (QEQCAR #3# 0)
                                         (|Record|
                                          (|:| |radicand|
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))))
                                          (|:| |deg| (|NonNegativeInteger|)))
                                         #3#))
                        . #8#)
                  (LETT |dqdx|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 102))
                                 . #8#)
                           (QREFELT $ 65))
                          (QREFELT $ 27))
                         (QREFELT $ 105))
                        . #8#)
                  (LETT |curve|
                        (|RadicalFunctionField| (QREFELT $ 7)
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                (|SparseUnivariatePolynomial|
                                                 (|Fraction|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))))
                                                (SPADCALL |q| (QREFELT $ 27))
                                                (QCDR |r|))
                        . #8#)
                  (LETT |ui|
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
                         (ELT $ 65)
                         (|compiledLookupCheck| '|palginfieldint|
                                                (LIST
                                                 (LIST '|Union|
                                                       (|devaluate| |curve|)
                                                       '#1#)
                                                 (|devaluate| |curve|)
                                                 (LIST '|Mapping|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 7)))
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
                        . #8#)
                  (EXIT
                   (COND
                    ((QEQCAR |ui| 1)
                     (COND ((NULL |lu|) (CONS 1 "failed"))
                           (#10# (|error| #9#))))
                    (#10#
                     (CONS 0
                           (CONS
                            (|INTPAF;UPUP2F1|
                             (SPADCALL (QCDR |ui|)
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
                             (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                            NIL)))))))))))) 

(SDEFUN |INTPAF;prootlimint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| |k| |rec| |m| $)
          (LETT |x| (QREFELT $$ 4) . #1=(|INTPAF;prootlimint|))
          (LETT |k| (QREFELT $$ 3) . #1#)
          (LETT |rec| (QREFELT $$ 2) . #1#)
          (LETT |m| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|INTPAF;change_back| |x1| |x| |k| (QVELT |rec| 1) |m| $))))) 

(SDEFUN |INTPAF;prootextint|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|uc| (F)) (|ur| (|curve|))
          (|u|
           (|Union| (|Record| (|:| |ratpart| |curve|) (|:| |coeff| F))
                    #1="failed"))
          (|curve|
           (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                    (|SparseUnivariatePolynomial|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial| F)))))
          (|r|
           (|Record|
            (|:| |radicand| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |deg| (|NonNegativeInteger|))))
          (#2=#:G370 NIL)
          (|g1|
           #3=(|SparseUnivariatePolynomial|
               (|Fraction| (|SparseUnivariatePolynomial| F))))
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
          (#4=#:G406 NIL)
          (|res1|
           (|Union|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeff| (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed"))
          (|n| (|SparseUnivariatePolynomial| F)) (#5=#:G388 NIL)
          (|m|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ug|
           #6=(|Union|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|SparseUnivariatePolynomial| F)))
               "failed"))
          (|gg| #3#) (|uf| #6#) (|ff| #3#)
          (|dqdx| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|q| #7=(|SparseUnivariatePolynomial| F))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand| #7#)))
          (|modulus|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |modulus|
                  (SPADCALL
                   (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                         . #8=(|INTPAF;prootextint|))
                   |x| (QREFELT $ 43))
                  . #8#)
            (LETT |r|
                  (PROG2 (LETT #2# (SPADCALL |modulus| (QREFELT $ 82)) . #8#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0)
                                   (|Record|
                                    (|:| |radicand|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    (|:| |deg| (|NonNegativeInteger|)))
                                   #2#))
                  . #8#)
            (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122)) . #8#)
            (LETT |dqdx|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (LETT |q| (QVELT |rec| 2) . #8#) (QREFELT $ 65))
                    (QREFELT $ 27))
                   (QREFELT $ 105))
                  . #8#)
            (SEQ
             (LETT |uf|
                   (|INTPAF;chvarIfCan|
                    (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) . #8#)
                    (QVELT |rec| 1) |q| |dqdx| $)
                   . #8#)
             (EXIT
              (COND
               ((QEQCAR |uf| 0)
                (SEQ
                 (LETT |ug|
                       (|INTPAF;chvarIfCan|
                        (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68))
                              . #8#)
                        (QVELT |rec| 1) |q| |dqdx| $)
                       . #8#)
                 (EXIT
                  (COND
                   ((QEQCAR |ug| 0)
                    (PROGN
                     (LETT #4#
                           (SEQ
                            (LETT |m|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 104)
                                             (QVELT |rec| 0) (QREFELT $ 106))
                                   (SPADCALL (SPADCALL |q| (QREFELT $ 27))
                                             (QREFELT $ 107))
                                   (QREFELT $ 108))
                                  . #8#)
                            (LETT |n|
                                  (SPADCALL (QVELT |rec| 0)
                                            (SPADCALL (|spadConstant| $ 55)
                                                      (PROG1
                                                          (LETT #5#
                                                                (-
                                                                 (QVELT |rec|
                                                                        0)
                                                                 1)
                                                                . #8#)
                                                        (|check_subtype|
                                                         (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         #5#))
                                                      (QREFELT $ 58))
                                            (QREFELT $ 153))
                                  . #8#)
                            (LETT |res1|
                                  (SPADCALL
                                   (SPADCALL |n|
                                             (|INTPAF;chv| (QCDR |uf|)
                                              (QVELT |rec| 0)
                                              (|spadConstant| $ 55)
                                              (|spadConstant| $ 47) $)
                                             (QREFELT $ 113))
                                   (SPADCALL |n|
                                             (|INTPAF;chv| (QCDR |ug|)
                                              (QVELT |rec| 0)
                                              (|spadConstant| $ 55)
                                              (|spadConstant| $ 47) $)
                                             (QREFELT $ 113))
                                   (QREFELT $ 165))
                                  . #8#)
                            (EXIT
                             (SPADCALL
                              (CONS #'|INTPAF;prootextint!0|
                                    (VECTOR $ |m| |rec| |k| |x|))
                              |res1| (QREFELT $ 168))))
                           . #8#)
                     (GO #9=#:G404))))))))))
            (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #8#)
            (LETT |g1| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #8#)
            (LETT |r|
                  (PROG2
                      (LETT #2# (SPADCALL (QVELT |cv| 1) (QREFELT $ 82)) . #8#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0)
                                   (|Record|
                                    (|:| |radicand|
                                         (|Fraction|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    (|:| |deg| (|NonNegativeInteger|)))
                                   #2#))
                  . #8#)
            (LETT |curve|
                  (|RadicalFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (SPADCALL |q| (QREFELT $ 27))
                                          (QCDR |r|))
                  . #8#)
            (LETT |u|
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
                                                                   (ELT $
                                                                        7))))))
                                                    |curve|))
                   (ELT $ 65) |g1| (QVELT |cv| 2) (QVELT |cv| 3)
                   (|compiledLookupCheck| '|palgextintegrate|
                                          (LIST
                                           (LIST '|Union|
                                                 (LIST '|Record|
                                                       (LIST '|:| '|ratpart|
                                                             (|devaluate|
                                                              |curve|))
                                                       (LIST '|:| '|coeff|
                                                             (|devaluate|
                                                              (ELT $ 7))))
                                                 '#1#)
                                           (|devaluate| |curve|)
                                           (LIST '|Mapping|
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7))))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (LIST '|Fraction|
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate|
                                                         (ELT $ 7)))))
                                           (LIST '|Fraction|
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7))))
                                           (LIST '|Fraction|
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))))
                                          (|AlgebraicIntegrate| (ELT $ 6)
                                                                (ELT $ 7)
                                                                (|SparseUnivariatePolynomial|
                                                                 (ELT $ 7))
                                                                (|SparseUnivariatePolynomial|
                                                                 (|Fraction|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (ELT $ 7))))
                                                                |curve|)))
                  . #8#)
            (EXIT
             (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |ur| (QCAR (QCDR |u|)) . #8#)
                         (LETT |uc| (QCDR (QCDR |u|)) . #8#)
                         (EXIT
                          (CONS 0
                                (CONS
                                 (|INTPAF;UPUP2F1|
                                  (SPADCALL |ur|
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
                                  (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                                 |uc|)))))))))
          #9# (EXIT #4#)))) 

(SDEFUN |INTPAF;prootextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| |k| |rec| |m| $)
          (LETT |x| (QREFELT $$ 4) . #1=(|INTPAF;prootextint|))
          (LETT |k| (QREFELT $$ 3) . #1#)
          (LETT |rec| (QREFELT $$ 2) . #1#)
          (LETT |m| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|INTPAF;change_back| |x1| |x| |k| (QVELT |rec| 1) |m| $))))) 

(SDEFUN |INTPAF;palgRDE1|
        ((|nfp| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         ($ |Union| F "failed"))
        (SPROG ((#1=#:G411 NIL))
               (QCAR
                (|INTPAF;palgLODE1| (LIST |nfp| (|spadConstant| $ 55)) |g| |x|
                 |y|
                 (PROG2
                     (LETT #1# (SPADCALL |x| (QREFELT $ 144))
                           |INTPAF;palgRDE1|)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
                 $)))) 

(SDEFUN |INTPAF;palgLODE1|
        ((|eq| |List| F) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F)
         (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G439 NIL) (|h| NIL) (#2=#:G438 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Union| |curve| #3="failed"))
                     (|:| |basis| (|List| |curve|))))
          (#4=#:G425 NIL) (|bas| (|List| F)) (#5=#:G437 NIL) (#6=#:G436 NIL)
          (|neq| (|LinearOrdinaryDifferentialOperator1| |curve|))
          (#7=#:G435 NIL) (|f| NIL) (|i| NIL)
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
                (SPADCALL
                 (LETT |p| (SPADCALL |y| (QREFELT $ 42))
                       . #8=(|INTPAF;palgLODE1|))
                 |kx| (QREFELT $ 43))
                . #8#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          |modulus|)
                . #8#)
          (LETT |neq|
                (SPADCALL
                 (|compiledLookupCheck| '|Zero| (LIST '$)
                                        (|LinearOrdinaryDifferentialOperator1|
                                         |curve|)))
                . #8#)
          (SEQ (LETT |i| 0 . #8#) (LETT |f| NIL . #8#) (LETT #7# |eq| . #8#)
               G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |neq|
                       (SPADCALL |neq|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |f| |kx| |y| |p| (QREFELT $ 68))
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
                                                         |curve|)))
                       . #8#)))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #8#))
                     . #8#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL
              (SPADCALL |y|
                        (SPADCALL |kx|
                                  (SPADCALL (SPADCALL |g| (QREFELT $ 169)) |x|
                                            (QREFELT $ 172))
                                  (QREFELT $ 173))
                        (QREFELT $ 173)))
             (SEQ
              (LETT |rec|
                    (SPADCALL |neq|
                              (SPADCALL
                               (SPADCALL |g| |kx| |y| |p| (QREFELT $ 68))
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
                                                      |curve|)))
                    . #8#)
              (LETT |bas|
                    (PROGN
                     (LETT #6# NIL . #8#)
                     (SEQ (LETT |h| NIL . #8#) (LETT #5# (QCDR |rec|) . #8#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |h| (CAR #5#) . #8#) NIL))
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
                                   #6#)
                                  . #8#)))
                          (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #8#)
              (EXIT
               (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                     (#9='T
                      (CONS
                       (CONS 0
                             (|INTPAF;UPUP2F0|
                              (SPADCALL
                               (PROG2 (LETT #4# (QCAR |rec|) . #8#)
                                   (QCDR #4#)
                                 (|check_union| (QEQCAR #4# 0) |curve| #4#))
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
            (#9#
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
                                                      |curve|)))
                    . #8#)
              (EXIT
               (CONS (CONS 1 "failed")
                     (PROGN
                      (LETT #2# NIL . #8#)
                      (SEQ (LETT |h| NIL . #8#) (LETT #1# (QCDR |rec|) . #8#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |h| (CAR #1#) . #8#) NIL))
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
                                    #2#)
                                   . #8#)))
                           (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))))))) 

(SDEFUN |INTPAF;palgintegrate|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|curve|
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
                (SPADCALL
                 (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                       . #1=(|INTPAF;palgintegrate|))
                 |x| (QREFELT $ 43))
                . #1#)
          (LETT |cv|
                (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                          (QREFELT $ 101))
                . #1#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (QVELT |cv| 1))
                . #1#)
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
              (ELT $ 65)
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
            (SPADCALL |x| (QREFELT $ 20)) $))))) 

(SDEFUN |INTPAF;palgintegrate!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |curve| |cv| |x| |k|)
          (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;palgintegrate|))
          (LETT |curve| (QREFELT $$ 3) . #1#)
          (LETT |cv| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
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

(SDEFUN |INTPAF;palglim|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((|u| (|Union| |curve| #1="failed"))
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
                (SPADCALL
                 (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                       . #2=(|INTPAF;palglim|))
                 |x| (QREFELT $ 43))
                . #2#)
          (LETT |cv|
                (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                          (QREFELT $ 101))
                . #2#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (QVELT |cv| 1))
                . #2#)
          (SPADCALL (QVELT |cv| 4)
                    (|compiledLookupCheck| '|knownInfBasis|
                                           (LIST (LIST '|Void|)
                                                 (LIST '|NonNegativeInteger|))
                                           |curve|))
          (LETT |u|
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
                 (ELT $ 65)
                 (|compiledLookupCheck| '|palginfieldint|
                                        (LIST
                                         (LIST '|Union| (|devaluate| |curve|)
                                               '#1#)
                                         (|devaluate| |curve|)
                                         (LIST '|Mapping|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7)))
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7)))))
                                        (|AlgebraicIntegrate| (ELT $ 6)
                                                              (ELT $ 7)
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT $ 7))
                                                              (|SparseUnivariatePolynomial|
                                                               (|Fraction|
                                                                (|SparseUnivariatePolynomial|
                                                                 (ELT $ 7))))
                                                              |curve|)))
                . #2#)
          (EXIT
           (COND
            ((QEQCAR |u| 1) (|error| "failed - cannot handle that integrand"))
            ('T
             (CONS 0
                   (CONS
                    (|INTPAF;UPUP2F1|
                     (SPADCALL (QCDR |u|)
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
                     (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                    NIL)))))))) 

(SDEFUN |INTPAF;palgext|
        ((|f| F) (|x| |Kernel| F) (|k| |Kernel| F) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|uc| (F)) (|ur| (|curve|))
          (|u|
           (|Union| (|Record| (|:| |ratpart| |curve|) (|:| |coeff| F))
                    #1="failed"))
          (|curve|
           (|Join|
            (|FunctionFieldCategory| F (|SparseUnivariatePolynomial| F)
                                     (|SparseUnivariatePolynomial|
                                      (|Fraction|
                                       (|SparseUnivariatePolynomial| F))))
            (CATEGORY |package|
             (SIGNATURE |knownInfBasis| ((|Void|) (|NonNegativeInteger|))))))
          (|g1|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
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
                (SPADCALL
                 (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                       . #2=(|INTPAF;palgext|))
                 |x| (QREFELT $ 43))
                . #2#)
          (LETT |cv|
                (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                          (QREFELT $ 101))
                . #2#)
          (LETT |g1| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #2#)
          (LETT |curve|
                (|AlgebraicFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (QVELT |cv| 1))
                . #2#)
          (SPADCALL (QVELT |cv| 4)
                    (|compiledLookupCheck| '|knownInfBasis|
                                           (LIST (LIST '|Void|)
                                                 (LIST '|NonNegativeInteger|))
                                           |curve|))
          (LETT |u|
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
                 (ELT $ 65) |g1| (QVELT |cv| 2) (QVELT |cv| 3)
                 (|compiledLookupCheck| '|palgextintegrate|
                                        (LIST
                                         (LIST '|Union|
                                               (LIST '|Record|
                                                     (LIST '|:| '|ratpart|
                                                           (|devaluate|
                                                            |curve|))
                                                     (LIST '|:| '|coeff|
                                                           (|devaluate|
                                                            (ELT $ 7))))
                                               '#1#)
                                         (|devaluate| |curve|)
                                         (LIST '|Mapping|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7)))
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7))))
                                         (LIST '|SparseUnivariatePolynomial|
                                               (LIST '|Fraction|
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate|
                                                       (ELT $ 7)))))
                                         (LIST '|Fraction|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7))))
                                         (LIST '|Fraction|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| (ELT $ 7)))))
                                        (|AlgebraicIntegrate| (ELT $ 6)
                                                              (ELT $ 7)
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT $ 7))
                                                              (|SparseUnivariatePolynomial|
                                                               (|Fraction|
                                                                (|SparseUnivariatePolynomial|
                                                                 (ELT $ 7))))
                                                              |curve|)))
                . #2#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ur| (QCAR (QCDR |u|)) . #2#)
                       (LETT |uc| (QCDR (QCDR |u|)) . #2#)
                       (EXIT
                        (CONS 0
                              (CONS
                               (|INTPAF;UPUP2F1|
                                (SPADCALL |ur|
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
                                (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                               |uc|)))))))))) 

(SDEFUN |INTPAF;palgint;F2KIr;23|
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
                           (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #1=(|INTPAF;palgint;F2KIr;23|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 174))
                       (|INTPAF;prootintegrate| |f| |x| |y| $))
                      ((SPADCALL |y| '|rootOf| (QREFELT $ 174))
                       (|INTPAF;palgintegrate| |f| |x| |y| $))
                      (#2='T
                       (|error| "failed - cannot handle that integrand"))))
                    (#2#
                     (SPADCALL |f| |x| |y| (QCAR (QCDR |u|)) (QCDR (QCDR |u|))
                               (QREFELT $ 175)))))))
            (#2#
             (SPADCALL |f| |x| |y| (QREFELT $ 14) (QCAR (QCDR |v|))
                       (QCDR (QCDR |v|)) (QREFELT $ 176)))))))) 

(SDEFUN |INTPAF;palgextint;F2KFU;24|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
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
                           (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #1=(|INTPAF;palgextint;F2KFU;24|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 174))
                       (|INTPAF;prootextint| |f| |x| |y| |g| $))
                      ((SPADCALL |y| '|rootOf| (QREFELT $ 174))
                       (|INTPAF;palgext| |f| |x| |y| |g| $))
                      (#2='T
                       (|error| "failed - cannot handle that integrand"))))
                    (#2#
                     (SPADCALL |f| |x| |y| |g| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 177)))))))
            (#2#
             (SPADCALL |f| |x| |y| |g| (QREFELT $ 14) (QCAR (QCDR |v|))
                       (QCDR (QCDR |v|)) (QREFELT $ 178)))))))) 

(SDEFUN |INTPAF;palglimint;F2KLU;25|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
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
                           (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #1=(|INTPAF;palglimint;F2KLU;25|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 174))
                       (|INTPAF;prootlimint| |f| |x| |y| |lu| $))
                      ((SPADCALL |y| '|rootOf| (QREFELT $ 174))
                       (|INTPAF;palglim| |f| |x| |y| |lu| $))
                      (#2='T
                       (|error| "failed - cannot handle that integrand"))))
                    (#2#
                     (SPADCALL |f| |x| |y| |lu| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 181)))))))
            (#2#
             (SPADCALL |f| |x| |y| |lu| (QREFELT $ 14) (QCAR (QCDR |v|))
                       (QCDR (QCDR |v|)) (QREFELT $ 182)))))))) 

(SDEFUN |INTPAF;palgRDE;3F2KMU;26|
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
                           (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
                . #2=(|INTPAF;palgRDE;3F2KMU;26|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (COND
                      ((SPADCALL |y| '|nthRoot| (QREFELT $ 174))
                       (|INTPAF;prootRDE| |nfp| |f| |g| |x| |y| |rde| $))
                      (#3='T (|INTPAF;palgRDE1| |nfp| |g| |x| |y| $))))
                    (#3#
                     (SPADCALL |f| |g| |x| |y| |rde| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 186)))))))
            (#3#
             (SPADCALL |f| |g| |x| |y| |rde| (QREFELT $ 14) (QCAR (QCDR |v|))
                       (QCDR (QCDR |v|)) (QREFELT $ 187)))))))) 

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
             (SPADCALL
              (LETT |p| (SPADCALL |y| (QREFELT $ 42))
                    . #1=(|INTPAF;quadIfCan|))
              (QREFELT $ 53))
             2)
            (COND
             ((SPADCALL (SPADCALL |p| 1 (QREFELT $ 56)) (QREFELT $ 189))
              (EXIT
               (SEQ
                (LETT |d|
                      (SPADCALL
                       (LETT |ff|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |p| 0 (QREFELT $ 56))
                                         (SPADCALL |p| 2 (QREFELT $ 56))
                                         (QREFELT $ 117))
                               (QREFELT $ 139))
                              |x| (QREFELT $ 24))
                             . #1#)
                       (QREFELT $ 28))
                      . #1#)
                (EXIT
                 (COND
                  ((EQL
                    (SPADCALL
                     (LETT |radi|
                           (SPADCALL |d| (SPADCALL |ff| (QREFELT $ 37))
                                     (QREFELT $ 190))
                           . #1#)
                     (QREFELT $ 53))
                    2)
                   (CONS 0
                         (CONS
                          (SPADCALL |d| (SPADCALL |x| (QREFELT $ 20))
                                    (QREFELT $ 83))
                          |radi|)))
                  ('T (CONS 1 "failed"))))))))))
          (EXIT (CONS 1 "failed"))))) 

(SDEFUN |INTPAF;palgLODE;LF2KSR;28|
        ((|eq| L) (|g| F) (|kx| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G564 NIL) (|i| NIL) (#2=#:G563 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |coef| F)
                      (|:| |poly| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|v|
           (|Union|
            (|Record| (|:| |xsub| F)
                      (|:| |dxsub|
                           (|Fraction| (|SparseUnivariatePolynomial| F))))
            "failed")))
         (SEQ
          (LETT |v| (|INTPAF;linearInXIfCan| |kx| |y| $)
                . #3=(|INTPAF;palgLODE;LF2KSR;28|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ (LETT |u| (|INTPAF;quadIfCan| |kx| |y| $) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (|INTPAF;palgLODE1|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |i| 0 . #3#)
                            (LETT #1# (SPADCALL |eq| (QREFELT $ 191)) . #3#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |eq| |i| (QREFELT $ 192))
                                          #2#)
                                    . #3#)))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      |g| |kx| |y| |x| $))
                    (#4='T
                     (SPADCALL |eq| |g| |kx| |y| (QCAR (QCDR |u|))
                               (QCDR (QCDR |u|)) (QREFELT $ 194)))))))
            (#4#
             (SPADCALL |eq| |g| |kx| |y| (QREFELT $ 14) (QCAR (QCDR |v|))
                       (QCDR (QCDR |v|)) (QREFELT $ 195)))))))) 

(DECLAIM (NOTINLINE |PureAlgebraicIntegration;|)) 

(DEFUN |PureAlgebraicIntegration| (&REST #1=#:G565)
  (SPROG NIL
         (PROG (#2=#:G566)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PureAlgebraicIntegration|)
                                               '|domainEqualList|)
                    . #3=(|PureAlgebraicIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PureAlgebraicIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PureAlgebraicIntegration|)))))))))) 

(DEFUN |PureAlgebraicIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PureAlgebraicIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|PureAlgebraicIntegration| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 197) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PureAlgebraicIntegration|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 14 (SPADCALL (QREFELT $ 11) (QREFELT $ 13)))
          (QSETREFV $ 151 (SPADCALL (QREFELT $ 150)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 196
                      (CONS (|dispatchFunction| |INTPAF;palgLODE;LF2KSR;28|)
                            $))))
          $))) 

(MAKEPROP '|PureAlgebraicIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) '|dummy| (|Kernel| 7)
              (4 . |kernel|) '|dumk| (|SparseUnivariatePolynomial| 16)
              (|Fraction| 25) (|ChangeOfVariable| 7 25 15) (9 . |eval|)
              (|Kernel| $) (16 . |coerce|) (|GenusZeroIntegration| 6 7 8)
              (21 . |multivariate|) (|Fraction| 41) (28 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (34 . |coerce|) (39 . |coerce|)
              (44 . |denom|) (|Mapping| 16 7)
              (|SparseUnivariatePolynomialFunctions2| 7 16) (49 . |map|)
              (55 . |One|) (59 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 34 '"failed")
              (63 . |extendedEuclidean|) (70 . |numer|) (75 . *) (81 . |rem|)
              (87 . |Zero|) (|SparseUnivariatePolynomial| $) (91 . |minPoly|)
              (96 . |lift|) (|UnivariatePolynomialCommonDenominator| 25 16 15)
              (102 . |clearDenominator|) (107 . |Zero|) (111 . |Zero|)
              (115 . |Zero|) (|Boolean|) (119 . ~=)
              (125 . |leadingCoefficient|) (|NonNegativeInteger|)
              (130 . |degree|) (135 . >) (141 . |One|) (145 . |coefficient|)
              (151 . |degree|) (156 . |monomial|) (162 . +) (168 . -)
              (174 . |reductum|) (179 . /) (|Fraction| $) (185 . |elt|)
              (191 . |differentiate|) (|Mapping| 25 25) (196 . |differentiate|)
              (202 . |univariate|) (|Union| 16 '"failed")
              (210 . |retractIfCan|) (|IntegrationResult| 16)
              (|RationalIntegration| 7 25) (215 . |integrate|)
              (|IntegrationResult| 7) (|Mapping| 7 16)
              (|IntegrationResultFunctions2| 16 7) (220 . |map|)
              (226 . |leadingMonomial|) (231 . +)
              (|Record| (|:| |radicand| 16) (|:| |deg| 52))
              (|Union| 80 '"failed") (237 . |radPoly|) (242 . |elt|)
              (|Integer|) (248 . |nthRoot|)
              (|SparseMultivariatePolynomial| 6 19) (254 . |numer|)
              (|SparseMultivariatePolynomial| 6 12) (259 . |retract|) (264 . *)
              (270 . |denom|) (275 . |coerce|) (|List| 19) (|List| $)
              (280 . |eval|) |INTPAF;palgint;F2KIr;23| (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (287 . |map|)
              (|Record| (|:| |func| 15) (|:| |poly| 15) (|:| |c1| 16)
                        (|:| |c2| 16) (|:| |deg| 52))
              (293 . |chvar|) (299 . |retract|) (304 . |zero?|) (309 . |One|)
              (313 . |inv|) (318 . |monomial|) (324 . |coerce|) (329 . -)
              (335 . |leadingCoefficient|) (340 . |inv|) (345 . *)
              (351 . |reductum|) (356 . *) (362 . |elt|) (368 . ^) (374 . -)
              (380 . /) (386 . |ground?|) (|Union| $ '"failed")
              (391 . |composite|)
              (|Record| (|:| |exponent| 52) (|:| |coef| 16)
                        (|:| |radicand| 25))
              (397 . |rootPoly|) (403 . *) (409 . ^) (415 . /)
              (|Union| 63 '"failed") (421 . |composite|) (427 . +)
              (433 . |elem?|) (438 . |ratpart|)
              (|Record| (|:| |scalar| (|Fraction| 84)) (|:| |coeff| 25)
                        (|:| |logand| 25))
              (|List| 131) (443 . |logpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 134)
              (448 . |notelem|) (|PositiveInteger|) (453 . ^) (459 . -)
              (464 . |mkAnswer|) (471 . ^) (477 . *) (|Union| 9 '"failed")
              (483 . |symbolIfCan|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 88 7)
              (488 . |multivariate|) (494 . |eval|) (501 . =)
              (|SingletonAsOrderedSet|) (507 . |create|) '|sdummy|
              (511 . |eval|) (518 . *)
              (|Record| (|:| |coeff| 16) (|:| |logand| 16))
              (|Record| (|:| |mainpart| 16) (|:| |limitedlogs| (|List| 154)))
              (|Union| 155 '"failed") (|List| 16) (524 . |limitedint|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 159)))
              (|Union| 160 '"failed") (530 . |map|)
              (|Record| (|:| |ratpart| 16) (|:| |coeff| 16))
              (|Union| 163 '"failed") (536 . |extendedint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 166 '"failed") (542 . |map|) (548 . |kernels|)
              (|List| 12) (|IntegrationTools| 6 7) (553 . |varselect|)
              (559 . |remove!|) (565 . |is?|) (571 . |palgint0|)
              (580 . |palgint0|) (590 . |palgextint0|) (600 . |palgextint0|)
              |INTPAF;palgextint;F2KFU;24| (|List| 7) (611 . |palglimint0|)
              (621 . |palglimint0|) |INTPAF;palglimint;F2KLU;25|
              (|Union| 7 '"failed") (|Mapping| 184 7 7 9) (632 . |palgRDE0|)
              (643 . |palgRDE0|) |INTPAF;palgRDE;3F2KMU;26| (655 . |zero?|)
              (660 . *) (666 . |degree|) (671 . |coefficient|)
              (|Record| (|:| |particular| 184) (|:| |basis| 180))
              (677 . |palgLODE0|) (687 . |palgLODE0|) (698 . |palgLODE|))
           '#(|palglimint| 707 |palgint| 715 |palgextint| 722 |palgRDE| 730
              |palgLODE| 740)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 196
                                                 '(0 9 0 10 1 12 0 9 13 3 17 15
                                                   15 16 16 18 1 7 0 19 20 3 21
                                                   7 15 12 7 22 2 7 23 0 19 24
                                                   1 25 0 7 26 1 16 0 25 27 1
                                                   16 25 0 28 2 30 15 29 25 31
                                                   0 6 0 32 0 15 0 33 3 15 35 0
                                                   0 0 36 1 16 25 0 37 2 15 0 0
                                                   0 38 2 15 0 0 0 39 0 25 0 40
                                                   1 7 41 19 42 2 21 15 25 12
                                                   43 1 44 15 15 45 0 6 0 46 0
                                                   7 0 47 0 15 0 48 2 15 49 0 0
                                                   50 1 15 16 0 51 1 25 52 0 53
                                                   2 52 49 0 0 54 0 7 0 55 2 25
                                                   7 0 52 56 1 15 52 0 57 2 25
                                                   0 7 52 58 2 25 0 0 0 59 2 25
                                                   0 0 0 60 1 15 0 0 61 2 16 0
                                                   25 25 62 2 25 7 63 7 64 1 25
                                                   0 0 65 2 16 0 0 66 67 4 21
                                                   15 7 12 12 25 68 1 15 69 0
                                                   70 1 72 71 16 73 2 76 74 75
                                                   71 77 1 15 0 0 78 2 74 0 0 0
                                                   79 1 17 81 15 82 2 25 7 0 7
                                                   83 2 7 0 0 84 85 1 7 86 0 87
                                                   1 88 12 0 89 2 7 0 0 0 90 1
                                                   7 86 0 91 1 7 0 86 92 3 7 0
                                                   0 93 94 95 2 98 74 97 74 99
                                                   2 17 100 15 15 101 1 16 25 0
                                                   102 1 16 49 0 103 0 16 0 104
                                                   1 16 0 0 105 2 15 0 16 52
                                                   106 1 15 0 16 107 2 15 0 0 0
                                                   108 1 25 7 0 109 1 7 0 0 110
                                                   2 25 0 52 0 111 1 25 0 0 112
                                                   2 16 0 25 0 113 2 15 16 0 16
                                                   114 2 7 0 0 52 115 2 7 0 0 0
                                                   116 2 7 0 0 0 117 1 25 49 0
                                                   118 2 25 119 0 0 120 2 17
                                                   121 16 52 122 2 16 0 0 0 123
                                                   2 16 0 0 84 124 2 16 0 0 0
                                                   125 2 25 126 63 0 127 2 15 0
                                                   0 0 128 1 74 49 0 129 1 74 7
                                                   0 130 1 74 132 0 133 1 74
                                                   135 0 136 2 7 0 0 137 138 1
                                                   7 0 0 139 3 74 0 7 132 135
                                                   140 2 7 0 0 84 141 2 7 0 52
                                                   0 142 1 12 143 0 144 2 145 7
                                                   16 12 146 3 7 0 0 19 0 147 2
                                                   16 49 0 0 148 0 149 0 150 3
                                                   15 0 0 149 0 152 2 25 0 84 0
                                                   153 2 72 156 16 157 158 2 76
                                                   161 75 156 162 2 72 164 16
                                                   16 165 2 76 167 75 164 168 1
                                                   7 93 0 169 2 171 170 170 9
                                                   172 2 170 0 12 0 173 2 12 49
                                                   0 9 174 5 21 74 7 12 12 7 25
                                                   175 6 21 74 7 12 12 12 7 16
                                                   176 6 21 167 7 12 12 7 7 25
                                                   177 7 21 167 7 12 12 7 12 7
                                                   16 178 6 21 161 7 12 12 180
                                                   7 25 181 7 21 161 7 12 12
                                                   180 12 7 16 182 7 21 184 7 7
                                                   12 12 185 7 25 186 8 21 184
                                                   7 7 12 12 185 12 7 16 187 1
                                                   7 49 0 189 2 25 0 0 0 190 1
                                                   8 52 0 191 2 8 7 0 52 192 6
                                                   21 193 8 7 12 12 7 25 194 7
                                                   21 193 8 7 12 12 12 7 16 195
                                                   5 0 193 8 7 12 12 9 196 4 0
                                                   161 7 12 12 180 183 3 0 74 7
                                                   12 12 96 4 0 167 7 12 12 7
                                                   179 6 0 184 7 7 7 12 12 185
                                                   188 5 1 193 8 7 12 12 9
                                                   196)))))
           '|lookupComplete|)) 
