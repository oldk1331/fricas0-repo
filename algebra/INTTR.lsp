
(SDEFUN |INTTR;logprmderiv|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) ($ |Fraction| UP))
        (SPADCALL (SPADCALL |f| |derivation| (QREFELT $ 12)) |f|
                  (QREFELT $ 13))) 

(SDEFUN |INTTR;UP2UP2| ((|p| UP) ($ |SparseUnivariatePolynomial| UP))
        (SPADCALL (ELT $ 14) |p| (QREFELT $ 18))) 

(SDEFUN |INTTR;UP2UPR|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| UP)))
        (SPADCALL (CONS #'|INTTR;UP2UPR!0| $) |p| (QREFELT $ 23))) 

(SDEFUN |INTTR;UP2UPR!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 14)) (QREFELT $ 19))) 

(SDEFUN |INTTR;UP22UPR|
        ((|p| |SparseUnivariatePolynomial| UP)
         ($ |SparseUnivariatePolynomial| (|Fraction| UP)))
        (SPADCALL (ELT $ 19) |p| (QREFELT $ 26))) 

(SDEFUN |INTTR;kappa| ((|p| UP) (|derivation| |Mapping| UP UP) ($ UP))
        (SPROG ((|ans| (UP)))
               (SEQ (LETT |ans| (|spadConstant| $ 27) . #1=(|INTTR;kappa|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 27)
                                      (QREFELT $ 30)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 31))
                                             (QREFELT $ 14))
                                            |derivation|)
                                           (SPADCALL (|spadConstant| $ 32)
                                                     (SPADCALL |p|
                                                               (QREFELT $ 35))
                                                     (QREFELT $ 36))
                                           (QREFELT $ 37))
                                          (QREFELT $ 38))
                                . #1#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 39)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |INTTR;denint_dummy|
        ((|f| |Fraction| UP)
         ($ |Record| (|:| |answer| (|Fraction| UP))
          (|:| |logpart| (|Fraction| UP))
          (|:| |ir| (|IntegrationResult| (|Fraction| UP)))))
        (VECTOR (|spadConstant| $ 9) |f| (|spadConstant| $ 41))) 

