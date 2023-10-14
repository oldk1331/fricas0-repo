
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
          (#3=#:G150 NIL) (|t| NIL) (#4=#:G149 NIL) (#5=#:G148 NIL) (|y| ($))
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
                                       (QREFELT $ 19))
                             . #7=(|SUP;^;$Nni$;4|))
                       (QREFELT $ 21))
                      (|spadConstant| $ 15))
                     (#6#
                      (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
                   ((< (SPADCALL (QREFELT $ 22)) 3)
                    (SPADCALL |p| |n| (QREFELT $ 24)))
                   (#6#
                    (SEQ (LETT |y| (|spadConstant| $ 16) . #7#)
                         (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT $ 22)))
                               . #7#)
                         (LETT |qn| (QCAR |rec|) . #7#)
                         (LETT |rn| (QCDR |rec|) . #7#)
                         (SEQ G190 NIL
                              (SEQ
                               (COND
                                ((EQL |rn| 1)
                                 (LETT |y| (SPADCALL |y| |p| (QREFELT $ 25))
                                       . #7#)))
                               (COND
                                ((SPADCALL |rn| 1 (QREFELT $ 26))
                                 (LETT |y|
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (LIST (|SPADfirst| |p|))
                                                  (CDR |p|) |rn|
                                                  (QREFELT $ 27))
                                                 (QREFELT $ 25))
                                       . #7#)))
                               (EXIT
                                (COND
                                 ((ZEROP |qn|)
                                  (PROGN (LETT #5# |y| . #7#) (GO #8=#:G147)))
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
                                                             (QREFELT $ 22)))
                                                         (SPADCALL (QCDR |t|)
                                                                   (QREFELT $
                                                                            28)))
                                                        #4#)
                                                       . #7#)))
                                               (LETT #3# (CDR #3#) . #7#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #4#))))
                                         . #7#)
                                   (LETT |rec|
                                         (DIVIDE2 |qn|
                                                  (SPADCALL (QREFELT $ 22)))
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
          'NIL)
         ('T
          (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 17)
                    (QREFELT $ 30))))) 

(SDEFUN |SUP;ground?;$B;7| ((|p| $) ($ |Boolean|))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|)))) ('T 'NIL))) 

(SDEFUN |SUP;multiplyExponents;$Nni$;8|
        ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G165 NIL) (|u| NIL) (#2=#:G164 NIL))
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
         ((#2=#:G174 NIL) (|u| (|Union| $ #1#))
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
                                             (|check_subtype| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              #2#))
                                           (QCDR (|SPADfirst| |p|)))
                                          (QCDR |u|)))))))))))))))) 

(SDEFUN |SUP;karatsubaDivide;$NniR;10|
        ((|p| $) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|highp| (|Rep|)) (#2=#:G183 NIL) (|lowp| (|Rep|)) (#3=#:G191 NIL)
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
                                 (GO #5=#:G186))))
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
                                         (|check_union| (QEQCAR #2# 0)
                                                        (|NonNegativeInteger|)
                                                        #2#))
                                       (QCDR |t|))
                                      |highp|)
                                     . #4#)))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #5# (EXIT #3#))
                      (EXIT (CONS (REVERSE |highp|) |lowp|)))))))) 

(SDEFUN |SUP;shiftRight;$Nni$;11| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G194 NIL) (#2=#:G199 NIL) (|t| NIL) (#3=#:G198 NIL))
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
                                  (|check_union| (QEQCAR #1# 0)
                                                 (|NonNegativeInteger|) #1#))
                                (QCDR |t|))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SUP;shiftLeft;$Nni$;12| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G204 NIL) (|t| NIL) (#2=#:G203 NIL))
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
          (#1=#:G215 NIL) (|tm| NIL))
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
                          ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 30))
                           "next term")
                          ('T
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p1|) 'NIL)
                                          ('T
                                           (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                     |e2| (QREFELT $ 26)))))
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
        (COND ((SPADCALL |p| (QREFELT $ 29)) (|spadConstant| $ 51))
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
                                     (QREFELT $ 26))
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

(SDEFUN |SUP;gcdPolynomial;3Sup;21|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) (|qq| . #1#) ($ . #1#))
        (SPADCALL |pp| |qq| (QREFELT $ 78))) 

