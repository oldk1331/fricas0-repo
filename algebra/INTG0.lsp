
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
          (#2=#:G131 NIL) (|fac| NIL)
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
          (|ppc| (|SparseUnivariatePolynomial| F)) (#3=#:G137 NIL)
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
          (#1=#:G204 NIL) (|ll| NIL) (|rp1| (F)) (|rp| (F)))
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

(SDEFUN |INTG0;field_gens| ((|y| |Kernel| F) (|lf| |List| F) ($ |List| F))
        (SPROG
         ((|res| (|List| F)) (#1=#:G208 NIL) (|k| NIL)
          (|at| (|List| (|Kernel| F))))
         (SEQ (LETT |at| (SPADCALL |lf| (QREFELT $ 103))) (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |at|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((SPADCALL |k| |y| (QREFELT $ 104)) "iterate")
                           ('T
                            (LETT |res|
                                  (CONS (SPADCALL |k| (QREFELT $ 77))
                                        |res|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10|
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
          (|lc| (|List| F))
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
          (LETT |f0| (SPADCALL |ff| (QREFELT $ 105)))
          (LETT |lc| (|INTG0;field_gens| |y| (LIST |f|) $))
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| $))
          (LETT |rf|
                (|INTG0;mkRat|
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 106)) |x|
                           (SPADCALL |y| (QREFELT $ 77)) (QREFELT $ 107))
                 (QVELT |pr| 1) (QVELT |pr| 2) $))
          (LETT |irf| (SPADCALL |rf| (QREFELT $ 111)))
          (LETT |irf1|
                (SPADCALL
                 (CONS #'|INTG0;palgint0;F2KFSupIr;10!0| (VECTOR $ |pr|)) |irf|
                 (QREFELT $ 116)))
          (COND
           ((NULL (NULL (QVELT |pr| 2)))
            (LETT |irf1|
                  (SPADCALL |irf1| (|SPADfirst| (QVELT |pr| 2))
                            (QREFELT $ 101)))))
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;10!1| (VECTOR $ |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT $ 117))
                                (QREFELT $ 111))
                      (QREFELT $ 116))
            |irf1| (QREFELT $ 118)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 113)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;10!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 113)))))) 