(SDEFUN |INTTR;monomialIntegrate1|
        ((|f| |Fraction| UP)
         (|denint| |Mapping|
          #1=(|Record| (|:| |answer| (|Fraction| UP))
                       (|:| |logpart| (|Fraction| UP))
                       (|:| |ir| (|IntegrationResult| (|Fraction| UP))))
          (|Fraction| UP))
         (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
          (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP)))
        (SPROG
         ((|u| (|Union| UP "failed")) (|p| (|Fraction| UP))
          (|dlog| (|Fraction| UP))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial| (|Fraction| UP)))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial| (|Fraction| UP))))))
          (#2=#:G165 NIL) (|term| NIL) (#3=#:G164 NIL)
          (|rec|
           (|Record| (|:| |normal| (|Factored| UP))
                     (|:| |special| (|Factored| UP))))
          (|respoly| (UP))
          (|resultvec| (|PrimitiveArray| (|SparseUnivariatePolynomial| UP)))
          (|x| (UP)) (|iden| (UP)) (|inum| (UP)) (|ans1| (|Fraction| UP))
          (|dr| #1#)
          (|r|
           (|Record| (|:| |answer| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 42))
            (VECTOR (|spadConstant| $ 41) (|spadConstant| $ 9)
                    (|spadConstant| $ 27)))
           (#4='T
            (SEQ
             (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
                   . #5=(|INTTR;monomialIntegrate1|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL (QVELT |r| 1) (QREFELT $ 46))
                          (QREFELT $ 47))
                (VECTOR (SPADCALL (QVELT |r| 0) (QREFELT $ 48)) (QVELT |r| 2)
                        (QVELT |r| 3)))
               (#4#
                (SEQ (LETT |dr| (SPADCALL (QVELT |r| 1) |denint|) . #5#)
                     (LETT |ans1|
                           (SPADCALL (QVELT |r| 0) (QVELT |dr| 0)
                                     (QREFELT $ 49))
                           . #5#)
                     (LETT |inum| (SPADCALL (QVELT |dr| 1) (QREFELT $ 46))
                           . #5#)
                     (LETT |iden| (SPADCALL (QVELT |dr| 1) (QREFELT $ 50))
                           . #5#)
                     (LETT |x|
                           (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                           . #5#)
                     (LETT |resultvec|
                           (SPADCALL
                            (SPADCALL (|INTTR;UP2UP2| |inum| $)
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                                                (|INTTR;UP2UP2|
                                                 (SPADCALL |iden| |derivation|)
                                                 $)
                                                (QREFELT $ 52))
                                      (QREFELT $ 53))
                            (|INTTR;UP2UP2| |iden| $) (QREFELT $ 56))
                           . #5#)
                     (LETT |respoly|
                           (SPADCALL
                            (SPADCALL (QAREF1 |resultvec| 0) (QREFELT $ 57))
                            (QREFELT $ 58))
                           . #5#)
                     (LETT |rec|
                           (SPADCALL |respoly|
                                     (CONS #'|INTTR;monomialIntegrate1!0|
                                           (VECTOR $ |derivation|))
                                     (QREFELT $ 61))
                           . #5#)
                     (LETT |logs|
                           (PROGN
                            (LETT #3# NIL . #5#)
                            (SEQ (LETT |term| NIL . #5#)
                                 (LETT #2#
                                       (SPADCALL (QCDR |rec|) (QREFELT $ 65))
                                       . #5#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |term| (CAR #2#) . #5#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS
                                          (VECTOR (|spadConstant| $ 67)
                                                  (|INTTR;UP2UPR| (QCAR |term|)
                                                   $)
                                                  (|INTTR;UP22UPR|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (QAREF1 |resultvec|
                                                             (QCDR |term|))
                                                     (QCAR |term|)
                                                     (QREFELT $ 68))
                                                    (QREFELT $ 70))
                                                   $))
                                          #3#)
                                         . #5#)))
                                 (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           . #5#)
                     (LETT |dlog|
                           (COND
                            ((SPADCALL (SPADCALL |x| |derivation|)
                                       (|spadConstant| $ 33) (QREFELT $ 71))
                             (QVELT |dr| 1))
                            (#4#
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 9) |logs| NIL
                                        (QREFELT $ 76))
                              (CONS #'|INTTR;monomialIntegrate1!1|
                                    (VECTOR $ |derivation|))
                              (QREFELT $ 78))))
                           . #5#)
                     (LETT |u|
                           (SPADCALL
                            (LETT |p|
                                  (SPADCALL (QVELT |dr| 1) |dlog|
                                            (QREFELT $ 79))
                                  . #5#)
                            (QREFELT $ 81))
                           . #5#)
                     (EXIT
                      (COND
                       ((QEQCAR |u| 0)
                        (VECTOR
                         (SPADCALL (SPADCALL |ans1| |logs| NIL (QREFELT $ 76))
                                   (QVELT |dr| 2) (QREFELT $ 82))
                         (QVELT |r| 2)
                         (SPADCALL (QVELT |r| 3) (QCDR |u|) (QREFELT $ 38))))
                       (#4#
                        (VECTOR
                         (SPADCALL
                          (SPADCALL |ans1| |logs|
                                    (LIST (CONS |p| (QREFELT $ 10)))
                                    (QREFELT $ 76))
                          (QVELT |dr| 2) (QREFELT $ 82))
                         (QVELT |r| 2) (QVELT |r| 3))))))))))))))) 

(SDEFUN |INTTR;monomialIntegrate1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;monomialIntegrate1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(SDEFUN |INTTR;monomialIntegrate1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;monomialIntegrate1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTTR;kappa| |x1| |derivation| $))))) 

(SDEFUN |INTTR;monomialIntegrate;FMR;8|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
          (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP)))
        (|INTTR;monomialIntegrate1| |f|
         (CONS (|function| |INTTR;denint_dummy|) $) |derivation| $)) 

(SDEFUN |INTTR;monomialIntPoly;UPMR;9|
        ((|p| UP) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |answer| UP) (|:| |polypart| UP)))
        (SPROG
         ((|ans| (UP)) (|term| (UP)) (#1=#:G171 NIL) (|n| (|Integer|))
          (|l| (F)) (|d| (|Integer|)) (|dt| (UP)))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (LETT |dt|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|)
                       . #2=(|INTTR;monomialIntPoly;UPMR;9|))
                 (QREFELT $ 35))
                . #2#)
          (EXIT
           (COND
            ((< |d| 2)
             (|error| "monomIntPoly: monomial must have degree 2 or more"))
            ('T
             (SEQ (LETT |l| (SPADCALL |dt| (QREFELT $ 31)) . #2#)
                  (LETT |ans| (|spadConstant| $ 27) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (LETT |n|
                                 (- (+ 1 (SPADCALL |p| (QREFELT $ 35))) |d|)
                                 . #2#)
                           0 (QREFELT $ 87)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (LETT |term|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 31))
                                                (SPADCALL |n| |l|
                                                          (QREFELT $ 88))
                                                (QREFELT $ 89))
                                               (PROG1 (LETT #1# |n| . #2#)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               (QREFELT $ 36))
                                              . #2#)
                                        (QREFELT $ 38))
                              . #2#)
                        (EXIT
                         (LETT |p|
                               (SPADCALL |p| (SPADCALL |term| |derivation|)
                                         (QREFELT $ 90))
                               . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |ans| |p|))))))))) 

(SDEFUN |INTTR;expintegratepoly|
        ((|p| |LaurentPolynomial| F UP)
         (FRDE |Mapping|
          #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         ($ |Union|
          (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
          (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                    (|:| |notelem| (|LaurentPolynomial| F UP)))))
        (SPROG
         ((|notelm| #2=(|LaurentPolynomial| F UP)) (|coef0| (F))
          (|missing| (F)) (|answr| #2#) (|ans1| #1#) (|a| (F))
          (|n| (|Integer|)))
         (SEQ
          (LETT |coef0| (|spadConstant| $ 28) . #3=(|INTTR;expintegratepoly|))
          (LETT |notelm| (LETT |answr| (|spadConstant| $ 94) . #3#) . #3#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 94) (QREFELT $ 95)))
                 (GO G191)))
               (SEQ
                (LETT |ans1|
                      (SPADCALL (LETT |n| (SPADCALL |p| (QREFELT $ 96)) . #3#)
                                (LETT |a| (SPADCALL |p| (QREFELT $ 97)) . #3#)
                                FRDE)
                      . #3#)
                (LETT |answr|
                      (SPADCALL |answr|
                                (SPADCALL (QVELT |ans1| 0) |n| (QREFELT $ 98))
                                (QREFELT $ 99))
                      . #3#)
                (COND
                 ((NOT (QVELT |ans1| 2))
                  (SEQ
                   (LETT |missing|
                         (SPADCALL |a| (QVELT |ans1| 1) (QREFELT $ 100)) . #3#)
                   (EXIT
                    (COND ((ZEROP |n|) (LETT |coef0| |missing| . #3#))
                          ('T
                           (LETT |notelm|
                                 (SPADCALL |notelm|
                                           (SPADCALL |missing| |n|
                                                     (QREFELT $ 98))
                                           (QREFELT $ 99))
                                 . #3#)))))))
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 101)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |notelm| (QREFELT $ 102))
             (CONS 0 (CONS |answr| |coef0|)))
            ('T
             (CONS 1
                   (CONS |answr|
                         (SPADCALL |notelm| (SPADCALL |coef0| 0 (QREFELT $ 98))
                                   (QREFELT $ 99)))))))))) 

(SDEFUN |INTTR;expintegratepoly2|
        ((|p| |LaurentPolynomial| F UP)
         (FRDE |Mapping|
          #1=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                       (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         ($ |Union|
          (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
          (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                    (|:| |notelem| (|LaurentPolynomial| F UP)))))
        (SPROG
         ((|notelm| #2=(|LaurentPolynomial| F UP)) (|coef0| (F))
          (|missing| (F)) (|answr| #2#) (|ans1| #1#) (|a| (F))
          (|n| (|Integer|)))
         (SEQ
          (LETT |coef0| (|spadConstant| $ 28) . #3=(|INTTR;expintegratepoly2|))
          (LETT |notelm| (LETT |answr| (|spadConstant| $ 94) . #3#) . #3#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 94) (QREFELT $ 95)))
                 (GO G191)))
               (SEQ
                (LETT |ans1|
                      (SPADCALL (LETT |n| (SPADCALL |p| (QREFELT $ 96)) . #3#)
                                (LETT |a| (SPADCALL |p| (QREFELT $ 97)) . #3#)
                                FRDE)
                      . #3#)
                (LETT |answr|
                      (SPADCALL
                       (SPADCALL |answr|
                                 (SPADCALL (QVELT |ans1| 0) |n| (QREFELT $ 98))
                                 (QREFELT $ 99))
                       (SPADCALL (QVELT |ans1| 2) 0 (QREFELT $ 98))
                       (QREFELT $ 99))
                      . #3#)
                (COND
                 ((NOT (QVELT |ans1| 3))
                  (SEQ
                   (LETT |missing|
                         (SPADCALL |a| (QVELT |ans1| 1) (QREFELT $ 100)) . #3#)
                   (EXIT
                    (COND ((ZEROP |n|) (LETT |coef0| |missing| . #3#))
                          ('T
                           (LETT |notelm|
                                 (SPADCALL |notelm|
                                           (SPADCALL |missing| |n|
                                                     (QREFELT $ 98))
                                           (QREFELT $ 99))
                                 . #3#)))))))
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 101)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |notelm| (QREFELT $ 102))
             (CONS 0 (CONS |answr| |coef0|)))
            ('T
             (CONS 1
                   (CONS |answr|
                         (SPADCALL |notelm| (SPADCALL |coef0| 0 (QREFELT $ 98))
                                   (QREFELT $ 99)))))))))) 

(SDEFUN |INTTR;tanintegratespecial|
        ((|f| |Fraction| UP)
         (|derivation| |Mapping| (|Fraction| UP) (|Fraction| UP))
         (FRDE |Mapping| #1=(|Union| (|List| F) "failed") (|Integer|) F F)
         ($ |Union| (|Record| (|:| |answer| (|Fraction| UP)) (|:| |a0| F))
          (|Record| (|:| |elem| (|Fraction| UP))
                    (|:| |notelem| (|Fraction| UP)))))
        (SPROG
         ((#2=#:G217 NIL) (|u| #1#) (|c0| (F)) (|ans| (|Fraction| UP))
          (|term| (|Fraction| UP)) (|l| (|List| F)) (#3=#:G218 NIL) (|b| (F))
          (|a| (F)) (|r| (UP)) (|n| (|NonNegativeInteger|)) (|p| (UP)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ
              (LETT |ans| (|spadConstant| $ 9)
                    . #4=(|INTTR;tanintegratespecial|))
              (LETT |p|
                    (SPADCALL (SPADCALL (|spadConstant| $ 32) 2 (QREFELT $ 36))
                              (|spadConstant| $ 33) (QREFELT $ 38))
                    . #4#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |n|
                             (QUOTIENT2
                              (SPADCALL (SPADCALL |f| (QREFELT $ 50))
                                        (QREFELT $ 35))
                              2)
                             . #4#)
                       0 (QREFELT $ 103)))
                     (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL (SPADCALL |f| (QREFELT $ 46)) |p|
                                    (QREFELT $ 104))
                          . #4#)
                    (LETT |a| (SPADCALL |r| 1 (QREFELT $ 105)) . #4#)
                    (LETT |b| (SPADCALL |r| 0 (QREFELT $ 105)) . #4#)
                    (LETT |u| (SPADCALL |n| |a| |b| FRDE) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (PROGN
                        (LETT #3# (CONS 1 (CONS |ans| |f|)) . #4#)
                        (GO #5=#:G216)))
                      ('T
                       (SEQ (LETT |l| (QCDR |u|) . #4#)
                            (LETT |term|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (|SPADfirst| |l|) 1
                                              (QREFELT $ 36))
                                    (SPADCALL (SPADCALL |l| (QREFELT $ 107))
                                              (QREFELT $ 14))
                                    (QREFELT $ 38))
                                   (SPADCALL |f| (QREFELT $ 50))
                                   (QREFELT $ 108))
                                  . #4#)
                            (LETT |ans| (SPADCALL |ans| |term| (QREFELT $ 49))
                                  . #4#)
                            (EXIT
                             (LETT |f|
                                   (SPADCALL |f| (SPADCALL |term| |derivation|)
                                             (QREFELT $ 79))
                                   . #4#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL
                 (LETT |c0|
                       (SPADCALL (SPADCALL |f| (QREFELT $ 109))
                                 (QREFELT $ 110))
                       . #4#)
                 (QREFELT $ 111))
                (EXIT (CONS 0 (CONS |ans| |c0|))))
               ('T
                (SEQ
                 (LETT |u| (SPADCALL 0 |c0| (|spadConstant| $ 28) FRDE) . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #2# (CONS 0 (CONS |ans| |c0|)) . #4#)
                     (GO #6=#:G215))))))))
              (EXIT
               (CONS 0
                     (CONS
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL (|SPADfirst| (QCDR |u|))
                                           (QREFELT $ 14))
                                 (QREFELT $ 19))
                                (QREFELT $ 49))
                      (|spadConstant| $ 28))))))
            #6# (EXIT #2#)))
          #5# (EXIT #3#)))) 

(SDEFUN |INTTR;primintfldpoly;UPMFU;13|
        ((|p| UP)
         (|extendedint| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|t'| F) ($ |Union| UP "failed"))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
                    (|Record| (|:| |elem| UP) (|:| |notelem| UP)))))
         (SEQ
          (LETT |u| (|INTTR;primintegratepoly| |p| |extendedint| |t'| $)
                |INTTR;primintfldpoly;UPMFU;13|)
          (EXIT
           (COND
            ((OR (QEQCAR |u| 1)
                 (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                           (QREFELT $ 112)))
             (CONS 1 "failed"))
            ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTTR;expintfldpoly;LpMU;14|
        ((|p| |LaurentPolynomial| F UP)
         (FRDE |Mapping|
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         ($ |Union| (|LaurentPolynomial| F UP) "failed"))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
            (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                      (|:| |notelem| (|LaurentPolynomial| F UP))))))
         (SEQ
          (LETT |u| (|INTTR;expintegratepoly| |p| FRDE $)
                |INTTR;expintfldpoly;LpMU;14|)
          (EXIT
           (COND
            ((OR (QEQCAR |u| 1)
                 (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                           (QREFELT $ 112)))
             (CONS 1 "failed"))
            ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTTR;notelementary|
        ((|rec| |Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
          (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))
         ($ |IntegrationResult| (|Fraction| UP)))
        (SPADCALL (QVELT |rec| 0)
                  (SPADCALL
                   (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 19))
                             (QVELT |rec| 1) (QREFELT $ 49))
                   (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             (QREFELT $ 19))
                   (QREFELT $ 121))
                  (QREFELT $ 82))) 

(SDEFUN |INTTR;primintegrate;FMMMR;16|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|denint| |Mapping|
          (|Record| (|:| |answer| (|Fraction| UP))
                    (|:| |logpart| (|Fraction| UP))
                    (|:| |ir| (|IntegrationResult| (|Fraction| UP))))
          (|Fraction| UP))
         (|extendedint| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         ($ |Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
          (|:| |a0| F)))
        (SPROG
         ((|u2|
           (|Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
                    (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
          (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (|INTTR;monomialIntegrate1| |f| |denint| |derivation| $)
                . #1=(|INTTR;primintegrate;FMMMR;16|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 122)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |u2|
                (|INTTR;primintegratepoly| (QVELT |rec| 2) |extendedint|
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                            |derivation|)
                  (QREFELT $ 110))
                 $)
                . #1#)
          (EXIT
           (COND
            ((QEQCAR |u2| 1)
             (CONS
              (SPADCALL
               (SPADCALL |i1|
                         (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                                   (QREFELT $ 48))
                         (QREFELT $ 82))
               (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 19))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                          (QREFELT $ 19))
                         (QREFELT $ 121))
               (QREFELT $ 82))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                                  (QREFELT $ 48))
                        (QREFELT $ 82))
              (QCDR (QCDR |u2|))))))))) 

(SDEFUN |INTTR;expintegrate;FMMMR;17|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|denint| |Mapping|
          (|Record| (|:| |answer| (|Fraction| UP))
                    (|:| |logpart| (|Fraction| UP))
                    (|:| |ir| (|IntegrationResult| (|Fraction| UP))))
          (|Fraction| UP))
         (FRDE |Mapping|
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         ($ |Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
          (|:| |a0| F)))
        (SPROG
         ((|u2|
           (|Union|
            (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
            (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                      (|:| |notelem| (|LaurentPolynomial| F UP)))))
          (|special| (|LaurentPolynomial| F UP)) (#1=#:G284 NIL)
          (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (|INTTR;monomialIntegrate1| |f| |denint| |derivation| $)
                . #2=(|INTTR;expintegrate;FMMMR;17|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #2#) (QREFELT $ 122)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |special|
                (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 127))
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 46))
                                      (QREFELT $ 127))
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 50))
                                      (QREFELT $ 127))
                                     (QREFELT $ 129))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|LaurentPolynomial| (QREFELT $ 6)
                                                                 (QREFELT $ 7))
                                            (|Union|
                                             (|LaurentPolynomial| (QREFELT $ 6)
                                                                  (QREFELT $
                                                                           7))
                                             "failed")
                                            #1#))
                          (QREFELT $ 99))
                . #2#)
          (LETT |u2| (|INTTR;expintegratepoly2| |special| FRDE $) . #2#)
          (EXIT
           (COND
            ((QEQCAR |u2| 1)
             (CONS
              (SPADCALL
               (SPADCALL |i1|
                         (SPADCALL
                          (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 130))
                          (QREFELT $ 48))
                         (QREFELT $ 82))
               (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 130))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                          (QREFELT $ 19))
                         (QREFELT $ 121))
               (QREFELT $ 82))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 130))
                                  (QREFELT $ 48))
                        (QREFELT $ 82))
              (QCDR (QCDR |u2|))))))))) 

(SDEFUN |INTTR;mkir|
        ((|ans| |LaurentPolynomial| F UP) (|lcoeff| F)
         (|p| |LaurentPolynomial| F UP)
         ($ |IntegrationResult| (|Fraction| UP)))
        (SPROG
         ((|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial| (|Fraction| UP)))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial| (|Fraction| UP)))))))
         (SEQ
          (LETT |logs|
                (COND
                 ((SPADCALL |lcoeff| (|spadConstant| $ 28) (QREFELT $ 134))
                  NIL)
                 ('T
                  (LIST
                   (VECTOR (|spadConstant| $ 67)
                           (|INTTR;UP2UPR|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             (SPADCALL |lcoeff| (QREFELT $ 14)) (QREFELT $ 90))
                            $)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             (QREFELT $ 19))
                            1 (QREFELT $ 135))))))
                |INTTR;mkir|)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ans| (QREFELT $ 130)) |logs| NIL
                      (QREFELT $ 76))
            (SPADCALL (SPADCALL |p| (QREFELT $ 130))
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 19))
                      (QREFELT $ 121))
            (QREFELT $ 82)))))) 

(SDEFUN |INTTR;lambintegrate;FFMMMMR;19|
        ((|f| |Fraction| UP) (|dx| F) (|fderiv| |Mapping| F F)
         (|pderiv| |Mapping| UP UP)
         (|extint| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|lfint| |Mapping| (|IntegrationResult| F) F)
         ($ |Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
          (|:| |a0| (|IntegrationResult| F))))
        (SPROG
         ((|ri2|
           (|Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |a0| (|IntegrationResult| F))))
          (|sp| (|LaurentPolynomial| F UP)) (#1=#:G307 NIL) (|n| (|Integer|))
          (|sd| (UP)) (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| |pderiv| (QREFELT $ 84))
                . #2=(|INTTR;lambintegrate;FFMMMMR;19|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #2#) (QREFELT $ 122)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 137)))))
          (LETT |sd| (SPADCALL (QVELT |rec| 1) (QREFELT $ 50)) . #2#)
          (LETT |n| (- (SPADCALL |sd| (QREFELT $ 35))) . #2#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |sd| (QREFELT $ 39)) (|spadConstant| $ 27)
                       (QREFELT $ 30))
             (SEQ (SPADCALL (SPADCALL |sd| (QREFELT $ 139)) (QREFELT $ 141))
                  (EXIT
                   (|error| "lambintegrate: unexpected Darboux polynomial"))))
            ('T
             (SEQ
              (LETT |sp|
                    (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 127))
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (QVELT |rec| 1)
                                                    (QREFELT $ 46))
                                          (QREFELT $ 127))
                                         (SPADCALL |sd| (QREFELT $ 127))
                                         (QREFELT $ 129))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|LaurentPolynomial|
                                                 (QREFELT $ 6) (QREFELT $ 7))
                                                (|Union|
                                                 (|LaurentPolynomial|
                                                  (QREFELT $ 6) (QREFELT $ 7))
                                                 "failed")
                                                #1#))
                              (QREFELT $ 99))
                    . #2#)
              (LETT |ri2|
                    (|INTTR;lamintegratepoly| |sp| |dx| |n| |fderiv| |extint|
                     |lfint| $)
                    . #2#)
              (EXIT
               (CONS (SPADCALL |i1| (QCAR |ri2|) (QREFELT $ 82))
                     (QCDR |ri2|)))))))))) 

(SDEFUN |INTTR;lamintegratepoly|
        ((|p| |LaurentPolynomial| F UP) (|dx| F) (|n| |Integer|)
         (|fderiv| |Mapping| F F)
         (|extint| |Mapping|
          #1=(|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|lfint| |Mapping| (|IntegrationResult| F) F)
         ($ |Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
          (|:| |a0| (|IntegrationResult| F))))
        (SPROG
         ((#2=#:G341 NIL) (|answr| (|LaurentPolynomial| F UP)) (|clg0| (F))
          (|db1| (F)) (|b1| (F)) (#3=#:G342 NIL) (|i0| (|IntegrationResult| F))
          (|lcoeff| (F)) (|ans1| #1#) (|p0| (F)) (|d| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |answr| (|spadConstant| $ 94)
                  . #4=(|INTTR;lamintegratepoly|))
            (LETT |lcoeff| (|spadConstant| $ 28) . #4#)
            (LETT |i0| (|spadConstant| $ 137) . #4#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 94) (QREFELT $ 95)))
                   (GO G191)))
                 (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 96)) . #4#)
                      (EXIT
                       (COND
                        ((< |d| (- |n| 2))
                         (PROGN
                          (LETT #3#
                                (CONS (|INTTR;mkir| |answr| |lcoeff| |p| $)
                                      |i0|)
                                . #4#)
                          (GO #5=#:G340)))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p0| (SPADCALL |p| (QREFELT $ 97)) . #4#)
                                (COND
                                 ((SPADCALL |d| 1 (QREFELT $ 146))
                                  (SEQ
                                   (LETT |ans1| (SPADCALL |p0| |extint|) . #4#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |ans1| 1)
                                      (PROGN
                                       (LETT #3#
                                             (CONS
                                              (|INTTR;mkir| |answr| |lcoeff|
                                               |p| $)
                                              |i0|)
                                             . #4#)
                                       (GO #5#)))
                                     ('T
                                      (SEQ
                                       (LETT |b1| (QCAR (QCDR |ans1|)) . #4#)
                                       (LETT |db1| (SPADCALL |b1| |fderiv|)
                                             . #4#)
                                       (EXIT
                                        (LETT |clg0|
                                              (COND
                                               ((SPADCALL |d| 0
                                                          (QREFELT $ 146))
                                                (SPADCALL (QCDR (QCDR |ans1|))
                                                          (SPADCALL |d|
                                                                    (QREFELT $
                                                                             147))
                                                          (QREFELT $ 89)))
                                               ('T
                                                (SEQ
                                                 (LETT |lcoeff|
                                                       (QCDR (QCDR |ans1|))
                                                       . #4#)
                                                 (EXIT
                                                  (|spadConstant| $ 28)))))
                                              . #4#))))))))
                                 ('T
                                  (SEQ
                                   (LETT |i0| (SPADCALL |p0| |lfint|) . #4#)
                                   (COND
                                    ((NULL (SPADCALL |i0| (QREFELT $ 148)))
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (CONS
                                              (|INTTR;mkir| |answr| |lcoeff|
                                               (SPADCALL |p| (QREFELT $ 101))
                                               $)
                                              |i0|)
                                             . #4#)
                                       (GO #5#)))))
                                   (LETT |b1| (|spadConstant| $ 28) . #4#)
                                   (LETT |db1| |p0| . #4#)
                                   (EXIT
                                    (LETT |clg0| (|spadConstant| $ 28)
                                          . #4#)))))
                                (LETT |answr|
                                      (SPADCALL
                                       (SPADCALL |answr|
                                                 (SPADCALL |b1| (- |d| 1)
                                                           (QREFELT $ 98))
                                                 (QREFELT $ 99))
                                       (SPADCALL |clg0| |d| (QREFELT $ 98))
                                       (QREFELT $ 99))
                                      . #4#)
                                (LETT |p|
                                      (SPADCALL (SPADCALL |p| (QREFELT $ 101))
                                                (SPADCALL
                                                 (SPADCALL |db1|
                                                           (SPADCALL
                                                            (SPADCALL (- |d| 1)
                                                                      |dx|
                                                                      (QREFELT
                                                                       $ 88))
                                                            |b1|
                                                            (QREFELT $ 149))
                                                           (QREFELT $ 150))
                                                 (- |d| 1) (QREFELT $ 98))
                                                (QREFELT $ 151))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |p| (|spadConstant| $ 94)
                                             (QREFELT $ 95))
                                   (COND
                                    ((>= (SPADCALL |p| (QREFELT $ 96)) |d|)
                                     (PROGN
                                      (LETT #2#
                                            (SEQ
                                             (SPADCALL
                                              (SPADCALL |p| (QREFELT $ 152))
                                              (QREFELT $ 141))
                                             (EXIT (|error| "impossible")))
                                            . #4#)
                                      (GO #6=#:G336)))))))))
                          #6# (EXIT #2#))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS (|INTTR;mkir| |answr| |lcoeff| (|spadConstant| $ 94) $)
                   |i0|))))
          #5# (EXIT #3#)))) 

(SDEFUN |INTTR;tanintegrate;FMMR;21|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (FRDE |Mapping| (|Union| (|List| F) "failed") (|Integer|) F F)
         ($ |Record| (|:| |answer| (|IntegrationResult| (|Fraction| UP)))
          (|:| |a0| F)))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |answer| (|Fraction| UP)) (|:| |a0| F))
                    (|Record| (|:| |elem| (|Fraction| UP))
                              (|:| |notelem| (|Fraction| UP)))))
          (|c0| (F))
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff|
                           (|SparseUnivariatePolynomial| (|Fraction| UP)))
                      (|:| |logand|
                           (|SparseUnivariatePolynomial| (|Fraction| UP))))))
          (|c| (F)) (|t| (UP))
          (|r| (|Record| (|:| |answer| UP) (|:| |polypart| UP)))
          (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 84))
                . #1=(|INTTR;tanintegrate;FMMR;21|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 122)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |r| (SPADCALL (QVELT |rec| 2) |derivation| (QREFELT $ 92))
                . #1#)
          (LETT |t| (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36)) . #1#)
          (LETT |c|
                (SPADCALL (SPADCALL (QCDR |r|) 1 (QREFELT $ 105))
                          (SPADCALL (SPADCALL |t| |derivation|) (QREFELT $ 31))
                          (QREFELT $ 89))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 14)) |derivation|)
                       (|spadConstant| $ 27) (QREFELT $ 30))
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19)) NIL
                                  (LIST
                                   (CONS
                                    (SPADCALL
                                     (SPADCALL (QCDR |r|) (QREFELT $ 19))
                                     (QVELT |rec| 1) (QREFELT $ 49))
                                    (QREFELT $ 10)))
                                  (QREFELT $ 76))
                        (QREFELT $ 82))
              (|spadConstant| $ 28)))
            (#2='T
             (SEQ
              (LETT |logs|
                    (COND ((SPADCALL |c| (QREFELT $ 111)) NIL)
                          (#2#
                           (LIST
                            (VECTOR (|spadConstant| $ 67)
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 85) 1
                                               (QREFELT $ 135))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |c|
                                                  (SPADCALL 2 (QREFELT $ 147))
                                                  (QREFELT $ 89))
                                        (QREFELT $ 14))
                                       (QREFELT $ 19))
                                      (QREFELT $ 153))
                                     (QREFELT $ 154))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 33)
                                                (SPADCALL |t| 2
                                                          (QREFELT $ 156))
                                                (QREFELT $ 38))
                                      (QREFELT $ 19))
                                     (QREFELT $ 153))))))
                    . #1#)
              (LETT |c0| (SPADCALL (QCDR |r|) 0 (QREFELT $ 105)) . #1#)
              (LETT |u|
                    (|INTTR;tanintegratespecial| (QVELT |rec| 1)
                     (CONS #'|INTTR;tanintegrate;FMMR;21!0|
                           (VECTOR $ |derivation|))
                     FRDE $)
                    . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (CONS
                  (SPADCALL |i1|
                            (SPADCALL
                             (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19))
                                       (QCAR (QCDR |u|)) (QREFELT $ 49))
                             |logs|
                             (LIST (CONS (QCDR (QCDR |u|)) (QREFELT $ 10)))
                             (QREFELT $ 76))
                            (QREFELT $ 82))
                  |c0|))
                (#2#
                 (CONS
                  (SPADCALL |i1|
                            (SPADCALL
                             (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19))
                                       (QCAR (QCDR |u|)) (QREFELT $ 49))
                             |logs| NIL (QREFELT $ 76))
                            (QREFELT $ 82))
                  (SPADCALL (QCDR (QCDR |u|)) |c0| (QREFELT $ 150))))))))))))) 

(SDEFUN |INTTR;tanintegrate;FMMR;21!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1)
                . #1=(|INTTR;tanintegrate;FMMR;21|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(SDEFUN |INTTR;primintegratepoly|
        ((|p| UP)
         (|extendedint| |Mapping|
          #1=(|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|t'| F)
         ($ |Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
          (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
        (SPROG
         ((|ans1| #1#) (|rp| (F)) (|ans| (UP)) (#2=#:G380 NIL) (#3=#:G387 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 47))
             (CONS 0 (CONS (|spadConstant| $ 27) (|spadConstant| $ 28))))
            (#4='T
             (SEQ
              (LETT |ans| (|spadConstant| $ 27)
                    . #5=(|INTTR;primintegratepoly|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT |d| (SPADCALL |p| (QREFELT $ 35)) . #5#)
                                0 (QREFELT $ 160)))
                     (GO G191)))
                   (SEQ
                    (LETT |ans1|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                    |extendedint|)
                          . #5#)
                    (EXIT
                     (COND
                      ((QEQCAR |ans1| 1)
                       (PROGN
                        (LETT #3# (CONS 1 (CONS |ans| |p|)) . #5#)
                        (GO #6=#:G386)))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |d| |t'| (QREFELT $ 161))
                                          (QCAR (QCDR |ans1|)) (QREFELT $ 149))
                                         (PROG1 (LETT #2# (- |d| 1) . #5#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 36))
                                        (QREFELT $ 90))
                              . #5#)
                        (EXIT
                         (LETT |ans|
                               (SPADCALL
                                (SPADCALL |ans|
                                          (SPADCALL (QCAR (QCDR |ans1|)) |d|
                                                    (QREFELT $ 36))
                                          (QREFELT $ 38))
                                (SPADCALL
                                 (SPADCALL (QCDR (QCDR |ans1|))
                                           (SPADCALL (+ |d| 1) (QREFELT $ 147))
                                           (QREFELT $ 89))
                                 (+ |d| 1) (QREFELT $ 36))
                                (QREFELT $ 38))
                               . #5#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |ans1|
                    (SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT $ 110)) . #5#)
                              |extendedint|)
                    . #5#)
              (EXIT
               (COND ((QEQCAR |ans1| 1) (CONS 0 (CONS |ans| |rp|)))
                     (#4#
                      (CONS 0
                            (CONS
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |ans1|)) 1 (QREFELT $ 36))
                               (SPADCALL (QCAR (QCDR |ans1|)) (QREFELT $ 14))
                               (QREFELT $ 38))
                              |ans| (QREFELT $ 38))
                             (|spadConstant| $ 28))))))))))
          #6# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |TranscendentalIntegration;|)) 

(DEFUN |TranscendentalIntegration| (&REST #1=#:G388)
  (SPROG NIL
         (PROG (#2=#:G389)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalIntegration|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TranscendentalIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalIntegration|)))))))))) 

(DEFUN |TranscendentalIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 162) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (|spadConstant| $ 9))
          $))) 

(MAKEPROP '|TranscendentalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| 7) (0 . |Zero|) '|dummy| (|Mapping| 7 7)
              (4 . |differentiate|) (10 . /) (16 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 15) (21 . |map|)
              (27 . |coerce|) (|SparseUnivariatePolynomial| 8) (|Mapping| 8 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 8 20) (32 . |map|)
              (|Mapping| 8 7) (|SparseUnivariatePolynomialFunctions2| 7 8)
              (38 . |map|) (44 . |Zero|) (48 . |Zero|) (|Boolean|) (52 . ~=)
              (58 . |leadingCoefficient|) (63 . |One|) (67 . |One|)
              (|NonNegativeInteger|) (71 . |degree|) (76 . |monomial|) (82 . *)
              (88 . +) (94 . |reductum|) (|IntegrationResult| 8) (99 . |Zero|)
              (103 . |zero?|)
              (|Record| (|:| |answer| 8) (|:| |logpart| 8) (|:| |specpart| 8)
                        (|:| |polypart| 7))
              (|TranscendentalHermiteIntegration| 6 7)
              (108 . |HermiteIntegrate|) (114 . |numer|) (119 . |zero?|)
              (124 . |coerce|) (129 . +) (135 . |denom|) (140 . |coerce|)
              (145 . *) (151 . -) (|PrimitiveArray| 15)
              (|SubResultantPackage| 7 15) (157 . |subresultantVector|)
              (163 . |leadingCoefficient|) (168 . |primitivePart|)
              (|Record| (|:| |normal| 64) (|:| |special| 64))
              (|MonomialExtensionTools| 6 7) (173 . |splitSquarefree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 86)) (|List| 62)
              (|Factored| 7) (179 . |factors|) (|Fraction| 86) (184 . |One|)
              (188 . |primitivePart|)
              (|CommuteUnivariatePolynomialCategory| 6 7 15) (194 . |swap|)
              (199 . =)
              (|Record| (|:| |scalar| 66) (|:| |coeff| 20) (|:| |logand| 20))
              (|List| 72) (|Record| (|:| |integrand| 8) (|:| |intvar| 8))
              (|List| 74) (205 . |mkAnswer|) (|Mapping| 8 8)
              (212 . |differentiate|) (218 . -) (|Union| 7 '"failed")
              (224 . |retractIfCan|) (229 . +)
              (|Record| (|:| |ir| 40) (|:| |specpart| 8) (|:| |polypart| 7))
              |INTTR;monomialIntegrate;FMR;8| (235 . |One|) (|Integer|)
              (239 . >) (245 . *) (251 . /) (257 . -)
              (|Record| (|:| |answer| 7) (|:| |polypart| 7))
              |INTTR;monomialIntPoly;UPMR;9| (|LaurentPolynomial| 6 7)
              (263 . |Zero|) (267 . ~=) (273 . |degree|)
              (278 . |leadingCoefficient|) (283 . |monomial|) (289 . +)
              (295 . -) (301 . |reductum|) (306 . |zero?|) (311 . ~=)
              (317 . |rem|) (323 . |coefficient|) (|List| 6) (329 . |second|)
              (334 . /) (340 . |retract|) (345 . |retract|) (350 . |zero?|)
              (355 . ~=) (|Record| (|:| |ratpart| 6) (|:| |coeff| 6))
              (|Union| 113 '"failed") (|Mapping| 114 6)
              |INTTR;primintfldpoly;UPMFU;13| (|Union| 93 '"failed")
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |sol?| 29))
              (|Mapping| 118 86 6) |INTTR;expintfldpoly;LpMU;14|
              (361 . |integral|) (367 . |elem?|)
              (|Record| (|:| |answer| 40) (|:| |a0| 6))
              (|Record| (|:| |answer| 8) (|:| |logpart| 8) (|:| |ir| 40))
              (|Mapping| 124 8) |INTTR;primintegrate;FMMMR;16| (372 . |coerce|)
              (|Union| $ '"failed") (377 . |exquo|) (383 . |convert|)
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |primpart| 6)
                        (|:| |sol?| 29))
              (|Mapping| 131 86 6) |INTTR;expintegrate;FMMMR;17| (388 . =)
              (394 . |monomial|) (|IntegrationResult| 6) (400 . |Zero|)
              (|OutputForm|) (404 . |coerce|) (|Void|) (409 . |print|)
              (|Record| (|:| |answer| 40) (|:| |a0| 136)) (|Mapping| 6 6)
              (|Mapping| 136 6) |INTTR;lambintegrate;FFMMMMR;19| (414 . ~=)
              (420 . |coerce|) (425 . |elem?|) (430 . *) (436 . +) (442 . -)
              (448 . |coerce|) (453 . |coerce|) (458 . -) (|PositiveInteger|)
              (464 . ^) (|Union| 106 '"failed") (|Mapping| 157 86 6 6)
              |INTTR;tanintegrate;FMMR;21| (470 . >) (476 . *))
           '#(|tanintegrate| 482 |primintfldpoly| 489 |primintegrate| 496
              |monomialIntegrate| 504 |monomialIntPoly| 510 |lambintegrate| 516
              |expintfldpoly| 526 |expintegrate| 532)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 161
                                                 '(0 8 0 9 2 8 0 0 11 12 2 8 0
                                                   0 0 13 1 7 0 6 14 2 17 15 16
                                                   7 18 1 8 0 7 19 2 22 20 21 7
                                                   23 2 25 20 24 15 26 0 7 0 27
                                                   0 6 0 28 2 7 29 0 0 30 1 7 6
                                                   0 31 0 6 0 32 0 7 0 33 1 7
                                                   34 0 35 2 7 0 6 34 36 2 7 0
                                                   0 0 37 2 7 0 0 0 38 1 7 0 0
                                                   39 0 40 0 41 1 8 29 0 42 2
                                                   44 43 8 11 45 1 8 7 0 46 1 7
                                                   29 0 47 1 40 0 8 48 2 8 0 0
                                                   0 49 1 8 7 0 50 1 15 0 7 51
                                                   2 15 0 0 0 52 2 15 0 0 0 53
                                                   2 55 54 15 15 56 1 15 7 0 57
                                                   1 7 0 0 58 2 60 59 7 11 61 1
                                                   64 63 0 65 0 66 0 67 2 55 15
                                                   15 7 68 1 69 15 15 70 2 7 29
                                                   0 0 71 3 40 0 8 73 75 76 2
                                                   40 8 0 77 78 2 8 0 0 0 79 1
                                                   8 80 0 81 2 40 0 0 0 82 0 8
                                                   0 85 2 86 29 0 0 87 2 6 0 86
                                                   0 88 2 6 0 0 0 89 2 7 0 0 0
                                                   90 0 93 0 94 2 93 29 0 0 95
                                                   1 93 86 0 96 1 93 6 0 97 2
                                                   93 0 6 86 98 2 93 0 0 0 99 2
                                                   6 0 0 0 100 1 93 0 0 101 1
                                                   93 29 0 102 2 34 29 0 0 103
                                                   2 7 0 0 0 104 2 7 6 0 34 105
                                                   1 106 6 0 107 2 8 0 7 7 108
                                                   1 8 7 0 109 1 7 6 0 110 1 6
                                                   29 0 111 2 6 29 0 0 112 2 40
                                                   0 8 8 121 1 40 29 0 122 1 93
                                                   0 7 127 2 93 128 0 0 129 1
                                                   93 8 0 130 2 6 29 0 0 134 2
                                                   20 0 8 34 135 0 136 0 137 1
                                                   7 138 0 139 1 138 140 0 141
                                                   2 86 29 0 0 146 1 6 0 86 147
                                                   1 136 29 0 148 2 6 0 0 0 149
                                                   2 6 0 0 0 150 2 93 0 0 0 151
                                                   1 93 138 0 152 1 20 0 8 153
                                                   2 20 0 0 0 154 2 7 0 0 155
                                                   156 2 34 29 0 0 160 2 6 0 34
                                                   0 161 3 0 123 8 11 158 159 3
                                                   0 80 7 115 6 116 4 0 123 8
                                                   11 125 115 126 2 0 83 8 11
                                                   84 2 0 91 7 11 92 6 0 142 8
                                                   6 143 11 115 144 145 2 0 117
                                                   93 119 120 4 0 123 8 11 125
                                                   132 133)))))
           '|lookupComplete|)) 
