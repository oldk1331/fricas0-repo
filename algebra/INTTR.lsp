
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
               (SEQ (LETT |ans| (|spadConstant| $ 27))
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
                                          (QREFELT $ 38)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 39)))))
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
          (#2=#:G156 NIL) (|term| NIL) (#3=#:G155 NIL)
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
            (SEQ (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45)))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL (QVELT |r| 1) (QREFELT $ 46))
                              (QREFELT $ 47))
                    (VECTOR (SPADCALL (QVELT |r| 0) (QREFELT $ 48))
                            (QVELT |r| 2) (QVELT |r| 3)))
                   (#4#
                    (SEQ (LETT |dr| (SPADCALL (QVELT |r| 1) |denint|))
                         (LETT |ans1|
                               (SPADCALL (QVELT |r| 0) (QVELT |dr| 0)
                                         (QREFELT $ 49)))
                         (LETT |inum| (SPADCALL (QVELT |dr| 1) (QREFELT $ 46)))
                         (LETT |iden| (SPADCALL (QVELT |dr| 1) (QREFELT $ 50)))
                         (LETT |x|
                               (SPADCALL (|spadConstant| $ 32) 1
                                         (QREFELT $ 36)))
                         (LETT |resultvec|
                               (SPADCALL
                                (SPADCALL (|INTTR;UP2UP2| |inum| $)
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT $ 51))
                                           (|INTTR;UP2UP2|
                                            (SPADCALL |iden| |derivation|) $)
                                           (QREFELT $ 52))
                                          (QREFELT $ 53))
                                (|INTTR;UP2UP2| |iden| $) (QREFELT $ 56)))
                         (LETT |respoly|
                               (SPADCALL
                                (SPADCALL (QAREF1 |resultvec| 0)
                                          (QREFELT $ 57))
                                (QREFELT $ 58)))
                         (LETT |rec|
                               (SPADCALL |respoly|
                                         (CONS #'|INTTR;monomialIntegrate1!0|
                                               (VECTOR $ |derivation|))
                                         (QREFELT $ 61)))
                         (LETT |logs|
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |term| NIL)
                                     (LETT #2#
                                           (SPADCALL (QCDR |rec|)
                                                     (QREFELT $ 66)))
                                     G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |term| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (VECTOR (|spadConstant| $ 68)
                                                      (|INTTR;UP2UPR|
                                                       (QVELT |term| 1) $)
                                                      (|INTTR;UP22UPR|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QAREF1 |resultvec|
                                                                 (QVELT |term|
                                                                        2))
                                                         (QVELT |term| 1)
                                                         (QREFELT $ 69))
                                                        (QREFELT $ 71))
                                                       $))
                                              #3#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#)))))
                         (LETT |dlog|
                               (COND
                                ((SPADCALL (SPADCALL |x| |derivation|)
                                           (|spadConstant| $ 33)
                                           (QREFELT $ 72))
                                 (QVELT |dr| 1))
                                (#4#
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 9) |logs| NIL
                                            (QREFELT $ 77))
                                  (CONS #'|INTTR;monomialIntegrate1!1|
                                        (VECTOR $ |derivation|))
                                  (QREFELT $ 79)))))
                         (LETT |u|
                               (SPADCALL
                                (LETT |p|
                                      (SPADCALL (QVELT |dr| 1) |dlog|
                                                (QREFELT $ 80)))
                                (QREFELT $ 82)))
                         (EXIT
                          (COND
                           ((QEQCAR |u| 0)
                            (VECTOR
                             (SPADCALL
                              (SPADCALL |ans1| |logs| NIL (QREFELT $ 77))
                              (QVELT |dr| 2) (QREFELT $ 83))
                             (QVELT |r| 2)
                             (SPADCALL (QVELT |r| 3) (QCDR |u|)
                                       (QREFELT $ 38))))
                           (#4#
                            (VECTOR
                             (SPADCALL
                              (SPADCALL |ans1| |logs|
                                        (LIST (CONS |p| (QREFELT $ 10)))
                                        (QREFELT $ 77))
                              (QVELT |dr| 2) (QREFELT $ 83))
                             (QVELT |r| 2) (QVELT |r| 3))))))))))))))) 

