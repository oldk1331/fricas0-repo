
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

(SDEFUN |INTG0;palgint0;F2KFSupIr;6|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F) ($ |IntegrationResult| F))
        (SPROG
         ((|pr|
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
                . #1=(|INTG0;palgint0;F2KFSupIr;6|))
          (LETT |f0| (SPADCALL |ff| (QREFELT $ 34)) . #1#)
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;6!0| (VECTOR $ |x|))
                      (SPADCALL (SPADCALL |f0| (QREFELT $ 39)) (QREFELT $ 42))
                      (QREFELT $ 46))
            (SPADCALL (CONS #'|INTG0;palgint0;F2KFSupIr;6!1| (VECTOR $ |pr|))
                      (SPADCALL
                       (|INTG0;mkRat|
                        (SPADCALL (SPADCALL |ff| (QREFELT $ 47)) |x|
                                  (SPADCALL |y| (QREFELT $ 35)) (QREFELT $ 48))
                        (QVELT |pr| 1) (QVELT |pr| 2) $)
                       (QREFELT $ 42))
                      (QREFELT $ 46))
            (QREFELT $ 49)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;6!1| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 37)))))) 

(SDEFUN |INTG0;palgint0;F2KFSupIr;6!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F2KFSupIr;6|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 37)))))) 

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
          (LETT |u| (SPADCALL (QREFELT $ 13) (QREFELT $ 35))
                . #1=(|INTG0;quadsubst|))
          (LETT |b| (SPADCALL |p| 1 (QREFELT $ 54)) . #1#)
          (LETT |c| (SPADCALL |p| 0 (QREFELT $ 54)) . #1#)
          (LETT |sa|
                (SPADCALL
                 (SPADCALL (LETT |a| (SPADCALL |p| 2 (QREFELT $ 54)) . #1#)
                           (QREFELT $ 57))
                 (QREFELT $ 59))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (SPADCALL (SPADCALL |b| |b| (QREFELT $ 60))
                        (SPADCALL (SPADCALL 4 |a| (QREFELT $ 62)) |c|
                                  (QREFELT $ 60))
                        (QREFELT $ 63))
              (QREFELT $ 65))
             (VECTOR (SPADCALL |x| (QREFELT $ 35))
                     (VECTOR (|spadConstant| $ 52) (LIST |x| |y|)
                             (LIST |u|
                                   (SPADCALL
                                    (SPADCALL |sa|
                                              (SPADCALL |u|
                                                        (SPADCALL |b|
                                                                  (SPADCALL 2
                                                                            |a|
                                                                            (QREFELT
                                                                             $
                                                                             62))
                                                                  (QREFELT $
                                                                           66))
                                                        (QREFELT $ 67))
                                              (QREFELT $ 60))
                                    (SPADCALL |den| |x| |u| (QREFELT $ 68))
                                    (QREFELT $ 66))))
                     NIL))
            ((NULL (|INTG0;kerdiff| |sa| |a| $))
             (SEQ
              (LETT |bm2u|
                    (SPADCALL |b|
                              (SPADCALL (SPADCALL 2 |u| (QREFELT $ 62)) |sa|
                                        (QREFELT $ 60))
                              (QREFELT $ 63))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |u| 2 (QREFELT $ 69))
                                               |c| (QREFELT $ 63))
                                     |bm2u| (QREFELT $ 66))
                                    . #1#)
                              (QREFELT $ 68))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ua|
                           (SPADCALL |u| (SPADCALL |xx| |sa| (QREFELT $ 60))
                                     (QREFELT $ 67))
                           . #1#)
                     |q| (QREFELT $ 66))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL (SPADCALL |y| (QREFELT $ 35))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 35)) |sa|
                                    (QREFELT $ 60))
                          (QREFELT $ 63))
                (VECTOR
                 (SPADCALL (SPADCALL 2 |ua| (QREFELT $ 62)) |bm2u|
                           (QREFELT $ 66))
                 (LIST |x| |y|) (LIST |xx| |yy|))
                NIL))))
            ('T
             (SEQ
              (LETT |u2ma|
                    (SPADCALL (SPADCALL |u| 2 (QREFELT $ 69)) |a|
                              (QREFELT $ 63))
                    . #1#)
              (LETT |sc|
                    (SPADCALL (SPADCALL |c| (QREFELT $ 57)) (QREFELT $ 59))
                    . #1#)
              (LETT |q|
                    (SPADCALL |den| |x|
                              (LETT |xx|
                                    (SPADCALL
                                     (SPADCALL |b|
                                               (SPADCALL
                                                (SPADCALL 2 |u| (QREFELT $ 62))
                                                |sc| (QREFELT $ 60))
                                               (QREFELT $ 63))
                                     |u2ma| (QREFELT $ 66))
                                    . #1#)
                              (QREFELT $ 68))
                    . #1#)
              (LETT |yy|
                    (SPADCALL
                     (LETT |ux|
                           (SPADCALL (SPADCALL |xx| |u| (QREFELT $ 60)) |sc|
                                     (QREFELT $ 67))
                           . #1#)
                     |q| (QREFELT $ 66))
                    . #1#)
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |y| (QREFELT $ 35)) |sc| (QREFELT $ 63))
                 (SPADCALL |x| (QREFELT $ 35)) (QREFELT $ 66))
                (VECTOR
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 |ux| (QREFELT $ 62)) |u2ma|
                            (QREFELT $ 66))
                  (QREFELT $ 70))
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
                                  (LIST |t| (SPADCALL |z| (QREFELT $ 35)))
                                  (QREFELT $ 72))
                        |z| (QREFELT $ 22))
                       |dx| (QREFELT $ 73))
                      |INTG0;mkRatlx|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 74))
                           (SPADCALL |rat| (QREFELT $ 75)) (QREFELT $ 76)))))) 

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
                                            (QREFELT $ 72))
                                  (QREFELT $ 60))
                        |l| $)
                       (QREFELT $ 13) (QREFELT $ 22))
                      |INTG0;mkRat|)
                (EXIT
                 (SPADCALL (SPADCALL |rat| (QREFELT $ 74))
                           (SPADCALL |rat| (QREFELT $ 75)) (QREFELT $ 76)))))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;10|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |IntegrationResult| F))
        (SPROG NIL
               (SPADCALL (CONS #'|INTG0;palgint0;F3KFFIr;10!0| (VECTOR $ |y|))
                         (SPADCALL
                          (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                          (QREFELT $ 42))
                         (QREFELT $ 46)))) 

(SDEFUN |INTG0;palgint0;F3KFFIr;10!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palgint0;F3KFFIr;10|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 77)))))) 

