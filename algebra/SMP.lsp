
(SDEFUN |SMP;Zero;$;1| (($ $)) (CONS 0 (|spadConstant| $ 11))) 

(SDEFUN |SMP;One;$;2| (($ $)) (CONS 0 (|spadConstant| $ 13))) 

(SDEFUN |SMP;zero?;$B;3| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 17))) ('T 'NIL))) 

(SDEFUN |SMP;one?;$B;4| ((|p| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (QCDR |p|) (QCDR (|spadConstant| $ 14)) (QREFELT $ 20)))
         ('T 'NIL))) 

(SDEFUN |SMP;red| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
              ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                         (QREFELT $ 23))
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                         (QREFELT $ 24)))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))))))) 

(SDEFUN |SMP;numberOfMonomials;$Nni;6| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G210 NIL) (#2=#:G209 #3=(|NonNegativeInteger|)) (#4=#:G211 #3#)
          (#5=#:G213 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT $ 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL . #7=(|SMP;numberOfMonomials;$Nni;6|))
             (SEQ (LETT |q| NIL . #7#)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26)) . #7#)
                  G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT $ 28)) . #7#)
                     (COND (#1# (LETT #2# (+ #2# #4#) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet$;7| ((|mvar| |VarSet|) ($ $))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 29))))) 

(SDEFUN |SMP;monomial?;$B;8| ((|p| $) ($ |Boolean|))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      (#1='T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)) |SMP;monomial?;$B;8|)
                            (EXIT
                             (COND
                              ((SPADCALL 1 (SPADCALL |sup| (QREFELT $ 31))
                                         (QREFELT $ 32))
                               'NIL)
                              (#1#
                               (SPADCALL (SPADCALL |sup| (QREFELT $ 24))
                                         (QREFELT $ 33))))))))))) 

(SDEFUN |SMP;moreThanOneVariable?| ((|p| $) ($ |Boolean|))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'NIL)
                      (#1='T
                       (SEQ
                        (LETT |q| (QCDR (QCDR |p|)) |SMP;moreThanOneVariable?|)
                        (EXIT
                         (COND
                          ((SPADCALL (CONS #'|SMP;moreThanOneVariable?!0| $)
                                     (SPADCALL |q| (QREFELT $ 26))
                                     (QREFELT $ 38))
                           'T)
                          (#1# 'NIL))))))))) 

(SDEFUN |SMP;moreThanOneVariable?!0| ((|x1| NIL) ($ NIL))
        (COND ((SPADCALL |x1| (QREFELT $ 34)) (|spadConstant| $ 35))
              ('T (|spadConstant| $ 36)))) 

(SDEFUN |SMP;univariateKnown| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 39)) (QREFELT $ 41)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 42))
                     (QREFELT $ 43))
           (|SMP;univariateKnown| (|SMP;red| |p| $) $) (QREFELT $ 44))))) 

(SDEFUN |SMP;univariate;$Sup;11| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 39)) (QREFELT $ 41)))
         ((|SMP;moreThanOneVariable?| |p| $) (|error| "not univariate"))
         ('T (SPADCALL (ELT $ 39) (QCDR (QCDR |p|)) (QREFELT $ 47))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;12|
        ((|u| |SparseUnivariatePolynomial| R) (|var| |VarSet|) ($ $))
        (COND
         ((SPADCALL |u| (QREFELT $ 49)) (CONS 0 (SPADCALL |u| (QREFELT $ 50))))
         ('T
          (SPADCALL
           (CONS 1
                 (CONS |var|
                       (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT $ 50)))
                                 (SPADCALL |u| (QREFELT $ 51))
                                 (QREFELT $ 29))))
           (SPADCALL (SPADCALL |u| (QREFELT $ 52)) |var| (QREFELT $ 53))
           (QREFELT $ 54))))) 

(SDEFUN |SMP;mon_mul|
        ((|p| $) (|var| |VarSet|) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|pt| (D)))
               (SEQ (LETT |pt| (SPADCALL |p| |n| (QREFELT $ 29)) |SMP;mon_mul|)
                    (EXIT (CONS 1 (CONS |var| |pt|)))))) 

(SDEFUN |SMP;univariate;$VarSetSup;14|
        ((|p| $) (|mvar| |VarSet|) ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|ulc| (D)) (|ulc0| (|SparseUnivariatePolynomial| $)) (|pt| (D)))
         (SEQ
          (COND
           ((OR (QEQCAR |p| 0)
                (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT $ 55)))
            (SPADCALL |p| 0 (QREFELT $ 29)))
           ('T
            (SEQ
             (LETT |pt| (QCDR (QCDR |p|))
                   . #1=(|SMP;univariate;$VarSetSup;14|))
             (EXIT
              (COND ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 56)) |pt|)
                    ('T
                     (SEQ
                      (LETT |ulc0|
                            (SPADCALL (SPADCALL |pt| (QREFELT $ 24)) |mvar|
                                      (QREFELT $ 58))
                            . #1#)
                      (LETT |ulc|
                            (SPADCALL
                             (CONS #'|SMP;univariate;$VarSetSup;14!0|
                                   (VECTOR $ |pt| |p|))
                             |ulc0| (QREFELT $ 60))
                            . #1#)
                      (EXIT
                       (SPADCALL |ulc|
                                 (SPADCALL (|SMP;red| |p| $) |mvar|
                                           (QREFELT $ 58))
                                 (QREFELT $ 61))))))))))))) 

