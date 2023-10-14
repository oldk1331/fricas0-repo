
(SDEFUN |SMP;Zero;$;1| (($ $)) (CONS 0 (|spadConstant| $ 11))) 

(SDEFUN |SMP;One;$;2| (($ $)) (CONS 0 (|spadConstant| $ 13))) 

(SDEFUN |SMP;zero?;$B;3| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 16))) ('T 'NIL))) 

(SDEFUN |SMP;one?;$B;4| ((|p| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (QCDR |p|) (QCDR (|spadConstant| $ 14)) (QREFELT $ 18)))
         ('T 'NIL))) 

(SDEFUN |SMP;red| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
              ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20))
                         (QREFELT $ 21))
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20))
                         (QREFELT $ 22)))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20))))))) 

(SDEFUN |SMP;numberOfMonomials;$Nni;6| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G207 NIL) (#2=#:G206 #3=(|NonNegativeInteger|)) (#4=#:G208 #3#)
          (#5=#:G210 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT $ 16)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL . #7=(|SMP;numberOfMonomials;$Nni;6|))
             (SEQ (LETT |q| NIL . #7#)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) . #7#)
                  G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT $ 26)) . #7#)
                     (COND (#1# (LETT #2# (+ #2# #4#) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet$;7| ((|mvar| |VarSet|) ($ $))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 27))))) 

(SDEFUN |SMP;monomial?;$B;8| ((|p| $) ($ |Boolean|))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      (#1='T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)) |SMP;monomial?;$B;8|)
                            (EXIT
                             (COND
                              ((SPADCALL 1 (SPADCALL |sup| (QREFELT $ 30))
                                         (QREFELT $ 31))
                               'NIL)
                              (#1#
                               (SPADCALL (SPADCALL |sup| (QREFELT $ 22))
                                         (QREFELT $ 32))))))))))) 

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
                                     (SPADCALL |q| (QREFELT $ 24))
                                     (QREFELT $ 37))
                           'T)
                          (#1# 'NIL))))))))) 

(SDEFUN |SMP;moreThanOneVariable?!0| ((|x1| NIL) ($ NIL))
        (COND ((SPADCALL |x1| (QREFELT $ 33)) (|spadConstant| $ 34))
              ('T (|spadConstant| $ 35)))) 

(SDEFUN |SMP;univariateKnown| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 40)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT $ 38))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41))
                     (QREFELT $ 42))
           (|SMP;univariateKnown| (|SMP;red| |p| $) $) (QREFELT $ 43))))) 

(SDEFUN |SMP;univariate;$Sup;11| ((|p| $) ($ |SparseUnivariatePolynomial| R))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 40)))
         ((|SMP;moreThanOneVariable?| |p| $) (|error| "not univariate"))
         ('T (SPADCALL (ELT $ 38) (QCDR (QCDR |p|)) (QREFELT $ 46))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;12|
        ((|u| |SparseUnivariatePolynomial| R) (|var| |VarSet|) ($ $))
        (COND
         ((SPADCALL |u| (QREFELT $ 48)) (CONS 0 (SPADCALL |u| (QREFELT $ 49))))
         ('T
          (SPADCALL
           (CONS 1
                 (CONS |var|
                       (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT $ 49)))
                                 (SPADCALL |u| (QREFELT $ 50))
                                 (QREFELT $ 27))))
           (SPADCALL (SPADCALL |u| (QREFELT $ 51)) |var| (QREFELT $ 52))
           (QREFELT $ 53))))) 

(SDEFUN |SMP;univariate;$VarSetSup;13|
        ((|p| $) (|mvar| |VarSet|) ($ |SparseUnivariatePolynomial| $))
        (SPROG ((|pt| (D)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT $ 54)))
                  (SPADCALL |p| 0 (QREFELT $ 27)))
                 ('T
                  (SEQ
                   (LETT |pt| (QCDR (QCDR |p|)) |SMP;univariate;$VarSetSup;13|)
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55)) |pt|)
                     ('T
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 14) (QCAR (QCDR |p|))
                                  (SPADCALL |pt| (QREFELT $ 41))
                                  (QREFELT $ 56))
                        (SPADCALL (SPADCALL |pt| (QREFELT $ 22)) |mvar|
                                  (QREFELT $ 58))
                        (QREFELT $ 59))
                       (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 58))
                       (QREFELT $ 60))))))))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP
                  (LETT |d| (SPADCALL |u| (QREFELT $ 62))
                        |SMP;unlikeUnivReconstruct|))
                 (SPADCALL |u| 0 (QREFELT $ 63)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT $ 64)) |mvar| |d|
                            (QREFELT $ 56))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT $ 65))
                   |mvar| $)
                  (QREFELT $ 53)))))) 

(SDEFUN |SMP;multivariate;SupVarSet$;15|
        ((|u| |SparseUnivariatePolynomial| $) (|mvar| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G247 NIL) (|uu| (|SparseUnivariatePolynomial| $)) (|cc| ($)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT $ 66)) (SPADCALL |u| 0 (QREFELT $ 63)))
            ('T
             (SEQ (LETT |uu| |u| . #2=(|SMP;multivariate;SupVarSet$;15|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |uu| (QREFELT $ 67)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT $ 64)) . #2#)
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT $ 68)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 65))
                                     . #2#))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| $)
                                    . #2#)
                              (GO #1#))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #1# (EXIT #1#)))) 

(SDEFUN |SMP;ground?;$B;16| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) 'T) ('T 'NIL))) 

(SDEFUN |SMP;monomial;$VarSetNni$;17|
        ((|p| $) (|mvar| |VarSet|) (|k1| |NonNegativeInteger|) ($ $))
        (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT $ 17))) |p|)
              ((OR (QEQCAR |p| 0)
                   (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)))
               (CONS 1 (CONS |mvar| (SPADCALL |p| |k1| (QREFELT $ 27)))))
              ('T
               (SPADCALL |p|
                         (CONS 1
                               (CONS |mvar|
                                     (SPADCALL (|spadConstant| $ 14) |k1|
                                               (QREFELT $ 27))))
                         (QREFELT $ 70))))) 

