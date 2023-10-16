
(SDEFUN |ITRIGMNP;GR2F| ((|g| |Complex| R) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 11)) (QREFELT $ 12))
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 13) (QREFELT $ 14))
                             (QREFELT $ 15))
                   (SPADCALL (SPADCALL |g| (QREFELT $ 16)) (QREFELT $ 12))
                   (QREFELT $ 17))
                  (QREFELT $ 18))) 

(SDEFUN |ITRIGMNP;FG2F;FGF;2| ((|f| FG) ($ F))
        (SPADCALL (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT $ 20)) $)
                  (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT $ 21)) $)
                  (QREFELT $ 22))) 

(SDEFUN |ITRIGMNP;F2FG;FFG;3| ((|f| F) ($ FG))
        (SPADCALL (|ITRIGMNP;PF2FG| (SPADCALL |f| (QREFELT $ 25)) $)
                  (|ITRIGMNP;PF2FG| (SPADCALL |f| (QREFELT $ 26)) $)
                  (QREFELT $ 27))) 

(SDEFUN |ITRIGMNP;GF2FG;CFG;4| ((|f| |Complex| F) ($ FG))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 30)) (QREFELT $ 28))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 31) (|spadConstant| $ 33)
                              (QREFELT $ 34))
                    (QREFELT $ 35))
                   (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 28))
                   (QREFELT $ 37))
                  (QREFELT $ 38))) 

(SDEFUN |ITRIGMNP;GR2GF| ((|gr| |Complex| R) ($ |Complex| F))
        (SPADCALL (SPADCALL (SPADCALL |gr| (QREFELT $ 11)) (QREFELT $ 12))
                  (SPADCALL (SPADCALL |gr| (QREFELT $ 16)) (QREFELT $ 12))
                  (QREFELT $ 40))) 

(SDEFUN |ITRIGMNP;KG2F| ((|k| |Kernel| FG) ($ F))
        (SPROG ((#1=#:G158 NIL) (|a| NIL) (#2=#:G157 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 45))
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |a| NIL) (LETT #1# (SPADCALL |k| (QREFELT $ 47)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 23)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 49))))) 

(SDEFUN |ITRIGMNP;KF2FG| ((|k| |Kernel| F) ($ FG))
        (SPROG
         ((#1=#:G166 NIL) (|a| NIL) (#2=#:G165 NIL) (|op| (|BasicOperator|))
          (|akl| (|List| F)))
         (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 52)))
              (LETT |op| (SPADCALL |k| (QREFELT $ 53)))
              (COND
               ((SPADCALL |op| '|nthRoot| (QREFELT $ 56))
                (COND
                 ((SPADCALL (SPADCALL |akl| 1 (QREFELT $ 58))
                            (SPADCALL (|spadConstant| $ 13) (QREFELT $ 14))
                            (QREFELT $ 59))
                  (COND
                   ((SPADCALL (SPADCALL |akl| 2 (QREFELT $ 58))
                              (SPADCALL 2 (QREFELT $ 60)) (QREFELT $ 59))
                    (EXIT (QREFELT $ 41))))))))
              (EXIT
               (SPADCALL (SPADCALL |op| (QREFELT $ 61))
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |a| NIL) (LETT #1# |akl|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |a| (QREFELT $ 28))
                                             #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 62)))))) 

(SDEFUN |ITRIGMNP;ker2explogs|
        ((|k| |Kernel| FG) (|l| |List| (|Kernel| FG)) ($ FG))
        (SPROG
         ((|e| (FG)) (|z| (FG)) (|args| (|List| FG)) (#1=#:G179 NIL) (|a| NIL)
          (#2=#:G178 NIL) (|kf| (FG)))
         (SEQ (LETT |kf| (SPADCALL |k| (QREFELT $ 64)))
              (EXIT
               (COND
                ((NULL
                  (LETT |args|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |k| (QREFELT $ 47))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |a| |l| (QREFELT $ 66))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))
                 |kf|)
                (#3='T
                 (SEQ (LETT |z| (|SPADfirst| |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |k| '|tan| (QREFELT $ 67))
                         (SEQ
                          (LETT |e|
                                (COND
                                 ((SPADCALL |k| |l| (QREFELT $ 68))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QREFELT $ 41) |z|
                                              (QREFELT $ 37))
                                    (QREFELT $ 69))
                                   2 (QREFELT $ 70)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL 2 (QREFELT $ 41) (QREFELT $ 72))
                                    |z| (QREFELT $ 37))
                                   (QREFELT $ 69)))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT $ 41)
                                       (SPADCALL |e| (|spadConstant| $ 73)
                                                 (QREFELT $ 74))
                                       (QREFELT $ 37))
                             (SPADCALL |e| (|spadConstant| $ 73)
                                       (QREFELT $ 38))
                             (QREFELT $ 27))
                            (QREFELT $ 75)))))
                        ((SPADCALL |k| '|atan| (QREFELT $ 67))
                         (SPADCALL
                          (SPADCALL (QREFELT $ 41)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 73)
                                                (SPADCALL (QREFELT $ 41) |z|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 74))
                                      (SPADCALL (|spadConstant| $ 73)
                                                (SPADCALL (QREFELT $ 41) |z|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 38))
                                      (QREFELT $ 27))
                                     (QREFELT $ 76))
                                    (QREFELT $ 37))
                          (SPADCALL 2 (QREFELT $ 77)) (QREFELT $ 27)))
                        (#3#
                         (SPADCALL (SPADCALL |k| (QREFELT $ 44)) |args|
                                   (QREFELT $ 78)))))))))))) 