(SDEFUN |SMP;univariate;$VarSetSup;14!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| |pt| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|SMP;univariate;$VarSetSup;14|))
          (LETT |pt| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|SMP;mon_mul| |c| (QCAR (QCDR |p|)) (SPADCALL |pt| (QREFELT $ 42))
             $))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP
                  (LETT |d| (SPADCALL |u| (QREFELT $ 63))
                        |SMP;unlikeUnivReconstruct|))
                 (SPADCALL |u| 0 (QREFELT $ 64)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT $ 65)) |mvar| |d|
                            (QREFELT $ 66))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT $ 67))
                   |mvar| $)
                  (QREFELT $ 54)))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;16|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G255 NIL) (|uu| (|SparseUnivariatePolynomial| $)) (|cc| ($)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT $ 68)) (SPADCALL |u| 0 (QREFELT $ 64)))
            ('T
             (SEQ (LETT |uu| |u| . #2=(|SMP;multivariate;SupVarSet$;16|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |uu| (QREFELT $ 69)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT $ 65)) . #2#)
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT $ 70)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 67))
                                     . #2#))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| $)
                                    . #2#)
                              (GO #3=#:G254))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |SMP;ground?;$B;17| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) 'T) ('T 'NIL))) 

(SDEFUN |SMP;monomial;$VarSetNni$;18|
        ((|p| $) (|mvar| |VarSet|) (|k1| |NonNegativeInteger|) ($ $))
        (SPROG ((|pt1| (D)) (|pt| (D)))
               (SEQ
                (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT $ 18))) |p|)
                      ((OR (QEQCAR |p| 0)
                           (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 70)))
                       (CONS 1
                             (CONS |mvar| (SPADCALL |p| |k1| (QREFELT $ 29)))))
                      ('T
                       (SEQ
                        (LETT |pt| (QCDR (QCDR |p|))
                              . #1=(|SMP;monomial;$VarSetNni$;18|))
                        (LETT |pt1|
                              (COND
                               ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                          (QREFELT $ 55))
                                (SPADCALL
                                 (CONS #'|SMP;monomial;$VarSetNni$;18!0|
                                       (VECTOR $ |k1| |mvar|))
                                 |pt| (QREFELT $ 60)))
                               ('T (SPADCALL |pt| |k1| (QREFELT $ 72))))
                              . #1#)
                        (EXIT (CONS 1 (CONS (QCAR (QCDR |p|)) |pt1|))))))))) 

(SDEFUN |SMP;monomial;$VarSetNni$;18!0| ((|c| NIL) ($$ NIL))
        (PROG (|mvar| |k1| $)
          (LETT |mvar| (QREFELT $$ 2) . #1=(|SMP;monomial;$VarSetNni$;18|))
          (LETT |k1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |mvar| |k1| (QREFELT $ 66)))))) 

(SDEFUN |SMP;monomial;RIe$;19|
        ((|c| R) (|e| |IndexedExponents| |VarSet|) ($ $))
        (SPROG ((|m1| (D)) (|p1| ($)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 74)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT $ 75))
                                        (QREFELT $ 76))
                              . #1=(|SMP;monomial;RIe$;19|))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT $ 77))
                                        (QREFELT $ 29))
                              . #1#)
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT $ 78)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;$IeR;20|
        ((|p| $) (|e| |IndexedExponents| |VarSet|) ($ R))
        (SPROG ((|vp| (|VarSet|)) (|ve| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |e| (QREFELT $ 74))
                  (COND ((QEQCAR |p| 0) (QCDR |p|))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 79)) |e|
                          (QREFELT $ 80)))))
                 ((QEQCAR |p| 0) (QCDR (|spadConstant| $ 12)))
                 (#1#
                  (SEQ
                   (LETT |ve| (SPADCALL |e| (QREFELT $ 78))
                         . #2=(|SMP;coefficient;$IeR;20|))
                   (LETT |vp| (QCAR (QCDR |p|)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |ve| |vp| (QREFELT $ 55))
                      (SPADCALL (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 79))
                                |e| (QREFELT $ 80)))
                     ((SPADCALL |ve| |vp| (QREFELT $ 70))
                      (QCDR (|spadConstant| $ 12)))
                     (#1#
                      (SPADCALL
                       (SPADCALL (QCDR (QCDR |p|))
                                 (SPADCALL |e| (QREFELT $ 77)) (QREFELT $ 79))
                       (SPADCALL |e| (QREFELT $ 75)) (QREFELT $ 80))))))))))) 

(SDEFUN |SMP;coerce;I$;21| ((|n| |Integer|) ($ $))
        (CONS 0 (SPADCALL |n| (QREFELT $ 82)))) 

(SDEFUN |SMP;characteristic;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 84))) 

(PUT '|SMP;coerce;R$;23| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R$;23| ((|c| R) ($ $)) (CONS 0 |c|)) 

(SDEFUN |SMP;recip;$U;24| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ
                   (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT $ 88))
                         |SMP;recip;$U;24|)
                   (EXIT
                    (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                          (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2$;25| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 90))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 91))))))) 

(SDEFUN |SMP;*;I2$;26| ((|n| |Integer|) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 93))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;I2$;26|))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 94))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2$;27| ((|c| R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| $ 12)) (QREFELT $ 20))
                  (|spadConstant| $ 12))
                 ((SPADCALL |c| (QREFELT $ 15) (QREFELT $ 20)) |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT $ 96))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;R2$;27|))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT $ 97))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3$;28| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 99))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 100))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 61)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 100))
                                         (QREFELT $ 61)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 56))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;+;3$;28|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 61))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 23))
                             (SPADCALL |up| (QREFELT $ 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 55))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 100))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 61)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 100))
                                           (QREFELT $ 61)))))))))))) 

(SDEFUN |SMP;-;3$;29| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 101))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 100))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 102)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 100))
                                         (QREFELT $ 102)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 56))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;-;3$;29|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 102))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 23))
                             (SPADCALL |up| (QREFELT $ 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 55))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 100))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 102)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 100))
                                           (QREFELT $ 102)))))))))))) 

(SDEFUN |SMP;=;2$B;30| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 20)))
           (#1='T 'NIL)))
         ((QEQCAR |p2| 0) 'NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 56))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 104)))
           (#1# 'NIL))))) 

(SDEFUN |SMP;*;3$;31| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 98)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1=(|SMP;*;3$;31|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 106))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#2#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 56))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 107))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT $ 106))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   (#2#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)) . #1#)
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT $ 97))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 23))
                            (SPADCALL |up| (QREFELT $ 24)))
                           (#2# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;^;$Nni$;32| ((|p| $) (|k| |NonNegativeInteger|) ($ $))
        (COND ((EQL |k| 0) (CONS 0 (QREFELT $ 15)))
              ('T (SPADCALL |p| |k| (QREFELT $ 110))))) 

(SDEFUN |SMP;^;$Pi$;33| ((|p| $) (|kp| |PositiveInteger|) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL (QCDR |p|) |kp| (QREFELT $ 112))))
                 ((NULL (|SMP;moreThanOneVariable?| |p| $))
                  (SPADCALL
                   (SPADCALL (|SMP;univariateKnown| |p| $) |kp|
                             (QREFELT $ 113))
                   (QCAR (QCDR |p|)) (QREFELT $ 53)))
                 ('T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #1=(|SMP;^;$Pi$;33|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p|)) |kp| (QREFELT $ 114))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 23))
                          (SPADCALL |up| (QREFELT $ 24)))
                         ('T (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;hashUpdate!;Hs$Hs;34| ((|s| |HashState|) (|p| $) ($ |HashState|))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT $ 116)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT $ 117))
                       |SMP;hashUpdate!;Hs$Hs;34|)
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT $ 118)))))))) 