(SDEFUN |SMP;monomial;RIe$;18|
        ((|c| R) (|e| |IndexedExponents| |VarSet|) ($ $))
        (SPROG ((|m1| (D)) (|p1| ($)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 72)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT $ 73))
                                        (QREFELT $ 74))
                              . #1=(|SMP;monomial;RIe$;18|))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT $ 75))
                                        (QREFELT $ 27))
                              . #1#)
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT $ 76)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;$IeR;19|
        ((|p| $) (|e| |IndexedExponents| |VarSet|) ($ R))
        (SPROG ((|vp| (|VarSet|)) (|ve| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |e| (QREFELT $ 72))
                  (COND ((QEQCAR |p| 0) (QCDR |p|))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77)) |e|
                          (QREFELT $ 78)))))
                 ((QEQCAR |p| 0) (QCDR (|spadConstant| $ 12)))
                 (#1#
                  (SEQ
                   (LETT |ve| (SPADCALL |e| (QREFELT $ 76))
                         . #2=(|SMP;coefficient;$IeR;19|))
                   (LETT |vp| (QCAR (QCDR |p|)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |ve| |vp| (QREFELT $ 54))
                      (SPADCALL (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77))
                                |e| (QREFELT $ 78)))
                     ((SPADCALL |ve| |vp| (QREFELT $ 68))
                      (QCDR (|spadConstant| $ 12)))
                     (#1#
                      (SPADCALL
                       (SPADCALL (QCDR (QCDR |p|))
                                 (SPADCALL |e| (QREFELT $ 75)) (QREFELT $ 77))
                       (SPADCALL |e| (QREFELT $ 73)) (QREFELT $ 78))))))))))) 

(SDEFUN |SMP;coerce;I$;20| ((|n| |Integer|) ($ $))
        (CONS 0 (SPADCALL |n| (QREFELT $ 80)))) 

(PUT '|SMP;coerce;R$;21| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R$;21| ((|c| R) ($ $)) (CONS 0 |c|)) 

(SDEFUN |SMP;characteristic;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 83))) 

(SDEFUN |SMP;recip;$U;23| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ
                   (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT $ 86))
                         |SMP;recip;$U;23|)
                   (EXIT
                    (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                          (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2$;24| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 89))))))) 

(SDEFUN |SMP;*;I2$;25| ((|n| |Integer|) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 91))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;I2$;25|))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 92))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 21))
                          (SPADCALL |up| (QREFELT $ 22)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2$;26| ((|c| R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| $ 14)) (QREFELT $ 18))
                  |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT $ 94))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;R2$;26|))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT $ 59))
                             . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 21))
                          (SPADCALL |up| (QREFELT $ 22)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3$;27| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 96))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 60)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 97))
                                         (QREFELT $ 60)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 55))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;+;3$;27|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 60))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 21))
                             (SPADCALL |up| (QREFELT $ 22)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 54))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 60)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 97))
                                           (QREFELT $ 60)))))))))))) 

(SDEFUN |SMP;-;3$;28| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT $ 98))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                         (QCDR (QCDR |p2|)) (QREFELT $ 99)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT $ 97))
                                         (QREFELT $ 99)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 55))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;-;3$;28|))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT $ 99))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT $ 21))
                             (SPADCALL |up| (QREFELT $ 22)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT $ 54))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT $ 99)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT $ 97))
                                           (QREFELT $ 99)))))))))))) 

(SDEFUN |SMP;=;2$B;29| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 18)))
           (#1='T 'NIL)))
         ((QEQCAR |p2| 0) 'NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 101)))
           (#1# 'NIL))))) 

(SDEFUN |SMP;*;3$;30| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 95)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1=(|SMP;*;3$;30|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 103))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 21))
                          (SPADCALL |up| (QREFELT $ 22)))
                         (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#2#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 55))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT $ 104))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 21))
                            (SPADCALL |up| (QREFELT $ 22)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT $ 103))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 21))
                            (SPADCALL |up| (QREFELT $ 22)))
                           (#2# (CONS 1 (CONS |mvar| |up|)))))))
                   (#2#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)) . #1#)
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT $ 59))
                               . #1#)
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT $ 21))
                            (SPADCALL |up| (QREFELT $ 22)))
                           (#2# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;^;$Pi$;31| ((|p| $) (|kp| |PositiveInteger|) ($ $))
        (SPADCALL |p| |kp| (QREFELT $ 105))) 

(SDEFUN |SMP;^;$Nni$;32| ((|p| $) (|k| |NonNegativeInteger|) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL (QCDR |p|) |k| (QREFELT $ 108))))
                 ((NULL (|SMP;moreThanOneVariable?| |p| $))
                  (SPADCALL
                   (SPADCALL (|SMP;univariateKnown| |p| $) |k| (QREFELT $ 109))
                   (QCAR (QCDR |p|)) (QREFELT $ 52)))
                 ('T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #1=(|SMP;^;$Nni$;32|))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p|)) |k| (QREFELT $ 110))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 21))
                          (SPADCALL |up| (QREFELT $ 22)))
                         ('T (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;hashUpdate!;Hs$Hs;33| ((|s| |HashState|) (|p| $) ($ |HashState|))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT $ 112)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT $ 113))
                       |SMP;hashUpdate!;Hs$Hs;33|)
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT $ 114)))))))) 

