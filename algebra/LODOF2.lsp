
(SDEFUN |LODOF2;convertUPtoUTS|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|))
        (SPADCALL |np| (QREFELT $ 10))) 

(SDEFUN |LODOF2;convertUTStoUP|
        ((|ns| |UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
         (|n| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPADCALL |ns| (- |n| 1) (QREFELT $ 16))) 

(SDEFUN |LODOF2;convertL3toLL|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|apf|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#2=#:G182 NIL)
          (|den|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |apf| (|spadConstant| $ 18) . #3=(|LODOF2;convertL3toLL|))
              (LETT |ftmp| |f| . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 22) (QREFELT $ 24)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 26)) . #3#)
                        (LETT |den|
                              (SPADCALL
                               (|LODOF2;convertUPtoUTS|
                                (SPADCALL |lc| (QREFELT $ 27)) $)
                               (QREFELT $ 28))
                              . #3#)
                        (LETT |apf|
                              (SPADCALL |apf|
                                        (SPADCALL
                                         (SPADCALL
                                          (|LODOF2;convertUPtoUTS|
                                           (SPADCALL |lc| (QREFELT $ 29)) $)
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |den|
                                                              (QREFELT $ 31))
                                                    . #3#)
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|Union|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             "failed")
                                                            #2#))
                                          (QREFELT $ 32))
                                         (SPADCALL |ftmp| (QREFELT $ 33))
                                         (QREFELT $ 34))
                                        (QREFELT $ 35))
                              . #3#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 36)) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |apf|)))) 

(SDEFUN |LODOF2;newtonpolygonPoints|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
        (SPROG
         ((|npg|
           (|List| #2=(|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ccw| (|Boolean|)) (|sb2| #3=(|Integer|)) (|sb1| #3#) (|p2| #2#)
          (|p1| #2#) (#4=#:G203 NIL) (|i| NIL)
          (|points3|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|points|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|ftmp| #1#) (|yzero| (|Integer|)) (|yv| (|Integer|))
          (|xv| (|NonNegativeInteger|)))
         (SEQ (LETT |ftmp| |f| . #5=(|LODOF2;newtonpolygonPoints|))
              (LETT |points| NIL . #5#)
              (LETT |yzero|
                    (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37)) (QREFELT $ 39))
                    . #5#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |xv| (SPADCALL |ftmp| (QREFELT $ 41)) . #5#)
                        (LETT |yv|
                              (SPADCALL (SPADCALL |ftmp| (QREFELT $ 37))
                                        (SPADCALL (SPADCALL |f| (QREFELT $ 37))
                                                  (QREFELT $ 39))
                                        (QREFELT $ 42))
                              . #5#)
                        (COND
                         ((SPADCALL |xv| 0 (QREFELT $ 43))
                          (LETT |points| (CONS (CONS |xv| |yv|) |points|)
                                . #5#)))
                        (LETT |yzero| (MIN |yzero| |yv|) . #5#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |points| (CONS (CONS 0 |yzero|) |points|) . #5#)
              (LETT |npg|
                    (LIST (SPADCALL |points| 2 (QREFELT $ 47))
                          (SPADCALL |points| 1 (QREFELT $ 47)))
                    . #5#)
              (LETT |points3| (CDR (CDR |points|)) . #5#)
              (SEQ (LETT |i| NIL . #5#) (LETT #4# |points3| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ccw| 'T . #5#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL (LENGTH |npg|) 1 (QREFELT $ 48))
                                  |ccw|)
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ
                              (LETT |p1| (SPADCALL |npg| 2 (QREFELT $ 47))
                                    . #5#)
                              (LETT |p2| (SPADCALL |npg| 1 (QREFELT $ 47))
                                    . #5#)
                              (LETT |sb1|
                                    (* (- (QCAR |p2|) (QCAR |p1|))
                                       (- (QCDR |i|) (QCDR |p1|)))
                                    . #5#)
                              (LETT |sb2|
                                    (* (- (QCDR |p2|) (QCDR |p1|))
                                       (- (QCAR |i|) (QCAR |p1|)))
                                    . #5#)
                              (LETT |ccw|
                                    (SPADCALL (- |sb1| |sb2|) 0 (QREFELT $ 49))
                                    . #5#)
                              (EXIT
                               (COND (|ccw| (LETT |npg| (CDR |npg|) . #5#)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |npg| (CONS |i| |npg|) . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |npg|))))) 

(SDEFUN |LODOF2;newtonpolygon|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|npol| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|lsc| (|Expression| (|Integer|)))
          (|opc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ind| (|NonNegativeInteger|)) (#1=#:G213 NIL) (|j| NIL)
          (|slop| (|Fraction| (|Integer|))) (#2=#:G211 NIL) (|i| NIL)
          (#3=#:G212 NIL) (|nxt| NIL)
          (|restl|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|)))))
          (|npg|
           (|List| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))))
         (SEQ
          (LETT |npg| (|LODOF2;newtonpolygonPoints| |f| $)
                . #4=(|LODOF2;newtonpolygon|))
          (LETT |res| NIL . #4#) (LETT |restl| (CDR |npg|) . #4#)
          (SEQ (LETT |nxt| NIL . #4#) (LETT #3# |restl| . #4#)
               (LETT |i| NIL . #4#) (LETT #2# |npg| . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |nxt| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |slop|
                      (SPADCALL (- (QCDR |nxt|) (QCDR |i|))
                                (- (QCAR |nxt|) (QCAR |i|)) (QREFELT $ 51))
                      . #4#)
                (LETT |npol| (|spadConstant| $ 52) . #4#)
                (SEQ (LETT |j| 0 . #4#)
                     (LETT #1#
                           (QUOTIENT2 (- (QCAR |nxt|) (QCAR |i|))
                                      (SPADCALL |slop| (QREFELT $ 53)))
                           . #4#)
                     G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (LETT |ind|
                            (+ (* (SPADCALL |slop| (QREFELT $ 53)) |j|)
                               (QCAR |i|))
                            . #4#)
                      (LETT |opc| (SPADCALL |f| |ind| (QREFELT $ 54)) . #4#)
                      (LETT |lsc|
                            (SPADCALL |opc|
                                      (+
                                       (SPADCALL |j|
                                                 (SPADCALL |slop|
                                                           (QREFELT $ 55))
                                                 (QREFELT $ 56))
                                       (QCDR |i|))
                                      (QREFELT $ 57))
                            . #4#)
                      (EXIT
                       (LETT |npol|
                             (SPADCALL |npol|
                                       (SPADCALL |lsc| |j| (QREFELT $ 58))
                                       (QREFELT $ 59))
                             . #4#)))
                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |res| (APPEND |res| (LIST (VECTOR |i| |slop| |npol|)))
                       . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testnp;LodoL;6|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |List|
          (|Record|
           (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
           (|:| |slope| (|Fraction| (|Integer|)))
           (|:| |npoly|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $)) 

(SDEFUN |LODOF2;factor_newton|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))))
          (#1=#:G252 NIL)
          (|jl|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (#2=#:G264 NIL) (|i| NIL) (|slo| #3=(|Fraction| (|Integer|)))
          (|v|
           #4=(|List|
               (|Record|
                (|:| |factor|
                     (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
                (|:| |exponent| (|Integer|)))))
          (#5=#:G263 NIL) (#6=#:G262 NIL) (|v_old| #4#)
          (|unsafe|
           (|List|
            (|Record|
             (|:| |factor|
                  #7=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (|sbt| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|newx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|ie| (|Integer|)) (|e| (|Expression| (|Integer|)))
          (|d| (|NonNegativeInteger|)) (|vjf| #7#) (#8=#:G260 NIL) (|j| NIL)
          (#9=#:G261 NIL) (|jj| NIL) (|dvif| (|NonNegativeInteger|))
          (|vif| #7#) (#10=#:G258 NIL) (#11=#:G259 NIL) (|ii| NIL)
          (|restl| NIL) (#12=#:G256 NIL) (#13=#:G257 NIL)
          (|semi|
           (|OneDimensionalArray|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#14=#:G255 NIL) (|il| NIL) (#15=#:G254 NIL)
          (|npol|
           #16=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#17=#:G253 NIL) (|k| NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| #3#) (|:| |npoly| #16#)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #18=(|LODOF2;factor_newton|))
               (GO #19=#:G251))))
            (LETT |np| (|LODOF2;newtonpolygon| |f| $) . #18#)
            (LETT |res| NIL . #18#)
            (SEQ (LETT |k| NIL . #18#) (LETT #17# |np| . #18#) G190
                 (COND
                  ((OR (ATOM #17#) (PROGN (LETT |k| (CAR #17#) . #18#) NIL))
                   (GO G191)))
                 (SEQ (LETT |npol| (QVELT |k| 2) . #18#)
                      (LETT |v|
                            (SPADCALL (|LODOF2;factorUP| |npol| |factorizer| $)
                                      (QREFELT $ 66))
                            . #18#)
                      (COND
                       ((SPADCALL (QVELT |k| 1) (|spadConstant| $ 67)
                                  (QREFELT $ 68))
                        (LETT |v|
                              (PROGN
                               (LETT #15# NIL . #18#)
                               (SEQ (LETT |il| NIL . #18#)
                                    (LETT #14# |v| . #18#) G190
                                    (COND
                                     ((OR (ATOM #14#)
                                          (PROGN
                                           (LETT |il| (CAR #14#) . #18#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |il|) (QCDR |il|)
                                                        (QREFELT $ 69))
                                              0)
                                             #15#)
                                            . #18#)))
                                    (LETT #14# (CDR #14#) . #18#) (GO G190)
                                    G191 (EXIT (NREVERSE #15#))))
                              . #18#))
                       ('T
                        (SEQ (LETT |unsafe| NIL . #18#)
                             (LETT |semi|
                                   (MAKEARR1 (LENGTH |v|)
                                             (|spadConstant| $ 52))
                                   . #18#)
                             (SEQ (LETT |ii| 1 . #18#)
                                  (LETT #13# (LENGTH |v|) . #18#)
                                  (LETT |i| NIL . #18#) (LETT #12# |v| . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |i| (CAR #12#) . #18#)
                                         NIL)
                                        (|greater_SI| |ii| #13#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |semi| |ii|
                                              (SPADCALL (QCAR |i|) (QCDR |i|)
                                                        (QREFELT $ 69))
                                              (QREFELT $ 71))))
                                  (LETT #12#
                                        (PROG1 (CDR #12#)
                                          (LETT |ii| (|inc_SI| |ii|) . #18#))
                                        . #18#)
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |restl| (CDR |v|) . #18#)
                                  (LETT |ii| 1 . #18#)
                                  (LETT #11# (LENGTH |v|) . #18#)
                                  (LETT |i| NIL . #18#) (LETT #10# |v| . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |i| (CAR #10#) . #18#)
                                         NIL)
                                        (|greater_SI| |ii| #11#)
                                        (ATOM |restl|))
                                    (GO G191)))
                                  (SEQ (LETT |vif| (QCAR |i|) . #18#)
                                       (LETT |dvif|
                                             (SPADCALL |vif| (QREFELT $ 72))
                                             . #18#)
                                       (EXIT
                                        (SEQ (LETT |jj| (+ |ii| 1) . #18#)
                                             (LETT #9# (LENGTH |v|) . #18#)
                                             (LETT |j| NIL . #18#)
                                             (LETT #8# |restl| . #18#) G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |j| (CAR #8#) . #18#)
                                                    NIL)
                                                   (> |jj| #9#))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |vjf| (QCAR |j|) . #18#)
                                              (EXIT
                                               (COND
                                                ((EQL |dvif|
                                                      (SPADCALL |vjf|
                                                                (QREFELT $
                                                                         72)))
                                                 (SEQ
                                                  (LETT |d| (- |dvif| 1)
                                                        . #18#)
                                                  (LETT |e|
                                                        (SPADCALL
                                                         (SPADCALL |vif| |d|
                                                                   (QREFELT $
                                                                            73))
                                                         (SPADCALL |vjf| |d|
                                                                   (QREFELT $
                                                                            73))
                                                         (QREFELT $ 74))
                                                        . #18#)
                                                  (LETT |e|
                                                        (SPADCALL |e|
                                                                  (SPADCALL
                                                                   |dvif|
                                                                   (QREFELT $
                                                                            75))
                                                                  (QREFELT $
                                                                           76))
                                                        . #18#)
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |e|
                                                               (QREFELT $ 78))
                                                     (COND
                                                      ((SPADCALL |e|
                                                                 (|spadConstant|
                                                                  $ 19)
                                                                 (QREFELT $
                                                                          79))
                                                       (SEQ
                                                        (LETT |ie|
                                                              (SPADCALL |e|
                                                                        (QREFELT
                                                                         $ 80))
                                                              . #18#)
                                                        (LETT |newx|
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|spadConstant|
                                                                 $ 12)
                                                                1
                                                                (QREFELT $ 58))
                                                               (SPADCALL |ie|
                                                                         (QREFELT
                                                                          $
                                                                          81))
                                                               (QREFELT $ 59))
                                                              . #18#)
                                                        (LETT |sbt|
                                                              (SPADCALL |vjf|
                                                                        (SPADCALL
                                                                         (|spadConstant|
                                                                          $ 12)
                                                                         1
                                                                         (QREFELT
                                                                          $
                                                                          58))
                                                                        |newx|
                                                                        (QREFELT
                                                                         $ 82))
                                                              . #18#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL
                                                            (SPADCALL |vif|
                                                                      |sbt|
                                                                      (QREFELT
                                                                       $ 83))
                                                            (|spadConstant| $
                                                                            52)
                                                            (QREFELT $ 84))
                                                           (COND
                                                            ((SPADCALL |ie| 0
                                                                       (QREFELT
                                                                        $ 85))
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |i|
                                                                          |unsafe|)
                                                                    . #18#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |jj|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |jj|
                                                                           (QREFELT
                                                                            $
                                                                            86))
                                                                          (SPADCALL
                                                                           |vif|
                                                                           (QCDR
                                                                            |i|)
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           87))
                                                                         (QREFELT
                                                                          $
                                                                          71)))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |unsafe|
                                                                    (CONS |j|
                                                                          |unsafe|)
                                                                    . #18#)
                                                              (EXIT
                                                               (SPADCALL |semi|
                                                                         |ii|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |semi|
                                                                           |ii|
                                                                           (QREFELT
                                                                            $
                                                                            86))
                                                                          (SPADCALL
                                                                           |vjf|
                                                                           (QCDR
                                                                            |j|)
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           87))
                                                                         (QREFELT
                                                                          $
                                                                          71))))))))))))))))))))
                                             (LETT #8#
                                                   (PROG1 (CDR #8#)
                                                     (LETT |jj| (+ |jj| 1)
                                                           . #18#))
                                                   . #18#)
                                             (GO G190) G191 (EXIT NIL))))
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT |ii|
                                                (PROG1 (|inc_SI| |ii|)
                                                  (LETT |restl| (CDR |restl|)
                                                        . #18#))
                                                . #18#))
                                        . #18#)
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |v_old| |v| . #18#)
                             (LETT |v| (SPADCALL |v| |unsafe| (QREFELT $ 88))
                                   . #18#)
                             (EXIT
                              (COND
                               ((EQUAL |option| "semireg")
                                (LETT |v|
                                      (PROGN
                                       (LETT #6# NIL . #18#)
                                       (SEQ (LETT |i| NIL . #18#)
                                            (LETT #5# |v| . #18#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |i| (CAR #5#) . #18#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (CONS
                                                      (SPADCALL |semi|
                                                                (SPADCALL |i|
                                                                          |v_old|
                                                                          (QREFELT
                                                                           $
                                                                           89))
                                                                (QREFELT $ 86))
                                                      1)
                                                     #6#)
                                                    . #18#)))
                                            (LETT #5# (CDR #5#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      . #18#)))))))
                      (LETT |slo| (QVELT |k| 1) . #18#)
                      (COND
                       ((EQL
                         (*
                          (SPADCALL (QCAR (SPADCALL |v| 1 (QREFELT $ 90)))
                                    (QREFELT $ 72))
                          (SPADCALL |slo| (QREFELT $ 53)))
                         (SPADCALL |f| (QREFELT $ 41)))
                        (PROGN (LETT #1# (LIST |f|) . #18#) (GO #19#))))
                      (EXIT
                       (SEQ (LETT |i| NIL . #18#) (LETT #2# |v| . #18#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |i| (CAR #2#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |jl|
                                   (|LODOF2;factor_newton2| |f| (QCAR |i|) |k|
                                    $)
                                   . #18#)
                             (COND
                              ((EQUAL |option| "alg factor")
                               (PROGN
                                (LETT #1# (LIST (QCDR |jl|)) . #18#)
                                (GO #19#)))
                              ((EQUAL |option| "split over k((x))")
                               (PROGN
                                (LETT #1#
                                      (APPEND
                                       (|LODOF2;factor_newton| (QCAR |jl|)
                                        |factorizer| |option| $)
                                       (LIST (QCDR |jl|)))
                                      . #18#)
                                (GO #19#))))
                             (EXIT
                              (LETT |res| (APPEND |res| (LIST (QCDR |jl|)))
                                    . #18#)))
                            (LETT #2# (CDR #2#) . #18#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #19# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfn;LodoMSL;8|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))))
        (|LODOF2;factor_newton| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;factorUP|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|factorSUP| |Mapping|
          #1=(|Factored|
              (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Factored|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|fsnp| #1#)
          (|snp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |snp| (SPADCALL |np| (QREFELT $ 96)) . #2=(|LODOF2;factorUP|))
          (LETT |fsnp| (SPADCALL |snp| |factorSUP|) . #2#)
          (EXIT (SPADCALL (ELT $ 97) |fsnp| (QREFELT $ 101)))))) 

(SDEFUN |LODOF2;factor_newton2|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|l| |Record|
          (|:| |point| (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
          (|:| |slope| #1=(|Fraction| (|Integer|)))
          (|:| |npoly|
               #2=(|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|right|
           #3=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|left| #3#)
          (|llr|
           (|Record|
            (|:| |laurl|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |laurr|
                 (|List|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|ordl| (|Integer|)) (|ordr| (|Integer|))
          (|npor| #4=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npo| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|mlr| #4#) (|shift| (|Fraction| (|Integer|))) (|npol| #2#)
          (|xcd| (|Integer|)) (|ycd| (|Integer|)) (|slop| #1#))
         (SEQ (LETT |slop| (QVELT |l| 1) . #5=(|LODOF2;factor_newton2|))
              (LETT |ycd| (QCDR (QVELT |l| 0)) . #5#)
              (LETT |xcd| (QCAR (QVELT |l| 0)) . #5#)
              (LETT |npol| (QVELT |l| 2) . #5#)
              (LETT |shift|
                    (SPADCALL (|spadConstant| $ 67)
                              (SPADCALL (SPADCALL |ycd| (QREFELT $ 102))
                                        (SPADCALL
                                         (- (SPADCALL |f| (QREFELT $ 41))
                                            |xcd|)
                                         |slop| (QREFELT $ 103))
                                        (QREFELT $ 104))
                              (QREFELT $ 105))
                    . #5#)
              (LETT |npo| (SPADCALL (|spadConstant| $ 12) |xcd| (QREFELT $ 58))
                    . #5#)
              (LETT |mlr|
                    (SPADCALL (SPADCALL |npol| |r| (QREFELT $ 106))
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 82))
                    . #5#)
              (LETT |npo| (SPADCALL |npo| |mlr| (QREFELT $ 87)) . #5#)
              (LETT |npor|
                    (SPADCALL |r|
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL (|spadConstant| $ 12)
                                        (SPADCALL |slop| (QREFELT $ 53))
                                        (QREFELT $ 58))
                              (QREFELT $ 82))
                    . #5#)
              (LETT |ordr|
                    (* (SPADCALL |r| (QREFELT $ 72))
                       (SPADCALL |slop| (QREFELT $ 53)))
                    . #5#)
              (LETT |ordl| (- (SPADCALL |f| (QREFELT $ 41)) |ordr|) . #5#)
              (LETT |lwr|
                    (|LODOF2;ln_wrapper| |slop| |f| |npo| |npor| |shift| |ordr|
                     $)
                    . #5#)
              (LETT |lcr|
                    (|LODOF2;listream_coefs| |lwr| |ordl| |ordr| |shift| |slop|
                     $)
                    . #5#)
              (LETT |llr| (|LODOF2;list_laurent| |lcr| |ordl| |ordr| $) . #5#)
              (LETT |left| (|LODOF2;laurent_op| (QCAR |llr|) |ordl| $) . #5#)
              (LETT |right| (|LODOF2;laurent_op| (QCDR |llr|) |ordr| $) . #5#)
              (EXIT (CONS |left| |right|))))) 

(SDEFUN |LODOF2;testf2;LodoUpFR;11|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|r| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |Qt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |Rt|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|l|
           #1=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#2=#:G283 NIL) (|i| NIL) (|np| (|List| #1#)))
         (SEQ
          (LETT |np| (|LODOF2;newtonpolygon| (|LODOF2;convertL3toLL| |f| $) $)
                . #3=(|LODOF2;testf2;LodoUpFR;11|))
          (SEQ (LETT |i| NIL . #3#) (LETT #2# |np| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 1) |slop| (QREFELT $ 107))
                   (LETT |l| |i| . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|LODOF2;factor_newton2| (|LODOF2;convertL3toLL| |f| $) |r| |l|
            $))))) 

(SDEFUN |LODOF2;laurent_op|
        ((|llaur| |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|dgf| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G287 NIL) (|i| NIL))
         (SEQ (LETT |f| (|spadConstant| $ 18) . #2=(|LODOF2;laurent_op|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |dgf| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |f|
                           (SPADCALL |f|
                                     (SPADCALL
                                      (SPADCALL |llaur| (+ |i| 1)
                                                (QREFELT $ 111))
                                      |i| (QREFELT $ 34))
                                     (QREFELT $ 35))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;list_laurent|
        ((|lsc| |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|))))))))
         (|dgl| |Integer|) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|laurer|
           #1=(|List|
               (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)))
          (|laurel| #1#))
         (SEQ
          (LETT |laurel| (|LODOF2;list_laurentop| (QCAR |lsc|) |dgl| $)
                . #2=(|LODOF2;list_laurent|))
          (LETT |laurer| (|LODOF2;list_laurentop| (QCDR |lsc|) |dgr| $) . #2#)
          (EXIT (CONS |laurel| |laurer|))))) 

(SDEFUN |LODOF2;testll;FLodo2UpFIR;14|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |laurl|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |laurr|
               (|List|
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|lcr|
           (|Record|
            (|:| |llc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))
            (|:| |rlc|
                 (|List|
                  (|Stream|
                   (|Record| (|:| |k| (|Integer|))
                             (|:| |c| (|Expression| (|Integer|)))))))))
          (|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $)
                . #1=(|LODOF2;testll;FLodo2UpFIR;14|))
          (LETT |lcr|
                (|LODOF2;listream_coefs| |lwr|
                 (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop|
                 $)
                . #1#)
          (EXIT
           (|LODOF2;list_laurent| |lcr| (- (SPADCALL |f| (QREFELT $ 33)) |dgr|)
            |dgr| $))))) 

(SDEFUN |LODOF2;list_laurentop|
        ((|lsc| |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|))))))
         (|dgf| |Integer|)
         ($ |List|
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#1=#:G301 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|LODOF2;list_laurentop|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# |dgf| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (APPEND |res|
                                   (LIST
                                    (SPADCALL
                                     (SPADCALL |lsc| (+ |i| 1) (QREFELT $ 117))
                                     (QREFELT $ 118))))
                           . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;listream_coefs|
        ((|slr| |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|dgl| |Integer|) (|dgr| |Integer|) (|shift| |Fraction| (|Integer|))
         (|slop| |Fraction| (|Integer|))
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|rsc|
           #1=(|List|
               (|Stream|
                (|Record| (|:| |k| (|Integer|))
                          (|:| |c| (|Expression| (|Integer|)))))))
          (|re| (|Integer|))
          (|sre|
           #2=(|Stream|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|))))
          (|lsc| #1#) (|le| (|Integer|)) (|sle| #2#))
         (SEQ
          (LETT |sle|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!0|) |slr|
                          (QREFELT $ 123))
                . #3=(|LODOF2;listream_coefs|))
          (LETT |le|
                (SPADCALL
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                           (QREFELT $ 103))
                 (QREFELT $ 124))
                . #3#)
          (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|)) . #3#)
          (LETT |lsc| (|LODOF2;listream_coefsop| |sle| |dgl| |le| |slop| $)
                . #3#)
          (LETT |sre|
                (SPADCALL (LIST #'|LODOF2;listream_coefs!1|) |slr|
                          (QREFELT $ 123))
                . #3#)
          (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)) . #3#)
          (LETT |rsc| (|LODOF2;listream_coefsop| |sre| |dgr| |re| |slop| $)
                . #3#)
          (EXIT (CONS |lsc| |rsc|))))) 

(SDEFUN |LODOF2;listream_coefs!1| ((|landr| NIL) ($$ NIL)) (QCDR |landr|)) 

(SDEFUN |LODOF2;listream_coefs!0| ((|landr| NIL) ($$ NIL)) (QCAR |landr|)) 

(SDEFUN |LODOF2;testlc;FLodo2UpFIR;17|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |llc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))
          (|:| |rlc|
               (|List|
                (|Stream|
                 (|Record| (|:| |k| (|Integer|))
                           (|:| |c| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|lwr|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))))))
         (SEQ
          (LETT |lwr|
                (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $)
                 |l_low| |r_low| |shift| |dgr| $)
                |LODOF2;testlc;FLodo2UpFIR;17|)
          (EXIT
           (|LODOF2;listream_coefs| |lwr|
            (- (SPADCALL |f| (QREFELT $ 33)) |dgr|) |dgr| |shift| |slop| $))))) 

(SDEFUN |LODOF2;listream_coefsop|
        ((|sfe| |Stream|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)))
         (|dgf| |Integer|) (|fe| |Integer|) (|slop| |Fraction| (|Integer|))
         ($ |List|
          (|Stream|
           (|Record| (|:| |k| (|Integer|))
                     (|:| |c| (|Expression| (|Integer|)))))))
        (SPROG
         ((|dgc|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|res|
           (|List|
            (|Stream|
             (|Record| (|:| |k| (|Integer|))
                       (|:| |c| (|Expression| (|Integer|)))))))
          (|new_term|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (|nl_st| (|Stream| (|Integer|))) (#1=#:G336 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|LODOF2;listream_coefsop|))
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |dgf| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |nl_st|
                          (SPADCALL (CONS #'|LODOF2;listream_coefsop!0| $) 1
                                    (QREFELT $ 132))
                          . #2#)
                    (LETT |new_term|
                          (SPADCALL
                           (CONS #'|LODOF2;listream_coefsop!1|
                                 (VECTOR |i| |fe| |slop| $))
                           |sfe| |nl_st| (QREFELT $ 140))
                          . #2#)
                    (EXIT (LETT |res| (APPEND |res| (LIST |new_term|)) . #2#)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |dgc|
                    (LIST
                     (SPADCALL (LIST (CONS 0 (|spadConstant| $ 12)))
                               (QREFELT $ 142)))
                    . #2#)
              (EXIT (APPEND |res| |dgc|))))) 

(SDEFUN |LODOF2;listream_coefsop!1| ((|x| NIL) (|n_l| NIL) ($$ NIL))
        (PROG ($ |slop| |fe| |i|)
          (LETT $ (QREFELT $$ 3) . #1=(|LODOF2;listream_coefsop|))
          (LETT |slop| (QREFELT $$ 2) . #1#)
          (LETT |fe| (QREFELT $$ 1) . #1#)
          (LETT |i| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((#2=#:G325 NIL) (|coefd| NIL) (|cx| NIL) (|deg| NIL)
              (|degn| NIL))
             (SEQ
              (LETT |degn|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |n_l| (|spadConstant| $ 128) (QREFELT $ 133))
                       (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 134))
                      |fe| (QREFELT $ 129))
                     (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 55))
                               (QREFELT $ 56))
                     (QREFELT $ 129))
                    NIL)
              (LETT |deg|
                    (SPADCALL
                     (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                               (QREFELT $ 51))
                     (QREFELT $ 136))
                    NIL)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |deg| (CONS 1 "failed") (QREFELT $ 137)))
                     (GO G191)))
                   (SEQ
                    (LETT |degn|
                          (SPADCALL |degn| (|spadConstant| $ 128)
                                    (QREFELT $ 129))
                          NIL)
                    (EXIT
                     (LETT |deg|
                           (SPADCALL
                            (SPADCALL |degn| (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 51))
                            (QREFELT $ 136))
                           NIL)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |cx| (SPADCALL |x| |i| (QREFELT $ 54)) NIL)
              (LETT |coefd|
                    (SPADCALL |cx|
                              (PROG2 (LETT #2# |deg| NIL)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                                (|Union| (|Integer|)
                                                         #3="failed")
                                                #2#))
                              (QREFELT $ 57))
                    NIL)
              (EXIT
               (CONS
                (PROG2 (LETT #2# |deg| NIL)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                  (|Union| (|Integer|) #3#) #2#))
                |coefd|)))))))) 

(SDEFUN |LODOF2;listream_coefsop!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 128) (QREFELT $ 129))) 

(SDEFUN |LODOF2;lift_newton|
        ((|slop| |Fraction| (|Integer|))
         (|ff| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         (|v| |Record|
          (|:| |Qt|
               #1=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
          (|:| |Rt|
               #2=(|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
         (|ei| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|n_l| |PositiveInteger|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ri| #2#) (|li| #1#)
          (|r_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|l_extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|pl_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pr_extra|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|pi| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#3=#:G355 NIL) (|i| #4=(|Integer|)) (|fe| #5=(|Integer|))
          (|re| (|Integer|)) (|le| #5#)
          (|c2| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c1| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|s|
           (|Record|
            (|:| |coef1|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |coef2|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#6=#:G346 NIL)
          (|sl_low| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dgl| #4#))
         (SEQ
          (LETT |dgl| (- (SPADCALL |ff| (QREFELT $ 41)) |dgr|)
                . #7=(|LODOF2;lift_newton|))
          (LETT |li| (QCAR |v|) . #7#) (LETT |ri| (QCDR |v|) . #7#)
          (COND
           ((SPADCALL |slop| (|spadConstant| $ 67) (QREFELT $ 107))
            (SEQ (LETT |i| (- |n_l| 1) . #7#)
                 (COND
                  ((EQL |i| 0)
                   (SEQ (LETT |r_extra| (|LODOF2;plug_delta| |r_low| $) . #7#)
                        (EXIT
                         (LETT |l_extra|
                               (SPADCALL (|LODOF2;plug_delta| |l_low| $)
                                         (SPADCALL (|spadConstant| $ 12)
                                                   (SPADCALL |shift|
                                                             (QREFELT $ 124))
                                                   (QREFELT $ 143))
                                         (QREFELT $ 144))
                               . #7#))))
                  (#8='T
                   (SEQ
                    (LETT |sl_low|
                          (SPADCALL |l_low|
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 12) 1
                                               (QREFELT $ 58))
                                     (SPADCALL |i| (QREFELT $ 81))
                                     (QREFELT $ 59))
                                    (QREFELT $ 82))
                          . #7#)
                    (LETT |s| (SPADCALL |r_low| |sl_low| (QREFELT $ 146))
                          . #7#)
                    (COND
                     ((SPADCALL (QVELT |s| 2) (|spadConstant| $ 147)
                                (QREFELT $ 148))
                      (|error| "unsafe factor")))
                    (LETT |c1| (QVELT |s| 0) . #7#)
                    (LETT |c2| (QVELT |s| 1) . #7#)
                    (LETT |pi|
                          (|LODOF2;coeffx| |ei|
                           (SPADCALL (SPADCALL |i| (QREFELT $ 102)) |shift|
                                     (QREFELT $ 104))
                           $)
                          . #7#)
                    (LETT |pr_extra|
                          (SPADCALL
                           (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 87))
                                     |r_low| (QREFELT $ 149))
                           (QREFELT $ 150))
                          . #7#)
                    (LETT |r_extra| (|LODOF2;plug_delta| |pr_extra| $) . #7#)
                    (LETT |pl_extra|
                          (SPADCALL
                           (SPADCALL |pi|
                                     (SPADCALL |pr_extra| |sl_low|
                                               (QREFELT $ 87))
                                     (QREFELT $ 59))
                           |r_low| (QREFELT $ 106))
                          . #7#)
                    (LETT |l_extra| (|LODOF2;plug_delta| |pl_extra| $) . #7#)
                    (LETT |l_extra|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12)
                                      (+ |i|
                                         (SPADCALL |shift| (QREFELT $ 124)))
                                      (QREFELT $ 143))
                            |l_extra| (QREFELT $ 154))
                           (QREFELT $ 155))
                          . #7#)
                    (EXIT
                     (LETT |r_extra|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) |i|
                                      (QREFELT $ 143))
                            |r_extra| (QREFELT $ 154))
                           . #7#)))))
                 (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                 (LETT |ei|
                       (SPADCALL
                        (SPADCALL |ei|
                                  (SPADCALL |l_extra| |ri| (QREFELT $ 156))
                                  (QREFELT $ 35))
                        (SPADCALL |li| |r_extra| (QREFELT $ 156))
                        (QREFELT $ 35))
                       . #7#)
                 (EXIT
                  (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#))))
           (#8#
            (SEQ
             (LETT |s|
                   (PROG2
                       (LETT #6#
                             (SPADCALL |r_low| |l_low| (|spadConstant| $ 147)
                                       (QREFELT $ 159))
                             . #7#)
                       (QCDR #6#)
                     (|check_union2| (QEQCAR #6# 0)
                                     (|Record|
                                      (|:| |coef1|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))
                                      (|:| |coef2|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|)))))
                                     (|Union|
                                      (|Record|
                                       (|:| |coef1|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |coef2|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))))
                                      "failed")
                                     #6#))
                   . #7#)
             (LETT |c1| (QCAR |s|) . #7#) (LETT |c2| (QCDR |s|) . #7#)
             (LETT |le|
                   (SPADCALL
                    (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                              (QREFELT $ 103))
                    (QREFELT $ 124))
                   . #7#)
             (LETT |le| (- |le| (* (SPADCALL |slop| (QREFELT $ 55)) |dgl|))
                   . #7#)
             (LETT |re| (- (* (SPADCALL |slop| (QREFELT $ 55)) |dgr|)) . #7#)
             (LETT |fe|
                   (SPADCALL
                    (SPADCALL (SPADCALL |slop| (QREFELT $ 53)) |shift|
                              (QREFELT $ 103))
                    (QREFELT $ 124))
                   . #7#)
             (LETT |fe|
                   (- |fe|
                      (* (SPADCALL |slop| (QREFELT $ 55))
                         (SPADCALL |ff| (QREFELT $ 41))))
                   . #7#)
             (EXIT
              (SEQ
               (LETT |i| (* (- |n_l| 1) (SPADCALL |slop| (QREFELT $ 53)))
                     . #7#)
               (LETT #3#
                     (-
                      (SPADCALL |n_l| (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 161))
                      1)
                     . #7#)
               G190 (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (COND
                 ((EQL |i| 0)
                  (SEQ
                   (LETT |r_extra|
                         (|LODOF2;coefs_operator| |r_low| |slop| |re| $) . #7#)
                   (EXIT
                    (LETT |l_extra|
                          (|LODOF2;coefs_operator| |l_low| |slop| |le| $)
                          . #7#))))
                 ('T
                  (SEQ
                   (LETT |pi| (|LODOF2;coefs_poly| |ei| |slop| (+ |i| |fe|) $)
                         . #7#)
                   (LETT |pr_extra|
                         (SPADCALL (SPADCALL |c2| |pi| (QREFELT $ 87)) |r_low|
                                   (QREFELT $ 149))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL |pi|
                                   (SPADCALL |pr_extra| |l_low| (QREFELT $ 87))
                                   (QREFELT $ 83))
                         . #7#)
                   (LETT |pl_extra|
                         (SPADCALL
                          (SPADCALL |pl_extra| |r_low| (QREFELT $ 106))
                          (QREFELT $ 150))
                         . #7#)
                   (LETT |l_extra|
                         (|LODOF2;coefs_operator| |pl_extra| |slop|
                          (+ |i| |le|) $)
                         . #7#)
                   (EXIT
                    (LETT |r_extra|
                          (|LODOF2;coefs_operator|
                           (SPADCALL |pr_extra| (QREFELT $ 150)) |slop|
                           (+ |i| |re|) $)
                          . #7#)))))
                (LETT |li| (SPADCALL |li| |l_extra| (QREFELT $ 35)) . #7#)
                (LETT |ei|
                      (SPADCALL
                       (SPADCALL |ei| (SPADCALL |l_extra| |ri| (QREFELT $ 156))
                                 (QREFELT $ 35))
                       (SPADCALL |li| |r_extra| (QREFELT $ 156))
                       (QREFELT $ 35))
                      . #7#)
                (EXIT
                 (LETT |ri| (SPADCALL |ri| |r_extra| (QREFELT $ 35)) . #7#)))
               (LETT |i| (+ |i| 1) . #7#) (GO G190) G191 (EXIT NIL))))))
          (EXIT
           (VECTOR
            (CONS (SPADCALL |li| (QCAR |v|) (QREFELT $ 162))
                  (SPADCALL |ri| (QCDR |v|) (QREFELT $ 162)))
            (CONS |li| |ri|) |ei|))))) 

(SDEFUN |LODOF2;testln;FLodo2UpFIR;20|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Record|
          (|:| |main|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |nf|
               (|Record|
                (|:| |Qt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))
                (|:| |Rt|
                     (|LinearOrdinaryDifferentialOperator3|
                      (|Expression| (|Integer|))
                      (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                |var| |cen|)
                      (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)))))
          (|:| |error|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))))
        (SPROG
         ((|ei|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|v|
           (|Record|
            (|:| |Qt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |Rt|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|lnr|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|i| NIL))
         (SEQ
          (LETT |v| (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                . #1=(|LODOF2;testln;FLodo2UpFIR;20|))
          (LETT |ei| (SPADCALL (|LODOF2;convertL3toLL| |f| $) (QREFELT $ 155))
                . #1#)
          (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| 5) (GO G191)))
               (SEQ
                (LETT |lnr|
                      (|LODOF2;lift_newton| |slop|
                       (|LODOF2;convertL3toLL| |f| $) |l_low| |r_low| |shift|
                       |dgr| |v| |ei| |i| $)
                      . #1#)
                (SPADCALL (SPADCALL (QCAR (QVELT |lnr| 0)) (QREFELT $ 164))
                          (QREFELT $ 166))
                (SPADCALL (SPADCALL (QCDR (QVELT |lnr| 0)) (QREFELT $ 164))
                          (QREFELT $ 166))
                (LETT |v| (QVELT |lnr| 1) . #1#)
                (EXIT (LETT |ei| (QVELT |lnr| 2) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |lnr|)))) 

(SDEFUN |LODOF2;ln_wrapper|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|Stream|
            (|Record|
             (|:| |Qt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |Rt|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|all|
           (|Stream|
            (|Record|
             (|:| |lr|
                  (|Record|
                   (|:| |main|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |nf|
                        (|Record|
                         (|:| |Qt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))
                         (|:| |Rt|
                              (|LinearOrdinaryDifferentialOperator3|
                               (|Expression| (|Integer|))
                               (|UnivariateTaylorSeries|
                                (|Expression| (|Integer|)) |var| |cen|)
                               (|UnivariateLaurentSeries|
                                (|Expression| (|Integer|)) |var| |cen|)))))
                   (|:| |error|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |n_lifts| (|PositiveInteger|)))))
          (|lni|
           (|Record|
            (|:| |main|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |nf|
                 (|Record|
                  (|:| |Qt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |Rt|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))))
            (|:| |error|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|n_li| (|PositiveInteger|)))
         (SEQ
          (LETT |lni|
                (VECTOR (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (CONS (|spadConstant| $ 18) (|spadConstant| $ 18))
                        (SPADCALL |f| (QREFELT $ 155)))
                . #1=(|LODOF2;ln_wrapper|))
          (LETT |n_li| 1 . #1#)
          (LETT |lni|
                (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low| |shift| |dgr|
                 (QVELT |lni| 1) (QVELT |lni| 2) |n_li| $)
                . #1#)
          (LETT |all|
                (SPADCALL
                 (CONS #'|LODOF2;ln_wrapper!0|
                       (VECTOR |dgr| |shift| |r_low| |l_low| |f| |slop| $))
                 (CONS |lni| |n_li|) (QREFELT $ 174))
                . #1#)
          (LETT |res|
                (SPADCALL (LIST #'|LODOF2;ln_wrapper!1|) |all| (QREFELT $ 177))
                . #1#)
          (EXIT |res|)))) 

(SDEFUN |LODOF2;ln_wrapper!1| ((|rec| NIL) ($$ NIL)) (QVELT (QCAR |rec|) 0)) 

(SDEFUN |LODOF2;ln_wrapper!0| ((|rec| NIL) ($$ NIL))
        (PROG ($ |slop| |f| |l_low| |r_low| |shift| |dgr|)
          (LETT $ (QREFELT $$ 6) . #1=(|LODOF2;ln_wrapper|))
          (LETT |slop| (QREFELT $$ 5) . #1#)
          (LETT |f| (QREFELT $$ 4) . #1#)
          (LETT |l_low| (QREFELT $$ 3) . #1#)
          (LETT |r_low| (QREFELT $$ 2) . #1#)
          (LETT |shift| (QREFELT $$ 1) . #1#)
          (LETT |dgr| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|lnr| NIL) (|n_l| NIL))
                   (SEQ (LETT |lnr| (QCAR |rec|) NIL)
                        (LETT |n_l|
                              (SPADCALL (QCDR |rec|) (|spadConstant| $ 169)
                                        (QREFELT $ 170))
                              NIL)
                        (LETT |lnr|
                              (|LODOF2;lift_newton| |slop| |f| |l_low| |r_low|
                               |shift| |dgr| (QVELT |lnr| 1) (QVELT |lnr| 2)
                               |n_l| $)
                              NIL)
                        (EXIT (CONS |lnr| |n_l|)))))))) 

(SDEFUN |LODOF2;testlw;FLodo2UpFIS;22|
        ((|slop| |Fraction| (|Integer|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|l_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|r_low| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|shift| |Fraction| (|Integer|)) (|dgr| |Integer|)
         ($ |Stream|
          (|Record|
           (|:| |Qt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |Rt|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (|LODOF2;ln_wrapper| |slop| (|LODOF2;convertL3toLL| |f| $) |l_low|
         |r_low| |shift| |dgr| $)) 

(SDEFUN |LODOF2;coefs_poly|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|npc| (|Expression| (|Integer|)))
          (|fc| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (#1=#:G382 NIL) (|j| NIL) (|start_x| (|Fraction| (|Integer|)))
          (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 179))
                 0)
                . #2=(|LODOF2;coefs_poly|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 180))
                . #2#)
          (LETT |start_x|
                (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 103))
                          (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 51))
                          (QREFELT $ 104))
                . #2#)
          (LETT |res| (|spadConstant| $ 52) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT $ 41))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 181))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |fc|
                      (|LODOF2;coeffx| |f|
                       (SPADCALL |start_x|
                                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                           (SPADCALL |j| (QREFELT $ 102))
                                           (QREFELT $ 103))
                                 (QREFELT $ 104))
                       $)
                      . #2#)
                (LETT |npc|
                      (SPADCALL |fc|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 73))
                      . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |npc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 58))
                                 (QREFELT $ 59))
                       . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testcp;LodoFILodo;24|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;coefs_operator|
         (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i| $)
         |slop| |i| $)) 

(SDEFUN |LODOF2;coefs_operator|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npc| (|Expression| (|Integer|))) (#1=#:G389 NIL) (|j| NIL)
          (|start_x| (|Integer|)) (|start_D| (|Integer|)) (|nsi| (|Integer|)))
         (SEQ
          (LETT |nsi|
                (QVELT
                 (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                           (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 179))
                 0)
                . #2=(|LODOF2;coefs_operator|))
          (LETT |start_D|
                (SPADCALL (- (* |i| |nsi|)) (SPADCALL |slop| (QREFELT $ 53))
                          (QREFELT $ 180))
                . #2#)
          (LETT |start_x|
                (SPADCALL
                 (SPADCALL (SPADCALL |start_D| |slop| (QREFELT $ 103))
                           (SPADCALL |i| (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 51))
                           (QREFELT $ 104))
                 (QREFELT $ 124))
                . #2#)
          (LETT |res| (|spadConstant| $ 18) . #2#)
          (SEQ (LETT |j| 0 . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |np| (QREFELT $ 72))
                                (SPADCALL |slop| (QREFELT $ 53))
                                (QREFELT $ 51))
                      (QREFELT $ 183))
                     . #2#)
               G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (LETT |npc|
                      (SPADCALL |np|
                                (+ |start_D|
                                   (SPADCALL |j|
                                             (SPADCALL |slop| (QREFELT $ 53))
                                             (QREFELT $ 56)))
                                (QREFELT $ 73))
                      . #2#)
                (LETT |sc|
                      (SPADCALL |npc|
                                (+ |start_x|
                                   (* (SPADCALL |slop| (QREFELT $ 55)) |j|))
                                (QREFELT $ 143))
                      . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |sc|
                                           (+ |start_D|
                                              (SPADCALL |j|
                                                        (SPADCALL |slop|
                                                                  (QREFELT $
                                                                           53))
                                                        (QREFELT $ 56)))
                                           (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #2#)))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;testco;LodoFIB;26|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|slop| |Fraction| (|Integer|)) (|i| |Integer|) ($ |Boolean|))
        (SPROG
         ((|np| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |np|
                (|LODOF2;coefs_poly| (|LODOF2;convertL3toLL| |f| $) |slop| |i|
                 $)
                |LODOF2;testco;LodoFIB;26|)
          (EXIT
           (SPADCALL
            (|LODOF2;coefs_poly| (|LODOF2;coefs_operator| |np| |slop| |i| $)
             |slop| |i| $)
            |np| (QREFELT $ 84)))))) 

(SDEFUN |LODOF2;coeffx|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ex| (|Integer|)))
         (SEQ (LETT |ftmp| |f| . #2=(|LODOF2;coeffx|))
              (LETT |ex| (SPADCALL |e| (QREFELT $ 124)) . #2#)
              (LETT |res| (|spadConstant| $ 52) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| |ex| (QREFELT $ 57))
                                         |dg| (QREFELT $ 58))
                                        (QREFELT $ 59))
                              . #2#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;testcx;LodoFUp;28|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|e| |Fraction| (|Integer|))
         ($ |UnivariatePolynomial| |var| (|Expression| (|Integer|))))
        (|LODOF2;coeffx| (|LODOF2;convertL3toLL| |f| $) |e| $)) 

(SDEFUN |LODOF2;plug_delta|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|nptmp| #1#)
          (|f|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |f| (|spadConstant| $ 18) . #2=(|LODOF2;plug_delta|))
              (LETT |nptmp| |np| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 148)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 186)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 72)) . #2#)
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 187)) |dg|
                                         (QREFELT $ 34))
                                        (QREFELT $ 35))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 188))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODOF2;testpd;UpLodo;30|
        ((|np| |UnivariatePolynomial| |var| (|Expression| (|Integer|)))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;plug_delta| |np| $)) 

(SDEFUN |LODOF2;factor_riccati|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G574 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|nt|
           #2=(|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|ir|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#3=#:G606 NIL)
          (|i| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#4=#:G605 NIL) (#5=#:G604 NIL)
          (|vsp|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|r| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|v|
           (|Union|
            (|List|
             (|Record|
              (|:| |op|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |ram|
                   (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
              (|:| |expart|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))
            (|List|
             (|Union|
              (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|))
              (|Record|
               (|:| |ope|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|)))
               (|:| |dext| (|PositiveInteger|))
               (|:| |alpha| (|Expression| (|Integer|)))
               (|:| |rami|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|)))))))))
          (|f2r|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|lns|
           #6=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| #7=(|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (#8=#:G603 NIL) (|np| (|List| #6#))
          (|tosub| (|Expression| (|Integer|))) (|exp| (|Integer|))
          (|ror|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|coefr| (|Expression| (|Integer|))) (|n| (|Integer|))
          (#9=#:G602 NIL)
          (|npgr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|gr| (|Expression| (|Integer|)))
          (|rk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#10=#:G178 NIL) (#11=#:G601 NIL)
          (|ric|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#12=#:G405 NIL)
          (|lk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|r1|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#13=#:G600 NIL) (#14=#:G599 NIL) (#15=#:G598 NIL) (#16=#:G597 NIL)
          (#17=#:G596 NIL) (#18=#:G595 NIL) (#19=#:G594 NIL) (#20=#:G593 NIL)
          (|retv|
           (|List|
            (|Record|
             (|:| |op|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ram|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |expart|
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))))
          (|fullxr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|xsubsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#21=#:G592 NIL) (|vi| NIL) (|sym| (|Symbol|)) (#22=#:G404 NIL)
          (#23=#:G177 NIL)
          (|cxs|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#24=#:G591 NIL) (#25=#:G590 NIL) (#26=#:G589 NIL) (#27=#:G588 NIL)
          (#28=#:G587 NIL) (#29=#:G586 NIL) (#30=#:G585 NIL) (#31=#:G584 NIL)
          (#32=#:G583 NIL) (#33=#:G582 NIL) (#34=#:G581 NIL) (#35=#:G580 NIL)
          (#36=#:G579 NIL) (#37=#:G578 NIL) (#38=#:G577 NIL)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|npf|
           (|Record|
            (|:| |factor|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |exponent| (|Integer|))))
          (#39=#:G576 NIL) (|ip| NIL)
          (|subs|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|sols| (|List| (|Integer|))) (#40=#:G418 NIL)
          (|fact| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|diff| (|Union| (|Integer|) "failed")) (#41=#:G575 NIL) (|l| NIL)
          (|xx| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|vr| #2#)
          (|va|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|slop| #7#)
          (|np1|
           (|Record|
            (|:| |point|
                 (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
            (|:| |slope| (|Fraction| (|Integer|)))
            (|:| |npoly|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |np| (|LODOF2;newtonpolygon| |f| $)
                  . #42=(|LODOF2;factor_riccati|))
            (LETT |np1| (SPADCALL |np| 1 (QREFELT $ 190)) . #42#)
            (LETT |slop| (QVELT |np1| 1) . #42#)
            (COND
             ((EQUAL |option| "semireg")
              (COND
               ((SPADCALL |slop| (|spadConstant| $ 67) (QREFELT $ 107))
                (SEQ
                 (LETT |va|
                       (SPADCALL
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_op| |f| |factorizer|
                                   "alg factor" $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        (QREFELT $ 194))
                       . #42#)
                 (COND
                  ((QEQCAR |va| 0)
                   (LETT |vr|
                         (VECTOR (QCDR |va|) 1 (|spadConstant| $ 19)
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 58)))
                         . #42#))
                  (#43='T (LETT |vr| (QCDR |va|) . #42#)))
                 (LETT |xx| (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                       . #42#)
                 (LETT |i|
                       (SPADCALL |xx|
                                 (|LODOF2;coeffx| (QVELT |vr| 0)
                                  (|spadConstant| $ 67) $)
                                 (QREFELT $ 83))
                       . #42#)
                 (LETT |n|
                       (QUOTIENT2 (SPADCALL |f| (QREFELT $ 41)) (QVELT |vr| 1))
                       . #42#)
                 (COND
                  ((EQL |n| 1)
                   (SEQ
                    (LETT |il|
                          (SPADCALL (|LODOF2;convertUPtoUTS| |i| $)
                                    (QREFELT $ 28))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (LIST
                                   (VECTOR
                                    (SPADCALL (QVELT |vr| 0)
                                              (SPADCALL |il| (QREFELT $ 195))
                                              (QREFELT $ 35))
                                    (QVELT |vr| 3) |il|)))
                            . #42#)
                      (GO #44=#:G573))))))
                 (LETT |npf|
                       (SPADCALL
                        (|LODOF2;factorUP|
                         (SPADCALL (QVELT |np1| 2)
                                   (SPADCALL (|spadConstant| $ 12) 1
                                             (QREFELT $ 58))
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    |i| (QREFELT $ 59))
                                   (QREFELT $ 82))
                         |factorizer| $)
                        (QREFELT $ 66))
                       . #42#)
                 (LETT |r| (|spadConstant| $ 147) . #42#)
                 (LETT |sols| NIL . #42#)
                 (SEQ (LETT |l| NIL . #42#) (LETT #41# |npf| . #42#) G190
                      (COND
                       ((OR (ATOM #41#)
                            (PROGN (LETT |l| (CAR #41#) . #42#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |diff|
                             (SPADCALL
                              (SPADCALL |xx| (QCAR |l|) (QREFELT $ 83))
                              (QREFELT $ 196))
                             . #42#)
                       (EXIT
                        (COND
                         ((SPADCALL |diff| (CONS 1 "failed") (QREFELT $ 197))
                          (SEQ (LETT |fact| (QCAR |l|) . #42#)
                               (LETT |exp| (QCDR |l|) . #42#)
                               (LETT |r|
                                     (SPADCALL |r|
                                               (SPADCALL |fact| |exp|
                                                         (QREFELT $ 69))
                                               (QREFELT $ 87))
                                     . #42#)
                               (EXIT
                                (LETT |sols|
                                      (CONS
                                       (PROG2 (LETT #40# |diff| . #42#)
                                           (QCDR #40#)
                                         (|check_union2| (QEQCAR #40# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  "failed")
                                                         #40#))
                                       |sols|)
                                      . #42#)))))))
                      (LETT #41# (CDR #41#) . #42#) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((SPADCALL (SPADCALL |r| (QREFELT $ 72)) |n| (QREFELT $ 198))
                   (|error| "bug")))
                 (LETT |n| (SPADCALL (ELT $ 199) |sols| (QREFELT $ 202))
                       . #42#)
                 (LETT |r|
                       (SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 58))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  (SPADCALL |n| (QREFELT $ 81)) (QREFELT $ 59))
                                 (QREFELT $ 82))
                       . #42#)
                 (LETT |subs|
                       (PROG2
                           (LETT #23#
                                 (|LODOF2;substitute|
                                  (CONS 0
                                        (SPADCALL |i|
                                                  (SPADCALL |n| (QREFELT $ 81))
                                                  (QREFELT $ 59)))
                                  (CONS 0 |f|) $)
                                 . #42#)
                           (QCDR #23#)
                         (|check_union2| (QEQCAR #23# 0)
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))))
                                         #23#))
                       . #42#)
                 (LETT |np| (|LODOF2;newtonpolygon| |subs| $) . #42#)
                 (SEQ (LETT |ip| NIL . #42#) (LETT #39# |np| . #42#) G190
                      (COND
                       ((OR (ATOM #39#)
                            (PROGN (LETT |ip| (CAR #39#) . #42#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |ip| 1) (|spadConstant| $ 67)
                                    (QREFELT $ 107))
                          (LETT |lns| |ip| . #42#)))))
                      (LETT #39# (CDR #39#) . #42#) (GO G190) G191 (EXIT NIL))
                 (LETT |f2r|
                       (QCDR (|LODOF2;factor_newton2| |subs| |r| |lns| $))
                       . #42#)
                 (EXIT
                  (PROGN
                   (LETT #1#
                         (CONS 0
                               (LIST
                                (VECTOR |f2r| (QVELT |vr| 3)
                                        (SPADCALL
                                         (|LODOF2;convertUPtoUTS|
                                          (SPADCALL |i|
                                                    (SPADCALL |n|
                                                              (QREFELT $ 81))
                                                    (QREFELT $ 59))
                                          $)
                                         (QREFELT $ 28)))))
                         . #42#)
                   (GO #44#))))))))
            (LETT |npf|
                  (SPADCALL
                   (SPADCALL (|LODOF2;factorUP| (QVELT |np1| 2) |factorizer| $)
                             (QREFELT $ 66))
                   1 (QREFELT $ 90))
                  . #42#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |f| (QREFELT $ 41)) 1 (QREFELT $ 203))
               (COND
                ((EQUAL |option| #45="semireg")
                 (SEQ
                  (LETT |il|
                        (SPADCALL
                         (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                   (QREFELT $ 204))
                         (QREFELT $ 205))
                        . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 0
                                (LIST
                                 (VECTOR
                                  (SPADCALL |f| (SPADCALL |il| (QREFELT $ 195))
                                            (QREFELT $ 35))
                                  (SPADCALL (|spadConstant| $ 12) 1
                                            (QREFELT $ 58))
                                  |il|)))
                          . #42#)
                    (GO #44#)))))
                (#43#
                 (PROGN
                  (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                  (GO #44#)))))
              ((EQL (QCDR |npf|) 1)
               (COND
                ((OR (EQUAL |option| "split over k((x))")
                     (EQUAL |option| "all right factors"))
                 (COND
                  ((EQUAL |option| #45#)
                   (SEQ
                    (LETT |il|
                          (SPADCALL
                           (SPADCALL (SPADCALL |f| 0 (QREFELT $ 54)) 0
                                     (QREFELT $ 204))
                           (QREFELT $ 205))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (LIST
                                   (VECTOR
                                    (SPADCALL |f|
                                              (SPADCALL |il| (QREFELT $ 195))
                                              (QREFELT $ 35))
                                    (SPADCALL (|spadConstant| $ 12) 1
                                              (QREFELT $ 58))
                                    |il|)))
                            . #42#)
                      (GO #44#)))))
                  (#43#
                   (PROGN
                    (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                    (GO #44#)))))
                ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1)
                 (COND
                  ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                   (SEQ
                    (LETT |cxs|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                     (SPADCALL (|spadConstant| $ 12)
                                               (-
                                                (SPADCALL |slop|
                                                          (QREFELT $ 55)))
                                               (QREFELT $ 143))
                                     (QREFELT $ 206))
                           (QREFELT $ 205))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_op|
                           (PROG2
                               (LETT #23#
                                     (|LODOF2;substitute| (CONS 1 |cxs|)
                                      (CONS 0 |f|) $)
                                     . #42#)
                               (QCDR #23#)
                             (|check_union2| (QEQCAR #23# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #23#))
                           |factorizer| |option| $)
                          . #42#)
                    (COND
                     ((EQUAL |option| #46="semireg")
                      (SEQ
                       (LETT |vsp|
                             (PROG2 (LETT #22# |v| . #42#)
                                 (QCDR #22#)
                               (|check_union2| (QEQCAR #22# 0)
                                               (|List|
                                                (|Record|
                                                 (|:| |op|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |ram|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))
                                                 (|:| |expart|
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #22#))
                             . #42#)
                       (LETT |sym| (SPADCALL |cxs| (QREFELT $ 208)) . #42#)
                       (LETT |retv| NIL . #42#)
                       (SEQ (LETT |vi| NIL . #42#) (LETT #38# |vsp| . #42#)
                            G190
                            (COND
                             ((OR (ATOM #38#)
                                  (PROGN (LETT |vi| (CAR #38#) . #42#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |xsubsr|
                                   (SPADCALL
                                    (SPADCALL
                                     (|LODOF2;convertUPtoUTS| (QVELT |vi| 1) $)
                                     (QREFELT $ 28))
                                    (- (SPADCALL |slop| (QREFELT $ 55)))
                                    (QREFELT $ 209))
                                   . #42#)
                             (LETT |fullxr|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QVELT |vi| 1) (QREFELT $ 72))
                                     (SPADCALL
                                      (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                      (QREFELT $ 210))
                                     (QREFELT $ 211))
                                    |xsubsr| (QREFELT $ 206))
                                   . #42#)
                             (EXIT
                              (LETT |retv|
                                    (APPEND |retv|
                                            (LIST
                                             (VECTOR (QVELT |vi| 0)
                                                     (QVELT |vi| 1)
                                                     (SPADCALL (QVELT |vi| 2)
                                                               |fullxr|
                                                               (QREFELT $
                                                                        212)))))
                                    . #42#)))
                            (LETT #38# (CDR #38#) . #42#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (PROGN (LETT #1# (CONS 0 |retv|) . #42#) (GO #44#))))))
                    (LETT |vrs|
                          (PROG2 (LETT #12# |v| . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (PROGN
                                   (LETT #37# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #36# |vrs| . #42#) G190
                                        (COND
                                         ((OR (ATOM #36#)
                                              (PROGN
                                               (LETT |i| (CAR #36#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #37#
                                                (CONS
                                                 (|LODOF2;substitute|
                                                  (CONS 1
                                                        (SPADCALL |cxs|
                                                                  (QREFELT $
                                                                           205)))
                                                  |i| $)
                                                 #37#)
                                                . #42#)))
                                        (LETT #36# (CDR #36#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #37#)))))
                            . #42#)
                      (GO #44#)))))
                  ((EQUAL |option| #47="split over k((x))")
                   (SEQ
                    (LETT |ric|
                          (PROG2
                              (LETT #12#
                                    (|LODOF2;factor_riccati| |f| |factorizer|
                                     #48="alg factor" $)
                                    . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (LETT |r1|
                          (PROG2
                              (LETT #10# (SPADCALL |ric| (QREFELT $ 194))
                                    . #42#)
                              (QCDR #10#)
                            (|check_union2| (QEQCAR #10# 1)
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #10#))
                          . #42#)
                    (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                    (COND
                     ((SPADCALL |rk| |f| (QREFELT $ 213))
                      (PROGN
                       (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                       (GO #44#))))
                    (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 214)) . #42#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (APPEND
                                   (PROG2
                                       (LETT #12#
                                             (|LODOF2;factor_riccati| |lk|
                                              |factorizer| |option| $)
                                             . #42#)
                                       (QCDR #12#)
                                     (|check_union2| (QEQCAR #12# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #12#))
                                   (LIST (CONS 0 |rk|))))
                            . #42#)
                      (GO #44#)))))
                  ((EQUAL |option| #49="all right factors")
                   (SEQ
                    (LETT |ric|
                          (PROG2
                              (LETT #12#
                                    (|LODOF2;factor_riccati| |f| |factorizer|
                                     #50="all alg factors" $)
                                    . #42#)
                              (QCDR #12#)
                            (|check_union2| (QEQCAR #12# 1)
                                            (|List|
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|)))))))
                                            (|Union|
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|List|
                                              (|Union|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7)))
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))))))
                                            #12#))
                          . #42#)
                    (LETT |res| NIL . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #35# |ric| . #42#) G190
                         (COND
                          ((OR (ATOM #35#)
                               (PROGN (LETT |i| (CAR #35#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rk|
                                (|LODOF2;make_rightfactor| |f|
                                 (PROG2 (LETT #10# |i| . #42#)
                                     (QCDR #10#)
                                   (|check_union2| (QEQCAR #10# 1)
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|)))))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #10#))
                                 $)
                                . #42#)
                          (EXIT
                           (COND
                            ((SPADCALL |rk| |f| (QREFELT $ 213))
                             (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                            ('T
                             (LETT |res| (APPEND |res| (LIST (CONS 0 |rk|)))
                                   . #42#)))))
                         (LETT #35# (CDR #35#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                  (#43#
                   (COND
                    ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1
                               (QREFELT $ 48))
                     (SEQ
                      (LETT |gr|
                            (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 96))
                                      (QREFELT $ 216))
                            . #42#)
                      (LETT |npgr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |gr| (QREFELT $ 217)) (QREFELT $ 83))
                             (QCDR |npf|) (QREFELT $ 69))
                            . #42#)
                      (LETT |f2r|
                            (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                            . #42#)
                      (LETT |v|
                            (|LODOF2;factor_riccati| |f2r| |factorizer|
                             |option| $)
                            . #42#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0)
                         (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                        (#43#
                         (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                              (LETT |res| NIL . #42#)
                              (SEQ (LETT |i| NIL . #42#)
                                   (LETT #34# |vrs| . #42#) G190
                                   (COND
                                    ((OR (ATOM #34#)
                                         (PROGN
                                          (LETT |i| (CAR #34#) . #42#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((QEQCAR |i| 0)
                                       (SEQ
                                        (LETT |nt|
                                              (VECTOR (QCDR |i|)
                                                      (SPADCALL (QCAR |npf|)
                                                                (QREFELT $ 72))
                                                      |gr|
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58)))
                                              . #42#)
                                        (EXIT
                                         (LETT |res|
                                               (APPEND |res|
                                                       (LIST (CONS 1 |nt|)))
                                               . #42#))))
                                      ('T
                                       (LETT |res| (APPEND |res| (LIST |i|))
                                             . #42#)))))
                                   (LETT #34# (CDR #34#) . #42#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 1 |res|) . #42#)
                                (GO #44#)))))))))
                    (#43#
                     (SEQ
                      (LETT |n|
                            (QVELT
                             (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                       (SPADCALL |slop| (QREFELT $ 53))
                                       (QREFELT $ 179))
                             0)
                            . #42#)
                      (LETT |coefr|
                            (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                      (QREFELT $ 210))
                            . #42#)
                      (LETT |ror|
                            (|LODOF2;ramification_of| |f|
                             (SPADCALL |coefr| |n| (QREFELT $ 218))
                             (SPADCALL |slop| (QREFELT $ 53)) $)
                            . #42#)
                      (LETT |exp|
                            (SPADCALL
                             (SPADCALL
                              (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                              (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                             (QREFELT $ 124))
                            . #42#)
                      (LETT |tosub|
                            (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                      (SPADCALL |coefr| |exp| (QREFELT $ 218))
                                      (QREFELT $ 211))
                            . #42#)
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL |tosub| (QREFELT $ 217))
                              (QREFELT $ 83))
                             (QCDR |npf|) (QREFELT $ 69))
                            . #42#)
                      (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                      (SEQ (LETT |i| NIL . #42#) (LETT #33# |np| . #42#) G190
                           (COND
                            ((OR (ATOM #33#)
                                 (PROGN (LETT |i| (CAR #33#) . #42#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |i| 1)
                                         (SPADCALL
                                          (SPADCALL |slop| (QREFELT $ 55))
                                          (QREFELT $ 102))
                                         (QREFELT $ 107))
                               (LETT |lns| |i| . #42#)))))
                           (LETT #33# (CDR #33#) . #42#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |f2r|
                            (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                            . #42#)
                      (LETT |v|
                            (|LODOF2;factor_riccati| |f2r| |factorizer|
                             |option| $)
                            . #42#)
                      (LETT |r|
                            (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 218))
                                      (SPADCALL |slop| (QREFELT $ 53))
                                      (QREFELT $ 58))
                            . #42#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 0)
                         (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                              (LETT |res|
                                    (PROGN
                                     (LETT #32# NIL . #42#)
                                     (SEQ (LETT |i| NIL . #42#)
                                          (LETT #31# |vsp| . #42#) G190
                                          (COND
                                           ((OR (ATOM #31#)
                                                (PROGN
                                                 (LETT |i| (CAR #31#) . #42#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #32#
                                                  (CONS
                                                   (VECTOR (QVELT |i| 0)
                                                           (SPADCALL |r|
                                                                     (SPADCALL
                                                                      (|spadConstant|
                                                                       $ 12)
                                                                      1
                                                                      (QREFELT
                                                                       $ 58))
                                                                     (QVELT |i|
                                                                            1)
                                                                     (QREFELT $
                                                                              82))
                                                           (QVELT |i| 2))
                                                   #32#)
                                                  . #42#)))
                                          (LETT #31# (CDR #31#) . #42#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #32#))))
                                    . #42#)
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 0 |res|) . #42#)
                                (GO #44#)))))
                        (#43#
                         (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                              (LETT |res| NIL . #42#)
                              (SEQ (LETT |i| NIL . #42#)
                                   (LETT #30# |vrs| . #42#) G190
                                   (COND
                                    ((OR (ATOM #30#)
                                         (PROGN
                                          (LETT |i| (CAR #30#) . #42#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((QEQCAR |i| 0)
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|) 1
                                                    (|spadConstant| $ 19) |r|)
                                            . #42#))
                                     ('T
                                      (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                           (EXIT
                                            (LETT |nt|
                                                  (VECTOR (QVELT |ir| 0)
                                                          (QVELT |ir| 1)
                                                          (QVELT |ir| 2)
                                                          (SPADCALL |r|
                                                                    (SPADCALL
                                                                     (|spadConstant|
                                                                      $ 12)
                                                                     1
                                                                     (QREFELT $
                                                                              58))
                                                                    (QVELT |ir|
                                                                           3)
                                                                    (QREFELT $
                                                                             82)))
                                                  . #42#)))))
                                    (EXIT
                                     (LETT |res|
                                           (APPEND |res| (LIST (CONS 1 |nt|)))
                                           . #42#)))
                                   (LETT #30# (CDR #30#) . #42#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (PROGN
                                (LETT #1# (CONS 1 |res|) . #42#)
                                (GO #44#)))))))))))))
                ((EQUAL |option| #47#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #48# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |r1|
                        (PROG2
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 194)) . #42#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))))
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))
                                          #10#))
                        . #42#)
                  (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                  (COND
                   ((SPADCALL |rk| |f| (QREFELT $ 213))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 214)) . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (APPEND
                                 (PROG2
                                     (LETT #12#
                                           (|LODOF2;factor_riccati| |lk|
                                            |factorizer| |option| $)
                                           . #42#)
                                     (QCDR #12#)
                                   (|check_union2| (QEQCAR #12# 1)
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|)))))))
                                                   (|Union|
                                                    (|List|
                                                     (|Record|
                                                      (|:| |op|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |ram|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))
                                                      (|:| |expart|
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))))
                                                    (|List|
                                                     (|Union|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))
                                                      (|Record|
                                                       (|:| |ope|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))))
                                                       (|:| |dext|
                                                            (|PositiveInteger|))
                                                       (|:| |alpha|
                                                            (|Expression|
                                                             (|Integer|)))
                                                       (|:| |rami|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT $ 6)
                                                             (|Expression|
                                                              (|Integer|))))))))
                                                   #12#))
                                 (LIST (CONS 0 |rk|))))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #49#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #50# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |res| NIL . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #29# |ric| . #42#) G190
                       (COND
                        ((OR (ATOM #29#)
                             (PROGN (LETT |i| (CAR #29#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (|LODOF2;make_rightfactor| |f|
                               (PROG2 (LETT #10# |i| . #42#)
                                   (QCDR #10#)
                                 (|check_union2| (QEQCAR #10# 1)
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #10#))
                               $)
                              . #42#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT $ 213))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res| (APPEND |res| (LIST (CONS 0 |rk|)))
                                 . #42#)))))
                       (LETT #29# (CDR #29#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 96))
                                    (QREFELT $ 216))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 217)) (QREFELT $ 83))
                           (QCDR |npf|) (QREFELT $ 69))
                          . #42#)
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #28# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #28#)
                                       (PROGN
                                        (LETT |i| (CAR #28#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR |i| 0)
                                     (SEQ
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|)
                                                    (SPADCALL (QCAR |npf|)
                                                              (QREFELT $ 72))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (APPEND |res|
                                                     (LIST (CONS 1 |nt|)))
                                             . #42#))))
                                    ('T
                                     (LETT |res| (APPEND |res| (LIST |i|))
                                           . #42#)))))
                                 (LETT #28# (CDR #28#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))
                  (#43#
                   (SEQ
                    (LETT |n|
                          (QVELT
                           (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                     (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 179))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                    (QREFELT $ 210))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 218))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 124))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 218))
                                    (QREFELT $ 211))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 217)) (QREFELT $ 83))
                           (QCDR |npf|) (QREFELT $ 69))
                          . #42#)
                    (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #27# |np| . #42#) G190
                         (COND
                          ((OR (ATOM #27#)
                               (PROGN (LETT |i| (CAR #27#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |i| 1)
                                       (SPADCALL
                                        (SPADCALL |slop| (QREFELT $ 55))
                                        (QREFELT $ 102))
                                       (QREFELT $ 107))
                             (LETT |lns| |i| . #42#)))))
                         (LETT #27# (CDR #27#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (LETT |r|
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 218))
                                    (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 58))
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                            (LETT |res|
                                  (PROGN
                                   (LETT #26# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #25# |vsp| . #42#) G190
                                        (COND
                                         ((OR (ATOM #25#)
                                              (PROGN
                                               (LETT |i| (CAR #25#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #26#
                                                (CONS
                                                 (VECTOR (QVELT |i| 0)
                                                         (SPADCALL |r|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   (QVELT |i|
                                                                          1)
                                                                   (QREFELT $
                                                                            82))
                                                         (QVELT |i| 2))
                                                 #26#)
                                                . #42#)))
                                        (LETT #25# (CDR #25#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #26#))))
                                  . #42#)
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 |res|) . #42#)
                              (GO #44#)))))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #24# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #24#)
                                       (PROGN
                                        (LETT |i| (CAR #24#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((QEQCAR |i| 0)
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|) 1
                                                  (|spadConstant| $ 19) |r|)
                                          . #42#))
                                   ('T
                                    (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                         (EXIT
                                          (LETT |nt|
                                                (VECTOR (QVELT |ir| 0)
                                                        (QVELT |ir| 1)
                                                        (QVELT |ir| 2)
                                                        (SPADCALL |r|
                                                                  (SPADCALL
                                                                   (|spadConstant|
                                                                    $ 12)
                                                                   1
                                                                   (QREFELT $
                                                                            58))
                                                                  (QVELT |ir|
                                                                         3)
                                                                  (QREFELT $
                                                                           82)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (APPEND |res| (LIST (CONS 1 |nt|)))
                                         . #42#)))
                                 (LETT #24# (CDR #24#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))))))
              ((EQL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1)
               (COND
                ((EQL (SPADCALL |slop| (QREFELT $ 53)) 1)
                 (SEQ
                  (LETT |cxs|
                        (SPADCALL
                         (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                   (SPADCALL (|spadConstant| $ 12)
                                             (-
                                              (SPADCALL |slop| (QREFELT $ 55)))
                                             (QREFELT $ 143))
                                   (QREFELT $ 206))
                         (QREFELT $ 205))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_op|
                         (PROG2
                             (LETT #23#
                                   (|LODOF2;substitute| (CONS 1 |cxs|)
                                    (CONS 0 |f|) $)
                                   . #42#)
                             (QCDR #23#)
                           (|check_union2| (QEQCAR #23# 0)
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|))))))
                                           #23#))
                         |factorizer| |option| $)
                        . #42#)
                  (COND
                   ((EQUAL |option| #46#)
                    (SEQ
                     (LETT |vsp|
                           (PROG2 (LETT #22# |v| . #42#)
                               (QCDR #22#)
                             (|check_union2| (QEQCAR #22# 0)
                                             (|List|
                                              (|Record|
                                               (|:| |op|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |ram|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))
                                               (|:| |expart|
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))))
                                             (|Union|
                                              (|List|
                                               (|Record|
                                                (|:| |op|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |ram|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|))))
                                                (|:| |expart|
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))))
                                              (|List|
                                               (|Union|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7)))
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))))
                                             #22#))
                           . #42#)
                     (LETT |sym| (SPADCALL |cxs| (QREFELT $ 208)) . #42#)
                     (LETT |retv| NIL . #42#)
                     (SEQ (LETT |vi| NIL . #42#) (LETT #21# |vsp| . #42#) G190
                          (COND
                           ((OR (ATOM #21#)
                                (PROGN (LETT |vi| (CAR #21#) . #42#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |xsubsr|
                                 (SPADCALL
                                  (SPADCALL
                                   (|LODOF2;convertUPtoUTS| (QVELT |vi| 1) $)
                                   (QREFELT $ 28))
                                  (- (SPADCALL |slop| (QREFELT $ 55)))
                                  (QREFELT $ 209))
                                 . #42#)
                           (LETT |fullxr|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |vi| 1) (QREFELT $ 72))
                                   (SPADCALL
                                    (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                    (QREFELT $ 210))
                                   (QREFELT $ 211))
                                  |xsubsr| (QREFELT $ 206))
                                 . #42#)
                           (EXIT
                            (LETT |retv|
                                  (APPEND |retv|
                                          (LIST
                                           (VECTOR (QVELT |vi| 0)
                                                   (QVELT |vi| 1)
                                                   (SPADCALL (QVELT |vi| 2)
                                                             |fullxr|
                                                             (QREFELT $
                                                                      212)))))
                                  . #42#)))
                          (LETT #21# (CDR #21#) . #42#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (PROGN (LETT #1# (CONS 0 |retv|) . #42#) (GO #44#))))))
                  (LETT |vrs|
                        (PROG2 (LETT #12# |v| . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (PROGN
                                 (LETT #20# NIL . #42#)
                                 (SEQ (LETT |i| NIL . #42#)
                                      (LETT #19# |vrs| . #42#) G190
                                      (COND
                                       ((OR (ATOM #19#)
                                            (PROGN
                                             (LETT |i| (CAR #19#) . #42#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #20#
                                              (CONS
                                               (|LODOF2;substitute|
                                                (CONS 1
                                                      (SPADCALL |cxs|
                                                                (QREFELT $
                                                                         205)))
                                                |i| $)
                                               #20#)
                                              . #42#)))
                                      (LETT #19# (CDR #19#) . #42#) (GO G190)
                                      G191 (EXIT (NREVERSE #20#)))))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #47#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #48# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |r1|
                        (PROG2
                            (LETT #10# (SPADCALL |ric| (QREFELT $ 194)) . #42#)
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 1)
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|)))))
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))
                                          #10#))
                        . #42#)
                  (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                  (COND
                   ((SPADCALL |rk| |f| (QREFELT $ 213))
                    (PROGN
                     (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                     (GO #44#))))
                  (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 214)) . #42#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (CONS 1
                                (APPEND
                                 (PROG2
                                     (LETT #12#
                                           (|LODOF2;factor_riccati| |lk|
                                            |factorizer| |option| $)
                                           . #42#)
                                     (QCDR #12#)
                                   (|check_union2| (QEQCAR #12# 1)
                                                   (|List|
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|)))))))
                                                   (|Union|
                                                    (|List|
                                                     (|Record|
                                                      (|:| |op|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |ram|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))
                                                      (|:| |expart|
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))))
                                                    (|List|
                                                     (|Union|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))
                                                      (|Record|
                                                       (|:| |ope|
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))))
                                                       (|:| |dext|
                                                            (|PositiveInteger|))
                                                       (|:| |alpha|
                                                            (|Expression|
                                                             (|Integer|)))
                                                       (|:| |rami|
                                                            (|UnivariatePolynomial|
                                                             (QREFELT $ 6)
                                                             (|Expression|
                                                              (|Integer|))))))))
                                                   #12#))
                                 (LIST (CONS 0 |rk|))))
                          . #42#)
                    (GO #44#)))))
                ((EQUAL |option| #49#)
                 (SEQ
                  (LETT |ric|
                        (PROG2
                            (LETT #12#
                                  (|LODOF2;factor_riccati| |f| |factorizer|
                                   #50# $)
                                  . #42#)
                            (QCDR #12#)
                          (|check_union2| (QEQCAR #12# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #12#))
                        . #42#)
                  (LETT |res| NIL . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #18# |ric| . #42#) G190
                       (COND
                        ((OR (ATOM #18#)
                             (PROGN (LETT |i| (CAR #18#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (|LODOF2;make_rightfactor| |f|
                               (PROG2 (LETT #10# |i| . #42#)
                                   (QCDR #10#)
                                 (|check_union2| (QEQCAR #10# 1)
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #10#))
                               $)
                              . #42#)
                        (EXIT
                         (COND
                          ((SPADCALL |rk| |f| (QREFELT $ 213))
                           (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                          ('T
                           (LETT |res| (APPEND |res| (LIST (CONS 0 |rk|)))
                                 . #42#)))))
                       (LETT #18# (CDR #18#) . #42#) (GO G190) G191 (EXIT NIL))
                  (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
                (#43#
                 (COND
                  ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1
                             (QREFELT $ 48))
                   (SEQ
                    (LETT |gr|
                          (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 96))
                                    (QREFELT $ 216))
                          . #42#)
                    (LETT |npgr|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |gr| (QREFELT $ 217)) (QREFELT $ 83))
                           (QCDR |npf|) (QREFELT $ 69))
                          . #42#)
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #17# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #17#)
                                       (PROGN
                                        (LETT |i| (CAR #17#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR |i| 0)
                                     (SEQ
                                      (LETT |nt|
                                            (VECTOR (QCDR |i|)
                                                    (SPADCALL (QCAR |npf|)
                                                              (QREFELT $ 72))
                                                    |gr|
                                                    (SPADCALL
                                                     (|spadConstant| $ 12) 1
                                                     (QREFELT $ 58)))
                                            . #42#)
                                      (EXIT
                                       (LETT |res|
                                             (APPEND |res|
                                                     (LIST (CONS 1 |nt|)))
                                             . #42#))))
                                    ('T
                                     (LETT |res| (APPEND |res| (LIST |i|))
                                           . #42#)))))
                                 (LETT #17# (CDR #17#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))
                  (#43#
                   (SEQ
                    (LETT |n|
                          (QVELT
                           (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                     (SPADCALL |slop| (QREFELT $ 53))
                                     (QREFELT $ 179))
                           0)
                          . #42#)
                    (LETT |coefr|
                          (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                    (QREFELT $ 210))
                          . #42#)
                    (LETT |ror|
                          (|LODOF2;ramification_of| |f|
                           (SPADCALL |coefr| |n| (QREFELT $ 218))
                           (SPADCALL |slop| (QREFELT $ 53)) $)
                          . #42#)
                    (LETT |exp|
                          (SPADCALL
                           (SPADCALL
                            (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                            (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                           (QREFELT $ 124))
                          . #42#)
                    (LETT |tosub|
                          (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                    (SPADCALL |coefr| |exp| (QREFELT $ 218))
                                    (QREFELT $ 211))
                          . #42#)
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                            (SPADCALL |tosub| (QREFELT $ 217)) (QREFELT $ 83))
                           (QCDR |npf|) (QREFELT $ 69))
                          . #42#)
                    (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                    (SEQ (LETT |i| NIL . #42#) (LETT #16# |np| . #42#) G190
                         (COND
                          ((OR (ATOM #16#)
                               (PROGN (LETT |i| (CAR #16#) . #42#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |i| 1)
                                       (SPADCALL
                                        (SPADCALL |slop| (QREFELT $ 55))
                                        (QREFELT $ 102))
                                       (QREFELT $ 107))
                             (LETT |lns| |i| . #42#)))))
                         (LETT #16# (CDR #16#) . #42#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |f2r|
                          (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                          . #42#)
                    (LETT |v|
                          (|LODOF2;factor_riccati| |f2r| |factorizer| |option|
                           $)
                          . #42#)
                    (LETT |r|
                          (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 218))
                                    (SPADCALL |slop| (QREFELT $ 53))
                                    (QREFELT $ 58))
                          . #42#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                            (LETT |res|
                                  (PROGN
                                   (LETT #15# NIL . #42#)
                                   (SEQ (LETT |i| NIL . #42#)
                                        (LETT #14# |vsp| . #42#) G190
                                        (COND
                                         ((OR (ATOM #14#)
                                              (PROGN
                                               (LETT |i| (CAR #14#) . #42#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #15#
                                                (CONS
                                                 (VECTOR (QVELT |i| 0)
                                                         (SPADCALL |r|
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 12)
                                                                    1
                                                                    (QREFELT $
                                                                             58))
                                                                   (QVELT |i|
                                                                          1)
                                                                   (QREFELT $
                                                                            82))
                                                         (QVELT |i| 2))
                                                 #15#)
                                                . #42#)))
                                        (LETT #14# (CDR #14#) . #42#) (GO G190)
                                        G191 (EXIT (NREVERSE #15#))))
                                  . #42#)
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 |res|) . #42#)
                              (GO #44#)))))
                      (#43#
                       (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                            (LETT |res| NIL . #42#)
                            (SEQ (LETT |i| NIL . #42#) (LETT #13# |vrs| . #42#)
                                 G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN
                                        (LETT |i| (CAR #13#) . #42#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((QEQCAR |i| 0)
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|) 1
                                                  (|spadConstant| $ 19) |r|)
                                          . #42#))
                                   ('T
                                    (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                         (EXIT
                                          (LETT |nt|
                                                (VECTOR (QVELT |ir| 0)
                                                        (QVELT |ir| 1)
                                                        (QVELT |ir| 2)
                                                        (SPADCALL |r|
                                                                  (SPADCALL
                                                                   (|spadConstant|
                                                                    $ 12)
                                                                   1
                                                                   (QREFELT $
                                                                            58))
                                                                  (QVELT |ir|
                                                                         3)
                                                                  (QREFELT $
                                                                           82)))
                                                . #42#)))))
                                  (EXIT
                                   (LETT |res|
                                         (APPEND |res| (LIST (CONS 1 |nt|)))
                                         . #42#)))
                                 (LETT #13# (CDR #13#) . #42#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 1 |res|) . #42#)
                              (GO #44#)))))))))))))
              ((EQUAL |option| #47#)
               (SEQ
                (LETT |ric|
                      (PROG2
                          (LETT #12#
                                (|LODOF2;factor_riccati| |f| |factorizer| #48#
                                 $)
                                . #42#)
                          (QCDR #12#)
                        (|check_union2| (QEQCAR #12# 1)
                                        (|List|
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression|
                                                  (|Integer|)))))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #12#))
                      . #42#)
                (LETT |r1|
                      (PROG2
                          (LETT #10# (SPADCALL |ric| (QREFELT $ 194)) . #42#)
                          (QCDR #10#)
                        (|check_union2| (QEQCAR #10# 1)
                                        (|Record|
                                         (|:| |ope|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))))
                                         (|:| |dext| (|PositiveInteger|))
                                         (|:| |alpha|
                                              (|Expression| (|Integer|)))
                                         (|:| |rami|
                                              (|UnivariatePolynomial|
                                               (QREFELT $ 6)
                                               (|Expression| (|Integer|)))))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))))
                                        #10#))
                      . #42#)
                (LETT |rk| (|LODOF2;make_rightfactor| |f| |r1| $) . #42#)
                (COND
                 ((SPADCALL |rk| |f| (QREFELT $ 213))
                  (PROGN
                   (LETT #1# (CONS 1 (LIST (CONS 0 |f|))) . #42#)
                   (GO #44#))))
                (LETT |lk| (SPADCALL |f| |rk| (QREFELT $ 214)) . #42#)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (CONS 1
                              (APPEND
                               (PROG2
                                   (LETT #12#
                                         (|LODOF2;factor_riccati| |lk|
                                          |factorizer| |option| $)
                                         . #42#)
                                   (QCDR #12#)
                                 (|check_union2| (QEQCAR #12# 1)
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|)))))))
                                                 (|Union|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |op|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |ram|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))
                                                    (|:| |expart|
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))))
                                                  (|List|
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))))
                                                 #12#))
                               (LIST (CONS 0 |rk|))))
                        . #42#)
                  (GO #44#)))))
              ((EQUAL |option| #49#)
               (SEQ
                (LETT |ric|
                      (PROG2
                          (LETT #12#
                                (|LODOF2;factor_riccati| |f| |factorizer| #50#
                                 $)
                                . #42#)
                          (QCDR #12#)
                        (|check_union2| (QEQCAR #12# 1)
                                        (|List|
                                         (|Union|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          (|Record|
                                           (|:| |ope|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |dext| (|PositiveInteger|))
                                           (|:| |alpha|
                                                (|Expression| (|Integer|)))
                                           (|:| |rami|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression|
                                                  (|Integer|)))))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #12#))
                      . #42#)
                (LETT |res| NIL . #42#)
                (SEQ (LETT |i| NIL . #42#) (LETT #11# |ric| . #42#) G190
                     (COND
                      ((OR (ATOM #11#)
                           (PROGN (LETT |i| (CAR #11#) . #42#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |rk|
                            (|LODOF2;make_rightfactor| |f|
                             (PROG2 (LETT #10# |i| . #42#)
                                 (QCDR #10#)
                               (|check_union2| (QEQCAR #10# 1)
                                               (|Record|
                                                (|:| |ope|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))))
                                                (|:| |dext|
                                                     (|PositiveInteger|))
                                                (|:| |alpha|
                                                     (|Expression|
                                                      (|Integer|)))
                                                (|:| |rami|
                                                     (|UnivariatePolynomial|
                                                      (QREFELT $ 6)
                                                      (|Expression|
                                                       (|Integer|)))))
                                               (|Union|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7)))
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                               #10#))
                             $)
                            . #42#)
                      (EXIT
                       (COND
                        ((SPADCALL |rk| |f| (QREFELT $ 213))
                         (LETT |res| (LIST (CONS 0 |f|)) . #42#))
                        ('T
                         (LETT |res| (APPEND |res| (LIST (CONS 0 |rk|)))
                               . #42#)))))
                     (LETT #11# (CDR #11#) . #42#) (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #1# (CONS 1 |res|) . #42#) (GO #44#)))))
              (#43#
               (COND
                ((SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 72)) 1
                           (QREFELT $ 48))
                 (SEQ
                  (LETT |gr|
                        (SPADCALL (SPADCALL (QCAR |npf|) (QREFELT $ 96))
                                  (QREFELT $ 216))
                        . #42#)
                  (LETT |npgr|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |gr| (QREFELT $ 217)) (QREFELT $ 83))
                         (QCDR |npf|) (QREFELT $ 69))
                        . #42#)
                  (LETT |f2r|
                        (QCDR (|LODOF2;factor_newton2| |f| |npgr| |np1| $))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_riccati| |f2r| |factorizer| |option| $)
                        . #42#)
                  (EXIT
                   (COND
                    ((QEQCAR |v| 0) (PROGN (LETT #1# |v| . #42#) (GO #44#)))
                    (#43#
                     (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                          (LETT |res| NIL . #42#)
                          (SEQ (LETT |i| NIL . #42#) (LETT #9# |vrs| . #42#)
                               G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #42#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((QEQCAR |i| 0)
                                   (SEQ
                                    (LETT |nt|
                                          (VECTOR (QCDR |i|)
                                                  (SPADCALL (QCAR |npf|)
                                                            (QREFELT $ 72))
                                                  |gr|
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58)))
                                          . #42#)
                                    (EXIT
                                     (LETT |res|
                                           (APPEND |res| (LIST (CONS 1 |nt|)))
                                           . #42#))))
                                  ('T
                                   (LETT |res| (APPEND |res| (LIST |i|))
                                         . #42#)))))
                               (LETT #9# (CDR #9#) . #42#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 1 |res|) . #42#)
                            (GO #44#)))))))))
                (#43#
                 (SEQ
                  (LETT |n|
                        (QVELT
                         (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                   (SPADCALL |slop| (QREFELT $ 53))
                                   (QREFELT $ 179))
                         0)
                        . #42#)
                  (LETT |coefr|
                        (SPADCALL (SPADCALL (QCAR |npf|) 0 (QREFELT $ 73))
                                  (QREFELT $ 210))
                        . #42#)
                  (LETT |ror|
                        (|LODOF2;ramification_of| |f|
                         (SPADCALL |coefr| |n| (QREFELT $ 218))
                         (SPADCALL |slop| (QREFELT $ 53)) $)
                        . #42#)
                  (LETT |exp|
                        (SPADCALL
                         (SPADCALL
                          (- 1 (* |n| (SPADCALL |slop| (QREFELT $ 55))))
                          (SPADCALL |slop| (QREFELT $ 53)) (QREFELT $ 51))
                         (QREFELT $ 124))
                        . #42#)
                  (LETT |tosub|
                        (SPADCALL (SPADCALL |slop| (QREFELT $ 53))
                                  (SPADCALL |coefr| |exp| (QREFELT $ 218))
                                  (QREFELT $ 211))
                        . #42#)
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                          (SPADCALL |tosub| (QREFELT $ 217)) (QREFELT $ 83))
                         (QCDR |npf|) (QREFELT $ 69))
                        . #42#)
                  (LETT |np| (|LODOF2;newtonpolygon| |ror| $) . #42#)
                  (SEQ (LETT |i| NIL . #42#) (LETT #8# |np| . #42#) G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |i| (CAR #8#) . #42#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QVELT |i| 1)
                                     (SPADCALL (SPADCALL |slop| (QREFELT $ 55))
                                               (QREFELT $ 102))
                                     (QREFELT $ 107))
                           (LETT |lns| |i| . #42#)))))
                       (LETT #8# (CDR #8#) . #42#) (GO G190) G191 (EXIT NIL))
                  (LETT |f2r|
                        (QCDR (|LODOF2;factor_newton2| |ror| |r| |lns| $))
                        . #42#)
                  (LETT |v|
                        (|LODOF2;factor_riccati| |f2r| |factorizer| |option| $)
                        . #42#)
                  (LETT |r|
                        (SPADCALL (SPADCALL |coefr| |n| (QREFELT $ 218))
                                  (SPADCALL |slop| (QREFELT $ 53))
                                  (QREFELT $ 58))
                        . #42#)
                  (EXIT
                   (COND
                    ((QEQCAR |v| 0)
                     (SEQ (LETT |vsp| (QCDR |v|) . #42#)
                          (LETT |res|
                                (PROGN
                                 (LETT #5# NIL . #42#)
                                 (SEQ (LETT |i| NIL . #42#)
                                      (LETT #4# |vsp| . #42#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |i| (CAR #4#) . #42#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (VECTOR (QVELT |i| 0)
                                                       (SPADCALL |r|
                                                                 (SPADCALL
                                                                  (|spadConstant|
                                                                   $ 12)
                                                                  1
                                                                  (QREFELT $
                                                                           58))
                                                                 (QVELT |i| 1)
                                                                 (QREFELT $
                                                                          82))
                                                       (QVELT |i| 2))
                                               #5#)
                                              . #42#)))
                                      (LETT #4# (CDR #4#) . #42#) (GO G190)
                                      G191 (EXIT (NREVERSE #5#))))
                                . #42#)
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 0 |res|) . #42#)
                            (GO #44#)))))
                    (#43#
                     (SEQ (LETT |vrs| (QCDR |v|) . #42#)
                          (LETT |res| NIL . #42#)
                          (SEQ (LETT |i| NIL . #42#) (LETT #3# |vrs| . #42#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |i| (CAR #3#) . #42#) NIL))
                                 (GO G191)))
                               (SEQ
                                (COND
                                 ((QEQCAR |i| 0)
                                  (LETT |nt|
                                        (VECTOR (QCDR |i|) 1
                                                (|spadConstant| $ 19) |r|)
                                        . #42#))
                                 ('T
                                  (SEQ (LETT |ir| (QCDR |i|) . #42#)
                                       (EXIT
                                        (LETT |nt|
                                              (VECTOR (QVELT |ir| 0)
                                                      (QVELT |ir| 1)
                                                      (QVELT |ir| 2)
                                                      (SPADCALL |r|
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 12)
                                                                 1
                                                                 (QREFELT $
                                                                          58))
                                                                (QVELT |ir| 3)
                                                                (QREFELT $
                                                                         82)))
                                              . #42#)))))
                                (EXIT
                                 (LETT |res|
                                       (APPEND |res| (LIST (CONS 1 |nt|)))
                                       . #42#)))
                               (LETT #3# (CDR #3#) . #42#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 1 |res|) . #42#)
                            (GO #44#)))))))))))))))
          #44# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfr;LodoMSU;32|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_riccati| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;substitute|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Union|
          (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|)
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  |var| |cen|))
          (|Record|
           (|:| |ope|
                (|LinearOrdinaryDifferentialOperator3|
                 (|Expression| (|Integer|))
                 (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |dext| (|PositiveInteger|))
           (|:| |alpha| (|Expression| (|Integer|)))
           (|:| |rami|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G627 NIL)
          (|fr|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|fl|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|new_mon|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |new_mon| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                  . #2=(|LODOF2;substitute|))
            (COND
             ((QEQCAR |a| 0)
              (LETT |new_mon|
                    (SPADCALL |new_mon|
                              (|LODOF2;convertL3toLL|
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 222))
                                         (QREFELT $ 223))
                               $)
                              (QREFELT $ 35))
                    . #2#))
             (#3='T
              (LETT |new_mon|
                    (SPADCALL |new_mon| (SPADCALL (QCDR |a|) (QREFELT $ 195))
                              (QREFELT $ 35))
                    . #2#)))
            (COND ((QEQCAR |f| 0) (LETT |ftmp| (QCDR |f|) . #2#))
                  (#3#
                   (SEQ (LETT |fr| (QCDR |f|) . #2#)
                        (LETT |ftmp| (QVELT |fr| 0) . #2#)
                        (EXIT
                         (LETT |new_mon|
                               (|LODOF2;ramification_of| |new_mon|
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 186))
                                (SPADCALL (QVELT |fr| 3) (QREFELT $ 72)) $)
                               . #2#)))))
            (LETT |res| (|spadConstant| $ 18) . #2#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                      (LETT |res|
                            (SPADCALL |res|
                                      (SPADCALL |lc|
                                                (SPADCALL |new_mon| |dg|
                                                          (QREFELT $ 224))
                                                (QREFELT $ 154))
                                      (QREFELT $ 35))
                            . #2#)
                      (EXIT
                       (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((QEQCAR |f| 0)
               (SEQ (LETT |fl| (QCDR |f|) . #2#)
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |res|) . #2#) (GO #4=#:G626)))))
              (#3#
               (SEQ (LETT |fr| (QCDR |f|) . #2#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (CONS 1
                                  (VECTOR |res| (QVELT |fr| 1) (QVELT |fr| 2)
                                          (QVELT |fr| 3)))
                            . #2#)
                      (GO #4#)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsb;ULodoLodo;34|
        ((|a| |Union| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G177 NIL))
               (PROG2
                   (LETT #1#
                         (|LODOF2;substitute| |a|
                          (CONS 0 (|LODOF2;convertL3toLL| |f| $)) $)
                         |LODOF2;testsb;ULodoLodo;34|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LinearOrdinaryDifferentialOperator3|
                                  (|Expression| (|Integer|))
                                  (|UnivariateTaylorSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7))
                                  (|UnivariateLaurentSeries|
                                   (|Expression| (|Integer|)) (QREFELT $ 6)
                                   (QREFELT $ 7)))
                                 (|Union|
                                  (|LinearOrdinaryDifferentialOperator3|
                                   (|Expression| (|Integer|))
                                   (|UnivariateTaylorSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7))
                                   (|UnivariateLaurentSeries|
                                    (|Expression| (|Integer|)) (QREFELT $ 6)
                                    (QREFELT $ 7)))
                                  (|Record|
                                   (|:| |ope|
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))))
                                   (|:| |dext| (|PositiveInteger|))
                                   (|:| |alpha| (|Expression| (|Integer|)))
                                   (|:| |rami|
                                        (|UnivariatePolynomial| (QREFELT $ 6)
                                                                (|Expression|
                                                                 (|Integer|))))))
                                 #1#)))) 

(SDEFUN |LODOF2;ramification_of|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|ftmp| #1#)
          (|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|extra|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|mlc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#2=#:G640 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |coefr| (|spadConstant| $ 12) (QREFELT $ 227))
              (COND
               ((EQL |n| 1)
                (PROGN
                 (LETT #2# |f| . #3=(|LODOF2;ramification_of|))
                 (GO #4=#:G639))))))
            (LETT |res| (|spadConstant| $ 18) . #3#) (LETT |ftmp| |f| . #3#)
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                   (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #3#)
                      (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #3#)
                      (LETT |mlc|
                            (SPADCALL
                             (CONS #'|LODOF2;ramification_of!0|
                                   (VECTOR $ |coefr|))
                             |lc| (QREFELT $ 229))
                            . #3#)
                      (LETT |mlc| (SPADCALL |mlc| |n| (QREFELT $ 230)) . #3#)
                      (LETT |extra|
                            (SPADCALL (SPADCALL |mlc| |dg| (QREFELT $ 34))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL 1 |n| (QREFELT $ 51)) |dg|
                                         (QREFELT $ 231))
                                        (QREFELT $ 232))
                                       (QREFELT $ 187))
                                      (QREFELT $ 144))
                            . #3#)
                      (LETT |res| (SPADCALL |res| |extra| (QREFELT $ 35))
                            . #3#)
                      (EXIT
                       (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (SPADCALL (EXPT |n| (SPADCALL |f| (QREFELT $ 41))) |res|
                       (QREFELT $ 233)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LODOF2;ramification_of!0| ((|x| NIL) ($$ NIL))
        (PROG (|coefr| $)
          (LETT |coefr| (QREFELT $$ 1) . #1=(|LODOF2;ramification_of|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |coefr| |x| (QREFELT $ 218)))))) 

(SDEFUN |LODOF2;testro;LodoEPiLodo;36|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|coefr| |Expression| (|Integer|)) (|n| |PositiveInteger|)
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;ramification_of| (|LODOF2;convertL3toLL| |f| $) |coefr| |n| $)) 

(SDEFUN |LODOF2;factor_op|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (SPROG
         ((#1=#:G659 NIL)
          (|res|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#2=#:G645 NIL) (#3=#:G661 NIL) (|i| NIL) (#4=#:G644 NIL)
          (#5=#:G660 NIL)
          (|fnr|
           (|List|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fnr| (|LODOF2;factor_newton| |f| |factorizer| |option| $)
                  . #6=(|LODOF2;factor_op|))
            (EXIT
             (COND
              ((EQUAL |option| "semireg")
               (SEQ (LETT |res| NIL . #6#)
                    (SEQ (LETT |i| NIL . #6#) (LETT #5# |fnr| . #6#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |i| (CAR #5#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (APPEND |res|
                                         (PROG2
                                             (LETT #4#
                                                   (|LODOF2;factor_riccati| |i|
                                                    |factorizer| |option| $)
                                                   . #6#)
                                             (QCDR #4#)
                                           (|check_union2| (QEQCAR #4# 0)
                                                           (|List|
                                                            (|Record|
                                                             (|:| |op|
                                                                  (|LinearOrdinaryDifferentialOperator3|
                                                                   (|Expression|
                                                                    (|Integer|))
                                                                   (|UnivariateTaylorSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (QREFELT $
                                                                             6)
                                                                    (QREFELT $
                                                                             7))
                                                                   (|UnivariateLaurentSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (QREFELT $
                                                                             6)
                                                                    (QREFELT $
                                                                             7))))
                                                             (|:| |ram|
                                                                  (|UnivariatePolynomial|
                                                                   (QREFELT $
                                                                            6)
                                                                   (|Expression|
                                                                    (|Integer|))))
                                                             (|:| |expart|
                                                                  (|UnivariateLaurentSeries|
                                                                   (|Expression|
                                                                    (|Integer|))
                                                                   (QREFELT $
                                                                            6)
                                                                   (QREFELT $
                                                                            7)))))
                                                           (|Union|
                                                            (|List|
                                                             (|Record|
                                                              (|:| |op|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |ram|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))
                                                              (|:| |expart|
                                                                   (|UnivariateLaurentSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (QREFELT $
                                                                             6)
                                                                    (QREFELT $
                                                                             7)))))
                                                            (|List|
                                                             (|Union|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7)))
                                                              (|Record|
                                                               (|:| |ope|
                                                                    (|LinearOrdinaryDifferentialOperator3|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (|UnivariateTaylorSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))))
                                                               (|:| |dext|
                                                                    (|PositiveInteger|))
                                                               (|:| |alpha|
                                                                    (|Expression|
                                                                     (|Integer|)))
                                                               (|:| |rami|
                                                                    (|UnivariatePolynomial|
                                                                     (QREFELT $
                                                                              6)
                                                                     (|Expression|
                                                                      (|Integer|))))))))
                                                           #4#)))
                                 . #6#)))
                         (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |res|) . #6#) (GO #7=#:G658)))))
              ('T
               (SEQ (LETT |res| NIL . #6#)
                    (SEQ (LETT |i| NIL . #6#) (LETT #3# |fnr| . #6#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (APPEND |res|
                                         (PROG2
                                             (LETT #2#
                                                   (|LODOF2;factor_riccati| |i|
                                                    |factorizer| |option| $)
                                                   . #6#)
                                             (QCDR #2#)
                                           (|check_union2| (QEQCAR #2# 1)
                                                           (|List|
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|)))))))
                                                           (|Union|
                                                            (|List|
                                                             (|Record|
                                                              (|:| |op|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |ram|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))
                                                              (|:| |expart|
                                                                   (|UnivariateLaurentSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (QREFELT $
                                                                             6)
                                                                    (QREFELT $
                                                                             7)))))
                                                            (|List|
                                                             (|Union|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7)))
                                                              (|Record|
                                                               (|:| |ope|
                                                                    (|LinearOrdinaryDifferentialOperator3|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (|UnivariateTaylorSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))
                                                                     (|UnivariateLaurentSeries|
                                                                      (|Expression|
                                                                       (|Integer|))
                                                                      (QREFELT
                                                                       $ 6)
                                                                      (QREFELT
                                                                       $ 7))))
                                                               (|:| |dext|
                                                                    (|PositiveInteger|))
                                                               (|:| |alpha|
                                                                    (|Expression|
                                                                     (|Integer|)))
                                                               (|:| |rami|
                                                                    (|UnivariatePolynomial|
                                                                     (QREFELT $
                                                                              6)
                                                                     (|Expression|
                                                                      (|Integer|))))))))
                                                           #2#)))
                                 . #6#)))
                         (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 1 |res|) . #6#) (GO #7#)))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfo;LodoMSU;38|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |Union|
          (|List|
           (|Record|
            (|:| |op|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |ram|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
            (|:| |expart|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))
          (|List|
           (|Union|
            (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|)
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    |var| |cen|))
            (|Record|
             (|:| |ope|
                  (|LinearOrdinaryDifferentialOperator3|
                   (|Expression| (|Integer|))
                   (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |dext| (|PositiveInteger|))
             (|:| |alpha| (|Expression| (|Integer|)))
             (|:| |rami|
                  (|UnivariatePolynomial| |var|
                                          (|Expression| (|Integer|)))))))))
        (|LODOF2;factor_op| (|LODOF2;convertL3toLL| |f| $) |factorizer|
         |option| $)) 

(SDEFUN |LODOF2;make_rightfactor|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG ((#1=#:G671 NIL) (|d| (|PositiveInteger|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |d| (SPADCALL (QVELT |ric| 3) (QREFELT $ 72))
                        . #2=(|LODOF2;make_rightfactor|))
                  (LETT |d| (* |d| (QVELT |ric| 1)) . #2#)
                  (COND
                   ((EQL |d| (SPADCALL |f| (QREFELT $ 41)))
                    (PROGN (LETT #1# |f| . #2#) (GO #3=#:G670))))
                  (EXIT (|LODOF2;lift_rightfactor| |d| |ric| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;lift_rightfactor|
        ((|order| |PositiveInteger|)
         (|ric| |Record|
          (|:| |ope|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dext| (|PositiveInteger|))
          (|:| |alpha| (|Expression| (|Integer|)))
          (|:| |rami|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|res|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G757 NIL) (|i| NIL)
          (|num|
           #2=(|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                         |cen|))
          (#3=#:G756 NIL)
          (|coefs|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#4=#:G755 NIL) (#5=#:G754 NIL) (|den| #2#) (#6=#:G753 NIL) (|k| NIL)
          (#7=#:G752 NIL) (|j| NIL) (#8=#:G751 NIL)
          (|nums|
           (|List|
            (|SquareMatrix| |order|
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|))))
          (#9=#:G750 NIL) (#10=#:G749 NIL)
          (|denm|
           (|SquareMatrix| |order|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
          (#11=#:G748 NIL) (#12=#:G747 NIL)
          (|ll|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#13=#:G746 NIL) (#14=#:G745 NIL) (#15=#:G744 NIL) (#16=#:G743 NIL)
          (|nsr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#17=#:G742 NIL)
          (|ser|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#18=#:G741 NIL) (#19=#:G740 NIL)
          (|pa| (|Vector| (|Expression| (|Integer|)))) (#20=#:G739 NIL)
          (#21=#:G738 NIL)
          (|system|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#22=#:G737 NIL) (#23=#:G736 NIL)
          (|cst|
           (|Stream|
            (|Record| (|:| |k| (|Integer|))
                      (|:| |c| (|Expression| (|Integer|))))))
          (#24=#:G735 NIL) (#25=#:G734 NIL)
          (|nn| (|Stream| (|NonNegativeInteger|)))
          (|sysram|
           (|List|
            (|Vector|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#26=#:G733 NIL) (#27=#:G732 NIL) (|mindg| (|Integer|))
          (|rp|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (#28=#:G731 NIL)
          (|s|
           (|Vector|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|r|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ram| (|NonNegativeInteger|)) (|cric| (|Expression| (|Integer|))))
         (SEQ
          (LETT |cric| (SPADCALL (QVELT |ric| 3) (QREFELT $ 186))
                . #29=(|LODOF2;lift_rightfactor|))
          (LETT |ram| (SPADCALL (QVELT |ric| 3) (QREFELT $ 72)) . #29#)
          (LETT |r|
                (SPADCALL (SPADCALL (QVELT |ric| 0) 0 (QREFELT $ 54))
                          (QREFELT $ 205))
                . #29#)
          (LETT |rp| (|spadConstant| $ 14) . #29#)
          (LETT |s| (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20)) . #29#)
          (SPADCALL |s| 1 (|spadConstant| $ 14) (QREFELT $ 237))
          (LETT |mindg| 0 . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #28# |order| . #29#) G190
               (COND ((|greater_SI| |i| #28#) (GO G191)))
               (SEQ
                (LETT |rp|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 238))
                                  (|spadConstant| $ 20) |rp| (QREFELT $ 239))
                        (SPADCALL |r| |rp| (QREFELT $ 240)) (QREFELT $ 212))
                       (SPADCALL |ram| (QREFELT $ 75)) (QREFELT $ 241))
                      . #29#)
                (SPADCALL |s| (+ |i| 1) |rp| (QREFELT $ 237))
                (EXIT
                 (LETT |mindg| (MIN |mindg| (SPADCALL |rp| 0 (QREFELT $ 42)))
                       . #29#)))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (CONS #'|LODOF2;lift_rightfactor!0| (VECTOR |mindg| $)) |s|
                    (QREFELT $ 244))
          (LETT |sysram|
                (PROGN
                 (LETT #27# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #26# |ram| . #29#) G190
                      (COND ((|greater_SI| |i| #26#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #27#
                              (CONS
                               (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20))
                               #27#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #27#))))
                . #29#)
          (LETT |nn|
                (SPADCALL (CONS #'|LODOF2;lift_rightfactor!1| $) 0
                          (QREFELT $ 248))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #25# |ram| . #29#) G190
               (COND ((|greater_SI| |i| #25#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #24# (+ |order| 1) . #29#) G190
                      (COND ((|greater_SI| |j| #24#) (GO G191)))
                      (SEQ
                       (LETT |ser| (SPADCALL |s| |j| (QREFELT $ 249)) . #29#)
                       (LETT |cst|
                             (SPADCALL
                              (CONS #'|LODOF2;lift_rightfactor!2|
                                    (VECTOR |cric| |ser| |ram| $ |i|))
                              |nn| (QREFELT $ 254))
                             . #29#)
                       (EXIT
                        (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 256)) |j|
                                  (SPADCALL |cst| (QREFELT $ 118))
                                  (QREFELT $ 237))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |system|
                (PROGN
                 (LETT #23# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #22# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #22#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #23#
                              (CONS
                               (MAKEARR1 (+ |order| 1) (|spadConstant| $ 20))
                               #23#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #23#))))
                . #29#)
          (LETT |pa|
                (PROGN
                 (LETT #21# (GETREFV #30=(QVELT |ric| 1)) . #29#)
                 (SEQ (LETT |i| 0 . #29#) (LETT #20# (- #30# 1) . #29#) G190
                      (COND ((|greater_SI| |i| #20#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #21# |i|
                                (SPADCALL (QVELT |ric| 2) |i|
                                          (QREFELT $ 218)))))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT NIL))
                 #21#)
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #19# |ram| . #29#) G190
               (COND ((|greater_SI| |i| #19#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #18# (+ |order| 1) . #29#) G190
                      (COND ((|greater_SI| |j| #18#) (GO G191)))
                      (SEQ
                       (LETT |ser|
                             (SPADCALL (SPADCALL |sysram| |i| (QREFELT $ 256))
                                       |j| (QREFELT $ 249))
                             . #29#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #29#)
                             (LETT #17# (QVELT |ric| 1) . #29#) G190
                             (COND ((|greater_SI| |k| #17#) (GO G191)))
                             (SEQ
                              (LETT |nsr|
                                    (SPADCALL
                                     (CONS #'|LODOF2;lift_rightfactor!3|
                                           (VECTOR |k| $ |pa|))
                                     |ser| (QREFELT $ 265))
                                    . #29#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL |system|
                                          (+ (* (- |i| 1) (QVELT |ric| 1)) |k|)
                                          (QREFELT $ 256))
                                |j| |nsr| (QREFELT $ 237))))
                             (LETT |k| (|inc_SI| |k|) . #29#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |ll|
                (PROGN
                 (LETT #16# NIL . #29#)
                 (SEQ (LETT |j| 1 . #29#) (LETT #15# |order| . #29#) G190
                      (COND ((|greater_SI| |j| #15#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS
                               (PROGN
                                (LETT #14# NIL . #29#)
                                (SEQ (LETT |i| 1 . #29#)
                                     (LETT #13# |order| . #29#) G190
                                     (COND ((|greater_SI| |i| #13#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #14#
                                             (CONS (|spadConstant| $ 20) #14#)
                                             . #29#)))
                                     (LETT |i| (|inc_SI| |i|) . #29#) (GO G190)
                                     G191 (EXIT (NREVERSE #14#))))
                               #16#)
                              . #29#)))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #12# |order| . #29#) G190
               (COND ((|greater_SI| |i| #12#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #29#) (LETT #11# |order| . #29#) G190
                      (COND ((|greater_SI| |j| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (SPADCALL |ll| |i| (QREFELT $ 267)) |j|
                                  (SPADCALL
                                   (SPADCALL |system| |i| (QREFELT $ 256)) |j|
                                   (QREFELT $ 249))
                                  (QREFELT $ 268))))
                      (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |denm|
                (SPADCALL (SPADCALL |ll| (QREFELT $ 270))
                          (|compiledLookupCheck| '|squareMatrix|
                                                 (LIST '$
                                                       (LIST '|Matrix|
                                                             (LIST
                                                              '|UnivariateLaurentSeries|
                                                              (LIST
                                                               '|Expression|
                                                               (LIST
                                                                '|Integer|))
                                                              (|devaluate|
                                                               (ELT $ 6))
                                                              (|devaluate|
                                                               (ELT $ 7)))))
                                                 (|SquareMatrix| |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT $ 6)
                                                                  (ELT $ 7)))))
                . #29#)
          (LETT |nums|
                (PROGN
                 (LETT #10# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #9# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #9#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL
                                (|compiledLookupCheck| '|empty| (LIST '$)
                                                       (|SquareMatrix| |order|
                                                                       (|UnivariateLaurentSeries|
                                                                        (|Expression|
                                                                         (|Integer|))
                                                                        (ELT $
                                                                             6)
                                                                        (ELT $
                                                                             7)))))
                               #10#)
                              . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #8# |order| . #29#) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #29#) (LETT #7# |order| . #29#) G190
                     (COND ((|greater_SI| |j| #7#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1 . #29#) (LETT #6# |order| . #29#) G190
                            (COND ((|greater_SI| |k| #6#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |k| |i|)
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 267))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 256))
                                           (+ |order| 1) (QREFELT $ 249))
                                          (QREFELT $ 268)))
                               ('T
                                (SPADCALL (SPADCALL |ll| |j| (QREFELT $ 267))
                                          |k|
                                          (SPADCALL
                                           (SPADCALL |system| |j|
                                                     (QREFELT $ 256))
                                           |k| (QREFELT $ 249))
                                          (QREFELT $ 268))))))
                            (LETT |k| (|inc_SI| |k|) . #29#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |j| (|inc_SI| |j|) . #29#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |nums| |i|
                           (SPADCALL (SPADCALL |ll| (QREFELT $ 270))
                                     (|compiledLookupCheck| '|squareMatrix|
                                                            (LIST '$
                                                                  (LIST
                                                                   '|Matrix|
                                                                   (LIST
                                                                    '|UnivariateLaurentSeries|
                                                                    (LIST
                                                                     '|Expression|
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|devaluate|
                                                                     (ELT $ 6))
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7)))))
                                                            (|SquareMatrix|
                                                             |order|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (ELT $ 6)
                                                              (ELT $ 7)))))
                           (|compiledLookupCheck| '|setelt!|
                                                  (LIST
                                                   (LIST '|SquareMatrix|
                                                         |order|
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (LIST '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          (|devaluate|
                                                           (ELT $ 7))))
                                                   '$ (LIST '|Integer|)
                                                   (LIST '|SquareMatrix|
                                                         |order|
                                                         (LIST
                                                          '|UnivariateLaurentSeries|
                                                          (LIST '|Expression|
                                                                (LIST
                                                                 '|Integer|))
                                                          (|devaluate|
                                                           (ELT $ 6))
                                                          (|devaluate|
                                                           (ELT $ 7)))))
                                                  (|List|
                                                   (|SquareMatrix| |order|
                                                                   (|UnivariateLaurentSeries|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (ELT $ 6)
                                                                    (ELT $
                                                                         7))))))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |den|
                (SPADCALL |denm|
                          (|compiledLookupCheck| '|minordet|
                                                 (LIST
                                                  (LIST
                                                   '|UnivariateLaurentSeries|
                                                   (LIST '|Expression|
                                                         (LIST '|Integer|))
                                                   (|devaluate| (ELT $ 6))
                                                   (|devaluate| (ELT $ 7)))
                                                  '$)
                                                 (|SquareMatrix| |order|
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (ELT $ 6)
                                                                  (ELT $ 7)))))
                . #29#)
          (LETT |coefs|
                (PROGN
                 (LETT #5# NIL . #29#)
                 (SEQ (LETT |i| 1 . #29#) (LETT #4# |order| . #29#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (|spadConstant| $ 20) #5#) . #29#)))
                      (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #29#)
          (SEQ (LETT |i| 1 . #29#) (LETT #3# |order| . #29#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (LETT |num|
                      (SPADCALL
                       (SPADCALL |nums| |i|
                                 (|compiledLookupCheck| '|elt|
                                                        (LIST
                                                         (LIST '|SquareMatrix|
                                                               |order|
                                                               (LIST
                                                                '|UnivariateLaurentSeries|
                                                                (LIST
                                                                 '|Expression|
                                                                 (LIST
                                                                  '|Integer|))
                                                                (|devaluate|
                                                                 (ELT $ 6))
                                                                (|devaluate|
                                                                 (ELT $ 7))))
                                                         '$ (LIST '|Integer|))
                                                        (|List|
                                                         (|SquareMatrix|
                                                          |order|
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (ELT $ 6)
                                                           (ELT $ 7))))))
                       (|compiledLookupCheck| '|minordet|
                                              (LIST
                                               (LIST '|UnivariateLaurentSeries|
                                                     (LIST '|Expression|
                                                           (LIST '|Integer|))
                                                     (|devaluate| (ELT $ 6))
                                                     (|devaluate| (ELT $ 7)))
                                               '$)
                                              (|SquareMatrix| |order|
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (ELT $ 6)
                                                               (ELT $ 7)))))
                      . #29#)
                (EXIT
                 (SPADCALL |coefs| |i|
                           (SPADCALL (SPADCALL |num| |den| (QREFELT $ 242))
                                     (QREFELT $ 205))
                           (QREFELT $ 268))))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (SPADCALL (|spadConstant| $ 14) |order| (QREFELT $ 34))
                . #29#)
          (SEQ (LETT |i| 0 . #29#) (LETT #1# (- |order| 1) . #29#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL |coefs| (+ |i| 1) (QREFELT $ 111))
                                  |i| (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #29#)))
               (LETT |i| (|inc_SI| |i|) . #29#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;lift_rightfactor!3| ((|x| NIL) ($$ NIL))
        (PROG (|pa| $ |k|)
          (LETT |pa| (QREFELT $$ 2) . #1=(|LODOF2;lift_rightfactor|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G691 NIL) (|psq| NIL))
                   (SEQ (LETT |psq| (SPADCALL |pa| |x| (QREFELT $ 260)) NIL)
                        (EXIT
                         (COND
                          ((SPADCALL |psq| (CONS 1 "failed") (QREFELT $ 261))
                           |x|)
                          ('T
                           (SPADCALL
                            (SPADCALL
                             (PROG2 (LETT #2# |psq| NIL)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Vector|
                                                (|Fraction| (|Integer|)))
                                               (|Union|
                                                (|Vector|
                                                 (|Fraction| (|Integer|)))
                                                "failed")
                                               #2#))
                             |k| (QREFELT $ 263))
                            (QREFELT $ 232))))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!2| ((|x| NIL) ($$ NIL))
        (PROG (|i| $ |ram| |ser| |cric|)
          (LETT |i| (QREFELT $$ 4) . #1=(|LODOF2;lift_rightfactor|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |ram| (QREFELT $$ 2) . #1#)
          (LETT |ser| (QREFELT $$ 1) . #1#)
          (LETT |cric| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|dg| NIL))
                   (SEQ
                    (LETT |dg|
                          (SPADCALL
                           (SPADCALL |i| (|spadConstant| $ 169)
                                     (QREFELT $ 133))
                           (SPADCALL |x| |ram| (QREFELT $ 250))
                           (QREFELT $ 129))
                          NIL)
                    (EXIT
                     (CONS |x|
                           (SPADCALL (SPADCALL |ser| |dg| (QREFELT $ 57))
                                     (SPADCALL |cric| |x| (QREFELT $ 251))
                                     (QREFELT $ 76)))))))))) 

(SDEFUN |LODOF2;lift_rightfactor!1| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 169) (QREFELT $ 245))) 

(SDEFUN |LODOF2;lift_rightfactor!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |mindg|)
          (LETT $ (QREFELT $$ 1) . #1=(|LODOF2;lift_rightfactor|))
          (LETT |mindg| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL (|spadConstant| $ 12) |mindg| (QREFELT $ 143))
                      (QREFELT $ 242)))))) 

(SDEFUN |LODOF2;same_charclass?|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G793 NIL) (#2=#:G796 NIL) (|i| NIL)
          (|fff|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (|ffnp|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|ff|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G177 NIL)
          (|gr| (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|rr|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|gg|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G178 NIL) (#5=#:G781 NIL)
          (|r|
           (|List|
            (|List|
             (|Record|
              (|:| |point|
                   (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
              (|:| |slope| (|Fraction| (|Integer|)))
              (|:| |npoly|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G795 NIL) (|j| NIL) (#7=#:G794 NIL)
          (|cx| (|Expression| (|Integer|))) (|fd| (|Expression| (|Integer|)))
          (|dm1| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|c2| #8=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
          (|c| #8#)
          (|r21|
           #9=(|Record|
               (|:| |point|
                    (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
               (|:| |slope| (|Fraction| (|Integer|)))
               (|:| |npoly|
                    (|UnivariatePolynomial| |var|
                                            (|Expression| (|Integer|))))))
          (|r11| #9#)
          (|il|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 41))
                        (SPADCALL |g| (QREFELT $ 41)) (QREFELT $ 198))
              (PROGN
               (LETT #1# NIL . #10=(|LODOF2;same_charclass?|))
               (GO #11=#:G792))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 271))
              (LETT |f|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 242))
                     |f| (QREFELT $ 154))
                    . #10#)))
            (COND
             ((SPADCALL (SPADCALL |g| (QREFELT $ 37)) (|spadConstant| $ 14)
                        (QREFELT $ 271))
              (LETT |g|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 14)
                               (SPADCALL |g| (QREFELT $ 37)) (QREFELT $ 242))
                     |g| (QREFELT $ 154))
                    . #10#)))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 41)) 1)
              (SEQ
               (LETT |il|
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| |g| (QREFELT $ 162)) 0
                                (QREFELT $ 54))
                      0 (QREFELT $ 204))
                     . #10#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (COND
                        ((EQL (SPADCALL |il| 0 (QREFELT $ 42)) 0)
                         (SPADCALL (SPADCALL |il| 0 (QREFELT $ 57))
                                   (QREFELT $ 78)))
                        ('T NIL))
                       . #10#)
                 (GO #11#))))))
            (LETT |r|
                  (SPADCALL (CONS (|function| |LODOF2;newtonpolygon|) $)
                            (LIST |f| |g|) (QREFELT $ 279))
                  . #10#)
            (LETT |r11|
                  (SPADCALL (SPADCALL |r| 1 (QREFELT $ 280)) 1 (QREFELT $ 190))
                  . #10#)
            (LETT |r21|
                  (SPADCALL (SPADCALL |r| 2 (QREFELT $ 280)) 1 (QREFELT $ 190))
                  . #10#)
            (COND
             ((SPADCALL (QVELT |r11| 1) (|spadConstant| $ 67) (QREFELT $ 107))
              (SEQ (LETT |c| (QVELT |r11| 2) . #10#)
                   (LETT |c2| (QVELT |r21| 2) . #10#)
                   (LETT |d| (SPADCALL |c| (QREFELT $ 72)) . #10#)
                   (LETT |dm1| (- |d| 1) . #10#)
                   (LETT |fd| (SPADCALL |d| (QREFELT $ 75)) . #10#)
                   (LETT |cx|
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| |dm1| (QREFELT $ 73))
                                    (SPADCALL |c2| |dm1| (QREFELT $ 73))
                                    (QREFELT $ 74))
                          |fd| (QREFELT $ 76))
                         . #10#)
                   (COND
                    ((NULL (SPADCALL |cx| (QREFELT $ 78)))
                     (PROGN (LETT #1# NIL . #10#) (GO #11#))))
                   (EXIT
                    (LETT |r|
                          (LIST
                           (CONS
                            (VECTOR (QVELT |r11| 0) (QVELT |r11| 1)
                                    (SPADCALL (QVELT |r11| 2)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                               (SPADCALL |cx| (QREFELT $ 217))
                                               (QREFELT $ 83))
                                              (QREFELT $ 82)))
                            (PROGN
                             (LETT #7# NIL . #10#)
                             (SEQ (LETT |j| 2 . #10#)
                                  (LETT #6#
                                        (LENGTH
                                         (SPADCALL |r| 1 (QREFELT $ 280)))
                                        . #10#)
                                  G190
                                  (COND ((|greater_SI| |j| #6#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |r| 1 (QREFELT $ 280))
                                            |j| (QREFELT $ 190))
                                           #7#)
                                          . #10#)))
                                  (LETT |j| (|inc_SI| |j|) . #10#) (GO G190)
                                  G191 (EXIT (NREVERSE #7#)))))
                           (SPADCALL |r| 2 (QREFELT $ 280)))
                          . #10#)))))
            (COND
             ((SPADCALL (SPADCALL |r| 1 (QREFELT $ 280))
                        (SPADCALL |r| 2 (QREFELT $ 280)) (QREFELT $ 281))
              (PROGN (LETT #1# NIL . #10#) (GO #11#))))
            (LETT |gg|
                  (PROG2
                      (LETT #4#
                            (SPADCALL
                             (PROG2
                                 (LETT #5#
                                       (|LODOF2;factor_op| |g| |factorizer|
                                        "alg factor" $)
                                       . #10#)
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 1)
                                               (|List|
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|)))))))
                                               (|Union|
                                                (|List|
                                                 (|Record|
                                                  (|:| |op|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |ram|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))
                                                  (|:| |expart|
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)))))
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))))
                                               #5#))
                             (QREFELT $ 194))
                            . #10#)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 1)
                                    (|Record|
                                     (|:| |ope|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |dext| (|PositiveInteger|))
                                     (|:| |alpha| (|Expression| (|Integer|)))
                                     (|:| |rami|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|)))))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #4#))
                  . #10#)
            (LETT |rr|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |gg| 0) 0 (QREFELT $ 54)) 0
                             (QREFELT $ 204))
                   (QREFELT $ 205))
                  . #10#)
            (LETT |gr| (QVELT |gg| 3) . #10#)
            (LETT |ff|
                  (PROG2
                      (LETT #3#
                            (|LODOF2;substitute| (CONS 1 |rr|)
                             (CONS 0
                                   (|LODOF2;ramification_of| |f|
                                    (SPADCALL |gr| (QREFELT $ 186))
                                    (SPADCALL |gr| (QREFELT $ 72)) $))
                             $)
                            . #10#)
                      (QCDR #3#)
                    (|check_union2| (QEQCAR #3# 0)
                                    (|LinearOrdinaryDifferentialOperator3|
                                     (|Expression| (|Integer|))
                                     (|UnivariateTaylorSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7))
                                     (|UnivariateLaurentSeries|
                                      (|Expression| (|Integer|)) (QREFELT $ 6)
                                      (QREFELT $ 7)))
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                    #3#))
                  . #10#)
            (LETT |ffnp| (|LODOF2;newtonpolygon| |ff| $) . #10#)
            (COND
             ((SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 190)) 1)
                        (|spadConstant| $ 67) (QREFELT $ 68))
              (PROGN (LETT #1# NIL . #10#) (GO #11#))))
            (LETT |fff|
                  (SPADCALL
                   (|LODOF2;factorUP|
                    (SPADCALL (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 190)) 2)
                              (SPADCALL
                               (QVELT (SPADCALL |ffnp| 1 (QREFELT $ 190)) 2)
                               (QREFELT $ 186))
                              (QREFELT $ 282))
                    |factorizer| $)
                   (QREFELT $ 66))
                  . #10#)
            (SEQ (LETT |i| NIL . #10#) (LETT #2# |fff| . #10#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (SPADCALL (QCAR |i|) (QREFELT $ 72)) 1)
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL (QCAR |i|) 0 (QREFELT $ 73))
                                  (SPADCALL (QCAR |i|) 1 (QREFELT $ 73))
                                  (QREFELT $ 76))
                        (QREFELT $ 78))
                       (PROGN (LETT #1# 'T . #10#) (GO #11#))))))))
                 (LETT #2# (CDR #2#) . #10#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #11# (EXIT #1#)))) 

(SDEFUN |LODOF2;testsc;2LodoMB;42|
        ((|f| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|g| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |Boolean|))
        (|LODOF2;same_charclass?| (|LODOF2;convertL3toLL| |f| $)
         (|LODOF2;convertL3toLL| |g| $) |factorizer| $)) 

(SDEFUN |LODOF2;try_factorization|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|max_order| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) #1="infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|min_order| |Integer|) (|option| |String|)
         ($ |Union|
          (|List|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          "failed"))
        (SPROG
         ((#2=#:G844 NIL)
          (|re|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|srl|
           #3=(|LinearOrdinaryDifferentialOperator1|
               (|Fraction|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#4=#:G819 NIL) (|ftmp| #3#)
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|sr|
           #6=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariatePolynomial|
                                                      |var|
                                                      (|Expression|
                                                       (|Integer|)))
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       |var|
                                                       (|Expression|
                                                        (|Integer|))))))
          (#7=#:G816 NIL) (#8=#:G815 #6#) (#9=#:G817 #6#) (#10=#:G856 NIL)
          (|j| NIL)
          (|flm|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#11=#:G810 NIL)
          (|tf2|
           (|Union|
            (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            #12="failed"))
          (|n| (|Integer|))
          (|flst|
           (|List|
            (|List|
             (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                       |cen|))))
          (#13=#:G855 NIL) (|fc| NIL) (#14=#:G854 NIL) (#15=#:G853 NIL)
          (|ff| NIL) (#16=#:G852 NIL)
          (|fls|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#17=#:G851 NIL) (#18=#:G850 NIL) (#19=#:G849 NIL) (#20=#:G848 NIL)
          (#21=#:G847 NIL) (#22=#:G846 NIL) (#23=#:G845 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (MAX (SPADCALL |r| (QREFELT $ 41)) |min_order|)
                   . #24=(|LODOF2;try_factorization|))
             (LETT #23# |max_order| . #24#) G190
             (COND ((> |i| #23#) (GO G191)))
             (SEQ (LETT |fls| (|LODOF2;flist| |r| |i| $) . #24#)
                  (LETT |n| 0 . #24#)
                  (SEQ (LETT |ff| NIL . #24#) (LETT #22# |fls| . #24#) G190
                       (COND
                        ((OR (ATOM #22#)
                             (PROGN (LETT |ff| (CAR #22#) . #24#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |fc| NIL . #24#) (LETT #21# |ff| . #24#)
                              G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |fc| (CAR #21#) . #24#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |n|
                                      (MIN |n|
                                           (SPADCALL |fc| 0 (QREFELT $ 42)))
                                      . #24#)))
                              (LETT #21# (CDR #21#) . #24#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #22# (CDR #22#) . #24#) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((< |n| 0)
                    (LETT |fls|
                          (PROGN
                           (LETT #20# NIL . #24#)
                           (SEQ (LETT |ff| NIL . #24#) (LETT #19# |fls| . #24#)
                                G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN
                                       (LETT |ff| (CAR #19#) . #24#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #20#
                                        (CONS
                                         (PROGN
                                          (LETT #18# NIL . #24#)
                                          (SEQ (LETT |fc| NIL . #24#)
                                               (LETT #17# |ff| . #24#) G190
                                               (COND
                                                ((OR (ATOM #17#)
                                                     (PROGN
                                                      (LETT |fc| (CAR #17#)
                                                            . #24#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #18#
                                                       (CONS
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (|spadConstant| $ 12)
                                                          (- |n|)
                                                          (QREFELT $ 143))
                                                         |fc| (QREFELT $ 240))
                                                        #18#)
                                                       . #24#)))
                                               (LETT #17# (CDR #17#) . #24#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #18#))))
                                         #20#)
                                        . #24#)))
                                (LETT #19# (CDR #19#) . #24#) (GO G190) G191
                                (EXIT (NREVERSE #20#))))
                          . #24#)))
                  (LETT |flst|
                        (PROGN
                         (LETT #16# NIL . #24#)
                         (SEQ (LETT |ff| NIL . #24#) (LETT #15# |fls| . #24#)
                              G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |ff| (CAR #15#) . #24#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16#
                                      (CONS
                                       (PROGN
                                        (LETT #14# NIL . #24#)
                                        (SEQ (LETT |fc| NIL . #24#)
                                             (LETT #13# |ff| . #24#) G190
                                             (COND
                                              ((OR (ATOM #13#)
                                                   (PROGN
                                                    (LETT |fc| (CAR #13#)
                                                          . #24#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #14#
                                                     (CONS
                                                      (SPADCALL |fc|
                                                                (QREFELT $
                                                                         284))
                                                      #14#)
                                                     . #24#)))
                                             (LETT #13# (CDR #13#) . #24#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #14#))))
                                       #16#)
                                      . #24#)))
                              (LETT #15# (CDR #15#) . #24#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #24#)
                  (LETT |n| (LENGTH |flst|) . #24#)
                  (LETT |tf2|
                        (|LODOF2;try_factorization2| |flst| |n| |bound| |eb| $)
                        . #24#)
                  (EXIT
                   (COND
                    ((SPADCALL |tf2| (CONS 1 "failed") (QREFELT $ 286))
                     (SEQ
                      (LETT |flm|
                            (PROG2 (LETT #11# |tf2| . #24#)
                                (QCDR #11#)
                              (|check_union2| (QEQCAR #11# 0)
                                              (|List|
                                               (|SparseUnivariatePolynomial|
                                                (|Expression| (|Integer|))))
                                              (|Union|
                                               (|List|
                                                (|SparseUnivariatePolynomial|
                                                 (|Expression| (|Integer|))))
                                               #12#)
                                              #11#))
                            . #24#)
                      (LETT |sr|
                            (PROGN
                             (LETT #7# NIL . #24#)
                             (SEQ (LETT |j| 0 . #24#)
                                  (LETT #10# (- (LENGTH |flm|) 1) . #24#) G190
                                  (COND ((|greater_SI| |j| #10#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |flm| (+ |j| 1)
                                                        (QREFELT $ 288))
                                              (QREFELT $ 97))
                                             (QREFELT $ 222))
                                            (SPADCALL (|spadConstant| $ 289)
                                                      |j| (QREFELT $ 290))
                                            (QREFELT $ 291))
                                           . #24#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 292))
                                             . #24#))
                                      ('T
                                       (PROGN
                                        (LETT #8# #9# . #24#)
                                        (LETT #7# 'T . #24#)))))))
                                  (LETT |j| (|inc_SI| |j|) . #24#) (GO G190)
                                  G191 (EXIT NIL))
                             (COND (#7# #8#) ('T (|spadConstant| $ 22))))
                            . #24#)
                      (LETT |sr|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 289)
                                       (SPADCALL |sr| (QREFELT $ 26))
                                       (QREFELT $ 295))
                             |sr| (QREFELT $ 291))
                            . #24#)
                      (COND
                       ((EQUAL |option| "use adjoint")
                        (LETT |sr| (SPADCALL |sr| (QREFELT $ 296)) . #24#)))
                      (LETT |srl| (SPADCALL |sr| (QREFELT $ 299)) . #24#)
                      (COND
                       ((QEQCAR (QVELT |sng| 0) 0)
                        (COND
                         ((NULL
                           (SPADCALL
                            (PROG2 (LETT #4# (QVELT |sng| 0) . #24#)
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0)
                                              (|Expression| (|Integer|))
                                              (|Union|
                                               (|Expression| (|Integer|)) #1#)
                                              #4#))
                            (|spadConstant| $ 19) (QREFELT $ 227)))
                          (SEQ (LETT |ftmp| |srl| . #24#)
                               (LETT |srl| (|spadConstant| $ 300) . #24#)
                               (EXIT
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL |ftmp| (|spadConstant| $ 300)
                                                  (QREFELT $ 301)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |lc|
                                            (SPADCALL |ftmp| (QREFELT $ 302))
                                            . #24#)
                                      (LETT |dg|
                                            (SPADCALL |ftmp| (QREFELT $ 303))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #25="infinity")
                                                  (QREFELT $ 305))
                                        (LETT |newx|
                                              (SPADCALL (|spadConstant| $ 147)
                                                        (SPADCALL
                                                         (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                                        (QREFELT $ 306))
                                              . #24#))
                                       ('T
                                        (LETT |newx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 12)
                                                          1 (QREFELT $ 58))
                                                (SPADCALL
                                                 (PROG2
                                                     (LETT #4# (QVELT |sng| 0)
                                                           . #24#)
                                                     (QCDR #4#)
                                                   (|check_union2|
                                                    (QEQCAR #4# 0)
                                                    (|Expression| (|Integer|))
                                                    (|Union|
                                                     (|Expression| (|Integer|))
                                                     #1#)
                                                    #4#))
                                                 (QREFELT $ 217))
                                                (QREFELT $ 83))
                                               (QREFELT $ 222))
                                              . #24#)))
                                      (LETT |lcn|
                                            (|LODOF2;subsup|
                                             (SPADCALL |lc| (QREFELT $ 29))
                                             |newx| $)
                                            . #24#)
                                      (LETT |lcd|
                                            (|LODOF2;subsup|
                                             (SPADCALL |lc| (QREFELT $ 27))
                                             |newx| $)
                                            . #24#)
                                      (LETT |slc|
                                            (SPADCALL |lcn| |lcd|
                                                      (QREFELT $ 295))
                                            . #24#)
                                      (COND
                                       ((SPADCALL (QVELT |sng| 0)
                                                  (CONS 1 #26="infinity")
                                                  (QREFELT $ 305))
                                        (LETT |newd|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 12) 1
                                                   (QREFELT $ 58))
                                                  2 (QREFELT $ 69))
                                                 (QREFELT $ 222))
                                                (SPADCALL (QREFELT $ 307))
                                                (QREFELT $ 308))
                                               (QREFELT $ 309))
                                              . #24#))
                                       ('T
                                        (LETT |newd| (SPADCALL (QREFELT $ 307))
                                              . #24#)))
                                      (LETT |srl|
                                            (SPADCALL |srl|
                                                      (SPADCALL |slc|
                                                                (SPADCALL
                                                                 |newd| |dg|
                                                                 (QREFELT $
                                                                          310))
                                                                (QREFELT $
                                                                         308))
                                                      (QREFELT $ 311))
                                            . #24#)
                                      (EXIT
                                       (LETT |ftmp|
                                             (SPADCALL |ftmp| (QREFELT $ 312))
                                             . #24#)))
                                     NIL (GO G190) G191 (EXIT NIL)))))))
                       ('T
                        (SEQ (LETT |ftmp| |srl| . #24#)
                             (LETT |srl| (|spadConstant| $ 300) . #24#)
                             (EXIT
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (SPADCALL |ftmp| (|spadConstant| $ 300)
                                                (QREFELT $ 301)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |lc|
                                          (SPADCALL |ftmp| (QREFELT $ 302))
                                          . #24#)
                                    (LETT |dg|
                                          (SPADCALL |ftmp| (QREFELT $ 303))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #25#)
                                                (QREFELT $ 305))
                                      (LETT |newx|
                                            (SPADCALL (|spadConstant| $ 147)
                                                      (SPADCALL
                                                       (|spadConstant| $ 12) 1
                                                       (QREFELT $ 58))
                                                      (QREFELT $ 306))
                                            . #24#))
                                     ('T
                                      (LETT |newx|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #4# (QVELT |sng| 0)
                                                         . #24#)
                                                   (QCDR #4#)
                                                 (|check_union2| (QEQCAR #4# 0)
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|Union|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  #1#)
                                                                 #4#))
                                               (QREFELT $ 217))
                                              (QREFELT $ 83))
                                             (QREFELT $ 222))
                                            . #24#)))
                                    (LETT |lcn|
                                          (|LODOF2;subsup|
                                           (SPADCALL |lc| (QREFELT $ 29))
                                           |newx| $)
                                          . #24#)
                                    (LETT |lcd|
                                          (|LODOF2;subsup|
                                           (SPADCALL |lc| (QREFELT $ 27))
                                           |newx| $)
                                          . #24#)
                                    (LETT |slc|
                                          (SPADCALL |lcn| |lcd|
                                                    (QREFELT $ 295))
                                          . #24#)
                                    (COND
                                     ((SPADCALL (QVELT |sng| 0) (CONS 1 #26#)
                                                (QREFELT $ 305))
                                      (LETT |newd|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 12)
                                                          1 (QREFELT $ 58))
                                                2 (QREFELT $ 69))
                                               (QREFELT $ 222))
                                              (SPADCALL (QREFELT $ 307))
                                              (QREFELT $ 308))
                                             (QREFELT $ 309))
                                            . #24#))
                                     ('T
                                      (LETT |newd| (SPADCALL (QREFELT $ 307))
                                            . #24#)))
                                    (LETT |srl|
                                          (SPADCALL |srl|
                                                    (SPADCALL |slc|
                                                              (SPADCALL |newd|
                                                                        |dg|
                                                                        (QREFELT
                                                                         $
                                                                         310))
                                                              (QREFELT $ 308))
                                                    (QREFELT $ 311))
                                          . #24#)
                                    (EXIT
                                     (LETT |ftmp|
                                           (SPADCALL |ftmp| (QREFELT $ 312))
                                           . #24#)))
                                   NIL (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        ((SPADCALL |option| "use adjoint" (QREFELT $ 313))
                         (SEQ
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 314))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 303)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST
                                           (SPADCALL |f| |re| (QREFELT $ 315))
                                           |re|))
                                    . #24#)
                              (GO #27=#:G843)))))))
                        ('T
                         (SEQ
                          (COND
                           ((SPADCALL (QVELT |sng| 0) (CONS 1 "infinity")
                                      (QREFELT $ 305))
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 147)
                                             (SPADCALL (|spadConstant| $ 12)
                                                       (SPADCALL |f|
                                                                 (QREFELT $
                                                                          303))
                                                       (QREFELT $ 58))
                                             (QREFELT $ 306))
                                   (QREFELT $ 316))
                                  . #24#))
                           ('T
                            (LETT |re|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 147)
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 12)
                                                         1 (QREFELT $ 58))
                                               (SPADCALL
                                                (PROG2
                                                    (LETT #4# (QVELT |sng| 0)
                                                          . #24#)
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0)
                                                   (|Expression| (|Integer|))
                                                   (|Union|
                                                    (|Expression| (|Integer|))
                                                    #1#)
                                                   #4#))
                                                (QREFELT $ 217))
                                               (QREFELT $ 83))
                                              (SPADCALL |f| (QREFELT $ 303))
                                              (QREFELT $ 69))
                                             (QREFELT $ 306))
                                   (QREFELT $ 316))
                                  . #24#)))
                          (LETT |srl|
                                (SPADCALL
                                 (SPADCALL |re| (SPADCALL |f| (QREFELT $ 302))
                                           (QREFELT $ 317))
                                 |srl| (QREFELT $ 318))
                                . #24#)
                          (LETT |srl|
                                (SPADCALL |srl|
                                          (SPADCALL (|spadConstant| $ 289)
                                                    (SPADCALL |srl|
                                                              (QREFELT $ 302))
                                                    (QREFELT $ 295))
                                          (QREFELT $ 317))
                                . #24#)
                          (LETT |re| (SPADCALL |f| |srl| (QREFELT $ 319))
                                . #24#)
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |re| (QREFELT $ 303)) 0
                                       (QREFELT $ 48))
                             (PROGN
                              (LETT #2#
                                    (CONS 0
                                          (LIST |re|
                                                (SPADCALL |f| |re|
                                                          (QREFELT $ 320))))
                                    . #24#)
                              (GO #27#))))))))))))))
             (LETT |i| (+ |i| 1) . #24#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #27# (EXIT #2#)))) 

(SDEFUN |LODOF2;try_factorization2|
        ((|fl| |List|
          (|List|
           (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (|n| |Integer|) (|bound| |List| (|Fraction| (|Integer|)))
         (|eb| |Integer|)
         ($ |Union|
          (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          "failed"))
        (SPROG
         ((|nstep| (|Integer|)) (|acc| (|Integer|)) (#1=#:G869 NIL)
          (|hps|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|lv|
           (|List|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
          (#2=#:G875 NIL) (|g| NIL) (#3=#:G874 NIL) (#4=#:G873 NIL) (|f| NIL)
          (#5=#:G872 NIL) (|vdim| (|NonNegativeInteger|)) (|cnt| (|Integer|))
          (|eta| (|List| (|NonNegativeInteger|))) (#6=#:G871 NIL) (|i| NIL)
          (#7=#:G870 NIL) (|cb| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cb|
                  (+
                   (SPADCALL
                    (SPADCALL |bound| (- (LENGTH |fl|) 1) (QREFELT $ 322))
                    (QREFELT $ 183))
                   |eb|)
                  . #8=(|LODOF2;try_factorization2|))
            (LETT |eta|
                  (PROGN
                   (LETT #7# NIL . #8#)
                   (SEQ (LETT |i| 1 . #8#) (LETT #6# |n| . #8#) G190
                        (COND ((|greater_SI| |i| #6#) (GO G191)))
                        (SEQ (EXIT (LETT #7# (CONS |cb| #7#) . #8#)))
                        (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #8#)
            (LETT |cnt| (* (LENGTH |fl|) (+ |cb| 1)) . #8#)
            (LETT |vdim| (LENGTH (|SPADfirst| |fl|)) . #8#)
            (LETT |acc| (QUOTIENT2 (+ (+ |cnt| |vdim|) 3) |vdim|) . #8#)
            (LETT |nstep|
                  (SPADCALL
                   (SPADCALL (SPADCALL |acc| 2 (QREFELT $ 323)) 3
                             (QREFELT $ 51))
                   (QREFELT $ 183))
                  . #8#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |lv|
                         (PROGN
                          (LETT #5# NIL . #8#)
                          (SEQ (LETT |f| NIL . #8#) (LETT #4# |fl| . #8#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |f| (CAR #4#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (SPADCALL
                                         (PROGN
                                          (LETT #3# NIL . #8#)
                                          (SEQ (LETT |g| NIL . #8#)
                                               (LETT #2# |f| . #8#) G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |g| (CAR #2#)
                                                            . #8#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (SPADCALL
                                                         (|LODOF2;convertUTStoUP|
                                                          |g| |acc| $)
                                                         (QREFELT $ 96))
                                                        #3#)
                                                       . #8#)))
                                               (LETT #2# (CDR #2#) . #8#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#))))
                                         (QREFELT $ 325))
                                        #5#)
                                       . #8#)))
                               (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #8#)
                   (LETT |hps| (SPADCALL |lv| |eta| |acc| (QREFELT $ 330))
                         . #8#)
                   (EXIT
                    (COND
                     ((EQL (ANCOLS |hps|) 1)
                      (PROGN
                       (LETT #1#
                             (CONS 0
                                   (SPADCALL (SPADCALL |hps| 1 (QREFELT $ 331))
                                             (QREFELT $ 332)))
                             . #8#)
                       (GO #9=#:G868)))
                     ((EQL (ANCOLS |hps|) 0)
                      (PROGN (LETT #1# (CONS 1 "failed") . #8#) (GO #9#)))
                     ('T
                      (SEQ (LETT |acc| (+ |acc| |nstep|) . #8#)
                           (EXIT
                            (LETT |nstep|
                                  (+
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 2 (QREFELT $ 51))
                                              |nstep| (QREFELT $ 333))
                                    (QREFELT $ 181))
                                   2)
                                  . #8#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #1#)))) 

(SDEFUN |LODOF2;flist|
        ((|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|order| |Integer|)
         ($ |List|
          (|List|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                      |cen|))))
        (SPROG
         ((|res|
           (|List|
            (|List|
             (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                        |cen|))))
          (#1=#:G883 NIL) (|j| NIL) (#2=#:G882 NIL)
          (|p|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#3=#:G881 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #4=(|LODOF2;flist|))
              (SEQ (LETT |i| 0 . #4#) (LETT #3# |order| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |p| (|LODOF2;xDn_modr| |i| |r| $) . #4#)
                        (EXIT
                         (LETT |res|
                               (APPEND |res|
                                       (LIST
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |j| 0 . #4#)
                                              (LETT #1#
                                                    (-
                                                     (SPADCALL |r|
                                                               (QREFELT $ 41))
                                                     1)
                                                    . #4#)
                                              G190
                                              (COND
                                               ((|greater_SI| |j| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |p| |j|
                                                                 (QREFELT $
                                                                          54))
                                                       #2#)
                                                      . #4#)))
                                              (LETT |j| (|inc_SI| |j|) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))))
                               . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;xDn_modr|
        ((|n| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|coefa|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|a|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#1=#:G887 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| (SPADCALL |r| (QREFELT $ 41)))
              (PROGN
               (LETT #1# (SPADCALL (|spadConstant| $ 14) |n| (QREFELT $ 34))
                     . #2=(|LODOF2;xDn_modr|))
               (GO #3=#:G886))))
            (LETT |a| (|LODOF2;xDn_modr| (- |n| 1) |r| $) . #2#)
            (LETT |coefa|
                  (SPADCALL |a| (- (SPADCALL |r| (QREFELT $ 41)) 1)
                            (QREFELT $ 54))
                  . #2#)
            (EXIT
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34)) |a|
                         (QREFELT $ 156))
               (SPADCALL |a| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 34))
                         (QREFELT $ 156))
               (QREFELT $ 35))
              (SPADCALL |coefa| |r| (QREFELT $ 154)) (QREFELT $ 162)))))
          #3# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G903 NIL) (#2=#:G904 NIL) (|i| NIL)
          (|res|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|b|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 303)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #3=(|LODOF2;factor;LodoMLL;47|))
               (GO #4=#:G902))))
            (LETT |factorizer2|
                  (CONS #'|LODOF2;factor;LodoMLL;47!0|
                        (VECTOR |factorizer| |y|))
                  . #3#)
            (LETT |b| (|LODOF2;factor_global| |f| |factorizer2| $) . #3#)
            (EXIT
             (COND ((EQL (LENGTH |b|) 1) (PROGN (LETT #1# |b| . #3#) (GO #4#)))
                   ('T
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |b| 1 (QREFELT $ 335))
                                      |factorizer| |y| (QREFELT $ 338))
                            (SPADCALL (SPADCALL |b| 2 (QREFELT $ 335))
                                      |factorizer| |y| (QREFELT $ 338))
                            (QREFELT $ 339))
                           . #3#)
                     (SEQ (LETT |i| 3 . #3#) (LETT #2# (LENGTH |b|) . #3#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |res|
                                      (SPADCALL
                                       (SPADCALL |b| |i| (QREFELT $ 335))
                                       |factorizer| |y| (QREFELT $ 338))
                                      (QREFELT $ 340))))
                          (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #1# |res| . #3#) (GO #4#)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |LODOF2;factor;LodoMLL;47!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1) . #1=(|LODOF2;factor;LodoMLL;47|))
          (LETT |factorizer| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;inf_singularity?|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         ($ |Boolean|))
        (SPROG
         ((#2=#:G911 NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#3=#:G914 NIL) (|e| NIL) (#4=#:G913 NIL)
          (|fi|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|yu|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #5=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #5#)
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#6=#:G912 NIL) (|i| NIL)
          (|ux|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|ftmp| #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fi| (|spadConstant| $ 300) . #7=(|LODOF2;inf_singularity?|))
            (LETT |ftmp| |f| . #7#)
            (LETT |ux|
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 12) 2 (QREFELT $ 58))
                             (QREFELT $ 222))
                   (QREFELT $ 341))
                  . #7#)
            (LETT |yu| (|spadConstant| $ 342) . #7#)
            (SEQ (LETT |i| 0 . #7#)
                 (LETT #6# (SPADCALL |f| (QREFELT $ 303)) . #7#) G190
                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                 (SEQ (LETT |lc| (SPADCALL |f| |i| (QREFELT $ 343)) . #7#)
                      (LETT |lcn|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 29))
                             (SPADCALL (|spadConstant| $ 147)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 306))
                             $)
                            . #7#)
                      (LETT |lcd|
                            (|LODOF2;subsup| (SPADCALL |lc| (QREFELT $ 27))
                             (SPADCALL (|spadConstant| $ 147)
                                       (SPADCALL (|spadConstant| $ 12) 1
                                                 (QREFELT $ 58))
                                       (QREFELT $ 306))
                             $)
                            . #7#)
                      (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 295)) . #7#)
                      (LETT |fi|
                            (SPADCALL |fi|
                                      (SPADCALL |slc| |yu| (QREFELT $ 308))
                                      (QREFELT $ 311))
                            . #7#)
                      (EXIT
                       (LETT |yu|
                             (SPADCALL
                              (SPADCALL |ux| (SPADCALL (QREFELT $ 307))
                                        (QREFELT $ 308))
                              |yu| (QREFELT $ 318))
                             . #7#)))
                 (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |fi|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 289)
                             (SPADCALL |fi| (QREFELT $ 302)) (QREFELT $ 295))
                   |fi| (QREFELT $ 308))
                  . #7#)
            (LETT |dlc|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |e| (SPADCALL |fi| (QREFELT $ 345)) . #7#)
                        (LETT #3# (SPADCALL |fi| (QREFELT $ 303)) . #7#) G190
                        (COND ((> |e| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (SPADCALL |fi| |e| (QREFELT $ 343))
                                           (QREFELT $ 27))
                                 #4#)
                                . #7#)))
                        (LETT |e| (+ |e| 1) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (COND
             ((SPADCALL
               (SPADCALL (SPADCALL |dlc| (QREFELT $ 347))
                         (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                         (|spadConstant| $ 52) (QREFELT $ 82))
               (|spadConstant| $ 52) (QREFELT $ 84))
              (PROGN (LETT #2# 'T . #7#) (GO #8=#:G910))))
            (EXIT NIL)))
          #8# (EXIT #2#)))) 

(SDEFUN |LODOF2;testis;LodoB;49|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         ($ |Boolean|))
        (|LODOF2;inf_singularity?| |f| $)) 

(SDEFUN |LODOF2;factor_global|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1018 NIL) (#2=#:G983 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G177 NIL) (#5=#:G1042 NIL) (|l| NIL)
          (|vrs|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G965 NIL)
          (|kk|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|jj|
           (|Record|
            (|:| |ope|
                 (|LinearOrdinaryDifferentialOperator3|
                  (|Expression| (|Integer|))
                  (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)
                  (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                             |cen|)))
            (|:| |dext| (|PositiveInteger|))
            (|:| |alpha| (|Expression| (|Integer|)))
            (|:| |rami|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (#7=#:G178 NIL)
          (|j1|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|iarf1|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#8=#:G1041 NIL) (|s| NIL) (#9=#:G1040 NIL) (|sop| NIL)
          (#10=#:G1039 NIL) (#11=#:G1037 NIL) (#12=#:G1038 NIL) (|sa| NIL)
          (#13=#:G1036 NIL)
          (|done_sa|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point|
                        (|Union| (|Expression| (|Integer|)) #14="infinity"))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (#15=#:G1035 NIL) (|all_one| (|Boolean|)) (#16=#:G1034 NIL)
          (#17=#:G1032 NIL) (|ssp| NIL) (#18=#:G1033 NIL)
          (|done_s|
           (|List|
            (|Record|
             (|:| |sing|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |arf|
                  (|List|
                   (|Union|
                    (|LinearOrdinaryDifferentialOperator3|
                     (|Expression| (|Integer|))
                     (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)
                     (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                |var| |cen|))
                    (|Record|
                     (|:| |ope|
                          (|LinearOrdinaryDifferentialOperator3|
                           (|Expression| (|Integer|))
                           (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))
                     (|:| |dext| (|PositiveInteger|))
                     (|:| |alpha| (|Expression| (|Integer|)))
                     (|:| |rami|
                          (|UnivariatePolynomial| |var|
                                                  (|Expression|
                                                   (|Integer|)))))))))))
          (|gem|
           #19=(|List|
                (|Record|
                 (|:| |singularity|
                      (|Record|
                       (|:| |point| (|Union| (|Expression| (|Integer|)) #14#))
                       (|:| |lpf|
                            (|LinearOrdinaryDifferentialOperator3|
                             (|Expression| (|Integer|))
                             (|UnivariateTaylorSeries|
                              (|Expression| (|Integer|)) |var| |cen|)
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))
                       (|:| |dxt| (|PositiveInteger|))))
                 (|:| |fos|
                      (|List|
                       (|Record|
                        (|:| |op|
                             (|LinearOrdinaryDifferentialOperator3|
                              (|Expression| (|Integer|))
                              (|UnivariateTaylorSeries|
                               (|Expression| (|Integer|)) |var| |cen|)
                              (|UnivariateLaurentSeries|
                               (|Expression| (|Integer|)) |var| |cen|)))
                        (|:| |ram|
                             (|UnivariatePolynomial| |var|
                                                     (|Expression|
                                                      (|Integer|))))
                        (|:| |expart|
                             (|UnivariateLaurentSeries|
                              (|Expression| (|Integer|)) |var| |cen|)))))
                 (|:| |mge|
                      (|List|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|))))))
          (#20=#:G1031 NIL) (|ge| NIL) (|min_deg| (|PositiveInteger|))
          (|dl| (|List| (|PositiveInteger|))) (#21=#:G1030 NIL)
          (#22=#:G1029 NIL) (|eba| (|Integer|)) (|gema| #19#)
          (|eb| (|Integer|)) (|bound| (|List| (|Fraction| (|Integer|))))
          (#23=#:G1028 NIL) (|j| NIL) (#24=#:G1027 NIL) (#25=#:G1026 NIL)
          (|i| NIL) (|v| (|List| (|Fraction| (|Integer|)))) (#26=#:G1025 NIL)
          (|ji1x| #27=(|Integer|)) (|jix| #27#) (|ji1y| #28=(|Integer|))
          (|jiy| #28#) (#29=#:G1024 NIL)
          (|np|
           (|List|
            (|Record|
             (|:| |point|
                  (|Record| (|:| |x| (|Integer|)) (|:| |y| (|Integer|))))
             (|:| |slope| (|Fraction| (|Integer|)))
             (|:| |npoly|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
          (#30=#:G1023 NIL) (#31=#:G1022 NIL) (#32=#:G1021 NIL)
          (#33=#:G1020 NIL) (#34=#:G1019 NIL)
          (|a|
           (|List|
            (|LinearOrdinaryDifferentialOperator1|
             (|Fraction|
              (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 303)) 1 (QREFELT $ 49))
              (PROGN
               (LETT #1# (LIST |f|) . #35=(|LODOF2;factor_global|))
               (GO #36=#:G1017))))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT $ 302)) (|spadConstant| $ 289)
                        (QREFELT $ 349))
              (SEQ
               (LETT |a|
                     (|LODOF2;factor_global|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 289)
                                 (SPADCALL |f| (QREFELT $ 302))
                                 (QREFELT $ 295))
                       |f| (QREFELT $ 308))
                      |factorizer| $)
                     . #35#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (CONS
                        (SPADCALL (SPADCALL |f| (QREFELT $ 302))
                                  (SPADCALL |a| 1 (QREFELT $ 335))
                                  (QREFELT $ 308))
                        (PROGN
                         (LETT #34# NIL . #35#)
                         (SEQ (LETT |i| 2 . #35#)
                              (LETT #33# (LENGTH |a|) . #35#) G190
                              (COND ((|greater_SI| |i| #33#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #34#
                                      (CONS (SPADCALL |a| |i| (QREFELT $ 335))
                                            #34#)
                                      . #35#)))
                              (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #34#)))))
                       . #35#)
                 (GO #36#))))))
            (COND
             ((EQL (SPADCALL |f| (QREFELT $ 303)) 2)
              (SPADCALL "Better to use old factorizer" (QREFELT $ 166))))
            (LETT |gem| (SPADCALL |f| |factorizer| "" (QREFELT $ 353)) . #35#)
            (LETT |bound|
                  (PROGN
                   (LETT #32# NIL . #35#)
                   (SEQ (LETT |i| 1 . #35#)
                        (LETT #31# (- (SPADCALL |f| (QREFELT $ 303)) 1) . #35#)
                        G190 (COND ((|greater_SI| |i| #31#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #32# (CONS (|spadConstant| $ 67) #32#)
                                . #35#)))
                        (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                        (EXIT (NREVERSE #32#))))
                  . #35#)
            (LETT |eb| -1 . #35#)
            (SEQ (LETT |s| NIL . #35#) (LETT #30# |gem| . #35#) G190
                 (COND
                  ((OR (ATOM #30#) (PROGN (LETT |s| (CAR #30#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |np| (|LODOF2;newtonpolygon| (QVELT (QVELT |s| 0) 1) $)
                        . #35#)
                  (LETT |np|
                        (APPEND |np|
                                (LIST
                                 (VECTOR
                                  (CONS
                                   (SPADCALL (QVELT (QVELT |s| 0) 1)
                                             (QREFELT $ 41))
                                   0)
                                  (|spadConstant| $ 67)
                                  (|spadConstant| $ 52))))
                        . #35#)
                  (LETT |v| NIL . #35#)
                  (SEQ (LETT |i| 1 . #35#)
                       (LETT #29# (- (LENGTH |np|) 1) . #35#) G190
                       (COND ((|greater_SI| |i| #29#) (GO G191)))
                       (SEQ
                        (LETT |jiy|
                              (QCDR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 190)) 0))
                              . #35#)
                        (LETT |ji1y|
                              (QCDR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 190))
                                      0))
                              . #35#)
                        (LETT |jix|
                              (QCAR
                               (QVELT (SPADCALL |np| |i| (QREFELT $ 190)) 0))
                              . #35#)
                        (LETT |ji1x|
                              (QCAR
                               (QVELT (SPADCALL |np| (+ |i| 1) (QREFELT $ 190))
                                      0))
                              . #35#)
                        (EXIT
                         (SEQ (LETT |l| |jix| . #35#)
                              (LETT #26# (- |ji1x| 1) . #35#) G190
                              (COND ((> |l| #26#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |v|
                                      (APPEND |v|
                                              (LIST
                                               (SPADCALL
                                                (SPADCALL |jiy|
                                                          (QREFELT $ 102))
                                                (SPADCALL
                                                 (* (- |l| |jix|)
                                                    (- |ji1y| |jiy|))
                                                 (- |ji1x| |jix|)
                                                 (QREFELT $ 51))
                                                (QREFELT $ 104))))
                                      . #35#)))
                              (LETT |l| (+ |l| 1) . #35#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (SEQ (LETT |i| 1 . #35#)
                       (LETT #25# (- (SPADCALL |f| (QREFELT $ 303)) 1) . #35#)
                       G190 (COND ((|greater_SI| |i| #25#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |bound| |i|
                                   (SPADCALL
                                    (SPADCALL |bound| |i| (QREFELT $ 322))
                                    (SPADCALL (QVELT (QVELT |s| 0) 2)
                                              (SPADCALL |v| (+ |i| 1)
                                                        (QREFELT $ 322))
                                              (QREFELT $ 103))
                                    (QREFELT $ 104))
                                   (QREFELT $ 354))))
                       (LETT |i| (|inc_SI| |i|) . #35#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (LETT |eb| (+ |eb| (QVELT (QVELT |s| 0) 2)) . #35#)))
                 (LETT #30# (CDR #30#) . #35#) (GO G190) G191 (EXIT NIL))
            (LETT |bound|
                  (PROGN
                   (LETT #24# NIL . #35#)
                   (SEQ (LETT |j| 1 . #35#)
                        (LETT #23# (- (SPADCALL |f| (QREFELT $ 303)) 1) . #35#)
                        G190 (COND ((|greater_SI| |j| #23#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #24#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |bound|
                                             (- (SPADCALL |f| (QREFELT $ 303))
                                                |j|)
                                             (QREFELT $ 322))
                                   (QREFELT $ 355))
                                  (SPADCALL |j| (SPADCALL |eb| (QREFELT $ 102))
                                            (QREFELT $ 356))
                                  (QREFELT $ 104))
                                 #24#)
                                . #35#)))
                        (LETT |j| (|inc_SI| |j|) . #35#) (GO G190) G191
                        (EXIT (NREVERSE #24#))))
                  . #35#)
            (LETT |eb| (|LODOF2;compute_bound| |gem| (|spadConstant| $ 19) $)
                  . #35#)
            (LETT |gema|
                  (SPADCALL |f| |factorizer| "use adjoint" (QREFELT $ 353))
                  . #35#)
            (LETT |eba| (|LODOF2;compute_bound| |gema| (|spadConstant| $ 19) $)
                  . #35#)
            (LETT |all_one| 'T . #35#) (LETT |done_s| NIL . #35#)
            (SEQ G190 (COND ((NULL (NULL (NULL |gem|))) (GO G191)))
                 (SEQ
                  (LETT |dl|
                        (PROGN
                         (LETT #22# NIL . #35#)
                         (SEQ (LETT |s| NIL . #35#) (LETT #21# |gem| . #35#)
                              G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |s| (CAR #21#) . #35#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #22# (CONS (QVELT (QVELT |s| 0) 2) #22#)
                                      . #35#)))
                              (LETT #21# (CDR #21#) . #35#) (GO G190) G191
                              (EXIT (NREVERSE #22#))))
                        . #35#)
                  (LETT |min_deg| (SPADCALL (ELT $ 360) |dl| (QREFELT $ 363))
                        . #35#)
                  (EXIT
                   (SEQ (LETT |ge| NIL . #35#) (LETT #20# |gem| . #35#) G190
                        (COND
                         ((OR (ATOM #20#)
                              (PROGN (LETT |ge| (CAR #20#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QVELT (QVELT |ge| 0) 2) |min_deg|)
                            (SEQ
                             (LETT |gem| (SPADCALL |ge| |gem| (QREFELT $ 364))
                                   . #35#)
                             (LETT |vrs|
                                   (PROG2
                                       (LETT #6#
                                             (|LODOF2;factor_op|
                                              (QVELT (QVELT |ge| 0) 1)
                                              |factorizer| "all right factors"
                                              $)
                                             . #35#)
                                       (QCDR #6#)
                                     (|check_union2| (QEQCAR #6# 1)
                                                     (|List|
                                                      (|Union|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))
                                                       (|Record|
                                                        (|:| |ope|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |dext|
                                                             (|PositiveInteger|))
                                                        (|:| |alpha|
                                                             (|Expression|
                                                              (|Integer|)))
                                                        (|:| |rami|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|)))))))
                                                     (|Union|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |op|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))))
                                                        (|:| |ram|
                                                             (|UnivariatePolynomial|
                                                              (QREFELT $ 6)
                                                              (|Expression|
                                                               (|Integer|))))
                                                        (|:| |expart|
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))))
                                                      (|List|
                                                       (|Union|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7)))
                                                        (|Record|
                                                         (|:| |ope|
                                                              (|LinearOrdinaryDifferentialOperator3|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (|UnivariateTaylorSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $ 7))
                                                               (|UnivariateLaurentSeries|
                                                                (|Expression|
                                                                 (|Integer|))
                                                                (QREFELT $ 6)
                                                                (QREFELT $
                                                                         7))))
                                                         (|:| |dext|
                                                              (|PositiveInteger|))
                                                         (|:| |alpha|
                                                              (|Expression|
                                                               (|Integer|)))
                                                         (|:| |rami|
                                                              (|UnivariatePolynomial|
                                                               (QREFELT $ 6)
                                                               (|Expression|
                                                                (|Integer|))))))))
                                                     #6#))
                                   . #35#)
                             (LETT |done_s|
                                   (APPEND |done_s|
                                           (LIST (CONS (QVELT |ge| 0) |vrs|)))
                                   . #35#)
                             (SEQ (LETT |sop| NIL . #35#)
                                  (LETT #18# |vrs| . #35#)
                                  (LETT |ssp| NIL . #35#)
                                  (LETT #17# (QVELT |ge| 1) . #35#) G190
                                  (COND
                                   ((OR (ATOM #17#)
                                        (PROGN
                                         (LETT |ssp| (CAR #17#) . #35#)
                                         NIL)
                                        (ATOM #18#)
                                        (PROGN
                                         (LETT |sop| (CAR #18#) . #35#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL (QVELT |ssp| 0)
                                                 (QREFELT $ 41))
                                       1)
                                      (COND
                                       ((EQL
                                         (SPADCALL
                                          (PROG2 (LETT #4# |sop| . #35#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1)
                                        (PROGN
                                         (LETT #1#
                                               (|LODOF2;factor_minmult1|
                                                |bound| (QVELT |ge| 0) |f| |eb|
                                                |eba|
                                                (PROG2 (LETT #4# |sop| . #35#)
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0)
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Union|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Record|
                                                     (|:| |ope|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))))
                                                     (|:| |dext|
                                                          (|PositiveInteger|))
                                                     (|:| |alpha|
                                                          (|Expression|
                                                           (|Integer|)))
                                                     (|:| |rami|
                                                          (|UnivariatePolynomial|
                                                           (QREFELT $ 6)
                                                           (|Expression|
                                                            (|Integer|))))))
                                                   #4#))
                                                |factorizer| $)
                                               . #35#)
                                         (GO #36#))))))))
                                  (LETT #17#
                                        (PROG1 (CDR #17#)
                                          (LETT #18# (CDR #18#) . #35#))
                                        . #35#)
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (LETT |all_one|
                                    (COND
                                     (|all_one|
                                      (COND
                                       ((EQL (LENGTH |vrs|) 1)
                                        (EQL
                                         (SPADCALL
                                          (PROG2
                                              (LETT #4#
                                                    (SPADCALL |vrs| 1
                                                              (QREFELT $ 365))
                                                    . #35#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|LinearOrdinaryDifferentialOperator3|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (|UnivariateTaylorSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7))
                                                             (|UnivariateLaurentSeries|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)))
                                                            (|Union|
                                                             (|LinearOrdinaryDifferentialOperator3|
                                                              (|Expression|
                                                               (|Integer|))
                                                              (|UnivariateTaylorSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7))
                                                              (|UnivariateLaurentSeries|
                                                               (|Expression|
                                                                (|Integer|))
                                                               (QREFELT $ 6)
                                                               (QREFELT $ 7)))
                                                             (|Record|
                                                              (|:| |ope|
                                                                   (|LinearOrdinaryDifferentialOperator3|
                                                                    (|Expression|
                                                                     (|Integer|))
                                                                    (|UnivariateTaylorSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))
                                                                    (|UnivariateLaurentSeries|
                                                                     (|Expression|
                                                                      (|Integer|))
                                                                     (QREFELT $
                                                                              6)
                                                                     (QREFELT $
                                                                              7))))
                                                              (|:| |dext|
                                                                   (|PositiveInteger|))
                                                              (|:| |alpha|
                                                                   (|Expression|
                                                                    (|Integer|)))
                                                              (|:| |rami|
                                                                   (|UnivariatePolynomial|
                                                                    (QREFELT $
                                                                             6)
                                                                    (|Expression|
                                                                     (|Integer|))))))
                                                            #4#))
                                          (QREFELT $ 41))
                                         1))
                                       ('T NIL)))
                                     ('T NIL))
                                    . #35#)))))))
                        (LETT #20# (CDR #20#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SPADCALL "Better to use old factorizer" (QREFELT $ 166))))
            (LETT |all_one| 'T . #35#) (LETT |done_sa| NIL . #35#)
            (SEQ (LETT |s| NIL . #35#) (LETT #16# |done_s| . #35#) G190
                 (COND
                  ((OR (ATOM #16#) (PROGN (LETT |s| (CAR #16#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |all_one|
                        (COND (|all_one| (EQL (LENGTH (QCDR |s|)) 1)) ('T NIL))
                        . #35#)
                  (SEQ (LETT |sop| NIL . #35#) (LETT #15# (QCDR |s|) . #35#)
                       G190
                       (COND
                        ((OR (ATOM #15#)
                             (PROGN (LETT |sop| (CAR #15#) . #35#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop| . #35#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (SPADCALL
                                (SPADCALL (SPADCALL |f| (QREFELT $ 303)) 2
                                          (QREFELT $ 51))
                                (QREFELT $ 181))
                               |bound| (QCAR |s|) |f| |eb| 0 "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))
                       (LETT #15# (CDR #15#) . #35#) (GO G190) G191 (EXIT NIL))
                  (LETT |vrs|
                        (PROG2
                            (LETT #6#
                                  (|LODOF2;factor_op|
                                   (SPADCALL (QVELT (QCAR |s|) 1)
                                             (QREFELT $ 368))
                                   |factorizer| "all right factors" $)
                                  . #35#)
                            (QCDR #6#)
                          (|check_union2| (QEQCAR #6# 1)
                                          (|List|
                                           (|Union|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Record|
                                             (|:| |ope|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |dext| (|PositiveInteger|))
                                             (|:| |alpha|
                                                  (|Expression| (|Integer|)))
                                             (|:| |rami|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression|
                                                    (|Integer|)))))))
                                          (|Union|
                                           (|List|
                                            (|Record|
                                             (|:| |op|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))))
                                             (|:| |ram|
                                                  (|UnivariatePolynomial|
                                                   (QREFELT $ 6)
                                                   (|Expression| (|Integer|))))
                                             (|:| |expart|
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))))
                                           (|List|
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))))
                                          #6#))
                        . #35#)
                  (LETT |done_sa|
                        (APPEND |done_sa| (LIST (CONS (QCAR |s|) |vrs|)))
                        . #35#)
                  (EXIT
                   (SEQ (LETT |sop| NIL . #35#) (LETT #13# |vrs| . #35#) G190
                        (COND
                         ((OR (ATOM #13#)
                              (PROGN (LETT |sop| (CAR #13#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop| . #35#)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 303)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 181))
                                |bound| (QCAR |s|) |f| |eba| 0 "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t| . #35#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#))
                                   . #35#)
                             (GO #36#))))))
                        (LETT #13# (CDR #13#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT #16# (CDR #16#) . #35#) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |sa| NIL . #35#) (LETT #12# |done_sa| . #35#)
                 (LETT |s| NIL . #35#) (LETT #11# |done_s| . #35#) G190
                 (COND
                  ((OR (ATOM #11#) (PROGN (LETT |s| (CAR #11#) . #35#) NIL)
                       (ATOM #12#) (PROGN (LETT |sa| (CAR #12#) . #35#) NIL))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |sop| NIL . #35#) (LETT #10# (QCDR |s|) . #35#)
                       G190
                       (COND
                        ((OR (ATOM #10#)
                             (PROGN (LETT |sop| (CAR #10#) . #35#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |t|
                              (|LODOF2;try_factorization|
                               (PROG2 (LETT #4# |sop| . #35#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                 #4#))
                               (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound|
                               (QCAR |s|) |f| |eb|
                               (+
                                (SPADCALL
                                 (SPADCALL (SPADCALL |f| (QREFELT $ 303)) 2
                                           (QREFELT $ 51))
                                 (QREFELT $ 181))
                                1)
                               "" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))
                       (LETT #10# (CDR #10#) . #35#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |sop| NIL . #35#) (LETT #9# (QCDR |sa|) . #35#)
                        G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |sop| (CAR #9#) . #35#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |t|
                               (|LODOF2;try_factorization|
                                (PROG2 (LETT #4# |sop| . #35#)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                  #4#))
                                (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound|
                                (QCAR |s|) |f| |eba|
                                (+
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 303)) 2
                                            (QREFELT $ 51))
                                  (QREFELT $ 181))
                                 1)
                                "use adjoint" $)
                               . #35#)
                         (EXIT
                          (COND
                           ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                            (PROGN
                             (LETT #1#
                                   (PROG2 (LETT #2# |t| . #35#)
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     (|Union|
                                                      (|List|
                                                       (|LinearOrdinaryDifferentialOperator1|
                                                        (|Fraction|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))
                                                      #3#)
                                                     #2#))
                                   . #35#)
                             (GO #36#))))))
                        (LETT #9# (CDR #9#) . #35#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #35#))
                       . #35#)
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|all_one|
              (SEQ (LETT |s| NIL . #35#) (LETT #8# |done_s| . #35#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |s| (CAR #8#) . #35#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |iarf1|
                          (PROG2 (LETT #4# (|SPADfirst| (QCDR |s|)) . #35#)
                              (QCDR #4#)
                            (|check_union2| (QEQCAR #4# 0)
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7)))
                                            (|Union|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Record|
                                              (|:| |ope|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))))
                                              (|:| |dext| (|PositiveInteger|))
                                              (|:| |alpha|
                                                   (|Expression| (|Integer|)))
                                              (|:| |rami|
                                                   (|UnivariatePolynomial|
                                                    (QREFELT $ 6)
                                                    (|Expression|
                                                     (|Integer|))))))
                                            #4#))
                          . #35#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |iarf1| (QREFELT $ 41)) 1
                                 (QREFELT $ 48))
                       (SEQ
                        (LETT |j1|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op| |iarf1|
                                         |factorizer| "alg factor" $)
                                        . #35#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#))
                              . #35#)
                        (LETT |jj|
                              (PROG2
                                  (LETT #7# (SPADCALL |j1| (QREFELT $ 194))
                                        . #35#)
                                  (QCDR #7#)
                                (|check_union2| (QEQCAR #7# 1)
                                                (|Record|
                                                 (|:| |ope|
                                                      (|LinearOrdinaryDifferentialOperator3|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (|UnivariateTaylorSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))
                                                       (|UnivariateLaurentSeries|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7))))
                                                 (|:| |dext|
                                                      (|PositiveInteger|))
                                                 (|:| |alpha|
                                                      (|Expression|
                                                       (|Integer|)))
                                                 (|:| |rami|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|)))))
                                                (|Union|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7)))
                                                 (|Record|
                                                  (|:| |ope|
                                                       (|LinearOrdinaryDifferentialOperator3|
                                                        (|Expression|
                                                         (|Integer|))
                                                        (|UnivariateTaylorSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7))))
                                                  (|:| |dext|
                                                       (|PositiveInteger|))
                                                  (|:| |alpha|
                                                       (|Expression|
                                                        (|Integer|)))
                                                  (|:| |rami|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                #7#))
                              . #35#)
                        (LETT |kk| (|LODOF2;make_rightfactor| |iarf1| |jj| $)
                              . #35#)
                        (LETT |t|
                              (|LODOF2;try_factorization| |kk|
                               (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "" $)
                              . #35#)
                        (COND
                         ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                          (PROGN
                           (LETT #1#
                                 (PROG2 (LETT #2# |t| . #35#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|List|
                                                    (|LinearOrdinaryDifferentialOperator1|
                                                     (|Fraction|
                                                      (|UnivariatePolynomial|
                                                       (QREFELT $ 6)
                                                       (|Expression|
                                                        (|Integer|))))))
                                                   (|Union|
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    #3#)
                                                   #2#))
                                 . #35#)
                           (GO #36#))))
                        (LETT |vrs|
                              (PROG2
                                  (LETT #6#
                                        (|LODOF2;factor_op|
                                         (SPADCALL (QVELT (QCAR |s|) 1)
                                                   (QREFELT $ 368))
                                         |factorizer| "all right factors" $)
                                        . #35#)
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|List|
                                                 (|Union|
                                                  (|LinearOrdinaryDifferentialOperator3|
                                                   (|Expression| (|Integer|))
                                                   (|UnivariateTaylorSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7))
                                                   (|UnivariateLaurentSeries|
                                                    (|Expression| (|Integer|))
                                                    (QREFELT $ 6)
                                                    (QREFELT $ 7)))
                                                  (|Record|
                                                   (|:| |ope|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |dext|
                                                        (|PositiveInteger|))
                                                   (|:| |alpha|
                                                        (|Expression|
                                                         (|Integer|)))
                                                   (|:| |rami|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|)))))))
                                                (|Union|
                                                 (|List|
                                                  (|Record|
                                                   (|:| |op|
                                                        (|LinearOrdinaryDifferentialOperator3|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|UnivariateTaylorSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))
                                                         (|UnivariateLaurentSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (QREFELT $ 6)
                                                          (QREFELT $ 7))))
                                                   (|:| |ram|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))
                                                   (|:| |expart|
                                                        (|UnivariateLaurentSeries|
                                                         (|Expression|
                                                          (|Integer|))
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)))))
                                                 (|List|
                                                  (|Union|
                                                   (|LinearOrdinaryDifferentialOperator3|
                                                    (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)))
                                                   (|Record|
                                                    (|:| |ope|
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))))
                                                    (|:| |dext|
                                                         (|PositiveInteger|))
                                                    (|:| |alpha|
                                                         (|Expression|
                                                          (|Integer|)))
                                                    (|:| |rami|
                                                         (|UnivariatePolynomial|
                                                          (QREFELT $ 6)
                                                          (|Expression|
                                                           (|Integer|))))))))
                                                #6#))
                              . #35#)
                        (LETT |r_left| (|spadConstant| $ 18) . #35#)
                        (SEQ (LETT |l| NIL . #35#) (LETT #5# |vrs| . #35#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |l| (CAR #5#) . #35#) NIL)
                                   (NULL
                                    (SPADCALL |r_left| (|spadConstant| $ 18)
                                              (QREFELT $ 213))))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|LODOF2;same_charclass?|
                                  (PROG2 (LETT #4# |l| . #35#)
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 0)
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7)))
                                                    (|Union|
                                                     (|LinearOrdinaryDifferentialOperator3|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (|UnivariateTaylorSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7))
                                                      (|UnivariateLaurentSeries|
                                                       (|Expression|
                                                        (|Integer|))
                                                       (QREFELT $ 6)
                                                       (QREFELT $ 7)))
                                                     (|Record|
                                                      (|:| |ope|
                                                           (|LinearOrdinaryDifferentialOperator3|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (|UnivariateTaylorSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))
                                                            (|UnivariateLaurentSeries|
                                                             (|Expression|
                                                              (|Integer|))
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7))))
                                                      (|:| |dext|
                                                           (|PositiveInteger|))
                                                      (|:| |alpha|
                                                           (|Expression|
                                                            (|Integer|)))
                                                      (|:| |rami|
                                                           (|UnivariatePolynomial|
                                                            (QREFELT $ 6)
                                                            (|Expression|
                                                             (|Integer|))))))
                                                    #4#))
                                  (SPADCALL |kk| (QREFELT $ 368)) |factorizer|
                                  $)
                                 (LETT |r_left|
                                       (PROG2 (LETT #4# |l| . #35#)
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|LinearOrdinaryDifferentialOperator3|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|UnivariateTaylorSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7))
                                                          (|UnivariateLaurentSeries|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (QREFELT $ 6)
                                                           (QREFELT $ 7)))
                                                         (|Union|
                                                          (|LinearOrdinaryDifferentialOperator3|
                                                           (|Expression|
                                                            (|Integer|))
                                                           (|UnivariateTaylorSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                                           (|UnivariateLaurentSeries|
                                                            (|Expression|
                                                             (|Integer|))
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)))
                                                          (|Record|
                                                           (|:| |ope|
                                                                (|LinearOrdinaryDifferentialOperator3|
                                                                 (|Expression|
                                                                  (|Integer|))
                                                                 (|UnivariateTaylorSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                                                 (|UnivariateLaurentSeries|
                                                                  (|Expression|
                                                                   (|Integer|))
                                                                  (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))))
                                                           (|:| |dext|
                                                                (|PositiveInteger|))
                                                           (|:| |alpha|
                                                                (|Expression|
                                                                 (|Integer|)))
                                                           (|:| |rami|
                                                                (|UnivariatePolynomial|
                                                                 (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))))
                                                         #4#))
                                       . #35#)))))
                             (LETT #5# (CDR #5#) . #35#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |t|
                              (|LODOF2;try_factorization| |r_left|
                               (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound|
                               (QCAR |s|) |f| 0 0 "use adjoint" $)
                              . #35#)
                        (EXIT
                         (COND
                          ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
                           (PROGN
                            (LETT #1#
                                  (PROG2 (LETT #2# |t| . #35#)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (|List|
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      (|Fraction|
                                                       (|UnivariatePolynomial|
                                                        (QREFELT $ 6)
                                                        (|Expression|
                                                         (|Integer|))))))
                                                    (|Union|
                                                     (|List|
                                                      (|LinearOrdinaryDifferentialOperator1|
                                                       (|Fraction|
                                                        (|UnivariatePolynomial|
                                                         (QREFELT $ 6)
                                                         (|Expression|
                                                          (|Integer|))))))
                                                     #3#)
                                                    #2#))
                                  . #35#)
                            (GO #36#))))))))))
                   (LETT #8# (CDR #8#) . #35#) (GO G190) G191 (EXIT NIL))))
            (SPADCALL "Try the old factorizer" (QREFELT $ 166))
            (EXIT (LIST |f|))))
          #36# (EXIT #1#)))) 

(SDEFUN |LODOF2;testfg;LodoML;51|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (|LODOF2;factor_global| |f| |factorizer| $)) 

(SDEFUN |LODOF2;factor_minmult1|
        ((|bound| |List| (|Fraction| (|Integer|)))
         (|sng| |Record|
          (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
          (|:| |lpf|
               (|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
          (|:| |dxt| (|PositiveInteger|)))
         (|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|eb| |Integer|) (|eba| |Integer|)
         (|r| |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         ($ |List|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))))
        (SPROG
         ((#1=#:G1065 NIL) (#2=#:G1047 NIL)
          (|t|
           (|Union|
            (|List|
             (|LinearOrdinaryDifferentialOperator1|
              (|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
            #3="failed"))
          (|r_left|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (#4=#:G177 NIL) (#5=#:G1066 NIL) (|i| NIL)
          (|w|
           (|List|
            (|Union|
             (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                    (|UnivariateTaylorSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|)
                                                    (|UnivariateLaurentSeries|
                                                     (|Expression| (|Integer|))
                                                     |var| |cen|))
             (|Record|
              (|:| |ope|
                   (|LinearOrdinaryDifferentialOperator3|
                    (|Expression| (|Integer|))
                    (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)
                    (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                               |cen|)))
              (|:| |dext| (|PositiveInteger|))
              (|:| |alpha| (|Expression| (|Integer|)))
              (|:| |rami|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (#6=#:G1056 NIL) (|fl| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fl|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 303)) 2 (QREFELT $ 51))
                   (QREFELT $ 181))
                  . #7=(|LODOF2;factor_minmult1|))
            (LETT |t|
                  (|LODOF2;try_factorization| |r| |fl| |bound| |sng| |f| |eb| 0
                   "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8=#:G1064))))
            (LETT |w|
                  (PROG2
                      (LETT #6#
                            (|LODOF2;factor_op|
                             (SPADCALL (QVELT |sng| 1) (QREFELT $ 368))
                             |factorizer| "all right factors" $)
                            . #7#)
                      (QCDR #6#)
                    (|check_union2| (QEQCAR #6# 1)
                                    (|List|
                                     (|Union|
                                      (|LinearOrdinaryDifferentialOperator3|
                                       (|Expression| (|Integer|))
                                       (|UnivariateTaylorSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7))
                                       (|UnivariateLaurentSeries|
                                        (|Expression| (|Integer|))
                                        (QREFELT $ 6) (QREFELT $ 7)))
                                      (|Record|
                                       (|:| |ope|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |dext| (|PositiveInteger|))
                                       (|:| |alpha| (|Expression| (|Integer|)))
                                       (|:| |rami|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))))))
                                    (|Union|
                                     (|List|
                                      (|Record|
                                       (|:| |op|
                                            (|LinearOrdinaryDifferentialOperator3|
                                             (|Expression| (|Integer|))
                                             (|UnivariateTaylorSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))
                                             (|UnivariateLaurentSeries|
                                              (|Expression| (|Integer|))
                                              (QREFELT $ 6) (QREFELT $ 7))))
                                       (|:| |ram|
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|))))
                                       (|:| |expart|
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))))
                                     (|List|
                                      (|Union|
                                       (|LinearOrdinaryDifferentialOperator3|
                                        (|Expression| (|Integer|))
                                        (|UnivariateTaylorSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7))
                                        (|UnivariateLaurentSeries|
                                         (|Expression| (|Integer|))
                                         (QREFELT $ 6) (QREFELT $ 7)))
                                       (|Record|
                                        (|:| |ope|
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))))
                                        (|:| |dext| (|PositiveInteger|))
                                        (|:| |alpha|
                                             (|Expression| (|Integer|)))
                                        (|:| |rami|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 6)
                                              (|Expression| (|Integer|))))))))
                                    #6#))
                  . #7#)
            (LETT |r_left| (|spadConstant| $ 18) . #7#)
            (SEQ (LETT |i| NIL . #7#) (LETT #5# |w| . #7#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #7#) NIL)
                       (NULL
                        (SPADCALL |r_left| (|spadConstant| $ 18)
                                  (QREFELT $ 213))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|LODOF2;same_charclass?|
                      (PROG2 (LETT #4# |i| . #7#)
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0)
                                        (|LinearOrdinaryDifferentialOperator3|
                                         (|Expression| (|Integer|))
                                         (|UnivariateTaylorSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7))
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))
                                        (|Union|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))
                                         (|Record|
                                          (|:| |ope|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |dext| (|PositiveInteger|))
                                          (|:| |alpha|
                                               (|Expression| (|Integer|)))
                                          (|:| |rami|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))))
                                        #4#))
                      (SPADCALL |r| (QREFELT $ 368)) |factorizer| $)
                     (LETT |r_left|
                           (PROG2 (LETT #4# |i| . #7#)
                               (QCDR #4#)
                             (|check_union2| (QEQCAR #4# 0)
                                             (|LinearOrdinaryDifferentialOperator3|
                                              (|Expression| (|Integer|))
                                              (|UnivariateTaylorSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              (|UnivariateLaurentSeries|
                                               (|Expression| (|Integer|))
                                               (QREFELT $ 6) (QREFELT $ 7)))
                                             (|Union|
                                              (|LinearOrdinaryDifferentialOperator3|
                                               (|Expression| (|Integer|))
                                               (|UnivariateTaylorSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7))
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))
                                              (|Record|
                                               (|:| |ope|
                                                    (|LinearOrdinaryDifferentialOperator3|
                                                     (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))))
                                               (|:| |dext| (|PositiveInteger|))
                                               (|:| |alpha|
                                                    (|Expression| (|Integer|)))
                                               (|:| |rami|
                                                    (|UnivariatePolynomial|
                                                     (QREFELT $ 6)
                                                     (|Expression|
                                                      (|Integer|))))))
                                             #4#))
                           . #7#)))))
                 (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |r_left| (|spadConstant| $ 18) (QREFELT $ 213))
              (|error| "bug")))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left| |fl| |bound| |sng| |f|
                   |eba| 0 "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r|
                   (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound| |sng| |f| |eb|
                   (+ |fl| 1) "" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (LETT |t|
                  (|LODOF2;try_factorization| |r_left|
                   (- (SPADCALL |f| (QREFELT $ 303)) 1) |bound| |sng| |f| |eba|
                   (+ |fl| 1) "use adjoint" $)
                  . #7#)
            (COND
             ((SPADCALL |t| (CONS 1 "failed") (QREFELT $ 367))
              (PROGN
               (LETT #1#
                     (PROG2 (LETT #2# |t| . #7#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|List|
                                        (|LinearOrdinaryDifferentialOperator1|
                                         (|Fraction|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))))
                                       (|Union|
                                        (|List|
                                         (|LinearOrdinaryDifferentialOperator1|
                                          (|Fraction|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))
                                        #3#)
                                       #2#))
                     . #7#)
               (GO #8#))))
            (EXIT (LIST |f|))))
          #8# (EXIT #1#)))) 

(SDEFUN |LODOF2;l_p|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator1|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (|p| |Union| (|Expression| (|Integer|)) #2="infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (SPROG
         ((|llr|
           (|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   |var| |cen|)))
          (|ftmp| #1#)
          (|lpf|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|newd|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction|
             (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
          (|slc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcd|
           #3=(|Fraction|
               (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|lcn| #3#)
          (|newx|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#4=#:G1068 NIL) (|dg| (|NonNegativeInteger|))
          (|lc|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))
         (SEQ (LETT |lpf| (|spadConstant| $ 300) . #5=(|LODOF2;l_p|))
              (COND
               ((SPADCALL |p| (CONS 0 (|spadConstant| $ 19)) (QREFELT $ 305))
                (LETT |lpf| |f| . #5#))
               ('T
                (SEQ (LETT |ftmp| |f| . #5#)
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL |ftmp| (|spadConstant| $ 300)
                                        (QREFELT $ 301)))
                             (GO G191)))
                           (SEQ
                            (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 302)) . #5#)
                            (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 303)) . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 305))
                              (LETT |newx|
                                    (SPADCALL (|spadConstant| $ 147)
                                              (SPADCALL (|spadConstant| $ 12) 1
                                                        (QREFELT $ 58))
                                              (QREFELT $ 306))
                                    . #5#))
                             ('T
                              (LETT |newx|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (SPADCALL
                                       (PROG2 (LETT #4# |p| . #5#)
                                           (QCDR #4#)
                                         (|check_union2| (QEQCAR #4# 0)
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|Union|
                                                          (|Expression|
                                                           (|Integer|))
                                                          #2#)
                                                         #4#))
                                       (QREFELT $ 217))
                                      (QREFELT $ 59))
                                     (QREFELT $ 222))
                                    . #5#)))
                            (LETT |lcn|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 29)) |newx| $)
                                  . #5#)
                            (LETT |lcd|
                                  (|LODOF2;subsup|
                                   (SPADCALL |lc| (QREFELT $ 27)) |newx| $)
                                  . #5#)
                            (LETT |slc| (SPADCALL |lcn| |lcd| (QREFELT $ 295))
                                  . #5#)
                            (COND
                             ((SPADCALL |p| (CONS 1 "infinity")
                                        (QREFELT $ 305))
                              (LETT |newd|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 12) 1
                                                  (QREFELT $ 58))
                                        2 (QREFELT $ 69))
                                       (QREFELT $ 222))
                                      (SPADCALL (QREFELT $ 307))
                                      (QREFELT $ 308))
                                     (QREFELT $ 309))
                                    . #5#))
                             ('T
                              (LETT |newd| (SPADCALL (QREFELT $ 307)) . #5#)))
                            (LETT |lpf|
                                  (SPADCALL |lpf|
                                            (SPADCALL |slc|
                                                      (SPADCALL |newd| |dg|
                                                                (QREFELT $
                                                                         310))
                                                      (QREFELT $ 308))
                                            (QREFELT $ 311))
                                  . #5#)
                            (EXIT
                             (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 312))
                                   . #5#)))
                           NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |llr|
                    (|LODOF2;convertL3toLL| (SPADCALL |lpf| (QREFELT $ 370)) $)
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| $ 14) (SPADCALL |llr| (QREFELT $ 37))
                          (QREFELT $ 242))
                |llr| (QREFELT $ 154)))))) 

(SDEFUN |LODOF2;testlp;LodoULodo;54|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) "infinity")
         ($ |LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
          (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var| |cen|)
          (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
        (|LODOF2;l_p| |f| |p| $)) 

(SDEFUN |LODOF2;subsup|
        ((|np| . #1=(|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         (|newx| |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
         ($ |Fraction|
          (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
        (SPROG
         ((|nptmp| #1#)
          (|res|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (|dg| (|NonNegativeInteger|)) (|lc| (|Expression| (|Integer|))))
         (SEQ (LETT |res| (|spadConstant| $ 372) . #2=(|LODOF2;subsup|))
              (LETT |nptmp| |np| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |nptmp| (|spadConstant| $ 52) (QREFELT $ 148)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |nptmp| (QREFELT $ 186)) . #2#)
                        (LETT |dg| (SPADCALL |nptmp| (QREFELT $ 72)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| (QREFELT $ 217))
                                         (SPADCALL |newx| |dg| (QREFELT $ 373))
                                         (QREFELT $ 374))
                                        (QREFELT $ 375))
                              . #2#)
                        (EXIT
                         (LETT |nptmp| (SPADCALL |nptmp| (QREFELT $ 188))
                               . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;get_trace|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (SPROG
         ((|fa| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|Sae|
           (|Join|
            (|MonogenicAlgebra| #1=(|Expression| (|Integer|))
                                (|UnivariatePolynomial| |var|
                                                        (|Expression|
                                                         (|Integer|))))
            (CATEGORY |package|
             (IF (|has| #1# (|Field|))
                 (IF (|has| #1# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|min_pol|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |min_pol| (SPADCALL |k| (QREFELT $ 377))
                . #2=(|LODOF2;get_trace|))
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (|Expression| (|Integer|))
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 6)
                                             (|Expression| (|Integer|)))
                                            (SPADCALL |min_pol|
                                                      (QREFELT $ 97)))
                . #2#)
          (LETT |fa| (SPADCALL |f| |k| |min_pol| (QREFELT $ 380)) . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |fa| (QREFELT $ 97))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|UnivariatePolynomial|
                                                    (|devaluate| (ELT $ 6))
                                                    (LIST '|Expression|
                                                          (LIST '|Integer|))))
                                             |Sae|))
            (|compiledLookupCheck| '|trace|
                                   (LIST (LIST '|Expression| (LIST '|Integer|))
                                         '$)
                                   |Sae|)))))) 

(SDEFUN |LODOF2;testgt;EKE;57|
        ((|f| |Expression| (|Integer|))
         (|k| |Kernel| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (|LODOF2;get_trace| |f| |k| $)) 

(SDEFUN |LODOF2;make_poly|
        ((|f|
          . #1=(|LinearOrdinaryDifferentialOperator3|
                (|Expression| (|Integer|))
                (|UnivariateTaylorSeries| (|Expression| (|Integer|)) |var|
                                          |cen|)
                (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                           |cen|)))
         ($ |SparseUnivariatePolynomial| (|Expression| (|Integer|))))
        (SPROG
         ((|ftmp| #1#)
          (|res| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|dg| (|NonNegativeInteger|))
          (|lc|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|)))
         (SEQ (LETT |res| (|spadConstant| $ 382) . #2=(|LODOF2;make_poly|))
              (LETT |ftmp| |f| . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |ftmp| (|spadConstant| $ 18) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |lc| (SPADCALL |ftmp| (QREFELT $ 37)) . #2#)
                        (LETT |dg| (SPADCALL |ftmp| (QREFELT $ 41)) . #2#)
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |lc| 0 (QREFELT $ 57)) |dg|
                                         (QREFELT $ 383))
                                        (QREFELT $ 384))
                              . #2#)
                        (EXIT
                         (LETT |ftmp| (SPADCALL |ftmp| (QREFELT $ 44)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |LODOF2;compute_bound|
        ((|gem| |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point| (|Union| (|Expression| (|Integer|)) "infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))))
         (|rlc| |Expression| (|Integer|)) ($ |Integer|))
        (SPROG
         ((|res| (|Fraction| (|Integer|))) (#1=#:G1092 NIL) (#2=#:G1115 NIL)
          (|ma| (|Union| (|Fraction| (|Integer|)) #3="-infinity"))
          (|cq| (|Fraction| (|Integer|))) (|c| (|Expression| (|Integer|)))
          (#4=#:G1122 NIL) (|ke| NIL)
          (|ks| (|List| (|Kernel| (|Expression| (|Integer|)))))
          (|vpej| #5=(|Fraction| (|Integer|))) (|vpei| #5#)
          (|rjj| #6=(|NonNegativeInteger|)) (#7=#:G1120 NIL) (|jj| NIL)
          (#8=#:G1121 NIL) (|fpsjj| NIL) (|r| #6#) (#9=#:G1117 NIL) (|f| NIL)
          (#10=#:G1118 NIL) (|fps| NIL) (#11=#:G1119 NIL) (|ji| NIL)
          (#12=#:G1116 NIL) (|ge| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (|spadConstant| $ 67) . #13=(|LODOF2;compute_bound|))
            (SEQ (LETT |ge| NIL . #13#) (LETT #12# |gem| . #13#) G190
                 (COND
                  ((OR (ATOM #12#) (PROGN (LETT |ge| (CAR #12#) . #13#) NIL))
                   (GO G191)))
                 (SEQ (LETT |ma| (CONS 1 "-infinity") . #13#)
                      (SEQ (LETT |ji| 1 . #13#)
                           (LETT #11# (LENGTH (QVELT |ge| 2)) . #13#)
                           (LETT |fps| NIL . #13#)
                           (LETT #10# (QVELT |ge| 1) . #13#)
                           (LETT |f| NIL . #13#)
                           (LETT #9# (QVELT |ge| 2) . #13#) G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |f| (CAR #9#) . #13#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |fps| (CAR #10#) . #13#) NIL)
                                 (|greater_SI| |ji| #11#))
                             (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL (QVELT |fps| 1) (QREFELT $ 72))
                                  . #13#)
                            (LETT |c| (SPADCALL |f| 0 (QREFELT $ 57)) . #13#)
                            (SEQ (LETT |fpsjj| NIL . #13#)
                                 (LETT #8#
                                       (SPADCALL (QVELT |ge| 1) |ji|
                                                 (QREFELT $ 387))
                                       . #13#)
                                 (LETT |jj| NIL . #13#)
                                 (LETT #7#
                                       (SPADCALL (QVELT |ge| 2) |ji|
                                                 (QREFELT $ 385))
                                       . #13#)
                                 G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |jj| (CAR #7#) . #13#) NIL)
                                       (ATOM #8#)
                                       (PROGN
                                        (LETT |fpsjj| (CAR #8#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rjj|
                                        (SPADCALL (QVELT |fpsjj| 1)
                                                  (QREFELT $ 72))
                                        . #13#)
                                  (LETT |vpei|
                                        (SPADCALL
                                         (SPADCALL |f| 0 (QREFELT $ 42)) |r|
                                         (QREFELT $ 51))
                                        . #13#)
                                  (LETT |vpej|
                                        (SPADCALL
                                         (SPADCALL |jj| 0 (QREFELT $ 42)) |rjj|
                                         (QREFELT $ 51))
                                        . #13#)
                                  (EXIT
                                   (LETT |c|
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL |vpei| |vpej|
                                                              (QREFELT $ 105))
                                                    (QREFELT $ 232))
                                                   (QREFELT $ 388))
                                         . #13#)))
                                 (LETT #7#
                                       (PROG1 (CDR #7#)
                                         (LETT #8# (CDR #8#) . #13#))
                                       . #13#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |ks| (SPADCALL |c| (QREFELT $ 390)) . #13#)
                            (SEQ (LETT |ke| NIL . #13#) (LETT #4# |ks| . #13#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN
                                        (LETT |ke| (CAR #4#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((QEQCAR
                                      (SPADCALL (SPADCALL |ke| (QREFELT $ 391))
                                                (QREFELT $ 393))
                                      1)
                                     (SEQ
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c| (QREFELT $ 394)) |ke|
                                          |rlc| (QREFELT $ 395))
                                         (|spadConstant| $ 19) (QREFELT $ 227))
                                        (PROGN
                                         (LETT #2#
                                               (|LODOF2;compute_bound| |gem|
                                                (SPADCALL |rlc|
                                                          (|spadConstant| $ 12)
                                                          (QREFELT $ 388))
                                                $)
                                               . #13#)
                                         (GO #14=#:G1114))))
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL |c| |ke| |rlc|
                                                       (QREFELT $ 395))
                                             . #13#))))
                                    ('T
                                     (LETT |c|
                                           (SPADCALL
                                            (|LODOF2;get_trace| |c| |ke| $)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |ke| (QREFELT $ 377))
                                              (QREFELT $ 396))
                                             (QREFELT $ 75))
                                            (QREFELT $ 76))
                                           . #13#)))))
                                 (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |cq| (SPADCALL |c| (QREFELT $ 397)) . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL |ma| (CONS 1 "-infinity")
                                         (QREFELT $ 399))
                               (LETT |ma|
                                     (CONS 0 (SPADCALL |cq| (QREFELT $ 355)))
                                     . #13#))
                              ('T
                               (LETT |ma|
                                     (CONS 0
                                           (SPADCALL
                                            (SPADCALL |cq| (QREFELT $ 355))
                                            (PROG2 (LETT #1# |ma| . #13#)
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (|Fraction|
                                                               (|Integer|))
                                                              (|Union|
                                                               (|Fraction|
                                                                (|Integer|))
                                                               #3#)
                                                              #1#))
                                            (QREFELT $ 400)))
                                     . #13#)))))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10#
                                         (PROG1 (CDR #10#)
                                           (LETT |ji| (|inc_SI| |ji|) . #13#))
                                         . #13#))
                                 . #13#)
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       ((SPADCALL |ma| (CONS 1 "-infinity") (QREFELT $ 399))
                        (PROGN (LETT #2# 0 . #13#) (GO #14#))))
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL (QVELT (QVELT |ge| 0) 2)
                                                 (PROG2 (LETT #1# |ma| . #13#)
                                                     (QCDR #1#)
                                                   (|check_union2|
                                                    (QEQCAR #1# 0)
                                                    (|Fraction| (|Integer|))
                                                    (|Union|
                                                     (|Fraction| (|Integer|))
                                                     #3#)
                                                    #1#))
                                                 (QREFELT $ 103))
                                       (QREFELT $ 104))
                             . #13#)))
                 (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
            (EXIT (MAX 0 (SPADCALL |res| (QREFELT $ 181))))))
          #14# (EXIT #2#)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|p| |Union| (|Expression| (|Integer|)) #1="infinity")
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))
          (|List| (|Expression| (|Integer|))))
         (|y| |List| (|Expression| (|Integer|)))
         ($ |List|
          (|Record|
           (|:| |ecs|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|)))
           (|:| |ecr|
                (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
           (|:| |ect|
                (|Fraction|
                 (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |ecs|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|)))
             (|:| |ecr|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |ect|
                  (|Fraction|
                   (|UnivariatePolynomial| |var|
                                           (|Expression| (|Integer|))))))))
          (|tr|
           (|Fraction|
            (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#2=#:G1125 NIL)
          (|ss|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (#3=#:G1148 NIL) (|root| NIL) (#4=#:G1147 NIL)
          (|es| (|List| (|Expression| (|Integer|)))) (#5=#:G1146 NIL) (|g| NIL)
          (#6=#:G1145 NIL)
          (|s|
           #7=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#8=#:G1144 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #7#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#9=#:G1133 NIL)
          (|factorizer2|
           (|Mapping|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (SEQ
          (LETT |factorizer2|
                (CONS #'|LODOF2;gen_exp;LodoUMLL;60!0|
                      (VECTOR |factorizer| |y|))
                . #10=(|LODOF2;gen_exp;LodoUMLL;60|))
          (LETT |v|
                (PROG2
                    (LETT #9#
                          (|LODOF2;factor_op| (|LODOF2;l_p| |f| |p| $)
                           |factorizer2| "semireg" $)
                          . #10#)
                    (QCDR #9#)
                  (|check_union2| (QEQCAR #9# 0)
                                  (|List|
                                   (|Record|
                                    (|:| |op|
                                         (|LinearOrdinaryDifferentialOperator3|
                                          (|Expression| (|Integer|))
                                          (|UnivariateTaylorSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7))))
                                    (|:| |ram|
                                         (|UnivariatePolynomial| (QREFELT $ 6)
                                                                 (|Expression|
                                                                  (|Integer|))))
                                    (|:| |expart|
                                         (|UnivariateLaurentSeries|
                                          (|Expression| (|Integer|))
                                          (QREFELT $ 6) (QREFELT $ 7)))))
                                  (|Union|
                                   (|List|
                                    (|Record|
                                     (|:| |op|
                                          (|LinearOrdinaryDifferentialOperator3|
                                           (|Expression| (|Integer|))
                                           (|UnivariateTaylorSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))
                                           (|UnivariateLaurentSeries|
                                            (|Expression| (|Integer|))
                                            (QREFELT $ 6) (QREFELT $ 7))))
                                     (|:| |ram|
                                          (|UnivariatePolynomial| (QREFELT $ 6)
                                                                  (|Expression|
                                                                   (|Integer|))))
                                     (|:| |expart|
                                          (|UnivariateLaurentSeries|
                                           (|Expression| (|Integer|))
                                           (QREFELT $ 6) (QREFELT $ 7)))))
                                   (|List|
                                    (|Union|
                                     (|LinearOrdinaryDifferentialOperator3|
                                      (|Expression| (|Integer|))
                                      (|UnivariateTaylorSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7))
                                      (|UnivariateLaurentSeries|
                                       (|Expression| (|Integer|)) (QREFELT $ 6)
                                       (QREFELT $ 7)))
                                     (|Record|
                                      (|:| |ope|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))))
                                      (|:| |dext| (|PositiveInteger|))
                                      (|:| |alpha| (|Expression| (|Integer|)))
                                      (|:| |rami|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 6)
                                            (|Expression| (|Integer|))))))))
                                  #9#))
                . #10#)
          (LETT |res| NIL . #10#)
          (SEQ (LETT |e| NIL . #10#) (LETT #8# |v| . #10#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 72)) . #10#)
                    (LETT |s| (QVELT |e| 0) . #10#)
                    (LETT |es|
                          (PROGN
                           (LETT #6# NIL . #10#)
                           (SEQ (LETT |g| NIL . #10#)
                                (LETT #5#
                                      (SPADCALL
                                       (SPADCALL (|LODOF2;make_poly| |s| $)
                                                 |factorizer2|)
                                       (QREFELT $ 403))
                                      . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |g| (CAR #5#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL (QCAR |g|) (QREFELT $ 404))
                                         #6#)
                                        . #10#)))
                                (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #10#)
                    (LETT |ss|
                          (PROGN
                           (LETT #4# NIL . #10#)
                           (SEQ (LETT |root| NIL . #10#) (LETT #3# |es| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN
                                       (LETT |root| (CAR #3#) . #10#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |root| (QREFELT $ 187))
                                           (QVELT |e| 2) (QREFELT $ 212))
                                          (SPADCALL |r| (QREFELT $ 75))
                                          (QREFELT $ 241))
                                         #4#)
                                        . #10#)))
                                (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #10#)
                    (COND
                     ((SPADCALL |p| (CONS 1 "infinity") (QREFELT $ 305))
                      (LETT |tr|
                            (SPADCALL (|spadConstant| $ 147)
                                      (SPADCALL (|spadConstant| $ 12) 1
                                                (QREFELT $ 58))
                                      (QREFELT $ 306))
                            . #10#))
                     ('T
                      (LETT |tr|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 58))
                              (SPADCALL
                               (PROG2 (LETT #2# |p| . #10#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Expression| (|Integer|))
                                                 (|Union|
                                                  (|Expression| (|Integer|))
                                                  #1#)
                                                 #2#))
                               (QREFELT $ 217))
                              (QREFELT $ 83))
                             (QREFELT $ 222))
                            . #10#)))
                    (EXIT
                     (LETT |res|
                           (APPEND |res|
                                   (LIST (VECTOR |ss| (QVELT |e| 1) |tr|)))
                           . #10#)))
               (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |LODOF2;gen_exp;LodoUMLL;60!0| ((|x| NIL) ($$ NIL))
        (PROG (|y| |factorizer|)
          (LETT |y| (QREFELT $$ 1) . #1=(|LODOF2;gen_exp;LodoUMLL;60|))
          (LETT |factorizer| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |y| |factorizer|))))) 

(SDEFUN |LODOF2;ge_minimal;LodoMSL;61|
        ((|f| |LinearOrdinaryDifferentialOperator1|
          (|Fraction|
           (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
         (|factorizer| |Mapping|
          (|Factored|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
         (|option| |String|)
         ($ |List|
          (|Record|
           (|:| |singularity|
                (|Record|
                 (|:| |point|
                      (|Union| (|Expression| (|Integer|)) #1="infinity"))
                 (|:| |lpf|
                      (|LinearOrdinaryDifferentialOperator3|
                       (|Expression| (|Integer|))
                       (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                 |var| |cen|)
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))
                 (|:| |dxt| (|PositiveInteger|))))
           (|:| |fos|
                (|List|
                 (|Record|
                  (|:| |op|
                       (|LinearOrdinaryDifferentialOperator3|
                        (|Expression| (|Integer|))
                        (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)
                        (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)))
                  (|:| |ram|
                       (|UnivariatePolynomial| |var|
                                               (|Expression| (|Integer|))))
                  (|:| |expart|
                       (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                  |var| |cen|)))))
           (|:| |mge|
                (|List|
                 (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                            |cen|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record|
             (|:| |singularity|
                  (|Record|
                   (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                   (|:| |lpf|
                        (|LinearOrdinaryDifferentialOperator3|
                         (|Expression| (|Integer|))
                         (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                   |var| |cen|)
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))
                   (|:| |dxt| (|PositiveInteger|))))
             (|:| |fos|
                  (|List|
                   (|Record|
                    (|:| |op|
                         (|LinearOrdinaryDifferentialOperator3|
                          (|Expression| (|Integer|))
                          (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)
                          (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                     |var| |cen|)))
                    (|:| |ram|
                         (|UnivariatePolynomial| |var|
                                                 (|Expression| (|Integer|))))
                    (|:| |expart|
                         (|UnivariateLaurentSeries| (|Expression| (|Integer|))
                                                    |var| |cen|)))))
             (|:| |mge|
                  (|List|
                   (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                              |cen|))))))
          (|mg|
           (|List|
            (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var|
                                       |cen|)))
          (|ss|
           (|UnivariateLaurentSeries| (|Expression| (|Integer|)) |var| |cen|))
          (|ms| (|Expression| (|Integer|)))
          (|es| (|List| (|Fraction| (|Integer|)))) (#2=#:G1208 NIL) (|g| NIL)
          (#3=#:G1207 NIL)
          (|s|
           #4=(|LinearOrdinaryDifferentialOperator3| (|Expression| (|Integer|))
                                                     (|UnivariateTaylorSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)
                                                     (|UnivariateLaurentSeries|
                                                      (|Expression|
                                                       (|Integer|))
                                                      |var| |cen|)))
          (|r| (|NonNegativeInteger|)) (#5=#:G1206 NIL) (|e| NIL)
          (|v|
           (|List|
            (|Record| (|:| |op| #4#)
                      (|:| |ram|
                           (|UnivariatePolynomial| |var|
                                                   (|Expression| (|Integer|))))
                      (|:| |expart|
                           (|UnivariateLaurentSeries|
                            (|Expression| (|Integer|)) |var| |cen|)))))
          (#6=#:G1167 NIL) (#7=#:G1205 NIL) (|sg| NIL)
          (|singularities|
           (|List|
            (|Record| (|:| |point| (|Union| (|Expression| (|Integer|)) #1#))
                      (|:| |lpf|
                           (|LinearOrdinaryDifferentialOperator3|
                            (|Expression| (|Integer|))
                            (|UnivariateTaylorSeries|
                             (|Expression| (|Integer|)) |var| |cen|)
                            (|UnivariateLaurentSeries|
                             (|Expression| (|Integer|)) |var| |cen|)))
                      (|:| |dxt| (|PositiveInteger|)))))
          (#8=#:G1204 NIL) (#9=#:G1203 NIL) (|root| (|Expression| (|Integer|)))
          (#10=#:G1202 NIL)
          (|dnf|
           (|List|
            (|Record|
             (|:| |factor|
                  (|UnivariatePolynomial| |var| (|Expression| (|Integer|))))
             (|:| |exponent| (|Integer|)))))
          (#11=#:G1201 NIL) (|p| NIL)
          (|dlc|
           (|List| (|UnivariatePolynomial| |var| (|Expression| (|Integer|)))))
          (#12=#:G1200 NIL) (#13=#:G1199 NIL))
         (SEQ
          (LETT |dlc|
                (PROGN
                 (LETT #13# NIL . #14=(|LODOF2;ge_minimal;LodoMSL;61|))
                 (SEQ (LETT |e| (SPADCALL |f| (QREFELT $ 345)) . #14#)
                      (LETT #12# (SPADCALL |f| (QREFELT $ 303)) . #14#) G190
                      (COND ((> |e| #12#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13#
                              (CONS
                               (SPADCALL (SPADCALL |f| |e| (QREFELT $ 343))
                                         (QREFELT $ 27))
                               #13#)
                              . #14#)))
                      (LETT |e| (+ |e| 1) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (LETT |dlc| (SPADCALL |dlc| (QREFELT $ 410)) . #14#)
          (LETT |dnf| NIL . #14#)
          (SEQ (LETT |p| NIL . #14#) (LETT #11# |dlc| . #14#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |p| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |dnf|
                       (APPEND |dnf|
                               (SPADCALL (|LODOF2;factorUP| |p| |factorizer| $)
                                         (QREFELT $ 66)))
                       . #14#)))
               (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
          (COND
           ((|LODOF2;inf_singularity?| |f| $)
            (LETT |singularities|
                  (LIST
                   (VECTOR (CONS 1 "infinity")
                           (|LODOF2;l_p| |f| (CONS 1 "infinity") $) 1))
                  . #14#))
           ('T (LETT |singularities| NIL . #14#)))
          (SEQ (LETT |g| NIL . #14#) (LETT #10# |dnf| . #14#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |g| (CAR #10#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |root|
                      (SPADCALL (SPADCALL (QCAR |g|) (QREFELT $ 96))
                                (QREFELT $ 404))
                      . #14#)
                (EXIT
                 (LETT |singularities|
                       (CONS
                        (VECTOR (CONS 0 |root|)
                                (|LODOF2;l_p| |f| (CONS 0 |root|) $)
                                (SPADCALL (QCAR |g|) (QREFELT $ 72)))
                        |singularities|)
                       . #14#)))
               (LETT #10# (CDR #10#) . #14#) (GO G190) G191 (EXIT NIL))
          (COND
           ((EQUAL |option| "use adjoint")
            (LETT |singularities|
                  (PROGN
                   (LETT #9# NIL . #14#)
                   (SEQ (LETT |sg| NIL . #14#)
                        (LETT #8# |singularities| . #14#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |sg| (CAR #8#) . #14#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9#
                                (CONS
                                 (VECTOR (QVELT |sg| 0)
                                         (SPADCALL (QVELT |sg| 1)
                                                   (QREFELT $ 368))
                                         (QVELT |sg| 2))
                                 #9#)
                                . #14#)))
                        (LETT #8# (CDR #8#) . #14#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))
                  . #14#)))
          (LETT |res| NIL . #14#)
          (SEQ (LETT |sg| NIL . #14#) (LETT #7# |singularities| . #14#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |sg| (CAR #7#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |v|
                      (PROG2
                          (LETT #6#
                                (|LODOF2;factor_op| (QVELT |sg| 1) |factorizer|
                                 "semireg" $)
                                . #14#)
                          (QCDR #6#)
                        (|check_union2| (QEQCAR #6# 0)
                                        (|List|
                                         (|Record|
                                          (|:| |op|
                                               (|LinearOrdinaryDifferentialOperator3|
                                                (|Expression| (|Integer|))
                                                (|UnivariateTaylorSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6) (QREFELT $ 7))))
                                          (|:| |ram|
                                               (|UnivariatePolynomial|
                                                (QREFELT $ 6)
                                                (|Expression| (|Integer|))))
                                          (|:| |expart|
                                               (|UnivariateLaurentSeries|
                                                (|Expression| (|Integer|))
                                                (QREFELT $ 6) (QREFELT $ 7)))))
                                        (|Union|
                                         (|List|
                                          (|Record|
                                           (|:| |op|
                                                (|LinearOrdinaryDifferentialOperator3|
                                                 (|Expression| (|Integer|))
                                                 (|UnivariateTaylorSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 (|UnivariateLaurentSeries|
                                                  (|Expression| (|Integer|))
                                                  (QREFELT $ 6)
                                                  (QREFELT $ 7))))
                                           (|:| |ram|
                                                (|UnivariatePolynomial|
                                                 (QREFELT $ 6)
                                                 (|Expression| (|Integer|))))
                                           (|:| |expart|
                                                (|UnivariateLaurentSeries|
                                                 (|Expression| (|Integer|))
                                                 (QREFELT $ 6)
                                                 (QREFELT $ 7)))))
                                         (|List|
                                          (|Union|
                                           (|LinearOrdinaryDifferentialOperator3|
                                            (|Expression| (|Integer|))
                                            (|UnivariateTaylorSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7))
                                            (|UnivariateLaurentSeries|
                                             (|Expression| (|Integer|))
                                             (QREFELT $ 6) (QREFELT $ 7)))
                                           (|Record|
                                            (|:| |ope|
                                                 (|LinearOrdinaryDifferentialOperator3|
                                                  (|Expression| (|Integer|))
                                                  (|UnivariateTaylorSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6) (QREFELT $ 7))
                                                  (|UnivariateLaurentSeries|
                                                   (|Expression| (|Integer|))
                                                   (QREFELT $ 6)
                                                   (QREFELT $ 7))))
                                            (|:| |dext| (|PositiveInteger|))
                                            (|:| |alpha|
                                                 (|Expression| (|Integer|)))
                                            (|:| |rami|
                                                 (|UnivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Expression|
                                                   (|Integer|))))))))
                                        #6#))
                      . #14#)
                (LETT |mg| NIL . #14#)
                (SEQ (LETT |e| NIL . #14#) (LETT #5# |v| . #14#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #14#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL (QVELT |e| 1) (QREFELT $ 72)) . #14#)
                      (LETT |s| (QVELT |e| 0) . #14#)
                      (LETT |es|
                            (PROGN
                             (LETT #3# NIL . #14#)
                             (SEQ (LETT |g| NIL . #14#)
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (|LODOF2;make_poly| |s| $)
                                                   |factorizer|)
                                         (QREFELT $ 403))
                                        . #14#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |g| (CAR #2#) . #14#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL (QCAR |g|)
                                                      (QREFELT $ 404))
                                            (QREFELT $ 397))
                                           #3#)
                                          . #14#)))
                                  (LETT #2# (CDR #2#) . #14#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            . #14#)
                      (LETT |ms|
                            (SPADCALL
                             (SPADCALL (ELT $ 105) |es| (QREFELT $ 412))
                             (QREFELT $ 232))
                            . #14#)
                      (LETT |ss|
                            (SPADCALL
                             (SPADCALL (SPADCALL |ms| (QREFELT $ 187))
                                       (QVELT |e| 2) (QREFELT $ 212))
                             (SPADCALL |r| (QREFELT $ 75)) (QREFELT $ 241))
                            . #14#)
                      (EXIT (LETT |mg| (APPEND |mg| (LIST |ss|)) . #14#)))
                     (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS (VECTOR |sg| |v| |mg|) |res|) . #14#)))
               (LETT #7# (CDR #7#) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorFactorizer2;|)) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2| (&REST #1=#:G1209)
  (SPROG NIL
         (PROG (#2=#:G1210)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperatorFactorizer2|)
                                               '|domainEqualList|)
                    . #3=(|LinearOrdinaryDifferentialOperatorFactorizer2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |LinearOrdinaryDifferentialOperatorFactorizer2;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperatorFactorizer2|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperatorFactorizer2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|LinearOrdinaryDifferentialOperatorFactorizer2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$|
                (LIST '|LinearOrdinaryDifferentialOperatorFactorizer2| DV$1
                      DV$2)
                . #1#)
          (LETT $ (GETREFV 413) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|LinearOrdinaryDifferentialOperatorFactorizer2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperatorFactorizer2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|UnivariatePolynomial| 6 11) (|UnivariateTaylorSeries| 11 6 7)
              (0 . |coerce|) (|Expression| 38) (5 . |One|)
              (|UnivariateLaurentSeries| 11 6 7) (9 . |One|)
              (|NonNegativeInteger|) (13 . |univariatePolynomial|)
              (|LinearOrdinaryDifferentialOperator3| 11 9 13) (19 . |Zero|)
              (23 . |Zero|) (27 . |Zero|)
              (|LinearOrdinaryDifferentialOperator3| 11 8 25) (31 . |Zero|)
              (|Boolean|) (35 . ~=) (|Fraction| 8) (41 . |leadingCoefficient|)
              (46 . |denom|) (51 . |coerce|) (56 . |numer|)
              (|Union| $ '"failed") (61 . |recip|) (66 . *) (72 . |degree|)
              (77 . |monomial|) (83 . +) (89 . |reductum|)
              (94 . |leadingCoefficient|) (|Integer|) (99 . |order|) (104 . ~=)
              (110 . |degree|) (115 . |order|) (121 . ~=) (127 . |reductum|)
              (|Record| (|:| |x| 38) (|:| |y| 38)) (|List| 45) (132 . |elt|)
              (138 . >) (144 . <=) (|Fraction| 38) (150 . /) (156 . |Zero|)
              (160 . |denom|) (165 . |coefficient|) (171 . |numer|) (176 . *)
              (182 . |coefficient|) (188 . |monomial|) (194 . +)
              (|Record| (|:| |point| 45) (|:| |slope| 50) (|:| |npoly| 8))
              (|List| 60) |LODOF2;testnp;LodoL;6|
              (|Record| (|:| |factor| 8) (|:| |exponent| 38)) (|List| 63)
              (|Factored| 8) (200 . |factors|) (205 . |Zero|) (209 . ~=)
              (215 . ^) (|OneDimensionalArray| 8) (221 . |setelt!|)
              (228 . |degree|) (233 . |coefficient|) (239 . -) (245 . |coerce|)
              (250 . /) (|IntegerRetractions| 11) (256 . |integer?|) (261 . ~=)
              (267 . |integer|) (272 . |coerce|) (277 . |eval|) (284 . -)
              (290 . =) (296 . >) (302 . |elt|) (308 . *)
              (314 . |setDifference|) (320 . |position|) (326 . |elt|)
              (|List| 17) (|Mapping| 99 95) (|String|)
              |LODOF2;testfn;LodoMSL;8| (|SparseUnivariatePolynomial| 11)
              (332 . |makeSUP|) (337 . |unmakeSUP|) (|Mapping| 8 95)
              (|Factored| 95) (|FactoredFunctions2| 95 8) (342 . |map|)
              (348 . |coerce|) (353 . *) (359 . +) (365 . |min|) (371 . |quo|)
              (377 . =) (|Record| (|:| |Qt| 17) (|:| |Rt| 17))
              |LODOF2;testf2;LodoUpFR;11| (|List| 13) (383 . |elt|)
              (|Record| (|:| |laurl| 110) (|:| |laurr| 110))
              |LODOF2;testll;FLodo2UpFIR;14|
              (|Record| (|:| |k| 38) (|:| |c| 11)) (|Stream| 114) (|List| 115)
              (389 . |elt|) (395 . |series|) (|Stream| 17) (|Mapping| 17 108)
              (|Stream| 108) (|StreamFunctions2| 108 17) (400 . |map|)
              (406 . |retract|) (|Record| (|:| |llc| 116) (|:| |rlc| 116))
              |LODOF2;testlc;FLodo2UpFIR;17| (|SingleInteger|) (411 . |One|)
              (415 . +) (|Mapping| 38 38) (|Stream| 38) (421 . |stream|)
              (427 . -) (433 . *) (|Union| 38 '"failed") (439 . |retractIfCan|)
              (444 . =) (|Mapping| 114 17 38) (|StreamFunctions3| 17 38 114)
              (450 . |map|) (|List| 114) (457 . |coerce|) (462 . |monomial|)
              (468 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (474 . |extendedEuclidean|) (480 . |One|) (484 . ~=)
              (490 . |rem|) (496 . -) (501 . |pi|) (505 . |pi|) (509 . |pi|)
              (513 . *) (519 . -) (524 . *)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 157 '"failed") (530 . |extendedEuclidean|)
              (|PositiveInteger|) (537 . *) (543 . -) (|OutputForm|)
              (549 . |coerce|) (|Void|) (554 . |print|)
              (|Record| (|:| |main| 108) (|:| |nf| 108) (|:| |error| 17))
              |LODOF2;testln;FLodo2UpFIR;20| (559 . |One|) (563 . +)
              (|Record| (|:| |lr| 167) (|:| |n_lifts| 160)) (|Mapping| 171 171)
              (|Stream| 171) (569 . |stream|) (|Mapping| 108 171)
              (|StreamFunctions2| 171 108) (575 . |map|)
              |LODOF2;testlw;FLodo2UpFIS;22| (581 . |extendedEuclidean|)
              (587 . |positiveRemainder|) (593 . |floor|)
              |LODOF2;testcp;LodoFILodo;24| (598 . |ceiling|)
              |LODOF2;testco;LodoFIB;26| |LODOF2;testcx;LodoFUp;28|
              (603 . |leadingCoefficient|) (608 . |coerce|) (613 . |reductum|)
              |LODOF2;testpd;UpLodo;30| (618 . |elt|)
              (|Record| (|:| |ope| 17) (|:| |dext| 160) (|:| |alpha| 11)
                        (|:| |rami| 8))
              (|Union| 17 191) (|List| 192) (624 . |value|) (629 . |coerce|)
              (634 . |retractIfCan|) (639 . ~=) (645 . ~=) (651 . |min|)
              (|Mapping| 38 38 38) (|List| 38) (657 . |reduce|) (663 . <=)
              (669 . |truncate|) (675 . -) (680 . *) (|Symbol|)
              (686 . |variable|) (691 . ^) (697 . -) (702 . *) (708 . +)
              (714 . =) (720 . |rightQuotient|)
              (|SparseUnivariatePolynomial| $) (726 . |zeroOf|)
              (731 . |coerce|) (736 . ^)
              (|Record| (|:| |op| 17) (|:| |ram| 8) (|:| |expart| 13))
              (|Union| 386 193) |LODOF2;testfr;LodoMSU;32| (742 . |coerce|)
              (747 . |coerce|) (752 . ^) (|Union| 8 13)
              |LODOF2;testsb;ULodoLodo;34| (758 . =) (|Mapping| 11 38)
              (764 . |multiplyCoefficients|) (770 . |multiplyExponents|)
              (776 . ^) (782 . |coerce|) (787 . *)
              |LODOF2;testro;LodoEPiLodo;36| |LODOF2;testfo;LodoMSU;38|
              (|Vector| 13) (793 . |setelt!|) (800 . D) (804 . |apply|)
              (811 . *) (817 . /) (823 . /) (|Mapping| 13 13) (829 . |map!|)
              (835 . +) (|Mapping| 15 15) (|Stream| 15) (841 . |stream|)
              (847 . |elt|) (853 . *) (859 . ^) (|Mapping| 114 15)
              (|StreamFunctions2| 15 114) (865 . |map|) (|List| 236)
              (871 . |elt|) (|Union| 262 '"failed") (|Vector| 11)
              (|IntegerLinearDependence| 11) (877 . |particularSolutionOverQ|)
              (883 . =) (|Vector| 50) (889 . |elt|) (|Mapping| 11 11)
              (895 . |map|) (|List| 110) (901 . |elt|) (907 . |setelt!|)
              (|Matrix| 13) (914 . |matrix|) (919 . ~=) (925 . |One|) (929 . /)
              (935 . |One|) (939 . |One|) (|List| 61) (|Mapping| 61 17)
              (|ListFunctions2| 17 61) (943 . |map|) (949 . |elt|) (955 . ~=)
              (961 . /) |LODOF2;testsc;2LodoMB;42| (967 . |retract|)
              (|Union| 287 '"failed") (972 . ~=) (|List| 95) (978 . |elt|)
              (984 . |One|) (988 . |monomial|) (994 . *) (1000 . +)
              (1006 . |One|) (1010 . /) (1016 . /) (1022 . |adjoint|)
              (|LinearOrdinaryDifferentialOperator1| 25)
              (|LODOConvertions| 11 8 25) (1027 . |convert|) (1032 . |Zero|)
              (1036 . ~=) (1042 . |leadingCoefficient|) (1047 . |degree|)
              (|Union| 11 '"infinity") (1052 . =) (1058 . /) (1064 . D)
              (1068 . *) (1074 . -) (1079 . ^) (1085 . +) (1091 . |reductum|)
              (1096 . ~=) (1102 . |rightGcd|) (1108 . |rightQuotient|)
              (1114 . |coerce|) (1119 . *) (1125 . *) (1131 . |leftGcd|)
              (1137 . |leftQuotient|) (|List| 50) (1143 . |elt|) (1149 . *)
              (|Vector| 95) (1155 . |vector|) (|Matrix| 95) (|List| 324)
              (|List| 15) (|VectorHermitePadeSolver|) (1160 . |hp_solve|)
              (1167 . |column|) (1173 . |members|) (1178 . *) (|List| 297)
              (1184 . |elt|) (|Mapping| 99 95 337) (|List| 11)
              |LODOF2;factor;LodoMLL;47| (1190 . |concat|) (1196 . |concat!|)
              (1202 . -) (1207 . |One|) (1211 . |coefficient|) (1217 . /)
              (1223 . |minimumDegree|) (|List| $) (1228 . |lcm|)
              |LODOF2;testis;LodoB;49| (1233 . ~=)
              (|Record| (|:| |point| 304) (|:| |lpf| 17) (|:| |dxt| 160))
              (|Record| (|:| |singularity| 350) (|:| |fos| 386)
                        (|:| |mge| 110))
              (|List| 351) |LODOF2;ge_minimal;LodoMSL;61| (1239 . |setelt!|)
              (1246 . -) (1251 . *) (1257 . |min|) (|Character|) (1261 . |min|)
              (1267 . |min|) (|Mapping| 160 160 160) (|List| 160)
              (1273 . |reduce|) (1279 . |remove|) (1285 . |elt|)
              (|Union| 334 '"failed") (1291 . ~=) (1297 . |adjoint|)
              |LODOF2;testfg;LodoML;51| (1302 . |convert|)
              |LODOF2;testlp;LodoULodo;54| (1307 . |Zero|) (1311 . ^)
              (1317 . *) (1323 . +) (|Kernel| $) (1329 . |minPoly|)
              (|Kernel| 11)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 378)
                                                     378 38
                                                     (|SparseMultivariatePolynomial|
                                                      38 378)
                                                     11)
              (1334 . |univariate|) |LODOF2;testgt;EKE;57| (1341 . |Zero|)
              (1345 . |monomial|) (1351 . +) (1357 . |rest|) (|List| 219)
              (1363 . |rest|) (1369 . +) (|List| 376) (1375 . |kernels|)
              (1380 . |coerce|) (|Union| (|AlgebraicNumber|) '"failed")
              (1385 . |retractIfCan|) (1390 . |denominator|) (1395 . |eval|)
              (1402 . |degree|) (1407 . |retract|) (|Union| 50 '"-infinity")
              (1412 . =) (1418 . |max|)
              (|Record| (|:| |factor| 95) (|:| |exponent| 38)) (|List| 401)
              (1424 . |factors|) (1429 . |rootOf|)
              (|Record| (|:| |ecs| 110) (|:| |ecr| 8) (|:| |ect| 25))
              (|List| 405) |LODOF2;gen_exp;LodoUMLL;60| (|List| 8)
              (|CylindricalAlgebraicDecompositionUtilities| 11 8)
              (1434 . |squareFreeBasis|) (|Mapping| 50 50 50)
              (1439 . |reduce|))
           '#(|testsc| 1445 |testsb| 1452 |testro| 1458 |testpd| 1465 |testnp|
              1470 |testlw| 1475 |testlp| 1485 |testln| 1491 |testll| 1501
              |testlc| 1511 |testis| 1521 |testgt| 1526 |testfr| 1532 |testfo|
              1539 |testfn| 1546 |testfg| 1553 |testf2| 1559 |testcx| 1566
              |testcp| 1572 |testco| 1579 |gen_exp| 1586 |ge_minimal| 1594
              |factor| 1601)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 412
                                                 '(1 9 0 8 10 0 11 0 12 0 13 0
                                                   14 2 9 8 0 15 16 0 17 0 18 0
                                                   11 0 19 0 13 0 20 0 21 0 22
                                                   2 21 23 0 0 24 1 21 25 0 26
                                                   1 25 8 0 27 1 13 0 9 28 1 25
                                                   8 0 29 1 13 30 0 31 2 13 0 9
                                                   0 32 1 21 15 0 33 2 17 0 13
                                                   15 34 2 17 0 0 0 35 1 21 0 0
                                                   36 1 17 13 0 37 1 13 38 0 39
                                                   2 17 23 0 0 40 1 17 15 0 41
                                                   2 13 38 0 38 42 2 15 23 0 0
                                                   43 1 17 0 0 44 2 46 45 0 38
                                                   47 2 15 23 0 0 48 2 38 23 0
                                                   0 49 2 50 0 38 38 51 0 8 0
                                                   52 1 50 38 0 53 2 17 13 0 15
                                                   54 1 50 38 0 55 2 38 0 15 0
                                                   56 2 13 11 0 38 57 2 8 0 11
                                                   15 58 2 8 0 0 0 59 1 65 64 0
                                                   66 0 50 0 67 2 50 23 0 0 68
                                                   2 8 0 0 15 69 3 70 8 0 38 8
                                                   71 1 8 15 0 72 2 8 11 0 15
                                                   73 2 11 0 0 0 74 1 11 0 38
                                                   75 2 11 0 0 0 76 1 77 23 11
                                                   78 2 11 23 0 0 79 1 77 38 11
                                                   80 1 8 0 38 81 3 8 0 0 0 0
                                                   82 2 8 0 0 0 83 2 8 23 0 0
                                                   84 2 38 23 0 0 85 2 70 8 0
                                                   38 86 2 8 0 0 0 87 2 64 0 0
                                                   0 88 2 64 38 63 0 89 2 64 63
                                                   0 38 90 1 8 95 0 96 1 8 0 95
                                                   97 2 100 65 98 99 101 1 50 0
                                                   38 102 2 50 0 38 0 103 2 50
                                                   0 0 0 104 2 50 0 0 0 105 2 8
                                                   0 0 0 106 2 50 23 0 0 107 2
                                                   110 13 0 38 111 2 116 115 0
                                                   38 117 1 13 0 115 118 2 122
                                                   119 120 121 123 1 50 38 0
                                                   124 0 127 0 128 2 38 0 0 0
                                                   129 2 131 0 130 38 132 2 38
                                                   0 0 0 133 2 38 0 38 0 134 1
                                                   50 135 0 136 2 135 23 0 0
                                                   137 3 139 115 138 119 131
                                                   140 1 115 0 141 142 2 13 0
                                                   11 38 143 2 17 0 0 13 144 2
                                                   8 145 0 0 146 0 8 0 147 2 8
                                                   23 0 0 148 2 8 0 0 0 149 1 8
                                                   0 0 150 0 11 0 151 0 13 0
                                                   152 0 9 0 153 2 17 0 13 0
                                                   154 1 17 0 0 155 2 17 0 0 0
                                                   156 3 8 158 0 0 0 159 2 38 0
                                                   160 0 161 2 17 0 0 0 162 1
                                                   17 163 0 164 1 163 165 0 166
                                                   0 160 0 169 2 160 0 0 0 170
                                                   2 173 0 172 171 174 2 176
                                                   121 175 173 177 2 38 145 0 0
                                                   179 2 38 0 0 0 180 1 50 38 0
                                                   181 1 50 38 0 183 1 8 11 0
                                                   186 1 13 0 11 187 1 8 0 0
                                                   188 2 61 60 0 38 190 1 193
                                                   192 0 194 1 17 0 13 195 1 8
                                                   135 0 196 2 135 23 0 0 197 2
                                                   38 23 0 0 198 2 38 0 0 0 199
                                                   2 201 38 200 0 202 2 15 23 0
                                                   0 203 2 13 0 0 38 204 1 13 0
                                                   0 205 2 13 0 11 0 206 1 13
                                                   207 0 208 2 13 0 0 38 209 1
                                                   11 0 0 210 2 11 0 38 0 211 2
                                                   13 0 0 0 212 2 17 23 0 0 213
                                                   2 17 0 0 0 214 1 11 0 215
                                                   216 1 8 0 11 217 2 11 0 0 38
                                                   218 1 25 0 8 222 1 21 0 25
                                                   223 2 17 0 0 15 224 2 11 23
                                                   0 0 227 2 13 0 228 0 229 2
                                                   13 0 0 160 230 2 50 0 0 38
                                                   231 1 11 0 50 232 2 17 0 15
                                                   0 233 3 236 13 0 38 13 237 0
                                                   17 0 238 3 17 13 0 13 13 239
                                                   2 13 0 0 0 240 2 13 0 0 11
                                                   241 2 13 0 0 0 242 2 236 0
                                                   243 0 244 2 15 0 0 0 245 2
                                                   247 0 246 15 248 2 236 13 0
                                                   38 249 2 15 0 15 0 250 2 11
                                                   0 0 15 251 2 253 115 252 247
                                                   254 2 255 236 0 38 256 2 259
                                                   257 258 11 260 2 257 23 0 0
                                                   261 2 262 50 0 38 263 2 13 0
                                                   264 0 265 2 266 110 0 38 267
                                                   3 110 13 0 38 13 268 1 269 0
                                                   266 270 2 13 23 0 0 271 0 17
                                                   0 272 2 17 0 0 13 273 0 50 0
                                                   274 0 9 0 275 2 278 276 277
                                                   91 279 2 276 61 0 38 280 2
                                                   61 23 0 0 281 2 8 0 0 11 282
                                                   1 13 9 0 284 2 285 23 0 0
                                                   286 2 287 95 0 38 288 0 25 0
                                                   289 2 21 0 25 15 290 2 21 0
                                                   25 0 291 2 21 0 0 0 292 0 21
                                                   0 293 2 21 0 0 25 294 2 25 0
                                                   0 0 295 1 21 0 0 296 1 298
                                                   297 21 299 0 297 0 300 2 297
                                                   23 0 0 301 1 297 25 0 302 1
                                                   297 15 0 303 2 304 23 0 0
                                                   305 2 25 0 8 8 306 0 297 0
                                                   307 2 297 0 25 0 308 1 297 0
                                                   0 309 2 297 0 0 15 310 2 297
                                                   0 0 0 311 1 297 0 0 312 2 93
                                                   23 0 0 313 2 297 0 0 0 314 2
                                                   297 0 0 0 315 1 297 0 25 316
                                                   2 297 0 0 25 317 2 297 0 0 0
                                                   318 2 297 0 0 0 319 2 297 0
                                                   0 0 320 2 321 50 0 38 322 2
                                                   127 0 38 0 323 1 324 0 287
                                                   325 3 329 326 327 328 15 330
                                                   2 326 324 0 38 331 1 324 287
                                                   0 332 2 50 0 0 38 333 2 334
                                                   297 0 38 335 2 334 0 0 0 339
                                                   2 334 0 0 0 340 1 25 0 0 341
                                                   0 297 0 342 2 297 25 0 15
                                                   343 2 297 0 0 25 344 1 297
                                                   15 0 345 1 8 0 346 347 2 25
                                                   23 0 0 349 3 321 50 0 38 50
                                                   354 1 50 0 0 355 2 50 0 15 0
                                                   356 0 127 0 357 2 358 0 0 0
                                                   359 2 160 0 0 0 360 2 362
                                                   160 361 0 363 2 352 0 351 0
                                                   364 2 193 192 0 38 365 2 366
                                                   23 0 0 367 1 17 0 0 368 1
                                                   298 21 297 370 0 25 0 372 2
                                                   25 0 0 15 373 2 25 0 8 0 374
                                                   2 25 0 0 0 375 1 11 215 376
                                                   377 3 379 95 11 378 95 380 0
                                                   95 0 382 2 95 0 11 15 383 2
                                                   95 0 0 0 384 2 110 0 0 15
                                                   385 2 386 0 0 15 387 2 11 0
                                                   0 0 388 1 11 389 0 390 1 11
                                                   0 376 391 1 11 392 0 393 1
                                                   11 0 0 394 3 11 0 0 376 0
                                                   395 1 95 15 0 396 1 11 50 0
                                                   397 2 398 23 0 0 399 2 50 0
                                                   0 0 400 1 99 402 0 403 1 11
                                                   0 215 404 1 409 408 408 410
                                                   2 321 50 411 0 412 3 0 23 21
                                                   21 92 283 2 0 17 225 21 226
                                                   3 0 17 21 11 160 234 1 0 17
                                                   8 189 1 0 61 21 62 6 0 121
                                                   50 21 8 8 50 38 178 2 0 17
                                                   297 304 371 6 0 167 50 21 8
                                                   8 50 38 168 6 0 112 50 21 8
                                                   8 50 38 113 6 0 125 50 21 8
                                                   8 50 38 126 1 0 23 297 348 2
                                                   0 11 11 378 381 3 0 220 21
                                                   92 93 221 3 0 220 21 92 93
                                                   235 3 0 91 21 92 93 94 2 0
                                                   334 297 92 369 3 0 108 21 8
                                                   50 109 2 0 8 21 50 185 3 0
                                                   17 21 50 38 182 3 0 23 21 50
                                                   38 184 4 0 406 297 304 336
                                                   337 407 3 0 352 297 92 93
                                                   353 3 0 334 297 336 337
                                                   338)))))
           '|lookupComplete|)) 
