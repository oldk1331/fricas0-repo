
(SDEFUN |INTEF;prim?| ((|k| |Kernel| F) (|x| |Symbol|) ($ |Boolean|))
        (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
              ('T
               (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                         (QREFELT $ 16))))) 

(SDEFUN |INTEF;lambint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| (|IntegrationResult| F))))
          (|extint|
           (|Mapping|
            (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F))
          (|derivative|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|dfac| (|SparseUnivariatePolynomial| F)) (|eta'| (F)) (|eta| (F)))
         (SEQ
          (LETT |eta'|
                (SPADCALL
                 (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                       . #1=(|INTEF;lambint|))
                 |x| (QREFELT $ 19))
                . #1#)
          (LETT |dfac|
                (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 24))
                          (|spadConstant| $ 25) (QREFELT $ 26))
                . #1#)
          (LETT |derivative|
                (CONS #'|INTEF;lambint!2| (VECTOR |eta| |eta'| |x| $ |dfac|))
                . #1#)
          (LETT |extint| (CONS #'|INTEF;lambint!3| (VECTOR $ |eta| |eta'| |x|))
                . #1#)
          (LETT |r1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 24))
                            (|spadConstant| $ 25) (QREFELT $ 26))
                  (SPADCALL |f| |k| (QREFELT $ 39)) (QREFELT $ 41))
                 (SPADCALL |eta'| |eta| (QREFELT $ 32))
                 (CONS #'|INTEF;lambint!4| (VECTOR $ |x|)) |derivative|
                 |extint| (CONS #'|INTEF;lambint!5| (VECTOR $ |x|))
                 (QREFELT $ 49))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;lambint!6| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (QCDR |r1|) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;lambint!6| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;lambint!5| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 43)))))) 

(SDEFUN |INTEF;lambint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;lambint!3| ((|f| NIL) ($$ NIL))
        (PROG (|x| |eta'| |eta| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;lambint|))
          (LETT |eta'| (QREFELT $$ 2) . #1#)
          (LETT |eta| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |f| |x| (SPADCALL |eta'| |eta| (QREFELT $ 32))
                      (QREFELT $ 36)))))) 

(SDEFUN |INTEF;lambint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|dfac| $ |x| |eta'| |eta|)
          (LETT |dfac| (QREFELT $$ 4) . #1=(|INTEF;lambint|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |x| (QREFELT $$ 2) . #1#)
          (LETT |eta'| (QREFELT $$ 1) . #1#)
          (LETT |eta| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (SPADCALL |dfac|
                              (SPADCALL |x1|
                                        (CONS #'|INTEF;lambint!0|
                                              (VECTOR $ |x|))
                                        (|spadConstant| $ 27) (QREFELT $ 29))
                              (QREFELT $ 30))
                    (SPADCALL |x1| (CONS #'|INTEF;lambint!1| $)
                              (SPADCALL (SPADCALL |eta'| |eta| (QREFELT $ 32))
                                        (|spadConstant| $ 33) (QREFELT $ 24))
                              (QREFELT $ 29))
                    (QREFELT $ 26))))))) 

(SDEFUN |INTEF;lambint!1| ((|x2| NIL) ($ NIL)) (|spadConstant| $ 31)) 

(SDEFUN |INTEF;lambint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;tanint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|eta'| (F)) (|eta| (F)))
         (SEQ
          (LETT |eta'|
                (SPADCALL
                 (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                       . #1=(|INTEF;tanint|))
                 |x| (QREFELT $ 19))
                . #1#)
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;tanint!1| (VECTOR |eta'| |x| $))
                          (CONS #'|INTEF;tanint!4| (VECTOR |x| $ |eta|))
                          (QREFELT $ 72))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;tanint!5| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (SPADCALL (QCDR |r1|) |x| (QREFELT $ 43)) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;tanint!5| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;tanint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;tanint!4| ((|x6| NIL) (|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|eta| $ |x|)
          (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;tanint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x6| (SPADCALL 2 |eta| (QREFELT $ 59)) |x2| |x3|
                             |x| (CONS #'|INTEF;tanint!2| (VECTOR $ |x|))
                             (CONS #'|INTEF;tanint!3| (VECTOR $ |x|))
                             (QREFELT $ 69))))))) 

(SDEFUN |INTEF;tanint!3| ((|x4| NIL) (|x5| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x4| |x| |x5| (QREFELT $ 36)))))) 

(SDEFUN |INTEF;tanint!2| ((|x4| NIL) (|x5| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x4| |x| |x5| (QREFELT $ 63)))))) 

(SDEFUN |INTEF;tanint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |eta'|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;tanint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |eta'| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;tanint!0| (VECTOR $ |x|))
                             (SPADCALL (SPADCALL |eta'| 2 (QREFELT $ 24))
                                       (SPADCALL |eta'| (QREFELT $ 57))
                                       (QREFELT $ 26))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;tanint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;unknownint| ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG ((|c| (F)) (|da| (F)) (|a| (F)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |da|
                         (SPADCALL
                          (LETT |a|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 74))
                                          (QREFELT $ 75))
                                . #1=(|INTEF;unknownint|))
                          |x| (QREFELT $ 19))
                         . #1#)
                   (|spadConstant| $ 31) (QREFELT $ 76))
                  (COND
                   ((SPADCALL
                     (SPADCALL
                      (LETT |c|
                            (SPADCALL
                             (SPADCALL (SPADCALL |f| (QREFELT $ 77))
                                       (QREFELT $ 75))
                             |da| (QREFELT $ 32))
                            . #1#)
                      |x| (QREFELT $ 19))
                     (QREFELT $ 78))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |c| (SPADCALL |a| (QREFELT $ 79))
                                (QREFELT $ 80))
                      (QREFELT $ 81)))))))
                (EXIT
                 (SPADCALL (|spadConstant| $ 31) NIL
                           (LIST (CONS |f| (SPADCALL |x| (QREFELT $ 83))))
                           (QREFELT $ 88)))))) 