(SDEFUN |ITRIGMNP;trigs2explogs;FGLFG;9|
        ((|f| FG) (|l| |List| (|Kernel| FG)) ($ FG))
        (SPADCALL (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT $ 20)) |l| $)
                  (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT $ 21)) |l| $)
                  (QREFELT $ 27))) 

(SDEFUN |ITRIGMNP;ker2trigs_error|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SEQ (SPADCALL (SPADCALL |op| (QREFELT $ 80)) (QREFELT $ 82))
             (SPADCALL (SPADCALL |arg| (QREFELT $ 84)) (QREFELT $ 82))
             (EXIT
              (|error|
               "ker2trigs: cannot convert kernel to gaussian function")))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;11|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SPROG ((|a1| (F)) (|a| (|Complex| F)))
               (SEQ (LETT |a| (|SPADfirst| |arg|))
                    (COND
                     ((SPADCALL |op| '|Ei| (QREFELT $ 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 30))
                                  (|spadConstant| $ 32) (QREFELT $ 59))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |a| (QREFELT $ 36))
                                    (QREFELT $ 85))
                          (SPADCALL (SPADCALL |a| (QREFELT $ 36))
                                    (QREFELT $ 86))
                          (QREFELT $ 40)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT $ 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 30))
                                  (|spadConstant| $ 32) (QREFELT $ 59))
                        (EXIT
                         (SPADCALL (|spadConstant| $ 32)
                                   (SPADCALL (SPADCALL |a| (QREFELT $ 36))
                                             (QREFELT $ 87))
                                   (QREFELT $ 40)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT $ 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 30))
                                  (SPADCALL |a| (QREFELT $ 36)) (QREFELT $ 59))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |a| (QREFELT $ 30))
                                           (QREFELT $ 88))
                                 (SPADCALL (SPADCALL (QREFELT $ 89))
                                           (QREFELT $ 15))
                                 (QREFELT $ 22)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13)
                                      (|spadConstant| $ 13) (QREFELT $ 40))
                            (SPADCALL (SPADCALL |a1| (QREFELT $ 90))
                                      (SPADCALL (SPADCALL |a1| (QREFELT $ 91))
                                                (QREFELT $ 14))
                                      (QREFELT $ 40))
                            (QREFELT $ 92)))))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT $ 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT $ 30))
                                  (SPADCALL (SPADCALL |a| (QREFELT $ 36))
                                            (QREFELT $ 14))
                                  (QREFELT $ 59))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |a| (QREFELT $ 30))
                                           (QREFELT $ 88))
                                 (SPADCALL (SPADCALL (QREFELT $ 89))
                                           (QREFELT $ 15))
                                 (QREFELT $ 22)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13)
                                      (SPADCALL (|spadConstant| $ 13)
                                                (QREFELT $ 14))
                                      (QREFELT $ 40))
                            (SPADCALL (SPADCALL |a1| (QREFELT $ 90))
                                      (SPADCALL |a1| (QREFELT $ 91))
                                      (QREFELT $ 40))
                            (QREFELT $ 92)))))))))
                    (EXIT (|ITRIGMNP;ker2trigs_error| |op| |arg| $))))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;12|
        ((|op| |BasicOperator|) (|args| |List| (|Complex| F)) ($ |Complex| F))
        (|ITRIGMNP;ker2trigs_error| |op| |args| $)) 