(SDEFUN |SMP;unitNormal;$R;34|
        ((|p| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G61|
           #2=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G60| #2#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G60| (SPADCALL (QCDR |p|) (QREFELT $ 117))
                    . #3=(|SMP;unitNormal;$R;34|))
              (LETT |u| (QVELT |#G60| 0) . #3#)
              (LETT |c| (QVELT |#G60| 1) . #3#)
              (LETT |a| (QVELT |#G60| 2) . #3#)
              |#G60|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G61|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 117))
                    . #3#)
              (LETT |u| (QVELT |#G61| 0) . #3#)
              (LETT |c| (QVELT |#G61| 1) . #3#)
              (LETT |a| (QVELT |#G61| 2) . #3#)
              |#G61|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT $ 95))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2$;35| ((|p| $) ($ $))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G66|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 119))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G66|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 38))
                                   (QREFELT $ 117))
                         . #1=(|SMP;unitCanonical;2$;35|))
                   (LETT |u| (QVELT |#G66| 0) . #1#)
                   (LETT |c| (QVELT |#G66| 1) . #1#)
                   (LETT |a| (QVELT |#G66| 2) . #1#)
                   |#G66|)
                  (EXIT (SPADCALL |a| |p| (QREFELT $ 95))))))))) 

(SDEFUN |SMP;unit?;$B;36| ((|p| $) ($ |Boolean|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 121))) ('T 'NIL))) 

(SDEFUN |SMP;associates?;2$B;37| ((|p1| $) (|p2| $) ($ |Boolean|))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 123)))
           (#1='T 'NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 124)))
           (#1# 'NIL)))
         (#1# 'NIL))) 

(SDEFUN |SMP;exquo;2$U;38| ((|p1| $) (|p2| $) ($ |Union| $ "failed"))
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
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 126))
                      . #1=(|SMP;exquo;2$U;38|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 17))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 102)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 54))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 97))
                                  (QREFELT $ 127))
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
                ((SPADCALL |p1| |p2| (QREFELT $ 102))
                 (CONS 0 (|spadConstant| $ 14)))
                (#2#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT $ 127))
                        . #1#)
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#2#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                               (LETT |up| (QCDR |a|) . #1#)
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 66))
                                  (CONS 0 (SPADCALL |up| (QREFELT $ 64))))
                                 (#2#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

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
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 126))
                      . #1=(|SMP;exquo;2$U;39|))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT $ 17))
                 (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 102)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT $ 54))
                       (EXIT (CONS 1 #3#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT $ 97))
                                  (QREFELT $ 127))
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
                              (QREFELT $ 127))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                           (LETT |up| (QCDR |a|) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 66))
                              (CONS 0 (SPADCALL |up| (QREFELT $ 64))))
                             (#2#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2$;40| ((|fn| |Mapping| R R) (|p| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ
                        (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;map;M2$;40|))
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;map;M2$;40!0| (VECTOR $ |fn|))
                               (QCDR (QCDR |p|)) (QREFELT $ 132))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 21))
                           (SPADCALL |up| (QREFELT $ 22)))
                          (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2$;40!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| $)
          (LETT |fn| (QREFELT $$ 1) . #1=(|SMP;map;M2$;40|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT $ 130)))))) 

(SDEFUN |SMP;/;$R$;41| ((|p| $) (|r| R) ($ $))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT $ 133))) |p| (QREFELT $ 70))) 

(SDEFUN |SMP;content;$R;42| ((|p| $) ($ R))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ
                        (LETT |c| (QCDR (|spadConstant| $ 12))
                              . #1=(|SMP;content;$R;42|))
                        (LETT |up| (QCDR (QCDR |p|)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((OR (SPADCALL |up| (QREFELT $ 135))
                                      (SPADCALL |c|
                                                (QCDR (|spadConstant| $ 14))
                                                (QREFELT $ 18)))
                                  'NIL)
                                 ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (LETT |c|
                                    (SPADCALL |c|
                                              (SPADCALL
                                               (SPADCALL |up| (QREFELT $ 22))
                                               (QREFELT $ 136))
                                              (QREFELT $ 137))
                                    . #1#)
                              (EXIT
                               (LETT |up| (SPADCALL |up| (QREFELT $ 20))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |c|))))))) 

(SDEFUN |SMP;content;$VarSet$;43| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;44| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 54))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;44|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 21))
                        (SPADCALL |up| (QREFELT $ 22)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;45|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G403 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;45|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 62))
                                  (SPADCALL |monb| (QREFELT $ 62)))
                             (QREFELT $ 27))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 62))
                    (SPADCALL |b| (QREFELT $ 62)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#5='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#5# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;46| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 24))
                (QREFELT $ 150))))) 

(SDEFUN |SMP;gcd;3$;47| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 151))) 

(SDEFUN |SMP;gcd;L$;48| ((|lp| |List| $) ($ $)) (SPADCALL |lp| (QREFELT $ 150))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;49|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |a| |b| (QREFELT $ 154))) 

(SDEFUN |SMP;content;$VarSet$;50| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;51| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 54))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;51|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 21))
                        (SPADCALL |up| (QREFELT $ 22)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;52|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G435 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;52|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 62))
                                  (SPADCALL |monb| (QREFELT $ 62)))
                             (QREFELT $ 27))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 62))
                    (SPADCALL |b| (QREFELT $ 62)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#5='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#5# |mong|))))))))) 

(SDEFUN |SMP;content;$VarSet$;53| ((|p| $) (|mvar| |VarSet|) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58))
                         (QREFELT $ 138))))) 

