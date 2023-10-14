
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
          (|fun2| #1=(|SparseUnivariatePolynomial| F))
          (|fun2c| #2=(|SparseUnivariatePolynomial| F)) (|ppcc| #2#)
          (|c2| (|Fraction| (|Integer|))) (|c1| (|Fraction| (|Integer|)))
          (|fun1| #1#) (|fun1c| #2#) (|fun| (|SparseUnivariatePolynomial| F))
          (|ppc| (|SparseUnivariatePolynomial| F)) (#3=#:G125 NIL)
          (|ppr| (|SparseUnivariatePolynomial| F))
          (|pol1| #4=(|SparseUnivariatePolynomial| F)) (|pol0| #4#)
          (|polu|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|opol| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |opol| (QVELT |ll| 1) . #5=(|INTG0;rationalize_log|))
              (LETT |polu|
                    (SPADCALL
                     (CONS #'|INTG0;rationalize_log!0| (VECTOR $ |k1|)) |opol|
                     (QREFELT $ 37))
                    . #5#)
              (LETT |pol0|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!1| $) |polu|
                              (QREFELT $ 45))
                    . #5#)
              (LETT |pol1|
                    (SPADCALL (CONS #'|INTG0;rationalize_log!2| $) |polu|
                              (QREFELT $ 45))
                    . #5#)
              (LETT |ppr|
                    (COND
                     ((SPADCALL |pol1| (|spadConstant| $ 49) (QREFELT $ 51))
                      |pol0|)
                     ('T (SPADCALL |pol0| |pol1| (QREFELT $ 52))))
                    . #5#)
              (LETT |ppc|
                    (PROG2
                        (LETT #3# (SPADCALL |opol| |ppr| (QREFELT $ 54)) . #5#)
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
               ((SPADCALL (SPADCALL |ppr| (QREFELT $ 55)) 0 (QREFELT $ 56))
                (SEQ (LETT |c1| (QVELT |ll| 0) . #5#)
                     (LETT |fun1| (SPADCALL |fun| |ppr| (QREFELT $ 57)) . #5#)
                     (LETT |fun1c|
                           (SPADCALL
                            (CONS #'|INTG0;rationalize_log!3| (VECTOR $ |k1|))
                            |fun1| (QREFELT $ 62))
                           . #5#)
                     (COND
                      ((SPADCALL |fun1c| |fun1| (QREFELT $ 63))
                       (SEQ
                        (LETT |fun1| (SPADCALL |fun1c| |fun1| (QREFELT $ 64))
                              . #5#)
                        (EXIT
                         (LETT |c1|
                               (SPADCALL |c1| (SPADCALL 2 (QREFELT $ 67))
                                         (QREFELT $ 68))
                               . #5#)))))
                     (EXIT
                      (LETT |res| (CONS (VECTOR |c1| |ppr| |fun1|) |res|)
                            . #5#)))))
              (COND
               ((SPADCALL (SPADCALL |ppc| (QREFELT $ 55)) 0 (QREFELT $ 56))
                (SEQ
                 (LETT |c2|
                       (SPADCALL (QVELT |ll| 0) (SPADCALL 2 (QREFELT $ 67))
                                 (QREFELT $ 68))
                       . #5#)
                 (LETT |fun2| (SPADCALL |fun| |ppc| (QREFELT $ 57)) . #5#)
                 (LETT |ppcc|
                       (SPADCALL
                        (CONS #'|INTG0;rationalize_log!4| (VECTOR $ |k1|))
                        |ppc| (QREFELT $ 62))
                       . #5#)
                 (LETT |fun2c|
                       (SPADCALL
                        (CONS #'|INTG0;rationalize_log!5| (VECTOR $ |k1|))
                        |fun2| (QREFELT $ 62))
                       . #5#)
                 (LETT |fun2|
                       (SPADCALL (SPADCALL |ppcc| |fun2| (QREFELT $ 64))
                                 (SPADCALL |ppc| |fun2c| (QREFELT $ 64))
                                 (QREFELT $ 69))
                       . #5#)
                 (EXIT
                  (LETT |res|
                        (CONS
                         (VECTOR |c2| (SPADCALL |ppc| |ppcc| (QREFELT $ 64))
                                 |fun2|)
                         |res|)
                        . #5#)))))
              (EXIT |res|)))) 

(SDEFUN |INTG0;rationalize_log!5| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 58)) (QREFELT $ 59))
                      (QREFELT $ 60)))))) 

(SDEFUN |INTG0;rationalize_log!4| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 58)) (QREFELT $ 59))
                      (QREFELT $ 60)))))) 

(SDEFUN |INTG0;rationalize_log!3| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1|
                      (SPADCALL (SPADCALL |k1| (QREFELT $ 58)) (QREFELT $ 59))
                      (QREFELT $ 60)))))) 

(SDEFUN |INTG0;rationalize_log!2| ((|c| NIL) ($ NIL))
        (SPADCALL |c| (|spadConstant| $ 48) (QREFELT $ 42))) 

(SDEFUN |INTG0;rationalize_log!1| ((|c| NIL) ($ NIL))
        (SPADCALL |c| (|spadConstant| $ 41) (QREFELT $ 42))) 

(SDEFUN |INTG0;rationalize_log!0| ((|c| NIL) ($$ NIL))
        (PROG (|k1| $)
          (LETT |k1| (QREFELT $$ 1) . #1=(|INTG0;rationalize_log|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |c| |k1| (SPADCALL |k1| (QREFELT $ 33))
                      (QREFELT $ 25)))))) 

(SDEFUN |INTG0;rationalize_ir;IrKIr;7|
        ((|irf| |IntegrationResult| F) (|k1| |Kernel| F)
         ($ |IntegrationResult| F))
        (SPROG
         ((|lp1|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G193 NIL) (|ll| NIL) (|rp1| (F)) (|rp| (F)))
         (SEQ
          (LETT |rp| (SPADCALL |irf| (QREFELT $ 71))
                . #2=(|INTG0;rationalize_ir;IrKIr;7|))
          (LETT |rp1|
                (SPADCALL
                 (SPADCALL |rp|
                           (SPADCALL |rp| |k1|
                                     (SPADCALL (SPADCALL |k1| (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (QREFELT $ 60))
                           (QREFELT $ 72))
                 (SPADCALL 2 (QREFELT $ 73)) (QREFELT $ 74))
                . #2#)
          (LETT |lp1| NIL . #2#)
          (SEQ (LETT |ll| NIL . #2#)
               (LETT #1# (SPADCALL |irf| (QREFELT $ 77)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ll| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lp1|
                       (SPADCALL (|INTG0;rationalize_log| |ll| |k1| $) |lp1|
                                 (QREFELT $ 78))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |rp1| |lp1| (SPADCALL |irf| (QREFELT $ 81))
                     (QREFELT $ 82)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;8|
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
                (SPADCALL |f| |x| |y| (SPADCALL |y| (QREFELT $ 33))
                          (QREFELT $ 28))
                . #1=(|INTG0;palgint0;F2KFSupIr;8|))
          (LETT |f0| (SPADCALL |ff| (QREFELT $ 84)) . #1#)
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $) . #1#)
          (LETT |rf|
                (|INTG0;mkRat|
                 (SPADCALL (SPADCALL |ff| (QREFELT $ 85)) |x|
                           (SPADCALL |y| (QREFELT $ 58)) (QREFELT $ 86))
                 (QVELT |pr| 1) (QVELT |pr| 2) $)
                . #1#)
          (LETT |irf| (SPADCALL |rf| (QREFELT $ 90)) . #1#)
          (LETT |irf1|
                (SPADCALL
                 (CONS #'|INTG0;palgint0;F2KFSupIr;8!0| (VECTOR $ |pr|)) |irf|
                 (QREFELT $ 95))
                . #1#)
          (COND
           ((NULL (NULL (QVELT |pr| 2)))
            (LETT |irf1|
                  (SPADCALL |irf1| (|SPADfirst| (QVELT |pr| 2)) (QREFELT $ 83))
                  . #1#)))
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;8!1| (VECTOR $ |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT $ 96)) (QREFELT $ 90))
                      (QREFELT $ 95))
            |irf1| (QREFELT $ 97)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;8!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 58)) (QREFELT $ 92)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;8!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;8|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 92)))))) 

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
          (LETT |u| (SPADCALL (QREFELT $ 13) (QREFELT $ 58))
                . #1=(|INTG0;quadsubst|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 42)) . #1#)
          (LETT |c| (SPADCALL |p| 0 (QREFELT $ 42)) . #1#)
          (LETT |sa|
                (SPADCALL
                 (SPADCALL (LETT |a| (SPADCALL |p| 2 (QREFELT $ 42)) . #1#)
                           (QREFELT $ 99))
                 (QREFELT $ 101))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (SPADCALL (SPADCALL |b| |b| (QREFELT $ 102))
                        (SPADCALL (SPADCALL 4 |a| (QREFELT $ 104)) |c|
                                  (QREFELT $ 102))
                        (QREFELT $ 105))
              (QREFELT $ 106))
             (VECTOR (SPADCALL |x| (QREFELT $ 58))
                     (VECTOR (|spadConstant| $ 47) (LIST |x| |y|)
                             (LIST |u|
                                   (SPADCALL
                                    (SPADCALL |sa|
                                              (SPADCALL |u|
                                                        (SPADCALL |b|
                                                                  (SPADCALL 2
                                                                            |a|
                                                                            (QREFELT
                                                                             $
                                                                             104))
                                                                  (QREFELT $
                                                                           74))
                                                        (QREFELT $ 72))
                                              (QREFELT $ 102))
                                    (SPADCALL |den| |x| |u| (QREFELT $ 60))
                                    (QREFELT $ 74))))
                     NIL))
            ((NULL (|INTG0;kerdiff| |sa| |a| $))
             (SEQ
              (LETT |bm2u|
                    (SPADCALL |b|
                              (SPADCALL (SPADCALL 2 |u| (QREFELT $ 104)) |sa|
                                        (QREFELT $ 102))
                              (QREFELT $ 105))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |u| 2 (QREFELT $ 107))
                                               |c| (QREFELT $ 105))
                                     |bm2u| (QREFELT $ 74))
                                    . #1#)
                              (QREFELT $ 60))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ua|
                           (SPADCALL |u| (SPADCALL |xx| |sa| (QREFELT $ 102))
                                     (QREFELT $ 72))
                           . #1#)
                     |q| (QREFELT $ 74))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (SPADCALL |y| (QREFELT $ 58))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 58)) |sa|
                                    (QREFELT $ 102))
                          (QREFELT $ 105))
                (VECTOR
                 (SPADCALL (SPADCALL 2 |ua| (QREFELT $ 104)) |bm2u|
                           (QREFELT $ 74))
                 (LIST |x| |y|) (LIST |xx| |yy|))
                NIL))))
            ('T
             (SEQ
              (LETT |u2ma|
                    (SPADCALL (SPADCALL |u| 2 (QREFELT $ 107)) |a|
                              (QREFELT $ 105))
                    . #1#)
              (LETT |sc|
                    (SPADCALL (SPADCALL |c| (QREFELT $ 99)) (QREFELT $ 101))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL |b|
                                               (SPADCALL
                                                (SPADCALL 2 |u|
                                                          (QREFELT $ 104))
                                                |sc| (QREFELT $ 102))
                                               (QREFELT $ 105))
                                     |u2ma| (QREFELT $ 74))
                                    . #1#)
                              (QREFELT $ 60))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ux|
                           (SPADCALL (SPADCALL |xx| |u| (QREFELT $ 102)) |sc|
                                     (QREFELT $ 72))
                           . #1#)
                     |q| (QREFELT $ 74))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |y| (QREFELT $ 58)) |sc| (QREFELT $ 105))
                 (SPADCALL |x| (QREFELT $ 58)) (QREFELT $ 74))
                (VECTOR
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 |ux| (QREFELT $ 104)) |u2ma|
                            (QREFELT $ 74))
                  (QREFELT $ 59))
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
                                  (LIST |t| (SPADCALL |z| (QREFELT $ 58)))
                                  (QREFELT $ 109))
                        |z| (QREFELT $ 22))
                       |dx| (QREFELT $ 110))
                      |INTG0;mkRatlx|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 111))
                           (SPADCALL |rat| (QREFELT $ 112)) (QREFELT $ 113)))))) 

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
                                            (QREFELT $ 109))
                                  (QREFELT $ 102))
                        |l| $)
                       (QREFELT $ 13) (QREFELT $ 22))
                      |INTG0;mkRat|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 111))
                           (SPADCALL |rat| (QREFELT $ 112)) (QREFELT $ 113)))))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;12|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |IntegrationResult| F))
        (SPROG NIL
               (SPADCALL (CONS #'|INTG0;palgint0;F3KFFIr;12!0| (VECTOR $ |y|))
                         (SPADCALL
                          (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                          (QREFELT $ 90))
                         (QREFELT $ 95)))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;12!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F3KFFIr;12|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 114)))))) 