(SDEFUN |SUP;factor;$F;22| ((|p| $) ($ |Factored| $))
        (SPADCALL |p| (QREFELT $ 82))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;23|
        ((|lpp| . #1=(|List| #2=(|SparseUnivariatePolynomial| $))) (|pp| . #2#)
         ($ |Union| #1# "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 88))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;24|
        ((|lpp| . #1=(|List| #2=(|SparseUnivariatePolynomial| $))) (|pp| . #2#)
         ($ |Union| #1# "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 93))) 

(SDEFUN |SUP;factorPolynomial;SupF;25|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 94))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;26|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 95))) 

(SDEFUN |SUP;exquo;2$U;27| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G260 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
                  (CONS 0 |p1|))
                 ((SPADCALL |p1| |p2| (QREFELT $ 96))
                  (CONS 0 (|spadConstant| $ 16)))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;27|))
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 97))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G259)))
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
                                                     (QREFELT $ 98))
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

(SDEFUN |SUP;exquo;2$U;28| ((|p1| $) (|p2| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|rout| ($)) (#2=#:G277 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|a| (|Union| R #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |p2|) (|error| "Division by 0"))
                 ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
                  (CONS 0 |p1|))
                 (#3='T
                  (SEQ (LETT |rout| NIL . #4=(|SUP;exquo;2$U;28|))
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR (|SPADfirst| |p1|))
                                             (QCDR (|SPADfirst| |p2|))
                                             (QREFELT $ 97))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #5=#:G276)))
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
                                                     (QREFELT $ 98))
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

(SDEFUN |SUP;fmecg;$NniR2$;29|
        ((|p1| $) (|e| |NonNegativeInteger|) (|r| R) (|p2| $) ($ $))
        (SPROG
         ((|rout| ($)) (|u| (R)) (|c2| (R)) (|e2| (|NonNegativeInteger|))
          (#1=#:G288 NIL) (|tm| NIL))
         (SEQ (LETT |rout| NIL . #2=(|SUP;fmecg;$NniR2$;29|))
              (LETT |r| (SPADCALL |r| (QREFELT $ 100)) . #2#)
              (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |e2| (+ |e| (QCAR |tm|)) . #2#)
                        (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 43))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |c2| (|spadConstant| $ 37) (QREFELT $ 30))
                           "next term")
                          ('T
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |p1|) 'NIL)
                                          ('T
                                           (SPADCALL (QCAR (|SPADfirst| |p1|))
                                                     |e2| (QREFELT $ 26)))))
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

(SDEFUN |SUP;pseudoRemainder;3$;30| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|e1| (|NonNegativeInteger|)) (#1=#:G295 NIL) (#2=#:G300 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (#3=#:G290 NIL)
          (|e| (|NonNegativeInteger|)) (|co| (R)))
         (SEQ
          (COND ((NULL |p2|) (|error| "PseudoDivision by Zero"))
                ((NULL |p1|) (|spadConstant| $ 15))
                (#4='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p2|))
                        . #5=(|SUP;pseudoRemainder;3$;30|))
                  (LETT |e| (QCAR (|SPADfirst| |p2|)) . #5#)
                  (LETT |p2| (CDR |p2|) . #5#)
                  (LETT |e1|
                        (PROG1
                            (LETT #3#
                                  (MAX (+ (- (QCAR (|SPADfirst| |p1|)) |e|) 1)
                                       0)
                                  . #5#)
                          (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                           #3#))
                        . #5#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
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
                               (GO #6=#:G297))))))
                          (LETT |p1|
                                (SPADCALL
                                 (SPADCALL |co| (CDR |p1|) (QREFELT $ 101))
                                 (QCDR |u|) (QCDR (|SPADfirst| |p1|)) |p2|
                                 (QREFELT $ 98))
                                . #5#)
                          (EXIT
                           (LETT |e1|
                                 (PROG1 (LETT #1# (- |e1| 1) . #5#)
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 . #5#)))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #2#))
                  (EXIT
                   (COND ((EQL |e1| 0) |p1|)
                         (#4#
                          (SPADCALL (SPADCALL |co| |e1| (QREFELT $ 102)) |p1|
                                    (QREFELT $ 101))))))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))
         (|v| . #1=(|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|mon| #1#))
               (SEQ
                (COND
                 ((EQL (QCAR |t1|) 0) (SPADCALL (QCDR |t1|) (QREFELT $ 105)))
                 (#2='T
                  (SEQ
                   (COND
                    ((EQL (QCAR |t1|) 1) (LETT |mon| |v| . #3=(|SUP;toutput|)))
                    (#2#
                     (LETT |mon|
                           (SPADCALL |v| (SPADCALL (QCAR |t1|) (QREFELT $ 106))
                                     (QREFELT $ 107))
                           . #3#)))
                   (EXIT
                    (COND
                     ((SPADCALL (QCDR |t1|) (|spadConstant| $ 17)
                                (QREFELT $ 30))
                      |mon|)
                     (#2#
                      (SEQ
                       (COND
                        ((SPADCALL (QCDR |t1|)
                                   (SPADCALL (|spadConstant| $ 17)
                                             (QREFELT $ 100))
                                   (QREFELT $ 30))
                         (COND
                          ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 105))
                                     (SPADCALL -1 (QREFELT $ 108))
                                     (QREFELT $ 109))
                           (EXIT (SPADCALL |mon| (QREFELT $ 110)))))))
                       (EXIT
                        (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 105)) |mon|
                                  (QREFELT $ 111))))))))))))) 

(SDEFUN |SUP;outputForm;$2Of;32| ((|p| $) (|v| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (#1=#:G318 NIL) (|t| NIL)
          (#2=#:G317 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;outputForm;$2Of;32|))
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
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 108)))
                 ('T (SPADCALL (ELT $ 112) |l| (QREFELT $ 115)))))))) 

(SDEFUN |SUP;coerce;$Of;33| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| "?" (QREFELT $ 116))) 

(SDEFUN |SUP;elt;$2R;34| ((|p| $) (|val| R) ($ R))
        (SPROG
         ((|co| (R)) (#1=#:G322 NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G326 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#3='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p|)) . #4=(|SUP;elt;$2R;34|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #4#)
                  (SEQ (LETT |tm| NIL . #4#) (LETT #2# (CDR |p|) . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (SPADCALL
                                (SPADCALL |co|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #4#))
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 102))
                                          (QREFELT $ 43))
                                (QCDR |tm|) (QREFELT $ 44))
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#3#
                          (SPADCALL |co| (SPADCALL |val| |n| (QREFELT $ 102))
                                    (QREFELT $ 43))))))))))) 

(SDEFUN |SUP;elt;3$;35| ((|p| $) (|val| $) ($ $))
        (SPROG
         ((|coef| ($)) (#1=#:G329 NIL) (|n| (|NonNegativeInteger|))
          (#2=#:G333 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 15))
                (#3='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 53))
                        . #4=(|SUP;elt;3$;35|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #4#)
                  (SEQ (LETT |tm| NIL . #4#) (LETT #2# (CDR |p|) . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |coef|
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #4#))
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 12))
                                          (QREFELT $ 25))
                                (SPADCALL (QCDR |tm|) (QREFELT $ 53))
                                (QREFELT $ 66))
                               . #4#)))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |coef|)
                         (#3#
                          (SPADCALL |coef| (SPADCALL |val| |n| (QREFELT $ 12))
                                    (QREFELT $ 25))))))))))) 

(SDEFUN |SUP;monicDivide;2$R;36|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| (|Rep|)) (#2=#:G346 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT $ 52)) (|spadConstant| $ 17)
                           (QREFELT $ 45))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
                 (CONS |p1| (|spadConstant| $ 15)))
                ((NULL |p1|)
                 (CONS (|spadConstant| $ 15) (|spadConstant| $ 15)))
                (#3='T
                 (COND
                  ((< (SPADCALL |p1| (QREFELT $ 54))
                      (LETT |n| (SPADCALL |p2| (QREFELT $ 54))
                            . #4=(|SUP;monicDivide;2$R;36|)))
                   (CONS (|spadConstant| $ 15) |p1|))
                  (#3#
                   (SEQ (LETT |rout| NIL . #4#) (LETT |p2| (CDR |p2|) . #4#)
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND
                                ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T)))
                                 (GO G191)))
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
                                                     |p2| (QREFELT $ 98))
                                           . #4#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #5# (EXIT #2#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;$R;37| ((|p| $) ($ R)) (SPADCALL |p| (QREFELT $ 122))) 

(SDEFUN |SUP;subResultantGcd;3$;38| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 124))) 

(SDEFUN |SUP;resultant;2$R;39| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 126))) 

(SDEFUN |SUP;content;$R;40| ((|p| $) ($ R))
        (SPROG
         ((#1=#:G352 NIL) (#2=#:G351 (R)) (#3=#:G353 (R)) (#4=#:G355 NIL)
          (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#5='T
                 (PROGN
                  (LETT #1# NIL . #6=(|SUP;content;$R;40|))
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
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 128))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| $ 37))))))))) 