(SDEFUN |INTG0;palgextint0;F2KFKFFU;11|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|g| F) (|z| |Kernel| F)
         (|xx| F) (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG NIL
               (SPADCALL
                (CONS #'|INTG0;palgextint0;F2KFKFFU;11!0| (VECTOR $ |y|))
                (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                          (|INTG0;mkRatlx| |g| |x| |y| |xx| |z| |dx| $)
                          (QREFELT $ 81))
                (QREFELT $ 84)))) 

(SDEFUN |INTG0;palgextint0;F2KFKFFU;11!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palgextint0;F2KFKFFU;11|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 77)))))) 

(SDEFUN |INTG0;palglimint0;F2KLKFFU;12|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|lu| |List| F)
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG ((#1=#:G157 NIL) (|u| NIL) (#2=#:G156 NIL))
               (SEQ
                (SPADCALL
                 (CONS #'|INTG0;palglimint0;F2KLKFFU;12!0| (VECTOR $ |y|))
                 (SPADCALL (|INTG0;mkRatlx| |f| |x| |y| |xx| |z| |dx| $)
                           (PROGN
                            (LETT #2# NIL
                                  . #3=(|INTG0;palglimint0;F2KLKFFU;12|))
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
                           (QREFELT $ 90))
                 (QREFELT $ 94))))) 

(SDEFUN |INTG0;palglimint0;F2KLKFFU;12!0| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $)
          (LETT |y| (QREFELT $$ 1) . #1=(|INTG0;palglimint0;F2KLKFFU;12|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |y| (QREFELT $ 77)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMKFFU;13|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|z| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F)) ($ |Union| F #2#))
        (SPROG ((|u| #1#) (#3=#:G162 NIL))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL |f| (LIST |x| |y|)
                                 (LIST |xx| (SPADCALL |z| (QREFELT $ 35)))
                                 (QREFELT $ 72))
                       (SPADCALL (SPADCALL |dx| |z| (QREFELT $ 77))
                                 (SPADCALL |g| (LIST |x| |y|)
                                           (LIST |xx|
                                                 (SPADCALL |z| (QREFELT $ 35)))
                                           (QREFELT $ 72))
                                 (QREFELT $ 60))
                       (PROG2
                           (LETT #3# (SPADCALL |z| (QREFELT $ 98))
                                 . #4=(|INTG0;palgRDE0;2F2KMKFFU;13|))
                           (QCDR #3#)
                         (|check_union| (QEQCAR #3# 0) (|Symbol|) #3#))
                       |rischde|)
                      . #4#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |u|) |z|
                                        (SPADCALL |y| (QREFELT $ 35))
                                        (QREFELT $ 68))))))))) 

(SDEFUN |INTG0;multivariate;SupK2F;14|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|x| |Kernel| F) (|y| F) ($ F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL
                 (CONS #'|INTG0;multivariate;SupK2F;14!0| (VECTOR $ |x|)) |p|
                 (QREFELT $ 103))
                |y| (QREFELT $ 104)))) 