(SDEFUN |INTEF;diffint1|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F)
         ($ |Union| (|IntegrationResult| F) "failed"))
        (SPROG
         ((|f3| (F)) (|nres3| (|IntegrationResult| F))
          (|nres2| (|IntegrationResult| F)) (|nrat| (F)) (|alpha| (F))
          (#1=#:G209 NIL)
          (|nlogs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|)))
                      (|:| |coeff| (|SparseUnivariatePolynomial| F))
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|cpol| #2=(|SparseUnivariatePolynomial| F)) (#3=#:G210 NIL)
          (|lg| NIL)
          (|logs|
           (|List|
            (|Record| (|:| |scalar| (|Fraction| (|Integer|))) (|:| |coeff| #2#)
                      (|:| |logand| (|SparseUnivariatePolynomial| F)))))
          (|nres| (|IntegrationResult| F)) (|f2| (F)) (|dv| (|Symbol|))
          (|k1| (F)) (|da3| (F)) (|arg3| (F)) (|args| (|List| F)) (|f1| (F))
          (|nfu| (|SparseUnivariatePolynomial| F))
          (|fu| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |fu| (SPADCALL |f| |k| (QREFELT $ 39))
                  . #4=(|INTEF;diffint1|))
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |fu| (QREFELT $ 92)) (|spadConstant| $ 25)
                         (QREFELT $ 93))
               (CONS 1 "failed"))
              (#5='T
               (SEQ (LETT |nfu| (SPADCALL |fu| (QREFELT $ 94)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |nfu| (QREFELT $ 95)) 1
                                 (QREFELT $ 96))
                       (CONS 1 "failed"))
                      (#5#
                       (SEQ (LETT |f1| (SPADCALL |nfu| (QREFELT $ 97)) . #4#)
                            (LETT |args| (SPADCALL |k| (QREFELT $ 18)) . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 96))
                               (|error| "internal error, k is not a diff"))
                              (#5#
                               (SEQ
                                (LETT |arg3| (SPADCALL |args| 3 (QREFELT $ 98))
                                      . #4#)
                                (LETT |da3|
                                      (SPADCALL |arg3| |x| (QREFELT $ 19))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |da3| (|spadConstant| $ 31)
                                             (QREFELT $ 99))
                                   (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |k1|
                                          (SPADCALL
                                           (SPADCALL |args| 1 (QREFELT $ 98))
                                           (SPADCALL
                                            (SPADCALL |args| 2 (QREFELT $ 98))
                                            (QREFELT $ 100))
                                           |arg3| (QREFELT $ 101))
                                          . #4#)
                                    (LETT |dv| (SPADCALL (QREFELT $ 102))
                                          . #4#)
                                    (LETT |f2|
                                          (SPADCALL
                                           (SPADCALL |f1| |da3| (QREFELT $ 32))
                                           |k1| (SPADCALL |dv| (QREFELT $ 83))
                                           (QREFELT $ 103))
                                          . #4#)
                                    (LETT |nres|
                                          (SPADCALL |f2| |dv| (QREFELT $ 43))
                                          . #4#)
                                    (COND
                                     ((NULL
                                       (NULL
                                        (SPADCALL |nres| (QREFELT $ 104))))
                                      (EXIT (CONS 1 "failed"))))
                                    (LETT |logs|
                                          (SPADCALL |nres| (QREFELT $ 105))
                                          . #4#)
                                    (LETT |nlogs| NIL . #4#)
                                    (LETT |nrat| (|spadConstant| $ 31) . #4#)
                                    (SEQ (LETT |lg| NIL . #4#)
                                         (LETT #3# |logs| . #4#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |lg| (CAR #3#) . #4#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |cpol| (QVELT |lg| 1) . #4#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (CONS #'|INTEF;diffint1!0|
                                                    (VECTOR $ |x|))
                                              (SPADCALL |cpol| (QREFELT $ 107))
                                              (QREFELT $ 109))
                                             (LETT |nlogs| (CONS |lg| |nlogs|)
                                                   . #4#))
                                            ((SPADCALL
                                              (SPADCALL |cpol| (QREFELT $ 95))
                                              1 (QREFELT $ 96))
                                             (PROGN
                                              (LETT #1# (CONS 1 "failed")
                                                    . #4#)
                                              (GO #6=#:G208)))
                                            ('T
                                             (SEQ
                                              (LETT |alpha|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |cpol| 0
                                                                (QREFELT $
                                                                         110))
                                                      (SPADCALL |cpol|
                                                                (QREFELT $ 97))
                                                      (QREFELT $ 32))
                                                     (QREFELT $ 111))
                                                    . #4#)
                                              (EXIT
                                               (LETT |nrat|
                                                     (SPADCALL |nrat|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QVELT |lg| 0)
                                                                 |alpha|
                                                                 (QREFELT $
                                                                          113))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QVELT |lg|
                                                                          2)
                                                                   (QREFELT $
                                                                            91)
                                                                   |alpha|
                                                                   (QREFELT $
                                                                            114))
                                                                  (QREFELT $
                                                                           115))
                                                                 (QREFELT $
                                                                          79))
                                                                (QREFELT $ 80))
                                                               (QREFELT $ 116))
                                                     . #4#)))))))
                                         (LETT #3# (CDR #3#) . #4#) (GO G190)
                                         G191 (EXIT NIL))
                                    (LETT |nres2|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |nres| (QREFELT $ 117))
                                            |nrat| (QREFELT $ 116))
                                           (NREVERSE |nlogs|) NIL
                                           (QREFELT $ 88))
                                          . #4#)
                                    (LETT |nres3|
                                          (SPADCALL
                                           (CONS #'|INTEF;diffint1!1|
                                                 (VECTOR |k1| $ |dv|))
                                           |nres2| (QREFELT $ 120))
                                          . #4#)
                                    (LETT |f3|
                                          (SPADCALL |f|
                                                    (SPADCALL |nres3| |x|
                                                              (QREFELT $ 121))
                                                    (QREFELT $ 122))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |k|
                                                 (SPADCALL |f3|
                                                           (QREFELT $ 124))
                                                 (QREFELT $ 126))
                                       (CONS 1 "failed"))
                                      (#5#
                                       (CONS 0
                                             (SPADCALL |nres3|
                                                       (SPADCALL |f3| |x|
                                                                 (QREFELT $
                                                                          43))
                                                       (QREFELT $
                                                                56))))))))))))))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |INTEF;diffint1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 118)) |k1|
                      (QREFELT $ 101)))))) 

