
(SDEFUN |UPXSSING;retractIfCan;%U;1|
        ((|f| (%))
         (% (|Union| (|UnivariatePuiseuxSeries| FE |var| |cen|) "failed")))
        (SEQ
         (COND
          ((EQL (SPADCALL |f| (QREFELT % 11)) 1)
           (COND
            ((SPADCALL (SPADCALL |f| (QREFELT % 14)) (QREFELT % 16))
             (EXIT (CONS 0 (SPADCALL |f| (QREFELT % 18))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |UPXSSING;recip;%U;2| ((|f| (%)) (% (|Union| % "failed")))
        (COND
         ((EQL (SPADCALL |f| (QREFELT % 11)) 1)
          (CONS 0
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT % 18)) (QREFELT % 21))
                 (SPADCALL (SPADCALL |f| (QREFELT % 14)) (QREFELT % 22))
                 (QREFELT % 23))))
         ('T (CONS 1 "failed")))) 

(PUT '|UPXSSING;makeTerm| '|SPADreplace|
     '(XLAM (|coef| |expon|) (VECTOR |coef| |expon| NIL))) 

(SDEFUN |UPXSSING;makeTerm|
        ((|coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
         (|expon| (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
         (%
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE)))))))
        (VECTOR |coef| |expon| NIL)) 

(PUT '|UPXSSING;coeff| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 0))) 

(SDEFUN |UPXSSING;coeff|
        ((|term|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (% (|UnivariatePuiseuxSeries| FE |var| |cen|)))
        (QVELT |term| 0)) 

(PUT '|UPXSSING;exponent| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 1))) 

(SDEFUN |UPXSSING;exponent|
        ((|term|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (% (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|)))
        (QVELT |term| 1)) 

(PUT '|UPXSSING;exponentTerms| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 2))) 

(SDEFUN |UPXSSING;exponentTerms|
        ((|term|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (%
          (|List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
        (QVELT |term| 2)) 

(PUT '|UPXSSING;setExponentTerms!| '|SPADreplace|
     '(XLAM (|term| |list|) (QSETVELT |term| 2 |list|))) 

(SDEFUN |UPXSSING;setExponentTerms!|
        ((|term|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (|list|
          (|List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE))))
         (%
          (|List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
        (QSETVELT |term| 2 |list|)) 

(SDEFUN |UPXSSING;computeExponentTerms!|
        ((|term|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (%
          (|List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
        (|UPXSSING;setExponentTerms!| |term|
         (SPADCALL
          (SPADCALL (SPADCALL (|UPXSSING;exponent| |term| %) (QREFELT % 28))
                    (QREFELT % 29))
          (QREFELT % 31))
         %)) 

(SDEFUN |UPXSSING;terms|
        ((|f| (%))
         (%
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE))))))))
        (COND ((SPADCALL |f| (QREFELT % 32)) NIL)
              ('T
               (CONS
                (|UPXSSING;makeTerm| (SPADCALL |f| (QREFELT % 18))
                 (SPADCALL |f| (QREFELT % 14)) %)
                (|UPXSSING;terms| (SPADCALL |f| (QREFELT % 33)) %))))) 

(SDEFUN |UPXSSING;sortAndDiscardTerms|
        ((|termList|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (%
          (|Record|
           (|:| |%zeroTerms|
                (|List|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE)))))))
           (|:| |%infiniteTerms|
                (|List|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE)))))))
           (|:| |%failedTerms|
                (|List|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE)))))))
           (|:| |%puiseuxSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|)))))
        (SPROG
         ((|zeroTerms|
           #1=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|zeroTermOrd| #2=(|Fraction| (|Integer|))) (|infiniteTerms| #1#)
          (|infTermOrd| #2#) (|sig| (|Integer|)) (|failedTerms| #1#)
          (|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (#3=#:G82 NIL) (|pSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|ord| #2#)
          (|expon| (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|term|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (SEQ (LETT |zeroTerms| NIL) (LETT |infiniteTerms| NIL)
              (LETT |failedTerms| NIL)
              (LETT |infTermOrd| (|spadConstant| % 35))
              (LETT |zeroTermOrd| (|spadConstant| % 35))
              (LETT |ord| (|spadConstant| % 35))
              (LETT |pSeries| (|spadConstant| % 36))
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL (NULL (NULL |termList|))) (GO G191)))
                     (SEQ
                      (LETT |expon|
                            (|UPXSSING;exponent|
                             (LETT |term| (|SPADfirst| |termList|)) %))
                      (LETT |ord|
                            (SPADCALL |expon| (|spadConstant| % 35)
                                      (QREFELT % 38)))
                      (EXIT
                       (COND
                        ((SPADCALL |ord| |infTermOrd| (QREFELT % 39))
                         (PROGN (LETT #3# 1) (GO #4=#:G77)))
                        ((SPADCALL |ord| (|spadConstant| % 35) (QREFELT % 40))
                         (SEQ (LETT |pSeries| (|UPXSSING;coeff| |term| %))
                              (LETT |zeroTerms| NIL)
                              (EXIT (PROGN (LETT #3# |$NoValue|) (GO #4#)))))
                        ('T
                         (SEQ
                          (LETT |coef| (SPADCALL |expon| |ord| (QREFELT % 41)))
                          (LETT |signum| (SPADCALL |coef| (QREFELT % 44)))
                          (EXIT
                           (COND
                            ((QEQCAR |signum| 1)
                             (SEQ
                              (LETT |failedTerms| (CONS |term| |failedTerms|))
                              (EXIT (LETT |termList| (CDR |termList|)))))
                            ('T
                             (SEQ (LETT |sig| (QCDR |signum|))
                                  (EXIT
                                   (COND
                                    ((EQL |sig| 1)
                                     (SEQ (LETT |infTermOrd| |ord|)
                                          (LETT |infiniteTerms|
                                                (CONS |term| |infiniteTerms|))
                                          (LETT |zeroTerms| NIL)
                                          (EXIT
                                           (LETT |termList|
                                                 (CDR |termList|)))))
                                    ('T
                                     (SEQ
                                      (COND
                                       ((NULL |infiniteTerms|)
                                        (LETT |zeroTerms|
                                              (COND
                                               ((SPADCALL |ord| |zeroTermOrd|
                                                          (QREFELT % 40))
                                                (CONS |term| |zeroTerms|))
                                               ('T
                                                (SEQ (LETT |zeroTermOrd| |ord|)
                                                     (EXIT
                                                      (SPADCALL |term|
                                                                (QREFELT %
                                                                         47)))))))))
                                      (EXIT
                                       (LETT |termList|
                                             (CDR |termList|))))))))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #4# (EXIT #3#))
              (EXIT
               (VECTOR |zeroTerms| |infiniteTerms| (NREVERSE |failedTerms|)
                       |pSeries|))))) 

(SDEFUN |UPXSSING;termsWithExtremeLeadingCoef|
        ((|termList|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (|ord| (|Fraction| (|Integer|))) (|signum| (|Integer|))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE))))))
           "failed")))
        (SPROG
         ((#1=#:G100 NIL)
          (|outList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))))
          (#2=#:G101 NIL) (|sig| (|Union| (|Integer|) "failed"))
          (|coefDiff| (FE)) (#3=#:G102 NIL) (|term| NIL) (|coefExtreme| (FE)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL
                     (SPADCALL (|UPXSSING;exponent| (|SPADfirst| |termList|) %)
                               |ord| (QREFELT % 41))
                     (|spadConstant| % 37) (QREFELT % 48)))
                   (GO G191)))
                 (SEQ (EXIT (LETT |termList| (CDR |termList|)))) NIL (GO G190)
                 G191 (EXIT NIL))
            (EXIT
             (COND ((NULL |termList|) (|error| "UPXSSING: can't happen"))
                   ('T
                    (SEQ
                     (LETT |coefExtreme|
                           (SPADCALL
                            (|UPXSSING;exponent| (|SPADfirst| |termList|) %)
                            |ord| (QREFELT % 41)))
                     (LETT |outList|
                           (SPADCALL (|SPADfirst| |termList|) (QREFELT % 47)))
                     (LETT |termList| (CDR |termList|))
                     (SEQ (LETT |term| NIL) (LETT #3# |termList|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |coefDiff|
                                 (SPADCALL
                                  (SPADCALL (|UPXSSING;exponent| |term| %)
                                            |ord| (QREFELT % 41))
                                  |coefExtreme| (QREFELT % 49)))
                           (EXIT
                            (COND
                             ((SPADCALL |coefDiff| (|spadConstant| % 37)
                                        (QREFELT % 48))
                              (LETT |outList| (CONS |term| |outList|)))
                             ('T
                              (SEQ
                               (LETT |sig|
                                     (SPADCALL |coefDiff| (QREFELT % 44)))
                               (EXIT
                                (COND
                                 ((QEQCAR |sig| 1)
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed"))
                                   (GO #4=#:G99)))
                                 ('T
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL (QCDR |sig|) |signum|)
                                      (PROGN
                                       (LETT #1#
                                             (LETT |outList|
                                                   (SPADCALL |term|
                                                             (QREFELT % 47))))
                                       (GO #5=#:G93)))))
                                   #5# (EXIT #1#))))))))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 0 |outList|))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |UPXSSING;filterByOrder|
        ((|termList|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (|predicate|
          (|Mapping| (|Boolean|) (|Fraction| (|Integer|))
                     (|Fraction| (|Integer|))))
         (%
          (|Record|
           (|:| |%list|
                (|List|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE)))))))
           (|:| |%order| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G123 NIL) (|term| NIL) (#2=#:G120 NIL) (#3=#:G119 NIL)
          (|outList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))))
          (|ordExtreme| #4=(|Fraction| (|Integer|))) (|ord| #4#)
          (#5=#:G122 NIL) (#6=#:G121 NIL))
         (SEQ
          (SEQ G190
               (COND
                ((NULL
                  (NULL (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) %)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |termList| (CDR |termList|))
                      (EXIT
                       (COND
                        ((NULL |termList|)
                         (PROGN
                          (LETT #6# (|error| "UPXSING: can't happen"))
                          (GO #7=#:G107)))))))
                #7# (EXIT #6#))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |ordExtreme|
                (QCAR
                 (|SPADfirst|
                  (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) %))))
          (LETT |outList| (SPADCALL (|SPADfirst| |termList|) (QREFELT % 47)))
          (SEQ
           (EXIT
            (SEQ (LETT |term| NIL) (LETT #5# (CDR |termList|)) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |term| (CAR #5#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (NULL (|UPXSSING;exponentTerms| |term| %)))
                     (PROGN
                      (LETT #2#
                            (SEQ
                             (LETT |ord|
                                   (QCAR
                                    (|SPADfirst|
                                     (|UPXSSING;exponentTerms| |term| %))))
                             (EXIT
                              (COND
                               ((SPADCALL |ord| |ordExtreme| (QREFELT % 40))
                                (LETT |outList| (CONS |term| |outList|)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ord| |ordExtreme| |predicate|)
                                    (PROGN
                                     (LETT #3#
                                           (SEQ (LETT |ordExtreme| |ord|)
                                                (EXIT
                                                 (LETT |outList|
                                                       (SPADCALL |term|
                                                                 (QREFELT %
                                                                          47))))))
                                     (GO #8=#:G111)))))
                                 #8# (EXIT #3#)))))))
                      (GO #9=#:G114))))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #2#))
          (SEQ (LETT |term| NIL) (LETT #1# |outList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (|UPXSSING;setExponentTerms!| |term|
                  (CDR (|UPXSSING;exponentTerms| |term| %)) %)))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |outList| |ordExtreme|))))) 

(SDEFUN |UPXSSING;dominantTermOnList|
        ((|termList|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (|ord0| (|Fraction| (|Integer|))) (|signum| (|Integer|))
         (%
          (|Union|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))
           "failed")))
        (SPROG
         ((|filtered|
           (|Record|
            (|:| |%list|
                 (|List|
                  (|Record|
                   (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                   (|:| |%expon|
                        (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                |cen|))
                   (|:| |%expTerms|
                        (|List|
                         (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                   (|:| |c| FE)))))))
            (|:| |%order| (|Fraction| (|Integer|)))))
          (|newList|
           (|Union|
            (|List|
             (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                       (|:| |%expon|
                            (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                    |cen|))
                       (|:| |%expTerms|
                            (|List|
                             (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                       (|:| |c| FE))))))
            "failed")))
         (SEQ
          (LETT |newList|
                (|UPXSSING;termsWithExtremeLeadingCoef| |termList| |ord0|
                 |signum| %))
          (EXIT
           (COND ((QEQCAR |newList| 1) (CONS 1 "failed"))
                 (#1='T
                  (SEQ (LETT |termList| (QCDR |newList|))
                       (EXIT
                        (COND
                         ((NULL (CDR |termList|))
                          (CONS 0 (|SPADfirst| |termList|)))
                         (#1#
                          (SEQ
                           (LETT |filtered|
                                 (COND
                                  ((EQL |signum| 1)
                                   (|UPXSSING;filterByOrder| |termList|
                                    (ELT % 50) %))
                                  (#1#
                                   (|UPXSSING;filterByOrder| |termList|
                                    (ELT % 39) %))))
                           (LETT |termList| (QCAR |filtered|))
                           (EXIT
                            (COND
                             ((NULL (CDR |termList|))
                              (CONS 0 (|SPADfirst| |termList|)))
                             (#1#
                              (|UPXSSING;dominantTermOnList| |termList|
                               (QCDR |filtered|) |signum| %))))))))))))))) 

(SDEFUN |UPXSSING;iDominantTerm|
        ((|termList|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (%
          (|Union|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|)))
           "failed")))
        (SPROG
         ((#1=#:G157 NIL)
          (|dTerm|
           (|Union|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))
            "failed"))
          (|ord0| (|Fraction| (|Integer|))) (#2=#:G159 NIL) (|term| NIL)
          (#3=#:G158 NIL)
          (|pSeries| #4=(|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|failedTerms|
           #5=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|infiniteTerms|
           #6=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|zeroTerms|
           #7=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|termRecord|
           (|Record| (|:| |%zeroTerms| #7#) (|:| |%infiniteTerms| #6#)
                     (|:| |%failedTerms| #5#) (|:| |%puiseuxSeries| #4#))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |termRecord| (|UPXSSING;sortAndDiscardTerms| |termList| %))
            (LETT |zeroTerms| (QVELT |termRecord| 0))
            (LETT |infiniteTerms| (QVELT |termRecord| 1))
            (LETT |failedTerms| (QVELT |termRecord| 2))
            (LETT |pSeries| (QVELT |termRecord| 3))
            (COND ((NULL (NULL |failedTerms|)) (EXIT (CONS 1 "failed"))))
            (COND
             ((NULL (SPADCALL |pSeries| (QREFELT % 51)))
              (EXIT
               (CONS 0
                     (CONS
                      (|UPXSSING;makeTerm| |pSeries| (|spadConstant| % 52) %)
                      "series")))))
            (COND
             ((NULL (NULL |infiniteTerms|))
              (EXIT
               (COND
                ((NULL (CDR |infiniteTerms|))
                 (CONS 0 (CONS (|SPADfirst| |infiniteTerms|) "infinity")))
                (#8='T
                 (SEQ
                  (SEQ (LETT |term| NIL) (LETT #3# |infiniteTerms|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| %)))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (LETT |ord0|
                        (SPADCALL
                         (|UPXSSING;exponent| (|SPADfirst| |infiniteTerms|) %)
                         (QREFELT % 53)))
                  (LETT |dTerm|
                        (|UPXSSING;dominantTermOnList| |infiniteTerms| |ord0| 1
                         %))
                  (EXIT
                   (COND
                    ((QEQCAR |dTerm| 1)
                     (PROGN (LETT #1# (CONS 1 "failed")) (GO #9=#:G156)))
                    (#8# (CONS 0 (CONS (QCDR |dTerm|) "infinity")))))))))))
            (EXIT
             (COND
              ((NULL (CDR |zeroTerms|))
               (CONS 0 (CONS (|SPADfirst| |zeroTerms|) "zero")))
              (#8#
               (SEQ
                (SEQ (LETT |term| NIL) (LETT #2# |zeroTerms|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| %)))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (LETT |ord0|
                      (SPADCALL
                       (|UPXSSING;exponent| (|SPADfirst| |zeroTerms|) %)
                       (QREFELT % 53)))
                (LETT |dTerm|
                      (|UPXSSING;dominantTermOnList| |zeroTerms| |ord0| -1 %))
                (EXIT
                 (COND
                  ((QEQCAR |dTerm| 1)
                   (PROGN (LETT #1# (CONS 1 "failed")) (GO #9#)))
                  (#8# (CONS 0 (CONS (QCDR |dTerm|) "zero")))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |UPXSSING;dominantTerm;%U;15|
        ((|f| (%))
         (%
          (|Union|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|)))
           "failed")))
        (|UPXSSING;iDominantTerm| (|UPXSSING;terms| |f| %) %)) 

(SDEFUN |UPXSSING;limitPlus;%U;16|
        ((|f| (%)) (% (|Union| (|OrderedCompletion| FE) "failed")))
        (SPROG
         ((|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (|ord| (|Fraction| (|Integer|)))
          (|pSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|type| #1=(|String|))
          (|domTerm|
           #2=(|Record|
               (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
               (|:| |%expon|
                    (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
               (|:| |%expTerms|
                    (|List|
                     (|Record| (|:| |k| (|Fraction| (|Integer|)))
                               (|:| |c| FE))))))
          (|termInfo|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|))))
          (|tInfo|
           (|Union| (|Record| (|:| |%term| #2#) (|:| |%type| #1#)) "failed"))
          (|termList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE))))))))
         (SEQ
          (COND
           ((NULL (LETT |termList| (|UPXSSING;terms| |f| %)))
            (CONS 0 (SPADCALL (|spadConstant| % 37) (QREFELT % 58))))
           (#3='T
            (SEQ (LETT |tInfo| (|UPXSSING;iDominantTerm| |termList| %))
                 (EXIT
                  (COND ((QEQCAR |tInfo| 1) (CONS 1 "failed"))
                        (#3#
                         (SEQ (LETT |termInfo| (QCDR |tInfo|))
                              (LETT |domTerm| (QCAR |termInfo|))
                              (LETT |type| (QCDR |termInfo|))
                              (EXIT
                               (COND
                                ((EQUAL |type| "series")
                                 (SEQ
                                  (LETT |ord|
                                        (SPADCALL
                                         (LETT |pSeries|
                                               (|UPXSSING;coeff| |domTerm| %))
                                         (|spadConstant| % 59) (QREFELT % 60)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |ord| (|spadConstant| % 35)
                                               (QREFELT % 39))
                                     (CONS 0
                                           (SPADCALL (|spadConstant| % 37)
                                                     (QREFELT % 58))))
                                    (#3#
                                     (SEQ
                                      (LETT |coef|
                                            (SPADCALL |pSeries| |ord|
                                                      (QREFELT % 61)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QREFELT % 8)
                                                   (SPADCALL |coef|
                                                             (QREFELT % 63))
                                                   (QREFELT % 65))
                                         (CONS 1 "failed"))
                                        ((SPADCALL |ord| (|spadConstant| % 35)
                                                   (QREFELT % 40))
                                         (CONS 0
                                               (SPADCALL |coef|
                                                         (QREFELT % 58))))
                                        (#3#
                                         (SEQ
                                          (LETT |signum|
                                                (SPADCALL |coef|
                                                          (QREFELT % 44)))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |signum| 1)
                                             (CONS 1 "failed"))
                                            ((EQL (QCDR |signum|) 1)
                                             (CONS 0
                                                   (SPADCALL (QREFELT % 66))))
                                            (#3#
                                             (CONS 0
                                                   (SPADCALL
                                                    (QREFELT %
                                                             67))))))))))))))))
                                ((EQUAL |type| "zero")
                                 (CONS 0
                                       (SPADCALL (|spadConstant| % 37)
                                                 (QREFELT % 58))))
                                (#3#
                                 (SEQ
                                  (LETT |ord|
                                        (SPADCALL
                                         (LETT |pSeries|
                                               (|UPXSSING;coeff| |domTerm| %))
                                         (QREFELT % 68)))
                                  (LETT |coef|
                                        (SPADCALL |pSeries| |ord|
                                                  (QREFELT % 61)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QREFELT % 8)
                                               (SPADCALL |coef| (QREFELT % 63))
                                               (QREFELT % 65))
                                     (CONS 1 "failed"))
                                    (#3#
                                     (SEQ
                                      (LETT |signum|
                                            (SPADCALL |coef| (QREFELT % 44)))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |signum| 1) (CONS 1 "failed"))
                                        ((EQL (QCDR |signum|) 1)
                                         (CONS 0 (SPADCALL (QREFELT % 66))))
                                        (#3#
                                         (CONS 0
                                               (SPADCALL
                                                (QREFELT %
                                                         67)))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesWithExponentialSingularity;|)) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity| (&REST #1=#:G205)
  (SPROG NIL
         (PROG (#2=#:G206)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|UnivariatePuiseuxSeriesWithExponentialSingularity|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |UnivariatePuiseuxSeriesWithExponentialSingularity;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePuiseuxSeriesWithExponentialSingularity|)))))))))) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity;|
       (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G204 NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$|
          (LIST '|UnivariatePuiseuxSeriesWithExponentialSingularity| DV$1 DV$2
                DV$3 DV$4))
    (LETT % (GETREFV 85))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Algebra| (|Fraction| (|Integer|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CharacteristicNonZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CharacteristicZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CommutativeRing|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|RetractableTo|
                                           (|Fraction| (|Integer|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|RetractableTo| (|Integer|)))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|ExponentialOfUnivariatePuiseuxSeries|
                                                |#2| |#3| |#4|)
                                               '(|Comparable|)))
                                        (AND #1#
                                             (|HasCategory|
                                              (|UnivariatePuiseuxSeries| |#2|
                                                                         |#3|
                                                                         |#4|)
                                              '(|Comparable|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Field|))
                                        (OR
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                     |#4|)
                                          '(|Algebra|
                                            (|Fraction| (|Integer|))))
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                     |#4|)
                                          '(|RetractableTo|
                                            (|Fraction| (|Integer|)))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Ring|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|EntireRing|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|GcdDomain|))))))
    (|haddProp| |$ConstructorCache|
                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (|HasCategory| % '(|CommutativeRing|)) (|augmentPredVector| % 8192))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|UnivariatePuiseuxSeriesWithExponentialSingularity| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 17 13) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|NonNegativeInteger|) (0 . |numberOfMonomials|) (5 . |One|)
              (|ExponentialOfUnivariatePuiseuxSeries| 7 (NRTEVAL (QREFELT % 8))
                                                      (NRTEVAL (QREFELT % 9)))
              (9 . |degree|) (|Boolean|) (14 . |zero?|)
              (|UnivariatePuiseuxSeries| 7 (NRTEVAL (QREFELT % 8))
                                         (NRTEVAL (QREFELT % 9)))
              (19 . |leadingCoefficient|) (|Union| 17 '"failed")
              |UPXSSING;retractIfCan;%U;1| (24 . |inv|) (29 . -)
              (34 . |monomial|) (|Union| % '"failed") |UPXSSING;recip;%U;2|
              (|Record| (|:| |k| 34) (|:| |c| 7)) (|Stream| 26) (40 . |terms|)
              (45 . |complete|) (|List| 26) (50 . |entries|) (55 . |zero?|)
              (60 . |reductum|) (|Fraction| 82) (65 . |Zero|) (69 . |Zero|)
              (73 . |Zero|) (77 . |order|) (83 . >) (89 . =)
              (95 . |coefficient|) (|Union| 82 '"failed")
              (|ElementaryFunctionSign| 6 7) (101 . |sign|)
              (|Record| (|:| |%coef| 17) (|:| |%expon| 13)
                        (|:| |%expTerms| 30))
              (|List| 45) (106 . |list|) (111 . =) (117 . -) (123 . <)
              (129 . |zero?|) (134 . |Zero|) (138 . |order|)
              (|Record| (|:| |%term| 45) (|:| |%type| 72))
              (|Union| 54 '"failed") |UPXSSING;dominantTerm;%U;15|
              (|OrderedCompletion| 7) (143 . |coerce|) (148 . |One|)
              (152 . |order|) (158 . |coefficient|) (|List| 64)
              (164 . |variables|) (|Symbol|) (169 . |member?|)
              (175 . |plusInfinity|) (179 . |minusInfinity|) (183 . |order|)
              (|Union| 57 '"failed") |UPXSSING;limitPlus;%U;16| (|OutputForm|)
              (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 13) (|:| |c| 17)) (|List| 74)
              (|Mapping| 17 17) (|List| %) (|List| 17) (|List| 13)
              (|Mapping| 13 13)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Integer|) (|Mapping| 17 13) (|Union| 34 '"failed"))
           '#(~= 188 |zero?| 194 |unitNormal| 199 |unitCanonical| 204 |unit?|
              209 |support| 214 |subtractIfCan| 219 |smaller?| 225 |sample| 231
              |rightRecip| 235 |rightPower| 240 |retractIfCan| 252 |retract|
              267 |reductum| 282 |recip| 287 |primitivePart| 292 |pomopo!| 297
              |plenaryPower| 305 |opposite?| 311 |one?| 317 |numberOfMonomials|
              322 |monomials| 327 |monomial?| 332 |monomial| 337
              |minimumDegree| 343 |mapExponents| 348 |map| 354 |listOfTerms|
              360 |linearExtend| 365 |limitPlus| 371 |leftRecip| 376
              |leftPower| 381 |leadingTerm| 393 |leadingSupport| 398
              |leadingMonomial| 403 |leadingCoefficient| 408 |latex| 413
              |ground?| 418 |ground| 423 |fmecg| 428 |exquo| 436 |dominantTerm|
              448 |degree| 453 |content| 458 |constructOrdered| 463 |construct|
              468 |commutator| 473 |coerce| 479 |coefficients| 504
              |coefficient| 509 |charthRoot| 515 |characteristic| 520
              |binomThmExpt| 524 |associator| 531 |associates?| 538
              |antiCommutator| 544 |annihilate?| 550 ^ 556 |Zero| 568 |One| 572
              = 576 / 582 - 588 + 599 * 605)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 0 0 0 3 2 1 0 0 0 1 0 0 0 0 4 1 0 0 0 1 0 0
                                  0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 6
                                  5 0 0 0 6 5 0 0 0 0 0 0))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL NIL NIL NIL
                |Algebra&| |Algebra&| |EntireRing&| NIL
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Rng&| NIL
                |NonAssociativeAlgebra&| |Module&| |Module&| NIL |Module&| NIL
                NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&| |MagmaWithUnit&| NIL
                NIL |AbelianSemiGroup&| |FullyRetractableTo&| |Magma&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                            (|ExponentialOfUnivariatePuiseuxSeries|
                                             7 8 9))
                 (|AbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                      (|ExponentialOfUnivariatePuiseuxSeries| 7
                                                                              8
                                                                              9))
                 (|IntegralDomain|) (|CommutativeRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 34) (|Algebra| $$)
                 (|EntireRing|) (|Ring|) (|NonAssociativeAlgebra| 34)
                 (|FreeModuleCategory| (|UnivariatePuiseuxSeries| 7 8 9)
                                       (|ExponentialOfUnivariatePuiseuxSeries|
                                        7 8 9))
                 (|Rng|) (|SemiRing|) (|NonAssociativeAlgebra| $$)
                 (|Module| (|UnivariatePuiseuxSeries| 7 8 9)) (|Module| 34)
                 (|IndexedDirectProductCategory|
                  (|UnivariatePuiseuxSeries| 7 8 9)
                  (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9))
                 (|Module| $$) (|SemiRng|) (|BiModule| 34 34)
                 (|BiModule| (|UnivariatePuiseuxSeries| 7 8 9)
                             (|UnivariatePuiseuxSeries| 7 8 9))
                 (|IndexedProductCategory| (|UnivariatePuiseuxSeries| 7 8 9)
                                           (|ExponentialOfUnivariatePuiseuxSeries|
                                            7 8 9))
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| 34)
                 (|LeftModule| 34) (|RightModule| $$)
                 (|RightModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|LeftModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|AbelianProductCategory| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|NonAssociativeRng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|)
                 (|AbelianSemiGroup|)
                 (|FullyRetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|Magma|) (|RetractableTo| 82) (|RetractableTo| 34)
                 (|SetCategory|)
                 (|RetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|CommutativeStar|) (|CoercibleFrom| 82) (|CoercibleFrom| 34)
                 (|CoercibleTo| 71) (|BasicType|)
                 (|CoercibleFrom| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|))
              (|makeByteWordVec2| 84
                                  '(1 0 10 0 11 0 7 0 12 1 0 13 0 14 1 13 15 0
                                    16 1 0 17 0 18 1 17 0 0 21 1 13 0 0 22 2 0
                                    0 17 13 23 1 13 27 0 28 1 27 0 0 29 1 27 30
                                    0 31 1 0 15 0 32 1 0 0 0 33 0 34 0 35 0 17
                                    0 36 0 7 0 37 2 13 34 0 34 38 2 34 15 0 0
                                    39 2 34 15 0 0 40 2 13 7 0 34 41 1 43 42 7
                                    44 1 46 0 45 47 2 7 15 0 0 48 2 7 0 0 0 49
                                    2 34 15 0 0 50 1 17 15 0 51 0 13 0 52 1 13
                                    34 0 53 1 57 0 7 58 0 34 0 59 2 17 34 0 34
                                    60 2 17 7 0 34 61 1 7 62 0 63 2 62 15 64 0
                                    65 0 57 0 66 0 57 0 67 1 17 34 0 68 2 0 15
                                    0 0 1 1 0 15 0 32 1 0 81 0 1 1 0 0 0 1 1 0
                                    15 0 1 1 0 79 0 1 2 0 24 0 0 1 2 8 15 0 0 1
                                    0 0 0 1 1 0 24 0 1 2 0 0 0 73 1 2 0 0 0 10
                                    1 1 0 19 0 20 1 5 84 0 1 1 6 42 0 1 1 0 17
                                    0 1 1 5 34 0 1 1 6 82 0 1 1 7 0 0 33 1 0 24
                                    0 25 1 13 0 0 1 4 0 0 0 17 13 0 1 2 0 0 0
                                    73 1 2 0 15 0 0 1 1 0 15 0 1 1 0 10 0 11 1
                                    0 77 0 1 1 0 15 0 1 2 0 0 17 13 23 1 0 13 0
                                    1 2 0 0 80 0 1 2 0 0 76 0 1 1 0 75 0 1 2 4
                                    17 83 0 1 1 0 69 0 70 1 0 24 0 1 2 0 0 0 73
                                    1 2 0 0 0 10 1 1 7 74 0 1 1 7 13 0 1 1 7 0
                                    0 1 1 7 17 0 18 1 0 72 0 1 1 0 15 0 1 1 0
                                    17 0 1 4 11 0 0 13 17 0 1 2 0 24 0 0 1 2 12
                                    24 0 17 1 1 0 55 0 56 1 0 13 0 14 1 13 17 0
                                    1 1 7 0 75 1 1 0 0 75 1 2 0 0 0 0 1 1 0 71
                                    0 1 1 0 0 17 1 1 0 0 0 1 1 0 0 82 1 1 10 0
                                    34 1 1 0 78 0 1 2 0 17 0 13 1 1 2 24 0 1 0
                                    0 10 1 3 14 0 0 0 10 1 3 0 0 0 0 0 1 2 0 15
                                    0 0 1 2 0 0 0 0 1 2 0 15 0 0 1 2 0 0 0 73 1
                                    2 0 0 0 10 1 0 0 0 1 0 0 0 1 2 0 15 0 0 1 2
                                    9 0 0 17 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 73 0 1 2 0 0 0 0 1 2 0 0 17 0 1 2 0
                                    0 0 17 1 2 0 0 10 0 1 2 0 0 82 0 1 2 1 0 0
                                    34 1 2 1 0 34 0 1)))))
           '|lookupComplete|)) 