(SDEFUN |SMP;gcd;3$;54| ((|p1| $) (|p2| $) ($ $))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 137))))
                   ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT $ 138))
                                   (QREFELT $ 140)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 54))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 138))
                              (QREFELT $ 140)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT $ 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 138))
                              |p2| (QREFELT $ 140)))
                   (#1#
                    (SEQ
                     (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;54|))
                     (LETT |up|
                           (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                     (QREFELT $ 141))
                           . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |up| (QREFELT $ 21))
                        (SPADCALL |up| (QREFELT $ 22)))
                       (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;55|
        ((|a| . #1=(|SparseUnivariatePolynomial| $)) (|b| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| $)) (#2=#:G463 NIL)
          (|monb| (|SparseUnivariatePolynomial| $)) (|contb| ($))
          (|mona| (|SparseUnivariatePolynomial| $)) (|conta| ($)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT $ 66))
            (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                              (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           ((SPADCALL |b| (QREFELT $ 66))
            (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                              (SPADCALL |a| (QREFELT $ 142)) (QREFELT $ 140))
                    (QREFELT $ 143)))))
           (#3#
            (SEQ
             (LETT |conta| (SPADCALL |a| (QREFELT $ 142))
                   . #4=(|SMP;gcdPolynomial;3Sup;55|))
             (LETT |mona|
                   (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |a|
                     (PROG2
                         (LETT #2# (SPADCALL |a| |mona| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |contb| (SPADCALL |b| (QREFELT $ 142)) . #4#)
             (LETT |monb|
                   (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 144))
                             (QREFELT $ 27))
                   . #4#)
             (COND
              ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 145))
               (LETT |b|
                     (PROG2
                         (LETT #2# (SPADCALL |b| |monb| (QREFELT $ 146)) . #4#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0)
                                      (|SparseUnivariatePolynomial| $) #2#))
                     . #4#)))
             (LETT |mong|
                   (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 140))
                             (MIN (SPADCALL |mona| (QREFELT $ 62))
                                  (SPADCALL |monb| (QREFELT $ 62)))
                             (QREFELT $ 27))
                   . #4#)
             (EXIT
              (COND
               ((>= (SPADCALL |a| (QREFELT $ 62))
                    (SPADCALL |b| (QREFELT $ 62)))
                (COND
                 ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 146)) 1))
                  (SPADCALL |mong| |b| (QREFELT $ 147)))
                 (#5='T |mong|)))
               ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 146)) 1))
                (SPADCALL |mong| |a| (QREFELT $ 147)))
               (#5# |mong|))))))))) 

(SDEFUN |SMP;coerce;$Of;56| ((|p| $) ($ |OutputForm|))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 156)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 157))
                         (QREFELT $ 158))))) 

(SDEFUN |SMP;coefficients;$L;57| ((|p| $) ($ |List| R))
        (SPROG
         ((#1=#:G480 NIL) (#2=#:G479 #3=(|List| R)) (#4=#:G481 #3#)
          (#5=#:G483 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 161)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|SMP;coefficients;$L;57|))
                  (SEQ (LETT |p1| NIL . #7#)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |p1| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT $ 162)) . #7#)
                          (COND (#1# (LETT #2# (APPEND #2# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;$R;58| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;$U;59| ((|p| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| |List| |VarSet|) (|m| |List| |VarSet|) ($ |List| |VarSet|))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 55))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT $ 168)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) $)
                             (QREFELT $ 168))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 68))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT $ 168)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| $)
                             (QREFELT $ 168))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT $ 168)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) $) (QREFELT $ 168))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;$L;61| ((|p| $) ($ |List| |VarSet|))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL . #1=(|SMP;variables;$L;61|))
                            (LETT |q| (QCDR (QCDR |p|)) . #1#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((SPADCALL |q| (QREFELT $ 135)) 'NIL)
                                          ('T 'T)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT $ 22))
                                          (QREFELT $ 169))
                                         $)
                                        . #1#)
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT $ 20))
                                         . #1#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;$U;62| ((|p| $) ($ |Union| |VarSet| "failed"))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;$VarSet2$;63| ((|p| $) (|mvar| |VarSet|) (|pval| $) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) |pval| (QREFELT $ 172))) 

(SDEFUN |SMP;eval;$VarSetR$;64| ((|p| $) (|mvar| |VarSet|) (|val| R) ($ $))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (CONS 0 |val|)
                  (QREFELT $ 172))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG ((|pts| (D)) (|pval| ($)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT $ 175))))
                  |p|)
                 ('T
                  (SEQ
                   (LETT |mvar| (|SPADfirst| |Lvar|)
                         . #1=(|SMP;evalSortedVarlist|))
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68))
                      (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                       (SPADCALL |Lpval| '|rest| (QREFELT $ 177)) $))
                     (#2='T
                      (SEQ
                       (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 179))
                             . #1#)
                       (LETT |pts|
                             (SPADCALL
                              (CONS #'|SMP;evalSortedVarlist!0|
                                    (VECTOR $ |Lpval| |Lvar|))
                              (QCDR (QCDR |p|)) (QREFELT $ 132))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
                          (COND
                           ((QEQCAR |pval| 0)
                            (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                      (QREFELT $ 172)))
                           (#2# (SPADCALL |pts| |pval| (QREFELT $ 172)))))
                         (#2#
                          (SPADCALL |pts| (QCAR (QCDR |p|))
                                    (QREFELT $ 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| $)
          (LETT |Lvar| (QREFELT $$ 2) . #1=(|SMP;evalSortedVarlist|))
          (LETT |Lpval| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| $))))) 

(SDEFUN |SMP;eval;$LL$;66|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lpval| |List| $) ($ $))
        (SPROG
         ((|nlpval| (|List| $)) (#1=#:G540 NIL) (|mvar| NIL) (#2=#:G539 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 181)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| $))
           ('T
            (SEQ
             (LETT |nlvar| (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 182))
                   . #3=(|SMP;eval;$LL$;66|))
             (LETT |nlpval|
                   (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 183)) |Lpval|)
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
                                                                            184))
                                                         (QREFELT $ 185))
                                               #2#)
                                              . #3#)))
                                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                . #3#)))
                   . #3#)
             (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| $)))))))) 

