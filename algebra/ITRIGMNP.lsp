
(SDEFUN |ITRIGMNP;GR2F| ((|g| |Complex| R) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 11)) (QREFELT $ 12))
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 13) (QREFELT $ 14))
                             (QREFELT $ 15))
                   (SPADCALL (SPADCALL |g| (QREFELT $ 16)) (QREFELT $ 12))
                   (QREFELT $ 17))
                  (QREFELT $ 18))) 

(SDEFUN |ITRIGMNP;KG2F| ((|k| |Kernel| FG) ($ F))
        (SPADCALL (ELT $ 19) |k| (QREFELT $ 23))) 

(SDEFUN |ITRIGMNP;FG2F;FGF;3| ((|f| FG) ($ F))
        (SPADCALL (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT $ 25)) $)
                  (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT $ 26)) $)
                  (QREFELT $ 27))) 

(SDEFUN |ITRIGMNP;F2FG;FFG;4| ((|f| F) ($ FG))
        (SPADCALL (ELT $ 28) |f| (QREFELT $ 31))) 

(SDEFUN |ITRIGMNP;GF2FG;CFG;5| ((|f| |Complex| F) ($ FG))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 34)) (QREFELT $ 32))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 35) (|spadConstant| $ 37)
                              (QREFELT $ 38))
                    (QREFELT $ 39))
                   (SPADCALL (SPADCALL |f| (QREFELT $ 40)) (QREFELT $ 32))
                   (QREFELT $ 41))
                  (QREFELT $ 42))) 

(SDEFUN |ITRIGMNP;GR2GF| ((|gr| |Complex| R) ($ |Complex| F))
        (SPADCALL (SPADCALL (SPADCALL |gr| (QREFELT $ 11)) (QREFELT $ 12))
                  (SPADCALL (SPADCALL |gr| (QREFELT $ 16)) (QREFELT $ 12))
                  (QREFELT $ 44))) 

(SDEFUN |ITRIGMNP;ker2explogs|
        ((|k| |Kernel| FG) (|l| |List| (|Kernel| FG)) ($ FG))
        (SPROG
         ((|e| (FG)) (|z| (FG)) (|args| (|List| FG)) (#1=#:G166 NIL) (|a| NIL)
          (#2=#:G165 NIL) (|kf| (FG)))
         (SEQ
          (LETT |kf| (SPADCALL |k| (QREFELT $ 47))
                . #3=(|ITRIGMNP;ker2explogs|))
          (EXIT
           (COND
            ((NULL
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |a| NIL . #3#)
                          (LETT #1# (SPADCALL |k| (QREFELT $ 49)) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |a| |l| (QREFELT $ 51)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#))
             |kf|)
            (#4='T
             (SEQ (LETT |z| (|SPADfirst| |args|) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |k| '|tan| (QREFELT $ 54))
                     (SEQ
                      (LETT |e|
                            (COND
                             ((SPADCALL |k| |l| (QREFELT $ 55))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (QREFELT $ 45) |z| (QREFELT $ 41))
                                (QREFELT $ 56))
                               2 (QREFELT $ 58)))
                             (#4#
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 2 (QREFELT $ 45) (QREFELT $ 60)) |z|
                                (QREFELT $ 41))
                               (QREFELT $ 56))))
                            . #3#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QREFELT $ 45)
                                   (SPADCALL |e| (|spadConstant| $ 61)
                                             (QREFELT $ 62))
                                   (QREFELT $ 41))
                         (SPADCALL |e| (|spadConstant| $ 61) (QREFELT $ 42))
                         (QREFELT $ 63))
                        (QREFELT $ 64)))))
                    ((SPADCALL |k| '|atan| (QREFELT $ 54))
                     (SPADCALL
                      (SPADCALL (QREFELT $ 45)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 61)
                                            (SPADCALL (QREFELT $ 45) |z|
                                                      (QREFELT $ 41))
                                            (QREFELT $ 62))
                                  (SPADCALL (|spadConstant| $ 61)
                                            (SPADCALL (QREFELT $ 45) |z|
                                                      (QREFELT $ 41))
                                            (QREFELT $ 42))
                                  (QREFELT $ 63))
                                 (QREFELT $ 65))
                                (QREFELT $ 41))
                      (SPADCALL 2 (QREFELT $ 66)) (QREFELT $ 63)))
                    (#4#
                     (SPADCALL (SPADCALL |k| (QREFELT $ 68)) |args|
                               (QREFELT $ 70)))))))))))) 