(SDEFUN |INTG0;sqrt_in_field| ((|a| F) (|lc| |List| F) ($ F))
        (SPROG
         ((|ff| #1=(|SparseUnivariatePolynomial| F))
          (|lfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fp| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|pol| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |pol|
                (SPADCALL (SPADCALL (|spadConstant| $ 67) 2 (QREFELT $ 120))
                          (SPADCALL |a| (QREFELT $ 121)) (QREFELT $ 122)))
          (LETT |fp| (SPADCALL |pol| |lc| (QREFELT $ 125)))
          (LETT |lfac| (SPADCALL |fp| (QREFELT $ 39)))
          (LETT |ff| (QVELT (|SPADfirst| |lfac|) 1))
          (EXIT
           (COND
            ((EQL (SPADCALL |ff| (QREFELT $ 74)) 1)
             (SPADCALL
              (SPADCALL (SPADCALL |ff| 0 (QREFELT $ 62))
                        (SPADCALL |ff| 1 (QREFELT $ 62)) (QREFELT $ 92))
              (QREFELT $ 78)))
            ('T (SPADCALL |a| (QREFELT $ 126)))))))) 

(SDEFUN |INTG0;quadsubst|
        ((|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|p| |SparseUnivariatePolynomial| F) (|lc| |List| F)
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
              (LETT |a| (SPADCALL |p| 2 (QREFELT $ 62)))
              (LETT |sa| (|INTG0;sqrt_in_field| |a| |lc| $))
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |b| |b| (QREFELT $ 127))
                            (SPADCALL (SPADCALL 4 |a| (QREFELT $ 128)) |c|
                                      (QREFELT $ 127))
                            (QREFELT $ 129))
                  (QREFELT $ 130))
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
                                                                        $ 128))
                                                                      (QREFELT
                                                                       $ 92))
                                                            (QREFELT $ 90))
                                                  (QREFELT $ 127))
                                        (SPADCALL |den| |x| |u| (QREFELT $ 79))
                                        (QREFELT $ 92))))
                         NIL))
                ((NULL (|INTG0;kerdiff| |sa| |a| $))
                 (SEQ
                  (LETT |bm2u|
                        (SPADCALL |b|
                                  (SPADCALL (SPADCALL 2 |u| (QREFELT $ 128))
                                            |sa| (QREFELT $ 127))
                                  (QREFELT $ 129)))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |u| 2 (QREFELT $ 131)) |c|
                                          (QREFELT $ 129))
                                         |bm2u| (QREFELT $ 92)))
                                  (QREFELT $ 79)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ua|
                               (SPADCALL |u|
                                         (SPADCALL |xx| |sa| (QREFELT $ 127))
                                         (QREFELT $ 90)))
                         |q| (QREFELT $ 92)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77))
                               (QREFELT $ 127))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 77)) |sa|
                               (QREFELT $ 127))
                     (QREFELT $ 129))
                    (VECTOR
                     (SPADCALL (SPADCALL 2 |ua| (QREFELT $ 128)) |bm2u|
                               (QREFELT $ 92))
                     (LIST |x| |y|) (LIST |xx| |yy|))
                    NIL))))
                ('T
                 (SEQ
                  (LETT |u2ma|
                        (SPADCALL (SPADCALL |u| 2 (QREFELT $ 131)) |a|
                                  (QREFELT $ 129)))
                  (LETT |sc| (|INTG0;sqrt_in_field| |c| |lc| $))
                  (LETT |q|
                        (SPADCALL |den| |x|
                                  (LETT |xx|
                                        (SPADCALL
                                         (SPADCALL |b|
                                                   (SPADCALL
                                                    (SPADCALL 2 |u|
                                                              (QREFELT $ 128))
                                                    |sc| (QREFELT $ 127))
                                                   (QREFELT $ 129))
                                         |u2ma| (QREFELT $ 92)))
                                  (QREFELT $ 79)))
                  (LETT |yy|
                        (SPADCALL
                         (LETT |ux|
                               (SPADCALL (SPADCALL |xx| |u| (QREFELT $ 127))
                                         |sc| (QREFELT $ 90)))
                         |q| (QREFELT $ 92)))
                  (EXIT
                   (VECTOR
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |den| (SPADCALL |y| (QREFELT $ 77))
                                (QREFELT $ 127))
                      |sc| (QREFELT $ 129))
                     (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 92))
                    (VECTOR
                     (SPADCALL
                      (SPADCALL (SPADCALL 2 |ux| (QREFELT $ 128)) |u2ma|
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
                                          (QREFELT $ 127))
                                (QREFELT $ 79)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |f1| |x| |t| (QREFELT $ 79)) |z|
                            (QREFELT $ 22))
                  |dx| (QREFELT $ 132)))))) 

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
                                            (QREFELT $ 133))
                                  (QREFELT $ 127))
                        |l| $)
                       (QREFELT $ 13) (QREFELT $ 22)))
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 134))
                           (SPADCALL |rat| (QREFELT $ 135)) (QREFELT $ 136)))))) 

(SDEFUN |INTG0;ev|
        ((|x1| |Fraction| (|SparseUnivariatePolynomial| F))
         (|y1| |Fraction| (|SparseUnivariatePolynomial| F)) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL |x1| |y1| (QREFELT $ 137)) (QREFELT $ 138))
         (QREFELT $ 139))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;16|
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
                          (QREFELT $ 111)))
          (LETT |y1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |r| (QREFELT $ 92))
                  (QREFELT $ 121))
                 (QREFELT $ 140)))
          (EXIT
           (LETT |pp|
                 (SPADCALL
                  (CONS #'|INTG0;palgint0;F3KFFFIr;16!0| (VECTOR $ |y1|))
                  |res1| (QREFELT $ 116))))))) 