(SDEFUN |SMP;eval;$LL$;67|
        ((|p| $) (|Lvar| |List| |VarSet|) (|Lval| |List| R) ($ $))
        (SPROG ((#1=#:G544 NIL) (|val| NIL) (#2=#:G543 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #2# NIL . #3=(|SMP;eval;$LL$;67|))
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
                          (QREFELT $ 186))))) 

(SDEFUN |SMP;degree;$VarSetNni;68|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22)) |mvar|
                          (QREFELT $ 188))
                (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 188)))))) 

(SDEFUN |SMP;degree;$LL;69|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G554 NIL) (|mvar| NIL) (#2=#:G553 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;degree;$LL;69|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 188)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;$Ie;70| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 191))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                          (QREFELT $ 192))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41))
                          (QCAR (QCDR |p|)) (QREFELT $ 193))
                (QREFELT $ 194))))) 

(SDEFUN |SMP;minimumDegree;$Ie;71| ((|p| $) ($ |IndexedExponents| |VarSet|))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 191))
                      ('T
                       (SEQ
                        (LETT |md| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 195))
                              |SMP;minimumDegree;$Ie;71|)
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT $ 77))
                           (QREFELT $ 196))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT $ 193))
                          (QREFELT $ 194))))))))) 

(SDEFUN |SMP;minimumDegree;$VarSetNni;72|
        ((|p| $) (|mvar| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|p1| ($)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 195)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                               |mvar| (QREFELT $ 197))
                              . #2=(|SMP;minimumDegree;$VarSetNni;72|))
                        (LETT |p1| (|SMP;red| |p| $) . #2#)
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT $ 17)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT $ 197)))))))))))) 

(SDEFUN |SMP;minimumDegree;$LL;73|
        ((|p| $) (|Lvar| |List| |VarSet|) ($ |List| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G573 NIL) (|mvar| NIL) (#2=#:G572 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;minimumDegree;$LL;73|))
                 (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT $ 197)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;74| ((|p| $) (|mvar| |VarSet|) ($ $))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
                       (SEQ
                        (LETT |up| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 199))
                              . #1=(|SMP;differentiate;$VarSet$;74|))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 21))
                           (SPADCALL |up| (QREFELT $ 22)))
                          (#2='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#2#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;$VarSet$;74!0|
                                     (VECTOR $ |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT $ 132))
                              . #1#)
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT $ 21))
                           (SPADCALL |up| (QREFELT $ 22)))
                          (#2# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;$VarSet$;74!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| $)
          (LETT |mvar| (QREFELT $$ 1) . #1=(|SMP;differentiate;$VarSet$;74|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT $ 200)))))) 

(SDEFUN |SMP;leadingCoefficient;$R;75| ((|p| $) ($ R))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                         (QREFELT $ 38))))) 

(SDEFUN |SMP;leadingMonomial;2$;76| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                          (QREFELT $ 201))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41))
                (QREFELT $ 56))))) 

(SDEFUN |SMP;reductum;2$;77| ((|p| $) ($ $))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
              ('T
               (SPADCALL |p| (SPADCALL |p| (QREFELT $ 201)) (QREFELT $ 100))))) 