(SDEFUN |INTG0;palgextint0;F2KFKFFU;13|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|g| F) (|z| |Kernel| F)
         (|xx| F) (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG NIL
               (SPADCALL
                (CONS #'|INTG0;palgextint0;F2KFKFFU;13!0| (VECTOR $ |y|))
                (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                          (|INTG0;mkRatlx| |g| |x| |y| |xx| |z| |dx| $)
                          (QREFELT $ 118))
                (QREFELT $ 121)))) 

(SDEFUN |INTG0;palgextint0;F2KFKFFU;13!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palgextint0;F2KFKFFU;13|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 114)))))) 

(SDEFUN |INTG0;palglimint0;F2KLKFFU;14|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|lu| |List| F)
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG ((#1=#:G237 NIL) (|u| NIL) (#2=#:G236 NIL))
               (SEQ
                (SPADCALL
                 (CONS #'|INTG0;palglimint0;F2KLKFFU;14!0| (VECTOR $ |y|))
                 (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                           (PROGN
                            (LETT #2# NIL
                                  . #3=(|INTG0;palglimint0;F2KLKFFU;14|))
                            (SEQ (LETT |u| NIL . #3#) (LETT #1# |lu| . #3#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (|INTG0;mkRatlx| |u| |x| |y| |xx| |z|
                                           |dx| $)
                                          #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 127))
                 (QREFELT $ 131))))) 

(SDEFUN |INTG0;palglimint0;F2KLKFFU;14!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palglimint0;F2KLKFFU;14|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 114)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFU;15|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) ($ |Union| F #2#))
        (SPROG ((|u| #1#) (#3=#:G242 NIL))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL |f| (LIST |x| |y|)
                                 (LIST |xx| (SPADCALL |z| (QREFELT $ 58)))
                                 (QREFELT $ 109))
                       (SPADCALL (SPADCALL |dx| |z| (QREFELT $ 114))
                                 (SPADCALL |g| (LIST |x| |y|)
                                           (LIST |xx|
                                                 (SPADCALL |z| (QREFELT $ 58)))
                                           (QREFELT $ 109))
                                 (QREFELT $ 102))
                       (PROG2
                           (LETT #3# (SPADCALL |z| (QREFELT $ 135))
                                 . #4=(|INTG0;palgRDE0;2F2KMKFFU;15|))
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
                                        (SPADCALL |y| (QREFELT $ 58))
                                        (QREFELT $ 60))))))))) 

(SDEFUN |INTG0;multivariate;SupK2F;16|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| F) ($ F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;16!0| (VECTOR $ |x|)) |p|
                 (QREFELT $ 140))
                |y| (QREFELT $ 141)))) 

