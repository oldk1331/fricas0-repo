
(PUT '|SUP;makeSUP;2$;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;makeSUP;2$;1| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|SUP;unmakeSUP;2$;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(SDEFUN |SUP;unmakeSUP;2$;2| ((|sp| |SparseUnivariatePolynomial| R) ($ $)) |sp|) 

(SDEFUN |SUP;^;$Pi$;3| ((|p| $) (|np| |PositiveInteger|) ($ $))
        (SPADCALL |p| |np| (QREFELT $ 12))) 

(SDEFUN |SUP;^;$Nni$;4| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|rn| #1=(|NonNegativeInteger|)) (|qn| #2=(|NonNegativeInteger|))
          (|rec| (|Record| (|:| |quotient| #2#) (|:| |remainder| #1#)))
          (#3=#:G152 NIL) (|t| NIL) (#4=#:G151 NIL) (#5=#:G150 NIL) (|y| ($))
          (|cc| (R)))
         (SEQ
          (EXIT
           (COND ((NULL |p|) (|spadConstant| $ 15))
                 ((ZEROP |n|) (|spadConstant| $ 16)) ((EQL |n| 1) |p|)
                 (#6='T
                  (COND
                   ((NULL (CDR |p|))
                    (COND
                     ((SPADCALL
                       (LETT |cc|
                             (SPADCALL (QCDR (|SPADfirst| |p|)) |n|
                                       (QREFELT $ 17))
                             . #7=(|SUP;^;$Nni$;4|))
                       (QREFELT $ 19))
                      (|spadConstant| $ 15))
                     (#6#
                      (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
                   ((< (SPADCALL (QREFELT $ 20)) 3)
                    (SPADCALL |p| |n| (QREFELT $ 22)))
                   (#6#
                    (SEQ (LETT |y| (|spadConstant| $ 16) . #7#)
                         (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT $ 20)))
                               . #7#)
                         (LETT |qn| (QCAR |rec|) . #7#)
                         (LETT |rn| (QCDR |rec|) . #7#)
                         (SEQ G190 NIL
                              (SEQ
                               (COND
                                ((EQL |rn| 1)
                                 (LETT |y| (SPADCALL |y| |p| (QREFELT $ 23))
                                       . #7#)))
                               (COND
                                ((SPADCALL |rn| 1 (QREFELT $ 24))
                                 (LETT |y|
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (LIST (|SPADfirst| |p|))
                                                  (CDR |p|) |rn|
                                                  (QREFELT $ 25))
                                                 (QREFELT $ 23))
                                       . #7#)))
                               (EXIT
                                (COND
                                 ((ZEROP |qn|)
                                  (PROGN (LETT #5# |y| . #7#) (GO #8=#:G149)))
                                 ('T
                                  (SEQ
                                   (LETT |p|
                                         (PROGN
                                          (LETT #4# NIL . #7#)
                                          (SEQ (LETT |t| NIL . #7#)
                                               (LETT #3# |p| . #7#) G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |t| (CAR #3#)
                                                            . #7#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #4#
                                                       (CONS
                                                        (CONS
                                                         (* (QCAR |t|)
                                                            (SPADCALL
                                                             (QREFELT $ 20)))
                                                         (SPADCALL (QCDR |t|)
                                                                   (QREFELT $
                                                                            26)))
                                                        #4#)
                                                       . #7#)))
                                               (LETT #3# (CDR #3#) . #7#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #4#))))
                                         . #7#)
                                   (LETT |rec|
                                         (DIVIDE2 |qn|
                                                  (SPADCALL (QREFELT $ 20)))
                                         . #7#)
                                   (LETT |qn| (QCAR |rec|) . #7#)
                                   (EXIT (LETT |rn| (QCDR |rec|) . #7#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT |y|)))))))
          #8# (EXIT #5#)))) 

(PUT '|SUP;zero?;$B;5| '|SPADreplace| 'NULL) 

(SDEFUN |SUP;zero?;$B;5| ((|p| $) ($ |Boolean|)) (NULL |p|)) 

(SDEFUN |SUP;one?;$B;6| ((|p| $) ($ |Boolean|))
        (COND
         ((OR (OR (NULL |p|) (NULL (NULL (CDR |p|))))
              (NULL (ZEROP (QCAR (|SPADfirst| |p|)))))
          NIL)
         ('T
          (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 28)
                    (QREFELT $ 29))))) 

(SDEFUN |SUP;ground?;$B;7| ((|p| $) ($ |Boolean|))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|)))) ('T NIL))) 

(SDEFUN |SUP;multiplyExponents;$Nni$;8|
        ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G167 NIL) (|u| NIL) (#2=#:G166 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;multiplyExponents;$Nni$;8|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (* (QCAR |u|) |n|) (QCDR |u|)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SUP;divideExponents;$NniU;9|
        ((|p| $) (|n| |NonNegativeInteger|) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G176 NIL) (|u| (|Union| $ #1#))
          (|m| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((NULL |p|) (CONS 0 |p|))
                (#3='T
                 (SEQ
                  (LETT |m|
                        (SPADCALL (QCAR (|SPADfirst| |p|)) |n| (QREFELT $ 35))
                        . #4=(|SUP;divideExponents;$NniU;9|))
                  (EXIT
                   (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                         (#3#
                          (SEQ
                           (LETT |u| (SPADCALL (CDR |p|) |n| (QREFELT $ 36))
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                  (#3#
                                   (CONS 0
                                         (CONS
                                          (CONS
                                           (PROG1 (LETT #2# (QCDR |m|) . #4#)
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QCDR (|SPADfirst| |p|)))
                                          (QCDR |u|)))))))))))))))) 

(SDEFUN |SUP;karatsubaDivide;$NniR;10|
        ((|p| $) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|highp| (|Rep|)) (#2=#:G185 NIL) (|lowp| (|Rep|)) (#3=#:G193 NIL)
          (|t| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (SEQ
          (COND ((ZEROP |n|) (CONS |p| (|spadConstant| $ 15)))
                ('T
                 (SEQ (LETT |lowp| |p| . #4=(|SUP;karatsubaDivide;$NniR;10|))
                      (LETT |highp| NIL . #4#)
                      (SEQ
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (COND
                               ((NULL |lowp|)
                                (PROGN
                                 (LETT #3# |$NoValue| . #4#)
                                 (GO #5=#:G188))))
                              (LETT |t| (|SPADfirst| |lowp|) . #4#)
                              (COND
                               ((< (QCAR |t|) |n|)
                                (PROGN (LETT #3# |$NoValue| . #4#) (GO #5#))))
                              (LETT |lowp| (CDR |lowp|) . #4#)
                              (EXIT
                               (LETT |highp|
                                     (CONS
                                      (CONS
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL (QCAR |t|) |n|
                                                           (QREFELT $ 38))
                                                 . #4#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|NonNegativeInteger|)
                                                         (|Union|
                                                          (|NonNegativeInteger|)
                                                          "failed")
                                                         #2#))
                                       (QCDR |t|))
                                      |highp|)
                                     . #4#)))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #5# (EXIT #3#))
                      (EXIT (CONS (REVERSE |highp|) |lowp|)))))))) 

(SDEFUN |SUP;shiftRight;$Nni$;11| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G196 NIL) (#2=#:G201 NIL) (|t| NIL) (#3=#:G200 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL . #4=(|SUP;shiftRight;$Nni$;11|))
                 (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (CONS
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL (QCAR |t|) |n|
                                                    (QREFELT $ 38))
                                          . #4#)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|NonNegativeInteger|)
                                                  (|Union|
                                                   (|NonNegativeInteger|)
                                                   "failed")
                                                  #1#))
                                (QCDR |t|))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SUP;shiftLeft;$Nni$;12| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G206 NIL) (|t| NIL) (#2=#:G205 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;shiftLeft;$Nni$;12|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (+ (QCAR |t|) |n|) (QCDR |t|)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SUP;pomopo!;$RNni2$;13|
        ((|p1| $) (|r| R) (|e| |NonNegativeInteger|) (|p2| $) ($ $))
        (SPROG
         ((|rout| ($)) (|u| (R)) (|c2| (R)) (|e2| (|NonNegativeInteger|))
          (#1=#:G217 NIL) (|tm| NIL))
         (SEQ (LETT |rout| NIL . #2=(|SUP;pomopo!;$RNni2$;13|))
              (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                        (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 29))
                           "next term")
                          ('T
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p1|) NIL)
                                          ('T
                                           (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                     |e2| (QREFELT $ 24)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                        . #2#)
                                  (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((OR (NULL |p1|)
                                  (< (QCAR (|SPADfirst| |p1|)) |e2|))
                              (EXIT
                               (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                     . #2#))))
                            (COND
                             ((SPADCALL
                               (LETT |u|
                                     (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                               (QREFELT $ 44))
                                     . #2#)
                               (|spadConstant| $ 37) (QREFELT $ 45))
                              (LETT |rout| (CONS (CONS |e2| |u|) |rout|)
                                    . #2#)))
                            (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NRECONC |rout| |p1|))))) 

(PUT '|SUP;univariate;2$;14| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;univariate;2$;14| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|SUP;multivariate;$Saos$;15| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(SDEFUN |SUP;multivariate;$Saos$;15|
        ((|sup| |SparseUnivariatePolynomial| R) (|v| |SingletonAsOrderedSet|)
         ($ $))
        |sup|) 

(SDEFUN |SUP;univariate;$SaosSup;16|
        ((|p| $) (|v| |SingletonAsOrderedSet|)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 27)) (|spadConstant| $ 51))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 53))
                 (SPADCALL |p| (QREFELT $ 54)) (QREFELT $ 55))
                (SPADCALL (SPADCALL |p| (QREFELT $ 56)) |v| (QREFELT $ 58))
                (QREFELT $ 59))))) 

(SDEFUN |SUP;multivariate;SupSaos$;17|
        ((|supp| |SparseUnivariatePolynomial| $) (|v| |SingletonAsOrderedSet|)
         ($ $))
        (SPROG ((|lc| ($)))
               (SEQ
                (COND ((SPADCALL |supp| (QREFELT $ 60)) (|spadConstant| $ 15))
                      (#1='T
                       (SEQ
                        (LETT |lc| (SPADCALL |supp| (QREFELT $ 61))
                              |SUP;multivariate;SupSaos$;17|)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |lc| (QREFELT $ 54)) 0
                                     (QREFELT $ 24))
                           (|error| "bad form polynomial"))
                          (#1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |lc| (QREFELT $ 52))
                                      (SPADCALL |supp| (QREFELT $ 62))
                                      (QREFELT $ 63))
                            (SPADCALL (SPADCALL |supp| (QREFELT $ 64)) |v|
                                      (QREFELT $ 65))
                            (QREFELT $ 66))))))))))) 

(SDEFUN |SUP;squareFreePolynomial;SupF;18|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 69))) 

(SDEFUN |SUP;factorPolynomial;SupF;19|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 75))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;20|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 75))) 

(SDEFUN |SUP;factor;$F;21| ((|p| $) ($ |Factored| $))
        (SPADCALL |p| (QREFELT $ 80))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;22|
        ((|lpp| . #1=(|List| #2=(|SparseUnivariatePolynomial| $))) (|pp| . #2#)
         ($ |Union| #1# "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 86))) 

(SDEFUN |SUP;exquo;2$U;23| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G255 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 90))
                  (CONS 0 |p1|))
                 ((SPADCALL |p1| |p2| (QREFELT $ 90))
                  (CONS 0 (|spadConstant| $ 16)))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;23|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 91))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G254)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 38))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 92))
                                           . #4#)
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|)
                                            . #4#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SUP;exquo;2$U;24| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G272 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 90))
                  (CONS 0 |p1|))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;24|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 91))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G271)))
                               ('T
                                (SEQ
                                 (LETT |ee|
                                       (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                 (QCAR (|SPADfirst| |p2|))
                                                 (QREFELT $ 38))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ee| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5#)))
                                   ('T
                                    (SEQ
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                     (QCDR |a|) (CDR |p2|)
                                                     (QREFELT $ 92))
                                           . #4#)
                                     (EXIT
                                      (LETT |rout|
                                            (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                                  |rout|)
                                            . #4#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                              (#3# (CONS 1 "failed"))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SUP;fmecg;$NniR2$;25|
        ((|p1| $) (|e| |NonNegativeInteger|) (|r| R) (|p2| $) ($ $))
        (SPROG
         ((|rout| ($)) (|u| (R)) (|c2| (R)) (|e2| (|NonNegativeInteger|))
          (#1=#:G283 NIL) (|tm| NIL))
         (SEQ (LETT |rout| NIL . #2=(|SUP;fmecg;$NniR2$;25|))
              (LETT |r| (SPADCALL |r| (QREFELT $ 94)) . #2#)
              (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                        (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 29))
                           "next term")
                          ('T
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p1|) NIL)
                                          ('T
                                           (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                     |e2| (QREFELT $ 24)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                        . #2#)
                                  (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((OR (NULL |p1|)
                                  (< (QCAR (|SPADfirst| |p1|)) |e2|))
                              (EXIT
                               (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                     . #2#))))
                            (COND
                             ((SPADCALL
                               (LETT |u|
                                     (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                               (QREFELT $ 44))
                                     . #2#)
                               (|spadConstant| $ 37) (QREFELT $ 45))
                              (LETT |rout| (CONS (CONS |e2| |u|) |rout|)
                                    . #2#)))
                            (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NRECONC |rout| |p1|))))) 

(SDEFUN |SUP;pseudoRemainder;3$;26| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|e1| (|NonNegativeInteger|)) (#1=#:G290 NIL) (#2=#:G295 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (#3=#:G285 NIL)
          (|e| (|NonNegativeInteger|)) (|co| (R)))
         (SEQ
          (COND ((NULL |p2|) (|error| "PseudoDivision by Zero"))
                ((NULL |p1|) (|spadConstant| $ 15))
                (#4='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p2|))
                        . #5=(|SUP;pseudoRemainder;3$;26|))
                  (LETT |e| (QCAR (|SPADfirst| |p2|)) . #5#)
                  (LETT |p2| (CDR |p2|) . #5#)
                  (LETT |e1|
                        (PROG1
                            (LETT #3#
                                  (MAX (+ (- (QCAR (|SPADfirst| |p1|)) |e|) 1)
                                       0)
                                  . #5#)
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#))
                        . #5#)
                  (SEQ
                   (EXIT
                    (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                         (SEQ
                          (SEQ
                           (LETT |u|
                                 (SPADCALL (QCAR (|SPADfirst| |p1|)) |e|
                                           (QREFELT $ 38))
                                 . #5#)
                           (EXIT
                            (COND
                             ((QEQCAR |u| 1)
                              (PROGN
                               (LETT #2# |$NoValue| . #5#)
                               (GO #6=#:G292))))))
                          (LETT |p1|
                                (SPADCALL
                                 (SPADCALL |co| (CDR |p1|) (QREFELT $ 95))
                                 (QCDR |u|) (QCDR (|SPADfirst| |p1|)) |p2|
                                 (QREFELT $ 92))
                                . #5#)
                          (EXIT
                           (LETT |e1|
                                 (PROG1 (LETT #1# (- |e1| 1) . #5#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 . #5#)))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #2#))
                  (EXIT
                   (COND ((EQL |e1| 0) |p1|)
                         (#4#
                          (SPADCALL (SPADCALL |co| |e1| (QREFELT $ 17)) |p1|
                                    (QREFELT $ 95))))))))))) 

(SDEFUN |SUP;init_one| (($ |Void|))
        (SEQ
         (COND ((QREFELT $ 99) "done")
               ('T
                (SEQ (QREFELT $ 97)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Ring|))
                       (SETELT $ 97
                               (SPADCALL (|spadConstant| $ 28)
                                         (QREFELT $ 94)))))
                     (QREFELT $ 98)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Monoid|))
                       (SETELT $ 98 (|spadConstant| $ 28))))
                     (EXIT (SETELT $ 99 'T))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))
         (|v| . #1=(|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|mon| #1#))
               (SEQ (COND ((NULL (QREFELT $ 99)) (|SUP;init_one| $)))
                    (EXIT
                     (COND
                      ((EQL (QCAR |t1|) 0)
                       (SPADCALL (QCDR |t1|) (QREFELT $ 101)))
                      (#2='T
                       (SEQ
                        (COND
                         ((EQL (QCAR |t1|) 1)
                          (LETT |mon| |v| . #3=(|SUP;toutput|)))
                         (#2#
                          (LETT |mon|
                                (SPADCALL |v|
                                          (SPADCALL (QCAR |t1|)
                                                    (QREFELT $ 102))
                                          (QREFELT $ 103))
                                . #3#)))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t1|) (|spadConstant| $ 37)
                                     (QREFELT $ 29))
                           (SPADCALL (QREFELT $ 104)))
                          ((SPADCALL (QCDR |t1|) (QREFELT $ 98) (QREFELT $ 29))
                           |mon|)
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |t1|) (QREFELT $ 97)
                                        (QREFELT $ 29))
                              (COND
                               ((SPADCALL
                                 (SPADCALL (QCDR |t1|) (QREFELT $ 101))
                                 (SPADCALL -1 (QREFELT $ 105)) (QREFELT $ 106))
                                (EXIT (SPADCALL |mon| (QREFELT $ 107)))))))
                            (EXIT
                             (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 101))
                                       |mon| (QREFELT $ 108)))))))))))))) 

(SDEFUN |SUP;outputForm;$2Of;29| ((|p| $) (|v| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (#1=#:G316 NIL) (|t| NIL)
          (#2=#:G315 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;outputForm;$2Of;29|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SUP;toutput| |t| |v| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 105)))
                 ('T (SPADCALL (ELT $ 109) |l| (QREFELT $ 112)))))))) 

(SDEFUN |SUP;coerce;$Of;30| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| "?" (QREFELT $ 113))) 

(SDEFUN |SUP;elt;$2R;31| ((|p| $) (|val| R) ($ R))
        (SPROG
         ((#1=#:G322 NIL) (|co| (R)) (#2=#:G319 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G325 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#4='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p|)) . #5=(|SUP;elt;$2R;31|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #5#)
                  (SEQ (LETT |tm| NIL . #5#) (LETT #3# (CDR |p|) . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |tm| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (SPADCALL
                                (SPADCALL |co|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #5#))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 115))
                                          (QREFELT $ 43))
                                (QCDR |tm|) (QREFELT $ 44))
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#4#
                          (SPADCALL |co|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #1# |n| . #5#)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT $ 115))
                                    (QREFELT $ 43))))))))))) 

(SDEFUN |SUP;elt;3$;32| ((|p| $) (|val| $) ($ $))
        (SPROG
         ((#1=#:G330 NIL) (|coef| ($)) (#2=#:G327 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G333 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 15))
                (#4='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 53))
                        . #5=(|SUP;elt;3$;32|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #5#)
                  (SEQ (LETT |tm| NIL . #5#) (LETT #3# (CDR |p|) . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |tm| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |coef|
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #5#))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 14))
                                          (QREFELT $ 23))
                                (SPADCALL (QCDR |tm|) (QREFELT $ 53))
                                (QREFELT $ 66))
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |coef|)
                         (#4#
                          (SPADCALL |coef|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #1# |n| . #5#)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT $ 14))
                                    (QREFELT $ 23))))))))))) 

(SDEFUN |SUP;monicDivide;2$R;33|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| (|Rep|)) (#2=#:G346 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT $ 52)) (|spadConstant| $ 28)
                           (QREFELT $ 45))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 90))
                 (CONS |p1| (|spadConstant| $ 15)))
                ((NULL |p1|)
                 (CONS (|spadConstant| $ 15) (|spadConstant| $ 15)))
                (#3='T
                 (COND
                  ((< (SPADCALL |p1| (QREFELT $ 54))
                      (LETT |n| (SPADCALL |p2| (QREFELT $ 54))
                            . #4=(|SUP;monicDivide;2$R;33|)))
                   (CONS (|spadConstant| $ 15) |p1|))
                  (#3#
                   (SEQ (LETT |rout| NIL . #4#) (LETT |p2| (CDR |p2|) . #4#)
                        (SEQ
                         (EXIT
                          (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                               (SEQ
                                (LETT |u|
                                      (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                                (QREFELT $ 38))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |u| 1)
                                   (PROGN
                                    (LETT #2# |$NoValue| . #4#)
                                    (GO #5=#:G341)))
                                  ('T
                                   (SEQ
                                    (LETT |rout|
                                          (CONS
                                           (CONS (QCDR |u|)
                                                 (QCDR (|SPADfirst| |p1|)))
                                           |rout|)
                                          . #4#)
                                    (EXIT
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|)
                                                     (QCAR
                                                      (|SPADfirst| |rout|))
                                                     (QCDR
                                                      (|SPADfirst| |rout|))
                                                     |p2| (QREFELT $ 92))
                                           . #4#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #5# (EXIT #2#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;$R;34| ((|p| $) ($ R)) (SPADCALL |p| (QREFELT $ 120))) 

(SDEFUN |SUP;subResultantGcd;3$;35| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 122))) 

(SDEFUN |SUP;resultant;2$R;36| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 124))) 

(SDEFUN |SUP;content;$R;37| ((|p| $) ($ R))
        (SPROG
         ((#1=#:G352 NIL) (#2=#:G351 (R)) (#3=#:G353 (R)) (#4=#:G355 NIL)
          (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#5='T
                 (PROGN
                  (LETT #1# NIL . #6=(|SUP;content;$R;37|))
                  (SEQ (LETT |tm| NIL . #6#) (LETT #4# |p| . #6#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |tm| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# (QCDR |tm|) . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 126))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| $ 37))))))))) 

(SDEFUN |SUP;primitivePart;2$;38| ((|p| $) ($ $))
        (SPROG ((#1=#:G358 NIL) (|ct| (R)))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ
                        (LETT |ct| (SPADCALL |p| (QREFELT $ 127))
                              . #2=(|SUP;primitivePart;2$;38|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 128))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) $
                                            (|Union| $ "failed") #1#))
                          (QREFELT $ 129))))))))) 

(SDEFUN |SUP;gcd;3$;39| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 131))) 

(SDEFUN |SUP;divide;2$R;40|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| ($)) (#2=#:G375 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|ct| (R)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT $ 27)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 90))
                 (CONS |p1| (|spadConstant| $ 15)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 133))
                        . #3=(|SUP;divide;2$R;40|))
                  (LETT |n| (QCAR (|SPADfirst| |p2|)) . #3#)
                  (LETT |p2| (CDR |p2|) . #3#) (LETT |rout| NIL . #3#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 15)
                                      (QREFELT $ 134)))
                           (GO G191)))
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                          (QREFELT $ 38))
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN
                              (LETT #2# |$NoValue| . #3#)
                              (GO #4=#:G371)))
                            ('T
                             (SEQ
                              (LETT |rout|
                                    (CONS
                                     (CONS (QCDR |u|)
                                           (SPADCALL |ct|
                                                     (QCDR (|SPADfirst| |p1|))
                                                     (QREFELT $ 43)))
                                     |rout|)
                                    . #3#)
                              (EXIT
                               (LETT |p1|
                                     (SPADCALL (CDR |p1|)
                                               (QCAR (|SPADfirst| |rout|))
                                               (QCDR (|SPADfirst| |rout|)) |p2|
                                               (QREFELT $ 92))
                                     . #3#)))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #4# (EXIT #2#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;$R$;41| ((|p| $) (|co| R) ($ $))
        (SPADCALL (SPADCALL |co| (QREFELT $ 133)) |p| (QREFELT $ 95))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G428)
  (SPROG NIL
         (PROG (#2=#:G429)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseUnivariatePolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariatePolynomial|)))))))))) 

(DEFUN |SparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G427 NIL) (|pv$| NIL) (#2=#:G417 NIL) (#3=#:G418 NIL) (#4=#:G419 NIL)
    (#5=#:G420 NIL) (#6=#:G421 NIL) (#7=#:G422 NIL) (#8=#:G423 NIL)
    (#9=#:G424 NIL) (#10=#:G425 NIL) (#11=#:G426 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|SparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #12#)
    (LETT $ (GETREFV 181) . #12#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #10#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #9#)
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #11#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #12#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #11#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #5# #11# #10#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #10#
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #10#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4# #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 140737488355328))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #11#
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #4# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|List|
               (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
      (PROGN
       (QSETREFV $ 14 (CONS (|dispatchFunction| |SUP;^;$Pi$;3|) $))
       (QSETREFV $ 12 (CONS (|dispatchFunction| |SUP;^;$Nni$;4|) $)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |SUP;one?;$B;6|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 71
                   (CONS
                    (|dispatchFunction| |SUP;squareFreePolynomial;SupF;18|) $))
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;19|)
                         $))
         (QSETREFV $ 77
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;20|)
                    $))
         (QSETREFV $ 82 (CONS (|dispatchFunction| |SUP;factor;$F;21|) $))
         (QSETREFV $ 89
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;22|)
                    $)))))))
    (COND
     ((|testBitVector| |pv$| 18)
      (COND
       ((|HasCategory| |#1| '(|Approximate|))
        (QSETREFV $ 93 (CONS (|dispatchFunction| |SUP;exquo;2$U;23|) $)))
       ('T (QSETREFV $ 93 (CONS (|dispatchFunction| |SUP;exquo;2$U;24|) $))))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SUP;fmecg;$NniR2$;25|) $))
       (QSETREFV $ 96
                 (CONS (|dispatchFunction| |SUP;pseudoRemainder;3$;26|) $)))))
    (QSETREFV $ 97 (|spadConstant| $ 37))
    (QSETREFV $ 98 (|spadConstant| $ 37))
    (QSETREFV $ 99 NIL)
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 118 (CONS (|dispatchFunction| |SUP;monicDivide;2$R;33|) $))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV $ 121 (CONS (|dispatchFunction| |SUP;discriminant;$R;34|) $))
       (QSETREFV $ 123
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;35|) $))
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SUP;resultant;2$R;36|) $)))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SUP;content;$R;37|) $))
       (QSETREFV $ 130 (CONS (|dispatchFunction| |SUP;primitivePart;2$;38|) $))
       (QSETREFV $ 132 (CONS (|dispatchFunction| |SUP;gcd;3$;39|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 135 (CONS (|dispatchFunction| |SUP;divide;2$R;40|) $))
       (QSETREFV $ 136 (CONS (|dispatchFunction| |SUP;/;$R$;41|) $)))))
    $))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2$;1|
              |SUP;unmakeSUP;2$;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |Zero|) (16 . |One|) (20 . ^)
              (|Boolean|) (26 . |zero?|) (31 . |characteristic|)
              (|RepeatedSquaring| $$) (35 . |expt|) (41 . *) (47 . >)
              (53 . |binomThmExpt|) (60 . |primeFrobenius|) |SUP;zero?;$B;5|
              (65 . |One|) (69 . =) (75 . |one?|) |SUP;ground?;$B;7|
              |SUP;multiplyExponents;$Nni$;8| (|Union| $ '"failed") (|Integer|)
              (80 . |exquo|) |SUP;divideExponents;$NniU;9| (86 . |Zero|)
              (90 . |subtractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SUP;karatsubaDivide;$NniR;10| |SUP;shiftRight;$Nni$;11|
              |SUP;shiftLeft;$Nni$;12| (96 . *) (102 . +) (108 . ~=)
              |SUP;pomopo!;$RNni2$;13| |SUP;univariate;2$;14|
              (|SingletonAsOrderedSet|) |SUP;multivariate;$Saos$;15|
              (|SparseUnivariatePolynomial| $$) (114 . |Zero|)
              (118 . |leadingCoefficient|) (123 . |coerce|) (128 . |degree|)
              (133 . |monomial|) (139 . |reductum|)
              (|SparseUnivariatePolynomial| $) |SUP;univariate;$SaosSup;16|
              (144 . +) (150 . |zero?|) (155 . |leadingCoefficient|)
              (160 . |degree|) (165 . |monomial|) (171 . |reductum|)
              |SUP;multivariate;SupSaos$;17| (176 . +) (|Factored| 50)
              (|UnivariatePolynomialSquareFree| $$ 50) (182 . |squareFree|)
              (|Factored| 57) (187 . |squareFreePolynomial|) (|Factored| 73)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (192 . |generalTwoFactor|) (197 . |factorPolynomial|)
              (202 . |factorSquareFreePolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (207 . |factor|) (|Factored| $)
              (212 . |factor|) (|Union| 84 '"failed") (|List| 50)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 50)
              (217 . |solveLinearPolynomialEquation|) (|Union| 88 '#1="failed")
              (|List| 57) (223 . |solveLinearPolynomialEquation|) (229 . =)
              (235 . |exquo|) (241 . |fmecg|) (249 . |exquo|) (255 . -)
              (260 . *) (266 . |pseudoRemainder|) '|mm_one| '|m_one|
              '|one_inited| (|OutputForm|) (272 . |coerce|) (277 . |coerce|)
              (282 . ^) (288 . |empty|) (292 . |coerce|) (297 . =) (303 . -)
              (308 . *) (314 . +) (|Mapping| 100 100 100) (|List| 100)
              (320 . |reduce|) |SUP;outputForm;$2Of;29| |SUP;coerce;$Of;30|
              (326 . ^) |SUP;elt;$2R;31| |SUP;elt;3$;32| (332 . |monicDivide|)
              (|PseudoRemainderSequence| 6 $$) (338 . |discriminant|)
              (343 . |discriminant|) (348 . |subResultantGcd|)
              (354 . |subResultantGcd|) (360 . |resultant|) (366 . |resultant|)
              (372 . |gcd|) (378 . |content|) (383 . |exquo|)
              (389 . |unitCanonical|) (394 . |primitivePart|)
              (399 . |gcdPolynomial|) (405 . |gcd|) (411 . |inv|) (416 . ~=)
              (422 . |divide|) (428 . /) (|Union| 143 '#1#) (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 34)
              (|Record| (|:| |mat| 144) (|:| |vec| (|Vector| 34))) (|Vector| $)
              (|Matrix| 34) (|List| 147) (|List| 11) (|Symbol|)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 34 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 34) (|Union| 153 '"failed") (|List| $)
              (|Record| (|:| |coef| 153) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 156 '"failed") (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 158 '"failed") (|Union| 151 '#2="failed")
              (|Union| 34 '#2#) (|Mapping| 6 6) (|List| 48)
              (|Record| (|:| |mat| 168) (|:| |vec| 174)) (|Matrix| 6)
              (|Union| 48 '#2#) (|Equation| $) (|List| 170)
              (|Record| (|:| |var| 48) (|:| |exponent| 11))
              (|Union| 172 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 11 11)
              (|Union| 6 '#2#) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 434 |zero?| 440 |vectorise| 445 |variables| 451 |unvectorise|
              456 |unmakeSUP| 461 |univariate| 466 |unitNormal| 477
              |unitCanonical| 482 |unit?| 487 |totalDegreeSorted| 492
              |totalDegree| 498 |subtractIfCan| 509 |subResultantGcd| 515
              |squareFreePolynomial| 521 |squareFreePart| 526 |squareFree| 531
              |solveLinearPolynomialEquation| 536 |smaller?| 542 |sizeLess?|
              548 |shiftRight| 554 |shiftLeft| 560 |separate| 566 |sample| 572
              |retractIfCan| 576 |retract| 596 |resultant| 616 |rem| 629
              |reductum| 635 |reducedSystem| 640 |recip| 662 |quo| 667
              |pseudoRemainder| 673 |pseudoQuotient| 679 |pseudoDivide| 685
              |principalIdeal| 691 |primitivePart| 696 |primitiveMonomials| 707
              |prime?| 712 |pomopo!| 717 |patternMatch| 725 |outputForm| 739
              |order| 745 |opposite?| 751 |one?| 757 |numberOfMonomials| 762
              |nextItem| 767 |multivariate| 772 |multiplyExponents| 784
              |multiEuclidean| 790 |monomials| 796 |monomial?| 801 |monomial|
              806 |monicDivide| 826 |minimumDegree| 839 |mapExponents| 856
              |map| 862 |makeSUP| 868 |mainVariable| 873 |leadingMonomial| 878
              |leadingCoefficient| 883 |lcmCoef| 888 |lcm| 894 |latex| 905
              |karatsubaDivide| 910 |isTimes| 916 |isPlus| 921 |isExpt| 926
              |integrate| 931 |init| 936 |hashUpdate!| 940 |hash| 946 |ground?|
              951 |ground| 956 |gcdPolynomial| 961 |gcd| 967 |fmecg| 978
              |factorSquareFreePolynomial| 986 |factorPolynomial| 991 |factor|
              996 |extendedEuclidean| 1001 |exquo| 1014 |expressIdealMember|
              1026 |eval| 1032 |euclideanSize| 1086 |elt| 1091
              |divideExponents| 1121 |divide| 1127 |discriminant| 1133
              |differentiate| 1144 |degree| 1227 |convert| 1244 |content| 1259
              |conditionP| 1270 |composite| 1275 |coerce| 1287 |coefficients|
              1317 |coefficient| 1322 |charthRoot| 1342 |characteristic| 1347
              |binomThmExpt| 1351 |associates?| 1358 |annihilate?| 1364 ^ 1370
              |Zero| 1382 |One| 1386 D 1390 = 1466 / 1472 - 1478 + 1489 * 1495)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 13 0 10 13 0 16 19 1 34 4 20 15 4 1
                                  2 3 34 4 9 4 34 20 17 22 4 0 1 38 39 0 0 1 1
                                  35 37 39 42 12 44 0 12 46 0 0 8 26 28 21 0 0
                                  12 0 0 0 0 0 0 0 0 4 5 6 7 30 32 11 12 12 13
                                  36 14 18))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| NIL
                |DifferentialExtension&| |Module&| NIL NIL |Module&| NIL NIL
                |PartialDifferentialRing&| NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |Evalable&| NIL NIL NIL |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| |BasicType&| NIL NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 48)
                 (|MaybeSkewPolynomialCategory| 6 11 48)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|) (|Algebra| 151) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Module| 151)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 34)
                 (|PartialDifferentialRing| 48) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 147)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 151 151)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 151) (|RightModule| 151) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 34) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 48 $$)
                 (|InnerEvalable| 48 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 100) (|unitsKnown|) (|RetractableTo| 151)
                 (|RetractableTo| 34) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 140) (|ConvertibleTo| 141)
                 (|ConvertibleTo| 139) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 48) (|additiveValuation|) (|CommutativeStar|)
                 (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 180
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 2 6 0 0 11 17 1 6 18 0 19 0 6 11 20 2 21
                                    2 2 13 22 2 0 0 0 0 23 2 11 18 0 0 24 3 0 0
                                    0 0 11 25 1 6 0 0 26 0 6 0 28 2 6 18 0 0 29
                                    1 0 18 0 30 2 34 33 0 0 35 0 6 0 37 2 11 33
                                    0 0 38 2 6 0 0 0 43 2 6 0 0 0 44 2 6 18 0 0
                                    45 0 50 0 51 1 0 6 0 52 1 0 0 6 53 1 0 11 0
                                    54 2 50 0 2 11 55 1 0 0 0 56 2 50 0 0 0 59
                                    1 50 18 0 60 1 50 2 0 61 1 50 11 0 62 2 0 0
                                    6 11 63 1 50 0 0 64 2 0 0 0 0 66 1 68 67 50
                                    69 1 0 70 57 71 1 74 72 73 75 1 0 70 57 76
                                    1 0 70 57 77 1 79 78 2 80 1 0 81 0 82 2 85
                                    83 84 50 86 2 0 87 88 57 89 2 0 18 0 0 90 2
                                    6 33 0 0 91 4 0 0 0 11 6 0 92 2 0 33 0 0 93
                                    1 6 0 0 94 2 0 0 6 0 95 2 0 0 0 0 96 1 6
                                    100 0 101 1 11 100 0 102 2 100 0 0 0 103 0
                                    100 0 104 1 34 100 0 105 2 100 18 0 0 106 1
                                    100 0 0 107 2 100 0 0 0 108 2 100 0 0 0 109
                                    2 111 100 110 0 112 2 6 0 0 13 115 2 0 39 0
                                    0 118 1 119 6 2 120 1 0 6 0 121 2 119 2 2 2
                                    122 2 0 0 0 0 123 2 119 6 2 2 124 2 0 6 0 0
                                    125 2 6 0 0 0 126 1 0 6 0 127 2 0 33 0 6
                                    128 1 0 0 0 129 1 0 0 0 130 2 6 57 57 57
                                    131 2 0 0 0 0 132 1 6 0 0 133 2 0 18 0 0
                                    134 2 0 39 0 0 135 2 0 0 0 6 136 2 0 18 0 0
                                    134 1 57 18 0 27 2 0 174 0 11 1 1 0 166 0 1
                                    1 0 0 174 1 1 0 0 8 10 2 0 57 0 48 58 1 0 8
                                    0 47 1 50 150 0 1 1 50 0 0 129 1 50 18 0 1
                                    2 0 11 0 166 1 2 0 11 0 166 1 1 0 11 0 1 2
                                    56 33 0 0 1 2 18 0 0 0 123 1 10 70 57 71 1
                                    15 0 0 1 1 15 81 0 1 2 10 87 88 57 89 2 8
                                    18 0 0 1 2 13 18 0 0 1 2 4 0 0 11 41 2 0 0
                                    0 11 42 2 15 160 0 0 1 0 57 0 1 1 5 163 0 1
                                    1 6 164 0 1 1 12 169 0 1 1 0 177 0 1 1 5
                                    151 0 1 1 6 34 0 1 1 12 48 0 1 1 0 6 0 1 2
                                    33 6 0 0 125 3 33 0 0 0 48 1 2 13 0 0 0 1 1
                                    0 0 0 56 2 24 142 138 143 1 1 24 144 138 1
                                    2 4 167 138 143 1 1 4 168 138 1 1 53 33 0 1
                                    2 13 0 0 0 1 2 4 0 0 0 96 2 18 0 0 0 1 2 18
                                    161 0 0 1 1 13 154 153 1 2 15 0 0 48 1 1 15
                                    0 0 130 1 12 153 0 1 1 10 18 0 1 4 0 0 0 6
                                    11 0 46 3 25 148 0 140 148 1 3 27 149 0 141
                                    149 1 2 0 100 0 100 113 2 18 11 0 0 1 2 57
                                    18 0 0 1 1 53 18 0 30 1 0 11 0 1 1 21 33 0
                                    1 2 0 0 57 48 65 2 0 0 8 48 49 2 0 0 0 11
                                    32 2 13 152 153 0 1 1 0 153 0 1 1 0 18 0 1
                                    3 0 0 0 166 146 1 3 0 0 0 48 11 1 2 0 0 6
                                    11 63 2 4 39 0 0 118 3 4 39 0 0 48 1 2 0
                                    146 0 166 1 2 0 11 0 48 1 1 0 11 0 1 2 0 0
                                    176 0 1 2 0 0 165 0 1 1 0 8 0 9 1 0 169 0 1
                                    1 0 0 0 1 1 0 6 0 52 2 15 159 0 0 1 1 15 0
                                    153 1 2 15 0 0 0 1 1 0 179 0 1 2 4 39 0 11
                                    40 1 12 152 0 1 1 0 152 0 1 1 12 173 0 1 1
                                    1 0 0 1 0 21 0 1 2 0 178 178 0 1 1 0 180 0
                                    1 1 0 18 0 31 1 0 6 0 1 2 15 57 57 57 1 2
                                    15 0 0 0 132 1 15 0 153 1 4 4 0 0 11 6 0 92
                                    1 10 70 57 77 1 10 70 57 76 1 10 81 0 82 2
                                    13 155 0 0 1 3 13 157 0 0 0 1 2 50 33 0 0
                                    93 2 14 33 0 6 128 2 13 152 153 0 1 3 12 0
                                    0 0 0 1 3 12 0 0 153 153 1 2 12 0 0 170 1 2
                                    12 0 0 171 1 3 0 0 0 166 153 1 3 0 0 0 166
                                    175 1 3 0 0 0 48 0 1 3 0 0 0 48 6 1 1 13 11
                                    0 1 2 13 6 158 6 1 2 18 158 0 158 1 2 18
                                    158 158 158 1 2 0 0 0 0 117 2 0 6 0 6 116 2
                                    0 33 0 11 36 2 13 39 0 0 135 1 33 6 0 121 2
                                    33 0 0 48 1 3 40 0 0 145 146 1 2 40 0 0 145
                                    1 3 40 0 0 147 11 1 2 40 0 0 147 1 1 4 0 0
                                    1 2 4 0 0 11 1 3 4 0 0 165 11 1 2 4 0 0 165
                                    1 3 4 0 0 165 0 1 2 4 0 0 48 1 2 4 0 0 166
                                    1 3 4 0 0 166 146 1 3 4 0 0 48 11 1 2 0 146
                                    0 166 1 2 0 11 0 48 1 1 0 11 0 54 1 11 139
                                    0 1 1 29 140 0 1 1 31 141 0 1 2 15 0 0 48 1
                                    1 15 6 0 127 1 48 137 138 1 2 18 33 0 0 1 2
                                    18 162 158 0 1 1 52 0 34 1 1 51 0 0 1 1 23
                                    0 151 1 1 12 0 48 1 1 0 0 6 53 1 0 100 0
                                    114 1 0 175 0 1 3 0 0 0 166 146 1 3 0 0 0
                                    48 11 1 2 0 6 0 11 1 1 49 33 0 1 0 54 11 1
                                    3 47 0 0 0 11 25 2 50 18 0 0 1 2 54 18 0 0
                                    1 2 53 0 0 11 12 2 0 0 0 13 14 0 57 0 15 0
                                    53 0 16 3 40 0 0 145 146 1 3 40 0 0 147 11
                                    1 2 40 0 0 147 1 2 40 0 0 145 1 1 4 0 0 1 2
                                    4 0 0 11 1 2 4 0 0 165 1 3 4 0 0 165 11 1 2
                                    4 0 0 48 1 3 4 0 0 48 11 1 2 4 0 0 166 1 3
                                    4 0 0 166 146 1 2 0 18 0 0 90 2 13 0 0 6
                                    136 1 55 0 0 1 2 55 0 0 0 1 2 0 0 0 0 66 2
                                    55 0 34 0 1 2 57 0 11 0 1 2 1 0 0 151 1 2 1
                                    0 151 0 1 2 0 0 0 6 1 2 0 0 6 0 95 2 0 0 0
                                    0 23 2 0 0 13 0 1)))))
           '|lookupComplete|)) 
