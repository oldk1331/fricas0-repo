
(SDEFUN |GOSPER;deg0|
        ((|p| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|v| V) ($ |Integer|))
        (COND ((SPADCALL |p| (QREFELT $ 13)) -1)
              ('T (SPADCALL |p| |v| (QREFELT $ 17))))) 

(SDEFUN |GOSPER;rat?| ((|x| R) ($ |Boolean|))
        (QEQCAR
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 19))
                   (QREFELT $ 21))
         0)) 

(SDEFUN |GOSPER;RFQ2R|
        ((|f| |Fraction|
          (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         ($ Q))
        (SPADCALL (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT $ 23)) $)
                  (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT $ 24)) $)
                  (QREFELT $ 25))) 

(SDEFUN |GOSPER;PQ2R|
        ((|p| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V) ($ Q))
        (SPADCALL (CONS #'|GOSPER;PQ2R!0| $) (ELT $ 28) |p| (QREFELT $ 32))) 

(SDEFUN |GOSPER;PQ2R!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 19))) 

(SDEFUN |GOSPER;GospersMethod;QVMU;5|
        ((|aquo| Q) (|n| V) (|newV| |Mapping| V) ($ |Union| Q "failed"))
        (SPROG
         ((#1=#:G132 NIL)
          (|u|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed"))
          (|q|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |q| (|GOSPER;RF2QIfCan| |aquo| $)
                   . #2=(|GOSPER;GospersMethod;QVMU;5|))
             (EXIT
              (COND
               ((QEQCAR |q| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G126)))
               ('T
                (SEQ
                 (LETT |u|
                       (|GOSPER;InnerGospersMethod| (QCDR |q|) |n| |newV| $)
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#))))))))))
            (EXIT (CONS 0 (|GOSPER;RFQ2R| (QCDR |u|) $)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GOSPER;RF2QIfCan|
        ((|f| Q)
         ($ |Union|
          (|Fraction|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          "failed"))
        (SPROG
         ((|d|
           #1=(|Union|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
               "failed"))
          (|n| #1#))
         (SEQ
          (LETT |n| (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT $ 36)) $)
                . #2=(|GOSPER;RF2QIfCan|))
          (EXIT
           (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                 (#3='T
                  (SEQ
                   (LETT |d|
                         (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT $ 37)) $)
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                          (#3#
                           (CONS 0
                                 (SPADCALL (QCDR |n|) (QCDR |d|)
                                           (QREFELT $ 38))))))))))))) 

(SDEFUN |GOSPER;UP2QIfCan|
        ((|p| P)
         ($ |Union| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
          "failed"))
        (COND
         ((SPADCALL (CONS (|function| |GOSPER;rat?|) $)
                    (SPADCALL |p| (QREFELT $ 40)) (QREFELT $ 42))
          (CONS 0
                (SPADCALL (ELT $ 43) (CONS #'|GOSPER;UP2QIfCan!0| $) |p|
                          (QREFELT $ 48))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |GOSPER;UP2QIfCan!0| ((|y| NIL) ($ NIL))
        (SPROG ((#1=#:G147 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| (QREFELT $ 18))
                                     (QREFELT $ 19))
                           (QREFELT $ 21))
                          NIL)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Fraction| (|Integer|))
                                  (|Union| (|Fraction| (|Integer|)) "failed")
                                  #1#))
                (QREFELT $ 44)))) 

(SDEFUN |GOSPER;InnerGospersMethod|
        ((|aquo| |Fraction|
          (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|n| V) (|newV| |Mapping| V)
         ($ |Union|
          (|Fraction|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          "failed"))
        (SPROG
         ((|qn1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|fn|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|ufn|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed"))
          (|k| (|Integer|))
          (|rn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|pqr|
           (|List|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|anm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|an| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (SEQ
          (LETT |an| (SPADCALL |aquo| (QREFELT $ 23))
                . #1=(|GOSPER;InnerGospersMethod|))
          (LETT |anm1| (SPADCALL |aquo| (QREFELT $ 24)) . #1#)
          (LETT |pqr| (|GOSPER;GosperPQR| |an| |anm1| |n| |newV| $) . #1#)
          (LETT |pn| (|SPADfirst| |pqr|) . #1#)
          (LETT |qn| (SPADCALL |pqr| (QREFELT $ 50)) . #1#)
          (LETT |rn| (SPADCALL |pqr| (QREFELT $ 51)) . #1#)
          (LETT |k| (|GOSPER;GosperDegBd| |pn| |qn| |rn| |n| |newV| $) . #1#)
          (EXIT
           (COND ((< |k| 0) (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |ufn|
                         (|GOSPER;GosperF| |k| |pn| |qn| |rn| |n| |newV| $)
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |ufn| 1) (CONS 1 "failed"))
                          (#2#
                           (SEQ (LETT |fn| (QCDR |ufn|) . #1#)
                                (LETT |qn1|
                                      (SPADCALL |qn| |n|
                                                (SPADCALL
                                                 (SPADCALL |n| (QREFELT $ 43))
                                                 (|spadConstant| $ 54)
                                                 (QREFELT $ 55))
                                                (QREFELT $ 56))
                                      . #1#)
                                (EXIT
                                 (CONS 0
                                       (SPADCALL
                                        (SPADCALL |qn1| |pn| (QREFELT $ 38))
                                        |fn| (QREFELT $ 57))))))))))))))) 

(SDEFUN |GOSPER;GosperF|
        ((|k| |Integer|)
         (|pn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|qn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|rn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|n| V) (|newV| |Mapping| V)
         ($ |Union|
          (|Fraction|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          "failed"))
        (SPROG
         ((#1=#:G174 NIL)
          (#2=#:G173
           #3=(|Fraction|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (#4=#:G175 #3#) (#5=#:G180 NIL) (|i| NIL)
          (|vec|
           (|Vector|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
          (|soln|
           (|Union|
            (|Vector|
             (|Fraction|
              (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
            "failed"))
          (|mz|
           #6=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|dmz| #7=(|NonNegativeInteger|))
          (|cmz|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|zron| #6#) (|dz| #7#)
          (|cz| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|mat|
           (|Matrix|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
          (#8=#:G165 NIL)
          (|zro| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qnplus1|
           #9=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|fnminus1| #9#)
          (|fn|
           #10=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#11=#:G163 NIL) (#12=#:G162 #10#) (#13=#:G164 #10#) (#14=#:G179 NIL)
          (|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|mp| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|mv| (V)))
         (SEQ (LETT |mv| (SPADCALL |newV|) . #15=(|GOSPER;GosperF|))
              (LETT |mp| (SPADCALL |mv| (QREFELT $ 43)) . #15#)
              (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #15#)
              (LETT |fn|
                    (PROGN
                     (LETT #11# NIL . #15#)
                     (SEQ (LETT |i| 0 . #15#) (LETT #14# |k| . #15#) G190
                          (COND ((|greater_SI| |i| #14#) (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #13#
                                   (SPADCALL
                                    (SPADCALL |mp| (+ |i| 1) (QREFELT $ 58))
                                    (SPADCALL |np| |i| (QREFELT $ 58))
                                    (QREFELT $ 59))
                                   . #15#)
                             (COND
                              (#11#
                               (LETT #12# (SPADCALL #12# #13# (QREFELT $ 55))
                                     . #15#))
                              ('T
                               (PROGN
                                (LETT #12# #13# . #15#)
                                (LETT #11# 'T . #15#)))))))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#11# #12#) (#16='T (|spadConstant| $ 60))))
                    . #15#)
              (LETT |fnminus1|
                    (SPADCALL |fn| |n|
                              (SPADCALL |np| (|spadConstant| $ 54)
                                        (QREFELT $ 61))
                              (QREFELT $ 56))
                    . #15#)
              (LETT |qnplus1|
                    (SPADCALL |qn| |n|
                              (SPADCALL |np| (|spadConstant| $ 54)
                                        (QREFELT $ 55))
                              (QREFELT $ 56))
                    . #15#)
              (LETT |zro|
                    (SPADCALL
                     (SPADCALL (SPADCALL |qnplus1| |fn| (QREFELT $ 59))
                               (SPADCALL |rn| |fnminus1| (QREFELT $ 59))
                               (QREFELT $ 61))
                     |pn| (QREFELT $ 61))
                    . #15#)
              (LETT |zron| (SPADCALL |zro| |n| (QREFELT $ 63)) . #15#)
              (LETT |dz| (SPADCALL |zron| (QREFELT $ 65)) . #15#)
              (LETT |mat|
                    (SPADCALL (+ |dz| 1)
                              (PROG1 (LETT #8# (+ |k| 1) . #15#)
                                (|check_subtype2| (>= #8# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #8#))
                              (QREFELT $ 67))
                    . #15#)
              (LETT |vec| (MAKEARR1 (+ |dz| 1) (|spadConstant| $ 68)) . #15#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |zron| (|spadConstant| $ 69) (QREFELT $ 70)))
                     (GO G191)))
                   (SEQ (LETT |cz| (SPADCALL |zron| (QREFELT $ 71)) . #15#)
                        (LETT |dz| (SPADCALL |zron| (QREFELT $ 65)) . #15#)
                        (LETT |zron| (SPADCALL |zron| (QREFELT $ 72)) . #15#)
                        (LETT |mz| (SPADCALL |cz| |mv| (QREFELT $ 63)) . #15#)
                        (EXIT
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |mz| (|spadConstant| $ 69)
                                           (QREFELT $ 70)))
                                (GO G191)))
                              (SEQ
                               (LETT |cmz|
                                     (SPADCALL (SPADCALL |mz| (QREFELT $ 71))
                                               (QREFELT $ 73))
                                     . #15#)
                               (LETT |dmz| (SPADCALL |mz| (QREFELT $ 65))
                                     . #15#)
                               (LETT |mz| (SPADCALL |mz| (QREFELT $ 72))
                                     . #15#)
                               (EXIT
                                (COND
                                 ((EQL |dmz| 0)
                                  (SPADCALL |vec|
                                            (+ |dz|
                                               (SPADCALL |vec| (QREFELT $ 76)))
                                            (SPADCALL |cmz| (QREFELT $ 77))
                                            (QREFELT $ 78)))
                                 ('T
                                  (QSETAREF2O |mat| (+ |dz| (PROGN |mat| 1))
                                              (- (+ |dmz| (PROGN |mat| 1)) 1)
                                              |cmz| 1 1)))))
                              NIL (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |soln| (SPADCALL |mat| |vec| (QREFELT $ 81)) . #15#)
              (EXIT
               (COND ((QEQCAR |soln| 1) (CONS 1 "failed"))
                     (#16#
                      (SEQ (LETT |vec| (QCDR |soln|) . #15#)
                           (EXIT
                            (CONS 0
                                  (PROGN
                                   (LETT #1# NIL . #15#)
                                   (SEQ (LETT |i| 0 . #15#)
                                        (LETT #5# |k| . #15#) G190
                                        (COND
                                         ((|greater_SI| |i| #5#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #4#
                                                 (SPADCALL
                                                  (SPADCALL |np| |i|
                                                            (QREFELT $ 58))
                                                  (SPADCALL |vec|
                                                            (+ |i|
                                                               (SPADCALL |vec|
                                                                         (QREFELT
                                                                          $
                                                                          76)))
                                                            (QREFELT $ 82))
                                                  (QREFELT $ 83))
                                                 . #15#)
                                           (COND
                                            (#1#
                                             (LETT #2#
                                                   (SPADCALL #2# #4#
                                                             (QREFELT $ 84))
                                                   . #15#))
                                            ('T
                                             (PROGN
                                              (LETT #2# #4# . #15#)
                                              (LETT #1# 'T . #15#)))))))
                                        (LETT |i| (|inc_SI| |i|) . #15#)
                                        (GO G190) G191 (EXIT NIL))
                                   (COND (#1# #2#)
                                         (#16# (|spadConstant| $ 68))))))))))))) 

(SDEFUN |GOSPER;GosperPQR|
        ((|an|
          . #1=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|anm1|
          . #2=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|n| V) (|newV| |Mapping| V)
         ($ |List|
          (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
        (SPROG
         ((|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#3=#:G193 NIL)
          (#4=#:G192
           #5=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#6=#:G194 #5#) (#7=#:G202 NIL) (|i| NIL) (|rn| #2#) (#8=#:G187 NIL)
          (|qn| #1#)
          (|gn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|rtp| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#9=#:G201 NIL) (|rt| (|Union| (|Integer|) #10="failed"))
          (|js| (|List| (|Integer|))) (#11=#:G183 NIL) (#12=#:G200 NIL)
          (|fe| NIL) (#13=#:G199 NIL)
          (|fres|
           (|Factored|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|res| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|rnj| #5#) (|j| (V))
          (|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (SEQ
          (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #14=(|GOSPER;GosperPQR|))
          (LETT |pn| (|spadConstant| $ 54) . #14#) (LETT |qn| |an| . #14#)
          (LETT |rn| |anm1| . #14#) (LETT |j| (SPADCALL |newV|) . #14#)
          (LETT |rnj|
                (SPADCALL |rn| |n|
                          (SPADCALL |np| (SPADCALL |j| (QREFELT $ 43))
                                    (QREFELT $ 55))
                          (QREFELT $ 56))
                . #14#)
          (LETT |res| (SPADCALL |qn| |rnj| |n| (QREFELT $ 85)) . #14#)
          (LETT |fres| (SPADCALL |res| (QREFELT $ 88)) . #14#)
          (LETT |js|
                (PROGN
                 (LETT #13# NIL . #14#)
                 (SEQ (LETT |fe| NIL . #14#)
                      (LETT #12# (SPADCALL |fres| (QREFELT $ 92)) . #14#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |fe| (CAR #12#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((QEQCAR
                           (LETT |rt|
                                 (|GOSPER;linearAndNNIntRoot| (QVELT |fe| 1)
                                  |j| $)
                                 . #14#)
                           0)
                          (LETT #13#
                                (CONS
                                 (PROG2 (LETT #11# |rt| . #14#)
                                     (QCDR #11#)
                                   (|check_union2| (QEQCAR #11# 0) (|Integer|)
                                                   (|Union| (|Integer|) #10#)
                                                   #11#))
                                 #13#)
                                . #14#)))))
                      (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (SEQ (LETT |rt| NIL . #14#) (LETT #9# |js| . #14#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |rt| (CAR #9#) . #14#) NIL))
                 (GO G191)))
               (SEQ (LETT |rtp| (SPADCALL |rt| (QREFELT $ 93)) . #14#)
                    (LETT |gn|
                          (SPADCALL |qn|
                                    (SPADCALL |rn| |n|
                                              (SPADCALL |np| |rtp|
                                                        (QREFELT $ 55))
                                              (QREFELT $ 56))
                                    (QREFELT $ 94))
                          . #14#)
                    (LETT |qn|
                          (PROG2
                              (LETT #8# (SPADCALL |qn| |gn| (QREFELT $ 96))
                                    . #14#)
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 0)
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Integer|))
                                             (QREFELT $ 7))
                                            (|Union|
                                             (|SparseMultivariatePolynomial|
                                              (|Fraction| (|Integer|))
                                              (QREFELT $ 7))
                                             #15="failed")
                                            #8#))
                          . #14#)
                    (LETT |rn|
                          (PROG2
                              (LETT #8#
                                    (SPADCALL |rn|
                                              (SPADCALL |gn| |n|
                                                        (SPADCALL |np| |rtp|
                                                                  (QREFELT $
                                                                           61))
                                                        (QREFELT $ 56))
                                              (QREFELT $ 96))
                                    . #14#)
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 0)
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Integer|))
                                             (QREFELT $ 7))
                                            (|Union|
                                             (|SparseMultivariatePolynomial|
                                              (|Fraction| (|Integer|))
                                              (QREFELT $ 7))
                                             #15#)
                                            #8#))
                          . #14#)
                    (EXIT
                     (LETT |pn|
                           (SPADCALL |pn|
                                     (PROGN
                                      (LETT #3# NIL . #14#)
                                      (SEQ (LETT |i| 0 . #14#)
                                           (LETT #7# (- |rt| 1) . #14#) G190
                                           (COND
                                            ((|greater_SI| |i| #7#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #6#
                                                    (SPADCALL |gn| |n|
                                                              (SPADCALL |np|
                                                                        (SPADCALL
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          93))
                                                                        (QREFELT
                                                                         $ 61))
                                                              (QREFELT $ 56))
                                                    . #14#)
                                              (COND
                                               (#3#
                                                (LETT #4#
                                                      (SPADCALL #4# #6#
                                                                (QREFELT $ 59))
                                                      . #14#))
                                               ('T
                                                (PROGN
                                                 (LETT #4# #6# . #14#)
                                                 (LETT #3# 'T . #14#)))))))
                                           (LETT |i| (|inc_SI| |i|) . #14#)
                                           (GO G190) G191 (EXIT NIL))
                                      (COND (#3# #4#)
                                            ('T (|spadConstant| $ 54))))
                                     (QREFELT $ 59))
                           . #14#)))
               (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |pn| |qn| |rn|))))) 

(SDEFUN |GOSPER;GosperDegBd|
        ((|pn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|qn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|rn| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|n| V) (|newV| |Mapping| V) ($ |Integer|))
        (SPROG
         ((|k0| (|Union| (|Integer|) "failed")) (#1=#:G204 NIL)
          (|lcpk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|pk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|headfnm1|
           #2=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|headfn| #2#)
          (|nk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|nkm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|ckm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|ck| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|kk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|k| (|Integer|)) (|degp| #3=(|Integer|)) (|lminus| #3#)
          (|lplus| #3#)
          (|qnplus1|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (SEQ
          (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #4=(|GOSPER;GosperDegBd|))
          (LETT |qnplus1|
                (SPADCALL |qn| |n|
                          (SPADCALL |np| (|spadConstant| $ 54) (QREFELT $ 55))
                          (QREFELT $ 56))
                . #4#)
          (LETT |lplus|
                (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT $ 55)) |n| $)
                . #4#)
          (LETT |lminus|
                (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT $ 61)) |n| $)
                . #4#)
          (LETT |degp| (|GOSPER;deg0| |pn| |n| $) . #4#)
          (LETT |k| (- |degp| (MAX (- |lplus| 1) |lminus|)) . #4#)
          (EXIT
           (COND ((SPADCALL |lplus| |lminus| (QREFELT $ 97)) |k|)
                 (#5='T
                  (SEQ
                   (LETT |kk| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #4#)
                   (LETT |ck| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #4#)
                   (LETT |ckm1| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #4#)
                   (LETT |nkm1| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #4#)
                   (LETT |nk| (SPADCALL |np| |nkm1| (QREFELT $ 59)) . #4#)
                   (LETT |headfn|
                         (SPADCALL (SPADCALL |ck| |nk| (QREFELT $ 59))
                                   (SPADCALL |ckm1| |nkm1| (QREFELT $ 59))
                                   (QREFELT $ 55))
                         . #4#)
                   (LETT |headfnm1|
                         (SPADCALL (SPADCALL |ck| |nk| (QREFELT $ 59))
                                   (SPADCALL
                                    (SPADCALL |ckm1|
                                              (SPADCALL |kk| |ck|
                                                        (QREFELT $ 59))
                                              (QREFELT $ 61))
                                    |nkm1| (QREFELT $ 59))
                                   (QREFELT $ 55))
                         . #4#)
                   (LETT |pk|
                         (SPADCALL (SPADCALL |qnplus1| |headfn| (QREFELT $ 59))
                                   (SPADCALL |rn| |headfnm1| (QREFELT $ 59))
                                   (QREFELT $ 61))
                         . #4#)
                   (LETT |lcpk|
                         (|GOSPER;pCoef| |pk|
                          (SPADCALL (SPADCALL |ck| |np| (QREFELT $ 59)) |nkm1|
                                    (QREFELT $ 59))
                          $)
                         . #4#)
                   (LETT |k0|
                         (|GOSPER;linearAndNNIntRoot| |lcpk|
                          (PROG2
                              (LETT #1# (SPADCALL |kk| (QREFELT $ 99)) . #4#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                            (|Union| (QREFELT $ 7) "failed")
                                            #1#))
                          $)
                         . #4#)
                   (EXIT
                    (COND ((QEQCAR |k0| 1) |k|)
                          (#5# (MAX (QCDR |k0|) |k|))))))))))) 

(SDEFUN |GOSPER;pCoef|
        ((|p| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|nom| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         ($ |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
        (SPROG
         ((|up|
           #1=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|pow| (|NonNegativeInteger|)) (|unom| #1#) (#2=#:G217 NIL) (|v| NIL)
          (|vlist| (|List| V)))
         (SEQ
          (COND
           ((NULL (SPADCALL |nom| (QREFELT $ 100)))
            (|error| "pCoef requires a monomial 2nd arg"))
           ('T
            (SEQ
             (LETT |vlist| (SPADCALL |nom| (QREFELT $ 102))
                   . #3=(|GOSPER;pCoef|))
             (SEQ (LETT |v| NIL . #3#) (LETT #2# |vlist| . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL)
                        (NULL
                         (SPADCALL |p| (|spadConstant| $ 60) (QREFELT $ 103))))
                    (GO G191)))
                  (SEQ (LETT |unom| (SPADCALL |nom| |v| (QREFELT $ 63)) . #3#)
                       (LETT |pow| (SPADCALL |unom| (QREFELT $ 65)) . #3#)
                       (LETT |nom| (SPADCALL |unom| (QREFELT $ 71)) . #3#)
                       (LETT |up| (SPADCALL |p| |v| (QREFELT $ 63)) . #3#)
                       (EXIT
                        (LETT |p| (SPADCALL |up| |pow| (QREFELT $ 104))
                              . #3#)))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |p|))))))) 

(SDEFUN |GOSPER;linearAndNNIntRoot|
        ((|mp| |SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
         (|v| V) ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|rt| (|Fraction| (|Integer|))) (#1=#:G230 NIL)
          (|p0| #2=(|Union| (|Fraction| (|Integer|)) "failed")) (|p1| #2#)
          (|p|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
         (SEQ
          (LETT |p| (SPADCALL |mp| |v| (QREFELT $ 63))
                . #3=(|GOSPER;linearAndNNIntRoot|))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |p| (QREFELT $ 65)) 1 (QREFELT $ 105))
             (CONS 1 "failed"))
            (#4='T
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |p1|
                       (SPADCALL (SPADCALL |p| 1 (QREFELT $ 104))
                                 (QREFELT $ 106))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |p1| 1)
                    (PROGN
                     (LETT #1# (CONS 1 #5="failed") . #3#)
                     (GO #6=#:G227)))
                   (#4#
                    (SEQ
                     (LETT |p0|
                           (SPADCALL (SPADCALL |p| 0 (QREFELT $ 104))
                                     (QREFELT $ 106))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |p0| 1)
                        (PROGN (LETT #1# (CONS 1 #5#) . #3#) (GO #6#))))))))))
                (LETT |rt|
                      (SPADCALL
                       (SPADCALL (QCDR |p0|) (QCDR |p1|) (QREFELT $ 107))
                       (QREFELT $ 108))
                      . #3#)
                (COND
                 ((OR (SPADCALL |rt| (|spadConstant| $ 109) (QREFELT $ 110))
                      (SPADCALL (SPADCALL |rt| (QREFELT $ 111)) 1
                                (QREFELT $ 105)))
                  (EXIT (CONS 1 "failed"))))
                (EXIT (CONS 0 (SPADCALL |rt| (QREFELT $ 112))))))
              #6# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |GosperSummationMethod;|)) 

(DEFUN |GosperSummationMethod| (&REST #1=#:G231)
  (SPROG NIL
         (PROG (#2=#:G232)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GosperSummationMethod|)
                                               '|domainEqualList|)
                    . #3=(|GosperSummationMethod|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GosperSummationMethod;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GosperSummationMethod|)))))))))) 

(DEFUN |GosperSummationMethod;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GosperSummationMethod|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|GosperSummationMethod| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 113) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|GosperSummationMethod|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|GosperSummationMethod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (|SparseMultivariatePolynomial| 27 7) (0 . |zero?|) (5 . |One|)
              (9 . |One|) (|NonNegativeInteger|) (13 . |degree|)
              (19 . |coerce|) (24 . |coerce|) (|Union| 27 '"failed")
              (29 . |retractIfCan|) (|Fraction| 12) (34 . |numer|)
              (39 . |denom|) (44 . /) (50 . |coerce|) (|Fraction| 74)
              (55 . |coerce|) (|Mapping| 10 7) (|Mapping| 10 27)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 27 12 10)
              (60 . |map|) (|Union| 10 '"failed") (|Mapping| 7)
              |GOSPER;GospersMethod;QVMU;5| (67 . |numer|) (72 . |denom|)
              (77 . /) (|List| 8) (83 . |coefficients|) (|Mapping| 11 8)
              (88 . |every?|) (94 . |coerce|) (99 . |coerce|) (|Mapping| 12 7)
              (|Mapping| 12 8) (|PolynomialCategoryLifting| 6 7 8 9 12)
              (104 . |map|) (|List| 12) (111 . |second|) (116 . |third|)
              (121 . |Zero|) (125 . |Zero|) (129 . |One|) (133 . +)
              (139 . |eval|) (146 . *) (152 . ^) (158 . *) (164 . |Zero|)
              (168 . -) (|SparseUnivariatePolynomial| $) (174 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (180 . |degree|) (|Matrix| 22)
              (185 . |zero|) (191 . |Zero|) (195 . |Zero|) (199 . ~=)
              (205 . |leadingCoefficient|) (210 . |reductum|) (215 . |coerce|)
              (|Integer|) (|Vector| 22) (220 . |minIndex|) (225 . -)
              (230 . |setelt!|) (|Union| 75 '"failed")
              (|LinearSystemMatrixPackage| 22 75 75 66)
              (237 . |particularSolution|) (243 . |elt|) (249 . *) (255 . +)
              (261 . |resultant|) (|Factored| 12)
              (|MRationalFactorize| (|IndexedExponents| 7) 7 74 12)
              (268 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 89) (|:| |factor| 12) (|:| |exponent| 16))
              (|List| 90) (273 . |factorList|) (278 . |coerce|) (283 . |gcd|)
              (|Union| $ '"failed") (289 . |exquo|) (295 . <=)
              (|Union| 7 '"failed") (301 . |mainVariable|) (306 . |monomial?|)
              (|List| 7) (311 . |variables|) (316 . ~=) (322 . |coefficient|)
              (328 . ~=) (334 . |retractIfCan|) (339 . /) (345 . -)
              (350 . |Zero|) (354 . <) (360 . |denom|) (365 . |numer|))
           '#(|GospersMethod| 370) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 112
                                                 '(1 12 11 0 13 0 8 0 14 0 9 0
                                                   15 2 12 16 0 7 17 1 9 0 8 18
                                                   1 10 0 9 19 1 10 20 0 21 1
                                                   22 12 0 23 1 22 12 0 24 2 10
                                                   0 0 0 25 1 9 0 7 26 1 10 0
                                                   27 28 3 31 10 29 30 12 32 1
                                                   10 9 0 36 1 10 9 0 37 2 22 0
                                                   12 12 38 1 9 39 0 40 2 39 11
                                                   41 0 42 1 12 0 7 43 1 12 0
                                                   27 44 3 47 12 45 46 9 48 1
                                                   49 12 0 50 1 49 12 0 51 0 6
                                                   0 52 0 8 0 53 0 12 0 54 2 12
                                                   0 0 0 55 3 12 0 0 7 0 56 2
                                                   22 0 0 0 57 2 12 0 0 16 58 2
                                                   12 0 0 0 59 0 12 0 60 2 12 0
                                                   0 0 61 2 12 62 0 7 63 1 64
                                                   16 0 65 2 66 0 16 16 67 0 22
                                                   0 68 0 64 0 69 2 64 11 0 0
                                                   70 1 64 12 0 71 1 64 0 0 72
                                                   1 22 0 12 73 1 75 74 0 76 1
                                                   22 0 0 77 3 75 22 0 74 22 78
                                                   2 80 79 66 75 81 2 75 22 0
                                                   74 82 2 22 0 12 0 83 2 22 0
                                                   0 0 84 3 12 0 0 0 7 85 1 87
                                                   86 12 88 1 86 91 0 92 1 12 0
                                                   74 93 2 12 0 0 0 94 2 12 95
                                                   0 0 96 2 74 11 0 0 97 1 12
                                                   98 0 99 1 12 11 0 100 1 12
                                                   101 0 102 2 12 11 0 0 103 2
                                                   64 12 0 16 104 2 74 11 0 0
                                                   105 1 12 20 0 106 2 27 0 0 0
                                                   107 1 27 0 0 108 0 27 0 109
                                                   2 27 11 0 0 110 1 27 74 0
                                                   111 1 27 74 0 112 3 0 33 10
                                                   7 34 35)))))
           '|lookupComplete|)) 