(SDEFUN |INTTR;monomialIntegrate1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(SDEFUN |INTTR;monomialIntegrate1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|derivation| $)
          (LETT |derivation| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
         ((|ans| (UP)) (|term| (UP)) (#1=#:G162 NIL) (|n| (|Integer|))
          (|l| (F)) (|d| (|Integer|)) (|dt| (UP)))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (LETT |dt|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|))
                 (QREFELT $ 35)))
          (EXIT
           (COND
            ((< |d| 2)
             (|error| "monomIntPoly: monomial must have degree 2 or more"))
            ('T
             (SEQ (LETT |l| (SPADCALL |dt| (QREFELT $ 31)))
                  (LETT |ans| (|spadConstant| $ 27))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (LETT |n|
                                 (- (+ 1 (SPADCALL |p| (QREFELT $ 35))) |d|))
                           0 (QREFELT $ 88)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (LETT |term|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 31))
                                                (SPADCALL |n| |l|
                                                          (QREFELT $ 89))
                                                (QREFELT $ 90))
                                               (PROG1 (LETT #1# |n|)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               (QREFELT $ 36)))
                                        (QREFELT $ 38)))
                        (EXIT
                         (LETT |p|
                               (SPADCALL |p| (SPADCALL |term| |derivation|)
                                         (QREFELT $ 91)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |ans| |p|))))))))) 

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
         (SEQ (LETT |coef0| (|spadConstant| $ 28))
              (LETT |notelm| (LETT |answr| (|spadConstant| $ 95)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |p| (|spadConstant| $ 95) (QREFELT $ 96)))
                     (GO G191)))
                   (SEQ
                    (LETT |ans1|
                          (SPADCALL (LETT |n| (SPADCALL |p| (QREFELT $ 97)))
                                    (LETT |a| (SPADCALL |p| (QREFELT $ 98)))
                                    FRDE))
                    (LETT |answr|
                          (SPADCALL
                           (SPADCALL |answr|
                                     (SPADCALL (QVELT |ans1| 0) |n|
                                               (QREFELT $ 99))
                                     (QREFELT $ 100))
                           (SPADCALL (QVELT |ans1| 2) 0 (QREFELT $ 99))
                           (QREFELT $ 100)))
                    (COND
                     ((NOT (QVELT |ans1| 3))
                      (SEQ
                       (LETT |missing|
                             (SPADCALL |a| (QVELT |ans1| 1) (QREFELT $ 101)))
                       (EXIT
                        (COND ((ZEROP |n|) (LETT |coef0| |missing|))
                              ('T
                               (LETT |notelm|
                                     (SPADCALL |notelm|
                                               (SPADCALL |missing| |n|
                                                         (QREFELT $ 99))
                                               (QREFELT $ 100)))))))))
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 102)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL |notelm| (QREFELT $ 103))
                 (CONS 0 (CONS |answr| |coef0|)))
                ('T
                 (CONS 1
                       (CONS |answr|
                             (SPADCALL |notelm|
                                       (SPADCALL |coef0| 0 (QREFELT $ 99))
                                       (QREFELT $ 100)))))))))) 

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
                   (QREFELT $ 104))
                  (QREFELT $ 83))) 

(SDEFUN |INTTR;primintegrate;FMMMR;12|
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
          (LETT |rec| (|INTTR;monomialIntegrate1| |f| |denint| |derivation| $))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0)) (QREFELT $ 105)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |u2|
                (|INTTR;primintegratepoly| (QVELT |rec| 2) |extendedint|
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                            |derivation|)
                  (QREFELT $ 106))
                 $))
          (EXIT
           (COND
            ((QEQCAR |u2| 1)
             (CONS
              (SPADCALL
               (SPADCALL |i1|
                         (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                                   (QREFELT $ 48))
                         (QREFELT $ 83))
               (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 19))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                          (QREFELT $ 19))
                         (QREFELT $ 104))
               (QREFELT $ 83))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                                  (QREFELT $ 48))
                        (QREFELT $ 83))
              (QCDR (QCDR |u2|))))))))) 