(SDEFUN |SMP;unitNormal;$R;35|
        ((|p| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G64|
           #2=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G63| #2#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G63| (SPADCALL (QCDR |p|) (QREFELT $ 121))
                    . #3=(|SMP;unitNormal;$R;35|))
              (LETT |u| (QVELT |#G63| 0) . #3#)
              (LETT |c| (QVELT |#G63| 1) . #3#)
              (LETT |a| (QVELT |#G63| 2) . #3#)
              |#G63|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G64|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 39)) (QREFELT $ 121))
                    . #3#)
              (LETT |u| (QVELT |#G64| 0) . #3#)
              (LETT |c| (QVELT |#G64| 1) . #3#)
              (LETT |a| (QVELT |#G64| 2) . #3#)
              |#G64|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT $ 98))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2$;36| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G69|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 123))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G69|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                                   (QREFELT $ 121))
                         . #1=(|SMP;unitCanonical;2$;36|))
                   (LETT |u| (QVELT |#G69| 0) . #1#)
                   (LETT |c| (QVELT |#G69| 1) . #1#)
                   (LETT |a| (QVELT |#G69| 2) . #1#)
                   |#G69|)
                  (EXIT (SPADCALL |a| |p| (QREFELT $ 98))))))))) 

(SDEFUN |SMP;unit?;$B;37| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 125))) ('T 'NIL))) 

(SDEFUN |SMP;associates?;2$B;38| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 127)))
           (#1='T 'NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 56))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 128)))
           (#1# 'NIL)))
         (#1# 'NIL))) 

(SDEFUN |SMP;exquo;2$U;39| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| $)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 130))
                      . #1=(|SMP;exquo;2$U;39|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 105)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 55))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 100))
                                  (QREFELT $ 131))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (EXIT
               (COND
                ((SPADCALL |p1| |p2| (QREFELT $ 105))
                 (CONS 0 (|spadConstant| $ 14)))
                (#2#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT $ 131))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                               (LETT |up| (QCDR |a|) . #1#)
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 68))
                                  (CONS 0 (SPADCALL |up| (QREFELT $ 65))))
                                 (#2#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

(SDEFUN |SMP;exquo;2$U;40| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| $)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 130))
                      . #1=(|SMP;exquo;2$U;40|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 18))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 105)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 55))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 100))
                                  (QREFELT $ 131))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT $ 131))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                           (LETT |up| (QCDR |a|) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 68))
                              (CONS 0 (SPADCALL |up| (QREFELT $ 65))))
                             (#2#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2$;41| ((|fn| |Mapping| R R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ
                        (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;map;M2$;41|))
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;map;M2$;41!0| (VECTOR $ |fn|))
                               (QCDR (QCDR |p|)) (QREFELT $ 60))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2$;41!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| $)
          (LETT |fn| (QREFELT $$ 1) . #1=(|SMP;map;M2$;41|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT $ 134)))))) 

(SDEFUN |SMP;/;$R$;42| ((|p| $) (|r| R) ($ $))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT $ 135))) |p| (QREFELT $ 108))) 

(SDEFUN |SMP;content;$R;43| ((|p| $) ($ R))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ
                        (LETT |c| (QCDR (|spadConstant| $ 12))
                              . #1=(|SMP;content;$R;43|))
                        (LETT |up| (QCDR (QCDR |p|)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((OR (SPADCALL |up| (QREFELT $ 137))
                                      (SPADCALL |c|
                                                (QCDR (|spadConstant| $ 14))
                                                (QREFELT $ 20)))
                                  'NIL)
                                 ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (LETT |c|
                                    (SPADCALL |c|
                                              (SPADCALL
                                               (SPADCALL |up| (QREFELT $ 24))
                                               (QREFELT $ 138))
                                              (QREFELT $ 139))
                                    . #1#)
                              (EXIT
                               (LETT |up| (SPADCALL |up| (QREFELT $ 22))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |c|))))))) 

(SDEFUN |SMP;content;$VarSet$;44| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 140))))) 

(SDEFUN |SMP;gcd;3$;45| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 139))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 140))
                                   (QREFELT $ 142)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 55))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 140))
                              |p2| (QREFELT $ 142)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;45|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 143))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;46|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G413 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 68))
            (COND ((SPADCALL |a| (QREFELT $ 69)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 65))
                              (SPADCALL |b| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           ((SPADCALL |b| (QREFELT $ 68))
            (COND ((SPADCALL |b| (QREFELT $ 69)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 65))
                              (SPADCALL |a| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 144))
                   . #4=(|SMP;gcdPolynomial;3Sup;46|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 144)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 142))
                             (MIN (SPADCALL |mona| (QREFELT $ 63))
                                  (SPADCALL |monb| (QREFELT $ 63)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 63))
                    (SPADCALL |b| (QREFELT $ 63)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 148)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 149)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 148)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 149)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;47| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 26))
                (QREFELT $ 152))))) 

(SDEFUN |SMP;gcd;3$;48| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 153))) 

(SDEFUN |SMP;gcd;L$;49| ((|lp| |List| $) ($ $)) (SPADCALL |lp| (QREFELT $ 152))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;50|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |a| |b| (QREFELT $ 156))) 

(SDEFUN |SMP;content;$VarSet$;51| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 140))))) 

(SDEFUN |SMP;gcd;3$;52| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 139))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 140))
                                   (QREFELT $ 142)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 55))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 140))
                              |p2| (QREFELT $ 142)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;52|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 143))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;53|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G445 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 68))
            (COND ((SPADCALL |a| (QREFELT $ 69)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 65))
                              (SPADCALL |b| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           ((SPADCALL |b| (QREFELT $ 68))
            (COND ((SPADCALL |b| (QREFELT $ 69)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 65))
                              (SPADCALL |a| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 144))
                   . #4=(|SMP;gcdPolynomial;3Sup;53|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 144)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 142))
                             (MIN (SPADCALL |mona| (QREFELT $ 63))
                                  (SPADCALL |monb| (QREFELT $ 63)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 63))
                    (SPADCALL |b| (QREFELT $ 63)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 148)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 149)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 148)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 149)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;54| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 140))))) 