(SDEFUN |INTG0;multivariate;SupK2F;16!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;multivariate;SupK2F;16|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 114)))))) 

(SDEFUN |INTG0;palgextint0;F2K2FSupU;17|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|g| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                |INTG0;palgextint0;F2K2FSupU;17|)
          (EXIT
           (SPADCALL
            (CONS #'|INTG0;palgextint0;F2K2FSupU;17!0| (VECTOR $ |pr|))
            (SPADCALL (|INTG0;mkRat| |f| (QVELT |pr| 1) (QVELT |pr| 2) $)
                      (|INTG0;mkRat| |g| (QVELT |pr| 1) (QVELT |pr| 2) $)
                      (QREFELT $ 118))
            (QREFELT $ 121)))))) 

(SDEFUN |INTG0;palgextint0;F2K2FSupU;17!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palgextint0;F2K2FSupU;17|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 92)))))) 

(SDEFUN |INTG0;palglimint0;F2KLFSupU;18|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|lu| |List| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((#1=#:G284 NIL) (|u| NIL) (#2=#:G283 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #3=(|INTG0;palglimint0;F2KLFSupU;18|))
          (EXIT
           (SPADCALL
            (CONS #'|INTG0;palglimint0;F2KLFSupU;18!0| (VECTOR $ |pr|))
            (SPADCALL (|INTG0;mkRat| |f| (QVELT |pr| 1) (QVELT |pr| 2) $)
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |u| NIL . #3#) (LETT #1# |lu| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (|INTG0;mkRat| |u| (QVELT |pr| 1)
                                      (QVELT |pr| 2) $)
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 127))
            (QREFELT $ 131)))))) 