(SDEFUN |ITRIGMNP;trigs2explogs;FGLFG;8|
        ((|f| FG) (|l| |List| (|Kernel| FG)) ($ FG))
        (SPADCALL (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT $ 25)) |l| $)
                  (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT $ 26)) |l| $)
                  (QREFELT $ 63))) 

(SDEFUN |ITRIGMNP;ker2trigs_error|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SEQ (SPADCALL (SPADCALL |op| (QREFELT $ 72)) (QREFELT $ 74))
             (SPADCALL (SPADCALL |arg| (QREFELT $ 76)) (QREFELT $ 74))
             (EXIT
              (|error|
               "ker2trigs: cannot convert kernel to gaussian function")))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;10|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SPROG ((|a1| (F)) (|a| (|Complex| F)))
               (SEQ
                (LETT |a| (|SPADfirst| |arg|)
                      . #1=(|ITRIGMNP;do_liou;BoLC;10|))
                (COND
                 ((SPADCALL |op| '|Ei| (QREFELT $ 77))
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 34))
                              (|spadConstant| $ 36) (QREFELT $ 78))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 79))
                      (SPADCALL (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 80))
                      (QREFELT $ 44)))))))
                (COND
                 ((SPADCALL |op| '|erf| (QREFELT $ 77))
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 34))
                              (|spadConstant| $ 36) (QREFELT $ 78))
                    (EXIT
                     (SPADCALL (|spadConstant| $ 36)
                               (SPADCALL (SPADCALL |a| (QREFELT $ 40))
                                         (QREFELT $ 81))
                               (QREFELT $ 44)))))))
                (COND
                 ((SPADCALL |op| '|erf| (QREFELT $ 77))
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 34))
                              (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 78))
                    (EXIT
                     (SEQ
                      (LETT |a1|
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL |a| (QREFELT $ 34))
                                       (QREFELT $ 82))
                             (SPADCALL (SPADCALL (QREFELT $ 83))
                                       (QREFELT $ 15))
                             (QREFELT $ 27))
                            . #1#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 13) (|spadConstant| $ 13)
                                  (QREFELT $ 44))
                        (SPADCALL (SPADCALL |a1| (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |a1| (QREFELT $ 85))
                                            (QREFELT $ 14))
                                  (QREFELT $ 44))
                        (QREFELT $ 86)))))))))
                (COND
                 ((SPADCALL |op| '|erf| (QREFELT $ 77))
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 34))
                              (SPADCALL (SPADCALL |a| (QREFELT $ 40))
                                        (QREFELT $ 14))
                              (QREFELT $ 78))
                    (EXIT
                     (SEQ
                      (LETT |a1|
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL |a| (QREFELT $ 34))
                                       (QREFELT $ 82))
                             (SPADCALL (SPADCALL (QREFELT $ 83))
                                       (QREFELT $ 15))
                             (QREFELT $ 27))
                            . #1#)
                      (EXIT
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 13)
                                  (SPADCALL (|spadConstant| $ 13)
                                            (QREFELT $ 14))
                                  (QREFELT $ 44))
                        (SPADCALL (SPADCALL |a1| (QREFELT $ 84))
                                  (SPADCALL |a1| (QREFELT $ 85))
                                  (QREFELT $ 44))
                        (QREFELT $ 86)))))))))
                (EXIT (|ITRIGMNP;ker2trigs_error| |op| |arg| $))))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;11|
        ((|op| |BasicOperator|) (|args| |List| (|Complex| F)) ($ |Complex| F))
        (|ITRIGMNP;ker2trigs_error| |op| |args| $)) 