(SDEFUN |INTTR;expintegrate;FMMMR;13|
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
          (|special| (|LaurentPolynomial| F UP)) (#1=#:G211 NIL)
          (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ
          (LETT |rec| (|INTTR;monomialIntegrate1| |f| |denint| |derivation| $))
          (COND
           ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0)) (QREFELT $ 105)))
            (EXIT
             (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
          (LETT |special|
                (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 114))
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 46))
                                      (QREFELT $ 114))
                                     (SPADCALL
                                      (SPADCALL (QVELT |rec| 1) (QREFELT $ 50))
                                      (QREFELT $ 114))
                                     (QREFELT $ 116)))
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
                          (QREFELT $ 100)))
          (LETT |u2| (|INTTR;expintegratepoly2| |special| FRDE $))
          (EXIT
           (COND
            ((QEQCAR |u2| 1)
             (CONS
              (SPADCALL
               (SPADCALL |i1|
                         (SPADCALL
                          (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 117))
                          (QREFELT $ 48))
                         (QREFELT $ 83))
               (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                          (QREFELT $ 19))
                         (QREFELT $ 104))
               (QREFELT $ 83))
              (|spadConstant| $ 28)))
            ('T
             (CONS
              (SPADCALL |i1|
                        (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 117))
                                  (QREFELT $ 48))
                        (QREFELT $ 83))
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
                 ((SPADCALL |lcoeff| (|spadConstant| $ 28) (QREFELT $ 121))
                  NIL)
                 ('T
                  (LIST
                   (VECTOR (|spadConstant| $ 68)
                           (|INTTR;UP2UPR|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             (SPADCALL |lcoeff| (QREFELT $ 14)) (QREFELT $ 91))
                            $)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             (QREFELT $ 19))
                            1 (QREFELT $ 122)))))))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ans| (QREFELT $ 117)) |logs| NIL
                      (QREFELT $ 77))
            (SPADCALL (SPADCALL |p| (QREFELT $ 117))
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 19))
                      (QREFELT $ 104))
            (QREFELT $ 83)))))) 