(SDEFUN |SMP;gcd;3$;55| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 139))))
                   ((SPADCALL |p1| (QREFELT $ 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 140))
                                   (QREFELT $ 142)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 55))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 140))
                              (QREFELT $ 142)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 70))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 140))
                              |p2| (QREFELT $ 142)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;55|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 143))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 23))
                        (SPADCALL |up| (QREFELT $ 24)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;56|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G473 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 68))
            (COND ((SPADCALL |a| (QREFELT $ 69)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 65))
                              (SPADCALL |b| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           ((SPADCALL |b| (QREFELT $ 68))
            (COND ((SPADCALL |b| (QREFELT $ 69)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 65))
                              (SPADCALL |a| (QREFELT $ 144)) (QREFELT $ 142))
                    (QREFELT $ 145)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 144))
                   . #4=(|SMP;gcdPolynomial;3Sup;56|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $)
                                        #5="failed")
                                       #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 144)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 146))
                             (QREFELT $ 29))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 19) (QREFELT $ 147))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 148)) . #4#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0)
                                       (|SparseUnivariatePolynomial| $)
                                       (|Union|
                                        (|SparseUnivariatePolynomial| $) #5#)
                                       #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 142))
                             (MIN (SPADCALL |mona| (QREFELT $ 63))
                                  (SPADCALL |monb| (QREFELT $ 63)))
                             (QREFELT $ 29))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 63))
                    (SPADCALL |b| (QREFELT $ 63)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 148)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 149)))
                 (#6='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 148)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 149)))
               (#6# |mong|))))))))) 

(SDEFUN |SMP;coerce;$Of;57| ((|p| $) ($ |OutputForm|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 158)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 159))
                         (QREFELT $ 160))))) 

(SDEFUN |SMP;coefficients;$L;58| ((|p| $) ($ |List| R))
        (SPROG
         ((#1=#:G490 NIL) (#2=#:G489 #3=(|List| R)) (#4=#:G491 #3#)
          (#5=#:G493 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 163)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|SMP;coefficients;$L;58|))
                  (SEQ (LETT |p1| NIL . #7#)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 26))
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |p1| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT $ 164)) . #7#)
                          (COND (#1# (LETT #2# (APPEND #2# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;$R;59| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;$U;60| ((|p| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| |List| |VarSet|) (|m| |List| |VarSet|) ($ |List| |VarSet|))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 56))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT $ 170)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) $)
                             (QREFELT $ 170))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 70))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT $ 170)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| $)
                             (QREFELT $ 170))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT $ 170)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) $) (QREFELT $ 170))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;$L;62| ((|p| $) ($ |List| |VarSet|))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL . #1=(|SMP;variables;$L;62|))
                            (LETT |q| (QCDR (QCDR |p|)) . #1#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((SPADCALL |q| (QREFELT $ 137)) 'NIL)
                                          ('T 'T)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 24))
                                          (QREFELT $ 171))
                                         $)
                                        . #1#)
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT $ 22))
                                         . #1#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;$U;63| ((|p| $) ($ |Union| |VarSet| "failed"))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;$VarSet2$;64| ((|p| $) (|mvar| |VarSet|) (|pval| $) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) |pval| (QREFELT $ 174))) 

(SDEFUN |SMP;eval;$VarSetR$;65| ((|p| $) (|mvar| |VarSet|) (|val| R) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (CONS 0 |val|)
                  (QREFELT $ 174))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG ((|pts| (D)) (|pval| ($)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT $ 177))))
                  |p|)
                 ('T
                  (SEQ
                   (LETT |mvar| (|SPADfirst| |Lvar|)
                         . #1=(|SMP;evalSortedVarlist|))
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 70))
                      (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                       (SPADCALL |Lpval| '|rest| (QREFELT $ 179)) $))
                     (#2='T
                      (SEQ
                       (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 181))
                             . #1#)
                       (LETT |pts|
                             (SPADCALL
                              (CONS #'|SMP;evalSortedVarlist!0|
                                    (VECTOR $ |Lpval| |Lvar|))
                              (QCDR (QCDR |p|)) (QREFELT $ 60))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 56))
                          (COND
                           ((QEQCAR |pval| 0)
                            (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                      (QREFELT $ 174)))
                           (#2# (SPADCALL |pts| |pval| (QREFELT $ 174)))))
                         (#2#
                          (SPADCALL |pts| (QCAR (QCDR |p|))
                                    (QREFELT $ 71))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| $)
          (LETT |Lvar| (QREFELT $$ 2) . #1=(|SMP;evalSortedVarlist|))
          (LETT |Lpval| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| $))))) 

(SDEFUN |SMP;eval;$LL$;67|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG
         ((|nlpval| (|List| $)) (#1=#:G550 NIL) (|mvar| NIL) (#2=#:G549 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT $ 70) |Lvar| (QREFELT $ 183)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| $))
           ('T
            (SEQ
             (LETT |nlvar| (SPADCALL (ELT $ 70) |Lvar| (QREFELT $ 184))
                   . #3=(|SMP;eval;$LL$;67|))
             (LETT |nlpval|
                   (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 185)) |Lpval|)
                         ('T
                          (LETT |nlpval|
                                (PROGN
                                 (LETT #2# NIL . #3#)
                                 (SEQ (LETT |mvar| NIL . #3#)
                                      (LETT #1# |nlvar| . #3#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |mvar| (CAR #1#) . #3#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |Lpval|
                                                         (SPADCALL |mvar|
                                                                   |Lvar|
                                                                   (QREFELT $
                                                                            186))
                                                         (QREFELT $ 187))
                                               #2#)
                                              . #3#)))
                                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #3#)))
                   . #3#)
             (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| $)))))))) 

(SDEFUN |SMP;eval;$LL$;68|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lval| |List| R) ($ $))
        (SPROG ((#1=#:G554 NIL) (|val| NIL) (#2=#:G553 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #2# NIL . #3=(|SMP;eval;$LL$;68|))
                           (SEQ (LETT |val| NIL . #3#) (LETT #1# |Lval| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |val| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (CONS 0 |val|) #2#) . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 188))))) 

(SDEFUN |SMP;degree;$VarSetNni;69|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 56))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 42)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 70)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) |mvar|
                          (QREFELT $ 190))
                (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 190)))))) 

(SDEFUN |SMP;degree;$LL;70|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G564 NIL) (|mvar| NIL) (#2=#:G563 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;degree;$LL;70|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 190)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;$Ie;71| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 193))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 194))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 42))
                          (QCAR (QCDR |p|)) (QREFELT $ 195))
                (QREFELT $ 196))))) 