(SDEFUN |ITRIGMNP;ker2trigs|
        ((|op| |BasicOperator|) (|arg| |List| (|Complex| F)) ($ |Complex| F))
        (SPROG
         ((#1=#:G226 NIL) (|x| NIL) (#2=#:G225 NIL) (#3=#:G224 NIL)
          (#4=#:G223 NIL) (|a| (|Complex| F)) (#5=#:G222 NIL) (#6=#:G221 NIL)
          (#7=#:G184 NIL) (#8=#:G183 #9=(|Boolean|)) (#10=#:G185 #9#)
          (#11=#:G220 NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #7# NIL . #12=(|ITRIGMNP;ker2trigs|))
             (SEQ (LETT |x| NIL . #12#) (LETT #11# |arg| . #12#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |x| (CAR #11#) . #12#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #10#
                           (SPADCALL (SPADCALL |x| (QREFELT $ 40))
                                     (QREFELT $ 88))
                           . #12#)
                     (COND (#7# (LETT #8# (COND (#8# #10#) ('T 'NIL)) . #12#))
                           ('T
                            (PROGN
                             (LETT #8# #10# . #12#)
                             (LETT #7# 'T . #12#)))))))
                  (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
             (COND (#7# #8#) (#13='T 'T)))
            (SPADCALL
             (SPADCALL |op|
                       (PROGN
                        (LETT #6# NIL . #12#)
                        (SEQ (LETT |x| NIL . #12#) (LETT #5# |arg| . #12#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |x| (CAR #5#) . #12#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS (SPADCALL |x| (QREFELT $ 34)) #6#)
                                     . #12#)))
                             (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                             (EXIT (NREVERSE #6#))))
                       (QREFELT $ 89))
             (|spadConstant| $ 36) (QREFELT $ 44)))
           (#13#
            (SEQ (LETT |a| (|SPADfirst| |arg|) . #12#)
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|exp| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 90)))
                   ((SPADCALL |op| '|log| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 91)))
                   ((SPADCALL |op| '|sin| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 92)))
                   ((SPADCALL |op| '|cos| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 93)))
                   ((SPADCALL |op| '|tan| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 94)))
                   ((SPADCALL |op| '|cot| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 95)))
                   ((SPADCALL |op| '|sec| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 96)))
                   ((SPADCALL |op| '|csc| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 97)))
                   ((SPADCALL |op| '|asin| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 98)))
                   ((SPADCALL |op| '|acos| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 99)))
                   ((SPADCALL |op| '|atan| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 100)))
                   ((SPADCALL |op| '|acot| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 101)))
                   ((SPADCALL |op| '|asec| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 102)))
                   ((SPADCALL |op| '|acsc| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 103)))
                   ((SPADCALL |op| '|sinh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 104)))
                   ((SPADCALL |op| '|cosh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 105)))
                   ((SPADCALL |op| '|tanh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 106)))
                   ((SPADCALL |op| '|coth| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 107)))
                   ((SPADCALL |op| '|sech| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 108)))
                   ((SPADCALL |op| '|csch| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 109)))
                   ((SPADCALL |op| '|asinh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 110)))
                   ((SPADCALL |op| '|acosh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 111)))
                   ((SPADCALL |op| '|atanh| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 112)))
                   ((SPADCALL |op| '|acoth| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 113)))
                   ((SPADCALL |op| '|asech| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 114)))
                   ((SPADCALL |op| '|acsch| (QREFELT $ 77))
                    (SPADCALL |a| (QREFELT $ 115)))
                   ((SPADCALL |op| '|abs| (QREFELT $ 77))
                    (SPADCALL
                     (SPADCALL (SPADCALL |a| (QREFELT $ 116)) (QREFELT $ 15))
                     (QREFELT $ 117)))
                   (#13#
                    (SEQ
                     (COND
                      ((QREFELT $ 9)
                       (COND
                        ((SPADCALL |op| '|nthRoot| (QREFELT $ 77))
                         (EXIT
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |arg| (QREFELT $ 118))
                                              (QREFELT $ 119))
                                    (QREFELT $ 120)))))))
                     (EXIT
                      (COND
                       ((SPADCALL |op| '|%iint| (QREFELT $ 77))
                        (SPADCALL
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #4# NIL . #12#)
                                    (SEQ (LETT |x| NIL . #12#)
                                         (LETT #3# |arg| . #12#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |x| (CAR #3#) . #12#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT $ 34))
                                                  #4#)
                                                 . #12#)))
                                         (LETT #3# (CDR #3#) . #12#) (GO G190)
                                         G191 (EXIT (NREVERSE #4#))))
                                   (QREFELT $ 89))
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #2# NIL . #12#)
                                    (SEQ (LETT |x| NIL . #12#)
                                         (LETT #1# |arg| . #12#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |x| (CAR #1#) . #12#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT $ 40))
                                                  #2#)
                                                 . #12#)))
                                         (LETT #1# (CDR #1#) . #12#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 89))
                         (QREFELT $ 44)))
                       (#13# (SPADCALL |op| |arg| (QREFELT $ 87))))))))))))))) 

(SDEFUN |ITRIGMNP;sup2trigs|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (|f| |Complex| F) ($ |Complex| F))
        (SPADCALL
         (SPADCALL (CONS (|function| |ITRIGMNP;smp2trigs|) $) |p|
                   (QREFELT $ 125))
         |f| (QREFELT $ 126))) 

(SDEFUN |ITRIGMNP;smp2trigs|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         ($ |Complex| F))
        (SPADCALL (CONS #'|ITRIGMNP;smp2trigs!0| $)
                  (CONS (|function| |ITRIGMNP;GR2GF|) $) |p| (QREFELT $ 132))) 

(SDEFUN |ITRIGMNP;smp2trigs!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 127))) 

(SDEFUN |ITRIGMNP;explogs2trigs;FGC;15| ((|f| FG) ($ |Complex| F))
        (SPROG
         ((|g| #1=(|Complex| F)) (|b| (|Integer|)) (|gi| #1#) (|y| (F))
          (|e| (F))
          (|den|
           #2=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
          (|num| #2#) (|arg| (|List| (|Complex| F))) (#3=#:G242 NIL) (|x| NIL)
          (#4=#:G241 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| FG))
          (|m| (|Union| (|Kernel| FG) "failed"))
          (|df| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
          (|nf| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
         (SEQ
          (LETT |nf| (SPADCALL |f| (QREFELT $ 25))
                . #5=(|ITRIGMNP;explogs2trigs;FGC;15|))
          (LETT |df| (SPADCALL |f| (QREFELT $ 26)) . #5#)
          (LETT |m| (SPADCALL |f| (QREFELT $ 134)) . #5#)
          (EXIT
           (COND
            ((QEQCAR |m| 1)
             (SPADCALL (|ITRIGMNP;GR2GF| (SPADCALL |nf| (QREFELT $ 135)) $)
                       (|ITRIGMNP;GR2GF| (SPADCALL |df| (QREFELT $ 135)) $)
                       (QREFELT $ 136)))
            (#6='T
             (SEQ
              (LETT |op|
                    (SPADCALL
                     (SPADCALL (LETT |k| (QCDR |m|) . #5#) (QREFELT $ 68))
                     (QREFELT $ 137))
                    . #5#)
              (LETT |arg|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |x| NIL . #5#)
                          (LETT #3# (SPADCALL |k| (QREFELT $ 49)) . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL |x| (QREFELT $ 127)) #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (LETT |num| (SPADCALL |nf| |k| (QREFELT $ 139)) . #5#)
              (LETT |den| (SPADCALL |df| |k| (QREFELT $ 139)) . #5#)
              (EXIT
               (COND
                ((SPADCALL |op| '|exp| (QREFELT $ 77))
                 (SEQ
                  (LETT |e|
                        (SPADCALL (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 34))
                                  (QREFELT $ 140))
                        . #5#)
                  (LETT |y| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 40))
                        . #5#)
                  (LETT |g|
                        (SPADCALL
                         (SPADCALL |e| (SPADCALL |y| (QREFELT $ 141))
                                   (QREFELT $ 17))
                         (SPADCALL |e| (SPADCALL |y| (QREFELT $ 142))
                                   (QREFELT $ 17))
                         (QREFELT $ 44))
                        . #5#)
                  (LETT |gi|
                        (SPADCALL
                         (SPADCALL (SPADCALL |y| (QREFELT $ 141)) |e|
                                   (QREFELT $ 27))
                         (SPADCALL
                          (SPADCALL (SPADCALL |y| (QREFELT $ 142)) |e|
                                    (QREFELT $ 27))
                          (QREFELT $ 14))
                         (QREFELT $ 44))
                        . #5#)
                  (EXIT
                   (SPADCALL
                    (|ITRIGMNP;supexp| |num| |g| |gi|
                     (LETT |b| (QUOTIENT2 (SPADCALL |num| (QREFELT $ 144)) 2)
                           . #5#)
                     $)
                    (|ITRIGMNP;supexp| |den| |g| |gi| |b| $)
                    (QREFELT $ 136)))))
                (#6#
                 (SPADCALL
                  (|ITRIGMNP;sup2trigs| |num|
                   (LETT |g| (|ITRIGMNP;ker2trigs| |op| |arg| $) . #5#) $)
                  (|ITRIGMNP;sup2trigs| |den| |g| $) (QREFELT $ 136)))))))))))) 

(SDEFUN |ITRIGMNP;supexp|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (|f1| |Complex| F) (|f2| |Complex| F) (|bse| |Integer|)
         ($ |Complex| F))
        (SPROG ((|ans| (|Complex| F)) (|d| (|Integer|)) (|g| (|Complex| F)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 145) . #1=(|ITRIGMNP;supexp|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 146) (QREFELT $ 147)))
                       (GO G191)))
                     (SEQ
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL (SPADCALL |p| (QREFELT $ 148))
                                       (QREFELT $ 149))
                             (QREFELT $ 127))
                            . #1#)
                      (SEQ
                       (LETT |d| (- (SPADCALL |p| (QREFELT $ 144)) |bse|)
                             . #1#)
                       (EXIT
                        (COND
                         ((>= |d| 0)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL |g|
                                                    (SPADCALL |f1| |d|
                                                              (QREFELT $ 150))
                                                    (QREFELT $ 86))
                                          (QREFELT $ 151))
                                . #1#))
                         ('T
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL |g|
                                                    (SPADCALL |f2| (- |d|)
                                                              (QREFELT $ 150))
                                                    (QREFELT $ 86))
                                          (QREFELT $ 151))
                                . #1#)))))
                      (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 152)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |ITRIGMNP;PG2F|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         ($ F))
        (SPADCALL (CONS (|function| |ITRIGMNP;KG2F|) $)
                  (CONS (|function| |ITRIGMNP;GR2F|) $) |p| (QREFELT $ 156))) 

(SDEFUN |ITRIGMNP;smp2explogs|
        ((|p| |SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))
         (|l| |List| (|Kernel| FG)) ($ FG))
        (SPROG NIL
               (SPADCALL (CONS #'|ITRIGMNP;smp2explogs!0| (VECTOR $ |l|))
                         (ELT $ 39) |p| (QREFELT $ 160)))) 

(SDEFUN |ITRIGMNP;smp2explogs!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|ITRIGMNP;smp2explogs|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ITRIGMNP;ker2explogs| |x| |l| $))))) 

(DECLAIM (NOTINLINE |InnerTrigonometricManipulations;|)) 

(DEFUN |InnerTrigonometricManipulations| (&REST #1=#:G253)
  (SPROG NIL
         (PROG (#2=#:G254)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerTrigonometricManipulations|)
                                               '|domainEqualList|)
                    . #3=(|InnerTrigonometricManipulations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerTrigonometricManipulations;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerTrigonometricManipulations|)))))))))) 

(DEFUN |InnerTrigonometricManipulations;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|InnerTrigonometricManipulations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|InnerTrigonometricManipulations| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 161) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
                     ('T 'NIL)))
          (QSETREFV $ 45
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 35) (|spadConstant| $ 37)
                               (QREFELT $ 38))
                     (QREFELT $ 39)))
          (COND
           ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
            (QSETREFV $ 87
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;10|)
                            $)))
           ('T
            (QSETREFV $ 87
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;11|)
                            $))))
          $))) 

(MAKEPROP '|InnerTrigonometricManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nth| (|Complex| 6) (0 . |real|) (5 . |coerce|)
              (10 . |One|) (14 . -) (19 . |sqrt|) (24 . |imag|) (29 . *)
              (35 . +) |ITRIGMNP;FG2F;FGF;3| (|Mapping| 7 8) (|Kernel| 8)
              (|ExpressionSpaceFunctions2| 8 7) (41 . |map|)
              (|SparseMultivariatePolynomial| 10 46) (47 . |numer|)
              (52 . |denom|) (57 . /) (63 . |coerce|) (|Mapping| 10 6)
              (|FunctionSpaceFunctions2| 6 7 10 8) (68 . |map|)
              |ITRIGMNP;F2FG;FFG;4| (|Complex| 7) (74 . |real|) (79 . |Zero|)
              (83 . |Zero|) (87 . |One|) (91 . |complex|) (97 . |coerce|)
              (102 . |imag|) (107 . *) (113 . +) |ITRIGMNP;GF2FG;CFG;5|
              (119 . |complex|) '|im| (|Kernel| $) (125 . |coerce|) (|List| 8)
              (130 . |argument|) (|List| 21) |ITRIGMNP;trigs2explogs;FGLFG;8|
              (|Boolean|) (|Symbol|) (135 . |is?|) (141 . |member?|)
              (147 . |exp|) (|Integer|) (152 . ^) (|PositiveInteger|) (158 . *)
              (164 . |One|) (168 . -) (174 . /) (180 . -) (185 . |log|)
              (190 . |coerce|) (|BasicOperator|) (195 . |operator|) (|List| $)
              (200 . |elt|) (|OutputForm|) (206 . |coerce|) (|Void|)
              (211 . |print|) (|List| 33) (216 . |coerce|) (221 . |is?|)
              (227 . =) (233 . |Ci|) (238 . |Si|) (243 . |erfi|) (248 . *)
              (254 . |pi|) (258 . |fresnelC|) (263 . |fresnelS|) (268 . *)
              (274 . |do_liou|) (280 . |zero?|) (285 . |elt|) (291 . |exp|)
              (296 . |log|) (301 . |sin|) (306 . |cos|) (311 . |tan|)
              (316 . |cot|) (321 . |sec|) (326 . |csc|) (331 . |asin|)
              (336 . |acos|) (341 . |atan|) (346 . |acot|) (351 . |asec|)
              (356 . |acsc|) (361 . |sinh|) (366 . |cosh|) (371 . |tanh|)
              (376 . |coth|) (381 . |sech|) (386 . |csch|) (391 . |asinh|)
              (396 . |acosh|) (401 . |atanh|) (406 . |acoth|) (411 . |asech|)
              (416 . |acsch|) (421 . |norm|) (426 . |coerce|) (431 . |second|)
              (436 . |retract|) (441 . |nthRoot|)
              (|SparseUnivariatePolynomial| 33) (|Mapping| 33 130)
              (|SparseUnivariatePolynomial| 130)
              (|SparseUnivariatePolynomialFunctions2| 130 33) (447 . |map|)
              (453 . |elt|) |ITRIGMNP;explogs2trigs;FGC;15| (|Mapping| 33 21)
              (|Mapping| 33 10) (|SparseMultivariatePolynomial| 10 21)
              (|PolynomialCategoryLifting| (|IndexedExponents| 21) 21 10 130
                                           33)
              (459 . |map|) (|Union| 46 '"failed") (466 . |mainKernel|)
              (471 . |retract|) (476 . /) (482 . |operator|)
              (|SparseUnivariatePolynomial| $) (487 . |univariate|)
              (493 . |exp|) (498 . |cos|) (503 . |sin|) (|NonNegativeInteger|)
              (508 . |degree|) (513 . |Zero|) (517 . |Zero|) (521 . ~=)
              (527 . |leadingCoefficient|) (532 . |coerce|) (537 . ^) (543 . +)
              (549 . |reductum|) (|Mapping| 7 21) (|Mapping| 7 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 21) 21 10 130 7)
              (554 . |map|) (|Mapping| 8 21) (|Mapping| 8 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 21) 21 10 130 8)
              (561 . |map|))
           '#(|trigs2explogs| 568 |explogs2trigs| 574 |do_liou| 579 GF2FG 585
              FG2F 590 F2FG 595)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 160
                                                 '(1 10 6 0 11 1 7 0 6 12 0 7 0
                                                   13 1 7 0 0 14 1 7 0 0 15 1
                                                   10 6 0 16 2 7 0 0 0 17 2 7 0
                                                   0 0 18 2 22 7 20 21 23 1 8
                                                   24 0 25 1 8 24 0 26 2 7 0 0
                                                   0 27 1 10 0 6 28 2 30 8 29 7
                                                   31 1 33 7 0 34 0 6 0 35 0 7
                                                   0 36 0 6 0 37 2 10 0 6 6 38
                                                   1 8 0 10 39 1 33 7 0 40 2 8
                                                   0 0 0 41 2 8 0 0 0 42 2 33 0
                                                   7 7 44 1 8 0 46 47 1 21 48 0
                                                   49 2 21 52 0 53 54 2 50 52
                                                   21 0 55 1 8 0 0 56 2 8 0 0
                                                   57 58 2 8 0 59 0 60 0 8 0 61
                                                   2 8 0 0 0 62 2 8 0 0 0 63 1
                                                   8 0 0 64 1 8 0 0 65 1 8 0 57
                                                   66 1 21 67 0 68 2 8 0 67 69
                                                   70 1 67 71 0 72 1 71 73 0 74
                                                   1 75 71 0 76 2 67 52 0 53 77
                                                   2 7 52 0 0 78 1 7 0 0 79 1 7
                                                   0 0 80 1 7 0 0 81 2 7 0 59 0
                                                   82 0 7 0 83 1 7 0 0 84 1 7 0
                                                   0 85 2 33 0 0 0 86 2 0 33 67
                                                   75 87 1 7 52 0 88 2 7 0 67
                                                   69 89 1 33 0 0 90 1 33 0 0
                                                   91 1 33 0 0 92 1 33 0 0 93 1
                                                   33 0 0 94 1 33 0 0 95 1 33 0
                                                   0 96 1 33 0 0 97 1 33 0 0 98
                                                   1 33 0 0 99 1 33 0 0 100 1
                                                   33 0 0 101 1 33 0 0 102 1 33
                                                   0 0 103 1 33 0 0 104 1 33 0
                                                   0 105 1 33 0 0 106 1 33 0 0
                                                   107 1 33 0 0 108 1 33 0 0
                                                   109 1 33 0 0 110 1 33 0 0
                                                   111 1 33 0 0 112 1 33 0 0
                                                   113 1 33 0 0 114 1 33 0 0
                                                   115 1 33 7 0 116 1 33 0 7
                                                   117 1 75 33 0 118 1 33 57 0
                                                   119 2 33 0 0 57 120 2 124
                                                   121 122 123 125 2 121 33 0
                                                   33 126 3 131 33 128 129 130
                                                   132 1 8 133 0 134 1 130 10 0
                                                   135 2 33 0 0 0 136 1 7 67 67
                                                   137 2 130 138 0 21 139 1 7 0
                                                   0 140 1 7 0 0 141 1 7 0 0
                                                   142 1 123 143 0 144 0 33 0
                                                   145 0 123 0 146 2 123 52 0 0
                                                   147 1 123 130 0 148 1 8 0 24
                                                   149 2 33 0 0 57 150 2 33 0 0
                                                   0 151 1 123 0 0 152 3 155 7
                                                   153 154 130 156 3 159 8 157
                                                   158 130 160 2 0 8 8 50 51 1
                                                   0 33 8 127 2 0 33 67 75 87 1
                                                   0 8 33 43 1 0 7 8 19 1 0 8 7
                                                   32)))))
           '|lookupComplete|)) 
