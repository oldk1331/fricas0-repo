
(SDEFUN |LODEEF;smpxpart|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|x| |Symbol|)
         (|l| |List| (|Kernel| F))
         (|lp| |List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R (|Kernel| F)))
        (|LODEEF;downmp| (SPADCALL (|LODEEF;upmp| |p| |l| $) (QREFELT $ 13))
         |l| |lp| $)) 

(SDEFUN |LODEEF;downmp|
        ((|p| |SparseMultivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F))
         (|l| |List| (|Kernel| F))
         (|lp| |List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         ($ |SparseMultivariatePolynomial| R (|Kernel| F)))
        (SPADCALL (SPADCALL |p| |l| |lp| (QREFELT $ 16)) (QREFELT $ 18))) 

(SDEFUN |LODEEF;homosolve|
        ((|lf| L)
         (|op| |LinearOrdinaryDifferentialOperator1|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|sols| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|x| |Symbol|) ($ |List| F))
        (|LODEEF;homosolve1| |lf| (|LODEEF;ratlogsol| |op| |sols| |k| |x| $)
         |k| |x| $)) 

(SDEFUN |LODEEF;algSolve|
        ((|op| L) (|g| F) (|k| . #1=(|Kernel| F)) (|l| |List| (|Kernel| F))
         (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          #2="failed"))
        (SPROG
         ((#3=#:G139 NIL) (|f| NIL) (#4=#:G138 NIL) (|kz| (|Kernel| F))
          (|rc| (|Record| (|:| |particular| F) (|:| |basis| (|List| F))))
          (|u|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                    #2#))
          (|lv| (|List| F)) (|lk| (|List| #1#)) (|z| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|kx| (|Kernel| F)))
         (SEQ
          (COND
           ((QEQCAR
             (SPADCALL
              (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 22))
                    . #5=(|LODEEF;algSolve|))
              (QREFELT $ 24))
             0)
            (|LODEEF;palgSolve| |op| |g| |kx| |k| |x| $))
           ((SPADCALL (SPADCALL |kx| (QREFELT $ 26)) (QREFELT $ 9)
                      (QREFELT $ 28))
            (SEQ
             (LETT |rec|
                   (SPADCALL (SPADCALL |kx| (QREFELT $ 30))
                             (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 33))
                   . #5#)
             (LETT |z| (SPADCALL (QVELT |rec| 3) (QREFELT $ 35)) . #5#)
             (LETT |lk| (LIST |kx| |k|) . #5#)
             (LETT |lv|
                   (LIST (SPADCALL (QVELT |rec| 1) |z| (QREFELT $ 37))
                         (SPADCALL (QVELT |rec| 2) |z| (QREFELT $ 37)))
                   . #5#)
             (LETT |u|
                   (SPADCALL
                    (|LODEEF;localmap|
                     (CONS #'|LODEEF;algSolve!0| (VECTOR $ |lv| |lk|)) |op| $)
                    (SPADCALL |g| |lk| |lv| (QREFELT $ 40)) |x| (QREFELT $ 43))
                   . #5#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#6='T
                     (SEQ (LETT |rc| (QCDR |u|) . #5#)
                          (LETT |kz| (SPADCALL |z| (QREFELT $ 44)) . #5#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) |kz| (QVELT |rec| 0)
                                            (QREFELT $ 45))
                                  (PROGN
                                   (LETT #4# NIL . #5#)
                                   (SEQ (LETT |f| NIL . #5#)
                                        (LETT #3# (QCDR |rc|) . #5#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |f| (CAR #3#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (SPADCALL |f| |kz|
                                                           (QVELT |rec| 0)
                                                           (QREFELT $ 45))
                                                 #4#)
                                                . #5#)))
                                        (LETT #3# (CDR #3#) . #5#) (GO G190)
                                        G191 (EXIT (NREVERSE #4#)))))))))))))
           (#6# (|LODEEF;lastChance| |op| |g| |x| $)))))) 

(SDEFUN |LODEEF;algSolve!0| ((|f1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|LODEEF;algSolve|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |lk| |lv| (QREFELT $ 40)))))) 

(SDEFUN |LODEEF;doVarParams|
        ((|eq| L) (|g| F) (|bas| |List| F) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (SPROG ((|u| (|Union| F "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL |eq| |g| |bas|
                                (CONS #'|LODEEF;doVarParams!0| (VECTOR $ |x|))
                                (QREFELT $ 52))
                      |LODEEF;doVarParams|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (|LODEEF;lastChance| |eq| |g| |x| $))
                       ('T (CONS 0 (CONS (QCDR |u|) |bas|)))))))) 

(SDEFUN |LODEEF;doVarParams!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|LODEEF;doVarParams|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT $ 47)))))) 

(SDEFUN |LODEEF;lastChance|
        ((|op| L) (|g| F) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (COND
         ((EQL (SPADCALL |op| (QREFELT $ 54)) 1)
          (CONS 0
                (|LODEEF;firstOrder| (SPADCALL |op| 0 (QREFELT $ 58))
                 (SPADCALL |op| (QREFELT $ 59)) |g| |x| $)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |LODEEF;firstOrder|
        ((|a0| F) (|a1| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |particular| F) (|:| |basis| (|List| F))))
        (SPROG ((|h| (F)))
               (SEQ
                (LETT |h|
                      (|LODEEF;xpart|
                       (SPADCALL
                        (SPADCALL (SPADCALL |a0| |a1| (QREFELT $ 60))
                                  (QREFELT $ 61))
                        |x| (QREFELT $ 62))
                       |x| $)
                      |LODEEF;firstOrder|)
                (EXIT
                 (CONS
                  (SPADCALL |h|
                            (SPADCALL
                             (SPADCALL (SPADCALL |g| |h| (QREFELT $ 60)) |a1|
                                       (QREFELT $ 60))
                             |x| (QREFELT $ 47))
                            (QREFELT $ 63))
                  (LIST |h|)))))) 

(SDEFUN |LODEEF;xpart| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|lp| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#1=#:G163 NIL) (|k| NIL) (#2=#:G162 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (NREVERSE
                 (SPADCALL (SPADCALL |f| (QREFELT $ 64)) |x| (QREFELT $ 65)))
                . #3=(|LODEEF;xpart|))
          (LETT |lp|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 66)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL
            (|LODEEF;smpxpart| (SPADCALL |f| (QREFELT $ 68)) |x| |l| |lp| $)
            (|LODEEF;smpxpart| (SPADCALL |f| (QREFELT $ 69)) |x| |l| |lp| $)
            (QREFELT $ 70)))))) 

(SDEFUN |LODEEF;upmp|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|l| |List| (|Kernel| F))
         ($ |SparseMultivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F)))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans|
           (|SparseMultivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F)))
          (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) (SPADCALL |p| (QREFELT $ 71)))
                ('T
                 (SEQ
                  (LETT |up|
                        (SPADCALL |p|
                                  (LETT |k| (|SPADfirst| |l|)
                                        . #1=(|LODEEF;upmp|))
                                  (QREFELT $ 72))
                        . #1#)
                  (LETT |l| (CDR |l|) . #1#)
                  (LETT |ans| (|spadConstant| $ 73) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |up| (|spadConstant| $ 75) (QREFELT $ 76)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (|LODEEF;upmp|
                                          (SPADCALL |up| (QREFELT $ 77)) |l| $)
                                         |k| (SPADCALL |up| (QREFELT $ 78))
                                         (QREFELT $ 79))
                                        (QREFELT $ 80))
                              . #1#)
                        (EXIT
                         (LETT |up| (SPADCALL |up| (QREFELT $ 81)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |LODEEF;multint| ((|a| F) (|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((#1=#:G172 NIL) (|g| NIL))
               (SEQ
                (SEQ (LETT |g| NIL . #2=(|LODEEF;multint|))
                     (LETT #1# |l| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |a|
                             (SPADCALL |g|
                                       (|LODEEF;xpart|
                                        (SPADCALL |a| |x| (QREFELT $ 47)) |x|
                                        $)
                                       (QREFELT $ 63))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(SDEFUN |LODEEF;expsols|
        ((|op| |LinearOrdinaryDifferentialOperator1|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|x| |Symbol|) ($ |List| F))
        (SPROG ((#1=#:G180 NIL) (|h| NIL) (#2=#:G179 NIL))
               (SEQ
                (COND
                 ((EQL (SPADCALL |op| (QREFELT $ 83)) 1)
                  (QCDR
                   (|LODEEF;firstOrder|
                    (SPADCALL (SPADCALL |op| 0 (QREFELT $ 85)) |k|
                              (QREFELT $ 87))
                    (SPADCALL (SPADCALL |op| (QREFELT $ 88)) |k|
                              (QREFELT $ 87))
                    (|spadConstant| $ 57) |x| $)))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|LODEEF;expsols|))
                   (SEQ (LETT |h| NIL . #3#)
                        (LETT #1# (SPADCALL |op| (ELT $ 91) (QREFELT $ 95))
                              . #3#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |h| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (|LODEEF;xpart|
                                  (SPADCALL (SPADCALL |h| |k| (QREFELT $ 87))
                                            |x| (QREFELT $ 62))
                                  |x| $)
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |LODEEF;ratlogsol|
        ((|oper| |LinearOrdinaryDifferentialOperator1|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|sols| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((#1=#:G197 NIL) (|e| NIL) (#2=#:G196 NIL) (#3=#:G195 NIL) (|h| NIL)
          (#4=#:G194 NIL) (|int| (|List| F)) (#5=#:G193 NIL) (#6=#:G192 NIL)
          (|le| (|List| F))
          (|rec|
           (|Record|
            (|:| |eq|
                 (|LinearOrdinaryDifferentialOperator1|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |op| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|bas| (|List| F)) (#7=#:G191 NIL) (#8=#:G190 NIL))
         (SEQ
          (LETT |bas|
                (PROGN
                 (LETT #8# NIL . #9=(|LODEEF;ratlogsol|))
                 (SEQ (LETT |h| NIL . #9#) (LETT #7# |sols| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |h| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (|LODEEF;xpart|
                                (SPADCALL |h| |k| (QREFELT $ 87)) |x| $)
                               #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (EXIT
           (COND ((EQL (SPADCALL |oper| (QREFELT $ 83)) (LENGTH |bas|)) |bas|)
                 ('T
                  (SEQ
                   (LETT |rec| (SPADCALL |oper| |sols| (QREFELT $ 98)) . #9#)
                   (LETT |le| (|LODEEF;expsols| (QCAR |rec|) |k| |x| $) . #9#)
                   (LETT |int|
                         (PROGN
                          (LETT #6# NIL . #9#)
                          (SEQ (LETT |h| NIL . #9#)
                               (LETT #5# (QCDR |rec|) . #9#) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |h| (CAR #5#) . #9#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (|LODEEF;xpart|
                                         (SPADCALL |h| |k| (QREFELT $ 87)) |x|
                                         $)
                                        #6#)
                                       . #9#)))
                               (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                               (EXIT (NREVERSE #6#))))
                         . #9#)
                   (EXIT
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL . #9#)
                      (SEQ (LETT |h| NIL . #9#) (LETT #3# |sols| . #9#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |h| (CAR #3#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (|LODEEF;xpart|
                                     (SPADCALL |h| |k| (QREFELT $ 87)) |x| $)
                                    #4#)
                                   . #9#)))
                           (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (PROGN
                      (LETT #2# NIL . #9#)
                      (SEQ (LETT |e| NIL . #9#) (LETT #1# |le| . #9#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |e| (CAR #1#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (|LODEEF;multint| |e| |int| |x| $)
                                         #2#)
                                   . #9#)))
                           (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 99)))))))))) 

(SDEFUN |LODEEF;homosolve1|
        ((|oper| L) (|sols| |List| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |List| F))
        (SPROG
         ((#1=#:G230 NIL) (|e| NIL) (#2=#:G229 NIL) (|int| (|List| F))
          (#3=#:G228 NIL) (|h| NIL) (#4=#:G227 NIL)
          (|rec| (|Record| (|:| |eq| L) (|:| |op| (|List| F))))
          (|n| (|NonNegativeInteger|)) (#5=#:G220 NIL))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL |oper| (QREFELT $ 54))
                                (LENGTH |sols|))
                             . #6=(|LODEEF;homosolve1|))
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #6#))
            |sols|)
           ('T
            (SEQ (LETT |rec| (SPADCALL |oper| |sols| (QREFELT $ 102)) . #6#)
                 (LETT |int|
                       (PROGN
                        (LETT #4# NIL . #6#)
                        (SEQ (LETT |h| NIL . #6#) (LETT #3# (QCDR |rec|) . #6#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |h| (CAR #3#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4# (CONS (|LODEEF;xpart| |h| |x| $) #4#)
                                     . #6#)))
                             (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #4#))))
                       . #6#)
                 (EXIT
                  (SPADCALL |sols|
                            (PROGN
                             (LETT #2# NIL . #6#)
                             (SEQ (LETT |e| NIL . #6#)
                                  (LETT #1#
                                        (|LODEEF;norf1| (QCAR |rec|) |k| |x|
                                         |n| $)
                                        . #6#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |e| (CAR #1#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|LODEEF;multint| |e| |int| |x| $)
                                           #2#)
                                          . #6#)))
                                  (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 99))))))))) 

(SDEFUN |LODEEF;norf1|
        ((|op| L) (|k| |Kernel| F) (|x| |Symbol|) (|n| |NonNegativeInteger|)
         ($ |List| F))
        (SPROG
         ((|bas| (|List| F))
          (|eq|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (COND
           ((EQL |n| 1)
            (QCDR
             (|LODEEF;firstOrder| (SPADCALL |op| 0 (QREFELT $ 58))
              (SPADCALL |op| (QREFELT $ 59)) (|spadConstant| $ 57) |x| $)))
           ((QEQCAR
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |op| (QREFELT $ 104)) |x| (QREFELT $ 105))
               (QREFELT $ 106))
              (QREFELT $ 24))
             0)
            (SEQ (LETT |eq| (|LODEEF;ulodo| |op| |k| $) . #1=(|LODEEF;norf1|))
                 (EXIT
                  (COND ((EQL |n| 2) (|LODEEF;kovode| |eq| |k| |x| $))
                        (#2='T
                         (SEQ
                          (LETT |eq|
                                (SPADCALL (SPADCALL |eq| (QREFELT $ 109))
                                          (QREFELT $ 110))
                                . #1#)
                          (EXIT
                           (COND
                            ((EQL (SPADCALL |eq| (QREFELT $ 83)) 2)
                             (COND
                              ((NULL
                                (LETT |bas| (|LODEEF;kovode| |eq| |k| |x| $)
                                      . #1#))
                               NIL)
                              (#2#
                               (|LODEEF;homosolve1| |op| |bas| |k| |x| $))))
                            (#2# NIL)))))))))
           (#2# NIL))))) 

(SDEFUN |LODEEF;kovode|
        ((|op| |LinearOrdinaryDifferentialOperator1|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|x| |Symbol|) ($ |List| F))
        (SPROG
         ((|y1| (F)) (#1=#:G251 NIL) (|e| NIL) (#2=#:G250 NIL) (|ba| (F))
          (|p| (|SparseUnivariatePolynomial| F))
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|a| #3=(|Fraction| (|SparseUnivariatePolynomial| F))) (|b| #3#))
         (SEQ
          (LETT |b| (SPADCALL |op| 1 (QREFELT $ 85)) . #4=(|LODEEF;kovode|))
          (LETT |a| (SPADCALL |op| 2 (QREFELT $ 85)) . #4#)
          (LETT |u|
                (SPADCALL (SPADCALL |op| 0 (QREFELT $ 85)) |b| |a| (ELT $ 91)
                          (QREFELT $ 113))
                . #4#)
          (EXIT
           (COND ((QEQCAR |u| 1) NIL)
                 (#5='T
                  (SEQ
                   (LETT |p|
                         (SPADCALL (CONS #'|LODEEF;kovode!0| (VECTOR $ |k|))
                                   (QCDR |u|) (QREFELT $ 117))
                         . #4#)
                   (LETT |ba|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b| |a| (QREFELT $ 118))
                                    (QREFELT $ 119))
                          |k| (QREFELT $ 87))
                         . #4#)
                   (EXIT
                    (COND
                     ((EQL (SPADCALL |p| (QREFELT $ 120)) 2)
                      (PROGN
                       (LETT #2# NIL . #4#)
                       (SEQ (LETT |e| NIL . #4#)
                            (LETT #1# (SPADCALL |p| (QREFELT $ 121)) . #4#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |e| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (|LODEEF;xpart|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |ba|
                                                  (SPADCALL 2 (QREFELT $ 123))
                                                  (QREFELT $ 60))
                                        |e| (QREFELT $ 124))
                                       |x| (QREFELT $ 62))
                                      |x| $)
                                     #2#)
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))
                     (#5#
                      (SEQ
                       (LETT |y1|
                             (|LODEEF;xpart|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |ba| (SPADCALL 2 (QREFELT $ 123))
                                          (QREFELT $ 60))
                                (SPADCALL |p| (QREFELT $ 125)) (QREFELT $ 124))
                               |x| (QREFELT $ 62))
                              |x| $)
                             . #4#)
                       (EXIT
                        (LIST |y1|
                              (SPADCALL |y1|
                                        (|LODEEF;xpart|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ba| |x| (QREFELT $ 62))
                                           (SPADCALL |y1| 2 (QREFELT $ 127))
                                           (QREFELT $ 60))
                                          |x| (QREFELT $ 47))
                                         |x| $)
                                        (QREFELT $ 63))))))))))))))) 

(SDEFUN |LODEEF;kovode!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|LODEEF;kovode|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |k| (QREFELT $ 87)))))) 

(SDEFUN |LODEEF;solve;LFSU;16|
        ((|op| L) (|g| F) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (SPROG ((|k| (|Kernel| F)) (|l| (|List| (|Kernel| F))))
               (COND
                ((NULL
                  (LETT |l|
                        (SPADCALL (SPADCALL |op| (QREFELT $ 104)) |x|
                                  (QREFELT $ 105))
                        . #1=(|LODEEF;solve;LFSU;16|)))
                 (CONS 0 (SPADCALL |op| |g| |x| (QREFELT $ 129))))
                ((QEQCAR
                  (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 106)) . #1#)
                            (QREFELT $ 24))
                  0)
                 (|LODEEF;rfSolve| |op| |g| |k| |x| $))
                ((SPADCALL (SPADCALL |k| (QREFELT $ 26)) (QREFELT $ 9)
                           (QREFELT $ 28))
                 (|LODEEF;algSolve| |op| |g| |k| |l| |x| $))
                ('T (|LODEEF;lastChance| |op| |g| |x| $))))) 

(SDEFUN |LODEEF;ulodo|
        ((|eq| L) (|k| |Kernel| F)
         ($ |LinearOrdinaryDifferentialOperator1|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |op| (|spadConstant| $ 130) . #1=(|LODEEF;ulodo|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |eq| (|spadConstant| $ 131) (QREFELT $ 132)))
                     (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL |op|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |eq| (QREFELT $ 59))
                                               |k| (QREFELT $ 134))
                                     (SPADCALL |eq| (QREFELT $ 54))
                                     (QREFELT $ 135))
                                    (QREFELT $ 136))
                          . #1#)
                    (EXIT (LETT |eq| (SPADCALL |eq| (QREFELT $ 137)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |op|)))) 

(SDEFUN |LODEEF;rfSolve|
        ((|eq| L) (|g| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (SPROG
         ((#1=#:G273 NIL)
          (|rc|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          "failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |op| (|LODEEF;ulodo| |eq| |k| $) . #2=(|LODEEF;rfSolve|))
              (EXIT
               (COND
                ((NULL
                  (SPADCALL |k|
                            (SPADCALL (SPADCALL |g| (QREFELT $ 138)) |x|
                                      (QREFELT $ 65))
                            (QREFELT $ 139)))
                 (SEQ
                  (LETT |rc|
                        (SPADCALL |op| (SPADCALL |g| |k| (QREFELT $ 134))
                                  (QREFELT $ 143))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR (QCAR |rc|) 1)
                     (|LODEEF;doVarParams| |eq| |g|
                      (|LODEEF;homosolve| |eq| |op| (QCDR |rc|) |k| |x| $) |x|
                      $))
                    (#3='T
                     (CONS 0
                           (CONS
                            (SPADCALL
                             (PROG2 (LETT #1# (QCAR |rc|) . #2#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|Fraction|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7)))
                                              #1#))
                             |k| (QREFELT $ 87))
                            (|LODEEF;homosolve| |eq| |op| (QCDR |rc|) |k| |x|
                             $))))))))
                (#3#
                 (|LODEEF;doVarParams| |eq| |g|
                  (|LODEEF;homosolve| |eq| |op|
                   (QCDR
                    (SPADCALL |op| (|spadConstant| $ 144) (QREFELT $ 143)))
                   |k| |x| $)
                  |x| $))))))) 

(SDEFUN |LODEEF;solve;LFSFLU;19|
        ((|op| L) (|g| F) (|x| |Symbol|) (|a| F) (|y0| |List| F)
         ($ |Union| F "failed"))
        (SPROG
         ((|hp| (F)) (#1=#:G298 NIL) (|f| NIL) (|i| NIL) (|s| (|Vector| F))
          (|sol| (|Union| (|Vector| F) "failed")) (|h| (F)) (#2=#:G296 NIL)
          (#3=#:G297 NIL) (|yy| NIL) (|kx| (|Kernel| F)) (|v| (|Vector| F))
          (|n| (|NonNegativeInteger|)) (|b| #4=(|List| F))
          (|u|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| #4#))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL |op| |g| |x| (QREFELT $ 43))
                . #5=(|LODEEF;solve;LFSFLU;19|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 (#6='T
                  (SEQ (LETT |hp| (LETT |h| (QCAR (QCDR |u|)) . #5#) . #5#)
                       (LETT |b| (QCDR (QCDR |u|)) . #5#)
                       (LETT |v|
                             (MAKEARR1 (LETT |n| (LENGTH |y0|) . #5#)
                                       (|spadConstant| $ 57))
                             . #5#)
                       (LETT |kx| (SPADCALL |x| (QREFELT $ 145)) . #5#)
                       (SEQ (LETT |yy| NIL . #5#) (LETT #3# |y0| . #5#)
                            (LETT |i| (SPADCALL |v| (QREFELT $ 147)) . #5#)
                            (LETT #2# (QVSIZE |v|) . #5#) G190
                            (COND
                             ((OR (> |i| #2#) (ATOM #3#)
                                  (PROGN (LETT |yy| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (SPADCALL |v| |i|
                                       (SPADCALL |yy|
                                                 (SPADCALL |h| |kx| |a|
                                                           (QREFELT $ 45))
                                                 (QREFELT $ 148))
                                       (QREFELT $ 149))
                             (EXIT
                              (LETT |h|
                                    (SPADCALL (QREFELT $ 11) |h|
                                              (QREFELT $ 150))
                                    . #5#)))
                            (LETT |i|
                                  (PROG1 (+ |i| 1) (LETT #3# (CDR #3#) . #5#))
                                  . #5#)
                            (GO G190) G191 (EXIT NIL))
                       (LETT |sol|
                             (SPADCALL
                              (SPADCALL
                               (CONS #'|LODEEF;solve;LFSFLU;19!0|
                                     (VECTOR $ |a| |kx|))
                               (SPADCALL |b| |n| (QREFELT $ 152))
                               (QREFELT $ 153))
                              |v| (QREFELT $ 156))
                             . #5#)
                       (EXIT
                        (COND ((QEQCAR |sol| 1) (CONS 1 "failed"))
                              (#6#
                               (SEQ
                                (SEQ
                                 (LETT |i|
                                       (SPADCALL (LETT |s| (QCDR |sol|) . #5#)
                                                 (QREFELT $ 147))
                                       . #5#)
                                 (LETT |f| NIL . #5#) (LETT #1# |b| . #5#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |f| (CAR #1#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |hp|
                                         (SPADCALL |hp|
                                                   (SPADCALL
                                                    (SPADCALL |s| |i|
                                                              (QREFELT $ 157))
                                                    |f| (QREFELT $ 63))
                                                   (QREFELT $ 124))
                                         . #5#)))
                                 (LETT #1#
                                       (PROG1 (CDR #1#)
                                         (LETT |i| (+ |i| 1) . #5#))
                                       . #5#)
                                 (GO G190) G191 (EXIT NIL))
                                (EXIT (CONS 0 |hp|))))))))))))) 

(SDEFUN |LODEEF;solve;LFSFLU;19!0| ((|f1| NIL) ($$ NIL))
        (PROG (|kx| |a| $)
          (LETT |kx| (QREFELT $$ 2) . #1=(|LODEEF;solve;LFSFLU;19|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| |kx| |a| (QREFELT $ 45)))))) 

(SDEFUN |LODEEF;localmap| ((|f| |Mapping| F F) (|op| L) ($ L))
        (SPROG ((|ans| (L)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 131) . #1=(|LODEEF;localmap|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |op| (|spadConstant| $ 131) (QREFELT $ 132)))
                       (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |op| (QREFELT $ 59))
                                                 |f|)
                                       (SPADCALL |op| (QREFELT $ 54))
                                       (QREFELT $ 159))
                                      (QREFELT $ 160))
                            . #1#)
                      (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 137)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |LODEEF;palgSolve|
        ((|op| L) (|g| F) (|kx| |Kernel| F) (|k| |Kernel| F) (|x| |Symbol|)
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (SPROG
         ((#1=#:G309 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Union| F "failed"))
                     (|:| |basis| (|List| F)))))
         (SEQ
          (LETT |rec| (SPADCALL |op| |g| |kx| |k| |x| (QREFELT $ 163))
                . #2=(|LODEEF;palgSolve|))
          (EXIT
           (COND
            ((QEQCAR (QCAR |rec|) 1)
             (|LODEEF;doVarParams| |op| |g|
              (|LODEEF;homosolve1| |op| (QCDR |rec|) |k| |x| $) |x| $))
            ('T
             (CONS 0
                   (CONS
                    (PROG2 (LETT #1# (QCAR |rec|) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                    (|LODEEF;homosolve1| |op| (QCDR |rec|) |k| |x| $))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionLODESolver;|)) 

(DEFUN |ElementaryFunctionLODESolver| (&REST #1=#:G313)
  (SPROG NIL
         (PROG (#2=#:G314)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionLODESolver|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionLODESolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionLODESolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionLODESolver|)))))))))) 

(DEFUN |ElementaryFunctionLODESolver;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionLODESolver|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionLODESolver| DV$1 DV$2 DV$3)
                . #1#)
          (LETT $ (GETREFV 164) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionLODESolver|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 '|%alg|)
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          $))) 

(MAKEPROP '|ElementaryFunctionLODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'ALGOP (0 . D) '|diff|
              (|SparseMultivariatePolynomial| 17 19) (4 . |primitivePart|)
              (|List| 19) (|List| 17) (9 . |eval|)
              (|SparseMultivariatePolynomial| 6 19) (16 . |ground|)
              (|Kernel| 7) (|Symbol|) (|IntegrationTools| 6 7) (21 . |ksec|)
              (|Union| 20 '"failed") (28 . |symbolIfCan|) (|BasicOperator|)
              (33 . |operator|) (|Boolean|) (38 . |has?|) (|Kernel| $)
              (44 . |coerce|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 36) (|:| |pol2| 36)
                        (|:| |prim| 36))
              (|FunctionSpacePrimitiveElement| 6 7) (49 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (55 . |rootOf|)
              (|SparseUnivariatePolynomial| 7) (60 . |elt|) (|List| 29)
              (|List| $) (66 . |eval|)
              (|Record| (|:| |particular| 7) (|:| |basis| 49))
              (|Union| 41 '"failed") |LODEEF;solve;LFSU;16| (73 . |retract|)
              (78 . |eval|) (|ODEIntegration| 6 7) (85 . |int|)
              (|Union| 7 '"failed") (|List| 7) (|Mapping| 7 7) (|ODETools| 7 8)
              (91 . |particularSolution|) (|NonNegativeInteger|)
              (99 . |degree|) (104 . |One|) (108 . |Zero|) (112 . |Zero|)
              (116 . |coefficient|) (122 . |leadingCoefficient|) (127 . /)
              (133 . -) (138 . |expint|) (144 . *) (150 . |tower|)
              (155 . |varselect|) (161 . |coerce|)
              (|SparseMultivariatePolynomial| 6 29) (166 . |numer|)
              (171 . |denom|) (176 . /) (182 . |coerce|) (187 . |univariate|)
              (193 . |Zero|) (|SparseUnivariatePolynomial| 17) (197 . |Zero|)
              (201 . ~=) (207 . |leadingCoefficient|) (212 . |degree|)
              (217 . |monomial|) (224 . +) (230 . |reductum|)
              (|LinearOrdinaryDifferentialOperator1| 84) (235 . |degree|)
              (|Fraction| 36) (240 . |coefficient|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 19) 19
                                                     6 17 7)
              (246 . |multivariate|) (252 . |leadingCoefficient|)
              (|Factored| 36)
              (|FunctionSpaceUnivariatePolynomialFactor| 6 7 36)
              (257 . |ffactor|) (|List| 84) (|Mapping| 89 36)
              (|RationalRicDE| 7 36) (262 . |ricDsolve|)
              (|Record| (|:| |eq| 82) (|:| |op| 92)) (|ReductionOfOrder| 84 82)
              (268 . |ReduceOrder|) (274 . |concat!|)
              (|Record| (|:| |eq| 8) (|:| |op| 49)) (|ReductionOfOrder| 7 8)
              (280 . |ReduceOrder|) (286 . |One|) (290 . |coefficients|)
              (295 . |vark|) (301 . |kmax|) (|List| 82)
              (|LinearOrdinaryDifferentialOperatorFactorizer| 7 36)
              (306 . |factor1|) (311 . |last|) (|Union| 115 '"failed")
              (|Kovacic| 7 36) (316 . |kovacic|) (|Mapping| 7 84)
              (|SparseUnivariatePolynomial| 84)
              (|SparseUnivariatePolynomialFunctions2| 84 7) (324 . |map|)
              (330 . /) (336 . -) (341 . |degree|) (346 . |zerosOf|)
              (|Integer|) (351 . |coerce|) (356 . +) (362 . |zeroOf|)
              (|PositiveInteger|) (367 . ^) (|ConstantLODE| 6 7 8)
              (373 . |constDsolve|) (380 . |Zero|) (384 . |Zero|) (388 . ~=)
              (|Fraction| 34) (394 . |univariate|) (400 . |monomial|) (406 . +)
              (412 . |reductum|) (417 . |kernels|) (422 . |remove!|)
              (|Union| 84 '"failed")
              (|Record| (|:| |particular| 140) (|:| |basis| 92))
              (|RationalLODE| 7 36) (428 . |ratDsolve|) (434 . |Zero|)
              (438 . |kernel|) (|Vector| 7) (443 . |minIndex|) (448 . -)
              (454 . |setelt|) (461 . |elt|) (|Matrix| 7)
              (467 . |wronskianMatrix|) (473 . |map!|) (|Union| 146 '"failed")
              (|LinearSystemMatrixPackage| 7 146 146 151)
              (479 . |particularSolution|) (485 . |elt|)
              |LODEEF;solve;LFSFLU;19| (491 . |monomial|) (497 . +)
              (|Record| (|:| |particular| 48) (|:| |basis| 49))
              (|PureAlgebraicIntegration| 6 7 8) (503 . |palgLODE|))
           '#(|solve| 512) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(0 8 0 10 1 12 0 0 13 3 12 0
                                                   0 14 15 16 1 12 17 0 18 3 21
                                                   19 19 14 20 22 1 19 23 0 24
                                                   1 19 25 0 26 2 25 27 0 20 28
                                                   1 7 0 29 30 2 32 31 7 7 33 1
                                                   7 0 34 35 2 36 7 0 7 37 3 7
                                                   0 0 38 39 40 1 7 29 0 44 3 7
                                                   0 0 29 0 45 2 46 7 7 20 47 4
                                                   51 48 8 7 49 50 52 1 8 53 0
                                                   54 0 6 0 55 0 6 0 56 0 7 0
                                                   57 2 8 7 0 53 58 1 8 7 0 59
                                                   2 7 0 0 0 60 1 7 0 0 61 2 46
                                                   7 7 20 62 2 7 0 0 0 63 1 7
                                                   38 0 64 2 21 14 14 20 65 1
                                                   17 0 19 66 1 7 67 0 68 1 7
                                                   67 0 69 2 7 0 67 67 70 1 12
                                                   0 17 71 2 17 34 0 19 72 0 12
                                                   0 73 0 74 0 75 2 74 27 0 0
                                                   76 1 74 17 0 77 1 74 53 0 78
                                                   3 12 0 0 19 53 79 2 12 0 0 0
                                                   80 1 74 0 0 81 1 82 53 0 83
                                                   2 82 84 0 53 85 2 86 7 84 19
                                                   87 1 82 84 0 88 1 90 89 36
                                                   91 2 94 92 82 93 95 2 97 96
                                                   82 92 98 2 49 0 0 0 99 2 101
                                                   100 8 49 102 0 7 0 103 1 8
                                                   49 0 104 2 21 14 49 20 105 1
                                                   21 19 14 106 1 108 107 82
                                                   109 1 107 82 0 110 4 112 111
                                                   84 84 84 93 113 2 116 36 114
                                                   115 117 2 84 0 0 0 118 1 84
                                                   0 0 119 1 36 53 0 120 1 7 39
                                                   34 121 1 7 0 122 123 2 7 0 0
                                                   0 124 1 7 0 34 125 2 7 0 0
                                                   126 127 3 128 41 8 7 20 129
                                                   0 82 0 130 0 8 0 131 2 8 27
                                                   0 0 132 2 7 133 0 29 134 2
                                                   82 0 84 53 135 2 82 0 0 0
                                                   136 1 8 0 0 137 1 7 38 0 138
                                                   2 14 0 19 0 139 2 142 141 82
                                                   84 143 0 84 0 144 1 19 0 20
                                                   145 1 146 122 0 147 2 7 0 0
                                                   0 148 3 146 7 0 122 7 149 2
                                                   8 7 0 7 150 2 51 151 49 53
                                                   152 2 151 0 50 0 153 2 155
                                                   154 151 146 156 2 146 7 0
                                                   122 157 2 8 0 7 53 159 2 8 0
                                                   0 0 160 5 162 161 8 7 19 19
                                                   20 163 5 0 48 8 7 20 7 49
                                                   158 3 0 42 8 7 20 43)))))
           '|lookupComplete|)) 
