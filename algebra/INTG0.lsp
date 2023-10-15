
(SDEFUN |INTG0;kerdiff| ((|sa| F) (|a| F) ($ |List| (|Kernel| F)))
        (SPADCALL (SPADCALL |sa| (QREFELT $ 15)) (SPADCALL |a| (QREFELT $ 15))
                  (QREFELT $ 17))) 

(SDEFUN |INTG0;checkroot| ((|f| F) (|l| |List| (|Kernel| F)) ($ F))
        (COND ((NULL |l|) |f|)
              ('T (SPADCALL |f| (|SPADfirst| |l|) (QREFELT $ 19))))) 

(SDEFUN |INTG0;univ|
        ((|c| F) (|l| |List| (|Kernel| F)) (|x| |Kernel| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPADCALL (|INTG0;checkroot| |c| |l| $) |x| (QREFELT $ 22))) 

(SDEFUN |INTG0;univariate;F2KSupSup;4|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (SPADCALL |f| |y| |p| (QREFELT $ 25)) |x| (QREFELT $ 27))) 

(SDEFUN |INTG0;lift;SupKSup;5|
        ((|p| |SparseUnivariatePolynomial| F) (|k| |Kernel| F)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|INTG0;lift;SupKSup;5!0| (VECTOR $ |k|)) |p|
                         (QREFELT $ 31)))) 

(SDEFUN |INTG0;lift;SupKSup;5!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTG0;lift;SupKSup;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 22)))))) 