(SDEFUN |SMP;minimumDegree;$Ie;72| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 193))
                      ('T
                       (SEQ
                        (LETT |md| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 197))
                              |SMP;minimumDegree;$Ie;72|)
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT $ 79))
                           (QREFELT $ 198))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT $ 195))
                          (QREFELT $ 196))))))))) 

(SDEFUN |SMP;minimumDegree;$VarSetNni;73|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|p1| ($)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 56))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 197)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               |mvar| (QREFELT $ 199))
                              . #2=(|SMP;minimumDegree;$VarSetNni;73|))
                        (LETT |p1| (|SMP;red| |p| $) . #2#)
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT $ 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT $ 199)))))))))))) 

(SDEFUN |SMP;minimumDegree;$LL;74|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G583 NIL) (|mvar| NIL) (#2=#:G582 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;minimumDegree;$LL;74|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 199)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;75| ((|p| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 56))
                       (SEQ
                        (LETT |up| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 201))
                              . #1=(|SMP;differentiate;$VarSet$;75|))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#2#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;$VarSet$;75!0|
                                     (VECTOR $ |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT $ 60))
                              . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 23))
                           (SPADCALL |up| (QREFELT $ 24)))
                          (#2# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;75!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| $)
          (LETT |mvar| (QREFELT $$ 1) . #1=(|SMP;differentiate;$VarSet$;75|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT $ 202)))))) 

(SDEFUN |SMP;leadingCoefficient;$R;76| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                         (QREFELT $ 39))))) 

(SDEFUN |SMP;leadingMonomial;2$;77| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                          (QREFELT $ 203))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 42))
                (QREFELT $ 66))))) 