(SDEFUN |INTG0;palgint0;F3KFFFIr;16!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y1| $)
          (LETT |y1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTG0;ev| |x1| |y1| $))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFFU;17|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |Union| F #2#))
        (SPROG ((|u| #1#) (#3=#:G239 NIL) (|g1| (F)) (|f1| (F)))
               (SEQ
                (LETT |f1|
                      (SPADCALL |f| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT $ 77))
                                          (QREFELT $ 127))
                                (QREFELT $ 79)))
                (LETT |g1|
                      (SPADCALL |g| |y|
                                (SPADCALL |r| (SPADCALL |z| (QREFELT $ 77))
                                          (QREFELT $ 127))
                                (QREFELT $ 79)))
                (LETT |u|
                      (SPADCALL (SPADCALL |f1| |x| |xx| (QREFELT $ 79))
                                (SPADCALL (SPADCALL |dx| |z| (QREFELT $ 142))
                                          (SPADCALL |g1| |x| |xx|
                                                    (QREFELT $ 79))
                                          (QREFELT $ 127))
                                (PROG2
                                    (LETT #3# (SPADCALL |z| (QREFELT $ 144)))
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

(SDEFUN |INTG0;multivariate;SupK2F;18|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| F) ($ F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;18!0| (VECTOR $ |x|)) |p|
                 (QREFELT $ 149))
                |y| (QREFELT $ 150)))) 

(SDEFUN |INTG0;multivariate;SupK2F;18!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 142)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;19|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|den| F) (|radi| |SparseUnivariatePolynomial| F) ($ |Union| F #2#))
        (SPROG
         ((|u| #1#) (#3=#:G263 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|lc| (|List| F)))
         (SEQ (LETT |lc| (|INTG0;field_gens| |y| (LIST |f| |g|) $))
              (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| $))
              (LETT |u|
                    (SPADCALL
                     (|INTG0;checkroot|
                      (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                                (QVELT (QVELT |pr| 1) 2) (QREFELT $ 133))
                      (QVELT |pr| 2) $)
                     (|INTG0;checkroot|
                      (SPADCALL (QVELT (QVELT |pr| 1) 0)
                                (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                          (QVELT (QVELT |pr| 1) 2)
                                          (QREFELT $ 133))
                                (QREFELT $ 127))
                      (QVELT |pr| 2) $)
                     (PROG2
                         (LETT #3# (SPADCALL (QREFELT $ 13) (QREFELT $ 144)))
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

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;20|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G275 NIL) (|bas| (|List| F)) (#2=#:G285 NIL) (|b| NIL)
          (#3=#:G284 NIL)
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
          (#5=#:G283 NIL) (|i| NIL)
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F)))))
          (|lc| (|List| F)))
         (SEQ
          (LETT |lc|
                (|INTG0;field_gens| |y|
                 (CONS |g| (SPADCALL |eq| (QREFELT $ 152))) $))
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| |lc| $))
          (LETT |d|
                (SPADCALL
                 (|INTG0;univ|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT $ 153))
                  (QVELT |pr| 2) (QREFELT $ 13) $)
                 1 (QREFELT $ 155)))
          (LETT |di| (|spadConstant| $ 156)) (LETT |op| (|spadConstant| $ 157))
          (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT $ 158))) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (|INTG0;univ|
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 159))
                                            (QVELT (QVELT |pr| 1) 1)
                                            (QVELT (QVELT |pr| 1) 2)
                                            (QREFELT $ 133))
                                  (QVELT |pr| 2) (QREFELT $ 13) $)
                                 |di| (QREFELT $ 160))
                                (QREFELT $ 161)))
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 162)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (|INTG0;univ|
                           (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                     (QVELT (QVELT |pr| 1) 2) (QREFELT $ 133))
                           (QVELT |pr| 2) (QREFELT $ 13) $)
                          (QREFELT $ 166)))
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
                               (SPADCALL |b| (QVELT |pr| 0) (QREFELT $ 113))
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
                          (QVELT |pr| 0) (QREFELT $ 113)))
                   |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFFR;21|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|kz| |Kernel| F)
         (|xx| F) (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) (|r| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G292 NIL) (|bas| (|List| F)) (#2=#:G301 NIL) (|b| NIL)
          (#3=#:G300 NIL)
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
          (|c1| (F)) (#5=#:G299 NIL) (|i| NIL) (|y1| (F))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT $ 142))
                            (QREFELT $ 153))
                  |kz| (QREFELT $ 22))
                 1 (QREFELT $ 155)))
          (LETT |di| (|spadConstant| $ 156)) (LETT |op| (|spadConstant| $ 157))
          (LETT |y1|
                (SPADCALL |r| (SPADCALL |kz| (QREFELT $ 77)) (QREFELT $ 127)))
          (SEQ (LETT |i| 0) (LETT #5# (SPADCALL |eq| (QREFELT $ 158))) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |c1|
                      (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 159)) |y| |y1|
                                (QREFELT $ 79)))
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |c1| |x| |xx| (QREFELT $ 79)) |kz|
                                  (QREFELT $ 22))
                                 |di| (QREFELT $ 160))
                                (QREFELT $ 161)))
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 162)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |g1| (SPADCALL |g| |y| |y1| (QREFELT $ 79)))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g1| |x| |xx| (QREFELT $ 79))
                                    |kz| (QREFELT $ 22))
                          (QREFELT $ 166)))
          (LETT |yinv|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |r| (QREFELT $ 92))
                  (QREFELT $ 121))
                 (QREFELT $ 140)))
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