(SDEFUN |INTG0;proot|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |coef| (|SparseUnivariatePolynomial| F))
          (|:| |radicand| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|r1| #1=(|SparseUnivariatePolynomial| F)) (|c1| #1#)
          (|rr1|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|u1| (F)) (|e2| (|NonNegativeInteger|)) (#2=#:G125 NIL)
          (|e1| (|Integer|)) (|f1| (|SparseUnivariatePolynomial| F))
          (#3=#:G131 NIL) (|fac| NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |ff| (SPADCALL |p| (QREFELT $ 33)) . #4=(|INTG0;proot|))
              (LETT |c1| (|spadConstant| $ 34) . #4#)
              (LETT |r1| (|spadConstant| $ 34) . #4#)
              (SEQ (LETT |fac| NIL . #4#)
                   (LETT #3# (SPADCALL |ff| (QREFELT $ 38)) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QCAR |fac|) . #4#)
                        (LETT |e1| (QCDR |fac|) . #4#)
                        (LETT |e2|
                              (PROG1 (LETT #2# (QUOTIENT2 |e1| 2) . #4#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              . #4#)
                        (LETT |c1|
                              (SPADCALL
                               (SPADCALL (QCAR |fac|) |e2| (QREFELT $ 40)) |c1|
                               (QREFELT $ 41))
                              . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |e1| (SPADCALL 2 |e2| (QREFELT $ 43))
                                     (QREFELT $ 46))
                           (LETT |r1|
                                 (SPADCALL (QCAR |fac|) |r1| (QREFELT $ 41))
                                 . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |u1|
                    (SPADCALL (SPADCALL |ff| (QREFELT $ 47)) (QREFELT $ 48))
                    . #4#)
              (LETT |rr1| (SPADCALL |u1| 2 (QREFELT $ 51)) . #4#)
              (LETT |c1| (SPADCALL (QVELT |rr1| 1) |c1| (QREFELT $ 52)) . #4#)
              (LETT |r1| (SPADCALL (QVELT |rr1| 2) |r1| (QREFELT $ 52)) . #4#)
              (EXIT (CONS |c1| |r1|))))) 

(SDEFUN |INTG0;rationalize_log|
        ((|ll| |Record| (|:| |scalar| (|Fraction| (|Integer|)))
          (|:| |coeff| (|SparseUnivariatePolynomial| F))
          (|:| |logand| (|SparseUnivariatePolynomial| F)))
         (|k1| |Kernel| F)
         ($ |List|
          (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                    (|:| |coeff| (|SparseUnivariatePolynomial| F))
                    (|:| |logand| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|ppn| (|SparseUnivariatePolynomial| F))
          (|rr1|
           (|Record| (|:| |coef| (|SparseUnivariatePolynomial| F))
                     (|:| |radicand| (|SparseUnivariatePolynomial| F))))
          (|fun2| #1=(|SparseUnivariatePolynomial| F))
          (|fun2c| #2=(|SparseUnivariatePolynomial| F)) (|ppcc| #2#)
          (|c2| (|Fraction| (|Integer|))) (|c1| (|Fraction| (|Integer|)))
          (|fun1| #1#) (|fun1c| #2#) (|fun| (|SparseUnivariatePolynomial| F))
          (|ppc| (|SparseUnivariatePolynomial| F)) (#3=#:G137 NIL)
          (|ppr| (|SparseUnivariatePolynomial| F))
          (|pol1| #4=(|SparseUnivariatePolynomial| F)) (|pol0| #4#)
          (|polu|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|opol| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |opol| (QVELT |ll| 1) . #5=(|INTG0;rationalize_log|))
              (LETT |polu|
                    (SPADCALL
                     (CONS #'|INTG0;rationalize_log!0| (VECTOR $ |k1|)) |opol|
                     (QREFELT $ 58))
                    . #5#)
              (LETT |pol0|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!1| $) |polu|
                              (QREFELT $ 65))
                    . #5#)
              (LETT |pol1|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!2| $) |polu|
                              (QREFELT $ 65))
                    . #5#)
              (LETT |ppr|
                    (COND
                     ((SPADCALL |pol1| (|spadConstant| $ 69) (QREFELT $ 70))
                      |pol0|)
                     (#6='T (SPADCALL |pol0| |pol1| (QREFELT $ 71))))
                    . #5#)
              (LETT |ppc|
                    (PROG2
                        (LETT #3# (SPADCALL |opol| |ppr| (QREFELT $ 73)) . #5#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 7))
                                       "failed")
                                      #3#))
                    . #5#)
              (LETT |fun| (QVELT |ll| 2) . #5#) (LETT |res| NIL . #5#)
              (COND
               ((SPADCALL (SPADCALL |ppr| (QREFELT $ 74)) 0 (QREFELT $ 75))
                (SEQ (LETT |c1| (QVELT |ll| 0) . #5#)
                     (LETT |fun1| (SPADCALL |fun| |ppr| (QREFELT $ 76)) . #5#)
                     (LETT |fun1c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!3| (VECTOR $ |k1|))
                            |fun1| (QREFELT $ 81))
                           . #5#)
                     (EXIT
                      (COND
                       ((SPADCALL |fun1c| |fun1| (QREFELT $ 82))
                        (SEQ
                         (LETT |fun1| (SPADCALL |fun1c| |fun1| (QREFELT $ 41))
                               . #5#)
                         (LETT |c2|
                               (SPADCALL |c1| (SPADCALL 2 (QREFELT $ 84))
                                         (QREFELT $ 85))
                               . #5#)
                         (LETT |rr1| (|INTG0;proot| |fun1| $) . #5#)
                         (EXIT
                          (COND
                           ((SPADCALL (QCDR |rr1|) (|spadConstant| $ 34)
                                      (QREFELT $ 70))
                            (LETT |res|
                                  (CONS (VECTOR |c1| |ppr| (QCAR |rr1|)) |res|)
                                  . #5#))
                           (#6#
                            (LETT |res| (CONS (VECTOR |c2| |ppr| |fun1|) |res|)
                                  . #5#))))))
                       (#6#
                        (LETT |res| (CONS (VECTOR |c1| |ppr| |fun1|) |res|)
                              . #5#)))))))
              (COND
               ((SPADCALL (SPADCALL |ppc| (QREFELT $ 74)) 0 (QREFELT $ 75))
                (SEQ (LETT |c1| (QVELT |ll| 0) . #5#)
                     (LETT |c2|
                           (SPADCALL |c1| (SPADCALL 2 (QREFELT $ 84))
                                     (QREFELT $ 85))
                           . #5#)
                     (LETT |fun2| (SPADCALL |fun| |ppc| (QREFELT $ 76)) . #5#)
                     (LETT |ppcc|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!4| (VECTOR $ |k1|))
                            |ppc| (QREFELT $ 81))
                           . #5#)
                     (LETT |fun2c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!5| (VECTOR $ |k1|))
                            |fun2| (QREFELT $ 81))
                           . #5#)
                     (LETT |fun2|
                           (SPADCALL (SPADCALL |ppcc| |fun2| (QREFELT $ 41))
                                     (SPADCALL |ppc| |fun2c| (QREFELT $ 41))
                                     (QREFELT $ 86))
                           . #5#)
                     (LETT |rr1| (|INTG0;proot| |fun2| $) . #5#)
                     (LETT |ppn| (SPADCALL |ppc| |ppcc| (QREFELT $ 41)) . #5#)
                     (EXIT
                      (COND
                       ((SPADCALL (QCDR |rr1|) (|spadConstant| $ 34)
                                  (QREFELT $ 70))
                        (LETT |res|
                              (CONS (VECTOR |c1| |ppn| (QCAR |rr1|)) |res|)
                              . #5#))
                       (#6#
                        (LETT |res| (CONS (VECTOR |c2| |ppn| |fun2|) |res|)
                              . #5#)))))))
              (EXIT |res|)))) 

(SDEFUN |INTG0;rationalize_log!5| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 77)) (QREFELT $ 78))
                      (QREFELT $ 79)))))) 

(SDEFUN |INTG0;rationalize_log!4| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 77)) (QREFELT $ 78))
                      (QREFELT $ 79)))))) 

(SDEFUN |INTG0;rationalize_log!3| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 77)) (QREFELT $ 78))
                      (QREFELT $ 79)))))) 

(SDEFUN |INTG0;rationalize_log!2| ((|c| NIL) ($ NIL))
        (SPADCALL |c| (|spadConstant| $ 68) (QREFELT $ 62))) 

(SDEFUN |INTG0;rationalize_log!1| ((|c| NIL) ($ NIL))
        (SPADCALL |c| (|spadConstant| $ 61) (QREFELT $ 62))) 

(SDEFUN |INTG0;rationalize_log!0| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1| (SPADCALL |k1| (QREFELT $ 54))
                      (QREFELT $ 25)))))) 

(SDEFUN |INTG0;rationalize_ir;IrKIr;8|
        ((|irf| |IntegrationResult| F) (|k1| |Kernel| F)
         ($ |IntegrationResult| F))
        (SPROG
         ((|lp1|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G204 NIL) (|ll| NIL) (|rp1| (F)) (|rp| (F)))
         (SEQ
          (LETT |rp| (SPADCALL |irf| (QREFELT $ 88))
                . #2=(|INTG0;rationalize_ir;IrKIr;8|))
          (LETT |rp1|
                (SPADCALL
                 (SPADCALL |rp|
                           (SPADCALL |rp| |k1|
                                     (SPADCALL (SPADCALL |k1| (QREFELT $ 77))
                                               (QREFELT $ 78))
                                     (QREFELT $ 79))
                           (QREFELT $ 89))
                 (SPADCALL 2 (QREFELT $ 90)) (QREFELT $ 91))
                . #2#)
          (LETT |lp1| NIL . #2#)
          (SEQ (LETT |ll| NIL . #2#)
               (LETT #1# (SPADCALL |irf| (QREFELT $ 94)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ll| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lp1|
                       (SPADCALL (|INTG0;rationalize_log| |ll| |k1| $) |lp1|
                                 (QREFELT $ 95))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |rp1| |lp1| (SPADCALL |irf| (QREFELT $ 98))
                     (QREFELT $ 99)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;9|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F) ($ |IntegrationResult| F))
        (SPROG
         ((|irf1| (|IntegrationResult| F))
          (|irf|
           (|IntegrationResult| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|f0|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ff|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |ff|
                (SPADCALL |f| |x| |y| (SPADCALL |y| (QREFELT $ 54))
                          (QREFELT $ 28))
                . #1=(|INTG0;palgint0;F2KFSupIr;9|))
          (LETT |f0| (SPADCALL |ff| (QREFELT $ 101)) . #1#)
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $) . #1#)
          (LETT |rf|
                (|INTG0;mkRat|
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 102)) |x|
                           (SPADCALL |y| (QREFELT $ 77)) (QREFELT $ 103))
                 (QVELT |pr| 1) (QVELT |pr| 2) $)
                . #1#)
          (LETT |irf| (SPADCALL |rf| (QREFELT $ 107)) . #1#)
          (LETT |irf1|
                (SPADCALL
                 (CONS #'|INTG0;palgint0;F2KFSupIr;9!0| (VECTOR $ |pr|)) |irf|
                 (QREFELT $ 112))
                . #1#)
          (COND
           ((NULL (NULL (QVELT |pr| 2)))
            (LETT |irf1|
                  (SPADCALL |irf1| (|SPADfirst| (QVELT |pr| 2))
                            (QREFELT $ 100))
                  . #1#)))
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;9!1| (VECTOR $ |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT $ 113))
                                (QREFELT $ 107))
                      (QREFELT $ 112))
            |irf1| (QREFELT $ 114)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;9!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;9|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 109)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;9!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;9|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 109)))))) 

(SDEFUN |INTG0;quadsubst|
        ((|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|p| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |diff| F)
          (|:| |subs|
               (|Record| (|:| |coeff| F) (|:| |var| (|List| (|Kernel| F)))
                         (|:| |val| (|List| F))))
          (|:| |newk| (|List| (|Kernel| F)))))
        (SPROG
         ((|yy| (F)) (|ux| (F)) (|q| (F)) (|xx| (F)) (|sc| (F)) (|u2ma| (F))
          (|ua| (F)) (|bm2u| (F)) (|sa| (F)) (|a| (F)) (|c| (F)) (|b| (F))
          (|u| (F)))
         (SEQ
          (LETT |u| (SPADCALL (QREFELT $ 13) (QREFELT $ 77))
                . #1=(|INTG0;quadsubst|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 62)) . #1#)
          (LETT |c| (SPADCALL |p| 0 (QREFELT $ 62)) . #1#)
          (LETT |sa|
                (SPADCALL
                 (SPADCALL (LETT |a| (SPADCALL |p| 2 (QREFELT $ 62)) . #1#)
                           (QREFELT $ 116))
                 (QREFELT $ 118))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (SPADCALL (SPADCALL |b| |b| (QREFELT $ 119))
                        (SPADCALL (SPADCALL 4 |a| (QREFELT $ 120)) |c|
                                  (QREFELT $ 119))
                        (QREFELT $ 121))
              (QREFELT $ 122))
             (VECTOR (SPADCALL |x| (QREFELT $ 77))
                     (VECTOR (|spadConstant| $ 67) (LIST |x| |y|)
                             (LIST |u|
                                   (SPADCALL
                                    (SPADCALL |sa|
                                              (SPADCALL |u|
                                                        (SPADCALL |b|
                                                                  (SPADCALL 2
                                                                            |a|
                                                                            (QREFELT
                                                                             $
                                                                             120))
                                                                  (QREFELT $
                                                                           91))
                                                        (QREFELT $ 89))
                                              (QREFELT $ 119))
                                    (SPADCALL |den| |x| |u| (QREFELT $ 79))
                                    (QREFELT $ 91))))
                     NIL))
            ((NULL (|INTG0;kerdiff| |sa| |a| $))
             (SEQ
              (LETT |bm2u|
                    (SPADCALL |b|
                              (SPADCALL (SPADCALL 2 |u| (QREFELT $ 120)) |sa|
                                        (QREFELT $ 119))
                              (QREFELT $ 121))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |u| 2 (QREFELT $ 123))
                                               |c| (QREFELT $ 121))
                                     |bm2u| (QREFELT $ 91))
                                    . #1#)
                              (QREFELT $ 79))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ua|
                           (SPADCALL |u| (SPADCALL |xx| |sa| (QREFELT $ 119))
                                     (QREFELT $ 89))
                           . #1#)
                     |q| (QREFELT $ 91))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77)) (QREFELT $ 119))
                 (SPADCALL (SPADCALL |x| (QREFELT $ 77)) |sa| (QREFELT $ 119))
                 (QREFELT $ 121))
                (VECTOR
                 (SPADCALL (SPADCALL 2 |ua| (QREFELT $ 120)) |bm2u|
                           (QREFELT $ 91))
                 (LIST |x| |y|) (LIST |xx| |yy|))
                NIL))))
            ('T
             (SEQ
              (LETT |u2ma|
                    (SPADCALL (SPADCALL |u| 2 (QREFELT $ 123)) |a|
                              (QREFELT $ 121))
                    . #1#)
              (LETT |sc|
                    (SPADCALL (SPADCALL |c| (QREFELT $ 116)) (QREFELT $ 118))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL |b|
                                               (SPADCALL
                                                (SPADCALL 2 |u|
                                                          (QREFELT $ 120))
                                                |sc| (QREFELT $ 119))
                                               (QREFELT $ 121))
                                     |u2ma| (QREFELT $ 91))
                                    . #1#)
                              (QREFELT $ 79))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ux|
                           (SPADCALL (SPADCALL |xx| |u| (QREFELT $ 119)) |sc|
                                     (QREFELT $ 89))
                           . #1#)
                     |q| (QREFELT $ 91))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77))
                            (QREFELT $ 119))
                  |sc| (QREFELT $ 121))
                 (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 91))
                (VECTOR
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 |ux| (QREFELT $ 120)) |u2ma|
                            (QREFELT $ 91))
                  (QREFELT $ 78))
                 (LIST |x| |y|) (LIST |xx| |yy|))
                (|INTG0;kerdiff| |sc| |c| $)))))))))) 

(SDEFUN |INTG0;mkRatlx|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|t| F) (|z| |Kernel| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|rat| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (LETT |rat|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |f| (LIST |x| |y|)
                                  (LIST |t| (SPADCALL |z| (QREFELT $ 77)))
                                  (QREFELT $ 125))
                        |z| (QREFELT $ 22))
                       |dx| (QREFELT $ 126))
                      |INTG0;mkRatlx|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 127))
                           (SPADCALL |rat| (QREFELT $ 128)) (QREFELT $ 129)))))) 

(SDEFUN |INTG0;mkRat|
        ((|f| F)
         (|rec| |Record| (|:| |coeff| F) (|:| |var| (|List| (|Kernel| F)))
          (|:| |val| (|List| F)))
         (|l| |List| (|Kernel| F))
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|rat| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (LETT |rat|
                      (SPADCALL
                       (|INTG0;checkroot|
                        (SPADCALL (QVELT |rec| 0)
                                  (SPADCALL |f| (QVELT |rec| 1) (QVELT |rec| 2)
                                            (QREFELT $ 125))
                                  (QREFELT $ 119))
                        |l| $)
                       (QREFELT $ 13) (QREFELT $ 22))
                      |INTG0;mkRat|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 127))
                           (SPADCALL |rat| (QREFELT $ 128)) (QREFELT $ 129)))))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;13|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |IntegrationResult| F))
        (SPROG NIL
               (SPADCALL (CONS #'|INTG0;palgint0;F3KFFIr;13!0| (VECTOR $ |y|))
                         (SPADCALL
                          (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                          (QREFELT $ 107))
                         (QREFELT $ 112)))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;13!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F3KFFIr;13|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 130)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFU;14|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) ($ |Union| F #2#))
        (SPROG ((|u| #1#) (#3=#:G230 NIL))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL |f| (LIST |x| |y|)
                                 (LIST |xx| (SPADCALL |z| (QREFELT $ 77)))
                                 (QREFELT $ 125))
                       (SPADCALL (SPADCALL |dx| |z| (QREFELT $ 130))
                                 (SPADCALL |g| (LIST |x| |y|)
                                           (LIST |xx|
                                                 (SPADCALL |z| (QREFELT $ 77)))
                                           (QREFELT $ 125))
                                 (QREFELT $ 119))
                       (PROG2
                           (LETT #3# (SPADCALL |z| (QREFELT $ 133))
                                 . #4=(|INTG0;palgRDE0;2F2KMKFFU;14|))
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                         (|Union| (|Symbol|) "failed") #3#))
                       |rischde|)
                      . #4#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |u|) |z|
                                        (SPADCALL |y| (QREFELT $ 77))
                                        (QREFELT $ 79))))))))) 

