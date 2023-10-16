
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
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
          (|u1| (F)) (|e2| (|NonNegativeInteger|))
          (|e1| (|NonNegativeInteger|)) (|f1| (|SparseUnivariatePolynomial| F))
          (#2=#:G130 NIL) (|fac| NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |ff| (SPADCALL |p| (QREFELT $ 33)))
              (LETT |c1| (|spadConstant| $ 34))
              (LETT |r1| (|spadConstant| $ 34))
              (SEQ (LETT |fac| NIL) (LETT #2# (SPADCALL |ff| (QREFELT $ 39)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |fac| 1)) (LETT |e1| (QVELT |fac| 2))
                        (LETT |e2| (QUOTIENT2 |e1| 2))
                        (LETT |c1|
                              (SPADCALL
                               (SPADCALL (QVELT |fac| 1) |e2| (QREFELT $ 41))
                               |c1| (QREFELT $ 42)))
                        (EXIT
                         (COND
                          ((SPADCALL |e1| (SPADCALL 2 |e2| (QREFELT $ 44))
                                     (QREFELT $ 46))
                           (LETT |r1|
                                 (SPADCALL (QVELT |fac| 1) |r1|
                                           (QREFELT $ 42)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |u1|
                    (SPADCALL (SPADCALL |ff| (QREFELT $ 47)) (QREFELT $ 48)))
              (LETT |rr1| (SPADCALL |u1| 2 (QREFELT $ 51)))
              (LETT |c1| (SPADCALL (QVELT |rr1| 1) |c1| (QREFELT $ 52)))
              (LETT |r1| (SPADCALL (QVELT |rr1| 2) |r1| (QREFELT $ 52)))
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
          (|ppc| (|SparseUnivariatePolynomial| F)) (#3=#:G136 NIL)
          (|ppr| (|SparseUnivariatePolynomial| F))
          (|pol1| #4=(|SparseUnivariatePolynomial| F)) (|pol0| #4#)
          (|polu|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|opol| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |opol| (QVELT |ll| 1))
              (LETT |polu|
                    (SPADCALL
                     (CONS #'|INTG0;rationalize_log!0| (VECTOR $ |k1|)) |opol|
                     (QREFELT $ 58)))
              (LETT |pol0|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!1| $) |polu|
                              (QREFELT $ 65)))
              (LETT |pol1|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!2| $) |polu|
                              (QREFELT $ 65)))
              (LETT |ppr|
                    (COND
                     ((SPADCALL |pol1| (|spadConstant| $ 69) (QREFELT $ 70))
                      |pol0|)
                     (#5='T (SPADCALL |pol0| |pol1| (QREFELT $ 71)))))
              (LETT |ppc|
                    (PROG2 (LETT #3# (SPADCALL |opol| |ppr| (QREFELT $ 73)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT $ 7))
                                       "failed")
                                      #3#)))
              (LETT |fun| (QVELT |ll| 2)) (LETT |res| NIL)
              (COND
               ((SPADCALL (SPADCALL |ppr| (QREFELT $ 74)) 0 (QREFELT $ 75))
                (SEQ (LETT |c1| (QVELT |ll| 0))
                     (LETT |fun1| (SPADCALL |fun| |ppr| (QREFELT $ 76)))
                     (LETT |fun1c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!3| (VECTOR $ |k1|))
                            |fun1| (QREFELT $ 81)))
                     (EXIT
                      (COND
                       ((SPADCALL |fun1c| |fun1| (QREFELT $ 82))
                        (SEQ
                         (LETT |fun1| (SPADCALL |fun1c| |fun1| (QREFELT $ 42)))
                         (LETT |c2|
                               (SPADCALL |c1| (SPADCALL 2 (QREFELT $ 85))
                                         (QREFELT $ 86)))
                         (LETT |rr1| (|INTG0;proot| |fun1| $))
                         (EXIT
                          (COND
                           ((SPADCALL (QCDR |rr1|) (|spadConstant| $ 34)
                                      (QREFELT $ 70))
                            (LETT |res|
                                  (CONS (VECTOR |c1| |ppr| (QCAR |rr1|))
                                        |res|)))
                           (#5#
                            (LETT |res|
                                  (CONS (VECTOR |c2| |ppr| |fun1|) |res|)))))))
                       (#5#
                        (LETT |res|
                              (CONS (VECTOR |c1| |ppr| |fun1|) |res|))))))))
              (COND
               ((SPADCALL (SPADCALL |ppc| (QREFELT $ 74)) 0 (QREFELT $ 75))
                (SEQ (LETT |c1| (QVELT |ll| 0))
                     (LETT |c2|
                           (SPADCALL |c1| (SPADCALL 2 (QREFELT $ 85))
                                     (QREFELT $ 86)))
                     (LETT |fun2| (SPADCALL |fun| |ppc| (QREFELT $ 76)))
                     (LETT |ppcc|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!4| (VECTOR $ |k1|))
                            |ppc| (QREFELT $ 81)))
                     (LETT |fun2c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!5| (VECTOR $ |k1|))
                            |fun2| (QREFELT $ 81)))
                     (LETT |fun2|
                           (SPADCALL (SPADCALL |ppcc| |fun2| (QREFELT $ 42))
                                     (SPADCALL |ppc| |fun2c| (QREFELT $ 42))
                                     (QREFELT $ 87)))
                     (LETT |rr1| (|INTG0;proot| |fun2| $))
                     (LETT |ppn| (SPADCALL |ppc| |ppcc| (QREFELT $ 42)))
                     (EXIT
                      (COND
                       ((SPADCALL (QCDR |rr1|) (|spadConstant| $ 34)
                                  (QREFELT $ 70))
                        (LETT |res|
                              (CONS (VECTOR |c1| |ppn| (QCAR |rr1|)) |res|)))
                       (#5#
                        (LETT |res|
                              (CONS (VECTOR |c2| |ppn| |fun2|) |res|))))))))
              (EXIT |res|)))) 

(SDEFUN |INTG0;rationalize_log!5| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 77)) (QREFELT $ 78))
                      (QREFELT $ 79)))))) 