(SDEFUN |INTEF;diffint1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;diffint1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| |x| (QREFELT $ 106)) (|spadConstant| $ 31)
                      (QREFELT $ 99)))))) 

(SDEFUN |INTEF;diffint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG ((|r1| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |r1| (|INTEF;diffint1| |f| |x| |k| $) |INTEF;diffint|)
                (EXIT
                 (COND ((QEQCAR |r1| 0) (QCDR |r1|))
                       ('T
                        (SPADCALL (|spadConstant| $ 31) NIL
                                  (LIST
                                   (CONS |f| (SPADCALL |x| (QREFELT $ 83))))
                                  (QREFELT $ 88)))))))) 

(SDEFUN |INTEF;isx?| ((|f| F) (|x| |Symbol|) ($ |Boolean|))
        (SPROG
         ((|r| (|Union| (|Symbol|) "failed"))
          (|k| (|Union| (|Kernel| F) "failed")))
         (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 128)) . #1=(|INTEF;isx?|))
              (EXIT
               (COND ((QEQCAR |k| 1) 'NIL)
                     (#2='T
                      (SEQ
                       (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 130)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) 'NIL)
                              (#2# (EQUAL (QCDR |r|) |x|))))))))))) 

(SDEFUN |INTEF;alglfint|
        ((|f| F) (|k| |Kernel| F) (|l| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG
         ((|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|res| (|IntegrationResult| F)) (|ir1| (|IntegrationResult| F))
          (|oroot| (F)) (#1=#:G245 NIL)
          (|al|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
          (|kx| (|Kernel| F)) (|xf| (F)))
         (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 83)) . #2=(|INTEF;alglfint|))
              (EXIT
               (COND
                ((QEQCAR
                  (SPADCALL
                   (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 132)) . #2#)
                   (QREFELT $ 130))
                  0)
                 (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 134)) |xf| $))
                ((SPADCALL |kx| '|exp| (QREFELT $ 13))
                 (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
                ((|INTEF;prim?| |kx| |x| $)
                 (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
                ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                           (QREFELT $ 16))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                              (QREFELT $ 135))
                    (COND
                     ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                                (QREFELT $ 135))
                      (COND
                       ((NULL
                         (SPADCALL |kx|
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 136))
                                             (QREFELT $ 137))
                                   (QREFELT $ 126)))
                        (EXIT
                         (SEQ
                          (LETT |al|
                                (SPADCALL (LIST |f|) |k| |kx| (QREFELT $ 141))
                                . #2#)
                          (LETT |res| (|spadConstant| $ 142) . #2#)
                          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |al| . #2#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ir1|
                                      (SPADCALL (|SPADfirst| (QVELT |rec| 0))
                                                |x| (QREFELT $ 43))
                                      . #2#)
                                (COND
                                 ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3))
                                            0 (QREFELT $ 143))
                                  (SEQ
                                   (LETT |oroot|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 136))
                                           (QVELT |rec| 2) (QREFELT $ 144))
                                          (SPADCALL
                                           (SPADCALL |kx| (QREFELT $ 136))
                                           (QVELT |rec| 3) (QREFELT $ 144))
                                          (QREFELT $ 80))
                                         . #2#)
                                   (EXIT
                                    (LETT |ir1|
                                          (SPADCALL
                                           (CONS #'|INTEF;alglfint!0|
                                                 (VECTOR |oroot| $ |rec|))
                                           |ir1| (QREFELT $ 120))
                                          . #2#)))))
                                (EXIT
                                 (LETT |res|
                                       (SPADCALL |res| |ir1| (QREFELT $ 56))
                                       . #2#)))
                               (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT |res|)))))))))
                  (LETT |rec|
                        (SPADCALL (SPADCALL |kx| (QREFELT $ 136))
                                  (SPADCALL |k| (QREFELT $ 136))
                                  (QREFELT $ 147))
                        . #2#)
                  (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 149)) . #2#)
                  (EXIT
                   (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                             (SPADCALL
                              (SPADCALL |f| (LIST |kx| |k|)
                                        (LIST
                                         (SPADCALL (QVELT |rec| 1) |y|
                                                   (QREFELT $ 150))
                                         (SPADCALL (QVELT |rec| 2) |y|
                                                   (QREFELT $ 150)))
                                        (QREFELT $ 152))
                              |x| (QREFELT $ 43))
                             (QREFELT $ 120)))))
                ('T (|INTEF;unknownint| |f| |x| $))))))) 

(SDEFUN |INTEF;alglfint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|y| $ |rec|)
          (LETT |y| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |rec| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 100)) (QVELT |rec| 0)
                      (QREFELT $ 101)))))) 