(SDEFUN |SUP;primitivePart;2$;41| ((|p| $) ($ $))
        (SPROG ((#1=#:G358 NIL) (|ct| (R)))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ
                        (LETT |ct| (SPADCALL |p| (QREFELT $ 129))
                              . #2=(|SUP;primitivePart;2$;41|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 130))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) $ #1#))
                          (QREFELT $ 131))))))))) 

(SDEFUN |SUP;gcd;3$;42| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 133))) 

(SDEFUN |SUP;divide;2$R;43|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (SPROG
         ((|rout| ($)) (#2=#:G375 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|ct| (R)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT $ 29)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| $ 16) (QREFELT $ 96))
                 (CONS |p1| (|spadConstant| $ 15)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 135))
                        . #3=(|SUP;divide;2$R;43|))
                  (LETT |n| (QCAR (|SPADfirst| |p2|)) . #3#)
                  (LETT |p2| (CDR |p2|) . #3#) (LETT |rout| NIL . #3#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 15)
                                      (QREFELT $ 136)))
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
                                               (QREFELT $ 98))
                                     . #3#)))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #4# (EXIT #2#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;$R$;44| ((|p| $) (|co| R) ($ $))
        (SPADCALL (SPADCALL |co| (QREFELT $ 135)) |p| (QREFELT $ 101))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G421)
  (SPROG NIL
         (PROG (#2=#:G422)
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
   ((#1=#:G420 NIL) (|pv$| NIL) (#2=#:G417 NIL) (#3=#:G418 NIL) (#4=#:G419 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|SparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #5#)
    (LETT $ (GETREFV 183) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Integer|))))
                                        (AND
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
                                                           (|Integer|))))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
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
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #4#
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4# #3#)
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #2# (|HasCategory| |#1| '(|Field|))
                                            #4# #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #2# #4# #3#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #4# #3#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 1073741824))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #5#)
     (|augmentPredVector| $ 2147483648))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #4# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
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
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (COND
       ((|testBitVector| |pv$| 1)
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
         (QSETREFV $ 79
                   (CONS (|dispatchFunction| |SUP;gcdPolynomial;3Sup;21|) $))
         (QSETREFV $ 84 (CONS (|dispatchFunction| |SUP;factor;$F;22|) $))
         (QSETREFV $ 91
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;23|)
                    $))))))
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 91
                 (CONS
                  (|dispatchFunction|
                   |SUP;solveLinearPolynomialEquation;LSupU;24|)
                  $))
       (QSETREFV $ 76
                 (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;25|) $))
       (QSETREFV $ 77
                 (CONS
                  (|dispatchFunction| |SUP;factorSquareFreePolynomial;SupF;26|)
                  $)))))
    (COND
     ((|testBitVector| |pv$| 20)
      (COND
       ((|HasCategory| |#1| '(|Approximate|))
        (QSETREFV $ 99 (CONS (|dispatchFunction| |SUP;exquo;2$U;27|) $)))
       ('T (QSETREFV $ 99 (CONS (|dispatchFunction| |SUP;exquo;2$U;28|) $))))))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV $ 123 (CONS (|dispatchFunction| |SUP;discriminant;$R;37|) $))
       (QSETREFV $ 125
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;38|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SUP;resultant;2$R;39|) $)))))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SUP;content;$R;40|) $))
       (QSETREFV $ 132 (CONS (|dispatchFunction| |SUP;primitivePart;2$;41|) $))
       (QSETREFV $ 134 (CONS (|dispatchFunction| |SUP;gcd;3$;42|) $)))))
    (COND
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV $ 137 (CONS (|dispatchFunction| |SUP;divide;2$R;43|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |SUP;/;$R$;44|) $)))))
    $))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2$;1|
              |SUP;unmakeSUP;2$;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |Zero|) (16 . |One|)
              (20 . |One|) (|Integer|) (24 . ^) (|Boolean|) (30 . |zero?|)
              (35 . |characteristic|) (|RepeatedSquaring| $$) (39 . |expt|)
              (45 . *) (51 . >) (57 . |binomThmExpt|) (64 . |primeFrobenius|)
              |SUP;zero?;$B;5| (69 . =) |SUP;one?;$B;6| |SUP;ground?;$B;7|
              |SUP;multiplyExponents;$Nni$;8| (|Union| $ '"failed")
              (75 . |exquo|) |SUP;divideExponents;$NniU;9| (81 . |Zero|)
              (85 . |subtractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SUP;karatsubaDivide;$NniR;10| |SUP;shiftRight;$Nni$;11|
              |SUP;shiftLeft;$Nni$;12| (91 . *) (97 . +) (103 . ~=)
              |SUP;pomopo!;$RNni2$;13| |SUP;univariate;2$;14|
              (|SingletonAsOrderedSet|) |SUP;multivariate;$Saos$;15|
              (|SparseUnivariatePolynomial| $$) (109 . |Zero|)
              (113 . |leadingCoefficient|) (118 . |coerce|) (123 . |degree|)
              (128 . |monomial|) (134 . |reductum|)
              (|SparseUnivariatePolynomial| $) |SUP;univariate;$SaosSup;16|
              (139 . +) (145 . |zero?|) (150 . |leadingCoefficient|)
              (155 . |degree|) (160 . |monomial|) (166 . |reductum|)
              |SUP;multivariate;SupSaos$;17| (171 . +) (|Factored| 50)
              (|UnivariatePolynomialSquareFree| $$ 50) (177 . |squareFree|)
              (|Factored| 57) (182 . |squareFreePolynomial|) (|Factored| 73)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (187 . |generalTwoFactor|) (192 . |factorPolynomial|)
              (197 . |factorSquareFreePolynomial|) (202 . |gcd|)
              (208 . |gcdPolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (214 . |factor|) (|Factored| $)
              (219 . |factor|) (|Union| 86 '"failed") (|List| 50)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 50)
              (224 . |solveLinearPolynomialEquation|) (|Union| 90 '#1="failed")
              (|List| 57) (230 . |solveLinearPolynomialEquation|)
              (|PolynomialFactorizationByRecursionUnivariate| 6 $$)
              (236 . |solveLinearPolynomialEquationByRecursion|)
              (242 . |factorByRecursion|) (247 . |factorSquareFreeByRecursion|)
              (252 . =) (258 . |exquo|) |SUP;fmecg;$NniR2$;29| (264 . |exquo|)
              (270 . -) (275 . *) (281 . ^) |SUP;pseudoRemainder;3$;30|
              (|OutputForm|) (287 . |coerce|) (292 . |coerce|) (297 . ^)
              (303 . |coerce|) (308 . =) (314 . -) (319 . *) (325 . +)
              (|Mapping| 104 104 104) (|List| 104) (331 . |reduce|)
              |SUP;outputForm;$2Of;32| |SUP;coerce;$Of;33| |SUP;elt;$2R;34|
              |SUP;elt;3$;35| |SUP;monicDivide;2$R;36|
              (|PseudoRemainderSequence| 6 $$) (337 . |discriminant|)
              (342 . |discriminant|) (347 . |subResultantGcd|)
              (353 . |subResultantGcd|) (359 . |resultant|) (365 . |resultant|)
              (371 . |gcd|) (377 . |content|) (382 . |exquo|)
              (388 . |unitCanonical|) (393 . |primitivePart|)
              (398 . |gcdPolynomial|) (404 . |gcd|) (410 . |inv|) (415 . ~=)
              (421 . |divide|) (427 . /) (|Union| 161 '#1#) (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 18)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 18 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 18) (|Record| (|:| |coef| 149) (|:| |generator| $))
              (|List| $) (|Union| 149 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 152 '"failed") (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 154 '"failed") (|Matrix| 18)
              (|Record| (|:| |mat| 159) (|:| |vec| (|Vector| 18))) (|Vector| $)
              (|Symbol|) (|List| 162) (|List| 11) (|Union| 147 '#2="failed")
              (|Union| 18 '#2#) (|Mapping| 6 6) (|Vector| 6)
              (|Record| (|:| |var| 48) (|:| |exponent| 11))
              (|Union| 169 '"failed") (|List| 48) (|Union| 48 '#2#) (|List| 6)
              (|Equation| $) (|List| 174) (|Union| 6 '#2#) (|Mapping| 11 11)
              (|Record| (|:| |mat| 179) (|:| |vec| 168)) (|Matrix| 6)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 433 |zero?| 439 |vectorise| 444 |variables| 450 |unvectorise|
              455 |unmakeSUP| 460 |univariate| 465 |unitNormal| 476
              |unitCanonical| 481 |unit?| 486 |totalDegreeSorted| 491
              |totalDegree| 497 |subtractIfCan| 508 |subResultantGcd| 514
              |squareFreePolynomial| 520 |squareFreePart| 525 |squareFree| 530
              |solveLinearPolynomialEquation| 535 |smaller?| 541 |sizeLess?|
              547 |shiftRight| 553 |shiftLeft| 559 |separate| 565 |sample| 571
              |retractIfCan| 575 |retract| 595 |resultant| 615 |rem| 628
              |reductum| 634 |reducedSystem| 639 |recip| 661 |quo| 666
              |pseudoRemainder| 672 |pseudoQuotient| 678 |pseudoDivide| 684
              |principalIdeal| 690 |primitivePart| 695 |primitiveMonomials| 706
              |prime?| 711 |pomopo!| 716 |patternMatch| 724 |outputForm| 738
              |order| 744 |opposite?| 750 |one?| 756 |numberOfMonomials| 761
              |nextItem| 766 |multivariate| 771 |multiplyExponents| 783
              |multiEuclidean| 789 |monomials| 795 |monomial?| 800 |monomial|
              805 |monicDivide| 825 |minimumDegree| 838 |mapExponents| 855
              |map| 861 |makeSUP| 867 |mainVariable| 872 |leadingMonomial| 877
              |leadingCoefficient| 882 |lcmCoef| 887 |lcm| 893 |latex| 904
              |karatsubaDivide| 909 |isTimes| 915 |isPlus| 920 |isExpt| 925
              |integrate| 930 |init| 935 |hashUpdate!| 939 |hash| 945 |ground?|
              950 |ground| 955 |gcdPolynomial| 960 |gcd| 966 |fmecg| 977
              |factorSquareFreePolynomial| 985 |factorPolynomial| 990 |factor|
              995 |extendedEuclidean| 1000 |exquo| 1013 |expressIdealMember|
              1025 |eval| 1031 |euclideanSize| 1085 |elt| 1090
              |divideExponents| 1120 |divide| 1126 |discriminant| 1132
              |differentiate| 1143 |degree| 1226 |convert| 1243 |content| 1258
              |conditionP| 1269 |composite| 1274 |coerce| 1286 |coefficients|
              1316 |coefficient| 1321 |charthRoot| 1341 |characteristic| 1346
              |binomThmExpt| 1350 |associates?| 1357 |annihilate?| 1363 ^ 1369
              |Zero| 1381 |One| 1385 D 1389 = 1465 / 1471 - 1477 + 1488 * 1494)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(0 0 0 1 15 0 1 15 0 18 21 0 0 7 27 22 17 0 0
                                  0 7 8 9 27 14 27 22 19 24 0 0 7 30 0 0 0 0 7
                                  7 28 0 0 0 0 0 0 0 0 2 3 13 23 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 5 6 10 11 12 15 29 16 20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| NIL |PartialDifferentialRing&| |DifferentialRing&|
                NIL |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL |Rng&| NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&| NIL NIL NIL
                |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 48)
                 (|MaybeSkewPolynomialCategory| 6 11 48)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 147)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|PartialDifferentialRing| 48) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 147)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 18) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 162)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 147 147)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 147) (|RightModule| 147)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 18)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Eltable| $$ $$)
                 (|Eltable| 6 6) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 48) (|InnerEvalable| 48 $$)
                 (|InnerEvalable| 48 6) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 6) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 104) (|ConvertibleTo| 142)
                 (|ConvertibleTo| 143) (|ConvertibleTo| 141)
                 (|RetractableTo| 147) (|RetractableTo| 18)
                 (|canonicalUnitNormal|) (|additiveValuation|)
                 (|CommutativeStar|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 182
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 0 6 0 17 2 6 0 0 18 19 1 6 20 0 21 0 6
                                    11 22 2 23 2 2 13 24 2 0 0 0 0 25 2 11 20 0
                                    0 26 3 0 0 0 0 11 27 1 6 0 0 28 2 6 20 0 0
                                    30 2 18 34 0 0 35 0 6 0 37 2 11 34 0 0 38 2
                                    6 0 0 0 43 2 6 0 0 0 44 2 6 20 0 0 45 0 50
                                    0 51 1 0 6 0 52 1 0 0 6 53 1 0 11 0 54 2 50
                                    0 2 11 55 1 0 0 0 56 2 50 0 0 0 59 1 50 20
                                    0 60 1 50 2 0 61 1 50 11 0 62 2 0 0 6 11 63
                                    1 50 0 0 64 2 0 0 0 0 66 1 68 67 50 69 1 0
                                    70 57 71 1 74 72 73 75 1 0 70 57 76 1 0 70
                                    57 77 2 50 0 0 0 78 2 0 57 57 57 79 1 81 80
                                    2 82 1 0 83 0 84 2 87 85 86 50 88 2 0 89 90
                                    57 91 2 92 85 86 50 93 1 92 67 50 94 1 92
                                    67 50 95 2 0 20 0 0 96 2 6 34 0 0 97 2 0 34
                                    0 0 99 1 6 0 0 100 2 0 0 6 0 101 2 6 0 0 11
                                    102 1 6 104 0 105 1 11 104 0 106 2 104 0 0
                                    0 107 1 18 104 0 108 2 104 20 0 0 109 1 104
                                    0 0 110 2 104 0 0 0 111 2 104 0 0 0 112 2
                                    114 104 113 0 115 1 121 6 2 122 1 0 6 0 123
                                    2 121 2 2 2 124 2 0 0 0 0 125 2 121 6 2 2
                                    126 2 0 6 0 0 127 2 6 0 0 0 128 1 0 6 0 129
                                    2 0 34 0 6 130 1 0 0 0 131 1 0 0 0 132 2 6
                                    57 57 57 133 2 0 0 0 0 134 1 6 0 0 135 2 0
                                    20 0 0 136 2 0 39 0 0 137 2 0 0 0 6 138 2 0
                                    20 0 0 136 1 0 20 0 29 2 0 168 0 11 1 1 0
                                    171 0 1 1 0 0 168 1 1 0 0 8 10 1 0 8 0 47 2
                                    0 57 0 48 58 1 34 146 0 1 1 34 0 0 131 1 34
                                    20 0 1 2 0 11 0 171 1 1 0 11 0 1 2 0 11 0
                                    171 1 2 0 34 0 0 1 2 20 0 0 0 125 1 1 70 57
                                    71 1 17 0 0 1 1 17 83 0 1 2 1 89 90 57 91 2
                                    13 20 0 0 1 2 15 20 0 0 1 2 0 0 0 11 41 2 0
                                    0 0 11 42 2 17 156 0 0 1 0 0 0 1 1 10 165 0
                                    1 1 11 166 0 1 1 0 172 0 1 1 0 176 0 1 1 10
                                    147 0 1 1 11 18 0 1 1 0 48 0 1 1 0 6 0 1 2
                                    26 6 0 0 127 3 26 0 0 0 48 1 2 15 0 0 0 1 1
                                    0 0 0 56 1 14 159 140 1 2 14 160 140 161 1
                                    2 0 178 140 161 1 1 0 179 140 1 1 0 34 0 1
                                    2 15 0 0 0 1 2 0 0 0 0 103 2 20 0 0 0 1 2
                                    20 157 0 0 1 1 15 148 149 1 2 17 0 0 48 1 1
                                    17 0 0 132 1 0 149 0 1 1 1 20 0 1 4 0 0 0 6
                                    11 0 46 3 2 144 0 142 144 1 3 3 145 0 143
                                    145 1 2 0 104 0 104 116 2 20 11 0 0 1 2 0
                                    20 0 0 1 1 0 20 0 31 1 0 11 0 1 1 23 34 0 1
                                    2 0 0 8 48 49 2 0 0 57 48 65 2 0 0 0 11 33
                                    2 15 150 149 0 1 1 0 149 0 1 1 0 20 0 1 2 0
                                    0 6 11 63 3 0 0 0 171 164 1 3 0 0 0 48 11 1
                                    2 0 39 0 0 120 3 0 39 0 0 48 1 2 0 11 0 48
                                    1 2 0 164 0 171 1 1 0 11 0 1 2 0 0 177 0 1
                                    2 0 0 167 0 1 1 0 8 0 9 1 0 172 0 1 1 0 0 0
                                    1 1 0 6 0 52 2 17 155 0 0 1 2 17 0 0 0 1 1
                                    17 0 149 1 1 0 181 0 1 2 0 39 0 11 40 1 0
                                    150 0 1 1 0 150 0 1 1 0 170 0 1 1 7 0 0 1 0
                                    23 0 1 2 0 180 180 0 1 1 0 182 0 1 1 0 20 0
                                    32 1 0 6 0 1 2 17 57 57 57 79 2 17 0 0 0
                                    134 1 17 0 149 1 4 0 0 0 11 6 0 98 1 1 70
                                    57 77 1 1 70 57 76 1 1 83 0 84 2 15 151 0 0
                                    1 3 15 153 0 0 0 1 2 34 34 0 0 99 2 16 34 0
                                    6 130 2 15 150 149 0 1 3 0 0 0 171 149 1 3
                                    0 0 0 48 0 1 3 0 0 0 48 6 1 3 0 0 0 171 173
                                    1 3 0 0 0 149 149 1 2 0 0 0 174 1 3 0 0 0 0
                                    0 1 2 0 0 0 175 1 1 15 11 0 1 2 15 6 154 6
                                    1 2 20 154 0 154 1 2 20 154 154 154 1 2 0 6
                                    0 6 118 2 0 0 0 0 119 2 0 34 0 11 36 2 15
                                    39 0 0 137 1 26 6 0 123 2 26 0 0 48 1 3 24
                                    0 0 163 164 1 3 24 0 0 162 11 1 2 24 0 0
                                    162 1 2 24 0 0 163 1 3 0 0 0 167 0 1 2 0 0
                                    0 167 1 3 0 0 0 167 11 1 1 0 0 0 1 2 0 0 0
                                    11 1 3 0 0 0 48 11 1 3 0 0 0 171 164 1 2 0
                                    0 0 171 1 2 0 0 0 48 1 1 0 11 0 54 2 0 164
                                    0 171 1 2 0 11 0 48 1 1 6 141 0 1 1 4 142 0
                                    1 1 5 143 0 1 2 17 0 0 48 1 1 17 6 0 129 1
                                    32 139 140 1 2 20 158 154 0 1 2 20 34 0 0 1
                                    1 35 0 0 1 1 25 0 147 1 1 0 0 48 1 1 0 0 6
                                    53 1 0 0 18 1 1 0 104 0 117 1 0 173 0 1 2 0
                                    6 0 11 1 3 0 0 0 48 11 1 3 0 0 0 171 164 1
                                    1 33 34 0 1 0 0 11 1 3 31 0 0 0 11 27 2 34
                                    20 0 0 1 2 0 20 0 0 1 2 0 0 0 11 12 2 0 0 0
                                    13 14 0 0 0 15 0 0 0 16 3 24 0 0 162 11 1 3
                                    24 0 0 163 164 1 2 24 0 0 163 1 2 24 0 0
                                    162 1 2 0 0 0 167 1 3 0 0 0 167 11 1 1 0 0
                                    0 1 2 0 0 0 11 1 3 0 0 0 171 164 1 2 0 0 0
                                    171 1 3 0 0 0 48 11 1 2 0 0 0 48 1 2 0 20 0
                                    0 96 2 15 0 0 6 138 2 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 66 2 7 0 147 0 1 2 7 0 0 147 1 2 0
                                    0 6 0 101 2 0 0 0 6 1 2 0 0 18 0 1 2 0 0 0
                                    0 25 2 0 0 11 0 1 2 0 0 13 0 1)))))
           '|lookupComplete|)) 