(SDEFUN |INTG0;rationalize_log!4| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 77)) (QREFELT $ 78))
                      (QREFELT $ 79)))))) 

(SDEFUN |INTG0;rationalize_log!3| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
          (LETT |k1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
          (#1=#:G203 NIL) (|ll| NIL) (|rp1| (F)) (|rp| (F)))
         (SEQ (LETT |rp| (SPADCALL |irf| (QREFELT $ 89)))
              (LETT |rp1|
                    (SPADCALL
                     (SPADCALL |rp|
                               (SPADCALL |rp| |k1|
                                         (SPADCALL
                                          (SPADCALL |k1| (QREFELT $ 77))
                                          (QREFELT $ 78))
                                         (QREFELT $ 79))
                               (QREFELT $ 90))
                     (SPADCALL 2 (QREFELT $ 91)) (QREFELT $ 92)))
              (LETT |lp1| NIL)
              (SEQ (LETT |ll| NIL) (LETT #1# (SPADCALL |irf| (QREFELT $ 95)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ll| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lp1|
                           (SPADCALL (|INTG0;rationalize_log| |ll| |k1| $)
                                     |lp1| (QREFELT $ 96)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |rp1| |lp1| (SPADCALL |irf| (QREFELT $ 99))
                         (QREFELT $ 100)))))) 

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
                          (QREFELT $ 28)))
          (LETT |f0| (SPADCALL |ff| (QREFELT $ 102)))
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $))
          (LETT |rf|
                (|INTG0;mkRat|
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 103)) |x|
                           (SPADCALL |y| (QREFELT $ 77)) (QREFELT $ 104))
                 (QVELT |pr| 1) (QVELT |pr| 2) $))
          (LETT |irf| (SPADCALL |rf| (QREFELT $ 108)))
          (LETT |irf1|
                (SPADCALL
                 (CONS #'|INTG0;palgint0;F2KFSupIr;9!0| (VECTOR $ |pr|)) |irf|
                 (QREFELT $ 113)))
          (COND
           ((NULL (NULL (QVELT |pr| 2)))
            (LETT |irf1|
                  (SPADCALL |irf1| (|SPADfirst| (QVELT |pr| 2))
                            (QREFELT $ 101)))))
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;9!1| (VECTOR $ |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT $ 114))
                                (QREFELT $ 108))
                      (QREFELT $ 113))
            |irf1| (QREFELT $ 115)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;9!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 110)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;9!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 110)))))) 

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
         (SEQ (LETT |u| (SPADCALL (QREFELT $ 13) (QREFELT $ 77)))
              (LETT |b| (SPADCALL |p| 1 (QREFELT $ 62)))
              (LETT |c| (SPADCALL |p| 0 (QREFELT $ 62)))
              (LETT |sa|
                    (SPADCALL
                     (SPADCALL (LETT |a| (SPADCALL |p| 2 (QREFELT $ 62)))
                               (QREFELT $ 117))
                     (QREFELT $ 119)))
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |b| |b| (QREFELT $ 120))
                            (SPADCALL (SPADCALL 4 |a| (QREFELT $ 121)) |c|
                                      (QREFELT $ 120))
                            (QREFELT $ 122))
                  (QREFELT $ 123))
                 (VECTOR (SPADCALL |x| (QREFELT $ 77))
                         (VECTOR (|spadConstant| $ 67) (LIST |x| |y|)
                                 (LIST |u|
                                       (SPADCALL
                                        (SPADCALL |sa|
                                                  (SPADCALL |u|
                                                            (SPADCALL |b|
                                                                      (SPADCALL
                                                                       2 |a|
                                                                       (QREFELT
                                                                        $ 121))
                                                                      (QREFELT
                                                                       $ 92))
                                                            (QREFELT $ 90))
                                                  (QREFELT $ 120))
                                        (SPADCALL |den| |x| |u| (QREFELT $ 79))
                                        (QREFELT $ 92))))
                         NIL))
                ((NULL (|INTG0;kerdiff| |sa| |a| $))
                 (SEQ
                  (LETT |bm2u|
                        (SPADCALL |b|
                                  (SPADCALL (SPADCALL 2 |u| (QREFELT $ 121))
                                            |sa| (QREFELT $ 120))
                                  (QREFELT $ 122)))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |u| 2 (QREFELT $ 124)) |c|
                                          (QREFELT $ 122))
                                         |bm2u| (QREFELT $ 92)))
                                  (QREFELT $ 79)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ua|
                               (SPADCALL |u|
                                         (SPADCALL |xx| |sa| (QREFELT $ 120))
                                         (QREFELT $ 90)))
                         |q| (QREFELT $ 92)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77))
                               (QREFELT $ 120))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 77)) |sa|
                               (QREFELT $ 120))
                     (QREFELT $ 122))
                    (VECTOR
                     (SPADCALL (SPADCALL 2 |ua| (QREFELT $ 121)) |bm2u|
                               (QREFELT $ 92))
                     (LIST |x| |y|) (LIST |xx| |yy|))
                    NIL))))
                ('T
                 (SEQ
                  (LETT |u2ma|
                        (SPADCALL (SPADCALL |u| 2 (QREFELT $ 124)) |a|
                                  (QREFELT $ 122)))
                  (LETT |sc|
                        (SPADCALL (SPADCALL |c| (QREFELT $ 117))
                                  (QREFELT $ 119)))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL |b|
                                                   (SPADCALL
                                                    (SPADCALL 2 |u|
                                                              (QREFELT $ 121))
                                                    |sc| (QREFELT $ 120))
                                                   (QREFELT $ 122))
                                         |u2ma| (QREFELT $ 92)))
                                  (QREFELT $ 79)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ux|
                               (SPADCALL (SPADCALL |xx| |u| (QREFELT $ 120))
                                         |sc| (QREFELT $ 90)))
                         |q| (QREFELT $ 92)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77))
                                (QREFELT $ 120))
                      |sc| (QREFELT $ 122))
                     (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 92))
                    (VECTOR
                     (SPADCALL
                      (SPADCALL (SPADCALL 2 |ux| (QREFELT $ 121)) |u2ma|
                                (QREFELT $ 92))
                      (QREFELT $ 78))
                     (LIST |x| |y|) (LIST |xx| |yy|))
                    (|INTG0;kerdiff| |sc| |c| $)))))))))) 

