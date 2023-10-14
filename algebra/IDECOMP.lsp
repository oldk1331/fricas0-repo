
(SDEFUN |IDECOMP;convertQF|
        ((|a| |Fraction| (|Integer|))
         ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 9)) (QREFELT $ 11))
                  (SPADCALL (SPADCALL |a| (QREFELT $ 12)) (QREFELT $ 11))
                  (QREFELT $ 13))) 

(SDEFUN |IDECOMP;convertFQ|
        ((|a| |Fraction| (|Polynomial| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 15)) (QREFELT $ 16))
                  (SPADCALL (SPADCALL |a| (QREFELT $ 17)) (QREFELT $ 16))
                  (QREFELT $ 18))) 

(SDEFUN |IDECOMP;internalForm|
        ((I |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         ($ |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|))))))
        (SPROG
         ((|nId|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (#1=#:G146 NIL) (|poly| NIL) (#2=#:G145 NIL)
          (|Id|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction| (|Integer|))))))
         (SEQ
          (LETT |Id| (SPADCALL I (QREFELT $ 21)) . #3=(|IDECOMP;internalForm|))
          (LETT |nId|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |poly| NIL . #3#) (LETT #1# |Id| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |poly| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (CONS (|function| |IDECOMP;convertQF|) $)
                                |poly| (QREFELT $ 26))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 28)) (SPADCALL |nId| (QREFELT $ 31)))
                 ('T (SPADCALL |nId| (QREFELT $ 32)))))))) 

(SDEFUN |IDECOMP;externalForm|
        ((I |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         ($ |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|)))))
        (SPROG
         ((|nId|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction| (|Integer|)))))
          (#1=#:G152 NIL) (|poly| NIL) (#2=#:G151 NIL)
          (|Id|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|)))))))
         (SEQ
          (LETT |Id| (SPADCALL I (QREFELT $ 33)) . #3=(|IDECOMP;externalForm|))
          (LETT |nId|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |poly| NIL . #3#) (LETT #1# |Id| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |poly| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (CONS (|function| |IDECOMP;convertFQ|) $)
                                |poly| (QREFELT $ 36))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((SPADCALL I (QREFELT $ 37)) (SPADCALL |nId| (QREFELT $ 38)))
                 ('T (SPADCALL |nId| (QREFELT $ 39)))))))) 

(SDEFUN |IDECOMP;deleteunit|
        ((|lI| |List|
          (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                             (|DirectProduct| (|#| |vl|)
                                              (|NonNegativeInteger|))
                             (|OrderedVariableList| |vl|)
                             (|DistributedMultivariatePolynomial| |vl|
                                                                  (|Fraction|
                                                                   (|Polynomial|
                                                                    (|Integer|))))))
         ($ |List|
          (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                             (|DirectProduct| (|#| |vl|)
                                              (|NonNegativeInteger|))
                             (|OrderedVariableList| |vl|)
                             (|DistributedMultivariatePolynomial| |vl|
                                                                  (|Fraction|
                                                                   (|Polynomial|
                                                                    (|Integer|)))))))
        (SPROG ((#1=#:G162 NIL) (I NIL) (#2=#:G161 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|IDECOMP;deleteunit|))
                 (SEQ (LETT I NIL . #3#) (LETT #1# |lI| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT I (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (|spadConstant| $ 47) I (QREFELT $ 48))
                            'NIL)
                           ('T 'T))
                          (LETT #2# (CONS I #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IDECOMP;rearrange|
        ((|vlist| |List| (|OrderedVariableList| |vl|))
         ($ |List| (|OrderedVariableList| |vl|)))
        (COND ((SPADCALL |vlist| NIL (QREFELT $ 50)) |vlist|)
              ('T
               (SPADCALL (ELT $ 51)
                         (SPADCALL (QREFELT $ 44)
                                   (SPADCALL (QREFELT $ 44) |vlist|
                                             (QREFELT $ 52))
                                   (QREFELT $ 52))
                         (QREFELT $ 54))))) 

(SDEFUN |IDECOMP;zeroRadComp|
        ((I |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($ |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|))))))
        (SPROG
         ((|ris|
           #1=(|List|
               (|DistributedMultivariatePolynomial| |vl|
                                                    (|Fraction|
                                                     (|Polynomial|
                                                      (|Integer|))))))
          (#2=#:G179 NIL) (|h| NIL) (#3=#:G178 NIL)
          (|lf|
           #4=(|DistributedMultivariatePolynomial| |vl|
                                                   (|Fraction|
                                                    (|Polynomial|
                                                     (|Integer|)))))
          (|Id| #1#) (#5=#:G177 NIL) (#6=#:G176 NIL)
          (|pw|
           #7=(|DistributedMultivariatePolynomial| |vl|
                                                   (|Fraction|
                                                    (|Polynomial|
                                                     (|Integer|)))))
          (|pv| #7#) (|val| (|Integer|))
          (|g|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#8=#:G165 NIL) (|f| #4#)
          (|py|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|px|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|y| (|OrderedVariableList| |vl|))
          (|x| (|OrderedVariableList| |vl|)))
         (SEQ
          (COND ((SPADCALL |truelist| NIL (QREFELT $ 50)) I)
                (#9='T
                 (SEQ
                  (LETT |Id| (SPADCALL I (QREFELT $ 33))
                        . #10=(|IDECOMP;zeroRadComp|))
                  (LETT |x| (SPADCALL |truelist| '|last| (QREFELT $ 56))
                        . #10#)
                  (EXIT
                   (COND
                    ((EQL (LENGTH |Id|) 1)
                     (SEQ (LETT |f| (|SPADfirst| |Id|) . #10#)
                          (LETT |g|
                                (PROG2
                                    (LETT #8#
                                          (SPADCALL |f|
                                                    (SPADCALL |f|
                                                              (SPADCALL |f| |x|
                                                                        (QREFELT
                                                                         $ 57))
                                                              (QREFELT $ 58))
                                                    (QREFELT $ 59))
                                          . #10#)
                                    (QCDR #8#)
                                  (|check_union| (QEQCAR #8# 0)
                                                 (|DistributedMultivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Fraction|
                                                   (|Polynomial| (|Integer|))))
                                                 #8#))
                                . #10#)
                          (EXIT (SPADCALL (LIST |g|) (QREFELT $ 31)))))
                    (#9#
                     (SEQ (LETT |y| (|SPADfirst| |truelist|) . #10#)
                          (LETT |px| (SPADCALL |x| (QREFELT $ 60)) . #10#)
                          (LETT |py| (SPADCALL |y| (QREFELT $ 60)) . #10#)
                          (LETT |f| (SPADCALL |Id| '|last| (QREFELT $ 61))
                                . #10#)
                          (LETT |g|
                                (PROG2
                                    (LETT #8#
                                          (SPADCALL |f|
                                                    (SPADCALL |f|
                                                              (SPADCALL |f| |x|
                                                                        (QREFELT
                                                                         $ 57))
                                                              (QREFELT $ 58))
                                                    (QREFELT $ 59))
                                          . #10#)
                                    (QCDR #8#)
                                  (|check_union| (QEQCAR #8# 0)
                                                 (|DistributedMultivariatePolynomial|
                                                  (QREFELT $ 6)
                                                  (|Fraction|
                                                   (|Polynomial| (|Integer|))))
                                                 #8#))
                                . #10#)
                          (LETT |Id|
                                (SPADCALL
                                 (CONS |g| (SPADCALL |f| |Id| (QREFELT $ 62)))
                                 (QREFELT $ 64))
                                . #10#)
                          (LETT |lf| (|SPADfirst| |Id|) . #10#)
                          (LETT |pv| (|spadConstant| $ 65) . #10#)
                          (LETT |pw| (|spadConstant| $ 65) . #10#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL (SPADCALL |lf| |y| (QREFELT $ 67))
                                            1 (QREFELT $ 68)))
                                 (GO G191)))
                               (SEQ (LETT |val| (RANDOM 23) . #10#)
                                    (LETT |pv|
                                          (SPADCALL |px|
                                                    (SPADCALL |val| |py|
                                                              (QREFELT $ 69))
                                                    (QREFELT $ 70))
                                          . #10#)
                                    (LETT |pw|
                                          (SPADCALL |px|
                                                    (SPADCALL |val| |py|
                                                              (QREFELT $ 69))
                                                    (QREFELT $ 71))
                                          . #10#)
                                    (LETT |Id|
                                          (SPADCALL
                                           (PROGN
                                            (LETT #6# NIL . #10#)
                                            (SEQ (LETT |h| NIL . #10#)
                                                 (LETT #5# |Id| . #10#) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT |h| (CAR #5#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #6#
                                                         (CONS
                                                          (SPADCALL
                                                           (SPADCALL |h| |x|
                                                                     (QREFELT $
                                                                              73))
                                                           |pv| (QREFELT $ 75))
                                                          #6#)
                                                         . #10#)))
                                                 (LETT #5# (CDR #5#) . #10#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #6#))))
                                           (QREFELT $ 64))
                                          . #10#)
                                    (EXIT
                                     (LETT |lf| (|SPADfirst| |Id|) . #10#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |ris|
                                (SPADCALL
                                 (|IDECOMP;zeroRadComp|
                                  (SPADCALL (CDR |Id|) (QREFELT $ 31))
                                  (CDR |truelist|) $)
                                 (QREFELT $ 33))
                                . #10#)
                          (LETT |ris| (CONS |lf| |ris|) . #10#)
                          (COND
                           ((SPADCALL |pv| (|spadConstant| $ 65)
                                      (QREFELT $ 78))
                            (LETT |ris|
                                  (PROGN
                                   (LETT #3# NIL . #10#)
                                   (SEQ (LETT |h| NIL . #10#)
                                        (LETT #2# |ris| . #10#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |h| (CAR #2#) . #10#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |h| |x|
                                                            (QREFELT $ 73))
                                                  |pw| (QREFELT $ 75))
                                                 #3#)
                                                . #10#)))
                                        (LETT #2# (CDR #2#) . #10#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  . #10#)))
                          (EXIT
                           (SPADCALL (SPADCALL |ris| (QREFELT $ 64))
                                     (QREFELT $ 31))))))))))))) 

(SDEFUN |IDECOMP;goodPower|
        ((|s|
          . #1=(|DistributedMultivariatePolynomial| |vl|
                                                    (|Fraction|
                                                     (|Polynomial|
                                                      (|Integer|)))))
         (I |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         ($ |Record|
          (|:| |spol|
               (|DistributedMultivariatePolynomial| |vl|
                                                    (|Fraction|
                                                     (|Polynomial|
                                                      (|Integer|)))))
          (|:| |id|
               (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                                  (|DirectProduct| (|#| |vl|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |vl|)
                                  (|DistributedMultivariatePolynomial| |vl|
                                                                       (|Fraction|
                                                                        (|Polynomial|
                                                                         (|Integer|))))))))
        (SPROG
         ((|f| #1#) (#2=#:G187 NIL) (|g| NIL) (#3=#:G186 NIL)
          (J
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (JJ
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|)))))))
         (SEQ (LETT |f| |s| . #4=(|IDECOMP;goodPower|))
              (LETT I (SPADCALL I (QREFELT $ 79)) . #4#)
              (LETT J
                    (SPADCALL (LETT JJ (SPADCALL I |s| (QREFELT $ 80)) . #4#)
                              (QREFELT $ 33))
                    . #4#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL
                         (SPADCALL
                          (PROGN
                           (LETT #3# NIL . #4#)
                           (SEQ (LETT |g| NIL . #4#) (LETT #2# J . #4#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |g| (CAR #2#) . #4#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS (SPADCALL |f| |g| (QREFELT $ 81))
                                              #3#)
                                        . #4#)))
                                (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          (QREFELT $ 32))
                         I (QREFELT $ 82))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |f| (SPADCALL |s| |f| (QREFELT $ 81)) . #4#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |f| JJ))))) 

(SDEFUN |IDECOMP;zerodimcase|
        ((J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G199 NIL)
          (|Jd|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (#2=#:G154 NIL) (|y| (|Union| (|OrderedVariableList| |vl|) "failed"))
          (|f|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#3=#:G200 NIL) (|x| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48))
                 (SPADCALL |truelist| NIL (QREFELT $ 50)))
             'T)
            ('T
             (SEQ (LETT |n| (LENGTH |truelist|) . #4=(|IDECOMP;zerodimcase|))
                  (LETT |Jd|
                        (SPADCALL (SPADCALL J (QREFELT $ 33)) (QREFELT $ 64))
                        . #4#)
                  (SEQ (LETT |x| NIL . #4#) (LETT #3# |truelist| . #4#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL)
                             (NULL (SPADCALL |Jd| NIL (QREFELT $ 84))))
                         (GO G191)))
                       (SEQ (LETT |f| (|SPADfirst| |Jd|) . #4#)
                            (LETT |Jd| (CDR |Jd|) . #4#)
                            (SEQ (LETT |y| (SPADCALL |f| (QREFELT $ 86)) . #4#)
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |y| 1)
                                        (OR
                                         (SPADCALL (QCDR |y|) |x|
                                                   (QREFELT $ 87))
                                         (NULL (|IDECOMP;ismonic| |f| |x| $))))
                                    (PROGN
                                     (LETT #1# 'NIL . #4#)
                                     (GO #5=#:G198))))))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((SPADCALL |Jd| NIL (QREFELT $ 84))
                                      (SPADCALL
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL (|SPADfirst| |Jd|)
                                                           (QREFELT $ 86))
                                                 . #4#)
                                           (QCDR #2#)
                                         (|check_union| (QEQCAR #2# 0)
                                                        (|OrderedVariableList|
                                                         (QREFELT $ 6))
                                                        #2#))
                                       |x| (QREFELT $ 88)))
                                     ('T 'NIL)))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |Jd| (CDR |Jd|) . #4#))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |Jd| NIL (QREFELT $ 89))
                               (COND
                                ((< (SPADCALL |x| |truelist| (QREFELT $ 90))
                                    |n|)
                                 (PROGN (LETT #1# 'NIL . #4#) (GO #5#))))))))
                       (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #1#)))) 

(SDEFUN |IDECOMP;findvar|
        ((J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($ |OrderedVariableList| |vl|))
        (SPROG
         ((|badvar| (|List| (|OrderedVariableList| |vl|)))
          (|lmonicvar| (|List| (|OrderedVariableList| |vl|)))
          (|vt| (|List| (|OrderedVariableList| |vl|)))
          (|t|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#1=#:G205 NIL) (|f| NIL))
         (SEQ (LETT |lmonicvar| NIL . #2=(|IDECOMP;findvar|))
              (SEQ (LETT |f| NIL . #2#)
                   (LETT #1# (SPADCALL J (QREFELT $ 33)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |t|
                          (SPADCALL |f| (SPADCALL |f| (QREFELT $ 91))
                                    (QREFELT $ 71))
                          . #2#)
                    (LETT |vt| (SPADCALL |t| (QREFELT $ 92)) . #2#)
                    (EXIT
                     (COND
                      ((EQL (LENGTH |vt|) 1)
                       (LETT |lmonicvar|
                             (SPADCALL |vt| |lmonicvar| (QREFELT $ 93))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |badvar| (SPADCALL |truelist| |lmonicvar| (QREFELT $ 52))
                    . #2#)
              (EXIT (|SPADfirst| |badvar|))))) 

(SDEFUN |IDECOMP;reduceDim|
        ((|flag| |Union| "zeroPrimDecomp" "zeroRadComp")
         (J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($
          . #1=(|List|
                (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                                   (|DirectProduct| (|#| |vl|)
                                                    (|NonNegativeInteger|))
                                   (|OrderedVariableList| |vl|)
                                   (|DistributedMultivariatePolynomial| |vl|
                                                                        (|Fraction|
                                                                         (|Polynomial|
                                                                          (|Integer|))))))))
        (SPROG
         ((|res1|
           (|List|
            (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                               (|DirectProduct| (|#| |vl|)
                                                (|NonNegativeInteger|))
                               (|OrderedVariableList| |vl|)
                               (|DistributedMultivariatePolynomial| |vl|
                                                                    (|Fraction|
                                                                     (|Polynomial|
                                                                      (|Integer|)))))))
          (#2=#:G236 NIL) (JJ NIL) (|sresult| #1#)
          (|sideal|
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|))))))
          (|good|
           (|Record|
            (|:| |spol|
                 (|DistributedMultivariatePolynomial| |vl|
                                                      (|Fraction|
                                                       (|Polynomial|
                                                        (|Integer|)))))
            (|:| |id|
                 (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                                    (|DirectProduct| (|#| |vl|)
                                                     (|NonNegativeInteger|))
                                    (|OrderedVariableList| |vl|)
                                    (|DistributedMultivariatePolynomial| |vl|
                                                                         (|Fraction|
                                                                          (|Polynomial|
                                                                           (|Integer|))))))))
          (#3=#:G235 NIL) (II NIL) (#4=#:G234 NIL)
          (|s|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#5=#:G216 NIL)
          (#6=#:G215 #7=(|Fraction| (|Polynomial| (|Integer|))))
          (#8=#:G217 #7#) (#9=#:G233 NIL) (|f| NIL) (#10=#:G232 NIL)
          (#11=#:G231 NIL) (#12=#:G230 NIL) (|idp| NIL) (#13=#:G229 NIL)
          (|Jc|
           (|List|
            (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                               (|DirectProduct| (|#| |vl|)
                                                (|NonNegativeInteger|))
                               (|OrderedVariableList| |vl|)
                               (|DistributedMultivariatePolynomial| |vl|
                                                                    (|Fraction|
                                                                     (|Polynomial|
                                                                      (|Integer|)))))))
          (|Jnew|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (#14=#:G228 NIL) (#15=#:G227 NIL) (|x| (|OrderedVariableList| |vl|)))
         (SEQ
          (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) (LIST J))
                ((|IDECOMP;zerodimcase| J |truelist| $)
                 (COND
                  ((QEQCAR |flag| 0) (|IDECOMP;zeroPrimDecomp| J |truelist| $))
                  ((QEQCAR |flag| 1)
                   (LIST (|IDECOMP;zeroRadComp| J |truelist| $)))))
                (#16='T
                 (SEQ
                  (LETT |x| (|IDECOMP;findvar| J |truelist| $)
                        . #17=(|IDECOMP;reduceDim|))
                  (LETT |Jnew|
                        (PROGN
                         (LETT #15# NIL . #17#)
                         (SEQ (LETT |f| NIL . #17#)
                              (LETT #14# (SPADCALL J (QREFELT $ 33)) . #17#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |f| (CAR #14#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS (|IDECOMP;pushdown| |f| |x| $)
                                            #15#)
                                      . #17#)))
                              (LETT #14# (CDR #14#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #17#)
                  (LETT |Jc| NIL . #17#)
                  (LETT |Jc|
                        (|IDECOMP;reduceDim| |flag|
                         (SPADCALL |Jnew| (QREFELT $ 31))
                         (SPADCALL |x| |truelist| (QREFELT $ 94)) $)
                        . #17#)
                  (LETT |res1|
                        (PROGN
                         (LETT #13# NIL . #17#)
                         (SEQ (LETT |idp| NIL . #17#) (LETT #12# |Jc| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN (LETT |idp| (CAR #12#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #13#
                                      (CONS
                                       (SPADCALL
                                        (PROGN
                                         (LETT #11# NIL . #17#)
                                         (SEQ (LETT |f| NIL . #17#)
                                              (LETT #10#
                                                    (SPADCALL |idp|
                                                              (QREFELT $ 33))
                                                    . #17#)
                                              G190
                                              (COND
                                               ((OR (ATOM #10#)
                                                    (PROGN
                                                     (LETT |f| (CAR #10#)
                                                           . #17#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #11#
                                                      (CONS
                                                       (|IDECOMP;pushup| |f|
                                                        |x| $)
                                                       #11#)
                                                      . #17#)))
                                              (LETT #10# (CDR #10#) . #17#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #11#))))
                                        (QREFELT $ 32))
                                       #13#)
                                      . #17#)))
                              (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #17#)
                  (LETT |s|
                        (|IDECOMP;pushup|
                         (SPADCALL
                          (PROGN
                           (LETT #5# NIL . #17#)
                           (SEQ (LETT |f| NIL . #17#) (LETT #9# |Jnew| . #17#)
                                G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |f| (CAR #9#) . #17#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #8# (SPADCALL |f| (QREFELT $ 95))
                                         . #17#)
                                   (COND
                                    (#5#
                                     (LETT #6#
                                           (SPADCALL #6# #8# (QREFELT $ 96))
                                           . #17#))
                                    ('T
                                     (PROGN
                                      (LETT #6# #8# . #17#)
                                      (LETT #5# 'T . #17#)))))))
                                (LETT #9# (CDR #9#) . #17#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#5# #6#) (#16# (|spadConstant| $ 45))))
                          (QREFELT $ 97))
                         |x| $)
                        . #17#)
                  (EXIT
                   (COND ((EQL (SPADCALL |s| |x| (QREFELT $ 67)) 0) |res1|)
                         (#16#
                          (SEQ
                           (LETT |res1|
                                 (PROGN
                                  (LETT #4# NIL . #17#)
                                  (SEQ (LETT II NIL . #17#)
                                       (LETT #3# |res1| . #17#) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT II (CAR #3#) . #17#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (SPADCALL II |s|
                                                          (QREFELT $ 80))
                                                #4#)
                                               . #17#)))
                                       (LETT #3# (CDR #3#) . #17#) (GO G190)
                                       G191 (EXIT (NREVERSE #4#))))
                                 . #17#)
                           (LETT |good| (|IDECOMP;goodPower| |s| J $) . #17#)
                           (LETT |sideal|
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS (QCAR |good|)
                                         (SPADCALL J (QREFELT $ 33)))
                                   (QREFELT $ 64))
                                  (QREFELT $ 31))
                                 . #17#)
                           (EXIT
                            (COND
                             ((SPADCALL (QCDR |good|) |sideal| (QREFELT $ 82))
                              |res1|)
                             (#16#
                              (SEQ
                               (LETT |sresult|
                                     (|IDECOMP;reduceDim| |flag| |sideal|
                                      |truelist| $)
                                     . #17#)
                               (SEQ (LETT JJ NIL . #17#)
                                    (LETT #2# |sresult| . #17#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT JJ (CAR #2#) . #17#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((NULL
                                         (SPADCALL (QCDR |good|) JJ
                                                   (QREFELT $ 82)))
                                        (LETT |res1| (CONS JJ |res1|)
                                              . #17#)))))
                                    (LETT #2# (CDR #2#) . #17#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT |res1|))))))))))))))) 

(SDEFUN |IDECOMP;zeroPrimDecomp|
        ((I |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($ |List|
          (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                             (|DirectProduct| (|#| |vl|)
                                              (|NonNegativeInteger|))
                             (|OrderedVariableList| |vl|)
                             (|DistributedMultivariatePolynomial| |vl|
                                                                  (|Fraction|
                                                                   (|Polynomial|
                                                                    (|Integer|)))))))
        (SPROG
         ((|ris|
           (|List|
            (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                               (|DirectProduct| (|#| |vl|)
                                                (|NonNegativeInteger|))
                               (|OrderedVariableList| |vl|)
                               (|DistributedMultivariatePolynomial| |vl|
                                                                    (|Fraction|
                                                                     (|Polynomial|
                                                                      (|Integer|)))))))
          (#1=#:G245 NIL)
          (J1
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|))))))
          (|g|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#2=#:G239 NIL) (#3=#:G246 NIL) (|ef| NIL)
          (|lfact|
           (|List|
            (|Record|
             (|:| |factor|
                  (|DistributedMultivariatePolynomial| |vl|
                                                       (|Fraction|
                                                        (|Polynomial|
                                                         (|Integer|)))))
             (|:| |exponent| (|Integer|)))))
          (|Jd|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (|x| (|OrderedVariableList| |vl|))
          (J
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|))))))
          (|lval| #4=(|List| (|Integer|)))
          (|newJ|
           (|Record| (|:| |changeval| #4#)
                     (|:| |genideal|
                          (|PolynomialIdeal|
                           (|Fraction| (|Polynomial| (|Integer|)))
                           (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
                           (|OrderedVariableList| |vl|)
                           (|DistributedMultivariatePolynomial| |vl|
                                                                (|Fraction|
                                                                 (|Polynomial|
                                                                  (|Integer|)))))))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |truelist| NIL (QREFELT $ 50))
             (SPADCALL I (QREFELT $ 99)))
            ('T
             (SEQ
              (LETT |newJ| (|IDECOMP;genPosLastVar| I |truelist| $)
                    . #5=(|IDECOMP;zeroPrimDecomp|))
              (LETT |lval| (QCAR |newJ|) . #5#)
              (LETT J (SPADCALL (QCDR |newJ|) (QREFELT $ 79)) . #5#)
              (LETT |x| (SPADCALL |truelist| '|last| (QREFELT $ 56)) . #5#)
              (LETT |Jd| (SPADCALL J (QREFELT $ 33)) . #5#)
              (LETT |g| (SPADCALL |Jd| '|last| (QREFELT $ 61)) . #5#)
              (LETT |lfact|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 102)) (QREFELT $ 105))
                    . #5#)
              (LETT |ris| NIL . #5#)
              (SEQ (LETT |ef| NIL . #5#) (LETT #3# |lfact| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ef| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |g|
                          (SPADCALL (QCAR |ef|)
                                    (PROG1 (LETT #2# (QCDR |ef|) . #5#)
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                    (QREFELT $ 106))
                          . #5#)
                    (LETT J1
                          (SPADCALL (SPADCALL (CONS |g| |Jd|) (QREFELT $ 64))
                                    (QREFELT $ 31))
                          . #5#)
                    (COND
                     ((NULL (|IDECOMP;is0dimprimary| J1 |truelist| $))
                      (PROGN
                       (LETT #1# (|IDECOMP;zeroPrimDecomp| I |truelist| $)
                             . #5#)
                       (GO #6=#:G244))))
                    (EXIT
                     (LETT |ris|
                           (CONS
                            (SPADCALL
                             (|IDECOMP;backGenPos| J1 |lval| |truelist| $)
                             (QREFELT $ 79))
                            |ris|)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |ris|)))))
          #6# (EXIT #1#)))) 

(SDEFUN |IDECOMP;radical;2Pi;13|
        ((I |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         ($ |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G254 NIL)
          (#2=#:G253
           #3=(|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                                 (|DirectProduct| (|#| |vl|)
                                                  (|NonNegativeInteger|))
                                 (|OrderedVariableList| |vl|)
                                 (|DistributedMultivariatePolynomial| |vl|
                                                                      (|Fraction|
                                                                       (|Polynomial|
                                                                        (|Integer|))))))
          (#4=#:G255 #3#) (#5=#:G259 NIL) (#6=#:G104 NIL)
          (|truelist| (|List| (|OrderedVariableList| |vl|))) (#7=#:G248 NIL)
          (#8=#:G247 #9=(|List| (|OrderedVariableList| |vl|))) (#10=#:G249 #9#)
          (#11=#:G258 NIL) (|f| NIL)
          (J
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|)))))))
         (SEQ
          (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 79))
                . #12=(|IDECOMP;radical;2Pi;13|))
          (LETT |truelist|
                (|IDECOMP;rearrange|
                 (PROGN
                  (LETT #7# NIL . #12#)
                  (SEQ (LETT |f| NIL . #12#)
                       (LETT #11# (SPADCALL J (QREFELT $ 33)) . #12#) G190
                       (COND
                        ((OR (ATOM #11#)
                             (PROGN (LETT |f| (CAR #11#) . #12#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #10# (SPADCALL |f| (QREFELT $ 92)) . #12#)
                          (COND
                           (#7#
                            (LETT #8# (SPADCALL #8# #10# (QREFELT $ 93))
                                  . #12#))
                           ('T
                            (PROGN
                             (LETT #8# #10# . #12#)
                             (LETT #7# 'T . #12#)))))))
                       (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
                  (COND (#7# #8#) (#13='T (|IdentityError| '|setUnion|))))
                 $)
                . #12#)
          (EXIT
           (COND
            ((SPADCALL |truelist| NIL (QREFELT $ 50))
             (|IDECOMP;externalForm| J $))
            (#13#
             (|IDECOMP;externalForm|
              (PROGN
               (LETT #1# NIL . #12#)
               (SEQ (LETT #6# NIL . #12#)
                    (LETT #5#
                          (|IDECOMP;reduceDim| (CONS 1 "zeroRadComp") J
                           |truelist| $)
                          . #12#)
                    G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #12#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #4# #6# . #12#)
                       (COND
                        (#1#
                         (LETT #2# (SPADCALL #2# #4# (QREFELT $ 107)) . #12#))
                        ('T
                         (PROGN
                          (LETT #2# #4# . #12#)
                          (LETT #1# 'T . #12#)))))))
                    (LETT #5# (CDR #5#) . #12#) (GO G190) G191 (EXIT NIL))
               (COND (#1# #2#) (#13# (|IdentityError| '|intersect|))))
              $))))))) 

(SDEFUN |IDECOMP;pushdown|
        ((|g| |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|))))
         (|x| |OrderedVariableList| |vl|)
         ($ |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|rf|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|g1|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|i| (|Integer|)))
         (SEQ (LETT |rf| (|spadConstant| $ 65) . #1=(|IDECOMP;pushdown|))
              (LETT |i| (SPADCALL |x| (QREFELT $ 44) (QREFELT $ 90)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 78)))
                     (GO G191)))
                   (SEQ (LETT |g1| (SPADCALL |g| (QREFELT $ 91)) . #1#)
                        (LETT |rf|
                              (SPADCALL |rf|
                                        (|IDECOMP;pushdterm|
                                         (SPADCALL |g| |g1| (QREFELT $ 71)) |x|
                                         |i| $)
                                        (QREFELT $ 70))
                              . #1#)
                        (EXIT (LETT |g| |g1| . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |rf|)))) 

(SDEFUN |IDECOMP;pushdterm|
        ((|t| |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|))))
         (|x| |OrderedVariableList| |vl|) (|i| |Integer|)
         ($ |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPROG
         ((#1=#:G265 NIL)
          (|newt|
           (|Union|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial| (|Integer|))))
            "failed"))
          (|cf| (|Fraction| (|Polynomial| (|Integer|)))) (|xp| (|Symbol|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |t| |x| (QREFELT $ 67))
                . #2=(|IDECOMP;pushdterm|))
          (LETT |xp| (SPADCALL |x| (QREFELT $ 109)) . #2#)
          (LETT |cf|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 110) |xp| |n| (QREFELT $ 111))
                 (QREFELT $ 112))
                . #2#)
          (LETT |newt|
                (SPADCALL |t|
                          (SPADCALL (|spadConstant| $ 47) |x| |n|
                                    (QREFELT $ 113))
                          (QREFELT $ 59))
                . #2#)
          (EXIT
           (SPADCALL |cf|
                     (PROG2 (LETT #1# |newt| . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0)
                                      (|DistributedMultivariatePolynomial|
                                       (QREFELT $ 6)
                                       (|Fraction| (|Polynomial| (|Integer|))))
                                      #1#))
                     (QREFELT $ 114)))))) 

(SDEFUN |IDECOMP;pushup|
        ((|f|
          . #1=(|DistributedMultivariatePolynomial| |vl|
                                                    (|Fraction|
                                                     (|Polynomial|
                                                      (|Integer|)))))
         (|x| |OrderedVariableList| |vl|)
         ($ |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|rf|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|g| #1#) (|h| (|Polynomial| (|Integer|))) (|xp| (|Symbol|)))
         (SEQ (LETT |h| (|spadConstant| $ 110) . #2=(|IDECOMP;pushup|))
              (LETT |rf| (|spadConstant| $ 65) . #2#) (LETT |g| |f| . #2#)
              (LETT |xp| (SPADCALL |x| (QREFELT $ 109)) . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |g| (|spadConstant| $ 65) (QREFELT $ 78)))
                     (GO G191)))
                   (SEQ
                    (LETT |h|
                          (SPADCALL
                           (|IDECOMP;trueden|
                            (SPADCALL (SPADCALL |g| (QREFELT $ 95))
                                      (QREFELT $ 17))
                            |xp| $)
                           |h| (QREFELT $ 115))
                          . #2#)
                    (EXIT (LETT |g| (SPADCALL |g| (QREFELT $ 91)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |f|
                    (SPADCALL (SPADCALL |h| (QREFELT $ 112)) |f|
                              (QREFELT $ 114))
                    . #2#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |f| (|spadConstant| $ 65) (QREFELT $ 78)))
                     (GO G191)))
                   (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 91)) . #2#)
                        (LETT |rf|
                              (SPADCALL |rf|
                                        (|IDECOMP;pushuterm|
                                         (SPADCALL |f| |g| (QREFELT $ 71)) |xp|
                                         |x| $)
                                        (QREFELT $ 70))
                              . #2#)
                        (EXIT (LETT |f| |g| . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |rf|)))) 

(SDEFUN |IDECOMP;trueden|
        ((|c| |Polynomial| (|Integer|)) (|x| |Symbol|)
         ($ |Polynomial| (|Integer|)))
        (COND
         ((EQL (SPADCALL |c| |x| (QREFELT $ 116)) 0) (|spadConstant| $ 110))
         ('T |c|))) 

(SDEFUN |IDECOMP;pushuterm|
        ((|t| |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|))))
         (|xp| |Symbol|) (|x| |OrderedVariableList| |vl|)
         ($ |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL
         (|IDECOMP;pushucoef|
          (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 15))
                    |xp| (QREFELT $ 117))
          |x| $)
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 17))
                     (QREFELT $ 112))
           (QREFELT $ 118))
          (SPADCALL |t| (QREFELT $ 120)) (QREFELT $ 121))
         (QREFELT $ 81))) 

(SDEFUN |IDECOMP;pushucoef|
        ((|c| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|x| |OrderedVariableList| |vl|)
         ($ |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (COND
         ((SPADCALL |c| (|spadConstant| $ 123) (QREFELT $ 124))
          (|spadConstant| $ 65))
         ('T
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 125)) (QREFELT $ 112))
                      (QREFELT $ 97))
            |x| (SPADCALL |c| (QREFELT $ 126)) (QREFELT $ 113))
           (|IDECOMP;pushucoef| (SPADCALL |c| (QREFELT $ 127)) |x| $)
           (QREFELT $ 70))))) 

(SDEFUN |IDECOMP;is0dimprimary|
        ((J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|)) ($ |Boolean|))
        (SPROG
         ((JP
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (#1=#:G296 NIL)
          (JM
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|))))))
          (|i| (|Union| (|NonNegativeInteger|) "failed")) (#2=#:G284 NIL)
          (|x| (|OrderedVariableList| |vl|)) (#3=#:G297 NIL) (|f| NIL)
          (JR
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (|Jd|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|)))))))
         (SEQ
          (EXIT
           (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
                 (#4='T
                  (SEQ
                   (LETT |Jd|
                         (SPADCALL (SPADCALL J (QREFELT $ 79)) (QREFELT $ 33))
                         . #5=(|IDECOMP;is0dimprimary|))
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LENGTH
                        (SPADCALL
                         (SPADCALL (SPADCALL |Jd| '|last| (QREFELT $ 61))
                                   (QREFELT $ 102))
                         (QREFELT $ 105)))
                       1 (QREFELT $ 68))
                      (PROGN (LETT #1# 'NIL . #5#) (GO #6=#:G295)))
                     (#4#
                      (SEQ
                       (LETT |i|
                             (SPADCALL (LENGTH |truelist|) 1 (QREFELT $ 128))
                             . #5#)
                       (EXIT
                        (COND
                         ((QEQCAR |i| 1) (PROGN (LETT #1# 'T . #5#) (GO #6#)))
                         (#4#
                          (SEQ (LETT JR (REVERSE |Jd|) . #5#)
                               (LETT JM
                                     (SPADCALL (LIST (|SPADfirst| JR))
                                               (QREFELT $ 31))
                                     . #5#)
                               (LETT JP NIL . #5#)
                               (SEQ (LETT |f| NIL . #5#)
                                    (LETT #3# (CDR JR) . #5#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |f| (CAR #3#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|IDECOMP;ismonic| |f|
                                         (SPADCALL |truelist| (QCDR |i|)
                                                   (QREFELT $ 129))
                                         $)
                                        (SEQ
                                         (LETT |x|
                                               (SPADCALL |truelist| (QCDR |i|)
                                                         (QREFELT $ 129))
                                               . #5#)
                                         (LETT |i|
                                               (CONS 0
                                                     (PROG1
                                                         (LETT #2#
                                                               (- (QCDR |i|) 1)
                                                               . #5#)
                                                       (|check_subtype|
                                                        (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        #2#)))
                                               . #5#)
                                         (COND
                                          ((NULL
                                            (|IDECOMP;testPower|
                                             (SPADCALL |f| |x| (QREFELT $ 73))
                                             |x| JM $))
                                           (PROGN
                                            (LETT #1# 'NIL . #5#)
                                            (GO #6#))))
                                         (EXIT
                                          (LETT JM
                                                (SPADCALL
                                                 (APPEND (CONS |f| JP)
                                                         (SPADCALL JM
                                                                   (QREFELT $
                                                                            33)))
                                                 (QREFELT $ 31))
                                                . #5#))))
                                       ('T
                                        (SEQ
                                         (COND
                                          ((NULL
                                            (SPADCALL |f| JM (QREFELT $ 130)))
                                           (PROGN
                                            (LETT #1# 'NIL . #5#)
                                            (GO #6#))))
                                         (EXIT
                                          (LETT JP (CONS |f| JP) . #5#)))))))
                                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT 'T)))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |IDECOMP;genPosLastVar|
        ((J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($ |Record| (|:| |changeval| (|List| (|Integer|)))
          (|:| |genideal|
               (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                                  (|DirectProduct| (|#| |vl|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |vl|)
                                  (|DistributedMultivariatePolynomial| |vl|
                                                                       (|Fraction|
                                                                        (|Polynomial|
                                                                         (|Integer|))))))))
        (SPROG
         ((#1=#:G311 NIL) (|p| NIL) (#2=#:G310 NIL)
          (|val|
           #3=(|DistributedMultivariatePolynomial| |vl|
                                                   (|Fraction|
                                                    (|Polynomial|
                                                     (|Integer|)))))
          (#4=#:G301 NIL) (#5=#:G300 #3#) (#6=#:G302 #3#) (#7=#:G308 NIL)
          (|vv| NIL) (#8=#:G309 NIL) (|rv| NIL)
          (|ranvals| (|List| (|Integer|))) (#9=#:G307 NIL) (#10=#:G306 NIL)
          (|lv1| (|List| (|OrderedVariableList| |vl|)))
          (|x| (|OrderedVariableList| |vl|)))
         (SEQ
          (LETT |x| (SPADCALL |truelist| (QREFELT $ 131))
                . #11=(|IDECOMP;genPosLastVar|))
          (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 94)) . #11#)
          (LETT |ranvals|
                (PROGN
                 (LETT #10# NIL . #11#)
                 (SEQ (LETT |vv| NIL . #11#) (LETT #9# |lv1| . #11#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |vv| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #10# (CONS (RANDOM 23) #10#) . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |val|
                (PROGN
                 (LETT #4# NIL . #11#)
                 (SEQ (LETT |rv| NIL . #11#) (LETT #8# |ranvals| . #11#)
                      (LETT |vv| NIL . #11#) (LETT #7# |lv1| . #11#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |vv| (CAR #7#) . #11#) NIL)
                            (ATOM #8#)
                            (PROGN (LETT |rv| (CAR #8#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL |rv| (SPADCALL |vv| (QREFELT $ 60))
                                         (QREFELT $ 69))
                               . #11#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 70)) . #11#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #11#)
                            (LETT #4# 'T . #11#)))))))
                      (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|spadConstant| $ 65))))
                . #11#)
          (LETT |val|
                (SPADCALL |val| (SPADCALL |x| (QREFELT $ 60)) (QREFELT $ 70))
                . #11#)
          (EXIT
           (CONS |ranvals|
                 (SPADCALL
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL . #11#)
                    (SEQ (LETT |p| NIL . #11#)
                         (LETT #1# (SPADCALL J (QREFELT $ 33)) . #11#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |p| (CAR #1#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (SPADCALL |p| |x| (QREFELT $ 73))
                                            |val| (QREFELT $ 75))
                                  #2#)
                                 . #11#)))
                         (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 64))
                  (QREFELT $ 31))))))) 

(SDEFUN |IDECOMP;backGenPos|
        ((I |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|lval| |List| (|Integer|))
         (|truelist| |List| (|OrderedVariableList| |vl|))
         ($ |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|))))))
        (SPROG
         ((#1=#:G330 NIL) (|p| NIL) (#2=#:G329 NIL)
          (|val|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#3=#:G322 NIL)
          (#4=#:G321
           #5=(|DistributedMultivariatePolynomial| |vl|
                                                   (|Fraction|
                                                    (|Polynomial|
                                                     (|Integer|)))))
          (#6=#:G323 #5#) (#7=#:G327 NIL) (|vv| NIL) (#8=#:G328 NIL) (|rv| NIL)
          (|lv1| (|List| (|OrderedVariableList| |vl|)))
          (|x| (|OrderedVariableList| |vl|)))
         (SEQ
          (COND ((SPADCALL |lval| NIL (QREFELT $ 133)) I)
                (#9='T
                 (SEQ
                  (LETT |x| (SPADCALL |truelist| (QREFELT $ 131))
                        . #10=(|IDECOMP;backGenPos|))
                  (LETT |lv1| (SPADCALL |x| |truelist| (QREFELT $ 94)) . #10#)
                  (LETT |val|
                        (SPADCALL
                         (PROGN
                          (LETT #3# NIL . #10#)
                          (SEQ (LETT |rv| NIL . #10#) (LETT #8# |lval| . #10#)
                               (LETT |vv| NIL . #10#) (LETT #7# |lv1| . #10#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |vv| (CAR #7#) . #10#) NIL)
                                     (ATOM #8#)
                                     (PROGN (LETT |rv| (CAR #8#) . #10#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #6#
                                        (SPADCALL |rv|
                                                  (SPADCALL |vv|
                                                            (QREFELT $ 60))
                                                  (QREFELT $ 69))
                                        . #10#)
                                  (COND
                                   (#3#
                                    (LETT #4# (SPADCALL #4# #6# (QREFELT $ 70))
                                          . #10#))
                                   ('T
                                    (PROGN
                                     (LETT #4# #6# . #10#)
                                     (LETT #3# 'T . #10#)))))))
                               (LETT #7#
                                     (PROG1 (CDR #7#)
                                       (LETT #8# (CDR #8#) . #10#))
                                     . #10#)
                               (GO G190) G191 (EXIT NIL))
                          (COND (#3# #4#) (#9# (|spadConstant| $ 65))))
                         (QREFELT $ 134))
                        . #10#)
                  (LETT |val|
                        (SPADCALL |val| (SPADCALL |x| (QREFELT $ 60))
                                  (QREFELT $ 70))
                        . #10#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL . #10#)
                      (SEQ (LETT |p| NIL . #10#)
                           (LETT #1# (SPADCALL I (QREFELT $ 33)) . #10#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |p| (CAR #1#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (SPADCALL |p| |x| (QREFELT $ 73))
                                              |val| (QREFELT $ 75))
                                    #2#)
                                   . #10#)))
                           (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 64))
                    (QREFELT $ 31))))))))) 

(SDEFUN |IDECOMP;ismonic|
        ((|f| |DistributedMultivariatePolynomial| |vl|
          (|Fraction| (|Polynomial| (|Integer|))))
         (|x| |OrderedVariableList| |vl|) ($ |Boolean|))
        (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 73)) (QREFELT $ 135))
                  (QREFELT $ 136))) 

(SDEFUN |IDECOMP;testPower|
        ((|uf| |SparseUnivariatePolynomial|
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         (|x| |OrderedVariableList| |vl|)
         (J |PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl|
                                               (|Fraction|
                                                (|Polynomial| (|Integer|)))))
         ($ |Boolean|))
        (SPROG
         ((|g|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|linp|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (|trailp|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (#1=#:G333 NIL) (|df| (|PositiveInteger|)) (#2=#:G332 NIL))
         (SEQ
          (LETT |df|
                (PROG1
                    (LETT #2# (SPADCALL |uf| (QREFELT $ 137))
                          . #3=(|IDECOMP;testPower|))
                  (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                . #3#)
          (LETT |trailp|
                (SPADCALL
                 (SPADCALL (SPADCALL |df| (QREFELT $ 11)) (QREFELT $ 118))
                 (SPADCALL |uf|
                           (PROG1 (LETT #1# (- |df| 1) . #3#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))
                           (QREFELT $ 138))
                 (QREFELT $ 114))
                . #3#)
          (LETT |linp|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 47) 1 (QREFELT $ 139))
                           (SPADCALL |trailp| 0 (QREFELT $ 139))
                           (QREFELT $ 140))
                 |df| (QREFELT $ 141))
                . #3#)
          (LETT |g|
                (SPADCALL (SPADCALL |uf| |linp| (QREFELT $ 142)) |x|
                          (QREFELT $ 143))
                . #3#)
          (EXIT (SPADCALL |g| J (QREFELT $ 130)))))) 

(SDEFUN |IDECOMP;zeroDimPrime?;PiB;25|
        ((I |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         ($ |Boolean|))
        (SPROG
         ((|lfact|
           (|List|
            (|Record|
             (|:| |factor|
                  (|DistributedMultivariatePolynomial| |vl|
                                                       (|Fraction|
                                                        (|Polynomial|
                                                         (|Integer|)))))
             (|:| |exponent| (|Integer|)))))
          (|g|
           (|DistributedMultivariatePolynomial| |vl|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))))
          (|i| (|NonNegativeInteger|)) (#1=#:G346 NIL) (#2=#:G347 NIL)
          (|f| NIL)
          (|Jd|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (|Integer|))))))
          (|n| (|NonNegativeInteger|))
          (J
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT J
                  (SPADCALL
                   (QCDR
                    (|IDECOMP;genPosLastVar| (|IDECOMP;internalForm| I $)
                     (QREFELT $ 44) $))
                   (QREFELT $ 79))
                  . #3=(|IDECOMP;zeroDimPrime?;PiB;25|))
            (EXIT
             (COND ((SPADCALL (|spadConstant| $ 47) J (QREFELT $ 48)) 'T)
                   (#4='T
                    (SEQ (LETT |n| (LENGTH (QREFELT $ 6)) . #3#)
                         (LETT |i| 1 . #3#)
                         (LETT |Jd| (SPADCALL J (QREFELT $ 33)) . #3#)
                         (EXIT
                          (COND
                           ((SPADCALL (LENGTH |Jd|) |n| (QREFELT $ 68)) 'NIL)
                           (#4#
                            (SEQ
                             (SEQ (LETT |f| NIL . #3#) (LETT #2# |Jd| . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (COND
                                    ((NULL
                                      (|IDECOMP;ismonic| |f|
                                       (SPADCALL (QREFELT $ 44) |i|
                                                 (QREFELT $ 129))
                                       $))
                                     (PROGN
                                      (LETT #1# 'NIL . #3#)
                                      (GO #5=#:G345))))
                                   (COND
                                    ((< |i| |n|)
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL
                                         (SPADCALL |f|
                                                   (SPADCALL (QREFELT $ 44) |i|
                                                             (QREFELT $ 129))
                                                   (QREFELT $ 73))
                                         (QREFELT $ 137))
                                        1 (QREFELT $ 68))
                                       (PROGN
                                        (LETT #1# 'NIL . #3#)
                                        (GO #5#))))))
                                   (EXIT (LETT |i| (+ |i| 1) . #3#)))
                                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |g| (SPADCALL |Jd| |n| (QREFELT $ 144))
                                   . #3#)
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (LENGTH
                                  (LETT |lfact|
                                        (SPADCALL
                                         (SPADCALL |g| (QREFELT $ 102))
                                         (QREFELT $ 105))
                                        . #3#))
                                 1 (QREFELT $ 145))
                                'NIL)
                               (#4#
                                (EQL
                                 (QCDR (SPADCALL |lfact| 1 (QREFELT $ 146)))
                                 1))))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |IDECOMP;zeroDimPrimary?;PiB;26|
        ((J |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         ($ |Boolean|))
        (|IDECOMP;is0dimprimary| (|IDECOMP;internalForm| J $) (QREFELT $ 44) $)) 

(SDEFUN |IDECOMP;primaryDecomp;PiL;27|
        ((I |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         ($ |List|
          (|PolynomialIdeal| (|Fraction| (|Integer|))
                             (|DirectProduct| (|#| |vl|)
                                              (|NonNegativeInteger|))
                             (|OrderedVariableList| |vl|)
                             (|DistributedMultivariatePolynomial| |vl|
                                                                  (|Fraction|
                                                                   (|Integer|))))))
        (SPROG
         ((#1=#:G360 NIL) (II NIL) (#2=#:G359 NIL)
          (|truelist| (|List| (|OrderedVariableList| |vl|))) (#3=#:G350 NIL)
          (#4=#:G349 #5=(|List| (|OrderedVariableList| |vl|))) (#6=#:G351 #5#)
          (#7=#:G358 NIL) (|f| NIL)
          (J
           (|PolynomialIdeal| (|Fraction| (|Polynomial| (|Integer|)))
                              (|DirectProduct| (|#| |vl|)
                                               (|NonNegativeInteger|))
                              (|OrderedVariableList| |vl|)
                              (|DistributedMultivariatePolynomial| |vl|
                                                                   (|Fraction|
                                                                    (|Polynomial|
                                                                     (|Integer|)))))))
         (SEQ
          (LETT J (SPADCALL (|IDECOMP;internalForm| I $) (QREFELT $ 79))
                . #8=(|IDECOMP;primaryDecomp;PiL;27|))
          (LETT |truelist|
                (|IDECOMP;rearrange|
                 (PROGN
                  (LETT #3# NIL . #8#)
                  (SEQ (LETT |f| NIL . #8#)
                       (LETT #7# (SPADCALL J (QREFELT $ 33)) . #8#) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #6# (SPADCALL |f| (QREFELT $ 92)) . #8#)
                          (COND
                           (#3#
                            (LETT #4# (SPADCALL #4# #6# (QREFELT $ 93)) . #8#))
                           ('T
                            (PROGN
                             (LETT #4# #6# . #8#)
                             (LETT #3# 'T . #8#)))))))
                       (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                  (COND (#3# #4#) (#9='T (|IdentityError| '|setUnion|))))
                 $)
                . #8#)
          (EXIT
           (COND
            ((SPADCALL |truelist| NIL (QREFELT $ 50))
             (LIST (|IDECOMP;externalForm| J $)))
            (#9#
             (PROGN
              (LETT #2# NIL . #8#)
              (SEQ (LETT II NIL . #8#)
                   (LETT #1#
                         (|IDECOMP;reduceDim| (CONS 0 "zeroPrimDecomp") J
                          |truelist| $)
                         . #8#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT II (CAR #1#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (|IDECOMP;externalForm| II $) #2#)
                           . #8#)))
                   (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |IDECOMP;contract;PiLPi;28|
        ((I |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|))))
         (|lvar| |List| (|OrderedVariableList| |vl|))
         ($ |PolynomialIdeal| (|Fraction| (|Integer|))
          (|DirectProduct| (|#| |vl|) (|NonNegativeInteger|))
          (|OrderedVariableList| |vl|)
          (|DistributedMultivariatePolynomial| |vl| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G390 NIL) (|gg| NIL) (#2=#:G389 NIL)
          (|fullPol|
           (|List|
            #3=(|DistributedMultivariatePolynomial| |vl|
                                                    (|Fraction| (|Integer|)))))
          (#4=#:G388 NIL) (|vv| NIL) (#5=#:G387 NIL)
          (J
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction| (|Integer|)))))
          (#6=#:G154 NIL) (#7=#:G386 NIL) (|f| NIL) (#8=#:G385 NIL)
          (|lJ|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction| (|Integer|)))))
          (#9=#:G384 NIL) (|g| NIL) (#10=#:G383 NIL) (|subsVars| (|List| #3#))
          (#11=#:G382 NIL) (#12=#:G381 NIL)
          (|newVars| (|List| (|OrderedVariableList| |vl|))) (#13=#:G380 NIL)
          (#14=#:G379 NIL) (|n| (|NonNegativeInteger|))
          (|fullVars| #15=(|List| (|OrderedVariableList| |vl|)))
          (#16=#:G362 NIL) (#17=#:G361 #15#) (#18=#:G363 #15#) (#19=#:G378 NIL)
          (|Id|
           (|List|
            (|DistributedMultivariatePolynomial| |vl|
                                                 (|Fraction| (|Integer|))))))
         (SEQ
          (LETT |Id| (SPADCALL (SPADCALL I (QREFELT $ 151)) (QREFELT $ 21))
                . #20=(|IDECOMP;contract;PiLPi;28|))
          (EXIT
           (COND ((NULL |Id|) I)
                 (#21='T
                  (SEQ
                   (LETT |fullVars|
                         (PROGN
                          (LETT #16# NIL . #20#)
                          (SEQ (LETT |g| NIL . #20#) (LETT #19# |Id| . #20#)
                               G190
                               (COND
                                ((OR (ATOM #19#)
                                     (PROGN (LETT |g| (CAR #19#) . #20#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #18# (SPADCALL |g| (QREFELT $ 152))
                                        . #20#)
                                  (COND
                                   (#16#
                                    (LETT #17#
                                          (SPADCALL #17# #18# (QREFELT $ 93))
                                          . #20#))
                                   ('T
                                    (PROGN
                                     (LETT #17# #18# . #20#)
                                     (LETT #16# 'T . #20#)))))))
                               (LETT #19# (CDR #19#) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#16# #17#)
                                (#21# (|IdentityError| '|setUnion|))))
                         . #20#)
                   (EXIT
                    (COND ((SPADCALL |fullVars| |lvar| (QREFELT $ 50)) I)
                          (#21#
                           (SEQ (LETT |n| (LENGTH |lvar|) . #20#)
                                (EXIT
                                 (COND
                                  ((< (LENGTH |fullVars|) |n|)
                                   (|error| "wrong vars"))
                                  ((EQL |n| 0) I)
                                  (#21#
                                   (SEQ
                                    (LETT |newVars|
                                          (APPEND
                                           (PROGN
                                            (LETT #14# NIL . #20#)
                                            (SEQ (LETT |vv| NIL . #20#)
                                                 (LETT #13# |fullVars| . #20#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #13#)
                                                       (PROGN
                                                        (LETT |vv| (CAR #13#)
                                                              . #20#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((COND
                                                      ((SPADCALL |vv| |lvar|
                                                                 (QREFELT $
                                                                          153))
                                                       'NIL)
                                                      (#21# 'T))
                                                     (LETT #14#
                                                           (CONS |vv| #14#)
                                                           . #20#)))))
                                                 (LETT #13# (CDR #13#) . #20#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #14#))))
                                           |lvar|)
                                          . #20#)
                                    (LETT |subsVars|
                                          (PROGN
                                           (LETT #12# NIL . #20#)
                                           (SEQ (LETT |vv| NIL . #20#)
                                                (LETT #11# |newVars| . #20#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #11#)
                                                      (PROGN
                                                       (LETT |vv| (CAR #11#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #12#
                                                        (CONS
                                                         (SPADCALL
                                                          (|spadConstant| $
                                                                          154)
                                                          |vv| 1
                                                          (QREFELT $ 155))
                                                         #12#)
                                                        . #20#)))
                                                (LETT #11# (CDR #11#) . #20#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #12#))))
                                          . #20#)
                                    (LETT |lJ|
                                          (PROGN
                                           (LETT #10# NIL . #20#)
                                           (SEQ (LETT |g| NIL . #20#)
                                                (LETT #9# |Id| . #20#) G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |g| (CAR #9#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #10#
                                                        (CONS
                                                         (SPADCALL |g|
                                                                   |fullVars|
                                                                   |subsVars|
                                                                   (QREFELT $
                                                                            157))
                                                         #10#)
                                                        . #20#)))
                                                (LETT #9# (CDR #9#) . #20#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #10#))))
                                          . #20#)
                                    (LETT J (SPADCALL |lJ| (QREFELT $ 159))
                                          . #20#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL J
                                                 (LIST (|spadConstant| $ 154))
                                                 (QREFELT $ 160))
                                       (SPADCALL J (QREFELT $ 38)))
                                      ((SPADCALL J
                                                 (LIST (|spadConstant| $ 161))
                                                 (QREFELT $ 160))
                                       (SPADCALL NIL (QREFELT $ 38)))
                                      (#21#
                                       (SEQ
                                        (LETT J
                                              (PROGN
                                               (LETT #8# NIL . #20#)
                                               (SEQ (LETT |f| NIL . #20#)
                                                    (LETT #7# J . #20#) G190
                                                    (COND
                                                     ((OR (ATOM #7#)
                                                          (PROGN
                                                           (LETT |f| (CAR #7#)
                                                                 . #20#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL
                                                         (PROG2
                                                             (LETT #6#
                                                                   (SPADCALL
                                                                    |f|
                                                                    (QREFELT $
                                                                             162))
                                                                   . #20#)
                                                             (QCDR #6#)
                                                           (|check_union|
                                                            (QEQCAR #6# 0)
                                                            (|OrderedVariableList|
                                                             (QREFELT $ 6))
                                                            #6#))
                                                         |newVars|
                                                         (QREFELT $ 153))
                                                        (LETT #8#
                                                              (CONS |f| #8#)
                                                              . #20#)))))
                                                    (LETT #7# (CDR #7#) . #20#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #8#))))
                                              . #20#)
                                        (LETT |fullPol|
                                              (PROGN
                                               (LETT #5# NIL . #20#)
                                               (SEQ (LETT |vv| NIL . #20#)
                                                    (LETT #4# |fullVars|
                                                          . #20#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #4#)
                                                          (PROGN
                                                           (LETT |vv| (CAR #4#)
                                                                 . #20#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #5#
                                                            (CONS
                                                             (SPADCALL
                                                              (|spadConstant| $
                                                                              154)
                                                              |vv| 1
                                                              (QREFELT $ 155))
                                                             #5#)
                                                            . #20#)))
                                                    (LETT #4# (CDR #4#) . #20#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #5#))))
                                              . #20#)
                                        (EXIT
                                         (SPADCALL
                                          (PROGN
                                           (LETT #2# NIL . #20#)
                                           (SEQ (LETT |gg| NIL . #20#)
                                                (LETT #1# J . #20#) G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |gg| (CAR #1#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (SPADCALL |gg|
                                                                   |newVars|
                                                                   |fullPol|
                                                                   (QREFELT $
                                                                            157))
                                                         #2#)
                                                        . #20#)))
                                                (LETT #1# (CDR #1#) . #20#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          (QREFELT $ 38)))))))))))))))))))))) 

(DECLAIM (NOTINLINE |IdealDecompositionPackage;|)) 

(DEFUN |IdealDecompositionPackage| (#1=#:G393)
  (SPROG NIL
         (PROG (#2=#:G394)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IdealDecompositionPackage|)
                                               '|domainEqualList|)
                    . #3=(|IdealDecompositionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IdealDecompositionPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IdealDecompositionPackage|)))))))))) 

(DEFUN |IdealDecompositionPackage;| (|#1|)
  (SPROG
   ((#1=#:G157 NIL) (#2=#:G154 NIL) (#3=#:G392 NIL) (|xx| NIL) (#4=#:G391 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #5=(|IdealDecompositionPackage|))
     (LETT |dv$| (LIST '|IdealDecompositionPackage| DV$1) . #5#)
     (LETT $ (GETREFV 164) . #5#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #5#))
     (|haddProp| |$ConstructorCache| '|IdealDecompositionPackage| (LIST DV$1)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 44
               (PROGN
                (LETT #4# NIL . #5#)
                (SEQ (LETT |xx| NIL . #5#) (LETT #3# |#1| . #5#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |xx| (CAR #3#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4#
                             (CONS
                              (PROG2
                                  (LETT #2# (SPADCALL |xx| (QREFELT $ 43))
                                        . #5#)
                                  (QCDR #2#)
                                (|check_union| (QEQCAR #2# 0)
                                               (|OrderedVariableList|
                                                (SPADCALL |xx| (QREFELT $ 43)))
                                               #2#))
                              #4#)
                             . #5#)))
                     (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))
     (QSETREFV $ 46
               (PROG1 (LETT #1# (- (LENGTH (QREFELT $ 44)) 1) . #5#)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
     $)))) 

(MAKEPROP '|IdealDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Fraction| 7)
              (0 . |numer|) (|Fraction| 14) (5 . |coerce|) (10 . |denom|)
              (15 . /) (|Polynomial| 7) (21 . |numer|) (26 . |ground|)
              (31 . |denom|) (36 . /) (|List| 24)
              (|PolynomialIdeal| 8 119 42 24) (42 . |generators|)
              (|DistributedMultivariatePolynomial| 6 10) (|Mapping| 10 8)
              (|DistributedMultivariatePolynomial| 6 8)
              (|MPolyCatFunctions2| 42 119 119 8 10 24 22) (47 . |map|)
              (|Boolean|) (53 . |groebner?|) (|List| 22)
              (|PolynomialIdeal| 10 119 42 22) (58 . |groebnerIdeal|)
              (63 . |ideal|) (68 . |generators|) (|Mapping| 8 10)
              (|MPolyCatFunctions2| 42 119 119 10 8 22 24) (73 . |map|)
              (79 . |groebner?|) (84 . |groebnerIdeal|) (89 . |ideal|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 6)
              (94 . |variable|) '|lvint| (99 . |One|) '|nvint1| (103 . |One|)
              (107 . |element?|) (|List| 42) (113 . =) (119 . >)
              (125 . |setDifference|) (|Mapping| 27 42 42) (131 . |sort|)
              '"last" (137 . |elt|) (143 . |differentiate|) (149 . |gcd|)
              (155 . |exquo|) (161 . |coerce|) (166 . |elt|) (172 . |remove|)
              (|GroebnerPackage| 10 119 42 22) (178 . |groebner|)
              (183 . |Zero|) (|NonNegativeInteger|) (187 . |degree|) (193 . ~=)
              (199 . *) (205 . +) (211 . -) (|SparseUnivariatePolynomial| $)
              (217 . |univariate|) (|SparseUnivariatePolynomial| 22)
              (223 . |elt|) (229 . |Zero|) (233 . |Zero|) (237 . ~=)
              (243 . |groebner|) (248 . |saturate|) (254 . *) (260 . |in?|)
              (266 . |One|) (270 . ~=) (|Union| 42 '"failed")
              (276 . |mainVariable|) (281 . ~=) (287 . =) (293 . =)
              (299 . |position|) (305 . |reductum|) (310 . |variables|)
              (315 . |setUnion|) (321 . |remove|) (327 . |leadingCoefficient|)
              (332 . *) (338 . |coerce|) (|List| 30) (343 . |list|)
              (|Factored| 22)
              (|MPolyCatRationalFunctionFactorizer| 119 42 7 22)
              (348 . |factor|) (|Record| (|:| |factor| 22) (|:| |exponent| 7))
              (|List| 103) (353 . |factors|) (358 . ^) (364 . |intersect|)
              |IDECOMP;radical;2Pi;13| (370 . |convert|) (375 . |One|)
              (379 . |monomial|) (386 . |coerce|) (391 . |monomial|) (398 . *)
              (404 . |lcm|) (410 . |degree|) (416 . |univariate|) (422 . |inv|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT $ 6))) 66)
              (427 . |degree|) (432 . |monomial|)
              (|SparseUnivariatePolynomial| 14) (438 . |Zero|) (442 . =)
              (448 . |leadingCoefficient|) (453 . |degree|) (458 . |reductum|)
              (463 . |subtractIfCan|) (469 . |elt|) (475 . |inRadical?|)
              (481 . |last|) (|List| 7) (486 . =) (492 . -)
              (497 . |leadingCoefficient|) (502 . |ground?|) (507 . |degree|)
              (512 . |coefficient|) (518 . |monomial|) (524 . +) (530 . ^)
              (536 . -) (542 . |multivariate|) (548 . |elt|) (554 . >)
              (560 . |elt|) |IDECOMP;zeroDimPrime?;PiB;25|
              |IDECOMP;zeroDimPrimary?;PiB;26| (|List| 20)
              |IDECOMP;primaryDecomp;PiL;27| (566 . |groebner|)
              (571 . |variables|) (576 . |member?|) (582 . |One|)
              (586 . |monomial|) (|List| $) (593 . |eval|)
              (|GroebnerPackage| 8 119 42 24) (600 . |groebner|) (605 . =)
              (611 . |Zero|) (615 . |mainVariable|)
              |IDECOMP;contract;PiLPi;28|)
           '#(|zeroDimPrime?| 620 |zeroDimPrimary?| 625 |radical| 630 |prime?|
              635 |primaryDecomp| 640 |contract| 645)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(1 8 7 0 9 1 10 0 7 11 1 8 7
                                                   0 12 2 10 0 0 0 13 1 10 14 0
                                                   15 1 14 7 0 16 1 10 14 0 17
                                                   2 8 0 7 7 18 1 20 19 0 21 2
                                                   25 22 23 24 26 1 20 27 0 28
                                                   1 30 0 29 31 1 30 0 29 32 1
                                                   30 29 0 33 2 35 24 34 22 36
                                                   1 30 27 0 37 1 20 0 19 38 1
                                                   20 0 19 39 1 42 40 41 43 0
                                                   10 0 45 0 22 0 47 2 30 27 22
                                                   0 48 2 49 27 0 0 50 2 42 27
                                                   0 0 51 2 49 0 0 0 52 2 49 0
                                                   53 0 54 2 49 42 0 55 56 2 22
                                                   0 0 42 57 2 22 0 0 0 58 2 22
                                                   40 0 0 59 1 22 0 42 60 2 29
                                                   22 0 55 61 2 29 0 22 0 62 1
                                                   63 29 29 64 0 22 0 65 2 22
                                                   66 0 42 67 2 66 27 0 0 68 2
                                                   22 0 7 0 69 2 22 0 0 0 70 2
                                                   22 0 0 0 71 2 22 72 0 42 73
                                                   2 74 22 0 22 75 0 10 0 76 0
                                                   8 0 77 2 22 27 0 0 78 1 30 0
                                                   0 79 2 30 0 0 22 80 2 22 0 0
                                                   0 81 2 30 27 0 0 82 0 8 0 83
                                                   2 29 27 0 0 84 1 22 85 0 86
                                                   2 42 27 0 0 87 2 42 27 0 0
                                                   88 2 29 27 0 0 89 2 49 7 42
                                                   0 90 1 22 0 0 91 1 22 49 0
                                                   92 2 49 0 0 0 93 2 49 0 42 0
                                                   94 1 22 10 0 95 2 10 0 0 0
                                                   96 1 22 0 10 97 1 98 0 30 99
                                                   1 101 100 22 102 1 100 104 0
                                                   105 2 22 0 0 66 106 2 30 0 0
                                                   0 107 1 42 41 0 109 0 14 0
                                                   110 3 14 0 0 41 66 111 1 10
                                                   0 14 112 3 22 0 0 42 66 113
                                                   2 22 0 10 0 114 2 14 0 0 0
                                                   115 2 14 66 0 41 116 2 14 72
                                                   0 41 117 1 10 0 0 118 1 22
                                                   119 0 120 2 22 0 10 119 121
                                                   0 122 0 123 2 122 27 0 0 124
                                                   1 122 14 0 125 1 122 66 0
                                                   126 1 122 0 0 127 2 66 40 0
                                                   0 128 2 49 42 0 7 129 2 30
                                                   27 22 0 130 1 49 42 0 131 2
                                                   132 27 0 0 133 1 22 0 0 134
                                                   1 74 22 0 135 1 22 27 0 136
                                                   1 74 66 0 137 2 74 22 0 66
                                                   138 2 74 0 22 66 139 2 74 0
                                                   0 0 140 2 74 0 0 66 141 2 74
                                                   0 0 0 142 2 22 0 72 42 143 2
                                                   29 22 0 7 144 2 66 27 0 0
                                                   145 2 104 103 0 7 146 1 20 0
                                                   0 151 1 24 49 0 152 2 49 27
                                                   42 0 153 0 24 0 154 3 24 0 0
                                                   42 66 155 3 24 0 0 49 156
                                                   157 1 158 19 19 159 2 19 27
                                                   0 0 160 0 24 0 161 1 24 85 0
                                                   162 1 0 27 20 147 1 0 27 20
                                                   148 1 0 20 20 108 1 0 27 20
                                                   1 1 0 149 20 150 2 0 20 20
                                                   49 163)))))
           '|lookupComplete|)) 