(SDEFUN |INTG0;multivariate;SupK2F;15|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| F) ($ F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;15!0| (VECTOR $ |x|)) |p|
                 (QREFELT $ 138))
                |y| (QREFELT $ 139)))) 

(SDEFUN |INTG0;multivariate;SupK2F;15!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;multivariate;SupK2F;15|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 130)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;16|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|den| F) (|radi| |SparseUnivariatePolynomial| F) ($ |Union| F #2#))
        (SPROG
         ((|u| #1#) (#3=#:G250 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #4=(|INTG0;palgRDE0;2F2KMFSupU;16|))
          (LETT |u|
                (SPADCALL
                 (|INTG0;checkroot|
                  (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                            (QVELT (QVELT |pr| 1) 2) (QREFELT $ 125))
                  (QVELT |pr| 2) $)
                 (|INTG0;checkroot|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0)
                            (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                      (QVELT (QVELT |pr| 1) 2) (QREFELT $ 125))
                            (QREFELT $ 119))
                  (QVELT |pr| 2) $)
                 (PROG2
                     (LETT #3# (SPADCALL (QREFELT $ 13) (QREFELT $ 133)) . #4#)
                     (QCDR #3#)
                   (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                   (|Union| (|Symbol|) "failed") #3#))
                 |rischde|)
                . #4#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL (QCDR |u|) (QREFELT $ 13) (QVELT |pr| 0)
                                  (QREFELT $ 79))))))))) 

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;17|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G262 NIL) (|bas| (|List| F)) (#2=#:G272 NIL) (|b| NIL)
          (#3=#:G271 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #4="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#5=#:G270 NIL) (|i| NIL)
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #6=(|INTG0;palgLODE0;LF2KFSupR;17|))
          (LETT |d|
                (SPADCALL
                 (|INTG0;univ|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT $ 141))
                  (QVELT |pr| 2) (QREFELT $ 13) $)
                 1 (QREFELT $ 143))
                . #6#)
          (LETT |di| (|spadConstant| $ 144) . #6#)
          (LETT |op| (|spadConstant| $ 145) . #6#)
          (SEQ (LETT |i| 0 . #6#)
               (LETT #5# (SPADCALL |eq| (QREFELT $ 146)) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (|INTG0;univ|
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 147))
                                            (QVELT (QVELT |pr| 1) 1)
                                            (QVELT (QVELT |pr| 1) 2)
                                            (QREFELT $ 125))
                                  (QVELT |pr| 2) (QREFELT $ 13) $)
                                 |di| (QREFELT $ 148))
                                (QREFELT $ 149))
                      . #6#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 150)) . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (|INTG0;univ|
                           (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                     (QVELT (QVELT |pr| 1) 2) (QREFELT $ 125))
                           (QVELT |pr| 2) (QREFELT $ 13) $)
                          (QREFELT $ 154))
                . #6#)
          (LETT |bas|
                (PROGN
                 (LETT #3# NIL . #6#)
                 (SEQ (LETT |b| NIL . #6#) (LETT #2# (QCDR |rec|) . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL |b| (QVELT |pr| 0) (QREFELT $ 109))
                               #3#)
                              . #6#)))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (SPADCALL
                          (PROG2 (LETT #1# (QCAR |rec|) . #6#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|Fraction|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                            (|Union|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7)))
                                             #4#)
                                            #1#))
                          (QVELT |pr| 0) (QREFELT $ 109)))
                   |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFR;18|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| . #1=(|Kernel| F))
         (|kz| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#2=#:G279 NIL) (|bas| (|List| F)) (#3=#:G288 NIL) (|b| NIL)
          (#4=#:G287 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #5="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#6=#:G286 NIL) (|i| NIL) (|lv| (|List| F)) (|lk| (|List| #1#))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT $ 130))
                            (QREFELT $ 141))
                  |kz| (QREFELT $ 22))
                 1 (QREFELT $ 143))
                . #7=(|INTG0;palgLODE0;LF3KFFR;18|))
          (LETT |di| (|spadConstant| $ 144) . #7#)
          (LETT |op| (|spadConstant| $ 145) . #7#)
          (LETT |lk| (LIST |x| |y|) . #7#)
          (LETT |lv| (LIST |xx| (SPADCALL |kz| (QREFELT $ 77))) . #7#)
          (SEQ (LETT |i| 0 . #7#)
               (LETT #6# (SPADCALL |eq| (QREFELT $ 146)) . #7#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 147))
                                            |lk| |lv| (QREFELT $ 125))
                                  |kz| (QREFELT $ 22))
                                 |di| (QREFELT $ 148))
                                (QREFELT $ 149))
                      . #7#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 150)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g| |lk| |lv| (QREFELT $ 125))
                                    |kz| (QREFELT $ 22))
                          (QREFELT $ 154))
                . #7#)
          (LETT |bas|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |b| NIL . #7#) (LETT #3# (QCDR |rec|) . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |b| |y| (QREFELT $ 130)) #4#)
                              . #7#)))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (SPADCALL
                          (PROG2 (LETT #2# (QCAR |rec|) . #7#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|Fraction|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 7)))
                                            (|Union|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7)))
                                             #5#)
                                            #2#))
                          |y| (QREFELT $ 130)))
                   |bas|))))))) 