(SDEFUN |ITRIGMNP;ker2trigs|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SPROG
         ((#1=#:G239 NIL) (|x| NIL) (#2=#:G238 NIL) (#3=#:G237 NIL)
          (#4=#:G236 NIL) (|a| (|Complex| F)) (#5=#:G235 NIL) (#6=#:G234 NIL)
          (#7=#:G197 NIL) (#8=#:G196 #9=(|Boolean|)) (#10=#:G198 #9#)
          (#11=#:G233 NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #7# NIL)
             (SEQ (LETT |x| NIL) (LETT #11# |arg|) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |x| (CAR #11#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #10#
                           (SPADCALL (SPADCALL |x| (QREFELT $ 36))
                                     (QREFELT $ 94)))
                     (COND (#7# (LETT #8# (COND (#8# #10#) ('T NIL))))
                           ('T (PROGN (LETT #8# #10#) (LETT #7# 'T)))))))
                  (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
             (COND (#7# #8#) (#12='T 'T)))
            (SPADCALL
             (SPADCALL |op|
                       (PROGN
                        (LETT #6# NIL)
                        (SEQ (LETT |x| NIL) (LETT #5# |arg|) G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS (SPADCALL |x| (QREFELT $ 30))
                                           #6#))))
                             (LETT #5# (CDR #5#)) (GO G190) G191
                             (EXIT (NREVERSE #6#))))
                       (QREFELT $ 95))
             (|spadConstant| $ 32) (QREFELT $ 40)))
           (#12#
            (SEQ (LETT |a| (|SPADfirst| |arg|))
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|exp| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 96)))
                   ((SPADCALL |op| '|log| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 97)))
                   ((SPADCALL |op| '|sin| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 98)))
                   ((SPADCALL |op| '|cos| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 99)))
                   ((SPADCALL |op| '|tan| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 100)))
                   ((SPADCALL |op| '|cot| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 101)))
                   ((SPADCALL |op| '|sec| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 102)))
                   ((SPADCALL |op| '|csc| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 103)))
                   ((SPADCALL |op| '|asin| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 104)))
                   ((SPADCALL |op| '|acos| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 105)))
                   ((SPADCALL |op| '|atan| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 106)))
                   ((SPADCALL |op| '|acot| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 107)))
                   ((SPADCALL |op| '|asec| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 108)))
                   ((SPADCALL |op| '|acsc| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 109)))
                   ((SPADCALL |op| '|sinh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 110)))
                   ((SPADCALL |op| '|cosh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 111)))
                   ((SPADCALL |op| '|tanh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 112)))
                   ((SPADCALL |op| '|coth| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 113)))
                   ((SPADCALL |op| '|sech| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 114)))
                   ((SPADCALL |op| '|csch| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 115)))
                   ((SPADCALL |op| '|asinh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 116)))
                   ((SPADCALL |op| '|acosh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 117)))
                   ((SPADCALL |op| '|atanh| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 118)))
                   ((SPADCALL |op| '|acoth| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 119)))
                   ((SPADCALL |op| '|asech| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 120)))
                   ((SPADCALL |op| '|acsch| (QREFELT $ 56))
                    (SPADCALL |a| (QREFELT $ 121)))
                   ((SPADCALL |op| '|abs| (QREFELT $ 56))
                    (SPADCALL
                     (SPADCALL (SPADCALL |a| (QREFELT $ 122)) (QREFELT $ 15))
                     (QREFELT $ 123)))
                   (#12#
                    (SEQ
                     (COND
                      ((QREFELT $ 9)
                       (COND
                        ((SPADCALL |op| '|nthRoot| (QREFELT $ 56))
                         (EXIT
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |arg| (QREFELT $ 124))
                                              (QREFELT $ 125))
                                    (QREFELT $ 126)))))))
                     (EXIT
                      (COND
                       ((SPADCALL |op| '|%iint| (QREFELT $ 56))
                        (SPADCALL
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #3# |arg|) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |x| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT $ 30))
                                                  #4#))))
                                         (LETT #3# (CDR #3#)) (GO G190) G191
                                         (EXIT (NREVERSE #4#))))
                                   (QREFELT $ 95))
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #1# |arg|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |x| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT $ 36))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 95))
                         (QREFELT $ 40)))
                       (#12# (SPADCALL |op| |arg| (QREFELT $ 93))))))))))))))) 

(SDEFUN |ITRIGMNP;sup2trigs|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (|f| |Complex| F) ($ |Complex| F))
        (SPADCALL
         (SPADCALL (CONS (|function| |ITRIGMNP;smp2trigs|) $) |p|
                   (QREFELT $ 131))
         |f| (QREFELT $ 132))) 

(SDEFUN |ITRIGMNP;smp2trigs|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         ($ |Complex| F))
        (SPADCALL (CONS #'|ITRIGMNP;smp2trigs!0| $)
                  (CONS (|function| |ITRIGMNP;GR2GF|) $) |p| (QREFELT $ 138))) 

(SDEFUN |ITRIGMNP;smp2trigs!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (QREFELT $ 133))) 

(SDEFUN |ITRIGMNP;explogs2trigs;FGC;16| ((|f| FG) ($ |Complex| F))
        (SPROG
         ((|g| #1=(|Complex| F)) (|b| (|Integer|)) (|gi| #1#) (|y| (F))
          (|e| (F))
          (|den|
           #2=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
          (|num| #2#) (|arg| (|List| (|Complex| F))) (#3=#:G255 NIL) (|x| NIL)
          (#4=#:G254 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| FG))
          (|m| (|Union| (|Kernel| FG) "failed"))
          (|df| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
          (|nf| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
         (SEQ (LETT |nf| (SPADCALL |f| (QREFELT $ 20)))
              (LETT |df| (SPADCALL |f| (QREFELT $ 21)))
              (LETT |m| (SPADCALL |f| (QREFELT $ 140)))
              (EXIT
               (COND
                ((QEQCAR |m| 1)
                 (SPADCALL (|ITRIGMNP;GR2GF| (SPADCALL |nf| (QREFELT $ 141)) $)
                           (|ITRIGMNP;GR2GF| (SPADCALL |df| (QREFELT $ 141)) $)
                           (QREFELT $ 142)))
                (#5='T
                 (SEQ
                  (LETT |op|
                        (SPADCALL
                         (SPADCALL (LETT |k| (QCDR |m|)) (QREFELT $ 44))
                         (QREFELT $ 45)))
                  (LETT |arg|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #3# (SPADCALL |k| (QREFELT $ 47))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |x| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS (SPADCALL |x| (QREFELT $ 133))
                                            #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (LETT |num| (SPADCALL |nf| |k| (QREFELT $ 144)))
                  (LETT |den| (SPADCALL |df| |k| (QREFELT $ 144)))
                  (EXIT
                   (COND
                    ((SPADCALL |op| '|exp| (QREFELT $ 56))
                     (SEQ
                      (LETT |e|
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 30))
                             (QREFELT $ 145)))
                      (LETT |y| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 36)))
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL |e| (SPADCALL |y| (QREFELT $ 146))
                                       (QREFELT $ 17))
                             (SPADCALL |e| (SPADCALL |y| (QREFELT $ 147))
                                       (QREFELT $ 17))
                             (QREFELT $ 40)))
                      (LETT |gi|
                            (SPADCALL
                             (SPADCALL (SPADCALL |y| (QREFELT $ 146)) |e|
                                       (QREFELT $ 22))
                             (SPADCALL
                              (SPADCALL (SPADCALL |y| (QREFELT $ 147)) |e|
                                        (QREFELT $ 22))
                              (QREFELT $ 14))
                             (QREFELT $ 40)))
                      (EXIT
                       (SPADCALL
                        (|ITRIGMNP;supexp| |num| |g| |gi|
                         (LETT |b|
                               (QUOTIENT2 (SPADCALL |num| (QREFELT $ 149)) 2))
                         $)
                        (|ITRIGMNP;supexp| |den| |g| |gi| |b| $)
                        (QREFELT $ 142)))))
                    (#5#
                     (SPADCALL
                      (|ITRIGMNP;sup2trigs| |num|
                       (LETT |g| (|ITRIGMNP;ker2trigs| |op| |arg| $)) $)
                      (|ITRIGMNP;sup2trigs| |den| |g| $)
                      (QREFELT $ 142)))))))))))) 

(SDEFUN |ITRIGMNP;supexp|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (|f1| |Complex| F) (|f2| |Complex| F) (|bse| |Integer|)
         ($ |Complex| F))
        (SPROG ((|ans| (|Complex| F)) (|d| (|Integer|)) (|g| (|Complex| F)))
               (SEQ (LETT |ans| (|spadConstant| $ 150))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 151)
                                      (QREFELT $ 152)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 153))
                                           (QREFELT $ 154))
                                 (QREFELT $ 133)))
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT $ 149)) |bse|))
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT $
                                                                           155))
                                                        (QREFELT $ 92))
                                              (QREFELT $ 156))))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT $
                                                                           155))
                                                        (QREFELT $ 92))
                                              (QREFELT $ 156)))))))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 157)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |ITRIGMNP;PG2F|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         ($ F))
        (SPADCALL (CONS (|function| |ITRIGMNP;KG2F|) $)
                  (CONS (|function| |ITRIGMNP;GR2F|) $) |p| (QREFELT $ 161))) 

(SDEFUN |ITRIGMNP;PF2FG|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ FG))
        (SPADCALL (CONS (|function| |ITRIGMNP;KF2FG|) $)
                  (CONS #'|ITRIGMNP;PF2FG!0| $) |p| (QREFELT $ 167))) 

(SDEFUN |ITRIGMNP;PF2FG!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 162)) (QREFELT $ 35))) 

(SDEFUN |ITRIGMNP;smp2explogs|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         (|l| |List| (|Kernel| FG)) ($ FG))
        (SPROG NIL
               (SPADCALL (CONS #'|ITRIGMNP;smp2explogs!0| (VECTOR $ |l|))
                         (ELT $ 35) |p| (QREFELT $ 171)))) 

(SDEFUN |ITRIGMNP;smp2explogs!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|ITRIGMNP;ker2explogs| |x| |l| $))))) 

(DECLAIM (NOTINLINE |InnerTrigonometricManipulations;|)) 

(DEFUN |InnerTrigonometricManipulations| (&REST #1=#:G269)
  (SPROG NIL
         (PROG (#2=#:G270)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerTrigonometricManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerTrigonometricManipulations;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerTrigonometricManipulations|)))))))))) 

(DEFUN |InnerTrigonometricManipulations;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|InnerTrigonometricManipulations| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 172))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InnerTrigonometricManipulations|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
                    (COND
                     ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                      (|HasCategory| |#2| '(|RadicalCategory|)))
                     ('T NIL)))
          (QSETREFV $ 41
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 31) (|spadConstant| $ 33)
                               (QREFELT $ 34))
                     (QREFELT $ 35)))
          (COND
           ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
            (QSETREFV $ 93
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;11|)
                            $)))
           ('T
            (QSETREFV $ 93
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;12|)
                            $))))
          $))) 

(MAKEPROP '|InnerTrigonometricManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nth| (|Complex| 6) (0 . |real|) (5 . |coerce|)
              (10 . |One|) (14 . -) (19 . |sqrt|) (24 . |imag|) (29 . *)
              (35 . +) (|SparseMultivariatePolynomial| 10 63) (41 . |numer|)
              (46 . |denom|) (51 . /) |ITRIGMNP;FG2F;FGF;2|
              (|SparseMultivariatePolynomial| 6 63) (57 . |numer|)
              (62 . |denom|) (67 . /) |ITRIGMNP;F2FG;FFG;3| (|Complex| 7)
              (73 . |real|) (78 . |Zero|) (82 . |Zero|) (86 . |One|)
              (90 . |complex|) (96 . |coerce|) (101 . |imag|) (106 . *)
              (112 . +) |ITRIGMNP;GF2FG;CFG;4| (118 . |complex|) '|im|
              (|BasicOperator|) (|Kernel| 8) (124 . |operator|)
              (129 . |operator|) (|List| 8) (134 . |argument|) (|List| $)
              (139 . |kernel|) (|List| 7) (|Kernel| 7) (145 . |argument|)
              (150 . |operator|) (|Boolean|) (|Symbol|) (155 . |is?|)
              (|Integer|) (161 . |elt|) (167 . =) (173 . |coerce|)
              (178 . |operator|) (183 . |kernel|) (|Kernel| $) (189 . |coerce|)
              (|List| 43) |ITRIGMNP;trigs2explogs;FGLFG;9| (194 . |is?|)
              (200 . |member?|) (206 . |exp|) (211 . ^) (|PositiveInteger|)
              (217 . *) (223 . |One|) (227 . -) (233 . -) (238 . |log|)
              (243 . |coerce|) (248 . |elt|) (|OutputForm|) (254 . |coerce|)
              (|Void|) (259 . |print|) (|List| 29) (264 . |coerce|)
              (269 . |Ci|) (274 . |Si|) (279 . |erfi|) (284 . *) (290 . |pi|)
              (294 . |fresnelC|) (299 . |fresnelS|) (304 . *) (310 . |do_liou|)
              (316 . |zero?|) (321 . |elt|) (327 . |exp|) (332 . |log|)
              (337 . |sin|) (342 . |cos|) (347 . |tan|) (352 . |cot|)
              (357 . |sec|) (362 . |csc|) (367 . |asin|) (372 . |acos|)
              (377 . |atan|) (382 . |acot|) (387 . |asec|) (392 . |acsc|)
              (397 . |sinh|) (402 . |cosh|) (407 . |tanh|) (412 . |coth|)
              (417 . |sech|) (422 . |csch|) (427 . |asinh|) (432 . |acosh|)
              (437 . |atanh|) (442 . |acoth|) (447 . |asech|) (452 . |acsch|)
              (457 . |norm|) (462 . |coerce|) (467 . |second|)
              (472 . |retract|) (477 . |nthRoot|)
              (|SparseUnivariatePolynomial| 29) (|Mapping| 29 136)
              (|SparseUnivariatePolynomial| 136)
              (|SparseUnivariatePolynomialFunctions2| 136 29) (483 . |map|)
              (489 . |elt|) |ITRIGMNP;explogs2trigs;FGC;16| (|Mapping| 29 43)
              (|Mapping| 29 10) (|SparseMultivariatePolynomial| 10 43)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 136
                                           29)
              (495 . |map|) (|Union| 63 '"failed") (502 . |mainKernel|)
              (507 . |retract|) (512 . /) (|SparseUnivariatePolynomial| $)
              (518 . |univariate|) (524 . |exp|) (529 . |cos|) (534 . |sin|)
              (|NonNegativeInteger|) (539 . |degree|) (544 . |Zero|)
              (548 . |Zero|) (552 . ~=) (558 . |leadingCoefficient|)
              (563 . |coerce|) (568 . ^) (574 . +) (580 . |reductum|)
              (|Mapping| 7 43) (|Mapping| 7 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 136 7)
              (585 . |map|) (592 . |coerce|) (|Mapping| 8 51) (|Mapping| 8 6)
              (|SparseMultivariatePolynomial| 6 51)
              (|PolynomialCategoryLifting| (|IndexedExponents| 51) 51 6 165 8)
              (597 . |map|) (|Mapping| 8 43) (|Mapping| 8 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 136 8)
              (604 . |map|))
           '#(|trigs2explogs| 611 |explogs2trigs| 617 |do_liou| 622 GF2FG 628
              FG2F 633 F2FG 638)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 171
                                                 '(1 10 6 0 11 1 7 0 6 12 0 7 0
                                                   13 1 7 0 0 14 1 7 0 0 15 1
                                                   10 6 0 16 2 7 0 0 0 17 2 7 0
                                                   0 0 18 1 8 19 0 20 1 8 19 0
                                                   21 2 7 0 0 0 22 1 7 24 0 25
                                                   1 7 24 0 26 2 8 0 0 0 27 1
                                                   29 7 0 30 0 6 0 31 0 7 0 32
                                                   0 6 0 33 2 10 0 6 6 34 1 8 0
                                                   10 35 1 29 7 0 36 2 8 0 0 0
                                                   37 2 8 0 0 0 38 2 29 0 7 7
                                                   40 1 43 42 0 44 1 7 42 42 45
                                                   1 43 46 0 47 2 7 0 42 48 49
                                                   1 51 50 0 52 1 51 42 0 53 2
                                                   42 54 0 55 56 2 50 7 0 57 58
                                                   2 7 54 0 0 59 1 7 0 57 60 1
                                                   8 42 42 61 2 8 0 42 48 62 1
                                                   8 0 63 64 2 43 54 0 55 67 2
                                                   65 54 43 0 68 1 8 0 0 69 2 8
                                                   0 0 57 70 2 8 0 71 0 72 0 8
                                                   0 73 2 8 0 0 0 74 1 8 0 0 75
                                                   1 8 0 0 76 1 8 0 57 77 2 8 0
                                                   42 48 78 1 42 79 0 80 1 79
                                                   81 0 82 1 83 79 0 84 1 7 0 0
                                                   85 1 7 0 0 86 1 7 0 0 87 2 7
                                                   0 71 0 88 0 7 0 89 1 7 0 0
                                                   90 1 7 0 0 91 2 29 0 0 0 92
                                                   2 0 29 42 83 93 1 7 54 0 94
                                                   2 7 0 42 48 95 1 29 0 0 96 1
                                                   29 0 0 97 1 29 0 0 98 1 29 0
                                                   0 99 1 29 0 0 100 1 29 0 0
                                                   101 1 29 0 0 102 1 29 0 0
                                                   103 1 29 0 0 104 1 29 0 0
                                                   105 1 29 0 0 106 1 29 0 0
                                                   107 1 29 0 0 108 1 29 0 0
                                                   109 1 29 0 0 110 1 29 0 0
                                                   111 1 29 0 0 112 1 29 0 0
                                                   113 1 29 0 0 114 1 29 0 0
                                                   115 1 29 0 0 116 1 29 0 0
                                                   117 1 29 0 0 118 1 29 0 0
                                                   119 1 29 0 0 120 1 29 0 0
                                                   121 1 29 7 0 122 1 29 0 7
                                                   123 1 83 29 0 124 1 29 57 0
                                                   125 2 29 0 0 57 126 2 130
                                                   127 128 129 131 2 127 29 0
                                                   29 132 3 137 29 134 135 136
                                                   138 1 8 139 0 140 1 136 10 0
                                                   141 2 29 0 0 0 142 2 136 143
                                                   0 43 144 1 7 0 0 145 1 7 0 0
                                                   146 1 7 0 0 147 1 129 148 0
                                                   149 0 29 0 150 0 129 0 151 2
                                                   129 54 0 0 152 1 129 136 0
                                                   153 1 8 0 19 154 2 29 0 0 57
                                                   155 2 29 0 0 0 156 1 129 0 0
                                                   157 3 160 7 158 159 136 161
                                                   1 10 0 6 162 3 166 8 163 164
                                                   165 167 3 170 8 168 169 136
                                                   171 2 0 8 8 65 66 1 0 29 8
                                                   133 2 0 29 42 83 93 1 0 8 29
                                                   39 1 0 7 8 23 1 0 8 7
                                                   28)))))
           '|lookupComplete|)) 