(SDEFUN |INTG0;palglimint0;F2KLFSupU;18!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palglimint0;F2KLFSupU;18|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 92)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;19|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|den| F) (|radi| |SparseUnivariatePolynomial| F) ($ |Union| F #2#))
        (SPROG
         ((|u| #1#) (#3=#:G291 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #4=(|INTG0;palgRDE0;2F2KMFSupU;19|))
          (LETT |u|
                (SPADCALL
                 (|INTG0;checkroot|
                  (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                            (QVELT (QVELT |pr| 1) 2) (QREFELT $ 109))
                  (QVELT |pr| 2) $)
                 (|INTG0;checkroot|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0)
                            (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                      (QVELT (QVELT |pr| 1) 2) (QREFELT $ 109))
                            (QREFELT $ 102))
                  (QVELT |pr| 2) $)
                 (PROG2
                     (LETT #3# (SPADCALL (QREFELT $ 13) (QREFELT $ 135)) . #4#)
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
                                  (QREFELT $ 60))))))))) 

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;20|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G303 NIL) (|bas| (|List| F)) (#2=#:G313 NIL) (|b| NIL)
          (#3=#:G312 NIL)
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
          (#5=#:G311 NIL) (|i| NIL)
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
                . #6=(|INTG0;palgLODE0;LF2KFSupR;20|))
          (LETT |d|
                (SPADCALL
                 (|INTG0;univ|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT $ 145))
                  (QVELT |pr| 2) (QREFELT $ 13) $)
                 1 (QREFELT $ 147))
                . #6#)
          (LETT |di| (|spadConstant| $ 148) . #6#)
          (LETT |op| (|spadConstant| $ 149) . #6#)
          (SEQ (LETT |i| 0 . #6#)
               (LETT #5# (SPADCALL |eq| (QREFELT $ 150)) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (|INTG0;univ|
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 151))
                                            (QVELT (QVELT |pr| 1) 1)
                                            (QVELT (QVELT |pr| 1) 2)
                                            (QREFELT $ 109))
                                  (QVELT |pr| 2) (QREFELT $ 13) $)
                                 |di| (QREFELT $ 152))
                                (QREFELT $ 153))
                      . #6#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 154)) . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (|INTG0;univ|
                           (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                     (QVELT (QVELT |pr| 1) 2) (QREFELT $ 109))
                           (QVELT |pr| 2) (QREFELT $ 13) $)
                          (QREFELT $ 158))
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
                               (SPADCALL |b| (QVELT |pr| 0) (QREFELT $ 92))
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
                          (QVELT |pr| 0) (QREFELT $ 92)))
                   |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFR;21|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| . #1=(|Kernel| F))
         (|kz| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#2=#:G320 NIL) (|bas| (|List| F)) (#3=#:G329 NIL) (|b| NIL)
          (#4=#:G328 NIL)
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
          (#6=#:G327 NIL) (|i| NIL) (|lv| (|List| F)) (|lk| (|List| #1#))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT $ 114))
                            (QREFELT $ 145))
                  |kz| (QREFELT $ 22))
                 1 (QREFELT $ 147))
                . #7=(|INTG0;palgLODE0;LF3KFFR;21|))
          (LETT |di| (|spadConstant| $ 148) . #7#)
          (LETT |op| (|spadConstant| $ 149) . #7#)
          (LETT |lk| (LIST |x| |y|) . #7#)
          (LETT |lv| (LIST |xx| (SPADCALL |kz| (QREFELT $ 58))) . #7#)
          (SEQ (LETT |i| 0 . #7#)
               (LETT #6# (SPADCALL |eq| (QREFELT $ 150)) . #7#) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 151))
                                            |lk| |lv| (QREFELT $ 109))
                                  |kz| (QREFELT $ 22))
                                 |di| (QREFELT $ 152))
                                (QREFELT $ 153))
                      . #7#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 154)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g| |lk| |lv| (QREFELT $ 109))
                                    |kz| (QREFELT $ 22))
                          (QREFELT $ 158))
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
                        (LETT #4# (CONS (SPADCALL |b| |y| (QREFELT $ 114)) #4#)
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
                          |y| (QREFELT $ 114)))
                   |bas|))))))) 

