
(SDEFUN |SIGNEF;sign;FSOcU;1|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         ($ |Union| (|Integer|) "failed"))
        (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
              ('T (|SIGNEF;insign| |f| |x| |a| 0 $)))) 

(SDEFUN |SIGNEF;sign;FSFSU;2|
        ((|f| F) (|x| |Symbol|) (|a| F) (|st| |String|)
         ($ |Union| (|Integer|) "failed"))
        (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
              ('T (|SIGNEF;psign| |f| |x| |a| |st| 0 $)))) 

(SDEFUN |SIGNEF;sign;FU;3| ((|f| F) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((#2=#:G181 NIL) (|r| (|Union| (|Interval| (|Float|)) "failed"))
          (|f2| (|Expression| (|Interval| (|Float|))))
          (|f2u| (|Union| (|Expression| (|Interval| (|Float|))) "failed"))
          (|mapfun| (|Mapping| (|Interval| (|Float|)) R)) (#3=#:G180 NIL)
          (|ud| #4=(|Union| (|Integer|) #1#)) (|un| #4#))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (LETT |un|
                            (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT $ 18)) $)
                            . #5=(|SIGNEF;sign;FU;3|))
                      (EXIT
                       (COND
                        ((QEQCAR |un| 0)
                         (SEQ
                          (LETT |ud|
                                (|SIGNEF;smpsign| (SPADCALL |f| (QREFELT $ 19))
                                 $)
                                . #5#)
                          (EXIT
                           (COND
                            ((QEQCAR |ud| 0)
                             (PROGN
                              (LETT #3# (CONS 0 (* (QCDR |un|) (QCDR |ud|)))
                                    . #5#)
                              (GO #6=#:G178))))))))))
                     (COND
                      ((NULL (NULL (SPADCALL |f| (QREFELT $ 21))))
                       (EXIT (CONS 1 "failed"))))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL "rootOf" (QREFELT $ 22))
                                  (SPADCALL (ELT $ 24)
                                            (SPADCALL |f| (QREFELT $ 26))
                                            (QREFELT $ 29))
                                  (QREFELT $ 30))
                        (CONS 1 "failed"))
                       (#7='T
                        (SEQ
                         (COND
                          ((|HasCategory| (QREFELT $ 6)
                                          (LIST '|ConvertibleTo| '(|Float|)))
                           (SEQ
                            (LETT |mapfun| (CONS #'|SIGNEF;sign;FU;3!0| $)
                                  . #5#)
                            (LETT |f2u|
                                  (|trappedSpadEval|
                                   (SPADCALL |mapfun| |f| (QREFELT $ 38)))
                                  . #5#)
                            (EXIT
                             (COND ((QEQCAR |f2u| 1) "failed")
                                   (#7#
                                    (SEQ (LETT |f2| (QCDR |f2u|) . #5#)
                                         (LETT |r|
                                               (SPADCALL |f2| (QREFELT $ 40))
                                               . #5#)
                                         (COND
                                          ((QEQCAR |r| 1)
                                           (PROGN
                                            (LETT #2# (CONS 1 "failed") . #5#)
                                            (GO #8=#:G179))))
                                         (EXIT
                                          (COND
                                           ((SPADCALL (QCDR |r|)
                                                      (QREFELT $ 41))
                                            (PROGN
                                             (LETT #2# (CONS 0 -1) . #5#)
                                             (GO #8#)))
                                           ((SPADCALL (QCDR |r|)
                                                      (QREFELT $ 44))
                                            (PROGN
                                             (LETT #2# (CONS 0 1) . #5#)
                                             (GO #8#)))
                                           ((SPADCALL (QCDR |r|)
                                                      (QREFELT $ 45))
                                            (PROGN
                                             (LETT #2# (CONS 0 0) . #5#)
                                             (GO #8#)))
                                           (#7# "failed"))))))))))
                         (EXIT (CONS 1 "failed"))))))))))
            #6# (EXIT #3#)))
          #8# (EXIT #2#)))) 

(SDEFUN |SIGNEF;sign;FU;3!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 32)) (QREFELT $ 34))) 

(SDEFUN |SIGNEF;overRF|
        ((|a| |OrderedCompletion| F)
         ($ |Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
          "failed"))
        (SPROG
         ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (|n| (|SingleInteger|)))
         (SEQ (LETT |n| (SPADCALL |a| (QREFELT $ 48)) . #1=(|SIGNEF;overRF|))
              (EXIT
               (COND
                ((|eql_SI| |n| 0)
                 (SEQ
                  (LETT |u|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 53))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                         (#2='T
                          (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 56))))))))
                ((SPADCALL |n| 0 (QREFELT $ 57))
                 (CONS 0 (SPADCALL (QREFELT $ 58))))
                (#2# (CONS 0 (SPADCALL (QREFELT $ 59))))))))) 

(SDEFUN |SIGNEF;ofesign|
        ((|a| |OrderedCompletion| F) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (COND
                ((SPADCALL
                  (LETT |n| (SPADCALL |a| (QREFELT $ 48)) |SIGNEF;ofesign|) 0
                  (QREFELT $ 61))
                 (CONS 0 |n|))
                ('T (SPADCALL (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 46)))))) 

(SDEFUN |SIGNEF;insign|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|m| |NonNegativeInteger|) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|ur| #2=(|Union| (|Integer|) #1#)) (#3=#:G216 NIL) (|ul| #2#)
          (|s| (|Union| (|Integer|) #1#)) (|v| (F)) (|n| (|Integer|))
          (|u|
           (|Union| (|OrderedCompletion| F)
                    (|Record|
                     (|:| |leftHandLimit|
                          (|Union| (|OrderedCompletion| F) #4="failed"))
                     (|:| |rightHandLimit|
                          (|Union| (|OrderedCompletion| F) #4#)))
                    "failed"))
          (|eq| (|Equation| (|OrderedCompletion| F))) (#5=#:G224 NIL)
          (|ua|
           (|Union| (|OrderedCompletion| (|Fraction| (|Polynomial| R)))
                    "failed"))
          (|uf| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ
          (COND ((SPADCALL |m| 10 (QREFELT $ 63)) (CONS 1 "failed"))
                (#6='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |uf| (SPADCALL |f| (QREFELT $ 53))
                           . #7=(|SIGNEF;insign|))
                     (EXIT
                      (COND
                       ((QEQCAR |uf| 0)
                        (SEQ (LETT |ua| (|SIGNEF;overRF| |a| $) . #7#)
                             (EXIT
                              (COND
                               ((QEQCAR |ua| 0)
                                (PROGN
                                 (LETT #5#
                                       (SPADCALL (QCDR |uf|) |x| (QCDR |ua|)
                                                 (QREFELT $ 65))
                                       . #7#)
                                 (GO #8=#:G222))))))))))
                    (LETT |eq|
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 66))
                                     (QREFELT $ 67))
                           |a| (QREFELT $ 69))
                          . #7#)
                    (LETT |u| (SPADCALL |f| |eq| (QREFELT $ 74)) . #7#)
                    (EXIT
                     (COND ((QEQCAR |u| 2) (CONS 1 "failed"))
                           ((QEQCAR |u| 0)
                            (COND
                             ((SPADCALL
                               (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                     . #7#)
                               0 (QREFELT $ 61))
                              (CONS 0 |n|))
                             (#6#
                              (SEQ
                               (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 51))
                                     . #7#)
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|spadConstant| $ 50)
                                            (QREFELT $ 75))
                                  (SEQ
                                   (LETT |s|
                                         (|SIGNEF;insign|
                                          (SPADCALL |f| |x| (QREFELT $ 76)) |x|
                                          |a| (+ |m| 1) $)
                                         . #7#)
                                   (EXIT
                                    (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                          (#6#
                                           (CONS 0 (- (* (QCDR |s|) |n|))))))))
                                 (#6# (SPADCALL |v| (QREFELT $ 46)))))))))
                           (#6#
                            (COND
                             ((OR (QEQCAR (QCAR (QCDR |u|)) 1)
                                  (QEQCAR (QCDR (QCDR |u|)) 1))
                              (CONS 1 "failed"))
                             ('T
                              (SEQ
                               (LETT |ul|
                                     (|SIGNEF;ofesign|
                                      (PROG2 (LETT #3# (QCAR (QCDR |u|)) . #7#)
                                          (QCDR #3#)
                                        (|check_union2| (QEQCAR #3# 0)
                                                        (|OrderedCompletion|
                                                         (QREFELT $ 7))
                                                        (|Union|
                                                         (|OrderedCompletion|
                                                          (QREFELT $ 7))
                                                         #4#)
                                                        #3#))
                                      $)
                                     . #7#)
                               (EXIT
                                (COND ((QEQCAR |ul| 1) (CONS 1 "failed"))
                                      (#6#
                                       (SEQ
                                        (LETT |ur|
                                              (|SIGNEF;ofesign|
                                               (PROG2
                                                   (LETT #3# (QCDR (QCDR |u|))
                                                         . #7#)
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|OrderedCompletion|
                                                                  (QREFELT $
                                                                           7))
                                                                 (|Union|
                                                                  (|OrderedCompletion|
                                                                   (QREFELT $
                                                                            7))
                                                                  #4#)
                                                                 #3#))
                                               $)
                                              . #7#)
                                        (EXIT
                                         (COND
                                          ((OR (QEQCAR |ur| 1)
                                               (NULL
                                                (EQL (QCDR |ul|) (QCDR |ur|))))
                                           (CONS 1 "failed"))
                                          ('T |ul|)))))))))))))))
                  #8# (EXIT #5#))))))) 

(SDEFUN |SIGNEF;psign|
        ((|f| F) (|x| |Symbol|) (|a| F) (|st| |String|)
         (|m| |NonNegativeInteger|) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|s| (|Union| (|Integer|) #1#)) (|v| (F)) (|n| (|Integer|))
          (|u| (|Union| (|OrderedCompletion| F) "failed"))
          (|eq| (|Equation| F)) (#2=#:G241 NIL)
          (|ua| #3=(|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (|uf| #3#))
         (SEQ
          (COND ((SPADCALL |m| 10 (QREFELT $ 63)) (CONS 1 "failed"))
                ((SPADCALL |f| (|spadConstant| $ 50) (QREFELT $ 75))
                 (CONS 0 0))
                (#4='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |uf| (SPADCALL |f| (QREFELT $ 53))
                           . #5=(|SIGNEF;psign|))
                     (EXIT
                      (COND
                       ((QEQCAR |uf| 0)
                        (SEQ (LETT |ua| (SPADCALL |a| (QREFELT $ 53)) . #5#)
                             (EXIT
                              (COND
                               ((QEQCAR |ua| 0)
                                (PROGN
                                 (LETT #2#
                                       (SPADCALL (QCDR |uf|) |x| (QCDR |ua|)
                                                 |st| (QREFELT $ 77))
                                       . #5#)
                                 (GO #6=#:G239))))))))))
                    (LETT |eq|
                          (SPADCALL (SPADCALL |x| (QREFELT $ 66)) |a|
                                    (QREFELT $ 79))
                          . #5#)
                    (LETT |u| (SPADCALL |f| |eq| |st| (QREFELT $ 80)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ((QEQCAR |u| 0)
                            (COND
                             ((SPADCALL
                               (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                     . #5#)
                               0 (QREFELT $ 61))
                              (CONS 0 |n|))
                             (#4#
                              (SEQ
                               (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 51))
                                     . #5#)
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|spadConstant| $ 50)
                                            (QREFELT $ 75))
                                  (SEQ
                                   (LETT |s|
                                         (|SIGNEF;psign|
                                          (SPADCALL |f| |x| (QREFELT $ 76)) |x|
                                          |a| |st| (+ |m| 1) $)
                                         . #5#)
                                   (EXIT
                                    (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                          (#4#
                                           (CONS 0
                                                 (*
                                                  (SPADCALL |st|
                                                            (QREFELT $ 82))
                                                  (QCDR |s|))))))))
                                 (#4# (SPADCALL |v| (QREFELT $ 46)))))))))))))
                  #6# (EXIT #2#))))))) 

(SDEFUN |SIGNEF;smpsign2|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((|ans| (|Integer|)) (#1=#:G255 NIL)
          (|u| (|Union| (|Integer|) "failed")) (#2=#:G256 NIL) (|term| NIL)
          (|s| (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|r| (|Union| R "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |r| (SPADCALL |p| (QREFELT $ 85)) . #3=(|SIGNEF;smpsign2|))
            (EXIT
             (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 86)))
                   (#4='T
                    (SEQ
                     (LETT |u|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (LETT |s| (SPADCALL |p| (QREFELT $ 88)) . #3#)
                              (QREFELT $ 90))
                             (QREFELT $ 91))
                            (QREFELT $ 86))
                           . #3#)
                     (EXIT
                      (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                            (#4#
                             (SEQ (LETT |ans| (QCDR |u|) . #3#)
                                  (SEQ (LETT |term| NIL . #3#)
                                       (LETT #2# (SPADCALL |s| (QREFELT $ 95))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |term| (CAR #2#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((ODDP (QVELT |term| 2))
                                           (SEQ
                                            (LETT |u|
                                                  (|SIGNEF;sqfrSign|
                                                   (QVELT |term| 1) $)
                                                  . #3#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |u| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #3#)
                                                (GO #5=#:G254)))
                                              ('T
                                               (LETT |ans| (* |ans| (QCDR |u|))
                                                     . #3#)))))))))
                                       (LETT #2# (CDR #2#) . #3#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (CONS 0 |ans|))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |SIGNEF;smpsign|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|zu| (|Union| (|Boolean|) "failed"))
          (|up| (|SparseUnivariatePolynomial| F)) (|b| (|OrderedCompletion| F))
          (|a| (|OrderedCompletion| F)) (|x0| (F))
          (|s0| (|Union| (|Integer|) #1#)) (|k| (|Kernel| F))
          (|vl| (|List| (|Kernel| F))) (|resu| (|Union| (|Integer|) #1#)))
         (SEQ (LETT |resu| (|SIGNEF;smpsign2| |p| $) . #2=(|SIGNEF;smpsign|))
              (EXIT
               (COND ((QEQCAR |resu| 0) |resu|)
                     (#3='T
                      (SEQ (LETT |vl| (SPADCALL |p| (QREFELT $ 100)) . #2#)
                           (EXIT
                            (COND
                             ((EQL (LENGTH |vl|) 1)
                              (SEQ (LETT |k| (|SPADfirst| |vl|) . #2#)
                                   (LETT |s0| (|SIGNEF;kerSign| |k| $) . #2#)
                                   (LETT |a| (SPADCALL (QREFELT $ 101)) . #2#)
                                   (LETT |b| (SPADCALL (QREFELT $ 102)) . #2#)
                                   (LETT |x0| (|spadConstant| $ 50) . #2#)
                                   (COND
                                    ((QEQCAR |s0| 0)
                                     (SEQ
                                      (COND
                                       ((SPADCALL |s0| (CONS 0 1)
                                                  (QREFELT $ 103))
                                        (LETT |a|
                                              (SPADCALL (|spadConstant| $ 50)
                                                        (QREFELT $ 67))
                                              . #2#)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |s0| (CONS 0 -1)
                                                   (QREFELT $ 103))
                                         (LETT |b|
                                               (SPADCALL (|spadConstant| $ 50)
                                                         (QREFELT $ 67))
                                               . #2#)))))))
                                   (COND
                                    ((SPADCALL |k| '|atan| (QREFELT $ 105))
                                     (SEQ
                                      (LETT |a|
                                            (COND
                                             ((SPADCALL |a|
                                                        (SPADCALL
                                                         (|spadConstant| $ 50)
                                                         (QREFELT $ 67))
                                                        (QREFELT $ 106))
                                              |a|)
                                             (#3#
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| $ 43)
                                                         (QREFELT $ 107))
                                               (QREFELT $ 67))))
                                            . #2#)
                                      (EXIT
                                       (LETT |b|
                                             (COND
                                              ((SPADCALL |b|
                                                         (SPADCALL
                                                          (|spadConstant| $ 50)
                                                          (QREFELT $ 67))
                                                         (QREFELT $ 106))
                                               |b|)
                                              (#3#
                                               (SPADCALL (|spadConstant| $ 43)
                                                         (QREFELT $ 67))))
                                             . #2#)))))
                                   (LETT |up|
                                         (SPADCALL (ELT $ 108)
                                                   (SPADCALL |p|
                                                             (QREFELT $ 110))
                                                   (QREFELT $ 114))
                                         . #2#)
                                   (LETT |zu|
                                         (SPADCALL |up| |a| |b| 'T
                                                   (QREFELT $ 117))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((OR (QEQCAR |zu| 1) (QCDR |zu|))
                                      (CONS 1 "failed"))
                                     ('T
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |up| (QREFELT $ 98) |x0|
                                                  (QREFELT $ 118))
                                        (QREFELT $ 119))
                                       (QREFELT $ 46)))))))
                             (#3# (CONS 1 "failed"))))))))))) 

(SDEFUN |SIGNEF;sqfrSign|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|u| (|Union| (|Integer|) #1#))
          (|l| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ
          (LETT |u|
                (|SIGNEF;termSign|
                 (|SPADfirst|
                  (LETT |l| (SPADCALL |p| (QREFELT $ 121))
                        . #2=(|SIGNEF;sqfrSign|)))
                 $)
                . #2#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (|SIGNEF;listSign| (CDR |l|) (QCDR |u|) $))))))) 

(SDEFUN |SIGNEF;listSign|
        ((|l| |List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|s| |Integer|) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((#2=#:G277 NIL) (|u| (|Union| (|Integer|) #1#)) (#3=#:G278 NIL)
          (|term| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |term| NIL . #4=(|SIGNEF;listSign|))
                 (LETT #3# |l| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |u| (|SIGNEF;termSign| |term| $) . #4#)
                      (EXIT
                       (COND
                        ((OR (QEQCAR |u| 1) (NULL (EQL |s| (QCDR |u|))))
                         (PROGN
                          (LETT #2# (CONS 1 "failed") . #4#)
                          (GO #5=#:G276))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |s|))))
          #5# (EXIT #2#)))) 

(SDEFUN |SIGNEF;termSign|
        ((|term| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((#2=#:G288 NIL) (#3=#:G289 NIL) (#4=#:G287 NIL)
          (|vs| (|Union| (|Integer|) #1#)) (#5=#:G290 NIL)
          (|lv| (|List| (|Kernel| F))) (|var| NIL)
          (|us| (|Union| (|Integer|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |us|
                  (SPADCALL (SPADCALL |term| (QREFELT $ 122)) (QREFELT $ 86))
                  . #6=(|SIGNEF;termSign|))
            (EXIT
             (COND ((QEQCAR |us| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |var| NIL . #6#)
                            (LETT #5#
                                  (LETT |lv| (SPADCALL |term| (QREFELT $ 100))
                                        . #6#)
                                  . #6#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |var| (CAR #5#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((ODDP (SPADCALL |term| |var| (QREFELT $ 123)))
                                (PROGN
                                 (LETT #2#
                                       (SEQ
                                        (EXIT
                                         (SEQ
                                          (COND
                                           ((NULL (CDR |lv|))
                                            (SEQ
                                             (LETT |vs|
                                                   (|SIGNEF;kerSign|
                                                    (|SPADfirst| |lv|) $)
                                                   . #6#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |vs| 0)
                                                (PROGN
                                                 (LETT #4#
                                                       (PROGN
                                                        (LETT #3#
                                                              (CONS 0
                                                                    (*
                                                                     (QCDR
                                                                      |us|)
                                                                     (QCDR
                                                                      |vs|)))
                                                              . #6#)
                                                        (GO #7=#:G286))
                                                       . #6#)
                                                 (GO #8=#:G281))))))))
                                          (EXIT
                                           (PROGN
                                            (LETT #3# (CONS 1 "failed") . #6#)
                                            (GO #7#)))))
                                        #8# (EXIT #4#))
                                       . #6#)
                                 (GO #9=#:G283))))))
                            (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                            (EXIT NIL)))
                      #9# (EXIT #2#))
                     (EXIT (CONS 0 (QCDR |us|)))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |SIGNEF;kerSign| ((|k| |Kernel| F) ($ |Union| (|Integer|) #1="failed"))
        (SPROG
         ((|s| (|Union| (|Integer|) #1#)) (|arg| (|List| F))
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 124)) . #2=(|SIGNEF;kerSign|))
          (COND
           ((OR (SPADCALL |op| '|pi| (QREFELT $ 125))
                (OR (SPADCALL |op| '|exp| (QREFELT $ 125))
                    (OR (SPADCALL |op| '|cosh| (QREFELT $ 125))
                        (SPADCALL |op| '|sech| (QREFELT $ 125)))))
            (EXIT (CONS 0 1))))
          (EXIT
           (COND
            ((NULL (LETT |arg| (SPADCALL |k| (QREFELT $ 127)) . #2#))
             (CONS 1 "failed"))
            (#3='T
             (SEQ
              (LETT |s| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 46)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |s| 1)
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 125))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 128))
                                (QREFELT $ 129))
                      (QREFELT $ 130))
                     (CONS 0 1))
                    (#3# (CONS 1 "failed"))))
                  (#3# (CONS 1 "failed"))))
                ((SPADCALL |op| '|log| (QREFELT $ 125))
                 (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                       (#3#
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |arg|) (|spadConstant| $ 43)
                                   (QREFELT $ 131))
                         (QREFELT $ 46)))))
                ((OR
                  (OR (SPADCALL |op| '|tanh| (QREFELT $ 125))
                      (OR (SPADCALL |op| '|sinh| (QREFELT $ 125))
                          (OR (SPADCALL |op| '|csch| (QREFELT $ 125))
                              (SPADCALL |op| '|coth| (QREFELT $ 125)))))
                  (OR (SPADCALL |op| '|atan| (QREFELT $ 125))
                      (OR (SPADCALL |op| '|Si| (QREFELT $ 125))
                          (OR (SPADCALL |op| '|fresnelS| (QREFELT $ 125))
                              (SPADCALL |op| '|fresnelC| (QREFELT $ 125))))))
                 |s|)
                ('T
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 125))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 128))
                                (QREFELT $ 129))
                      (QREFELT $ 130))
                     (COND ((< (QCDR |s|) 0) (CONS 1 "failed")) (#3# |s|)))
                    (#3# |s|)))
                  (#3# (CONS 1 "failed"))))))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionSign;|)) 

(DEFUN |ElementaryFunctionSign| (&REST #1=#:G311)
  (SPROG NIL
         (PROG (#2=#:G312)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionSign|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionSign|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryFunctionSign;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryFunctionSign|)))))))))) 

(DEFUN |ElementaryFunctionSign;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionSign|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionSign| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 132) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionSign|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 98 (SPADCALL (QREFELT $ 97)))
          $))) 

(MAKEPROP '|ElementaryFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|TrigonometricManipulations| 6 7) (0 . |real?|)
              (|Union| 60 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              |SIGNEF;sign;FSOcU;1| (|String|) |SIGNEF;sign;FSFSU;2|
              (|SparseMultivariatePolynomial| 6 (|Kernel| $)) (5 . |numer|)
              (10 . |denom|) (|List| 12) (15 . |variables|) (20 . |coerce|)
              (|BasicOperator|) (25 . |name|) (|List| 23) (30 . |operators|)
              (|Mapping| 12 23) (|ListFunctions2| 23 12) (35 . |map|)
              (41 . |member?|) (|Float|) (47 . |convert|) (|Interval| 31)
              (52 . |interval|) (|Expression| 33) (|Mapping| 33 6)
              (|FunctionSpaceFunctions2| 6 7 33 35) (57 . |map|)
              (|Union| 33 '"failed") (63 . |retractIfCan|) (68 . |negative?|)
              (73 . |One|) (77 . |One|) (81 . |positive?|) (86 . |zero?|)
              |SIGNEF;sign;FU;3| (|SingleInteger|) (91 . |whatInfinity|)
              (96 . |Zero|) (100 . |Zero|) (104 . |retract|)
              (|Union| 54 '"failed") (109 . |retractIfCan|)
              (|Fraction| (|Polynomial| 6)) (|OrderedCompletion| 54)
              (114 . |coerce|) (119 . >) (125 . |plusInfinity|)
              (129 . |minusInfinity|) (|Integer|) (133 . ~=)
              (|NonNegativeInteger|) (139 . >) (|RationalFunctionSign| 6)
              (145 . |sign|) (152 . |coerce|) (157 . |coerce|) (|Equation| 13)
              (162 . |equation|) (|Union| 13 '"failed")
              (|Record| (|:| |leftHandLimit| 70) (|:| |rightHandLimit| 70))
              (|Union| 13 71 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (168 . |limit|) (174 . =) (180 . |differentiate|) (186 . |sign|)
              (|Equation| 7) (194 . |equation|) (200 . |limit|)
              (|ToolsForSign| 6) (207 . |direction|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 104) (212 . |retractIfCan|)
              (217 . |sign|) (|Factored| $) (222 . |squareFree|)
              (|Factored| 84) (227 . |unit|) (232 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 92) (|:| |factor| 84) (|:| |exponent| 60))
              (|List| 93) (237 . |factorList|) (|SingletonAsOrderedSet|)
              (242 . |create|) '|sas| (|List| 104) (246 . |variables|)
              (251 . |minusInfinity|) (255 . |plusInfinity|) (259 . =)
              (|Kernel| 7) (265 . |is?|) (271 . =) (277 . -) (282 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (287 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|SparseUnivariatePolynomialFunctions2| 6 7) (292 . |map|)
              (|Union| 8 '"failed") (|DefiniteIntegrationTools| 6 7)
              (298 . |checkForZero|) (306 . |eval|) (313 . |retract|)
              (|List| $) (318 . |monomials|) (323 . |leadingCoefficient|)
              (328 . |degree|) (334 . |operator|) (339 . |is?|) (|List| 7)
              (345 . |argument|) (350 . |second|) (355 . |retract|)
              (360 . |even?|) (365 . -))
           '#(|sign| 371) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 131
                                                 '(1 9 8 7 10 1 7 17 0 18 1 7
                                                   17 0 19 1 7 20 0 21 1 12 0
                                                   15 22 1 23 12 0 24 1 7 25 0
                                                   26 2 28 20 27 25 29 2 20 8
                                                   12 0 30 1 6 31 0 32 1 33 0
                                                   31 34 2 37 35 36 7 38 1 35
                                                   39 0 40 1 33 8 0 41 0 6 0 42
                                                   0 7 0 43 1 33 8 0 44 1 33 8
                                                   0 45 1 13 47 0 48 0 6 0 49 0
                                                   7 0 50 1 13 7 0 51 1 7 52 0
                                                   53 1 55 0 54 56 2 47 8 0 0
                                                   57 0 55 0 58 0 55 0 59 2 60
                                                   8 0 0 61 2 62 8 0 0 63 3 64
                                                   11 54 12 55 65 1 7 0 12 66 1
                                                   13 0 7 67 2 68 0 13 13 69 2
                                                   73 72 7 68 74 2 7 8 0 0 75 2
                                                   7 0 0 12 76 4 64 11 54 12 54
                                                   15 77 2 78 0 7 7 79 3 73 70
                                                   7 78 15 80 1 81 60 15 82 1
                                                   84 83 0 85 1 81 11 6 86 1 84
                                                   87 0 88 1 89 84 0 90 1 84 6
                                                   0 91 1 89 94 0 95 0 96 0 97
                                                   1 84 99 0 100 0 13 0 101 0
                                                   13 0 102 2 11 8 0 0 103 2
                                                   104 8 0 12 105 2 13 8 0 0
                                                   106 1 7 0 0 107 1 7 0 6 108
                                                   1 84 109 0 110 2 113 111 112
                                                   109 114 4 116 115 111 13 13
                                                   8 117 3 111 0 0 96 7 118 1
                                                   111 7 0 119 1 84 120 0 121 1
                                                   84 6 0 122 2 84 62 0 104 123
                                                   1 104 23 0 124 2 23 8 0 12
                                                   125 1 104 126 0 127 1 126 7
                                                   0 128 1 7 60 0 129 1 60 8 0
                                                   130 2 7 0 0 0 131 1 0 11 7
                                                   46 4 0 11 7 12 7 15 16 3 0
                                                   11 7 12 13 14)))))
           '|lookupComplete|)) 
