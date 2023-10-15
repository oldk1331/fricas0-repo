
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
          (#3=#:G148 NIL) (|t| NIL) (#4=#:G147 NIL) (#5=#:G146 NIL) (|y| ($))
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
                                  (PROGN (LETT #5# |y| . #7#) (GO #8=#:G145)))
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
        (SPROG ((#1=#:G163 NIL) (|u| NIL) (#2=#:G162 NIL))
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
         ((#2=#:G172 NIL) (|u| (|Union| $ #1#))
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
         ((|highp| (|Rep|)) (#2=#:G181 NIL) (|lowp| (|Rep|)) (#3=#:G189 NIL)
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
                                 (GO #5=#:G184))))
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
        (SPROG ((#1=#:G192 NIL) (#2=#:G197 NIL) (|t| NIL) (#3=#:G196 NIL))
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
        (SPROG ((#1=#:G202 NIL) (|t| NIL) (#2=#:G201 NIL))
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

(PUT '|SUP;univariate;2$;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;univariate;2$;13| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|SUP;multivariate;$Saos$;14| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(SDEFUN |SUP;multivariate;$Saos$;14|
        ((|sup| |SparseUnivariatePolynomial| R) (|v| |SingletonAsOrderedSet|)
         ($ $))
        |sup|) 

(SDEFUN |SUP;univariate;$SaosSup;15|
        ((|p| $) (|v| |SingletonAsOrderedSet|)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 27)) (|spadConstant| $ 47))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 48)) (QREFELT $ 49))
                 (SPADCALL |p| (QREFELT $ 50)) (QREFELT $ 51))
                (SPADCALL (SPADCALL |p| (QREFELT $ 52)) |v| (QREFELT $ 54))
                (QREFELT $ 55))))) 

(SDEFUN |SUP;multivariate;SupSaos$;16|
        ((|supp| |SparseUnivariatePolynomial| $) (|v| |SingletonAsOrderedSet|)
         ($ $))
        (SPROG ((|lc| ($)))
               (SEQ
                (COND ((SPADCALL |supp| (QREFELT $ 56)) (|spadConstant| $ 15))
                      (#1='T
                       (SEQ
                        (LETT |lc| (SPADCALL |supp| (QREFELT $ 57))
                              |SUP;multivariate;SupSaos$;16|)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |lc| (QREFELT $ 50)) 0
                                     (QREFELT $ 24))
                           (|error| "bad form polynomial"))
                          (#1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |lc| (QREFELT $ 48))
                                      (SPADCALL |supp| (QREFELT $ 58))
                                      (QREFELT $ 59))
                            (SPADCALL (SPADCALL |supp| (QREFELT $ 60)) |v|
                                      (QREFELT $ 61))
                            (QREFELT $ 62))))))))))) 

(SDEFUN |SUP;squareFreePolynomial;SupF;17|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 65))) 

(SDEFUN |SUP;factorPolynomial;SupF;18|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 71))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;19|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 71))) 

(SDEFUN |SUP;factor;$F;20| ((|p| $) ($ |Factored| $))
        (SPADCALL |p| (QREFELT $ 76))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;21|
        ((|lpp| . #1=(|List| #2=(|SparseUnivariatePolynomial| $))) (|pp| . #2#)
         ($ |Union| #1# "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 82))) 

(SDEFUN |SUP;exquo;2$U;22| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G240 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 86))
                  (CONS 0 |p1|))
                 ((SPADCALL |p1| |p2| (QREFELT $ 86))
                  (CONS 0 (|spadConstant| $ 16)))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;22|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 87))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G239)))
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
                                                     (QREFELT $ 88))
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

(SDEFUN |SUP;exquo;2$U;23| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G257 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 86))
                  (CONS 0 |p1|))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;23|))
                       (SEQ G190 (COND ((NULL |p1|) (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 87))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G256)))
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
                                                     (QREFELT $ 88))
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