(SDEFUN |INTG0;mkRatlx|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|t| F) (|z| |Kernel| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |Fraction| (|SparseUnivariatePolynomial| F)))
        (SPROG ((|f1| (F)))
               (SEQ
                (LETT |f1|
                      (SPADCALL |f| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT $ 77))
                                          (QREFELT $ 120))
                                (QREFELT $ 79)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |f1| |x| |t| (QREFELT $ 79)) |z|
                            (QREFELT $ 22))
                  |dx| (QREFELT $ 125)))))) 

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
                                            (QREFELT $ 127))
                                  (QREFELT $ 120))
                        |l| $)
                       (QREFELT $ 13) (QREFELT $ 22)))
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 128))
                           (SPADCALL |rat| (QREFELT $ 129)) (QREFELT $ 130)))))) 

(SDEFUN |INTG0;ev|
        ((|x1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|y1| |Fraction| (|SparseUnivariatePolynomial| F)) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL |x1| |y1| (QREFELT $ 131)) (QREFELT $ 132))
         (QREFELT $ 133))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;14|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |IntegrationResult| F))
        (SPROG
         ((|pp| (|IntegrationResult| F))
          (|y1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|res1|
           (|IntegrationResult|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |res1|
                (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| |r| $)
                          (QREFELT $ 108)))
          (LETT |y1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |r| (QREFELT $ 92))
                  (QREFELT $ 134))
                 (QREFELT $ 135)))
          (EXIT
           (LETT |pp|
                 (SPADCALL
                  (CONS #'|INTG0;palgint0;F3KFFFIr;14!0| (VECTOR $ |y1|))
                  |res1| (QREFELT $ 113))))))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;14!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y1| $)
          (LETT |y1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTG0;ev| |x1| |y1| $))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFFU;15|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |Union| F #2#))
        (SPROG ((|u| #1#) (#3=#:G231 NIL) (|g1| (F)) (|f1| (F)))
               (SEQ
                (LETT |f1|
                      (SPADCALL |f| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT $ 77))
                                          (QREFELT $ 120))
                                (QREFELT $ 79)))
                (LETT |g1|
                      (SPADCALL |g| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT $ 77))
                                          (QREFELT $ 120))
                                (QREFELT $ 79)))
                (LETT |u|
                      (SPADCALL (SPADCALL |f1| |x| |xx| (QREFELT $ 79))
                                (SPADCALL (SPADCALL |dx| |z| (QREFELT $ 137))
                                          (SPADCALL |g1| |x| |xx|
                                                    (QREFELT $ 79))
                                          (QREFELT $ 120))
                                (PROG2
                                    (LETT #3# (SPADCALL |z| (QREFELT $ 139)))
                                    (QCDR #3#)
                                  (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                                  (|Union| (|Symbol|) "failed")
                                                  #3#))
                                |rischde|))
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |u|) |z|
                                        (SPADCALL (SPADCALL |y| (QREFELT $ 77))
                                                  |r| (QREFELT $ 92))
                                        (QREFELT $ 79))))))))) 