(SDEFUN |INTTR;lambintegrate;FFMMMMR;15|
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
          (|sp| (|LaurentPolynomial| F UP)) (#1=#:G234 NIL) (|n| (|Integer|))
          (|sd| (UP)) (|i1| (|IntegrationResult| (|Fraction| UP)))
          (|rec|
           (|Record| (|:| |ir| (|IntegrationResult| (|Fraction| UP)))
                     (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
         (SEQ (LETT |rec| (SPADCALL |f| |pderiv| (QREFELT $ 85)))
              (COND
               ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0)) (QREFELT $ 105)))
                (EXIT
                 (CONS (|INTTR;notelementary| |rec| $)
                       (|spadConstant| $ 124)))))
              (LETT |sd| (SPADCALL (QVELT |rec| 1) (QREFELT $ 50)))
              (LETT |n| (- (SPADCALL |sd| (QREFELT $ 35))))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |sd| (QREFELT $ 39)) (|spadConstant| $ 27)
                           (QREFELT $ 30))
                 (SEQ
                  (SPADCALL (SPADCALL |sd| (QREFELT $ 126)) (QREFELT $ 128))
                  (EXIT
                   (|error| "lambintegrate: unexpected Darboux polynomial"))))
                ('T
                 (SEQ
                  (LETT |sp|
                        (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 114))
                                  (PROG2
                                      (LETT #1#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QVELT |rec| 1)
                                                        (QREFELT $ 46))
                                              (QREFELT $ 114))
                                             (SPADCALL |sd| (QREFELT $ 114))
                                             (QREFELT $ 116)))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (|LaurentPolynomial|
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7))
                                                    (|Union|
                                                     (|LaurentPolynomial|
                                                      (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                                     "failed")
                                                    #1#))
                                  (QREFELT $ 100)))
                  (LETT |ri2|
                        (|INTTR;lamintegratepoly| |sp| |dx| |n| |fderiv|
                         |extint| |lfint| $))
                  (EXIT
                   (CONS (SPADCALL |i1| (QCAR |ri2|) (QREFELT $ 83))
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
         ((#2=#:G268 NIL) (|answr| (|LaurentPolynomial| F UP)) (|clg0| (F))
          (|db1| (F)) (|b1| (F)) (#3=#:G269 NIL) (|i0| (|IntegrationResult| F))
          (|lcoeff| (F)) (|ans1| #1#) (|p0| (F)) (|d| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |answr| (|spadConstant| $ 95))
                (LETT |lcoeff| (|spadConstant| $ 28))
                (LETT |i0| (|spadConstant| $ 124))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 95) (QREFELT $ 96)))
                       (GO G191)))
                     (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 97)))
                          (EXIT
                           (COND
                            ((< |d| (- |n| 2))
                             (PROGN
                              (LETT #3#
                                    (CONS (|INTTR;mkir| |answr| |lcoeff| |p| $)
                                          |i0|))
                              (GO #4=#:G267)))
                            ('T
                             (SEQ
                              (EXIT
                               (SEQ (LETT |p0| (SPADCALL |p| (QREFELT $ 98)))
                                    (COND
                                     ((SPADCALL |d| 1 (QREFELT $ 133))
                                      (SEQ
                                       (LETT |ans1| (SPADCALL |p0| |extint|))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |ans1| 1)
                                          (PROGN
                                           (LETT #3#
                                                 (CONS
                                                  (|INTTR;mkir| |answr|
                                                   |lcoeff| |p| $)
                                                  |i0|))
                                           (GO #4#)))
                                         ('T
                                          (SEQ (LETT |b1| (QCAR (QCDR |ans1|)))
                                               (LETT |db1|
                                                     (SPADCALL |b1| |fderiv|))
                                               (EXIT
                                                (LETT |clg0|
                                                      (COND
                                                       ((SPADCALL |d| 0
                                                                  (QREFELT $
                                                                           133))
                                                        (SPADCALL
                                                         (QCDR (QCDR |ans1|))
                                                         (SPADCALL |d|
                                                                   (QREFELT $
                                                                            134))
                                                         (QREFELT $ 90)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |lcoeff|
                                                               (QCDR
                                                                (QCDR |ans1|)))
                                                         (EXIT
                                                          (|spadConstant| $
                                                                          28)))))))))))))
                                     ('T
                                      (SEQ (LETT |i0| (SPADCALL |p0| |lfint|))
                                           (COND
                                            ((NULL
                                              (SPADCALL |i0| (QREFELT $ 135)))
                                             (EXIT
                                              (PROGN
                                               (LETT #3#
                                                     (CONS
                                                      (|INTTR;mkir| |answr|
                                                       |lcoeff|
                                                       (SPADCALL |p|
                                                                 (QREFELT $
                                                                          102))
                                                       $)
                                                      |i0|))
                                               (GO #4#)))))
                                           (LETT |b1| (|spadConstant| $ 28))
                                           (LETT |db1| |p0|)
                                           (EXIT
                                            (LETT |clg0|
                                                  (|spadConstant| $ 28))))))
                                    (LETT |answr|
                                          (SPADCALL
                                           (SPADCALL |answr|
                                                     (SPADCALL |b1| (- |d| 1)
                                                               (QREFELT $ 99))
                                                     (QREFELT $ 100))
                                           (SPADCALL |clg0| |d| (QREFELT $ 99))
                                           (QREFELT $ 100)))
                                    (LETT |p|
                                          (SPADCALL
                                           (SPADCALL |p| (QREFELT $ 102))
                                           (SPADCALL
                                            (SPADCALL |db1|
                                                      (SPADCALL
                                                       (SPADCALL (- |d| 1) |dx|
                                                                 (QREFELT $
                                                                          89))
                                                       |b1| (QREFELT $ 136))
                                                      (QREFELT $ 137))
                                            (- |d| 1) (QREFELT $ 99))
                                           (QREFELT $ 138)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |p| (|spadConstant| $ 95)
                                                 (QREFELT $ 96))
                                       (COND
                                        ((>= (SPADCALL |p| (QREFELT $ 97)) |d|)
                                         (PROGN
                                          (LETT #2#
                                                (SEQ
                                                 (SPADCALL
                                                  (SPADCALL |p|
                                                            (QREFELT $ 139))
                                                  (QREFELT $ 128))
                                                 (EXIT
                                                  (|error| "impossible"))))
                                          (GO #5=#:G263)))))))))
                              #5# (EXIT #2#))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS (|INTTR;mkir| |answr| |lcoeff| (|spadConstant| $ 95) $)
                       |i0|))))
          #4# (EXIT #3#)))) 

(SDEFUN |INTTR;primintegratepoly|
        ((|p| UP)
         (|extendedint| |Mapping|
          #1=(|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F)
         (|t'| F)
         ($ |Union| (|Record| (|:| |answer| UP) (|:| |a0| F))
          (|Record| (|:| |elem| UP) (|:| |notelem| UP))))
        (SPROG
         ((|ans1| #1#) (|rp| (F)) (|ans| (UP)) (#2=#:G279 NIL) (#3=#:G286 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 47))
             (CONS 0 (CONS (|spadConstant| $ 27) (|spadConstant| $ 28))))
            (#4='T
             (SEQ (LETT |ans| (|spadConstant| $ 27))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL (LETT |d| (SPADCALL |p| (QREFELT $ 35))) 0
                                    (QREFELT $ 140)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans1|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                        |extendedint|))
                        (EXIT
                         (COND
                          ((QEQCAR |ans1| 1)
                           (PROGN
                            (LETT #3# (CONS 1 (CONS |ans| |p|)))
                            (GO #5=#:G285)))
                          ('T
                           (SEQ
                            (LETT |p|
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |d| |t'|
                                                        (QREFELT $ 141))
                                              (QCAR (QCDR |ans1|))
                                              (QREFELT $ 136))
                                             (PROG1 (LETT #2# (- |d| 1))
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 36))
                                            (QREFELT $ 91)))
                            (EXIT
                             (LETT |ans|
                                   (SPADCALL
                                    (SPADCALL |ans|
                                              (SPADCALL (QCAR (QCDR |ans1|))
                                                        |d| (QREFELT $ 36))
                                              (QREFELT $ 38))
                                    (SPADCALL
                                     (SPADCALL (QCDR (QCDR |ans1|))
                                               (SPADCALL (+ |d| 1)
                                                         (QREFELT $ 134))
                                               (QREFELT $ 90))
                                     (+ |d| 1) (QREFELT $ 36))
                                    (QREFELT $ 38)))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |ans1|
                        (SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT $ 106)))
                                  |extendedint|))
                  (EXIT
                   (COND ((QEQCAR |ans1| 1) (CONS 0 (CONS |ans| |rp|)))
                         (#4#
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QCDR (QCDR |ans1|)) 1
                                             (QREFELT $ 36))
                                   (SPADCALL (QCAR (QCDR |ans1|))
                                             (QREFELT $ 14))
                                   (QREFELT $ 38))
                                  |ans| (QREFELT $ 38))
                                 (|spadConstant| $ 28))))))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |TranscendentalIntegration;|)) 

(DEFUN |TranscendentalIntegration| (&REST #1=#:G287)
  (SPROG NIL
         (PROG (#2=#:G288)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TranscendentalIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalIntegration|)))))))))) 

(DEFUN |TranscendentalIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|TranscendentalIntegration| DV$1 DV$2))
          (LETT $ (GETREFV 142))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Record| (|:| |normal| 65) (|:| |special| 65))
              (|MonomialExtensionTools| 6 7) (173 . |splitSquarefree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 62) (|:| |factor| 7) (|:| |exponent| 34))
              (|List| 63) (|Factored| 7) (179 . |factorList|) (|Fraction| 87)
              (184 . |One|) (188 . |primitivePart|)
              (|CommuteUnivariatePolynomialCategory| 6 7 15) (194 . |swap|)
              (199 . =)
              (|Record| (|:| |scalar| 67) (|:| |coeff| 20) (|:| |logand| 20))
              (|List| 73) (|Record| (|:| |integrand| 8) (|:| |intvar| 8))
              (|List| 75) (205 . |mkAnswer|) (|Mapping| 8 8)
              (212 . |differentiate|) (218 . -) (|Union| 7 '"failed")
              (224 . |retractIfCan|) (229 . +)
              (|Record| (|:| |ir| 40) (|:| |specpart| 8) (|:| |polypart| 7))
              |INTTR;monomialIntegrate;FMR;8| (235 . |One|) (|Integer|)
              (239 . >) (245 . *) (251 . /) (257 . -)
              (|Record| (|:| |answer| 7) (|:| |polypart| 7))
              |INTTR;monomialIntPoly;UPMR;9| (|LaurentPolynomial| 6 7)
              (263 . |Zero|) (267 . ~=) (273 . |degree|)
              (278 . |leadingCoefficient|) (283 . |monomial|) (289 . +)
              (295 . -) (301 . |reductum|) (306 . |zero?|) (311 . |integral|)
              (317 . |elem?|) (322 . |retract|)
              (|Record| (|:| |answer| 40) (|:| |a0| 6))
              (|Record| (|:| |answer| 8) (|:| |logpart| 8) (|:| |ir| 40))
              (|Mapping| 108 8) (|Record| (|:| |ratpart| 6) (|:| |coeff| 6))
              (|Union| 110 '"failed") (|Mapping| 111 6)
              |INTTR;primintegrate;FMMMR;12| (327 . |coerce|)
              (|Union| $ '"failed") (332 . |exquo|) (338 . |convert|)
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |primpart| 6)
                        (|:| |sol?| 29))
              (|Mapping| 118 87 6) |INTTR;expintegrate;FMMMR;13| (343 . =)
              (349 . |monomial|) (|IntegrationResult| 6) (355 . |Zero|)
              (|OutputForm|) (359 . |coerce|) (|Void|) (364 . |print|)
              (|Record| (|:| |answer| 40) (|:| |a0| 123)) (|Mapping| 6 6)
              (|Mapping| 123 6) |INTTR;lambintegrate;FFMMMMR;15| (369 . ~=)
              (375 . |coerce|) (380 . |elem?|) (385 . *) (391 . +) (397 . -)
              (403 . |coerce|) (408 . >) (414 . *))
           '#(|primintegrate| 420 |monomialIntegrate| 428 |monomialIntPoly| 434
              |lambintegrate| 440 |expintegrate| 450)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 141
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
                                                   65 64 0 66 0 67 0 68 2 55 15
                                                   15 7 69 1 70 15 15 71 2 7 29
                                                   0 0 72 3 40 0 8 74 76 77 2
                                                   40 8 0 78 79 2 8 0 0 0 80 1
                                                   8 81 0 82 2 40 0 0 0 83 0 8
                                                   0 86 2 87 29 0 0 88 2 6 0 87
                                                   0 89 2 6 0 0 0 90 2 7 0 0 0
                                                   91 0 94 0 95 2 94 29 0 0 96
                                                   1 94 87 0 97 1 94 6 0 98 2
                                                   94 0 6 87 99 2 94 0 0 0 100
                                                   2 6 0 0 0 101 1 94 0 0 102 1
                                                   94 29 0 103 2 40 0 8 8 104 1
                                                   40 29 0 105 1 7 6 0 106 1 94
                                                   0 7 114 2 94 115 0 0 116 1
                                                   94 8 0 117 2 6 29 0 0 121 2
                                                   20 0 8 34 122 0 123 0 124 1
                                                   7 125 0 126 1 125 127 0 128
                                                   2 87 29 0 0 133 1 6 0 87 134
                                                   1 123 29 0 135 2 6 0 0 0 136
                                                   2 6 0 0 0 137 2 94 0 0 0 138
                                                   1 94 125 0 139 2 34 29 0 0
                                                   140 2 6 0 34 0 141 4 0 107 8
                                                   11 109 112 113 2 0 84 8 11
                                                   85 2 0 92 7 11 93 6 0 129 8
                                                   6 130 11 112 131 132 4 0 107
                                                   8 11 109 119 120)))))
           '|lookupComplete|)) 