(SDEFUN |SUP;init_one| (($ |Void|))
        (SEQ
         (COND ((QREFELT $ 92) "done")
               ('T
                (SEQ (QREFELT $ 90)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Ring|))
                       (SETELT $ 90
                               (SPADCALL (|spadConstant| $ 28)
                                         (QREFELT $ 93)))))
                     (QREFELT $ 91)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Monoid|))
                       (SETELT $ 91 (|spadConstant| $ 28))))
                     (EXIT (SETELT $ 92 'T))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))
         (|v| . #1=(|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|mon| #1#))
               (SEQ (COND ((NULL (QREFELT $ 92)) (|SUP;init_one| $)))
                    (EXIT
                     (COND
                      ((EQL (QCAR |t1|) 0)
                       (SPADCALL (QCDR |t1|) (QREFELT $ 95)))
                      (#2='T
                       (SEQ
                        (COND
                         ((EQL (QCAR |t1|) 1)
                          (LETT |mon| |v| . #3=(|SUP;toutput|)))
                         (#2#
                          (LETT |mon|
                                (SPADCALL |v|
                                          (SPADCALL (QCAR |t1|) (QREFELT $ 96))
                                          (QREFELT $ 97))
                                . #3#)))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t1|) (|spadConstant| $ 37)
                                     (QREFELT $ 29))
                           (SPADCALL (QREFELT $ 98)))
                          ((SPADCALL (QCDR |t1|) (QREFELT $ 91) (QREFELT $ 29))
                           |mon|)
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |t1|) (QREFELT $ 90)
                                        (QREFELT $ 29))
                              (COND
                               ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 95))
                                          (SPADCALL -1 (QREFELT $ 99))
                                          (QREFELT $ 100))
                                (EXIT (SPADCALL |mon| (QREFELT $ 101)))))))
                            (EXIT
                             (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 95))
                                       |mon| (QREFELT $ 102)))))))))))))) 

(SDEFUN |SUP;outputForm;$2Of;26| ((|p| $) (|v| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (#1=#:G278 NIL) (|t| NIL)
          (#2=#:G277 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;outputForm;$2Of;26|))
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
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 99)))
                 ('T (SPADCALL (ELT $ 103) |l| (QREFELT $ 106)))))))) 

(SDEFUN |SUP;coerce;$Of;27| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| "?" (QREFELT $ 107))) 

(SDEFUN |SUP;elt;$2R;28| ((|p| $) (|val| R) ($ R))
        (SPROG
         ((#1=#:G284 NIL) (|co| (R)) (#2=#:G281 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G287 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#4='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p|)) . #5=(|SUP;elt;$2R;28|))
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
                                                    (QREFELT $ 109))
                                          (QREFELT $ 110))
                                (QCDR |tm|) (QREFELT $ 111))
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
                                              (QREFELT $ 109))
                                    (QREFELT $ 110))))))))))) 

(SDEFUN |SUP;elt;3$;29| ((|p| $) (|val| $) ($ $))
        (SPROG
         ((#1=#:G292 NIL) (|coef| ($)) (#2=#:G289 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G295 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 15))
                (#4='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 49))
                        . #5=(|SUP;elt;3$;29|))
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
                                (SPADCALL (QCDR |tm|) (QREFELT $ 49))
                                (QREFELT $ 62))
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

(SDEFUN |SUP;monicDivide;2$R;30|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| (|Rep|)) (#2=#:G308 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT $ 48)) (|spadConstant| $ 28)
                           (QREFELT $ 114))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 86))
                 (CONS |p1| (|spadConstant| $ 15)))
                ((NULL |p1|)
                 (CONS (|spadConstant| $ 15) (|spadConstant| $ 15)))
                (#3='T
                 (COND
                  ((< (SPADCALL |p1| (QREFELT $ 50))
                      (LETT |n| (SPADCALL |p2| (QREFELT $ 50))
                            . #4=(|SUP;monicDivide;2$R;30|)))
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
                                    (GO #5=#:G303)))
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
                                                     |p2| (QREFELT $ 88))
                                           . #4#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #5# (EXIT #2#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;$R;31| ((|p| $) ($ R)) (SPADCALL |p| (QREFELT $ 117))) 

(SDEFUN |SUP;subResultantGcd;3$;32| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 119))) 

(SDEFUN |SUP;resultant;2$R;33| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 121))) 

(SDEFUN |SUP;content;$R;34| ((|p| $) ($ R))
        (SPROG
         ((#1=#:G314 NIL) (#2=#:G313 (R)) (#3=#:G315 (R)) (#4=#:G317 NIL)
          (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#5='T
                 (PROGN
                  (LETT #1# NIL . #6=(|SUP;content;$R;34|))
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
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 123))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| $ 37))))))))) 