(SDEFUN |INTG0;multivariate;SupK2F;16|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| F) ($ F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;16!0| (VECTOR $ |x|)) |p|
                 (QREFELT $ 144))
                |y| (QREFELT $ 145)))) 

(SDEFUN |INTG0;multivariate;SupK2F;16!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 137)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;17|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|den| F) (|radi| |SparseUnivariatePolynomial| F) ($ |Union| F #2#))
        (SPROG
         ((|u| #1#) (#3=#:G251 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $))
              (LETT |u|
                    (SPADCALL
                     (|INTG0;checkroot|
                      (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                                (QVELT (QVELT |pr| 1) 2) (QREFELT $ 127))
                      (QVELT |pr| 2) $)
                     (|INTG0;checkroot|
                      (SPADCALL (QVELT (QVELT |pr| 1) 0)
                                (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                          (QVELT (QVELT |pr| 1) 2)
                                          (QREFELT $ 127))
                                (QREFELT $ 120))
                      (QVELT |pr| 2) $)
                     (PROG2
                         (LETT #3# (SPADCALL (QREFELT $ 13) (QREFELT $ 139)))
                         (QCDR #3#)
                       (|check_union2| (QEQCAR #3# 0) (|Symbol|)
                                       (|Union| (|Symbol|) "failed") #3#))
                     |rischde|))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL (QCDR |u|) (QREFELT $ 13) (QVELT |pr| 0)
                                      (QREFELT $ 79))))))))) 

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;18|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G263 NIL) (|bas| (|List| F)) (#2=#:G273 NIL) (|b| NIL)
          (#3=#:G272 NIL)
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
          (#5=#:G271 NIL) (|i| NIL)
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
         (SEQ (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $))
              (LETT |d|
                    (SPADCALL
                     (|INTG0;univ|
                      (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT $ 147))
                      (QVELT |pr| 2) (QREFELT $ 13) $)
                     1 (QREFELT $ 149)))
              (LETT |di| (|spadConstant| $ 150))
              (LETT |op| (|spadConstant| $ 151))
              (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT $ 152))) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL |op|
                                    (SPADCALL
                                     (|INTG0;univ|
                                      (SPADCALL
                                       (SPADCALL |eq| |i| (QREFELT $ 153))
                                       (QVELT (QVELT |pr| 1) 1)
                                       (QVELT (QVELT |pr| 1) 2)
                                       (QREFELT $ 127))
                                      (QVELT |pr| 2) (QREFELT $ 13) $)
                                     |di| (QREFELT $ 154))
                                    (QREFELT $ 155)))
                    (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 156)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |rec|
                    (SPADCALL |op|
                              (|INTG0;univ|
                               (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                         (QVELT (QVELT |pr| 1) 2)
                                         (QREFELT $ 127))
                               (QVELT |pr| 2) (QREFELT $ 13) $)
                              (QREFELT $ 160)))
              (LETT |bas|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |b| NIL) (LETT #2# (QCDR |rec|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |b| (QVELT |pr| 0)
                                             (QREFELT $ 110))
                                   #3#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT
               (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                     ('T
                      (CONS
                       (CONS 0
                             (SPADCALL
                              (PROG2 (LETT #1# (QCAR |rec|))
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
                              (QVELT |pr| 0) (QREFELT $ 110)))
                       |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFFR;19|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|kz| |Kernel| F)
         (|xx| F) (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G280 NIL) (|bas| (|List| F)) (#2=#:G289 NIL) (|b| NIL)
          (#3=#:G288 NIL)
          (|yinv| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #4="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|g1| (F))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|c1| (F)) (#5=#:G287 NIL) (|i| NIL) (|y1| (F))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT $ 137))
                            (QREFELT $ 147))
                  |kz| (QREFELT $ 22))
                 1 (QREFELT $ 149)))
          (LETT |di| (|spadConstant| $ 150)) (LETT |op| (|spadConstant| $ 151))
          (LETT |y1|
                (SPADCALL |r| (SPADCALL |kz| (QREFELT $ 77)) (QREFELT $ 120)))
          (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT $ 152))) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |c1|
                      (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 153)) |y| |y1|
                                (QREFELT $ 79)))
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |c1| |x| |xx| (QREFELT $ 79)) |kz|
                                  (QREFELT $ 22))
                                 |di| (QREFELT $ 154))
                                (QREFELT $ 155)))
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 156)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |g1| (SPADCALL |g| |y| |y1| (QREFELT $ 79)))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g1| |x| |xx| (QREFELT $ 79))
                                    |kz| (QREFELT $ 22))
                          (QREFELT $ 160)))
          (LETT |yinv|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |r| (QREFELT $ 92))
                  (QREFELT $ 134))
                 (QREFELT $ 135)))
          (LETT |bas|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |b| NIL) (LETT #2# (QCDR |rec|)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #3# (CONS (|INTG0;ev| |b| |yinv| $) #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (|INTG0;ev|
                          (PROG2 (LETT #1# (QCAR |rec|))
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
                          |yinv| $))
                   |bas|))))))) 