(SDEFUN |INTEF;alglfint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|rec| $ |oroot|)
          (LETT |rec| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |oroot| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL (QVELT |rec| 1) (QREFELT $ 100)) |oroot|
                      (QREFELT $ 101)))))) 

(SDEFUN |INTEF;lfintegrate;FSIr;9|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $)
                  (ELT $ 157) (QREFELT $ 160))) 

(SDEFUN |INTEF;lfintegrate;FSIr;10|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;11|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate;FSIr;12|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (|INTEF;lfintegrate0| |f| |x| $)) 

(SDEFUN |INTEF;lfintegrate0| ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG ((|k| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (|xf| (F)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 78)) (|spadConstant| $ 142))
                      (#1='T
                       (SEQ
                        (LETT |xf| (SPADCALL |x| (QREFELT $ 83))
                              . #2=(|INTEF;lfintegrate0|))
                        (EXIT
                         (COND
                          ((NULL
                            (LETT |l|
                                  (SPADCALL (SPADCALL |f| (QREFELT $ 124)) |x|
                                            (QREFELT $ 161))
                                  . #2#))
                           (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 80))
                                     (QREFELT $ 81)))
                          ((QEQCAR
                            (SPADCALL
                             (LETT |k| (SPADCALL |l| (QREFELT $ 162)) . #2#)
                             (QREFELT $ 130))
                            0)
                           (SPADCALL
                            (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                                      (QREFELT $ 164))
                            (QREFELT $ 55)))
                          ((SPADCALL |k| '|tan| (QREFELT $ 13))
                           (|INTEF;addx| (|INTEF;tanint| |f| |x| |k| $) |xf|
                            $))
                          ((SPADCALL |k| '|exp| (QREFELT $ 13))
                           (|INTEF;addx| (|INTEF;expint| |f| |x| |k| $) |xf|
                            $))
                          ((SPADCALL |k| '|lambertW| (QREFELT $ 13))
                           (|INTEF;addx| (|INTEF;lambint| |f| |x| |k| $) |xf|
                            $))
                          ((|INTEF;prim?| |k| |x| $)
                           (|INTEF;addx| (|INTEF;primint| |f| |x| |k| $) |xf|
                            $))
                          ((SPADCALL (SPADCALL |k| (QREFELT $ 15))
                                     (QREFELT $ 9) (QREFELT $ 16))
                           (|INTEF;alglfint| |f| |k| |l| |x| $))
                          ((SPADCALL |k| '|%diff| (QREFELT $ 13))
                           (|INTEF;diffint| |f| |x| |k| $))
                          (#1# (|INTEF;unknownint| |f| |x| $)))))))))) 

(SDEFUN |INTEF;lfintegrate0!0| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfintegrate0|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;addx|
        ((|i| |IntegrationResult| F) (|x| F) ($ |IntegrationResult| F))
        (SPROG ((#1=#:G281 NIL) (|ne| NIL) (#2=#:G280 NIL))
               (SEQ
                (COND ((SPADCALL |i| (QREFELT $ 165)) |i|)
                      ('T
                       (SPADCALL (SPADCALL |i| (QREFELT $ 117))
                                 (SPADCALL |i| (QREFELT $ 105))
                                 (PROGN
                                  (LETT #2# NIL . #3=(|INTEF;addx|))
                                  (SEQ (LETT |ne| NIL . #3#)
                                       (LETT #1# (SPADCALL |i| (QREFELT $ 104))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ne| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS (CONS (QCAR |ne|) |x|)
                                                     #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 88))))))) 

(SDEFUN |INTEF;tryChangeVar|
        ((|f| F) (|t| |Kernel| F) (|x| |Symbol|)
         ($ |Union| (|IntegrationResult| F) "failed"))
        (SPROG ((|g| (F)) (|z| (|Symbol|)))
               (SEQ
                (LETT |z| (SPADCALL (QREFELT $ 102))
                      . #1=(|INTEF;tryChangeVar|))
                (LETT |g|
                      (SPADCALL
                       (SPADCALL |f|
                                 (SPADCALL (SPADCALL |t| (QREFELT $ 136)) |x|
                                           (QREFELT $ 19))
                                 (QREFELT $ 32))
                       (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 83)))
                       (QREFELT $ 166))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |g| |x| (QREFELT $ 167))
                   (CONS 0
                         (SPADCALL
                          (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                          (SPADCALL |g| |z| (QREFELT $ 43)) (QREFELT $ 120))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |INTEF;tryChangeVar!0| ((|x1| NIL) ($$ NIL))
        (PROG (|z| $ |t|)
          (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 118))
                      (SPADCALL |t| (QREFELT $ 136)) (QREFELT $ 101)))))) 

(SDEFUN |INTEF;algexpint|
        ((|f| F) (|t| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG ((|u| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $)
                      |INTEF;algexpint|)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T
                        (SPADCALL |f| |t| |y|
                                  (CONS #'|INTEF;algexpint!1|
                                        (VECTOR |t| |x| $))
                                  (QREFELT $ 170)))))))) 

(SDEFUN |INTEF;algexpint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |t|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algexpint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;algexpint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |t| (QREFELT $ 18))
                                         (QREFELT $ 168))
                               |x| (QREFELT $ 19))
                              (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;algexpint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;algprimint|
        ((|f| F) (|t| |Kernel| F) (|y| |Kernel| F) (|x| |Symbol|)
         ($ |IntegrationResult| F))
        (SPROG ((|u| (|Union| (|IntegrationResult| F) "failed")))
               (SEQ
                (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $)
                      |INTEF;algprimint|)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T
                        (SPADCALL |f| |t| |y|
                                  (CONS #'|INTEF;algprimint!1|
                                        (VECTOR |t| |x| $))
                                  (QREFELT $ 170)))))))) 

(SDEFUN |INTEF;algprimint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |t|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algprimint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |t| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;algprimint!0| (VECTOR $ |x|))
                             (SPADCALL
                              (SPADCALL (SPADCALL |t| (QREFELT $ 136)) |x|
                                        (QREFELT $ 19))
                              (QREFELT $ 57))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;algprimint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;lfextendedint;FSFU;18|
        ((|f| F) (|x| |Symbol|) (|g| F)
         ($ |Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed"))
        (SPROG
         ((|res1|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed")))
         (SEQ
          (LETT |res1| (QCAR (SPADCALL |f| |x| (LIST |g|) (QREFELT $ 175)))
                |INTEF;lfextendedint;FSFU;18|)
          (EXIT
           (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (CONS (QCAR (QCDR |res1|))
                              (SPADCALL (QCDR (QCDR |res1|)) 1
                                        (QREFELT $ 177)))))))))) 

(SDEFUN |INTEF;lflogint;FSLU;19|
        ((|f| F) (|x| |Symbol|) (|lu| |List| F)
         ($ |Union|
          (|Record| (|:| |mainpart| F)
                    (|:| |limitedlogs|
                         (|List| (|Record| (|:| |coeff| F) (|:| |logand| F)))))
          "failed"))
        (SPROG
         ((|llg| (|List| (|Record| (|:| |coeff| F) (|:| |logand| F))))
          (#1=#:G322 NIL) (|c| NIL) (#2=#:G323 NIL) (|u| NIL)
          (|s1| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|res1|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|lg| (|List| F)) (#3=#:G321 NIL) (#4=#:G320 NIL))
         (SEQ
          (LETT |lg|
                (PROGN
                 (LETT #4# NIL . #5=(|INTEF;lflogint;FSLU;19|))
                 (SEQ (LETT |u| NIL . #5#) (LETT #3# |lu| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |u| |x| (QREFELT $ 19)) |u|
                                         (QREFELT $ 32))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |res1| (QCAR (SPADCALL |f| |x| |lg| (QREFELT $ 175))) . #5#)
          (EXIT
           (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |s1| (QCDR |res1|) . #5#) (LETT |llg| NIL . #5#)
                       (SEQ (LETT |u| NIL . #5#) (LETT #2# |lu| . #5#)
                            (LETT |c| NIL . #5#)
                            (LETT #1# (SPADCALL (QCDR |s1|) (QREFELT $ 178))
                                  . #5#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |c| (CAR #1#) . #5#) NIL)
                                  (ATOM #2#)
                                  (PROGN (LETT |u| (CAR #2#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |c| (|spadConstant| $ 31)
                                          (QREFELT $ 76))
                                (LETT |llg| (CONS (CONS |c| |u|) |llg|)
                                      . #5#)))))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #5#))
                                  . #5#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 (CONS (QCAR |s1|) |llg|)))))))))) 

(SDEFUN |INTEF;lfinfieldint;FSU;20|
        ((|f| F) (|x| |Symbol|) ($ |Union| F "failed"))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| |x| (|spadConstant| $ 31) (QREFELT $ 36))
                |INTEF;lfinfieldint;FSU;20|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |u|))))))))) 

(SDEFUN |INTEF;denint_dummy|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |Record|
          (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |ir|
               (|IntegrationResult|
                (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (VECTOR (|spadConstant| $ 181) |f| (|spadConstant| $ 182))) 

(SDEFUN |INTEF;primint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|ext|
           (|Mapping|
            (|Union| (|Record| (|:| |ratpart| F) (|:| |coeff| F)) "failed") F))
          (|dk| (F))
          (|denint|
           (|Mapping|
            (|Record|
             (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |ir|
                  (|IntegrationResult|
                   (|Fraction| (|SparseUnivariatePolynomial| F)))))
            (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lk| (|List| (|Kernel| F))) (#1=#:G395 NIL) (|a| NIL)
          (#2=#:G394 NIL))
         (SEQ
          (LETT |lk|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|INTEF;primint|))
                  (SEQ (LETT |a| NIL . #3#)
                       (LETT #1# (SPADCALL |f| (QREFELT $ 137)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |k| (QREFELT $ 189))
                           (LETT #2# (CONS |a| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |x| (QREFELT $ 161))
                . #3#)
          (LETT |denint|
                (COND
                 ((SPADCALL |k| '|log| (QREFELT $ 13))
                  (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 186) |x| |k|)))
                 ('T (CONS (|function| |INTEF;denint_dummy|) $)))
                . #3#)
          (LETT |dk|
                (SPADCALL (SPADCALL |k| (QREFELT $ 136)) |x| (QREFELT $ 19))
                . #3#)
          (LETT |ext| (CONS #'|INTEF;primint!1| (VECTOR $ |dk| |lk| |x|))
                . #3#)
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;primint!3| (VECTOR |dk| |x| $))
                          |denint| |ext| (QREFELT $ 193))
                . #3#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;primint!4| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (SPADCALL (QCDR |r1|) |x| (QREFELT $ 43)) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;primint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;primint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;primint!3| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;primint!2| (VECTOR $ |x|))
                             (SPADCALL |dk| (QREFELT $ 57)) (QREFELT $ 29))))))) 

(SDEFUN |INTEF;primint!2| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(SDEFUN |INTEF;primint!1| ((|f1| NIL) ($$ NIL))
        (PROG (|x| |lk| |dk| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primint|))
          (LETT |lk| (QREFELT $$ 2) . #1#)
          (LETT |dk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|rf| NIL) (|r1| NIL))
                   (SEQ
                    (LETT |r1|
                          (QCAR
                           (SPADCALL |f1| |x| |lk| (LIST |dk|)
                                     (QREFELT $ 190)))
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |r1| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rf| (QCDR |r1|) NIL)
                                 (EXIT
                                  (CONS 0
                                        (CONS (QCAR |rf|)
                                              (SPADCALL (QCDR |rf|)
                                                        (|spadConstant| $ 191)
                                                        (QREFELT $
                                                                 177))))))))))))))) 

(SDEFUN |INTEF;primint!0| ((|rf| NIL) ($$ NIL))
        (PROG (|k| |x| |denint_li|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;primint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |denint_li| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_li|))))) 

(SDEFUN |INTEF;risch_de_solver|
        ((|x3| |Integer|) (|x4| F) (|eta| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG NIL
               (SPADCALL |x3| |eta| |x4| |x|
                         (CONS #'|INTEF;risch_de_solver!0| (VECTOR $ |x|))
                         (CONS #'|INTEF;risch_de_solver!1| (VECTOR $ |x|))
                         (QREFELT $ 196)))) 

(SDEFUN |INTEF;risch_de_solver!1| ((|x7| NIL) (|x8| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;risch_de_solver|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x7| |x| |x8| (QREFELT $ 36)))))) 

(SDEFUN |INTEF;risch_de_solver!0| ((|x5| NIL) (|x6| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;risch_de_solver|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 63)))))) 

(SDEFUN |INTEF;expint|
        ((|f| F) (|x| |Symbol|) (|k| |Kernel| F) ($ |IntegrationResult| F))
        (SPROG
         ((|r1|
           (|Record|
            (|:| |answer|
                 (|IntegrationResult|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |a0| F)))
          (|eta| (F)))
         (SEQ
          (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                . #1=(|INTEF;expint|))
          (LETT |r1|
                (SPADCALL (SPADCALL |f| |k| (QREFELT $ 39))
                          (CONS #'|INTEF;expint!1| (VECTOR |eta| |x| $))
                          (CONS #'|INTEF;expint!2|
                                (VECTOR (QREFELT $ 188) |x| |k|))
                          (CONS #'|INTEF;expint!3| (VECTOR $ |x| |eta|))
                          (QREFELT $ 198))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|INTEF;expint!4| (VECTOR $ |k|)) (QCAR |r1|)
                      (QREFELT $ 55))
            (SPADCALL (QCDR |r1|) |x| (QREFELT $ 43)) (QREFELT $ 56)))))) 

(SDEFUN |INTEF;expint!4| ((|x1| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;expint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 51)))))) 

(SDEFUN |INTEF;expint!3| ((|x3| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|eta| |x| $)
          (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTEF;risch_de_solver| |x3| |x4| |eta| |x| $))))) 

(SDEFUN |INTEF;expint!2| ((|rf| NIL) ($$ NIL))
        (PROG (|k| |x| |denint_poly|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |denint_poly| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_poly|))))) 

(SDEFUN |INTEF;expint!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |x| |eta|)
          (LETT $ (QREFELT $$ 2) . #1=(|INTEF;expint|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |eta| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x1| (CONS #'|INTEF;expint!0| (VECTOR $ |x|))
                             (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                                       (|spadConstant| $ 33) (QREFELT $ 24))
                             (QREFELT $ 29))))))) 

(SDEFUN |INTEF;expint!0| ((|x2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |ElementaryIntegration;|)) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G419)
  (SPROG NIL
         (PROG (#2=#:G420)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryIntegration|)))))))))) 

(DEFUN |ElementaryIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryIntegration|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|ElementaryIntegration| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 199) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
           (|haddProp| |$ConstructorCache| '|ElementaryIntegration|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 8 '|prim|)
           (QSETREFV $ 9 '|%alg|)
           (QSETREFV $ 91 (SPADCALL (QREFELT $ 90)))
           (COND
            ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
             (COND
              ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
               (PROGN
                (QSETREFV $ 153
                          (COND
                           ((|HasCategory| |#2|
                                           '(|LiouvillianFunctionCategory|))
                            (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                           ('T 'NIL)))
                (COND
                 ((QREFELT $ 153)
                  (PROGN
                   (QSETREFV $ 43
                             (CONS
                              (|dispatchFunction| |INTEF;lfintegrate;FSIr;9|)
                              $))))
                 ('T
                  (QSETREFV $ 43
                            (CONS
                             (|dispatchFunction| |INTEF;lfintegrate;FSIr;10|)
                             $))))))
              ('T
               (QSETREFV $ 43
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;11|)
                               $)))))
            ('T
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;12|)
                             $))))
           (QSETREFV $ 186
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 185))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 185))))))
                      (EXIT (CONS #'|ElementaryIntegration!0| $))))
           (QSETREFV $ 188
                     (SEQ
                      (COND
                       ((|domainEqual| |#1| (|Integer|))
                        (COND
                         ((|domainEqual| |#2| (|Expression| (|Integer|)))
                          (EXIT (ELT $ 187))))))
                      (COND
                       ((|domainEqual| |#1| (|Complex| (|Integer|)))
                        (COND
                         ((|domainEqual| |#2|
                                         (|Expression|
                                          (|Complex| (|Integer|))))
                          (EXIT (ELT $ 187))))))
                      (EXIT (CONS #'|ElementaryIntegration!1| $))))
           $)))) 

(DEFUN |ElementaryIntegration!1| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(DEFUN |ElementaryIntegration!0| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(MAKEPROP '|ElementaryIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (|List| 7)
              (17 . |argument|) (22 . |differentiate|) (28 . |One|)
              (32 . |One|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (36 . |monomial|) (42 . |One|)
              (46 . +) (52 . |Zero|) (|Mapping| 7 7) (56 . |differentiate|)
              (63 . *) (69 . |Zero|) (73 . /) (79 . |One|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 34 '"failed") |INTEF;lfextendedint;FSFU;18|
              (|Fraction| 148) (|Kernel| $) (83 . |univariate|) (|Fraction| 23)
              (89 . *) (|IntegrationResult| 7) (95 . |lfintegrate|)
              (|Record| (|:| |answer| 53) (|:| |a0| 42)) (|Mapping| 23 23)
              (|Mapping| 35 7) (|Mapping| 42 7)
              (|TranscendentalIntegration| 7 23) (101 . |lambintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 12)
                                                     7)
              (111 . |multivariate|) (|Mapping| 7 40) (|IntegrationResult| 40)
              (|IntegrationResultFunctions2| 40 7) (117 . |map|) (123 . +)
              (129 . |coerce|) (|PositiveInteger|) (134 . *)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 60)))
              (|Union| 61 '"failed") |INTEF;lflogint;FSLU;19|
              (|Union| 17 '"failed") (|Integer|) (|Mapping| 62 7 17)
              (|Mapping| 35 7 7) (|ElementaryRischDESystem| 6 7)
              (140 . |rischDEsys|) (|Record| (|:| |answer| 53) (|:| |a0| 7))
              (|Mapping| 64 65 7 7) (151 . |tanintegrate|)
              (|SparseMultivariatePolynomial| 6 38) (158 . |denom|)
              (163 . |coerce|) (168 . ~=) (174 . |numer|) (179 . |zero?|)
              (184 . |log|) (189 . *) (195 . |coerce|) (200 . |Zero|)
              (204 . |coerce|)
              (|Record| (|:| |scalar| 112) (|:| |coeff| 23) (|:| |logand| 23))
              (|List| 84) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 86) (209 . |mkAnswer|) (|SingletonAsOrderedSet|)
              (216 . |create|) '|dummy| (220 . |denom|) (225 . ~=)
              (231 . |numer|) (236 . |degree|) (241 . ~=)
              (247 . |leadingCoefficient|) (252 . |elt|) (258 . =)
              (264 . |retract|) (269 . |eval|) (276 . |new|) (280 . |eval|)
              (287 . |notelem|) (292 . |logpart|) (297 . D)
              (303 . |coefficients|) (|Mapping| 10 7) (308 . |every?|)
              (314 . |coefficient|) (320 . -) (|Fraction| 65) (325 . *)
              (331 . |eval|) (338 . |retract|) (343 . +) (349 . |ratpart|)
              (354 . |kernel|) (|IntegrationResultFunctions2| 7 7)
              (359 . |map|) (365 . |differentiate|) (371 . -) (|List| 38)
              (377 . |kernels|) (|List| 12) (382 . |member?|)
              (|Union| 38 '"failed") (388 . |retractIfCan|)
              (|Union| 11 '"failed") (393 . |symbolIfCan|)
              (|IntegrationTools| 6 7) (398 . |ksec|)
              (|PureAlgebraicIntegration| 6 7 7) (405 . |palgint|)
              (412 . |is?|) (418 . |coerce|) (423 . |tower|)
              (|Record| (|:| |funs| 17) (|:| |nroot| 7) (|:| |npow1| 65)
                        (|:| |npow2| 65))
              (|List| 138) (|RootFSSplit| 6 7) (428 . |alg_split_roots|)
              (435 . |Zero|) (439 . >) (445 . ^)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 23) (|:| |pol2| 23)
                        (|:| |prim| 23))
              (|FunctionSpacePrimitiveElement| 6 7) (451 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (457 . |rootOf|) (462 . |elt|)
              (|List| $) (468 . |eval|) '#:G122
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 154 '"failed") (|PatternMatchIntegration| 6 7)
              (475 . |pmintegrate|) (|Mapping| 42 7 11) (|Mapping| 155 7 11)
              (481 . |intPatternMatch|) (489 . |varselect|) (495 . |kmax|)
              (|RationalIntegration| 7 23) (500 . |integrate|) (505 . |elem?|)
              (510 . |subst|) (517 . |freeOf?|) (523 . |first|)
              (|AlgebraicIntegration| 6 7) (528 . |algint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 176))
              (|Union| 171 '"failed")
              (|Record| (|:| |particular| 172) (|:| |basis| (|List| 171)))
              (|ParametricIntegration| 6 7) (536 . |extendedint|) (|Vector| 7)
              (543 . |elt|) (549 . |entries|) (|Union| 7 '"failed")
              |INTEF;lfinfieldint;FSU;20| (554 . |Zero|) (558 . |Zero|)
              (|Record| (|:| |answer| 40) (|:| |logpart| 40) (|:| |ir| 53))
              (|DenominatorIntegration| 6 7) (562 . |li_int|) '|denint_li|
              (569 . |poly_int|) '|denint_poly| (576 . ~=)
              (582 . |extendedint|) (590 . |One|) (|Mapping| 183 40)
              (594 . |primintegrate|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 10))
              (|ElementaryRischDEX2| 6 7) (602 . |risch_de_ext|)
              (|Mapping| 194 65 7) (612 . |expintegrate|))
           '#(|lflogint| 620 |lfintegrate| 627 |lfinfieldint| 633
              |lfextendedint| 639)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 198
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 1 12 17 0 18
                                                   2 7 0 0 11 19 0 6 0 20 0 7 0
                                                   21 2 23 0 7 22 24 0 23 0 25
                                                   2 23 0 0 0 26 0 23 0 27 3 23
                                                   0 0 28 0 29 2 23 0 0 0 30 0
                                                   7 0 31 2 7 0 0 0 32 0 22 0
                                                   33 2 7 37 0 38 39 2 40 0 23
                                                   0 41 2 0 42 7 11 43 6 48 44
                                                   40 7 28 45 46 47 49 2 50 7
                                                   40 12 51 2 54 42 52 53 55 2
                                                   42 0 0 0 56 1 23 0 7 57 2 7
                                                   0 58 0 59 7 68 64 65 7 7 7
                                                   11 66 67 69 3 48 70 40 45 71
                                                   72 1 7 73 0 74 1 7 0 73 75 2
                                                   7 10 0 0 76 1 7 73 0 77 1 7
                                                   10 0 78 1 7 0 0 79 2 7 0 0 0
                                                   80 1 42 0 7 81 0 6 0 82 1 7
                                                   0 11 83 3 42 0 7 85 87 88 0
                                                   89 0 90 1 40 23 0 92 2 23 10
                                                   0 0 93 1 40 23 0 94 1 23 22
                                                   0 95 2 22 10 0 0 96 1 23 7 0
                                                   97 2 17 7 0 65 98 2 7 10 0 0
                                                   99 1 7 38 0 100 3 7 0 0 38 0
                                                   101 0 11 0 102 3 7 0 0 0 0
                                                   103 1 42 87 0 104 1 42 85 0
                                                   105 2 7 0 0 11 106 1 23 17 0
                                                   107 2 17 10 108 0 109 2 23 7
                                                   0 22 110 1 7 0 0 111 2 7 0
                                                   112 0 113 3 23 0 0 89 7 114
                                                   1 23 7 0 115 2 7 0 0 0 116 1
                                                   42 7 0 117 1 12 0 11 118 2
                                                   119 42 28 42 120 2 42 7 0 11
                                                   121 2 7 0 0 0 122 1 7 123 0
                                                   124 2 125 10 12 0 126 1 7
                                                   127 0 128 1 12 129 0 130 3
                                                   131 12 12 125 11 132 3 133
                                                   42 7 12 12 134 2 14 10 0 11
                                                   135 1 7 0 38 136 1 7 123 0
                                                   137 3 140 139 17 12 12 141 0
                                                   42 0 142 2 65 10 0 0 143 2 7
                                                   0 0 65 144 2 146 145 7 7 147
                                                   1 7 0 148 149 2 23 7 0 7 150
                                                   3 7 0 0 123 151 152 2 156
                                                   155 7 11 157 4 131 42 7 11
                                                   158 159 160 2 131 125 125 11
                                                   161 1 131 12 125 162 1 163
                                                   53 40 164 1 42 10 0 165 3 7
                                                   0 0 123 151 166 2 7 10 0 11
                                                   167 1 17 7 0 168 4 169 42 7
                                                   12 12 45 170 3 174 173 7 11
                                                   17 175 2 176 7 0 65 177 1
                                                   176 17 0 178 0 40 0 181 0 53
                                                   0 182 3 184 183 40 12 11 185
                                                   3 184 183 40 12 11 187 2 12
                                                   10 0 0 189 4 174 173 7 11
                                                   125 17 190 0 65 0 191 4 48
                                                   70 40 45 192 46 193 6 195
                                                   194 65 7 7 11 66 67 196 4 48
                                                   70 40 45 192 197 198 3 0 62
                                                   7 11 17 63 2 0 42 7 11 43 2
                                                   0 179 7 11 180 3 0 35 7 11 7
                                                   36)))))
           '|lookupComplete|)) 