(SDEFUN |SUP;primitivePart;2$;35| ((|p| $) ($ $))
        (SPROG ((#1=#:G320 NIL) (|ct| (R)))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ
                        (LETT |ct| (SPADCALL |p| (QREFELT $ 124))
                              . #2=(|SUP;primitivePart;2$;35|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 125))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) $
                                            (|Union| $ "failed") #1#))
                          (QREFELT $ 126))))))))) 

(SDEFUN |SUP;gcd;3$;36| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 128))) 

(SDEFUN |SUP;divide;2$R;37|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| ($)) (#2=#:G337 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|ct| (R)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT $ 27)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 86))
                 (CONS |p1| (|spadConstant| $ 15)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 130))
                        . #3=(|SUP;divide;2$R;37|))
                  (LETT |n| (QCAR (|SPADfirst| |p2|)) . #3#)
                  (LETT |p2| (CDR |p2|) . #3#) (LETT |rout| NIL . #3#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 15)
                                      (QREFELT $ 131)))
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
                              (GO #4=#:G333)))
                            ('T
                             (SEQ
                              (LETT |rout|
                                    (CONS
                                     (CONS (QCDR |u|)
                                           (SPADCALL |ct|
                                                     (QCDR (|SPADfirst| |p1|))
                                                     (QREFELT $ 110)))
                                     |rout|)
                                    . #3#)
                              (EXIT
                               (LETT |p1|
                                     (SPADCALL (CDR |p1|)
                                               (QCAR (|SPADfirst| |rout|))
                                               (QCDR (|SPADfirst| |rout|)) |p2|
                                               (QREFELT $ 88))
                                     . #3#)))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #4# (EXIT #2#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;$R$;38| ((|p| $) (|co| R) ($ $))
        (SPADCALL (SPADCALL |co| (QREFELT $ 130)) |p| (QREFELT $ 133))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G390)
  (SPROG NIL
         (PROG (#2=#:G391)
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
   ((#1=#:G389 NIL) (|pv$| NIL) (#2=#:G379 NIL) (#3=#:G380 NIL) (#4=#:G381 NIL)
    (#5=#:G382 NIL) (#6=#:G383 NIL) (#7=#:G384 NIL) (#8=#:G385 NIL)
    (#9=#:G386 NIL) (#10=#:G387 NIL) (#11=#:G388 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|SparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #12#)
    (LETT $ (GETREFV 179) . #12#)
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
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
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
         (QSETREFV $ 67
                   (CONS
                    (|dispatchFunction| |SUP;squareFreePolynomial;SupF;17|) $))
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;18|)
                         $))
         (QSETREFV $ 73
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;19|)
                    $))
         (QSETREFV $ 78 (CONS (|dispatchFunction| |SUP;factor;$F;20|) $))
         (QSETREFV $ 85
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;21|)
                    $)))))))
    (COND
     ((|testBitVector| |pv$| 18)
      (COND
       ((|HasCategory| |#1| '(|Approximate|))
        (QSETREFV $ 89 (CONS (|dispatchFunction| |SUP;exquo;2$U;22|) $)))
       ('T (QSETREFV $ 89 (CONS (|dispatchFunction| |SUP;exquo;2$U;23|) $))))))
    (QSETREFV $ 90 (|spadConstant| $ 37))
    (QSETREFV $ 91 (|spadConstant| $ 37))
    (QSETREFV $ 92 NIL)
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 115 (CONS (|dispatchFunction| |SUP;monicDivide;2$R;30|) $))))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV $ 118 (CONS (|dispatchFunction| |SUP;discriminant;$R;31|) $))
       (QSETREFV $ 120
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;32|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SUP;resultant;2$R;33|) $)))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 124 (CONS (|dispatchFunction| |SUP;content;$R;34|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SUP;primitivePart;2$;35|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SUP;gcd;3$;36|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 132 (CONS (|dispatchFunction| |SUP;divide;2$R;37|) $))
       (QSETREFV $ 134 (CONS (|dispatchFunction| |SUP;/;$R$;38|) $)))))
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
              |SUP;shiftLeft;$Nni$;12| |SUP;univariate;2$;13|
              (|SingletonAsOrderedSet|) |SUP;multivariate;$Saos$;14|
              (|SparseUnivariatePolynomial| $$) (96 . |Zero|)
              (100 . |leadingCoefficient|) (105 . |coerce|) (110 . |degree|)
              (115 . |monomial|) (121 . |reductum|)
              (|SparseUnivariatePolynomial| $) |SUP;univariate;$SaosSup;15|
              (126 . +) (132 . |zero?|) (137 . |leadingCoefficient|)
              (142 . |degree|) (147 . |monomial|) (153 . |reductum|)
              |SUP;multivariate;SupSaos$;16| (158 . +) (|Factored| 46)
              (|UnivariatePolynomialSquareFree| $$ 46) (164 . |squareFree|)
              (|Factored| 53) (169 . |squareFreePolynomial|) (|Factored| 69)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (174 . |generalTwoFactor|) (179 . |factorPolynomial|)
              (184 . |factorSquareFreePolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (189 . |factor|) (|Factored| $)
              (194 . |factor|) (|Union| 80 '"failed") (|List| 46)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 46)
              (199 . |solveLinearPolynomialEquation|) (|Union| 84 '#1="failed")
              (|List| 53) (205 . |solveLinearPolynomialEquation|) (211 . =)
              (217 . |exquo|) (223 . |fmecg|) (231 . |exquo|) '|mm_one|
              '|m_one| '|one_inited| (237 . -) (|OutputForm|) (242 . |coerce|)
              (247 . |coerce|) (252 . ^) (258 . |empty|) (262 . |coerce|)
              (267 . =) (273 . -) (278 . *) (284 . +) (|Mapping| 94 94 94)
              (|List| 94) (290 . |reduce|) |SUP;outputForm;$2Of;26|
              |SUP;coerce;$Of;27| (296 . ^) (302 . *) (308 . +)
              |SUP;elt;$2R;28| |SUP;elt;3$;29| (314 . ~=) (320 . |monicDivide|)
              (|PseudoRemainderSequence| 6 $$) (326 . |discriminant|)
              (331 . |discriminant|) (336 . |subResultantGcd|)
              (342 . |subResultantGcd|) (348 . |resultant|) (354 . |resultant|)
              (360 . |gcd|) (366 . |content|) (371 . |exquo|)
              (377 . |unitCanonical|) (382 . |primitivePart|)
              (387 . |gcdPolynomial|) (393 . |gcd|) (399 . |inv|) (404 . ~=)
              (410 . |divide|) (416 . *) (422 . /) (|Union| 141 '#1#)
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 34)
              (|Record| (|:| |mat| 142) (|:| |vec| (|Vector| 34))) (|Vector| $)
              (|Matrix| 34) (|Symbol|) (|List| 143) (|List| 11)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 34 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 34) (|Record| (|:| |coef| 151) (|:| |generator| $))
              (|List| $) (|Union| 151 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 153 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 156 '"failed") (|Union| 149 '#2="failed")
              (|Union| 34 '#2#) (|Mapping| 6 6) (|List| 44) (|Matrix| 6)
              (|Record| (|:| |mat| 165) (|:| |vec| 172)) (|Union| 44 '#2#)
              (|Equation| $) (|List| 168)
              (|Record| (|:| |var| 44) (|:| |exponent| 11))
              (|Union| 170 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 11 11)
              (|Union| 6 '#2#) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 428 |zero?| 434 |unmakeSUP| 439 |univariate| 444
              |unitCanonical| 455 |subResultantGcd| 460 |squareFreePolynomial|
              466 |solveLinearPolynomialEquation| 471 |shiftRight| 477
              |shiftLeft| 483 |resultant| 489 |reductum| 495 |primitivePart|
              500 |outputForm| 505 |one?| 511 |multivariate| 516
              |multiplyExponents| 528 |monomial| 534 |monicDivide| 540
              |makeSUP| 546 |leadingCoefficient| 551 |karatsubaDivide| 556
              |ground?| 562 |gcd| 567 |fmecg| 573 |factorSquareFreePolynomial|
              581 |factorPolynomial| 586 |factor| 591 |exquo| 596 |elt| 608
              |divideExponents| 620 |divide| 626 |discriminant| 632 |degree|
              637 |content| 642 |coerce| 647 |binomThmExpt| 657 ^ 664 |Zero|
              676 |One| 680 = 684 / 690 + 696 * 702)
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
                 (|PolynomialCategory| 6 11 44)
                 (|MaybeSkewPolynomialCategory| 6 11 44)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|) (|Algebra| 149) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Module| 149)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 34)
                 (|PartialDifferentialRing| 44) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 143)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 149 149)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 149) (|RightModule| 149) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 34) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 44 $$)
                 (|InnerEvalable| 44 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 94) (|unitsKnown|) (|RetractableTo| 149)
                 (|RetractableTo| 34) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 138) (|ConvertibleTo| 139)
                 (|ConvertibleTo| 137) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 44) (|additiveValuation|) (|CommutativeStar|)
                 (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 134
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 2 6 0 0 11 17 1 6 18 0 19 0 6 11 20 2 21
                                    2 2 13 22 2 0 0 0 0 23 2 11 18 0 0 24 3 0 0
                                    0 0 11 25 1 6 0 0 26 0 6 0 28 2 6 18 0 0 29
                                    1 0 18 0 30 2 34 33 0 0 35 0 6 0 37 2 11 33
                                    0 0 38 0 46 0 47 1 0 6 0 48 1 0 0 6 49 1 0
                                    11 0 50 2 46 0 2 11 51 1 0 0 0 52 2 46 0 0
                                    0 55 1 46 18 0 56 1 46 2 0 57 1 46 11 0 58
                                    2 0 0 6 11 59 1 46 0 0 60 2 0 0 0 0 62 1 64
                                    63 46 65 1 0 66 53 67 1 70 68 69 71 1 0 66
                                    53 72 1 0 66 53 73 1 75 74 2 76 1 0 77 0 78
                                    2 81 79 80 46 82 2 0 83 84 53 85 2 0 18 0 0
                                    86 2 6 33 0 0 87 4 0 0 0 11 6 0 88 2 0 33 0
                                    0 89 1 6 0 0 93 1 6 94 0 95 1 11 94 0 96 2
                                    94 0 0 0 97 0 94 0 98 1 34 94 0 99 2 94 18
                                    0 0 100 1 94 0 0 101 2 94 0 0 0 102 2 94 0
                                    0 0 103 2 105 94 104 0 106 2 6 0 0 13 109 2
                                    6 0 0 0 110 2 6 0 0 0 111 2 6 18 0 0 114 2
                                    0 39 0 0 115 1 116 6 2 117 1 0 6 0 118 2
                                    116 2 2 2 119 2 0 0 0 0 120 2 116 6 2 2 121
                                    2 0 6 0 0 122 2 6 0 0 0 123 1 0 6 0 124 2 0
                                    33 0 6 125 1 0 0 0 126 1 0 0 0 127 2 6 53
                                    53 53 128 2 0 0 0 0 129 1 6 0 0 130 2 0 18
                                    0 0 131 2 0 39 0 0 132 2 0 0 6 0 133 2 0 0
                                    0 6 134 2 0 18 0 0 131 1 57 18 0 27 1 0 0 8
                                    10 1 0 8 0 43 2 0 53 0 44 54 1 50 0 0 126 2
                                    18 0 0 0 120 1 10 66 53 67 2 10 83 84 53 85
                                    2 4 0 0 11 41 2 0 0 0 11 42 2 33 6 0 0 122
                                    1 0 0 0 52 1 15 0 0 127 2 0 94 0 94 107 1
                                    53 18 0 30 2 0 0 8 44 45 2 0 0 53 44 61 2 0
                                    0 0 11 32 2 0 0 6 11 59 2 4 39 0 0 115 1 0
                                    8 0 9 1 0 6 0 48 2 4 39 0 11 40 1 0 18 0 31
                                    2 15 0 0 0 129 4 4 0 0 11 6 0 88 1 10 66 53
                                    73 1 10 66 53 72 1 10 77 0 78 2 50 33 0 0
                                    89 2 14 33 0 6 125 2 0 6 0 6 112 2 0 0 0 0
                                    113 2 0 33 0 11 36 2 13 39 0 0 132 1 33 6 0
                                    118 1 0 11 0 50 1 15 6 0 124 1 0 0 6 49 1 0
                                    94 0 108 3 47 0 0 0 11 25 2 53 0 0 11 12 2
                                    0 0 0 13 14 0 57 0 15 0 53 0 16 2 0 18 0 0
                                    86 2 13 0 0 6 134 2 0 0 0 0 62 2 0 0 6 0
                                    133 2 0 0 0 0 23)))))
           '|lookupIncomplete|)) 