(SDEFUN |SMP;reductum;2$;78| ((|p| $) ($ $))
        (SPROG ((|ptr| (D)) (|rlc| ($)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      (#1='T
                       (SEQ
                        (LETT |rlc|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                               (QREFELT $ 204))
                              . #2=(|SMP;reductum;2$;78|))
                        (LETT |ptr|
                              (SPADCALL
                               (SPADCALL |rlc|
                                         (SPADCALL (QCDR (QCDR |p|))
                                                   (QREFELT $ 42))
                                         (QREFELT $ 29))
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                               (QREFELT $ 61))
                              . #2#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |ptr| (QREFELT $ 42)) 0)
                           (SPADCALL |ptr| (QREFELT $ 205)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| |VPoly|) (|vars| . #1=(|List| |VarSet|))
         (|degs| . #2=(|List| (|NonNegativeInteger|))) (|res| |List| $)
         ($ |List| $))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| ($))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| $)))
          (#5=#:G616 NIL) (|var| NIL) (#6=#:G617 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| ($)) (#7=#:G615 NIL) (|t| NIL) (|v1| (|VarSet|))
          (|tl| (|List| #3#)))
         (SEQ (LETT |tl| (QCDR |p|) . #8=(|SMP;monomials1|))
              (LETT |v1| (QCAR |p|) . #8#)
              (SEQ (LETT |t| NIL . #8#) (LETT #7# |tl| . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (LETT |p1| (QCDR |t|) . #8#)
                        (LETT |k1| (QCAR |t|) . #8#)
                        (EXIT
                         (COND
                          ((QEQCAR |p1| 0)
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 206))
                                    (CONS 1 (CONS |v1| (LIST |t|))))
                                   ('T |p1|))
                                  . #8#)
                            (SEQ (LETT |deg| NIL . #8#) (LETT #6# |degs| . #8#)
                                 (LETT |var| NIL . #8#) (LETT #5# |vars| . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |var| (CAR #5#) . #8#) NIL)
                                       (ATOM #6#)
                                       (PROGN
                                        (LETT |deg| (CAR #6#) . #8#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |mon1| (CONS |deg| |mon|) . #8#)
                                      (EXIT
                                       (LETT |mon|
                                             (CONS 1
                                                   (CONS |var| (LIST |mon1|)))
                                             . #8#)))
                                 (LETT #5#
                                       (PROG1 (CDR #5#)
                                         (LETT #6# (CDR #6#) . #8#))
                                       . #8#)
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |res| (SPADCALL |mon| |res| (QREFELT $ 207))
                                   . #8#))))
                          ('T
                           (SEQ
                            (LETT |vars1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 206))
                                    (CONS |v1| |vars|))
                                   ('T |vars|))
                                  . #8#)
                            (LETT |degs1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 206))
                                    (CONS |k1| |degs|))
                                   ('T |degs|))
                                  . #8#)
                            (EXIT
                             (LETT |res|
                                   (|SMP;monomials1| (QCDR |p1|) |vars1|
                                    |degs1| |res| $)
                                   . #8#)))))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;$L;80| ((|p| $) ($ |List| $))
        (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 105)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL $)
                         (QREFELT $ 208))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G654)
  (SPROG NIL
         (PROG (#2=#:G655)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariatePolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomial|)))))))))) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G653 NIL) (|pv$| NIL) (#2=#:G643 NIL) (#3=#:G644 NIL) (#4=#:G645 NIL)
    (#5=#:G646 NIL) (#6=#:G647 NIL) (#7=#:G648 NIL) (#8=#:G649 NIL)
    (#9=#:G650 NIL) (#10=#:G651 NIL) (#11=#:G652 NIL) ($ NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|SparseMultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #12#)
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2) . #12#)
    (LETT $ (GETREFV 239) . #12#)
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
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (|HasCategory| |#1| '(|Field|))
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
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #10# #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR #10# #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #11# #9#) (OR #11# #9#)
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|)))))
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|)))))
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #11#
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #5#)
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
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
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
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
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
                                         #4# #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #10#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 35184372088832))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR #11#
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR #4# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR #3# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #2# (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
    (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;One;$;2|) $ 14)))))
    (QSETREFV $ 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| $ 14)))
               ('T (QCDR (|spadConstant| $ 12)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 21 (CONS (|dispatchFunction| |SMP;one?;$B;4|) $))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet$;7|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 83 (CONS (|dispatchFunction| |SMP;coerce;I$;21|) $))
       (QSETREFV $ 85
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;22|) $)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV $ 89 (CONS (|dispatchFunction| |SMP;recip;$U;24|) $))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV $ 92 (CONS (|dispatchFunction| |SMP;-;2$;25|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |SMP;*;I2$;26|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 103 (CONS (|dispatchFunction| |SMP;-;3$;29|) $))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SMP;unitNormal;$R;35|) $))
       (QSETREFV $ 124 (CONS (|dispatchFunction| |SMP;unitCanonical;2$;36|) $))
       (QSETREFV $ 126 (CONS (|dispatchFunction| |SMP;unit?;$B;37|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SMP;associates?;2$B;38|) $))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV $ 132 (CONS (|dispatchFunction| |SMP;exquo;2$U;39|) $)))
        ('T
         (QSETREFV $ 132 (CONS (|dispatchFunction| |SMP;exquo;2$U;40|) $)))))))
    (COND
     ((|testBitVector| |pv$| 17)
      (QSETREFV $ 136 (CONS (|dispatchFunction| |SMP;/;$R$;42|) $))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV $ 138 (CONS (|dispatchFunction| |SMP;content;$R;43|) $))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 3)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 141
                       (CONS (|dispatchFunction| |SMP;content;$VarSet$;44|) $))
             (QSETREFV $ 142 (CONS (|dispatchFunction| |SMP;gcd;3$;45|) $))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV $ 150
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;46|)
                               $))))))))
         ('T
          (PROGN
           (QSETREFV $ 141
                     (CONS (|dispatchFunction| |SMP;content;$VarSet$;47|) $))
           (QSETREFV $ 142 (CONS (|dispatchFunction| |SMP;gcd;3$;48|) $))
           (QSETREFV $ 155 (CONS (|dispatchFunction| |SMP;gcd;L$;49|) $))
           (QSETREFV $ 150
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;50|)
                           $))))))
       ((|testBitVector| |pv$| 13)
        (PROGN
         (QSETREFV $ 141
                   (CONS (|dispatchFunction| |SMP;content;$VarSet$;51|) $))
         (QSETREFV $ 142 (CONS (|dispatchFunction| |SMP;gcd;3$;52|) $))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV $ 150
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;53|)
                           $))))))))
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 141 (CONS (|dispatchFunction| |SMP;content;$VarSet$;54|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |SMP;gcd;3$;55|) $))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV $ 150
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;56|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 20)
      (QSETREFV $ 202
                (CONS (|dispatchFunction| |SMP;differentiate;$VarSet$;75|)
                      $))))
    $))) 

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;$;1|) $))
              (4 . |One|) (8 . |One|) '|m_one| (|Boolean|) (12 . |zero?|)
              |SMP;zero?;$B;3| (17 . |One|) (21 . =) (27 . |one?|)
              (32 . |reductum|) (37 . |ground?|) (42 . |leadingCoefficient|)
              (|List| $$) (47 . |coefficients|) (|NonNegativeInteger|)
              |SMP;numberOfMonomials;$Nni;6| (52 . |monomial|) (58 . |coerce|)
              (63 . |numberOfMonomials|) (68 . ~=) |SMP;monomial?;$B;8|
              |SMP;ground?;$B;17| (74 . |false|) (78 . |true|)
              (|Mapping| 16 $$) (82 . |any?|) |SMP;leadingCoefficient;$R;76|
              (|SparseUnivariatePolynomial| 6) (88 . |coerce|) (93 . |degree|)
              (98 . |monomial|) (104 . +) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 40)
              (110 . |map|) |SMP;univariate;$Sup;11| (116 . |ground?|)
              (121 . |leadingCoefficient|) (126 . |degree|) (131 . |reductum|)
              |SMP;multivariate;SupVarSet$;12| |SMP;+;3$;28| (136 . <)
              (142 . =) (|SparseUnivariatePolynomial| $)
              |SMP;univariate;$VarSetSup;14| (|Mapping| $$ $$) (148 . |map|)
              (154 . +) (|SparseUnivariatePolynomial| $$) (160 . |degree|)
              (165 . |coefficient|) (171 . |leadingCoefficient|)
              |SMP;monomial;$VarSetNni$;18| (176 . |reductum|)
              (181 . |ground?|) (186 . |zero?|) (191 . >)
              |SMP;multivariate;SupVarSet$;16| (197 . |shiftLeft|)
              (|IndexedExponents| 7) (203 . |zero?|) (208 . |reductum|)
              |SMP;monomial;RIe$;19| (213 . |leadingCoefficient|)
              (218 . |leadingSupport|) (223 . |coefficient|)
              |SMP;coefficient;$IeR;20| (|Integer|) (229 . |coerce|)
              (234 . |coerce|) (239 . |characteristic|)
              (243 . |characteristic|) |SMP;coerce;R$;23| (|Union| $ '"failed")
              (247 . |recip|) (252 . |recip|) (257 . -) (262 . -) (267 . -)
              (272 . *) (278 . *) (284 . *) (290 . *) (296 . *) |SMP;*;R2$;27|
              (302 . +) (308 . |coerce|) (313 . -) (319 . -) (325 . -)
              (331 . =) |SMP;=;2$B;30| (337 . *) (343 . *) |SMP;*;3$;31|
              (|PositiveInteger|) |SMP;^;$Pi$;33| |SMP;^;$Nni$;32| (349 . ^)
              (355 . ^) (361 . ^) (|HashState|) (367 . |hashUpdate!|)
              (373 . |hashUpdate!|) (379 . |hashUpdate!|)
              |SMP;hashUpdate!;Hs$Hs;34|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (385 . |unitNormal|) (390 . |unitNormal|) (395 . |unitCanonical|)
              (400 . |unitCanonical|) (405 . |unit?|) (410 . |unit?|)
              (415 . |associates?|) (421 . |associates?|) (427 . |associates?|)
              (433 . |exquo|) (439 . |exquo|) (445 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2$;41| (451 . |inv|) (456 . /) (462 . |zero?|)
              (467 . |content|) (472 . |gcd|) (478 . |content|)
              (483 . |content|) (489 . |gcd|) (495 . |gcd|) (501 . |content|)
              (506 . |coerce|) (511 . |minimumDegree|) (516 . ~=)
              (522 . |exquo|) (528 . *) (534 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 73 7 6 $$) (540 . |gcd|) (545 . |gcd|)
              (|List| $) (551 . |gcd|) (556 . |gcd|) (|OutputForm|)
              (562 . |coerce|) (567 . |coerce|) (572 . |outputForm|)
              |SMP;coerce;$Of;57| (|List| 6) (578 . |list|)
              |SMP;coefficients;$L;58| (583 . |nil|) |SMP;retract;$R;59|
              (|Union| 6 '"failed") |SMP;retractIfCan;$U;60| (|List| 7)
              (587 . |setrest!|) |SMP;variables;$L;62| (|Union| 7 '"failed")
              |SMP;mainVariable;$U;63| (593 . |elt|) |SMP;eval;$VarSet2$;64|
              |SMP;eval;$VarSetR$;65| (599 . |empty?|) '"rest" (604 . |elt|)
              '"first" (610 . |elt|) (|Mapping| 16 7 7) (616 . |sorted?|)
              (622 . |sort|) (628 . =) (634 . |position|) (640 . |elt|)
              |SMP;eval;$LL$;67| |SMP;eval;$LL$;68| |SMP;degree;$VarSetNni;69|
              (|List| 27) |SMP;degree;$LL;70| (646 . |Zero|)
              |SMP;degree;$Ie;71| (650 . |monomial|) (656 . +)
              (662 . |minimumDegree|) |SMP;minimumDegree;$Ie;72|
              |SMP;minimumDegree;$VarSetNni;73| |SMP;minimumDegree;$LL;74|
              (667 . |differentiate|) (672 . |differentiate|)
              |SMP;leadingMonomial;2$;77| |SMP;reductum;2$;78| (678 . |ground|)
              (683 . >) (689 . |cons|) (695 . |reverse!|) |SMP;monomials;$L;80|
              (|Union| 217 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 81) (|Matrix| 81)
              (|Record| (|:| |mat| 215) (|:| |vec| (|Vector| 81))) (|Vector| $)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 81 $)
              (|Fraction| 81)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Factored| 57) (|Union| 225 '#1#) (|List| 57)
              (|Union| 220 '#2="failed") (|Union| 81 '#2#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |mat| 230) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Equation| $) (|List| 231)
              (|Record| (|:| |var| 7) (|:| |exponent| 27))
              (|Union| 233 '#3="failed") (|Union| 154 '#3#) (|Mapping| 73 73)
              (|String|) (|SingleInteger|))
           '#(~= 700 |zero?| 706 |variables| 711 |univariate| 716 |unitNormal|
              727 |unitCanonical| 732 |unit?| 737 |totalDegreeSorted| 742
              |totalDegree| 748 |subtractIfCan| 759 |squareFreePolynomial| 765
              |squareFreePart| 770 |squareFree| 775
              |solveLinearPolynomialEquation| 780 |smaller?| 786 |sample| 792
              |retractIfCan| 796 |retract| 816 |resultant| 836 |reductum| 843
              |reducedSystem| 848 |recip| 870 |primitivePart| 875
              |primitiveMonomials| 886 |prime?| 891 |pomopo!| 896
              |patternMatch| 904 |opposite?| 918 |one?| 924 |numberOfMonomials|
              929 |multivariate| 934 |monomials| 946 |monomial?| 951 |monomial|
              956 |monicDivide| 976 |minimumDegree| 983 |mapExponents| 1000
              |map| 1006 |mainVariable| 1012 |leadingMonomial| 1017
              |leadingCoefficient| 1022 |lcmCoef| 1027 |lcm| 1033 |latex| 1044
              |isTimes| 1049 |isPlus| 1054 |isExpt| 1059 |hashUpdate!| 1064
              |hash| 1070 |ground?| 1075 |ground| 1080 |gcdPolynomial| 1085
              |gcd| 1091 |factorSquareFreePolynomial| 1102 |factorPolynomial|
              1107 |factor| 1112 |exquo| 1117 |eval| 1129 |discriminant| 1183
              |differentiate| 1189 |degree| 1215 |convert| 1232 |content| 1247
              |conditionP| 1258 |coerce| 1263 |coefficients| 1293 |coefficient|
              1298 |charthRoot| 1318 |characteristic| 1323 |binomThmExpt| 1327
              |associates?| 1334 |annihilate?| 1340 ^ 1346 |Zero| 1358 |One|
              1362 D 1366 = 1392 / 1398 - 1404 + 1415 * 1421)
           'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 0 10 0 10 0 14 25 1 21 4 27 13 1 2 3 21 4 9
                                  24 27 15 4 0 1 29 30 0 0 1 1 22 28 30 40 11
                                  42 0 11 44 0 0 8 32 34 0 0 11 0 0 0 0 0 0 4 5
                                  6 7 26 12 36 38 16 11 11))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |Algebra&| |Algebra&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| NIL |Module&| NIL NIL |Module&| NIL NIL NIL
                |Module&| |EntireRing&| |PartialDifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL |FullyRetractableTo&| |SetCategory&| |Evalable&|
                NIL |InnerEvalable&| |InnerEvalable&| |RetractableTo&|
                |BasicType&| NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL NIL NIL NIL |InnerEvalable&| |RetractableTo&|)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|Algebra| 220) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Module| 220) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 81)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 7) (|BiModule| 6 6)
                 (|BiModule| 220 220) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 220)
                 (|RightModule| 220) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 81) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|Evalable| $$)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 157) (|unitsKnown|) (|RetractableTo| 220)
                 (|RetractableTo| 81) (|canonicalUnitNormal|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|ConvertibleTo| 213)
                 (|ConvertibleTo| 214) (|ConvertibleTo| 212)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7))
              (|makeByteWordVec2| 238
                                  '(0 6 0 11 0 6 0 13 0 0 0 14 1 6 16 0 17 0 8
                                    0 19 2 6 16 0 0 20 1 0 16 0 21 1 8 0 0 22 1
                                    8 16 0 23 1 8 2 0 24 1 8 25 0 26 2 8 0 2 27
                                    29 1 0 0 7 30 1 8 27 0 31 2 27 16 0 0 32 0
                                    16 0 35 0 16 0 36 2 25 16 37 0 38 1 40 0 6
                                    41 1 8 27 0 42 2 40 0 6 27 43 2 40 0 0 0 44
                                    2 46 40 45 8 47 1 40 16 0 49 1 40 6 0 50 1
                                    40 27 0 51 1 40 0 0 52 2 7 16 0 0 55 2 7 16
                                    0 0 56 2 8 0 59 0 60 2 8 0 0 0 61 1 62 27 0
                                    63 2 62 2 0 27 64 1 62 2 0 65 1 62 0 0 67 1
                                    62 16 0 68 1 62 16 0 69 2 7 16 0 0 70 2 8 0
                                    0 27 72 1 73 16 0 74 1 73 0 0 75 1 73 27 0
                                    77 1 73 7 0 78 2 8 2 0 27 79 1 6 0 81 82 1
                                    0 0 81 83 0 6 27 84 0 0 27 85 1 6 87 0 88 1
                                    0 87 0 89 1 6 0 0 90 1 8 0 0 91 1 0 0 0 92
                                    2 6 0 81 0 93 2 8 0 81 0 94 2 0 0 81 0 95 2
                                    6 0 0 0 96 2 8 0 2 0 97 2 6 0 0 0 99 1 8 0
                                    2 100 2 6 0 0 0 101 2 8 0 0 0 102 2 0 0 0 0
                                    103 2 8 16 0 0 104 2 8 0 0 2 106 2 8 0 0 0
                                    107 2 6 0 0 109 112 2 40 0 0 27 113 2 8 0 0
                                    27 114 2 6 115 115 0 116 2 7 115 115 0 117
                                    2 8 115 115 0 118 1 6 120 0 121 1 0 120 0
                                    122 1 6 0 0 123 1 0 0 0 124 1 6 16 0 125 1
                                    0 16 0 126 2 6 16 0 0 127 2 8 16 0 0 128 2
                                    0 16 0 0 129 2 6 87 0 0 130 2 8 87 0 0 131
                                    2 0 87 0 0 132 1 6 0 0 135 2 0 0 0 6 136 1
                                    8 16 0 137 1 0 6 0 138 2 6 0 0 0 139 1 8 2
                                    0 140 2 0 0 0 7 141 2 0 0 0 0 142 2 8 0 0 0
                                    143 1 62 2 0 144 1 62 0 2 145 1 62 27 0 146
                                    2 62 16 0 0 147 2 62 87 0 0 148 2 62 0 0 0
                                    149 2 0 57 57 57 150 1 151 2 25 152 2 151 2
                                    2 2 153 1 0 0 154 155 2 151 62 62 62 156 1
                                    6 157 0 158 1 7 157 0 159 2 8 157 0 157 160
                                    1 162 0 6 163 0 25 0 165 2 169 0 0 0 170 2
                                    8 2 0 2 174 1 25 16 0 177 2 25 0 0 178 179
                                    2 25 2 0 180 181 2 169 16 182 0 183 2 169 0
                                    182 0 184 2 169 16 0 0 185 2 169 81 7 0 186
                                    2 25 2 0 81 187 0 73 0 193 2 73 0 27 7 195
                                    2 73 0 0 0 196 1 8 27 0 197 1 8 0 0 201 2 0
                                    0 0 7 202 1 8 2 0 205 2 27 16 0 0 206 2 25
                                    0 2 0 207 1 25 0 0 208 2 0 16 0 0 1 1 55 16
                                    0 18 1 0 169 0 171 2 0 57 0 7 58 1 0 40 0
                                    48 1 48 120 0 122 1 48 0 0 124 1 48 16 0
                                    126 2 0 27 0 169 1 2 0 27 0 169 1 1 0 27 0
                                    1 2 54 87 0 0 1 1 10 223 57 1 1 13 0 0 1 1
                                    13 222 0 1 2 10 224 225 57 1 2 8 16 0 0 1 0
                                    55 0 1 1 5 226 0 1 1 6 227 0 1 1 11 172 0 1
                                    1 0 167 0 168 1 5 220 0 1 1 6 81 0 1 1 11 7
                                    0 1 1 0 6 0 166 3 20 0 0 0 7 1 1 0 0 0 204
                                    1 19 215 211 1 2 19 216 211 217 1 2 4 229
                                    211 217 1 1 4 230 211 1 1 51 87 0 89 2 13 0
                                    0 7 1 1 13 0 0 1 1 11 154 0 1 1 10 16 0 1 4
                                    0 0 0 6 73 0 1 3 31 218 0 213 218 1 3 33
                                    219 0 214 219 1 2 55 16 0 0 1 1 51 16 0 21
                                    1 0 27 0 28 2 0 0 57 7 71 2 0 0 40 7 53 1 0
                                    154 0 209 1 0 16 0 33 3 0 0 0 169 191 1 3 0
                                    0 0 7 27 66 2 0 0 6 73 76 3 4 228 0 0 7 1 2
                                    0 27 0 7 199 2 0 191 0 169 200 1 0 73 0 198
                                    2 0 0 236 0 1 2 0 0 133 0 134 1 0 172 0 173
                                    1 0 0 0 203 1 0 6 0 39 2 13 221 0 0 1 2 13
                                    0 0 0 1 1 13 0 154 1 1 0 237 0 1 1 11 235 0
                                    1 1 0 235 0 1 1 11 234 0 1 2 0 115 115 0
                                    119 1 0 238 0 1 1 0 16 0 34 1 0 6 0 1 2 13
                                    57 57 57 150 2 13 0 0 0 142 1 13 0 154 155
                                    1 10 223 57 1 1 10 223 57 1 1 10 222 0 1 2
                                    48 87 0 0 132 2 12 87 0 6 1 3 11 0 0 154
                                    154 1 2 11 0 0 231 1 3 11 0 0 0 0 1 2 11 0
                                    0 232 1 3 0 0 0 7 0 175 3 0 0 0 169 154 188
                                    3 0 0 0 7 6 176 3 0 0 0 169 162 189 2 20 0
                                    0 7 1 2 4 0 0 169 1 2 4 0 0 7 202 3 4 0 0
                                    169 191 1 3 4 0 0 7 27 1 2 0 191 0 169 192
                                    2 0 27 0 7 190 1 0 73 0 194 1 16 212 0 1 1
                                    35 213 0 1 1 37 214 0 1 2 13 0 0 7 141 1 13
                                    6 0 138 1 46 210 211 1 1 50 0 81 83 1 49 0
                                    0 1 1 18 0 220 1 1 11 0 7 30 1 0 0 6 86 1 0
                                    157 0 161 1 0 162 0 164 3 0 0 0 169 191 1 3
                                    0 0 0 7 27 1 2 0 6 0 73 80 1 47 87 0 1 0 52
                                    27 85 3 45 0 0 0 27 1 2 48 16 0 0 129 2 52
                                    16 0 0 1 2 51 0 0 27 111 2 0 0 0 109 110 0
                                    55 0 12 0 51 0 14 2 4 0 0 169 1 2 4 0 0 7 1
                                    3 4 0 0 169 191 1 3 4 0 0 7 27 1 2 0 16 0 0
                                    105 2 17 0 0 6 136 1 53 0 0 92 2 53 0 0 0
                                    103 2 0 0 0 0 54 2 53 0 81 0 95 2 55 0 27 0
                                    1 2 1 0 0 220 1 2 1 0 220 0 1 2 0 0 6 0 98
                                    2 0 0 0 0 108 2 0 0 0 6 1 2 0 0 109 0
                                    1)))))
           '|lookupComplete|)) 