(SDEFUN |INTG0;multivariate;SupK2F;14!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTG0;multivariate;SupK2F;14|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 77)))))) 

(SDEFUN |INTG0;palgextint0;F2K2FSupU;15|
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
                |INTG0;palgextint0;F2K2FSupU;15|)
          (EXIT
           (SPADCALL
            (CONS #'|INTG0;palgextint0;F2K2FSupU;15!0| (VECTOR $ |pr|))
            (SPADCALL (|INTG0;mkRat| |f| (QVELT |pr| 1) (QVELT |pr| 2) $)
                      (|INTG0;mkRat| |g| (QVELT |pr| 1) (QVELT |pr| 2) $)
                      (QREFELT $ 81))
            (QREFELT $ 84)))))) 

(SDEFUN |INTG0;palgextint0;F2K2FSupU;15!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palgextint0;F2K2FSupU;15|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 37)))))) 

(SDEFUN |INTG0;palglimint0;F2KLFSupU;16|
        ((|f| F) (|x| |Kernel| F) (|y| |Kernel| F) (|lu| |List| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((#1=#:G204 NIL) (|u| NIL) (#2=#:G203 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #3=(|INTG0;palglimint0;F2KLFSupU;16|))
          (EXIT
           (SPADCALL
            (CONS #'|INTG0;palglimint0;F2KLFSupU;16!0| (VECTOR $ |pr|))
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
                      (QREFELT $ 90))
            (QREFELT $ 94)))))) 

(SDEFUN |INTG0;palglimint0;F2KLFSupU;16!0| ((|f1| NIL) ($$ NIL))
        (PROG (|pr| $)
          (LETT |pr| (QREFELT $$ 1) . #1=(|INTG0;palglimint0;F2KLFSupU;16|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |f1| (QVELT |pr| 0) (QREFELT $ 37)))))) 

(SDEFUN |INTG0;palgRDE0;2F2KMFSupU;17|
        ((|f| F) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F)
         (|rischde| |Mapping| #1=(|Union| F #2="failed") F F (|Symbol|))
         (|den| F) (|radi| |SparseUnivariatePolynomial| F) ($ |Union| F #2#))
        (SPROG
         ((|u| #1#) (#3=#:G211 NIL)
          (|pr|
           (|Record| (|:| |diff| F)
                     (|:| |subs|
                          (|Record| (|:| |coeff| F)
                                    (|:| |var| (|List| (|Kernel| F)))
                                    (|:| |val| (|List| F))))
                     (|:| |newk| (|List| (|Kernel| F))))))
         (SEQ
          (LETT |pr| (|INTG0;quadsubst| |x| |y| |den| |radi| $)
                . #4=(|INTG0;palgRDE0;2F2KMFSupU;17|))
          (LETT |u|
                (SPADCALL
                 (|INTG0;checkroot|
                  (SPADCALL |f| (QVELT (QVELT |pr| 1) 1)
                            (QVELT (QVELT |pr| 1) 2) (QREFELT $ 72))
                  (QVELT |pr| 2) $)
                 (|INTG0;checkroot|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0)
                            (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                      (QVELT (QVELT |pr| 1) 2) (QREFELT $ 72))
                            (QREFELT $ 60))
                  (QVELT |pr| 2) $)
                 (PROG2
                     (LETT #3# (SPADCALL (QREFELT $ 13) (QREFELT $ 98)) . #4#)
                     (QCDR #3#)
                   (|check_union| (QEQCAR #3# 0) (|Symbol|) #3#))
                 |rischde|)
                . #4#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL (QCDR |u|) (QREFELT $ 13) (QVELT |pr| 0)
                                  (QREFELT $ 68))))))))) 

(SDEFUN |INTG0;palgLODE0;LF2KFSupR;18|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| |Kernel| F) (|den| F)
         (|radi| |SparseUnivariatePolynomial| F)
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#1=#:G223 NIL) (|bas| (|List| F)) (#2=#:G233 NIL) (|b| NIL)
          (#3=#:G232 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          "failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#4=#:G231 NIL) (|i| NIL)
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
                . #5=(|INTG0;palgLODE0;LF2KFSupR;18|))
          (LETT |d|
                (SPADCALL
                 (|INTG0;univ|
                  (SPADCALL (QVELT (QVELT |pr| 1) 0) (QREFELT $ 108))
                  (QVELT |pr| 2) (QREFELT $ 13) $)
                 1 (QREFELT $ 110))
                . #5#)
          (LETT |di| (|spadConstant| $ 111) . #5#)
          (LETT |op| (|spadConstant| $ 112) . #5#)
          (SEQ (LETT |i| 0 . #5#)
               (LETT #4# (SPADCALL |eq| (QREFELT $ 113)) . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (|INTG0;univ|
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 114))
                                            (QVELT (QVELT |pr| 1) 1)
                                            (QVELT (QVELT |pr| 1) 2)
                                            (QREFELT $ 72))
                                  (QVELT |pr| 2) (QREFELT $ 13) $)
                                 |di| (QREFELT $ 115))
                                (QREFELT $ 116))
                      . #5#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 117)) . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (|INTG0;univ|
                           (SPADCALL |g| (QVELT (QVELT |pr| 1) 1)
                                     (QVELT (QVELT |pr| 1) 2) (QREFELT $ 72))
                           (QVELT |pr| 2) (QREFELT $ 13) $)
                          (QREFELT $ 121))
                . #5#)
          (LETT |bas|
                (PROGN
                 (LETT #3# NIL . #5#)
                 (SEQ (LETT |b| NIL . #5#) (LETT #2# (QCDR |rec|) . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL |b| (QVELT |pr| 0) (QREFELT $ 37))
                               #3#)
                              . #5#)))
                      (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #5#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (SPADCALL
                          (PROG2 (LETT #1# (QCAR |rec|) . #5#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0)
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7)))
                                           #1#))
                          (QVELT |pr| 0) (QREFELT $ 37)))
                   |bas|))))))) 

(SDEFUN |INTG0;palgLODE0;LF3KFFR;19|
        ((|eq| L) (|g| F) (|x| |Kernel| F) (|y| . #1=(|Kernel| F))
         (|kz| |Kernel| F) (|xx| F)
         (|dx| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |particular| (|Union| F "failed"))
          (|:| |basis| (|List| F))))
        (SPROG
         ((#2=#:G240 NIL) (|bas| (|List| F)) (#3=#:G249 NIL) (|b| NIL)
          (#4=#:G248 NIL)
          (|rec|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          "failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|di|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#5=#:G247 NIL) (|i| NIL) (|lv| (|List| F)) (|lk| (|List| #1#))
          (|d|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dx| |kz| (QREFELT $ 77))
                            (QREFELT $ 108))
                  |kz| (QREFELT $ 22))
                 1 (QREFELT $ 110))
                . #6=(|INTG0;palgLODE0;LF3KFFR;19|))
          (LETT |di| (|spadConstant| $ 111) . #6#)
          (LETT |op| (|spadConstant| $ 112) . #6#)
          (LETT |lk| (LIST |x| |y|) . #6#)
          (LETT |lv| (LIST |xx| (SPADCALL |kz| (QREFELT $ 35))) . #6#)
          (SEQ (LETT |i| 0 . #6#)
               (LETT #5# (SPADCALL |eq| (QREFELT $ 113)) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |eq| |i| (QREFELT $ 114))
                                            |lk| |lv| (QREFELT $ 72))
                                  |kz| (QREFELT $ 22))
                                 |di| (QREFELT $ 115))
                                (QREFELT $ 116))
                      . #6#)
                (EXIT (LETT |di| (SPADCALL |d| |di| (QREFELT $ 117)) . #6#)))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |rec|
                (SPADCALL |op|
                          (SPADCALL (SPADCALL |g| |lk| |lv| (QREFELT $ 72))
                                    |kz| (QREFELT $ 22))
                          (QREFELT $ 121))
                . #6#)
          (LETT |bas|
                (PROGN
                 (LETT #4# NIL . #6#)
                 (SEQ (LETT |b| NIL . #6#) (LETT #3# (QCDR |rec|) . #6#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |b| |y| (QREFELT $ 77)) #4#)
                              . #6#)))
                      (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #6#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 ('T
                  (CONS
                   (CONS 0
                         (SPADCALL
                          (PROG2 (LETT #2# (QCAR |rec|) . #6#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 0)
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7)))
                                           #2#))
                          |y| (QREFELT $ 77)))
                   |bas|))))))) 

(DECLAIM (NOTINLINE |GenusZeroIntegration;|)) 

(DEFUN |GenusZeroIntegration| (&REST #1=#:G250)
  (SPROG NIL
         (PROG (#2=#:G251)
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
          (LETT $ (GETREFV 125) . #1#)
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
             (QSETREFV $ 123
                       (CONS
                        (|dispatchFunction| |INTG0;palgLODE0;LF2KFSupR;18|) $))
             (QSETREFV $ 124
                       (CONS (|dispatchFunction| |INTG0;palgLODE0;LF3KFFR;19|)
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
              (32 . |univariate|) (|SparseUnivariatePolynomial| 38)
              |INTG0;lift;SupKSup;5| |INTG0;univariate;F2KSupSup;4|
              (|Mapping| 38 7) (|SparseUnivariatePolynomialFunctions2| 7 38)
              (39 . |map|) (|SparseUnivariatePolynomial| $) (45 . |minPoly|)
              (50 . |reductum|) (55 . |coerce|) (|Fraction| $) (60 . |elt|)
              (|Fraction| 23) (66 . |retract|) (|IntegrationResult| 38)
              (|RationalIntegration| 7 23) (71 . |integrate|)
              (|IntegrationResult| 7) (|Mapping| 7 38)
              (|IntegrationResultFunctions2| 38 7) (76 . |map|)
              (82 . |leadingMonomial|) |INTG0;multivariate;SupK2F;14| (87 . +)
              |INTG0;palgint0;F2KFSupIr;6| (93 . |One|) (97 . |One|)
              (|NonNegativeInteger|) (101 . |coefficient|) (107 . |Zero|)
              (111 . |Zero|) (115 . |sqrt|) (|AlgebraicManipulations| 6 7)
              (120 . |rootSimp|) (125 . *) (|PositiveInteger|) (131 . *)
              (137 . -) (|Boolean|) (143 . |zero?|) (148 . /) (154 . +)
              (160 . |eval|) (167 . ^) (173 . -) (|List| $) (178 . |eval|)
              (185 . *) (191 . |numer|) (196 . |denom|) (201 . /)
              (207 . |multivariate|) |INTG0;palgint0;F3KFFIr;10|
              (|Record| (|:| |ratpart| 38) (|:| |coeff| 38))
              (|Union| 79 '"failed") (213 . |extendedint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 82 '"failed") (219 . |map|)
              |INTG0;palgextint0;F2KFKFFU;11|
              (|Record| (|:| |coeff| 38) (|:| |logand| 38))
              (|Record| (|:| |mainpart| 38) (|:| |limitedlogs| (|List| 86)))
              (|Union| 87 '"failed") (|List| 38) (225 . |limitedint|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 91)))
              (|Union| 92 '"failed") (231 . |map|) (|List| 7)
              |INTG0;palglimint0;F2KLKFFU;12| (|Union| 9 '"failed")
              (237 . |symbolIfCan|) (|Union| 7 '"failed") (|Mapping| 99 7 7 9)
              |INTG0;palgRDE0;2F2KMKFFU;13|
              (|SparseUnivariatePolynomialFunctions2| 38 7) (242 . |map|)
              (248 . |elt|) |INTG0;palgextint0;F2K2FSupU;15|
              |INTG0;palglimint0;F2KLFSupU;16| |INTG0;palgRDE0;2F2KMFSupU;17|
              (254 . |inv|) (|LinearOrdinaryDifferentialOperator1| 38)
              (259 . |monomial|) (265 . |One|) (269 . |Zero|) (273 . |degree|)
              (278 . |coefficient|) (284 . *) (290 . +) (296 . *)
              (|Union| 38 '"failed")
              (|Record| (|:| |particular| 118) (|:| |basis| 89))
              (|RationalLODE| 7 23) (302 . |ratDsolve|)
              (|Record| (|:| |particular| 99) (|:| |basis| 95))
              (308 . |palgLODE0|) (318 . |palgLODE0|))
           '#(|univariate| 329 |palglimint0| 337 |palgint0| 358 |palgextint0|
              377 |palgRDE0| 398 |palgLODE0| 421 |multivariate| 442 |lift| 449)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 124
                                                 '(0 9 0 10 1 11 0 9 12 1 7 14
                                                   0 15 2 16 0 0 0 17 2 18 7 7
                                                   11 19 2 7 20 0 21 22 3 24 23
                                                   7 11 23 25 2 30 26 29 23 31
                                                   1 7 32 21 33 1 26 0 0 34 1 7
                                                   0 21 35 2 23 7 36 7 37 1 26
                                                   38 0 39 1 41 40 38 42 2 45
                                                   43 44 40 46 1 26 0 0 47 2 43
                                                   0 0 0 49 0 6 0 51 0 7 0 52 2
                                                   23 7 0 53 54 0 6 0 55 0 7 0
                                                   56 1 7 0 0 57 1 58 7 7 59 2
                                                   7 0 0 0 60 2 7 0 61 0 62 2 7
                                                   0 0 0 63 1 7 64 0 65 2 7 0 0
                                                   0 66 2 7 0 0 0 67 3 7 0 0 21
                                                   0 68 2 7 0 0 61 69 1 7 0 0
                                                   70 3 7 0 0 14 71 72 2 38 0 0
                                                   0 73 1 38 23 0 74 1 38 23 0
                                                   75 2 38 0 23 23 76 2 24 7 38
                                                   11 77 2 41 80 38 38 81 2 45
                                                   83 44 80 84 2 41 88 38 89 90
                                                   2 45 93 44 88 94 1 11 97 0
                                                   98 2 102 23 44 26 103 2 23 7
                                                   0 7 104 1 7 0 0 108 2 109 0
                                                   38 53 110 0 109 0 111 0 109
                                                   0 112 1 8 53 0 113 2 8 7 0
                                                   53 114 2 109 0 38 0 115 2
                                                   109 0 0 0 116 2 109 0 0 0
                                                   117 2 120 119 109 38 121 6 0
                                                   122 8 7 11 11 7 23 123 7 0
                                                   122 8 7 11 11 11 7 38 124 4
                                                   0 26 7 11 11 23 28 7 0 93 7
                                                   11 11 95 11 7 38 96 6 0 93 7
                                                   11 11 95 7 23 106 5 0 43 7
                                                   11 11 7 23 50 6 0 43 7 11 11
                                                   11 7 38 78 6 0 83 7 11 11 7
                                                   7 23 105 7 0 83 7 11 11 7 11
                                                   7 38 85 7 0 99 7 7 11 11 100
                                                   7 23 107 8 0 99 7 7 11 11
                                                   100 11 7 38 101 7 1 122 8 7
                                                   11 11 11 7 38 124 6 1 122 8
                                                   7 11 11 7 23 123 3 0 7 26 11
                                                   7 48 2 0 26 23 11 27)))))
           '|lookupComplete|)) 
