
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
          (#2=#:G195 NIL) (|term| NIL) (#3=#:G194 NIL)
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
         ((|ans| (UP)) (|term| (UP)) (#1=#:G201 NIL) (|n| (|Integer|))
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
                                                 (|check_subtype| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
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
         ((#2=#:G245 NIL) (|u| #1#) (|c0| (F)) (|ans| (|Fraction| UP))
          (|term| (|Fraction| UP)) (|l| (|List| F)) (#3=#:G246 NIL) (|b| (F))
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
                        (GO #3#)))
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
                     (GO #2#))))))))
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
            #2# (EXIT #2#)))
          #3# (EXIT #3#)))) 

(SDEFUN |INTTR;expextintfrac|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) (|g| |Fraction| UP)
         ($ |Union|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeff| (|Fraction| UP)))
          "failed"))
        (SPROG
         ((|c| (|Fraction| UP))
          (|r|
           (|Record| (|:| |answer| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 42))
            (CONS 0 (CONS (|spadConstant| $ 9) (|spadConstant| $ 9))))
           ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           ((SPADCALL
             (SPADCALL (SPADCALL |f| (QREFELT $ 50))
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 112))
             0 (QREFELT $ 103))
            (|error| "Not integral at t = 0"))
           (#1='T
            (SEQ
             (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
                   . #2=(|INTTR;expextintfrac|))
             (EXIT
              (COND
               ((SPADCALL |g| (QREFELT $ 42))
                (COND
                 ((SPADCALL (QVELT |r| 1) (|spadConstant| $ 9) (QREFELT $ 113))
                  (CONS 1 "failed"))
                 (#1# (CONS 0 (CONS (QVELT |r| 0) (|spadConstant| $ 9))))))
               ((>= (SPADCALL (SPADCALL |g| (QREFELT $ 46)) (QREFELT $ 35))
                    (SPADCALL (SPADCALL |g| (QREFELT $ 50)) (QREFELT $ 35)))
                (|error| "Not a proper fraction"))
               ((SPADCALL
                 (SPADCALL (SPADCALL |g| (QREFELT $ 50))
                           (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                           (QREFELT $ 112))
                 0 (QREFELT $ 103))
                (|error| "Not integral at t = 0"))
               ((SPADCALL
                 (SPADCALL
                  (LETT |c| (SPADCALL (QVELT |r| 1) |g| (QREFELT $ 13)) . #2#)
                  |derivation| (QREFELT $ 12))
                 (|spadConstant| $ 9) (QREFELT $ 113))
                (CONS 1 "failed"))
               (#1# (CONS 0 (CONS (QVELT |r| 0) |c|))))))))))) 

(SDEFUN |INTTR;limitedLogs|
        ((|f| |Fraction| UP)
         (|logderiv| |Mapping| (|Fraction| UP) (|Fraction| UP))
         (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|List|
           (|Record| (|:| |coeff| (|Fraction| UP))
                     (|:| |logand| (|Fraction| UP))))
          "failed"))
        (SPROG
         ((#1=#:G289 NIL)
          (|ans|
           (|List|
            (|Record| (|:| |coeff| (|Fraction| UP))
                      (|:| |logand| (|Fraction| UP)))))
          (|c0| (|Fraction| UP)) (|c| (F)) (OK (|Boolean|)) (#2=#:G298 NIL)
          (|pp| NIL) (#3=#:G299 NIL) (|j| NIL) (#4=#:G297 NIL) (|i| NIL)
          (|m| (|Matrix| F)) (#5=#:G295 NIL) (#6=#:G296 NIL) (#7=#:G294 NIL)
          (|cols| (|NonNegativeInteger|)) (|rows| (|NonNegativeInteger|))
          (#8=#:G293 NIL) (|u| NIL) (#9=#:G292 NIL)
          (|l1|
           (|List|
            (|Record| (|:| |logand2| (|Fraction| UP)) (|:| |contrib| UP))))
          (|v| (|Fraction| UP)) (#10=#:G291 NIL) (#11=#:G290 NIL) (|den| (UP))
          (|num| (UP)) (|u0| (|Fraction| UP)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |f| (QREFELT $ 42)) (CONS 0 NIL))
                 ((NULL |lu|) (CONS 1 "failed"))
                 ((NULL (CDR |lu|))
                  (COND
                   ((SPADCALL
                     (SPADCALL
                      (LETT |c0|
                            (SPADCALL |f|
                                      (SPADCALL
                                       (LETT |u0| (|SPADfirst| |lu|)
                                             . #12=(|INTTR;limitedLogs|))
                                       |logderiv|)
                                      (QREFELT $ 13))
                            . #12#)
                      |logderiv|)
                     (|spadConstant| $ 9) (QREFELT $ 113))
                    (CONS 1 "failed"))
                   (#13='T (CONS 0 (LIST (CONS |c0| |u0|))))))
                 (#13#
                  (SEQ (LETT |num| (SPADCALL |f| (QREFELT $ 46)) . #12#)
                       (LETT |den| (SPADCALL |f| (QREFELT $ 50)) . #12#)
                       (LETT |l1|
                             (PROGN
                              (LETT #11# NIL . #12#)
                              (SEQ (LETT |u| NIL . #12#)
                                   (LETT #10# |lu| . #12#) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN
                                          (LETT |u| (CAR #10#) . #12#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL
                                         (LETT |v|
                                               (SPADCALL |den|
                                                         (SPADCALL |u|
                                                                   |logderiv|)
                                                         (QREFELT $ 114))
                                               . #12#)
                                         (QREFELT $ 50))
                                        (|spadConstant| $ 33) (QREFELT $ 71))
                                       (LETT #11#
                                             (CONS
                                              (CONS |u|
                                                    (SPADCALL |v|
                                                              (QREFELT $ 46)))
                                              #11#)
                                             . #12#)))))
                                   (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                                   (EXIT (NREVERSE #11#))))
                             . #12#)
                       (LETT |rows|
                             (MAX (SPADCALL |den| (QREFELT $ 35))
                                  (+ 1
                                     (SPADCALL (ELT $ 115)
                                               (PROGN
                                                (LETT #9# NIL . #12#)
                                                (SEQ (LETT |u| NIL . #12#)
                                                     (LETT #8# |l1| . #12#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #8#)
                                                           (PROGN
                                                            (LETT |u| (CAR #8#)
                                                                  . #12#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #9#
                                                             (CONS
                                                              (SPADCALL
                                                               (QCDR |u|)
                                                               (QREFELT $ 35))
                                                              #9#)
                                                             . #12#)))
                                                     (LETT #8# (CDR #8#)
                                                           . #12#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#))))
                                               0 (QREFELT $ 118))))
                             . #12#)
                       (LETT |m|
                             (SPADCALL |rows|
                                       (LETT |cols| (+ 1 (LENGTH |l1|)) . #12#)
                                       (QREFELT $ 120))
                             . #12#)
                       (SEQ (LETT |i| 0 . #12#) (LETT #7# (- |rows| 1) . #12#)
                            G190 (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (SEQ (LETT |j| 1 . #12#)
                                  (LETT #6#
                                        (- (SPADCALL |m| (QREFELT $ 121)) 1)
                                        . #12#)
                                  (LETT |pp| NIL . #12#) (LETT #5# |l1| . #12#)
                                  G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN
                                         (LETT |pp| (CAR #5#) . #12#)
                                         NIL)
                                        (|greater_SI| |j| #6#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETAREF2O |m| (+ |i| 1) |j|
                                                (SPADCALL (QCDR |pp|) |i|
                                                          (QREFELT $ 105))
                                                1 1)))
                                  (LETT #5#
                                        (PROG1 (CDR #5#)
                                          (LETT |j| (|inc_SI| |j|) . #12#))
                                        . #12#)
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (QSETAREF2O |m| (+ |i| 1)
                                          (SPADCALL |m| (QREFELT $ 121))
                                          (SPADCALL |num| |i| (QREFELT $ 105))
                                          1 1)))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |m| (SPADCALL |m| (QREFELT $ 122)) . #12#)
                       (LETT |ans| NIL . #12#)
                       (SEQ (LETT |i| 1 . #12#)
                            (LETT #4# (SPADCALL |m| (QREFELT $ 123)) . #12#)
                            G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (QAREF2O |m| |i|
                                          (SPADCALL |m| (QREFELT $ 121)) 1 1)
                                 (|spadConstant| $ 28) (QREFELT $ 124))
                                (SEQ (LETT OK 'NIL . #12#)
                                     (SEQ (LETT |j| 1 . #12#)
                                          (LETT #3#
                                                (-
                                                 (SPADCALL |m| (QREFELT $ 121))
                                                 1)
                                                . #12#)
                                          (LETT |pp| NIL . #12#)
                                          (LETT #2# |l1| . #12#) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |pp| (CAR #2#) . #12#)
                                                 NIL)
                                                (|greater_SI| |j| #3#)
                                                (NULL
                                                 (COND (OK 'NIL) ('T 'T))))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL
                                               (QAREF2O |m| |i| |j| 1 1)
                                               (|spadConstant| $ 28)
                                               (QREFELT $ 124))
                                              (SEQ (LETT OK 'T . #12#)
                                                   (LETT |c|
                                                         (SPADCALL
                                                          (QAREF2O |m| |i|
                                                                   (SPADCALL
                                                                    |m|
                                                                    (QREFELT $
                                                                             121))
                                                                   1 1)
                                                          (QAREF2O |m| |i| |j|
                                                                   1 1)
                                                          (QREFELT $ 89))
                                                         . #12#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (SPADCALL
                                                        (LETT |c0|
                                                              (SPADCALL
                                                               (SPADCALL |c|
                                                                         (QREFELT
                                                                          $
                                                                          14))
                                                               (QREFELT $ 19))
                                                              . #12#)
                                                        |logderiv|)
                                                       (|spadConstant| $ 9)
                                                       (QREFELT $ 113))
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 1 "failed")
                                                             . #12#)
                                                       (GO #1#)))
                                                     ('T
                                                      (LETT |ans|
                                                            (CONS
                                                             (CONS |c0|
                                                                   (QCAR |pp|))
                                                             |ans|)
                                                            . #12#)))))))))
                                          (LETT #2#
                                                (PROG1 (CDR #2#)
                                                  (LETT |j| (|inc_SI| |j|)
                                                        . #12#))
                                                . #12#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL OK)
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed") . #12#)
                                         (GO #1#))))))))))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS 0 |ans|))))))
          #1# (EXIT #1#)))) 

(SDEFUN |INTTR;primintfldpoly;UPMFU;15|
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
                |INTTR;primintfldpoly;UPMFU;15|)
          (EXIT
           (COND
            ((OR (QEQCAR |u| 1)
                 (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                           (QREFELT $ 124)))
             (CONS 1 "failed"))
            ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTTR;expintfldpoly;LpMU;16|
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
                |INTTR;expintfldpoly;LpMU;16|)
          (EXIT
           (COND
            ((OR (QEQCAR |u| 1)
                 (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                           (QREFELT $ 124)))
             (CONS 1 "failed"))
            ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTTR;primlogint;FMMLU;17|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|extendedint| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|Record|
           (|:| |answer|
                (|Record| (|:| |mainpart| (|Fraction| UP))
                          (|:| |limitedlogs|
                               (|List|
                                (|Record| (|:| |coeff| (|Fraction| UP))
                                          (|:| |logand| (|Fraction| UP)))))))
           (|:| |a0| F))
          "failed"))
        (SPROG
         ((|u2|
           (|Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
                    (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
          (|u1|
           (|Union|
            (|Record| (|:| |mainpart| (|Fraction| UP))
                      (|:| |limitedlogs|
                           (|List|
                            (|Record| (|:| |coeff| (|Fraction| UP))
                                      (|:| |logand| (|Fraction| UP))))))
            "failed"))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))))
         (SEQ
          (LETT |qr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 46))
                          (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 134))
                . #1=(|INTTR;primlogint;FMMLU;17|))
          (LETT |u1|
                (SPADCALL
                 (SPADCALL (QCDR |qr|) (SPADCALL |f| (QREFELT $ 50))
                           (QREFELT $ 108))
                 |derivation| |lu| (QREFELT $ 139))
                . #1#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ
                   (LETT |u2|
                         (|INTTR;primintegratepoly| (QCAR |qr|) |extendedint|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                            |derivation|)
                           (QREFELT $ 110))
                          $)
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (CONS
                                  (CONS
                                   (SPADCALL (QCAR (QCDR |u1|))
                                             (SPADCALL (QCAR (QCDR |u2|))
                                                       (QREFELT $ 19))
                                             (QREFELT $ 49))
                                   (QCDR (QCDR |u1|)))
                                  (QCDR (QCDR |u2|)))))))))))))) 

(SDEFUN |INTTR;explogint;FMMLU;18|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (FRDE |Mapping|
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|Record|
           (|:| |answer|
                #1=(|Record| (|:| |mainpart| (|Fraction| UP))
                             (|:| |limitedlogs|
                                  (|List|
                                   (|Record| (|:| |coeff| (|Fraction| UP))
                                             (|:| |logand|
                                                  (|Fraction| UP)))))))
           (|:| |a0| F))
          "failed"))
        (SPROG
         ((|u2|
           (|Union|
            (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
            (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                      (|:| |notelem| (|LaurentPolynomial| F UP)))))
          (|ea| (F)) (|u11| #1#)
          (|u1|
           (|Union|
            (|Record|
             (|:| |answer|
                  (|Record| (|:| |mainpart| (|Fraction| UP))
                            (|:| |limitedlogs|
                                 (|List|
                                  (|Record| (|:| |coeff| (|Fraction| UP))
                                            (|:| |logand| (|Fraction| UP)))))))
             (|:| |a0| F))
            "failed"))
          (|qr|
           (|Record| (|:| |polyPart| (|LaurentPolynomial| F UP))
                     (|:| |fracPart| (|Fraction| UP)))))
         (SEQ
          (LETT |qr| (SPADCALL |f| (QREFELT $ 144))
                . #2=(|INTTR;explogint;FMMLU;18|))
          (LETT |u1| (|INTTR;explogintfrac| (QCDR |qr|) |derivation| |lu| $)
                . #2#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
                 (#3='T
                  (SEQ (LETT |u11| (QCAR (QCDR |u1|)) . #2#)
                       (LETT |ea| (QCDR (QCDR |u1|)) . #2#)
                       (LETT |u2|
                             (|INTTR;expintegratepoly|
                              (SPADCALL (QCAR |qr|)
                                        (SPADCALL |ea| (QREFELT $ 145))
                                        (QREFELT $ 146))
                              FRDE $)
                             . #2#)
                       (EXIT
                        (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                              (#3#
                               (CONS 0
                                     (CONS
                                      (CONS
                                       (SPADCALL (QCAR |u11|)
                                                 (SPADCALL (QCAR (QCDR |u2|))
                                                           (QREFELT $ 147))
                                                 (QREFELT $ 49))
                                       (QCDR |u11|))
                                      (QCDR (QCDR |u2|)))))))))))))) 

(SDEFUN |INTTR;primlogintfrac;FMLU;19|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|Record| (|:| |mainpart| (|Fraction| UP))
                    (|:| |limitedlogs|
                         (|List|
                          (|Record| (|:| |coeff| (|Fraction| UP))
                                    (|:| |logand| (|Fraction| UP))))))
          "failed"))
        (SPROG
         ((|u|
           (|Union|
            (|List|
             (|Record| (|:| |coeff| (|Fraction| UP))
                       (|:| |logand| (|Fraction| UP))))
            "failed"))
          (|r|
           (|Record| (|:| |answer| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 42))
            (CONS 0 (CONS (|spadConstant| $ 9) NIL)))
           ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           (#1='T
            (SEQ
             (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
                   . #2=(|INTTR;primlogintfrac;FMLU;19|))
             (EXIT
              (COND
               ((SPADCALL (QVELT |r| 1) (QREFELT $ 42))
                (CONS 0 (CONS (QVELT |r| 0) NIL)))
               (#1#
                (SEQ
                 (LETT |u|
                       (|INTTR;limitedLogs| (QVELT |r| 1)
                        (CONS #'|INTTR;primlogintfrac;FMLU;19!0|
                              (VECTOR $ |derivation|))
                        |lu| $)
                       . #2#)
                 (EXIT
                  (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                        (#1#
                         (CONS 0 (CONS (QVELT |r| 0) (QCDR |u|)))))))))))))))) 

(SDEFUN |INTTR;primlogintfrac;FMLU;19!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1)
                . #1=(|INTTR;primlogintfrac;FMLU;19|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTTR;logprmderiv| |x1| |derivation| $))))) 

(SDEFUN |INTTR;explogintfrac|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|lu| |List| (|Fraction| UP))
         ($ |Union|
          (|Record|
           (|:| |answer|
                (|Record| (|:| |mainpart| (|Fraction| UP))
                          (|:| |limitedlogs|
                               (|List|
                                (|Record| (|:| |coeff| (|Fraction| UP))
                                          (|:| |logand| (|Fraction| UP)))))))
           (|:| |a0| F))
          "failed"))
        (SPROG
         ((|ea| (F)) (#1=#:G418 NIL) (#2=#:G417 (F)) (#3=#:G419 (F))
          (#4=#:G427 NIL) (|v| NIL)
          (|u|
           (|List|
            (|Record| (|:| |coeff| (|Fraction| UP))
                      (|:| |logand| (|Fraction| UP)))))
          (|uu|
           (|Union|
            (|List|
             (|Record| (|:| |coeff| (|Fraction| UP))
                       (|:| |logand| (|Fraction| UP))))
            "failed"))
          (|eta'| (F))
          (|r|
           (|Record| (|:| |answer| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 42))
            (CONS 0
                  (CONS (CONS (|spadConstant| $ 9) NIL)
                        (|spadConstant| $ 28))))
           ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           ((SPADCALL
             (SPADCALL (SPADCALL |f| (QREFELT $ 50))
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 112))
             0 (QREFELT $ 149))
            (|error| "Not integral at t = 0"))
           (#5='T
            (SEQ
             (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
                   . #6=(|INTTR;explogintfrac|))
             (EXIT
              (COND
               ((SPADCALL (QVELT |r| 1) (QREFELT $ 42))
                (CONS 0 (CONS (CONS (QVELT |r| 0) NIL) (|spadConstant| $ 28))))
               (#5#
                (SEQ
                 (LETT |eta'|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                         |derivation|)
                        1 (QREFELT $ 105))
                       . #6#)
                 (LETT |uu|
                       (|INTTR;limitedLogs| (QVELT |r| 1)
                        (CONS #'|INTTR;explogintfrac!0|
                              (VECTOR $ |eta'| |derivation|))
                        |lu| $)
                       . #6#)
                 (EXIT
                  (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                        (#5#
                         (SEQ (LETT |u| (QCDR |uu|) . #6#)
                              (LETT |ea|
                                    (SPADCALL |eta'|
                                              (PROGN
                                               (LETT #1# NIL . #6#)
                                               (SEQ (LETT |v| NIL . #6#)
                                                    (LETT #4# |u| . #6#) G190
                                                    (COND
                                                     ((OR (ATOM #4#)
                                                          (PROGN
                                                           (LETT |v| (CAR #4#)
                                                                 . #6#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #3#
                                                             (SPADCALL
                                                              (-
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QCDR |v|)
                                                                 (QREFELT $
                                                                          46))
                                                                (QREFELT $ 35))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QCDR |v|)
                                                                 (QREFELT $
                                                                          50))
                                                                (QREFELT $
                                                                         35)))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QCAR |v|)
                                                                (QREFELT $
                                                                         109))
                                                               (QREFELT $ 110))
                                                              (QREFELT $ 88))
                                                             . #6#)
                                                       (COND
                                                        (#1#
                                                         (LETT #2#
                                                               (SPADCALL #2#
                                                                         #3#
                                                                         (QREFELT
                                                                          $
                                                                          150))
                                                               . #6#))
                                                        ('T
                                                         (PROGN
                                                          (LETT #2# #3# . #6#)
                                                          (LETT #1# 'T
                                                                . #6#)))))))
                                                    (LETT #4# (CDR #4#) . #6#)
                                                    (GO G190) G191 (EXIT NIL))
                                               (COND (#1# #2#)
                                                     (#5#
                                                      (|spadConstant| $ 28))))
                                              (QREFELT $ 151))
                                    . #6#)
                              (EXIT
                               (CONS 0
                                     (CONS (CONS (QVELT |r| 0) |u|)
                                           |ea|))))))))))))))))) 

(SDEFUN |INTTR;explogintfrac!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| |eta'| $)
          (LETT |derivation| (QREFELT $$ 2) . #1=(|INTTR;explogintfrac|))
          (LETT |eta'| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTTR;logexpderiv| |x1| |derivation| |eta'| $))))) 

(SDEFUN |INTTR;logexpderiv|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) (|eta'| F)
         ($ |Fraction| UP))
        (SPADCALL
         (SPADCALL (SPADCALL |f| |derivation| (QREFELT $ 12)) |f|
                   (QREFELT $ 13))
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (- (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
               (SPADCALL (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 35)))
            |eta'| (QREFELT $ 88))
           (QREFELT $ 14))
          (QREFELT $ 19))
         (QREFELT $ 79))) 

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
                   (QREFELT $ 152))
                  (QREFELT $ 82))) 

(SDEFUN |INTTR;primintegrate;FMMMR;23|
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
                . #1=(|INTTR;primintegrate;FMMMR;23|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 153)))
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
                         (QREFELT $ 152))
               (QREFELT $ 82))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                                  (QREFELT $ 48))
                        (QREFELT $ 82))
              (QCDR (QCDR |u2|))))))))) 

(SDEFUN |INTTR;expintegrate;FMMMR;24|
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
          (|special| (|LaurentPolynomial| F UP)) (#1=#:G455 NIL)
          (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (|INTTR;monomialIntegrate1| |f| |denint| |derivation| $)
                . #2=(|INTTR;expintegrate;FMMMR;24|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #2#) (QREFELT $ 153)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |special|
                (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 158))
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 46))
                                      (QREFELT $ 158))
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 50))
                                      (QREFELT $ 158))
                                     (QREFELT $ 160))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0)
                                           (|LaurentPolynomial| (QREFELT $ 6)
                                                                (QREFELT $ 7))
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
                          (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 147))
                          (QREFELT $ 48))
                         (QREFELT $ 82))
               (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 147))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                          (QREFELT $ 19))
                         (QREFELT $ 152))
               (QREFELT $ 82))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 147))
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
                 ((SPADCALL |lcoeff| (|spadConstant| $ 28) (QREFELT $ 164))
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
                            1 (QREFELT $ 165))))))
                |INTTR;mkir|)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ans| (QREFELT $ 147)) |logs| NIL
                      (QREFELT $ 76))
            (SPADCALL (SPADCALL |p| (QREFELT $ 147))
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 19))
                      (QREFELT $ 152))
            (QREFELT $ 82)))))) 

(SDEFUN |INTTR;lambintegrate;FFMMMMR;26|
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
          (|sp| (|LaurentPolynomial| F UP)) (#1=#:G478 NIL) (|n| (|Integer|))
          (|sd| (UP)) (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| |pderiv| (QREFELT $ 84))
                . #2=(|INTTR;lambintegrate;FFMMMMR;26|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #2#) (QREFELT $ 153)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 167)))))
          (LETT |sd| (SPADCALL (QVELT |rec| 1) (QREFELT $ 50)) . #2#)
          (LETT |n| (- (SPADCALL |sd| (QREFELT $ 35))) . #2#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |sd| (QREFELT $ 39)) (|spadConstant| $ 27)
                       (QREFELT $ 30))
             (SEQ (SPADCALL (SPADCALL |sd| (QREFELT $ 169)) (QREFELT $ 171))
                  (EXIT
                   (|error| "lambintegrate: unexpected Darboux polynomial"))))
            ('T
             (SEQ
              (LETT |sp|
                    (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 158))
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (QVELT |rec| 1)
                                                    (QREFELT $ 46))
                                          (QREFELT $ 158))
                                         (SPADCALL |sd| (QREFELT $ 158))
                                         (QREFELT $ 160))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0)
                                               (|LaurentPolynomial|
                                                (QREFELT $ 6) (QREFELT $ 7))
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
         ((#2=#:G507 NIL) (|answr| (|LaurentPolynomial| F UP)) (|clg0| (F))
          (|db1| (F)) (|b1| (F)) (#3=#:G511 NIL) (|i0| (|IntegrationResult| F))
          (|lcoeff| (F)) (|ans1| #1#) (|p0| (F)) (|d| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |answr| (|spadConstant| $ 94)
                  . #4=(|INTTR;lamintegratepoly|))
            (LETT |lcoeff| (|spadConstant| $ 28) . #4#)
            (LETT |i0| (|spadConstant| $ 167) . #4#)
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
                          (GO #3#)))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ (LETT |p0| (SPADCALL |p| (QREFELT $ 97)) . #4#)
                                (COND
                                 ((SPADCALL |d| 1 (QREFELT $ 176))
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
                                       (GO #3#)))
                                     ('T
                                      (SEQ
                                       (LETT |b1| (QCAR (QCDR |ans1|)) . #4#)
                                       (LETT |db1| (SPADCALL |b1| |fderiv|)
                                             . #4#)
                                       (EXIT
                                        (LETT |clg0|
                                              (COND
                                               ((SPADCALL |d| 0
                                                          (QREFELT $ 176))
                                                (SPADCALL (QCDR (QCDR |ans1|))
                                                          (SPADCALL |d|
                                                                    (QREFELT $
                                                                             177))
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
                                    ((NULL (SPADCALL |i0| (QREFELT $ 178)))
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (CONS
                                              (|INTTR;mkir| |answr| |lcoeff|
                                               (SPADCALL |p| (QREFELT $ 101))
                                               $)
                                              |i0|)
                                             . #4#)
                                       (GO #3#)))))
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
                                                            (QREFELT $ 151))
                                                           (QREFELT $ 150))
                                                 (- |d| 1) (QREFELT $ 98))
                                                (QREFELT $ 146))
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
                                              (SPADCALL |p| (QREFELT $ 179))
                                              (QREFELT $ 171))
                                             (EXIT (|error| "impossible")))
                                            . #4#)
                                      (GO #2#)))))))))
                          #2# (EXIT #2#))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS (|INTTR;mkir| |answr| |lcoeff| (|spadConstant| $ 94) $)
                   |i0|))))
          #3# (EXIT #3#)))) 

(SDEFUN |INTTR;tanintegrate;FMMR;28|
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
                . #1=(|INTTR;tanintegrate;FMMR;28|))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 153)))
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
                                               (QREFELT $ 165))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |c|
                                                  (SPADCALL 2 (QREFELT $ 177))
                                                  (QREFELT $ 89))
                                        (QREFELT $ 14))
                                       (QREFELT $ 19))
                                      (QREFELT $ 180))
                                     (QREFELT $ 181))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 33)
                                                (SPADCALL |t| 2
                                                          (QREFELT $ 183))
                                                (QREFELT $ 38))
                                      (QREFELT $ 19))
                                     (QREFELT $ 180))))))
                    . #1#)
              (LETT |c0| (SPADCALL (QCDR |r|) 0 (QREFELT $ 105)) . #1#)
              (LETT |u|
                    (|INTTR;tanintegratespecial| (QVELT |rec| 1)
                     (CONS #'|INTTR;tanintegrate;FMMR;28!0|
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

(SDEFUN |INTTR;tanintegrate;FMMR;28!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1)
                . #1=(|INTTR;tanintegrate;FMMR;28|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(SDEFUN |INTTR;primextendedint;FMMFU;29|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (|extendedint| |Mapping|
          (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|g| |Fraction| UP)
         ($ |Union| (|Record| (|:| |answer| (|Fraction| UP)) (|:| |a0| F))
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeff| (|Fraction| UP)))
          "failed"))
        (SPROG
         ((|u2| (|Union| UP "failed"))
          (|u3|
           (|Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
                    (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
          (|u1|
           (|Union|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeff| (|Fraction| UP)))
            "failed"))
          (|gqr| #1=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|fqr| #1#))
         (SEQ
          (LETT |fqr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 46))
                          (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 134))
                . #2=(|INTTR;primextendedint;FMMFU;29|))
          (LETT |gqr|
                (SPADCALL (SPADCALL |g| (QREFELT $ 46))
                          (SPADCALL |g| (QREFELT $ 50)) (QREFELT $ 134))
                . #2#)
          (LETT |u1|
                (SPADCALL
                 (SPADCALL (QCDR |fqr|) (SPADCALL |f| (QREFELT $ 50))
                           (QREFELT $ 108))
                 |derivation|
                 (SPADCALL (QCDR |gqr|) (SPADCALL |g| (QREFELT $ 50))
                           (QREFELT $ 108))
                 (QREFELT $ 189))
                . #2#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 2 "failed"))
                 ((SPADCALL (QCDR |gqr|) (QREFELT $ 47))
                  (SEQ
                   (LETT |u3|
                         (|INTTR;primintegratepoly| (QCAR |fqr|) |extendedint|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                            |derivation|)
                           (QREFELT $ 110))
                          $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |u3| 1)
                      (COND
                       ((SPADCALL (SPADCALL (QCAR |gqr|) (QREFELT $ 35)) 0
                                  (QREFELT $ 149))
                        (|error| "Sorry - cannot handle that integrand yet"))
                       (#3='T (CONS 2 "failed"))))
                     (#3#
                      (CONS 0
                            (CONS
                             (SPADCALL (QCAR (QCDR |u1|))
                                       (SPADCALL (QCAR (QCDR |u3|))
                                                 (QREFELT $ 19))
                                       (QREFELT $ 49))
                             (QCDR (QCDR |u3|)))))))))
                 (#3#
                  (SEQ
                   (LETT |u2|
                         (SPADCALL
                          (SPADCALL (QCAR |fqr|)
                                    (SPADCALL
                                     (SPADCALL (QCDR (QCDR |u1|))
                                               (QREFELT $ 109))
                                     (QCAR |gqr|) (QREFELT $ 37))
                                    (QREFELT $ 90))
                          |extendedint|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                            |derivation|)
                           (QREFELT $ 110))
                          (QREFELT $ 128))
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 2 "failed"))
                          (#3#
                           (CONS 1
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCDR |u2|) (QREFELT $ 19))
                                   (QCAR (QCDR |u1|)) (QREFELT $ 49))
                                  (QCDR (QCDR |u1|)))))))))))))) 

(SDEFUN |INTTR;expextendedint;FMMFU;30|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP)
         (FRDE |Mapping|
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |sol?| (|Boolean|)))
          (|Integer|) F)
         (|g| |Fraction| UP)
         ($ |Union| (|Record| (|:| |answer| (|Fraction| UP)) (|:| |a0| F))
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeff| (|Fraction| UP)))
          "failed"))
        (SPROG
         ((|u2| (|Union| (|LaurentPolynomial| F UP) "failed"))
          (|u3|
           (|Union|
            (|Record| (|:| |answer| (|LaurentPolynomial| F UP)) (|:| |a0| F))
            (|Record| (|:| |elem| (|LaurentPolynomial| F UP))
                      (|:| |notelem| (|LaurentPolynomial| F UP)))))
          (|u1|
           (|Union|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeff| (|Fraction| UP)))
            "failed"))
          (|qg|
           #1=(|Record| (|:| |polyPart| (|LaurentPolynomial| F UP))
                        (|:| |fracPart| (|Fraction| UP))))
          (|qf| #1#))
         (SEQ
          (LETT |qf| (SPADCALL |f| (QREFELT $ 144))
                . #2=(|INTTR;expextendedint;FMMFU;30|))
          (LETT |qg| (SPADCALL |g| (QREFELT $ 144)) . #2#)
          (LETT |u1|
                (|INTTR;expextintfrac| (QCDR |qf|) |derivation| (QCDR |qg|) $)
                . #2#)
          (EXIT
           (COND ((QEQCAR |u1| 1) (CONS 2 "failed"))
                 ((SPADCALL (QCDR |qg|) (QREFELT $ 42))
                  (SEQ
                   (LETT |u3| (|INTTR;expintegratepoly| (QCAR |qf|) FRDE $)
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |u3| 1)
                      (COND
                       ((QEQCAR (SPADCALL (QCAR |qg|) (QREFELT $ 194)) 1)
                        (|error| "Sorry - cannot handle that integrand yet"))
                       (#3='T (CONS 2 "failed"))))
                     (#3#
                      (CONS 0
                            (CONS
                             (SPADCALL (QCAR (QCDR |u1|))
                                       (SPADCALL (QCAR (QCDR |u3|))
                                                 (QREFELT $ 147))
                                       (QREFELT $ 49))
                             (QCDR (QCDR |u3|)))))))))
                 (#3#
                  (SEQ
                   (LETT |u2|
                         (SPADCALL
                          (SPADCALL (QCAR |qf|)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QCDR (QCDR |u1|))
                                                (QREFELT $ 109))
                                      (QREFELT $ 158))
                                     (QCAR |qg|) (QREFELT $ 195))
                                    (QREFELT $ 146))
                          FRDE (QREFELT $ 132))
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 2 "failed"))
                          (#3#
                           (CONS 1
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCDR |u2|) (QREFELT $ 147))
                                   (QCAR (QCDR |u1|)) (QREFELT $ 49))
                                  (QCDR (QCDR |u1|)))))))))))))) 

(SDEFUN |INTTR;primintegratepoly|
        ((|p| UP)
         (|extendedint| |Mapping|
          #1=(|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|t'| F)
         ($ |Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
          (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
        (SPROG
         ((|ans1| #1#) (|rp| (F)) (|ans| (UP)) (#2=#:G618 NIL) (#3=#:G624 NIL)
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
                                0 (QREFELT $ 149)))
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
                        (GO #3#)))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |d| |t'| (QREFELT $ 197))
                                          (QCAR (QCDR |ans1|)) (QREFELT $ 151))
                                         (PROG1 (LETT #2# (- |d| 1) . #5#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
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
                                           (SPADCALL (+ |d| 1) (QREFELT $ 177))
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
          #3# (EXIT #3#)))) 

(SDEFUN |INTTR;primextintfrac;FMFU;32|
        ((|f| |Fraction| UP) (|derivation| |Mapping| UP UP) (|g| |Fraction| UP)
         ($ |Union|
          (|Record| (|:| |ratpart| (|Fraction| UP))
                    (|:| |coeff| (|Fraction| UP)))
          "failed"))
        (SPROG
         ((|c| (|Fraction| UP))
          (|r|
           (|Record| (|:| |answer| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT $ 42))
            (CONS 0 (CONS (|spadConstant| $ 9) (|spadConstant| $ 9))))
           ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |f| (QREFELT $ 50)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           (#1='T
            (SEQ
             (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
                   . #2=(|INTTR;primextintfrac;FMFU;32|))
             (EXIT
              (COND
               ((SPADCALL |g| (QREFELT $ 42))
                (COND
                 ((SPADCALL (QVELT |r| 1) (|spadConstant| $ 9) (QREFELT $ 113))
                  (CONS 1 "failed"))
                 (#1# (CONS 0 (CONS (QVELT |r| 0) (|spadConstant| $ 9))))))
               ((>= (SPADCALL (SPADCALL |g| (QREFELT $ 46)) (QREFELT $ 35))
                    (SPADCALL (SPADCALL |g| (QREFELT $ 50)) (QREFELT $ 35)))
                (|error| "Not a proper fraction"))
               ((SPADCALL
                 (SPADCALL
                  (LETT |c| (SPADCALL (QVELT |r| 1) |g| (QREFELT $ 13)) . #2#)
                  |derivation| (QREFELT $ 12))
                 (|spadConstant| $ 9) (QREFELT $ 113))
                (CONS 1 "failed"))
               (#1# (CONS 0 (CONS (QVELT |r| 0) |c|))))))))))) 

(DECLAIM (NOTINLINE |TranscendentalIntegration;|)) 

(DEFUN |TranscendentalIntegration| (&REST #1=#:G639)
  (SPROG NIL
         (PROG (#2=#:G640)
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
          (LETT $ (GETREFV 198) . #1#)
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
              (355 . |order|) (361 . ~=) (367 . *) (373 . |max|)
              (|Mapping| 34 34 34) (|List| 34) (379 . |reduce|) (|Matrix| 6)
              (386 . |zero|) (392 . |maxColIndex|) (397 . |rowEchelon|)
              (402 . |maxRowIndex|) (407 . ~=)
              (|Record| (|:| |ratpart| 6) (|:| |coeff| 6))
              (|Union| 125 '"failed") (|Mapping| 126 6)
              |INTTR;primintfldpoly;UPMFU;15| (|Union| 93 '"failed")
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |sol?| 29))
              (|Mapping| 130 86 6) |INTTR;expintfldpoly;LpMU;16|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (413 . |divide|) (|Record| (|:| |coeff| 8) (|:| |logand| 8))
              (|Record| (|:| |mainpart| 8) (|:| |limitedlogs| (|List| 135)))
              (|Union| 136 '"failed") (|List| 8) |INTTR;primlogintfrac;FMLU;19|
              (|Record| (|:| |answer| 136) (|:| |a0| 6))
              (|Union| 140 '"failed") |INTTR;primlogint;FMMLU;17|
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 8))
              (419 . |separate|) (424 . |coerce|) (429 . -) (435 . |convert|)
              |INTTR;explogint;FMMLU;18| (440 . >) (446 . +) (452 . *)
              (458 . |integral|) (464 . |elem?|)
              (|Record| (|:| |answer| 40) (|:| |a0| 6))
              (|Record| (|:| |answer| 8) (|:| |logpart| 8) (|:| |ir| 40))
              (|Mapping| 155 8) |INTTR;primintegrate;FMMMR;23| (469 . |coerce|)
              (|Union| $ '"failed") (474 . |exquo|)
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |primpart| 6)
                        (|:| |sol?| 29))
              (|Mapping| 161 86 6) |INTTR;expintegrate;FMMMR;24| (480 . =)
              (486 . |monomial|) (|IntegrationResult| 6) (492 . |Zero|)
              (|OutputForm|) (496 . |coerce|) (|Void|) (501 . |print|)
              (|Record| (|:| |answer| 40) (|:| |a0| 166)) (|Mapping| 6 6)
              (|Mapping| 166 6) |INTTR;lambintegrate;FFMMMMR;26| (506 . ~=)
              (512 . |coerce|) (517 . |elem?|) (522 . |coerce|)
              (527 . |coerce|) (532 . -) (|PositiveInteger|) (538 . ^)
              (|Union| 106 '"failed") (|Mapping| 184 86 6 6)
              |INTTR;tanintegrate;FMMR;28|
              (|Record| (|:| |ratpart| 8) (|:| |coeff| 8))
              (|Union| 187 '"failed") |INTTR;primextintfrac;FMFU;32|
              (|Record| (|:| |answer| 8) (|:| |a0| 6))
              (|Union| 190 187 '"failed") |INTTR;primextendedint;FMMFU;29|
              (|Union| 6 '"failed") (544 . |retractIfCan|) (549 . *)
              |INTTR;expextendedint;FMMFU;30| (555 . *))
           '#(|tanintegrate| 561 |primlogintfrac| 568 |primlogint| 575
              |primintfldpoly| 583 |primintegrate| 590 |primextintfrac| 598
              |primextendedint| 605 |monomialIntegrate| 613 |monomialIntPoly|
              619 |lambintegrate| 625 |explogint| 635 |expintfldpoly| 643
              |expintegrate| 649 |expextendedint| 657)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 197
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
                                                   29 0 111 2 7 34 0 0 112 2 8
                                                   29 0 0 113 2 8 0 7 0 114 2
                                                   34 0 0 0 115 3 117 34 116 0
                                                   34 118 2 119 0 34 34 120 1
                                                   119 86 0 121 1 119 0 0 122 1
                                                   119 86 0 123 2 6 29 0 0 124
                                                   2 7 133 0 0 134 1 93 143 8
                                                   144 1 93 0 6 145 2 93 0 0 0
                                                   146 1 93 8 0 147 2 34 29 0 0
                                                   149 2 6 0 0 0 150 2 6 0 0 0
                                                   151 2 40 0 8 8 152 1 40 29 0
                                                   153 1 93 0 7 158 2 93 159 0
                                                   0 160 2 6 29 0 0 164 2 20 0
                                                   8 34 165 0 166 0 167 1 7 168
                                                   0 169 1 168 170 0 171 2 86
                                                   29 0 0 176 1 6 0 86 177 1
                                                   166 29 0 178 1 93 168 0 179
                                                   1 20 0 8 180 2 20 0 0 0 181
                                                   2 7 0 0 182 183 1 93 193 0
                                                   194 2 93 0 0 0 195 2 6 0 34
                                                   0 197 3 0 154 8 11 185 186 3
                                                   0 137 8 11 138 139 4 0 141 8
                                                   11 127 138 142 3 0 80 7 127
                                                   6 128 4 0 154 8 11 156 127
                                                   157 3 0 188 8 11 8 189 4 0
                                                   191 8 11 127 8 192 2 0 83 8
                                                   11 84 2 0 91 7 11 92 6 0 172
                                                   8 6 173 11 127 174 175 4 0
                                                   141 8 11 131 138 148 2 0 129
                                                   93 131 132 4 0 154 8 11 156
                                                   162 163 4 0 191 8 11 131 8
                                                   196)))))
           '|lookupComplete|)) 