(SDEFUN |SMP;monomials1|
        ((|p| |VPoly|) (|vars| . #1=(|List| |VarSet|))
         (|degs| . #2=(|List| (|NonNegativeInteger|))) (|res| |List| $)
         ($ |List| $))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| ($))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| $)))
          (#5=#:G601 NIL) (|var| NIL) (#6=#:G602 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| ($)) (#7=#:G600 NIL) (|t| NIL) (|v1| (|VarSet|))
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
                                   ((SPADCALL |k1| 0 (QREFELT $ 203))
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
                             (LETT |res| (SPADCALL |mon| |res| (QREFELT $ 204))
                                   . #8#))))
                          ('T
                           (SEQ
                            (LETT |vars1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 203))
                                    (CONS |v1| |vars|))
                                   ('T |vars|))
                                  . #8#)
                            (LETT |degs1|
                                  (COND
                                   ((SPADCALL |k1| 0 (QREFELT $ 203))
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

(SDEFUN |SMP;monomials;$L;79| ((|p| $) ($ |List| $))
        (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 102)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL $)
                         (QREFELT $ 205))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G632)
  (SPROG NIL
         (PROG (#2=#:G633)
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
   ((#1=#:G631 NIL) (|pv$| NIL) (#2=#:G628 NIL) (#3=#:G629 NIL) (#4=#:G630 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|SparseMultivariatePolynomial|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 236) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Integer|))))
                                        (AND
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
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
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
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #3# #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #5#)
                                        (OR #3# #4# #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4# #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #4# #2#) (OR #4# #2#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #4# #2#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 536870912))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #5#)
     (|augmentPredVector| $ 1073741824))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #4# (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|SparseUnivariatePolynomial| $))
    (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
    (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
    (COND
     ((|testBitVector| |pv$| 24)
      (PROGN
       (QSETREFV $ 118 (CONS (|dispatchFunction| |SMP;unitNormal;$R;34|) $))
       (QSETREFV $ 120 (CONS (|dispatchFunction| |SMP;unitCanonical;2$;35|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SMP;unit?;$B;36|) $))
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SMP;associates?;2$B;37|) $))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV $ 128 (CONS (|dispatchFunction| |SMP;exquo;2$U;38|) $)))
        ('T
         (QSETREFV $ 128 (CONS (|dispatchFunction| |SMP;exquo;2$U;39|) $)))))))
    (COND
     ((|testBitVector| |pv$| 20)
      (QSETREFV $ 134 (CONS (|dispatchFunction| |SMP;/;$R$;41|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 136 (CONS (|dispatchFunction| |SMP;content;$R;42|) $))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 12)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 139
                       (CONS (|dispatchFunction| |SMP;content;$VarSet$;43|) $))
             (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;44|) $))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV $ 148
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;45|)
                               $))))))))
         ('T
          (PROGN
           (QSETREFV $ 139
                     (CONS (|dispatchFunction| |SMP;content;$VarSet$;46|) $))
           (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;47|) $))
           (QSETREFV $ 153 (CONS (|dispatchFunction| |SMP;gcd;L$;48|) $))
           (QSETREFV $ 148
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;49|)
                           $))))))
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 139
                   (CONS (|dispatchFunction| |SMP;content;$VarSet$;50|) $))
         (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;51|) $))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV $ 148
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;52|)
                           $))))))))
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMP;content;$VarSet$;53|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |SMP;gcd;3$;54|) $))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV $ 148
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;55|)
                         $)))))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 200
                (CONS (|dispatchFunction| |SMP;differentiate;$VarSet$;74|)
                      $))))
    $))) 

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;One;$;2|) $))
              (|Boolean|) (8 . |zero?|) |SMP;zero?;$B;3| (13 . =)
              |SMP;one?;$B;4| (19 . |reductum|) (24 . |ground?|)
              (29 . |leadingCoefficient|) (|List| $$) (34 . |coefficients|)
              (|NonNegativeInteger|) |SMP;numberOfMonomials;$Nni;6|
              (39 . |monomial|) |SMP;coerce;VarSet$;7| (45 . |One|)
              (49 . |numberOfMonomials|) (54 . ~=) |SMP;monomial?;$B;8|
              |SMP;ground?;$B;16| (60 . |false|) (64 . |true|)
              (|Mapping| 15 $$) (68 . |any?|) |SMP;leadingCoefficient;$R;75|
              (|SparseUnivariatePolynomial| 6) (74 . |coerce|) (79 . |degree|)
              (84 . |monomial|) (90 . +) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 39) (96 . |map|)
              |SMP;univariate;$Sup;11| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet$;12| |SMP;+;3$;27| (122 . <)
              (128 . =) |SMP;monomial;$VarSetNni$;17|
              (|SparseUnivariatePolynomial| $) |SMP;univariate;$VarSetSup;13|
              (134 . *) (140 . +) (|SparseUnivariatePolynomial| $$)
              (146 . |degree|) (151 . |coefficient|)
              (157 . |leadingCoefficient|) (162 . |reductum|) (167 . |ground?|)
              (172 . |zero?|) (177 . >) |SMP;multivariate;SupVarSet$;15|
              |SMP;*;3$;30| (|IndexedExponents| 7) (183 . |zero?|)
              (188 . |reductum|) |SMP;monomial;RIe$;18|
              (193 . |leadingCoefficient|) (198 . |leadingSupport|)
              (203 . |coefficient|) |SMP;coefficient;$IeR;19| (|Integer|)
              (209 . |coerce|) |SMP;coerce;I$;20| |SMP;coerce;R$;21|
              (214 . |characteristic|) |SMP;characteristic;Nni;22|
              (|Union| $ '"failed") (218 . |recip|) |SMP;recip;$U;23| (223 . -)
              (228 . -) |SMP;-;2$;24| (233 . *) (239 . *) |SMP;*;I2$;25|
              (245 . *) |SMP;*;R2$;26| (251 . +) (257 . |coerce|) (262 . -)
              (268 . -) |SMP;-;3$;28| (274 . =) |SMP;=;2$B;29| (280 . *)
              (286 . *) |SMP;^;$Nni$;32| (|PositiveInteger|) |SMP;^;$Pi$;31|
              (292 . ^) (298 . ^) (304 . ^) (|HashState|) (310 . |hashUpdate!|)
              (316 . |hashUpdate!|) (322 . |hashUpdate!|)
              |SMP;hashUpdate!;Hs$Hs;33|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (328 . |unitNormal|) (333 . |unitNormal|) (338 . |unitCanonical|)
              (343 . |unitCanonical|) (348 . |unit?|) (353 . |unit?|)
              (358 . |associates?|) (364 . |associates?|) (370 . |associates?|)
              (376 . |exquo|) (382 . |exquo|) (388 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2$;40| (|Mapping| $$ $$) (394 . |map|) (400 . |inv|)
              (405 . /) (411 . |zero?|) (416 . |content|) (421 . |gcd|)
              (427 . |content|) (432 . |content|) (438 . |gcd|) (444 . |gcd|)
              (450 . |content|) (455 . |coerce|) (460 . |minimumDegree|)
              (465 . ~=) (471 . |exquo|) (477 . *) (483 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 71 7 6 $$) (489 . |gcd|) (494 . |gcd|)
              (|List| $) (500 . |gcd|) (505 . |gcd|) (|OutputForm|)
              (511 . |coerce|) (516 . |coerce|) (521 . |outputForm|)
              |SMP;coerce;$Of;56| (|List| 6) (527 . |list|)
              |SMP;coefficients;$L;57| (532 . |nil|) |SMP;retract;$R;58|
              (|Union| 6 '"failed") |SMP;retractIfCan;$U;59| (|List| 7)
              (536 . |setrest!|) |SMP;variables;$L;61| (|Union| 7 '"failed")
              |SMP;mainVariable;$U;62| (542 . |elt|) |SMP;eval;$VarSet2$;63|
              |SMP;eval;$VarSetR$;64| (548 . |empty?|) '"rest" (553 . |elt|)
              '"first" (559 . |elt|) (|Mapping| 15 7 7) (565 . |sorted?|)
              (571 . |sort|) (577 . =) (583 . |position|) (589 . |elt|)
              |SMP;eval;$LL$;66| |SMP;eval;$LL$;67| |SMP;degree;$VarSetNni;68|
              (|List| 25) |SMP;degree;$LL;69| (595 . |Zero|)
              |SMP;degree;$Ie;70| (599 . |monomial|) (605 . +)
              (611 . |minimumDegree|) |SMP;minimumDegree;$Ie;71|
              |SMP;minimumDegree;$VarSetNni;72| |SMP;minimumDegree;$LL;73|
              (616 . |differentiate|) (621 . |differentiate|)
              |SMP;leadingMonomial;2$;76| |SMP;reductum;2$;77| (627 . >)
              (633 . |cons|) (639 . |reverse!|) |SMP;monomials;$L;79|
              (|Union| 219 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 79)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 79 $)
              (|Fraction| 79)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Matrix| 79)
              (|Record| (|:| |mat| 217) (|:| |vec| (|Vector| 79))) (|Vector| $)
              (|Factored| 57) (|Union| 222 '#1#) (|List| 57)
              (|Union| 214 '#2="failed") (|Union| 79 '#2#)
              (|Record| (|:| |var| 7) (|:| |exponent| 25))
              (|Union| 225 '#3="failed") (|Union| 152 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Equation| $)
              (|List| 229) (|Mapping| 71 71)
              (|Record| (|:| |mat| 233) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|String|) (|SingleInteger|))
           '#(~= 644 |zero?| 650 |variables| 655 |univariate| 660 |unitNormal|
              671 |unitCanonical| 676 |unit?| 681 |totalDegreeSorted| 686
              |totalDegree| 692 |subtractIfCan| 703 |squareFreePolynomial| 709
              |squareFreePart| 714 |squareFree| 719
              |solveLinearPolynomialEquation| 724 |smaller?| 730 |sample| 736
              |retractIfCan| 740 |retract| 760 |resultant| 780 |reductum| 787
              |reducedSystem| 792 |recip| 814 |primitivePart| 819
              |primitiveMonomials| 830 |prime?| 835 |pomopo!| 840
              |patternMatch| 848 |opposite?| 862 |one?| 868 |numberOfMonomials|
              873 |multivariate| 878 |monomials| 890 |monomial?| 895 |monomial|
              900 |monicDivide| 920 |minimumDegree| 927 |mapExponents| 944
              |map| 950 |mainVariable| 956 |leadingMonomial| 961
              |leadingCoefficient| 966 |lcmCoef| 971 |lcm| 977 |latex| 988
              |isTimes| 993 |isPlus| 998 |isExpt| 1003 |hashUpdate!| 1008
              |hash| 1014 |ground?| 1019 |ground| 1024 |gcdPolynomial| 1029
              |gcd| 1035 |factorSquareFreePolynomial| 1046 |factorPolynomial|
              1051 |factor| 1056 |exquo| 1061 |eval| 1073 |discriminant| 1127
              |differentiate| 1133 |degree| 1159 |convert| 1176 |content| 1191
              |conditionP| 1202 |coerce| 1207 |coefficients| 1237 |coefficient|
              1242 |charthRoot| 1262 |characteristic| 1267 |binomThmExpt| 1271
              |associates?| 1278 |annihilate?| 1284 ^ 1290 |Zero| 1302 |One|
              1306 D 1310 = 1336 / 1342 - 1348 + 1359 * 1365)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 1 0 1 0 4 26 0 28 3 10 23 0 0 25 28 10 11
                                  12 23 13 18 0 0 10 29 0 0 0 0 22 10 10 0 0 0
                                  0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0 0 0 0 0 27 2
                                  7 8 9 14 15 16))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL |Rng&| NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 214) (|Algebra| 6)
                 (|PartialDifferentialRing| 7) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 214)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 79) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 214 214) (|BiModule| $$ $$)
                 (|Rng|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 214) (|RightModule| 214)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 79) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 7)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 155) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 210) (|ConvertibleTo| 211)
                 (|ConvertibleTo| 209) (|RetractableTo| 214)
                 (|RetractableTo| 79) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 235
                                  '(0 6 0 11 0 6 0 13 1 6 15 0 16 2 6 15 0 0 18
                                    1 8 0 0 20 1 8 15 0 21 1 8 2 0 22 1 8 23 0
                                    24 2 8 0 2 25 27 0 8 0 29 1 8 25 0 30 2 25
                                    15 0 0 31 0 15 0 34 0 15 0 35 2 23 15 36 0
                                    37 1 39 0 6 40 1 8 25 0 41 2 39 0 6 25 42 2
                                    39 0 0 0 43 2 45 39 44 8 46 1 39 15 0 48 1
                                    39 6 0 49 1 39 25 0 50 1 39 0 0 51 2 7 15 0
                                    0 54 2 7 15 0 0 55 2 8 0 2 0 59 2 8 0 0 0
                                    60 1 61 25 0 62 2 61 2 0 25 63 1 61 2 0 64
                                    1 61 0 0 65 1 61 15 0 66 1 61 15 0 67 2 7
                                    15 0 0 68 1 71 15 0 72 1 71 0 0 73 1 71 25
                                    0 75 1 71 7 0 76 2 8 2 0 25 77 1 6 0 79 80
                                    0 6 25 83 1 6 85 0 86 1 6 0 0 88 1 8 0 0 89
                                    2 6 0 79 0 91 2 8 0 79 0 92 2 6 0 0 0 94 2
                                    6 0 0 0 96 1 8 0 2 97 2 6 0 0 0 98 2 8 0 0
                                    0 99 2 8 15 0 0 101 2 8 0 0 2 103 2 8 0 0 0
                                    104 2 6 0 0 25 108 2 39 0 0 25 109 2 8 0 0
                                    25 110 2 6 111 111 0 112 2 7 111 111 0 113
                                    2 8 111 111 0 114 1 6 116 0 117 1 0 116 0
                                    118 1 6 0 0 119 1 0 0 0 120 1 6 15 0 121 1
                                    0 15 0 122 2 6 15 0 0 123 2 8 15 0 0 124 2
                                    0 15 0 0 125 2 6 85 0 0 126 2 8 85 0 0 127
                                    2 0 85 0 0 128 2 8 0 131 0 132 1 6 0 0 133
                                    2 0 0 0 6 134 1 8 15 0 135 1 0 6 0 136 2 6
                                    0 0 0 137 1 8 2 0 138 2 0 0 0 7 139 2 0 0 0
                                    0 140 2 8 0 0 0 141 1 61 2 0 142 1 61 0 2
                                    143 1 61 25 0 144 2 61 15 0 0 145 2 61 85 0
                                    0 146 2 61 0 0 0 147 2 0 57 57 57 148 1 149
                                    2 23 150 2 149 2 2 2 151 1 0 0 152 153 2
                                    149 61 61 61 154 1 6 155 0 156 1 7 155 0
                                    157 2 8 155 0 155 158 1 160 0 6 161 0 23 0
                                    163 2 167 0 0 0 168 2 8 2 0 2 172 1 23 15 0
                                    175 2 23 0 0 176 177 2 23 2 0 178 179 2 167
                                    15 180 0 181 2 167 0 180 0 182 2 167 15 0 0
                                    183 2 167 79 7 0 184 2 23 2 0 79 185 0 71 0
                                    191 2 71 0 25 7 193 2 71 0 0 0 194 1 8 25 0
                                    195 1 8 0 0 199 2 0 0 0 7 200 2 25 15 0 0
                                    203 2 23 0 2 0 204 1 23 0 0 205 2 0 15 0 0
                                    1 1 0 15 0 17 1 0 167 0 169 1 0 39 0 47 2 0
                                    57 0 7 58 1 33 116 0 118 1 33 0 0 120 1 33
                                    15 0 122 2 0 25 0 167 1 1 0 25 0 1 2 0 25 0
                                    167 1 2 0 85 0 0 1 1 1 220 57 1 1 3 0 0 1 1
                                    3 216 0 1 2 1 221 222 57 1 2 17 15 0 0 1 0
                                    0 0 1 1 14 223 0 1 1 15 224 0 1 1 0 170 0 1
                                    1 0 165 0 166 1 14 214 0 1 1 15 79 0 1 1 0
                                    7 0 1 1 0 6 0 164 3 21 0 0 0 7 1 1 0 0 0
                                    202 1 18 217 208 1 2 18 218 208 219 1 2 0
                                    232 208 219 1 1 0 233 208 1 1 0 85 0 87 2 3
                                    0 0 7 1 1 3 0 0 1 1 0 152 0 1 1 1 15 0 1 4
                                    0 0 0 6 71 0 1 3 5 212 0 210 212 1 3 6 213
                                    0 211 213 1 2 0 15 0 0 1 1 0 15 0 19 1 0 25
                                    0 26 2 0 0 39 7 52 2 0 0 57 7 69 1 0 152 0
                                    206 1 0 15 0 32 2 0 0 6 71 74 3 0 0 0 7 25
                                    56 3 0 0 0 167 189 1 3 0 228 0 0 7 1 2 0
                                    189 0 167 198 2 0 25 0 7 197 1 0 71 0 196 2
                                    0 0 231 0 1 2 0 0 129 0 130 1 0 170 0 171 1
                                    0 0 0 201 1 0 6 0 38 2 3 215 0 0 1 2 3 0 0
                                    0 1 1 3 0 152 1 1 0 234 0 1 1 0 227 0 1 1 0
                                    227 0 1 1 0 226 0 1 2 0 111 111 0 115 1 0
                                    235 0 1 1 0 15 0 33 1 0 6 0 1 2 3 57 57 57
                                    148 1 3 0 152 153 2 3 0 0 0 140 1 1 220 57
                                    1 1 1 220 57 1 1 1 216 0 1 2 33 85 0 0 128
                                    2 2 85 0 6 1 3 0 0 0 7 0 173 3 0 0 0 167
                                    152 186 3 0 0 0 7 6 174 3 0 0 0 167 160 187
                                    3 0 0 0 152 152 1 2 0 0 0 229 1 3 0 0 0 0 0
                                    1 2 0 0 0 230 1 2 21 0 0 7 1 3 0 0 0 7 25 1
                                    3 0 0 0 167 189 1 2 0 0 0 7 200 2 0 0 0 167
                                    1 1 0 71 0 192 2 0 25 0 7 188 2 0 189 0 167
                                    190 1 9 209 0 1 1 7 210 0 1 1 8 211 0 1 2 3
                                    0 0 7 139 1 3 6 0 136 1 31 207 208 1 1 34 0
                                    0 1 1 19 0 214 1 1 0 0 7 28 1 0 0 6 82 1 0
                                    0 79 81 1 0 155 0 159 1 0 160 0 162 2 0 6 0
                                    71 78 3 0 0 0 7 25 1 3 0 0 0 167 189 1 1 32
                                    85 0 1 0 0 25 84 3 30 0 0 0 25 1 2 33 15 0
                                    0 125 2 0 15 0 0 1 2 0 0 0 25 105 2 0 0 0
                                    106 107 0 0 0 12 0 0 0 14 3 0 0 0 7 25 1 3
                                    0 0 0 167 189 1 2 0 0 0 7 1 2 0 0 0 167 1 2
                                    0 15 0 0 102 2 20 0 0 6 134 2 0 0 0 0 100 1
                                    0 0 0 90 2 0 0 0 0 53 2 10 0 0 214 1 2 10 0
                                    214 0 1 2 0 0 0 6 1 2 0 0 6 0 95 2 0 0 0 0
                                    70 2 0 0 79 0 93 2 0 0 25 0 1 2 0 0 106 0
                                    1)))))
           '|lookupComplete|)) 