(DECLAIM (NOTINLINE |GenusZeroIntegration;|)) 

(DEFUN |GenusZeroIntegration| (&REST #1=#:G290)
  (SPROG NIL
         (PROG (#2=#:G291)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenusZeroIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenusZeroIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GenusZeroIntegration|)))))))))) 

(DEFUN |GenusZeroIntegration;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|GenusZeroIntegration| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 164))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             (LIST
                                                              '|LinearOrdinaryDifferentialOperatorCategory|
                                                              (|devaluate|
                                                               |#2|)))))))
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
             (QSETREFV $ 162
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;18|) $))
             (QSETREFV $ 163
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFFR;19|)
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
              (32 . |univariate|) (|SparseUnivariatePolynomial| 106)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 106 7) (|SparseUnivariatePolynomialFunctions2| 7 106)
              (39 . |map|) (|Factored| $) (45 . |squareFree|) (50 . |One|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 23) (|:| |exponent| 40))
              (|List| 36) (|Factored| 23) (54 . |factorList|)
              (|NonNegativeInteger|) (59 . ^) (65 . *) (|PositiveInteger|)
              (71 . *) (|Boolean|) (77 . ~=) (83 . |unit|) (88 . |ground|)
              (|Record| (|:| |exponent| 40) (|:| |coef| 7) (|:| |radicand| 7))
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
              (|Integer|) (|Fraction| 83) (220 . |coerce|) (225 . /) (231 . +)
              (|IntegrationResult| 7) (237 . |ratpart|) (242 . +)
              (248 . |coerce|) (253 . /)
              (|Record| (|:| |scalar| 84) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 93) (259 . |logpart|) (264 . |concat|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 97)
              (270 . |notelem|) (275 . |mkAnswer|)
              |INTG0;rationalize_ir;IrKIr;8| (282 . |reductum|)
              (287 . |leadingMonomial|) |INTG0;multivariate;SupK2F;16|
              (|IntegrationResult| 106) (|Fraction| 23)
              (|RationalIntegration| 7 23) (292 . |integrate|) (|Fraction| $)
              (297 . |elt|) (|Mapping| 7 106)
              (|IntegrationResultFunctions2| 106 7) (303 . |map|)
              (309 . |retract|) (314 . +) |INTG0;palgint0;F2KFSupIr;9|
              (320 . |sqrt|) (|AlgebraicManipulations| 6 7) (325 . |rootSimp|)
              (330 . *) (336 . *) (342 . -) (348 . |zero?|) (353 . ^) (359 . *)
              (|List| $) (365 . |eval|) (372 . |numer|) (377 . |denom|)
              (382 . /) (388 . |elt|) (394 . |retract|) (399 . |retract|)
              (404 . |coerce|) (409 . |coerce|) |INTG0;palgint0;F3KFFFIr;14|
              (414 . |multivariate|) (|Union| 9 '"failed")
              (420 . |symbolIfCan|) (|Union| 7 '#1="failed")
              (|Mapping| 140 7 7 9) |INTG0;palgRDE0;2F2KMKFFFU;15|
              (|SparseUnivariatePolynomialFunctions2| 106 7) (425 . |map|)
              (431 . |elt|) |INTG0;palgRDE0;2F2KMFSupU;17| (437 . |inv|)
              (|LinearOrdinaryDifferentialOperator1| 106) (442 . |monomial|)
              (448 . |One|) (452 . |Zero|) (456 . |degree|)
              (461 . |coefficient|) (467 . *) (473 . +) (479 . *)
              (|Union| 106 '"failed")
              (|Record| (|:| |particular| 157) (|:| |basis| (|List| 106)))
              (|RationalLODE| 7 23) (485 . |ratDsolve|)
              (|Record| (|:| |particular| 140) (|:| |basis| (|List| 7)))
              (491 . |palgLODE0|) (501 . |palgLODE0|))
           '#(|univariate| 513 |rationalize_ir| 521 |palgint0| 527 |palgRDE0|
              547 |palgLODE0| 571 |multivariate| 593 |lift| 600)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|palgint0|
                                 ((|IntegrationResult| |#2|) |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|) |#2|
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|palgint0|
                                 ((|IntegrationResult| |#2|) |#2|
                                  (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                T)
                              '((|palgRDE0|
                                 ((|Union| |#2| #1#) |#2| |#2| (|Kernel| |#2|)
                                  (|Kernel| |#2|)
                                  (|Mapping| (|Union| |#2| #1#) |#2| |#2|
                                             (|Symbol|))
                                  |#2| (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|palgRDE0|
                                 ((|Union| |#2| #1#) |#2| |#2| (|Kernel| |#2|)
                                  (|Kernel| |#2|)
                                  (|Mapping| (|Union| |#2| #1#) |#2| |#2|
                                             (|Symbol|))
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                T)
                              '((|univariate|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|SparseUnivariatePolynomial| |#2|)))
                                T)
                              '((|multivariate|
                                 (|#2|
                                  (|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  (|Kernel| |#2|) |#2|))
                                T)
                              '((|lift|
                                 ((|SparseUnivariatePolynomial|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|)))
                                  (|SparseUnivariatePolynomial| |#2|)
                                  (|Kernel| |#2|)))
                                T)
                              '((|rationalize_ir|
                                 ((|IntegrationResult| |#2|)
                                  (|IntegrationResult| |#2|) (|Kernel| |#2|)))
                                T)
                              '((|palgLODE0|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| |#2| #2="failed"))
                                   (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  |#2| (|SparseUnivariatePolynomial| |#2|)))
                                (|has| 8
                                       (|LinearOrdinaryDifferentialOperatorCategory|
                                        7)))
                              '((|palgLODE0|
                                 ((|Record|
                                   (|:| |particular| (|Union| |#2| #2#))
                                   (|:| |basis| (|List| |#2|)))
                                  |#3| |#2| (|Kernel| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|) |#2|
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial| |#2|))
                                  |#2|))
                                (|has| 8
                                       (|LinearOrdinaryDifferentialOperatorCategory|
                                        7))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 163
                                            '(0 9 0 10 1 11 0 9 12 1 7 14 0 15
                                              2 16 0 0 0 17 2 18 7 7 11 19 2 7
                                              20 0 21 22 3 24 23 7 11 23 25 2
                                              30 26 29 23 31 1 23 32 0 33 0 23
                                              0 34 1 38 37 0 39 2 23 0 0 40 41
                                              2 23 0 0 0 42 2 40 0 43 0 44 2 40
                                              45 0 0 46 1 38 23 0 47 1 23 7 0
                                              48 2 50 49 7 40 51 2 23 0 7 0 52
                                              1 7 53 21 54 2 57 55 56 23 58 0 6
                                              0 59 0 7 0 60 0 40 0 61 2 23 7 0
                                              40 62 2 64 23 63 55 65 0 6 0 66 0
                                              7 0 67 0 40 0 68 0 23 0 69 2 23
                                              45 0 0 70 2 23 0 0 0 71 2 23 72 0
                                              0 73 1 23 40 0 74 2 40 45 0 0 75
                                              2 23 0 0 0 76 1 7 0 21 77 1 7 0 0
                                              78 3 7 0 0 21 0 79 2 23 0 80 0 81
                                              2 23 45 0 0 82 1 84 0 83 85 2 84
                                              0 0 0 86 2 23 0 0 0 87 1 88 7 0
                                              89 2 7 0 0 0 90 1 7 0 83 91 2 7 0
                                              0 0 92 1 88 94 0 95 2 94 0 0 0 96
                                              1 88 98 0 99 3 88 0 7 94 98 100 1
                                              26 0 0 102 1 26 0 0 103 1 107 105
                                              106 108 2 23 7 109 7 110 2 112 88
                                              111 105 113 1 26 106 0 114 2 88 0
                                              0 0 115 1 7 0 0 117 1 118 7 7 119
                                              2 7 0 0 0 120 2 7 0 43 0 121 2 7
                                              0 0 0 122 1 7 45 0 123 2 7 0 0 43
                                              124 2 106 0 0 0 125 3 7 0 0 14
                                              126 127 1 106 23 0 128 1 106 23 0
                                              129 2 106 0 23 23 130 2 23 109
                                              109 109 131 1 106 23 0 132 1 23 7
                                              0 133 1 23 0 7 134 1 106 0 23 135
                                              2 24 7 106 11 137 1 11 138 0 139
                                              2 143 23 111 26 144 2 23 7 0 7
                                              145 1 7 0 0 147 2 148 0 106 40
                                              149 0 148 0 150 0 148 0 151 1 8
                                              40 0 152 2 8 7 0 40 153 2 148 0
                                              106 0 154 2 148 0 0 0 155 2 148 0
                                              0 0 156 2 159 158 148 106 160 6 0
                                              161 8 7 11 11 7 23 162 8 0 161 8
                                              7 11 11 11 7 106 7 163 4 0 26 7
                                              11 11 23 28 2 0 88 88 11 101 7 0
                                              88 7 11 11 11 7 106 7 136 5 0 88
                                              7 11 11 7 23 116 7 0 140 7 7 11
                                              11 141 7 23 146 9 0 140 7 7 11 11
                                              141 11 7 106 7 142 8 1 161 8 7 11
                                              11 11 7 106 7 163 6 1 161 8 7 11
                                              11 7 23 162 3 0 7 26 11 7 104 2 0
                                              26 23 11 27)))))
           '|lookupComplete|)) 