(DECLAIM (NOTINLINE |GenusZeroIntegration;|)) 

(DEFUN |GenusZeroIntegration| (&REST #1=#:G289)
  (SPROG NIL
         (PROG (#2=#:G290)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenusZeroIntegration|)
                                               '|domainEqualList|)
                    . #3=(|GenusZeroIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenusZeroIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GenusZeroIntegration|)))))))))) 

(DEFUN |GenusZeroIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GenusZeroIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|GenusZeroIntegration| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 158) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GenusZeroIntegration|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 156
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;17|) $))
             (QSETREFV $ 157
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFR;18|)
                             $)))))
          $))) 

(MAKEPROP '|GenusZeroIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|)
              '|dummy| (|List| 21) (9 . |kernels|) (|List| 11)
              (14 . |setDifference|) (|ElementaryFunctionStructurePackage| 6 7)
              (20 . |rootNormalize|) (|Fraction| 53) (|Kernel| $)
              (26 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 11)
                                                     7)
              (32 . |univariate|) (|SparseUnivariatePolynomial| 105)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 105 7) (|SparseUnivariatePolynomialFunctions2| 7 105)
              (39 . |map|) (|Factored| $) (45 . |squareFree|) (50 . |One|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 45)) (|List| 35)
              (|Factored| 23) (54 . |factors|) (|NonNegativeInteger|) (59 . ^)
              (65 . *) (|PositiveInteger|) (71 . *) (|Boolean|) (|Integer|)
              (77 . ~=) (83 . |unit|) (88 . |ground|)
              (|Record| (|:| |exponent| 39) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6
                                 (|SparseMultivariatePolynomial| 6 11) 7)
              (93 . |froot|) (99 . *) (|SparseUnivariatePolynomial| $)
              (105 . |minPoly|) (|SparseUnivariatePolynomial| 23)
              (|Mapping| 23 7) (|SparseUnivariatePolynomialFunctions2| 7 23)
              (110 . |map|) (116 . |Zero|) (120 . |Zero|) (124 . |Zero|)
              (128 . |coefficient|) (|Mapping| 7 23)
              (|SparseUnivariatePolynomialFunctions2| 23 7) (134 . |map|)
              (140 . |One|) (144 . |One|) (148 . |One|) (152 . |Zero|)
              (156 . =) (162 . |gcd|) (|Union| $ '"failed") (168 . |exquo|)
              (174 . |degree|) (179 . >) (185 . |rem|) (191 . |coerce|)
              (196 . -) (201 . |eval|) (|Mapping| 7 7) (208 . |map|) (214 . ~=)
              (|Fraction| 45) (220 . |coerce|) (225 . /) (231 . +)
              (|IntegrationResult| 7) (237 . |ratpart|) (242 . +)
              (248 . |coerce|) (253 . /)
              (|Record| (|:| |scalar| 83) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 92) (259 . |logpart|) (264 . |concat|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 96)
              (270 . |notelem|) (275 . |mkAnswer|)
              |INTG0;rationalize_ir;IrKIr;8| (282 . |reductum|)
              (287 . |leadingMonomial|) |INTG0;multivariate;SupK2F;15|
              (|IntegrationResult| 105) (|Fraction| 23)
              (|RationalIntegration| 7 23) (292 . |integrate|) (|Fraction| $)
              (297 . |elt|) (|Mapping| 7 105)
              (|IntegrationResultFunctions2| 105 7) (303 . |map|)
              (309 . |retract|) (314 . +) |INTG0;palgint0;F2KFSupIr;9|
              (320 . |sqrt|) (|AlgebraicManipulations| 6 7) (325 . |rootSimp|)
              (330 . *) (336 . *) (342 . -) (348 . |zero?|) (353 . ^)
              (|List| $) (359 . |eval|) (366 . *) (372 . |numer|)
              (377 . |denom|) (382 . /) (388 . |multivariate|)
              |INTG0;palgint0;F3KFFIr;13| (|Union| 9 '"failed")
              (394 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 134 7 7 9)
              |INTG0;palgRDE0;2F2KMKFFU;14|
              (|SparseUnivariatePolynomialFunctions2| 105 7) (399 . |map|)
              (405 . |elt|) |INTG0;palgRDE0;2F2KMFSupU;16| (411 . |inv|)
              (|LinearOrdinaryDifferentialOperator1| 105) (416 . |monomial|)
              (422 . |One|) (426 . |Zero|) (430 . |degree|)
              (435 . |coefficient|) (441 . *) (447 . +) (453 . *)
              (|Union| 105 '"failed")
              (|Record| (|:| |particular| 151) (|:| |basis| (|List| 105)))
              (|RationalLODE| 7 23) (459 . |ratDsolve|)
              (|Record| (|:| |particular| 134) (|:| |basis| (|List| 7)))
              (465 . |palgLODE0|) (475 . |palgLODE0|))
           '#(|univariate| 486 |rationalize_ir| 494 |palgint0| 500 |palgRDE0|
              519 |palgLODE0| 542 |multivariate| 563 |lift| 570)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 157
                                                 '(0 9 0 10 1 11 0 9 12 1 7 14
                                                   0 15 2 16 0 0 0 17 2 18 7 7
                                                   11 19 2 7 20 0 21 22 3 24 23
                                                   7 11 23 25 2 30 26 29 23 31
                                                   1 23 32 0 33 0 23 0 34 1 37
                                                   36 0 38 2 23 0 0 39 40 2 23
                                                   0 0 0 41 2 39 0 42 0 43 2 45
                                                   44 0 0 46 1 37 23 0 47 1 23
                                                   7 0 48 2 50 49 7 39 51 2 23
                                                   0 7 0 52 1 7 53 21 54 2 57
                                                   55 56 23 58 0 6 0 59 0 7 0
                                                   60 0 39 0 61 2 23 7 0 39 62
                                                   2 64 23 63 55 65 0 6 0 66 0
                                                   7 0 67 0 39 0 68 0 23 0 69 2
                                                   23 44 0 0 70 2 23 0 0 0 71 2
                                                   23 72 0 0 73 1 23 39 0 74 2
                                                   39 44 0 0 75 2 23 0 0 0 76 1
                                                   7 0 21 77 1 7 0 0 78 3 7 0 0
                                                   21 0 79 2 23 0 80 0 81 2 23
                                                   44 0 0 82 1 83 0 45 84 2 83
                                                   0 0 0 85 2 23 0 0 0 86 1 87
                                                   7 0 88 2 7 0 0 0 89 1 7 0 45
                                                   90 2 7 0 0 0 91 1 87 93 0 94
                                                   2 93 0 0 0 95 1 87 97 0 98 3
                                                   87 0 7 93 97 99 1 26 0 0 101
                                                   1 26 0 0 102 1 106 104 105
                                                   107 2 23 7 108 7 109 2 111
                                                   87 110 104 112 1 26 105 0
                                                   113 2 87 0 0 0 114 1 7 0 0
                                                   116 1 117 7 7 118 2 7 0 0 0
                                                   119 2 7 0 42 0 120 2 7 0 0 0
                                                   121 1 7 44 0 122 2 7 0 0 42
                                                   123 3 7 0 0 14 124 125 2 105
                                                   0 0 0 126 1 105 23 0 127 1
                                                   105 23 0 128 2 105 0 23 23
                                                   129 2 24 7 105 11 130 1 11
                                                   132 0 133 2 137 23 110 26
                                                   138 2 23 7 0 7 139 1 7 0 0
                                                   141 2 142 0 105 39 143 0 142
                                                   0 144 0 142 0 145 1 8 39 0
                                                   146 2 8 7 0 39 147 2 142 0
                                                   105 0 148 2 142 0 0 0 149 2
                                                   142 0 0 0 150 2 153 152 142
                                                   105 154 6 0 155 8 7 11 11 7
                                                   23 156 7 0 155 8 7 11 11 11
                                                   7 105 157 4 0 26 7 11 11 23
                                                   28 2 0 87 87 11 100 6 0 87 7
                                                   11 11 11 7 105 131 5 0 87 7
                                                   11 11 7 23 115 7 0 134 7 7
                                                   11 11 135 7 23 140 8 0 134 7
                                                   7 11 11 135 11 7 105 136 7 1
                                                   155 8 7 11 11 11 7 105 157 6
                                                   1 155 8 7 11 11 7 23 156 3 0
                                                   7 26 11 7 103 2 0 26 23 11
                                                   27)))))
           '|lookupComplete|)) 
