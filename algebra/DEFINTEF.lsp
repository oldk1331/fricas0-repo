
(SDEFUN |DEFINTEF;innerint;FS2OcBU;1|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| #1="failed")
          (|:| |pole| #2="potentialPole")))
        (SPROG
         ((#3=#:G142 NIL) (|v| (|Union| F "failed"))
          (|u|
           (|Union| (|:| |f1| (|OrderedCompletion| F))
                    (|:| |f2| (|List| (|OrderedCompletion| F)))
                    (|:| |fail| #1#) (|:| |pole| #2#))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u| (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)
                   . #4=(|DEFINTEF;innerint;FS2OcBU;1|))
             (EXIT
              (COND
               ((OR (QEQCAR |u| 0) (QEQCAR |u| 1))
                (PROGN (LETT #3# |u| . #4#) (GO #5=#:G136)))
               ('T
                (SEQ (LETT |v| (SPADCALL |f| |x| |a| |b| (QREFELT $ 12)) . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (PROGN (LETT #3# |u| . #4#) (GO #5#))))))))))
            (EXIT (CONS 0 (SPADCALL (QCDR |v|) (QREFELT $ 13))))))
          #5# (EXIT #3#)))) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;2|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| "potentialPole")))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;3|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| "potentialPole")))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;4|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| "potentialPole")))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(SDEFUN |DEFINTEF;integrate;FSbU;5|
        ((|f| F) (|s| |SegmentBinding| (|OrderedCompletion| F))
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| "potentialPole")))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 18))
                  (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 22)) NIL
                  (QREFELT $ 16))) 

(SDEFUN |DEFINTEF;integrate;FSbSU;6|
        ((|f| F) (|s| |SegmentBinding| (|OrderedCompletion| F))
         (|str| |String|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| "potentialPole")))
        (SPADCALL |f| (SPADCALL |s| (QREFELT $ 18))
                  (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 21))
                  (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 22))
                  (SPADCALL |str| (QREFELT $ 26)) (QREFELT $ 16))) 

(SDEFUN |DEFINTEF;int|
        ((|f| F) (|x| |Symbol|) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) (|ignor?| |Boolean|)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| "failed")
          (|:| |pole| #1="potentialPole")))
        (SPROG ((|z| (|Union| (|Boolean|) "failed")) (|k| (|Kernel| F)))
               (SEQ
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 28))
                  (CONS 0 (SPADCALL (|spadConstant| $ 29) (QREFELT $ 13))))
                 (#2='T
                  (SEQ
                   (LETT |k| (SPADCALL |x| (QREFELT $ 31))
                         . #3=(|DEFINTEF;int|))
                   (LETT |z| (|DEFINTEF;checkForPole| |f| |x| |k| |a| |b| $)
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |z| 1)
                      (COND
                       (|ignor?| (|DEFINTEF;nopole| |f| |x| |k| |a| |b| $))
                       (#2# (CONS 3 #1#))))
                     ((QCDR |z|)
                      (|error| "integrate: pole in path of integration"))
                     (#2# (|DEFINTEF;nopole| |f| |x| |k| |a| |b| $)))))))))) 

(SDEFUN |DEFINTEF;checkForPole|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G184 NIL) (|u| (|Union| (|Boolean|) "failed"))
          (|d| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u|
                   (|DEFINTEF;checkFor0|
                    (LETT |d| (SPADCALL |f| (QREFELT $ 33))
                          . #2=(|DEFINTEF;checkForPole|))
                    |k| |a| |b| $)
                   . #2#)
             (EXIT
              (COND
               ((OR (QEQCAR |u| 1) (QCDR |u|))
                (PROGN (LETT #1# |u| . #2#) (GO #3=#:G182))))))
            (SEQ (LETT |u| (|DEFINTEF;checkSMP| |d| |x| |k| |a| |b| $) . #2#)
                 (EXIT
                  (COND
                   ((OR (QEQCAR |u| 1) (QCDR |u|))
                    (PROGN (LETT #1# |u| . #2#) (GO #3#))))))
            (EXIT
             (|DEFINTEF;checkSMP| (SPADCALL |f| (QREFELT $ 34)) |x| |k| |a| |b|
              $))))
          #3# (EXIT #1#)))) 

(SDEFUN |DEFINTEF;checkFor0|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Kernel| F)
         (|a| |OrderedCompletion| F) (|b| |OrderedCompletion| F)
         ($ |Union| (|Boolean|) #1="failed"))
        (SPROG
         ((#2=#:G212 NIL) (|w| (|Union| (|Boolean|) #1#)) (|k| #3=(|Kernel| F))
          (|z|
           (|Union|
            (|Record| (|:| |var| #3#) (|:| |exponent| (|NonNegativeInteger|)))
            #4="failed"))
          (#5=#:G211 NIL) (#6=#:G213 NIL) (#7=#:G214 NIL) (|t| NIL)
          (|v|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    #4#))
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |u| (|DEFINTEF;polyIfCan| |p| |x| $)
                  . #8=(|DEFINTEF;checkFor0|))
            (EXIT
             (COND
              ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |a| |b| NIL (QREFELT $ 37)))
              (#9='T
               (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 40)) . #8#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (SEQ
                        (SEQ
                         (EXIT
                          (SEQ (LETT |t| NIL . #8#) (LETT #7# (QCDR |v|) . #8#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |t| (CAR #7#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |w|
                                      (|DEFINTEF;checkFor0| |t| |x| |a| |b| $)
                                      . #8#)
                                (EXIT
                                 (COND
                                  ((OR (QEQCAR |w| 1) (QCDR |w|))
                                   (PROGN
                                    (LETT #5#
                                          (PROGN
                                           (LETT #6# |w| . #8#)
                                           (GO #10=#:G210))
                                          . #8#)
                                    (GO #11=#:G195))))))
                               (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                               (EXIT NIL)))
                         #11# (EXIT #5#))
                        (EXIT (CONS 0 NIL))))
                      (#9#
                       (SEQ (LETT |z| (SPADCALL |p| (QREFELT $ 43)) . #8#)
                            (EXIT
                             (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                                   (#9#
                                    (SEQ (LETT |k| (QCAR (QCDR |z|)) . #8#)
                                         (COND
                                          ((OR
                                            (SPADCALL |k| '|exp|
                                                      (QREFELT $ 44))
                                            (OR
                                             (SPADCALL |k| '|acot|
                                                       (QREFELT $ 44))
                                             (SPADCALL |k| '|cosh|
                                                       (QREFELT $ 44))))
                                           (EXIT (CONS 0 NIL))))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k| '|log|
                                                      (QREFELT $ 44))
                                            (SEQ
                                             (EXIT
                                              (SEQ
                                               (SEQ
                                                (LETT |w|
                                                      (|DEFINTEF;moreThan| |b|
                                                       (|spadConstant| $ 46) $)
                                                      . #8#)
                                                (EXIT
                                                 (COND
                                                  ((OR (QEQCAR |w| 1)
                                                       (NULL (QCDR |w|)))
                                                   (PROGN
                                                    (LETT #2# |w| . #8#)
                                                    (GO #12=#:G205))))))
                                               (EXIT
                                                (|DEFINTEF;moreThan|
                                                 (SPADCALL |a| (QREFELT $ 47))
                                                 (SPADCALL
                                                  (|spadConstant| $ 46)
                                                  (QREFELT $ 50))
                                                 $))))
                                             #12# (EXIT #2#)))
                                           (#9#
                                            (CONS 1 "failed"))))))))))))))))))
          #10# (EXIT #6#)))) 

(SDEFUN |DEFINTEF;moreThan|
        ((|a| |OrderedCompletion| F) (|b| |Fraction| (|Integer|))
         ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|u| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|r| (|Union| F "failed")))
         (SEQ
          (LETT |r| (SPADCALL |a| (QREFELT $ 51)) . #1=(|DEFINTEF;moreThan|))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (CONS 0
                   (SPADCALL (SPADCALL |a| (QREFELT $ 53)) 0 (QREFELT $ 55))))
            (#2='T
             (SEQ (LETT |u| (SPADCALL (QCDR |r|) (QREFELT $ 57)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (SPADCALL (QCDR |u|) |b|
                                          (QREFELT $ 58))))))))))))) 

(SDEFUN |DEFINTEF;checkSMP|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Symbol|)
         (|k| |Kernel| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) #1="failed"))
        (SPROG
         ((#2=#:G286 NIL) (|w| (|Union| (|Boolean|) #1#)) (#3=#:G285 NIL)
          (#4=#:G288 NIL) (|f| (F)) (|kk| #5=(|Kernel| F))
          (|z|
           (|Union|
            (|Record| (|:| |var| #5#) (|:| |exponent| (|NonNegativeInteger|)))
            #6="failed"))
          (|n| (R)) (#7=#:G291 NIL) (#8=#:G293 NIL) (|t| NIL)
          (|v|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    #6#))
          (#9=#:G284 NIL) (#10=#:G292 NIL)
          (|u| (|Union| (|SparseUnivariatePolynomial| F) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |u| (|DEFINTEF;polyIfCan| |p| |k| $)
                  . #11=(|DEFINTEF;checkSMP|))
            (EXIT
             (COND ((QEQCAR |u| 0) (CONS 0 NIL))
                   (#12='T
                    (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 40)) . #11#)
                         (EXIT
                          (COND
                           ((QEQCAR |v| 0)
                            (SEQ
                             (SEQ
                              (EXIT
                               (SEQ (LETT |t| NIL . #11#)
                                    (LETT #10# (QCDR |v|) . #11#) G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN
                                           (LETT |t| (CAR #10#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |w|
                                           (|DEFINTEF;checkSMP| |t| |x| |k| |a|
                                            |b| $)
                                           . #11#)
                                     (EXIT
                                      (COND
                                       ((OR (QEQCAR |w| 1) (QCDR |w|))
                                        (PROGN
                                         (LETT #9#
                                               (PROGN
                                                (LETT #7# |w| . #11#)
                                                (GO #13=#:G283))
                                               . #11#)
                                         (GO #14=#:G237))))))
                                    (LETT #10# (CDR #10#) . #11#) (GO G190)
                                    G191 (EXIT NIL)))
                              #14# (EXIT #9#))
                             (EXIT (CONS 0 NIL))))
                           (#12#
                            (SEQ
                             (LETT |v| (SPADCALL |p| (QREFELT $ 59)) . #11#)
                             (EXIT
                              (COND
                               ((QEQCAR |v| 0)
                                (SEQ (LETT |n| (|spadConstant| $ 54) . #11#)
                                     (SEQ (LETT |t| NIL . #11#)
                                          (LETT #8# (QCDR |v|) . #11#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |t| (CAR #8#) . #11#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |w|
                                                 (|DEFINTEF;checkSMP| |t| |x|
                                                  |k| |a| |b| $)
                                                 . #11#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |w| 1)
                                              (PROGN
                                               (LETT #7# |w| . #11#)
                                               (GO #13#)))
                                             ((QCDR |w|)
                                              (LETT |n|
                                                    (SPADCALL |n|
                                                              (|spadConstant| $
                                                                              48)
                                                              (QREFELT $ 60))
                                                    . #11#)))))
                                          (LETT #8# (CDR #8#) . #11#) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |n| (QREFELT $ 61))
                                        (CONS 0 NIL))
                                       ((SPADCALL |n| (|spadConstant| $ 48)
                                                  (QREFELT $ 62))
                                        (CONS 0 'T))
                                       (#12# (CONS 1 "failed"))))))
                               (#12#
                                (SEQ
                                 (LETT |z| (SPADCALL |p| (QREFELT $ 43))
                                       . #11#)
                                 (EXIT
                                  (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                                        (#12#
                                         (SEQ
                                          (LETT |kk| (QCAR (QCDR |z|)) . #11#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |kk| (QREFELT $ 64))
                                              (QREFELT $ 65))
                                             (CONS 0 NIL))
                                            (#12#
                                             (SEQ
                                              (LETT |f|
                                                    (|SPADfirst|
                                                     (SPADCALL |kk|
                                                               (QREFELT $ 67)))
                                                    . #11#)
                                              (COND
                                               ((OR
                                                 (SPADCALL |kk| '|exp|
                                                           (QREFELT $ 44))
                                                 (OR
                                                  (SPADCALL |kk| '|sin|
                                                            (QREFELT $ 44))
                                                  (OR
                                                   (SPADCALL |kk| '|cos|
                                                             (QREFELT $ 44))
                                                   (OR
                                                    (SPADCALL |kk| '|sinh|
                                                              (QREFELT $ 44))
                                                    (OR
                                                     (SPADCALL |kk| '|cosh|
                                                               (QREFELT $ 44))
                                                     (OR
                                                      (SPADCALL |kk| '|tanh|
                                                                (QREFELT $ 44))
                                                      (OR
                                                       (SPADCALL |kk| '|sech|
                                                                 (QREFELT $
                                                                          44))
                                                       (OR
                                                        (SPADCALL |kk| '|atan|
                                                                  (QREFELT $
                                                                           44))
                                                        (OR
                                                         (SPADCALL |kk| '|acot|
                                                                   (QREFELT $
                                                                            44))
                                                         (SPADCALL |kk|
                                                                   '|asinh|
                                                                   (QREFELT $
                                                                            44)))))))))))
                                                (EXIT
                                                 (|DEFINTEF;checkForPole| |f|
                                                  |x| |k| |a| |b| $))))
                                              (COND
                                               ((OR
                                                 (SPADCALL |kk| '|asin|
                                                           (QREFELT $ 44))
                                                 (OR
                                                  (SPADCALL |kk| '|acos|
                                                            (QREFELT $ 44))
                                                  (SPADCALL |kk| '|atanh|
                                                            (QREFELT $ 44))))
                                                (EXIT
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #11#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #4# |w| . #11#)
                                                         (GO #15=#:G258))))))
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;posit|
                                                            (SPADCALL |f|
                                                                      (|spadConstant|
                                                                       $ 49)
                                                                      (QREFELT
                                                                       $ 68))
                                                            |x| |k| |a| |b| $)
                                                           . #11#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #4# |w| . #11#)
                                                         (GO #15#))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat|
                                                      (SPADCALL |f|
                                                                (|spadConstant|
                                                                 $ 49)
                                                                (QREFELT $ 69))
                                                      |x| |k| |a| |b| $))))
                                                  #15# (EXIT #4#)))))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |kk| '|acosh|
                                                           (QREFELT $ 44))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #11#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #3# |w| . #11#)
                                                         (GO #16=#:G269))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat|
                                                      (SPADCALL |f|
                                                                (|spadConstant|
                                                                 $ 49)
                                                                (QREFELT $ 68))
                                                      |x| |k| |a| |b| $))))
                                                  #16# (EXIT #3#)))
                                                ((OR
                                                  (SPADCALL |kk| '|log|
                                                            (QREFELT $ 44))
                                                  (SPADCALL |kk| '|nthRoot|
                                                            (QREFELT $ 44)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #11#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #2# |w| . #11#)
                                                         (GO #17=#:G271))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat| |f| |x|
                                                      |k| |a| |b| $))))
                                                  #17# (EXIT #2#)))
                                                ('T
                                                 (CONS 1
                                                       "failed"))))))))))))))))))))))))))
          #13# (EXIT #7#)))) 

(SDEFUN |DEFINTEF;posit|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G311 NIL) (|w| (|Union| (|Boolean|) "failed")) (#2=#:G312 NIL)
          (#3=#:G301 NIL) (|b2| #4=(|Boolean|))
          (|z| (|Union| (|Integer|) #5="failed")) (|r| (|Union| F "failed"))
          (|b1| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SEQ
                   (LETT |r| (SPADCALL |a| (QREFELT $ 51))
                         . #6=(|DEFINTEF;posit|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT $ 72)))
                     (#7='T
                      (SPADCALL |f| |x| (QCDR |r|) "right" (QREFELT $ 73))))))
                  . #6#)
            (SEQ (LETT |b1| (QEQCAR |z| 0) . #6#)
                 (EXIT
                  (COND
                   (|b1|
                    (COND
                     ((SPADCALL
                       (PROG2 (LETT #3# |z| . #6#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #5#) #3#))
                       0 (QREFELT $ 75))
                      (PROGN (LETT #2# (CONS 0 'T) . #6#) (GO #8=#:G309))))))))
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 51)) . #6#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT $ 72)))
                         (#7#
                          (SPADCALL |f| |x| (QCDR |r|) "left"
                                    (QREFELT $ 73))))))
                  . #6#)
            (SEQ (LETT |b2| (QEQCAR |z| 0) . #6#)
                 (EXIT
                  (COND
                   (|b2|
                    (COND
                     ((SPADCALL
                       (PROG2 (LETT #3# |z| . #6#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #5#) #3#))
                       0 (QREFELT $ 75))
                      (PROGN (LETT #2# (CONS 0 'T) . #6#) (GO #8#))))))))
            (COND
             (|b1|
              (COND
               (|b2|
                (EXIT
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |w|
                           (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT $ 34))
                            |k| |a| |b| $)
                           . #6#)
                     (EXIT
                      (COND
                       ((OR (QEQCAR |w| 1) (QCDR |w|))
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #6#)
                         (GO #9=#:G308))))))
                    (EXIT (CONS 0 NIL))))
                  #9# (EXIT #1#)))))))
            (EXIT (CONS 1 "failed"))))
          #8# (EXIT #2#)))) 

(SDEFUN |DEFINTEF;negat|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G330 NIL) (|w| (|Union| (|Boolean|) "failed")) (#2=#:G331 NIL)
          (#3=#:G320 NIL) (|b2| #4=(|Boolean|))
          (|z| (|Union| (|Integer|) #5="failed")) (|r| (|Union| F "failed"))
          (|b1| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SEQ
                   (LETT |r| (SPADCALL |a| (QREFELT $ 51))
                         . #6=(|DEFINTEF;negat|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT $ 72)))
                     (#7='T
                      (SPADCALL |f| |x| (QCDR |r|) "right" (QREFELT $ 73))))))
                  . #6#)
            (SEQ (LETT |b1| (QEQCAR |z| 0) . #6#)
                 (EXIT
                  (COND
                   (|b1|
                    (COND
                     ((<
                       (PROG2 (LETT #3# |z| . #6#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #5#) #3#))
                       0)
                      (PROGN (LETT #2# (CONS 0 'T) . #6#) (GO #8=#:G328))))))))
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 51)) . #6#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT $ 72)))
                         (#7#
                          (SPADCALL |f| |x| (QCDR |r|) "left"
                                    (QREFELT $ 73))))))
                  . #6#)
            (SEQ (LETT |b2| (QEQCAR |z| 0) . #6#)
                 (EXIT
                  (COND
                   (|b2|
                    (COND
                     ((<
                       (PROG2 (LETT #3# |z| . #6#)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #5#) #3#))
                       0)
                      (PROGN (LETT #2# (CONS 0 'T) . #6#) (GO #8#))))))))
            (COND
             (|b1|
              (COND
               (|b2|
                (EXIT
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |w|
                           (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT $ 34))
                            |k| |a| |b| $)
                           . #6#)
                     (EXIT
                      (COND
                       ((OR (QEQCAR |w| 1) (QCDR |w|))
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #6#)
                         (GO #9=#:G327))))))
                    (EXIT (CONS 0 NIL))))
                  #9# (EXIT #1#)))))))
            (EXIT (CONS 1 "failed"))))
          #8# (EXIT #2#)))) 

(SDEFUN |DEFINTEF;polyIfCan|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Kernel| F)
         ($ |Union| (|SparseUnivariatePolynomial| F) "failed"))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans| (|SparseUnivariatePolynomial| F)) (#1=#:G340 NIL) (|c| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q| (SPADCALL |p| |x| (QREFELT $ 77))
                  . #2=(|DEFINTEF;polyIfCan|))
            (LETT |ans| (|spadConstant| $ 78) . #2#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |q| (|spadConstant| $ 80) (QREFELT $ 81)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |x|
                               (SPADCALL
                                (LETT |c|
                                      (SPADCALL (SPADCALL |q| (QREFELT $ 82))
                                                (QREFELT $ 83))
                                      . #2#)
                                (QREFELT $ 85))
                               (QREFELT $ 87))
                     (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #3=#:G339)))
                    ('T
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL |c|
                                                (SPADCALL |q| (QREFELT $ 89))
                                                (QREFELT $ 90))
                                      (QREFELT $ 91))
                            . #2#)
                      (EXIT
                       (LETT |q| (SPADCALL |q| (QREFELT $ 92)) . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #3# (EXIT #1#)))) 

(SDEFUN |DEFINTEF;nopole|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) (|a| |OrderedCompletion| F)
         (|b| |OrderedCompletion| F)
         ($ |Union| (|:| |f1| (|OrderedCompletion| F))
          (|:| |f2| (|List| (|OrderedCompletion| F))) (|:| |fail| #1="failed")
          (|:| |pole| "potentialPole")))
        (SPROG
         ((|ans| (|List| (|OrderedCompletion| F))) (#2=#:G357 NIL)
          (|v| (|Union| (|OrderedCompletion| F) "failed")) (#3=#:G358 NIL)
          (|g| NIL) (|u| (|Union| F (|List| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |u| (SPADCALL |f| |x| (QREFELT $ 95))
                  . #4=(|DEFINTEF;nopole|))
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ
                (LETT |v| (SPADCALL |k| (QCDR |u|) |a| |b| NIL (QREFELT $ 97))
                      . #4#)
                (EXIT
                 (COND ((QEQCAR |v| 1) (CONS 2 #1#))
                       (#5='T (CONS 0 (QCDR |v|)))))))
              (#5#
               (SEQ (LETT |ans| NIL . #4#)
                    (SEQ (LETT |g| NIL . #4#) (LETT #3# (QCDR |u|) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |g| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |v|
                                (SPADCALL |k| |g| |a| |b| NIL (QREFELT $ 97))
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |v| 1)
                             (PROGN
                              (LETT #2# (CONS 2 #1#) . #4#)
                              (GO #6=#:G356)))
                            ('T
                             (LETT |ans|
                                   (SPADCALL |ans| (LIST (QCDR |v|))
                                             (QREFELT $ 99))
                                   . #4#)))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 |ans|))))))))
          #6# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |ElementaryFunctionDefiniteIntegration;|)) 

(DEFUN |ElementaryFunctionDefiniteIntegration| (&REST #1=#:G359)
  (SPROG NIL
         (PROG (#2=#:G360)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionDefiniteIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionDefiniteIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ElementaryFunctionDefiniteIntegration;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionDefiniteIntegration|)))))))))) 

(DEFUN |ElementaryFunctionDefiniteIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ElementaryFunctionDefiniteIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionDefiniteIntegration| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 100) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|ElementaryFunctionDefiniteIntegration| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
            (COND
             ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
              (COND
               ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
                (PROGN
                 (QSETREFV $ 16
                           (CONS
                            (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;1|)
                            $))))
               ('T
                (QSETREFV $ 16
                          (CONS
                           (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;2|)
                           $)))))
             ('T
              (QSETREFV $ 16
                        (CONS
                         (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;3|)
                         $)))))
           ('T
            (QSETREFV $ 16
                      (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;4|)
                            $))))
          $))) 

(MAKEPROP '|ElementaryFunctionDefiniteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| 7 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              (|PatternMatchIntegration| 6 7) (0 . |pmintegrate|)
              (8 . |coerce|)
              (|Union| (|:| |f1| 10) (|:| |f2| 98) (|:| |fail| '"failed")
                       (|:| |pole| '"potentialPole"))
              (|Boolean|) (13 . |innerint|) (|SegmentBinding| 10)
              (22 . |variable|) (|Segment| 10) (27 . |segment|) (32 . |lo|)
              (37 . |hi|) |DEFINTEF;integrate;FSbU;5| (|String|)
              (|DefiniteIntegrationTools| 6 7) (42 . |ignore?|)
              |DEFINTEF;integrate;FSbSU;6| (47 . =) (53 . |Zero|) (|Kernel| 7)
              (57 . |kernel|) (|SparseMultivariatePolynomial| 6 (|Kernel| $))
              (62 . |denom|) (67 . |numer|) (|Union| 15 '"failed")
              (|SparseUnivariatePolynomial| 7) (72 . |checkForZero|)
              (|Union| (|List| $) '#1="failed")
              (|SparseMultivariatePolynomial| 6 30) (80 . |isTimes|)
              (|Record| (|:| |var| 30) (|:| |exponent| 88)) (|Union| 41 '#1#)
              (85 . |isExpt|) (90 . |is?|) (|Fraction| 74) (96 . |One|)
              (100 . -) (105 . |One|) (109 . |One|) (113 . -)
              (118 . |retractIfCan|) (|SingleInteger|) (123 . |whatInfinity|)
              (128 . |Zero|) (132 . >) (|Union| 45 '"failed")
              (138 . |retractIfCan|) (143 . >) (149 . |isPlus|) (154 . +)
              (160 . |zero?|) (165 . =) (|BasicOperator|) (171 . |operator|)
              (176 . |nullary?|) (|List| 7) (181 . |argument|) (186 . -)
              (192 . +) (|Union| 74 '"failed") (|ElementaryFunctionSign| 6 7)
              (198 . |sign|) (205 . |sign|) (|Integer|) (213 . >)
              (|SparseUnivariatePolynomial| $) (219 . |univariate|)
              (225 . |Zero|) (|SparseUnivariatePolynomial| 39) (229 . |Zero|)
              (233 . ~=) (239 . |leadingCoefficient|) (244 . |coerce|)
              (|List| (|Kernel| $)) (249 . |tower|) (|List| 30)
              (254 . |member?|) (|NonNegativeInteger|) (260 . |degree|)
              (265 . |monomial|) (271 . +) (277 . |reductum|) (|Union| 7 66)
              (|FunctionSpaceIntegration| 6 7) (282 . |integrate|)
              (|Union| 10 '"failed") (288 . |computeInt|) (|List| 10)
              (297 . |concat!|))
           '#(|integrate| 303 |innerint| 316) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 99
                                                 '(4 11 8 7 9 10 10 12 1 10 0 7
                                                   13 5 0 14 7 9 10 10 15 16 1
                                                   17 9 0 18 1 17 19 0 20 1 19
                                                   10 0 21 1 19 10 0 22 1 25 15
                                                   24 26 2 10 15 0 0 28 0 7 0
                                                   29 1 30 0 9 31 1 7 32 0 33 1
                                                   7 32 0 34 4 25 35 36 10 10
                                                   15 37 1 39 38 0 40 1 39 42 0
                                                   43 2 30 15 0 9 44 0 45 0 46
                                                   1 10 0 0 47 0 6 0 48 0 7 0
                                                   49 1 45 0 0 50 1 10 8 0 51 1
                                                   10 52 0 53 0 6 0 54 2 52 15
                                                   0 0 55 1 7 56 0 57 2 45 15 0
                                                   0 58 1 39 38 0 59 2 6 0 0 0
                                                   60 1 6 15 0 61 2 6 15 0 0 62
                                                   1 30 63 0 64 1 63 15 0 65 1
                                                   30 66 0 67 2 7 0 0 0 68 2 7
                                                   0 0 0 69 3 71 70 7 9 10 72 4
                                                   71 70 7 9 7 24 73 2 74 15 0
                                                   0 75 2 39 76 0 30 77 0 36 0
                                                   78 0 79 0 80 2 79 15 0 0 81
                                                   1 79 39 0 82 1 7 0 32 83 1 7
                                                   84 0 85 2 86 15 30 0 87 1 79
                                                   88 0 89 2 36 0 7 88 90 2 36
                                                   0 0 0 91 1 79 0 0 92 2 94 93
                                                   7 9 95 5 25 96 30 7 10 10 15
                                                   97 2 98 0 0 0 99 2 0 14 7 17
                                                   23 3 0 14 7 17 24 27 5 0 14
                                                   7 9 10 10 15 16)))))
           '|lookupComplete|)) 