(DECLAIM (NOTINLINE |GenusZeroIntegration;|)) 

(DEFUN |GenusZeroIntegration| (&REST #1=#:G330)
  (SPROG NIL
         (PROG (#2=#:G331)
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
          (LETT $ (GETREFV 162) . #1#)
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
             (QSETREFV $ 160
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;20|) $))
             (QSETREFV $ 161
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFR;21|)
                             $)))))
          $))) 

(MAKEPROP '|GenusZeroIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|)
              '|dummy| (|List| 21) (9 . |kernels|) (|List| 11)
              (14 . |setDifference|) (|ElementaryFunctionStructurePackage| 6 7)
              (20 . |rootNormalize|) (|Fraction| 32) (|Kernel| $)
              (26 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 11)
                                                     7)
              (32 . |univariate|) (|SparseUnivariatePolynomial| 88)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 88 7) (|SparseUnivariatePolynomialFunctions2| 7 88)
              (39 . |map|) (|SparseUnivariatePolynomial| $) (45 . |minPoly|)
              (|SparseUnivariatePolynomial| 23) (|Mapping| 23 7)
              (|SparseUnivariatePolynomialFunctions2| 7 23) (50 . |map|)
              (56 . |Zero|) (60 . |Zero|) (|NonNegativeInteger|) (64 . |Zero|)
              (68 . |coefficient|) (|Mapping| 7 23)
              (|SparseUnivariatePolynomialFunctions2| 23 7) (74 . |map|)
              (80 . |One|) (84 . |One|) (88 . |One|) (92 . |Zero|) (|Boolean|)
              (96 . =) (102 . |gcd|) (|Union| $ '"failed") (108 . |exquo|)
              (114 . |degree|) (119 . >) (125 . |rem|) (131 . |coerce|)
              (136 . -) (141 . |eval|) (|Mapping| 7 7) (148 . |map|) (154 . ~=)
              (160 . *) (|Integer|) (|Fraction| 65) (166 . |coerce|) (171 . /)
              (177 . +) (|IntegrationResult| 7) (183 . |ratpart|) (188 . +)
              (194 . |coerce|) (199 . /)
              (|Record| (|:| |scalar| 66) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 75) (205 . |logpart|) (210 . |concat|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 79)
              (216 . |notelem|) (221 . |mkAnswer|)
              |INTG0;rationalize_ir;IrKIr;7| (228 . |reductum|)
              (233 . |leadingMonomial|) |INTG0;multivariate;SupK2F;16|
              (|IntegrationResult| 88) (|Fraction| 23)
              (|RationalIntegration| 7 23) (238 . |integrate|) (|Fraction| $)
              (243 . |elt|) (|Mapping| 7 88)
              (|IntegrationResultFunctions2| 88 7) (249 . |map|)
              (255 . |retract|) (260 . +) |INTG0;palgint0;F2KFSupIr;8|
              (266 . |sqrt|) (|AlgebraicManipulations| 6 7) (271 . |rootSimp|)
              (276 . *) (|PositiveInteger|) (282 . *) (288 . -) (294 . |zero?|)
              (299 . ^) (|List| $) (305 . |eval|) (312 . *) (318 . |numer|)
              (323 . |denom|) (328 . /) (334 . |multivariate|)
              |INTG0;palgint0;F3KFFIr;12|
              (|Record| (|:| |ratpart| 88) (|:| |coeff| 88))
              (|Union| 116 '"failed") (340 . |extendedint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 119 '"failed") (346 . |map|)
              |INTG0;palgextint0;F2KFKFFU;13|
              (|Record| (|:| |coeff| 88) (|:| |logand| 88))
              (|Record| (|:| |mainpart| 88) (|:| |limitedlogs| (|List| 123)))
              (|Union| 124 '"failed") (|List| 88) (352 . |limitedint|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 128)))
              (|Union| 129 '"failed") (358 . |map|) (|List| 7)
              |INTG0;palglimint0;F2KLKFFU;14| (|Union| 9 '"failed")
              (364 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 136 7 7 9)
              |INTG0;palgRDE0;2F2KMKFFU;15|
              (|SparseUnivariatePolynomialFunctions2| 88 7) (369 . |map|)
              (375 . |elt|) |INTG0;palgextint0;F2K2FSupU;17|
              |INTG0;palglimint0;F2KLFSupU;18| |INTG0;palgRDE0;2F2KMFSupU;19|
              (381 . |inv|) (|LinearOrdinaryDifferentialOperator1| 88)
              (386 . |monomial|) (392 . |One|) (396 . |Zero|) (400 . |degree|)
              (405 . |coefficient|) (411 . *) (417 . +) (423 . *)
              (|Union| 88 '"failed")
              (|Record| (|:| |particular| 155) (|:| |basis| 126))
              (|RationalLODE| 7 23) (429 . |ratDsolve|)
              (|Record| (|:| |particular| 136) (|:| |basis| 132))
              (435 . |palgLODE0|) (445 . |palgLODE0|))
           '#(|univariate| 456 |rationalize_ir| 464 |palglimint0| 470
              |palgint0| 491 |palgextint0| 510 |palgRDE0| 531 |palgLODE0| 554
              |multivariate| 575 |lift| 582)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 161
                                                 '(0 9 0 10 1 11 0 9 12 1 7 14
                                                   0 15 2 16 0 0 0 17 2 18 7 7
                                                   11 19 2 7 20 0 21 22 3 24 23
                                                   7 11 23 25 2 30 26 29 23 31
                                                   1 7 32 21 33 2 36 34 35 23
                                                   37 0 6 0 38 0 7 0 39 0 40 0
                                                   41 2 23 7 0 40 42 2 44 23 43
                                                   34 45 0 6 0 46 0 7 0 47 0 40
                                                   0 48 0 23 0 49 2 23 50 0 0
                                                   51 2 23 0 0 0 52 2 23 53 0 0
                                                   54 1 23 40 0 55 2 40 50 0 0
                                                   56 2 23 0 0 0 57 1 7 0 21 58
                                                   1 7 0 0 59 3 7 0 0 21 0 60 2
                                                   23 0 61 0 62 2 23 50 0 0 63
                                                   2 23 0 0 0 64 1 66 0 65 67 2
                                                   66 0 0 0 68 2 23 0 0 0 69 1
                                                   70 7 0 71 2 7 0 0 0 72 1 7 0
                                                   65 73 2 7 0 0 0 74 1 70 76 0
                                                   77 2 76 0 0 0 78 1 70 80 0
                                                   81 3 70 0 7 76 80 82 1 26 0
                                                   0 84 1 26 0 0 85 1 89 87 88
                                                   90 2 23 7 91 7 92 2 94 70 93
                                                   87 95 1 26 88 0 96 2 70 0 0
                                                   0 97 1 7 0 0 99 1 100 7 7
                                                   101 2 7 0 0 0 102 2 7 0 103
                                                   0 104 2 7 0 0 0 105 1 7 50 0
                                                   106 2 7 0 0 103 107 3 7 0 0
                                                   14 108 109 2 88 0 0 0 110 1
                                                   88 23 0 111 1 88 23 0 112 2
                                                   88 0 23 23 113 2 24 7 88 11
                                                   114 2 89 117 88 88 118 2 94
                                                   120 93 117 121 2 89 125 88
                                                   126 127 2 94 130 93 125 131
                                                   1 11 134 0 135 2 139 23 93
                                                   26 140 2 23 7 0 7 141 1 7 0
                                                   0 145 2 146 0 88 40 147 0
                                                   146 0 148 0 146 0 149 1 8 40
                                                   0 150 2 8 7 0 40 151 2 146 0
                                                   88 0 152 2 146 0 0 0 153 2
                                                   146 0 0 0 154 2 157 156 146
                                                   88 158 6 0 159 8 7 11 11 7
                                                   23 160 7 0 159 8 7 11 11 11
                                                   7 88 161 4 0 26 7 11 11 23
                                                   28 2 0 70 70 11 83 6 0 130 7
                                                   11 11 132 7 23 143 7 0 130 7
                                                   11 11 132 11 7 88 133 5 0 70
                                                   7 11 11 7 23 98 6 0 70 7 11
                                                   11 11 7 88 115 6 0 120 7 11
                                                   11 7 7 23 142 7 0 120 7 11
                                                   11 7 11 7 88 122 7 0 136 7 7
                                                   11 11 137 7 23 144 8 0 136 7
                                                   7 11 11 137 11 7 88 138 7 1
                                                   159 8 7 11 11 11 7 88 161 6
                                                   1 159 8 7 11 11 7 23 160 3 0
                                                   7 26 11 7 86 2 0 26 23 11
                                                   27)))))
           '|lookupComplete|)) 