(DEFUN |GenusZeroIntegration| (&REST #1=#:G302)
  (SPROG NIL
         (PROG (#2=#:G303)
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
          (LETT $ (GETREFV 170))
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
             (QSETREFV $ 168
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;20|) $))
             (QSETREFV $ 169
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFFR;21|)
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
              (32 . |univariate|) (|SparseUnivariatePolynomial| 109)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 109 7) (|SparseUnivariatePolynomialFunctions2| 7 109)
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
              |INTG0;rationalize_ir;IrKIr;8| (|List| $) (282 . |algtower|)
              (287 . =) (293 . |reductum|) (298 . |leadingMonomial|)
              |INTG0;multivariate;SupK2F;18| (|IntegrationResult| 109)
              (|Fraction| 23) (|RationalIntegration| 7 23) (303 . |integrate|)
              (|Fraction| $) (308 . |elt|) (|Mapping| 7 109)
              (|IntegrationResultFunctions2| 109 7) (314 . |map|)
              (320 . |retract|) (325 . +) |INTG0;palgint0;F2KFSupIr;10|
              (331 . |monomial|) (337 . |coerce|) (342 . -) (|List| 7)
              (|ExpressionFactorPolynomial| 6 7) (348 . |factor|)
              (354 . |sqrt|) (359 . *) (365 . *) (371 . -) (377 . |zero?|)
              (382 . ^) (388 . *) (394 . |eval|) (401 . |numer|)
              (406 . |denom|) (411 . /) (417 . |elt|) (423 . |retract|)
              (428 . |retract|) (433 . |coerce|) |INTG0;palgint0;F3KFFFIr;16|
              (438 . |multivariate|) (|Union| 9 '"failed")
              (444 . |symbolIfCan|) (|Union| 7 '#1="failed")
              (|Mapping| 145 7 7 9) |INTG0;palgRDE0;2F2KMKFFFU;17|
              (|SparseUnivariatePolynomialFunctions2| 109 7) (449 . |map|)
              (455 . |elt|) |INTG0;palgRDE0;2F2KMFSupU;19|
              (461 . |coefficients|) (466 . |inv|)
              (|LinearOrdinaryDifferentialOperator1| 109) (471 . |monomial|)
              (477 . |One|) (481 . |Zero|) (485 . |degree|)
              (490 . |coefficient|) (496 . *) (502 . +) (508 . *)
              (|Union| 109 '"failed")
              (|Record| (|:| |particular| 163) (|:| |basis| (|List| 109)))
              (|RationalLODE| 7 23) (514 . |ratDsolve|)
              (|Record| (|:| |particular| 145) (|:| |basis| 123))
              (520 . |palgLODE0|) (530 . |palgLODE0|))
           '#(|univariate| 542 |rationalize_ir| 550 |palgint0| 556 |palgRDE0|
              576 |palgLODE0| 600 |multivariate| 622 |lift| 629)
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
                        (|makeByteWordVec2| 169
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
                                              7 14 102 103 2 11 45 0 0 104 1 26
                                              0 0 105 1 26 0 0 106 1 110 108
                                              109 111 2 23 7 112 7 113 2 115 88
                                              114 108 116 1 26 109 0 117 2 88 0
                                              0 0 118 2 23 0 7 40 120 1 23 0 7
                                              121 2 23 0 0 0 122 2 124 38 23
                                              123 125 1 7 0 0 126 2 7 0 0 0 127
                                              2 7 0 43 0 128 2 7 0 0 0 129 1 7
                                              45 0 130 2 7 0 0 43 131 2 109 0 0
                                              0 132 3 7 0 0 14 102 133 1 109 23
                                              0 134 1 109 23 0 135 2 109 0 23
                                              23 136 2 23 112 112 112 137 1 109
                                              23 0 138 1 23 7 0 139 1 109 0 23
                                              140 2 24 7 109 11 142 1 11 143 0
                                              144 2 148 23 114 26 149 2 23 7 0
                                              7 150 1 8 123 0 152 1 7 0 0 153 2
                                              154 0 109 40 155 0 154 0 156 0
                                              154 0 157 1 8 40 0 158 2 8 7 0 40
                                              159 2 154 0 109 0 160 2 154 0 0 0
                                              161 2 154 0 0 0 162 2 165 164 154
                                              109 166 6 0 167 8 7 11 11 7 23
                                              168 8 0 167 8 7 11 11 11 7 109 7
                                              169 4 0 26 7 11 11 23 28 2 0 88
                                              88 11 101 7 0 88 7 11 11 11 7 109
                                              7 141 5 0 88 7 11 11 7 23 119 7 0
                                              145 7 7 11 11 146 7 23 151 9 0
                                              145 7 7 11 11 146 11 7 109 7 147
                                              8 1 167 8 7 11 11 11 7 109 7 169
                                              6 1 167 8 7 11 11 7 23 168 3 0 7
                                              26 11 7 107 2 0 26 23 11 27)))))
           '|lookupComplete|)) 
