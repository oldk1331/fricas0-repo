
(/VERSIONCHECK 2) 

(DEFUN |UPXSSING;retractIfCan;$U;1| (|f| $)
  (SEQ
   (COND
    ((EQL (SPADCALL |f| (QREFELT $ 11)) 1)
     (COND
      ((SPADCALL (SPADCALL |f| (QREFELT $ 14)) (QREFELT $ 16))
       (EXIT (CONS 0 (SPADCALL |f| (QREFELT $ 18))))))))
   (EXIT (CONS 1 "failed")))) 

(DEFUN |UPXSSING;recip;$U;2| (|f| $)
  (COND
   ((EQL (SPADCALL |f| (QREFELT $ 11)) 1)
    (CONS 0
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 21))
                    (SPADCALL (SPADCALL |f| (QREFELT $ 14)) (QREFELT $ 22))
                    (QREFELT $ 23))))
   ('T (CONS 1 "failed")))) 

(PUT '|UPXSSING;makeTerm| '|SPADreplace|
     '(XLAM (|coef| |expon|) (VECTOR |coef| |expon| NIL))) 

(DEFUN |UPXSSING;makeTerm| (|coef| |expon| $) (VECTOR |coef| |expon| NIL)) 

(PUT '|UPXSSING;coeff| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 0))) 

(DEFUN |UPXSSING;coeff| (|term| $) (QVELT |term| 0)) 

(PUT '|UPXSSING;exponent| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 1))) 

(DEFUN |UPXSSING;exponent| (|term| $) (QVELT |term| 1)) 

(PUT '|UPXSSING;exponentTerms| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 2))) 

(DEFUN |UPXSSING;exponentTerms| (|term| $) (QVELT |term| 2)) 

(PUT '|UPXSSING;setExponentTerms!| '|SPADreplace|
     '(XLAM (|term| |list|) (QSETVELT |term| 2 |list|))) 

(DEFUN |UPXSSING;setExponentTerms!| (|term| |list| $)
  (QSETVELT |term| 2 |list|)) 

(DEFUN |UPXSSING;computeExponentTerms!| (|term| $)
  (|UPXSSING;setExponentTerms!| |term|
   (SPADCALL
    (SPADCALL (SPADCALL (|UPXSSING;exponent| |term| $) (QREFELT $ 28))
              (QREFELT $ 29))
    (QREFELT $ 31))
   $)) 

(DEFUN |UPXSSING;terms| (|f| $)
  (COND ((SPADCALL |f| (QREFELT $ 32)) NIL)
        ('T
         (CONS
          (|UPXSSING;makeTerm| (SPADCALL |f| (QREFELT $ 18))
           (SPADCALL |f| (QREFELT $ 14)) $)
          (|UPXSSING;terms| (SPADCALL |f| (QREFELT $ 33)) $))))) 

(DEFUN |UPXSSING;sortAndDiscardTerms| (|termList| $)
  (PROG (|zeroTerms| |zeroTermOrd| |infiniteTerms| |infTermOrd| |sig|
         |failedTerms| |signum| |coef| #1=#:G198 |pSeries| |ord| |expon|
         |term|)
    (RETURN
     (SEQ (LETT |zeroTerms| NIL . #2=(|UPXSSING;sortAndDiscardTerms|))
          (LETT |infiniteTerms| NIL . #2#) (LETT |failedTerms| NIL . #2#)
          (LETT |infTermOrd| (|spadConstant| $ 35) . #2#)
          (LETT |zeroTermOrd| (|spadConstant| $ 35) . #2#)
          (LETT |ord| (|spadConstant| $ 35) . #2#)
          (LETT |pSeries| (|spadConstant| $ 36) . #2#)
          (SEQ
           (EXIT
            (SEQ G190
                 (COND
                  ((NULL (COND ((NULL |termList|) 'NIL) ('T 'T))) (GO G191)))
                 (SEQ
                  (LETT |expon|
                        (|UPXSSING;exponent|
                         (LETT |term| (|SPADfirst| |termList|) . #2#) $)
                        . #2#)
                  (LETT |ord|
                        (SPADCALL |expon| (|spadConstant| $ 35) (QREFELT $ 38))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |ord| |infTermOrd| (QREFELT $ 39))
                     (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#)))
                    ((SPADCALL |ord| (|spadConstant| $ 35) (QREFELT $ 40))
                     (SEQ (LETT |pSeries| (|UPXSSING;coeff| |term| $) . #2#)
                          (LETT |zeroTerms| NIL . #2#)
                          (EXIT (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#)))))
                    ('T
                     (SEQ
                      (LETT |coef| (SPADCALL |expon| |ord| (QREFELT $ 41))
                            . #2#)
                      (LETT |signum| (SPADCALL |coef| (QREFELT $ 44)) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |signum| 1)
                         (SEQ
                          (LETT |failedTerms| (CONS |term| |failedTerms|)
                                . #2#)
                          (EXIT (LETT |termList| (CDR |termList|) . #2#))))
                        ('T
                         (SEQ (LETT |sig| (QCDR |signum|) . #2#)
                              (EXIT
                               (COND
                                ((EQL |sig| 1)
                                 (SEQ (LETT |infTermOrd| |ord| . #2#)
                                      (LETT |infiniteTerms|
                                            (CONS |term| |infiniteTerms|)
                                            . #2#)
                                      (LETT |zeroTerms| NIL . #2#)
                                      (EXIT
                                       (LETT |termList| (CDR |termList|)
                                             . #2#))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((NULL |infiniteTerms|)
                                    (LETT |zeroTerms|
                                          (COND
                                           ((SPADCALL |ord| |zeroTermOrd|
                                                      (QREFELT $ 40))
                                            (CONS |term| |zeroTerms|))
                                           ('T
                                            (SEQ
                                             (LETT |zeroTermOrd| |ord| . #2#)
                                             (EXIT
                                              (SPADCALL |term|
                                                        (QREFELT $ 47))))))
                                          . #2#)))
                                  (EXIT
                                   (LETT |termList| (CDR |termList|)
                                         . #2#)))))))))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT
           (VECTOR |zeroTerms| |infiniteTerms| (NREVERSE |failedTerms|)
                   |pSeries|)))))) 

(DEFUN |UPXSSING;termsWithExtremeLeadingCoef| (|termList| |ord| |signum| $)
  (PROG (|outList| #1=#:G215 |sig| |coefDiff| #2=#:G216 |term| |coefExtreme|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL
                (SPADCALL
                 (SPADCALL (|UPXSSING;exponent| (|SPADfirst| |termList|) $)
                           |ord| (QREFELT $ 41))
                 (|spadConstant| $ 37) (QREFELT $ 48)))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT |termList| (CDR |termList|)
                     . #3=(|UPXSSING;termsWithExtremeLeadingCoef|))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND ((NULL |termList|) (|error| "UPXSSING: can't happen"))
               ('T
                (SEQ
                 (LETT |coefExtreme|
                       (SPADCALL
                        (|UPXSSING;exponent| (|SPADfirst| |termList|) $) |ord|
                        (QREFELT $ 41))
                       . #3#)
                 (LETT |outList|
                       (SPADCALL (|SPADfirst| |termList|) (QREFELT $ 47))
                       . #3#)
                 (LETT |termList| (CDR |termList|) . #3#)
                 (SEQ (LETT |term| NIL . #3#) (LETT #2# |termList| . #3#) G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |coefDiff|
                             (SPADCALL
                              (SPADCALL (|UPXSSING;exponent| |term| $) |ord|
                                        (QREFELT $ 41))
                              |coefExtreme| (QREFELT $ 49))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |coefDiff| (|spadConstant| $ 37)
                                    (QREFELT $ 48))
                          (LETT |outList| (CONS |term| |outList|) . #3#))
                         ('T
                          (SEQ
                           (LETT |sig| (SPADCALL |coefDiff| (QREFELT $ 44))
                                 . #3#)
                           (EXIT
                            (COND
                             ((QEQCAR |sig| 1)
                              (PROGN
                               (LETT #1# (CONS 1 "failed") . #3#)
                               (GO #1#)))
                             ((EQL (QCDR |sig|) |signum|)
                              (LETT |outList| (SPADCALL |term| (QREFELT $ 47))
                                    . #3#)))))))))
                      (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT (CONS 0 |outList|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |UPXSSING;filterByOrder| (|termList| |predicate| $)
  (PROG (#1=#:G231 |term| #2=#:G226 #3=#:G223 |outList| |ordExtreme| |ord|
         #4=#:G230 #5=#:G220)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (NULL (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) $)))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ
              (LETT |termList| (CDR |termList|)
                    . #6=(|UPXSSING;filterByOrder|))
              (EXIT
               (COND
                ((NULL |termList|)
                 (PROGN
                  (LETT #5# (|error| "UPXSING: can't happen") . #6#)
                  (GO #5#)))))))
            #5# (EXIT #5#))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |ordExtreme|
            (QCAR
             (|SPADfirst|
              (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) $)))
            . #6#)
      (LETT |outList| (SPADCALL (|SPADfirst| |termList|) (QREFELT $ 47)) . #6#)
      (SEQ
       (EXIT
        (SEQ (LETT |term| NIL . #6#) (LETT #4# (CDR |termList|) . #6#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL (NULL (|UPXSSING;exponentTerms| |term| $)))
                 (PROGN
                  (LETT #2#
                        (SEQ
                         (LETT |ord|
                               (QCAR
                                (|SPADfirst|
                                 (|UPXSSING;exponentTerms| |term| $)))
                               . #6#)
                         (EXIT
                          (COND
                           ((SPADCALL |ord| |ordExtreme| (QREFELT $ 40))
                            (LETT |outList| (CONS |term| |outList|) . #6#))
                           ('T
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |ord| |ordExtreme| |predicate|)
                                (PROGN
                                 (LETT #3#
                                       (SEQ (LETT |ordExtreme| |ord| . #6#)
                                            (EXIT
                                             (LETT |outList|
                                                   (SPADCALL |term|
                                                             (QREFELT $ 47))
                                                   . #6#)))
                                       . #6#)
                                 (GO #3#)))))
                             #3# (EXIT #3#))))))
                        . #6#)
                  (GO #2#))))))
             (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL)))
       #2# (EXIT #2#))
      (SEQ (LETT |term| NIL . #6#) (LETT #1# |outList| . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (|UPXSSING;setExponentTerms!| |term|
              (CDR (|UPXSSING;exponentTerms| |term| $)) $)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |outList| |ordExtreme|)))))) 

(DEFUN |UPXSSING;dominantTermOnList| (|termList| |ord0| |signum| $)
  (PROG (|filtered| |newList|)
    (RETURN
     (SEQ
      (LETT |newList|
            (|UPXSSING;termsWithExtremeLeadingCoef| |termList| |ord0| |signum|
             $)
            . #1=(|UPXSSING;dominantTermOnList|))
      (EXIT
       (COND ((QEQCAR |newList| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |termList| (QCDR |newList|) . #1#)
                   (EXIT
                    (COND
                     ((NULL (CDR |termList|))
                      (CONS 0 (|SPADfirst| |termList|)))
                     (#2#
                      (SEQ
                       (LETT |filtered|
                             (COND
                              ((EQL |signum| 1)
                               (|UPXSSING;filterByOrder| |termList| (ELT $ 50)
                                $))
                              (#2#
                               (|UPXSSING;filterByOrder| |termList| (ELT $ 39)
                                $)))
                             . #1#)
                       (LETT |termList| (QCAR |filtered|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (CDR |termList|))
                          (CONS 0 (|SPADfirst| |termList|)))
                         (#2#
                          (|UPXSSING;dominantTermOnList| |termList|
                           (QCDR |filtered|) |signum| $)))))))))))))))) 

(DEFUN |UPXSSING;iDominantTerm| (|termList| $)
  (PROG (#1=#:G262 |dTerm| |ord0| #2=#:G264 |term| #3=#:G263 |pSeries|
         |failedTerms| |infiniteTerms| |zeroTerms| |termRecord|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |termRecord| (|UPXSSING;sortAndDiscardTerms| |termList| $)
              . #4=(|UPXSSING;iDominantTerm|))
        (LETT |zeroTerms| (QVELT |termRecord| 0) . #4#)
        (LETT |infiniteTerms| (QVELT |termRecord| 1) . #4#)
        (LETT |failedTerms| (QVELT |termRecord| 2) . #4#)
        (LETT |pSeries| (QVELT |termRecord| 3) . #4#)
        (COND ((NULL (NULL |failedTerms|)) (EXIT (CONS 1 "failed"))))
        (COND
         ((NULL (SPADCALL |pSeries| (QREFELT $ 51)))
          (EXIT
           (CONS 0
                 (CONS (|UPXSSING;makeTerm| |pSeries| (|spadConstant| $ 52) $)
                       "series")))))
        (COND
         ((NULL (NULL |infiniteTerms|))
          (EXIT
           (COND
            ((NULL (CDR |infiniteTerms|))
             (CONS 0 (CONS (|SPADfirst| |infiniteTerms|) "infinity")))
            (#5='T
             (SEQ
              (SEQ (LETT |term| NIL . #4#) (LETT #3# |infiniteTerms| . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| $)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |ord0|
                    (SPADCALL
                     (|UPXSSING;exponent| (|SPADfirst| |infiniteTerms|) $)
                     (QREFELT $ 53))
                    . #4#)
              (LETT |dTerm|
                    (|UPXSSING;dominantTermOnList| |infiniteTerms| |ord0| 1 $)
                    . #4#)
              (EXIT
               (COND
                ((QEQCAR |dTerm| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#)))
                (#5# (CONS 0 (CONS (QCDR |dTerm|) "infinity")))))))))))
        (EXIT
         (COND
          ((NULL (CDR |zeroTerms|))
           (CONS 0 (CONS (|SPADfirst| |zeroTerms|) "zero")))
          (#5#
           (SEQ
            (SEQ (LETT |term| NIL . #4#) (LETT #2# |zeroTerms| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| $)))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |ord0|
                  (SPADCALL (|UPXSSING;exponent| (|SPADfirst| |zeroTerms|) $)
                            (QREFELT $ 53))
                  . #4#)
            (LETT |dTerm|
                  (|UPXSSING;dominantTermOnList| |zeroTerms| |ord0| -1 $)
                  . #4#)
            (EXIT
             (COND
              ((QEQCAR |dTerm| 1)
               (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#)))
              (#5# (CONS 0 (CONS (QCDR |dTerm|) "zero")))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |UPXSSING;dominantTerm;$U;15| (|f| $)
  (|UPXSSING;iDominantTerm| (|UPXSSING;terms| |f| $) $)) 

(DEFUN |UPXSSING;limitPlus;$U;16| (|f| $)
  (PROG (|signum| |coef| |ord| |pSeries| |type| |domTerm| |termInfo| |tInfo|
         |termList|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |termList| (|UPXSSING;terms| |f| $)
               . #1=(|UPXSSING;limitPlus;$U;16|)))
        (CONS 0 (|spadConstant| $ 58)))
       (#2='T
        (SEQ (LETT |tInfo| (|UPXSSING;iDominantTerm| |termList| $) . #1#)
             (EXIT
              (COND ((QEQCAR |tInfo| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |termInfo| (QCDR |tInfo|) . #1#)
                          (LETT |domTerm| (QCAR |termInfo|) . #1#)
                          (LETT |type| (QCDR |termInfo|) . #1#)
                          (EXIT
                           (COND
                            ((EQUAL |type| "series")
                             (SEQ
                              (LETT |ord|
                                    (SPADCALL
                                     (LETT |pSeries|
                                           (|UPXSSING;coeff| |domTerm| $)
                                           . #1#)
                                     (|spadConstant| $ 59) (QREFELT $ 60))
                                    . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL |ord| (|spadConstant| $ 35)
                                           (QREFELT $ 39))
                                 (CONS 0 (|spadConstant| $ 58)))
                                (#2#
                                 (SEQ
                                  (LETT |coef|
                                        (SPADCALL |pSeries| |ord|
                                                  (QREFELT $ 61))
                                        . #1#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QREFELT $ 8)
                                               (SPADCALL |coef| (QREFELT $ 63))
                                               (QREFELT $ 65))
                                     (CONS 1 "failed"))
                                    ((SPADCALL |ord| (|spadConstant| $ 35)
                                               (QREFELT $ 40))
                                     (CONS 0 (SPADCALL |coef| (QREFELT $ 66))))
                                    (#2#
                                     (SEQ
                                      (LETT |signum|
                                            (SPADCALL |coef| (QREFELT $ 44))
                                            . #1#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |signum| 1) (CONS 1 "failed"))
                                        ((EQL (QCDR |signum|) 1)
                                         (CONS 0 (SPADCALL (QREFELT $ 67))))
                                        (#2#
                                         (CONS 0
                                               (SPADCALL
                                                (QREFELT $ 68))))))))))))))))
                            ((EQUAL |type| "zero")
                             (CONS 0 (|spadConstant| $ 58)))
                            (#2#
                             (SEQ
                              (LETT |ord|
                                    (SPADCALL
                                     (LETT |pSeries|
                                           (|UPXSSING;coeff| |domTerm| $)
                                           . #1#)
                                     (QREFELT $ 69))
                                    . #1#)
                              (LETT |coef|
                                    (SPADCALL |pSeries| |ord| (QREFELT $ 61))
                                    . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL (QREFELT $ 8)
                                           (SPADCALL |coef| (QREFELT $ 63))
                                           (QREFELT $ 65))
                                 (CONS 1 "failed"))
                                (#2#
                                 (SEQ
                                  (LETT |signum|
                                        (SPADCALL |coef| (QREFELT $ 44)) . #1#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |signum| 1) (CONS 1 "failed"))
                                    ((EQL (QCDR |signum|) 1)
                                     (CONS 0 (SPADCALL (QREFELT $ 67))))
                                    (#2#
                                     (CONS 0
                                           (SPADCALL
                                            (QREFELT $
                                                     68))))))))))))))))))))))))) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity| (&REST #1=#:G304)
  (PROG ()
    (RETURN
     (PROG (#2=#:G305)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariatePuiseuxSeriesWithExponentialSingularity|)
                                           '|domainEqualList|)
                . #3=(|UnivariatePuiseuxSeriesWithExponentialSingularity|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function|
                    |UnivariatePuiseuxSeriesWithExponentialSingularity;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariatePuiseuxSeriesWithExponentialSingularity|))))))))))) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity;|
       (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|UnivariatePuiseuxSeriesWithExponentialSingularity|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|UnivariatePuiseuxSeriesWithExponentialSingularity| DV$1
                  DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 82) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                      |#4|)
                                           '(|Algebra|
                                             (|Fraction| (|Integer|))))
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
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                      |#4|)
                                           '(|Field|))
                                          (OR
                                           (|HasCategory|
                                            (|UnivariatePuiseuxSeries| |#2|
                                                                       |#3|
                                                                       |#4|)
                                            '(|Algebra|
                                              (|Fraction| (|Integer|))))
                                           (|HasCategory|
                                            (|UnivariatePuiseuxSeries| |#2|
                                                                       |#3|
                                                                       |#4|)
                                            '(|RetractableTo|
                                              (|Fraction| (|Integer|)))))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                      |#4|)
                                           '(|IntegralDomain|))
                                          (|HasCategory|
                                           (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                      |#4|)
                                           '(|GcdDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache|
                  '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariatePuiseuxSeriesWithExponentialSingularity| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 17 13) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|NonNegativeInteger|) (0 . |numberOfMonomials|) (5 . |One|)
              (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9) (9 . |degree|)
              (|Boolean|) (14 . |zero?|) (|UnivariatePuiseuxSeries| 7 8 9)
              (19 . |leadingCoefficient|) (|Union| 17 '#1="failed")
              |UPXSSING;retractIfCan;$U;1| (24 . |inv|) (29 . -)
              (34 . |monomial|) (|Union| $ '"failed") |UPXSSING;recip;$U;2|
              (|Record| (|:| |k| 34) (|:| |c| 7)) (|Stream| 26) (40 . |terms|)
              (45 . |complete|) (|List| 26) (50 . |entries|) (55 . |zero?|)
              (60 . |reductum|) (|Fraction| 73) (65 . |Zero|) (69 . |Zero|)
              (73 . |Zero|) (77 . |order|) (83 . >) (89 . =)
              (95 . |coefficient|) (|Union| 73 '"failed")
              (|ElementaryFunctionSign| 6 7) (101 . |sign|)
              (|Record| (|:| |%coef| 17) (|:| |%expon| 13)
                        (|:| |%expTerms| 30))
              (|List| 45) (106 . |list|) (111 . =) (117 . -) (123 . <)
              (129 . |zero?|) (134 . |Zero|) (138 . |order|)
              (|Record| (|:| |%term| 45) (|:| |%type| 79))
              (|Union| 54 '"failed") |UPXSSING;dominantTerm;$U;15|
              (|OrderedCompletion| 7) (143 . |Zero|) (147 . |One|)
              (151 . |order|) (157 . |coefficient|) (|List| 64)
              (163 . |variables|) (|Symbol|) (168 . |member?|) (174 . |coerce|)
              (179 . |plusInfinity|) (183 . |minusInfinity|) (187 . |order|)
              (|Union| 57 '"failed") |UPXSSING;limitPlus;$U;16|
              (|Union| 34 '#1#) (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Mapping| 13 13) (|List| 17) (|Mapping| 17 17)
              (|PositiveInteger|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(~= 192 |zero?| 198 |unitNormal| 203 |unitCanonical| 208 |unit?|
              213 |subtractIfCan| 218 |sample| 224 |retractIfCan| 228 |retract|
              243 |reductum| 258 |recip| 263 |primitivePart| 268 |pomopo!| 273
              |one?| 281 |numberOfMonomials| 286 |monomial?| 291 |monomial| 296
              |minimumDegree| 302 |mapExponents| 307 |map| 313 |limitPlus| 319
              |leadingMonomial| 324 |leadingCoefficient| 329 |latex| 334 |hash|
              339 |ground?| 344 |ground| 349 |exquo| 354 |dominantTerm| 366
              |degree| 371 |content| 376 |coerce| 381 |coefficients| 406
              |coefficient| 411 |charthRoot| 417 |characteristic| 422
              |binomThmExpt| 426 |associates?| 433 ^ 439 |Zero| 451 |One| 455 =
              459 / 465 - 471 + 482 * 488)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 0 1 4 0 0 0 1 2 3 4 0 0 0 1 0 0 0 0 0 1
                                  1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 6))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&|
                |IntegralDomain&| |Algebra&| |Algebra&| |Algebra&| NIL
                |Module&| NIL |Module&| NIL NIL |Module&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |Monoid&|
                NIL |AbelianMonoid&| |SemiGroup&| |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetCategory&| NIL NIL NIL
                |RetractableTo&| |BasicType&| NIL |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|FiniteAbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                            (|ExponentialOfUnivariatePuiseuxSeries|
                                             7 8 9))
                 (|AbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                      (|ExponentialOfUnivariatePuiseuxSeries| 7
                                                                              8
                                                                              9))
                 (|IntegralDomain|) (|Algebra| $$) (|Algebra| 34)
                 (|Algebra| (|UnivariatePuiseuxSeries| 7 8 9)) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|Module| 34)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Module| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| (|UnivariatePuiseuxSeries| 7 8 9)
                             (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BiModule| 34 34) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|LeftModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|RightModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|LeftModule| 34) (|RightModule| 34) (|AbelianGroup|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|)
                 (|FullyRetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|)
                 (|RetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BasicType|) (|CoercibleTo| 80) (|RetractableTo| 34)
                 (|RetractableTo| 73))
              (|makeByteWordVec2| 81
                                  '(1 0 10 0 11 0 7 0 12 1 0 13 0 14 1 13 15 0
                                    16 1 0 17 0 18 1 17 0 0 21 1 13 0 0 22 2 0
                                    0 17 13 23 1 13 27 0 28 1 27 0 0 29 1 27 30
                                    0 31 1 0 15 0 32 1 0 0 0 33 0 34 0 35 0 17
                                    0 36 0 7 0 37 2 13 34 0 34 38 2 34 15 0 0
                                    39 2 34 15 0 0 40 2 13 7 0 34 41 1 43 42 7
                                    44 1 46 0 45 47 2 7 15 0 0 48 2 7 0 0 0 49
                                    2 34 15 0 0 50 1 17 15 0 51 0 13 0 52 1 13
                                    34 0 53 0 57 0 58 0 34 0 59 2 17 34 0 34 60
                                    2 17 7 0 34 61 1 7 62 0 63 2 62 15 64 0 65
                                    1 57 0 7 66 0 57 0 67 0 57 0 68 1 17 34 0
                                    69 2 0 15 0 0 1 1 0 15 0 32 1 0 74 0 1 1 0
                                    0 0 1 1 0 15 0 1 2 0 24 0 0 1 0 0 0 1 1 5
                                    72 0 1 1 6 42 0 1 1 0 19 0 20 1 5 34 0 1 1
                                    6 73 0 1 1 0 17 0 1 1 0 0 0 33 1 0 24 0 25
                                    1 10 0 0 1 4 0 0 0 17 13 0 1 1 0 15 0 1 1 0
                                    10 0 11 1 0 15 0 1 2 0 0 17 13 23 1 0 13 0
                                    1 2 0 0 75 0 1 2 0 0 77 0 1 1 0 70 0 71 1 0
                                    0 0 1 1 0 17 0 18 1 0 79 0 1 1 0 81 0 1 1 0
                                    15 0 1 1 0 17 0 1 2 9 24 0 17 1 2 0 24 0 0
                                    1 1 0 55 0 56 1 0 13 0 14 1 10 17 0 1 1 8 0
                                    34 1 1 0 0 73 1 1 0 0 0 1 1 0 0 17 1 1 0 80
                                    0 1 1 0 76 0 1 2 0 17 0 13 1 1 2 24 0 1 0 0
                                    10 1 3 4 0 0 0 10 1 2 0 15 0 0 1 2 0 0 0 10
                                    1 2 0 0 0 78 1 0 0 0 1 0 0 0 1 2 0 15 0 0 1
                                    2 7 0 0 17 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 1 0 34 0 1 2 1 0 0 34 1 2 0 0 10 0 1
                                    2 0 0 73 0 1 2 0 0 17 0 1 2 0 0 0 0 1 2 0 0
                                    0 17 1 2 0 0 78 0 1)))))
           '|lookupComplete|)) 
